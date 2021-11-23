-- Practico N. 4
-- Alumnos: Juan Cruz Mateos, Noelia Echeverria, Sebastian Bengoa

-- 1- Mostrar las reparaciones mayores de $1000
select descripcion, importe, fecha_entrada, fecha_salida
from reparaciones 
where importe > 1000;

-- 2- Mostrar las reparaciones comprendidas en el primer semestre de 2020
select descripcion, importe, fecha_entrada, fecha_salida
from reparaciones
where year(fecha_entrada) = 2020 and month(fecha_entrada) between 1 and 6;
-- otra opcion: where fecha_entrada between '2020-01-01' and '2020-06-30';

-- 3- Mostrar el total facturado en cada mes
select monthname(fecha_entrada) as mes, sum(importe) as 'total facturado'
from reparaciones
group by month(fecha_entrada);
-- otra opcion:
-- select month(fecha_entrada) as mes, sum(importe) as 'total facturado'
-- from reparaciones
-- group by mes;

-- 4- Mostrar la cantidad de reparaciones de cada mecánico
select nombre, apellido, count(*) as 'cant rep'
from mecanicos m inner join reparaciones r on m.pk_mecanico = r.fk_mecanico
group by apellido;

-- 5- Mostrar la cantidad de reparaciones de cada marca
select marca, count(*) as 'cant rep'
from automotores a inner join reparaciones r on a.pk_automotor = r.fk_automotor
inner join marcas m on a.fk_marca = m.pk_marca
group by marca;

-- 6- Mostrar las 3 reparaciones que más tiempo tardaron
select fecha_entrada, fecha_salida, descripcion, datediff(fecha_salida, fecha_entrada) as dias
from reparaciones 
order by dias desc
limit 3;

-- 7- Borrar las reparaciones menores a $100
delete from reparaciones
where importe < 100;

-- 8- Incrementar el importe de las reparaciones en un 10%, solo de aquellas que son de tipo camión.
update reparaciones r
inner join automotores a on r.fk_automotor = a.pk_automotor
inner join tipos t on a.fk_tipo = t.pk_tipo
set importe = importe * 1.1
where tipo like("%camion%");

-- 9- De cada mecánico, mostrar apellido, nombre, cantidad de reparaciones e importe total de reparaciones
select nombre, apellido, count(*) as 'cant. rep', sum(importe) as 'importe total'
from mecanicos m inner join reparaciones r on m.pk_mecanico = r.fk_mecanico
group by apellido;

-- 10- Mostrar los automotores que son de la marca Peugeot, Renault o Fiat
select patente, marca, tipo
from automotores a inner join marcas m on a.fk_marca = m.pk_marca
inner join tipos t on a.fk_tipo = t.pk_tipo
where marca like '%Peugeot%' or marca like '%Renault%' or marca like '&Fiat&';
-- WHERE marca='Peugeot' or marca="'Renault'" or marca='Fiat';
-- otra opcion mas facil de mantener: 
-- where marca in ('Peugeot', 'Renault', 'Fiat');

-- 11- Mostrar los mecánicos que realizaron mas de 3 reparaciones
select nombre, apellido, count(*) as 'cant. rep.'
from mecanicos m inner join reparaciones r on m.pk_mecanico = r.fk_mecanico
group by apellido having count(*) > 3;
