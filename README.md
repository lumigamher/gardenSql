- [ ] 
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
SELECT p.codigo_producto, p.nombre, p.gama, p.dimensiones, p.proveedor, p.descripcion, p.cantidad_en_stock, p.precio_venta, p.precio_proveedor
FROM producto p
LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL LIMIT 10;

+-----------------+-------------------------------------------------------------+----------+-------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| codigo_producto | nombre                                                      | gama     | dimensiones | proveedor                 | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | cantidad_en_stock | precio_venta | precio_proveedor |
+-----------------+-------------------------------------------------------------+----------+-------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
| FR-104          | Olea-Olivos                                                 | Frutales | 12/4        | Frutales Talavera S.A     | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.          |                50 |        49.00 |            39.00 |
| FR-14           | Calamondin Mini                                             | Frutales |             | Frutales Talavera S.A     | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada, corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                           |                15 |        10.00 |             8.00 |
| FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              | Frutales |             | NaranjasValencianas.com   |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               350 |         4.00 |             3.00 |
| FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          | Frutales |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               350 |         4.00 |             3.00 |
| FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte | Frutales |             | Frutales Talavera S.A     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |               350 |         4.00 |             3.00 |
| FR-24           | Albaricoquero Corbato                                       | Frutales |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                            |               400 |         8.00 |             6.00 |
| FR-25           | Albaricoquero Moniqui                                       | Frutales |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                            |               400 |         8.00 |             6.00 |
| FR-26           | Albaricoquero Kurrot                                        | Frutales |             | Melocotones de Cieza S.A. | árbol que puede pasar de los 6 m de altura, en la región mediterránea con ramas formando una copa redondeada. La corteza del tronco es pardo-violácea, agrietada, las ramas son rojizas y extendidas cuando jóvenes y las ramas secundarias son cortas, divergentes y escasas. Las yemas latentes son frecuentes especialmente sobre las ramas viejas.                                                                                                                                                                                                                                                                                                            |               400 |         8.00 |             6.00 |
| FR-27           | Cerezo Burlat                                               | Frutales |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo "Duke", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado        |               400 |         8.00 |             6.00 |
| FR-28           | Cerezo Picota                                               | Frutales |             | Jerte Distribuciones S.L. | Las principales especies de cerezo cultivadas en el mundo son el cerezo dulce (Prunus avium), el guindo (P. cerasus) y el cerezo "Duke", híbrido de los anteriores. Ambas especies son naturales del sureste de Europa y oeste de Asia. El cerezo dulce tuvo su origen probablemente en el mar Negro y en el mar Caspio, difundiéndose después hacia Europa y Asia, llevado por los pájaros y las migraciones humanas. Fue uno de los frutales más apreciados por los griegos y con el Imperio Romano se extendió a regiones muy diversas. En la actualidad, el cerezo se encuentra difundido por numerosas regiones y países del mundo con clima templado        |               400 |         8.00 |             6.00 |
+-----------------+-------------------------------------------------------------+----------+-------------+---------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------------------+--------------+------------------+
10 rows in set (0,00 sec)
```

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto:

```sql
SELECT p.nombre, p.descripcion
FROM producto p
LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
WHERE dp.codigo_producto IS NULL LIMIT 5;

+-------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| nombre                                                      | descripcion                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
+-------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Olea-Olivos                                                 | Existen dos hipótesis sobre el origen del olivo, una que postula que proviene de las costas de Siria, Líbano e Israel y otra que considera que lo considera originario de Asia menor. La llegada a Europa probablemente tuvo lugar de mano de los Fenicios, en transito por Chipre, Creta, e Islas del Mar Egeo, pasando a Grecia y más tarde a Italia. Los primeros indicios de la presencia del olivo en las costas mediterráneas españolas coinciden con el dominio romano, aunque fueron posteriormente los árabes los que impulsaron su cultivo en Andalucía, convirtiendo a España en el primer país productor de aceite de oliva a nivel mundial.          |
| Calamondin Mini                                             | Se trata de un pequeño arbolito de copa densa, con tendencia a la verticalidad, inerme o con cortas espinas. Sus hojas son pequeñas, elípticas de 5-10 cm de longitud, con los pecíolos estrechamente alados.Posee 1 o 2 flores en situación axilar, al final de las ramillas.Sus frutos son muy pequeños (3-3,5 cm de diámetro), con pocas semillas, esféricos u ovales, con la zona apical aplanada, corteza de color naranja-rojizo, muy fina y fácilmente separable de la pulpa, que es dulce, ácida y comestible..                                                                                                                                           |
| Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
+-------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
5 rows in set (0,00 sec)
```

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales:

```sql
SELECT o.codigo_oficina, o.ciudad, o.telefono
FROM oficina o
WHERE NOT EXISTS (
    SELECT 1
    FROM empleado e
    INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    INNER JOIN gama_producto gp ON pr.gama = gp.gama
    WHERE gp.gama = 'Frutales'
    AND e.codigo_oficina = o.codigo_oficina
);

+----------------+---------+-----------------+
| codigo_oficina | ciudad  | telefono        |
+----------------+---------+-----------------+
| LON-UK         | Londres | +44 20 78772041 |
| PAR-FR         | Paris   | +33 14 723 4404 |
| TOK-JP         | Tokyo   | +81 33 224 5000 |
+----------------+---------+-----------------+
3 rows in set (0,03 sec)
```

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago:

```sql
SELECT c.codigo_cliente, c.nombre, c.nombre_contacto, c.apellido_contacto
FROM cliente c
WHERE EXISTS (
    SELECT 1
    FROM pedido p
    WHERE p.codigo_cliente = c.codigo_cliente
)
AND NOT EXISTS (
    SELECT 1
    FROM pago pa
    WHERE pa.codigo_cliente = c.codigo_cliente
);
+----------------+-------------+-----------------+-------------------+
| codigo_cliente | nombre      | nombre_contacto | apellido_contacto |
+----------------+-------------+-----------------+-------------------+
|             36 | Flores S.L. | Antonio         | Romero            |
+----------------+-------------+-----------------+-------------------+
1 row in set (0,00 sec)
```

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado:

```sql
SELECT e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, j.nombre AS nombre_jefe
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
WHERE c.codigo_cliente IS NULL
GROUP BY e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, j.nombre;

+-----------------+-------------+------------+-----------+-------------+
| codigo_empleado | nombre      | apellido1  | apellido2 | nombre_jefe |
+-----------------+-------------+------------+-----------+-------------+
|               1 | Marcos      | Magaña     | Perez     | NULL        |
|               2 | Ruben       | López      | Martinez  | Marcos      |
|               3 | Alberto     | Soria      | Carrasco  | Ruben       |
|               4 | Maria       | Solís      | Jerez     | Ruben       |
|               6 | Juan Carlos | Ortiz      | Serrano   | Alberto     |
|               7 | Carlos      | Soria      | Jimenez   | Alberto     |
|              10 | Hilario     | Rodriguez  | Huertas   | Carlos      |
|              15 | Francois    | Fignon     |           | Alberto     |
|              17 | Laurent     | Serra      |           | Francois    |
|              20 | Hilary      | Washington |           | Alberto     |
|              21 | Marcus      | Paxton     |           | Hilary      |
|              23 | Nei         | Nishikori  |           | Alberto     |
|              24 | Narumi      | Riko       |           | Nei         |
|              25 | Takuma      | Nomura     |           | Nei         |
|              26 | Amy         | Johnson    |           | Alberto     |
|              27 | Larry       | Westfalls  |           | Amy         |
|              28 | John        | Walton     |           | Amy         |
|              29 | Kevin       | Fallmer    |           | Alberto     |
+-----------------+-------------+------------+-----------+-------------+
18 rows in set (0,02 sec)
```

### consultas resumen

1. ¿Cuántos empleados hay en la compañía?
```sql
SELECT COUNT(*) AS 'Número de empleados' FROM empleado;

