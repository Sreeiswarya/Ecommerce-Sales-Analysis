Use ecommerce_sales_analysis;

describe ecommerce_sales;

select *
from ecommerce_sales;

/** E-Commerce Sales Analysis Exploratory Data Analysis **/
/** 1. Sales Analysis **/
select
	sum(Sales_Amount) as Total_Sales,
    avg(Sales_Amount) as Average_Sales,
    min(Sales_Amount) as Minimum_Sales,
    max(Sales_Amount) as Maximum_Sales
from ecommerce_sales;

/** 2. Profit Analysis **/
select
	sum(Profit) as Total_Profit,
    avg(Profit) as Average_Profit,
    min(Profit) as Minimum_Profit,
    max(Profit) as Maximum_Profit
from ecommerce_sales;

/** 3. Quantity Analysis **/
select
	sum(Quantity) as Total_Quantity,
    avg(Quantity) as Average_Quantity,
    Max(Quantity) as Maximum_Quantity
from ecommerce_sales;

/** 4. Time Analysis **/
select
	year(Order_Date) as Order_Year,
    month(Order_Date) as Order_Month,
    Count(Distinct Order_ID) as Total_Order
from ecommerce_sales
group by Year(Order_Date), month(Order_Date)
order by Order_Year, Order_Month;

select 
	year(Order_Date) as Order_Year,
    month(Order_Date) as Order_Month,
    sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by Year(Order_Date), Month(Order_Date)
Order by Order_Year, Order_Month;

select
	year(Order_Date) as Order_Year,
    month(Order_Date) as Order_Month,
    sum(Profit) as Total_Profit
from ecommerce_sales
group by year(Order_Date), month(Order_Date)
Order by Order_Year, Order_Month;

/** 5. Geographic Analysis **/
select count(distinct State) as Total_States
from ecommerce_sales;

select count(distinct City) as Total_Cities
from ecommerce_sales;

/** 6. Category Analysis **/
select count(distinct Product_Category) as Total_Categories
from ecommerce_sales;

select count(distinct Product_Name) as Total_Products
from ecommerce_sales;