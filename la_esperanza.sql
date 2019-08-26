use master
create database la_esperanza
/*drop database la_esperanza*/

use la_esperanza
go

create table sucursal (
  numero_sucursal       INT				NOT NULL,
  nombre_sucursal       VARCHAR(40)		NOT NULL,
  direccion_sucursal    VARCHAR(40)		NOT NULL,
  telefono_sucursal     VARCHAR(40)		NOT NULL,
  gerente				VARCHAR(40)		NOT NULL
);
create table empleado (
  numero_empleado       VARCHAR(13)		NOT NULL,
  nombre_empleado       VARCHAR(30)		NOT NULL,
  direccion_empleado    VARCHAR(20)		NOT NULL,
  telefono_empleado     VARCHAR(20)		NOT NULL,
  puesto                VARCHAR(10)		NOT NULL,
  numero_sucursal       INT				NOT NULL
);
create table producto (
  id_producto           INT				NOT NULL,
  descripcion           VARCHAR(50)		NOT NULL,
  existencia            INT				NOT NULL,
  precio_producto       FLOAT			NOT NULL,
  tamaño                VARCHAR(10)		NOT NULL,
  precio_compra         FLOAT			NOT NULL,
  precio_venta          FLOAT			NOT NULL
);
create table proveedor (
  id_proveedor			VARCHAR(13)		NOT NULL,
  nombre_proveedor      VARCHAR(30)		NOT NULL,
  direccion_proveedor   VARCHAR(20)		NOT NULL,
  telefono_proveedor    VARCHAR(20)		NOT NULL,
  correo                VARCHAR(30)		NOT NULL
);
create table venta (
  numero_venta          INT				NOT NULL,
  fecha_venta           DATE			NOT NULL,
  hora_venta            TIME			NOT NULL,
  forma_pago            VARCHAR(10)		NOT NULL,
  numero_empleado       VARCHAR(13)		NOT NULL
);
create table compra (
  numero_compra         INT				NOT NULL,
  fecha_compra          DATE			NOT NULL,
  hora_compra           TIME			NOT NULL,
  forma_pago            VARCHAR(10)		NOT NULL,
  numero_empleado       VARCHAR(13)		NOT NULL,
  id_proveedor			VARCHAR(13)		NOT NULL
);

create table producto_venta (
  numero_venta          INT				NOT NULL,
  id_producto           INT				NOT NULL,
  cantidad_venta        INT				NOT NULL
);
create table producto_compra (
  numero_compra         INT				NOT NULL,
  id_producto           INT				NOT NULL,
  cantidad_compra       INT				NOT NULL
);

/*
===================================================================
	Primary Keys
===================================================================
*/
ALTER TABLE empleado
	add primary key(numero_empleado)
ALTER TABLE sucursal
	add primary key(numero_sucursal)
ALTER TABLE producto
	add primary key(id_producto)
ALTER TABLE proveedor
	add primary key(id_proveedor)
ALTER TABLE venta
	add primary key(numero_venta)
ALTER TABLE compra
	add primary key(numero_compra)
ALTER TABLE producto_venta
	add primary key(numero_venta, id_producto)
ALTER TABLE producto_compra
	add primary key(numero_compra, id_producto)

/*
===================================================================
	Primary Keys
===================================================================
*/

ALTER TABLE empleado
	add foreign key (numero_sucursal)
	references sucursal (numero_sucursal)
	on update cascade
ALTER TABLE venta
	add foreign key (numero_empleado)
	references empleado (numero_empleado)
	on update cascade
ALTER TABLE compra
	add foreign key (numero_empleado)
	references empleado (numero_empleado)
	on update cascade
ALTER TABLE compra
	add foreign key (id_proveedor)
	references proveedor (id_proveedor)
	on update cascade
ALTER TABLE producto_venta
	add foreign key (numero_venta)
	references venta (numero_venta)
	on update cascade
ALTER TABLE producto_venta
	add foreign key (id_producto)
	references producto (id_producto)
	on update cascade
ALTER TABLE producto_compra
	add foreign key (numero_compra)
	references compra (numero_compra)
	on update cascade
ALTER TABLE producto_compra
	add foreign key (id_producto)
	references producto (id_producto)
	on update cascade


insert into sucursal
	(numero_sucursal, nombre_sucursal, direccion_sucursal, telefono_sucursal, gerente)
VALUES
	(1, 'Flores', 'Mansions Apt 56B', '559684725364', 'Andrea Lopez'),
	(2, 'El Buen Sabor', 'Calle Ignacio Rayon No.949', '559632874125', 'Juan Pacheco'),
	(3, 'Cafetal', 'Independencia No. 670', '559632114782', 'Ramon Hernandez'),
	(4, 'Boulevard', 'Marzo No. 17', '559683247156', 'Dolores Flores'),
	(11, 'Flores', 'Mansions Apt 56B', '559684725364', 'Andrea Lopez'),
	(12, 'El Buen Sabor', 'Calle Ignacio Rayon No.949', '559632874125', 'Juan Pacheco'),
	(13, 'Cafetal', 'Independencia No. 670', '559632114782', 'Ramon Hernandez'),
	(14, 'Boulevard', 'Marzo No. 17', '559683247156', 'Dolores Flores'),
	(21, 'Flores', 'Mansions Apt 56B', '559684725364', 'Andrea Lopez'),
	(22, 'El Buen Sabor', 'Calle Ignacio Rayon No.949', '559632874125', 'Juan Pacheco'),
	(23, 'Cafetal', 'Independencia No. 670', '559632114782', 'Ramon Hernandez'),
	(24, 'Boulevard', 'Marzo No. 17', '559683247156', 'Dolores Flores'),
	(31, 'Flores', 'Mansions Apt 56B', '559684725364', 'Andrea Lopez'),
	(32, 'El Buen Sabor', 'Calle Ignacio Rayon No.949', '559632874125', 'Juan Pacheco'),
	(33, 'Cafetal', 'Independencia No. 670', '559632114782', 'Ramon Hernandez'),
	(34, 'Boulevard', 'Marzo No. 17', '559683247156', 'Dolores Flores')

select * from sucursal;

update sucursal set telefono_sucursal='555555555555' where nombre_sucursal = 'El Buen Sabor';
