use master
create database class01

use class01

create table empleado (
  rfc_empleado          VARCHAR(13) NOT NULL,
  nombre_empleado       VARCHAR(30) NOT NULL,
  direccion_empleado    VARCHAR(30) NOT NULL,
  telefono_empleado     VARCHAR(13) NOT NULL,
  puesto                VARCHAR(10) NOT NULL,
  numero_sucursal       INT(10)     NOT NULL
);
create table sucursal (
  numero_sucursal       INT(10)     NOT NULL,
  nombre_sucursal       VARCHAR(20) NOT NULL,
  direccion_sucursal    VARCHAR(30) NOT NULL,
  telefono_sucursal     VARCHAR(13) NOT NULL,
  numero_empleados      INT(2)      NOT NULL
);
create table producto (
  id_producto           INT(10)     NOT NULL,
  descripcion           VARCHAR(50) NOT NULL,
  existencia            INT(100)    NOT NULL,
  precio_producto       FLOAT       NOT NULL,
  tamaño                VARCHAR(10) NOT NULL,
  precio_compra         FLOAT       NOT NULL,
  precio_venta          FLOAT       NOT NULL
);
create table proveedor (
  rfc_proveedor         VARCHAR(13) NOT NULL,
  nombre_proveedor      VARCHAR(30) NOT NULL,
  direccion_proveedor   VARCHAR(30) NOT NULL,
  telefono_proveedor    VARCHAR(13) NOT NULL,
  correo                VARCHAR(30) NOT NULL
);
create table venta (
  numero_venta          INT(10)     NOT NULL,
  fecha_venta           DATE        NOT NULL,
  cantidad_venta        INT(10)     NOT NULL,
  hora_venta            TIME        NOT NULL,
  forma_pago            VARCHAR(10) NOT NULL,
  rfc_empleado          VARCHAR(13) NOT NULL
);
create table compra (
  numero_compra         INT(10)     NOT NULL,
  fecha_compra          DATE        NOT NULL,
  cantidad_compra       INT(10)     NOT NULL,
  hora_compra           TIME        NOT NULL,
  forma_pago            VARCHAR(10) NOT NULL,
  rfc_empleado          VARCHAR(13) NOT NULL,
  rfc_proveedor         VARCHAR(13) NOT NULL
);

create table producto_venta (
  numero_venta          INT(10)     NOT NULL,
  id_producto           INT(10)     NOT NULL
);
create table producto_compra (
  numero_compra         INT(10)     NOT NULL,
  id_producto           INT(10)     NOT NULL
);

ALTER TABLE empleado
	add primary key(rfc_empleado)
ALTER TABLE sucursal
	add primary key(numero_sucursal)
ALTER TABLE producto
	add primary key(id_producto)
ALTER TABLE proveedor
	add primary key(rfc_proveedor)
ALTER TABLE venta
	add primary key(numero_venta)
ALTER TABLE compra
	add primary key(numero_compra)
  
ALTER TABLE producto_venta
	add primary key(numero_venta, id_producto)
ALTER TABLE producto_venta
	add primary key(numero_compra, id_producto)

ALTER TABLE empleado
	Aadd foreign key (numero_sucursal)
	references sucursal (numero_sucursal)
	on update cascade
ALTER TABLE venta
	Aadd foreign key (rfc_empleado)
	references empleado (rfc_empleado)
	on update cascade
ALTER TABLE compra
	Aadd foreign key (rfc_empleado)
	references empleado (rfc_empleado)
	on update cascade
ALTER TABLE compra
	Aadd foreign key (rfc_proveedor)
	references proveedor (rfc_proveedor)
	on update cascade
ALTER TABLE producto_venta
	Aadd foreign key (numero_venta)
	references venta (numero_venta)
	on update cascade
ALTER TABLE producto_venta
	Aadd foreign key (id_producto)
	references producto (id_producto)
	on update cascade
ALTER TABLE producto_compra
	Aadd foreign key (numero_compra)
	references venta (numero_compra)
	on update cascade
ALTER TABLE producto_compra
	Aadd foreign key (id_producto)
	references producto (id_producto)
	on update cascade
