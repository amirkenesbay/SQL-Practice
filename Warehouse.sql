CREATE TABLE Warehouses (
    Code INTEGER PRIMARY KEY NOT NULL,
    Location TEXT NOT NULL ,
    Capacity INTEGER NOT NULL
);

CREATE TABLE Boxes (
    Code TEXT PRIMARY KEY NOT NULL,
    Contents TEXT NOT NULL,
    Value REAL NOT NULL,
    Warehouse INTEGER NOT NULL,
    CONSTRAINT fk_Warehouses_Code FOREIGN KEY (Warehouse) REFERENCES Warehouses(Code)
);

INSERT INTO Warehouses (Code, Location, Capacity) VALUES (1, 'Chicago', 3);
INSERT INTO Warehouses (Code, Location, Capacity) VALUES (2, 'Chicago', 4);
INSERT INTO Warehouses (Code, Location, Capacity) VALUES (3, 'New York', 7);
INSERT INTO Warehouses (Code, Location, Capacity) VALUES (4, 'Los Angeles', 2);
INSERT INTO Warehouses (Code, Location, Capacity) VALUES (5, 'San Francisco', 8);

INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('0MN7', 'Rocks', 180,3);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('4H8P', 'Rocks', 250,1);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('4RT3', 'Scissors', 190,4);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('7G3H', 'Rocks', 200,1);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('8JN6', 'Papers', 75,1);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('8Y6U', 'Papers', 50,3);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('9J6F', 'Papers', 175,2);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('LL08', 'Rocks', 140,4);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('P0H6', 'Scissors', 125,1);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('P2T6', 'Scissors', 150,2);
INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('TU55', 'Papers', 90,5);

DELETE FROM Boxes WHERE Warehouse IN (SELECT Code FROM Warehouses WHERE Capacity < (SELECT count(*) FROM Boxes WHERE Warehouse = Warehouses.Code));

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE Value > 150;

SELECT DISTINCT Contents FROM Boxes;

SELECT avg(Value) FROM Boxes;

SELECT Warehouse, avg(Value) FROM boxes GROUP BY Warehouse;

SELECT Warehouse, avg(Value) FROM Boxes GROUP BY Warehouse HAVING avg(Value) > 150;

SELECT Boxes.Code, Location FROM Boxes INNER JOIN Warehouses W on W.Code = Boxes.Warehouse;

SELECT Warehouse, count(*) FROM Boxes GROUP BY Warehouse;

SELECT Code FROM Warehouses WHERE Capacity < (SELECT count(*) FROM Boxes WHERE Warehouse = Warehouses.Code);

SELECT Boxes.Code FROM Boxes RIGHT JOIN Warehouses W on W.Code = Boxes.Warehouse AND Location = 'Chicago';

INSERT INTO Warehouses (Code, Location, Capacity) VALUES (6, 'New York', 3);

INSERT INTO Boxes (Code, Contents, Value, Warehouse) VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes SET value = value * 0.85;

UPDATE Boxes SET value = value * 0.8 WHERE value > (SELECT avg(Value) FROM (SELECT * FROM Boxes) as "B*");

DELETE FROM Boxes WHERE Value < 100;