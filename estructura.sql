CREATE DATABASE Garden3;

USE Garden3;

-- Tabla gama_producto
CREATE TABLE gama_producto (
    gama VARCHAR(50) PRIMARY KEY,
    descripcion TEXT
);

-- Tabla producto
CREATE TABLE producto (
    codigo_producto VARCHAR(15) NOT NULL,
    nombre VARCHAR(70) NOT NULL,
    gama VARCHAR(50) NOT NULL,
    dimensiones VARCHAR(25) NULL,
    proveedor VARCHAR(50) DEFAULT NULL,
    descripcion TEXT NULL,
    cantidad_en_stock SMALLINT NOT NULL,
    precio_venta NUMERIC(15,2) NOT NULL,
    precio_proveedor NUMERIC(15,2) DEFAULT NULL,
    PRIMARY KEY (codigo_producto),
    FOREIGN KEY (gama) REFERENCES gama_producto (gama)
);

-- Tabla oficina
CREATE TABLE oficina (
    codigo_oficina VARCHAR(15) PRIMARY KEY,
    ciudad VARCHAR(50),
    telefono VARCHAR(20)
);

-- Tabla empleado
CREATE TABLE empleado (
    codigo_empleado INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    extension VARCHAR(10),
    email VARCHAR(100),
    codigo_oficina VARCHAR(15),
    codigo_jefe INT,
    puesto VARCHAR(50),
    FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina),
    FOREIGN KEY (codigo_jefe) REFERENCES empleado(codigo_empleado)
);

-- Tabla cliente
CREATE TABLE cliente (
    codigo_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    nombre_contacto VARCHAR(50),
    apellido_contacto VARCHAR(50),
    telefono VARCHAR(15),
    fax VARCHAR(15),
    codigo_empleado_rep_ventas INT,
    limite_credito DECIMAL(15,2),
    FOREIGN KEY (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);

-- Nueva tabla dirección_cliente
CREATE TABLE direccion_cliente (
    codigo_direccion INT PRIMARY KEY,
    codigo_cliente INT,
    linea_direccion1 VARCHAR(50),
    linea_direccion2 VARCHAR(50),
    ciudad VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(15),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

-- Tabla pago
CREATE TABLE pago (
    codigo_cliente INTEGER NOT NULL,
    forma_pago VARCHAR(40) NOT NULL,
    id_transaccion VARCHAR(50) NOT NULL,
    fecha_pago DATE NOT NULL,
    total NUMERIC(15,2) NOT NULL,
    PRIMARY KEY (codigo_cliente, id_transaccion),
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

-- Tabla pedido
CREATE TABLE pedido (
    codigo_pedido INT PRIMARY KEY,
    fecha_pedido DATE,
    fecha_esperada DATE,
    fecha_entrega DATE,
    estado VARCHAR(50),
    comentarios TEXT,
    codigo_cliente INT,
    FOREIGN KEY (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

-- Tabla detalle_pedido
CREATE TABLE detalle_pedido (
    codigo_pedido INT,
    codigo_producto VARCHAR(15),
    cantidad INT,
    precio_unitario DECIMAL(15,2),
    numero_linea SMALLINT,
    PRIMARY KEY (codigo_pedido, codigo_producto),
    FOREIGN KEY (codigo_pedido) REFERENCES pedido(codigo_pedido),
    FOREIGN KEY (codigo_producto) REFERENCES producto(codigo_producto)
);

-- Nueva tabla direccion_oficina
CREATE TABLE direccion_oficina (
    codigo_direccion INT PRIMARY KEY,
    codigo_oficina VARCHAR(15),
    linea_direccion1 VARCHAR(50),
    region VARCHAR(50),
    pais VARCHAR(50),
    codigo_postal VARCHAR(15),
    FOREIGN KEY (codigo_oficina) REFERENCES oficina(codigo_oficina)
);
