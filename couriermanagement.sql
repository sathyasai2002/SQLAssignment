use CourierManagement ;
create database CourierManagement ;

create table UserTable(
UserID INT not null PRIMARY KEY ,
Name VARCHAR(255) not null,
Email VARCHAR(255) not null UNIQUE,
Password VARCHAR(255) not null,
ContactNumber VARCHAR(20) not null,
Address TEXT not null);

create table CourierService(
ServiceID INT not null PRIMARY KEY,
ServiceName VARCHAR(100) not null,
Cost DECIMAL(8, 2) not null);

create table employee(
EmployeeID INT not null PRIMARY KEY,
Name VARCHAR(255) not null,
Email VARCHAR(255) not null UNIQUE,
ContactNumber VARCHAR(20) not null,
Role VARCHAR(50) not null,
Salary DECIMAL(10, 2) not null); 

create table courier(
CourierID INT not null PRIMARY KEY,
userid int not null,
SenderName VARCHAR(255) not null,
SenderAddress TEXT not null,
ReceiverName VARCHAR(255) not null,
ReceiverAddress TEXT not null,
EmployeeID INT NOT NULL,
ServiceID INT not null,
Weight DECIMAL(5, 2) not null,
[Status] VARCHAR(50) not null,
TrackingNumber VARCHAR(20) not null UNIQUE,
DeliveryDate DATE not null,
FOREIGN KEY(EmployeeID) REFERENCES employee(EmployeeID),
FOREIGN KEY(serviceid) REFERENCES CourierService(serviceid),
FOREIGN KEY(userid) REFERENCES usertable(userid)); 

create table location(
LocationID INT not null PRIMARY KEY,
LocationName VARCHAR(100) not null,
Address TEXT not null); create table payment(
PaymentID INT not null PRIMARY KEY,
CourierID INT not null,
LocationId INT not null,
Amount DECIMAL(10, 2) not null,
PaymentDate DATE not null,
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));-- view the data of all the tablesselect * from courierselect * from courierserviceselect * from UserTableselect * from employeeselect * from locationselect * from payment-- inserting vaues int usertableinsert into UserTable(UserID, Name, Email, Password, ContactNumber, Address)values(1,'John Doe','john.doe@gmail.com','johndoe123','9876543210','123 main st chennai 600001'),(2,'vin diesel','vin.diesel@gmail.com','vin.diesel123','9344991523','96 second st chennai 600012'),(3,'paul walker','paul.walker@gmail.com','paul.walker03','9940258550','21 first cross st chennai 600001'),(4,'johnson','jonhson.d@gmail.com','johnson.d123','6382134921','01 david lane chennai 600032'),(5,'jarvis','jarvis20@gmail.com','jarvis.20','9444158992','72 fifth cross st bangalore 523816'),(6,'robert','robert.do@gmail.com','robert.do20','9962338185','45 oak avenue pune 10001'),(7,'sathya sai','sathya.s@gmail.com','sathya.2002','7700900123','32 maple lane noida 75002'),(8,'ashwin','ashwin.i@gmail.com','ashwin.0766','8825535876','19 pine st chennai 600021');--inerting values into courier tableinsert into Courier (CourierID, SenderName,userid, SenderAddress, ReceiverName, ReceiverAddress,employeeid,serviceid, Weight, Status, TrackingNumber, DeliveryDate)values(1,'John Doe',1,'123 main st chennai 600001','jarvis','72 fifth cross st bangalore 523816',1,2,2.7,'In Transit', 'ABC123', '2024-04-26'),(2,'paul walker',3,'21 first cross st chennai 600001','robert','45 oak avenue pune 10001',3,3,3.5,'Delivered', 'DEF456', '2024-04-20'),(3,'ashwin',8,'19 pine st chennai 600021','sathya sai','32 maple lane noida 75002',2,5,4.8,'Pending', 'GHI789','2024-04-22'),(4,'robert',6,'45 oak avenue pune 10001','vin diesel','96 second st chennai 600012',3,4,2.7,'In Transit', 'JKL012', '2024-04-25'),(5,'paul walker',3,'21 first cross st chennai 600001','ashwin','19 pine st chennai 600021',4,1,4.5,'Delivered', 'MNO345', '2024-04-18');--inserting values into CourierServicesINSERT INTO CourierService (ServiceID, ServiceName, Cost)
VALUES(1,'standard',30.00),(2,'express',45.00),(3,'same day',70.00),(4,'on demand',80.00),(5,'international',150.00);--inserting values into employee tableINSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES
(1, 'rajesh', 'rajesh.me@gmail.com', '994033814', 'Manager', 50000.00),
(2, 'ravi shankar', 'ravi.shankar@gmail.com', '8838516411', 'Courier', 30000.00),
(3, 'christopher nolan', 'christopher.nolan@gmail.com', '9176803565', 'Courier', 30000.00),
(4, 'chirs hemsworth', 'chris.hems@gmail.com', '8870076915', 'Accountant', 40000.00),
(5, 'domnic', 'domdomnic@gmail.com', '7358430100', 'Customer Service', 25000.00);--inserting values into location tableINSERT INTO Location (LocationID, LocationName, Address)
VALUES(1,'Main Office', '41,church st, chennai 600023'),
(2, 'Branch Office', '56 school lane , chennai 600015'),
(3, 'Warehouse 1', '78 mn collage road, chennai 600004'),
(4, 'warehouse 2', '45 noted st, chennai 600031'),
(5, 'city outlet', '89 last st, chennai 600002');-- inserting values into payment table	INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
	VALUES
	(1, 1, 1, 45.00, '2024-04-25'),
	(2, 2, 3, 70.00, '2024-04-20'),
	(3, 3, 2, 150.00, '2024-04-19'),
	(4, 4, 4, 80.00, '2024-04-20'),
	(5, 5, 5, 30.00, '2024-04-15');--Task 2--1.List all customersSELECT * FROM UserTable

