# 📊 Gravity Bookstore Data Warehouse Project

## 🚀 Overview
This project focuses on designing and implementing a **Data Warehouse solution** for the Gravity Bookstore database, a fictional retail bookstore system that manages books, customers, orders, and sales operations.

The main goal is to transform the operational relational database (3NF) into a **dimensional model** optimized for analytical processing and reporting.

---

## 🧱 Data Warehouse Design
The original transactional database was analyzed and converted into a **dimensional structure**, combining star and snowflake modeling approaches.

### Main Data Entities:
- Books and Authors information
- Customers and Addresses
- Orders and Order Status tracking
- Shipping and Location data

---

## ⚙️ Solution Implementation

### Data cleaning and transformation
- Handling NULL and missing values
- Relationship mapping between entities
### Created Tables:
- `Dim_Customer`
- `Dim_Address`
- `Dim_Book`
- `Dim_Date`
- `Dim_Time`
- `Dim_Status_History`
- `Fact_Books`
- Bridge tables (for many-to-many relationships)
<img width="1012" height="592" alt="image" src="https://github.com/user-attachments/assets/7735d0bb-d5c9-4f27-9cb4-efc8aae60cbd" />

  
### ETL Process (SSIS)
Loading cleaned and structured data into the Data Warehouse
Ensuring consistency across dimensions and fact tables


### OLAP Layer (SSAS)
An OLAP **Cube** was built using SSAS to enable analytical querying and multidimensional analysis over the warehouse data.

---

### Data Visualization

#### Excel (Basic Analysis)
- Pie chart showing total profit by country
- Bar chart showing total profit by quarters

#### Power BI (Basic First Version)
This is a **simple initial attempt** at visualization:
- Map visualization of profit by country
- Bar chart of country vs total profit

---

## 🏗️ Project Outcome
This project delivers a complete end-to-end data pipeline:

**Relational Database → ETL (SSIS) → Data Warehouse → OLAP Cube (SSAS) → Basic Visualization**

It demonstrates the ability to design and implement a structured analytical system from raw transactional data.

---

## 🛠️ Technologies Used
- SQL Server
- SSIS (ETL)
- SSAS (Cube Development)
- Excel (Basic Visualization)
- Power BI (Basic Dashboard)
- Visual Studio
