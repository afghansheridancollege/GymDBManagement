    -- Develop the SQL scripts that will create the tables and enforce all the appropriate constraints
    CREATE TABLE Customers (
        CustomerID int PRIMARY KEY, 
        CustomerName varchar(255) NOT NULL, 
        CustomerPhone varchar(255) unique NOT NULL, 
        CustomerEmail varchar(255) unique
    );
    CREATE TABLE Location (
        LocationID int PRIMARY KEY, 
        LocationName varchar(255) NOT NULL, 
        LocationAddress varchar(255),
        Telephone varchar(180) unique NOT NULL,
        NumberOfVisits int,
        Email varchar(255) unique
    );
    CREATE TABLE Amenities (
        AmenityID int PRIMARY KEY, 
        AmenityName varchar(255) NOT NULL, 
        LocationID int, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
    ); 
    CREATE TABLE Coach (
        CoachID int PRIMARY KEY, 
        CoachName varchar(255) NOT NULL,
        CoachLevel int NOT NULL, 
        TrainingDescription TEXT,
        Rating Decimal(3, 2)
    ); 
    CREATE TABLE Reviews (
        ReviewID int NOT NULL PRIMARY KEY, 
        CustomerID int NOT NULL, 
        CoachID int NOT NULL, 
        Date DATE NOT NULL, 
        CommunicationRating int, 
        EnthusiasmRating int,
        PunctualityRating int,
        ReviewMessage TEXT, 
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID)
    ); 
    CREATE TABLE Class (
        ClassID int PRIMARY KEY, 
        ClassName varchar(255) NOT NULL, 
        Price DECIMAL(10, 2),
        Time varchar(255) NOT NULL, 
        Room varchar(80) NOT NULL,
        LocationID int, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID) 
    );
    CREATE TABLE Certificate (
        CertificateID int PRIMARY KEY, 
        CoachID int, 
        CertificateName varchar(255) NOT NULL,
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID)
    );
    CREATE TABLE WorkingLocation (
        WorkLocationID int PRIMARY KEY, 
        CoachID int, 
        LocationID int, 
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
    ); 
    CREATE TABLE TimesVisited (
        VisitedID int PRIMARY KEY, 
        LocationID int, 
        CustomerID int, 
        FOREIGN KEY (LocationID) REFERENCES Location(LocationID),
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ); 
    CREATE TABLE Reference (
        CoachID int, 
        CustomerID int, 
        ReferenceID int PRIMARY KEY, 
        FOREIGN KEY (CoachID) REFERENCES Coach(CoachID),
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ); 

    select *from Reference


-- Develop sample SQL scripts that will insert the data to the database (one row in each table)

INSERT INTO Customers (CustomerID, CustomerName, CustomerPhone, CustomerEmail) 
values (2, 'Amin Afghan', '568-282-3956', 'afghan@sheridanc.ca');

INSERT INTO Location (LocationID, LocationName, LocationAddress, Telephone, NumberOfVisits, Email) 
values (2, 'MidTown', '20 Sheridan Street', '468-898-5634', 12, 'midtownfitness@.gmail.com');

INSERT INTO Amenities (AmenityID, AmenityName, LocationID) 
values (1, 'Sauna', 1);

INSERT INTO Coach (CoachID, CoachName, CoachLevel, TrainingDescription, Rating) 
values (1, 'Coach Sally', 3, 'My training phylosophy', 5.0);

INSERT INTO Reviews (ReviewID, CustomerID, CoachID, Date, CommunicationRating, EnthusiasmRating, PunctualityRating, ReviewMessage) 
values (1, 1, 1, '2023-01-15', 3, 4, 3, 'bla bla bla');

INSERT INTO Class (ClassID, ClassName, Time, Room, LocationID) 
values (1, 'Body Pump', '9:50', 'Big Studio', 1);

INSERT INTO Certificate (CertificateID, CoachID, CertificateName) 
values (1, 1, 'Advanced Fit');

INSERT INTO WorkingLocation (WorkLocationID, CoachID, LocationID) 
values (1, 1, 1);

INSERT INTO TimesVisited (VisitedID, LocationID, CustomerID) 
values (1, 1, 1);

INSERT INTO Reference (CoachID, CustomerID, ReferenceID) 
values (1, 1, 1);

-- Create SQL SELECT statements that will:
-- 1. Return all the information displayed on the Locations tab (wireframe 1)
 SELECT
    L.LocationID,
    L.LocationName,
    L.NumberOfVisits
FROM
    Customers C
LEFT JOIN
    TimesVisited V ON C.CustomerID = V.CustomerID
LEFT JOIN
    Location L ON V.LocationID = L.LocationID;

-- 2. Return all the information displayed on the Midtown Location tab (wireframe 2)
SELECT
    L.LocationID,
    L.LocationName,
    L.LocationAddress,
    L.Email, 
    L.Telephone,
    (
        SELECT A.AmenityName
        FROM Amenities A
        WHERE A.LocationID = L.LocationID
    ) AS AmenityName,
    (
        SELECT C.CoachName
        FROM Coach C
        JOIN WorkingLocation WL ON C.CoachID = WL.CoachID
        WHERE WL.LocationID = L.LocationID
    ) AS CoachName
FROM
    Location L;

-- 3. Return all the information displayed on the Coaches tab (wireframe 3)
SELECT
    C.CoachID,
    C.CoachName,
    C.CoachLevel,
    C.Rating
FROM
    Coach C;

-- 4. Return all the information displayed on the Coach Sally tab (wireframe 4)
SELECT
    C.CoachID,
    C.CoachName,
    C.Rating,
    C.CoachLevel,
    C.TrainingDescription,
    (
        SELECT Cert.CertificateName
        FROM Certificate Cert
        WHERE Cert.CoachID = C.CoachID
    ) AS Certificate,
    (
        SELECT Cust.CustomerName
        FROM Reference Ref
        JOIN Customers Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS Reference,
    (
        SELECT Cust.CustomerPhone
        FROM Reference Ref
        JOIN Customers Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS ReferencePhone,
    (
        SELECT Cust.CustomerEmail
        FROM Reference Ref
        JOIN Customers Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS ReferenceEmail
FROM
    Coach C;