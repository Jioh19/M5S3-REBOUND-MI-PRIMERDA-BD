create table empresa (
	rut varchar(10) PRIMARY KEY,
	nombre varchar(120) NOT NULL,
	direccion varchar(120) NOT NULL,
	telefono varchar(15) NOT NULL,
	correo varchar(80) NOT NULL,
	web varchar(50) NOT NULL
);

create table cliente (
    rut varchar(10) PRIMARY KEY,
    nombre varchar(120) NOT NULL,
    correo varchar(80) NOT NULL,
    direccion varchar(120) NOT NULL,
    celular varchar(15) NOT NULL,
    alta char(1) NOT NULL
);

create table tipovehiculo (
    idtipovehiculo int PRIMARY KEY,
    nombre varchar(120) NOT NULL
);

create table marca (
    idmarca int PRIMARY KEY,
    nombre varchar(120) NOT NULL


);
create table vehiculo (
    idvehiculo int PRIMARY KEY,
    patente varchar(20) NOT NULL,
    marca varchar(20) NOT NULL,
    modelo varchar(20) NOT NULL,
    color varchar(15) NOT NULL,
    precio int NOT NULL,
    frecuenciamantencion int NOT NULL,
    idmarca int,
    idtipovehiculo int,
    CONSTRAINT fk_marca
        FOREIGN KEY (idmarca)
            REFERENCES marca(idmarca),
    CONSTRAINT fk_tipovehiculo
        FOREIGN KEY (idtipovehiculo)
            REFERENCES tipovehiculo(idtipovehiculo)
);


create table venta (
    folio int PRIMARY KEY,
    fecha date NOT NULL,
    monto int NOT NULL,
    rut varchar(10),
    idvehiculo int UNIQUE,
    CONSTRAINT fk_cliente
        FOREIGN KEY (rut)
            REFERENCES cliente(rut),
    CONSTRAINT fk_vehiculo
        FOREIGN KEY (idvehiculo)
            REFERENCES vehiculo(idvehiculo)
);

CREATE UNIQUE INDEX venta_idx ON venta(idvehiculo);

create table mantencion (
    idmantencion int PRIMARY KEY,
    fecha date,
    trabajosrealizados varchar(1000),
    folio int,
    CONSTRAINT fk_venta
        FOREIGN KEY (folio)
            REFERENCES venta(folio)
);