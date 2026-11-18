# Sales Analysis: MySQL & Power BI

An end-to-end data analysis project that takes raw AdventureWorks data, cleans and models it with **MySQL**, and turns it into an interactive **Power BI** sales dashboard to answer a real-style business request.

---

## Table of Contents

- [Overview](#overview)
- [Tools & Technologies](#tools--technologies)
- [Setup](#setup)
- [Business Request & User Stories](#business-request--user-stories)
- [Data Cleaning with SQL (MySQL)](#data-cleaning-with-sql-mysql)
- [Power BI Dashboard](#power-bi-dashboard)
- [Dashboard Preview](#dashboard-preview)
- [Skills Demonstrated](#skills-demonstrated)

---

## Overview

This project simulates a typical analyst workflow:

1. Receive a business request and user stories.
2. Identify the relevant tables in the data warehouse.
3. Clean and transform the data using MySQL.
4. Build a data model and dashboard in Power BI.
5. Deliver insights that stakeholders can explore interactively.

The analysis focuses on **sales performance** across products, customers, time and geography, including a comparison against **budget**.

## Tools & Technologies

| Tool | Purpose |
|------|---------|
| MySQL Server | Hosting the AdventureWorks data and running SQL queries |
| MySQL Workbench | Importing data and writing queries |
| MySQL Connector/NET | Connecting Power BI Desktop to MySQL |
| Power BI Desktop | Data modelling, DAX measures and dashboard design |

## Setup

1. **Install** MySQL Server, MySQL Workbench, MySQL Connector/NET and Power BI Desktop.
2. **Get the data.** Download the AdventureWorks sample data from the [Microsoft instructions](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15&tabs=ssms). You will work with two versions:
   - **Data Warehouse (DW)**: structured, analysis-ready data (the primary source in this project).
   - **Lightweight (LT)**: a simplified transactional-style dataset.
3. **Load it into MySQL.** The official AdventureWorks backups are SQL Server `.bak` files, which MySQL cannot restore directly. Restore them in SQL Server once, export the needed tables to CSV, then import them into MySQL with Workbench's *Table Data Import Wizard* (or `LOAD DATA INFILE`).
4. **Compare DW vs. LT** to understand the difference between structured (warehouse) and unstructured/transactional data.
5. **Apply the DW data update** from this [SQL script](https://github.com/techtalkcorner/SampleDemoFiles/blob/master/Database/AdventureWorks/Update_AdventureWorksDW_Data.sql). It is written for SQL Server, so adapt it to MySQL syntax or apply it before exporting.

## Business Request & User Stories

Before writing any code, review the sample **business request**, **demand overview** and the **filled-out user stories**. These define:

- The problem the analysis is meant to solve.
- What the stakeholders consider a successful solution.
- The tables, metrics and visuals the dashboard needs.

## Data Cleaning with SQL (MySQL)

**Key concepts**

- Difference between **FACT** tables (measurable events such as sales) and **Dimension** tables (descriptive context such as products, customers, dates).
- Using the business request to pick out only the tables and columns that matter.

**Techniques used to prepare and transform the data**

- Renaming columns with aliases for clarity
- Combining columns (e.g. `CONCAT(FirstName, ' ', LastName)`)
- Commenting and consistent formatting of SQL statements
- `WHERE` clause for filtering
- `ORDER BY` for sorting
- `LEFT JOIN` to combine fact and dimension tables
- `CASE` expressions for conditional logic
- `IFNULL()` / `COALESCE()` for handling missing values

The cleaned query results are then loaded into Power BI through the MySQL connector.

## Power BI Dashboard

Steps followed to build the report:

1. Load data
2. Organize and prepare tables
3. Connect tables to build the data model
4. Import `Fact_Budget`
5. Create calculation measures (DAX)
6. Design the dashboard layout
7. Import a custom visual
8. Create a dedicated measure table
9. Build the visuals:
   - Pie chart
   - Line chart
   - Bar charts
   - Map graph
   - Top 10 graphs
   - Gradient bar chart colouring
   - Customer details
   - Pivot table

## Skills Demonstrated

- Translating business requirements into analysis deliverables
- Understanding data warehouse structure (fact vs. dimension tables)
- Writing clean, well-documented MySQL queries
- Data modelling and relationships in Power BI
- Creating DAX measures and budget-vs-actual comparisons
- Dashboard design and data storytelling
