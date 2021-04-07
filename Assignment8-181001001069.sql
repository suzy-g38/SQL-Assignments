--Question 1 Drop and create Student and Department tables again.

DROP view dbo.vStudentDept

DROP TABLE dbo.Department
DROP TABLE dbo.STUDENTS

/* Commands completed successfully. */

CREATE TABLE dbo.STUDENTS(
Student_ID int NOT NULL, 
StName varchar(100),
StAddress varchar(200),
Phone numeric(10,0),
Email varchar(50),
DateOfBirth date,
DateOfAdmission date,
DateOfPassing date,
DeptId int,
CourseId int,
BatchId int,
StatusId int,
AadharID NUMERIC(16,0) NOT NULL,
)

/* Commands completed successfully. */

CREATE TABLE Department(
DeptId INT Not Null,
DeptName VARCHAR(50)
)

/* Commands completed successfully. */

--Question 2 Create Primary key on deptid column of Department and studentid column of Student table respectively.

Alter table dbo.STUDENTS
add CONSTRAINT PK_Student_Student_ID PRIMARY KEY CLUSTERED(Student_ID)

/* Commands completed successfully. */


Alter table dbo.Department
add CONSTRAINT PK_Department_DeptId PRIMARY KEY CLUSTERED(DeptId)

/* Commands completed successfully. */


--Question 3 Create the following tables with PK on the identity columns:
--a. Faculty : facultyId INT IDENTITY, facultyname, deptid

CREATE TABLE Faculty
(
FacultyId INT IDENTITY(1,1) NOT NULL,
CONSTRAINT PK_Faculty_FacultyId PRIMARY KEY CLUSTERED(FacultyId),
FacultyName VARCHAR(50),
DeptId INT
)

/* Commands completed successfully. */

--b. Subject: subjectId INT IDENTITY, subjectname, facultyid1, facultyid2

CREATE TABLE SSubject
(
SubjectId INT IDENTITY(1,1) NOT NULL,
CONSTRAINT PK_SSubject_SubjectId PRIMARY KEY CLUSTERED(SubjectId),
SubjectName VARCHAR(50),
FacultyId1 INT,
FacultyId2 INT,
)

/* Commands completed successfully. */

--c. CourSub: courSubId INT IDENTITY, courseId INT, subjectId INT

CREATE TABLE CourSub
(
CourSubId INT IDENTITY(1,1) NOT NULL,
CONSTRAINT PK_CourSub_CourSubId PRIMARY KEY CLUSTERED(CourSubId),
CourseId INT,
SubjectId INT,
)

/* Commands completed successfully. */

--d. Exam: examId INT IDENTITY, courSubId, date, batchId, totalmarks, passmarks

CREATE TABLE Exam
(
ExamId INT IDENTITY(1,1) NOT NULL,
CONSTRAINT PK_Exam_ExamId PRIMARY KEY CLUSTERED(ExamId),
CourSubId INT,
ExamDate date,
BatchId INT,
TotalMarks INT,
PassMarks INT
)

/* Commands completed successfully. */

--e. ExamMarks: exammarksId INT IDENTITY, examId, studentId, marks

CREATE TABLE ExamMarks
(
ExamMarksId INT IDENTITY(1,1) NOT NULL,
CONSTRAINT PK_ExamMarks_ExamMarksId PRIMARY KEY CLUSTERED(ExamMarksId),
ExamId INT,
StudentId INT,
Marks INT,
)

/* Commands completed successfully. */

--Question 4 Add a new column deptId for Course table.

Alter table dbo.Course
Add DeptId INT

/* Commands completed successfully. */

--Question 5 Create the following relationships
--a. Course to Department

Alter Table dbo.Course
add constraint FK_Course_DeptId Foreign Key(DeptId)
references dbo.Department(DeptId)

/* Commands completed successfully. */

--b. Student to Department, Course, Batch, StudentStatus

Alter Table dbo.Student
add constraint FK_Student_DeptId Foreign Key(DeptId)
references dbo.Department(DeptId)

/* Commands completed successfully. */

Alter Table dbo.Student
add constraint FK_Student_CourseId Foreign Key(CourseId)
references dbo.Course(CourseId)

/* Commands completed successfully. */

Alter Table dbo.Student
add constraint FK_Student_BatchId Foreign Key(BatchId)
references dbo.Batch(BatchId)

/* Commands completed successfully. */

Alter Table dbo.Student
add constraint FK_Student_StatusId Foreign Key(StatusId)
references dbo.StudentStatus(StatusId)

/* Commands completed successfully. */

--c. Faculty to Department

Alter Table dbo.Faculty
add constraint FK_Faculty_DeptId Foreign Key(DeptId)
references dbo.Department(DeptId)

/* Commands completed successfully. */

--d. Subject to Faculty

Alter Table dbo.SSubject
add constraint FK_SSubject_FacultyId1 Foreign Key(FacultyId1)
references dbo.Faculty(FacultyId)

/* Commands completed successfully. */

Alter Table dbo.SSubject
add constraint FK_SSubject_FacultyId2 Foreign Key(FacultyId2)
references dbo.Faculty(FacultyId)

/* Commands completed successfully. */

--e. CourSub to Course, Subject

Alter Table dbo.CourSub
add constraint FK_CourSub_CourseId Foreign Key(CourseId)
references dbo.Course(CourseId)

/* Commands completed successfully. */

Alter Table dbo.CourSub
add constraint FK_CourSub_SubjectId Foreign Key(SubjectId)
references dbo.SSubject(SubjectId)

/* Commands completed successfully. */

--f. Exam to CourSub, batch

Alter Table dbo.Exam
add constraint FK_Exam_CourSubId Foreign Key(CourSubId)
references dbo.CourSub(CourSubId)

/* Commands completed successfully. */

Alter Table dbo.Exam
add constraint FK_Exam_BatchId Foreign Key(BatchId)
references dbo.Batch(BatchId)

/* Commands completed successfully. */

--g. ExamMarks to Exam, Student

Alter Table dbo.ExamMarks
add constraint FK_ExamMarks_ExamId Foreign Key(ExamId)
references dbo.Exam(ExamId)

/* Commands completed successfully. */

Alter Table dbo.ExamMarks
add constraint FK_ExamMarks_StudentId Foreign Key(StudentId)
references dbo.Student(Student_ID)

/* Commands completed successfully. */


