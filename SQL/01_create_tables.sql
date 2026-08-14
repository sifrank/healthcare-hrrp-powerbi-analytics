-- ============================================================
-- Healthcare Hospital Readmissions Analytics
-- SQL Server Data Preparation
-- ============================================================

USE HealthcareAnalytics;
GO

-- Raw staging table
CREATE TABLE dbo.HRRP_Raw
(
    Facility_Name NVARCHAR(255),
    State NVARCHAR(50),
    Measure_Name NVARCHAR(255),
    Number_of_Discharges NVARCHAR(50),
    Number_of_Readmissions NVARCHAR(50),
    Facility_ID NVARCHAR(50),
    Footnote NVARCHAR(50),
    Excess_Readmission_Rate NVARCHAR(50),
    Predicted_Readmission_Rate NVARCHAR(50),
    Expected_Readmission_Rate NVARCHAR(50),
    Start_Date NVARCHAR(50),
    End_Date NVARCHAR(50)
);
