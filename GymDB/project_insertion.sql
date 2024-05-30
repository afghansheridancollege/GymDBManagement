INSERT INTO Customers (CustomerID, CustomerName, CustomerPhone, CustomerEmail) 
VALUES (1, 'Will Smith', '422-000-0000', 'will@smith.gmail.com');

INSERT INTO Location (LocationID, LocationName, LocationAddress, Telephone, NumberOfVisits, Email) 
VALUES (1, 'MidTown', '20 Street Avenue, Cityville', '444-209-9084', 15, 'midtown@teaches.gmail.com');

INSERT INTO Amenities (AmenityID, AmenityName, LocationID) 
VALUES (1, 'Sauna', 1);

INSERT INTO Coach (CoachID, CoachName, CoachLevel, TrainingDescription, Rating) 
VALUES (1, 'Coach Sally', 3, 'My training phylosophy', 5.0);

INSERT INTO Reviews (ReviewID, CustomerID, CoachID, Date, CommunicationRating, EnthusiasmRating, PunctualityRating, ReviewMessage) 
VALUES (1, 1, 1, '2023-01-15', 3, 4, 3, 'bla bla bla');

INSERT INTO Class (ClassID, ClassName, Time, Room, LocationID) 
VALUES (1, 'Body Pump', '9:50', 'Big Studio', 1);

INSERT INTO Certificate (CertificateID, CoachID, CertificateName) 
VALUES (1, 1, 'Advanced Fit');

INSERT INTO WorkingLocation (WorkLocationID, CoachID, LocationID) 
VALUES (1, 1, 1);

INSERT INTO TimesVisited (VisitedID, LocationID, CustomerID) 
VALUES (1, 1, 1);

INSERT INTO Reference (CoachID, CustomerID, ReferenceID) 
VALUES (1, 1, 1);