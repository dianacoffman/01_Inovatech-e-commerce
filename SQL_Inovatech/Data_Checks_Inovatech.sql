--1) CHECK DATASETS AND FORMATS:

--Checking dataset orders_cleaned.
select *
from orders_cleaned
limit 1000;

--Checking dataset customers.
select *
from customers_cleaned
where marketing_channel not like 'unknown'
limit 1000;

--Checking dataset orders_status.
select *
from order_status_cleaned
limit 1000;

--2) NULL CHECK:

--Null check in orders.
select
    sum(case when customer_id is null then 1 else 0 end) as nullcount_cust_id 
  , sum(case when id is null then 1 else 0 end) as nullcount_order_id
  , sum(case when purchase_date is null then 1 else 0 end) as nullcount_purchase_date
  , sum(case when product_id is null then 1 else 0 end) as nullcount_product_id
  , sum(case when product_name is null then 1 else 0 end) as nullcount_product_name
  , sum(case when currency is null then 1 else 0 end) as nullcount_currency
  , sum(case when local_price is null then 1 else 0 end) as nullcount_local_price
  , sum(case when usd_price is null then 1 else 0 end) as nullcount_usd_price
  , sum(case when purchase_platform is null then 1 else 0 end) as nullcount_purchase_platform  
from orders_cleaned
--48 Nulls in currency column and 23 Nulls in usd_price.

--Null check in customers.
select 
sum(case when id is null then 1 else 0 end),
sum(case when marketing_channel is null then 1 else 0 end),
sum(case when account_creation_method is null then 1 else 0 end),
sum(case when country_code is null then 1 else 0 end),
sum(case when created_on is null then 1 else 0 end),
sum(case when created_on_year is null then 1 else 0 end),
sum(case when region is null then 1 else 0 end),
sum(case when loyalty_program is null then 1 else 0 end)
from customers_cleaned
-- 93 nulls in country and 109 nulls in region

--Null check in order status.
select 
sum(case when order_id is null then 1 else 0 end),
sum(case when purchase_date is null then 1 else 0 end),
sum(case when ship_date is null then 1 else 0 end),
sum(case when delivery_date is null then 1 else 0 end),
sum(case when refund_date is null then 1 else 0 end)
from order_status_cleaned
-- 77479 nulls in refund_date, means many items were not refunded

-- 3) DUPLICATE CHECK:

select id, count(*)
from orders_cleaned
group by 1
having count(*) > 1;
-- somente um id (302cc84b785) repetido 78846

--4) PRICE STATISTICS TEST:

select
    product_name, 
    min(usd_price) as product_lowest_usd, 
    avg(usd_price) as product_avg_usd, 
    max(usd_price) as product_highest_usd
from orders_cleaned
group by 1;

-- 5) PURCHASE DATE RANGE:

select
    min(purchase_date) as earliest_date,
    max(purchase_date) as latest_date
from orders_cleaned;

-- 6) PRODUCT ORDER COUNTS:

select 
    product_name,
    count(*) as product_order_total
from orders_cleaned
group by 1
order by 2 desc;
-- 78846 orders
