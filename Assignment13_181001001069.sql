--Question 1.  Write a stored procedure named usp_getData to retrieve all the records from the four tables: Student, StudentBkup, ExamMarks, ExamMarksNew. Execute the procedure.


IF OBJECT_ID('usp_getData' ,'P') IS NOT NULL
    DROP PROCEDURE dbo.usp_getData
GO

CREATE PROCEDURE dbo.usp_getData 
AS
BEGIN
select top 10 * from dbo.STUDENTS
select top 10* from dbo.StudentBkup
select top 10 * from dbo.ExamMarks
select top 10 * from dbo.ExamMarksNew

RETURN 1
END

DECLARE 
    @ret INT 
    EXECUTE @ret = dbo.usp_getData

/*Commands completed successfully.
Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1020	Sulagna	Kolkata	9007795411	abc@gmail.com	1999-01-01	2022-08-02	2018-03-10	101	202	303	404	672382048913
1021	B	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	404	672382228914
1022	C	Kolkata	9007795412	cde@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	404	672382228914
1023	D	Goa	9007795414	def@gmail.com	1994-04-04	2012-06-02	2016-03-10	104	204	304	401	672392048915
1024	E	Chennai	9007795415	efg@gmail.com	1999-05-05	2017-07-02	2021-03-10	101	202	303	403	672382088916
1025	F	Mumbai	9007795416	fgh@gmail.com	1997-06-06	2016-08-02	2020-03-10	102	201	303	402	772382048917
1026	G	Panji	9007795417	ghi@gmail.com	1995-07-07	2014-08-02	2018-03-10	103	203	303	404	672352048918
1027	H	Assam	9007795418	hij@gmail.com	1996-08-08	2015-06-02	2019-03-10	102	202	302	402	772382048919
1028	I	Assam	9007795418	ijk@gmail.com	1996-08-08	2015-06-02	2019-03-10	102	202	302	402	772382048919
1029	J	Agra	9007795410	jkl@gmail.com	1999-10-10	2016-07-02	2020-03-10	104	204	301	404	672382048922

StudentBkupId	Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1	1027	Sushama	Assam	9007795418	hij@gmail.com	1996-08-08	2015-06-02	2019-03-10	102	202	302	402	772382048919
2	1021	Sushama	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914
3	1024	E	Chennai	9007795415	efg@gmail.com	1999-05-05	2017-07-02	2021-03-10	101	202	303	403	672382088916

Marks
99
ExamMarksId	ExamId	StudentId	Marks
1	2	1020	105
2	3	1021	96
4	5	1023	98
5	6	1024	99
6	2	1020	105
7	3	1021	96
9	5	1023	98
10	6	1024	99

ExamMarksNewId
1
ExamMarksNewId	ExamMarksId	ExamId	StudentId	Marks
1	0	1	1030	100
2	4	5	1023	80
3	9	5	1023	80
4	14	5	1023	80
5	19	5	1023	80
6	24	5	1023	80
7	29	5	1023	80
8	34	5	1023	80
9	39	5	1023	80
10	44	5	1023	80

*/

--2.Write a stored procedure named usp_setData to update and delete records from Student table. There will be insert and update of records
   --in ExamMarks as well.  Execute the procedure.

  IF OBJECT_ID('usp_setData','P') IS NOT NULL
   DROP PROCEDURE dbo.usp_setData
GO
 CREATE PROCEDURE dbo.usp_setData
 AS
 BEGIN
  UPDATE dbo.STUDENTS
  set
  StName='Sushama'
  where Student_ID=1021

 DELETE from dbo.ExamMarks
where StudentId=1022

delete from dbo.STUDENTS
where Student_ID=1022


insert into dbo.ExamMarks(ExamId,StudentId,Marks)
 values(1,1033,100)

UPDATE dbo.ExamMarks
set Marks=80
where StudentId=1023

RETURN 1
END

DECLARE @ret INT
EXECUTE @ret = dbo.usp_setData 

/*Commands completed successfully.

Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1021	Sushama	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914

Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
*/



--3.Execute the procedure named usp_getData again and save the output.

