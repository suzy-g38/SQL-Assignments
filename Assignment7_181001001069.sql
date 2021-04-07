
--Question1.Drop and create Student and Department tables. Don’t create Primary key, unique key or foreign key constraints on the tables now.

DROP TABLE dbo.DEPARTMENT
DROP TABLE dbo.STUDENTS
DROP view dbo.vStudentDept

--Commands completed successfully.
--Commands completed successfully.


CREATE TABLE dbo.STUDENTS(
    StudentId  INT NOT NULL,
    Name VARCHAR(100),
    Address VARCHAR(200),
    Phone NUMERIC(10,0),
    Email VARCHAR(50),
    DateOfBirth Date,
    DateOfAdmission Date,
    DateOfPassing Date,
    DeptId INT,
    CourseId INT,
    BatchId INT,
    StatusId INT,
    AadharId NUMERIC(16,0) NOT NULL,
)

    CREATE TABLE dbo.DEPARTMENT(
    DeptId INT NOT NULL,
    DeptName VARCHAR(50)

)

--Commands completed successfully.
--Commands completed successfully.



--Question 2. Create clustered index on studentId column of Student table.

CREATE CLUSTERED INDEX S_StudentId ON dbo.STUDENTS(StudentId)

--Commands completed successfully.

--Question 3. Create unique clustered index on deptId column of Department table

CREATE UNIQUE CLUSTERED INDEX D_DeptId ON dbo.DEPARTMENT(DeptId)

--Commands completed successfully.


--Question 4. Create a nonclustered index on name,address columns of Student table only for the students whose address is Kolkata

CREATE NONCLUSTERED INDEX S_Address ON dbo.STUDENTS(Name,Address)
WHERE Address = 'kolkata'

--Commands completed successfully.

--Question 5.Drop and recreate the nonclustered index. Email and phone columns should be added as included columns.

DROP INDEX S_Address ON dbo.STUDENTS

CREATE NONCLUSTERED INDEX S_Address ON dbo.STUDENTS(Name,Address) include (Email,phone)

--Commands completed successfully.
--Commands completed successfully.

--Question6.Insert 10 records in Student table and 4 records in Department table.

INSERT INTO dbo.STUDENTS VALUES(1020, 'A', 'Kolkata', 9007795411, 'abc@gmail.com', '1999-01-01', '2022-08-02', '2018-03-10', '101', '202', '303', '404', '672382048913')
INSERT INTO dbo.STUDENTS VALUES(1021, 'B', 'Kolkata', 9007795412, 'bcd@gmail.com', '1999-02-02', '2022-06-02', '2019-03-10', '102', '201', '304', '403',   '672382228914')
INSERT INTO dbo.STUDENTS VALUES(1022, 'C', 'Delhi', 9007795413, 'cde@gmail.com', '1994-03-03', '2013-07-02', '2017-03-10', '103', '203', '302', '403','672392048745')
INSERT INTO dbo.STUDENTS VALUES(1023, 'D', 'Goa', 9007795414, 'def@gmail.com', '1994-04-04', '2012-06-02', '2016-03-10', '104', '204', '304', '401', '672392048915')
INSERT INTO dbo.STUDENTS VALUES(1024, 'E', 'Chennai', 9007795415, 'efg@gmail.com', '1999-05-05', '2017-07-02', '2021-03-10', '101', '202', '303', '404', '672382088916')
INSERT INTO dbo.STUDENTS VALUES(1025, 'F', 'Mumbai', 9007795416, 'fgh@gmail.com', '1997-06-06', '2016-08-02', '2020-03-10', '102', '201', '303', '402', '772382048917')
INSERT INTO dbo.STUDENTS VALUES(1026, 'G', 'Panji', 9007795417, 'ghi@gmail.com', '1995-07-07', '2014-08-02', '2018-03-10', '103', '203', '303', '404', '672352048918')
INSERT INTO dbo.STUDENTS VALUES(1027, 'H', 'Assam', 9007795418, 'hij@gmail.com', '1996-08-08', '2015-06-02', '2019-03-10', '102', '202', '302', '402', '772382048919')
INSERT INTO dbo.STUDENTS VALUES(1028, 'I', 'Kolkata', 9007795419, 'ijk@gmail.com', '1999-09-09', '2016-05-02', '2020-03-10', '104', '201', '303', '401', '772381048921')
INSERT INTO dbo.STUDENTS VALUES(1029, 'J', 'Agra', 9007795410, 'jkl@gmail.com', '1999-10-10', '2016-07-02', '2020-03-10', '104', '204', '301', '404', '672382048922')

/* (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 (1 row affected)
 */

INSERT INTO Department VALUES (101, 'CSE')
INSERT INTO Department VALUES (102, 'BCA')
INSERT INTO Department VALUES (103, 'ECE')
INSERT INTO Department VALUES (104, 'IT')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/

--Question 7. Create a view named vStudentDept to retrieve student id, studentname and departname by joining both the tables WITH SCHEMABINDING option should be added.

CREATE VIEW vStudentDept
WITH SCHEMABINDING
As 
SELECT S.StudentId,S.Name,D.DeptName
FROM dbo.STUDENTS AS S
INNER JOIN dbo.DEPARTMENT d ON S.DeptId=D.DeptId
GO

--Commands completed successfully

--Question 8. Retrieve Studentname and departname from vStudentDept view only for CSE department.

Select Name,DeptName 
From dbo.vStudentDept 
where DeptName='CSE'
/*
Name	DeptName
A	     CSE
E	     CSE
*/

--Question 9. Create a unique clustered index on student id column of vStudentDept view

CREATE UNIQUE CLUSTERED INDEX IX_StudentId ON dbo.vStudentDept(StudentId)

--Commands completed successfully.

--Question 10.Create a nonclustered index on departname column of vStudentDept view.*/

 CREATE NONCLUSTERED INDEX IX_DeptName ON dbo.vStudentDept(DeptName)

--Commands completed successfully.

EXECUTE sp_help 'dbo.vStudentDept'
EXECUTE sp_help 'dbo.STUDENTS'
EXECUTE sp_help 'dbo.Department'