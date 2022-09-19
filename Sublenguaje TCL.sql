use facturador;
select * from cliente ;
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT =1;
SET @@AUTOCOMMIT =0;
START TRANSACTION;
DELETE FROM cliente WHERE ID_cliente=10 ;
DELETE FROM cliente WHERE ID_cliente=11 ;
ROLLBACK;
COMMIT;


 -- -- --
select * from productos ;
START TRANSACTION;
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
SAVEPOINT sp2;

INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
INSERT INTO productos (Marca,Modelo,Precio,Serial_number,Producto_disponible) VALUES ();
SAVEPOINT sp3;
	
  
ROLLBACK TO sp2;
ROLLBACK TO sp3;
-- RELEASE SAVEPOINT sp2;
 