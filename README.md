# 📊 Blinkit Sales Analysis | Power BI & SQL

## 📌 Project Overview
This project focuses on analyzing **Blinkit’s sales performance, customer ratings, and outlet distribution** using **SQL for data preparation** and **Power BI for visualization**.

The objective is to convert raw grocery sales data into **meaningful business insights** that help understand sales trends, customer preferences, and outlet-level performance.

This is a **practical, real-world analytics case study**, designed with business requirements in mind rather than just visuals.

---

## 🎯 Business Requirements
The analysis was built to answer the following business questions:

- How is Blinkit performing in terms of overall sales?
- Which product categories and fat content types drive more revenue?
- How do outlet size, location, and establishment year impact sales?
- What outlet types deliver better customer ratings and item movement?

---

## 📈 Key KPIs
The dashboard tracks the following core metrics:

- **Total Sales** – Overall revenue generated from all items  
- **Average Sales** – Average revenue per transaction  
- **Number of Items** – Total items sold  
- **Average Rating** – Average customer rating  

---

## 🛠 Tools & Technologies
- **SQL (MySQL)** – Data loading, cleaning, transformation, and aggregation  
- **Power BI** – Data modeling, DAX measures, and interactive dashboards  
- **CSV Dataset** – Source data  
- **GitHub** – Project documentation and version control  

---

## 🧹 Data Cleaning & Preparation (SQL)
Data cleaning was a critical step in this project to ensure accuracy and consistency.

Key actions performed:
- Standardized `item_fat_content` values  
  - `LF` → `Low Fat`  
  - `reg` → `Regular`
- Converted text fields into proper numeric data types
- Handled missing and invalid values
- Created a final cleaned table (`blinkit_final`) for analysis

This process ensured reliable KPIs and correct aggregations in Power BI.

---

## 📊 Analysis Performed
### 1. Total Sales by Fat Content
Analyzed how **Low Fat vs Regular** products contribute to overall sales and other KPIs.

### 2. Total Sales by Item Type
Identified top-performing product categories and low-performing segments.

### 3. Fat Content by Outlet Location
Compared sales contribution of fat content across **Tier 1, Tier 2, and Tier 3 outlets**.

### 4. Sales by Outlet Establishment Year
Evaluated how the outlet’s establishment year impacts total sales.

### 5. Percentage of Sales by Outlet Size
Analyzed the relationship between **outlet size** and sales contribution.

### 6. Sales by Outlet Location
Compared geographic sales performance across outlet tiers.

### 7. All KPIs by Outlet Type
Provided a combined view of:
- Total Sales  
- Average Sales  
- Number of Items  
- Average Rating  

---

## 📷 Dashboard
The Power BI dashboard includes:
- KPI cards for quick performance tracking
- Category-wise and outlet-wise sales breakdown
- Trend analysis by outlet establishment year
- Interactive slicers for outlet size, location, and item type

Dashboard screenshots and presentation files are included in this repository.

---

## 📂 Repository Structure

├── PowerBI_Dashboard.pbix

├── Blinkit_Analysis_Presentation.pptx

├── SQL_Query_Documentation.sql

├── Dataset/

│ └── BlinkIT_Grocery_Data.csv

├── Screenshots/

│ └── Dashboard.png

└── README.md


---

## 💡 Key Insights
- Low Fat products contribute a higher share of total sales
- Tier 3 outlets generate the highest revenue
- Medium-sized outlets outperform small and large outlets
- Fruits & Vegetables and Snacks are top-selling categories
- Older outlets show stable sales performance

---

## 🚀 Business Value
This dashboard helps stakeholders to:
- Identify high-performing products and outlets
- Improve inventory and assortment planning
- Focus marketing efforts on high-revenue segments
- Support data-driven business decisions

---

## 👤 About Me
I am a **Data Analytics professional with 6+ years of experience**, transitioning into a **Power BI / Data Analyst role**.  
This project reflects my hands-on skills in **SQL, data modeling, KPI analysis, and business storytelling**.

---

⭐ If you find this project useful, feel free to star the repository.
