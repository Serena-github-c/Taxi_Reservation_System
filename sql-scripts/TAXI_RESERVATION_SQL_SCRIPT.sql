
CREATE TABLE TaxiCompany (
    Comp_Name VARCHAR(30) NOT NULL,
    Reg_nb CHAR(7) NOT NULL,
    FoundingDate DATE NOT NULL,
    HQManager VARCHAR(30) NOT NULL,
    HQAddress VARCHAR(30) NOT NULL,
    HQPhone CHAR(10) NOT NULL,
    PRIMARY KEY (Comp_Name),
    UNIQUE (Reg_nb)
);


CREATE TABLE Branch (
    Branch_ID CHAR(4) NOT NULL,
    Br_Name VARCHAR(30) NOT NULL,
    Phone VARCHAR(10),
    Address VARCHAR(30),
    Comp_Name VARCHAR(30),
    PRIMARY KEY (Branch_ID),
    FOREIGN KEY (Comp_Name)
        REFERENCES taxicompany (Comp_Name)
        ON DELETE SET NULL ON UPDATE CASCADE
);

 
CREATE TABLE Staff (
    SSN CHAR(9) NOT NULL,
    Mgr_SSN CHAR(9),
    Fame VARCHAR(30) NOT NULL,
    Lame VARCHAR(30) NOT NULL,
    Bdate DATE,
    Office_nb INT NOT NULL,
    Address VARCHAR(30),
    Branch_ID CHAR(4) NOT NULL,
    PRIMARY KEY (SSN),
    FOREIGN KEY (Branch_ID)
        REFERENCES Branch (Branch_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Mgr_SSN)
        REFERENCES Staff (SSN)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Staff_Phone (
    SSN CHAR(9) NOT NULL,
    Phone CHAR(10) NOT NULL,
    PRIMARY KEY (SSN , Phone),
    FOREIGN KEY (SSN)
        REFERENCES Staff (SSN)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Car_Owner (
    Owner_ID CHAR(9) NOT NULL,
    Fame VARCHAR(30) NOT NULL,
    Lame VARCHAR(30) NOT NULL,
    Bdate DATE,
    Phone VARCHAR(10),
    Address VARCHAR(30),
    Driver_ID CHAR(9),
    Branch_ID CHAR(4) NOT NULL,
    PRIMARY KEY (Owner_ID),
    FOREIGN KEY (Branch_ID)
        REFERENCES Branch (Branch_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Driver_ID)
        REFERENCES Driver (Driver_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Taxi_Car (
    Car_ID CHAR(7) NOT NULL,
    Plate_nb CHAR(6) NOT NULL,
    Comp_Name VARCHAR(30) NOT NULL,
    Model VARCHAR(30),
    Seats INT,
    Owner_ID CHAR(9) NOT NULL,
    PRIMARY KEY (Car_ID),
    UNIQUE (Plate_nb),
    FOREIGN KEY (Comp_Name)
        REFERENCES TaxiCompany (Comp_Name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Owner_ID)
        REFERENCES Car_Owner (Owner_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE CarColor (
    Car_ID CHAR(7) NOT NULL,
    Car_color VARCHAR(30),
    PRIMARY KEY (Car_ID , Car_color),
    FOREIGN KEY (Car_ID)
        REFERENCES Taxi_Car (Car_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Driver (
    Driver_ID CHAR(9) NOT NULL,
    Fame VARCHAR(30) NOT NULL,
    Lame VARCHAR(30) NOT NULL,
    Bdate DATE,
    Phone VARCHAR(10),
    Address VARCHAR(30),
    Salary DECIMAL(10 , 2 ),
    Branch_ID CHAR(4) NOT NULL,
    PRIMARY KEY (Driver_ID),
    FOREIGN KEY (Branch_ID)
        REFERENCES Branch (Branch_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE Drives (
    Driver_ID CHAR(9) NOT NULL,
    Car_ID CHAR(7) NOT NULL,
    PRIMARY KEY (Driver_ID , Car_ID),
    FOREIGN KEY (Driver_ID)
        REFERENCES Driver (Driver_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Car_ID)
        REFERENCES taxi_car (Car_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
 
CREATE TABLE Client (
    Client_ID CHAR(9) NOT NULL,
    Client_Name VARCHAR(30) NOT NULL,
    Phone CHAR(10),
    Address VARCHAR(30),
    PRIMARY KEY (Client_ID , Client_Name)
);


CREATE TABLE Reservation (
    Res_ID CHAR(9) NOT NULL,
    Client_ID CHAR(9) NOT NULL,
    Client_Name VARCHAR(30) NOT NULL,
    Pickup_Date_Time DATETIME NOT NULL,
    Pickup_Address VARCHAR(30) NOT NULL,
    DropOff_Address VARCHAR(30) NOT NULL,
    Comp_Name VARCHAR(30) NOT NULL,
    Car_ID CHAR(7) NOT NULL,
	Fees DECIMAL(10 , 2 ) NOT NULL,
    PRIMARY KEY (Res_ID),
    FOREIGN KEY (Client_ID , Client_Name)
        REFERENCES Client (Client_ID , Client_Name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Comp_Name)
        REFERENCES TaxiCompany (Comp_Name)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (Car_ID)
        REFERENCES Taxi_Car (Car_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
    
);

ALTER TABLE reservation
ADD COLUMN trip_ID CHAR(50),
ADD FOREIGN KEY (trip_ID) REFERENCES trip(trip_ID);

UPDATE reservation SET trip_ID = '111110000' WHERE (Res_ID = '111000011');
UPDATE reservation SET trip_ID = '111220000' WHERE (Res_ID = '111000022');
UPDATE reservation SET trip_ID = '111330000' WHERE (Res_ID = '111000100');
UPDATE reservation SET trip_ID = '111440000' WHERE (Res_ID = '111000231');
UPDATE reservation SET trip_ID = '111550000' WHERE (Res_ID = '111000543');





CREATE TABLE Trip (
    Trip_ID CHAR(9) NOT NULL,
    Driver_ID CHAR(9) NOT NULL,
    StartTime DATETIME NOT NULL,
    EndTime DATETIME NOT NULL,
    PRIMARY KEY(Trip_ID,Driver_ID),
    FOREIGN KEY (Driver_ID)
        REFERENCES Driver (Driver_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);


INSERT INTO TaxiCompany 
VALUES 
  ('XYZ Taxis', '0000111', '2020-01-01', 'John Smith', '123 Main St, City', '555-1234'),
  ('BOLT', '0000222', '2018-05-10', 'Mary Jhones', '456 Oak St, Town', '555-5678'),
  ('City Rides', '0000333', '2019-03-15', 'Bob Michaels', '789 Elm St, Village', '555-9101'),
  ('Lyft', '0000444', '2022-02-20', 'Alice Phelps', '101 Pine St, Metro', '555-1122'),
  ('Quick Cabs', '0000555', '2021-08-12', 'Charlie Bush', '202 Cedar St, Suburb', '555-3344');


INSERT INTO Branch
VALUES 
  (1012, 'Suburb Branch', '555-1041', '456 Willow St, City', 'XYZ Taxis'),
  (1001, 'Downtown Branch', '555-1001', '456 Oak St, City', 'XYZ Taxis'),
  (1002, 'Main Office', '555-2002', '789 Maple St, Town', 'BOLT'),
  (1003, 'Village Hub', '555-3003', '101 Pine St, Village', 'City Rides'),
  (1004, 'Metro Center', '555-4004', '202 Cedar St, Metro', 'Lyft'),
  (1005, 'Suburb Station', '555-5005', '303 Birch St, Suburb', 'Quick Cabs');


INSERT INTO Staff 
VALUES 
  ('123456789', NULL, 'Alice', 'Smith', '1980-05-15', '101', '789 Elm St, City', 1001),
  ('234567890', '123456789', 'Bob', 'Johnson', '1985-08-20', '202', '890 Maple St, Town', 1002),
  ('345678901', '123456789', 'Charlie', 'Miller', '1990-12-10', '303', '901 Pine St, Village', 1003),
  ('456789012', '234567890', 'David', 'Jones', '1982-03-25', '404', '102 Cedar St, Metro', 1004),
  ('567890123', '234567890', 'Eva', 'Brown', '1995-06-30', '505', '203 Birch St, Suburb', 1005);
 

INSERT INTO Staff_Phone
VALUES 
  ('123456789', '555-7890'),
  ('234567890', '555-8901'),
  ('345678901', '555-9012'),
  ('456789012', '555-0123'),
  ('567890123', '555-1234');


INSERT INTO Car_Owner 
VALUES 
  ('100001001', 'Bob', 'Johnson', '1975-08-20', '555-4567', '234 Pine St, City', '110003848',  1001),
  ('100001002', 'Catherine', 'Williams', '1988-10-05', '555-5678', '345 Oak St, Town', NULL, 1002),
  ('100001003', 'David', 'Smith', '1992-02-15', '555-6789', '456 Maple St, Village',  '110003878', 1003),
  ('100001004', 'Emma', 'Davis', '1980-07-01', '555-7890', '567 Pine St, Metro',  NULL, 1004),
  ('100001005', 'Frank', 'Martin', '1995-04-12', '555-8901', '678 Cedar St, Suburb',  NULL, 1005);


INSERT INTO Taxi_Car (Car_ID, Plate_nb, Comp_Name, Owner_ID, Model, Seats)
VALUES 	
(5550012, '111234', 'XYZ Taxis', '100001003', 'Sedan', 4),
(5550882, '114234', 'XYZ Taxis', '100001003', 'SUV', 4),
(5550899, '197234', 'BOLT', '100001002', 'Compact', '6'),
(3030303, '334321', 'City Rides', '100001005', 'Compact', 3),
(4440404, '428765', 'BOLT', '100001002', 'Van', 8),
(5003002, '349876', 'Quick Cabs', '100001002', 'Sedan', 4);


INSERT INTO CarColor (Car_ID, Car_color)
VALUES 
  (5550012, 'Blue'),
  (5550882, 'Black'),
  (5550899, 'Red'),
  (4440404, 'White'),
  (5003002, 'Silver'),
  (3030303, 'Blue'),
  (3030303, 'Red');



INSERT INTO Driver (Driver_ID, Branch_ID, Fame, Lame, Bdate, Phone, Address, Salary)
VALUES 
  ('110003255', 1001, 'Edward', 'Hart', '1965-04-12', '555-9022', '789 Cedar St, Suburb', 3300.00),
  ('110003848', 1001, 'Charlie', 'Miller', '1988-12-10', '555-5678', '345 Cedar St, City', 3000.00),
  ('110003878', 1002, 'Catherine', 'Williams', '1990-02-25', '555-6789', '456 Oak St, Town', 3200.00),
  ('110005578', 1003, 'David', 'Smith', '1992-06-15', '555-7890', '567 Maple St, Village', 3100.00),
  ('110009978', 1004, 'Emma', 'Davis', '1985-07-01', '555-8901', '678 Pine St, Metro', 3300.00),
  ('110003278', 1005, 'Frank', 'Martin', '1995-04-12', '555-9012', '789 Cedar St, Suburb', 3000.00);


INSERT INTO DRIVES (Driver_ID, Car_ID)
VALUES
('110003255', 5550012),
('110003848',5550882),
('110009978', 5003002),
('110003278',4440404 );




INSERT INTO Client (Client_ID, Client_Name, Phone, Address)
VALUES 
  ('100001', 'John Client', '555-7891', '789 Oak St, City'),
  ('101002', 'Alice Customer', '555-8902', '890 Maple St, Town'),
  ('102003', 'David Passenger', '555-9013', '901 Pine St, Village'),
  ('312004', 'Eva Rider', '555-0124', '102 Cedar St, Metro'),
  ('313005', 'Frank Traveler', '555-1235', '203 Birch St, Suburb');


INSERT INTO Reservation (Res_ID, Client_ID, Client_Name, Pickup_Date_Time, Pickup_Address, DropOff_Address, Comp_Name, Car_ID, Fees) 
VALUES 
  (111000011, '100001', 'John Client', '2024-01-15 10:00:00', '789 Oak St, City', '456 Elm St, City', 'XYZ Taxis', 3030303, 25.00 ),
  (111000022, '101002', 'Alice Customer', '2024-01-16 12:30:00', '890 Maple St, Town', '567 Pine St, Town', 'Lyft', 5550012, 30.00 ), 
  (111000100, '102003', 'David Passenger', '2024-01-17 15:45:00', '901 Pine St, Village', '678 Oak St, Village', 'City Rides', 5550882, 20.00), 
  (111000231, '312004', 'Eva Rider', '2024-01-17 08:00:00', '102 Cedar St, Metro', '789 Maple St, Metro', 'BOLT', 4440404, 35.00 ), 
  (111000543, '313005', 'Frank Traveler', '2024-01-19 19:00:00', '203 Birch St, Suburb', '678 Cedar St, Suburb', 'Quick Cabs', 5550899, 28.00);


INSERT INTO trip (Trip_ID, Driver_ID, StartTime, EndTime)
VALUES
('111110000', '110003278', '2024-01-15 10:00:00', '2024-01-15 12:00:00'),
('111220000', '110003848', '2024-01-16 12:30:00', '2024-01-16 14:30:00'),
('111330000', '110003878', '2024-01-17 15:45:00', '2024-01-17 17:30:00'),
('111440000', '110005578', '2024-01-17 08:00:00', '2024-01-17 09:30:00'),
('111550000', '110009978', '2024-01-19 19:00:00', '2024-01-19 21:00:00');




-- Trigger to check the age of Staff members
DELIMITER //
CREATE TRIGGER CHECK_AGE_Staff
BEFORE INSERT ON Staff
FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(NEW.Bdate);

    IF age < 18 OR age > 64 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be between 18 and 64';
    END IF;
END;
//

-- Trigger to check the age of Car Owners
CREATE TRIGGER CHECK_AGE_Car_Owner
BEFORE INSERT ON Car_Owner
FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(NEW.Bdate);

    IF age < 18 OR age > 64 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be between 18 and 64';
    END IF;
END;
//

-- Trigger to check the age of Drivers
CREATE TRIGGER CHECK_AGE_Driver
BEFORE INSERT ON Driver
FOR EACH ROW
BEGIN
    DECLARE age INT;
    SET age = YEAR(CURDATE()) - YEAR(NEW.Bdate);

    IF age < 18 OR age > 64 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Age must be between 18 and 64';
    END IF;
END;
//




