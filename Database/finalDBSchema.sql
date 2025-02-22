-- Users Table (For ownership and tracking purposes)
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Clothing Table
CREATE TABLE Clothing (
    clothing_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    name TEXT NOT NULL,
    type TEXT,
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    season TEXT,
    storage_location TEXT,
    condition TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Outfits Table
CREATE TABLE Outfits (
    outfit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    outfit_name TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Outfit-Clothing Relationship Table
CREATE TABLE Outfit_Clothing (
    outfit_id INTEGER,
    clothing_id INTEGER,
    PRIMARY KEY (outfit_id, clothing_id),
    FOREIGN KEY (outfit_id) REFERENCES Outfits(outfit_id) ON DELETE CASCADE,
    FOREIGN KEY (clothing_id) REFERENCES Clothing(clothing_id) ON DELETE CASCADE
);

-- Usage Log Table
CREATE TABLE UsageLog (
    log_id INTEGER PRIMARY KEY AUTOINCREMENT,
    clothing_id INTEGER,
    user_id INTEGER,
    date_worn DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (clothing_id) REFERENCES Clothing(clothing_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- Wishlist Table
CREATE TABLE Wishlist (
    wishlist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    name TEXT NOT NULL,
    color TEXT,
    size TEXT,
    brand TEXT,
    price DECIMAL(10,2),
    store TEXT,
    purchased BOOLEAN DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

-- SQL Queries

-- 1. SELECT statement joining two tables with a WHERE clause
SELECT c.name, c.type, o.outfit_name 
FROM Clothing c 
JOIN Outfit_Clothing oc ON c.clothing_id = oc.clothing_id
JOIN Outfits o ON oc.outfit_id = o.outfit_id
WHERE c.color = 'Black';

-- 2. Transaction: UPDATE multiple rows and related tables
BEGIN TRANSACTION;
UPDATE Clothing 
SET condition = 'Worn', storage_location = 'Wardrobe' 
WHERE clothing_id IN (1, 2);
UPDATE UsageLog 
SET date_worn = CURRENT_DATE 
WHERE clothing_id IN (1, 2);
COMMIT;

-- 3. Transaction: INSERT new row and related records
BEGIN TRANSACTION;
INSERT INTO Clothing (user_id, name, type, color, size, brand, material, season, condition) 
VALUES (1, 'New Jacket', 'Outerwear', 'Blue', 'M', 'Nike', 'Polyester', 'Winter', 'New');
INSERT INTO UsageLog (clothing_id, user_id) 
VALUES (LAST_INSERT_ROWID(), 1);
COMMIT;

-- 4. Transaction: DELETE a row and cascade related records
BEGIN TRANSACTION;
DELETE FROM Clothing WHERE clothing_id = 3;
COMMIT;