DECLARE @ret2 INT
EXECUTE @ret2 = dbo.usp_getData 
/*
Student_ID
1020
Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1020	Sulagna	Kolkata	9007795411	abc@gmail.com	1999-01-01	2022-08-02	2018-03-10	101	202	303	404	672382048913
1021	Sushama	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914
1023	D	Goa	9007795414	def@gmail.com	1994-04-04	2012-06-02	2016-03-10	104	204	304	401	672392048915
1024	E	Chennai	9007795415	efg@gmail.com	1999-05-05	2017-07-02	2021-03-10	101	202	303	404	672382088916
1025	F	Mumbai	9007795416	fgh@gmail.com	1997-06-06	2016-08-02	2020-03-10	102	201	303	402	772382048917
1026	G	Panji	9007795417	ghi@gmail.com	1995-07-07	2014-08-02	2018-03-10	103	203	303	404	672352048918
1027	Sushama	Assam	9007795418	hij@gmail.com	1996-08-08	2015-06-02	2019-03-10	102	202	302	402	772382048919
1029	J	Agra	9007795410	jkl@gmail.com	1999-10-10	2016-07-02	2020-03-10	104	204	301	404	672382048922

StudentBkupId	Student_ID	StName	StAddress	Phone	Email	DateOfBirth	DateOfAdmission	DateOfPassing	DeptId	CourseId	BatchId	StatusId	AadharID
1	1027	Sushama	Assam	9007795418	hij@gmail.com	1996-08-08	2015-06-02	2019-03-10	102	202	302	402	772382048919
2	1021	Sushama	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914
3	1021	Sushama	Kolkata	9007795412	bcd@gmail.com	1999-02-02	2022-06-02	2019-03-10	102	201	304	403	672382228914

ExamMarksId	ExamId	StudentId	Marks
1	2	1020	105
2	3	1021	96
4	5	1023	98
5	6	1024	99
6	2	1020	105
7	3	1021	96
9	5	1023	98
10	6	1024	99

ExamMarksNewId	ExamMarksId	ExamId	StudentId	Marks
1	0	1	1030	100
2	4	5	1023	80
3	9	5	1023	80
4	14	5	1023	80
5	19	5	1023	80
6	24	5	1023	80
7	29	5	1023	80
8	34	5	1023	80
*/

/*
4.	Create a function to retrieve the student details of CSE department in BTech course and BCS3 batch who has obtained more than 50 marks
in the DBMS exam held between August 2020 and December 2020.
*/

UPDATE dbo.Exam
set ExamDate = '2020-10-1'
where ExamId=2
/*
(1 row affected)
*/
UPDATE dbo.Exam
set ExamDate = '2020-08-1'
where ExamId=3
/*
(1 row affected)
*/

DELETE from dbo.ExamMarks
where ExamMarksId>10
/*(20971510 rows affected)*/

IF OBJECT_ID('func1' ,'IF') IS NOT NULL
	DROP FUNCTION func1
GO

CREATE FUNCTION dbo.func1 (@cnt INT)
RETURNS TABLE
AS
RETURN
SELECT st.Student_ID,st.StName, DeptName, CourseName, Marks  
			from dbo.STUDENTS AS st
			JOIN ExamMarks em ON em.StudentId = st.Student_ID
			JOIN Exam e ON e.ExamId = em.ExamId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
			JOIN CourSub cs ON e.CourSubId = cs.CourSubId
			JOIN SSubject sub ON cs.SubjectId = sub.SubjectId
		WHERE sub.SubjectName = 'DBMS' AND c.CourseName = 'BCS3A'  AND dp.DeptName='CSE' OR em.Marks>=50 AND e.ExamDate>='2020-08-01' AND e.ExamDate<='2020-10-1'
GO

--Commands completed successfully.

--5.Execute the function to retrieve the student details.

SELECT Student_Id,StName, DeptName, CourseName, Marks FROM dbo.func1(1)

/*
Student_Id	StName	DeptName	CourseName	Marks
*/

--6.Create a function to find the total number of passed out students for a particular department and course. Take department and course as input parameters. 

SELECT * FROM dbo.STUDENTS

UPDATE dbo.STUDENTS
set StatusId=403
where Student_ID=1020

IF OBJECT_ID('func2' ,'FN') IS NOT NULL
	DROP FUNCTION func2
GO

CREATE FUNCTION dbo.func2 (@course VARCHAR(10), @dept VARCHAR(10))
RETURNS INT
AS
BEGIN
	
	DECLARE @count INT
	
	SELECT @count = COUNT(Student_ID) from dbo.STUDENTS AS st
			JOIN StudentStatus ss ON ss.StatusId=st.StatusId
			JOIN Course c ON c.CourseId = st.CourseId
			JOIN Department dp ON dp.DeptId = c.DeptId
		WHERE c.CourseName = @course AND dp.DeptName=@dept AND ss.StatusDesc='Left'

	RETURN @count
END
GO

--Commands completed successfully.

--7.	Execute the function from a SELECT statement.


DECLARE @ret INT
EXECUTE @ret = dbo.func2 'BCS3B','CSE' 
SELECT @ret

SELECT dbo.func2('BCS3A','CSE')

/*
(No column name)
0
(No column name)
0
*/
