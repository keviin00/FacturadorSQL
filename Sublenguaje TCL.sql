use facturadorbk;
select * from clientebk;
SELECT @@AUTOCOMMIT;
SET @@AUTOCOMMIT =1;
SET @@AUTOCOMMIT =0;
START TRANSACTION;
DELETE FROM clientebk WHERE ID_cliente=10 ;
DELETE FROM clientebk WHERE ID_cliente=11 ;
ROLLBACK;
COMMIT;


 -- -- --
select * from productobk;
START TRANSACTION;
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('Ryzen','AMD Ryzen™ 5000','t824JD75','250000','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('msi','MAG Z590 TORPEDO','zD2hJnoQ','142269','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('corsair','WATERCOOLINGICUE H150i ELITE CAPELLIX','HNXKMbbT','146659','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('genius','SP-HF180','whLvYAgT','2199','1');

SAVEPOINT sp2;

INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('Intel','i9-12950HX','K7SwAQny','163365','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('Seasonic ','80 PLUS Titanium Certified','34wQTBQR','69999','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('Asus ','ROG MAXIMUS Z690 HERO EVA EDITION','EDUVhbFZ','320000','1');
INSERT INTO productobk (Marca,Modelo,Serial_number,Precio,Producto_disponible) VALUES ('NVIDIA','GeForce RTX 30 Series RTX 3060','xZWT6sDQ','142999','1');
SAVEPOINT sp3;
	
  
ROLLBACK TO sp2;
ROLLBACK TO sp3;
-- RELEASE SAVEPOINT sp2;
 