
SELECT user.name as UserName, course.name as CourseName
FROM user, course 
where user.courseid = course.id;

SELECT user.name as UserName, course.name as CourseName
FROM user
LEFT JOIN course on user.courseid = course.id;

SELECT user.name, course.name
FROM user
INNER JOIN course on user.courseid = course.id;

SELECT user.name, course.name
FROM user
RIGHT JOIN course on user.courseid = course.id;

-- using an alias (calling invoice i and lineItem l)
Select OrderNumber, CustomerNumber, OrderDate, INVOICEID, -- instead of Code, Description, ListPrice, Quantity use sum()
sum(b.Quantity*c.ListPrice) as 'Invoice Total' from INVOICE a, lineitem b, product c
where a.ID =1
and a.ID=b.InvoiceID
and b.ProductID=c.ID
group by a.ID;

SELECT * from Invoice 
inner Join lineItem on Invoice.ID = lineItem.invoiceID; 

-- insert some test data for invoice and line item, based on products above
INSERT INTO Invoice VALUES
(1, 'SB0001', 'Sean Blessing', '2018-03-08', 0);

INSERT INTO LineItem VALUES
(1, 1, 7, 5);

