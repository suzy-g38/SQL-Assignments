--Question 1 Create a table named StudentBkup having the same structure as Student. One identity primary key column to be added as studentBkupId. No other constraint needs to be created.

CREATE TABLE dbo.StudentBkup(
StudentBkupId INT NOT NULL IDENTITY(1,1),
Student_ID INT NOT NULL, 
StName VARCHAR(100),
StAddress VARCHAR(200),
Phone NUMERIC(10,0),
Email VARCHAR(50),
DateOfBirth DATE,
DateOfAdmission DATE,
DateOfPassing DATE,
DeptId INT,
CourseId INT,
BatchId INT,
StatusId INT,
AadharID NUMERIC(16,0) NOT NULL,
CONSTRAINT PK_StudentBkup_StudentBkupId PRIMARY KEY CLUSTERED (StudentBkupId)
)

/* Commands completed successfully. */


--Question 2 Create a table named ExamMarksNew having the same structure as ExamMarks. One identity primary key column to be added as examMarksNewId. No other constraint needs to be created.

CREATE TABLE dbo.ExamMarksNew
(
ExamMarksNewId INT IDENTITY(1,1) NOT NULL,
ExamMarksId INT,
ExamId INT,
StudentId INT,
Marks INT,
CONSTRAINT PK_ExamMarksNew_ExamMarksNewId PRIMARY KEY CLUSTERED(ExamMarksNewId)
) 

/* Commands completed successfully. */

/*Question 3 Create a DML after trigger to insert the deleted/modified data from Student table to StudentBkup table every time a delete or 
  update happens on the table.*/ 

  IF OBJECT_ID('trigger1' ,'TR') IS NOT NULL
	DROP TRIGGER trigger1
GO

CREATE TRIGGER trigger1
ON dbo.STUDENTS 
AFTER INSERT, UPDATE, DELETE   
AS 
BEGIN
	INSERT INTO dbo.StudentBkup
	SELECT * FROM inserted
	SELECT * FROM deleted
END
GO  

--Commands completed successfully.


/*Question  4 Create a DML instead of trigger to insert the data to be modified/added in ExamMarks table to ExamMarksNew table every time a 
update/insert happens on the table. There will be no change to the original table data. */ 


 IF OBJECT_ID('trigger2' ,'TR') IS NOT NULL
	DROP TRIGGER trigger2
GO

CREATE TRIGGER trigger2
ON dbo.ExamMarks
INSTEAD OF INSERT, UPDATE  
AS 
BEGIN
	INSERT INTO dbo.ExamMarksNew
	SELECT * FROM inserted
	
END
GO 

--Commands completed successfully.

sp_help 'ExamMarksNew'
sp_help 'StudentBkup'































