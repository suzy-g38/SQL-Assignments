--Question 1 Write a query to retrieve all the courses where there is no student.

SELECT C.CourseId as CCourseId, C.CourseName as CCourseName, S.CourseId as SCourseId, S.Student_Id as SStudentId,  StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, BatchId, StatusId 
FROM dbo.Course AS C
LEFT JOIN dbo.STUDENTS as S
ON C.CourseId = S.CourseId
Where S.CourseId is NULL


/*
CCourseId	CCourseName	SCourseId	SStudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	BatchId	StatusId
1010	ABC	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL
1013	CDE	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL	NULL
*/


--  Question 2 Write a query to retrieve all the students having a status value not present in StudentStatus table.

SELECT S.StatusId as SStatusId, S.Student_Id as SStudentId, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, Q.StatusId as QStatusId, Q.StatusDesc as QStatusDesc 
FROM dbo.STUDENTS As S
LEFT JOIN dbo.StudentStatus as Q
ON S.StatusId = Q.StatusID
Where Q.StatusId is NULL

/*
SStatusId	SStudentId	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	PresentAddress	DeptId	CourseId	BatchId	QStatusId	QStatusDesc
1011	      2	          B	KOLKATA	9984567890	abc2gmail.com	1999-02-02	2018-01-07	2022-01-08	Delhi	1011	2014	1011	NULL	NULL
1015	      6	          F	KOLKATA	9524567890	abc2gmail.com	1999-06-06	2018-01-07	2022-01-08	Delhi	1015	1015	1015	NULL	NULL
1016	      7	          G	KOLKATA	8454567890	abc2gmail.com	1999-07-07	2018-01-07	2022-01-08	Delhi	1016	1016	1016	NULL	NULL
1017	      8	          H	KOLKATA	9854567890	abc2gmail.com	1999-08-08	2018-01-07	2022-01-08	Delhi	1017	2021	1017	NULL	NULL
1018	      9	          I	KOLKATA	8524567890	abc2gmail.com	1999-09-09	2018-01-07	2022-01-08	Delhi	1018	1018	1018	NULL	NULL
1019	      10          j	KOLKATA	9852467890	abc2gmail.com	1999-10-10	2018-01-07	2022-01-08	Delhi	1019	2020	1019	NULL	NULL
*/


-- Question 3 Select the student records with completed status for CSE Department and BCS3B batch.

SELECT S.Student_id as ID, S.StName as Name, C.StatusDesc as StudentStatus, B.BatchName as BatchName, D.DeptName as Department
FROM    dbo.STUDENTS as S
inner join dbo.DEPARTMENT as D On D.DeptId=S.DeptId
inner join dbo.Batch as B On B.BatchId=S.BatchId
inner join dbo.StudentStatus as C On C.StatusId=S.StatusId
Where D.DeptName='CSE' and B.BatchName='BCS3B' and C.StatusDesc='Completed'

/*
ID	Name	StudentStatus	BatchName	Department
1	A	     COMPLETED	     BCS3B	     CSE
*/

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

INSERT into DEPARTMENT values (1010,'CSE'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
INSERT into Course values (1010,'BTECH'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
INSERT into Batch values (1010,'BCS3B'),(1012,'BCD'),(1013,'CDE'),(1014,'DEF')
INSERT into StudentStatus values (1010,'COMPLETED'),(1012,'ACTIVE'),(1013,'PASSED'),(1014,'PASSED')

INSERT into  STUDENTS(Student_Id, StName, StAddress, Phone, Email, DateOfBirth, DateOfAdmission, DateOfPassing, PresentAddress, DeptId, CourseId, BatchId, StatusId  )
                     values (1,'A','KOLKATA',1234567890,'abc2gmail.com','1-1-1999','1-7-2018','1-8-2022','Delhi',1010,2011,1010,1010),
                            (2,'B','KOLKATA',9984567890,'abc2gmail.com','2-2-1999','1-7-2018','1-8-2022','Delhi',1011,1011,1011,1011),
							(3,'C','KOLKATA',8451567890,'abc2gmail.com','3-3-1999','1-7-2018','1-8-2022','Delhi',1012,2012,1012,2022),
							(4,'D','KOLKATA',9845167890,'abc2gmail.com','4-4-1999','1-7-2018','1-8-2022','Delhi',1013,1013,1013,1013),
							(5,'E','KOLKATA',8451567890,'abc2gmail.com','5-5-1999','1-7-2018','1-8-2022','Delhi',1014,1014,1014,1014),
							(6,'F','KOLKATA',9524567890,'abc2gmail.com','6-6-1999','1-7-2018','1-8-2022','Delhi',1015,1015,1015,1015),
							(7,'G','KOLKATA',8454567890,'abc2gmail.com','7-7-1999','1-7-2018','1-8-2022','Delhi',1016,1016,1016,1016),
							(8,'H','KOLKATA',9854567890,'abc2gmail.com','8-8-1999','1-7-2018','1-8-2022','Delhi',1017,1017,1017,1017),
							(9,'I','KOLKATA',8524567890,'abc2gmail.com','9-9-1999','1-7-2018','1-8-2022','Delhi',1018,1018,1018,1018),
							(10,'J','KOLKATA',9852467890,'abc2gmail.com','10-10-1999','1-7-2018','1-8-2022','Delhi',1019,1019,1019,1019)