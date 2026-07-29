-- ==================================================
-- SECTION 4: SERVICE ANALYSIS
-- ==================================================

-- Query 26: Total Records per Current Service
/*metraei poses fores emfanizetai kathe ypiresia kai mathainoume poies ypiresies xrhsimopoioyntai perissotero*/
SELECT
    curr_service,
    COUNT(*) AS total_records
FROM services
GROUP BY curr_service
ORDER BY total_records DESC;

-- ==================================================

-- Query 27: Total Records per Previous Service
/*apo poia ypiresia proilthan oi astheneis prin metakinhthoun*/
SELECT
    prev_service,
    COUNT(*) AS total_records
FROM services
GROUP BY prev_service
ORDER BY total_records DESC;

-- ==================================================

-- Query 28: Service Transfers
/*metraei kathe syndyasmo, prev ypiresia-> trexousa ypiresia*/
SELECT
    prev_service,
    curr_service,
    COUNT(*) AS total_transfers
FROM services
GROUP BY prev_service, curr_service
ORDER BY total_transfers DESC;

-- ==================================================

-- Query 29: Patients per Current Service
/*metraei unique astheneis ana ypiresia, 
distinct an enas patient emfanizetai 3 fores sthn idia ypiresia tha metrhthei 1 fora,
mathainoyme posous diaf astheneis eksipiretei kathe ypiresia*/
SELECT
    curr_service,
    COUNT(DISTINCT subject_id) AS total_patients
FROM services
GROUP BY curr_service
ORDER BY total_patients DESC;

-- ==================================================

-- Query 30: Admissions per Current Service
/*metraei unique eisagwges ana ypiresia, 
enas patient mporei na exei perissoteres apo 1 eisagwges*/
SELECT
    curr_service,
    COUNT(DISTINCT hadm_id) AS total_admissions
FROM services
GROUP BY curr_service
ORDER BY total_admissions DESC;

-- ==================================================

-- Query 31: Patients Who Changed Service
/*posoi metakinithikan apo mia service sthn allh*/
SELECT
    COUNT(DISTINCT subject_id) AS patients_changed_service
FROM services
WHERE prev_service <> curr_service;

-- ==================================================

-- Query 32: Number of Service Changes
/*poses metakinhseis eginan overall*/
SELECT
    COUNT(*) AS total_service_changes
FROM services
WHERE prev_service <> curr_service;

-- ==================================================

-- Query 33: Most Common Service Transition
/*mono oi 10 prwtes syxnes metakinhseis metaksy twn ypiresiwn*/
SELECT
    prev_service,
    curr_service,
    COUNT(*) AS total
FROM services
WHERE prev_service <> curr_service
GROUP BY prev_service, curr_service
ORDER BY total DESC
LIMIT 10;

-- ==================================================

-- Query 34: Current Services (Alphabetically)
SELECT DISTINCT
/*oles oi diaforetikes trexouses ypiresies se alfabhtikh seira*/
    curr_service
FROM services
ORDER BY curr_service;

-- ==================================================

-- Query 35: Previous Services (Alphabetically)
/*oles oi diaforetikes prev ypiresies se alfabhtikh seira*/
SELECT DISTINCT
    prev_service
FROM services
ORDER BY prev_service;