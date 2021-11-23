-- 1. Mostrar los productos vendidos el día 21/04/2021
select producto 
from ventas inner join productos on ventas.idproducto = productos.idproducto
where fecha = '2021-04-21';

select idproducto.productos, producto 
from ventas inner join productos on ventas.idproducto = productos.idproducto
where fecha = '2021-04-21';

-- 2. Mostrar todas las ventas realizadas a personas con sexo=F
select fecha, cantidad
from ventas v inner join personas p on v.idpersona = p.idproducto
where sexo = 'F';

select fecha, cantidad, nombre, apellido
from ventas v inner join personas p on v.idpersona = p.idproducto
where sexo = 'F';

select fecha, cantidad, nombre, apellido, producto
from ventas v inner join personas p on v.idpersona = p.idproducto
inner join productos pr on pr.idproducto = v.idproducto
where sexo = 'F';

-- select fecha,cantidad,nombre,apellido,producto from ventas v inner join personas p on v.idpersona=p.idpersona inner join productos pr on pr.idproducto=v.idproducto where sexo='F'

-- 3. Mostrar todas las ventas realizadas a personas que viven en Mar del Plata
select fecha, cantidad
from ventas v inner join personas p on v.idpersona = p.idpersona
inner join ciudades c on c.idciudad = p.idciudad
where ciudad = 'Mar del Plata';

select fecha, cantidad, nombre, apellido
from ventas v inner join personas p on v.idpersona = p.idpersona
inner join ciudades c on c.idciudad = p.idciudad
where ciudad = 'Mar del Plata';


-- cantidad de ventas en cada ciudad
select ciudad, count(*) 
from ventas v inner join personas p on v.idpersona = p.idpersona
inner join ciudades c on c.idciudad = p.idciudad
group by ciudad 
-- having count(*) > 5


-- 4. Mostrar la cantidad de ventas realizadas a personas que viven en Mar del Plata
select *
from ventas v inner join productos p on v.idproducto = p.idproducto
where precio > 1000

select fecha, cantidad, producto, precio, cantidad*precio as total
from ventas inner join productos on ventas.idproducto = productos.idproducto
where precio > 100


-- 5. Mostrar las ventas que superaron los 1000 pesos
