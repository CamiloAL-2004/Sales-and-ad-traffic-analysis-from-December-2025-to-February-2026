-- public.source_funnel_view source

CREATE OR REPLACE VIEW public.source_funnel_view
AS WITH source_funnel AS (
         SELECT user_events.traffic_source,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'page_view'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS views,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'add_to_cart'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS carts,
            count(DISTINCT
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.user_id
                    ELSE NULL::integer
                END) AS purchase
           FROM user_events
          WHERE user_events.event_date::timestamp without time zone >= (CURRENT_DATE - '250 days'::interval)
          GROUP BY user_events.traffic_source
        )
 SELECT traffic_source,
    'views'::text AS "?column?",
    purchase,
    round((carts * 100 / views)::double precision) AS cart_conversion_rate,
    round((purchase * 100 / carts)::double precision) AS purchase_conversion_rate,
    round((purchase * 100 / views)::double precision) AS views_to_purchase_conversion_rate
   FROM source_funnel
  ORDER BY purchase DESC;