+----------------------+
| Número de empleados  |
+----------------------+
|                   27 |
+----------------------+
1 row in set (0,03 sec)
```

2. ¿Cuántos clientes tiene cada país?
```sql
SELECT pais, COUNT(*) AS 'Número de clientes' 
FROM direccion_cliente
GROUP BY pais;

+----------------+---------------------+
| pais           | Número de clientes  |
+----------------+---------------------+
| USA            |                   4 |
| Spain          |                  27 |
| France         |                   2 |
| Australia      |                   2 |
| United Kingdom |                   1 |
+----------------+---------------------+
5 rows in set (0,02 sec)
```

3. ¿Cuál fue el pago medio en 2009?
```sql
SELECT AVG(total) AS 'Pago medio en 2009'
FROM pago
WHERE YEAR(fecha_pago) = 2009;

+--------------------+
| Pago medio en 2009 |
+--------------------+
|        4504.076923 |
+--------------------+
1 row in set (0,01 sec)
```

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
```sql
SELECT estado, COUNT(*) AS 'Número de pedidos'
FROM pedido
GROUP BY estado
ORDER BY COUNT(*) DESC;

+-----------+--------------------+
| estado    | Número de pedidos  |
+-----------+--------------------+
| Entregado |                 61 |
| Pendiente |                 30 |
| Rechazado |                 24 |
+-----------+--------------------+
3 rows in set (0,00 sec)
```

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
```sql
SELECT MAX(precio_venta) AS 'Precio más caro', 
       MIN(precio_venta) AS 'Precio más barato'
FROM producto;

+------------------+--------------------+
| Precio más caro  | Precio más barato  |
+------------------+--------------------+
|           462.00 |               1.00 |
+------------------+--------------------+
1 row in set (0,01 sec)
```

6. Calcula el número de clientes que tiene la empresa.
```sql
SELECT COUNT(*) AS 'Número de clientes' FROM cliente;

+---------------------+
| Número de clientes  |
+---------------------+
|                  36 |
+---------------------+
1 row in set (0,01 sec)
```

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
```sql
SELECT COUNT(*) AS 'Clientes en Madrid'
FROM direccion_cliente
WHERE ciudad = 'Madrid';

+--------------------+
| Clientes en Madrid |
+--------------------+
|                 11 |
+--------------------+
1 row in set (0,00 sec)
```

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?
```sql
SELECT ciudad, COUNT(*) AS 'Número de clientes'
FROM direccion_cliente
WHERE ciudad LIKE 'M%'
GROUP BY ciudad;
+----------------------+---------------------+
| ciudad               | Número de clientes  |
+----------------------+---------------------+
| Miami                |                   2 |
| Madrid               |                  11 |
| Montornes del valles |                   1 |
+----------------------+---------------------+
3 rows in set (0,01 sec)
```

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
```sql
SELECT e.nombre, e.apellido1, COUNT(c.codigo_cliente) AS 'Número de clientes'
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
GROUP BY e.codigo_empleado;

+-----------------+------------+---------------------+
| nombre          | apellido1  | Número de clientes  |
+-----------------+------------+---------------------+
| Marcos          | Magaña     |                   0 |
| Ruben           | López      |                   0 |
| Alberto         | Soria      |                   0 |
| Maria           | Solís      |                   0 |
| Felipe          | Rosas      |                   5 |
| Juan Carlos     | Ortiz      |                   0 |
| Carlos          | Soria      |                   0 |
| Mariano         | López      |                   4 |
| Lucio           | Campoamor  |                   2 |
| Hilario         | Rodriguez  |                   0 |
| Francois        | Fignon     |                   0 |
| Lionel          | Narvaez    |                   2 |
| Laurent         | Serra      |                   0 |
| Michael         | Bolton     |                   2 |
| Walter Santiago | Sanchez    |                   2 |
| Hilary          | Washington |                   0 |
| Marcus          | Paxton     |                   0 |
| Lorena          | Paxton     |                   2 |
| Nei             | Nishikori  |                   0 |
| Narumi          | Riko       |                   0 |
| Takuma          | Nomura     |                   0 |
| Amy             | Johnson    |                   0 |
| Larry           | Westfalls  |                   0 |
| John            | Walton     |                   0 |
| Kevin           | Fallmer    |                   0 |
| Julian          | Bellinelli |                   5 |
| Mariko          | Kishi      |                   2 |
+-----------------+------------+---------------------+
27 rows in set (0,01 sec)
```

10. Calcula el número de clientes que no tiene asignado representante de ventas.
```sql
SELECT COUNT(*) AS 'Clientes sin representante'
FROM cliente
WHERE codigo_empleado_rep_ventas IS NULL;

+----------------------------+
| Clientes sin representante |
+----------------------------+
|                          0 |
+----------------------------+
1 row in set (0,00 sec)
```

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
```sql
SELECT
    c.nombre,
    c.nombre_contacto,
    c.apellido_contacto,
    MIN(p.fecha_pago) AS fecha_primer_pago,
    MAX(p.fecha_pago) AS fecha_ultimo_pago
FROM
    cliente c
INNER JOIN
    pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY
    c.codigo_cliente,
    c.nombre,
    c.nombre_contacto,
    c.apellido_contacto;

+--------------------------------+-----------------+-------------------+-------------------+-------------------+
| nombre                         | nombre_contacto | apellido_contacto | fecha_primer_pago | fecha_ultimo_pago |
+--------------------------------+-----------------+-------------------+-------------------+-------------------+
| GoldFish Garden                | Daniel G        | GoldFish          | 2008-11-10        | 2008-12-10        |
| Gardening Associates           | Anne            | Wright            | 2009-01-16        | 2009-02-19        |
| Gerudo Valley                  | Link            | Flaute            | 2007-01-08        | 2007-01-08        |
| Tendo Garden                   | Akane           | Tendo             | 2006-01-18        | 2006-01-18        |
| Beragua                        | Jose            | Bermejo           | 2009-01-13        | 2009-01-13        |
| Naturagua                      | Guillermo       | Rengifo           | 2009-01-06        | 2009-01-06        |
| Camunas Jardines S.L.          | Pedro           | Camunas           | 2008-08-04        | 2008-08-04        |
| Dardena S.A.                   | Juan            | Rodriguez         | 2008-07-15        | 2008-07-15        |
| Jardin de Flores               | Javier          | Villar            | 2009-01-15        | 2009-02-15        |
| Flores Marivi                  | Maria           | Rodriguez         | 2009-02-16        | 2009-02-16        |
| Golf S.A.                      | Luis            | Martinez          | 2009-03-06        | 2009-03-06        |
| Sotogrande                     | Maria           | Santillana        | 2009-03-26        | 2009-03-26        |
| Jardines y Mansiones Cactus SL | Eva María       | Sánchez           | 2008-03-18        | 2008-03-18        |
| Jardinerías Matías SL          | Matías          | San Martín        | 2009-02-08        | 2009-02-08        |
| Agrojardin                     | Benito          | Lopez             | 2009-01-13        | 2009-01-13        |
| Jardineria Sara                | Sara            | Marquez           | 2009-01-16        | 2009-01-16        |
| Tutifruti S.A                  | Jacob           | Jones             | 2007-10-06        | 2007-10-06        |
| El Jardin Viviente S.L         | Justin          | Smith             | 2006-05-26        | 2006-05-26        |
+--------------------------------+-----------------+-------------------+-------------------+-------------------+
18 rows in set (0,02 sec)
```

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
```sql
SELECT p.codigo_pedido, COUNT(DISTINCT dp.codigo_producto) AS 'Productos diferentes'
FROM pedido p
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
GROUP BY p.codigo_pedido;

