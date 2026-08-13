-- public.funnel_revenue_view source

CREATE OR REPLACE VIEW public.funnel_revenue_view
AS WITH funnel_revenue AS (
         SELECT count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'page_view'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS total_visitors,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS total_buyers,
            round(sum(
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.amount
                    ELSE NULL::real
                END)::integer::numeric, 2) AS total_revenue,
            count(
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN 1
                    ELSE NULL::integer
                END) AS total_orders
           FROM user_events
          WHERE user_events.event_date::timestamp without time zone >= (CURRENT_DATE - '250 days'::interval)
        )
 SELECT total_visitors,
    total_buyers,
    total_revenue,
    total_orders,
    round(total_revenue / total_orders::numeric, 2) AS revenue_per_order,
    round(total_revenue / total_buyers::numeric, 2) AS revenue_per_buyer,
    round(total_revenue / total_visitors::numeric, 2) AS revenue_per_visitor
   FROM funnel_revenue;