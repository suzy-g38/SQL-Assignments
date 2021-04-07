--Q1 CREATE A DATABASE "UNIVERSITY"
/* Right click databases, and then click New Database.
In New Database, enter a database name "UNIVERSITY" .*/


--Q2 CREATE A TABLE "student" IN DATABASE "UNIVERSITY"
create table dbo.STUDENTS
(
StudentID INT,
stName VARCHAR(100),
stAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
Date0fBirth Date,
Date0fAdmission Date,
DateofPassing Date,
DeptName VARCHAR(50),
CourseName VARCHAR(50),
BatchName VARCHAR(10),
StudentStatus VARCHAR(10)
)
/*Commands completed successfully*/

--Q3 DISPLAY VALUS INTO THE TABLE
select * from dbo.STUDENTS
/* 
StudentID	stName	stAddress	Phone	Email	Date0fBirth	Date0fAdmission	DateofPassing	DeptName	CourseName	BatchName	StudentStatus
*/

--Q3 INSERT VALUES INTO THE TABLE
Insert into dbo.STUDENTS(StudentID,stName,stAddress,Phone,Email,Date0fBirth,Date0fAdmission,DateofPassing,DeptName,CourseName,BatchName,StudentStatus) 
values  (1008, 'a','LMN',1234567890,'abcde123@gmail.com', '1234-1-2', '2018-1-1' , '2022-7-19', 'Btech','DBMS','BCS3A','ACTIVE'),
        (1009, 'b','MNO',8901234567,'a12308@gmail.com', '1999-1-2', '2018-7-1' , '2022-7-19', 'Btech','DBMS','BCS3A','ACTIVE'),
        (1010, 'c','OPQ',9012345678,'abdc12308@gmail.com', '1999-1-20', '2018-7-13' , '2022-7-19', 'Btech','DBMS','BCS3A','ACTIVE'),
		(1011,'d','ABC',1234567890,'a@gmail.com','1999-1-1','2018-7-14','2022-7-19','Btech','DBMS','BCS3A','ACTIVE'),
		(1012,'e','BCD',3456789012,'b@gmail.com','1999-1-2','2018-7-15','2022-7-20','Btech','DBMS','BCS3A','ACTIVE'),
		(1013,'f','DEF',4567890123,'c@gmail.com','1999-1-3','2018-7-16','2022-7-21','Btech','DBMS','BCS3A','LEFT'),
		(1014,'g','FGH',5678901234,'d@gmail.com','1999-1-4','2018-7-17','2022-7-22','Btech','DBMS','BCS3A','ACTIVE'),
		(1015,'h','HIJ',6789012345,'e@gmail.com','1998-1-5','2010-7-18','2022-7-23','Btech','DBMS','BCS3A','COMPLETED'),
		(1016,'i','JKL',7890123456,'f@gmail.com','1999-1-6','2018-7-19','2022-7-24','Btech','DBMS','BCS3A','ACTIVE'),
		(1017,'J','QRS',7890123456,'j@gmail.com','1999-1-6','2018-7-19','2022-7-24','Btech','DBMS','BCS3A','ACTIVE')

/*10 rows affected*/

--Q5 Update all the records set StudentStatus as completed where BatchName = 'BCS3A' 

UPDATE dbo.STUDENTS set StudentStatus='completed' where BatchName ='BCS3A'
/*10 rows affected*/

--Q6 Delete the records from Student table where DeptName = ' '

DELETE FROM dbo.STUDENTS where DeptName='PHARMACY'
/*0 rows affected*/

--Q7 Select all the records from the Student Table

SELECT * FROM dbo.STUDENTS
/*
StudentID	stName	stAddress	Phone	           Email	    Date0fBirth	  Date0fAdmission	DateofPassing	DeptName	CourseName	BatchName	StudentStatus
1008	      a	      LMN	   1234567890	abcde123@gmail.com	  1234-01-02	2018-01-01	     2022-07-19     Btech	      DBMS	     BCS3A	     completed
1009	      b       MNO	   8901234567	a12308@gmail.com	  1999-01-02	2018-07-01	     2022-07-19	    Btech	      DBMS	     BCS3A	     completed
1010	      c	      OPQ	   9012345678	abdc12308@gmail.com	  1999-01-20	2018-07-13	     2022-07-19	    Btech	      DBMS	     BCS3A	     completed
1011	      d	      ABC	   1234567890	a@gmail.com	          1999-01-01	2018-07-14	     2022-07-19	    Btech	      DBMS	     BCS3A	     completed
1012	      e	      BCD	   3456789012	b@gmail.com	          1999-01-02	2018-07-15	     2022-07-20	    Btech	      DBMS	     BCS3A	     completed
1013	      f	      DEF	   4567890123	c@gmail.com	          1999-01-03	2018-07-16	     2022-07-21	    Btech	      DBMS	     BCS3A	     completed
1014	      g	      FGH	   5678901234	d@gmail.com	          1999-01-04	2018-07-17	     2022-07-22	    Btech	      DBMS	     BCS3A	     completed
1015	      h	      HIJ	   6789012345	e@gmail.com	          1998-01-05	2010-07-18	     2022-07-23	    Btech	      DBMS	     BCS3A	     completed
1016	      i	      JKL	   7890123456	f@gmail.com	          1999-01-06	2018-07-19	     2022-07-24	    Btech	      DBMS	     BCS3A	     completed
1017	      J	      QRS	   7890123456	j@gmail.com	          1999-01-06	2018-07-19	     2022-07-24	    Btech	      DBMS	     BCS3A	     completed
*/
--Q8  Select the records from the student table where StudentStatus is not completed

SELECT * FROM dbo.STUDENTS where StudentStatus='Not completed'
/*
StudentID	stName	stAddress	Phone	Email	Date0fBirth	Date0fAdmission	DateofPassing	DeptName	CourseName	BatchName	StudentStatus
*/

--Q9 Truncate the table and select all the records from the table.

truncate table dbo.STUDENTS select * from dbo.STUDENTS
/*
StudentID	stName	stAddress	Phone	Email	Date0fBirth	Date0fAdmission	DateofPassing	DeptName	CourseName	BatchName	StudentStatus
*/

--Q10 Drop the Student table
drop Table dbo.STUDENTS
/* Commands completed successfully.*/


