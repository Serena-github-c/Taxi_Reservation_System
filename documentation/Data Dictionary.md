| **Table**        | **Attribute**    | **Description**               | **Data Type** | **Length** |    **Constraint**   |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|                  |                  |                               |               |            |                     |
| **Taxi Company** | Comp_Name        | Unique company name           | VARCHAR       |     30     |          PK         |
|                  | Reg_nb           | Unique Registration number    | CHAR          |      7     |        Unique       |
|                  | FoundingDate     | Founding Date of the company  | DATE          |     10     |      YYYY-MM-DD     |
|                  | HQManager        | Headquarter manager name      | VARCHAR       |     30     |       NOT NULL      |
|                  | HQAddress        | Headquarter Address           | VARCHAR       |     30     |       NOT NULL      |
|                  | HQPhone          | Headquarter Phone Number      | CHAR          |     10     |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|    **Branch**    | Branch_ID        | Unique Branch Identifier      | CHAR          |      4     |          PK         |
|                  | Br_Name          | Branch Name                   | VARCHAR       |     30     |        Unique       |
|                  | Phone            | Branch Phone Number           | CHAR          |     10     |       NOT NULL      |
|                  | Address          | Branch Address                | VARCHAR       |     30     |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|     **Staff**    | SSN              | Social Security Number        | CHAR          |      9     |          PK         |
|                  | Fame             | First name                    | VARCHAR       |     30     |       NOT NULL      |
|                  | Lame             | Last name                     | VARCHAR       |     30     |       NOT NULL      |
|                  | Bdate            | Birth date                    | DATE          |     10     |      YYYY-MM-DD     |
|                  | Office_nb        | Office number                 | INT           |      -     |       NOT NULL      |
|                  | Address          | Address                       | VARCHAR       |     30     |          -          |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|   **Car_Owner**  | Owner_ID         | Unique Car Owner Identifier   | CHAR          |      9     |          PK         |
|                  | Fame             | First name                    | VARCHAR       |     30     |       NOT NULL      |
|                  | Lame             | Last name                     | VARCHAR       |     30     |       NOT NULL      |
|                  | Bdate            | Birth date                    | DATE          |     10     |      YYYY-MM-DD     |
|                  | Phone            | Phone number                  | CHAR          |     10     |       NOT NULL      |
|                  | Address          | Address                       | VARCHAR       |     30     |          -          |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|   **Taxi_car**   | Car_ID           | Unique Car Identifier         | CHAR          |      7     |          PK         |
|                  | Plate_nb         | Unique plate number           | CHAR          |      6     |        Unique       |
|                  | Model            | Car Model                     | VARCHAR       |     30     |       NOT NULL      |
|                  | Seats            | Number of seats               | INT           |      -     |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|    **Driver**    | Driver_ID        | Unique Owner Identifier       | CHAR          |      9     |          PK         |
|                  | Fame             | First name                    | VARCHAR       |     30     |       NOT NULL      |
|                  | Lame             | Last name                     | VARCHAR       |     30     |       NOT NULL      |
|                  | Bdate            | Birth date                    | DATE          |     10     |       NOT NULL      |
|                  | Phone            | Phone number                  | CHAR          |     10     |       NOT NULL      |
|                  | Address          | Address                       | VARCHAR       |     30     |          -          |
|                  | Salary           | Net Salary in USD             | DECIMAL       |    10,2    |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|    **Client**    | Client_ID        | Unique Client Identifier      | CHAR          |      9     |          PK         |
|                  | Client_Name      | Client Name                   | VARCHAR       |     30     |          PK         |
|                  | Phone            | Phone number                  | CHAR          |     10     |       NOT NULL      |
|                  | Address          | Address                       | VARCHAR       |     30     |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|  **Reservation** | Res_ID           | Unique Reservation Identifier | CHAR          |      9     |          PK         |
|                  | Pickup_Date_Time | Pickup Date and Time          | DATETIME      |     19     |       NOT NULL      |
|                  | Pickup_Address   | Pickup Address                | VARCHAR       |     30     |       NOT NULL      |
|                  | DropOff_Address  | DropOff Address               | VARCHAR       |     30     |       NOT NULL      |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
|     **Trip**     | Trip_ID          | Unique trip identifier        | CHAR          |      9     |          PK         |
|                  | Driver_ID        | Unique Driver Identifier      | CHAR          |      9     |          PK         |
|                  | StartTime        | Start time of the trip        | DATETIME      |     19     | YYYY-MM-DD HH:MI:SS |
|                  | EndTime          | End time of the trip          | DATETIME      |     19     | YYYY-MM-DD HH:MI:SS |
|------------------|------------------|-------------------------------|---------------|:----------:|:-------------------:|              
