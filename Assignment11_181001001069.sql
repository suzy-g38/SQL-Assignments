--1.Open two new scripts and connect. Then, set the isolation level as Repeatable Read in both the sessions.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ 
GO

--Commands completed successfully.

--2.Repeat steps 5,6 and 7 from Assignment 10 and save the output.

/*5.In the first session write a transaction (within a try…catch block) to select the name of the student with studentid = 5,then update marks value in ExamMarks table for
all the records and then again, the select statement to retrieve the name of the student with studentid = 5.
*/
BEGIN TRY
BEGIN TRANSACTION;
Select StName from STUDENTS where Student_ID=1020
Update
ExamMarks set Marks= Marks + 1
Select StName from STUDENTS where Student_ID=1020
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    SELECT 'Rollback'
    ROLLBACK TRANSACTION;
END CATCH

/*Step 6 In the second session, write a transaction (within a tryůcatch block) to update the name of the student with studentid = 5.*/
BEGIN TRY
BEGIN TRANSACTION;
Update 
dbo.STUDENTS set StName= 'Sulagna' where Student_ID=1020
COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    SELECT 'Rollback'
    ROLLBACK TRANSACTION;
END CATCH

/*Step 7 Execute the first script and immediately execute the second script. Record the output.*/

/*
--Before Transaction

StName
Sulagna

--After Transaction
StName
Sulagna
*/

/*3.Create a stored procedure named usp_getStudentData. It should have an input parameter for deptName and output parameter as student count. The ouput
parameter should be populated with the number of students in the department as sent as the deptname parameter. Also, retrieve the details of the 
faculties of CSE department who teaches DBMS.*/

IF OBJECT_ID('usp_getStudentData' , 'P') IS NOT NULL
DROP PROCEDURE usp_getStudentData
GO  
CREATE PROCEDURE usp_getStudentData @deptName varchar(50),@studentCount INT OUTPUT
AS  
BEGIN
SELECT @studentCount = COUNT(Student_ID) from dbo.STUDENTS as S JOIN dbo.Department as D
on D.DeptId = S.DeptId Where d.deptName= @deptName
SELECT f.FacultyId,f.FacultyName
From dbo.Faculty f
JOIN dbo.SSubject sub ON f.FacultyId = sub.FacultyId1 OR f.FacultyId = sub.FacultyId2
JOIN dbo.Department d ON d.DeptId = f.DeptId
WHERE d.DeptName = 'CSE' AND sub.SubjectName = 'DBMS';
RETURN 1
END

--Commands completed successfully.

--4.Execute the stored procedure and print the output parameter and return value after execution

DECLARE @dept VARCHAR(20) = 'CSE'
DECLARE @count INT
DECLARE @ret INT

EXECUTE @ret = dbo.usp_getStudentData @dept , @count OUTPUT

SELECT 'Return Value', @ret
SELECT 'Count of Student' + @dept,@count

/*
FacultyId	FacultyName
1	         AAA

(No column name)  (No column name)
Return Value       1

(No column name)	(No column name)
Count of StudentCSE	 2

*/





