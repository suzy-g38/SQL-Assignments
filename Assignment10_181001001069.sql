/*1.Increase passmarks value by 10 in Exam table for the Subject DBMS. Then, increase the marks value by 10 in ExamMarks table for the Subject DBMS 
for all the students whose status is active. Both these statements should be written within a transaction. */

BEGIN TRY

BEGIN TRANSACTION;

UPDATE dbo.Exam 
SET 
Passmarks = Passmarks + 10 
FROM 
dbo.Exam AS E
JOIN 
dbo.CourSub AS CS
ON E.CourSubId=CS.CourSubId
JOIN
dbo.SSubject as sub ON CS.SubjectId = sub.SubjectId
WHERE 
sub.SubjectName='DBMS';

UPDATE dbo.ExamMarks 
SET 
Marks = Marks + 10 
FROM 
dbo.ExamMarks AS EM
JOIN dbo.STUDENTS AS St ON EM.StudentId=St.Student_ID
JOIN dbo.Exam AS E ON E.ExamId = EM.ExamId
JOIN dbo.CourSub AS CS ON E.CourSubId = CS.CourSubId
JOIN SSubject AS sub ON cs.SubjectId=sub.SubjectId
JOIN StudentStatus AS Sta ON Sta.StatusId = St.StatusId
WHERE sub.Subjectname = 'DBMS'
AND Sta.StatusDesc= 'Active';

COMMIT TRANSACTION;
END TRY

BEGIN CATCH
    SELECT 'Rollback'
    ROLLBACK TRANSACTION;
END CATCH

/*
(1 row affected)

(1 row affected)

*/

--2.Select the relevant records from both the tables before and after the transaction.

--Before Transaction

SELECT ExamId, CourSubId, PassMarks FROM Exam

/*
ExamId	CourSubId	PassMarks
2	1	60
3	2	50
4	3	50
5	4	50
6	5	50

*/

SELECT ExamMarksId, ExamId, StudentId, Marks FROM ExamMarks

/*
ExamMarksId	ExamId	StudentId	Marks
1	2	1020	100
2	3	1021	91
3	4	1022	92
4	5	1023	93
5	6	1024	94
*/

--After Transaction

SELECT ExamId, CourSubId, PassMarks FROM Exam

/*
ExamId	CourSubId	PassMarks
2	1	60
3	2	50
4	3	50
5	4	50
6	5	50
*/

SELECT ExamMarksId, ExamId, StudentId, Marks FROM ExamMarks

/*
ExamMarksId	ExamId	StudentId	Marks
1	2	1020	100
2	3	1021	91
3	4	1022	92
4	5	1023	93
5	6	1024	94
*/

--3.Open two new scripts and connect. Then, set the isolation level as Read Committed in both the sessions.

--Session1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

--Session2
SET TRANSACTION ISOLATION LEVEL READ COMMITTED
GO

--4.Insert around 80 lacs records ExamMarks table

Insert Into dbo.ExamMarks(ExamId, StudentId, Marks)
SELECT ExamId, StudentId, Marks FROM ExamMarks

/*
(10485760 rows affected)
*/

--5.In the first session write a transaction (within a try…catch block) to select the name of the student with studentid = 5,then update marks value in ExamMarks table for all the records and then again, the select statement to retrieve the name of the student with studentid = 5.

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

/*
StName
A
*/

--6.In the second session, write a transaction (within a try…catch block) to update the name of the student with studentid = 5. 

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


/*

(1 row affected)

*/

--7.Execute the first script and immediately execute the second script. Record the output.

--Session 1

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

--Session 2 

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

--Before Transaction
/*
StName
A
*/

--After Transaction
/* 
StName
Sulagna
*/
