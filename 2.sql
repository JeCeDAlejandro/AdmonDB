CREATE DATABASE La_esperanza;
drop database La_esperanza;
use master;

USE La_esperanza;

CREATE TABLE Sucursal(
cve_suc int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
nombre_suc VARCHAR(20), 
dir_sur VARCHAR(20), 
tel_suc VARCHAR(20), 
gerente VARCHAR(20), 
no_empleados int
);

CREATE TABLE Empleado(
no_emp int PRIMARY KEY IDENTITY(1,1) NOT NULL,
nombre_emp VARCHAR(20), 
dir_emp VARCHAR(20), 
tel_emp VARCHAR(15), 
turno int, 
puesto VARCHAR(50), 
correo_emp VARCHAR(30),
cve_suc_1 int FOREIGN KEY REFERENCES Sucursal(cve_suc)
);

CREATE TABLE Inventario(
cve_prod int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
descripcion VARCHAR(30),  
precio_venta float,
precio_compra float,
existencia int
);

CREATE TABLE Venta(
no_venta int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
fecha_venta date, 
hora_venta time, 
forma_pago int, 
no_emp_1 int FOREIGN KEY REFERENCES Empleado(no_emp)
);

CREATE TABLE [Venta-Producto](
no_venta_1 int FOREIGN KEY REFERENCES Venta(no_venta), 
cve_prod_1 int FOREIGN KEY REFERENCES Inventario(cve_prod),
cantidad_vend int,
);

CREATE TABLE Proveedor(
id_prov int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
nombre_prov VARCHAR(20), 
dir_prov VARCHAR(20), 
tel_prov VARCHAR(15), 
correo_prov VARCHAR(30)
);

CREATE TABLE Compra(
no_compra int PRIMARY KEY IDENTITY(1,1) NOT NULL, 
fecha_compra date, 
hora_compra time, 
no_emp_2 int FOREIGN KEY REFERENCES Empleado(no_emp),
id_prov_1 int FOREIGN KEY REFERENCES Proveedor(id_prov) 
);

CREATE TABLE [Compra-Producto](
no_compra_1 int FOREIGN KEY REFERENCES Compra(no_compra), 
cve_prod_2 int FOREIGN KEY REFERENCES Inventario(cve_prod),
cantidad_comp int
);

SELECT * FROM Sucursal;
SELECT * FROM Empleado;
SELECT * FROM Inventario;
SELECT * FROM Venta;
SELECT * FROM [Venta-Producto];
SELECT * FROM Proveedor;
SELECT * FROM Compra;
SELECT * FROM [Compra-Producto];

Insert into Sucursal(nombre_suc,dir_sur,tel_suc,gerente,no_empleados)
values('la villa','Av la villa #45','53529753','luis padilla',20),
            ('azcapotzalco','Av camarones #20','53472987','jose ortiz',25),
            ('aeropuerto','angares #80','53678945','oscar castillo',30),
            ('aragon','Av 608 #1245','55126712','federico hernandez',28),
            ('tlahuac','Av tlahuac #2','56781278','armando carrillo',27);

insert into Empleado(nombre_emp,dir_emp,tel_emp,turno,puesto,correo_emp,cve_suc_1)
values('eduardo yañez','Av tezozomoc 123','53508753',1,'cajero','eduardo@gmail.com',5),
('oscar zamora','Av lomas #23','53567753',2,'biscochero','ozam@gmail.com',1),
('oscar perez','Av lomas #23','53567753',2,'biscochero','ozam@gmail.com',1),
('oscar no sé','Av lomas #23','53567753',2,'biscochero','ozam@gmail.com',1),
('francisco cuevas','calle 1c #123','52347753',1,'gerente','francu@gmail.com',2),
('RAFAEL BUSTOS','Av jacarandas #3','50987653',2,'jefe de piso','rafab@gmail.com',3),
('luis vargas','Av gustabo va #23','56723753',2,'bodeguero','luizv@gmail.com',4)

insert into Inventario (descripcion, precio_venta, precio_compra, existencia)
values
('Arina de trigo 1Kg', 10.50, 7.0, 100),
('Azucar 1Kg', 20.0, 15.0, 80),
('Leche 1Lt', 22.0, 16.0, 66),
('Chocoate 250Gr', 15.0, 7.0, 78),
('Velas Numeros', 30.0, 17.0, 68)


