create database e_commercedb;

use e_commercedb;

-- Creating the tables

-- Product category table
create table productCategory(
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName varchar(255),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Status enum('active', 'inactive')
);

-- Products table
create table products(
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(255),
    categoryID INT,
    brandID,
    price decimal,
    stockQuantity INT,
    reorderLevel INT,
    barcode varchar(100),
    productWeight decimal(10, 2),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    imageUrl varchar(255),
    FOREIGN KEY (categoryID) REFERENCES productCategory(categoryID),
    FOREIGN KEY (brandID) REFERENCES brand(brandID)
);

-- Product item table
create table productItem(
    itemID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    batchNumber varchar(100),
    serialNumber varchar(100),
    colorID INT,
    quantity_On_Hand INT,
    costPrice decimal(10, 2),
    salePrice decimal(10, 2),
    expiryDate date,
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status enum('Available', 'Reserved', 'Sold', 'Inactive'),
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (colorID) REFERENCES colors(colorID)

);

-- Brand table
create table brand(
    brandID INT AUTO_INCREMENT PRIMARY KEY,
    brandName varchar(255),
    brandDescription text,
    country_Of_Origin varchar(100),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Product variation table
create table productVariation(
    variationID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    variationName varchar(255),
    colorID INT,
    size varchar(50),
    material varchar(100),
    style varchar(100),
    price decimal(10, 2),
    stockQuantity INT,
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive'),
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (colorID) REFERENCES colors(colorID)
);

-- Size category table
create table sizeCategory(
    sizeCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    sizeCategoryName varchar(100),
    unit varchar(50),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive')
);

-- Size option table
create table sizeOption(
    sizeID INT AUTO_INCREMENT PRIMARY KEY,
    sizeCategoryID INT,
    sizeLabel varchar(50),
    sizeValue decimal(10, 2),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive'),
    FOREIGN KEY (sizeCategoryID) REFERENCES sizeCategory(sizeCategoryID)
);

-- Product image table
create table productImage(
    imageID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT,
    variationID INT,
    imageURL varchar(255),
    altText varchar(255),
    isPrimary boolean,
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive'),
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (variationID) REFERENCES productVariation(variationID)
);

-- Color table
create table colors(
    colorID INT AUTO_INCREMENT PRIMARY KEY,
    colorName varchar(100),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive')
);

-- Product attribute table
create table productAttribute(
    attributeID INT AUTO_INCREMENT PRIMARY KEY,
    attributeName varchar(100),
    unit varchar(50),
    isVariant boolean,
    attributeCategoryID INT,
    attributeTypeID INT,
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive'),
    FOREIGN KEY (attributeCategoryID) REFERENCES attributeCategory(attributeCategoryID),
    FOREIGN KEY (attributeTypeID) REFERENCES attributeType(attributeTypeID)

);

-- Attribute category table
create table attributeCategory(
    attributeCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName varchar(100),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive')
);

-- Attribute type table
create table attributeType(
    attributeTypeID INT AUTO_INCREMENT PRIMARY KEY,
    typeName varchar(100),
    createdAt timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedAt timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    status ENUM('Active', 'Inactive')
);

-- Insert into tables commands
-- Inserting sample product categories with their statuses
INSERT INTO productCategory (categoryName, Status) 
VALUES 
('Electronics', 'active'),
('Clothing', 'active'),
('Furniture', 'inactive');

-- Inserting sample brands with their descriptions and country of origin
INSERT INTO brand (brandName, brandDescription, country_Of_Origin) 
VALUES 
('Samsung', 'Leading electronics brand', 'South Korea'),
('Nike', 'Sportswear and footwear brand', 'USA'),
('Ikea', 'Furniture and home goods brand', 'Sweden');

-- Inserting products with their category, brand, price, stock, and image URL
INSERT INTO products (productName, categoryID, brandID, price, stockQuantity, reorderLevel, barcode, productWeight, imageUrl)
VALUES 
('Samsung Galaxy S21', 1, 1, 799.99, 50, 10, '123456789012', 0.169, 'https://example.com/galaxy_s21.jpg'),
('Nike Air Max', 2, 2, 129.99, 100, 20, '987654321098', 0.5, 'https://example.com/nike_air_max.jpg');

-- Inserting product items with batch number, serial number, color, stock quantity, cost and sale price
INSERT INTO productItem (productID, batchNumber, serialNumber, colorID, quantity_On_Hand, costPrice, salePrice, expiryDate, status)
VALUES 
(1, 'BATCH001', 'SN12345', 1, 25, 699.99, 799.99, '2025-12-31', 'Available'),
(2, 'BATCH002', 'SN54321', 2, 50, 100.00, 129.99, '2025-06-30', 'Available');

-- Inserting product variations with details like color, size, material, price, and status
INSERT INTO productVariation (productID, variationName, colorID, size, material, style, price, stockQuantity, status)
VALUES 
(1, 'Galaxy S21 128GB', 1, 'Medium', 'Glass', 'Modern', 799.99, 30, 'Active'),
(2, 'Nike Air Max 10', 2, 'Large', 'Leather', 'Sporty', 129.99, 70, 'Active');

-- Inserting size categories for different product types
INSERT INTO sizeCategory (sizeCategoryName, unit, status)
VALUES 
('Shoe Size', 'US', 'Active'),
('Phone Storage', 'GB', 'Active');

-- Inserting size options for products based on size categories
INSERT INTO sizeOption (sizeCategoryID, sizeLabel, sizeValue, status)
VALUES 
(1, 'Size 10', 10, 'Active'),
(2, '128GB', 128, 'Active');

-- Inserting product images with URL, alt text, and primary status
INSERT INTO productImage (productID, variationID, imageURL, altText, isPrimary, status)
VALUES 
(1, 1, 'https://example.com/galaxy_s21_1.jpg', 'Samsung Galaxy S21 Front View', TRUE, 'Active'),
(2, 2, 'https://example.com/nike_air_max_1.jpg', 'Nike Air Max Side View', TRUE, 'Active');

-- Inserting color options for products
INSERT INTO colors (colorName, status)
VALUES 
('Black', 'Active'),
('White', 'Inactive'); 

-- Inserting product attributes (e.g., weight, storage) with category and type information
INSERT INTO productAttribute (attributeName, unit, isVariant, attributeCategoryID, attributeTypeID, status)
VALUES 
('Weight', 'kg', FALSE, 1, 1, 'Active'),
('Storage Capacity', 'GB', TRUE, 2, 2, 'Active'); 

-- Inserting attribute categories for product characteristics
INSERT INTO attributeCategory (categoryName, status)
VALUES 
('Dimensions', 'Active'),
('Tech Specifications', 'Active'); 

-- Inserting attribute types for defining the nature of attributes (numeric or text)
INSERT INTO attributeType (typeName, status)
VALUES 
('Numeric', 'Active'),
('Text', 'Inactive');  