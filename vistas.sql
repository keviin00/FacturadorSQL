			USE facturador;
      -- VIEW I
create  or replace view cliente_Vist as -- CREO O REMPLAZO LA VIEWS CLIENTE 
    (select Nombre,Apellido,Mail,Dni,Provincia,Localidad,Telefono -- SELECCIONAMOS LOS CAMPOS NOMBRE,APELLIDO,EMAIL,DNI,PROVINCIA Y LOCALIDAD
    from cliente -- DE LA TABLA CLIENTE
    order by apellido asc); -- Y LOS ORDENAMOS ASCENDENTES EN FUNCION AL APELLIDO
   
  	  -- VIEW II
 create  or replace view producto_Vist as -- CREO O REMPLAZO LA VIEWS Productos
    (select ID_Producto,Marca,Modelo,Precio,Serial_number,Producto_Disponible -- SELECCIONAMOS LOS CAMPOS ID_PRODUCTO,MARCA,MODELO,SERIAL_NUMBER,PRECIO Y PRODUCTO_DISPONIBLE
    from productos -- DE LA TABLA Productos
    where producto_disponible like'1%' -- SI EL PRODUCTO ESTA DISPONIBLE 
    order by precio desc); -- LOS ORDENAMOS POR PRECIO DESCENDENTE 
  

			-- VIEW III
create  or replace view Provincias_Vist as -- CREO O REMPLAZO LA VIEWS PROVINCIAS 
   (select Provincia   -- SELECCIONAMOS EL CAMPO PROVINCIA
   from provincias  -- DE LA TABLA PROVINCIAS
   order by ID_Provincias); -- Y ORDENAMOS POR EL ID_PROVINCIA   
			
      -- VIEW IV  
create  or replace view localidades_Vist as(  -- CREO O REMPLAZO LA VIEWS LOCALIDADES 
 select  provincias.Provincia,localidad.Localidad -- SELECCIONAMOS LA TABLA PROVINCIAS EL CAMPO PROVINCIA Y DE LA TABLA LOCALIDADES EL CAMPO LOCALIDAD
 from localidad inner join provincias 
 on localidad.Provincias_ID=provincias.ID_Provincias); -- DE LA TABLA LOCALIDADES LA UNIMOS CON LA TABLA PROVINCIAS DONDE EN LOCALIDADES EL PROVINCIA_ID SEA IGUAL AL ID_PROVINCIA DE LA TABLA Provincias

		  -- VIEW V
create  or replace view stock_VIst as -- CREO O REMPLAZO LA VIEWS stock  
( select  productos.Marca,Modelo,stock.Cantidad -- SELECCIONAMOS LA TABLA productos EL CAMPO MARCA,MODELO Y DE LA TABLA stock EL CAMPO CANTIDAD
 from stock inner join productos -- DE LA TABLA STOCKBK LA UNIMOS CON LA TABLA productos
 on stock.Producto_ID=productos.ID_Producto);--  DONDE EN stock EL productos SEA IGUAL AL ID_Producto DE LA TABLA productos


      -- VIEW VI
