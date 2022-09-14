-- CREATE DATABASE Facturador; -- Creamos la base de datos
  USE Facturador ; -- Usamos la Base de Datos
DROP DATABASE IF EXISTS Facturador; -- Borramos la Base de datos  si existe

  DROP TABLE IF EXISTS Cliente; -- Borramos la tabla si existe
CREATE TABLE Cliente  -- Creamos la tabla 
(
ID_Cliente int (11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nombre varchar (600) NOT NULL,
  Apellido varchar (600) NOT NULL,
  Mail varchar (600) NOT NULL UNIQUE,
  Dni int (11) UNSIGNED NOT NULL UNIQUE, 
  Provincia varchar (1000) NOT NULL,
  Localidad varchar (1000) NOT NULL
);


DROP TABLE IF EXISTS Provincias;-- Borramos la tabla si existe
CREATE TABLE Provincias -- Creamos la tabla 
(
ID_Provincias int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Provincia varchar (600) NOT NULL
);

DROP TABLE IF EXISTS Localidad;-- Borramos la tabla si existe
CREATE TABLE Localidad -- Creamos la tabla 
(
ID_Localidad int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ID_Provincias int NOT NULL, -- fk
    Localidad varchar (600) NOT NULL  
); 

DROP TABLE IF EXISTS Productos;-- Borramos la tabla si existe
CREATE TABLE Productos -- Creamos la tabla 
(
ID_Producto int UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  Marca varchar (600) NOT NULL,
  Modelo varchar (600) NOT NULL,
  Precio int UNSIGNED NOT NULL,
  Serial_Number varchar(600) NOT NULL UNIQUE,
  Produco_Disponible boolean DEFAULT FALSE NOT NULL 
);

DROP TABLE IF EXISTS Stock; -- Borramos la tabla si existe
CREATE TABLE Stock -- Creamos la tabla 
( 
  ID_Stock int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_Producto int UNSIGNED NOT NULL, -- fk
  Cantidad int UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS Recibo;-- Borramos la tabla si existe
CREATE TABLE Recibo -- fk
(
  ID_Recibo int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ID_Producto int UNSIGNED ,
  ID_Provincias int UNSIGNED , 
  ID_Cliente int UNSIGNED UNIQUE,
  ID_Localidad int UNSIGNED 

);

DROP TABLE IF EXISTS Garantia;-- Borramos la tabla si existe
CREATE TABLE Garantia-- fk
(
  ID_Garanita int UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  ID_Recibo int UNSIGNED NOT NULL, -- fk
  ID_Producto int UNSIGNED NOT NULL, -- fk
  ID_Provincias int UNSIGNED NOT NULL,  -- fk
  ID_Cliente int UNSIGNED NOT NULL UNIQUE, -- fk
  ID_Localidad int UNSIGNED NOT NULL, -- fk
  Fecha_de_Compra date DEFAULT NULL , 
  Inicio_Garantia date DEFAULT NULL ,
  Fin_garantia datetime DEFAULT NULL 
);

DROP TABLE IF EXISTS Direcciones;
CREATE TABLE Direcciones
(
 ID_Direccion int UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ID_Cliente int UNSIGNED NOT NULL UNIQUE,
  Direccion varchar(600) NOT NULL,
  CP int (11) NOT null
); 

DROP TABLE IF EXISTS Envio;
CREATE TABLE Envio 
(
  ID_Envio int UNSIGNED AUTO_INCREMENT NOT NULL PRIMARY KEY,
  ID_Direccion int UNSIGNED NOT NULL,
  ID_Cliente int NOT NULL UNIQUE,
  Fecha_de_envio datetime NOT NULL
);