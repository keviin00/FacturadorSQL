-- create database facturadorbk;
use facturadorbk;
DROP TABLE IF EXISTS `Clientebk`;
create table Clientebk(
ID_Cliente int  primary key not null auto_increment,
nombre varchar (1000) not null,
apellido varchar(1000) not null,
email varchar(1000) not null,
dni int unsigned not null,
provincia varchar(1000) not null,
localidad varchar(1000) not null
);
DROP TABLE IF EXISTS `Stockbk`;
create table Stockbk(
ID_Stock int  not null auto_increment primary key,
ID_Producto int , -- FK
cantidad int unsigned not null
);
DROP TABLE IF EXISTS `Productobk`;
create table Productobk(
ID_Producto int not null auto_increment primary key ,
marca varchar (1000) not null,
modelo varchar(1000) not null,
serial_number varchar(1000) not null,
precio int unsigned not null,
producto_disponible boolean default false
);
DROP TABLE IF EXISTS `Garantiabk`;
create table Garantiabk(
ID_Garantia int primary key not null auto_increment,
ID_Producto int , -- FK 
ID_Stock int , -- FK
ID_Recibo int, -- FK
ID_Cliente int  -- FK
);
DROP TABLE IF EXISTS `Recibobk`;
create table Recibobk(
ID_Recibo int primary key not null auto_increment,
ID_Producto int , -- FK 
ID_Stock int , -- FK
ID_Cliente int, -- FK
ID_Provincia int, -- FK
ID_Localidades int -- FK
);
DROP TABLE IF EXISTS `Provinciasbk`;
CREATE TABLE  Provinciasbk (
  ID_Provincia int not null auto_increment primary key,
  provincia varchar(1000) NOT NULL
  );
  DROP TABLE IF EXISTS `Localidadesbk`;
CREATE TABLE  Localidadesbk (
  ID_Localidades int not null auto_increment primary key,
  ID_Provincia int NOT NULL,
  localidad varchar(255) NOT NULL
);

alter table Localidadesbk
ADD foreign key (ID_Provincia) 
REFERENCES Provinciasbk(ID_Provincia); 

alter table Stockbk
ADD foreign key (ID_Producto) 
REFERENCES Productobk(ID_Producto); 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Producto) -- agregame como clave foranea (ID_PRODUCTO) 
REFERENCES Productobk(ID_Producto); -- de la tabla Producto con clave primaria (ID_PRODUCTO) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Stock) -- agregame como clave foranea (ID_Stock) 
REFERENCES Stockbk(ID_Stock); -- de la tabla Stock con clave primaria (ID_Stock) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Cliente) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Clientebk(ID_Cliente); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Recibo) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Recibobk(ID_Recibo); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Cliente) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Clientebk(ID_Cliente); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Stock) -- agregame como clave foranea (ID_Stock) 
REFERENCES Stockbk(ID_Stock); -- de la tabla Stock con clave primaria (ID_Stock) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Producto) -- agregame como clave foranea (ID_PRODUCTO) 
REFERENCES Productobk(ID_Producto); -- de la tabla Producto con clave primaria (ID_PRODUCTO) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Provincia) -- agregame como clave foranea (ID_Provincia) producto
REFERENCES Provinciasbk(ID_Provincia); -- de la tabla provincias con clave primaria (ID_Provincia) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Localidades) -- agregame como clave foranea (ID_Localidades) 
REFERENCES Localidadesbk(ID_Localidades); -- de la tabla localidades con clave primaria (ID_Localidades) 