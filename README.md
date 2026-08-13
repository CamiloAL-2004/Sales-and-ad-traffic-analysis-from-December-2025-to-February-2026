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

Bar chart showing the amount of users per purchasing stage. A total of 5,000 potential customers entered the website between Dec 2025 and Feb 2026. 826 orders were made by 826 buyers, indicating one order per buyer. 

<img width="2617" height="1425" alt="funnel_revenue_sales_metrics" src="https://github.com/user-attachments/assets/21eaceef-923c-4a93-95f0-95e46dabb86b" />

Total revenue between Dec 2025 and Feb 2026 was $87,975 coming from a total of 826 orders. Further analysis reveals the average order value was $106 and that each potential customer that entered the website generated $17. 

## Source funnel:

<img width="2662" height="1265" alt="traffic_analysis_distributions" src="https://github.com/user-attachments/assets/a8073681-e398-4bbd-9c12-0b0203d61bb4" />

Bar chart showing the percentage of users coming from distinct ad sources and their potential of becoming a paying customer. The cart conversion rate (blue) represents the proportion of users who added an item to their cart; the purchase conversion rate (orange) represents the proportion of users that bought the items in their cart. Email had the highest cart and purchase conversion rate, indicating that ads from email are more likely to generate paying customers.

<img width="2617" height="1251" alt="traffic_analysis_overall_conversion_rate" src="https://github.com/user-attachments/assets/c4dcc306-cfce-4b8c-bf3a-d2b73d7f74f1" />

Bar chart showing the overall conversion rate from each individual ad campaign. The number indicates the percentage of potential customers who became paying customers. Email had the highest overall conversion rate.

## Funnel stages:

<img width="2708" height="1430" alt="Funnel_stages_proportion_of_users" src="https://github.com/user-attachments/assets/4a0782d3-3ed4-458e-bb73-237c45dad9a2" />

Bar chart showing the proportion of users converting to subsequent stages in the purchasing journey as well as overall conversion rate (proportion of potential customers who actually placed an order). 30 out of 100 of customers viewing the website added an item to their cart. 20 out of those 30 customers would checkout their cart and purchase an item. Overall, per 100 potential customers, 16 would become actual paying customers.


<img width="2213" height="1430" alt="Funnel_stages_user" src="https://github.com/user-attachments/assets/ed1d86ee-9fa2-4d2a-8694-59485f198e8e" />

Total number of users in each stage of the purchasing journey. The purchasing journey consists of viewing the website, adding an item to the cart, checking it out, adding payment details and finally purchasing the order. The number of customers decreases per stage. 

## Conversion analysis:

<img width="2410" height="1352" alt="user_journey" src="https://github.com/user-attachments/assets/e8a5db20-5933-4a92-aa2c-60bf12289072" />

Average time taken from viewing the website to purchasing an item for paying customers only. On average, paying customers take 11 minutes to add items to their cart and another 14 minutes to buy their cart, for an average total time of 25 minutes from visiting the website to purchasing an item. No bottlenecks were detected.

# Next steps and limitations

## Next steps 

1. UX & Website Optimization:
• Don't Touch the checkout Flow: The conversion rates from Checkout Start to Purchase are excellent (~80%+). This indicates the technical payment flow is frictionless.
  • Action: Do not redesign the checkout page right now; you risk breaking something that is working perfectly.

2. Marketing Strategy
• Stop Over-Investing in Social for Sales: Social Media is driving 30% of our traffic (Volume) but has the lowest conversion rate (Efficiency). We are likely paying for "window shoppers".
  • Action: Shift budget away from "Traffic" objectives on social ads and focus on "Retargeting" to capture emails instead.
• Double Down on Email Marketing: Email is our highest converting channel (~13%+ conversion rate vs ~6% for Social).
  • Action: Implement an aggressive email capture popup for those high-volume Social visitors. If we can get them onto our email list, our data proves they     are far more likely to buy later.

3. Financial & Revenue
• Audit Ad Spend against average order value (AOV) which was ~ $106.
  • Action: Set a strict Customer Acquisition Cost (CAC) limit. If we are paying more than $30-$40 to acquire a customer via Social Media ads (which convert     poorly), we are likely losing money on those specific transactions.

## Limitations 

- There is no outlined customer acquisition cost (CAC) to compare the success of each ad campaign being ran, i.e. how much profit is being made per customer brought in by an individual ad camping.
- The data analysed here was only for a 3 month period. More data would allow for more realistic analysis and better decision making.
