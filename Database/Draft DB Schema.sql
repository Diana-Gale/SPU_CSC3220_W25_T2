-- Clothing Table
CREATE TABLE Clothing (
    clothing_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    type TEXT CHECK(type IN ('Top', 'Bottom', 'Shoes', 'Accessory', 'Outerwear')),
    color TEXT,
    size TEXT,
    brand TEXT,
    material TEXT,
    season TEXT,
    storage_location TEXT,
    condition TEXT CHECK(condition IN ('New', 'Good', 'Worn', 'Needs Repair')),
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Outfits Table
CREATE TABLE Outfits (
    outfit_id INTEGER PRIMARY KEY AUTOINCREMENT,
    outfit_name TEXT NOT NULL
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
    date_worn DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (clothing_id) REFERENCES Clothing(clothing_id) ON DELETE CASCADE
);

-- Wishlist Table
CREATE TABLE Wishlist (
    wishlist_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    color TEXT,
    size TEXT,
    brand TEXT,
    price DECIMAL(10,2),
    store TEXT,
    purchased BOOLEAN DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
