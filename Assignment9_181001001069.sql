--Q1.Execute sp_helpconstraint on all the 10 tables and retrieve the foreign key details.

EXECUTE sp_helpconstraint STUDENTS;

/*
Object Name
STUDENTS
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Student_BatchId	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 	REFERENCES University.dbo.Batch (BatchId)
FOREIGN KEY	FK_Student_CourseId	No Action	No Action	Enabled	Is_For_Replication	CourseId
 	 	 	 	 	 	REFERENCES University.dbo.Course (CourseId)
FOREIGN KEY	FK_Student_DeptId	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES University.dbo.Department (DeptId)
FOREIGN KEY	FK_StatusID	No Action	No Action	Enabled	Is_For_Replication	StatusId
 	 	 	 	 	 	REFERENCES University.dbo.StudentStatus (StatusId)
PRIMARY KEY (clustered)	PK_Student_Student_ID	(n/a)	(n/a)	(n/a)	(n/a)	Student_ID
-----------------------------------

Table is referenced by foreign key
University.dbo.ExamMarks: FK_ExamMarks_StudentId
*/

EXECUTE sp_helpconstraint Department;

/*
Object Name
Department
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_Department_DeptId	(n/a)	(n/a)	(n/a)	(n/a)	DeptId
-----------------------------------

Table is referenced by foreign key
University.dbo.Course: FK_Course_DeptId
University.dbo.Faculty: FK_Faculty_DeptId
University.dbo.STUDENTS: FK_Student_DeptId

*/


EXECUTE sp_helpconstraint Course;

/*
Object Name
Course
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Course_DeptId	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES University.dbo.Department (DeptId)
PRIMARY KEY (clustered)	PK_Course_CourseId	(n/a)	(n/a)	(n/a)	(n/a)	CourseId
-----------------------------------

Table is referenced by foreign key
University.dbo.CourSub: FK_CourSub_CourseId
University.dbo.STUDENTS: FK_Student_CourseId
*/


EXECUTE sp_helpconstraint Batch;

/*
Object Name
Batch
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_Batch_BatchId	(n/a)	(n/a)	(n/a)	(n/a)	BatchId
-----------------------------------

Table is referenced by foreign key
University.dbo.Exam: FK_Exam_BatchId
University.dbo.STUDENTS: FK_Student_BatchId
*/


EXECUTE sp_helpconstraint StudentStatus;


/*
Object Name
StudentStatus
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
PRIMARY KEY (clustered)	PK_Status_StatusId	(n/a)	(n/a)	(n/a)	(n/a)	StatusId
-----------------------------------

Table is referenced by foreign key
University.dbo.STUDENTS: FK_StatusID
*/


EXECUTE sp_helpconstraint Faculty;

/*
Object Name
Faculty
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Faculty_DeptId	No Action	No Action	Enabled	Is_For_Replication	DeptId
 	 	 	 	 	 	REFERENCES University.dbo.Department (DeptId)
PRIMARY KEY (clustered)	PK_Faculty_FacultyId	(n/a)	(n/a)	(n/a)	(n/a)	FacultyId
-----------------------------------

Table is referenced by foreign key
University.dbo.SSubject: FK_SSubject_FacultyId1
University.dbo.SSubject: FK_SSubject_FacultyId2
*/


EXECUTE sp_helpconstraint SSubject;

/*
Object Name
SSubject
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_SSubject_FacultyId1	No Action	No Action	Enabled	Is_For_Replication	FacultyId1
 	 	 	 	 	 	REFERENCES University.dbo.Faculty (FacultyId)
FOREIGN KEY	FK_SSubject_FacultyId2	No Action	No Action	Enabled	Is_For_Replication	FacultyId2
 	 	 	 	 	 	REFERENCES University.dbo.Faculty (FacultyId)
PRIMARY KEY (clustered)	PK_SSubject_SubjectId	(n/a)	(n/a)	(n/a)	(n/a)	SubjectId
-----------------------------------

Table is referenced by foreign key
University.dbo.CourSub: FK_CourSub_SubjectId
*/

EXECUTE sp_helpconstraint CourSub;

