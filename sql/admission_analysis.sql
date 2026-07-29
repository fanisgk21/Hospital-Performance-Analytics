-- ==================================================
-- SECTION 2: ADMISSION ANALYSIS
-- ==================================================

-- Query 6: Admissions by Type
/*poses eisagwges gia kathe typo eisagwghs kai vlepoume poios typos einai syxnoteros*/
SELECT
    admission_type,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_type
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 7: Admissions by Insurance
/*omadopoiei tis eisagwges ana asfalistiko forea*/
SELECT
    insurance,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY insurance
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 8: Admissions by Race
/*metraei tis eisagwges ana kathgoria race kai mathainoume th dimosionomiki katagrafi twn eisagvgvn*/
SELECT
    race,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY race
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 9: Admissions by Marital Status
/*omadopoiei tis eisagwges ana oikogeneiaki katastasi*/
SELECT
    marital_status,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY marital_status
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 10: Admissions by Admission Location
/*metraei apo pou irthe kathe asthenis kai mathainoume thn syxnoteri phgh eisagwgis*/
SELECT
    admission_location,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY admission_location
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 11: Admissions by Discharge Location
/*pou phgan oi astheneis meta to exitirio*/
SELECT
    discharge_location,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY discharge_location
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 12: Admissions by Language
/*eisagwges ana glwssa tou asthenous*/
SELECT
    language,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY language
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 13: Admissions by Emergency Status
/*elegxos gia to an yparxei wra katagrafis sta epeigonta, 1=perase apo ta epeigonta*/
SELECT
    edregtime IS NOT NULL AS emergency_case,
    COUNT(*) AS total_admissions
FROM admissions
GROUP BY emergency_case;


-- ==================================================

-- Query 14: Average Length of Stay (days)
/*ypologizei th mesh diarkeia noshleias se meres
dischtime-> hmer exodou se arithmo
admittima-> hmer eisagwghs se arithmo
avg-> m.o
round 2->stroggylopoihsh sta dyo dekadika*/
SELECT
    ROUND(AVG(julianday(dischtime) - julianday(admittime)), 2) AS average_length_of_stay_days
FROM admissions;

-- ==================================================

-- Query 15: Top 10 Longest Hospital Stays
/*mono tis 10 prwtew se diarkeia kathe noshleias kai taksinomhsh apo megalyterh prow mikroterh*/
SELECT
    subject_id,
    hadm_id,
    ROUND(julianday(dischtime) - julianday(admittime), 2) AS length_of_stay_days
FROM admissions
ORDER BY length_of_stay_days DESC
LIMIT 10;