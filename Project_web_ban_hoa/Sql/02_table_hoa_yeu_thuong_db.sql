USE hoa_yeu_thuong_db
GO

CREATE TABLE Roles (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(50) NOT NULL,
  Seo_Name VARCHAR(50) NOT NULL,
  Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO

CREATE TABLE Users (
  Id INT PRIMARY KEY IDENTITY(1,1),
  First_Name NVARCHAR(50) NOT NULL,
  Last_Name NVARCHAR(50) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  Password VARCHAR(255) NOT NULL,
  Role_Id INT REFERENCES Roles(Id) NOT NULL,
   Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO


CREATE TABLE Categories (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(50) NOT NULL,
  Seo_Name VARCHAR(50) NOT NULL,
  Thumbnail NVARCHAR(255) NOT NULL,
   Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO

CREATE TABLE Products (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Name NVARCHAR(100) NOT NULL,
  Seo_Name VARCHAR(50) NOT NULL,
  Description NVARCHAR(500) NOT NULL,
  View_Count INT DEFAULT 0 NOT NULL,
  Old_Price DECIMAL(12, 2) NOT NULL,
  Current_Price DECIMAL(12, 2) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
  Sold INT NOT NULL DEFAULT 0,
  Thumbnail NVARCHAR(255) NOT NULL,
   Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL,

  Category_Id INT REFERENCES Categories(Id) NOT NULL
);
GO


CREATE TABLE Orders (
  Id INT PRIMARY KEY IDENTITY(1,1),
  User_Id INT REFERENCES Users(Id) NOT NULL,
  Order_Date DATETIME2 NOT NULL DEFAULT GETUTCDATE(),
   Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO

CREATE TABLE Order_Details (
  Id INT PRIMARY KEY IDENTITY(1,1),
  Order_Id INT REFERENCES Orders(Id) NOT NULL,
  Product_Id INT REFERENCES Products(Id) NOT NULL,
  Price DECIMAL(12, 2) NOT NULL,
  Quantity INT NOT NULL DEFAULT 0,
   Created_At datetime2 DEFAULT(getdate()) NOT NULL,
  Updated_At datetime2 DEFAULT(getdate()) NOT NULL
);
GO