+---------------+----------------------+
| codigo_pedido | Productos diferentes |
+---------------+----------------------+
|             1 |                    5 |
|             2 |                    7 |
|             3 |                    6 |
|             4 |                    8 |
|             8 |                    3 |
|             9 |                    4 |
|            10 |                    3 |
|            11 |                    2 |
|            12 |                    1 |
|            13 |                    3 |
|            14 |                    2 |
|            15 |                    4 |
|            16 |                    2 |
|            17 |                    5 |
|            18 |                    3 |
|            19 |                    5 |
|            20 |                    2 |
|            21 |                    3 |
|            22 |                    1 |
|            23 |                    4 |
|            24 |                    4 |
|            25 |                    3 |
|            26 |                    3 |
|            27 |                    3 |
|            28 |                    3 |
|            29 |                    5 |
|            30 |                    6 |
|            31 |                    3 |
|            32 |                    5 |
|            33 |                    4 |
|            34 |                    4 |
|            35 |                    5 |
|            36 |                    5 |
|            37 |                    3 |
|            38 |                    2 |
|            39 |                    2 |
|            40 |                    2 |
|            41 |                    2 |
|            42 |                    2 |
|            43 |                    1 |
|            44 |                    1 |
|            45 |                    2 |
|            46 |                    2 |
|            47 |                    2 |
|            48 |                    5 |
|            49 |                    3 |
|            50 |                    3 |
|            51 |                    3 |
|            52 |                    1 |
|            53 |                    4 |
|            54 |                    7 |
|            55 |                    5 |
|            56 |                    6 |
|            57 |                    4 |
|            58 |                    4 |
|            59 |                    1 |
|            60 |                    1 |
|            61 |                    1 |
|            62 |                    1 |
|            63 |                    1 |
|            64 |                    1 |
|            65 |                    1 |
|            66 |                    1 |
|            67 |                    1 |
|            68 |                    1 |
|            74 |                    3 |
|            75 |                    3 |
|            76 |                    5 |
|            77 |                    2 |
|            78 |                    4 |
|            79 |                    1 |
|            80 |                    3 |
|            81 |                    1 |
|            82 |                    1 |
|            83 |                    1 |
|            89 |                    6 |
|            90 |                    3 |
|            91 |                    3 |
|            92 |                    3 |
|            93 |                    3 |
|            94 |                    3 |
|            95 |                    3 |
|            96 |                    4 |
|            97 |                    3 |
|            98 |                    5 |
|            99 |                    2 |
|           100 |                    2 |
|           101 |                    2 |
|           102 |                    2 |
|           103 |                    2 |
|           104 |                    2 |
|           105 |                    2 |
|           106 |                    2 |
|           107 |                    2 |
|           108 |                    2 |
|           109 |                    7 |
|           110 |                    3 |
|           111 |                    1 |
|           112 |                    1 |
|           113 |                    1 |
|           114 |                    1 |
|           115 |                    1 |
|           116 |                    5 |
|           117 |                    4 |
|           118 |                    1 |
|           119 |                    1 |
|           120 |                    1 |
|           121 |                    1 |
|           122 |                    1 |
|           123 |                    1 |
|           124 |                    1 |
|           125 |                    1 |
|           126 |                    1 |
|           127 |                    1 |
|           128 |                    2 |
+---------------+----------------------+
115 rows in set (0,01 sec)
```

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
```sql
SELECT p.codigo_pedido, SUM(dp.cantidad) AS 'Total productos'
FROM pedido p
INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
GROUP BY p.codigo_pedido;
+---------------+-----------------+
| codigo_pedido | Total productos |
+---------------+-----------------+
|             1 |             113 |
|             2 |             164 |
|             3 |             232 |
|             4 |             179 |
|             8 |              14 |
|             9 |             625 |
|            10 |              40 |
|            11 |             260 |
|            12 |             290 |
|            13 |              22 |
|            14 |              21 |
|            15 |              21 |
|            16 |              22 |
|            17 |              25 |
|            18 |              16 |
|            19 |              41 |
|            20 |              22 |
|            21 |              30 |
|            22 |               1 |
|            23 |             194 |
|            24 |              19 |
|            25 |              29 |
|            26 |              27 |
|            27 |              84 |
|            28 |              12 |
|            29 |              40 |
|            30 |              33 |
|            31 |              32 |
|            32 |              40 |
|            33 |             905 |
|            34 |             112 |
|            35 |             178 |
|            36 |              28 |
|            37 |             245 |
|            38 |               7 |
|            39 |               9 |
|            40 |              12 |
|            41 |              10 |
|            42 |               4 |
|            43 |               9 |
|            44 |               5 |
|            45 |              10 |
|            46 |              12 |
|            47 |              14 |
|            48 |             147 |
|            49 |              65 |
|            50 |              71 |
|            51 |             200 |
|            52 |              10 |
|            53 |              10 |
|            54 |              69 |
|            55 |              20 |
|            56 |              22 |
|            57 |              17 |
|            58 |             364 |
|            59 |              10 |
|            60 |              10 |
|            61 |              10 |
|            62 |              10 |
|            63 |              10 |
|            64 |              10 |
|            65 |              10 |
|            66 |              10 |
|            67 |              10 |
|            68 |              10 |
|            74 |              91 |
|            75 |             130 |
|            76 |             374 |
|            77 |              49 |
|            78 |             153 |
|            79 |              50 |
|            80 |             162 |
|            81 |              30 |
|            82 |              34 |
|            83 |              30 |
|            89 |              47 |
|            90 |              41 |
|            91 |             101 |
|            92 |              62 |
|            93 |              79 |
|            94 |             124 |
|            95 |              20 |
|            96 |              36 |
|            97 |              36 |
|            98 |              62 |
|            99 |              45 |
|           100 |              60 |
|           101 |             209 |
|           102 |              55 |
|           103 |              64 |
|           104 |             122 |
|           105 |              48 |
|           106 |             278 |
|           107 |             158 |
|           108 |             112 |
|           109 |              69 |
|           110 |              21 |
|           111 |              10 |
|           112 |              10 |
|           113 |              10 |
|           114 |              10 |
|           115 |              10 |
|           116 |              78 |
|           117 |              24 |
|           118 |              10 |
|           119 |              10 |
|           120 |              10 |
|           121 |              10 |
|           122 |              10 |
|           123 |              10 |
|           124 |              10 |
|           125 |              10 |
|           126 |              10 |
|           127 |              10 |
|           128 |              33 |
+---------------+-----------------+
115 rows in set (0,00 sec)
```

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
```sql
SELECT p.nombre, SUM(dp.cantidad) AS 'Unidades vendidas'
FROM producto p
INNER JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
GROUP BY p.codigo_producto
ORDER BY SUM(dp.cantidad) DESC
LIMIT 20;

