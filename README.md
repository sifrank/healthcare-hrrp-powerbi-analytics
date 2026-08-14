Healthcare Hospital Readmissions Analytics

Tools: SQL Server | T-SQL | Power Query | DAX | Power BI

Overview

This project analyzes hospital readmission performance using CMS Hospital Readmissions Reduction Program (HRRP) data.

The project demonstrates an end-to-end analytics workflow from raw healthcare data through SQL transformation, Power Query ETL, DAX measures, and interactive Power BI reporting.

Data Pipeline
CMS HRRP Data
      ↓
SQL Server Staging
      ↓
SQL Data Cleaning & Transformation
      ↓
Power Query
      ↓
Power BI Data Model
      ↓
DAX Measures
      ↓
Interactive Dashboard
SQL
Created a raw staging table
Converted raw text fields to appropriate numeric/date types
Handled N/A values using NULLIF() and TRY_CONVERT()
Cleaned text using LTRIM() and RTRIM()
Created reporting-period logic
Maintained separation between raw and cleaned data
Power Query
Created standardized Condition column
Performed additional data transformations
Validated data types
Power BI

Coming soon:

Executive KPI dashboard
Hospital performance analysis
Condition-level analysis
State-level comparisons
Reporting-period trends
Skills Demonstrated

SQL: T-SQL, data cleaning, staging tables, data transformation
Power BI: Data modeling, DAX, dashboard design
Power Query: ETL and transformation
Healthcare Analytics: Hospital readmissions, utilization, quality metrics
