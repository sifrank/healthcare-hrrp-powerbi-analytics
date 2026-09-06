USE HealthcareAnalytics;
GO

-- ============================================================
-- HRRP Healthcare Analytics
-- 03_analysis_queries.sql
-- Purpose: Analyze hospital readmission performance
-- ============================================================


-- 1. Overall dataset summary
SELECT
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Facility_ID) AS Unique_Hospitals,
    COUNT(DISTINCT State) AS States_Represented,
    COUNT(DISTINCT Measure_Name) AS Readmission_Measures
FROM dbo.HRRP_Clean;


-- 2. Average excess readmission rate by state
SELECT
    State,
    COUNT(*) AS Measure_Records,
    AVG(Excess_Readmission_Rate) AS Avg_Excess_Readmission_Rate
FROM dbo.HRRP_Clean
WHERE Excess_Readmission_Rate IS NOT NULL
GROUP BY State
ORDER BY Avg_Excess_Readmission_Rate DESC;


-- 3. Hospitals with the highest excess readmission rates
SELECT TOP 20
    Facility_Name,
    State,
    Measure_Name,
    Number_of_Discharges,
    Number_of_Readmissions,
    Excess_Readmission_Rate
FROM dbo.HRRP_Clean
WHERE Excess_Readmission_Rate IS NOT NULL
ORDER BY Excess_Readmission_Rate DESC;


-- 4. Readmission performance by condition/measure
SELECT
    Measure_Name,
    COUNT(*) AS Hospital_Measure_Records,
    AVG(Number_of_Discharges) AS Avg_Discharges,
    AVG(Number_of_Readmissions) AS Avg_Readmissions,
    AVG(Excess_Readmission_Rate) AS Avg_Excess_Readmission_Rate
FROM dbo.HRRP_Clean
GROUP BY Measure_Name
ORDER BY Avg_Excess_Readmission_Rate DESC;


-- 5. Compare predicted vs. expected readmission rates
SELECT
    Measure_Name,
    AVG(Predicted_Readmission_Rate) AS Avg_Predicted_Rate,
    AVG(Expected_Readmission_Rate) AS Avg_Expected_Rate,
    AVG(Predicted_Readmission_Rate - Expected_Readmission_Rate)
        AS Avg_Rate_Difference
FROM dbo.HRRP_Clean
WHERE Predicted_Readmission_Rate IS NOT NULL
  AND Expected_Readmission_Rate IS NOT NULL
GROUP BY Measure_Name
ORDER BY Avg_Rate_Difference DESC;


-- 6. Reporting period summary
SELECT
    Reporting_Period,
    COUNT(*) AS Total_Records,
    COUNT(DISTINCT Facility_ID) AS Unique_Hospitals,
    AVG(Excess_Readmission_Rate) AS Avg_Excess_Readmission_Rate
FROM dbo.HRRP_Clean
GROUP BY Reporting_Period
ORDER BY Reporting_Period;
