Use ecommerce_sales_analysis;

describe ecommerce_sales;

select *
from ecommerce_sales;

/** E-Commerce Sales Analysis Exploratory Data Analysis **/
/** Sales **/
/** 1. Total Sales **/
select
	sum(Sales_Amount) as Total_Sales
from ecommerce_sales;

/** 2. Average Sales **/
select 
	avg(Sales_Amount) as Average_Sales
from ecommerce_sales;

/** 3. Minimum Sales **/
select 
	min(Sales_Amount) as Minimum_Sales
from ecommerce_sales;

/** 4. Maximum Sales **/
select 
	max(Sales_Amount) as Maximum_Sales
from ecommerce_sales;

/** 5. Combine the Sales Mertics **/
select
	sum(Sales_Amount) as Total_Sales,
    avg(Sales_Amount) as Average_Sales,
    min(Sales_Amount) as Minimum_Sales,
    max(Sales_Amount) as Maximum_Sales
from ecommerce_sales;

/** Profit Analysis **/
/** 1. Average Profit **/
Select
	avg(Profit) as Average_Profit
From ecommerce_sales;

/** 2. Highest Profit **/
select 
	max(Profit) as Highest_Profit
from ecommerce_sales;

/** 3. Lowest Profit **/
select 
	min(Profit) as Lowest_Profit
from ecommerce_sales;

/**  4. Total Profit **/
select 
	sum(Profit) as Total_Profit
from ecommerce_sales;

/** 5. Combine the Profit Mertics **/
select
	avg(Profit) as Average_Profit,
    max(Profit) as Maximum_Profit,
    min(Profit) as Minimum_Profit,
    sum(Profit) as Total_Profit
from ecommerce_sales;

/** Quantity Analysis **/
/** 1. Average Quantity **/
select
	avg(Quantity) as Average_Quantity
from ecommerce_sales;

/** 2. Maximum Quantity **/
select
	max(Quantity) as Maximum_Quantity
from ecommerce_sales;

/** 3. Total Quantity **/
select
	sum(Quantity) as Total_Quantity
from ecommerce_sales;

/** 4. Combine the Quantity Mertics **/
select
	avg(Quantity) as Average_Quantity,
    Max(Quantity) as Maximum_Quantity,
    sum(Quantity) as Total_Quantity
from ecommerce_sales;

/** Time Analysis **/
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
    month(Order_Date) as Order_MOnth,
    sum(Profit) as Total_Profit
from ecommerce_sales
group by year(Order_Date), month(Order_Date)
Order by Order_Year, Order_Month;

/** Geographic Analysis **/
select count(distinct State) as Total_States
from ecommerce_sales;

select count(distinct City) as Total_Cities
from ecommerce_sales;

/** Category Analysis **/
select count(distinct Product_Category) as Total_Categories
from ecommerce_sales;

select count(distinct Product_Name) as Total_Products
from ecommerce_sales;