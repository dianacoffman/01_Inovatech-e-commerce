## Overview 📖

This project focused on uncovering data-driven insights from Inovatech, a global e-commerce platform for consumer electronics. The goal was to identify trends in sales, product performance, customer behavior, refund patterns, and marketing effectiveness, providing a comprehensive view of Inovatech's performance across various areas of the business. Metrics were analyzed from sales channels, the loyalty program, account creation methods, and regions. Based on these insights, I provided recommendations on where Inovatech should focus its efforts to improve marketing strategy, sales processes, and operational efficiency.

I used a combination of SQL, Excel, and Power BI, and statistical analysis to clean, analyze, and summarize these insights to deliver to the marketing, product and operations teams.

## Dataset Structure, Data Cleaning & Initial Checks 📑

The dataset provides customer and sales data. The raw dataset consists of about 225,000 rows:

Steps taken to clean, check data quality and prep the dataset for analysis can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/issue_log.xlsx)**.

SQL check codes to identify problems in tables can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Data_Checks_Inovatech.sql)**.

![image](https://github.com/user-attachments/assets/5e9eed59-b866-403c-bab7-e758b09a08fe)

## Business Questions & Exploratory Data Analysis ⚖️🎯

We separate our analysis into two types of analysis: Commercial Performance Analysis and Sales Trends-Customer Behavior.

The SQL Queries with the Commercial Performance Analysis finds can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Commercial_Performance_Analysis_Inovatech.sql)**.

The SQL Queries with the Sales Trends-Customer Behavior finds can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Sales_Trends_and_Customer_Behavior_Inovatech.sql)**.

## Dashboards📝🔎

The dashboard can be found in Power BI **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/Dashboards%20Data-Driven%20Insights%20into%20Inovatech.pbix)**. This dashboard enables users to filter by customer region, country, and country code, focusing on sales and marketing metrics.

![image](https://github.com/user-attachments/assets/823760e9-ce21-4f82-bac0-3faf132cb47f)

![image](https://github.com/user-attachments/assets/823760e9-ce21-4f82-bac0-3faf132cb47f)

## Finds & Insights💡

In terms of annual sales performance, the highest volume was recorded in 2020, followed by a sharp decline in 2021 and an even more pronounced drop of over 50% in 2022. Although the number of orders was higher in 2021, the lower AOV indicated reduced profitability per order. Regarding regional performance, North America led in sales, outperforming EMEA, APAC, and LATAM. However, Latin America had the lowest sales and order volume.

About the product sales performance, the 27-inch 4K monitor was the best-selling product annually in all analyzed years, leading the top-selling products with 30% of total product sales each year. Meanwhile, the Bose Soundsport headphones accounted for less than 1% of total product sales annually, making it a very low-performing product in terms of sales. As for marketing channels, the "direct" channel generated the highest sales and order volume in all years, followed by "email," "affiliate," and "social media." It is important to note that the email marketing channel has increasingly contributed to total sales, growing by more than 40% in 2022 compared to 2019. However, social media showed the lowest sales volume, representando apenas 1% da receita total e dos pedidos, suggesting either underutilization of this strategy or an audience less inclined to convert directly through social networks.

Regarding delivery and shipping, the company maintained a relatively uniform process across different regions and products, with an average delivery time of 7 to 8 days, contributing to a positive customer experience. The performance of the loyalty program was also noteworthy. In 2022, loyalty program members spent approximately 19.14% more on average than non-members, significantly contributing to total sales and with a higher AOV, indicating that these customers are more valuable.

## Recommendations & Next Steps 🛠️

Sales Performance:
Inovatech should investigate the reasons behind the sharp decline in sales from 2021 to 2022, focusing on understanding the factors that contributed to the reduction in AOV and the decrease in total sales. Consequently, the Bose Soundsport Headphones product line should be revisited, given its weak sales performance. The team should consider discontinuing it, as well as evaluating other lines that have not generated significant sales. Additionally, since the 27-inch 4K monitor has consistently been the best-selling product, the company should explore opportunities to expand this product line or introduce variants that could attract more customers.

Marketing Channels and Customer Experience:
The efforts in social media marketing should be reevaluated, considering their low contribution to sales, indicating that the target consumer audience may not be present on these platforms. On the other hand, it is recommended to continue investing in direct marketing and email channels, as these have shown continuous growth and positive impact on sales. Email communication should be optimized to further engage customers and increase conversion rates. Furthermore, while the uniformity of the delivery process and the average delivery time of 7 to 8 days are positive, it is worthwhile to evaluate partnerships with new logistics providers to enhance this experience and meet the growing expectations of consumers.

Loyalty Program:
Given that loyalty program members have demonstrated significantly higher spending than non-members, the team recommends expanding the program's benefits, perhaps by introducing additional rewards to encourage more customers to become members. This could further help increase sales and brand loyalty.

## Next Steps: RoadMap 12 month & Action Plan
(Suggestion: Start the action plan in October 2024)
1. Sales Recovery Strategy
Objective: Increase sales and customer retention after the decline in 2021 and 2022.

Actions:
- Customer Segmentation: Identify segments of customers who have not made purchases in the last 12-18 months and create targeted campaigns.
- Exclusive Offers: Design special promotions (e.g., discounts, free shipping) for returning customers.
- Loyalty Program Enhancement: Enhance the existing loyalty program by adding tiers or offering unique rewards based on purchase history.
- Timeline: 4 months for campaign setup and launch.
- Owner: Marketing & CRM Team.

2. Regional Expansion in LATAM
Objective: Grow market share in Latin America by leveraging low return rates and improving marketing efforts.

Actions:
- Market Research: Conduct deeper research to understand customer preferences and pain points in LATAM.
- Localized Campaigns: Develop region-specific marketing campaigns with a focus on the unique cultural and consumer behaviors in LATAM.
- Customer Support: Implement localized customer service initiatives, such as a dedicated support team and local-language documentation.
- Timeline: 5 months for research, campaign creation, and support launch.
- Owner: Regional Marketing Team & Customer Support.
