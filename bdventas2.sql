--------------------------------------------------------------------------
---- CREACION DE LA BASE DE DATOS
--------------------------------------------------------------------------
use master
go
if exists (select * from sysdatabases where name = 'BDPuntoVenta')
drop database BDPuntoVenta
go
create database BDPuntoVenta
go
--------------------------------------------------------------------------
-- CREACION DE LA TABLA  
--------------------------------------------------------------------------
use BDPuntoVenta
go
 
create table TCliente
( -- lista de atributos
DNICliente varchar (8) not null,
Nombre varchar(50) not null,
Apellidos varchar (50) not null,
primary key (DNICliente)
)
Go

--------------------------------------------------------------------------
-- CREACION DE LA TABLA 
--------------------------------------------------------------------------
use BDPuntoVenta
go
-- Tabla 
create table TEmpleado
( -- lista de atributos
CodEmpleado varchar(10),
Nombres varchar(50) not null,
Apellidos varchar(50)not null,
Funcion varchar(50) not null,
Telefono varchar(9)not null,
Usuario        Varchar(15)       not null,
Contraseña     varchar(50)       not null,
Status_admin   bit                 not null,

-- definicion de la clave foranea
primary key (CodEmpleado)
 
)

Go

use BDPuntoVenta
go

create table usuarios
  (
    id             numeric(15,1) check (id>0),
    Nombre         varchar(15)       not null,
	Usuario        Varchar(15)       not null,
    Contraseña     varchar(50)       not null,
	Status_admin   bit                 not null
  )
  go
--------------------------------------------------------------------------

--------------------------------------------------------------------------
-- CREACION DE LA TABLA 
--------------------------------------------------------------------------
use BDPuntoVenta
go
-- Tabla para Producto
create table TProducto   
( -- lista de atributos
CodProducto        varchar(10) not null,
NombreProducto     varchar(50) not null,
Marca              varchar (50) not null,
UnidadMedida       varchar(50) not null,
UnidadesDisponibles numeric(15,2) check(UnidadesDisponibles > 0),
PrecioUnitario     numeric(15,2) check(PrecioUnitario > 0),
-- definicion de la clave primaria
primary key (CodProducto) 
)
Go

--------------------------------------------------------------------------
-- CREACION DE LA TABLA 
--------------------------------------------------------------------------
use BDPuntoVenta
go
 
create table TDetalleVenta
( -- lista de atributos
CodDetalleVenta varchar(10) not null,
CodProducto varchar (10) not null,
CodEmpleado varchar(10),
DNICliente  varchar (8),
Cantidad numeric not null,
PrecioUnitario varchar(5) not null,
Fecha date ,
 
primary key (CodDetalleVenta),
foreign key (CodProducto) references TProducto(CodProducto),
foreign key (DNICliente) references TCliente(DNICliente),
foreign key (CodEmpleado) references TEmpleado(CodEmpleado)
)
go


insert into usuarios(id,Nombre,Usuario,Contraseña,Status_admin)
	values ('1','Pedro','pedro01','123',1);
insert into usuarios(id,Nombre,Usuario,Contraseña,Status_admin)
	values ('2','Jose','jose02','1234',0);
insert into usuarios(id,Nombre,Usuario,Contraseña,Status_admin)
	values ('3','Martin','martin03','12345',0);

go

insert into TEmpleado(CodEmpleado,Nombres,Apellidos,Funcion,Telefono,Usuario,Contraseña,Status_admin)values ('01','Emilio	     ','  Palomino','Administrador','990234567','emilio01','123',1)
insert into TEmpleado(CodEmpleado,Nombres,Apellidos,Funcion,Telefono,Usuario,Contraseña,Status_admin)values ('02','Boris	      ',' Chullo','Cajero','923172100','boris01','1234',0)
insert into TEmpleado(CodEmpleado,Nombres,Apellidos,Funcion,Telefono,Usuario,Contraseña,Status_admin)values ('03','Luis Beltran','Palma','Cajero','994217622','luis01','12345',0)
insert into TEmpleado(CodEmpleado,Nombres,Apellidos,Funcion,Telefono,Usuario,Contraseña,Status_admin)values ('04','Waldo Elio	 ','  Ibarra	','Cajero','984321276','waldo03','1234',0)
insert into TEmpleado(CodEmpleado,Nombres,Apellidos,Funcion,Telefono,Usuario,Contraseña,Status_admin)values ('05','Jose Mauro	 ','  Pillco	','Cajero','974560989','jose02','123',0)
go



