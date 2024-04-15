create database cms;
use cms;

create table CourierServices
(ServiceID INT PRIMARY KEY,  
ServiceName VARCHAR(100),  
Cost DECIMAL(8, 2));

create table employee
(EmployeeID INT PRIMARY KEY,  
Name VARCHAR(255),  
Email VARCHAR(255) UNIQUE,  
ContactNumber VARCHAR(20),  
Role VARCHAR(50),  
Salary DECIMAL(10, 2));

create table location(LocationID INT PRIMARY KEY,  
LocationName VARCHAR(100),  
Address TEXT);

create table User(UserID INT PRIMARY KEY,  
Name VARCHAR(255),  
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255),  
ContactNumber VARCHAR(20),  
Address TEXT  
);  

create table courier
(CourierID INT PRIMARY KEY,
ServiceID INT,
UserID INT,
EmployeeID INT,  
SenderName VARCHAR(255),  
SenderAddress TEXT,  
ReceiverName VARCHAR(255),  
ReceiverAddress TEXT,  
Weight DECIMAL(5, 2),  
Status VARCHAR(50),  
TrackingNumber VARCHAR(20) UNIQUE,  
DeliveryDate DATE,
Foreign Key(ServiceID) references CourierServices (ServiceID),
Foreign Key(UserID) references User(UserID),
Foreign Key(EmployeeID) references employee (EmployeeID));

insert into User(UserID, Name, Email, Password, ContactNumber, Address) values
(1212, 'Ravi', 'ravi.123@example.com', 'password123', '9876543210', '123, ABC Street, Chennai, Tamil Nadu, India'),
(2323, 'John', 'john.123@example.com', 'securepass456', '8765432109', '456, XYZ Road, Bangalore, Karnataka, India'),
(3434, 'Arjun', 'arjun.123@example.com', 'strongpassword789', '7654321098', '789, LMN Avenue, Hyderabad, Telangana, India'),
(4545, 'Meera', 'meera.321@example.com', 'pass1234', '6543210987', '987, PQR Lane, Kochi, Kerala, India'),
(5656, 'Shreya', 'shreya.321@example.com', 'mypass@321', '5432109876', '654, UVW Street, Coimbatore, Tamil Nadu, India'),
(6767, 'Anand', 'anand.321@example.com', '9876password', '4321098765', '321, DEF Road, Mysore, Karnataka, India'),
(7878, 'Arun', 'arun.321@example.com', '9876passkey', '6363636363', '333, GHI Road, Mumbai, Maharshtra, India');

insert into CourierServices(ServiceID, serviceName, Cost)
values
 (10101, 'Express', 125.25),
 (20202, 'Amazon', 150.00),
 (30303, 'Blue Dart', 175.75),
 (40404, 'DHL', 200.20),
 (50505, 'FedEx', 180.00);
 
 insert into employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
values
(101, 'Suresh Kumar', 'suresh.kumar@example.com', '9876543210', 'Manager', 50000.00),
(102, 'Meena Gupta', 'meena.gupta@example.com', '8765432109', 'Sale Executive', 35000.00),
(103, 'Prakash Raj', 'prakash.raj@example.com', '7654321098', 'Sale Executive', 30000.00),
(104, 'Aruna Devi', 'aruna.devi@example.com', '6543210987', 'Sale Executive', 40000.00),
(105, 'Karthik Raja', 'karthik.raja@example.com', '5432109876', 'Sales Executive', 38000.00),
(106, 'Deepa Sharma', 'deepa.sharma@example.com', '4321098765', 'Manager', 50000.00);


insert into location (LocationID, LocationName, Address)
values
(1, 'Chennai Central', '123, KK Nagar, Chennai, Tamil Nadu, India'),
(2, 'Bangalore Junction', '456, MG Road, Bangalore, Karnataka, India'),
(3, 'Hyderabad Station', '789, Modern Avenue, Hyderabad, Telangana, India'),
(4, 'Cochin Terminal', '987, Fort Lane, Kochi, Kerala, India'),
(5, 'Coimbatore Depot', '654, RS Puram, Coimbatore, Tamil Nadu, India');

