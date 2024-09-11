--SALES TRENDS AND CUSTOMER BEHAVIOR

--1. REFUND RATE
--Monthly refund rate:
select
os.purchase_date_month,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
group by os.purchase_date_month
order by os.purchase_date_month desc
;
--Top month refunds across all years: 2 (2.19) > 5 (1.99) > 1 (1.93)

----Year refund rate:
select
os.purchase_date_month,
os.purchase_date_year,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
group by os.purchase_date_year, os.purchase_date_month
order by refund_rate desc
;
--Top year refunds: No refunds for 2022 / 2020 (months 7 (3.95) > 10 (3.44)) > 2 (3.38) / 2021 (months 2 (3.08) > 1 (2.86)) / 2019 (months 12 (2.3 > 4 (2.21) > 5 (2.17))

--Monthly refund rate in 2020:
select
os.purchase_date_month,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate,
from order_status_cleaned os
where os.purchase_date_year = 2020
group by os.purchase_date_month
order by os.purchase_date_month desc
;
--Top refunds 2020: months 7 (3.95) > 10 (3.44) > 2 (3.38)

--Most Refunded Products (which products had the highest total count of refunds?):
select
o.product_name as product_name,
count(os.order_id) as product_quantity,
count(os.refund_date) as refund_quantity,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
join orders_cleaned o
on os.order_id = o.id
group by o.product_name
order by count(os.refund_date) desc
;

--Product Refund Frequency (Top 3) across all years:
select
o.product_name as product_name,
count(os.order_id) as product_quantity,
count(os.refund_date) as refund_quantity,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
join orders_cleaned o
on os.order_id = o.id
group by o.product_name
order by round(count(os.refund_date)/count(distinct os.order_id)*100,2) desc
limit 3
;
--Top products refunded: Macbook Air Laptop (4.17) > ThinkPad Laptop (3.83) > Apple iPhone (3.52)

--Monthly Apple Product Refunds in 2021 (how many refunds were there each month for Apple products in 2021?):
select
os.purchase_date_month,
count(os.refund_date) as refund_count,
round(count(os.refund_date)/count(distinct os.order_id)*100,2) as refund_rate
from order_status_cleaned os
join orders_cleaned o
on os.order_id = o.id
where os.purchase_date_year = 2021 and lower(o.product_name) like '%apple%'
group by os.purchase_date_month
order by os.purchase_date_month
;
--Top month refunds: month 2 (33) > month 1 (29) > month 3 (29)

--2. ACCOUNT CREATION METHODS
--Average order value across different account creation methods
select
c.account_creation_method as method,
avg(o.usd_price) as aov_price
from orders_cleaned o
join customers_cleaned c
on o.customer_id = c.id
and c.account_creation_method not like "unknown"
group by c.account_creation_method
order by avg(o.usd_price) desc
;
--Top Average order value across different account creation methods: 2018: tablet - 359.1947), 2019: (tv - 265.8820), 2020: (desktop - 318.3014), 2021 (tv	318.1514), 2022: (desktop - 232.6226)
--Top amount order value across different account creation methods: (method, avo, year, amount) = desktop 318.3014, 2020, 19967 / desktop	259.5465, 2021, 18773 / desktop	260.3914, 2019, 11266 / desktop	232.6226, 2022, 9436 / desktop 259.2877, 2018, 1636

--Average order value across different account creation methods in the first two months of 2022:
select
c.account_creation_method as method,
avg(o.usd_price) as aov_price
from orders_cleaned o
join customers_cleaned c
on o.customer_id = c.id
where c.created_on_year = 2022
and c.created_on_month between 1 and 2
and c.account_creation_method not like "unknown"
group by c.account_creation_method
order by avg(o.usd_price) desc
;

--Which method had the most new customers in this time (Which method attracted the most new customers in this period?):
select
c.account_creation_method as method,
count(distinct(o.customer_id)) as num_customer
from orders_cleaned o
join customers_cleaned c
on o.customer_id = c.id
where c.created_on_year = 2022
and c.created_on_month between 1 and 2
and c.account_creation_method not like "unknown"
group by c.account_creation_method
order by count(distinct(o.customer_id)) desc
;

--3. MARKETING CHANNELS
--Which marketing channels perform the best in each region?
select
c.region,
c.marketing_channel,
count(distinct o.id) as num_orders,
round(sum(o.usd_price), 2) as total_sales,
round(avg(o.usd_price), 2) as aov_price
from orders_cleaned o
join customers_cleaned c
on o.customer_id = c.id
where c.marketing_channel not like "unknown"
and c.region is not null
group by c.region, c.marketing_channel
order by c.region desc,
c.marketing_channel desc
;
--Direct in all region is the marketing channels perform the best related total sales.
--Top AOV_price: NA (afiliate) = 347.55 > APAC (direct) = 288.95 > EMEA (Afiliate) = 285.95  > LATAM (direct) = 254.97
--Top num_orders: NA (direct) = 30793 > EMEA (direct) = 18801  > APAC (direct) = 7598 > LATAM (direct) = 3864

--Does the top channel differ across regions related to sales?
WITH regional_sales as
(SELECT
   c.region,
   c.marketing_channel,
   SUM(o.usd_price) AS total_sales
 FROM customers_cleaned c
 JOIN orders_cleaned o
 ON o.customer_id = c.id
 WHERE c.marketing_channel IS NOT NULL
   AND c.marketing_channel != 'unknown'
   AND c.region IS NOT NULL
 GROUP BY c.region, c.marketing_channel
)
SELECT
 rs.region,
 rs.marketing_channel,
 rs.total_sales
FROM regional_sales rs
JOIN (
 SELECT
   region,
   MAX(total_sales) AS max_sales
 FROM regional_sales
 GROUP BY region
 ORDER BY region
) AS top_channels
ON rs.region = top_channels.region
AND rs.total_sales = top_channels.max_sales;
--The top marketing channel differ across regios about total sales: NA = direct, total sales: 8453401.99 > EMEA = direct, 5138337.47 > APAC = direct, 2195454.59 > LATAM = direct, 985201.21

--4. CUSTOMER ORDERS
--For customers who made more than 4 orders across all years, what was the order ID, product, and purchase date of their most recent order? 
select
o.customer_id,
count(o.id),
o.product_name as product_name,
o.purchase_date as purchase_date
from orders_cleaned o
group by o.customer_id
having count(o.id) >= 4
order by count(o.id) desc
;
