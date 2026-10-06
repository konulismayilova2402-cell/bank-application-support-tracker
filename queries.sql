-- Bank Application Support Incident Tracker
-- SQL Analysis Queries


-- 1. Show all incidents
SELECT *
FROM incidents;


-- 2. Show incidents with application names
SELECT
    i.incident_id,
    a.application_name,
    i.priority,
    i.status,
    i.incident_date,
    i.description
FROM incidents i
JOIN applications a
    ON i.application_id = a.application_id;


-- 3. Count incidents by application
SELECT
    a.application_name,
    COUNT(i.incident_id) AS incident_count
FROM applications a
LEFT JOIN incidents i
    ON a.application_id = i.application_id
GROUP BY a.application_name
ORDER BY incident_count DESC;


-- 4. Find high and critical priority incidents
SELECT
    incident_id,
    priority,
    status,
    description
FROM incidents
WHERE priority IN ('High', 'Critical')
ORDER BY priority;


-- 5. Show all open incidents
SELECT
    i.incident_id,
    a.application_name,
    i.priority,
    i.incident_date,
    i.description
FROM incidents i
JOIN applications a
    ON i.application_id = a.application_id
WHERE i.status = 'Open'
ORDER BY i.incident_date DESC;


-- 6. Count incidents by priority
SELECT
    priority,
    COUNT(*) AS incident_count
FROM incidents
GROUP BY priority
ORDER BY incident_count DESC;


-- 7. Count incidents by department
SELECT
    d.department_name,
    COUNT(i.incident_id) AS incident_count
FROM departments d
JOIN applications a
    ON d.department_id = a.department_id
LEFT JOIN incidents i
    ON a.application_id = i.application_id
GROUP BY d.department_name
ORDER BY incident_count DESC;


-- 8. Find critical applications
SELECT
    application_name,
    criticality
FROM applications
WHERE criticality = 'Critical';


-- 9. Find applications with more than one incident
SELECT
    a.application_name,
    COUNT(i.incident_id) AS incident_count
FROM applications a
JOIN incidents i
    ON a.application_id = i.application_id
GROUP BY a.application_name
HAVING COUNT(i.incident_id) > 1
ORDER BY incident_count DESC;


-- 10. Show unresolved incidents
SELECT
    i.incident_id,
    a.application_name,
    i.priority,
    i.status,
    i.description
FROM incidents i
JOIN applications a
    ON i.application_id = a.application_id
WHERE i.resolution_date IS NULL
ORDER BY i.priority DESC;