--2.List all orders for a specific customer: 
SELECT * FROM Courier WHERE SenderName = 'paul walker';

--3.List all couriers:
SELECT * FROM Courier;

--4.List all packages for a specific order:
SELECT * FROM Courier WHERE TrackingNumber = 'GHI789';

--5.List all deliveries for a specific courier:
SELECT * FROM Courier WHERE Status = 'Delivered' AND CourierID = 5;

--6.List all undelivered packages:
SELECT * FROM Courier WHERE Status <> 'Delivered';

--7.List all packages that are scheduled for delivery today:****
SELECT * FROM Courier WHERE CAST(DeliveryDate AS DATE) = CAST(GETDATE() AS DATE);

--8.List all packages with a specific status:
SELECT * FROM Courier WHERE Status = 'in transit';

--9.Calculate the total number of courier for each courierservice:

--Here the question was given as to find the no of packages for each courier but according to the given schema 
--there is no separate column for packages so I have changed the question as no of couriers for each coureirservice

SELECT 
    CourierService.ServiceID,
    CourierService.ServiceName,
    COUNT(Courier.CourierID) AS TotalCouriers
FROM 
    CourierService
JOIN 
    Courier ON CourierService.ServiceID = Courier.ServiceID
GROUP BY 
    CourierService.ServiceID, CourierService.ServiceName;

--10.Find the average delivery time for each courier:
SELECT 
    C.CourierID, 
    AVG(DATEDIFF(HOUR, P.PaymentDate, C.DeliveryDate)) AS AvgDeliveryTimeHours
FROM 
    Courier C
JOIN 
    Payment P ON C.CourierID = P.CourierID
GROUP BY 
    C.CourierID;

--11.List all packages with a specific weight range:
SELECT * FROM Courier WHERE Weight BETWEEN 2 AND 4;

--12. Retrieve employees whose names contain 'Chris'
SELECT * FROM Employee WHERE Name LIKE '%Chris%';

--13.Retrieve all courier records with payments greater than $50.
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;

--Task 3: GroupBy, Aggregate Functions, Having, Order By, where

