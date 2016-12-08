--Star Trek: The Next Database
--Alliyah Taylor

DROP TABLE IF EXISTS cargoOn;
DROP TABLE IF EXISTS systemsOn;
DROP TABLE IF EXISTS beingsOn;
DROP TABLE IF EXISTS ClassOf;
DROP TABLE IF EXISTS locationOf;
DROP TABLE IF EXISTS BelongsTo;
DROP TABLE IF EXISTS AffiliatedWith;
DROP TABLE IF EXISTS Alliances;
DROP TABLE IF EXISTS shipClass;
DROP TABLE IF EXISTS Crew;
DROP TABLE IF EXISTS Passengers;
DROP TABLE IF EXISTS Prisoners;
DROP TABLE IF EXISTS Beings;
DROP TABLE IF EXISTS Ships;
DROP TABLE IF EXISTS Locations;
DROP TABLE IF EXISTS Cargo;
DROP TABLE IF EXISTS Systems;


CREATE TABLE Beings(
		beingID 		Integer NOT NULL,
		fName			TEXT NOT NULL,
		lName			TEXT,
		Species 		TEXT NOT NULL,
		AGE  			Integer,
		originPlanet	TEXT,
       PRIMARY KEY (beingID)
);
CREATE TABLE crew(
		beingID 		Integer NOT NULL references Beings(beingID),
		shipRank		TEXT,
		position		TEXT NOT NULL,
		PRIMARY KEY (beingID)
);
CREATE TABLE passengers(
		beingID 		Integer NOT NULL references Beings(beingID),
		Origin			TEXT,
		Destination		TEXT,
		Purpose	TEXT NOT NULL,
		PRIMARY KEY (beingID)
);
CREATE TABLE prisoners(
		beingID 		Integer NOT NULL references Beings(beingID),
		Origin			TEXT NOT NULL,
		Destination		TEXT NOT NULL,
		ValueFedCred	Integer,
		ReasonHeld		TEXT NOT NULL,
		PRIMARY KEY (beingID)
);
CREATE TABLE Ships(
		shipID 					Integer NOT NULL,
		Name 					TEXT NOT NULL,
		dateEnteredFed			numeric(6,1) NOT NULL,
		status					TEXT NOT NULL,
       PRIMARY KEY (shipID)
);
CREATE TABLE beingsOn(
		beingID 		Integer NOT NULL references Beings(beingID),
		shipID 			Integer NOT NULL references Ships(shipID),
		PRIMARY KEY (beingID, shipID)
);

CREATE TABLE Locations(
		locID 					Integer NOT NULL,
		Quadrant 				TEXT NOT NULL,
		System					TEXT NOT NULL,
       PRIMARY KEY (locID)
);
CREATE TABLE locationOf(
		locID 		Integer NOT NULL references Locations(locID),
		shipID 		Integer NOT NULL references Ships(shipID),	
		PRIMARY KEY (locID, shipID)
);
CREATE TABLE Cargo(
		cargoID 			Integer NOT NULL,
		cargoType			TEXT NOT NULL,
		qtyInUnits			Integer NOT NULL,
		Origin				TEXT NOT NULL,
		Destination			TEXT NOT NULL,
		PerUnitCredVal		Integer,
       PRIMARY KEY (cargoID)
);
CREATE TABLE cargoOn(
		cargoID		Integer NOT NULL references Cargo(cargoID),
		shipID 		Integer NOT NULL references Ships(shipID),	
		PRIMARY KEY (cargoID, shipID)
);
CREATE TABLE Systems(
		sysID 			Integer NOT NULL,
		sysName			TEXT NOT NULL,
		sysFunction		TEXT NOT NULL,
       PRIMARY KEY (sysID)
);
CREATE TABLE shipClass(
		classID 		Integer NOT NULL ,	
		className		TEXT NOT NULL, 
		classType		TEXT NOT NULL,
		PRIMARY KEY (classID)
);		
CREATE TABLE systemsOn(
		sysID			Integer NOT NULL references Systems(sysID),
		classID 		Integer NOT NULL references ShipClass(classID),	
		PRIMARY KEY (sysID, classID)
);
CREATE TABLE ClassOf(
		shipID			Integer NOT NULL references Ships(shipID),
		classID 		Integer NOT NULL references ShipClass(classID),	
		PRIMARY KEY (shipID, classID)
);

CREATE TABLE Alliances(
		AllianceID			Integer NOT NULL,
		Name				TEXT NOT NULL,	
		RelationsWithFed 	TEXT,
		PRIMARY KEY (allianceID)
);
CREATE TABLE BelongsTo(
		AllianceID			Integer NOT NULL references Alliances(AllianceID),
		shipID 		Integer NOT NULL references Ships(shipID),	
		PRIMARY KEY (shipID, allianceID)
);
CREATE TABLE AffiliatedWith(
		AllianceID			Integer NOT NULL references Alliances(AllianceID),
		beingID 		Integer NOT NULL references Beings(beingID),	
		PRIMARY KEY (allianceID, beingID)
);
--Populate tables with sample data


