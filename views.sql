CREATE VIEW EmpleadosPorCiudad AS
SELECT o.ciudad, COUNT(e.codigo_empleado) AS 'Número de empleados'
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
GROUP BY o.ciudad;