create database company;
select * from Sales;
use company
select  COUNT
   FROM Sales ;

--- 1.Find all orders shipped via 'econmoy' mode with total amount greater than 25000
select * from Sales
where Ship_Mode='Economy' and Total_Amount>25000;

--- 2.Retrieve all sales data for 'technology' category in 'Ireland' made after 2020-01-01

SELECT 
    *
FROM
    Sales
WHERE
    Category = 'Technology'
        AND country = 'Ireland'
        AND Order_Date > '2020-01-01';
        
---3. liat the top most profitable sales transacctions in descending order

select * from Sales
order by Unit_Profit desc
limit 10;

SELECT 
    Customer_Name, Order_id
FROM
    Sales
WHERE
    Customer_Name LIKE 'j%N';

--- 5. Retrieve all product names that contain 'acco' anywhere in the name. 
SELECT 
    Product_Name, Order_id
FROM
    Sales
WHERE
    Product_Name LIKE '%Acco%';
    
--- 6. Get the top 5 cities with the highest total sales amount.

SELECT 
    SUM(Total_Amount) AS total_sales, City
FROM
    Sales
GROUP BY City
ORDER BY total_sales DESC
LIMIT 5;


--- 7. Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order.

select Customer_Name , Total_Amount from Sales
order by Total_Amount desc
limit 10,10;

--- 8.find the total revenue ,average unit cost, and total number of orders.

SELECT 
    SUM(Total_amount) AS `Total Revenue`,
    AVG(Unit_Cost) AS `avg unit cost`,
    COUNT(Order_id) AS `Total no of orders`
FROM
    sales; 
    
 -- 9. count the unique no.of regions. --

select count(distinct(Region))  as `no of regions` from Sales;

-- 10. find the no of orders placed by easch customer--
select Customer_Name,count(Order_id) as `Order_count`
from sales
group by Customer_Name
Order by  Order_count desc;

-- 11 Rank 5 products based on total sales using rank()
-- 4 types of rank function 1.row, 2.rank, 3. dense rank 4. entile--

select Product_Name,sum(Total_Amount) as Total_sales,
rank() over(order by sum(Total_Amount) desc) as Sales_rank
from Sales
group by Product_Name
limit 5;
  






