
## Consultas sobre una tabla

1. Listado con el código de oficina y la ciudad donde hay oficinas:

```sql
SELECT codigo_oficina, ciudad FROM oficina;

+----------------+----------------------+
| codigo_oficina | ciudad               |
+----------------+----------------------+
| BOS-USA        | Boston               |
| LON-UK         | Londres              |
| MAD-ES         | Madrid               |
| PAR-FR         | Paris                |
| SFC-USA        | San Francisco        |
| SYD-AU         | Sydney               |
| TAL-ES         | Talavera de la Reina |
| TOK-JP         | Tokyo                |
+----------------+----------------------+
8 rows in set (0,00 sec)
```

2. Listado con la ciudad y el teléfono de las oficinas de España:

```sql
SELECT o.ciudad, o.telefono
FROM oficina AS o
INNER JOIN direccion_oficina AS do ON o.codigo_oficina = do.codigo_oficina
WHERE do.pais = 'España';

+----------------------+----------------+
| ciudad               | telefono       |
+----------------------+----------------+
| Madrid               | +34 91 7514487 |
| Talavera de la Reina | +34 925 867231 |
+----------------------+----------------+
2 rows in set (0,01 sec)
```

3. Listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7:

```sql
SELECT nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_jefe = 7;

+---------+-----------+-----------+--------------------------+
| nombre  | apellido1 | apellido2 | email                    |
+---------+-----------+-----------+--------------------------+
| Mariano | López     | Murcia    | mlopez@jardineria.es     |
| Lucio   | Campoamor | Martín    | lcampoamor@jardineria.es |
| Hilario | Rodriguez | Huertas   | hrodriguez@jardineria.es |
+---------+-----------+-----------+--------------------------+
3 rows in set (0,02 sec)
```

4. Nombre del puesto, nombre, apellidos y email del jefe de la empresa:

```sql
SELECT puesto, nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_jefe IS NULL;

+------------------+--------+-----------+-----------+----------------------+
| puesto           | nombre | apellido1 | apellido2 | email                |
+------------------+--------+-----------+-----------+----------------------+
| Director General | Marcos | Magaña    | Perez     | marcos@jardineria.es |
+------------------+--------+-----------+-----------+----------------------+
1 row in set (0,02 sec)
```

5. Listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas:

```sql
SELECT nombre, apellido1, apellido2, puesto 
FROM empleado 
WHERE puesto != 'Representante Ventas';
+----------+------------+-----------+-----------------------+
| nombre   | apellido1  | apellido2 | puesto                |
+----------+------------+-----------+-----------------------+
| Marcos   | Magaña     | Perez     | Director General      |
| Ruben    | López      | Martinez  | Subdirector Marketing |
| Alberto  | Soria      | Carrasco  | Subdirector Ventas    |
| Maria    | Solís      | Jerez     | Secretaria            |
| Carlos   | Soria      | Jimenez   | Director Oficina      |
| Francois | Fignon     |           | Director Oficina      |
| Michael  | Bolton     |           | Director Oficina      |
| Hilary   | Washington |           | Director Oficina      |
| Nei      | Nishikori  |           | Director Oficina      |
| Amy      | Johnson    |           | Director Oficina      |
| Kevin    | Fallmer    |           | Director Oficina      |
+----------+------------+-----------+-----------------------+
11 rows in set (0,00 sec)
```

6. Listado con el nombre de los todos los clientes españoles:

```sql
Select c.nombre 
from cliente c 
inner join direccion_cliente as dc on c.codigo_cliente = dc.codigo_cliente 
where dc.pais = 'Spain';

+--------------------------------+
| nombre                         |
+--------------------------------+
| Lasas S.A.                     |
| Beragua                        |
| Club Golf Puerta del hierro    |
| Naturagua                      |
| DaraDistribuciones             |
| Madrileña de riegos            |
| Lasas S.A.                     |
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| Jardin de Flores               |
| Flores Marivi                  |
| Flowers, S.A                   |
| Naturajardin                   |
| Golf S.A.                      |
| Americh Golf Management SL     |
| Aloha                          |
| El Prat                        |
| Sotogrande                     |
| Vivero Humanes                 |
| Fuenla City                    |
| Jardines y Mansiones Cactus SL |
| Jardinerías Matías SL          |
| Agrojardin                     |
| Top Campo                      |
| Jardineria Sara                |
| Campohermoso                   |
| Flores S.L.                    |
+--------------------------------+
27 rows in set (0,01 sec)
```

7. Listado con los distintos estados por los que puede pasar un pedido:

```sql
SELECT DISTINCT estado FROM pedido

+-----------+
| estado    |
+-----------+
| Entregado |
| Rechazado |
| Pendiente |
+-----------+
3 rows in set (0,00 sec)
```

8. Código de cliente de aquellos clientes que realizaron algún pago en 2008:

```sql
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE YEAR(fecha_pago) = 2008;

+----------------+
| codigo_cliente |
+----------------+
|              1 |
|             13 |
|             14 |
|             26 |
+----------------+
4 rows in set (0,02 sec)
```

9. Código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo:

```sql
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega > fecha_esperada;

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|             9 |              1 | 2008-12-27     | 2008-12-28    |
|            13 |              7 | 2009-01-14     | 2009-01-15    |
|            16 |              7 | 2009-01-07     | 2009-01-15    |
|            17 |              7 | 2009-01-09     | 2009-01-11    |
|            18 |              9 | 2009-01-06     | 2009-01-07    |
|            22 |              9 | 2009-01-11     | 2009-01-13    |
|            28 |              3 | 2009-02-17     | 2009-02-20    |
|            31 |             13 | 2008-09-30     | 2008-10-04    |
|            32 |              4 | 2007-01-19     | 2007-01-27    |
|            38 |             19 | 2009-03-06     | 2009-03-07    |
|            39 |             19 | 2009-03-07     | 2009-03-09    |
|            40 |             19 | 2009-03-10     | 2009-03-13    |
|            42 |             19 | 2009-03-23     | 2009-03-27    |
|            43 |             23 | 2009-03-26     | 2009-03-28    |
|            44 |             23 | 2009-03-27     | 2009-03-30    |
|            45 |             23 | 2009-03-04     | 2009-03-07    |
|            46 |             23 | 2009-03-04     | 2009-03-05    |
|            49 |             26 | 2008-07-22     | 2008-07-30    |
|            55 |             14 | 2009-01-10     | 2009-01-11    |
|            60 |              1 | 2008-12-27     | 2008-12-28    |
|            68 |              3 | 2009-02-17     | 2009-02-20    |
|            92 |             27 | 2009-04-30     | 2009-05-03    |
|            96 |             35 | 2008-04-12     | 2008-04-13    |
|           103 |             30 | 2009-01-20     | 2009-01-24    |
|           106 |             30 | 2009-05-15     | 2009-05-20    |
|           112 |             36 | 2009-04-06     | 2009-05-07    |
|           113 |             36 | 2008-11-09     | 2009-01-09    |
|           114 |             36 | 2009-01-29     | 2009-01-31    |
|           115 |             36 | 2009-01-26     | 2009-02-27    |
|           123 |             30 | 2009-01-20     | 2009-01-24    |
|           126 |             30 | 2009-05-15     | 2009-05-20    |
|           128 |             38 | 2008-12-10     | 2008-12-29    |
+---------------+----------------+----------------+---------------+
32 rows in set (0,00 sec)
```

