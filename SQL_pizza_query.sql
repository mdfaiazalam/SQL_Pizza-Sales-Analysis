-- Bimilla Hirrahmanirraheem

select * from pizza_sales

---------------------------------------------------------------------------------------------------------------------------------------------

-- Basic Data Exploration

select count(*) as total_row from pizza_sales;

select distinct pizza_size from pizza_sales

select distinct pizza_category from pizza_sales

select distinct pizza_name, count(distinct pizza_name) as different_pizza_count from pizza_sales
group by pizza_name;

select count(quantity) as total_quantity from pizza_Sales


---------------------------------------------------------------------------------------------------------------------------------------------

--Question_1 --> Total Revenue
select round(sum(quantity*unit_price),2) as total_Revenue from pizza_Sales

--Question_2 --> Average Order Value
Select round(sum(total_price)/count(distinct order_id),3) as avg_order_val from pizza_sales;

--Quesion_3 --> Total Pizza Sold
select sum(quantity) as total_pizza_sold from pizza_sales

--Quesion_4 --> Total Order Placed
select count(distinct order_id) as total_order_paced from pizza_sales

--Question_5 --> Average Pizza's Per Order
select cast(cast(sum(quantity) as decimal (10,2))/count(distinct order_id) as decimal(10,2))
as average_pizza_order from pizza_sales

----------------------------------------------------------------------------------------------------------------------------------------


--select day(order_date) as day, cast(count(order_id) as decimal(10,2)) as daily_Sales_trend
--from pizza_sales group by day(order_date) order by day desc

--Question_6 --> Daily Trend for total sales
select DATENAME(DW,order_date) as order_day, count(distinct order_id) as order_count
from pizza_sales group by DATENAME(DW,order_date)
 --Datename(DW, column_name) --> days_name


--Question_7 --> Hourly Trend For Total Order
select datepart(hour,order_time) as order_hour, count(order_id) as hourly_trend
from pizza_sales group by datepart(hour,order_time) order by datepart(hour,order_time) asc


----Question_8 --> Percentage of Sales by Pizza Category

--select pizza_category, cast((sum(total_price)/count(pizza_category))/100 as decimal(10,2))
--as percentage_sales_by_category from pizza_sales
--group by pizza_category

select pizza_category, round(sum(total_price),2) as total_sales, 
round((sum(total_price) / (Select sum(total_price) from pizza_sales))* 100,2)
as percentage_sales_by_category
from pizza_Sales group by pizza_category


--Question_9 --> Percentage of sales by pizza size
select pizza_size, round((sum(total_price)/(Select sum(total_price) 
from pizza_sales))*100,2) as precentage_sales_by_pizza_size
from pizza_Sales group by pizza_size


--Question_10 --> Total Pizzas sold by pizza category
select pizza_category, round(sum(total_price),2) as pizza_sold_by_category
from pizza_sales
group by pizza_category


--Question_11 --> Top 5 best sellers by total pizza sold
select Top 5 pizza_name, sum(quantity)as Top_5_pizza_sold from pizza_sales
group by pizza_name order by Top_5_pizza_sold desc;
  

--Question_12 --> bottom 5 worst sellers by total pizza sold
select top 5 pizza_name, sum(quantity) as Bottom_5_pizza_sold from pizza_sales
group by pizza_name order by Bottom_5_pizza_sold asc;
















































create table company_info(company_name varchar(10),year_cal int,revenue int)

insert into company_info values('x',2020,100)
insert into company_info values('x',2021,90)
insert into company_info values('x',2022,120)
insert into company_info values('y',2020,100)
insert into company_info values('y',2021,100)
insert into company_info values('z',2020,100)
insert into company_info values('z',2021,120)
insert into company_info values('z',2022,130)

select * from company_info;

select company_name, year_cal, revenue,
lead(revenue, 1, revenue) over(partition by company_name order by revenue) as next_year_revenue,
lead(revenue, 1, revenue) over(partition by company_name order by revenue) as rev_dif,
from company_info 
--where lg >= revenue

