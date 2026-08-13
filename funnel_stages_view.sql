-- public.funnel_stages source

CREATE OR REPLACE VIEW public.funnel_stages
AS WITH funnel_counts AS (
         SELECT count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'page_view'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS stage_1_views,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'add_to_cart'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS stage_2_cart,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'checkout_start'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS stage_3_checkout,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'payment_info'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS stage_4_payment,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS stage_5_purchase
           FROM user_events
          WHERE user_events.event_date::timestamp without time zone >= (CURRENT_DATE - '250 days'::interval)
        )
 SELECT stage_1_views,
    stage_2_cart,
    stage_3_checkout,
    stage_4_payment,
    stage_5_purchase,
    round((stage_2_cart * 100 / stage_1_views)::double precision) AS view_to_cart_rate,
    round((stage_3_checkout * 100 / stage_2_cart)::double precision) AS cart_to_checkout_rate,
    round((stage_4_payment * 100 / stage_3_checkout)::double precision) AS checkout_to_payment_rate,
    round((stage_5_purchase * 100 / stage_4_payment)::double precision) AS payment_to_purchase_rate,
    round((stage_5_purchase * 100 / stage_1_views)::double precision) AS overall_conversion_rate
   FROM funnel_counts;