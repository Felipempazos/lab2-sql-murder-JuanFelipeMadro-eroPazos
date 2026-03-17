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

## Query 3

La pista decía “última casa de Northwestern Dr”, pero pues no decía el número, así que tocó buscar quién vive en esa calle.

SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC;

Ordené de mayor a menor para no ponerme a revisar todo uno por uno. El primero que sale es Morty Schapiro, así que ese debe ser el testigo.

### Evidencia

![Testigo Northwestern](evidencia/paso3_testigo.png)

## Query 4

Ya con el testigo, tocaba ver qué había visto.

SELECT *
FROM interview
WHERE person_id = 14887;

El tipo dice que escuchó el disparo y vio a alguien salir corriendo. Lo interesante es que menciona varias cosas:

- llevaba una bolsa de gimnasio “Get Fit Now”
- el número de socio empezaba por 482
- era miembro gold
- y se fue en un carro con una placa que tenía "H42W"

Con eso ya hay varias pistas para seguir buscando.

### Evidencia

![Entrevista Morty](evidencia/paso4_entrevista_morty.png)

## Query 5

Con lo que dijo el testigo, probé buscar en los miembros del gimnasio.

Primero intenté con los que empezaran por 48 y fueran gold.

SELECT *
FROM get_fit_now_member
WHERE membership_status = 'gold'
AND id LIKE '48%';

Ahí aparecieron dos personas: Joe Germuska y Jeremy Bowers. Entonces uno de ellos debería ser el sospechoso.

### Evidencia

![Miembros gym](evidencia/paso5_gymSospechosos.png)

## Query 6

Con la pista de la placa que tenía "H42W", busqué en las licencias a ver qué carros coincidían.

SELECT *
FROM drivers_license
WHERE plate_number LIKE '%H42W%';

Aparecieron tres opciones, así que tocó cruzar eso con la tabla `person` usando los license_id para ver quiénes eran.

SELECT *
FROM person
WHERE license_id IN (183779, 423327, 664760);

Con eso ya salen las personas reales, y ahí se puede ver cuál coincide con lo del gimnasio y las otras pistas.

### Evidencia

![Busqueda y Cruce con personas](evidencia/paso6_personasPlaca.png)

## Resultado final

Al cruzar la información del carro con los datos del gimnasio, solo una persona coincide con todas las pistas.

Esa persona es Jeremy Bowers, así que él es el asesino.

### Evidencia

![Asesino](evidencia/jeremy.png)