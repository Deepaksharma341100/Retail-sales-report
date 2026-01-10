
use retail_sales;
select * 
from retail_sales.retail_sales_dataset;

#1. find the total number of observation 
select count(`Transaction ID`)  from  retail_sales_dataset;
#total obervation=1000

select * 
from retail_sales.retail_sales_dataset;

#2 Total amount by category 
select sum(`Total Amount`) as totalamount  , `Product Category`
from retail_sales.retail_sales_dataset
group by `Product Category`
order by totalamount desc;
#electronics shows highest sales and Beaty show low amount

#Total orders by category
select count(`Transaction ID`) as totalcount  , `Product Category`
from retail_sales.retail_sales_dataset
group by `Product Category`
order by totalcount desc;
#Clothing category is leading and Beauty is trailing in terms of total orders.

#Gender wise sum
select sum(`Total Amount`) as totalamount , Gender
from retail_sales.retail_sales_dataset
group by Gender
order by totalamount desc;
#female customer has more amount distribution than male

#Age wise sum of amount
SELECT
  CASE
    WHEN Age < 20 THEN 'Below 20'
    WHEN Age BETWEEN 20 AND 30 THEN '20-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    ELSE 'Above 50'
  END AS age_group,
  SUM(`Total Amount`) AS totalamount
FROM retail_sales_dataset
GROUP BY age_group
ORDER BY totalamount DESC
#age group above 
limit 3;

#Above 50	133310
#20-30	106860
#31-40	95950
#business recommendation - target above	 50 customers with premium products.
#offer discount to 20 to 30 age group
#loyalty program like spend 1000 earn 10 points use them for discount.

#age wise category distribution
SELECT 
  CASE
    WHEN Age < 20 THEN 'Below 20'
    WHEN Age BETWEEN 20 AND 30 THEN '20-30'
    WHEN Age BETWEEN 31 AND 40 THEN '31-40'
    WHEN Age BETWEEN 41 AND 50 THEN '41-50'
    ELSE 'Above 50'
  END AS age_group,
  `Product Category`,
  SUM(`Total Amount`) AS totalamount
FROM retail_sales_dataset
GROUP BY age_group, `Product Category`
ORDER BY age_group, totalamount DESC;

#20 to 30 shows category on clothing and Beauty
#30 t0 20 Beauty 
#above 50 electronics.

#sales trend over the time
SELECT 
  DATE(`Date`) AS sales_date,
  SUM(`Total Amount`) AS daily_sales
FROM retail_sales_dataset
GROUP BY sales_date
ORDER BY sales_date;

#month that has highest sales
SELECT 
  month(`Date`) AS sales_month,
  SUM(`Total Amount`) AS daily_sales
FROM retail_sales_dataset
GROUP BY sales_month
ORDER BY daily_sales  desc
#may month has highest sales then october near to diwali festival , jan and feb due to new year , december due to end of the year
limit 5;

#average order value 
select round(avg(`Total Amount`),2) as avg_value , `Product Category`
from retail_sales.retail_sales_dataset
group by `Product Category`
order by avg_value desc;
#Beauty has highest aov value because customer transactions are loss in this category but they buy premium product

#“I analyzed retail sales data using SQL to identify revenue drivers, customer demographics, 
#purchasing behavior, seasonal trends, and average order value. 
#The analysis revealed key customer segments and provided actionable business recommendations.”
