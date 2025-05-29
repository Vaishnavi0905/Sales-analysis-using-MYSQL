CREATE DATABASE COMPANY;
USE COMPANY;

-- 1 find all order shipped via 'Economy'mode with a total amount greater than 25000r
SELECT * FROM SALES
WHERE Ship_mode='Economy' AND Total_amount>25000;

-- 2 Retrieve all sales data form 'Technology'category in 'Ireland' made after 2020-01-01.
select * from sales
where Category ='Technology' and Country='Ireland' and Order_Date >'2020-01-01';

-- 3 List the top 10 most profitable sales transactions in descending order.
select * from sales
Order by Unit_Profit desc limit 10,20; -- skip 10 records,showing next 20 records 

-- 4 Find all customer whose name starts with 'J' and ends with 'n'.
select Order_ID , Customer_Name from sales    
where Customer_Name like 'J%N';

-- 5 Retrieve all product names that contain 'Acco' anywhere in the name.
select Order_ID , Product_Name from sales 
where Product_Name like '%Acco%';

-- 6 Get the top 5 cities with the highest total sales amount
select City,sum(Total_Amount) as Total_Sales from sales
group by city
order by Total_Sales desc 
limit 5;

-- 7 Display the second set of 10 recordsnforcustomer_name and total_amount in desc order
select Customer_Name,Total_Amount from sales
order by Total_Amount desc limit 10,10;

-- 8 Find the total revenue ,average unit cost, and total number of orders.
select sum(Total_Amount) as 'total revenue' ,avg(Unit_Cost) as 'average unit cost', count(Order_ID) as 'total number of order' from sales;

-- 9 Count unique number of regions
select  count(distinct Region) as ' unique number of regions' from sales ;

-- 10 find the number of orders placed by each customer.
select Customer_Name,count(Order_ID) as 'no of orders' from sales    
group by Customer_Name 
order by 'no of orders';

-- 11 rank 5 products based on total sales using RANK().
select Product_Name, sum(Total_Amount) as 'total sales' ,rank() over (order by sum(Total_Amount) desc) as 'sales rank' from sales
group by Product_Name limit 5;


