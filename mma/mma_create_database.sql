-- create and select the database
DROP DATABASE IF EXISTS mma;
CREATE DATABASE mma;
USE mma;

-- create the Product table
CREATE TABLE Product (
	ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Code           VARCHAR(10)    NOT NULL     UNIQUE,
  Description    VARCHAR(255)   NOT NULL,
  ListPrice      DECIMAL(10,2)  NOT NULL
);

-- reference chap 19 handout, create Invoice Table

CREATE TABLE Invoice (
	ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  OrderNumber          VARCHAR(25)    NOT NULL     UNIQUE,
  CustomerNumber     VARCHAR(50)  NOT NULL,
  OrderDate			DATE NOT NULL,
  Total				DECIMAL (10,2)
);

-- create LineItem table
CREATE TABLE LINEITEM (
ID      INT            PRIMARY KEY  AUTO_INCREMENT,
INVOICEID		INT  NOT NULL,
  Foreign key (INVOICEID) REFERENCES INVOICE (ID),
PRODUCTID	INT  NOT NULL,
  Foreign key (PRODUCTID) REFERENCES PRODUCT (ID),
Quantity INT NOT NULL
);

-- insert some rows into the Product table
INSERT INTO Product VALUES
(1, 'java', 'Murach''s Java Programming', '57.50'),
(2, 'jsp', 'Murach''s Java Servlets and JSP', '57.50'),
(3, 'mysql', 'Murach''s MySQL', '54.50'),
(4, 'android', 'Murach''s Android Programming', '57.50'),
(5, 'html5', 'Murach''s HTML5 and CSS3', '54.50'),
(6, 'oracle', 'Murach''s Oracle and PL/SQL', '54.50'),
(7, 'javascript', 'Murach''s JavaScript and jQuery', '54.50'),
(8, 'test', 'test description', '20.00');

-- create a user and grant privileges to that user
GRANT SELECT, INSERT, DELETE, UPDATE
ON mma.*
TO mma_user@localhost
IDENTIFIED BY 'sesame';