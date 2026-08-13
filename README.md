# Sales-and-ad-traffic-analysis-from-December-2025-to-February-2026

# Sales problem 

E-commerce company wanted to know their sales and ad traffic data, including total revenue from sales and which ad source generated the most amount of purchases. The purpose of this analysis was to create a targeted approach for improving revenue and doubling down on the type of traffic source that generates the most profit.

# Data

The database is a CSV file containing the event_id (int), user_id (int), event_type (VARCHAR), event_date (VARCHAR), product_id (int), amount (float) and traffic_source (VARCHAR) headers. The data was queried by creating common table expressions (CTEs) to extract meaningful data and analyse the patterns from the analysis. 

The four CTEs used were:
  - funnel_revenue - extracted total amount of customers and buyers, total revenue and other revenue metrics including revenue per order, buyer and visitor.
  - conversion_analysis - extracted total amount of buyers and the average time spent along sections of and the totality of the purchasing journey.
  - source_funnel - extracted information about the types of ads being ran, including their popularity and conversion rates
  - funnel_stages - extracted number of users entering the site and following the steps to make a purchase customers who bought products. Also included the proportion of users which moved from one stage to the next.

The data extracted by each CTE was exported to Excel for visualisation via bar charts.

# Results 

## Funnel revenue:

# Next steps and limitations
