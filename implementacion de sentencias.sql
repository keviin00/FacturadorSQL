 use mysql;
 use facturadorbk;
show tables;
select * from db;
drop user if  exists'facturador_prueba'@'localhost'; -- borra el usuario creado si existe
create user if not exists 'facturador_prueba'@'localhost:3306' identified by '123456' ; -- consulta si eciste el usuario sino lo crea
flush privileges;
  -- rename user facturador_prueba@localhost to facturador_prueba@hostlocal ; renombrar usuarios 
  select * from user where user like '%facturador%';
  -- permisos
  show grants for newuser@localhost;
  show grants for 'facturador_prueba'@'localhost:3306';
  show grants for root@localhost; -- usuario por defecto de sql tiene permisos para absolutamente todo