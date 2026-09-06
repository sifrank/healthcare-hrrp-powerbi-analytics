-- ============================================================
-- HRRP Data Cleaning and Transformation
-- ============================================================

USE HealthcareAnalytics;
GO

CREATE TABLE dbo.HRRP_Clean
(
    Facility_Name NVARCHAR(255),
    State NVARCHAR(50),
    Measure_Name NVARCHAR(255),
    Number_of_Discharges INT NULL,
    Number_of_Readmissions INT NULL,
    Facility_ID INT NULL,
    Footnote NVARCHAR(50) NULL,
    Excess_Readmission_Rate DECIMAL(10,4) NULL,
    Predicted_Readmission_Rate DECIMAL(10,4) NULL,
    Expected_Readmission_Rate DECIMAL(10,4) NULL,
    Start_Date DATE NULL,
    End_Date DATE NULL
);

INSERT INTO dbo.HRRP_Clean
(
    Facility_Name,
    State,
    Measure_Name,
    Number_of_Discharges,
    Number_of_Readmissions,
    Facility_ID,
    Footnote,
    Excess_Readmission_Rate,
    Predicted_Readmission_Rate,
    Expected_Readmission_Rate,
    Start_Date,
    End_Date
)
SELECT
    NULLIF(LTRIM(RTRIM(Facility_Name)), ''),
    NULLIF(LTRIM(RTRIM(State)), ''),
    NULLIF(LTRIM(RTRIM(Measure_Name)), ''),
    TRY_CONVERT(INT, NULLIF(Number_of_Discharges, 'N/A')),
    TRY_CONVERT(INT, NULLIF(Number_of_Readmissions, 'N/A')),
    TRY_CONVERT(INT, Facility_ID),
    NULLIF(LTRIM(RTRIM(Footnote)), ''),
    TRY_CONVERT(DECIMAL(10,4), NULLIF(Excess_Readmission_Rate, 'N/A')),
    TRY_CONVERT(DECIMAL(10,4), NULLIF(Predicted_Readmission_Rate, 'N/A')),
    TRY_CONVERT(DECIMAL(10,4), NULLIF(Expected_Readmission_Rate, 'N/A')),
    TRY_CONVERT(DATE, Start_Date),
    TRY_CONVERT(DATE, End_Date)
FROM dbo.HRRP_Raw;

ALTER TABLE dbo.HRRP_Clean
ADD Reporting_Period VARCHAR(20);

UPDATE dbo.HRRP_Clean
SET Reporting_Period =
    CASE
        WHEN Start_Date IS NOT NULL
         AND End_Date IS NOT NULL
        THEN CONCAT(YEAR(Start_Date), ' - ', YEAR(End_Date))
        ELSE NULL
    END;
