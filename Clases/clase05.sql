----------------------------------- Particularidades de MySQL --------------------------------------------

-- Comentarios:
/* esto es un comentario */

select * from personas
/* where apellido = 'Maradona'; */

-- Concaternar campos en una consulta select

select apellido, nombre from personas;
select concat(apellido, ' ', nombre) from personas;

-- Sentencia DISTINCT
-- se utiliza para eliminar duplicados del conjunto de resultados
-- solo se puede utilizar con sentencias SELECT

select patente from autos;
select distinct(patente) from autos;

-- otra forma de hacer esto es con la sentencia group by:
select distinct(patente) from autos;
select patente from autos group by patente;
-- dan el mismo resultado, pero hay una que es mucho mas rapida que la otra.

-- la ventaja de group by es la de poder agregar funciones de agregacion (sin 5)
-- en cambio con distinct() no se puede (si se puede pero no va a mostrar la info pedida)


-- sentencia CASE:

select producto, precio, "rango de precios" = 
case
    when precio = 0 then 'Produto free'
    when precio < 50 then 'menos a 50'
    when precio >= 50 and precio < 250 then 'entre 50 y 250'
    when precio >= 250 and precio < 1000 then 'entre 250 y 1000'
    else 'mayor a 1000'
end
from productos

-- sentencia LIMIT:
-- no esta en el estandard de SQL
-- sirve para limitar los resultados de una consulta
-- limitar las filas de los resultados de una consulta
-- limit desde, hasta
-- utilidad -> paginar los resultados

select nombre, apellido from personas
order by nombre limit 0,5

select nombre, apellido from personas
order by nombre limit 6, 10


-- Exportar / importar
-- exportar los archivos de la base de datos con las sentencias SQL para crear las tablas e insertar los datos.


----------------------------------- Funciones de Fecha  --------------------------------------------
-- day, month, year
day(date), month(date), year(date)
-- devuelve un entero que representa el dia de la fecha especificada

select day(fecha), fecha
from ventas

select month(fecha), fecha
from ventas

select year(fecha), fecha
from ventas

-- datepart(partedefecha, fecha)
-- retorna la parte especifica de una fecha, el año, el trimestr, dia, hora, etc.
-- los valores para partedefecha pueden ser: year, quarter, month, day, week, hour, minute, second, milisecond

select datepart(month, getdate())   -- retorna el mes actual
select datepart(day, getdate())     -- retorna el dia actual
select datepart(hour, getdate())    -- retorna la hora actual

-- datename(partedefecha, fecha)
-- retorna el nombre de una parte especifica de una fecha.
-- los valores para partedefecha pueden ser los mismos que se explicaton anteriormente

select datename(month, getdate())

-- datediff(partedelafecha, fecha1, fecha2)
-- calcula el intervalo de tiempo (segun el primer argumento) entre las 2 fecha.
-- el resultado es un valor entero que corresponde a fecha2-fecha1
-- los valores de partedela fecha pueden ser los mismos que se especificaron anteriormente

select datediff(day, '2005/10/28', '2006/10/28')    -- retorna 365 dias
select datediff(month, '2005/10/28', '2006/11/29')    -- retorna 13 meses
-- OBS: en alguna version de MySQL puede que no funcione el primer parametro.


-----------------------------------  Clientes  --------------------------------------------
-- XAMPP

-- WORKBENCH

-- CONSOLA: mysql -h localhost -u root -p
/* 
    -h :: indicar que trabajo sobre local host      -> localhost
    -u :: usuario                                   -> root (el usuario root es de MySQL)
    -p :: path
*/

/*
    Sentencias:
     
show databases;
use practica4;

*/
