-- Taller de Desarrollo web
--PRESENTADO POR: EDGAR ANDRES DELGADO CASTELLANO y  DIEGO MORENO
-- TALLER # 2 DESARROLLO WEB
-- DESARROLLO WEB
-- FECHA: 20 DE OCTUBRE 2018
--VERSION # 1


--1 Mostrar la lista de todos los clientes cuya área designada en metros cuadrados sea mayor o igual a 100.
--****************************************************************************************************
use consumoelectrico;

select * from clientes
where Metros>=100;

--****************************************************************************************************
--****************************************************************************************************


-- 2 Mostrar las provincias cuyo nombre empieza por la letra M con todos sus datos.
--****************************************************************************************************

SELECT * FROM PROVINCIAS
WHERE PROVINCIA LIKE ('M%');

--****************************************************************************************************
--****************************************************************************************************

--3.Mostrar todas aquellas poblaciones (con todos sus datos) con una población entre 1000 y 2500 habitantes, organizadas de forma descendente por cantidad de habitantes.
--****************************************************************************************************

SELECT * FROM POBLACIONES 
WHERE HABITANTES >=1000 AND HABITANTES <=2500
ORDER BY HABITANTES DESC;

--****************************************************************************************************
--****************************************************************************************************


-- 4.Considerando la nueva tabla, muestre todas las PQR de los clientes cuyo nombre empieza por la letra A, mostrando el nombre, apellido del cliente, dirección de calle, fecha y solicitud o asunto de la PQR.

-- CREAMOS LA TABLA DE PQR
--****************************************************************************************************

DROP TABLE IF EXISTS `pqr`;

CREATE TABLE `pqr` 
(
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asunto` varchar(300) NOT NULL,
  `detalle` varchar(300) NOT NULL,
  `fecha` date NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Filtros para la tabla `pqr`
--************************************
--
ALTER TABLE `pqr`
  ADD CONSTRAINT `id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`Codigo`);
COMMIT;


-- FILTRAMOS LA INFORMACION QUE ESTAMOS BUSCANDO
--*************************************

SELECT Nombre,Apellido,Calle,fecha,asunto
from consumoelectrico.`clientes`,consumoelectrico.`pqr`
WHERE clientes.`Nombre` LIKE ('A%');

--****************************************************************************************************
--****************************************************************************************************


-- 5. Mostrar la información de las provincias y poblaciones, 
--cuyo nombre de población empiece por la misma letra del nombre de provincia.
--****************************************************************************************************

select distinct * from PROVINCIAS inner join POBLACIONES on substring(PROVINCIAS.Provincia,1,1)= substring(POBLACIONES.Poblacion,1,1)
order by PROVINCIAS.Provincia desc



--****************************************************************************************************