10. Código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada:

```sql
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega < ADDDATE(fecha_esperada, -2);

+---------------+----------------+----------------+---------------+
| codigo_pedido | codigo_cliente | fecha_esperada | fecha_entrega |
+---------------+----------------+----------------+---------------+
|            24 |             14 | 2008-07-31     | 2008-07-25    |
|            30 |             13 | 2008-09-03     | 2008-08-31    |
|            36 |             14 | 2008-12-15     | 2008-12-10    |
|            53 |             13 | 2008-11-15     | 2008-11-09    |
|            89 |             35 | 2007-12-13     | 2007-12-10    |
|            93 |             27 | 2009-05-30     | 2009-05-17    |
+---------------+----------------+----------------+---------------+
6 rows in set (0,01 sec)
```

11. Listado de todos los pedidos que fueron rechazados en 2009:

```sql
SELECT codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente 
FROM pedido 
WHERE estado = 'Rechazado' AND YEAR(fecha_pedido) = 2009;

 |
|            40 | 2009-03-09   | 2009-03-10     | 2009-03-13    | Rechazado | NULL                                                                     |             19 |
|            46 | 2009-04-03   | 2009-03-04     | 2009-03-05    | Rechazado | NULL                                                                     |             23 |
|            65 | 2009-02-02   | 2009-02-08     | NULL          | Rechazado | El cliente carece de saldo en la cuenta asociada                         |              1 |
|            66 | 2009-02-06   | 2009-02-12     | NULL          | Rechazado | El cliente anula la operacion para adquirir mas producto                 |              3 |
|            74 | 2009-01-14   | 2009-01-22     | NULL          | Rechazado | El pedido no llego el dia que queria el cliente por fallo del transporte |             15 |
|            81 | 2009-01-18   | 2009-01-24     | NULL          | Rechazado | Los producto estaban en mal estado                                       |             28 |
|           101 | 2009-03-07   | 2009-03-27     | NULL          | Rechazado | El pedido fue rechazado por el cliente                                   |             16 |
|           105 | 2009-02-14   | 2009-02-20     | NULL          | Rechazado | el producto ha sido rechazado por la pesima calidad                      |             30 |
|           120 | 2009-03-07   | 2009-03-27     | NULL          | Rechazado | El pedido fue rechazado por el cliente                                   |             16 |
|           125 | 2009-02-14   | 2009-02-20     | NULL          | Rechazado | el producto ha sido rechazado por la pesima calidad                      |             30 |
+---------------+--------------+----------------+---------------+-----------+--------------------------------------------------------------------------+----------------+
14 rows in set (0,00 sec)
```

12. Listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año:

```sql
SELECT codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente 
FROM pedido 
WHERE MONTH(fecha_entrega) = 1;

+---------------+--------------+----------------+---------------+-----------+-----------------------------------------------------------+----------------+
| codigo_pedido | fecha_pedido | fecha_esperada | fecha_entrega | estado    | comentarios                                               | codigo_cliente |
+---------------+--------------+----------------+---------------+-----------+-----------------------------------------------------------+----------------+
|             1 | 2006-01-17   | 2006-01-19     | 2006-01-19    | Entregado | Pagado a plazos                                           |              5 |
|            13 | 2009-01-12   | 2009-01-14     | 2009-01-15    | Entregado | NULL                                                      |              7 |
|            15 | 2009-01-09   | 2009-01-12     | 2009-01-11    | Entregado | NULL                                                      |              7 |
|            16 | 2009-01-06   | 2009-01-07     | 2009-01-15    | Entregado | NULL                                                      |              7 |
|            17 | 2009-01-08   | 2009-01-09     | 2009-01-11    | Entregado | mal estado                                                |              7 |
|            18 | 2009-01-05   | 2009-01-06     | 2009-01-07    | Entregado | NULL                                                      |              9 |
|            21 | 2009-01-09   | 2009-01-09     | 2009-01-09    | Rechazado | mal pago                                                  |              9 |
|            22 | 2009-01-11   | 2009-01-11     | 2009-01-13    | Entregado | NULL                                                      |              9 |
|            32 | 2007-01-07   | 2007-01-19     | 2007-01-27    | Entregado | Entrega tardia, el cliente puso reclamacion               |              4 |
|            55 | 2008-12-10   | 2009-01-10     | 2009-01-11    | Entregado | Retrasado 1 dia por problemas de transporte               |             14 |
|            58 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                             |              3 |
|            64 | 2009-01-24   | 2009-01-31     | 2009-01-30    | Entregado | Todo correcto                                             |              1 |
|            75 | 2009-01-11   | 2009-01-13     | 2009-01-13    | Entregado | El pedido llego perfectamente                             |             15 |
|            79 | 2009-01-12   | 2009-01-13     | 2009-01-13    | Entregado | NULL                                                      |             28 |
|            82 | 2009-01-20   | 2009-01-29     | 2009-01-29    | Entregado | El pedido llego un poco mas tarde de la hora fijada       |             28 |
|            95 | 2008-01-04   | 2008-01-19     | 2008-01-19    | Entregado | NULL                                                      |             35 |
|           100 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                             |             16 |
|           102 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                            |             16 |
|           103 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente | NULL                                                      |             30 |
|           113 | 2008-10-28   | 2008-11-09     | 2009-01-09    | Rechazado | El producto ha sido rechazado por la tardanza de el envio |             36 |
|           114 | 2009-01-15   | 2009-01-29     | 2009-01-31    | Entregado | El envio llego dos dias más tarde debido al mal tiempo    |             36 |
|           119 | 2009-01-10   | 2009-01-15     | 2009-01-15    | Entregado | El pedido llego perfectamente                             |             16 |
|           121 | 2008-12-28   | 2009-01-08     | 2009-01-08    | Entregado | Pago pendiente                                            |             16 |
|           123 | 2009-01-15   | 2009-01-20     | 2009-01-24    | Pendiente | NULL                                                      |             30 |
+---------------+--------------+----------------+---------------+-----------+-----------------------------------------------------------+----------------+
24 rows in set (0,01 sec)
```

