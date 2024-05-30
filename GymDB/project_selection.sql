 SELECT
    C.CustomerID,
    C.CustomerName,
    L.LocationID,
    L.LocationName,
    L.NumberOfVisits
FROM
    Customer C
LEFT JOIN
    TimesVisited V ON C.CustomerID = V.CustomerID
LEFT JOIN
    Location L ON V.LocationID = L.LocationID;


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
    

SELECT
    C.CoachID,
    C.CoachName,
    C.CoachLevel,
    C.Rating
FROM
    Coach C;


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
        JOIN Customer Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS Reference,
    (
        SELECT Cust.CustomerPhone
        FROM Reference Ref
        JOIN Customer Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS ReferencePhone,
    (
        SELECT Cust.CustomerEmail
        FROM Reference Ref
        JOIN Customer Cust ON Ref.CustomerID = Cust.CustomerID
        WHERE Ref.CoachID = C.CoachID
    ) AS ReferenceEmail
FROM
    Coach C;

