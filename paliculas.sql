use PELICULAS

CREATE TABLE ACTOR_PRINCIPAL (
	ID_ACT_PRINCIPAL VARCHAR(5) PRIMARY KEY NOT NULL, 
	NOM_ACT_PRINCIPAL VARCHAR(50), 
	TEL_ACT_PRINCIPAL VARCHAR(13), 
	DOMICILIO VARCHAR(20)
);

CREATE TABLE PAPEL (
	CVE_PAPEL VARCHAR(5) PRIMARY KEY NOT NULL,
	DESCRIPCION VARCHAR(20),
	PAGO FLOAT,
	EDAD INT,
);

CREATE TABLE PELICULA (
	CVE_PEL	 VARCHAR(5) PRIMARY KEY NOT NULL,
	DESCRIPCION VARCHAR(30),
	TIPO_PEL VARCHAR(15),
	DURACION FLOAT
);

CREATE TABLE EXTRA (
	DNI_EXTRA VARCHAR(5) PRIMARY KEY NOT NULL,
	EXTRA  VARCHAR(50), 
	TEL_EXTRA  VARCHAR(13), 
	EXTRA_DIRECCION VARCHAR(20)
);

CREATE TABLE ACTOR_PELICULA (
	DNI_ACTOR	VARCHAR(5) NOT NULL ,
	CLAVE_PELICULA VARCHAR(5)NOT NULL
);

insert into ACTOR_PRINCIPAL
values
('A1', 'Juan Perez',	'56-57-20', 'Av 13'),
('A2', 'Luis Gomez',	'14-34-12', 'Calle Zapotecas'),
('A3', 'Maria Guzman',	'78-40-13', 'Periferico 123'),
('A4', 'Pedro Juarez',	'77-34-90', 'Oriente 45')

insert into PAPEL
values
('P1', 'Protagonista',			'10000',	'20'),
('P2', 'Secundario',			'8000',		'21'),
('P3', 'De reparto',			'5000',		'19'),
('P4', 'De pequeñas partes',	'2500',		'22'),
('P5', 'Figurante',				'2000',		'23')

insert into PELICULA
values
('PEL1', 'El Fin del Mundo',			'Accion',	'3'),
('PEL2', 'El regreso de Chucky',		'Terror',	'2'),
('PEL3', 'El Pais de las Maravillas',	'Fantasia', '2.5'),
('PEL4', 'Mi suegra',					'Comedia',	'2')

insert into EXTRA
values
('A5', 'Ana Juarez',	'56-57-20', 'Av 20'),
('A2', 'Luis Gomez',	'14-34-12', 'Calle Zapotecas'),
('A6', 'Daniel Lopez',	'78-40-13', 'Sur 18'),
('A4', 'Pedro Juarez',	'77-34-90', 'Oriente 45')

insert into ACTOR_PELICULA
values
('A1', 'PEL1'),
('A2', 'PEL1'),
('A3', 'PEL1'),
('A4', 'PEL2'),
('A5', 'PEL3'),
('A6', 'PEL4'),
('A1', 'PEL2'),
('A5', 'PEL1'),
('A6', 'PEL3')

select * from TODOS_ACTORES