13. Listado con todos los pagos que se realizaron en el año 2008 mediante Paypal:

```sql
Select codigo_cliente, forma_pago, id_transaccion, fecha_pago, total from pago where year(fecha_pago) = 2008 and forma_pago = 'Paypal';

+----------------+------------+----------------+------------+----------+
| codigo_cliente | forma_pago | id_transaccion | fecha_pago | total    |
+----------------+------------+----------------+------------+----------+
|              1 | PayPal     | ak-std-000001  | 2008-11-10 |  2000.00 |
|              1 | PayPal     | ak-std-000002  | 2008-12-10 |  2000.00 |
|             13 | PayPal     | ak-std-000014  | 2008-08-04 |  2246.00 |
|             14 | PayPal     | ak-std-000015  | 2008-07-15 |  4160.00 |
|             26 | PayPal     | ak-std-000020  | 2008-03-18 | 18846.00 |
+----------------+------------+----------------+------------+----------+
5 rows in set (0,00 sec)
```

14. Listado con todas las formas de pago que aparecen en la tabla pago:

```sql
SELECT DISTINCT forma_pago 
FROM pago;

+---------------+
| forma_pago    |
+---------------+
| PayPal        |
| Transferencia |
| Cheque        |
+---------------+
3 rows in set (0,00 sec)
```

15. Listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock:

```sql
SELECT codigo_producto, gama, precio_venta, cantidad_en_stock FROM producto WHERE gama = 'Ornamentales' AND cantidad_en_stock > 100 ORDER BY precio_venta DESC;
+-----------------+--------------+--------------+-------------------+
| codigo_producto | gama         | precio_venta | cantidad_en_stock |
+-----------------+--------------+--------------+-------------------+
| OR-115          | Ornamentales |         7.00 |               120 |
| OR-116          | Ornamentales |         7.00 |               120 |
| OR-117          | Ornamentales |         7.00 |               120 |
| OR-118          | Ornamentales |         7.00 |               120 |
| OR-112          | Ornamentales |         5.00 |               120 |
| OR-113          | Ornamentales |         5.00 |               120 |
| OR-114          | Ornamentales |         5.00 |               120 |
| OR-119          | Ornamentales |         5.00 |               120 |
| OR-120          | Ornamentales |         5.00 |               120 |
| OR-121          | Ornamentales |         5.00 |               120 |
| OR-122          | Ornamentales |         5.00 |               120 |
| OR-123          | Ornamentales |         5.00 |               120 |
| OR-124          | Ornamentales |         5.00 |               120 |
| OR-125          | Ornamentales |         5.00 |               120 |
| OR-126          | Ornamentales |         5.00 |               120 |
+-----------------+--------------+--------------+-------------------+
15 rows in set (0,00 sec)
```

16. Listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30:

```sql
SELECT nombre 
FROM cliente 
WHERE codigo_cliente IN (
    SELECT codigo_cliente 
    FROM direccion_cliente 
    WHERE ciudad = 'Madrid'
) AND codigo_empleado_rep_ventas IN (11, 30);

+-----------------------------+
| nombre                      |
+-----------------------------+
| Beragua                     |
| Club Golf Puerta del hierro |
| Naturagua                   |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Jardin de Flores            |
| Naturajardin                |
+-----------------------------+
7 rows in set (0,00 sec)
```

