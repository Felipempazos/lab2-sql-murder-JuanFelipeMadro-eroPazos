

-- Query 1: explorar las tablas de la base de datos

SELECT name
FROM sqlite_master
WHERE type = 'table';

-- Query 2: buscar el reporte del asesinato

SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City';

-- Query 3: buscar y encontrar la ultima casa de Northwestern Dr

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

-- Query 4: entrevista de Morty Schapiro

SELECT *
FROM interview
WHERE person_id = 14887;

-- Query 5: buscar posibles sospechosos del gym

SELECT *
FROM get_fit_now_member
WHERE membership_status = 'gold'
AND id LIKE '48%';

-- Query 6: buscar por placa y conectar con personas

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

SELECT *
FROM person
WHERE license_id IN (183779, 423327, 664760);