create  or replace view Recibo_Vies as -- CREO O REMPLAZO LA VIEWS RECIBO_BK  
	(select  productos.Marca,productos.Modelo,productos.Precio,productos.Serial_number,  -- SELECCIONAMOS LA TABLA productos EL CAMPO MARCA,MODELO,SERIAL_NUMBER,PRECIO,PRODUCTO_DISPONIBLE
	cliente.nombre,cliente.apellido,cliente.Mail,cliente.Dni,cliente.Telefono, -- SELECCIONAMOS LA TABLA cliente EL CAMPO NOMBRE,APELLIDO,DNI,EMAL
	provincias.Provincia,  -- SELECCIONAMOS LA TABLA provincias EL CAMPO PROVINCIA
	localidad.Localidad  -- SELECCIONAMOS LA TABLA localidad EL CAMPO LOCALIDAD
	
  from Recibo inner join productos -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PRODUCTOBK
    on Recibo.Producto_ID=productos.ID_Producto -- DONDE EN RECIBOBK EL ID_PRODUCTO SEA IGUAL AL ID_PRODUCTO DE LA TABLA productos

	inner join cliente -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA CLIENTEBK
	on Recibo.Cliente_ID=cliente.ID_cliente -- DONDE EN RECIBOBK EL ID_CLIENTE SEA IGUAL AL ID_CLIENTE DE LA TABLA cliente
	
  inner join provincias  -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PROVINCIASBK
	on Recibo.Provincias_ID=provincias.ID_Provincias-- DONDE EN RECIBOBK EL ID_PROVINCIA SEA IGUAL AL ID_PROVINCIA DE LA TABLA provincias
	
  inner join localidad -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA LOCALIDADESBK
	on Recibo.Localidad_Id=localidad.ID_Localidad);-- DONDE EN RECIBOBK EL ID_LOCALIDADES SEA IGUAL AL ID_LOCALIDADES DE LA TABLA localidad


			-- VIEW VII
      create or replace view garantia_View as -- CREO O REMPLAZO LA VIEWS garantia
  (select  
  Recibo.ID_Recibo,
  productos.Marca,productos.Modelo,productos.Precio,productos.Serial_number,  -- SELECCIONAMOS LA TABLA productos EL CAMPO MARCA,MODELO,SERIAL_NUMBER,PRECIO,PRODUCTO_DISPONIBLE
	cliente.nombre,cliente.apellido,cliente.Mail,cliente.Dni,cliente.Telefono, -- SELECCIONAMOS LA TABLA cliente EL CAMPO NOMBRE,APELLIDO,DNI,EMAL
	provincias.Provincia,  -- SELECCIONAMOS LA TABLA provincias EL CAMPO PROVINCIA
	localidad.Localidad  -- SELECCIONAMOS LA TABLA localidad EL CAMPO LOCALIDAD
	
  from Recibo inner join productos -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PRODUCTOBK
    on Recibo.Producto_ID=productos.ID_Producto -- DONDE EN RECIBOBK EL ID_PRODUCTO SEA IGUAL AL ID_PRODUCTO DE LA TABLA productos

	inner join cliente -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA CLIENTEBK
	on Recibo.Cliente_ID=cliente.ID_cliente -- DONDE EN RECIBOBK EL ID_CLIENTE SEA IGUAL AL ID_CLIENTE DE LA TABLA cliente
	
  inner join provincias  -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PROVINCIASBK
	on Recibo.Provincias_ID=provincias.ID_Provincias-- DONDE EN RECIBOBK EL ID_PROVINCIA SEA IGUAL AL ID_PROVINCIA DE LA TABLA provincias
	
  inner join localidad -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA LOCALIDADESBK
	on Recibo.Localidad_Id=localidad.ID_Localidad);-- DONDE EN RECIBOBK EL ID_LOCALIDADES SEA IGUAL AL ID_LOCALIDADES DE LA TABLA localidad

      -- VIEW VIII
CREATE OR REPLACE VIEW Direcciones_Views AS -- CREAMOS LA VISTA DE LA TABLA DIRECCIONES
(
  SELECT direcciones.Direccion,direcciones.CP, -- SELECCIONAMOS LOS CAMPOS DIRECCION Y CP DE LA TABLA DIRECCIONES
  cliente.Nombre,cliente.Apellido,cliente.Dni,cliente.Provincia,cliente.Localidad -- SELECCIONAMOS LOS CAMPOS NOMBRE,APELLIDO,DNI,PROVINCIA Y LOCALIDAD DE LA TABLA CLIENTE

  FROM direcciones INNER JOIN cliente -- UNIMOS LA TABLA DIRECCIONES CON LA TABLA CLIENTE
  ON Direcciones.Cliente_ID=cliente.ID_Cliente-- DONDE EN DIRECCIONES EL CLIENTE_ID SEA IGUAL AL ID_CLIENTE DE LA TABLA CLIENTE 
);

      -- VIEW IIX
CREATE OR REPLACE VIEW Envio_Views AS
(
  SELECT
Envio.Fecha_de_envio,
direcciones.Direccion,direcciones.CP,
Cliente.Nombre,Cliente.apellido,cliente.Telefono,Cliente.Dni 
  
  FROM Envio INNER JOIN direcciones 
  ON Envio.Direccion_ID=direcciones.ID_Direccion
  
  INNER JOIN Cliente 
  ON Envio.Cliente_ID=cliente.ID_Cliente
);



          