--14. Find the total number of couriers handled by each employee:
SELECT Employee.EmployeeID, Employee.Name, COUNT(Courier.CourierID) AS TotalCouriersHandled
FROM Employee
LEFT JOIN Courier ON Employee.EmployeeID = Courier.EmployeeID
GROUP BY Employee.EmployeeID, Employee.Name;

--15.Calculate the total revenue generated by each location:
SELECT
    Location.LocationID,
    Location.LocationName,
    SUM(Payment.Amount) AS TotalRevenue
FROM
    Location
LEFT JOIN
    Payment ON Location.LocationID = Payment.LocationID
GROUP BY
    Location.LocationID,
    Location.LocationName;

--16. Find the total number of couriers delivered to each location.***
select l.LocationName, COUNT(c.CourierID) AS TotalCouriersDelivered from Location l
join payment p
on l.LocationID = p.LocationId
join Courier c on p.CourierID=c.CourierID
where c.Status = 'delivered'
group by l.LocationID,l.LocationName;

--17.Find the courier with the highest average delivery time:
select top 1 c.courierID, AVG(DATEDIFF(HOUR, P.PaymentDate, C.DeliveryDate)) AS AverageDelivery from Courier C
join Payment P on C.CourierID = P.CourierID
group by C.CourierID 
order by AverageDelivery desc;

--18.Find Locations with Total Payments Less Than a Certain Amount(100):
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID
HAVING SUM(Amount) < 100;

--19.Calculate Total Payments per Location:
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID;

--20.Retrieve couriers who have received payments totaling more than $65 in a specific location (LocationID = X):
SELECT CourierID
FROM Payment
WHERE LocationID = 3
GROUP BY CourierID
HAVING SUM(Amount) > 65;

--21.Retrieve couriers who have received payments totaling more than $50 after a certain date (PaymentDate > 'YYYY-MM-DD'):
SELECT CourierID
FROM Payment
WHERE PaymentDate > '2024-04-15'
GROUP BY CourierID
HAVING SUM(Amount) > 50;

--22.Retrieve locations where the total amount received is more than $35 before a certain date (PaymentDate > 'YYYY-MM-DD'):
SELECT LocationID
FROM Payment
WHERE PaymentDate > '2024-04-18'
GROUP BY LocationID
HAVING SUM(Amount) > 35;

--Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join 

--23. Retrieve Payments with Courier Information
SELECT *
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID;

--24.Retrieve Payments with Location Information:
SELECT *
FROM Payment P
INNER JOIN Location L ON P.LocationID = L.LocationID;

--25.Retrieve Payments with Courier and Location Information:
SELECT *
FROM Payment P
INNER JOIN Courier C ON P.CourierID = C.CourierID
INNER JOIN Location L ON P.LocationID = L.LocationID;

--26.List all payments with courier details:
SELECT *
FROM Payment P
LEFT JOIN Courier C ON P.CourierID = C.CourierID;

--27.Total payments received for each courier:
SELECT CourierID, SUM(Amount) AS TotalPaymentsReceived
FROM Payment
GROUP BY CourierID;

--28.List payments made on a specific date:
SELECT *
FROM Payment
WHERE PaymentDate = '2024-04-20';

--29.Get Courier Information for Each Payment:
SELECT *
FROM Payment P
LEFT JOIN Courier C ON P.CourierID = C.CourierID;

--30.Get Payment Details with Location:
SELECT *
FROM Payment P
LEFT JOIN Location L ON P.LocationID = L.LocationID;

--31.Calculating Total Payments for Each Courier:
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;

--32.List Payments Within a Date Range:
SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2024-04-10' AND '2024-04-20';

--33.Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side:

--For this question in the given schema there was no relation between the user table and courier table.
--To get the result for this question I created a relation between user table and the courier table.

SELECT *
FROM UserTable U
FULL OUTER JOIN Courier C ON U.UserID = C.UserID;

--34.Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side:

SELECT *
FROM Courier C
FULL OUTER JOIN CourierService CS ON C.ServiceID = CS.ServiceID;