--Ships
INSERT INTO Ships(shipID, Name, dateEnteredFed, status)
	VALUES	(1,'FMS Chulebas', 41723.9,'Active');
INSERT INTO Ships(shipID, Name, dateEnteredFed, status)
	VALUES	(2, 'USS Enterprise-D', 41153.7, 'Active');
INSERT INTO Ships(shipID, Name, dateEnteredFed, status)
	VALUES	(3, 'USS Wellington', 41365.3, 'Active');			
INSERT INTO Ships(shipID, Name, dateEnteredFed, status)
	VALUES	(4, 'Halsa', 41294.5, 'Active');
INSERT INTO Ships(shipID, Name, dateEnteredFed, status)
	VALUES	(5, 'IRW Genorex', 41986.0, 'Active');
			
--Beings			
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(1,'Ferengi', 'Bok', NULL, 63, 'Ferenginar');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(2, 'Ferengi', 'Kazago', NULL, 41, 'Ferenginar');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(3, 'Ferengi', 'Rata', NULL, 30, 'Ferenginar');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(4, 'Ferengi', 'Lupak', NULL, 52, 'Ferenginar');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(5, 'Human', 'Jean-Luc', 'Picard', 59, 'Earth');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(6, 'Android', 'Data', 'Soong', 26, 'Omicron Theta');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(7, 'Betazoid/Human', 'Deanna', 'Troi', 28, 'Betazed');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(8, 'Q', 'Q', NULL, NULL, 'Q Continuum');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(9, 'Human', 'Wesley', 'Crusher', 16, 'Earth');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(10, 'Bynar', 'One', 'Zero', NULL, 'Bynaus');		
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(11, 'Bynar', 'Zero', 'One', NULL, 'Bynaus');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(12, 'Human', 'Thomas', 'Pucer', 64, 'Earth');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(13, 'Bajoran', 'Laren', 'Ro', 24, 'Bajor');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(14, 'Human', 'John', 'Connors', 32, 'Earth');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(15, 'Human', 'Wyatt', 'Miller', 30, 'Haven');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(16, 'Tarellian', 'Wrenn', NULL, 54, 'Tarella');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(17, 'Tarellian', 'Ariana', NULL, 28, 'Tarella');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(18, 'Romulan', 'Tebok', NULL, 40, 'Romulus');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(19, 'Human', 'Alan', 'Labouseur', 49, 'Earth');
INSERT INTO beings(beingID,species,fname,lname, age, originPlanet)
	VALUES	(20, 'Romulan', 'Ael', 'Mirok', 35, 'Romulus');
	
--Crew
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(1,'DaiMon','Helm');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(2,'First Officer','Tactical');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(3,'Second Officer','Engineering');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(5,'Captain','Helm');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(6,'Liutenant Commander','Second Officer');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(7,'Commander','Counselor');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(12,'Captain','Helm');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(13,'Ensign','Naviagation');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(14,'Ensign','Tactical');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(16,'Captain','Helm');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(18,'Commander','Helm');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(19,'Centurion','Engineering');
INSERT INTO crew(beingID, shipRank, Position)
	VALUES	(20, 'Sub-commander', 'Tactical');

--Passengers
INSERT INTO passengers(beingID, origin, destination, purpose)
	VALUES (4,'Farenginar','Risa','Traveling to a vacation destination to make profit.');
INSERT INTO passengers(beingID, origin, destination, purpose)
	VALUES (8,'The Q Continuum',NULL,'To try the human race for their crimes.');
INSERT INTO passengers(beingID, origin, destination, purpose)
	VALUES (9,'Enterprise','Enterprise','Family Member of Crew Member Bevery Crusher.');
INSERT INTO passengers(beingID, origin, destination, purpose)
	VALUES (15,'Haven','Neutral Space','To find a cure to the Tarellian plague.');
INSERT INTO passengers(beingID, origin, destination, purpose)
	VALUES (17,'Tarella', 'Neutral Space','Seeking a peaceful place to live out the Tarellian plague. Family member of crew member Wrenn.');

--Prisoners	
INSERT INTO prisoners(beingID, origin, destination, ValueFedCred,ReasonHeld)
	VALUES (10,'Bynaus','Starbase 74',100000,'Awaiting trial by federation.');	
INSERT INTO prisoners(beingID, origin, destination, ValueFedCred,ReasonHeld)
	VALUES (11,'Bynaus','Starbase 74',100000,'Awaiting trial by federation.');

