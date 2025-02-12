create schema Group2 
----------------------------
create table Group2.Admin
(
adminID int primary key,
loginID varchar(10),
userType varchar(15)
)
--------------------------
create table Group2.Customer
(
customerID int primary key,
loginID varchar(10),
customerName varchar(30),
customerAddress varchar(50),
customerTelephone varchar(12),
customerGender char,
customerDOB DateTime,
customerSmoking varchar(20),
customerHobbies varchar(20),
nomineeName varchar(30),
nomineeRelation varchar(20),
userType varchar(15)
)
-----------------------------
create table Group2.LoginCredentials
(
loginID varchar(10) primary key,
userpassword varchar(20),
userType varchar(15)
)

--drop table Group2.LoginCredentials

----------------------------------
create table Group2.InsuranceProduct
(
productID int primary key,
productName varchar(30),
productLine varchar(200)
)

--alter table Group2.InsuranceProduct drop column productName
--alter table Group2.InsuranceProduct alter column productLine varchar(30)


------------------------------------
create table Group2.Policy
(
policyNumber int primary key,
policyName varchar(30),
policyDetails varchar(200),
productID int FOREIGN KEY (productID) REFERENCES Group2.InsuranceProduct(productID)
)
----------------------------------
create table Group2.CustomerPolicyDetails
(
policyNumber int FOREIGN KEY (policyNumber) REFERENCES Group2.Policy(policyNumber),
customerID int FOREIGN KEY (customerID) REFERENCES Group2.Customer(customerID),
premiumFrequency varchar(20)
)
--------------------------------------
create table Group2.Endorsements
(
transactionID int identity(1000,1) primary key,
customerID int FOREIGN KEY (customerID) REFERENCES Group2.Customer(customerID),
policyNumber int FOREIGN KEY (policyNumber) REFERENCES Group2.Policy(policyNumber),
policyName varchar(30),
productName varchar(30),
productLine varchar(200),
customerName varchar(30),
customerAddress varchar(50),
customerTelephone varchar(12),
customerGender char,
customerDOB DateTime,
customerSmoking varchar(20),
nomineeName varchar(30),
nomineeRelation varchar(20),
premiumFrequency varchar(20)
)
------------------------------------------

insert into Group2.Admin values(8003,'ADM8003','ADMIN')

insert into Group2.Customer values(5002,'CUST5002','Maria S','Kolkata','9856274123','F','02/05/1992','Non-Smoker','Painting','Sarah S','Sister','CUSTOMER')

insert into Group2.LoginCredentials values('CUST5002','5002','CUSTOMER')

insert into Group2.InsuranceProduct values(2, 'Non-Life Insurance')

