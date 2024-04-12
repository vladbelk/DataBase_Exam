USE BookShop
GO
SELECT *
FROM Books
WHERE PageCount > 500 AND PageCount < 650;
SELECT *
FROM Books
WHERE LEFT(BookName, 1) IN ('A', 'Z');
SELECT *
FROM Books
WHERE Genre = 'Detective' AND SoldQuantity > 30;
SELECT *
FROM Books
WHERE BookName LIKE '%Microsoft%' AND BookName NOT LIKE '%Windows%';
SELECT CONCAT(BookName, ' - ', Genre, ' - ', AuthorFullName) AS BookInfo
FROM Books
WHERE PricePerPage < 0.65;
SELECT *
FROM Books
WHERE LENGTH(BookName) - LENGTH(REPLACE(BookName, ' ', '')) = 3;
SELECT
    B.BookName,
    B.Genre,
    B.AuthorFullName,
    S.Price,
    S.SoldQuantity,
    Sh.ShopName
FROM Sales S
JOIN Books B ON S.BookId = B.Id
JOIN Shops Sh ON S.ShopId = Sh.Id
WHERE
    B.BookName NOT LIKE '%A%'
    AND B.Genre <> 'Programming'
    AND B.AuthorFullName <> 'Herbert Schildt'
    AND S.Price BETWEEN 10 AND 20
    AND S.SoldQuantity >= 8
    AND Sh.Country NOT IN ('Ukraine', 'Russia');
SELECT
    'Number of Authors' AS Info,
    COUNT(DISTINCT AuthorFullName) AS Value
FROM Books
UNION ALL
SELECT
    'Number of Books',
    COUNT(*)
FROM Books
UNION ALL
SELECT
    'Average Sale Price',
    ROUND(AVG(Price), 2)
FROM Sales
UNION ALL
SELECT
    'Average Page Count',
    ROUND(AVG(PageCount), 2)
FROM Books;
SELECT Genre, SUM(PageCount) AS TotalPages
FROM Books
GROUP BY Genre;
SELECT
    AuthorFullName,
    COUNT(*) AS TotalBooks,
    SUM(PageCount) AS TotalPages
FROM Books
GROUP BY AuthorFullName;
SELECT *
FROM Books
WHERE Genre = 'Програмування'
ORDER BY PageCount DESC
LIMIT 1;
SELECT Genre, AVG(PageCount) AS AvgPages
FROM Books
GROUP BY Genre
HAVING AvgPages <= 400;
SELECT Genre, SUM(PageCount) AS TotalPages
FROM Books
WHERE PageCount > 400
  AND Genre IN ('Programming', 'Administration', 'Design')
GROUP BY Genre;
SELECT
    S.SaleInfo,
    Sh.ShopName,
    Sh.Location,
    Sh.Manager,
    S.SaleDate,
    S.QuantitySold
FROM Sales S
JOIN Shops Sh ON S.ShopId = Sh.Id;
SELECT ShopName, SUM(Price * SoldQuantity) AS TotalRevenue
FROM Sales S
JOIN Books B ON S.BookId = B.Id
JOIN Shops Sh ON S.ShopId = Sh.Id
GROUP BY ShopName
ORDER BY TotalRevenue DESC
LIMIT 1;
