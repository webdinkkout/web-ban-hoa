﻿USE hoa_yeu_thuong_db
GO

CREATE TABLE Roles (
  Id INT IDENTITY(1,1) PRIMARY KEY,
  Name NVARCHAR(100) NOT NULL,
  Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL,
);
GO

CREATE TABLE Users (
  Id INT PRIMARY KEY IDENTITY(1,1),
  First_Name NVARCHAR(50) NOT NULL,
  Last_Name NVARCHAR(50) NOT NULL,
  Email VARCHAR(255) UNIQUE NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Role_Id INT REFERENCES Roles(Id) DEFAULT(2) NOT NULL,
  Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO


CREATE TABLE Categories (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(100) NOT NULL,
  Seo_Name VARCHAR(100)NOT NULL UNIQUE,
  Thumbnail NVARCHAR(255) ,
  Parent_Id INT REFERENCES Categories(Id),
  Level INT DEFAULT(0),
  Url VARCHAR(MAX) DEFAULT('#'), 
  Created_At DATETIME2 DEFAULT(GETDATE()) NOT NULL,
  Updated_At DATETIME2 DEFAULT(GETDATE()) NOT NULL
);
GO

CREATE TABLE Products (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(100) NOT NULL,
  Seo_Name VARCHAR(100) NOT NULL UNIQUE,
  Description NVARCHAR(MAX),
  View_Count INT DEFAULT 0 NOT NULL,
  Old_Price DECIMAL(12, 2) DEFAULT(0) NOT NULL,
  Current_Price DECIMAL(12, 2) DEFAULT(0) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
  Sold INT NOT NULL DEFAULT 0,
  Thumbnail NVARCHAR(255) ,
  Created_At DATETIME2 DEFAULT(GETDATE()) NOT NULL,
  Updated_At DATETIME2 DEFAULT(GETDATE()) NOT NULL,

  Category_Id INT REFERENCES Categories(Id) NOT NULL
);
GO


CREATE TABLE Payment_Methods(
	Id INT IDENTITY(1,1) PRIMARY KEY,
	Name NVARCHAR(255) NOT NULL UNIQUE,
)
GO


CREATE TABLE Orders (
  Id INT PRIMARY KEY IDENTITY(1,1),
  User_Id INT REFERENCES Users(Id) NOT NULL,
  Delivery_Date DATETIME2 NOT NULL,
  Order_Date DATETIME2 NOT NULL DEFAULT GETDATE(),
  Payment_Method_Id INT REFERENCES Payment_Methods(Id) NOT NULL,
  Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO

CREATE TABLE Order_Details (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Order_Id INT REFERENCES Orders(Id) NOT NULL,
  Product_Id INT REFERENCES Products(Id) NOT NULL,
  Total_Price DECIMAL(12, 2) DEFAULT(0) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
  Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL,
  UNIQUE (Order_Id, Product_Id)
);
GO

CREATE TABLE Carts (
	Id INT PRIMARY KEY IDENTITY(1,1),
	User_Id INT REFERENCES Users(Id) NOT NULL,
	Product_Id INT REFERENCES Products(Id) NOT NULL,
	Quantity INT,
	Price DECIMAL(12,2) DEFAULT(0) NOT NULL,
	ToTal_Price DECIMAL(12,2) DEFAULT(0) NOT NULL,
);
GO