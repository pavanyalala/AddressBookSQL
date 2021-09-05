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

/*UC-7*/

Select Count(City) as 'NumberOfContacts' from AddressBook Where City='Hyderabad' Group by City

/*UC-8*/

Select * From AddressBook Where City='Hyderabad' Order by FirstName
 
/*UC-9*/

Alter Table AddressBook 
Add AddressBookName varchar(30), AddressBookType varchar(30)

Update AddressBook set AddressBookName='Family AddressBook', AddressBookType='Family' Where FirstName='Bunny'
Update AddressBook set AddressBookName='Friend AddressBook', AddressBookType='Friend' Where FirstName='Sunny'
Update AddressBook set AddressBookName='Proffesion AddressBook', AddressBookType='Proffesion' Where FirstName='Bunty'

/*UC-10*/

Select Count(AddressBookType)As 'NumberOfContacts' From AddressBook Where AddressBookType='Family'

Select Count(AddressBookType)As 'NumberOfContacts' From AddressBook Where AddressBookType='Friend'

Select Count(AddressBookType)As 'NumberOfContacts' From AddressBook Where AddressBookType='Proffesion'

/*UC-11*/

Insert into AddressBook values
('Funny', 'XYZ', 'Kothapet', 'Hyderabad', 'Telangana', '500085', '4444444444', 'funny@gmail', 'Friend AddressBook', 'Friend'),
('Honey', 'ZYX', 'Kokapet', 'Hyderabad', 'Telangana', '500036', '5555555555', 'honey@gmail', 'Family AddressBook', 'Family')

/*UC-12*/

Create Table ContactType
(
ContactTypeId int not null Identity(1,1) Primary key,
ContactTypeName varchar(30) not null
)

Insert Into ContactType values
('Family'),
('Friend'),
('Profession')

select * from ContactType

Create Table Address
(
AddressId int not null Identity(1,1) Primary key,
Address varchar(50) not null,
City varchar(20) not null,
State varchar(20) not null,
Zip bigint  not null
)

select * from Address

Insert Into Address values
('Dammaiguda','HYD','TS','500085'),
('Nagole','HYD','TS','500068'),
('Uppal','HYD','TS','500065')

Create Table ContactDetails
(
ContactId int not null Identity(1,1) primary key,
FirstName varchar(20) not null,
LastName varchar(20) not null,
PhoneNumber bigint not null,
Email varchar(50) not null,
AddressId int not null Foreign Key References Address(AddressId),
ContactTypeId int not null Foreign key References ContactType(ContactTypeId)
)

Insert Into ContactDetails values
('Bunny','ABC','9988774455','bunny@gmail,com','1','1'),
('Sunny','BCD','1122334455','Sunny@gmail,com','2','2'),
('Bunty','XYZ','4545454545','bunty@gmail,com','3','3')

select * from ContactDetails

Select * From ContactDetails cd, Address a, ContactType ct
Where cd.AddressId=a.AddressId And cd.ContactTypeId=ct.ContactTypeId

/*UC-13*/

Select * From ContactDetails
Join Address                                                         
on ContactDetails.AddressId=Address.AddressId
Where City='Nagole' or State='TS'

Select Count(FirstName) as 'NumberOfContacts' from ContactDetails
Join Address 
on ContactDetails.AddressId=Address.AddressId 
Where City='Hyd' Group by City

Select Count(FirstName) as 'NumberOfContacts' from ContactDetails
Join Address 
on ContactDetails.AddressId=Address.AddressId
Where State='TS' Group by State

Select * From ContactDetails 
Join Address 
on ContactDetails.AddressId=Address.AddressId                                 
Where City='Hyd' Order by FirstName 

Select Count(FirstName) as 'NumberOfContacts' from ContactDetails
Join ContactType 
on ContactDetails.ContactTypeId=ContactType.ContactTypeId                    
Where ContactTypeName='Friend' Group by ContactTypeName