--Alliances
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(0,'United Federation of Planets', NULL);
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(1,'Ferengi Alliance','Neutral');
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(2,'Tarellian','Neutral');
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(3,'Romulan Empire','Enemies');
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(4,'The Q Continuum','Contemptuous');
INSERT INTO Alliances(AllianceID, Name, RelationsWithFed)
	VALUES(5,'Bynaus','Friendly');


--AffiliatedWith
INSERT INTO AffiliatedWith(BeingID, AllianceID)
	VALUES(1,1);
INSERT INTO AffiliatedWith(BeingID, AllianceID)
	VALUES(2,1);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)
	VALUES(3,1);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
VALUES(4,1);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)
	VALUES(5,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(6,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(7,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(8,4);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(9,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(10,5);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(11,5);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(12,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(13,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(14,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(15,2);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(16,2);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(17,2);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(18,3);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(19,0);	
INSERT INTO AffiliatedWith(BeingID, AllianceID)	
	VALUES(20,3);

--BelongsTo
INSERT INTO BelongsTo(AllianceID, ShipID)
	VALUES(2, 1);
INSERT INTO BelongsTo(AllianceID, ShipID)
	VALUES(0, 2);
INSERT INTO BelongsTo(AllianceID, ShipID)
	VALUES(0, 3);	
INSERT INTO BelongsTo(AllianceID, ShipID)
	VALUES(2, 4);	
INSERT INTO BelongsTo(AllianceID, ShipID)
	VALUES(3, 5);	
	
--BeingsON
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(1, 1);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(1, 2);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(1, 3);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(1, 4);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 5);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 6);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 7);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 8);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 9);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 10);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(2, 11);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(3, 12);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(3, 13);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(3, 14);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(4, 15);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(4, 16);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(4, 17);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(5, 18);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(5, 19);
INSERT INTO BeingsOn(ShipID,BeingID)
	VALUES(5, 20);
	
--Locations
INSERT INTO Locations(locID, Quadrant, System)
	VALUES(1, 'Alpha', 'Tarsas');
INSERT INTO Locations(locID, Quadrant, System)
	VALUES(2, 'Alpha', 'Neutral Zone');
INSERT INTO Locations(locID, Quadrant, System)
	VALUES(3, 'Alpha', 'Xendi Sabu');
INSERT INTO Locations(locID, Quadrant, System)
	VALUES(4, 'Alpha', 'Beta Cassius');

--LocationOf
INSERT INTO LocationOf(locID, shipID)
	VALUES(3, 1);	
INSERT INTO LocationOf(locID, shipID)
	VALUES(2, 2);		
INSERT INTO LocationOf(locID, shipID)
	VALUES(1, 3);		
INSERT INTO LocationOf(locID, shipID)
	VALUES(4, 4);		
INSERT INTO LocationOf(locID, shipID)
	VALUES(2, 5);		
	
--Systems
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(1, 'Warp Drive', 'Propulsion');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(2, 'Impulse Engines', 'Propulsion');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(3, 'Sensor Array', 'Observation and Research');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(4, 'Phaser Banks', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(5, 'Torpedo Launchers', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(6, 'Deflector Shields', 'Defense');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(7, 'Tractor Beam', 'Transport');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(8, 'Directed Energy Weapons', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(9, 'Missile Launchers', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(10, 'Electromagnetic Pulse Weapon', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(11, 'Disruptor Array', 'Tactical');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(12, 'Cloaking Device', 'Defense');
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(13, 'Holodeck', 'Leisure');
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(14, 'Environmental Control System', 'Life Support');	
INSERT INTO Systems(sysID, sysName, SysFunction)
	VALUES(15, 'Transporter', 'Transport');	

--ShipClass
INSERT INTO ShipClass(classID, ClassName, ClassType)
	VALUES(1, 'Galaxy', 'Explorer');
INSERT INTO ShipClass(classID, ClassName, ClassType)
	VALUES(2, 'Niagara', 'Fast Cruiser');	
INSERT INTO ShipClass(classID, ClassName, ClassType)
	VALUES(3, 'DKora', 'Attack Vessel');
INSERT INTO ShipClass(classID, ClassName, ClassType)
	VALUES(4, 'Dderidex', 'Warbird');
INSERT INTO ShipClass(classID, ClassName, ClassType)
	VALUES(5, 'Plague Ship', 'Transport');	
	
--SystemsOn	
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 1);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 2);	
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 3);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 4);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 5);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 6);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 7);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 13);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 14);
INSERT INTO systemsOn(classID, sysID)
	VALUES(1, 15);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 1);	
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 2);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 3);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 4);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 5);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 6);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 7);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 14);
INSERT INTO systemsOn(classID, sysID)
	VALUES(2, 15);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 1);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 2);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 3);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 6);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 7);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 8);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 9);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 10);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 14);
