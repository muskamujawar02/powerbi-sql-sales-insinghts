use [Pizza DB];
select * from pizza_sales;

-- KPI's
select sum(total_price) as Total_Revenue from pizza_sales;
select sum(total_price)/count(distinct Order_id) as Average_Order_Value from pizza_sales;
select sum(quantity) as Total_pizza_Sold from pizza_sales;
select count(distinct order_id) as Total_orders FROM pizza_sales;
select CAST(CAST(sum(quantity) as decimal(10,2)) /
CAST(count(distinct Order_id) as decimal(10,2)) as decimal(10,2)) as Avg_Pizzas_Per_Order  FROM pizza_sales;

-- 1 CHART
select DATENAME(DW, order_Date) as order_day,COUNT(Distinct order_id) as Total_orders
from pizza_sales
GROUP BY DATENAME(DW, order_Date);
-- 2 CHART
select DATENAME(month, order_date) as Month_Name,count(distinct order_id) as total_orders
from pizza_sales
GROUP BY DATENAME(month, order_date)
ORDER BY Total_orders desc;
-- 3 CHART
select pizza_category,CAST(sum(total_price) as decimal(10,2)) as Total_sales,
CAST(sum(total_price)*100/(select sum(total_price) FROM pizza_sales) as decimal(10,2)) as PCT
FROM pizza_sales 
GROUP BY pizza_category;
-- 4 CHART
select pizza_size,CAST(sum(total_price) as decimal(10,2)) as Total_sales,
CAST(sum(total_price)*100/(select sum(total_price) FROM pizza_sales) as decimal(10,2)) as PCT
FROM pizza_sales 
GROUP BY pizza_size
order by PCT desc;
-- 5 CHART: Top 5 by Revenue,Total quantity & total orders
select TOP 5 pizza_name,sum(total_price) as Total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue desc;
-- by quntity
select TOP 5 pizza_name,sum(quantity) as Total_Quantity
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity desc;
-- by total orders
select TOP 5  pizza_name,count(distinct order_id) as Total_Orders
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders desc;
-- 6 CHART: Bottom 5 by Revenue,Total quantity & total orders
select top 5 pizza_name,sum(total_price) as Total_Revenue
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue asc;
-- by Total quantity
select top 5 pizza_name,sum(quantity) as Total_Quantity
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity asc;
-- by total order
select top 5 pizza_name,count(distinct order_id) as Total_Orders
from pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders asc;





