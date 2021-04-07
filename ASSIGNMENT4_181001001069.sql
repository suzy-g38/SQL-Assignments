--1.Select all the students who are active, sorted by studentid in descending order

SELECT S.Student_Id as SStudent_Id, S.StName as Name, S.StatusId as SStatusId,  C.StatusDesc as StudentStatus
FROM    dbo.STUDENTS as S
inner join dbo.StudentStatus as C On S.StatusId=C.StatusId
where C.StatusDesc='Active'
order by Student_Id desc

/*
Name	SStudent_Id	SStatusId	StudentStatus
E	5	1014	ACTIVE
D	4	1013	ACTIVE
*/

--2. Create a copy of the student table named student_copy only having records for CSE department students using SELECT INTO clause
Select S.Student_Id as SStudentId, StName, D.DeptName as Department, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, D.DeptId, CourseId, BatchId, StatusId into student_copy
FROM    dbo.STUDENTS as S
inner join [dbo].[DEPARTMENT] as D on D.DeptId= S.DeptId
where D.DeptName='CSE'

--3 rows affected

--3.Select the count of students in each department only when the count is more than 2.

  SELECT  D.DeptName,COUNT(Student_ID) AS total
  FROM [dbo].[STUDENTS] as S
  inner join [dbo].[DEPARTMENT] as D on D.DeptId= S.DeptId
  GROUP BY D.DeptId, D.DeptName
  HAVING COUNT(Student_ID)> 2
/*
 DeptName	total
CSE	3
ECE	3
BE	3
*/
 
--4.Insert two different sets of records in student and student_copy table.

INSERT into  STUDENTS(Student_Id, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId  )
                     values (1,'A','KOLKATA',1234567890,'abc2gmail.com','1-1-1999','1-7-2018','1-8-2022','Delhi',1010,1011,1010,1010),
                            (2,'B','GOA',9984567890,'bcd3gmail.com','2-2-1999','1-7-2018','1-8-2022','Delhi',1011,2011,1011,1011)

/*INSERT into  student_copy(Student_Id, StName,,Department, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId )*/
INSERT into student_copy values (1,'C','CSE','DELHI',1234777770,'efg4gmail.com','3-1-1999','1-7-2018','1-8-2022','Delhi',1012,3012,1012,1014),
                                (2,'D','CSE','MUMBAI',9984787890,'hij5gmail.com','4-2-1999','1-7-2018','1-8-2022','Delhi',1014,4012,1014,1014)

--2 rows affected
--2 rows affected

--5.Select the records from student table which are not present in student_copy table.

Select Student_Id, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId
from dbo.STUDENTS 
except 
select SStudentId, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId
from dbo.student_copy

/*
Student_Id	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	StatusId
1	A	KOLKATA	1234567890	abc2gmail.com	1999-01-01	2018-01-07	2022-01-08	Delhi	1010	1011	1010	1010
2	B	GOA	9984567890	bcd3gmail.com	1999-02-02	2018-01-07	2022-01-08	Delhi	1011	2011	1011	1011
4	D	KOLKATA	9845167890	abc2gmail.com	1999-04-04	2018-01-07	2022-01-08	Delhi	1012	1013	1013	1013
5	E	KOLKATA	8451567890	abc2gmail.com	1999-05-05	2018-01-07	2022-01-08	Delhi	1013	1014	1014	1014
6	F	KOLKATA	9524567890	abc2gmail.com	1999-06-06	2018-01-07	2022-01-08	Delhi	1013	1015	1015	1015
7	G	KOLKATA	8454567890	abc2gmail.com	1999-07-07	2018-01-07	2022-01-08	Delhi	1013	1016	1016	1016
8	H	KOLKATA	9854567890	abc2gmail.com	1999-08-08	2018-01-07	2022-01-08	Delhi	1014	1017	1017	1017
9	I	KOLKATA	8524567890	abc2gmail.com	1999-09-09	2018-01-07	2022-01-08	Delhi	1014	1018	1018	1018
10	J	KOLKATA	9852467890	abc2gmail.com	1999-10-10	2018-01-07	2022-01-08	Delhi	1014	1019	1019	1019
*/



--Table used for execution

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

ALTER TABLE dbo.STUDENTS
 ADD PresentAddress VARCHAR(200)


Create table dbo.DEPARTMENT (DeptId INT, DeptName VARCHAR(50))
Create table dbo.Course (CourseId INT, CourseName VARCHAR(50))
Create table dbo.Batch (BatchId INT, BatchName VARCHAR(50))
Create table dbo.StudentStatus (StatusId INT, StatusDesc VARCHAR(50))

alter table dbo.STUDENTS
add DeptId INT, 
   CourseId INT, 
   BatchId  INT,
   StatusId INT

INSERT into DEPARTMENT values (1010,'CSE'),(1012,'ME'),(1013,'ECE'),(1014,'BE')
INSERT into Course values (1010,'BTECH'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
INSERT into Batch values (1010,'BCS3B'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
INSERT into StudentStatus values (1010,'COMPLETED'),(1012,'ACTIVE'),(1013,'ACTIVE'),(1014,'ACTIVE')



INSERT into  STUDENTS(Student_Id, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId  )
                     values (1,'A','KOLKATA',1234567890,'abc2gmail.com','1-1-1999','1-7-2018','1-8-2022','Delhi',1010,2011,1010,1010),
                            (2,'B','KOLKATA',9984567890,'abc2gmail.com','2-2-1999','1-7-2018','1-8-2022','Delhi',1010,1011,1011,1011),
							(3,'C','KOLKATA',8451567890,'abc2gmail.com','3-3-1999','1-7-2018','1-8-2022','Delhi',1010,2012,1012,2022),
							(4,'D','KOLKATA',9845167890,'abc2gmail.com','4-4-1999','1-7-2018','1-8-2022','Delhi',1012,1013,1013,1013),
							(5,'E','KOLKATA',8451567890,'abc2gmail.com','5-5-1999','1-7-2018','1-8-2022','Delhi',1013,1014,1014,1014),
							(6,'F','KOLKATA',9524567890,'abc2gmail.com','6-6-1999','1-7-2018','1-8-2022','Delhi',1013,1015,1015,1015),
							(7,'G','KOLKATA',8454567890,'abc2gmail.com','7-7-1999','1-7-2018','1-8-2022','Delhi',1013,1016,1016,1016),
							(8,'H','KOLKATA',9854567890,'abc2gmail.com','8-8-1999','1-7-2018','1-8-2022','Delhi',1014,1017,1017,1017),
							(9,'I','KOLKATA',8524567890,'abc2gmail.com','9-9-1999','1-7-2018','1-8-2022','Delhi',1014,1018,1018,1018),
							(10,'J','KOLKATA',9852467890,'abc2gmail.com','10-10-1999','1-7-2018','1-8-2022','Delhi',1014,1019,1019,1019)