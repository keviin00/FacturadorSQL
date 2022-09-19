 use mysql;
 use facturador;
show tables;
-- usuario de lectura
drop user if  exists'facturador_KEA'@'localhost'; -- borra el usuario creado si existe
create user if not exists 'facturador_KEA'@'localhost' identified by '123456' ; -- consulta si eciste el usuario sino lo crea
flush privileges;
show grants for 'facturador_KEA'@'localhost';
 
grant select,update,insert on facturador.cliente to 'facturador_KEA'@'localhost';
grant select on facturador.Direcciones to 'facturador_KEA'@'localhost';
grant select on facturador.localidad to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_insert to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_Delet to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_update_a to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_update_n to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_update_p to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_update_m to 'facturador_KEA'@'localhost';
grant select on facturador.log_clientes_update_l to 'facturador_KEA'@'localhost';
grant select on facturador.productos to 'facturador_KEA'@'localhost';
grant select on facturador.log_productos_insert to 'facturador_KEA'@'localhost';
grant select on facturador.log_productos_delet to 'facturador_KEA'@'localhost';
grant select on facturador.log_productos_update to 'facturador_KEA'@'localhost';
grant select on facturador.provincias to 'facturador_KEA'@'localhost';
grant select on facturador.log_provincias_insert to 'facturador_KEA'@'localhost';
grant select on facturador.recibo to 'facturador_KEA'@'localhost';
grant select on facturador.stock to 'facturador_KEA'@'localhost';
grant select on facturador.direcciones to 'facturador_KEA'@'localhost';
grant select on facturador.log_direcciones_insert to 'facturador_KEA'@'localhost';
grant select on facturador.log_direcciones_update to 'facturador_KEA'@'localhost';
grant select on facturador.log_cp_insert to 'facturador_KEA'@'localhost';
grant select on facturador.log_cp_update to 'facturador_KEA'@'localhost';
grant select on facturador.envio to 'facturador_KEA'@'localhost';
-- pruebas
SELECT * FROM facturador.cliente ;

  -- rename user facturador_KEA@localhost to facturador_prueba@localhost ; renombrar usuarios 
  -- alter user 'facturador_KEA'@'localhost' indetified by 'newpass' -- cambiamos la contraseña del usuario
  select * from user  ;
-- usuario de lectura,insert y modificacion 
drop user if  exists'facturador_KEAFull'@'localhost'; -- borra el usuario creado si existe
create user if not exists 'facturador_KEAFull'@'localhost' identified by '123456' ; -- consulta si eciste el usuario sino lo crea
flush privileges;
show grants for 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.cliente to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.garantia to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.localidad to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_insert to 'facturador_KEAFull'@'localhost';
grant select,update,insert ON facturador.log_clientes_update_a to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_update_m to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_update_l to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_update_n to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_update_p to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.log_clientes_Delet to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.productos to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.provincias to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.recibo to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturador.stock to 'facturador_KEAFull'@'localhost';
grant select,update,insert ON facturador.log_productos_insert TO 'facturador_KEAFull'@'localhost';
grant select,update,insert ON facturador.log_productos_delet to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_productos_update to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.Direcciones to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_direcciones_insert to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_direcciones_update to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_cp_insert to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_cp_update to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.envio to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_provincias_insert to 'facturador_KEA'@'localhost';
grant select,update,INSERT on facturador.log_productos_update to 'facturador_KEA'@'localhost';
-- pruebas
SELECT * FROM facturadorbk.clientebk;
INSERT INTO clientebk (nombre, apellido, email, dni, provincia, localidad) VALUES ('prueba', 'insert', 'insert.prueba@gmail.com', '123456789', 'Buenos Aires', 'caseros');
UPDATE clientebk SET apellido = 'update' WHERE (ID_Cliente = '12');

revoke update on *.* from 'facturador_KEAFull'@'localhost'; -- quitar permisos