-----------------------------------  Consultas multitabla --------------------------------------------

------------------------------------ Union el WHERE o FROM -------------------------------------------
-- en where -> hace union entre las tablas y se queda con los campos que corresponden
select * from maquinas m, salas s 
where m.idsala = s.idsala

-- en from -> hace interseccion en las tablas y se queda con los campos que le corresponden
--   mejor -> mas eficiente
select * 
from maquinas m inner join salas s on m.idsala = s.idsala

------------------------------------- Orden de las tablas -------------------------------------------
-- forma 1: 
select * from maquinas m inner join salas s on m.idsala = s.idsala

-- forma2:
select * from salas s inner join maquinas m on s.idsala = m.idsala

-- -> colocar la tabla mas chica a izquierda y la mas pesada a derecha
-- -> depende el motor (como lee las sentencias)  MySQL ->  chica: izquierda, grande: derecha
--                                               Oracle -> grande: izquierda,  chica: derecha

------------------------------------- GROUP BY -------------------------------------------------------

select * from vehiculos group by marca

select marca, count(*) from vehiculos group by marca
-- count (*) aplica al grupo

-- HAVING -> filtro para los grupos
-- trabaja de la misma forma que la sentencia where ( sirve para filtrar las filas )
--> having 
select marca, count(*) from vehiculos group by marca having count(*) > 3
