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

--What was the annual Gross Merchandise Volume (GMV)?
select 
sum(o.usd_price) as year_GMV,
o.purchase_date_year as year
from orders_cleaned o
group by o.purchase_date_year
order by sum(o.usd_price) desc
;

--What were the year-on-year sales growth percentages?
--?

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

--What were the month-on-month growth rates in sales, and how did these variations impact overall performance?
--??

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

--What were the month-on-month growth percentages in each region?
--??

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

--What were the year-on-year growth percentages for each product?
--??

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

--What were the year-on-year growth rates by marketing channel?
--??

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

--How has the loyalty program contributed to year-on-year growth?
--??