insert into TCliente values('75213750','	Mario	     ','Huaman')
insert into TCliente values('45231678','	Luna Maria	',' Villa')
insert into TCliente values('23456789','	Jose Carlos','	 Rima')
insert into TCliente values('23456790','	Juan	     ','Quispe')
insert into TCliente values('12578903','	Lucia	   ','  Puma')


insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('001','	arroz	','Gallito','	1kg',30,2.80)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('002','	azucar','	3Hoja	','1kg',30,3.80)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('003','	aceite','	Cil	  ','  1lt',50,6.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario)values ('004','	huevo','Quispe','1pqt',30,12.0)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario)values ('005','	lecheG','Gloria','1lt',30,3.20)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('006','	lechePV	','PuraVida','1lt',30,2.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('007','	atun	','Soya	   ','20ml',30,2.30)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('008','	detergente	','Bolivar	   ','545gr',30,5.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('009','	jabon	    ','BolivarBB','54gr',65,2.20)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('010','	menestras	','3Hojas','1kg',25,2.40)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('011','	mermelada	','Gloria','200gr',6,12.00)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('012','	quesoMozarellaX15','	Segoviana	','200gr',4,18.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('013','	Fideo	           ',' Nicollini	','250gr',15,	1.20)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('014','	PapelHH	         ','   Suave	  ','  900gr',16,	8.30)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('015','	Yogurt	          ','  Gloria	  ','  1lt	  ',4,8.30)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('016','	Cereal	          ','  Angeles	 ','   300gr',15,2.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('017','	Paneton	         ','   Deli	    ','1kg',10,12.00)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('018','	ToallaHigienicas	','Nosotras	','1pqtx42uni.',3,9.30)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('019','	Enjuage	         ','   DOWNY	','  1lt	  ',4,24.00)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('020','	CremaDental	     ','   Dento	','  250gr',7,3.20)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('021','	Lejia	           ',' Clorox	 ',' 1lt	   ',8,1.80)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('022','	jamonpizzero	    ','Segoviana','250gr',2,8.70)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('023','	Café	            ','Nescafe	 ',' 200gr	',3,15.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('024','	Avena	           ',' 3Ositos	','  120gr	',10,1.30)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('025','	gaseosa	         ','   INKAKOLA','1lt',23,7.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('026','	gaseosa	         ','   COCACOLA','500ml',45,2.50)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('027','	vino	            ','PORTO	    ','750ml	',56,45.60)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('028','	BifeReal	        ','Segoviana','	750gr',8,19.90)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('029','	gelatina	        ','Royal	  ','  80gr',25,1.80)
insert into TProducto(CodProducto,NombreProducto,Marca,UnidadMedida,UnidadesDisponibles,PrecioUnitario) values ('030','	Croquetas	       ',' DogChau	  ','  1kg	',8,8.00)

insert into TDetalleVenta values ('V1','001','E001','75213750','1','2,8','	12/01/2021')
insert into TDetalleVenta values ('V2','002','E002','45231678','2','3,8','	13/01/2021')
insert into TDetalleVenta values ('V3','003','E003','23456789','5','6,5','	14/01/2021')
insert into TDetalleVenta values ('V4','004','E004','23456790','2','12',' 15/01/2021')
insert into TDetalleVenta values ('V5','005','E005','12578903','1','3,2','	16/01/2021')

drop table usuarios

select * from TEmpleado
select * from TProducto