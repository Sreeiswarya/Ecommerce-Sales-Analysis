describe ecommerce_sales;

select *
from ecommerce_sales;

/** Check total rows **/
select count(*) as total_rows
from ecommerce_sales;

/** Check duplicate Order IDs **/
Select
order_ID,
count(*) as duplicate_count
from ecommerce_sales
group by Order_ID
having count(*) > 1;

/** Check NULL values **/
select
	sum(Order_ID is null) as OrderID_Null,
    sum(Order_Date is null) as OrderDate_Null,
	sum(Customer_ID is null) as CustomerID_Null,
    sum(Product_Category is null) as Category_Null,
    sum(Product_Name is Null) as Product_Null,
    sum(State is Null) as State_Null,
    sum(City is Null) as City_Null,
    sum(Payment_Mode is Null) as Payment_Null,
    sum(Quantity is null) as Quantity_Null,
    sum(Sales_Amount is null) as Sales_Null,
    sum(Discount is null) as Discount_Null,
    sum(Profit is null) as Profit_Null
    From ecommerce_sales;
    
/** Check Blank Values 
Product_Name **/
select count(*)
from ecommerce_sales
where trim(Product_Name) = '';

/** Customer_ID **/
select count(*)
from ecommerce_sales
where trim(Customer_ID) = '';

/** Product_Category **/
select count(*)
from ecommerce_sales
where trim(Product_Category) = '';

/** State **/
select count(*)
from ecommerce_sales
where trim(State) = '';

/** City **/
select count(*)
from ecommerce_sales
where trim(City) = '';

/** Payment_Mode **/
select count(*)
from ecommerce_sales
where trim(Payment_Mode) = '';

/** Remove Extra Spaces
State **/
update ecommerce_sales
set State = trim(State);

/** City **/
update ecommerce_sales
set City = trim(City);

/** Product_Name **/
update ecommerce_sales
set Product_Name = trim(Product_Name);

/** Product_Category **/
update ecommerce_sales
set Product_Category = trim(Product_Category);

/** Payment_Mode **/
update ecommerce_sales
set Payment_Mode = trim(Payment_Mode);

/** Customer_ID **/
update ecommerce_sales
set Customer_ID = trim(Customer_ID);

/** Validate Numeric Columns **/
select
min(Quantity),
max(Quantity),
min(Sales_Amount),
max(Sales_Amount),
min(Discount),
max(Discount),
min(Profit),
max(Profit)
from ecommerce_sales;

select Order_Date
from ecommerce_sales
limit 10;

UPDATE ecommerce_sales
SET Order_Date = STR_TO_DATE(Order_Date, '%d-%m-%Y');

ALTER TABLE ecommerce_sales
MODIFY COLUMN Order_Date DATE;

SELECT Order_Date
FROM ecommerce_sales
WHERE STR_TO_DATE(Order_Date, '%d-%m-%Y') IS NULL;