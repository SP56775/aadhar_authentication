CREATE DATABASE aadhar_db;
SELECT * FROM aadhar_dataset;
-- 1. Time-Based Trends (Monthly total authentication)
SELECT 
    date,
    SUM(age_0_5 + age_5_17 +age_18_greater) AS total_authentication
FROM aadhar_dataset
GROUP BY date
ORDER BY date;
-- 2. Age Group Comparison
SELECT 
   SUM(age_0_5) AS total_age_0_5,
   SUM(age_5_17) AS total_age_5_17,
   SUM(age_18_greater) AS totalage_18_greater
FROM aadhar_dataset

-- 3. Demographic vs Biometric Comparison (Age 5–17)
SELECT
   SUM(demo_age_5_17) AS total_demo_age_5_17,
   SUM(bio_age_5_17) AS total_bio_age_5_17
FROM aadhar_dataset;
   

-- 4. Demographic vs Biometric Comparison (Age 18+)

SELECT 
    SUM(demo_age_17_) 
FROM aadhar_dataset;

-- 5. District-Wise Highest Authentication
SELECT district, SUM(age_0_5 + age_5_17 +age_18_greater) AS total_authentication
     FROM aadhar_dataset
GROUP BY district
ORDER BY total_authentication DESC;

-- 6. State-Wise Authentication Comparison
Select state_standardized,
       SUM(age_0_5 + age_5_17 +age_18_greater) AS total_authentication
FROM aadhar_dataset
GROUP BY state_standardized
ORDER BY total_authentication DESC;

-- 7. Pincode-Based Analysis
Select pincode,
       SUM(age_0_5 + age_5_17 +age_18_greater) AS total_authentication
FROM aadhar_dataset
GROUP BY pincode
ORDER BY total_authentication DESC;

-- 8. Identify Outliers / Very High Authentication Districts
Select district,
       SUM(age_0_5 + age_5_17 +age_18_greater) AS total_authentication
FROM aadhar_dataset
GROUP BY district
HAVING total_authentication > 10
ORDER BY total_authentication DESC;

-- 8. Biometric Ratio Analysis

SELECT 
    district,
    SUM(bio_age_5_17 + bio_age_17_) AS total_biometric,
    SUM(demo_age_5_17 + demo_age_17_ + bio_age_5_17 + bio_age_17_) AS total_auth,
    (SUM(bio_age_5_17 + bio_age_17_) * 100.0 /
     SUM(demo_age_5_17 + demo_age_17_ + bio_age_5_17 + bio_age_17_)) AS biometric_ratio_percent
FROM aadhar_dataset
GROUP BY district
ORDER BY biometric_ratio_percent DESC;

SELECT 
    CORR(demo_age_5_17, bio_age_5_17) AS corr_demo_bio_5_17
FROM aadhar_dataset;


