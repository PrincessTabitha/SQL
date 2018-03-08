
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


SELECT * from Invoice 
inner Join lineItem on Invoice.ID = lineItem.invoiceID; 

