

use Gravity_Books_DWH;


drop table Fact_Books

create table Fact_Books(
Fact_sk int IDENTITY(1,1)  primary key,

Book_sk int not null,
Customer_sk_fk int not null,
Status_History_sk_fk int not null,
dest_address_sk int not null,
Date_sk int not null,
Time_sk int not null,

Order_DD int not null,
line_DD int not null,

order_date datetime,
price decimal(5,2),
ship_cost decimal(6,2) ,

total decimal(7,2),

ssn int,


)
 ---------------------------------------------------------------
drop table Dim_Book

create table Dim_Book(
Book_sk int  IDENTITY(1,1) primary key,

book_bk int not null,
title varchar(400),
isbn13 varchar(13),
num_pages int,
publication_date date,

language_bk int not null,
language_code varchar(8)  ,
language_name   varchar(50) ,

publisher_bk int not null,
publisher_name nvarchar(1000) ,

ssn int,
iscurrent int ,
st_date date,
end_date date

)

 ---------------------------------------------------------------
drop table Book_Author

create table Book_Author(
book_bk int not null ,
author_id_fk int not null

)
 ---------------------------------------------------------------
drop table Author

create table Author(
author_id int primary key,
author_name varchar(400)
)

 ---------------------------------------------------------------
drop table Dim_Status_History

create table Dim_Status_History
(
Status_History_sk int  IDENTITY(1,1) primary key,
Order_bk int not null,
Order_status_bk int not null,
Order_status_value varchar(20),

status_date datetime,


)

 ---------------------------------------------------------------
drop table Dim_Customer

create table Dim_Customer(
Customer_sk int  IDENTITY(1,1) primary key,

Customer_bk int not null,
first_name varchar(200),
last_name varchar(200),
email varchar(350),

ssn int,
iscurrent int ,
st_date date,
end_date date

)

 ---------------------------------------------------------------
drop table Customer_address

create table Customer_address
(
customer_bk int not null ,
address_bk int not null,
status_id int,
address_status varchar(30)


)

 ---------------------------------------------------------------
drop table Dim_address

create table Dim_address(
dest_address_sk int  IDENTITY(1,1) primary key,

address_bk int not null,
street_number varchar(10),
street_name varchar(200),
city varchar(100),
country_id int,
country_name varchar(200),

ssn int,
iscurrent int ,
st_date date,
end_date date

)







drop table DummyTest
create table DummyTest
(
Fact_sk int IDENTITY(1,1)  primary key,

Book_sk int not null,
Customer_sk_fk int not null,
Status_History_sk_fk int not null,
dest_address_sk int not null,
Date_sk int not null,
Time_sk int not null,

Order_DD int not null,
line_DD int not null,

order_date datetime,
price decimal(5,2),
ship_cost decimal(6,2) ,

total decimal(7,2),

ssn int,

)




-- update

ALTER TABLE Dim_Status_History
ALTER COLUMN History_bk INT NULL;
ALTER TABLE Dim_Status_History
ALTER COLUMN Order_status_bk INT NULL;

ALTER TABLE  Fact_Books
ADD Created_at datetime;

Alter Table Fact_Books
ADD ship_method_DD int ,
ship_method_name_DD varchar(100)

ALTER TABLE Dim_Status_History
DROP COLUMN ship_method_name, ship_method_bk;

ALTER TABLE  Fact_Books
ALTER COLUMN Status_History_sk_fk INT Null;

ALTER TABLE  DummyTest
ALTER COLUMN Status_History_sk_fk INT Null;