insert into Venta (fecha_venta, hora_venta, forma_pago, no_emp_1)
values
('12-08-2019', '07:33:11', 0, 5),
('13-08-2019', '07:40:25', 1, 6),
('15-08-2019', '09:10:01', 0, 2),
('16-08-2019', '14:05:59', 1, 3),
('17-08-2019', '18:15:29', 1, 4);

insert into Proveedor (nombre_prov, dir_prov, tel_prov, correo_prov)
values ('Harinas SA de CV', 'Av Ignacio 1800', '5510293846', 'arinaslocas@gmail.com'),
('Azucar SA de CV', 'Av Rio Mayo 840', '5537481623', 'azucarmayo@gmail.com'),
('Leche SA de CV', 'Av Rio Tecolutla 225', '558274028365', 'lecheriatecolutla@gmail.com'),
('Chocolate SA  de CV', 'Av Rojo Gomez 780', '5583039417', 'chocolaterojo@gmail.com'),
('Velas SA  de CV', 'Av Te 280', '5588359417', 'velaste@gmail.com')

insert into Inventario (descripcion, precio_venta, precio_compra, existencia)
values
('Arina de trigo 1Kg', 10.50, 7.0, 100),
('Azucar 1Kg', 20.0, 15.0, 80),
('Leche 1Lt', 22.0, 16.0, 66),
('Chocoate 250Gr', 15.0, 7.0, 78),
('Velas Numeros', 30.0, 17.0, 68)

insert into [Venta-Producto] (no_venta_1, cve_prod_1, cantidad_vend)
values
(2, 4,8),
(3, 3,10),
(4, 2,11),
(5, 1,12),
(6, 10,9)

drop table [Venta-Producto];

insert into Compra (fecha_compra, hora_compra, no_emp_2, id_prov_1)
values
('10-08-2019', '10:00:00', 4, 1),
('11-08-2019', '12:00:00', 3, 2),
('12-08-2019', '16:00:00', 2, 3),
('13-08-2019', '18:00:00', 6, 4),
('14-08-2019', '20:00:00', 5, 5);

insert into [Compra-Producto] (no_compra_1, cve_prod_2, cantidad_comp)
values
(2, 4,8),
(3, 3,10),
(4, 2,11),
(5, 1,12),
(6, 10,9)

CREATE VIEW [Empleados_por_sucursal] AS (
SELECT s.cve_suc, s.nombre_suc,
STUFF(
	(SELECT ', ' + e.nombre_emp
	FROM Empleado e
	WHERE e.cve_suc_1 = s.cve_suc
	FOR XML PATH ('')),
	1, 2, '') AS Empleados, no_empleados
FROM Sucursal s
);

select * from Sucursal s
inner join Empleado e on e.cve_suc_1 = s.cve_suc 


DROP VIEW Vista_1;


CREATE VIEW [Ventas_por_sucursal] AS (
SELECT descripcion, no_emp, precio_venta, cantidad_vend, precio_venta * cantidad_vend AS total, cve_suc
FROM [Venta-Producto] vp, Inventario p, Empleado e, Sucursal s, Venta v
WHERE vp.no_venta_1 = v.no_venta AND vp.cve_prod_1 = p.cve_prod AND v.no_emp_1 = e.no_emp AND e.cve_suc_1 = s.cve_suc
);

SELECT * FROM Empleados_por_sucursal;

select * from Ventas_por_sucursal;

SELECT s.cve_suc, s.nombre_suc,
STUFF(
	(SELECT ', ' + e.nombre_emp,
	FROM Empleado e
	WHERE e.cve_suc_1 = s.cve_suc
	FOR XML PATH ('')),
	1, 2, '') AS Productos
FROM Sucursal s;

SELECT * FROM Sucursal;
SELECT * FROM Empleado;
SELECT * FROM Inventario;
SELECT * FROM Venta;
SELECT * FROM [Venta-Producto];
SELECT * FROM Proveedor;
SELECT * FROM Compra;
SELECT * FROM [Compra-Producto];