+-----------------------------------------------+-------------------+
| nombre                                        | Unidades vendidas |
+-----------------------------------------------+-------------------+
| Thymus Vulgaris                               |               961 |
| Thymus Citriodra (Tomillo limón)              |               455 |
| Rosal bajo 1Âª -En maceta-inicio brotación    |               423 |
| Petrosilium Hortense (Peregil)                |               291 |
| Cerezo                                        |               285 |
| Trachycarpus Fortunei                         |               279 |
| Acer Pseudoplatanus                           |               262 |
| Chamaerops Humilis                            |               236 |
| Tuja orientalis "Aurea nana"                  |               221 |
| Azadón                                        |               220 |
| Brahea Armata                                 |               212 |
| Kaki Rojo Brillante                           |               203 |
| Robinia Pseudoacacia Casque Rouge             |               150 |
| Ajedrea                                       |               135 |
| Limonero 30/40                                |               131 |
| Lavándula Dentata                             |               128 |
| Nerium oleander ARBOL Calibre 8/10            |               127 |
| Nogal Común                                   |               120 |
| Cerezo Napoleón                               |               120 |
| Nectarina                                     |               114 |
+-----------------------------------------------+-------------------+
20 rows in set (0,01 sec)
```

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
```sql
SELECT SUM(dp.cantidad * p.precio_proveedor) AS 'Base imponible',
       ROUND(SUM(dp.cantidad * p.precio_proveedor) * 0.21, 2) AS 'IVA',
       SUM(dp.cantidad * p.precio_venta) AS 'Total facturado'
FROM detalle_pedido dp
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto;

+----------------+----------+-----------------+
| Base imponible | IVA      | Total facturado |
+----------------+----------+-----------------+
|      217576.00 | 45690.96 |       275827.00 |
+----------------+----------+-----------------+
1 row in set (0,02 sec)
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

| codigo_producto | Base imponible | IVA      | Total facturado |
+-----------------+----------------+----------+-----------------+
| FR-67           |       15960.00 |  3351.60 |        19950.00 |
| OR-127          |         200.00 |    42.00 |          280.00 |
| OR-141          |         135.00 |    28.35 |          180.00 |
| OR-241          |         375.00 |    78.75 |          475.00 |
| OR-99           |         418.00 |    87.78 |          532.00 |
| FR-4            |        2024.00 |   425.04 |         2552.00 |
| FR-40           |         294.00 |    61.74 |          392.00 |
| OR-140          |         150.00 |    31.50 |          200.00 |
...
..
.
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

+-----------------+----------------+----------+-----------------+
| codigo_producto | Base imponible | IVA      | Total facturado |
+-----------------+----------------+----------+-----------------+
| OR-127          |         200.00 |    42.00 |          280.00 |
| OR-141          |         135.00 |    28.35 |          180.00 |
| OR-241          |         375.00 |    78.75 |          475.00 |
| OR-99           |         418.00 |    87.78 |          532.00 |
| OR-140          |         150.00 |    31.50 |          200.00 |
| OR-159          |          88.00 |    18.48 |          132.00 |
| OR-227          |       12036.00 |  2527.56 |        15104.00 |
...
..
.
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

+-----------------------+-------------------+-----------------+---------------+
| nombre                | Unidades vendidas | Total facturado | Total con IVA |
+-----------------------+-------------------+-----------------+---------------+
| Cerezo                |               285 |        19950.00 |      24139.50 |
| Chamaerops Humilis    |               236 |        15104.00 |      18275.84 |
| Trachycarpus Fortunei |               279 |       128898.00 |     155966.58 |
| Bismarckia Nobilis    |                35 |         9310.00 |      11265.10 |
| Limonero 30/40        |               131 |        13100.00 |      15851.00 |
| Dracaena Drago        |                55 |         3520.00 |       4259.20 |
| Kaki                  |                76 |         5320.00 |       6437.20 |
| Melocotonero          |               111 |         3552.00 |       4297.92 |
| Beucarnea Recurvata   |                80 |         3120.00 |       3775.20 |
| Beucarnea Recurvata   |                70 |         4130.00 |       4997.30 |
+-----------------------+-------------------+-----------------+---------------+
10 rows in set (0,01 sec)
```

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
```sql
SELECT YEAR(fecha_pago) AS 'Año', SUM(total) AS 'Total pagos'
FROM pago
GROUP BY YEAR(fecha_pago);

