-- ==================================================
-- SECTION 5: JOIN ANALYSIS & KPIs
-- ==================================================

-- Query 36: Patient Gender by Admission Type
/*enwnei tous pinakes patients kai admissions mesw subject_id 
kai metraei poses eisagwges eginan ana gender kai admission type,
mathainw poio admission type einai syxnotero gia F kai M*/
SELECT
    p.gender,
    a.admission_type,
    COUNT(*) AS total_admissions
FROM patients p
JOIN admissions a
ON p.subject_id = a.subject_id
GROUP BY p.gender, a.admission_type
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 37: Average Age by Admission Type
/*ypologizei mesh hlikia gia admission type kai mathainw poio afora megalyterous h neoterous astheneis*/
SELECT
    a.admission_type,
    ROUND(AVG(p.anchor_age),2) AS average_age
FROM patients p
JOIN admissions a
ON p.subject_id = a.subject_id
GROUP BY a.admission_type
ORDER BY average_age DESC;

-- ==================================================

-- Query 38: Average Length of Stay by Admission Type
/*mesh diarkeia noshleias gia kathe admission type, mathainw poioi typoi eisagwgwn lead to bigger stay at hospital*/
SELECT
    admission_type,
    ROUND(AVG(julianday(dischtime)-julianday(admittime)),2) AS average_stay_days
FROM admissions
GROUP BY admission_type
ORDER BY average_stay_days DESC;

-- ==================================================

-- Query 39: Average Length of Stay by Insurance
/*mesh diarkeia noshleias ana asfalistiko forea, mathainw an yparxoun diafores sth diarkeia noshleias analoga me thn asfalish*/
SELECT
    insurance,
    ROUND(AVG(julianday(dischtime)-julianday(admittime)),2) AS average_stay_days
FROM admissions
GROUP BY insurance
ORDER BY average_stay_days DESC;

-- ==================================================

-- Query 40: Average Patient Age by Current Service
/*enwnei patients kai services kai ypologizei mesh hlikia asthenvn se kathe ypiresia,
mathainw poies ypiresies eksipiretoun mainly older or younger patients*/
SELECT
    s.curr_service,
    ROUND(AVG(p.anchor_age),2) AS average_age
FROM patients p
JOIN services s
ON p.subject_id = s.subject_id
GROUP BY s.curr_service
ORDER BY average_age DESC;

-- ==================================================

-- Query 41: Number of Male and Female Patients per Service
/*metraei F kai M se kathe ypiresia ksexwrista*/
SELECT
    s.curr_service,
    p.gender,
    COUNT(*) AS total_patients
FROM patients p
JOIN services s
ON p.subject_id = s.subject_id
GROUP BY s.curr_service, p.gender
ORDER BY s.curr_service;

-- ==================================================

-- Query 42: Admissions by Service
/*metraei poses monadikes eisagwges antistoixoun se kathe service,
hadm_id o munique arithmos mias noshleias, mathainw poies ypiresies dexontai tis perissoteres noshleies*/
SELECT
    s.curr_service,
    COUNT(DISTINCT a.hadm_id) AS total_admissions
FROM admissions a
JOIN services s
ON a.hadm_id = s.hadm_id
GROUP BY s.curr_service
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 43: Average Age by Insurance
/*ypologizei mesh hlikia ana service, mathainw poia services eksipiretoun older or youngr patients*/
SELECT
    a.insurance,
    ROUND(AVG(p.anchor_age),2) AS average_age
FROM patients p
JOIN admissions a
ON p.subject_id = a.subject_id
GROUP BY a.insurance
ORDER BY average_age DESC;

-- ==================================================

-- Query 44: Average Age by Race
/*mathainw an yparxoun diafores sth mesh hlikia metaksy twn dimografikwn omadwn tou dataset*/
SELECT
    a.race,
    ROUND(AVG(p.anchor_age),2) AS average_age
FROM patients p
JOIN admissions a
ON p.subject_id = a.subject_id
GROUP BY a.race
ORDER BY average_age DESC;

-- ==================================================

-- Query 45: Complete Hospital Summary
/*synolikoi astheneis, admissions, services, avg age, avg length of stay
mia synolikh eikona toy nosokomeiou*/
SELECT
    COUNT(DISTINCT p.subject_id) AS total_patients,
    COUNT(DISTINCT a.hadm_id) AS total_admissions,
    COUNT(DISTINCT s.curr_service) AS total_services,
    ROUND(AVG(p.anchor_age),2) AS average_age,
    ROUND(AVG(julianday(a.dischtime)-julianday(a.admittime)),2) AS average_length_of_stay
FROM patients p
JOIN admissions a
ON p.subject_id = a.subject_id
JOIN services s
ON a.hadm_id = s.hadm_id;