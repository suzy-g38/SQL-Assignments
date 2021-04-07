--Q1. Drop all the five tables created so far.
DROP TABLE dbo.Batch
DROP TABLE dbo.Course
DROP TABLE dbo.DEPARTMENT
DROP TABLE dbo.STUDENTS
DROP TABLE dbo.StudentStatus
/* Commands completed successfully.*/ 


--Q2. Create the Student table again with a new column AadharId NUMERIC(16,0). StudentId and AadharId should be declared as NOT NULL. Create Primary key on studentid column and unique key on AadharId column.

CREATE TABLE dbo.STUDENTS(
Student_ID int NOT NULL, 
StName varchar(100),
StAddress varchar(200),
Phone numeric(10,0),
Email varchar(50),
DateOfBirth date,
DateOfAdmission date,
DateOfPassing date,
DeptName varchar(50),
CourseName varchar(50),
BatchName varchar(10),
StudentStatus varchar(10), CHECK(StudentStatus='active' OR StudentStatus='left' OR StudentStatus='completed'),
AadharID NUMERIC(16,0) NOT NULL, 
CONSTRAINT PK_Student_StudentID PRIMARY KEY CLUSTERED(Student_ID),
CONSTRAINT UK_Student_AadharID UNIQUE(AadharID)
)

--Commands completed successfully.


--Q3. Create the below four tables again with primary key constraint on the id columns: 
--a. Department – DeptId
--b. Course – CourseId
--c. Batch -- BatchId 
--d. StudentStatus -- StatusId

CREATE TABLE Department(
DeptId INT,
DeptName VARCHAR(50),
CONSTRAINT PK_Dept_DeptId PRIMARY KEY CLUSTERED (DeptId)
)

/*Commands completed successfully.*/

CREATE TABLE Course(
CourseId INT,
CourseName VARCHAR(50),
CONSTRAINT PK_Course_CourseId PRIMARY KEY CLUSTERED (CourseId)
)
/*Commands completed successfully.*/

CREATE TABLE Batch(
BatchId INT,
BatchName VARCHAR(50),
CONSTRAINT PK_Batch_BatchId PRIMARY KEY CLUSTERED (BatchId)
)

/*Commands completed successfully.*/


CREATE TABLE StudentStatus(
StatusId INT,
StatusDesc VARCHAR(50),
CONSTRAINT PK_Status_StatusId PRIMARY KEY CLUSTERED (StatusId)
)

/*Commands completed successfully.*/


-- Q4. Insert 4 records in each of the four tables.

-- Department Table

INSERT INTO Department VALUES (1001, 'CSE')
INSERT INTO Department VALUES (1002, 'BCA')
INSERT INTO Department VALUES (1003, 'ECE')
INSERT INTO Department VALUES (1004, 'IT')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/

-- Course Table

INSERT INTO Course VALUES (2001, 'DBMS')
INSERT INTO Course VALUES (2002, 'OS')
INSERT INTO Course VALUES (2003, 'CG')
INSERT INTO Course VALUES (2004, 'CD')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/

-- Batch Table

INSERT INTO Batch VALUES (3001, 'BCS3A')
INSERT INTO Batch VALUES (3002, 'BCS3B')
INSERT INTO Batch VALUES (3003, 'BCS3C')
INSERT INTO Batch VALUES (3004, 'BCS3D')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/


-- StudentStatus Table

INSERT INTO StudentStatus VALUES (4001, 'ACTIVE')
INSERT INTO StudentStatus VALUES (4002, 'COMPLETED')
INSERT INTO StudentStatus VALUES (4003, 'LEFT')
INSERT INTO StudentStatus VALUES (4004, 'ACTIVE')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/


--Q5. Insert 10 records in Student table.

INSERT INTO dbo.STUDENTS VALUES(1020, 'A', 'Kolkata', 9007795411, 'abc@gmail.com', '1999-01-01', '2022-08-02', '2018-03-10', 'CSE', 'Btech', 'BCS3A', 'Active', '672382048913')
INSERT INTO dbo.STUDENTS VALUES(1021, 'B', 'Kolkata', 9007795412, 'bcd@gmail.com', '1999-02-02', '2022-06-02', '2019-03-10', 'IT', 'Btech', 'BE3B', 'Active',   '672382228914')
INSERT INTO dbo.STUDENTS VALUES(1022, 'C', 'Delhi', 9007795413, 'cde@gmail.com', '1994-03-03', '2013-07-02', '2017-03-10', 'ECE', 'Btech', 'BEC3C', 'Completed','672392048745')
INSERT INTO dbo.STUDENTS VALUES(1023, 'D', 'Goa', 9007795414, 'def@gmail.com', '1994-04-04', '2012-06-02', '2016-03-10', 'CSE', 'Btech', 'BCS3A', 'Completed', '672392048915')
INSERT INTO dbo.STUDENTS VALUES(1024, 'E', 'Chennai', 9007795415, 'efg@gmail.com', '1999-05-05', '2017-07-02', '2021-03-10', 'BCA', 'Btech', 'BCA3B', 'Active', '672382088916')
INSERT INTO dbo.STUDENTS VALUES(1025, 'F', 'Mumbai', 9007795416, 'fgh@gmail.com', '1997-06-06', '2016-08-02', '2020-03-10', 'Civil', 'Btech', 'BCE3A', 'Active', '772382048917')
INSERT INTO dbo.STUDENTS VALUES(1026, 'G', 'Panji', 9007795417, 'ghi@gmail.com', '1995-07-07', '2014-08-02', '2018-03-10', 'CSE', 'Btech', 'BCS3A', 'Completed', '672352048918')
INSERT INTO dbo.STUDENTS VALUES(1027, 'H', 'Assam', 9007795418, 'hij@gmail.com', '1996-08-08', '2015-06-02', '2019-03-10', 'CSE', 'Btech', 'BCS3A', 'Completed', '772382048919')
INSERT INTO dbo.STUDENTS VALUES(1028, 'I', 'Kolapur', 9007795419, 'ijk@gmail.com', '1999-09-09', '2016-05-02', '2020-03-10', 'BCA', 'Btech', 'BCA3C', 'Active', '772381048921')
INSERT INTO dbo.STUDENTS VALUES(1029, 'J', 'Agra', 9007795410, 'jkl@gmail.com', '1999-10-10', '2016-07-02', '2020-03-10', 'CSE', 'Btech', 'BCS3A', 'Active', '672382048922')

/* (1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)*/



--Q6. Alter the Student table to add a new column named studenttype CHAR(1). It should be Not NULL and default value is ‘R’. Possible values are ‘R’ , ‘P’ and ‘C’.

ALTER TABLE dbo.STUDENTS
ADD StudentType CHAR(1) NOT NULL DEFAULT('R');

/*Commands completed successfully.*/

--Q7. Create a Check constraint on studenttype column in Student Table to restrict the values only to ‘R’ , ‘P’ and ‘C’. 

ALTER TABLE dbo.STUDENTS
ADD CONSTRAINT CHK_StudentType_Student
CHECK(StudentType='R' OR StudentType='P' OR StudentType= 'C');

/* Commands completed successfully.*/

EXECUTE sp_help 'dbo.STUDENTS'