## Consultas multitabla (Composición interna)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2. Las consultas con
sintaxis de SQL2 se deben resolver con INNER JOIN y NATURAL JOIN.

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
   representante de ventas.

   ```sql
   SELECT c.nombre, e.nombre, e.apellido1, e.apellido2
   FROM cliente c, empleado e
   WHERE c.codigo_empleado_rep_ventas = e.codigo_empleado;
   
   +--------------------------------+-----------------+------------+-----------+
   | nombre                         | nombre          | apellido1  | apellido2 |
   +--------------------------------+-----------------+------------+-----------+
   | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Tendo Garden                   | Lorena          | Paxton     |           |
   | Lasas S.A.                     | Mariano         | López      | Murcia    |
   | Lasas S.A.                     | Mariano         | López      | Murcia    |
   | Camunas Jardines S.L.          | Mariano         | López      | Murcia    |
   | Dardena S.A.                   | Mariano         | López      | Murcia    |
   | Jardin de Flores               | Julian          | Bellinelli |           |
   | Flores Marivi                  | Felipe          | Rosas      | Marquez   |
   | Flowers, S.A                   | Felipe          | Rosas      | Marquez   |
   | Naturajardin                   | Julian          | Bellinelli |           |
   | Vivero Humanes                 | Julian          | Bellinelli |           |
   | Fuenla City                    | Felipe          | Rosas      | Marquez   |
   | Jardines y Mansiones Cactus SL | Lucio           | Campoamor  | Martín    |
   | Jardinerías Matías SL          | Lucio           | Campoamor  | Martín    |
   | Agrojardin                     | Julian          | Bellinelli |           |
   | Top Campo                      | Felipe          | Rosas      | Marquez   |
   | Jardineria Sara                | Felipe          | Rosas      | Marquez   |
   | Campohermoso                   | Julian          | Bellinelli |           |
   | france telecom                 | Lionel          | Narvaez    |           |
   | Musée du Louvre                | Lionel          | Narvaez    |           |
   | Tutifruti S.A                  | Mariko          | Kishi      |           |
   | Flores S.L.                    | Michael         | Bolton     |           |
   | The Magic Garden               | Michael         | Bolton     |           |
   | El Jardin Viviente S.L         | Mariko          | Kishi      |           |
   +--------------------------------+-----------------+------------+-----------+
   26 rows in set (0,00 sec)
   ```

   2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
      nombre de sus representantes de ventas.
   ```sql
   SELECT c.nombre, e.nombre, e.apellido1, e.apellido2
   FROM cliente c, empleado e, pago p
   WHERE c.codigo_cliente = p.codigo_cliente
   AND c.codigo_empleado_rep_ventas = e.codigo_empleado;
   
   +--------------------------------+-----------------+------------+-----------+
   | nombre                         | nombre          | apellido1  | apellido2 |
   +--------------------------------+-----------------+------------+-----------+
   | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     |
   | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Gerudo Valley                  | Lorena          | Paxton     |           |
   | Tendo Garden                   | Lorena          | Paxton     |           |
   | Camunas Jardines S.L.          | Mariano         | López      | Murcia    |
   | Dardena S.A.                   | Mariano         | López      | Murcia    |
   | Jardin de Flores               | Julian          | Bellinelli |           |
   | Jardin de Flores               | Julian          | Bellinelli |           |
   | Flores Marivi                  | Felipe          | Rosas      | Marquez   |
   | Jardines y Mansiones Cactus SL | Lucio           | Campoamor  | Martín    |
   | Jardinerías Matías SL          | Lucio           | Campoamor  | Martín    |
   | Agrojardin                     | Julian          | Bellinelli |           |
   | Jardineria Sara                | Felipe          | Rosas      | Marquez   |
   | Tutifruti S.A                  | Mariko          | Kishi      |           |
   | El Jardin Viviente S.L         | Mariko          | Kishi      |           |
   +--------------------------------+-----------------+------------+-----------+
   22 rows in set (0,00 sec)
   ```

   3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
      el nombre de sus representantes de ventas.
   ```sql
   SELECT c.nombre, e.nombre, e.apellido1, e.apellido2
   FROM cliente c, empleado e
   WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)
   AND c.codigo_empleado_rep_ventas = e.codigo_empleado;
   +------------------+---------+------------+-----------+
   | nombre           | nombre  | apellido1  | apellido2 |
   +------------------+---------+------------+-----------+
   | Lasas S.A.       | Mariano | López      | Murcia    |
   | Lasas S.A.       | Mariano | López      | Murcia    |
   | Flowers, S.A     | Felipe  | Rosas      | Marquez   |
   | Naturajardin     | Julian  | Bellinelli |           |
   | Vivero Humanes   | Julian  | Bellinelli |           |
   | Fuenla City      | Felipe  | Rosas      | Marquez   |
   | Top Campo        | Felipe  | Rosas      | Marquez   |
   | Campohermoso     | Julian  | Bellinelli |           |
   | france telecom   | Lionel  | Narvaez    |           |
   | Musée du Louvre  | Lionel  | Narvaez    |           |
   | Flores S.L.      | Michael | Bolton     |           |
   | The Magic Garden | Michael | Bolton     |           |
   +------------------+---------+------------+-----------+
   12 rows in set (0,01 sec)
   ```

   4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
      representantes junto con la ciudad de la oficina a la que pertenece el
      representante.
   ```sql
   SELECT c.nombre, e.nombre, e.apellido1, e.apellido2, o.ciudad
   FROM cliente c, empleado e, pago p, oficina o
   WHERE c.codigo_cliente = p.codigo_cliente
   AND c.codigo_empleado_rep_ventas = e.codigo_empleado
   AND e.codigo_oficina = o.codigo_oficina;
   +--------------------------------+-----------------+------------+-----------+----------------------+
   | nombre                         | nombre          | apellido1  | apellido2 | ciudad               |
   +--------------------------------+-----------------+------------+-----------+----------------------+
   | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     | San Francisco        |
   | GoldFish Garden                | Walter Santiago | Sanchez    | Lopez     | San Francisco        |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     | San Francisco        |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     | San Francisco        |
   | Gardening Associates           | Walter Santiago | Sanchez    | Lopez     | San Francisco        |
   | Gerudo Valley                  | Lorena          | Paxton     |           | Boston               |
   | Gerudo Valley                  | Lorena          | Paxton     |           | Boston               |
   | Gerudo Valley                  | Lorena          | Paxton     |           | Boston               |
   | Gerudo Valley                  | Lorena          | Paxton     |           | Boston               |
   | Gerudo Valley                  | Lorena          | Paxton     |           | Boston               |
   | Tendo Garden                   | Lorena          | Paxton     |           | Boston               |
   | Camunas Jardines S.L.          | Mariano         | López      | Murcia    | Madrid               |
   | Dardena S.A.                   | Mariano         | López      | Murcia    | Madrid               |
   | Jardin de Flores               | Julian          | Bellinelli |           | Sydney               |
   | Jardin de Flores               | Julian          | Bellinelli |           | Sydney               |
   | Flores Marivi                  | Felipe          | Rosas      | Marquez   | Talavera de la Reina |
   | Jardines y Mansiones Cactus SL | Lucio           | Campoamor  | Martín    | Madrid               |
   | Jardinerías Matías SL          | Lucio           | Campoamor  | Martín    | Madrid               |
   | Agrojardin                     | Julian          | Bellinelli |           | Sydney               |
   | Jardineria Sara                | Felipe          | Rosas      | Marquez   | Talavera de la Reina |
   | Tutifruti S.A                  | Mariko          | Kishi      |           | Sydney               |
   | El Jardin Viviente S.L         | Mariko          | Kishi      |           | Sydney               |
   +--------------------------------+-----------------+------------+-----------+----------------------+
   22 rows in set (0,00 sec)
   ```

   5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
      de sus representantes junto con la ciudad de la oficina a la que pertenece el
      representante.
   ```sql
   SELECT c.nombre, e.nombre, e.apellido1, e.apellido2, o.ciudad
   FROM cliente c, empleado e, oficina o
   WHERE c.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago)
   AND c.codigo_empleado_rep_ventas = e.codigo_empleado
   AND e.codigo_oficina = o.codigo_oficina;
   +------------------+---------+------------+-----------+----------------------+
   | nombre           | nombre  | apellido1  | apellido2 | ciudad               |
   +------------------+---------+------------+-----------+----------------------+
   | Lasas S.A.       | Mariano | López      | Murcia    | Madrid               |
   | Lasas S.A.       | Mariano | López      | Murcia    | Madrid               |
   | Flowers, S.A     | Felipe  | Rosas      | Marquez   | Talavera de la Reina |
   | Naturajardin     | Julian  | Bellinelli |           | Sydney               |
   | Vivero Humanes   | Julian  | Bellinelli |           | Sydney               |
   | Fuenla City      | Felipe  | Rosas      | Marquez   | Talavera de la Reina |
   | Top Campo        | Felipe  | Rosas      | Marquez   | Talavera de la Reina |
   | Campohermoso     | Julian  | Bellinelli |           | Sydney               |
   | france telecom   | Lionel  | Narvaez    |           | Paris                |
   | Musée du Louvre  | Lionel  | Narvaez    |           | Paris                |
   | Flores S.L.      | Michael | Bolton     |           | San Francisco        |
   | The Magic Garden | Michael | Bolton     |           | San Francisco        |
   +------------------+---------+------------+-----------+----------------------+
   12 rows in set (0,00 sec)
   ```

   6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
   ```sql
   SELECT DISTINCT do.linea_direccion1, do.region, do.pais, do.codigo_postal
   FROM direccion_oficina do
   INNER JOIN oficina o ON do.codigo_oficina = o.codigo_oficina  
   INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
   INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
   INNER JOIN direccion_cliente dc ON c.codigo_cliente = dc.codigo_cliente
   WHERE dc.ciudad = 'Fuenlabrada';
   +------------------------------+-------------------+-----------+---------------+
   | linea_direccion1             | region            | pais      | codigo_postal |
   +------------------------------+-------------------+-----------+---------------+
   | Bulevar Indalecio Prieto, 32 | Madrid            | España    | 28032         |
   | Francisco Aguirre, 32        | Castilla-LaMancha | España    | 45632         |
   | 5-11 Wentworth Avenue        | NSW 2010          | Australia | APAC          |
   +------------------------------+-------------------+-----------+---------------+
   3 rows in set (0,01 sec)
   +------------------------------+-------------------+-----------+---------------+
   | linea_direccion1             | region            | pais      | codigo_postal |
   +------------------------------+-------------------+-----------+---------------+
   | Bulevar Indalecio Prieto, 32 | Madrid            | España    | 28032         |
   | Francisco Aguirre, 32        | Castilla-LaMancha | España    | 45632         |
   | 5-11 Wentworth Avenue        | NSW 2010          | Australia | APAC          |
   +------------------------------+-------------------+-----------+---------------+
   3 rows in set (0,01 sec)23wy
   
   ```

   7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
      con la ciudad de la oficina a la que pertenece el representante.
   ```sql
   SELECT c.nombre AS 'Nombre Cliente', 
          CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS 'Nombre Representante', 
          o.ciudad AS 'Ciudad Oficina'
   FROM cliente c
   INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
   INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;
   
   +--------------------------------+-------------------------------+----------------------+
   | Nombre Cliente                 | Nombre Representante          | Ciudad Oficina       |
   +--------------------------------+-------------------------------+----------------------+
   | GoldFish Garden                | Walter Santiago Sanchez Lopez | San Francisco        |
   | Gardening Associates           | Walter Santiago Sanchez Lopez | San Francisco        |
   | Gerudo Valley                  | Lorena Paxton                 | Boston               |
   | Tendo Garden                   | Lorena Paxton                 | Boston               |
   | Lasas S.A.                     | Mariano López Murcia          | Madrid               |
   | Lasas S.A.                     | Mariano López Murcia          | Madrid               |
   | Camunas Jardines S.L.          | Mariano López Murcia          | Madrid               |
   | Dardena S.A.                   | Mariano López Murcia          | Madrid               |
   | Jardin de Flores               | Julian Bellinelli             | Sydney               |
   | Flores Marivi                  | Felipe Rosas Marquez          | Talavera de la Reina |
   | Flowers, S.A                   | Felipe Rosas Marquez          | Talavera de la Reina |
   | Naturajardin                   | Julian Bellinelli             | Sydney               |
   | Vivero Humanes                 | Julian Bellinelli             | Sydney               |
   | Fuenla City                    | Felipe Rosas Marquez          | Talavera de la Reina |
   | Jardines y Mansiones Cactus SL | Lucio Campoamor Martín        | Madrid               |
   | Jardinerías Matías SL          | Lucio Campoamor Martín        | Madrid               |
   | Agrojardin                     | Julian Bellinelli             | Sydney               |
   | Top Campo                      | Felipe Rosas Marquez          | Talavera de la Reina |
   | Jardineria Sara                | Felipe Rosas Marquez          | Talavera de la Reina |
   | Campohermoso                   | Julian Bellinelli             | Sydney               |
   | france telecom                 | Lionel Narvaez                | Paris                |
   | Musée du Louvre                | Lionel Narvaez                | Paris                |
   | Tutifruti S.A                  | Mariko Kishi                  | Sydney               |
   | Flores S.L.                    | Michael Bolton                | San Francisco        |
   | The Magic Garden               | Michael Bolton                | San Francisco        |
   | El Jardin Viviente S.L         | Mariko Kishi                  | Sydney               |
   +--------------------------------+-------------------------------+----------------------+
   26 rows in set (0,00 sec)
   ```

   8. Devuelve un listado con el nombre de los empleados junto con el nombre
      de sus jefes.
   ```sql
   SELECT e.nombre AS 'Nombre Empleado', 
          CONCAT(j.nombre, ' ', j.apellido1, ' ', j.apellido2) AS 'Nombre Jefe'
   FROM empleado e
   LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado;
   
   +-----------------+------------------------+
   | Nombre Empleado | Nombre Jefe            |
   +-----------------+------------------------+
   | Marcos          | NULL                   |
   | Ruben           | Marcos Magaña Perez    |
   | Alberto         | Ruben López Martinez   |
   | Maria           | Ruben López Martinez   |
   | Felipe          | Alberto Soria Carrasco |
   | Juan Carlos     | Alberto Soria Carrasco |
   | Carlos          | Alberto Soria Carrasco |
   | Mariano         | Carlos Soria Jimenez   |
   | Lucio           | Carlos Soria Jimenez   |
   | Hilario         | Carlos Soria Jimenez   |
   | Francois        | Alberto Soria Carrasco |
   | Lionel          | Francois Fignon        |
   | Laurent         | Francois Fignon        |
   | Michael         | Alberto Soria Carrasco |
   | Walter Santiago | Michael Bolton         |
   | Hilary          | Alberto Soria Carrasco |
   | Marcus          | Hilary Washington      |
   | Lorena          | Hilary Washington      |
   | Nei             | Alberto Soria Carrasco |
   | Narumi          | Nei Nishikori          |
   | Takuma          | Nei Nishikori          |
   | Amy             | Alberto Soria Carrasco |
   | Larry           | Amy Johnson            |
   | John            | Amy Johnson            |
   | Kevin           | Alberto Soria Carrasco |
   | Julian          | Kevin Fallmer          |
   | Mariko          | Kevin Fallmer          |
   +-----------------+------------------------+
   27 rows in set (0,00 sec)
   ```

   9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
      de su jefe y el nombre del jefe de sus jefe.
   ```sql
   SELECT e.nombre AS 'Nombre Empleado',
          CONCAT(j.nombre, ' ', j.apellido1, ' ', j.apellido2) AS 'Nombre Jefe',
          CONCAT(jj.nombre, ' ', jj.apellido1, ' ', jj.apellido2) AS 'Nombre Jefe del Jefe'
   FROM empleado e
   LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
   LEFT JOIN empleado jj ON j.codigo_jefe = jj.codigo_empleado;
   
   +-----------------+------------------------+------------------------+
   | Nombre Empleado | Nombre Jefe            | Nombre Jefe del Jefe   |
   +-----------------+------------------------+------------------------+
   | Marcos          | NULL                   | NULL                   |
   | Ruben           | Marcos Magaña Perez    | NULL                   |
   | Alberto         | Ruben López Martinez   | Marcos Magaña Perez    |
   | Maria           | Ruben López Martinez   | Marcos Magaña Perez    |
   | Felipe          | Alberto Soria Carrasco | Ruben López Martinez   |
   | Juan Carlos     | Alberto Soria Carrasco | Ruben López Martinez   |
   | Carlos          | Alberto Soria Carrasco | Ruben López Martinez   |
   | Mariano         | Carlos Soria Jimenez   | Alberto Soria Carrasco |
   | Lucio           | Carlos Soria Jimenez   | Alberto Soria Carrasco |
   | Hilario         | Carlos Soria Jimenez   | Alberto Soria Carrasco |
   | Francois        | Alberto Soria Carrasco | Ruben López Martinez   |
   | Lionel          | Francois Fignon        | Alberto Soria Carrasco |
   | Laurent         | Francois Fignon        | Alberto Soria Carrasco |
   | Michael         | Alberto Soria Carrasco | Ruben López Martinez   |
   | Walter Santiago | Michael Bolton         | Alberto Soria Carrasco |
   | Hilary          | Alberto Soria Carrasco | Ruben López Martinez   |
   | Marcus          | Hilary Washington      | Alberto Soria Carrasco |
   | Lorena          | Hilary Washington      | Alberto Soria Carrasco |
   | Nei             | Alberto Soria Carrasco | Ruben López Martinez   |
   | Narumi          | Nei Nishikori          | Alberto Soria Carrasco |
   | Takuma          | Nei Nishikori          | Alberto Soria Carrasco |
   | Amy             | Alberto Soria Carrasco | Ruben López Martinez   |
   | Larry           | Amy Johnson            | Alberto Soria Carrasco |
   | John            | Amy Johnson            | Alberto Soria Carrasco |
   | Kevin           | Alberto Soria Carrasco | Ruben López Martinez   |
   | Julian          | Kevin Fallmer          | Alberto Soria Carrasco |
   | Mariko          | Kevin Fallmer          | Alberto Soria Carrasco |
   +-----------------+------------------------+------------------------+
   27 rows in set (0,01 sec)
   ```

   10. Devuelve el nombre de los clientes a los que no se les ha entregado a
       tiempo un pedido.

       ```sql
       SELECT c.nombre
       FROM cliente c
       INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
       WHERE p.fecha_entrega > p.fecha_esperada;
       +--------------------------------+
       | nombre                         |
       +--------------------------------+
       | GoldFish Garden                |
       | Beragua                        |
       | Beragua                        |
       | Beragua                        |
       | Naturagua                      |
       | Naturagua                      |
       | Gardening Associates           |
       | Camunas Jardines S.L.          |
       | Gerudo Valley                  |
       | Golf S.A.                      |
       | Golf S.A.                      |
       | Golf S.A.                      |
       | Golf S.A.                      |
       | Sotogrande                     |
       | Sotogrande                     |
       | Sotogrande                     |
       | Sotogrande                     |
       | Jardines y Mansiones Cactus SL |
       | Dardena S.A.                   |
       | GoldFish Garden                |
       | Gardening Associates           |
       | Jardinerías Matías SL          |
       | Tutifruti S.A                  |
       | Jardineria Sara                |
       | Jardineria Sara                |
       | Flores S.L.                    |
       | Flores S.L.                    |
       | Flores S.L.                    |
       | Flores S.L.                    |
       | Jardineria Sara                |
       | Jardineria Sara                |
       | El Jardin Viviente S.L         |
       +--------------------------------+
       32 rows in set (0,00 sec)
       ```

       

   11. Devuelve un listado de las diferentes gamas de producto que ha comprado
       cada cliente.

       ```sql
       SELECT c.nombre, gp.gama
       FROM cliente c
       INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
       INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
       INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
       INNER JOIN gama_producto gp ON pr.gama = gp.gama
       GROUP BY c.nombre, gp.gama;
       +--------------------------------+--------------+
       | nombre                         | gama         |
       +--------------------------------+--------------+
       | GoldFish Garden                | Frutales     |
       | GoldFish Garden                | Aromáticas   |
       | GoldFish Garden                | Ornamentales |
       | Gardening Associates           | Frutales     |
       | Gardening Associates           | Ornamentales |
       | Gerudo Valley                  | Herramientas |
       | Gerudo Valley                  | Ornamentales |
       | Gerudo Valley                  | Frutales     |
       | Tendo Garden                   | Frutales     |
       | Tendo Garden                   | Ornamentales |
       | Tendo Garden                   | Aromáticas   |
       | Beragua                        | Herramientas |
       | Beragua                        | Frutales     |
       | Beragua                        | Ornamentales |
       | Naturagua                      | Herramientas |
       | Naturagua                      | Frutales     |
       | Naturagua                      | Ornamentales |
       | Camunas Jardines S.L.          | Aromáticas   |
       | Camunas Jardines S.L.          | Frutales     |
       | Camunas Jardines S.L.          | Ornamentales |
       | Dardena S.A.                   | Herramientas |
       | Dardena S.A.                   | Frutales     |
       | Dardena S.A.                   | Ornamentales |
       | Jardin de Flores               | Frutales     |
       | Jardin de Flores               | Ornamentales |
       | Jardin de Flores               | Aromáticas   |
       | Jardin de Flores               | Herramientas |
       | Flores Marivi                  | Ornamentales |
       | Flores Marivi                  | Frutales     |
       | Flores Marivi                  | Aromáticas   |
       | Flores Marivi                  | Herramientas |
       | Golf S.A.                      | Herramientas |
       | Golf S.A.                      | Aromáticas   |
       | Sotogrande                     | Aromáticas   |
       | Sotogrande                     | Frutales     |
       | Jardines y Mansiones Cactus SL | Frutales     |
       | Jardines y Mansiones Cactus SL | Ornamentales |
       | Jardinerías Matías SL          | Aromáticas   |
       | Jardinerías Matías SL          | Frutales     |
       | Jardinerías Matías SL          | Herramientas |
       | Agrojardin                     | Ornamentales |
       | Agrojardin                     | Frutales     |
       | Jardineria Sara                | Frutales     |
       | Jardineria Sara                | Ornamentales |
       | Jardineria Sara                | Aromáticas   |
       | Jardineria Sara                | Herramientas |
       | Tutifruti S.A                  | Frutales     |
       | Tutifruti S.A                  | Ornamentales |
       | Flores S.L.                    | Frutales     |
       | El Jardin Viviente S.L         | Frutales     |
       | El Jardin Viviente S.L         | Ornamentales |
       | El Jardin Viviente S.L         | Aromáticas   |
       | El Jardin Viviente S.L         | Herramientas |
       +--------------------------------+--------------+
       53 rows in set (0,02 sec)
       ```

