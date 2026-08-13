# Sales-and-ad-traffic-analysis-from-December-2025-to-February-2026

# Sales problem 

E-commerce company wanted to know their sales and ad traffic data, including total revenue from sales and which ad source generated the most amount of purchases. The purpose of this analysis was to create a targeted approach for improving revenue and doubling down on the type of traffic source that generates the most profit.

# Data

The database is a CSV file containing the event_id (int), user_id (int), event_type (VARCHAR), event_date (VARCHAR), product_id (int), amount (float) and traffic_source (VARCHAR) headers. The data was queried by creating common table expressions (CTEs) to extract meaningful data and analyse the patterns from the analysis. 

The four CTEs used were:
  - funnel_revenue - extracted total amount of customers and buyers, total revenue and other revenue metrics including revenue per order, buyer and visitor.
  - source_funnel - extracted information about the types of ads being ran, including their popularity and conversion rates
  - funnel_stages - extracted number of users entering the site and following the steps to make a purchase customers who bought products. Also included the proportion of users which moved from one stage to the next.
  - conversion_analysis - extracted total amount of buyers and the average time spent along sections of and the totality of the purchasing journey.

The data extracted by each CTE was exported to Excel for visualisation via bar charts.

# Results 

## Funnel revenue:

<img width="2649" height="1260" alt="funnel_revenue_users_to_orders" src="https://github.com/user-attachments/assets/c87b5f32-3bdb-4489-98a5-c3e45e5eff68" />

<img width="2617" height="1425" alt="funnel_revenue_sales_metrics" src="https://github.com/user-attachments/assets/21eaceef-923c-4a93-95f0-95e46dabb86b" />

## Source funnel:

<img width="2662" height="1265" alt="traffic_analysis_distributions" src="https://github.com/user-attachments/assets/a8073681-e398-4bbd-9c12-0b0203d61bb4" />

<img width="2617" height="1251" alt="traffic_analysis_overall_conversion_rate" src="https://github.com/user-attachments/assets/c4dcc306-cfce-4b8c-bf3a-d2b73d7f74f1" />


## Funnel stages:

<img width="2708" height="1430" alt="Funnel_stages_proportion_of_users" src="https://github.com/user-attachments/assets/4a0782d3-3ed4-458e-bb73-237c45dad9a2" />

<img width="2213" height="1430" alt="Funnel_stages_user" src="https://github.com/user-attachments/assets/ed1d86ee-9fa2-4d2a-8694-59485f198e8e" />


## Conversion analysis:

<img width="2410" height="1352" alt="user_journey" src="https://github.com/user-attachments/assets/e8a5db20-5933-4a92-aa2c-60bf12289072" />


# Next steps and limitations
