use PELICULAS;

create table actor_principal (
	id_act_principal VARCHAR(5) PRIMARY KEY NOT NULL, 
	nom_act_principal VARCHAR(50), 
	tel_act_principal VARCHAR(13), 
	domicilio VARCHAR(20)
);

create table papel (
	cve_papel VARCHAR(5) PRIMARY KEY NOT NULL,
	descripcion VARCHAR(20),
	pago float,
	edad int,
);

create table pelicula (
	cve_pel	 VARCHAR(5) PRIMARY KEY NOT NULL,
	descripcion VARCHAR(20),
	tipo_pel VARCHAR(15),
	duracion float
);

create table extra (
	dni_extra VARCHAR(5) PRIMARY KEY NOT NULL,
	extra  VARCHAR(50), 
	tel_extra  VARCHAR(13), 
	extra_direccion VARCHAR(20)
);

create table actor_pelicula (
	dni_actor	VARCHAR(5) NOT NULL ,
	clave_pelicula VARCHAR(5)NOT NULL
);
