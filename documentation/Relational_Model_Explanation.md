# Relational Model (Mapping)
To convert our ERD to a relational model, we follow these steps:

## 1.	Mapping of Regular Entity Types
For each strong entity type E in the ERD, we create a new relation R that includes all the simple attributes of E, including a primary key.


## 2.	Mapping of multivalued attributes
For each multivalued attribute A, we create a new relation R.

  a.	“Staff” table has a multivalued attribute “Phone” that we converted into a separate table.<br>
  b.	“Taxi_Car” table has a multivalued attribute “Phone” that we converted into a separate table.

## 3.	Mapping of binary 1:M Relation Types
a.	“Manager”:
One Staff member is a Manager responsible of many other staff members.
This is a recursive relation between the “Staff” table and itself.
Thus, we create a foreign key “Mgr_SSN” and include it in the “Staff” table.<br>

b.	“Administrate”:
Three staff members administrate each branch.
Thus, the primary key (Branch_ID) of the “Branch” table is included in the “Staff” table as a foreign key which references the “Branch” table.<br>

c.	“Has”:
One Taxi Company can have many branches.
Thus, the primary key (Comp_Name) of the “Taxi_Company” table is included in the “Branch” table as a foreign key which references the “Taxi_Company” table.<br>

d.	“Works_at”:
Many drivers work at each branch. One driver can only work in one branch at a time.
Thus, the primary key (Branch_ID) of the “Branch” table is included in the “Driver” table as a foreign key which references the “Branch” table.<br>

e.	“lends_from”:
One branch lends cars from many car owners. A car owner can lend cars to one branch at a time.
Thus, the primary key (Branch_ID) of the “Branch” table is included in the “Car_Owner” table as a foreign key which references the “Branch” table.<br>


f.	“Assigned_To”:
Each reservation is assigned to one driver. A driver can be assigned many reservations.
Thus, the primary key (Driver_ID) of the “Driver” table is included in the “Reservation” table as a foreign key which references the “Driver” table.
In addition, this associative relation has three attributes : “Start_Time” , “End_Time” and “Fees”. These attributes are added to the “Reservation” table”. <br>


## 4.	Mapping of binary 1:1 Relation Types
“Can_be”:
A car owner can be a driver. In this case, this person is assigned a Driver_id and an Owner_Id. <br>
Thus we use the foreign key approach option, which means that we include the  primary key (Owner_ID) of the “Car_Owner” table in the “Driver” table as a foreign key which references the “Car_Owner” table.<br>

## 5.	Mapping of binary M:N Relation Types
“Drives”:
A driver can drive many taxi cars. A taxi car can be driven by many drivers.
For this relation, we create a new table named “Drives”. This is a relationship table. <br>
In it, we include as foreign key attributes the primary keys of the involved tables, (Car_ID)  from “Taxi_Car” and (Driver_ID) from “Driver”, and their combination forms the primary key of “Drives”.<br>

## 6.	Mapping of n-ary Relation Types
  a.	“provides”:
    A car owner provides one or more cars to a taxi company. <br>
    Here, we have a ternary relation with the following participating entities: Taxi_Company(pk: Comp_Name), Car_Owner(pk: Owner_ID) and Taxi_Car(pk: Car_ID).<br> 
    Since the cardinality can be written as 1:1:N, we include the primary keys (pk: Owner_ID) and (pk: Comp_Name),as foreign keys in the Taxi_Car table.<br>
  b.	“Selects”:
    A client selects a reservation, a taxi car, and a company. A client can select many reservations, but for each one he can only select one car and one company. Two clients cannot make the same reservation.<br>
    Here, we have a quaternary relation with the following participating entities: Client(pk: Client_ID, Client_Name), Taxi_Company(pk: Comp_Name), Taxi_Car(pk: Car_ID) and Reservation(pk : Res_ID) .<br>
    Since the cardinality can be written as 1:1:1:N, we include the primary keys (pk: Client_ID, Client_Name), (pk: Car_ID), and (pk: Comp_Name), and as foreign keys in the Reservation table.<br>

