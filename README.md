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
