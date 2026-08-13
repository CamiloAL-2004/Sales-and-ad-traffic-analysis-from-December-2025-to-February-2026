-- public.conversion_analysis_view source

CREATE OR REPLACE VIEW public.conversion_analysis_view
AS WITH user_journey AS (
         SELECT user_events.user_id,
            min(
                CASE
                    WHEN user_events.event_type::text = 'page_view'::text THEN user_events.event_date
                    ELSE NULL::character varying
                END::text) AS view_time,
            min(
                CASE
                    WHEN user_events.event_type::text = 'add_to_cart'::text THEN user_events.event_date
                    ELSE NULL::character varying
                END::text) AS cart_time,
            min(
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.event_date
                    ELSE NULL::character varying
                END::text) AS purchase_time
           FROM user_events
          WHERE user_events.event_date::timestamp without time zone >= (CURRENT_DATE - '250 days'::interval)
          GROUP BY user_events.user_id
         HAVING min(
                CASE
                    WHEN user_events.event_type::text = 'purchase'::text THEN user_events.event_date
                    ELSE NULL::character varying
                END::text) IS NOT NULL
        )
 SELECT count(*) AS converted_users,
    round(avg(EXTRACT(epoch FROM cart_time::timestamp without time zone - view_time::timestamp without time zone) / 60::numeric), 2) AS avg_view_to_cart_minutes,
    round(avg(EXTRACT(epoch FROM purchase_time::timestamp without time zone - cart_time::timestamp without time zone) / 60::numeric), 2) AS avg_cart_to_purchase_minutes,
    round(avg(EXTRACT(epoch FROM purchase_time::timestamp without time zone - view_time::timestamp without time zone) / 60::numeric), 2) AS avg_user_journey_time_minutes
   FROM user_journey;