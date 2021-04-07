
/*Q.1.Create the Student table again without the following columns: DeptName, CourseName, CurrentBatchName, StudentStatus*/

create table dbo.STUDENTS(
Student_id INT,
StName VARCHAR(100),
StAddress VARCHAR(200),
Phone NUMERIC(10),
Email VARCHAR(50),
DateOfBirth Date,
DateOfAdmission Date,
DateOfPassing Date,
)
/*Commands completed successfully.*/






/*Q2.Alter the Student table to add a column named PresentAddress VARCHAR(200)*/
ALTER TABLE dbo.STUDENTS
 ADD PresentAddress VARCHAR(200)

 /--Commands completed successfully.--/




/*Q3.Create four master tables:
-- a.	Department (DeptId INT, DeptName VARCHAR(50))
-- b.	Course (CourseId INT, CourseName VARCHAR(50))
-- c.	Batch (BatchId INT, BatchName VARCHAR(50))
-- d.	StudentStatus (StatusId INT, StatusDesc VARCHAR(50))*/


Create table dbo.DEPARTMENT (DeptId INT, DeptName VARCHAR(50))
/*Commands completed successfully*/

Create table dbo.Course (CourseId INT, CourseName VARCHAR(50))
/*Commands completed successfully*/

Create table dbo.Batch (BatchId INT, BatchName VARCHAR(50))
/*Commands completed successfully*/

Create table dbo.StudentStatus (StatusId INT, StatusDesc VARCHAR(50))
/*Commands completed successfully*/




/*Q4.Alter the Student table to add a column named PresentAddress VARCHAR(200)*/
alter table dbo.STUDENTS
add DeptId INT, 
   CourseId INT, 
   BatchId  INT,
   StatusId INT
/*Commands completed successfully*/




/*Q5.Insert 4 records in Department table.*/ 
INSERT into DEPARTMENT values (1010,'ABC'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
/*4 rows affected*/

/*Q6.Insert 4 records in Course table.*/
INSERT into Course values (1010,'ABC'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
/*4 rows affected*/

/*Q7.Insert 4 records in Batch table.*/ 
INSERT into Batch values (1010,'ABC'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
/*4 rows affected*/

/*Q8.Insert 4 records in StudentStatus table.*/ 
INSERT into StudentStatus values (1010,'ACTIVE'),(1012,'ACTIVE'),(1013,'PASSED'),(1014,'PASSED')
/*4 rows affected*/


/*Q9.Insert 10 records in the student table. DeptId, CourseId, BatchId, StatusId columns should have some data common with the master table data.*/

INSERT into  STUDENTS(Student_Id, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId  )
                     values (1,'A','KOLKATA',1234567890,'abc2gmail.com','1-1-1999','1-7-2018','1-8-2022','Delhi',1010,1010,1010,1010),
                            (2,'B','KOLKATA',9984567890,'abc2gmail.com','2-2-1999','1-7-2018','1-8-2022','Delhi',1011,1011,1011,1011),
							(3,'C','KOLKATA',8451567890,'abc2gmail.com','3-3-1999','1-7-2018','1-8-2022','Delhi',1012,1012,1012,1012),
							(4,'D','KOLKATA',9845167890,'abc2gmail.com','4-4-1999','1-7-2018','1-8-2022','Delhi',1013,1013,1013,1013),
							(5,'E','KOLKATA',8451567890,'abc2gmail.com','5-5-1999','1-7-2018','1-8-2022','Delhi',1014,1014,1014,1014),
							(6,'F','KOLKATA',9524567890,'abc2gmail.com','6-6-1999','1-7-2018','1-8-2022','Delhi',1015,1015,1015,1015),
							(7,'G','KOLKATA',8454567890,'abc2gmail.com','7-7-1999','1-7-2018','1-8-2022','Delhi',1016,1016,1016,1016),
							(8,'H','KOLKATA',9854567890,'abc2gmail.com','8-8-1999','1-7-2018','1-8-2022','Delhi',1017,1017,1017,1017),
							(9,'I','KOLKATA',8524567890,'abc2gmail.com','9-9-1999','1-7-2018','1-8-2022','Delhi',1018,1018,1018,1018),
							(10,'J','KOLKATA',9852467890,'abc2gmail.com','10-10-1999','1-7-2018','1-8-2022','Delhi',1019,1019,1019,1019)
/*10 rows affected*/





/*Q10.Write an inner join between Student and Department to retrieve the department name for all the students*/

SELECT D.DeptName 
 FROM dbo.STUDENTS AS S
 INNER JOIN dbo.DEPARTMENT as D
 ON S.DeptId=D.DeptId


/*DeptName
ABC
ABC
BCD
BCD
CDE
CDE
DEF
DEF
*/