INSERT INTO systemsOn(classID, sysID)
	VALUES(3, 15);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 1);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 2);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 3);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 6);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 7);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 8);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 11);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 12);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 14);
INSERT INTO systemsOn(classID, sysID)
	VALUES(4, 15);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 1);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 2);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 3);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 6);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 7);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 11);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 14);
INSERT INTO systemsOn(classID, sysID)
	VALUES(5, 15);	
	
--ClassOf
INSERT INTO ClassOf(classID, shipID)
	VALUES(1,2 );
INSERT INTO ClassOf(classID, shipID)
	VALUES(2, 3);
INSERT INTO ClassOf(classID, shipID)
	VALUES(3, 1);
INSERT INTO ClassOf(classID, shipID)
	VALUES(4, 5);
INSERT INTO ClassOf(classID, shipID)
	VALUES(5, 4);	
	
--Cargo
INSERT INTO Cargo(CargoID, cargoType, qtyInUnits, Origin, Destination, PerUnitCredVal)
	VALUES(1,'Dilithium Ore',40,'Dozaria','Ferenginar', 400);
INSERT INTO Cargo(CargoID, cargoType, qtyInUnits, Origin, Destination, PerUnitCredVal)
	VALUES(2,'Romulan Ale',200,'Romulus','Coridan', 50);	
	
--ClassOf
INSERT INTO CargoOn(cargoID, shipID)
	VALUES(1,1 );
INSERT INTO CargoOn(cargoID, shipID)
	VALUES(2,1 );	
	
-- VIEW of all of a ship's Systems
CREATE OR REPLACE VIEW ShipSystems
AS
	SELECT DISTINCT sh.name, sys.sysname, sys.sysfunction
	FROM ships sh, systems sys, classof co, shipclass cl, systemson so
	WHERE sh.shipid = co.shipid AND cl.classid = co.classid AND so.sysid = sys.sysid AND cl.classid = so.classid
	ORDER BY sh.name, sys.sysname, sys.sysfunction;

-- View all cargo ships are carrying 
CREATE OR REPLACE VIEW ShipCargo
AS
SELECT DISTINCT sh.name, c.cargotype, c.QtyInUnits, c.PerUnitCredVal
FROM ships sh, cargo c, cargoon cgo
WHERE sh.shipid=cgo.shipid AND c.cargoid=cgo.cargoid
ORDER BY sh.name, c.cargotype, c.qtyinunits, c.perunitcredval;

--Query to view total value of a ship's cargo
SELECT CredVal.name, SUM(TotalCredVal) AS TotalCargoVal
FROM (
SELECT name ,cargotype, QtyInUnits*PerUnitCredVal AS TotalCredVal
From ShipCargo
Group by name, cargotype, qtyinunits,perunitcredval) AS CredVal
WHERE CredVal.name =CredVal.name
GROUP BY CredVal.name;
--Query to view each ship and her captain
SELECT S.Name, B.FName, B.Lname, C.shipRank
FROM Ships s, beingsOn bo, Beings b, Crew c
WHERE s.shipid = bo.shipid
	AND bo.beingid =b.beingid
    AND c.beingid=b.beingid
    AND shipRank = 'Captain';
--Query to view location of cargo
SELECT l.Quadrant, l.system, c.cargotype
FROM locations l, locationOf lo, ships s, cargoon co, cargo c
WHERE l.locid = lo.locid
AND s.shipid=lo.shipid
AND co.shipid=s.shipid
AND c.cargoid=co.cargoid;
-- Stored procedures to see what classes a system is in
CREATE OR REPLACE FUNCTION IsInClass(int, refcursor) RETURNS refcursor AS
	$$
	DECLARE
		Sys_id		int 		:=$1;
		resultset 	REFCURSOR 	:= $2;
	BEGIN
		open resultset for
			SELECT *
			FROM shipClass
			WHERE classid IN(
				SELECT so.classID
				FROM systemsOn so
				WHERE so.sysID = sys_id) ;
		return resultset;
		
	END;
	$$
	LANGUAGE plpgsql;

	--Test the stored proc
		SELECT IsInClass(7, 'results');
		Fetch all from results;
--Create Admin Role
Create role admin;
Grant all on all tables in schema public to admin;

--Create Admiral Role
Create role admiral;
Revoke all on all tables in schema public from admiral;
Grant select on all tables in schema public to admiral;
Grant insert on beings, prisoners, crew, passengers, cargo, beingson, cargoon, affiliatedwith, locationof
To admiral;

