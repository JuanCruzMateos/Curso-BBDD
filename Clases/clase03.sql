-- Funciones de agregacion:

-- COUNT: devuelve nro totalnde filas que participan en una consulta
SELECT COUNT(*) AS cantidad FROM personas;
SELECT COUNT(*) AS mujeres FROM personas WHERE sexo = 'F';
SELECT COUNT(*) AS cantidad FROM personas WHERE dni > 10000000;


-- MIN: devuelve el valor minimo de un campo especificado
SELECT min(precio) FROM productos
SELECT min(precio) AS menor FROM productos
SELECT min(precio) FROM productos WHERE producto LIKE '%Azucar%';
-- si no hay Azucar no da error, da NULL
SELECT min(precio) FROM productos WHERE producto = 'Azucar';


-- MAX: devuelve el valor maximo de un campo especificado
SELECT max(precio) FROM productos


-- SUM: suma valores del campo especificado -> numerico
SELECT sum(cantidad) FROM ventas WHERE idproducto = 2;
SELECT sum(cantidad) AS cant FROM ventas WHERE idproducto = 2;
SELECT sum(cantidad) AS cant FROM ventas WHERE fecha = '2021-04-10';


-- AVG: devuelve el valor promedio sobre el campo especificado
SELECT avg(cantidad) AS cant FROM ventas WHERE idproducto = 2;
SELECT avg(cantidad) AS cant FROM ventas WHERE fecha = '2021-04-10';


-- Consultas Multitablas:

-- Asi repite resultados
SELECT nombre, apellido, ciudad FROM personas, ciudades;

-- clave foranea = clave primaria 
SELECT nombre, apellido, ciudad FROM personas, ciudades WHERE personas.idciudad = ciudades.idciudad;

-- utilizando alias para las tablas
-- clave foranea = clave primaria
SELECT nombre, apellido, ciudad FROM personas p, ciudades c WHERE p.idciudad = c.idciudad;


SELECT nombre, apellido, producto, cantidad 
FROM personas, productos, ventas
WHERE ventas.idpersona = personas.idpersona AND ventas.idproducto = productos.idproducto;


SELECT nombre, apellido, producto, cantidad, precio, precio*cantidad AS subtotal
FROM personas, productos, ventas
WHERE ventas.idpersona = personas.idpersona AND ventas.idproducto = productos.idproducto;


-- cuando se repiten
SELECT nombre, apellido, producto, cantidad, ventas.idproducto
FROM personas, productos, ventas
WHERE ventas.idpersona = personas.idpersona AND ventas.idproducto = productos.idproducto;
