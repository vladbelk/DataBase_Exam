USE BookShop
GO
INSERT INTO Countries (Id, name, language)
VALUES
    (1, 'Ukraine', 'Ukrainian'),
    (2, 'United States', 'English'),
    (3, 'France', 'French'),
    (4, 'Germany', 'German'),
    (5, 'Japan', 'Japanese'),
    (6, 'Spain', 'Spanish'),
    (7, 'Italy', 'Italian'),
    (8, 'China', 'Chinese'),
    (9, 'Brazil', 'Portuguese'),
    (10, 'India', 'Hindi');
INSERT INTO Authors (Id, Name, Surname, CountryId)
VALUES
    ( 'John', 'Smith', 1),
    ( 'Maria', 'Garc?a', 2),
    ( 'Hans', 'M?ller', 3),
    ( 'Yuki', 'Tanaka', 4),
    ( 'Sophie', 'Dupont', 5),
    ( 'Luigi', 'Rossi', 6),
    ( 'Chen', 'Wei', 7),
    ( 'Ana', 'Silva', 8),
    ( 'Rajesh', 'Patel', 9),
    ( 'Olga', 'Petrova', 10);
INSERT INTO Themes (Id, Name)
VALUES
    ('Adventure'),
    ('Mystery'),
    ('Science Fiction'),
    ('Fantasy'),
    ('Romance'),
    ('Horror'),
    ('Thriller'),
    ('Biography'),
    ('History'),
    ('Poetry');
INSERT INTO Publishers (Id, Name, CountryId)
VALUES
    ('Inkwell Publishing', 1),
    ('Luminary Books', 2),
    ('Quill Press', 3),
    ('Papyrus Publications', 4),
    ('Storyteller Media', 5),
    ('Chronicle House', 6),
    ('Novel Nexus', 7),
    ('Literary Lantern', 8),
    ('Verse Ventures', 9),
    ('Prose Palace', 10);
INSERT INTO Books (Id, Name, Pages, Price, PublishDate, PublisherId, AuthorId, ThemeId)
VALUES
    ('The Quest for the Lost City', 300, 25.99, '2022-02-02', 1, 1, 1),
    ('Whispers in the Shadows', 250, 15.99, '2022-03-03', 2, 2, 2),
    ('Galactic Odyssey', 400, 30.00, '2022-04-04', 3, 3, 3),
    ('Realm of Enchantment', 350, 20.50, '2022-05-05', 4, 4, 4),
    ('Loves Eternal Dance', 280, 18.75, '2022-06-06', 5, 5, 5),
    ('Nightmare Chronicles', 320, 22.80, '2022-07-07', 6, 6, 6),
    ('Edge of Suspense', 270, 17.25, '2022-08-08', 7, 7, 7),
    ('Biography of a Visionary', 400, 28.50, '2022-09-09', 8, 8, 8),
    ('Chronicles of History', 380, 26.00, '2022-10-10', 9, 9, 9),
    ('Verses of the Soul', 220, 15.00, '2022-11-11', 10, 10, 10);
INSERT INTO Shops (Id, Name, CountryId)
VALUES
    ('Crafty Corner', 1),
    ('Fashion Fusion', 2),
    ('Sweet Delights Bakery', 3),
    ('Bookworm’s Haven', 4),
    ('Fresh and Fit Grocery', 5),
    ('The Artisan’s Workshop', 6),
    ('Urban Treasures', 7),
    ('Vintage Vista', 8),
    ('MystiKraft', 9),
    ('Serene Harbor', 10);
INSERT INTO Sales (Id, Price, Quantity, SaleDate, BookId, ShopId)
VALUES
    (25.99, 5, '2022-02-02', 1, 1),
    (15.99, 3, '2022-03-03', 2, 2),
    (30.00, 4, '2022-04-04', 3, 3),
    (18.75, 2, '2022-05-05', 4, 4),
    (22.80, 3, '2022-06-06', 5, 5),
    (17.25, 1, '2022-07-07', 6, 6),
    (28.50, 4, '2022-08-08', 7, 7),
    (26.00, 3, '2022-09-09', 8, 8),
    (15.00, 2, '2022-10-10', 9, 9),
    (20.00, 2, '2022-11-11', 10, 10);
INSERT INTO LeaderTable (Id, Genre, BookId, ThemeId)
VALUES
    ('Fantasy', 1, 1),
    ('Science Fiction', 2, 2),
    ('Mystery', 3, 3),
    ('Romance', 4, 4),
    ('Thriller', 5, 5),
    ('Historical Fiction', 6, 6),
    ('Adventure', 7, 7),
    ('Biography', 8, 8),
    ('Self-Help', 9, 9),
    ('Poetry', 10, 10);
