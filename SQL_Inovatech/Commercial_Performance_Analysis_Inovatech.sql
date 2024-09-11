--COMMERCIAL PERFORMANCE ANALYSIS:

--1. YEARLY SALES SUMMARY
--The annual sales performance in terms of total sales, average order value (AOV), and total orders:
select
o.purchase_date_year as year,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
group by o.purchase_date_year
order by o.purchase_date_year desc
;
--Year total_sales aov_sales total_orders
--2022	3794769.8	229.6798	16524
--2021	6557469.67	252.7450	25964
--2020	7231899.11	296.3407	24406
--2019	2699176.13	225.8347	11952
-- Top total_sales = 2020 (Sales had a big growth 2019 to 2020, but after that sales trend drop signigicantly, and 2021 to 2022 droped more than 50%!
-- Top aov_sales = 2020 but not to much variation.
-- Top total_orders = 2021 but avo_sales was lower than 2020


--2. MONTHLY SALES SUMMARY
--What were the monthly sales, AOV, and total orders?
select
o.purchase_date_month as month,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
group by o.purchase_date_month
order by o.purchase_date_month
;
--Total Sales better in months 5 > 3 > 4
--Avg Sales almost same every month
--Total Orders better in months 3 > 5 > 4


--3. REGIONAL SALES PERFORMANCE
--What was the ANNUAL regional sales performance in terms of total sales, AOV, and total orders?
select
c.region,
o.purchase_date_year as year,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
join customers_cleaned c
on c.id = o.customer_id
where c.region not like " "
group by c.region, o.purchase_date_year
order by c.region, o.purchase_date_year desc
;
--Total Sales better in regions NA>EMEA>APAC>LATAM
--Avg Sales almost same every region
--Total Orders better in months NA>EMEA>APAC>LATAM (NA 2x more than EMEA, and EMEA 2x more than APAC, APAC 2x more than LATAM)

--What was the MONTHLY regional sales performance in terms of total sales, AOV, and total orders?
select
c.region,
o.purchase_date_month as month,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
join customers_cleaned c
on c.id = o.customer_id
where c.region not like " "
group by c.region, o.purchase_date_month
order by c.region, o.purchase_date_month
;
--Total Sales better in months 5 > 3 > 4 (For ~ all region)


--4. PRODUCT SALES PERFORMANCE
--What was the ANNUAL product sales performance, considering total sales, AOV, and total orders?
select
o.product_name,
o.purchase_date_year as year,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
group by o.product_name, o.purchase_date_year
order by o.product_name, o.purchase_date_year
;
--Top total_sales products 2022: 27in 4K gaming monitor > Macbook Air Laptop > ThinkPad Laptop
--Top total_sales products 2021: 27in 4K gaming monitor > Apple Airpods Headphones > Macbook Air Laptop
--Top total_sales products 2020: 27in 4K gaming monitor > Macbook Air Laptop > ThinkPad Laptop
--Top total_sales products 2019: 27in 4K gaming monitor > Macbook Air Laptop > ThinkPad Laptop

--Top total_orders products 2022: Apple Airpods Headphones > 27in 4K gaming monitor > Samsung Charging Cable Pack
--Top total_orders products 2021: Apple Airpods Headphones > 27in 4K gaming monitor > Samsung Charging Cable Pack
--Top total_orders products 2020: Apple Airpods Headphones > 27in 4K gaming monitor > Samsung Charging Cable Pack
--Top total_orders products 2019: Apple Airpods Headphones > Samsung Charging Cable Pack > 27in 4K gaming monitor

--What was the MONTHLY product sales performance, considering total sales, AOV, and total orders?
select
o.product_name,
o.purchase_date_month as month,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
group by o.product_name, o.purchase_date_month
order by o.product_name, o.purchase_date_month
;


--5. MARKETING CHANNEL SALES PERFORMANCE
--What was the ANNUAK sales performance by marketing channel in terms of total sales, AOV, and total orders?
select
c.marketing_channel,
o.purchase_date_year as year,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
join customers_cleaned c
on c.id = o.customer_id
group by c.marketing_channel, o.purchase_date_year
order by c.marketing_channel, o.purchase_date_year
;
--Top Marketing Channel 2022: direct > email > afiliate > social media
--Top Marketing Channel 2021: direct > email > afiliate > social media
--Top Marketing Channel 2020: direct > email > afiliate > social media
--Top Marketing Channel 2019: direct > email > afiliate > social media

--How did the marketing channels perform monthly in terms of sales, AOV, and total orders?
select
c.marketing_channel,
o.purchase_date_month as month,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov_sales,
count(distinct o.id) as total_orders
from orders_cleaned o
join customers_cleaned c
on c.id = o.customer_id
group by c.marketing_channel, o.purchase_date_month
order by c.marketing_channel, o.purchase_date_month
;

--6. DELIVERY & SHIPPING PERFORMANCE (across different regions)
--What is the AVERAGE TIME from purchase to shipping, shipping to delivery, and total time from purchase to delivery for each region?
select
c.region,
round(avg(date_diff(os.purchase_date, os.ship_date, 'day')), 2) as avg_purchase_to_ship_day,
round(avg(date_diff(os.ship_date, os.delivery_date, 'day')), 2) as avg_ship_to_delivery_days,
round(avg(date_diff(os.purchase_date, os.delivery_date, 'day')), 2) as avg_purchase_to_delivery_days
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
group by c.region
order by c.region
;
--We have almost same avg_purchase_to_ship_day, avg_ship_to_delivery_days, and avg_purchase_to_delivery_days by all region

--What were the yearly changes in delivery and shipping times by region?
select
c.region,
os.purchase_date_year,
round(avg(date_diff(os.purchase_date, os.ship_date, 'day')), 2) as avg_purchase_to_ship_day,
round(avg(date_diff(os.ship_date, os.delivery_date, 'day')), 2) as avg_ship_to_delivery_days,
round(avg(date_diff(os.purchase_date, os.delivery_date, 'day')), 2) as avg_purchase_to_delivery_days
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
group by c.region, os.purchase_date_year
order by c.region, os.purchase_date_year
;

--What were the monthly changes in delivery and shipping times by region?
select
c.region,
os.purchase_date_month,
round(avg(date_diff(os.purchase_date, os.ship_date, 'day')), 2) as avg_purchase_to_ship_day,
round(avg(date_diff(os.ship_date, os.delivery_date, 'day')), 2) as avg_ship_to_delivery_days,
round(avg(date_diff(os.purchase_date, os.delivery_date, 'day')), 2) as avg_purchase_to_delivery_days
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
group by c.region, os.purchase_date_month
order by c.region, os.purchase_date_month
;


--7. REGIONAL PRODUCT REFUNDS
--What are the product refund rates by region, and what are the yearly trends?
select
c.region,
os.purchase_date_year,
o.product_name as product_name,
count(os.order_id) as product_quantity,
count(os.refund_date) as refund_quantity,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
group by c.region, os.purchase_date_year, o.product_name
order by c.region, os.purchase_date_year, o.product_name
;
--Refund rate: NA (1.86) > APAC (1.74) > LATAM (1.65) > EMEA (1.53)
--Refund amount: NA (758) > EMEA (354) > NS (166) > LATAM (86)

--Are there specific products or regions with higher refund rates? If so, what are the possible causes?
select
c.region,
os.purchase_date_year,
o.product_name as product_name,
count(os.order_id) as product_quantity,
count(os.refund_date) as refund_quantity,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
group by c.region, os.purchase_date_year, o.product_name
order by refund_rate desc
;
--Apple iPhone top refund (LATAM), after Macbook Air Laptop and ThinkPad Laptop in other region


--8. LOYALTY PROGRAMME PERFORMANCE
--What is the impact of the loyalty program on total sales, AOV, and total orders?
select
c.region,
os.purchase_date_year,
coalesce(c.loyalty_program, 0),
o.product_name as product_name,
sum(o.usd_price) as total_sales,
avg(o.usd_price) as aov,
count(o.id) as total_orders
from order_status_cleaned os
join orders_cleaned o
on o.id = os.order_id
join customers_cleaned c
on c.id = o.customer_id
where c.loyalty_program != 0
group by c.region, os.purchase_date_year
order by c.region, os.purchase_date_year
;
--Who is in loyalty programme has highest sales.

--How has the loyalty program contributed to year-on-year growth?
--??
