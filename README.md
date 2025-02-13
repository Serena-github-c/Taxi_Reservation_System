# Taxi_Reservation_System
Database project design and implementation in MySQL

## Introduction

This database systems project aims to create an efficient TAXI RESERVATION system for optimizing taxi services in our country. Focused on enhancing customer experiences, this system captures crucial information about taxi companies, their branches, car owners, drivers, and clients.

Its primary function is to streamline the reservation process, allowing clients to select their preferred taxi company easily, reserve an appropriate car, and allocate a qualified driver based on their specific needs. This system not only enhances the overall customer experience but also encourages taxi companies to optimize their services. 

By offering a comprehensive overview of each company, branch, and associated entities, the database facilitates effective management, improves resource allocation, and ensures a seamless coordination of services. 

Through this innovative approach, the TAXI RESERVATION database aims to bring about heightened efficiency, improved customer satisfaction, and a more organized and responsive taxi service industry.

## Key Features:
    
    - Supports multiple taxi companies and their branches
    - Manages drivers, car owners, and clients
    - Implements reservation tracking with assigned drivers
    - Normalized database design (1NF, 2NF, 3NF)
    - Uses triggers to enforce business rules

### The system allows clients to:

    Select their preferred taxi company
    Reserve a car and get an allocated driver
    Improve taxi company service efficiency


## Implementation Steps
    1. Table creation
    2. Sample data insertion
    3. Queries to get specific info
    4. User Views

### User views
A user view is a virtual table that is based on the result of a SELECT query.
Views are useful for many reasons:
1.	Abstraction: Views hide the complexity of underlying tables, showing only the necessary information.
2.	Security: Views allow us to restrict access to certain columns or rows, providing a security layer.
3.	Aggregation: Views can simplify aggregate queries, such as sum, average, etc., by pre-defining these aggregations.

Users can query views in the same way they query tables, and they can be granted permissions to access the view even if they do not have direct access to the underlying tables.

We will create three views.

    1.Client view: This view is to see general info about trips, including the client’s name, the pickup address and destination address, as well as the fees. It’s a simplified view that only selects necessary information. 
    2.Driver_Monthly_Salary_Report: This view shows the drivers who work at each company, in addition to their salary.  
    3.Owner_Driver_Car View: This view is used to establish a relationship between drivers, car owner, and cars.






    
