	-- FUNCION I
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_LocalidClienteBK ;
delimiter //
create function FN_LocalidClienteBK   (NOMBRE CHAR(255) )  returns CHAR (255)
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)  into Numero from clientebk 
	WHERE localidad LIKE CONCAT('%', NOMBRE , '%') ;
	RETURN NUMERO ;
end //
delimiter ;
select FN_LocalidClienteBK  ('Caseros');

		
        
       -- FUNCION II
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_ProvinciaClienteBK ;
delimiter //
create function FN_ProvinciaClienteBK (NOMBRE CHAR(255) )  returns CHAR (255)
deterministic
begin
	DECLARE  NUMERO INT;
	select count(*) into Numero from clientebk 
	WHERE provincia LIKE CONCAT('%', NOMBRE , '%');
	RETURN NUMERO;
end //
delimiter ;
select FN_ProvinciaClienteBK ('Tierra del fuego');

     --   FUNCION III
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_Productos_ModeloBK ;
delimiter //
create function FN_Productos_ModeloBK   (PRODUCTOS CHAR(255) )  returns CHAR (255)
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productobk 
	WHERE MODELO LIKE CONCAT('%', PRODUCTOS, '%') ;
	RETURN NUMERO ;
end //
delimiter ;
select FN_Productos_ModeloBK ('iphone');

		-- FUNCION IV
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_Productos_MarcaBK ;
delimiter //
create function FN_Productos_MarcaBK   (PRODUCTOS CHAR(255) )  returns CHAR (255)
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productobk 
	WHERE MARCA LIKE CONCAT('%', PRODUCTOS, '%') ;
	RETURN NUMERO ;
end //
delimiter ;
select FN_Productos_MarcaBK ('celular');

		-- FUNCION V
 use facturadorbk;
 
DROP FUNCTION IF EXISTS FN_Productos_DisponibleBK ;

delimiter //

create function FN_Productos_DisponibleBK (f_MARCA char(255), f_MODELO char(255)) returns int

deterministic

BEGIN

DECLARE LISTA_DE_PRODUCTOS INT ;

select cantidad into lista_de_productos

from stockbk inner join productobk on stockbk.ID_producto=productobk.id_producto

where marca = f_MARCA and modelo = f_MODELO;

RETURN LISTA_DE_PRODUCTOS;

end //

delimiter ;

select FN_Productos_DisponibleBK ('Celular','Sony');

		-- FUNCION VI
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_Recibobk;
delimiter //
create function FN_Recibobk (PRODUCTO INT) RETURNS INT
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from recibobk 
	WHERE ID_Producto = PRODUCTO ; 
	RETURN NUMERO  ;
end //
delimiter ;
select FN_Recibobk  ('4');

