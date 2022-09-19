USE facturador;


	-- FUNCION I
use facturador ;
DROP FUNCTION IF EXISTS FN_DireccionCliente ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_DireccionCliente   (NOMBRE CHAR(255) )   RETURNS INT--  CREAMOS EL FN PARA VER CUANTAS PERSONAS VIVEN EN LA MISMA DIRECCION
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)  into Numero from direcciones -- BUSCAMOS EN LA TABLA DIRECCIONES
	WHERE Direccion LIKE CONCAT('%', NOMBRE , '%') ; -- CUANTAS PERSONAS VIVEN EN ESA DIRECCION INGRESADA
	RETURN NUMERO ;
end //
DELIMITER ;


	-- FUNCION II
DROP FUNCTION IF EXISTS FN_LocalidCliente ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_LocalidCliente   (NOMBRE CHAR(255) )   RETURNS INT--  CREAMOS EL FN PARA VER CUANTAS PERSONAS VIVEN EN LA MISMA LOCALIDAD
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)  into Numero from  Cliente -- BUSCAMOS EN LA TABLA Cliente 
	WHERE localidad LIKE CONCAT('%', NOMBRE , '%') ; -- CUANTAS PERSONAS VIVEN EN ESA LOCALIDAD INGRESADA
	RETURN NUMERO ;
end //
delimiter ;


       -- FUNCION III

DROP FUNCTION IF EXISTS FN_ProvinciaCliente ;-- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_ProvinciaCliente (NOMBRE CHAR(255) ) RETURNS INT --  CREAMOS EL FN PARA VER CUANTAS PERSONAS VIVEN EN LA MISMA PROVINCIA
deterministic
begin
	DECLARE  NUMERO INT;
	select count(*) into Numero from Cliente  -- BUSCAMOS EN LA TABLA CLIENTE BK
	WHERE provincia LIKE CONCAT('%', NOMBRE , '%'); -- CUANTAS PERSONAS VIVEN EN ESA PROVINCIA INGRESADA
	RETURN NUMERO;
end //
DELIMITER ;


     --   FUNCION IV

DROP FUNCTION IF EXISTS FN_Productos_Modelo ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_Modelo   (PRODUCTOS CHAR(255) )  returns CHAR (255) --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS SON DEL MISMO MODELO
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productos   -- BUSCAMOS EN LA TABLA productos
	WHERE Modelo LIKE CONCAT('%', PRODUCTOS, '%') ;  -- BUSCAMOS CUANTOS PRODUCTOS SON DEL MISMO MODELO INGRESADO POR PARAMETRO
	RETURN NUMERO ;
end //
DELIMITER ;


     --   FUNCION V

DROP FUNCTION IF EXISTS FN_Productos_Marca ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_Marca   (PRODUCTOS CHAR(255) )  returns CHAR (255) --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS SON DE LA MISMA MARCA
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productos  -- BUSCAMOS EN LA TABLA productos
	WHERE MARCA LIKE CONCAT('%', PRODUCTOS, '%') ; -- BUSCAMOS CUANTOS PRODUCTOS SON DE LA MISMA MARCA INGRESADO POR PARAMETRO
	RETURN NUMERO ;
end //
DELIMITER ;


		-- FUNCION VI
 
DROP FUNCTION IF EXISTS FN_Productos_Disponible ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Productos_Disponible (f_MARCA char(255), f_MODELO char(255)) returns int--  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS QUEDAN DISPONIBLE EN EL STOCK 
deterministic
BEGIN
DECLARE LISTA_DE_PRODUCTOS INT ;
select cantidad into lista_de_productos
from stock  inner join productos  on stock.Producto_ID=productos.ID_Producto
 -- UNIMOS LAS TABLAS stock Y productos POR MEDIO DEL ID_PRODUCTO QUE ES PARTE DE LA TABLA stock
where marca = f_MARCA and modelo = f_MODELO; 
-- VAMOS A CONSULTAR CUANTO STOCK HAY DEL PRODUCTO QUE CUMPLA CON LOS PARAMETROS MARCA Y MODELO 
RETURN LISTA_DE_PRODUCTOS;
end //

delimiter ;


		-- FUNCION VII
DROP FUNCTION IF EXISTS FN_Recibo; -- BORRAMOS EL FN SI EXISTE 
delimiter // 
create function FN_Recibo (PRODUCTO varchar(500)) RETURNS INT --  CREAMOS EL FN PARA VER CUANTAS PERSONAS COMPRARON EL MISMO PRODUCTO
deterministic
begin
	DECLARE  NUMERO INT ;
	select count(*)into NUMERO from productos   -- BUSCAMOS EN LA TABLA PRODUCTOBK
	WHERE Modelo = PRODUCTO ;  -- BUSCAMOS LOS PRODUCTOS QUE TENGAN EL SERIAL_NUMBER
	RETURN NUMERO  ;
end //
DELIMITER ;


		-- FUNCION VIII
DROP FUNCTION IF EXISTS FN_Envio; -- BORRAMOS EL FN SI EXISTE 
delimiter // 
create function FN_Envio (Envio datetime) RETURNS INT --  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS SE DESPACHARON ESE DIA 
deterministic
begin
	DECLARE  Salida datetime ;
	select count(*)into Salida from envio   -- BUSCAMOS EN LA TABLA ENVIO 
	WHERE Fecha_de_envio = Envio ;  -- BUSCAMOS LOS PRODUCTOS QUE TENGAN LA MISMA FECHA DE ENVIO 
	RETURN Salida  ;
end //
DELIMITER ;


		-- FUNCION IX
DROP FUNCTION IF EXISTS FN_Gar ; -- BORRAMOS EL FN SI EXISTE 
delimiter //
create function FN_Gar (f_Recibo_ID char(255), f_Cliente_ID char(255)) returns int--  CREAMOS EL FN PARA VER CUANTOS PRODUCTOS QUEDAN DISPONIBLE EN EL STOCK 
deterministic
BEGIN
DECLARE Garantia_Cliente INT ;
select Fecha_De_Compra into Garantia_Cliente
from garantia   inner join recibo  on garantia.Recibo_ID=recibo.ID_Recibo -- UNIMOS LAS TABLAS garantia Y recibo POR MEDIO DEL ID_Recibo QUE ES PARTE DE LA TABLA recibo
INNER JOIN cliente  ON garantia.Cliente_ID = cliente.ID_Cliente-- UNIMOS LAS TABLAS garantia Y cliente POR MEDIO DEL ID_Cliente QUE ES PARTE DE LA TABLA recibo
where ID_Recibo = f_Recibo_ID and ID_Recibo = f_Cliente_ID; -- VAMOS A CONSULTAR SI EL CLIENTE TIENE GARANTIA  
RETURN Garantia_Cliente;
end //

delimiter ;