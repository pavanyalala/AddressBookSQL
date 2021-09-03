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

/*UC-3*/

Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Bunny', 'ABC', 'Dammiguda', 'Hyderabad', 'Telangana', '500083', '1111111111', 'bunny@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Sunny', 'CBA', 'Ecil', 'Hyderabad', 'Telangana', '500083', '2222222222', 'sunny@gmail.com')
Insert into AddressBook (FirstName,LastName,Address,City,State,Zip,PhoneNumber,Email) values('Bunty', 'ABCD', 'Nagole', 'Hyderabad', 'Telangana', '500068', '3333333333', 'bunty@gmail.com')

/*UC-4*/

Update AddressBook Set Address='Ecil' Where FirstName='Bunny'
Update AddressBook Set Address='Dammiguda' Where FirstName='Sunny'
Update AddressBook Set Address='OldCity' Where FirstName='Bunty'

/*UC-5*/

Delete from AddressBook Where FirstName='Bunty'

/*UC-6*/

Select * From AddressBook Where City='Hyderabad' or State='Telangana'