insert into courier
(CourierID, ServiceID, UserID,EmployeeID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
values
(123, 20202, 1212,102, 'Ravi',  '123, ABC Street, Chennai, Tamil Nadu, India', 'Bhuvaneshwar Kumar', '456, MG Road, Bangalore, Karnataka, India', 2.5, 'Undelivered', 'TRK123456', '2024-04-15'),
(234, 50505, 2323,103, 'John', '456, XYZ Road, Bangalore, Karnataka, India',  'Priya Anandh', '987, Fort Lane, Kochi, Kerala, India', 1.8, 'Today Delivery', 'TRK789789', '2024-04-14'),
(345, 10101, 3434,101, 'Arjun', '654, RS Puram, Coimbatore, Tamil Nadu, India', 'Rohit Sharma', '789, Modern Avenue, Hyderabad, Telangana, India', 3.2, 'Delivered', 'TRK345678', '2024-04-12'),
(456, 20202, 4545,105, 'Meera', '987, PQR Lane, Kochi, Kerala, India', 'Ravi Ashwin', '123, KK Nagar, Chennai, Tamil Nadu, India', 2.0, 'Undelivered', 'TRK901234', '2024-04-16'),
(567, 30303, 5656,104, 'Shreya', '654, UVW Street, Coimbatore, Tamil Nadu, India', 'Dilip Kumar', '456, MG Road, Bangalore, Karnataka, India', 1.5, 'Today Delivery', 'TRK567890', '2024-04-13'),
(678, 40404, 6767,101, 'Anand', '456, MG Road, Bangalore, Karnataka, India', 'Logesh Rahul', '789, Modern Avenue, Hyderabad, Telangana, India', 2.7, 'Delivered', 'TRK234567', '2024-04-11'),
(910, 10101, 7878,102, 'Arun', '654, RS Puram, Coimbatore, Tamil Nadu, India', 'Rohit Sharma', '789, Modern Avenue, Hyderabad, Telangana, India', 4.5, 'Today Delivery', 'TRK345345', '2024-04-25'),
(999, 50505, 2323,105, 'John', '456, XYZ Road, Bangalore, Karnataka, India', 'Dinesh Karthik', '998, Fort Lane, Kochi, Kerala, India', 4.0, 'Delivered', 'TRK789123', '2024-04-16');

create table paymentdetails(PaymentID INT PRIMARY KEY,  
CourierID INT,  
LocationId INT,  
Amount DECIMAL(10, 2),  
PaymentDate DATE,  
FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),  
FOREIGN KEY (LocationID) REFERENCES Location(LocationID));

insert into paymentdetails (PaymentID, CourierID, LocationID, Amount, PaymentDate)
values
(543210, 123, 1, 800.50, '2024-03-05'),
(987651, 234, 5, 550.25, '2023-11-14'),
(908072, 345, 2, 666.66, '2024-02-22'),
(102033, 456, 1, 770.70, '2023-10-09'),
(405064, 567, 4, 990.00, '2023-12-12'),
(121215, 678, 4, 610.20, '2024-01-10');

select * from courier;

select a.courierid,a.deliverydate,b.paymentdate,
datediff(a.deliverydate,b.paymentdate) as averagedays from courier a 
left join paymentdetails b 
on a.courierid=b.courierid 
group by a.courierid,a.deliverydate,b.paymentdate;

select a.courierid,a.deliverydate,b.paymentdate,
datediff(a.deliverydate,b.paymentdate) as averagedays from courier a 
left join paymentdetails b 
on a.courierid=b.courierid 
group by a.courierid,a.deliverydate,b.paymentdate order by averagedays desc limit 1;

insert into User(UserID, Name, Email, Password, ContactNumber, Address) values
(1222, 'Suresh', 'suresh.123@example.com', 'pass123', '9638527410', '199, ABC Street, Chennai, Tamil Nadu, India'),
(2333, 'Ramesh', 'ramesh.123@example.com', 'secure456', '9685743210', '499, XYZ Road, Bangalore, Karnataka, India');

