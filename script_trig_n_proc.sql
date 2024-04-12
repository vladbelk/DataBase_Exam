USE BookShop
Go
CREATE TRIGGER AuditSalaryChange
ON Employees
AFTER UPDATE
AS
BEGIN
    INSERT INTO SalaryAudit (EmployeeId, OldSalary, NewSalary, ChangeDate)
    SELECT Id, Salary, INSERTED.Salary, GETDATE()
    FROM Employees
    WHERE Salary <> INSERTED.Salary;
END;
CREATE TRIGGER EnforceMaxPageCount
ON Books
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @MaxPageCount INT = 1000;
    IF EXISTS (SELECT 1 FROM INSERTED WHERE PageCount > @MaxPageCount)
        RAISEERROR ('Page count exceeds maximum allowed.', 16, 1);
    ELSE
        INSERT INTO Books (Id, BookName, PageCount, ...)
        SELECT Id, BookName, PageCount, ...
        FROM INSERTED;
END;
CREATE TRIGGER NotifyNewBook
ON Books
AFTER INSERT
AS
BEGIN
    EXEC sp_send_dbmail
        @profile_name = 'YourMailProfile',
        @recipients = 'admin@example.com',
        @subject = 'New Book Added',
        @body = 'A new book has been added to the database.';
END;
CREATE TRIGGER UpdateTotalPagesForThemes
ON Books
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    UPDATE Themes
    SET TotalPages = (SELECT SUM(PageCount) FROM Books WHERE ThemeId = Themes.Id)
    WHERE EXISTS (SELECT 1 FROM INSERTED WHERE ThemeId = Themes.Id)
        OR EXISTS (SELECT 1 FROM DELETED WHERE ThemeId = Themes.Id);
END;
CREATE TRIGGER EnforceReferentialIntegrity
ON Sales
INSTEAD OF INSERT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Books WHERE Id = INSERTED.BookId)
        OR NOT EXISTS (SELECT 1 FROM Shops WHERE Id = INSERTED.ShopId)
        RAISEERROR ('Invalid book or shop ID.', 16, 1);
    ELSE
        INSERT INTO Sales (Id, Price, Quantity, SaleDate, BookId, ShopId)
        SELECT Id, Price, Quantity, SaleDate, BookId, ShopId
        FROM INSERTED;
END;
CREATE PROCEDURE GetBooksByGenre
    @Genre NVARCHAR(100)
AS
BEGIN
    SELECT BookName, AuthorFullName
    FROM Books
    WHERE Genre = @Genre;
END;
CREATE PROCEDURE CalculateTotalRevenue
    @ShopId INT
AS
BEGIN
    SELECT SUM(Price * SoldQuantity) AS TotalRevenue
    FROM Sales
    WHERE ShopId = @ShopId;
END;
CREATE PROCEDURE UpdateBookPrice
    @BookId INT,
    @NewPrice MONEY
AS
BEGIN
    UPDATE Books
    SET Price = @NewPrice
    WHERE Id = @BookId;
END;
CREATE PROCEDURE DeleteOldSales
    @ThresholdDate DATE
AS
BEGIN
    DELETE FROM Sales
    WHERE SaleDate < @ThresholdDate;
END;
CREATE PROCEDURE GetTopSellingBooks
    @TopN INT
AS
BEGIN
    SELECT TOP (@TopN) BookName, SoldQuantity
    FROM Books
    ORDER BY SoldQuantity DESC;
END;
