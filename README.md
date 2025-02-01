# 🍕 Pizza Sales Analysis (SQL + Excel)

## 📌 Project Overview
This project analyzes pizza sales data using **SQL for data extraction** and **Excel for dashboard visualization**. The goal is to uncover key business insights, identify sales trends, and provide actionable recommendations.

## 📂 Database Schema
The project uses the following tables:
- **pizza_sales**: Contains order details (order_id, pizza_type, quantity, unit_price, etc.)
- **customers**: Stores customer details (customer_id, name, location, etc.)
- **orders**: Stores order information (order_id, order_date, order_time)

## 🔍 Key Insights & Analysis
### 📊 **SQL-Based Analysis**
✅ **Total Revenue:** `$69,793`  
✅ **Total Orders:** `1,845`  
✅ **Total Pizzas Sold:** `4,232`  
✅ **Average Pizza per Order:** `2.29`

### 🔥 **Trends & Business Insights**
- **Peak Sales Days:** Weekends (**Friday & Saturday**)
- **Busiest Time:** **12-1 PM** (highest orders)
- **Best-Selling Category:** **Classic & Medium-sized pizzas** generate the highest revenue
- **Top-Selling Pizza:** The **Barbecue Chicken Pizza**
- **Lowest-Selling Pizza:** The **Brie Carre Pizza**

## 📜 SQL Queries Used
### **1️⃣ Total Revenue Calculation**
```sql
SELECT ROUND(SUM(quantity * unit_price), 2) AS total_revenue FROM pizza_sales;
```
### **2️⃣ Daily Sales Trend**
```sql
SELECT FORMAT(order_date, 'dddd') AS order_day, COUNT(DISTINCT order_id) AS order_count
FROM pizza_sales
GROUP BY FORMAT(order_date, 'dddd');
```
### **3️⃣ Best-Selling Pizza Category**
```sql
SELECT pizza_category, SUM(quantity) AS total_sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY total_sold DESC;
```
### **4️⃣ Hourly Sales Trend**
```sql
SELECT DATEPART(HOUR, order_time) AS order_hour, COUNT(order_id) AS hourly_orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY order_hour;
```

## 📊 Excel Dashboard Features
✔ **KPIs:** Net Revenue, Total Orders, Average Order Value  
✔ **Visualizations:** Bar charts, Pie charts, Line graphs  
✔ **Filters:** Order Date, Pizza Category, Order Type  

## 🛠 Technologies Used
- **SQL (MS SQL Server)** for data extraction
- **Excel (Pivot Tables & Charts)** for visualization
- **Power Query** for data cleaning

## 📌 Future Enhancements
- ✅ Add **profitability analysis** (profit margins, cost analysis)
- ✅ Implement **customer segmentation** (repeat vs. new customers)
- ✅ Enhance **interactive filters** in Excel


---
📢 *Feedback & contributions are welcome!* 🚀
