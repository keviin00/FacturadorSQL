-- CREATE DATABASE Facturador; -- Creamos la base de datos
  USE Facturador ; -- Usamos la Base de Datos
DROP DATABASE IF EXISTS Facturador; -- Borramos la Base de datos  si existe

  DROP TABLE IF EXISTS Cliente; -- Borramos la tabla si existe
CREATE TABLE Cliente  -- Creamos la tabla 
(
ID_Cliente int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Nombre varchar (600) NOT NULL,
  Apellido varchar (600) NOT NULL,
  Mail varchar (600) NOT NULL UNIQUE,
  Dni int  UNSIGNED NOT NULL UNIQUE, 
  Provincia varchar (1000) NOT NULL,
  Localidad varchar (1000) NOT NULL,
  Telefono int UNSIGNED NOT NULL UNIQUE
);


DROP TABLE IF EXISTS Provincias;-- Borramos la tabla si existe
CREATE TABLE Provincias -- Creamos la tabla 
(
ID_Provincias int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Provincia varchar (600) NOT NULL
);

DROP TABLE IF EXISTS Localidad;-- Borramos la tabla si existe
CREATE TABLE Localidad -- Creamos la tabla 
(
ID_Localidad int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Provincias_ID int NOT NULL, -- fk
    Localidad varchar (600) NOT NULL  
); 

DROP TABLE IF EXISTS Productos;-- Borramos la tabla si existe
CREATE TABLE Productos -- Creamos la tabla 
(
ID_Producto int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
  Marca varchar (600) NOT NULL,
  Modelo varchar (600) NOT NULL,
  Precio int UNSIGNED NOT NULL,
  Serial_Number varchar(600) NOT NULL UNIQUE,
  Producto_Disponible boolean DEFAULT FALSE NOT NULL 
);

DROP TABLE IF EXISTS Stock; -- Borramos la tabla si existe
CREATE TABLE Stock -- Creamos la tabla 
( 
  ID_Stock int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Producto_ID int  NOT NULL, -- fk
  Cantidad int UNSIGNED NOT NULL
);

DROP TABLE IF EXISTS Recibo;-- Borramos la tabla si existe
CREATE TABLE Recibo -- fk
(
  ID_Recibo int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Producto_ID int  NOT NULL,
  Provincias_ID int NOT NULL ,
  Cliente_ID int NOT NULL ,
  Localidad_ID int NOT NULL
);

DROP TABLE IF EXISTS Garantia;-- Borramos la tabla si existe
CREATE TABLE Garantia-- fk
(
  ID_Garanita int  NOT NULL PRIMARY KEY AUTO_INCREMENT,
  Recibo_ID int  NOT NULL UNIQUE, -- fk
  Producto_ID int  NOT NULL, -- fk
  Provincias_ID int  NOT NULL,  -- fk
  Cliente_ID int  NOT NULL , -- fk
  Localidad_ID int  NOT NULL, -- fk
  Fecha_de_Compra datetime DEFAULT NULL , 
  Inicio_Garantia datetime DEFAULT NULL ,
  Fin_garantia datetime DEFAULT NULL 
);

DROP TABLE IF EXISTS Direcciones;
CREATE TABLE Direcciones
(
 ID_Direccion int  NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Cliente_ID int  NOT NULL UNIQUE,
  Direccion varchar(600) NOT NULL,
  CP int  NOT null
); 

DROP TABLE IF EXISTS Envio;
CREATE TABLE Envio 
(
  ID_Envio int  AUTO_INCREMENT NOT NULL PRIMARY KEY,
  Direccion_ID int  NOT NULL, -- fk
  Cliente_ID int NOT NULL , -- fk
  Fecha_de_envio datetime NOT NULL,
  Recibo_ID int NOT NULL UNIQUE 
);


ALTER TABLE Envio
  ADD FOREIGN KEY(Recibo_ID)
  REFERENCES Recibo(ID_Recibo);

ALTER TABLE Localidad
  ADD FOREIGN KEY(Provincias_ID)
  REFERENCES Provincias(ID_Provincias);

ALTER TABLE Stock
  ADD FOREIGN KEY(Producto_ID)
  REFERENCES Productos(ID_Producto);

ALTER TABLE Direcciones
  ADD FOREIGN KEY(Cliente_ID)
  REFERENCES Cliente(ID_Cliente);

ALTER TABLE Envio
  ADD FOREIGN KEY(Direccion_ID)
  REFERENCES Direcciones(ID_Direccion);

ALTER TABLE Envio
  ADD FOREIGN KEY (Cliente_ID)
  REFERENCES Cliente(ID_Cliente);

ALTER TABLE Recibo
  ADD FOREIGN KEY (Producto_ID)
  REFERENCES Productos(ID_Producto);

ALTER TABLE Recibo
  ADD FOREIGN KEY (Provincias_ID)
  REFERENCES provincias(ID_Provincias);

ALTER TABLE Recibo
  ADD FOREIGN KEY(Cliente_ID)
  REFERENCES Cliente(ID_Cliente);

ALTER TABLE Recibo
  ADD FOREIGN KEY (Localidad_ID)
  REFERENCES Localidad(ID_Localidad);

ALTER TABLE Garantia
  ADD FOREIGN KEY(Recibo_ID)
  REFERENCES Recibo(ID_Recibo);

ALTER TABLE Garantia
  ADD FOREIGN KEY(Producto_ID)
  REFERENCES Productos(ID_Producto);


ALTER TABLE Garantia
  ADD FOREIGN KEY(Provincias_ID)
  REFERENCES Provincias(ID_Provincias);


ALTER TABLE Garantia
  ADD FOREIGN KEY(Cliente_ID)
  REFERENCES Cliente(ID_Cliente);



ALTER TABLE Garantia
  ADD FOREIGN KEY(Localidad_ID)
  REFERENCES Localidad(ID_Localidad);