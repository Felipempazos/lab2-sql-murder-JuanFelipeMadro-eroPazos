# lab2-sql-murder-JuanFelipeMadro-eroPazos## Paso 1
Query 1

Antes de empezar con el misterio quise ver primero que tablas habia en la base de datos. Basicamente era como mirar el mapa del juego antes de empezar a explorar.

Para eso se usa esta consulta:

SELECT name
    FROM sqlite_master
   WHERE type = 'table';

Con eso aparecieron varias tablas. Algunas ya dan pistas solo por el nombre. Pero la que mas llama la atencion desde el principio es `crime_scene_report`.
### Evidencia1

![Resultado de la consulta](evidencia/paso1_tablasDisponibles.png)


## Query 2

Después de ver las tablas me fui directo a `crime_scene_report`.

El caso dice que el asesinato pasó el **15 de enero de 2018 en SQL City**, así que filtré justo ese día para ver qué encontraba.

SELECT *
FROM crime_scene_report
WHERE date = 20180115
AND city = 'SQL City';

AAparecen varios reportes de ese día, pero uno es el del asesinato. En la descripción dicen que hay dos testigos: uno vive en la última casa de **Northwestern Dr** y el otro es **Annabel**, que vive en **Franklin Ave**.

Con eso ya hay por dónde empezar a buscar.

### Evidencia

![Reporte del crimen](evidencia/paso2_reporteCrimen.png)