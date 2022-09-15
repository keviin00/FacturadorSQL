	-- FUNCION I
use facturadorbk ;
DROP FUNCTION IF EXISTS FN_LocalidClienteBK ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_LocalidClienteBK   (NOMBRE CHAR(255) )   RETURNS INT--  CREAMOS EL FN PARA VER CUANTAS PERSONAS VIVEN EN LA MISMA LOCALIDAD
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)  into Numero from clientebk -- BUSCAMOS EN LA TABLA CLIENTE BK
	WHERE localidad LIKE CONCAT('%', NOMBRE , '%') ; -- CUANTAS PERSONAS VIVEN EN ESA LOCALIDAD INGRESADA
	RETURN NUMERO ;
end //
delimiter ;

		
        
       -- FUNCION II

DROP FUNCTION IF EXISTS FN_ProvinciaClienteBK ;-- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_ProvinciaClienteBK (NOMBRE CHAR(255) ) RETURNS INT --  CREAMOS EL FN PARA VER CUANTAS PERSONAS VIVEN EN LA MISMA PROVINCIA
deterministic
begin
	DECLARE  NUMERO INT;
	select count(*) into Numero from clientebk  -- BUSCAMOS EN LA TABLA CLIENTE BK
	WHERE provincia LIKE CONCAT('%', NOMBRE , '%'); -- CUANTAS PERSONAS VIVEN EN ESA PROVINCIA INGRESADA
	RETURN NUMERO;
end //
delimiter ;

     --   FUNCION III

DROP FUNCTION IF EXISTS FN_Productos_ModeloBK ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_ModeloBK   (PRODUCTOS CHAR(255) )  returns CHAR (255) --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS SON DEL MISMO MODELO
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productobk  -- BUSCAMOS EN LA TABLA PRODUCTOSBK
	WHERE MODELO LIKE CONCAT('%', PRODUCTOS, '%') ;  -- BUSCAMOS CUANTOS PRODUCTOS SON DEL MISMO MODELO INGRESADO POR PARAMETRO
	RETURN NUMERO ;
end //
delimiter ;

		-- FUNCION IV

DROP FUNCTION IF EXISTS FN_Productos_MarcaBK ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_MarcaBK   (PRODUCTOS CHAR(255) )  returns CHAR (255) --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS SON DE LA MISMA MARCA
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productobk  -- BUSCAMOS EN LA TABLA PRODUCTOSBK
	WHERE MARCA LIKE CONCAT('%', PRODUCTOS, '%') ; -- BUSCAMOS CUANTOS PRODUCTOS SON DE LA MISMA MARCA INGRESADO POR PARAMETRO
	RETURN NUMERO ;
end //
delimiter ;

		-- FUNCION V
 
DROP FUNCTION IF EXISTS FN_Productos_DisponibleBK ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_DisponibleBK (f_MARCA char(255), f_MODELO char(255)) returns int
 --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS QUEDAN DISPONIBLE EN EL STOCK 
deterministic
BEGIN
DECLARE LISTA_DE_PRODUCTOS INT ;
select cantidad into lista_de_productos
from stockbk inner join productobk on stockbk.ID_producto=productobk.id_producto
 -- UNIMOS LAS TABLAS SOTCKBK Y PRODUCTOBK POR MEDIO DEL ID_PRODUCTO QUE ES PARTE DE LA TABLA STOCKBK
where marca = f_MARCA and modelo = f_MODELO; 
-- VAMOS A CONSULTAR CUANTO STOCK HAY DEL PRODUCTO QUE CUMPLA CON LOS PARAMETROS MARCA Y MODELO 
RETURN LISTA_DE_PRODUCTOS;
end //

delimiter ;


		-- FUNCION VI
DROP FUNCTION IF EXISTS FN_Recibobk; -- BORRAMOS EL FN SI EXISTE 
delimiter // 
create function FN_Recibobk (PRODUCTO varchar(500)) RETURNS INT --  CREAMOS EL FN PARA VER CUANTAS PERSONAS COMPRARON EL MISMO PRODUCTO
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productobk  -- BUSCAMOS EN LA TABLA PRODUCTOBK
	WHERE SERIAL_NUMBER = PRODUCTO ;  -- BUSCAMOS LOS PRODUCTOS QUE TENGAN EL SERIAL_NUMBER
	RETURN NUMERO  ;
end //
delimiter ;





--    PRUEBAS           --

select FN_LocalidClienteBK  ('Caseros');
select FN_ProvinciaClienteBK ('Tierra del fuego');
select FN_Productos_ModeloBK ('iphone');
select FN_Productos_MarcaBK ('celular');
select FN_Productos_DisponibleBK ('Celular','Sony');
select FN_Recibobk  ('F2LXHGEKKPHG');