### Consultas multitabla (Composición externa)

Resuelva todas las consultas utilizando las cláusulas LEFT JOIN, RIGHT JOIN, NATURAL
LEFT JOIN y NATURAL RIGHT JOIN.

1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago:

```sql
SELECT c.nombre
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;
+-----------------------------+
| nombre                      |
+-----------------------------+
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| Flores S.L.                 |
| The Magic Garden            |
+-----------------------------+
18 rows in set (0,01 sec)
```

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido:

```sql
SELECT c.nombre
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

+-----------------------------+
| nombre                      |
+-----------------------------+
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| The Magic Garden            |
+-----------------------------+
17 rows in set (0,01 sec)
```

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido:

```sql
SELECT c.nombre
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
WHERE p.codigo_cliente IS NULL OR pe.codigo_cliente IS NULL;

+-----------------------------+
| nombre                      |
+-----------------------------+
| Lasas S.A.                  |
| Club Golf Puerta del hierro |
| DaraDistribuciones          |
| Madrileña de riegos         |
| Lasas S.A.                  |
| Flowers, S.A                |
| Naturajardin                |
| Americh Golf Management SL  |
| Aloha                       |
| El Prat                     |
| Vivero Humanes              |
| Fuenla City                 |
| Top Campo                   |
| Campohermoso                |
| france telecom              |
| Musée du Louvre             |
| Flores S.L.                 |
| Flores S.L.                 |
| Flores S.L.                 |
| Flores S.L.                 |
| Flores S.L.                 |
| The Magic Garden            |
+-----------------------------+
22 rows in set (0,00 sec)
```

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada:

