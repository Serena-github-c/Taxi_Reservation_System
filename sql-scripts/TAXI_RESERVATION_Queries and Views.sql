-- A raise of 5% is given to drivers who make more than 3 trips per day
UPDATE Driver
SET Salary = Salary * 1.05
WHERE(
    SELECT COUNT(*) as TripCount
    FROM Reservation
    WHERE DATE(Pickup_Date_Time) = CURRENT_DATE
    group by Driver_ID )> 3 ;
    
select * from driver;
    
    

-- Query 1: Update the name of a branche of one company:
UPDATE Branch
SET Br_Name = 'City branch no2'
WHERE  Comp_Name = 'Lyft';
-- to see the update
select * from branch;


-- Query 2 : List the name of drivers associated with a specified branch
SELECT Fame, Lame
FROM driver
WHERE Branch_ID= '1001' ;


-- Query 3 : List the name of drivers who are over 55 years old in all companies
SELECT Fame, Lame
FROM driver
WHERE YEAR(CURRENT_DATE) - YEAR(Bdate) > 55;


-- Query 4 : The names and phone numbers of the Managers for a specific company
SELECT HQManager, HQPhone
FROM TaxiCompany
WHERE Comp_Name = 'BOLT';


-- Query 5 : The names of all drivers in a specific city
SELECT Fame, Lame, address
from driver 
where address like '% cedar%';


-- Query 6 : The total number of cars for each company
SELECT Comp_name, COUNT(Car_ID) AS TotalCars
FROM taxi_car
GROUP BY Comp_name; 


-- Query 7 : The name of owners who have more than one car
SELECT fame, lame, COUNT(t.Car_ID) as TotalCar
FROM car_owner as c, taxi_car as t
WHERE c.Owner_ID = t.Owner_ID 
GROUP BY c.Owner_ID, c.Lame
HAVING COUNT(t.Car_ID) > 1;


-- Query 8 : The total number of private clients in each  company
SELECT Comp_Name AS 'Company', COUNT(DISTINCT Client_ID) AS 'TotalClients'
FROM reservation
GROUP BY reservation.Comp_Name
ORDER BY Comp_Name;


-- Query 9 : The total daily fee in each company on a given date
SELECT Comp_Name, sum(Fees) AS 'Total Fees'
FROM reservation, trip
WHERE StartTime >= '2024-01-17 00:00:00' AND StartTime < '2024-01-18 00:00:00' And reservation.trip_ID = trip.trip_ID
GROUP BY Comp_Name;


-- Query 10 : The total number of car owners in each branch for all companies listed in alphabetical order:
SELECT 
    branch.Br_Name, branch.Comp_Name,
    COUNT(DISTINCT Car_Owner.Owner_ID) AS TotalCarOwners
FROM
    branch,
    car_owner
WHERE
    branch.Branch_ID = car_owner.Branch_ID
GROUP BY branch.Br_Name, branch.Comp_Name
ORDER BY branch.Br_Name;



-- view 1 : Client View
CREATE VIEW ClientView AS
    SELECT 
        Client_Name,
        Pickup_Date_Time,
        Pickup_Address,
        DropOff_Address,
        Comp_Name,
        Fees
    FROM
        reservation;


-- view 2: Driver Monthly Salary Report
CREATE VIEW Driver_Monthly_Salary_Report AS
    SELECT 
        Driver_ID,
        Fame AS 'First Name',
        Lame AS 'Last Name',
        Salary,
        Branch_ID
    FROM
        driver
    ORDER BY Branch_ID;


-- view 3: To check which car owners are also drivers, and which car they own
CREATE VIEW Owner_Driver_Car AS
    SELECT 
        O.Owner_ID,
        O.Fame AS 'Owner First Name',
        O.Lame AS 'Owner Last Name',
        D.Driver_ID,
        driver.Fame AS 'Driver First Name',
        driver.Lame AS 'Driver Last Name',
        C.car_ID
    FROM
        taxi_car AS C,
        drives AS D,
        car_owner AS O,
        driver
    WHERE
        C.Owner_ID = O.Owner_ID
            AND D.Car_ID = C.Car_ID
            AND driver.Driver_ID = D.Driver_ID;
            
            
            