+------+-------------+
| Año  | Total pagos |
+------+-------------+
| 2008 |    29252.00 |
| 2009 |    58553.00 |
| 2007 |    85170.00 |
| 2006 |    24965.00 |
+------+-------------+
4 rows in set (0,00 sec)
```

### Subconsultas

#### Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

   ```sql
   SELECT nombre FROM cliente WHERE limite_credito = (SELECT MAX(limite_credito) FROM cliente);
   
   +--------------+
   | nombre       |
   +--------------+
   | Tendo Garden |
   +--------------+
   1 row in set (0,00 sec)
   ```

   

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```sql
   SELECT nombre FROM producto WHERE precio_venta = (SELECT MAX(precio_venta) FROM producto);
   +-----------------------+
   | nombre                |
   +-----------------------+
   | Trachycarpus Fortunei |
   +-----------------------+
   1 row in set (0,00 sec)
   ```

   

3. Devuelve el nombre del producto del que se han vendido más unidades.
  (Tenga en cuenta que tendrá que calcular cuál es el número total de
  unidades que se han vendido de cada producto a partir de los datos de la
  tabla detalle_pedido)

  ```sql
  SELECT p.nombre FROM producto p
  INNER JOIN(
  	SELECT codigo_producto, SUM(cantidad) AS total_unidades
  	FROM detalle_pedido
      GROUP BY codigo_producto
      ORDER BY total_unidades DESC
      LIMIT 1 
  ) dp ON p.codigo_producto = dp.codigo_producto;
  
  +-----------------+
  | nombre          |
  +-----------------+
  | Thymus Vulgaris |
  +-----------------+
  1 row in set (0,01 sec)
  ```

  

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
  realizado. (Sin utilizar INNER JOIN).

  ```sql
  SELECT c.nombre
  FROM cliente c
  WHERE c.limite_credito > (
  	SELECT COALESCE(SUM(total), 0)
      FROM pago
      WHERE codigo_cliente = c.codigo_cliente 
  );
  
  +--------------------------------+
  | nombre                         |
  +--------------------------------+
  | Tendo Garden                   |
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
  | Top Campo                      |
  | Campohermoso                   |
  | france telecom                 |
  | Musée du Louvre                |
  | Tutifruti S.A                  |
  | Flores S.L.                    |
  | The Magic Garden               |
  | El Jardin Viviente S.L         |
  +--------------------------------+
  30 rows in set (0,00 sec)
  ```

  

5. Devuelve el producto que más unidades tiene en stock.

   ```sql
   SELECT nombre FROM producto
   WHERE cantidad_en_stock = (SELECT MAX(cantidad_en_stock) FROM producto)
   ORDER BY cantidad_en_stock DESC LIMIT 1;
   
   +-------------+
   | nombre      |
   +-------------+
   | Rosal copa  |
   +-------------+
   1 row in set (0,00 sec)
   ```

   

6. Devuelve el producto que menos unidades tiene en stock.

   ```sql
   SELECT nombre FROM producto
   WHERE cantidad_en_stock = (SELECT MIN(cantidad_en_stock) FROM producto);
   
   +---------------+
   | nombre        |
   +---------------+
   | Brahea Armata |
   +---------------+
   1 row in set (0,00 sec)
   ```

   

7. Devuelve el nombre, los apellidos y el email de los empleados que están a
  cargo de Alberto Soria.

  ```sql
  SELECT nombre, apellido1, apellido2, email
  FROM empleado
  WHERE codigo_jefe = (
      SELECT codigo_empleado
      FROM empleado
      WHERE nombre = "Alberto" AND apellido1 = "Soria"
  );
  
  +-------------+------------+-----------+---------------------------+
  | nombre      | apellido1  | apellido2 | email                     |
  +-------------+------------+-----------+---------------------------+
  | Felipe      | Rosas      | Marquez   | frosas@jardineria.es      |
  | Juan Carlos | Ortiz      | Serrano   | cortiz@jardineria.es      |
  | Carlos      | Soria      | Jimenez   | csoria@jardineria.es      |
  | Francois    | Fignon     |           | ffignon@gardening.com     |
  | Michael     | Bolton     |           | mbolton@gardening.com     |
  | Hilary      | Washington |           | hwashington@gardening.com |
  | Nei         | Nishikori  |           | nnishikori@gardening.com  |
  | Amy         | Johnson    |           | ajohnson@gardening.com    |
  | Kevin       | Fallmer    |           | kfalmer@gardening.com     |
  +-------------+------------+-----------+---------------------------+
  9 rows in set (0,02 sec)
  ```

  

  #### Subconsultas con ALL y ANY

8. Devuelve el nombre del cliente con mayor límite de crédito.

   ```SQL
   SELECT nombre 
   FROM cliente
   WHERE limite_credito >= ALL(SELECT limite_credito FROM cliente);
   +--------------+
   | nombre       |
   +--------------+
   | Tendo Garden |
   +--------------+
   1 row in set (0,00 sec)
   ```

   

9. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```sql
   SELECT nombre
   FROM producto
   WHERE precio_venta >= ALL(SELECT precio_venta FROM producto);
   
   +-----------------------+
   | nombre                |
   +-----------------------+
   | Trachycarpus Fortunei |
   +-----------------------+
   1 row in set (0,00 sec)
   ```

10. Devuelve el producto que menos unidades tiene en stock.
    Subconsultas con IN y NOT IN

    ```sql
    SELECT nombre
    FROM producto
    WHERE cantidad_en_stock <= ALL (SELECT cantidad_en_stock FROM producto);
    
    +---------------+
    | nombre        |
    +---------------+
    | Brahea Armata |
    +---------------+
    1 row in set (0,00 sec)
    ```

    

11. Devuelve el nombre, apellido1 y cargo de los empleados que no
    representen a ningún cliente.

    ```sql
    SELECT nombre, apellido1, puesto
    FROM empleado
    WHERE codigo_empleado NOT IN (
        SELECT codigo_empleado_rep_ventas
        FROM cliente
        WHERE codigo_empleado_rep_ventas IS NOT NULL
    );
    
    +-------------+------------+-----------------------+
    | nombre      | apellido1  | puesto                |
    +-------------+------------+-----------------------+
    | Marcos      | Magaña     | Director General      |
    | Ruben       | López      | Subdirector Marketing |
    | Alberto     | Soria      | Subdirector Ventas    |
    | Maria       | Solís      | Secretaria            |
    | Juan Carlos | Ortiz      | Representante Ventas  |
    | Carlos      | Soria      | Director Oficina      |
    | Hilario     | Rodriguez  | Representante Ventas  |
    | Francois    | Fignon     | Director Oficina      |
    | Laurent     | Serra      | Representante Ventas  |
    | Hilary      | Washington | Director Oficina      |
    | Marcus      | Paxton     | Representante Ventas  |
    | Nei         | Nishikori  | Director Oficina      |
    | Narumi      | Riko       | Representante Ventas  |
    | Takuma      | Nomura     | Representante Ventas  |
    | Amy         | Johnson    | Director Oficina      |
    | Larry       | Westfalls  | Representante Ventas  |
    | John        | Walton     | Representante Ventas  |
    | Kevin       | Fallmer    | Director Oficina      |
    +-------------+------------+-----------------------+
    18 rows in set (0,00 sec)
    ```

    

12. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```sql
    SELECT nombre
    FROM cliente
    WHERE codigo_cliente NOT IN (
    	SELECT codigo_cliente
        FROM pago
    );
    
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
    18 rows in set (0,00 sec)
    ```

    

13. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```sql
    SELECT nombre
    FROM cliente
    WHERE codigo_cliente IN (
    	SELECT codigo_cliente
        FROM pago
    );
    
    +--------------------------------+
    | nombre                         |
    +--------------------------------+
    | GoldFish Garden                |
    | Gardening Associates           |
    | Gerudo Valley                  |
    | Tendo Garden                   |
    | Beragua                        |
    | Naturagua                      |
    | Camunas Jardines S.L.          |
    | Dardena S.A.                   |
    | Jardin de Flores               |
    | Flores Marivi                  |
    | Golf S.A.                      |
    | Sotogrande                     |
    | Jardines y Mansiones Cactus SL |
    | Jardinerías Matías SL          |
    | Agrojardin                     |
    | Jardineria Sara                |
    | Tutifruti S.A                  |
    | El Jardin Viviente S.L         |
    +--------------------------------+
    18 rows in set (0,00 sec)
    ```

    

14. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```sql
    SELECT nombre
    FROM producto
    WHERE codigo_producto NOT IN (
    	SELECT codigo_producto
        FROM detalle_pedido
    );
    
    +-------------------------------------------------------------+
    | nombre                                                      |
    +-------------------------------------------------------------+
    | Olea-Olivos                                                 |
    | Calamondin Mini                                             |
    | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
    | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
    | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
    | Albaricoquero Corbato                                       |
    | Albaricoquero Moniqui                                       |
    ...
    ..
    .
    129 rows in set (0,00 sec)
    ```

    

15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
    empleados que no sean representante de ventas de ningún cliente.

    ```sql
    SELECT e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono
    FROM empleado e
    INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
    WHERE e.codigo_empleado NOT IN (
        SELECT codigo_empleado_rep_ventas
        FROM cliente
        WHERE codigo_empleado_rep_ventas IS NOT NULL
    );
    
    +-------------+------------+-----------+-----------------------+-----------------+
    | nombre      | apellido1  | apellido2 | puesto                | telefono        |
    +-------------+------------+-----------+-----------------------+-----------------+
    | Hilary      | Washington |           | Director Oficina      | +1 215 837 0825 |
    | Marcus      | Paxton     |           | Representante Ventas  | +1 215 837 0825 |
    | Amy         | Johnson    |           | Director Oficina      | +44 20 78772041 |
    | Larry       | Westfalls  |           | Representante Ventas  | +44 20 78772041 |
    | John        | Walton     |           | Representante Ventas  | +44 20 78772041 |
    | Carlos      | Soria      | Jimenez   | Director Oficina      | +34 91 7514487  |
    | Hilario     | Rodriguez  | Huertas   | Representante Ventas  | +34 91 7514487  |
    | Francois    | Fignon     |           | Director Oficina      | +33 14 723 4404 |
    | Laurent     | Serra      |           | Representante Ventas  | +33 14 723 4404 |
    | Kevin       | Fallmer    |           | Director Oficina      | +61 2 9264 2451 |
    | Marcos      | Magaña     | Perez     | Director General      | +34 925 867231  |
    | Ruben       | López      | Martinez  | Subdirector Marketing | +34 925 867231  |
    | Alberto     | Soria      | Carrasco  | Subdirector Ventas    | +34 925 867231  |
    | Maria       | Solís      | Jerez     | Secretaria            | +34 925 867231  |
    | Juan Carlos | Ortiz      | Serrano   | Representante Ventas  | +34 925 867231  |
    | Nei         | Nishikori  |           | Director Oficina      | +81 33 224 5000 |
    | Narumi      | Riko       |           | Representante Ventas  | +81 33 224 5000 |
    | Takuma      | Nomura     |           | Representante Ventas  | +81 33 224 5000 |
    +-------------+------------+-----------+-----------------------+-----------------+
    18 rows in set (0,01 sec)
    ```

    

16. Devuelve las oficinas donde no trabajan ninguno de los empleados que
    hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```sql
    SELECT o.codigo_oficina, o.ciudad, o.telefono
    FROM oficina o
    WHERE NOT EXISTS (
        SELECT 1
        FROM empleado e
        INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
        INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
        INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
        INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
        INNER JOIN gama_producto gp ON pr.gama = gp.gama
        WHERE gp.gama = 'Frutales'
        AND e.codigo_oficina = o.codigo_oficina
    );
    
    +----------------+---------+-----------------+
    | codigo_oficina | ciudad  | telefono        |
    +----------------+---------+-----------------+
    | LON-UK         | Londres | +44 20 78772041 |
    | PAR-FR         | Paris   | +33 14 723 4404 |
    | TOK-JP         | Tokyo   | +81 33 224 5000 |
    +----------------+---------+-----------------+
    3 rows in set (0,01 sec)
    ```

    

17. Devuelve un listado con los clientes que han realizado algún pedido pero no
    han realizado ningún pago.

    ```sql
    SELECT c.codigo_cliente, c.nombre, c.nombre_contacto, c.apellido_contacto
    FROM cliente c
    WHERE EXISTS (
        SELECT 1
        FROM pedido p
        WHERE p.codigo_cliente = c.codigo_cliente
    )
    AND NOT EXISTS (
        SELECT 1
        FROM pago pa
        WHERE pa.codigo_cliente = c.codigo_cliente
    );
    
    +----------------+-------------+-----------------+-------------------+
    | codigo_cliente | nombre      | nombre_contacto | apellido_contacto |
    +----------------+-------------+-----------------+-------------------+
    |             36 | Flores S.L. | Antonio         | Romero            |
    +----------------+-------------+-----------------+-------------------+
    1 row in set (0,00 sec)
    ```

    

    #### Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han
    realizado ningún pago.

    ```sql
    SELECT nombre
    FROM cliente c
    WHERE NOT EXISTS (
        SELECT 1
        FROM pago p
        WHERE p.codigo_cliente = c.codigo_cliente
    );
    
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
    18 rows in set (0,00 sec)
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado
    algún pago.

    ```sql
    SELECT nombre
    FROM cliente c
    WHERE EXISTS (
        SELECT 1
        FROM pago p
        WHERE p.codigo_cliente = c.codigo_cliente
    );
    
    +--------------------------------+
    | nombre                         |
    +--------------------------------+
    | GoldFish Garden                |
    | Gardening Associates           |
    | Gerudo Valley                  |
    | Tendo Garden                   |
    | Beragua                        |
    | Naturagua                      |
    | Camunas Jardines S.L.          |
    | Dardena S.A.                   |
    | Jardin de Flores               |
    | Flores Marivi                  |
    | Golf S.A.                      |
    | Sotogrande                     |
    | Jardines y Mansiones Cactus SL |
    | Jardinerías Matías SL          |
    | Agrojardin                     |
    | Jardineria Sara                |
    | Tutifruti S.A                  |
    | El Jardin Viviente S.L         |
    +--------------------------------+
    18 rows in set (0,00 sec)
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un
    pedido.

    ```sql
    SELECT nombre
    FROM producto p
    WHERE NOT EXISTS (
        SELECT 1
        FROM detalle_pedido dp
        WHERE dp.codigo_producto = p.codigo_producto
    );
    
    +-----------------+-------------------------------------------------------------+
    | codigo_producto | nombre                                                      |
    +-----------------+-------------------------------------------------------------+
    | FR-104          | Olea-Olivos                                                 |
    | FR-14           | Calamondin Mini                                             |
    | FR-19           | Camelia Blanco, Chrysler Rojo, Soraya Naranja,              |
    | FR-20           | Landora Amarillo, Rose Gaujard bicolor blanco-rojo          |
    | FR-21           | Kordes Perfect bicolor rojo-amarillo, Roundelay rojo fuerte |
    | FR-24           | Albaricoquero Corbato                                       |
    | FR-25           | Albaricoquero Moniqui                                       |
    | FR-26           | Albaricoquero Kurrot                                        |
    | FR-27           | Cerezo Burlat                                               |
    | FR-28           | Cerezo Picota                                               |
    ```

    

    

21. Devuelve un listado de los productos que han aparecido en un pedido
    alguna vez.

    ```sql
    SELECT DISTINCT nombre
    FROM producto p
    WHERE EXISTS (
        SELECT 1
        FROM detalle_pedido dp
        WHERE dp.codigo_producto = p.codigo_producto
    );
    
    +-------------------------------------------------------------+
    | nombre                                                      |
    +-------------------------------------------------------------+
    | Sierra de Poda 400MM                                        |
    | Pala                                                        |
    | Rastrillo de Jardín                                         |
    | Azadón                                                      |
    | Ajedrea                                                     |
    | Lavándula Dentata                                           |
    | Mejorana                                                    |
    | Melissa                                                     |
    | Mentha Sativa                                               |
    ...
    ..
    .
    
    ```

### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

```sql
SELECT c.nombre, COUNT(p.codigo_pedido) AS 'Pedidos realizados'
FROM cliente c
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente;

