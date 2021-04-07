--1.Truncate data from all the five tables: Student, Department, Course, Batch, StudentStatus.

TRUNCATE TABLE dbo.Batch
TRUNCATE TABLE dbo.Course
TRUNCATE TABLE dbo.DEPARTMENT
TRUNCATE TABLE dbo.STUDENTS
TRUNCATE TABLE dbo.StudentStatus

/*Commands completed successfully.*/

--2.	Create foreign key constraints on the following columns of Student table:

   --a.DeptId -- references to DeptId of Department with ON DELETE CASCADE option
   --b.CourseId -- references to CourseId of Course with ON UPDATE SET NULL option
   --c.BatchId -- references to BatchId of Batch
   --d.StatusId -- references to StatusId of Status

ALTER TABLE dbo.STUDENTS
ADD CONSTRAINT FK_DeptID
FOREIGN KEY(DeptID) REFERENCES Department(DeptID) ON DELETE CASCADE;

--Commands completed successfully.

ALTER TABLE dbo.STUDENTS
ADD CONSTRAINT FK_CourseID
FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON UPDATE SET NULL;

--Commands completed successfully.


ALTER TABLE dbo.STUDENTS
ADD CONSTRAINT FK_BatchID
FOREIGN KEY (BatchID) REFERENCES Batch(BatchID);

--Commands completed successfully.

ALTER TABLE dbo.STUDENTS
ADD CONSTRAINT FK_StatusID
FOREIGN KEY (StatusID) REFERENCES StudentStatus(StatusID) ;

--Commands completed successfully.


--3. Insert 4 records in each of the four tables.
--a. DeptId values: 101,102,103,104

INSERT INTO Department VALUES (101, 'CSE')
INSERT INTO Department VALUES (102, 'BCA')
INSERT INTO Department VALUES (103, 'ECE')
INSERT INTO Department VALUES (104, 'IT')

/*1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)
*/

--b.    CourseId values: 201,202,203,204

INSERT INTO Course VALUES (201, 'DBMS')
INSERT INTO Course VALUES (202, 'OS')
INSERT INTO Course VALUES (203, 'CG')
INSERT INTO Course VALUES (204, 'CD')

/*1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)
*/



--c.    BatchId values: 301,302,303,304

INSERT INTO Batch VALUES (301, 'BCS3A')
INSERT INTO Batch VALUES (302, 'BCS3B')
INSERT INTO Batch VALUES (303, 'BCS3C')
INSERT INTO Batch VALUES (304, 'BCS3D')

/*1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)
*/

--d.    StatusId values: 401,402,403,404

INSERT INTO StudentStatus VALUES (401, 'ACTIVE')
INSERT INTO StudentStatus VALUES (402, 'COMPLETED')
INSERT INTO StudentStatus VALUES (403, 'LEFT')
INSERT INTO StudentStatus VALUES (404, 'ACTIVE')

/*1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)
*/

--Q4. Insert 10 records in Student table.

INSERT INTO dbo.STUDENTS VALUES(1020, 'A', 'Kolkata', 9007795411, 'abc@gmail.com', '1999-01-01', '2022-08-02', '2018-03-10', '101', '202', '303', '404', '672382048913')
INSERT INTO dbo.STUDENTS VALUES(1021, 'B', 'Kolkata', 9007795412, 'bcd@gmail.com', '1999-02-02', '2022-06-02', '2019-03-10', '102', '201', '304', '403',   '672382228914')
INSERT INTO dbo.STUDENTS VALUES(1022, 'C', 'Delhi', 9007795413, 'cde@gmail.com', '1994-03-03', '2013-07-02', '2017-03-10', '103', '203', '302', '403','672392048745')
INSERT INTO dbo.STUDENTS VALUES(1023, 'D', 'Goa', 9007795414, 'def@gmail.com', '1994-04-04', '2012-06-02', '2016-03-10', '104', '204', '304', '401', '672392048915')
INSERT INTO dbo.STUDENTS VALUES(1024, 'E', 'Chennai', 9007795415, 'efg@gmail.com', '1999-05-05', '2017-07-02', '2021-03-10', '101', '202', '303', '404', '672382088916')
INSERT INTO dbo.STUDENTS VALUES(1025, 'F', 'Mumbai', 9007795416, 'fgh@gmail.com', '1997-06-06', '2016-08-02', '2020-03-10', '102', '201', '303', '402', '772382048917')
INSERT INTO dbo.STUDENTS VALUES(1026, 'G', 'Panji', 9007795417, 'ghi@gmail.com', '1995-07-07', '2014-08-02', '2018-03-10', '103', '203', '303', '404', '672352048918')
INSERT INTO dbo.STUDENTS VALUES(1027, 'H', 'Assam', 9007795418, 'hij@gmail.com', '1996-08-08', '2015-06-02', '2019-03-10', '102', '202', '302', '402', '772382048919')
INSERT INTO dbo.STUDENTS VALUES(1028, 'I', 'Kolapur', 9007795419, 'ijk@gmail.com', '1999-09-09', '2016-05-02', '2020-03-10', '104', '201', '303', '401', '772381048921')
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


