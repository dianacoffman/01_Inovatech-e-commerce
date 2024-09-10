## Overview 📖

This project involves delving into data-driven insights from Inovatech, a global e-commerce platform specializing in consumer electronics. The analysis uses tools such as SQL, Excel, and Power BI, and covers four comprehensive datasets with over 225,000 rows of information. These datasets capture critical business metrics across four sales channels, four account creation methods, and over 70 regions worldwide.

The goal is to uncover trends in sales performance, customer behavior, refund patterns, marketing channel effectiveness, understand regional and product-specific behaviors, and recommend strategies to optimize marketing and sales processes across different regions and customer segments. By analyzing comprehensive datasets related to sales, marketing channels, customer behavior, and product returns, we aim to provide actionable insights that can improve Inovatech’s business performance. The analysis covers key areas such as sales trends, customer behavior, refund patterns, and loyalty program effectiveness.

## Table of Contents 📚

- Introduction & Storymap
- Dataset Structure, Data Cleaning & Initial Checks
- Business Questions & Exploratory Data Analysis
- Finds & Insights
- Recommendations & Next Steps
- Dashboards in Power BI

## Introduction & Storymap📝🔎

About Inovatech, it is an innovative e-commerce platform dedicated to providing the latest consumer electronics and accessories to customers worldwide. 

The challenge is that their extensive database covers sales figures, marketing efforts, operational efficiency, product range, and loyalty program data had been analyzed since 2018, and the company has no direction on where to follow, regarding the performance of its products, sales channels or regions where to invest more in its campaigns. These data are now being comprehensively analyzed to reveal insights aimed at enhancing Inovatech's business performance.

The project's primary goal is to offer insights and recommendations in the following core areas:
- Sales: This involves a deep understanding of best-selling products, product performance analysis, identifying regions with high sales potential, and assessing different sales channels.
- Customer Behavior: Evaluating the effectiveness of the loyalty program, analysing product returns, and examining various marketing channels and their return on investment.

## Dataset Structure, Data Cleaning & Initial Checks 📑

![image](https://github.com/user-attachments/assets/6b91e9fc-03e8-47f7-b31b-b79628ce7092)

Checks to identify any potential data quality issues:
- Missing Column
- Nulls
- Misnamed Rows

Issues Log file here

Before starting the analysis, checks to gain an understanding of the data were performed to identify any potential data quality issues:
- Check Datasets And Formats
- Null Check
- Duplicate Check
- Price Statistics Test
- Purchase Date Range
- Product Order Counts

SQL check codes to identify problems in tables can be found here.

![image](https://github.com/user-attachments/assets/1c43905c-8b08-4221-b075-589a55f211e8)


## Business Questions & Exploratory Data Analysis ⚖️🎯

We separate our analysis into two types of analysis: Commercial Performance Analysis and Sales Trends/Customer Behavior.

- Commercial Performance Analysis:
1. YEARLY SALES SUMMARY (total sales, average order value (AOV), total orders, and year-on-year sales growth percentages)
2. MONTHLY SALES SUMMARY (total sales, average order value (AOV), total orders, and month-on-month sales growth percentages)
3. REGIONAL SALES PERFORMANCE
4. PRODUCT SALES PERFORMANCE
5. MARKETING CHANNEL SALES PERFORMANCE
6. DELIVERY & SHIPPING PERFORMANCE (Average time from purchase to shipping, shipping to delivery / total time from purchase to delivery across different regions, years and months)
7. REGIONAL PRODUCT REFUNDS (product higher refund rates by region, and what are the yearly trends)
8. LOYALTY PROGRAMME PERFORMANCE (the impact of the loyalty program on total sales, AOV, and total orders)

- Sales Trends and Customer Behavior:
1. REFUND RATE (Most Refunded Products / Product Refund Frequency (Top 3) across all years / Monthly Apple Product Refunds in 2021)
2. ACCOUNT CREATION METHODS (Average order value across different account creation methods / Which method had the most new customers)
3. MARKETING CHANNELS (Which marketing channels perform the best in each region / how the top channel differ across regions)
4. CUSTOMER ORDERS (Average time between customer registration and their first order / Customers who made more than 4 orders across all years, what was the order ID, product, and purchase date of their most recent order)

## Finds & Insights💡

Yearly Sales Trends:
2020 peak performance: Total sales reached a high in 2020 with $7.23M, driven by higher average order values (AOV) and strong order volumes.
2021-2022 sales decline: Sales dropped significantly by 47% from 2020 to 2021 and further by over 50% from 2021 to 2022. A focus should be placed on understanding what caused this rapid decline, whether it was competition, market saturation, or internal inefficiencies.
AOV stability: Despite fluctuations in total orders, the average order value has remained relatively stable over the years, indicating consistent pricing or product bundling strategies.
Monthly Sales Patterns:

Seasonality: Peak sales were observed in months 5 (May), 3 (March), and 4 (April) across all years. Promotions or market campaigns during these months might be driving higher sales, suggesting an opportunity to replicate successful tactics during other months.
Total Orders: Higher total orders occurred in months 3 > 5 > 4, showing that certain months have more demand, even if the average order value doesn’t differ much.
Regional Sales Performance:

NA dominance: North America (NA) consistently leads in total sales and orders, significantly outperforming other regions. It could indicate a larger or more engaged customer base, or better regional marketing strategies.
Lower regional sales in LATAM: LATAM shows the lowest total sales and orders, suggesting that it is a potential growth region. Customizing marketing strategies and addressing regional needs could improve LATAM's performance.
Product Sales Performance:

27in 4K gaming monitor dominance: This product consistently leads in total sales across all years, suggesting high demand for this category.
Apple Airpods Headphones – top ordered: While 27in 4K gaming monitor generates more revenue, Apple Airpods consistently leads in total orders, showing its popularity as a frequently purchased item.
Opportunity to bundle products: High sales of Apple Airpods and monitors suggest potential cross-selling or bundling opportunities to boost overall sales.
Marketing Channel Performance:

Direct channel dominance: Direct sales lead consistently in all years. It suggests strong organic traffic and brand recognition, which can be leveraged further through exclusive offers to repeat customers.
Social media underperformance: Social media consistently lags in total sales, which might indicate the need to reassess social strategies or to increase investment in social media advertising.
Shipping & Delivery Performance:

Consistent delivery times across regions: There is little variation in delivery times across regions, which suggests a well-optimized supply chain. However, any slight delays in specific regions should still be addressed for better customer satisfaction.
Efficiency focus: Maintaining these shipping and delivery standards while expanding or entering new markets will be key for sustaining customer satisfaction.
Refund Rates:

Higher refund rates in NA and APAC: NA shows the highest refund rate (1.86%), followed by APAC (1.74%). Understanding the reasons behind higher returns in these regions (e.g., product defects, misrepresentation, or unmet customer expectations) could help reduce these rates.
Apple iPhone leads refunds in LATAM: The top product being refunded in LATAM is the Apple iPhone. Investigating whether the refunds are due to defects, shipping damage, or customer dissatisfaction could help in identifying solutions.
Loyalty Program Impact:

Positive impact on sales: Customers in the loyalty program show higher total sales, indicating its success in promoting repeat purchases. Strengthening and expanding the program could further drive engagement and sales growth.

## Recommendations & Next Steps 🛠️
