-- create and select the database
DROP DATABASE IF EXISTS PRS;
CREATE DATABASE PRS;
USE PRS;

-- create the tables
-- table 1
CREATE TABLE User (
	ID      INT           PRIMARY KEY  AUTO_INCREMENT,
UserName    VARCHAR(20)   NOT NULL,
Password    VARCHAR(10)   NOT NULL,
FirstName   VARCHAR(20)   NOT NULL,
LastName    VARCHAR(20)   NOT NULL,
Phone	    VARCHAR(12)   NOT NULL,
Email	    VARCHAR(75)   NOT NULL,
IsReviewer  BIT(1)    NOT NULL,
IsAdmin		BIT(1)   NOT NULL,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- table2
CREATE TABLE Status (
	ID      INT           PRIMARY KEY  AUTO_INCREMENT,
Description VARCHAR(20)   NOT NULL,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- table3
CREATE TABLE Vendor (
ID      INT           PRIMARY KEY  AUTO_INCREMENT,
Code	VARCHAR(10)   NOT NULL,
Name   	VARCHAR(255)   NOT NULL,
Address VARCHAR(255)   NOT NULL,
City    VARCHAR(255)   NOT NULL,
State	VARCHAR(2)   NOT NULL,
Zip	    VARCHAR(5)   NOT NULL,
Phone	VARCHAR(12)   NOT NULL,
Email	VARCHAR(100)   NOT NULL,
IsPreApproved	BIT(1)   NOT NULL,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- table4
CREATE TABLE PurchaseRequest (
ID      INT           PRIMARY KEY  AUTO_INCREMENT,
UserID	INT   NOT NULL,
Description  VARCHAR(100)   NOT NULL,
Justification VARCHAR(255)   NOT NULL,
DateNeeded    DATE  NOT NULL,
DeliveryMode	VARCHAR(25)   NOT NULL,
StatusID	   INT   NOT NULL,
Total	Decimal(10,2)   NOT NULL,
SubmittedDate	date,
ReasonForRejection	VARCHAR(100)   NOT NULL,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- table5
CREATE TABLE Product (
ID      INT           PRIMARY KEY  AUTO_INCREMENT,
VendorID	INT   NOT NULL,
PartNumber VARCHAR(50)   NOT NULL,
Name	 VARCHAR(150)   NOT NULL,
Price   Decimal(10,2)  NOT NULL,
Unit	VARCHAR(255)   NOT NULL,
PhotoPath	VARCHAR(255)  ,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- table6
CREATE TABLE PurchaseRequestLineItem (
ID      INT           PRIMARY KEY  AUTO_INCREMENT,
PurchaseRequesstId	INT   NOT NULL,
ProductID INT   NOT NULL,
Quantity	 INT   NOT NULL,
IsActive	BIT(1)   DEFAULT 1	NOT NULL,
DateCreated	DATETIME DEFAULT CURRENT_TIMESTAMP	NOT NULL,
DateUpdate	DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP	NOT NULL,
UpdatedByUser	INT DEFAULT 1	NOT NULL
);

-- insert users

INSERT INTO `user` VALUES 
(1,'SYSTEM','xxxxx','System','System','XXX-XXX-XXXX','system@test.com','\0','\0','','2017-09-26 11:13:47','2017-09-26 11:13:47',1),
(2,'sblessing','login','Sean','Blessing','513-600-7096','sean@blessingtechnology.com','','','','2017-09-28 16:35:33','2017-09-28 16:35:33',1);

-- insert core status values
INSERT INTO `status` VALUES 
(1,'New','','2017-09-29 12:33:39','2017-09-29 12:33:39',1),
(2,'Approved','','2017-09-29 12:33:39','2017-09-29 12:33:39',1),
(3,'Rejected','','2017-09-29 12:33:39','2017-09-29 12:33:39',1),
(4,'Review','','2017-12-16 11:39:08','2017-12-16 11:44:06',1);

-- insert vendors
INSERT INTO `vendor` VALUES 
(1,'BB-1001','Best Buy','100 Best Buy Street','Louisville','KY','40207','502-111-9099','geeksquad@bestbuy.com','\0','','2017-09-26 11:13:47','2017-09-26 11:13:47',1),
(2,'AP-1001','Apple Inc','1 Infinite Loop','Cupertino','CA','95014','800-123-4567','genius@apple.com','\0','','2017-09-26 11:13:47','2017-09-26 11:13:47',1),
(3,'AM-1001','Amazon','410 Terry Ave. North','Seattle','WA','98109','206-266-1000','amazon@amazon.com','','','2017-09-26 11:13:47','2017-09-26 11:13:47',1),
(4,'ST-1001','Staples','9550 Mason Montgomery Rd','Mason','OH','45040','513-754-0235','support@orders.staples.com','','','2017-09-26 11:13:47','2017-09-26 11:13:47',1),
(5,'MC-1001','Micro Center','11755 Mosteller Rd','Sharonville','OH','45241','513-782-8500','support@microcenter.com','','','2017-09-26 11:13:47','2017-09-26 11:13:47',1);

-- insert base products
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (1,1,'ME280LL','iPad Mini 2',296.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (2,2,'ME280LL','iPad Mini 2',299.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (3,3,'105810','Hammermill Paper, Premium Multi-Purpose Paper Poly Wrap',8.99,'1 Ream / 500 Sheets',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (4,4,'122374','HammerMill® Copy Plus Copy Paper, 8 1/2\" x 11\", Case',29.99,'1 Case, 10 Reams, 500 Sheets per ream',NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (5,4,'784551','Logitech M325 Wireless Optical Mouse, Ambidextrous, Black ',14.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (6,4,'382955','Staples Mouse Pad, Black',2.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (7,4,'2122178','AOC 24-Inch Class LED Monitor',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (8,4,'2460649','Laptop HP Notebook 15-AY163NR',529.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (9,4,'2256788','Laptop Dell i3552-3240BLK 15.6\"',239.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (10,4,'IM12M9520','Laptop Acer Acer™ Aspire One Cloudbook 14\"',224.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (11,4,'940600','Canon imageCLASS Copier (D530)',99.99,NULL,NULL);
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (12,5,'228148','Acer Aspire ATC-780A-UR12 Desktop Computer',399.99,'','/images/AcerAspireDesktop.jpg');
INSERT INTO `product` (`ID`,`VendorID`,`PartNumber`,`Name`,`Price`,`Unit`,`PhotoPath`) VALUES (13,5,'279364','Lenovo IdeaCentre All-In-One Desktop',349.99,'','/images/LenovoIdeaCenter.jpg');