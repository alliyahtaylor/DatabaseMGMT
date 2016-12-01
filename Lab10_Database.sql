/*Alliyah Taylor
Lab 10
11/28/2016*/

--find what courses are prereqs for a given course
	CREATE OR REPLACE FUNCTION prereqsfor(int, refcursor) RETURNS refcursor AS
	$$
	DECLARE
		course_num	int 		:=$1;
		resultset 	REFCURSOR 	:= $2;
	BEGIN
		open resultset for
			SELECT *
			FROM Courses
			WHERE num IN(
				SELECT p.preReqNum
				FROM Prerequisites p
				WHERE p.coursenum = course_num) ;
		return resultset;
		
	END;
	$$
	LANGUAGE plpgsql;

	--Test the stored proc
		SELECT PreReqsFor(499, 'results');
		Fetch all from results;

--Find what courses a given course is a direct prereq for
	CREATE OR REPLACE FUNCTION IsPreReqFor(int, refcursor) RETURNS refcursor AS
	$$
	DECLARE
		course_num	int 		:=$1;
		resultset 	REFCURSOR 	:= $2;
	BEGIN
		open resultset for
			SELECT *
			FROM Courses
			WHERE num IN(
				SELECT p.coursenum
				FROM Prerequisites p
				WHERE p.preReqNum = course_num) ;
		return resultset;
		
	END;
	$$
	LANGUAGE plpgsql;

	--Test the stored proc
		SELECT IsPreReqFor(120, 'results');
		Fetch all from results;
		
		