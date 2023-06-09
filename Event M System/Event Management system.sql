CREATE TABLE Music(
M_ID INT PRIMARY KEY IDENTITY,
M_Type int FOREIGN KEY(M_Type) REFERENCES Music_Type(MT_ID),
[Name] varchar(45),
Singer varchar(15));

CREATE TABLE Music_Type(
MT_ID INT PRIMARY KEY IDENTITY ,
[Name] VARCHAR(15));

CREATE TABLE Cattering_Type(
CT_ID INT PRIMARY KEY IDENTITY ,
[Name] VARCHAR(15));


CREATE TABLE Staff(
Staff_ID INT PRIMARY KEY IDENTITY,
First_Name VARCHAR(10),
Last_Name VARCHAR(10),
User_Name VARCHAR(15) unique,
Designation VARCHAR(15),
Salary int,
[Address] VARCHAR(35),
Contact VARCHAR(15),
Email VARCHAR(25),
City VARCHAR(10),
[Password] VARCHAR(25),
Confirm_Password VARCHAR(25));

CREATE TABLE Customer(
C_ID INT PRIMARY KEY IDENTITY,
First_Name VARCHAR(10),
Last_Name VARCHAR(10),
User_Name VARCHAR(15),
[Address] VARCHAR(35),
Contact VARCHAR(15),
Email VARCHAR(25),
City VARCHAR(10),
[Password] VARCHAR(25),
Confirm_Password VARCHAR(25));

CREATE TABLE [User](
U_ID INT PRIMARY KEY IDENTITY,
U_Type varchar(10),
Staff_ID int FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID),
C_ID int FOREIGN KEY(C_ID) REFERENCES Customer(C_ID),
[Name] varchar(15),
[Password] VARCHAR(25));

CREATE TABLE Venue(
V_ID INT PRIMARY KEY IDENTITY,
V_Name varchar(15),
[Address] varchar(45),
Contact varchar(15));


CREATE TABLE Cattering(
Cattering_ID INT PRIMARY KEY IDENTITY,
CT_Type int FOREIGN KEY(CT_Type) REFERENCES Cattering_Type(CT_ID),
[Name] varchar(45),
Price int);

CREATE TABLE Transport(
Transport_ID INT PRIMARY KEY IDENTITY,
Vehicle_Name varchar(45),
Vehicle_Company varchar(45),
Vehicle_No varchar(45),
Price int);

CREATE TABLE [Event](
Event_ID INT PRIMARY KEY IDENTITY,
Event_Name varchar(45),
Venue_ID int FOREIGN KEY(Venue_ID) REFERENCES Venue(V_ID),
Cattering_ID int FOREIGN KEY(Cattering_ID) REFERENCES Cattering(Cattering_ID),
Transport_ID int FOREIGN KEY(Transport_ID) REFERENCES Transport(Transport_ID),
Music_ID int FOREIGN KEY(Music_ID) REFERENCES Music(M_ID),
[Date] Date,
price int);
select * from [Event] 
alter table [Event] add Price int;

Drop table Ticket;


alter table Billing drop Event_Name;

drop table Billing;
CREATE TABLE Billing(
Bill_ID INT PRIMARY KEY IDENTITY,
C_ID int FOREIGN KEY(C_ID) REFERENCES Customer(C_ID),
Event_ID int FOREIGN KEY(Event_ID) REFERENCES [Event](Event_ID),
Ticket_ID int FOREIGN KEY(Ticket_ID) REFERENCES Ticket(Ticket_ID),
Transport int,
Food int,
Price int,
Total int);
select * from Billing;

CREATE TABLE Ticket(
Ticket_ID INT PRIMARY KEY IDENTITY,
Event_ID int FOREIGN KEY(Event_ID) REFERENCES [Event](Event_ID));

create trigger tr_Billing
on Ticket
after insert
as begin
Declare @E_ID int
Declare @T_ID int
Declare @Transport int
Declare @Food int
Declare @Total int
Declare @Price int
select @E_ID = Event_ID from inserted
select @T_ID = Ticket_ID from inserted
select @Transport =  Price from Transport where  Transport_ID = (select Transport_ID from [Event] where  Event_ID = (select Event_ID from inserted))
select @Food = Price from Cattering where  Cattering_ID = (select Cattering_ID from [Event] where  Event_ID = (select Event_ID from inserted))
select @Price = price from [Event] where Event_ID = (select Event_ID from inserted)
select @Total = @Food + @Price + @Transport
insert into Billing values(null,@E_ID,@T_ID,@Transport,@Food,null,@Total)
end

create trigger tr_User
on Staff
after insert
as begin
Declare @S_ID int
Declare @C_ID int
Declare @Type varchar(10)
Declare @Name Varchar(15)
Declare @Password Varchar(15)
select @S_ID = Staff_ID from Inserted
select @Type = 'Staff'
select @Name = User_Name from Inserted 
select @Password = Password from Inserted
insert into [User] values(@Type,@S_ID,null,@Name,@Password)
end

create trigger tr_Customer
on Customer
after insert
as begin
Declare @S_ID int
Declare @C_ID int
Declare @Type varchar(10)
Declare @Name Varchar(15)
Declare @Password Varchar(15)
select @C_ID = C_ID from Inserted
select @Type = 'Customer'
select @Name = User_Name from Inserted 
select @Password = Password from Inserted
insert into [User] values(@Type,null,@S_ID,@Name,@Password)
end