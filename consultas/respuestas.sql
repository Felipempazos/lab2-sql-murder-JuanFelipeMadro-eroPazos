

-- Query 1: explorar las tablas de la base de datos

SELECT name
FROM sqlite_master
WHERE type = 'table';

-- Query 2: buscar el reporte del asesinato

SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City';