insert into courier
(CourierID, ServiceID, UserID,EmployeeID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
values
(101, 20202, 1222,102, 'Suresh',  '199, ABC Street, Chennai, Tamil Nadu, India', 'Bhuvaneshwar Kumar', '456, MG Road, Bangalore, Karnataka, India', 2.5, 'Undelivered', 'TRK129879', '2024-04-15'),
(505, 50505, 2333,103, 'Ramesh', '499, XYZ Road, Bangalore, Karnataka, India',  'Priya Anandh', '987, Fort Lane, Kochi, Kerala, India', 1.8, 'Today Delivery', 'TRK789547', '2024-04-14');

insert into paymentdetails (PaymentID, CourierID, LocationID, Amount, PaymentDate)
values 
(542542,101,3,6000,'2024-01-01'), 
(542524,505,3,8000,'2024-01-01');

-- 1. List all customers:

select Name from user;

-- 2. List all orders for a specific customer:

select * from couriers where sendername='John';  

-- 3. List all couriers: 

select * from couriers;

-- 4. List all packages for a specific order:

select * from couriers where CourierID='345';

-- 5. List all deliveries for a specific courierservice:

select * from couriers where ServiceID='10101';

-- 6. List all undelivered packages:

select * from emp where status='undelivered';

-- 7. List all packages that are scheduled for delivery today:

select * from emp where status='out for delivery';

-- 8. List all packages with a specific status:

select * from couriers status where status='In transit';

-- 9. Calculate the total number of packages for each courier.

select count(*) from couriers where ServiceID='50505';

-- 10. Find the average delivery time for each courier.

select a.courierid,a.deliverydate,b.paymentdate,
datediff(a.deliverydate,b.paymentdate) as averagedays from courier a 
left join paymentdetails b 
on a.courierid=b.courierid 
group by a.courierid,a.deliverydate,b.paymentdate;

-- 11. List all packages with a specific weight range:

select * from couriers where weight between 1 and 3;

-- 12. Retrieve employees whose names contain 'John'

select * from employee where name='John';

-- 13. Retrieve all courier records with payments greater than $50.

select * from couriers where courierid in (select courierid from paymentdetails where amount>50);

-- 14. Find the total number of couriers handled by each employee.

select count(CourierID) from courier group by EmployeeID;

-- 15. Calculate the total revenue generated by each location

select locationID, sum(amount) from Paymentdetails group by locationID;

-- 16. Find the total number of couriers delivered to each location.

select locationID, count(courierID) from paymentdetails group by locationID;

-- 17. Find the courier with the highest average delivery time.
 
select a.courierid,a.deliverydate,b.paymentdate,
datediff(a.deliverydate,b.paymentdate) as averagedays from courier a 
left join paymentdetails b 
on a.courierid=b.courierid 
group by a.courierid,a.deliverydate,b.paymentdate order by averagedays desc limit 1;

-- 18. Find Locations with Total Payments Less Than a Certain Amount

select locationID, sum(amount) from Paymentdetails group by locationID having sum(amount)<800;

-- 19. Calculate Total Payments per Location

select locationID, sum(amount) from Paymentdetails group by locationID;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location(LocationID = X):

select LocationID,sum(amount) as total from paymentdetails group by LocationID having total>1000;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date(PaymentDate > 'YYYY-MM-DD'):

select LocationID,sum(amount) as total from paymentdetails where PaymentDate > '2023-10-08' group by LocationID having total>1000; 

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date(PaymentDate > 'YYYY-MM-DD')

select LocationID,sum(amount) as total from paymentdetails where PaymentDate < '2024-12-31' group by LocationID having total>5000;

-- 23. Retrieve Payments with Courier Information

select c.*,p.* from courier as c left join paymentdetails as p on c.CourierID=P.CourierID;

-- 24. Retrieve Payments with Location Information

select p.*,l.* from Paymentdetails as p left join location as l on l.locationID=p.locationID;

-- 25. Retrieve Payments with Courier and Location Information

select p.*,c.*,l.* from courier as c
left join paymentdetails as p on c.CourierID=P.CourierID
left join location as l on l.locationID=p.locationID;

-- 26. List all payments with courier details

select c.*,p.* from courier as c left join paymentdetails as p on c.CourierID=P.CourierID;

-- 27. Total payments received for each courier (Service)

select cs.ServiceID,cs.Servicename, sum(p.amount) as total from paymentdetails p
left join courier c on c.courierid=p.courierid
left join CourierServices cs on cs.ServiceID=c.ServiceID 
group by cs.serviceID,cs.Servicename;

-- 28. List payments made on a specific date

select * from paymentdetails where paymentdate='2024-02-22';

-- 29. Get Courier Information for Each Payment
 
select c.*,p.* from courier c inner join paymentdetails p on c.CourierID=p.CourierID; 

-- 30. Get Payment Details with Location

select l.*,p.* from location l inner join paymentdetails p on l.LocationID=p.LocationID; 

-- 31. Calculating Total Payments for Each Courier (Service)

select cs.ServiceID,cs.Servicename, sum(p.amount) as total from paymentdetails p
left join courier c on c.courierid=p.courierid
left join CourierServices cs on cs.ServiceID=c.ServiceID 
group by cs.serviceID,cs.Servicename;

-- 32. List Payments Within a Date Range

select * from paymentdetails where paymentdate between '2023-12-01' and '2024-12-01';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side

select u.*, c.* from User u left join Courier c on u.Name = c.SenderName or u.Name = c.ReceiverName;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side

select c.*, cs.* from Courier c left join CourierServices cs on c.CourierID = cs.CourierID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side

select e.*, p.* from emloyee e left join Paymentdetails p on e.EmployeeID = p.EmployeeID;

-- 36. List all users and all courier services, showing all possible combinations.

select u.*, cs.* from User u cross join CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations:

select e.*, l.* from Employee e cross join Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available)

