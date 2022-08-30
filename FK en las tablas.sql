use facturadorbk;
alter table Localidadesbk
ADD foreign key (ID_Provincia) 
REFERENCES Provinciasbk(ID_Provincia); 

alter table Stockbk
ADD foreign key (ID_Producto) 
REFERENCES Productobk(ID_Producto); 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Producto) -- agregame como clave foranea (ID_PRODUCTO) 
REFERENCES Productobk(ID_Producto); -- de la tabla Producto con clave primaria (ID_PRODUCTO) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Stock) -- agregame como clave foranea (ID_Stock) 
REFERENCES Stockbk(ID_Stock); -- de la tabla Stock con clave primaria (ID_Stock) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Cliente) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Clientebk(ID_Cliente); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Garantiabk -- en la tabla Garantia
ADD FOREIGN KEY (ID_Recibo) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Recibobk(ID_Recibo); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Cliente) -- agregame como clave foranea (ID_Cliente) 
REFERENCES Clientebk(ID_Cliente); -- de la tabla Cliente con clave primaria (ID_Cliente) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Stock) -- agregame como clave foranea (ID_Stock) 
REFERENCES Stockbk(ID_Stock); -- de la tabla Stock con clave primaria (ID_Stock) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Producto) -- agregame como clave foranea (ID_PRODUCTO) 
REFERENCES Productobk(ID_Producto); -- de la tabla Producto con clave primaria (ID_PRODUCTO) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Provincia) -- agregame como clave foranea (ID_Provincia) producto
REFERENCES Provinciasbk(ID_Provincia); -- de la tabla provincias con clave primaria (ID_Provincia) 

ALTER TABLE Recibobk -- en la tabla Recibo
ADD FOREIGN KEY (ID_Localidades) -- agregame como clave foranea (ID_Localidades) 
REFERENCES Localidadesbk(ID_Localidades); -- de la tabla localidades con clave primaria (ID_Localidades) 