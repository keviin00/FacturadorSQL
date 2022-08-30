 use mysql;
 use facturadorbk;
show tables;
-- usuario de lectura
drop user if  exists'facturador_KEA'@'localhost'; -- borra el usuario creado si existe
create user if not exists 'facturador_KEA'@'localhost' identified by '123456' ; -- consulta si eciste el usuario sino lo crea
flush privileges;
show grants for 'facturador_KEA'@'localhost';
 
grant select,update,insert on facturadorbk.clientebk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.garantiabk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.localidadesbk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_clientes to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_clientes_actualizacion_email to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_clientes_actualizacion_l to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_clientes_actualizacion_nombre to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_clientes_actualizacion_p to 'facturador_KEA'@'localhost';
grant select on facturadorbk.log_auditoria_delete_cliente to 'facturador_KEA'@'localhost';
grant select on facturadorbk.productobk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.provinciasbk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.recibobk to 'facturador_KEA'@'localhost';
grant select on facturadorbk.stockbk to 'facturador_KEA'@'localhost';

-- pruebas
SELECT * FROM facturadorbk.clientebk;

  -- rename user facturador_KEA@localhost to facturador_prueba@localhost ; renombrar usuarios 
  -- alter user 'facturador_KEA'@'localhost' indetified by 'newpass' -- cambiamos la contraseña del usuario
  select * from user  ;
-- usuario de lectura,insert y modificacion 
drop user if  exists'facturador_KEAFull'@'localhost'; -- borra el usuario creado si existe
create user if not exists 'facturador_KEAFull'@'localhost' identified by '123456' ; -- consulta si eciste el usuario sino lo crea
flush privileges;
show grants for 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.clientebk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.garantiabk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.localidadesbk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_clientes to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_clientes_actualizacion_email to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_clientes_actualizacion_l to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_clientes_actualizacion_nombre to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_clientes_actualizacion_p to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.log_auditoria_delete_cliente to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.productobk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.provinciasbk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.recibobk to 'facturador_KEAFull'@'localhost';
grant select,update,insert on facturadorbk.stockbk to 'facturador_KEAFull'@'localhost';

-- pruebas
SELECT * FROM facturadorbk.clientebk;
INSERT INTO clientebk (nombre, apellido, email, dni, provincia, localidad) VALUES ('prueba', 'insert', 'insert.prueba@gmail.com', '123456789', 'Buenos Aires', 'caseros');
UPDATE clientebk SET apellido = 'update' WHERE (ID_Cliente = '12');

revoke update on *.* from 'facturador_KEAFull'@'localhost'; -- quitar permisos