-- create and select the database
DROP DATABASE IF EXISTS bigbox;
CREATE DATABASE bigbox;
USE bigbox;

-- create the Product table
CREATE TABLE Division (
	ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  DivisionNumber   VARCHAR(3)    NOT NULL     UNIQUE,
  DivisionName    VARCHAR(50)   NOT NULL
);


CREATE TABLE Store(
	ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  DivisionID         INT    NOT NULL     UNIQUE,
  Foreign key (DivisionID) REFERENCES Division (ID),
  StoreNumber     VARCHAR(5)  NOT NULL UNIQUE,
  StoreName			VARCHAR(50)  NOT NULL,
  constraint unq_div_store UNIQUE (DivisionID, StoreNumber) 
  );
  -- though thee store number may not be unique, but the combination of both division/store is unique and that is what constraint is explaining
    
 CREATE TABLE Sales(
	ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  StoreID        INT    NOT NULL    ,
  Foreign key (StoreID) REFERENCES Store (ID),
  Date     DATE  NOT NULL,
  Sales			Decimal (10,2)
	);   
	ID    INT            PRIMARY KEY  AUTO_INCREMENT,
  StoreID         INT    NOT NULL     UNIQUE,
  Foreign key (StoreID) REFERENCES Store (ID),
  Date    Date,
  Sales			Decimal(10,2) 

  );
    