+--------------------------------+--------------------+
| nombre                         | Pedidos realizados |
+--------------------------------+--------------------+
| GoldFish Garden                |                 11 |
| Gardening Associates           |                  9 |
| Gerudo Valley                  |                  5 |
| Tendo Garden                   |                  5 |
| Lasas S.A.                     |                  0 |
| Beragua                        |                  5 |
| Club Golf Puerta del hierro    |                  0 |
| Naturagua                      |                  5 |
| DaraDistribuciones             |                  0 |
...
..
.
```

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

```sql
SELECT c.nombre, COALESCE(SUM(p.total), 0) AS 'Total pagado'
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente;

+--------------------------------+--------------+
| nombre                         | Total pagado |
+--------------------------------+--------------+
| GoldFish Garden                |      4000.00 |
| Gardening Associates           |     10926.00 |
| Gerudo Valley                  |     81849.00 |
| Tendo Garden                   |     23794.00 |
| Lasas S.A.                     |         0.00 |
| Beragua                        |      2390.00 |
| Club Golf Puerta del hierro    |         0.00 |
| Naturagua                      |       929.00 |
| DaraDistribuciones             |         0.00 |

...
..
.
```

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

```sql
SELECT DISTINCT c.nombre
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE YEAR(p.fecha_pedido) = 2008
ORDER BY c.nombre ASC;

