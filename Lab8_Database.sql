--Alliyah Taylor
--Lab 8
--11/9/2016
DROP TABLE IF EXISTS People;
DROP TABLE IF EXISTS Actors;
DROP TABLE IF EXISTS Directors;
DROP TABLE IF EXISTS Directed;
DROP TABLE IF EXISTS Acts_In;
DROP TABLE IF EXISTS Movies;

CREATE TABLE People(
       PID 				INT NOT NULL,
       First_Name 		TEXT NOT NULL,
	   Last_Name 		TEXT NOT NULL,
       AGE  			INT NOT NULL,
       ADDRESS 			TEXT ,       
       PRIMARY KEY (PID)
);
CREATE TABLE Actors(
		PID 			INT NOT NULL references People(PID),
		Birth_Date 		DATE,
		Hair_Color		TEXT,
		Height_Inches 	INT,
		Weight			INT,
		Favorite_Color	TEXT,
		SAG_Anniversary DATE,
		PRIMARY KEY (PID)
);
CREATE TABLE Directors(
		PID 			INT NOT NULL references People(PID),
		Film_School		TEXT,
		Lens_Maker		TEXT,
		DG_Anniversary 	DATE,
		PRIMARY KEY (PID)
);
CREATE TABLE Movies(
		MPAA_Num 			INT NOT NULL,
		Name				TEXT NOT NULL,
		Year_Released		DATE NOT NULL,
		Domestic_BO_Sales	INT,
		Foreign_BO_Sales 	INT,
		DVD_BluRay_Sales 	INT,
		PRIMARY KEY (MPAA_Num)
);
CREATE TABLE Acts_In(
		PID 			INT NOT NULL references Actors(PID),
		MPAA_Num		INT NOT NULL references Movies(MPAA_Num),
		PRIMARY KEY (PID, MPAA_Num)
);
CREATE TABLE Directed(
		PID 			INT NOT NULL references Directors(PID),
		MPAA_Num		INT NOT NULL references Movies(MPAA_Num),
		PRIMARY KEY (PID, MPAA_Num)
);

--Welcome to the ugliest query ever, of all time. 
SELECT 	*
FROM 	Directors
WHERE 	PID in 
	SELECT 	PID 
	FROM 	Directed
	WHERE 	MPAA_Num IN
		SELECT 	MPAA_Num
		FROM 	Movies
		WHERE 	MPAA_Num IN
			SELECT 	MPAA_NUM 
			FROM 	Acts_In
			WHERE 	PID IN
				SELECT 	AID
				FROM 	Actors
				WHERE 	PID IN
					SELECT 	PID
					FROM 	People
					WHERE 	First_Name = 'Sean' AND Last_Name = 'Connery';
