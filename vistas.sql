use facturadorbk; 
			-- VIEW I
	create  or replace view cliente_bk as -- CREO O REMPLAZO LA VIEWS CLIENTE_BK 
    (select nombre,apellido,email,dni,provincia,localidad -- SELECCIONAMOS LOS CAMPOS NOMBRE,APELLIDO,EMAIL,DNI,PROVINCIA Y LOCALIDAD
    from clientebk -- DE LA TABLA CLIENTE
    order by apellido asc); -- Y LOS ORDENAMOS ASCENDENTES EN FUNCION AL APELLIDO
  
			-- VIEW II
 create  or replace view producto_bk as -- CREO O REMPLAZO LA VIEWS PRODUCTO_BK 
    (select ID_Producto,Marca,Modelo,Serial_number,Precio,Producto_disponible 
    -- SELECCIONAMOS LOS CAMPOS ID_PRODUCTO,MARCA,MODELO,SERIAL_NUMBER,PRECIO Y PRODUCTO_DISPONIBLE
    from productobk -- DE LA TABLA PRODUCTOBK
    where producto_disponible like'1%' -- SI EL PRODUCTO ESTA DISPONIBLE 
    order by precio desc); -- LOS ORDENAMOS POR PRECIO DESCENDENTE 
  
			-- VIEW III
   create  or replace view provincias_bk as -- CREO O REMPLAZO LA VIEWS PROVINCIAS_BK 
   (select provincia   -- SELECCIONAMOS EL CAMPO PROVINCIA
   from provinciasbk -- DE LA TABLA PROVINCIASBK
   order by id_provincia); -- Y ORDENAMOS POR EL ID_PROVINCIA   
			
            -- VIEW IV
  create  or replace view localidades_bk as(  -- CREO O REMPLAZO LA VIEWS LOCALIDADES_BK 
 select  provinciasbk.provincia,localidadesbk.localidad 
 -- SELECCIONAMOS LA TABLA PROVINCIASBK EL CAMPO PROVINCIA Y DE LA TABLA LOCALIDADESBK EL CAMPO LOCALIDAD
 from localidadesbk inner join provinciasbk 
 on localidadesbk.ID_provincia=provinciasbk.id_provincia); 
 -- DE LA TABLA LOCALIDADESBK LA UNIMOS CON LA TABLA PROVINCIASBK DONDE EN LOCALIDADESBK EL ID_PROVINCIA SEA IGUAL AL ID_PROVINCIA DE LA TABLA PROVINCIASBK
  
			-- VIEW V
 create  or replace view stock_bk as -- CREO O REMPLAZO LA VIEWS STOCK_BK  
( select  productobk.Marca,modelo,stockbk.cantidad -- SELECCIONAMOS LA TABLA PRODUCTOBK EL CAMPO MARCA,MODELO Y DE LA TABLA STOCKBK EL CAMPO CANTIDAD
 from stockbk inner join productobk -- DE LA TABLA STOCKBK LA UNIMOS CON LA TABLA PRODUCTOBK
 on stockbk.ID_producto=productobk.id_producto);--  DONDE EN STOCKBK EL ID_PRODUCTO SEA IGUAL AL ID_PRODUCTO DE LA TABLA PRODUCTOBK
  
            -- VIEW VI
create  or replace view recibio_bk as -- CREO O REMPLAZO LA VIEWS RECIBO_BK  
	(select  productobk.Marca,productobk.modelo,productobk.serial_number,productobk.precio,productobk.producto_disponible,  
    -- SELECCIONAMOS LA TABLA PRODUCTOBK EL CAMPO MARCA,MODELO,SERIAL_NUMBER,PRECIO,PRODUCTO_DISPONIBLE
	clientebk.nombre,clientebk.apellido,clientebk.dni,clientebk.email, -- SELECCIONAMOS LA TABLA CLIENTEBK EL CAMPO NOMBRE,APELLIDO,DNI,EMAL
	provinciasbk.provincia,  -- SELECCIONAMOS LA TABLA PROVINCIASBK EL CAMPO PROVINCIA
	localidadesbk.localidad  -- SELECCIONAMOS LA TABLA LOCALIDADESBK EL CAMPOLOCALIDAD
	from recibobk inner join productobk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PRODUCTOBK
    on recibobk.id_producto=productobk.id_producto -- DONDE EN RECIBOBK EL ID_PRODUCTO SEA IGUAL AL ID_PRODUCTO DE LA TABLA PRODUCTOBK
	inner join clientebk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA CLIENTEBK
	on recibobk.id_cliente=clientebk.id_cliente -- DONDE EN RECIBOBK EL ID_CLIENTE SEA IGUAL AL ID_CLIENTE DE LA TABLA CLIENTEBK
	inner join provinciasbk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PROVINCIASBK
	on recibobk.id_provincia=provinciasbk.id_provincia-- DONDE EN RECIBOBK EL ID_PROVINCIA SEA IGUAL AL ID_PROVINCIA DE LA TABLA PROVINCIASBK
	inner join localidadesbk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA LOCALIDADESBK
	on recibobk.id_localidades=localidadesbk.id_localidades-- DONDE EN RECIBOBK EL ID_LOCALIDADES SEA IGUAL AL ID_LOCALIDADES DE LA TABLA LOCALIDADESBK
);
			-- VIEW VII
      create or replace view garantia_bk as -- CREO O REMPLAZO LA VIEWS GARANTIA_BK  
  (   select  recibobk.ID_Recibo, -- SELECCIONAMOS DE LA TABLA RECIBOBK EL CAMPO ID_RECIBO
     productobk.Marca,productobk.modelo,productobk.serial_number,productobk.precio,productobk.producto_disponible, 
     -- SELECCIONAMOS LA TABLA PRODUCTOBK EL CAMPO MARCA,MODELO,SERIAL_NUMBER,PRECIO,PRODUCTO_DISPONIBLE
      clientebk.nombre,clientebk.apellido,clientebk.dni,clientebk.email, -- SELECCIONAMOS LA TABLA CLIENTEBK EL CAMPO NOMBRE,APELLIDO,DNI,EMAL
      provinciasbk.provincia,  -- SELECCIONAMOS LA TABLA PROVINCIASBK EL CAMPO PROVINCIA	
      localidadesbk.localidad  -- SELECCIONAMOS LA TABLA LOCALIDADESBK EL CAMPOLOCALIDAD
	  from recibobk inner join productobk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PRODUCTOBK
      on recibobk.id_producto=productobk.id_producto -- DONDE EN RECIBOBK EL ID_PRODUCTO SEA IGUAL AL ID_PRODUCTO DE LA TABLA PRODUCTOBK
      inner join clientebk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA CLIENTEBK
      on recibobk.id_cliente=clientebk.id_cliente -- DONDE EN RECIBOBK EL ID_CLIENTE SEA IGUAL AL ID_CLIENTE DE LA TABLA CLIENTEBK
      inner join provinciasbk  -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA PROVINCIASBK
      on recibobk.id_provincia=provinciasbk.id_provincia-- DONDE EN RECIBOBK EL ID_PROVINCIA SEA IGUAL AL ID_PROVINCIA DE LA TABLA PROVINCIASBK
      inner join localidadesbk -- DE LA TABLA RECIBOBK LA UNIMOS CON LA TABLA LOCALIDADESBK
      on recibobk.id_localidades=localidadesbk.id_localidades);-- DONDE EN RECIBOBK EL ID_LOCALIDADES SEA IGUAL AL ID_LOCALIDADES DE LA TABLA LOCALIDADESBK
      
    
   
   