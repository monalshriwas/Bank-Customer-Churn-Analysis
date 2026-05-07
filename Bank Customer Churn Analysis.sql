create database bank_churn_db;
use bank_churn_db;

create table bank_churn_data(
customer_id INT PRIMARY KEY,
credit_score INT,
country VARCHAR(50),
gender VARCHAR(20),
age INT,
tenure INT,
balance float,
products_number INT,
credit_card INT,
active_member INT,
estimated_salary FLOAT,
churn INT,
age_group VARCHAR(20),
balance_category VARCHAR(20),
active_status VARCHAR(20),
salary_band VARCHAR(20),
churn_label VARCHAR(20)
);

select count(*) from bank_churn_data;

rename table bank_churn_data to churn_customers;

-- TOTAL CUSTOMERS 

-- CHURN RATE %

select round(avg(churn) *100,2) as churn_rate from churn_customers;

select
count(*) as total,
sum(churn) as churned
from churn_customers;

-- TOTAL CUSTOMER BY COUNTRY 
select country,count(customer_id) as total_customers
from churn_customers
group by country
order by count(customer_id) desc;

-- CHURN ANALYSIS BY COUNTRY  
select country, count(customer_id) as total_customers,
sum(churn) as total_churn,
round(avg(churn)*100,2) as churn_rate
from churn_customers
group by country 
order by round(avg(churn)*100,2) desc;

-- CHURN BY ACTIVE STATUS

select active_status,
count(*) as total_customers,
round(avg(churn)*100,2) as churn_rate
from churn_customers
group by active_status;

-- BALANCE IMPACT ON CHURN

select balance_category,
count(*) as total_customers,
round(avg(churn)*100,2) as churn_rate
from churn_customers
group by balance_category
order by round(avg(churn)*100,2) desc;

-- TOP RISK SEGMENT

select country, gender,
round(avg(churn)*100,2) AS churn_rate
from churn_customers
group by country, gender
order by churn_rate desc; 

-- RETENTION RATE 

select ROUND((1-avg(churn))*100,2) as retention_rate
from churn_customers;

-- Average Balance of Churned vs Retained
 
select churn_label,
round(avg(balance),2) as avg_balance
from churn_customers
group by churn_label;

-- Product Engagement KPI

select products_number,
count(*) as total_customers,
sum(churn) as churned_customers,
round(avg(churn)*100,2) as churn_rate
from churn_customers
group by products_number
order by products_number;


-- CHURN RISK BY AGE
select age_group,
round(avg(churn)*100,2) as churn_rate
from churn_customers
group by age_group
order by round(avg(churn)*100,2) desc;