/*
Object Name
CourSub
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_CourSub_CourseId	No Action	No Action	Enabled	Is_For_Replication	CourseId
 	 	 	 	 	 	REFERENCES University.dbo.Course (CourseId)
FOREIGN KEY	FK_CourSub_SubjectId	No Action	No Action	Enabled	Is_For_Replication	SubjectId
 	 	 	 	 	 	REFERENCES University.dbo.SSubject (SubjectId)
PRIMARY KEY (clustered)	PK_CourSub_CourSubId	(n/a)	(n/a)	(n/a)	(n/a)	CourSubId
-----------------------------------

Table is referenced by foreign key
University.dbo.Exam: FK_Exam_CourSubId
*/




EXECUTE sp_helpconstraint Exam;

/*
Object Name
Exam
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_Exam_BatchId	No Action	No Action	Enabled	Is_For_Replication	BatchId
 	 	 	 	 	 	REFERENCES University.dbo.Batch (BatchId)
FOREIGN KEY	FK_Exam_CourSubId	No Action	No Action	Enabled	Is_For_Replication	CourSubId
 	 	 	 	 	 	REFERENCES University.dbo.CourSub (CourSubId)
PRIMARY KEY (clustered)	PK_Exam_ExamId	(n/a)	(n/a)	(n/a)	(n/a)	ExamId
-----------------------------------

Table is referenced by foreign key
University.dbo.ExamMarks: FK_ExamMarks_ExamId
*/



EXECUTE sp_helpconstraint ExamMarks;

/*
Object Name
ExamMarks
-----------------------------------

constraint_type	constraint_name	delete_action	update_action	status_enabled	status_for_replication	constraint_keys
FOREIGN KEY	FK_ExamMarks_ExamId	No Action	No Action	Enabled	Is_For_Replication	ExamId
 	 	 	 	 	 	REFERENCES University.dbo.Exam (ExamId)
FOREIGN KEY	FK_ExamMarks_StudentId	No Action	No Action	Enabled	Is_For_Replication	StudentId
 	 	 	 	 	 	REFERENCES University.dbo.STUDENTS (Student_ID)
PRIMARY KEY (clustered)	PK_ExamMarks_ExamMarksId	(n/a)	(n/a)	(n/a)	(n/a)	ExamMarksId
*/



--Q2.Insert 5 records in each of the following tables: Student, Department, Course, Batch, Studentstatus, Faculty, Subject, CourSub , Exam, ExamMarks.

TRUNCATE TABLE dbo.STUDENTS

INSERT INTO dbo.STUDENTS VALUES(1020, 'A', 'Kolkata', 9007795411, 'abc@gmail.com', '1999-01-01', '2022-08-02', '2018-03-10', '101', '202', '303', '404', '672382048913')
INSERT INTO dbo.STUDENTS VALUES(1021, 'B', 'Kolkata', 9007795412, 'bcd@gmail.com', '1999-02-02', '2022-06-02', '2019-03-10', '102', '201', '304', '403',   '672382228914')
INSERT INTO dbo.STUDENTS VALUES(1022, 'C', 'Delhi', 9007795413, 'cde@gmail.com', '1994-03-03', '2013-07-02', '2017-03-10', '103', '203', '302', '403','672392048745')
INSERT INTO dbo.STUDENTS VALUES(1023, 'D', 'Goa', 9007795414, 'def@gmail.com', '1994-04-04', '2012-06-02', '2016-03-10', '104', '204', '304', '401', '672392048915')
INSERT INTO dbo.STUDENTS VALUES(1024, 'E', 'Chennai', 9007795415, 'efg@gmail.com', '1999-05-05', '2017-07-02', '2021-03-10', '101', '202', '303', '404', '672382088916')

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.STUDENTS
/*
Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1020	A	Kolkata	9007795411	abc@gmail.com	1999-01-01	2022-08-02	2018-03-10	101	202	303	404	672382048913
1021	B	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914
1022	C	Delhi	9007795413	cde@gmail.com	1994-03-03	2013-07-02	2017-03-10	103	203	302	403	672392048745
1023	D	Goa	9007795414	def@gmail.com	1994-04-04	2012-06-02	2016-03-10	104	204	304	401	672392048915
1024	E	Chennai	9007795415	efg@gmail.com	1999-05-05	2017-07-02	2021-03-10	101	202	303	404	672382088916

*/


INSERT INTO Department VALUES (101, 'CSE')
INSERT INTO Department VALUES (102, 'BCA')
INSERT INTO Department VALUES (103, 'ECE')
INSERT INTO Department VALUES (104, 'IT')
INSERT INTO Department VALUES (105, 'EE')

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/