```sql
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE o.codigo_oficina IS NULL;
```

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado:

```sql
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_cliente IS NULL;

+-------------+------------+-----------+
| nombre      | apellido1  | apellido2 |
+-------------+------------+-----------+
| Marcos      | Magaña     | Perez     |
| Ruben       | López      | Martinez  |
| Alberto     | Soria      | Carrasco  |
| Maria       | Solís      | Jerez     |
| Juan Carlos | Ortiz      | Serrano   |
| Carlos      | Soria      | Jimenez   |
| Hilario     | Rodriguez  | Huertas   |
| Francois    | Fignon     |           |
| Laurent     | Serra      |           |
| Hilary      | Washington |           |
| Marcus      | Paxton     |           |
| Nei         | Nishikori  |           |
| Narumi      | Riko       |           |
| Takuma      | Nomura     |           |
| Amy         | Johnson    |           |
| Larry       | Westfalls  |           |
| John        | Walton     |           |
| Kevin       | Fallmer    |           |
+-------------+------------+-----------+
18 rows in set (0,00 sec)
```

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan:

```sql
SELECT e.nombre, e.apellido1, e.apellido2, o.ciudad
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE c.codigo_cliente IS NULL;

+-------------+------------+-----------+----------------------+
| nombre      | apellido1  | apellido2 | ciudad               |
+-------------+------------+-----------+----------------------+
| Marcos      | Magaña     | Perez     | Talavera de la Reina |
| Ruben       | López      | Martinez  | Talavera de la Reina |
| Alberto     | Soria      | Carrasco  | Talavera de la Reina |
| Maria       | Solís      | Jerez     | Talavera de la Reina |
| Juan Carlos | Ortiz      | Serrano   | Talavera de la Reina |
| Carlos      | Soria      | Jimenez   | Madrid               |
| Hilario     | Rodriguez  | Huertas   | Madrid               |
| Francois    | Fignon     |           | Paris                |
| Laurent     | Serra      |           | Paris                |
| Hilary      | Washington |           | Boston               |
| Marcus      | Paxton     |           | Boston               |
| Nei         | Nishikori  |           | Tokyo                |
| Narumi      | Riko       |           | Tokyo                |
| Takuma      | Nomura     |           | Tokyo                |
| Amy         | Johnson    |           | Londres              |
| Larry       | Westfalls  |           | Londres              |
| John        | Walton     |           | Londres              |
| Kevin       | Fallmer    |           | Sydney               |
+-------------+------------+-----------+----------------------+
18 rows in set (0,00 sec)
```

