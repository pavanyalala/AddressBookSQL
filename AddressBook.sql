/*UC-1*/
Create Database AddressBookSystem

/*UC-2*/
Create Table AddressBook(
ContactId int identity(1,1) Primary Key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
Address varchar(50) not null, 
City varchar(20) not null,
State varchar(20) not null,
Zip bigint not null ,
PhoneNumber bigint not null,
Email varchar(20)not null
)
Select * From AddressBook