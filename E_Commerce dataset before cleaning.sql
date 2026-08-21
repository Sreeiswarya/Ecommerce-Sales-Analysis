create database ecommerce_sales_analysis;

Use ecommerce_sales_analysis;

select * from ecommerce_sales_analysis;

show tables;

select *
from `ecommerce dataset`;

RENAME TABLE `ecommerce dataset`
TO ecommerce_sales;

select * 
from ecommerce_sales;

ALTER TABLE ecommerce_sales
CHANGE COLUMN `ï»¿Order_ID` Order_ID VARCHAR(50);

DESCRIBE ecommerce_sales;

alter table ecommerce_sales
modify column Customer_ID varchar(50);

alter table ecommerce_sales
modify column Product_Category varchar(100);

alter table ecommerce_sales
modify column Product_Name varchar(255);

alter table ecommerce_sales
modify column State varchar(100);

alter table ecommerce_sales
modify column City varchar(100);

alter table ecommerce_sales
modify column Payment_Mode varchar(50);

alter table ecommerce_sales
modify column Sales_Amount decimal(10,2);

alter table ecommerce_sales
modify column Discount decimal(10,2);

alter table ecommerce_sales
modify column Profit decimal(10,2);

describe ecommerce_sales;