-- ==================================================
-- Hospital Performance Analytics
-- SQL Queries
-- ==================================================

-- Query 1: Total Patients
SELECT COUNT(*) AS total_patients
FROM patients;
/*100*/
-- ==================================================

-- Query 2: Total Admissions
SELECT COUNT(*) AS total_admissions
FROM admissions;
/*275*/
-- ==================================================

-- Query 3: Unique Patients
SELECT COUNT(DISTINCT SUBJECT_ID) AS unique_patients
FROM admissions;
/*100*/

-- ==================================================

-- Query 4: Total Services
/*poses diaforetikes ypiresies yparxoyn*/
SELECT COUNT(DISTINCT CURR_SERVICE) AS total_services
FROM services;
/*13*/

-- ==================================================

-- Query 5: Admissions per Service
/*poies ypiresies exoyn tis perissoteres eggrafes*/
SELECT
    CURR_SERVICE,
    COUNT(*) AS total
FROM services
GROUP BY CURR_SERVICE
ORDER BY total DESC;