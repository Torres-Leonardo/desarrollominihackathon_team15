DROP database desarrollominihackathon_team15;
/* Creamos la base de datos */
CREATE DATABASE  desarrollominihackathon_team15;

USE desarrollominihackathon_team15
GO

/* Tabla client */
CREATE TABLE client (
  id INT IDENTITY(1,1) PRIMARY KEY,
  names VARCHAR(100),
  dni VARCHAR(8) CHECK (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  cell CHAR(9) CHECK (cell like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  adress VARCHAR(80),
  department VARCHAR(80),
  province VARCHAR(80),
  district VARCHAR(80)
);

ALTER TABLE client
	ADD constraint DNI_UNICO_client UNIQUE(dni);

/* Restricciones para dia/mes/año */
SET DATEFORMAT ymd;

/* Registros */
INSERT INTO client (names, dni, cell, adress, department, province, district)
VALUES
  ('John Doe', '12345678', '923456789', '123 Main St', 'Department 1', 'Province 1', 'District 1'),
  ('Jane Smith', '87654321', '987654321', '456 Elm St', 'Department 2', 'Province 2', 'District 2'),
  ('Michael Johnson', '45678912', '987654321', '789 Oak St', 'Department 3', 'Province 3', 'District 3'),
  ('Emily Davis', '98765432', '923456789', '321 Pine St', 'Department 4', 'Province 4', 'District 4'),
  ('David Wilson', '34567891', '987654321', '654 Cedar St', 'Department 5', 'Province 5', 'District 5'),
  ('Sarah Martinez', '23456789', '923456789', '987 Maple St', 'Department 6', 'Province 6', 'District 6'),
  ('Daniel Anderson', '78912345', '987654321', '321 Birch St', 'Department 7', 'Province 7', 'District 7'),
  ('Olivia Thomas', '56789123', '923456789', '654 Walnut St', 'Department 8', 'Province 8', 'District 8'),
  ('James Garcia', '98765431', '987654321', '987 Pineapple St', 'Department 9', 'Province 9', 'District 9'),
  ('Sophia Taylor', '67891234', '923456789', '123 Cherry St', 'Department 10', 'Province 10', 'District 10');

select* from client 

/*Tabla venta*/
CREATE TABLE Sales (
    id int identity(1,1) NOT NULL,
    total decimal(5,2)  NULL,
    amount int  NULL,
	dates datetime default getdate(),
    CONSTRAINT venta_pk PRIMARY KEY  (id)
);

INSERT INTO Sales (total, amount)
VALUES
('30', '1');

/* Tabla sucursal */
CREATE TABLE sucursal (
  id INT IDENTITY(1,1) PRIMARY KEY,
  names VARCHAR(60),
  last_name VARCHAR(60),
  dni CHAR(8) CHECK (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  cell CHAR(9) CHECK (cell like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  states CHAR(1) NULL CHECK(states ='A' OR states ='I') default 'A',
);

ALTER TABLE sucursal
	ADD constraint DNI_UNICO_sucursal UNIQUE(dni);

/* Registros */
INSERT INTO sucursal (names, last_name, dni, cell)
VALUES
  ('John', 'Doe', '12345678', '923456789'),
  ('Jane', 'Smith', '87654321', '976543219'),
  ('Michael', 'Johnson', '45678912', '987654321'),
  ('Emily', 'Davis', '98765432', '923456789'),
  ('David', 'Wilson', '34567891', '987654321'),
  ('Sarah', 'Martinez', '23456789', '923456789'),
  ('Daniel', 'Anderson', '78912345', '987654321'),
  ('Olivia', 'Thomas', '56789123', '923456789'),
  ('James', 'Garcia', '98765431', '987654321'),
  ('Sophia', 'Taylor', '67891234', '923456789');

SELECT * FROM sucursal;

/* Tabla Seller */
CREATE TABLE Seller (
  id INT IDENTITY(1,1) PRIMARY KEY,
  names VARCHAR(60),
  last_name VARCHAR(60),
  dni CHAR (8) CHECK (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  cell CHAR (9) CHECK (cell like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  states CHAR(1) NULL CHECK(states ='A' OR states ='I') default 'A',
);

ALTER TABLE Seller
	ADD constraint DNI_UNICO_seller UNIQUE(dni);

/* Registros */
INSERT INTO Seller (names, last_name, dni, cell)
VALUES
  ('John', 'Doe', '12345678', '923456789'),
  ('Jane', 'Smith', '87654321', '987654321'),
  ('Michael', 'Johnson', '45678912', '987654321'),
  ('Emily', 'Davis', '98765432', '923456789'),
  ('David', 'Wilson', '34567891', '987654321'),
  ('Sarah', 'Martinez', '23456789', '923456789'),
  ('Daniel', 'Anderson', '78912345', '987654321'),
  ('Olivia', 'Thomas', '56789123', '923456789'),
  ('James', 'Garcia', '98765431', '987654321'),
  ('Sophia', 'Taylor', '67891234', '923456789');

 SELECT* FROM seller
 

/* Tabla Dispatcher */
CREATE TABLE Dispatcher (
  id INT IDENTITY(1,1) PRIMARY KEY,
  names VARCHAR(60),
  last_name VARCHAR(60),
  dni CHAR (8) CHECK (dni like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  cell CHAR (9) CHECK (cell like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  states CHAR(1) NULL CHECK(states ='A' OR states ='I') default 'A',
);

ALTER TABLE Dispatcher
	ADD constraint DNI_UNICO_dispatcher UNIQUE(dni);

/* Registros */
INSERT INTO Dispatcher (names, last_name, dni, cell)
VALUES
  ('John', 'Doe', '12345678', '923456789'),
  ('Jane', 'Smith', '87654321', '987654321'),
  ('Michael', 'Johnson', '45678912', '987654321'),
  ('Emily', 'Davis', '98765432', '923456789'),
  ('David', 'Wilson', '34567891', '987654321'),
  ('Sarah', 'Martinez', '23456789', '923456789'),
  ('Daniel', 'Anderson', '78912345', '987654321'),
  ('Olivia', 'Thomas', '56789123', '923456789'),
  ('James', 'Garcia', '98765431', '987654321'),
  ('Sophia', 'Taylor', '67891234', '923456789');

SELECT * FROM Dispatcher;


/* Tabla Products */
CREATE TABLE Products (
  id INT IDENTITY(1,1) PRIMARY KEY,
  names VARCHAR(100),
  price DECIMAL(10, 2),
  descriptions VARCHAR (100),
  stock VARCHAR(4) CHECK (stock like '[0-9]%')
);

/* Registros */
INSERT INTO Products (names, price, descriptions, stock)
VALUES
('Product 1', '10', 'Description 1', '100'),
('Product 2', '20', 'Description 2', '50'),
('Product 3', '15', 'Description 3', '80'),
('Product 4', '5.99', 'Description 4', '200'),
('Product 5', '12', 'Description 5', '150'),
('Product 6', '8.99', 'Description 6', '120'),
('Product 7', '19', 'Description 7', '90'),
('Product 8', '14.50', 'Description 8', '110'),
('Product 9', '9.75', 'Description 9', '70'),
('Product 10', '6.99', 'Description 10', '180');

SELECT * FROM Products;

/* Relaciones */
-- Relación entre client y sucursal (Un jefe de sucursal puede tener varias sucursales)
ALTER TABLE sucursal
ADD CONSTRAINT FK_BranchManager FOREIGN KEY (id) REFERENCES client (id);

-- Relación entre sucursal y Seller (Una sucursal puede tener varios vendedores)
ALTER TABLE Seller
ADD CONSTRAINT FK_Branch FOREIGN KEY (id) REFERENCES sucursal (id);

-- Relación entre sucursal y Dispatcher (Una sucursal puede tener varios despachadores)
ALTER TABLE Dispatcher
ADD CONSTRAINT FK_BranchDesp FOREIGN KEY (id) REFERENCES sucursal (id);

-- Relación entre Seller y Sales (Un vendedor puede realizar varias ventas)
ALTER TABLE Sales
ADD CONSTRAINT FK_Seller FOREIGN KEY (id) REFERENCES Seller (id);

-- Relación entre Products y Sales (Un producto puede estar en varias ventas)
ALTER TABLE Sales
ADD CONSTRAINT FK_Product FOREIGN KEY (id) REFERENCES Products (id);