--Q5. Select records from Department and Student where DeptId = 101

Select Student_ID, StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
From dbo.STUDENTS Where DeptID=101
Select DeptID,DeptName 
From dbo.Department where DeptID=101

/*Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1020	A	Kolkata	9007795411	abc@gmail.com	1999-01-01	2022-08-02	2018-03-10	101	202	303	404	672382048913
1024	E	Chennai	9007795415	efg@gmail.com	1999-05-05	2017-07-02	2021-03-10	101	202	303	404	672382088916

DeptID	DeptName
101	CSE
*/

--Q6. Delete records from Department where DeptId = 101 and execute Select from Q.5

DELETE from dbo.Department where DeptID= 101

--1 row affected

Select Student_ID, StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
From dbo.STUDENTS Where DeptID=101
Select DeptID,DeptName 
From dbo.Department where DeptID=101

/* Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID */
/*DeptID DeptName*/

--Q7. Select records from Course and Student where CourseId = 201

Select Student_ID, StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
From dbo.STUDENTS Where CourseID=201
Select CourseID,CourseName 
From dbo.Course where CourseID=201

/*Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1021	B	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914
1025	F	Mumbai	9007795416	fgh@gmail.com	1997-06-06	2016-08-02	2020-03-10	102	201	303	402	772382048917
1028	I	Kolapur	9007795419	ijk@gmail.com	1999-09-09	2016-05-02	2020-03-10	104	201	303	401	772381048921

CourseID	CourseName
201	DBMS
*/

--Q8. Update CourseId from 201 to 210 in Course table and execute Select from Q.7

UPDATE dbo.COURSE
SET CourseId = 210
WHERE CourseId = 201

--1 row affected

Select Student_ID, StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
From dbo.STUDENTS Where CourseID=201
Select CourseID,CourseName 
From dbo.Course where CourseID=201

/* Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID */


--Q9.  Select records from Batch and Student where BatchId = 301

SELECT Student_ID,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
FROM dbo.STUDENTS
WHERE BatchId = 301
SELECT BatchId,BatchName FROM dbo.Batch
WHERE BatchId = 301

/*Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1029	J	Agra	9007795410	jkl@gmail.com	1999-10-10	2016-07-02	2020-03-10	104	204	301	404	672382048922

BatchId	BatchName
301	BCS3A
*/

--Q10. Delete records from Batch where BatchId = 301 and execute Select from Q.9

DELETE FROM dbo.Batch
WHERE BatchId=301

/*Msg 547, Level 16, State 0, Line 189
The DELETE statement conflicted with the REFERENCE constraint "FK_BatchID". The conflict occurred in database "master", table "dbo.STUDENTS", column 'BatchId'.
The statement has been terminated.

Completion time: 2020-10-01T14:33:30.2999343+05:30*/


SELECT Student_ID,StName,StAddress,Phone,Email,DateOfBirth,DateOfAdmission,DateOfPassing,DeptId,CourseId,BatchId,StatusId,AadharID
FROM dbo.STUDENTS
WHERE BatchId = 301
SELECT BatchId,BatchName FROM dbo.Batch
WHERE BatchId = 301
/*Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1029	J	Agra	9007795410	jkl@gmail.com	1999-10-10	2016-07-02	2020-03-10	104	204	301	404	672382048922

BatchId	BatchName
301	BCS3A
*/