select * from dbo.Department

/*
DeptId	DeptName
101	CSE
102	BCA
103	ECE
104	IT
105	EE
*/

INSERT INTO Batch VALUES (601, 'BCS3A')
INSERT INTO Batch VALUES (602, 'BCS3B')
INSERT INTO Batch VALUES (603, 'BCS3C')
INSERT INTO Batch VALUES (604, 'BCS3D')
INSERT INTO Batch VALUES (605, 'BCS3E')

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.Batch

/*
BatchId	BatchName
601	BCS3A
602	BCS3B
603	BCS3C
604	BCS3D
605	BCS3E
*/

INSERT INTO Course  VALUES (601, 'BCS3A',101)
INSERT INTO Course VALUES (602, 'BCS3B',102)
INSERT INTO Course VALUES (603, 'BCS3C',103)
INSERT INTO Course VALUES (604, 'BCS3D',104)
INSERT INTO Course VALUES (605, 'BCS3E',105)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.Course

/*
CourseId	CourseName	DeptId
601	BCS3A	101
602	BCS3B	102
603	BCS3C	103
604	BCS3D	104
605	BCS3E	105
*/

INSERT INTO StudentStatus VALUES (401, 'ACTIVE')
INSERT INTO StudentStatus VALUES (402, 'COMPLETED')
INSERT INTO StudentStatus VALUES (403, 'LEFT')
INSERT INTO StudentStatus VALUES (404, 'ACTIVE')

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.StudentStatus

/*
StatusId	StatusDesc
401	ACTIVE
402	COMPLETED
403	LEFT
404	ACTIVE
*/

INSERT INTO Faculty VALUES ('AAA',101)
INSERT INTO Faculty VALUES ('BBB',102)
INSERT INTO Faculty VALUES ('CCC',103)
INSERT INTO Faculty VALUES ('DDD',104)
INSERT INTO Faculty VALUES ('EEE',105)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.Faculty

/*
FacultyId	FacultyName	DeptId
1	AAA	101
2	BBB	102
3	CCC	103
4	DDD	104
5	EEE	105
*/

INSERT INTO SSubject VALUES ('DBMS',1,1)
INSERT INTO SSubject VALUES ('CG',2,2)
INSERT INTO SSubject VALUES ('CD',3,3)
INSERT INTO SSubject VALUES ('DS',4,4)
INSERT INTO SSubject VALUES ('CASD',5,5)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.SSubject

/*
SubjectId	SubjectName	FacultyId1	FacultyId2
1	DBMS	1	1
2	CG	2	2
3	CD	3	3
4	DS	4	4
5	CASD	5	5
*/

INSERT INTO CourSub VALUES (601,1)
INSERT INTO CourSub VALUES (602,2)
INSERT INTO CourSub VALUES (603,3)
INSERT INTO CourSub VALUES (604,4)
INSERT INTO CourSub VALUES (605,5)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/


select * from dbo.CourSub

/*
CourSubId	CourseId	SubjectId
1	601	1
2	602	2
3	603	3
4	604	4
5	605	5
*/

INSERT INTO Exam VALUES (1,'2020-12-1',601,100,50)
INSERT INTO Exam VALUES (2,'2020-12-2',602,100,50)
INSERT INTO Exam VALUES (3,'2020-12-3',603,100,50)
INSERT INTO Exam VALUES (4,'2020-12-4',604,100,50)
INSERT INTO Exam VALUES (5,'2020-12-5',605,100,50)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.Exam

/*
ExamId	CourSubId	ExamDate	BatchId	TotalMarks	PassMarks
2	1	2020-12-01	601	100	50
3	2	2020-12-02	602	100	50
4	3	2020-12-03	603	100	50
5	4	2020-12-04	604	100	50
6	5	2020-12-05	605	100	50
*/


INSERT INTO ExamMarks VALUES (2,1020,90)
INSERT INTO ExamMarks VALUES (3,1021,91)
INSERT INTO ExamMarks VALUES (4,1022,92)
INSERT INTO ExamMarks VALUES (5,1023,93)
INSERT INTO ExamMarks VALUES (6,1024,94)

/*

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

(1 row affected)

*/

select * from dbo.ExamMarks

/*
ExamMarksId	ExamId	StudentId	Marks
1	2	1020	90
2	3	1021	91
3	4	1022	92
4	5	1023	93
5	6	1024	94
*/
