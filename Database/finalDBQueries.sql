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