7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado:

```sql
SELECT e.nombre, e.apellido1, e.apellido2
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE o.codigo_oficina IS NULL OR c.codigo_cliente IS NULL;

+-------------+------------+-----------+
| nombre      | apellido1  | apellido2 |
+-------------+------------+-----------+
| Marcos      | Magaña     | Perez     |
| Ruben       | López      | Martinez  |
| Alberto     | Soria      | Carrasco  |
| Maria       | Solís      | Jerez     |
| Juan Carlos | Ortiz      | Serrano   |
| Carlos      | Soria      | Jimenez   |
| Hilario     | Rodriguez  | Huertas   |
| Francois    | Fignon     |           |
| Laurent     | Serra      |           |
| Hilary      | Washington |           |
| Marcus      | Paxton     |           |
| Nei         | Nishikori  |           |
| Narumi      | Riko       |           |
| Takuma      | Nomura     |           |
| Amy         | Johnson    |           |
| Larry       | Westfalls  |           |
| John        | Walton     |           |
| Kevin       | Fallmer    |           |
+-------------+------------+-----------+
18 rows in set (0,00 sec)
```



8. Devuelve un listado de los productos que nunca han aparecido en un pedido:

```sql
SELECT p.codigo_producto, p.nombre
FROM producto p
LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL;
```

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto:

