CREATE DATABASE BookShop;
GO
USE BookShop;
GO
CREATE TABLE Countries (
    Id INT PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
	[Language] NVARCHAR(50) NOT NULL 
);
CREATE TABLE Authors (
    Id INT PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL,
    Surname NVARCHAR(MAX) NOT NULL,
    CountryId INT,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);
CREATE TABLE Themes (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Publishers (
    Id INT PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);
CREATE TABLE Books (
    Id INT PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL,
    Pages INT NOT NULL CHECK (Pages >= 0),
    Price MONEY NOT NULL CHECK (Price >= 0),
    PublishDate DATE NOT NULL CHECK (PublishDate <= GETDATE()),
    PublisherId INT NOT NULL,
	AuthorId INT NOT NULL,
    ThemeId INT NOT NULL,
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id),
    FOREIGN KEY (ThemeId) REFERENCES Themes(Id),
	FOREIGN KEY (PublisherId) REFERENCES Publishers(Id)
);
CREATE TABLE Shops (
    Id INT PRIMARY KEY,
    Name NVARCHAR(MAX) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);
CREATE TABLE Sales (
    Id INT PRIMARY KEY,
    Price MONEY NOT NULL CHECK (Price >= 0),
    Quantity INT NOT NULL CHECK (Quantity >= 0),
    SaleDate DATE NOT NULL CHECK (SaleDate <= GETDATE()) DEFAULT GETDATE(),
    BookId INT NOT NULL,
    ShopId INT NOT NULL,
    FOREIGN KEY (BookId) REFERENCES Books(Id),
    FOREIGN KEY (ShopId) REFERENCES Shops(Id)
);
CREATE TABLE LeaderTable (
    Id INT PRIMARY KEY,
    Genre NVARCHAR(100) NOT NULL,
	BookId INT NOT NULL,
	ThemeId INT NOT NULL,
	FOREIGN KEY (BookId) REFERENCES Books(Id),
	FOREIGN KEY (ThemeId) REFERENCES Themes(Id)
);