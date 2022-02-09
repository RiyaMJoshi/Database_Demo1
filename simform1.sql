SHOW databases;
-- Using db
USE simform1;
-- Showing data from Persons table
SELECT * FROM Persons;
-- Insert 2 more records
INSERT INTO Persons (LastName, FirstName, Age)
VALUES ('Pandya', 'Trisha', 21),
	('Dave', 'Chintan', 35);
-- selecting particular records
SELECT p.FirstName AS Name, p.Lastname AS Surname 
FROM Persons p
WHERE p.Age >= 30;

SELECT * FROM simform1.Persons
WHERE LastName <> 'Joshi';

-- update
UPDATE Persons p SET p.Age = 23 
WHERE p.FirstName = 'Trisha' 
AND p.LastName = 'Pandya';

SELECT `Persons`.`Personid`,
    `Persons`.`LastName`,
    `Persons`.`FirstName`,
    `Persons`.`Age`
FROM `simform1`.`Persons`;

-- Limit record numbers to display
SELECT * FROM Persons
LIMIT 2;

-- Adding Foreign Key to Email_address table
ALTER TABLE Email_address
ADD FOREIGN KEY (Personid)
REFERENCES Persons(Personid) 
ON DELETE CASCADE;

-- rename column email_address_person_id
ALTER TABLE Email_address 
RENAME COLUMN email_address_person_id TO Personid;

-- INNER JOIN Records of two tables and Sort them
SELECT p.Personid AS ID, p.LastName, p.FirstName, p.Age, 
e.email_id AS Email
FROM Persons p INNER JOIN Email_address e
ON p.Personid = e.Personid
ORDER BY ID;

-- LEFT OUTER JOIN
SELECT p.Personid AS ID, p.LastName, p.FirstName, p.Age, 
e.email_id AS Email
FROM Persons p LEFT OUTER JOIN Email_address e
ON p.Personid = e.Personid
ORDER BY ID;

-- RIGHT OUTER JOIN
SELECT p.Personid AS ID, p.LastName, p.FirstName, p.Age, 
e.email_id AS Email
FROM Persons p RIGHT OUTER JOIN Email_address e
ON p.Personid = e.Personid
ORDER BY ID;

INSERT INTO `simform1`.`Persons`
(`LastName`,
`FirstName`,
`Age`)
VALUES
("",
"",
1);


INSERT INTO `simform1`.`Email_address`
(`Personid`,
`email_id`)
VALUES
(7,
'noname@abc.com');

DELETE FROM Persons WHERE Age=1;
SELECT * FROM Persons;

-- Drop Foreign Key
ALTER TABLE Email_address 
DROP foreign key Personid;

DESCRIBE Email_address;

-- foreign key
ALTER TABLE Email_address
MODIFY CONSTRAINT FK_PersonID
FOREIGN KEY (Personid) REFERENCES Persons(Personid)
ON DELETE CASCADE;
