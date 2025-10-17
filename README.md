# HR Analytics using SQL

A structured SQL-based HR data analysis project designed to calculate key employee metrics, analyze attrition trends, and extract workforce insights for decision-making and dashboard integration.

---

## ✅ Short Description / Purpose

This project uses SQL to analyze employee attrition, demographics, and job satisfaction. The goal is to calculate HR KPIs directly from raw data and prepare analytical outputs for reporting and dashboarding in Power BI or Excel.

---

## 🛠 Tech Stack

The project was built using:

- 🗄️ SQL (MySQL / PostgreSQL / SQL Server)
- 🧾 DML & Aggregations
- 🧠 CASE Statements & Grouping
- 📊 Window Functions (optional for analysis)
- 📁 .sql Files for scripts
- 🔗 (Optional) Export for BI tools such as Power BI or Excel

---

## 📂 Data Source

**Table Name:** `hr_data`

Contains fields such as:
- employee_id  
- age  
- gender  
- department  
- job_role  
- marital_status  
- attrition  
- monthly_income  
- education  
- education_field  
- job_satisfaction  
- age_band  

---

## ⭐ Features & Highlights

### 🔹 Business Problem  
HR teams lacked clear metrics for monitoring attrition, employee demographics, and department-level performance.

### 🔹 Goal of the Project  
Use SQL to generate accurate HR insights, calculate core KPIs, and support visualization through structured queries.

### 🔹 Key SQL Queries & KPIs

```sql
-- 1. Total Employees
SELECT COUNT(*) AS total_employees FROM hr_data;

-- 2. Attrition Count
SELECT COUNT(*) AS attrition_count
FROM hr_data
WHERE attrition = 'Yes';

-- 3. Attrition Rate
SELECT 
    ROUND(
        (SUM(CASE WHEN attrition = 'Yes' THEN 1 END) * 100.0) / COUNT(*), 
    2) AS attrition_rate
FROM hr_data;

-- 4. Active Employees
SELECT COUNT(*) AS active_employees
FROM hr_data
WHERE attrition = 'No';

-- 5. Average Age
SELECT ROUND(AVG(age), 0) AS average_age
FROM hr_data;