```sql
SELECT p.nombre, p.descripcion, p.imagen
FROM producto p
LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL;
```

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales:

```sql
SELECT o.ciudad, o.region, o.pais
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN pedido pe ON c.codigo_cliente = pe.codigo_cliente
LEFT JOIN detalle_pedido dp ON pe.codigo_pedido = dp.codigo_pedido
LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
LEFT JOIN gama_producto gp ON pr.gama = gp.gama
WHERE gp.gama = 'Frutales' AND e.codigo_empleado IS NULL;
```

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago:

```sql
SELECT c.nombre
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pa ON c.codigo_cliente = pa.codigo_cliente
WHERE p.codigo_cliente IS NOT NULL AND pa.codigo_cliente IS NULL;
```

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado:

```sql
SELECT e.nombre, e.apellido1, e.apellido2, j.nombre, j.apellido1, j.apellido2
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
WHERE c.codigo_cliente IS NULL;
```

### consultas resumen

1. ¿Cuántos empleados hay en la compañía?
```sql
SELECT COUNT(*) AS 'Número de empleados' FROM empleado;
```

2. ¿Cuántos clientes tiene cada país?
```sql
SELECT pais, COUNT(*) AS 'Número de clientes' 
FROM direccion_cliente
GROUP BY pais;
```

3. ¿Cuál fue el pago medio en 2009?
```sql
SELECT AVG(total) AS 'Pago medio en 2009'
FROM pago
WHERE YEAR(fecha_pago) = 2009;
```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql
SELECT estado, COUNT(*) AS 'Número de pedidos'
FROM pedido
GROUP BY estado
ORDER BY COUNT(*) DESC;
```

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql
SELECT MAX(precio_venta) AS 'Precio más caro', 
       MIN(precio_venta) AS 'Precio más barato'
FROM producto;
```

6. Calcula el número de clientes que tiene la empresa.
```sql
SELECT COUNT(*) AS 'Número de clientes' FROM cliente;
```

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
```sql
SELECT COUNT(*) AS 'Clientes en Madrid'
FROM direccion_cliente
WHERE ciudad = 'Madrid';
```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
SELECT ciudad, COUNT(*) AS 'Número de clientes'
FROM direccion_cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad;
```

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
SELECT e.nombre, e.apellido1, COUNT(c.codigo_cliente) AS 'Número de clientes'
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
GROUP BY e.codigo_empleado;
```

10. Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
SELECT COUNT(*) AS 'Clientes sin representante'
FROM cliente
WHERE codigo_empleado_rep_ventas IS NULL;
```

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
SELECT c.nombre, c.apellido1, c.apellido2,
       MIN(p.fecha_pago) AS 'Primer pago',
       MAX(p.fecha_pago) AS 'Último pago'
FROM cliente c
INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente;
```

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
SELECT p.codigo_pedido, COUNT(DISTINCT dp.codigo_producto) AS 'Productos diferentes'
FROM pedido p
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
GROUP BY p.codigo_pedido;
```

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
SELECT p.codigo_pedido, SUM(dp.cantidad) AS 'Total productos'
FROM pedido p
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
GROUP BY p.codigo_pedido;
```

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql
SELECT p.nombre, SUM(dp.cantidad) AS 'Unidades vendidas'
FROM producto p
INNER JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
GROUP BY p.codigo_producto
ORDER BY SUM(dp.cantidad) DESC
LIMIT 20;
```

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
```sql
SELECT SUM(dp.cantidad * p.precio_proveedor) AS 'Base imponible',
       ROUND(SUM(dp.cantidad * p.precio_proveedor) * 0.21, 2) AS 'IVA',
       SUM(dp.cantidad * p.precio_venta) AS 'Total facturado'
FROM detalle_pedido dp
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto;
```

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
```sql
SELECT p.codigo_producto,
       SUM(dp.cantidad * p.precio_proveedor) AS 'Base imponible',
       ROUND(SUM(dp.cantidad * p.precio_proveedor) * 0.21, 2) AS 'IVA',
       SUM(dp.cantidad * p.precio_venta) AS 'Total facturado'
FROM detalle_pedido dp
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY p.codigo_producto;
```

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
```sql
SELECT p.codigo_producto,
       SUM(dp.cantidad * p.precio_proveedor) AS 'Base imponible',
       ROUND(SUM(dp.cantidad * p.precio_proveedor) * 0.21, 2) AS 'IVA',
       SUM(dp.cantidad * p.precio_venta) AS 'Total facturado'
FROM detalle_pedido dp
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto
WHERE p.codigo_producto LIKE 'OR%'
GROUP BY p.codigo_producto;
```

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
```sql
SELECT p.nombre, SUM(dp.cantidad) AS 'Unidades vendidas',
       SUM(dp.cantidad * p.precio_venta) AS 'Total facturado',
       ROUND(SUM(dp.cantidad * p.precio_venta) * 1.21, 2) AS 'Total con IVA'
FROM detalle_pedido dp
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY p.codigo_producto
HAVING SUM(dp.cantidad * p.precio_venta) > 3000;
```

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
```sql
SELECT YEAR(fecha_pago) AS 'Año', SUM(total) AS 'Total pagos'
FROM pago
GROUP BY YEAR(fecha_pago);
```

### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

```sql
SELECT c.nombre, COUNT(p.codigo_pedido) AS 'Pedidos realizados'
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente;
```

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

```sql
SELECT c.nombre, COALESCE(SUM(p.total), 0) AS 'Total pagado'
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente;
```

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

```sql
SELECT DISTINCT c.nombre
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre ASC;
```

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

```sql
SELECT c.nombre, CONCAT(e.nombre, ' ', e.apellido1) AS 'Representante', o.telefono
FROM cliente c
LEFT JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;
```

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.

```sql
SELECT c.nombre, CONCAT(e.nombre, ' ', e.apellido1) AS 'Representante', o.ciudad
FROM cliente c
LEFT JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;
```

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

```sql
SELECT e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_cliente IS NULL;
```

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

```sql
SELECT o.ciudad, COUNT(e.codigo_empleado) AS 'Número de empleados'
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad;
```

