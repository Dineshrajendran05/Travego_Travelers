#1) Create a schema named Travego. 
create database Travego;

#Create the tables mentioned above with the mentioned column names. 
create table Passenger 
(Passenger_id int,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);
Create table Price
(id int,
Bus_type varchar(20),
Distance int,
Price int);
insert into Passenger values
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Kushboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji','1000','Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

insert into Price values
(1,'Sleeper',350,770),
(2,'Sleeper',550,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

select * from Passenger;
select * from Price;

#2. Perform read operation on the designed table created in the above task.
##a. How many female passengers traveled a minimum distance of 600 KMs?

show tables;
select * from passenger;

select count(gender) as gender from passenger
where gender = 'F' and Distance <=600;

#b) Write a query to display the passenger details whose travel distance is greater than 500 and
#who are traveling in a sleeper bus

select * from passenger
where distance > 500 and Bus_Type = 'Sleeper';

#c) Select passenger names whose names start with the character 'S'

select passenger_name from passenger
where passenger_name like 's%';

#d) Calculate the price charged for each passenger, displaying the Passenger name, Boarding City,
#Destination City, Bus type, and Price in the output

select * from passenger;
select * from price;

select p.Passenger_id,p.passenger_name,p.boarding_city,p.destination_city,p.distance,p.bus_type,pr.price from passenger p
join price pr on pr.Distance = p.Distance and pr.bus_type = p.Bus_Type;

#e) What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?

select p.passenger_name,p.distance,p.bus_type,pr.price from passenger p
join price pr on pr.Distance = p.Distance and pr.bus_type = p.Bus_Type
where p.Distance >= 1000 and p.Bus_Type = 'Sitting';

# I have assumed that those who traveled 1200kms are also been covered 1000 km. so, I have used Distance >= 1000.

#f) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

select p.Passenger_name,pr.Bus_type,pr.price from passenger p
join price pr on pr.distance = p.Distance
where pr.distance = 600 and (pr.Bus_Type = 'Sleeper' or pr.Bus_Type = 'Sitting');

#g)Alter the column category with the value "Non-AC" where the Bus_Type is sleeper

set sql_safe_updates=0;

update  passenger 
set Category = 'Non-AC'
where bus_type = 'Sleeper';

select * from passenger;

# The My SQl is in safer mode so I have used set sql_safe_updates = 0.   

#h) Delete an entry from the table where the passenger name is Piyush and commit this change in
#the database

select * from passenger;

set autocommit=0;

delete from passenger
where passenger_name = 'Piyush';

commit;

# The My SQl is in auto-commit so I have turned off the auto-commit using set autocommit=0.

#i) Truncate the table passenger and comment on the number of rows in the table (explain if required).

Truncate table passenger;

# The Truncate is used to delete the data inside a table, but not the table itself. So, there is no values in table.

#j)Delete the table passenger from the database

drop table passenger;
show tables;