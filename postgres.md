
plt

psql -U postgres -W
VER LOS COMANDOS \ DE POSTGRES
\?
LISTAR TODAS LAS BASES DE DATOS
\l
VER LAS TABLAS DE UNA BASE DE DATOS
\dt
CAMBIAR A OTRA BD
\c nombre_BD
DESCRIBIR UNA TABLA
\d nombre_tabla
VER TODOS LOS COMANDOS SQL
\h
VER COMO SE EJECTUTA UN COMANDO SQL
\h nombre_de_la_funcion
CANCELAR TODO LO QUE HAY EN PANTALLA
Ctrl + C
VER LA VERSION DE POSTGRES INSTALADA, IMPORTANTE PONER EL ';'
SELECT version();
VOLVER A EJECUTAR LA FUNCION REALIADA ANTERIORMENTE
\g
INICIALIZAR EL CONTADOR DE TIEMPO PARA QUE LA CONSOLA TE DIGA EN CADA EJECUCION ¿CUANTO DEMORO EN EJECUTAR ESA FUNCION?
\timing
LIMPIAR PANTALLA DE LA CONSOLA PSQL
Ctrl + L
 \! cls

 Diego z-notes frcsds pnal

\dt
\d <tableName>



  docker exec -it postgres_golang_crud_api /bin/bash   entrando por terminal si tomo los cambios

  psql -h localhost -p 5432 -U postgres -d e_commerce \pset format aligned

  docker exec -it postgres_golang_crud_api psql -U postgres -d e_commerce
