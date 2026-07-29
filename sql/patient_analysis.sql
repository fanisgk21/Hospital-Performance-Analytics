-- ==================================================
-- SECTION 3: PATIENT ANALYSIS
-- ==================================================

-- Query 16: Total Male and Female Patients
/*metraei posoi astheneis yparxoun gia kathe fylo, xwrizei toys astheneis se omades, emfanizei prvto to fylo me tous perissoterous astheneis*/
SELECT
    gender,
    COUNT(*) AS total_patients
FROM patients
GROUP BY gender
ORDER BY total_patients DESC;

-- ==================================================

-- Query 17: Average Patient Age
/*ypologizei m.o hlikias*/
SELECT
    ROUND(AVG(anchor_age), 2) AS average_age
FROM patients;

-- ==================================================

-- Query 18: Youngest and Oldest Patient
/*psaxnei max kai min hlikia*/
SELECT
    MIN(anchor_age) AS youngest_patient,
    MAX(anchor_age) AS oldest_patient
FROM patients;

-- ==================================================

-- Query 19: Patients by Age Group
/*xwrizei tis ilikies se omades kai metra posoi yparxoun se kathe category*/
SELECT
    CASE
        WHEN anchor_age < 18 THEN '0-17'
        WHEN anchor_age BETWEEN 18 AND 39 THEN '18-39'
        WHEN anchor_age BETWEEN 40 AND 59 THEN '40-59'
        WHEN anchor_age BETWEEN 60 AND 79 THEN '60-79'
        ELSE '80+'
    END AS age_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY age_group
ORDER BY age_group;

-- ==================================================

-- Query 20: Patients Aged 65 and Older
/*metraei astheneis pou einai anw twn 65*/
SELECT
    COUNT(*) AS patients_over_65
FROM patients
WHERE anchor_age >= 65;

-- ==================================================

-- Query 21: Patients Younger than 18
/*metraei astheneis pou einai katw twn 18*/
SELECT
    COUNT(*) AS patients_under_18
FROM patients
WHERE anchor_age < 18;

-- ==================================================

-- Query 22: Average Age by Gender
/*ypologizei mesh hlikia ksexwrista gia M kai F*/
SELECT
    gender,
    ROUND(AVG(anchor_age),2) AS average_age
FROM patients
GROUP BY gender;

-- ==================================================

-- Query 23: Number of Patients by Anchor Year Group
/*metraei posoi astheneis yparxoun se kathe xronikh omada*/
SELECT
    anchor_year_group,
    COUNT(*) AS total_patients
FROM patients
GROUP BY anchor_year_group
ORDER BY anchor_year_group;

-- ==================================================

-- Query 24: Number of Patients by Anchor Year
/*posoi antistoixoun se kathe anchor_year*/
SELECT
    anchor_year,
    COUNT(*) AS total_patients
FROM patients
GROUP BY anchor_year
ORDER BY anchor_year;

-- ==================================================

-- Query 25: Patients Ordered by Age (Oldest First)
/*emfanizei olous tous astheneis apo ton megalytero pros ton mikrotero*/
SELECT
    subject_id,
    gender,
    anchor_age
FROM patients
ORDER BY anchor_age DESC;