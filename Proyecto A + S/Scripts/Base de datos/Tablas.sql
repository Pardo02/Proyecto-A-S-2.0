create database FamilyShop character set utf8mb4 collate utf8mb4_spanish2_ci;
use FamilyShop;

-- Tabla creada para ahorrar espacio en la tabla cliente --
create table if not exists estado_civil (
id_estado_civil int primary key auto_increment, 
Descripcion varchar (15) not null
);
-- Tabla creada para ahorrar espacio en la tabla cliente --
Create table if not exists Region (
id_region int auto_increment primary key,
descripcion varchar (100) not null
);
-- Tabla para registrar cliente --
create table if not exists cliente_familycard ( 
RUT_cliente VARCHAR(12) primary key,
NOMBRE VARCHAR (150) not null,
CORREO VARCHAR (100) not null,
CELULAR VARCHAR (12) not null,
id_Region int not null,
DIRECCION VARCHAR (100) not null,
Id_estado_civil int not null,
Referencia_nombre varchar (100) not null,
referencia_celular varchar (12) not null,
foreign key (id_region) references Region(id_region),
foreign key (id_estado_civil) references estado_civil (id_estado_civil) 
);

-- Tabla para registrar productos --
create table if not exists Producto (
id_producto varchar(30) primary key not null,
Descripcion varchar (100) not null,
Marca varchar (50) not null,
precio double not null,
cantidad int not null
);

-- Tabla para ahorrar espacio en la tabla boleta --
Create table if not exists tipo_pago (
id_tipo_pago int auto_increment primary key,
descripcion varchar (30)	
);

-- Tabla para registrar ventas --
create table if not exists boleta (
id_boleta int primary key auto_increment,
rut varchar (12),
fecha date not null,
total double,
iva double,
id_tipo_pago int,
foreign key (id_tipo_pago) references tipo_pago (id_tipo_pago)
);

-- Tabla creada para poder agregar mas de un producto a la venta--
Create table if not exists detalle_boleta (
id_boleta int not null,
id_producto varchar (30) not null,
cantidad_producto int not null,
Precio_producto double not null,
foreign key (id_producto) references producto (id_producto),
foreign key (id_boleta) references boleta (id_boleta)
);

-- Tabla creada para ahorrar espacio en la tabla pagos --
create table if not exists tipo_pago_familycard (
id_tipo_pago_familycard int primary key auto_increment,
descripcion varchar (15)
);

-- Tabla creada para registrar los pagos de ventas realizadas con tarjeta de la tienda --
create table if not exists pagos (
id_pagos int primary KEY auto_increment,
rut varchar (12) not null,
id_tipo_pago_familycard int not null,
fecha date,
monto double not null,
foreign key (rut) references cliente_familycard (rut_cliente),
foreign key (id_tipo_pago_familycard) references tipo_pago_familycard (id_tipo_pago_familycard)
);

-- Tabla creada para registrar avances a los clientes --
create table if not exists Avances (
id_avance int primary key auto_increment,
monto double not null, 
cuotas int,
monto_x_cuota double not null,
fecha date,
rut varchar (12),
foreign key (rut) references cliente_familycard (rut_cliente)
);

-- Tabla creada para registrar compras realizadas con la tarjetad de la tienda --
create table if not exists compra_familycard (
id_compra_familycard int primary key auto_increment,
rut varchar (12) not null,
id_boleta int not null,
cuotas int not null,
monto double not null,
foreign key (rut) references cliente_familycard (rut_cliente),
foreign key (id_boleta) references boleta (id_boleta)
);


create table if not exists clientecuotas (
Rut varchar (12) not null, 
Total_deuda double not null,
foreign key (rut) references cliente_familycard (rut_cliente)
);