--35.Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side:
SELECT
    Employee.EmployeeID,
    Employee.Name AS EmployeeName,
    Payment.PaymentID,
    Payment.Amount,
    Payment.PaymentDate
FROM
    Employee 
FULL OUTER JOIN courier C ON C.EmployeeID = employee.EmployeeID
full outer join payment  ON payment.CourierID =C.CourierID;

--36.List all users and all courier services, showing all possible combinations:
SELECT *
FROM UserTable
CROSS JOIN CourierService;

--37.List all employees and all locations, showing all possible combinations:
SELECT *
FROM employee
CROSS JOIN location;

--38.Retrieve a list of couriers and their corresponding sender information (if available):
SELECT *
FROM Courier C
INNER JOIN UserTable U ON C.userid = U.UserID;

--39.Retrieve a list of couriers and their corresponding receiver information (if available):
SELECT *
FROM Courier C
INNER JOIN UserTable U ON C.ReceiverName = U.Name;

--40.Retrieve a list of couriers along with the courier service details (if available):
SELECT *
FROM Courier C
INNER JOIN CourierService CS ON C.ServiceID = CS.ServiceID;

--41.Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT
    Employee.EmployeeID,
    Employee.Name AS EmployeeName,
    COUNT(Courier.CourierID) AS NumberOfCouriers
FROM
    Employee
INNER JOIN
    Courier ON Employee.EmployeeID = Courier.EmployeeID
GROUP BY
    Employee.EmployeeID,
    Employee.Name;

--42.Retrieve a list of locations and the total payment amount received at each location:
SELECT
    Location.LocationID,
    Location.LocationName,
    SUM(Payment.Amount) AS TotalPaymentAmount
FROM
    Location
INNER JOIN
    Payment ON Location.LocationID = Payment.LocationID
GROUP BY
    Location.LocationID,
    Location.LocationName;

--43. Retrieve all couriers sent by the same sender (based on SenderName).
SELECT *
FROM Courier
WHERE SenderName IN (SELECT SenderName FROM Courier WHERE CourierID = CourierID);

--44. List all employees who share the same role.
SELECT *
FROM Employee
WHERE Role IN (SELECT Role FROM Employee GROUP BY Role HAVING COUNT(*) > 1);

--45. Retrieve all payments made for couriers sent from the same location.**
SELECT *
FROM payment
WHERE courierid IN (
    SELECT C1.CourierID
    FROM Courier C1
    JOIN Courier C2 ON CAST(C1.SenderAddress AS VARCHAR) = CAST(C2.SenderAddress AS VARCHAR)
    WHERE C1.CourierID <> C2.CourierID
);


--46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT *
FROM courier
WHERE courierid IN (
    SELECT C1.CourierID
    FROM Courier C1
    JOIN Courier C2 ON CAST(C1.SenderAddress AS VARCHAR) = CAST(C2.SenderAddress AS VARCHAR)
    WHERE C1.CourierID <> C2.CourierID
);

--47. List employees and the number of couriers they have delivered:
SELECT EmployeeID, COUNT(*) AS NumberOfCouriersDelivered
FROM Courier
GROUP BY EmployeeID;

--48. Find couriers that were paid an amount greater than the cost of their respective courier services 

--In this question it will display an empty table since there are no payments greater than than the service cost

SELECT c.*
FROM Courier c
JOIN CourierService cs ON c.ServiceID = cs.ServiceID
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > cs.Cost;

--49. Find couriers that have a weight greater than the average weight of all couriers
SELECT *
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

--50. Find the names of all employees who have a salary greater than the average salary:
SELECT Name
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT SUM(Cost) AS TotalCost
FROM CourierService
WHERE Cost < (SELECT MAX(Cost) FROM CourierService);

--52. Find all couriers that have been paid for 
SELECT c.*
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID;

--53. Find the locations where the maximum payment amount was made 
SELECT LocationID
FROM Payment
WHERE Amount = (SELECT MAX(Amount) FROM Payment);

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender
SELECT *
FROM Courier
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'paul walker');


