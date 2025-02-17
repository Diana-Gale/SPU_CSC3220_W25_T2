-- Get all clothing items
SELECT * FROM Clothing;

-- Show all outfits with their clothing items
SELECT o.outfit_name, c.name AS clothing_item, c.color, c.size
FROM Outfit_Clothing oc
JOIN Outfits o ON oc.outfit_id = o.outfit_id
JOIN Clothing c ON oc.clothing_id = c.clothing_id;

-- Find most frequently worn clothing items
SELECT c.name, COUNT(ul.clothing_id) AS times_worn
FROM UsageLog ul
JOIN Clothing c ON ul.clothing_id = c.clothing_id
GROUP BY ul.clothing_id
ORDER BY times_worn DESC;

-- Find unworn clothing
SELECT name FROM Clothing 
WHERE clothing_id NOT IN (SELECT clothing_id FROM UsageLog);

-- Wishlist items not purchased yet
SELECT * FROM Wishlist WHERE purchased = 0;
