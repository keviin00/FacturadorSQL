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

