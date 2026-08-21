Use ecommerce_sales_analysis;

describe ecommerce_sales;

select *
from ecommerce_sales;

/** 1. Sales Analysis **/
/** Top States **/
select
	state,
    sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by state
order by Total_Sales desc
Limit 5;

/** Top Cities **/
select
	city,
    sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by City
order by Total_Sales desc;

/** Monthly Sales **/
select
	year(Order_Date) As Order_Year,
    month(Order_Date) as Order_Month,
    sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by
	year(Order_Date),
    Month(Order_Date)
Order by
	Order_Year,
    Order_Month;
    
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales
FROM ecommerce_sales
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Sales_Month;

/** Quarterly Sales **/
select
	year(Order_Date) as Order_Year,
    quarter(Order_Date) as Quarter,
    sum(Sales_Amount) as Total_Sales
From ecommerce_sales
group by
	Year(Order_Date),
    Quarter(Order_Date)
Order by
	Order_Year,
    Quarter;
    
/** 2. Product Analysis **/
/** Top 10 Products **/
select
	Product_Name,
    Sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by Product_Name
order by Total_Sales desc
limit 10;

/** Low Performing Products **/
select
	Product_Name,
    Sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by Product_Name
order by Total_Sales asc
limit 10;

/** Category Profitability **/
select
	Product_Category,
    sum(Profit) as Total_Profit
from ecommerce_sales
group by Product_Category
order by Total_Profit desc;

/** Profit Margin **/
select
	Product_Category,
    sum(Sales_Amount) as Total_Sales,
    sum(Profit) as Total_Profit,
    round(
		sum(Profit) / sum(Sales_Amount) * 100,
        2
	) as Profit_Margin_Percent
from ecommerce_sales
group by Product_Category
order by Profit_Margin_Percent desc;

/** 3. Customer Analysis **/
/** Customer Order Frequency **/
select
	Customer_ID,
    count(distinct Order_ID) as Total_Orders
from ecommerce_sales
group by Customer_ID
order by Total_Orders desc;

/** Revenue by Customer **/
select 
	Customer_ID,
    sum(Sales_Amount) as Total_Revenue
from ecommerce_sales 
group by Customer_ID
order by Total_Revenue desc;

/** Top Custonmer **/
select 
	Customer_ID,
    Count(Distinct Order_ID) as Total_Orders,
    sum(Sales_Amount) as Total_Revenue
from ecommerce_sales
group by customer_ID
order by Total_Revenue desc
limit 10;

/** 4. Payment Analysis **/
/** Most Used Payment Mode **/
SELECT
    Payment_Mode,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM ecommerce_sales
GROUP BY Payment_Mode
ORDER BY Total_Orders DESC;

/** Revenue by Payment Mode **/
select
	Payment_Mode,
    sum(Sales_Amount) as Total_Revenue
from ecommerce_sales
group by Payment_Mode
order by Total_Revenue desc;

/** 5. Discount Analysis **/
/** Discount Brands **/
SELECT DISTINCT Discount
FROM ecommerce_sales
ORDER BY Discount;

SELECT
    CASE
        WHEN Discount BETWEEN 0.00 AND 0.10 THEN '0-10%'
        WHEN Discount > 0.10 AND Discount <= 0.20 THEN '11-20%'
        WHEN Discount > 0.20 AND Discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END AS Discount_Band
FROM ecommerce_sales;

/** Discount vs Sales **/
select 
	case
		when Discount < 0.10 then '0-10%'
        when Discount < 0.20 then '10-20%'
        when Discount < 0.30 then '20-30%'
        else '30%+'
	end as Discount_Band,
    count(distinct Order_ID) as Total_Orders,
    sum(Sales_Amount) as Total_Sales,
    sum(Profit) as Total_Profit
from ecommerce_sales
group by
	case
		when discount < 0.10 then '0-10%'
        when discount < 0.20 then '10-20%'
        when discount < 0.30 then '20-30%'
        else '30%+'
	end
order by Discount_Band;

/** Discount vs Profit **/
SELECT
    ROUND(Discount * 100, 0) AS Discount_Percent,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM ecommerce_sales
GROUP BY ROUND(Discount * 100, 0)
ORDER BY Discount_Percent;

/** Advanced SQL **/
/** CTE **/
WITH product_sales AS (
    SELECT
        Product_Category,
        Product_Name,
        SUM(Sales_Amount) AS Total_Sales
    FROM ecommerce_sales
    GROUP BY
        Product_Category,
        Product_Name
),
ranked_products AS (
    SELECT
        Product_Category,
        Product_Name,
        Total_Sales,
        ROW_NUMBER() OVER (
            PARTITION BY Product_Category
            ORDER BY Total_Sales DESC
        ) AS Product_Rank
    FROM product_sales
)

SELECT *
FROM ranked_products
WHERE Product_Rank <= 3
ORDER BY
    Product_Category,
    Product_Rank;
    
/** RANK **/
select
	state,
    sum(Sales_Amount) as Total_Sales,
    rank() over(
		order by sum(Sales_Amount) desc
	) as Sales_Rank
from ecommerce_sales
group by state;

/** DENSE_RANK **/
select
	state,
    sum(Sales_Amount) as Total_Sales,
    dense_rank() Over (
		order by sum(Sales_Amount) desc
	) As Sales_Rank
from ecommerce_sales
group by state;

/** ROW_NUMBER **/
select
	state, 
    sum(Sales_Amount) as Total_Sales,
    row_number() over (
		Order by sum(Sales_Amount) desc
	) as Sales_rank
from ecommerce_sales
group by state;

/** Subquery **/
select
	Product_Name,
    sum(Sales_Amount) as Total_Sales
from ecommerce_sales
group by Product_Name
having sum(Sales_Amount) > (
	select avg(Product_Sales)
    from (
		select
			Product_Name,
            sum(Sales_Amount) as Product_Sales
		from ecommerce_sales
        group by Product_Name
	) as Product_Summary
)
order by Total_Sales desc;

/** View **/
CREATE VIEW category_performance AS
SELECT
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    ROUND(
        SUM(Profit) / SUM(Sales_Amount) * 100,
        2
    ) AS Profit_Margin
FROM ecommerce_sales
GROUP BY Product_Category;

SELECT *
FROM category_performance;
