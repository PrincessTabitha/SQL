-- create and select the database
DROP DATABASE IF EXISTS mod4;
CREATE DATABASE mod4;
USE mod4;

-- create the Product table
CREATE TABLE Customer (
  ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Name          VARCHAR(50)    NOT NULL,
  City		    VARCHAR(50)   NOT NULL,
  State			VARCHAR(50)   NOT NULL,
  Sales			DECIMAL (16,2)	NOT NULL,
  Active     	Bit(1)		  NOT NULL
);

-- insert some rows into the Product table
INSERT  INTO customer (Name, City, State, Sales, Active) VALUES

('Acme,inc.','Jersey City','NJ',14381891,1),
('Widget Corp','Seattle','WA',97865829,1),
('123 Warehousing','Los Angeles','CA',77503710,1),
('Demo Company','Columbus','OH',74647541,1),
('Smith and Co.','Honolulu','HI',36046590,1),
('Foo Bars','Fresno','CA',39912857,1),
('ABC Telecom','Birmingham','AL',31149083,1),
('Fake Brothers','Stockton','CA',31226191,1),
('QWERTY Logistics','Lubbock','TX',17226905,1),
('Demo, Inc.','Las Vegas','NV',69551557,1);