select c.*, u.* from Courier c left join User u on c.SenderName = u.Name;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):

select c.*, u.* from Courier c left join User u on c.ReceiverName = u.Name;

-- 40. Retrieve a list of couriers along with the courier service details (if available):

select c.*, cs.* from Courier c left join CourierServices cs on c.CourierID = cs.CourierID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee:

select e.EmployeeID, e.Name, count(c.CourierID) as TotalCouriersAssigned 
from Employee e left join Courier c on e.EmployeeID = c.EmployeeID group by e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location:

select l.LocationID, l.LocationName, sum(p.Amount) as TotalPayment 
from Location l left join Payment p on l.LocationID = p.LocationID 
group by l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName).

select c1.*, c2.* from Courier c1 join Courier c2 on c1.SenderName = c2.SenderName and c1.CourierID <> c2.CourierID;

-- 44. List all employees who share the same role.

select e1.*, e2.* from Employee e1 join Employee e2 on e1.Role = e2.Role and e1.EmployeeID <> e2.EmployeeID;

-- 45. Retrieve all payments made for couriers sent from the same location.

select p1.*, p2.* from Payment p1 join Payment p2 on p1.LocationID = p2.LocationID and p1.CourierID <> p2.CourierID;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress).

select c1.*, c2.* from Courier c1 join Courier c2 on c1.SenderAddress = c2.SenderAddress and c1.CourierID <> c2.CourierID;

-- 47. List employees and the number of couriers they have delivered:

select count(CourierID) from courier group by EmployeeID;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services

select e.EmployeeID, e.Name, count(c.CourierID) as TotalCouriersDelivered from Employee e 
left join Courier c ON e.EmployeeID = c.EmployeeID and c.Status = 'Delivered' group by e.EmployeeID, e.Name;

-- 49. Find couriers that have a weight greater than the average weight of all couriers

select * from Courier where Weight > (select avg(Weight) from Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary:

select name from employee where salary>(select avg(salary) from employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost

select sum(Cost) as TotalCost from CourierServices where Cost < (select max(Cost) from CourierServices);

-- 52. Find all couriers that have been paid for

select distinct c.* from Courier c join Payment p on c.CourierID = p.CourierID;

-- 53. Find the locations where the maximum payment amount was made

select l.* from Location l join Payment p on l.LocationID = p.LocationID where Amount = (select max(Amount) from Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender(e.g., 'SenderName'):

select c.*
from Courier c
where Weight > all (select Weight from Courier where SenderName = 'Ram');
