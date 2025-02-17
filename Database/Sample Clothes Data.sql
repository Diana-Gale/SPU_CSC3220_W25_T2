-- Insert Sample Clothing Items
INSERT INTO Clothing (name, type, color, size, brand, material, season, storage_location, condition, image_url)
VALUES 
('Black Hoodie', 'Top', 'Black', 'M', 'Nike', 'Cotton', 'Winter', 'Closet', 'Good', NULL),
('Blue Jeans', 'Bottom', 'Blue', 'L', 'Levi''s', 'Denim', 'All-season', 'Closet', 'Worn', NULL),
('White Sneakers', 'Shoes', 'White', '10', 'Adidas', 'Leather', 'All-season', 'Shoe Rack', 'New', NULL);

-- Insert Sample Outfits
INSERT INTO Outfits (outfit_name) 
VALUES ('Casual Outfit'), ('Winter Outfit');

-- Link Clothing to Outfits (Avoid Duplicates)
INSERT OR IGNORE INTO Outfit_Clothing (outfit_id, clothing_id) 
VALUES 
(1, 1),  
(1, 2),  
(2, 3);  

-- Insert Sample Usage Log (Tracking When Clothes Were Worn)
INSERT INTO UsageLog (clothing_id, date_worn) 
VALUES 
(1, DATE('2024-02-10')), 
(2, DATE('2024-02-15')), 
(3, DATE('2024-02-18'));

-- Insert Sample Wishlist Items
INSERT INTO Wishlist (name, color, size, brand, price, store, purchased) 
VALUES 
('Leather Jacket', 'Black', 'M', 'Zara', 89.99, 'Zara Store', 0),
('Running Shoes', 'Red', '10', 'Nike', 120.00, 'Nike Store', 1);
