use facturadorbk;
	create  or replace view cliente_bk as
    (select nombre,apellido,email,dni,provincia,localidad
    from clientebk
    order by apellido asc);
  
   
 create  or replace view producto_bk as
    (select ID_Producto,Marca,Modelo,Serial_number,Precio,Producto_disponible 
    from productobk
    where producto_disponible like'1%'
    order by precio desc);
  
   
   create  or replace view provincias_bk as
   (select provincia 
   from provinciasbk
   order by id_provincia);
   
   
  create  or replace view localidades_bk as(
 select  provinciasbk.provincia,localidadesbk.localidad
 from localidadesbk inner join provinciasbk on localidadesbk.ID_provincia=provinciasbk.id_provincia);
  
    
 create  or replace view stock_bk as
( select  productobk.Marca,modelo,stockbk.cantidad
 from stockbk inner join productobk on stockbk.ID_producto=productobk.id_producto);
  
    
    create  or replace view recibio_bk as
      (select  productobk.Marca,productobk.modelo,productobk.serial_number,productobk.precio,productobk.producto_disponible,
      clientebk.nombre,clientebk.apellido,clientebk.dni,clientebk.email,
      provinciasbk.provincia,
      localidadesbk.localidad
	  from recibobk inner join productobk on recibobk.id_producto=productobk.id_producto
      inner join clientebk on recibobk.id_cliente=clientebk.id_cliente 
      inner join provinciasbk on recibobk.id_provincia=provinciasbk.id_provincia
      inner join localidadesbk on recibobk.id_localidades=localidadesbk.id_localidades
      );
      
      create or replace view garantia_bk as
  (   select  recibobk.ID_Recibo,
     productobk.Marca,productobk.modelo,productobk.serial_number,productobk.precio,productobk.producto_disponible,
      clientebk.nombre,clientebk.apellido,clientebk.dni,clientebk.email,
      provinciasbk.provincia,
      localidadesbk.localidad
	  from recibobk inner join productobk on recibobk.id_producto=productobk.id_producto
      inner join clientebk on recibobk.id_cliente=clientebk.id_cliente 
      inner join provinciasbk on recibobk.id_provincia=provinciasbk.id_provincia
      inner join localidadesbk on recibobk.id_localidades=localidadesbk.id_localidades);
      
    
   
   