+--------------------------------+
| nombre                         |
+--------------------------------+
| Camunas Jardines S.L.          |
| Dardena S.A.                   |
| El Jardin Viviente S.L         |
| Flores Marivi                  |
| Flores S.L.                    |
| Gerudo Valley                  |
| GoldFish Garden                |
| Jardin de Flores               |
| Jardines y Mansiones Cactus SL |
| Tendo Garden                   |
| Tutifruti S.A                  |
+--------------------------------+
11 rows in set (0,00 sec)
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

+--------------------------------+-------------------------+----------------------+
| nombre                         | Representante           | ciudad               |
+--------------------------------+-------------------------+----------------------+
| GoldFish Garden                | Walter Santiago Sanchez | San Francisco        |
| Gardening Associates           | Walter Santiago Sanchez | San Francisco        |
| Gerudo Valley                  | Lorena Paxton           | Boston               |
| Tendo Garden                   | Lorena Paxton           | Boston               |
| Lasas S.A.                     | Mariano López           | Madrid               |
| Beragua                        | NULL                    | NULL                 |
| Club Golf Puerta del hierro    | NULL                    | NULL                 |
| Naturagua                      | NULL                    | NULL                 |
| DaraDistribuciones             | NULL                    | NULL                 |
| Madrileña de riegos            | NULL                    | NULL                 |
| Lasas S.A.                     | Mariano López           | Madrid               |
| Camunas Jardines S.L.          | Mariano López           | Madrid               |
| Dardena S.A.                   | Mariano López           | Madrid               |
| Jardin de Flores               | Julian Bellinelli       | Sydney               |
| Flores Marivi                  | Felipe Rosas            | Talavera de la Reina |
| Flowers, S.A                   | Felipe Rosas            | Talavera de la Reina |
| Naturajardin                   | Julian Bellinelli       | Sydney               |
| Golf S.A.                      | NULL                    | NULL                 |
| Americh Golf Management SL     | NULL                    | NULL                 |
| Aloha                          | NULL                    | NULL                 |
| El Prat                        | NULL                    | NULL                 |
| Sotogrande                     | NULL                    | NULL                 |
| Vivero Humanes                 | Julian Bellinelli       | Sydney               |
| Fuenla City                    | Felipe Rosas            | Talavera de la Reina |
| Jardines y Mansiones Cactus SL | Lucio Campoamor         | Madrid               |
| Jardinerías Matías SL          | Lucio Campoamor         | Madrid               |
| Agrojardin                     | Julian Bellinelli       | Sydney               |
| Top Campo                      | Felipe Rosas            | Talavera de la Reina |
| Jardineria Sara                | Felipe Rosas            | Talavera de la Reina |
| Campohermoso                   | Julian Bellinelli       | Sydney               |
| france telecom                 | Lionel Narvaez          | Paris                |
| Musée du Louvre                | Lionel Narvaez          | Paris                |
| Tutifruti S.A                  | Mariko Kishi            | Sydney               |
| Flores S.L.                    | Michael Bolton          | San Francisco        |
| The Magic Garden               | Michael Bolton          | San Francisco        |
| El Jardin Viviente S.L         | Mariko Kishi            | Sydney               |
+--------------------------------+-------------------------+----------------------+
36 rows in set (0,01 sec)
```

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

```sql
SELECT e.nombre, e.apellido1, e.apellido2, e.puesto, o.telefono
FROM empleado e
LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.codigo_cliente IS NULL;

+-------------+------------+-----------+-----------------------+-----------------+
| nombre      | apellido1  | apellido2 | puesto                | telefono        |
+-------------+------------+-----------+-----------------------+-----------------+
| Marcos      | Magaña     | Perez     | Director General      | +34 925 867231  |
| Ruben       | López      | Martinez  | Subdirector Marketing | +34 925 867231  |
| Alberto     | Soria      | Carrasco  | Subdirector Ventas    | +34 925 867231  |
| Maria       | Solís      | Jerez     | Secretaria            | +34 925 867231  |
| Juan Carlos | Ortiz      | Serrano   | Representante Ventas  | +34 925 867231  |
| Carlos      | Soria      | Jimenez   | Director Oficina      | +34 91 7514487  |
| Hilario     | Rodriguez  | Huertas   | Representante Ventas  | +34 91 7514487  |
| Francois    | Fignon     |           | Director Oficina      | +33 14 723 4404 |
| Laurent     | Serra      |           | Representante Ventas  | +33 14 723 4404 |
| Hilary      | Washington |           | Director Oficina      | +1 215 837 0825 |
| Marcus      | Paxton     |           | Representante Ventas  | +1 215 837 0825 |
| Nei         | Nishikori  |           | Director Oficina      | +81 33 224 5000 |
| Narumi      | Riko       |           | Representante Ventas  | +81 33 224 5000 |
| Takuma      | Nomura     |           | Representante Ventas  | +81 33 224 5000 |
| Amy         | Johnson    |           | Director Oficina      | +44 20 78772041 |
| Larry       | Westfalls  |           | Representante Ventas  | +44 20 78772041 |
| John        | Walton     |           | Representante Ventas  | +44 20 78772041 |
| Kevin       | Fallmer    |           | Director Oficina      | +61 2 9264 2451 |
+-------------+------------+-----------+-----------------------+-----------------+
18 rows in set (0,00 sec)
```

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

```sql
SELECT o.ciudad, COUNT(e.codigo_empleado) AS 'Número de empleados'
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad;

