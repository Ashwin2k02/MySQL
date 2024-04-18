create database CarRental;
use CarRental;

-- creating vehicle table
create table Vehicle (
vehicleID int primary key,
make varchar(25),
model varchar(25),
year int,
dailyRate decimal (8,2),
status varchar(15),
passengercapacity int,
enginecapacity int
);

-- creating customer table 
create table Customer (
customerID int primary key,
firstname varchar(25),
lastname varchar(25),
email text,
phonenumber varchar(15)
);


-- creating lease table 
create table Lease (
leaseID int primary key,
vehicleID int,
customerID int,
startDate Date,
endDate Date,
type varchar(15),
foreign key (vehicleID) references Vehicle (vehicleID),
foreign key (customerID) references Customer (customerID)
);

-- create payment table
create table Payment (
paymentID int,
leaseID int,
paymentDate date,
amount decimal (8,2),
foreign key (leaseID) references Lease (leaseID)
);

-- inserting into vehicle table
insert into vehicle (vehicleID, make, model, year, dailyRate, status, passengercapacity, enginecapacity)
values
(1, 'Toyota', 'Camry', 2022, 50.00, 1, 4, 1450),
(2, 'Honda', 'Civic', 2023, 45.00, 1, 7, 1500),
(3, 'Ford', 'Focus', 2022,48.00, 0, 4, 1400),
(4, 'Nissan', 'Altima', 2023, 52.00, 1, 7, 1200),
(5, 'Chevrolet', 'Malibu', 2022, 47.00, 1, 4, 1800),
(6, 'Hyundai', 'Sonata', 2023,49.00, 0, 7, 1400),
(7, 'BMW', '3 Series', 2023, 60.00, 1, 7, 2499),
(8, 'Mercedes', 'C-Class', 2022, 58.00, 1, 8, 2599),
(9, 'Audi', 'A4', 2022, 55.00, 0, 4, 2500),
(10, 'Lexus', 'ES', 2023, 54.00, 1, 4, 2500);

-- inserting into customer table
insert into Customer (customerID, firstname, lastname, email, phonenumber)
values
(1, 'John', 'Doe', 'johndoe@example.com', '555-555-5555'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-123-4567'),
(3, 'Robert', 'Johnson', 'robert@example.com', '555-789-1234'),
(4, 'Sarah', 'Brown', 'sarah@example.com', '555-456-7890'),
(5, 'David', 'Lee', 'david@example.com', '555-987-6543'),
(6, 'Laura', 'Hall', 'laura@example.com', '555-234-5678'),
(7, 'Michael', 'Davis', 'davis@example.com', '555-876-5432'),
(8, 'Emma', 'Wilson', 'emma@example.com', '555-432-1098'),
(9, 'William', 'Taylor', 'william@example.com', '555-321-6457'),
(10, 'Olivia', 'Adams', 'olivia@example.com', '555-765-4321');


-- inserting into lease table 
insert into lease (leaseID, vehicleID, customerID, startDate, endDate, type)
values
(1, 1, 1, '2023-01-01', '2023-01-05', 'Daily'),
(2, 2, 2, '2023-02-15', '2023-02-28', 'Monthly'),
(3, 3, 3, '2023-03-10', '2023-03-15', 'Daily'),
(4, 4, 4, '2023-04-20', '2023-04-30', 'Monthly'),
(5, 5, 5, '2023-05-05', '2023-05-10','Daily'),
(6, 4, 3, '2023-06-15', '2023-06-30', 'Monthly'),
(7, 7, 7, '2023-07-01', '2023-07-10', 'Daily'),
(8, 8, 8, '2023-08-12', '2023-08-15', 'Monthly'),
(9, 3, 3, '2023-09-07', '2023-09-10', 'Daily'),
(10, 10, 10, '2023-10-10', '2023-10-31', 'Monthly');
 
-- inserting into payment table
insert into Payment (paymentID, leaseID, paymentDate, amount)
values
(1, 1, '2023-01-03', 200.00),
(2, 2, '2023-02-20', 1000.00),
(3, 3, '2023-03-12', 75.00),
(4, 4, '2023-04-25', 900.00),
(5, 5, '2023-05-07', 60.00),
(6, 6, '2023-06-18', 1200.00),
(7, 7, '2023-07-03', 40.00),
(8, 8, '2023-08-14', 1100.00),
(9, 9, '2023-09-03', 80.00),
(10, 10, '2023-10-03', 1500.00);


-- 1. Update the daily rate for a Mercedes car to 68. 

update vehicle set dailyRate=68.00 where make='Mercedes';

-- 2. Delete a specific customer and all associated leases and payments. 

delete from payment where leaseID in (select leaseID from lease where customerID=6);
delete from lease where customerID=6;
delete from customer where customerID=6;

-- 3. Rename the "paymentDate" column in the Payment table to "transactionDate". 

alter table Payment rename column paymentDate to transactionDate ;

-- 4. Find a specific customer by email. 

select * from customer where email = 'emma@example.com';

-- 5. Get active leases for a specific customer. 

select l.* from lease l
join customer on l.leaseid = customer.customerid
where l.enddate >= curdate()
and customer.customerid=4;

-- 6. Find all payments made by a customer with a specific phone number.

select p.*, c.* from payment p 
join customer c on p.paymentid = c.customerid 
where c.phonenumber = '555-765-4321'; 

-- 7. Calculate the average daily rate of all available cars.

select avg(dailyrate) as AverageDailyRate from vehicle v;

-- 8. Find the car with the highest daily rate. 

select * from vehicle 
order by dailyRate desc limit 1;

-- 9. Retrieve all cars leased by a specific customer.

select v.* from vehicle v
join lease l on v.vehicleID = l.leaseID
where l.customerID = 3;

-- 10. Find the details of the most recent lease.

select * from lease 
order by enddate desc limit 1;

-- 11. List all payments made in the year 2023.

select * from payment where year(transactionDate) = 2023;

-- 12. Retrieve customers who have not made any payments.

select c.* from customer c
left join lease l on c.customerid = l.customerid
where l.customerid is null;

-- 13. Retrieve Car Details and Their Total Payments.

select v.vehicleid,v.make,v.model, sum(p.amount) as TotalPayments from vehicle v
join lease l on l.vehicleID = v.vehicleID
join payment p on l.leaseID = p.leaseID
group by v.vehicleid,v.make,v.model;

-- 14. Calculate Total Payments for Each Customer. 

select c.customerID, c.firstname, c.lastname, sum(p.amount) as TotalPayments from customer c 
join lease l on l.customerID = c.customerID
join payment p on l.leaseID = p.leaseID
group by c.customerID, c.firstname, c.lastname;

-- 15. List Car Details for Each Lease. 

select l.*,v.make,v.model,v.year from lease l
join vehicle v on l.vehicleID = v.vehicleID;

-- 16. Retrieve Details of Active Leases with Customer and Car Information. 

select l.*,v.make,v.model,v.year, c.customerID,c.Firstname from lease l
join customer c on l.customerid = c.customerid
join vehicle v on l.vehicleID = v.vehicleID
where l.enddate >= curdate();

-- 17. Find the Customer Who Has Spent the Most on Leases. 

select c.customerID, c.firstname, c.lastname, sum(p.amount) as total_spent_on_leases from Customer c
join Lease l on c.customerID = l.customerID
join Payment p on l.leaseID = p.leaseID
group by c.customerID, c.firstname, c.lastname
order by total_spent_on_leases desc limit 1;

-- 18. List All Cars with Their Current Lease Information. 

select v.* , l.* from vehicle v
join lease l on v.vehicleID = l.vehicleId;





