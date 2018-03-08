-- create and select the database
DROP DATABASE IF EXISTS Students;
CREATE DATABASE  Students;
USE Students;

CREATE TABLE Course (
  ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Name          VARCHAR(25)   NOT NULL
 

);

INSERT  INTO Course (ID, Name) VALUES

(1, 'HTML'),
(2,'CSS3'),
(3,'JavaScript'),
(4,'PHP'),
(5, 'MySQL');

-- create the Product table
CREATE TABLE User (
  ID      INT            PRIMARY KEY  AUTO_INCREMENT,
  Name          VARCHAR(25)   NOT NULL,
  CourseID		INT, 
  Foreign key (courseID) REFERENCES COURSE (ID)
  
);

-- insert some rows into the Product table
INSERT  INTO User (Name, CourseID) VALUES

('Alice',1),
('Bob',1),
('Caroline', 2),
('David', 5),
('Emma', NULL);