+----------------------+----------------------+
| ciudad               | Número de empleados  |
+----------------------+----------------------+
| Boston               |                    3 |
| Londres              |                    3 |
| Madrid               |                    4 |
| Paris                |                    3 |
| San Francisco        |                    2 |
| Sydney               |                    3 |
| Talavera de la Reina |                    6 |
| Tokyo                |                    3 |
+----------------------+----------------------+
8 rows in set (0,01 sec)
```

## Vistas

1. Vista con todos los clientes y sus límites de crédito:

```sql
CREATE VIEW clientes_con_limite_credito AS
SELECT nombre, limite_credito
FROM cliente;
```

2. Vista con los productos que tienen un precio de venta mayor a 100:

```sql
CREATE VIEW productos_caros AS
SELECT nombre, precio_venta
FROM producto
WHERE precio_venta > 100;
```

3. Vista con los empleados que tienen un jefe asignado:

```sql
CREATE VIEW empleados_con_jefe AS
SELECT e.nombre, e.apellido1, j.nombre AS nombre_jefe
FROM empleado e
INNER JOIN empleado j ON e.codigo_jefe = j.codigo_empleado;
```

4. Vista con los pedidos que aún no han sido entregados:

```sql
CREATE VIEW pedidos_pendientes AS
SELECT codigo_pedido, fecha_pedido, fecha_esperada
FROM pedido
WHERE fecha_entrega IS NULL;
```

5. Vista con los productos que tienen un stock inferior a 10 unidades:

```sql
CREATE VIEW productos_bajo_stock AS
SELECT nombre, cantidad_en_stock
FROM producto
WHERE cantidad_en_stock < 10;
```

6. Vista con los clientes que han realizado más de 5 pedidos:

```sql
CREATE VIEW clientes_frecuentes AS
SELECT c.nombre, COUNT(p.codigo_pedido) AS num_pedidos
FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre
HAVING COUNT(p.codigo_pedido) > 5;
```

7. Vista con los empleados que no son representantes de ventas:

```sql
CREATE VIEW empleados_no_representantes AS
SELECT nombre, apellido1, puesto
FROM empleado
WHERE codigo_empleado NOT IN (
    SELECT codigo_empleado_rep_ventas
    FROM cliente
    WHERE codigo_empleado_rep_ventas IS NOT NULL
);
```

8. Vista con los productos que pertenecen a la gama 'Frutales':

```sql
CREATE VIEW productos_gama_frutales AS
SELECT p.nombre, p.descripcion
FROM producto p
INNER JOIN gama_producto gp ON p.gama = gp.gama
WHERE gp.gama = 'Frutales';
```

9. Vista con los clientes que no tienen límite de crédito:

```sql
CREATE VIEW clientes_sin_limite_credito AS
SELECT nombre
FROM cliente
WHERE limite_credito IS NULL;
```

10. Vista con los empleados que trabajan en la oficina de 'Madrid':

```sql
CREATE VIEW empleados_oficina_madrid AS
SELECT e.nombre, e.apellido1, e.puesto
FROM empleado e
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE o.ciudad = 'Madrid';
```

## Procedimientos almacenados

1. Procedimiento para insertar un nuevo producto:

```sql
CREATE PROCEDURE InsertarProducto (
    IN codigo VARCHAR(15),
    IN nombre VARCHAR(70),
    IN gama VARCHAR(50),
    IN dimensiones VARCHAR(25),
    IN proveedor VARCHAR(50),
    IN descripcion TEXT,
    IN cantidad_en_stock SMALLINT,
    IN precio_venta NUMERIC(15,2),
    IN precio_proveedor NUMERIC(15,2)
)
BEGIN
    INSERT INTO producto (codigo_producto, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor)
    VALUES (codigo, nombre, gama, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor);
END;
```

2. Procedimiento para actualizar el límite de crédito de un cliente:

```sql
CREATE PROCEDURE ActualizarLimiteCredito (
    IN codigo INT,
    IN nuevoLimite DECIMAL(15,2)
)
BEGIN
    UPDATE cliente
    SET limite_credito = nuevoLimite
    WHERE codigo_cliente = codigo;
END;
```

3. Procedimiento para eliminar un pedido:

```sql
CREATE PROCEDURE EliminarPedido (
    IN codigoPedido INT
)
BEGIN
    DELETE FROM pedido WHERE codigo_pedido = codigoPedido;
    DELETE FROM detalle_pedido WHERE codigo_pedido = codigoPedido;
END;
```

4. Procedimiento para obtener el total de ventas de un producto:

```sql
CREATE PROCEDURE ObtenerTotalVentasProducto (
    IN codigoProducto VARCHAR(15),
    OUT totalVentas NUMERIC(15,2)
)
BEGIN
    SELECT SUM(dp.cantidad * dp.precio_unitario) INTO totalVentas
    FROM detalle_pedido dp
    INNER JOIN pedido p ON dp.codigo_pedido = p.codigo_pedido
    WHERE dp.codigo_producto = codigoProducto;
END;
```

5. Procedimiento para actualizar la información de un empleado:

```sql
CREATE PROCEDURE ActualizarEmpleado (
    IN codigo INT,
    IN nombre VARCHAR(50),
    IN apellido1 VARCHAR(50),
    IN apellido2 VARCHAR(50),
    IN extension VARCHAR(10),
    IN email VARCHAR(100),
    IN codigo_oficina VARCHAR(15),
    IN codigo_jefe INT,
    IN puesto VARCHAR(50)
)
BEGIN
    UPDATE empleado
    SET nombre = nombre,
        apellido1 = apellido1,
        apellido2 = apellido2,
        extension = extension,
        email = email,
        codigo_oficina = codigo_oficina,
        codigo_jefe = codigo_jefe,
        puesto = puesto
    WHERE codigo_empleado = codigo;
END;
```

6. Procedimiento para obtener el número de pedidos realizados por un cliente:

```sql
CREATE PROCEDURE ObtenerNumPedidosCliente (
    IN codigoCliente INT,
    OUT numPedidos INT
)
BEGIN
    SELECT COUNT(*) INTO numPedidos
    FROM pedido
    WHERE codigo_cliente = codigoCliente;
END;
```

7. Procedimiento para insertar un nuevo pago:

```sql
CREATE PROCEDURE InsertarPago (
    IN codigoCliente INTEGER,
    IN formaPago VARCHAR(40),
    IN idTransaccion VARCHAR(50),
    IN fechaPago DATE,
    IN total NUMERIC(15,2)
)
BEGIN
    INSERT INTO pago (codigo_cliente, forma_pago, id_transaccion, fecha_pago, total)
    VALUES (codigoCliente, formaPago, idTransaccion, fechaPago, total);
END;
```

8. Procedimiento para obtener los productos con stock por debajo de un valor específico:

```sql
CREATE PROCEDURE ObtenerProductosBajoStock (
    IN nivelStock SMALLINT,
    OUT productos CURSOR VARYING
)
BEGIN
    OPEN productos FOR
        SELECT nombre, cantidad_en_stock
        FROM producto
        WHERE cantidad_en_stock < nivelStock;
END;
```

9. Procedimiento para eliminar un cliente y sus pedidos asociados:

```sql
CREATE PROCEDURE EliminarCliente (
    IN codigoCliente INT
)
BEGIN
    DELETE FROM pedido WHERE codigo_cliente = codigoCliente;
    DELETE FROM detalle_pedido WHERE codigo_pedido IN (
        SELECT codigo_pedido FROM pedido WHERE codigo_cliente = codigoCliente
    );
    DELETE FROM cliente WHERE codigo_cliente = codigoCliente;
END;
```

10. Procedimiento para obtener los clientes que no han realizado ningún pedido:

```sql
CREATE PROCEDURE ObtenerClientesSinPedidos (
    OUT clientes CURSOR VARYING
)
BEGIN
    OPEN clientes FOR
        SELECT codigo_cliente, nombre
        FROM cliente
        WHERE codigo_cliente NOT IN (
            SELECT codigo_cliente
            FROM pedido
        );
END;
```

