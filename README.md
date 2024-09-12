## Overview 📖

This project involves delving into data-driven insights from Inovatech, a global e-commerce platform specializing in consumer electronics. The analysis uses tools such as SQL, Excel, and Power BI, and covers four comprehensive datasets with over 225,000 rows of information. These datasets capture critical business metrics across four sales channels, four account creation methods, and over 70 regions worldwide.

The goal is to uncover trends in sales trends, customer behavior, refund patterns, marketing channel effectiveness, understand regional performance, loyalty program effectiveness, and product-specific behaviors, and recommend strategies to optimize marketing and sales processes across different regions and customer segments. By analyzing comprehensive datasets related to sales, marketing channels, customer behavior, and product returns, we aim to provide actionable insights that can improve Inovatech’s business performance.

## Table of Contents 📚

- Introduction & Storymap
- Dataset Structure, Data Cleaning & Initial Checks
- Business Questions & Exploratory Data Analysis
- Finds & Insights
- Recommendations & Next Steps
- Dashboards

## Introduction & Storymap📝🔎

About Inovatech, it is an innovative e-commerce platform dedicated to providing the latest consumer electronics and accessories to customers worldwide. 

The challenge is that their extensive database covers sales figures, marketing efforts, operational efficiency, product range, and loyalty program data hadn't been analyzed since 2018, and the company has no direction on where to follow, regarding the performance of its products, sales channels or regions where to invest more in its campaigns. These data are now being comprehensively analyzed to reveal insights aimed at enhancing Inovatech's business performance.

The project's primary goal is to offer insights and recommendations in the following core areas:
- Sales: This involves a deep understanding of best-selling products, product performance analysis, identifying regions with high sales potential, and assessing different sales channels.
- Customer Behavior: Evaluating the effectiveness of the loyalty program, analysing product returns, and examining various marketing channels and their return on investment.

## Dataset Structure, Data Cleaning & Initial Checks 📑

![image](https://github.com/user-attachments/assets/6b91e9fc-03e8-47f7-b31b-b79628ce7092)

Checks to identify any potential data quality issues:
- Missing Column
- Nulls
- Misnamed Rows

Issues Log file **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/issue_log.xlsx)**.

Before starting the analysis, checks to gain an understanding of the data were performed to identify any potential data quality issues:
- Check Datasets And Formats
- Null Check
- Duplicate Check
- Price Statistics Test
- Purchase Date Range
- Product Order Counts

SQL check codes to identify problems in tables can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Data_Checks_Inovatech.sql)**.


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

The SQL Queries answering the business questions above can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Commercial_Performance_Analysis_Inovatech.sql)**.

- Sales Trends and Customer Behavior:
1. REFUND RATE (Most Refunded Products / Product Refund Frequency (Top 3) across all years / Monthly Apple Product Refunds in 2021)
2. ACCOUNT CREATION METHODS (Average order value across different account creation methods / Which method had the most new customers)
3. MARKETING CHANNELS (Which marketing channels perform the best in each region / how the top channel differ across regions)
4. CUSTOMER ORDERS (Average time between customer registration and their first order / Customers who made more than 4 orders across all years, what was the order ID, product, and purchase date of their most recent order)

The SQL Queries answering the business questions above can be found **[here](https://github.com/dianacoffman/01_Inovatech-e-commerce/blob/main/SQL_Inovatech/Sales_Trends_and_Customer_Behavior_Inovatech.sql)**.

## Dashboards📝🔎

![image](https://github.com/user-attachments/assets/380dcc20-4b53-45ca-8508-14ef2a0b2bb6)

![image](https://github.com/user-attachments/assets/f0f919ab-820c-4486-b4da-43e2cd1b9931)

## Finds & Insights💡

Annual Sales Performance:
- The highest sales volume was recorded in 2020, with a significant drop in 2021 and an even more pronounced decline in 2022 (over 50% decrease between 2021 and 2022).
- The average order value (AOV) was highest in 2020, but did not show a very significant variation over the years.
- Although the number of orders was higher in 2021, the lower AOV indicates lower profitability per order.

Regional Performance:
- North America (NA) is the leading region in terms of sales, performing significantly better than EMEA, APAC, and LATAM.
- Although Latin America has the lowest sales and order volume, return rates are relatively low.
- The highest return rates were recorded in North America (1.86%), followed by APAC and LATAM.

Product Sales Performance:
- The 27-inch 4K monitor was the product with the highest annual sales in all analyzed years, with the MacBook Air and ThinkPad also standing out.
- However, the AirPods had the highest number of orders, which shows popularity in terms of sales volume, but with a lower average ticket.

Marketing Channels:
- The "direct" marketing channel generated the highest sales and order volume in all years, followed by "email," "affiliate," and "social media."
- Social media channels showed the lowest sales volume, which may indicate an underutilization of this strategy or an audience less inclined to convert directly through social networks.

Return Rates:
- Apple products, such as the MacBook Air, ThinkPad Laptop, and iPhone, had the highest return rates. LATAM had the highest return rate for the iPhone, which may indicate product-related issues or consumer expectations in that region.

Account Creation Methods:
- The account creation method via desktop generated the highest average order value (AOV) in most years, standing out as the main method in terms of profitability per transaction.

Delivery & Shipping
- The company has a relatively uniform shipping process across different regions, which is good for customer experience.

Loyalty Program Performance
- Loyalty program members contribute significantly to total sales and have a higher AOV, indicating that these customers are more valuable.

## Recommendations & Next Steps 🛠️

Annual Sales Performance:
- With the sharp decline in sales in 2021 and 2022, it is essential to review customer retention strategies and reactivate segments that have lost interest.
- Campaigns focused on customers who have not made recent purchases, exclusive offers, and enhanced loyalty programs can help in recovery.

Regional Performance:
- Sales in Latin America are the lowest, but this region also has a low return rate. Investing in marketing campaigns and customer service in LATAM could open growth opportunities in a region that has not yet been fully explored.
- Investigate product quality or customer support issues related to high-refund products like Apple iPhones.
- Implement targeted customer support in NA to reduce the overall refund rate.

Product Sales Performance:
- Continue to push high-end products but balance the strategy by promoting accessories that can generate high order volumes.
- Consider cross-selling or bundling strategies to promote premium products with smaller, high-frequency items.

Marketing Channels:
- Since social media channels generate fewer conversions, it is advisable to review the social media advertising strategy and focus on more targeted and creative campaigns that better connect with younger audiences, while optimizing the use of the "direct" channel, which has the highest performance.

Return Rates:
- Need to review the communication of expectations and post-purchase support services, especially in LATAM. 
- A simpler return process or extended warranty could reduce customer dissatisfaction.

Account Creation Methods:
- Encourage account creation through desktop platforms and incentivize higher-value purchases with discounts or special offers.
- Simplify the account creation process across all platforms to increase conversion rates.

Delivery & Shipping
- Continue optimizing logistics to ensure delivery times remain competitive, especially in regions with longer shipping distances like LATAM.

Loyalty Program Performance
- Enhance loyalty program offerings to encourage more customers to join.
- Personalize marketing efforts for loyalty members with tailored promotions or early access to new products.




