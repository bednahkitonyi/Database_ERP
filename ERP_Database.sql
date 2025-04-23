create database e_commercedb;

use e_commercedb;

-- Creating the tables

-- Products table
create table products(
    productID INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(255), 
    categoryID INT, 
    supplierID INT, 
    price decimal, 
    stockQuantity INT, 
    reorderLevel INT, 
    barcode varchar(100), 
    productWeight decimal,
    createdAt timestamp,
    updatedAt timestamp, 
    imageUrl varchar(255));

-- Product category table
create table productCategory(
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    categoryName varchar(255), 
    createdAt timestamp, 
    updatedAt timestamp, 
    Status enum('active', 'inactive'));

-- Product item table
create table  productItem(
    itemID INT AUTO_INCREMENT PRIMARY KEY, 
    productID INT, 
    batchNumber	varchar(100), 
    serialNumber varchar(100), 
    color varchar(50),
    quantity_On_Hand INT, 
    costPrice decimal,
    salePrice decimal, 
    expiryDate date,
    createdAt timestamp, 
    updatedAt timestamp, 
    status enum('Available', 'Reserved', 'Sold', 'Inactive'));

-- Brand table
create table brand(
    brandID INT AUTO_INCREMENT PRIMARY KEY, 
    brandName varchar(255), 
    brandDescription text, 
    country_Of_Origin varchar(100), 
    createdAt timestamp, 
    updatedAt timestamp);

-- Product variation table 
create table productVariation(
    variationID INT AUTO_INCREMENT PRIMARY KEY, 
    productID INT, 
    variationName varchar(255),
    color varchar(50),
    size varchar(50),
    material varchar(100),
    style varchar(100),
    price decimal(10, 2), 
    stockQuantity INT,
    createdAt timestamp, 
    updatedAt timestamp,
    status ENUM('Active', 'Inactive'));

-- Size category table
create table sizeCategory(
    sizeCategoryID INT AUTO_INCREMENT PRIMARY KEY,
    sizeCategoryName varchar(100), 
    unit varchar(50),
    createdAt timestamp,
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Size option table
create table  sizeOption(
    sizeID INT AUTO_INCREMENT PRIMARY KEY, 
    sizeCategoryID INT, 
    sizeLabel varchar(50),
    sizeValue decimal,
    createdAt timestamp, 
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Product image table
create table productImage(
    imageID INT AUTO_INCREMENT PRIMARY KEY,
    productID INT, 
    variationID INT,
    imageURL varchar(255), 
    altText varchar(255), 
    isPrimary boolean,
    createdAt timestamp, 
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Color table
create table color(
    colorID INT AUTO_INCREMENT PRIMARY KEY, 
    colorName varchar(100),
    createdAt timestamp, 
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Product attribute table
create table productAttribute(
    attributeID INT AUTO_INCREMENT PRIMARY KEY, 
    attributeName varchar(100), 
    unit varchar(50), 
    isVariant boolean, 
    createdAt timestamp,
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Attribute category table
create table  attributeCategory(
    attributeCategoryID	INT AUTO_INCREMENT PRIMARY KEY, 
    categoryName varchar(100), 
    createdAt timestamp, 
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- Attribute type table
create table attributeType (
    attributeTypeID INT AUTO_INCREMENT PRIMARY KEY, 
    typeName varchar(100), 
    createdAt timestamp, 
    updatedAt timestamp, 
    status ENUM('Active', 'Inactive'));

-- inserting sample data into the product table
insert into products(productName,categoryID,supplierID,price,stockQuantity,reorderLevel, barcode,productWeight,createdAt,updatedAt,imageUrl)
values("Wireless Mouse", 223, 1112,125.50, 678, 100, 12354645,0.05,"2024-12-01 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/wireless_mouse_front.jp"),
("Bluetooth Headphones", 123, 1212,150.50, 1000, 250, 11354745,0.5,"2024-12-01 11:00:00", "2025-01-16 08:30:00", "	https://cdn.example.com/products/wireless_mouse_side.jpg"),
("Cotton T-Shirt", 234, 5612,25.50, 800, 150, 12358945,0.005,"2024-12-06 10:00:00", "2025-01-19 08:30:00","https://cdn.example.com/products/tshirt_white_front.jpg"),
("Laptop Backpack", 456, 4567,80.50, 300, 50, 11235464,0.80,"2025-02-01 10:00:00", "2025-01-20 08:30:00","https://cdn.example.com/products/backpack_open.jpg"),
("LED Desk Lamp", 345, 5678,400.00, 457, 120, 14364645,1.00,"2024-12-11 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/desk_lamp_angle.jpg"),
("Bread", 567, 5678,11.50, 356, 50, 112345,0.65,"2024-12-01 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/bread_packaged.jpg");

-- -- inserting sample data into the product_category table

insert into productCategory(categoryName,createdAt, updatedAt, status)
values("Electronics","	2024-12-01 10:00:00","2025-01-01 10:00:00","Active"),
("Computer Accessories", "2024-12-01 10:05:00","2025-01-01 10:05:00","Active"),
("Audio Equipment","2024-12-01 10:10:00", "2025-01-01 10:10:00","Active"),
("Clothing","2024-12-01 11:15:00","2025-01-01 11:00:00","Active"),
("Backpacks & Bags","2024-12-01 11:15:00","2025-01-01 11:15:00","Active"),
("Home & Lighting","2024-12-01 11:30:00","2025-01-01 11:30:00","Active"),
("Food & Bakery", "2024-12-01 11:45:00","2025-01-01 11:45:00","Active");

-- inserting sample data into the productitem table
insert into productItem(productID, batchNumber, serialNumber, color, quantity_On_Hand, costPrice, salePrice, expiryDate, createdAt,updatedAt, status)
values(1, "B-WM-2025-01", "SN-WM001-BLK-0001", "Blue", 301, 12.25, 15.10, null, "2024-12-01 10:00:00", "2025-01-05 08:30:00", "available"),
(2,"B-TSH-2025-01", "SN-TSH-M-345678", "Green", 450, 7.00, 19.99, null, "2025-01-10 12:00:00", "2025-02-01 10:15:00", "available"),
(5,"B-DL-2024-11", "SN-DL-99887766","red", 356, 20.00,39.95, null, "2024-11-20 13:00:00", "2025-01-01 07:00:00", "available"),
(6, "B-BRD-2025-04", "SN-DL-99887766", "Pink", 256, 17.00, 20.23, null, "2025-04-01 08:00:00", "2025-04-10 09:00:00","available");

-- inserting sample data into the brand table

insert into brand(brandName, brandDescription,country_Of_Origin,createdAt,updatedAt)
values("Logitech", "Electronics and computer gear", "Switzerland","2024-12-01 09:00:00", "2025-01-01 10:00:00"),
("Nike", "Sportswear and athletic products", "USA","2024-12-01 09:30:00", "2025-01-01 10:00:00"),
("Beacome","Durable lifestyle accessories","Canada","2024-12-01 10:00:00","2025-04-01 08:00:00"),
("SweetCrust","Artisan bakery and confectionery", "France", "2025-01-15 08:00:00","2025-04-01 08:00:00"),
("GlowLite","	Home lighting and fixtures", "Germany", "2025-01-15 08:30:00","2025-04-01 08:30:00");

-- inserting sample data into the productVariation table
insert into productVariation(productID, variationName, color, size, material, style, price, stockQuantity, createdAt, updatedAt, status)
values(1,"Black Wireless Mouse","black",null, "Plastic", null, 45.86, 345,"2024-12-01 10:00:00", "2025-01-01 10:00:00", "Active"),
(1,"Blue Wireless Mouse","blue",null, "plastic",null, 46.67, 345,"2024-12-01 10:00:00","2025-01-01 10:00:00","Active"),
(3, "Black Medium T-Shirt","Black","L","Cotton","slim fit",50.00,250,"2025-01-10 12:00:00","2025-02-01 12:00:00", "Active"),
(4,"Black Large T-Shirt","Black","M","Cotton", "loose",55.50,560,"2025-01-10 12:00:00","2025-02-01 12:00:00","Active"),
(5,"Black XL T-Shirt","Black", "XL","Cotton","loose",55.67,600,"2025-01-10 12:00:00","2025-02-01 12:00:00","Active");


-- inserting sample data into the  size category table

insert into sizeCategory(sizeCategoryName, unit, createdAt, updatedAt, status)
values("Clothing", 345, "2024-12-01 09:00:00", "2025-01-01 09:00:00","Active"),
("Footwear",456,"2024-12-01 09:10:00","2025-01-01 09:10:00","Active"),
("Beverage", 230,"2024-12-01 09:20:00","2025-01-01 09:20:00", "Active"),
("Electronics",560, "2024-12-01 09:30:00","2025-01-01 09:30:00","ACtive"),
("Bakery",120, "2024-12-01 09:40:00","2025-01-01 09:40:00","Active");

-- inserting sample data into the size option table
insert into sizeOption(sizeCategoryID,sizeLabel,sizeValue, createdAt,updatedAt, status)
values(1,"Small",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(1,"medium",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(2,"US 8",8,"2025-01-01 10:01:00","2025-01-01 10:01:00","Active"),
(3,"Large",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(4,"1 Liter",1000.00,"2025-01-01 10:02:00","2025-01-01 10:02:00","Active"),
(5,"15.6 Inch",15.60,"2025-01-01 10:03:00","2025-01-01 10:03:00","Active"),
(6,"Loaf",1.00,"2025-01-01 10:04:00","2025-01-01 10:04:00","Active");

-- inserting sample data into the product image table
insert into productImage(productID,variationID,imageUrl,altText,isPrimary,createdAt,updatedAt, status)
values(1,101,"https://images.unsplash.com/photo-1585238342028-3d9d2f9b9b3b","Loaf of bread",true,"2025-04-20 09:00:00","2025-04-20 09:00:00","Active"),
(2,102,"https://images.unsplash.com/photo-1600185363361-b1e1c43bca7a","Plain white T-shirt",true,"2025-04-20 09:01:00","2025-04-20 09:01:00","Active"),
(3,103,"https://images.unsplash.com/photo-1526178619322-6fa77cb2f87d","Red running shoes",true,"2025-04-20 09:02:00","2025-04-20 09:02:00","active"),
(4,104,"https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f","Silver laptop",true,"2025-04-20 09:04:00","2025-04-20 09:04:00","active"),
(5,105,"https://images.unsplash.com/photo-1542291026-7eec264c27ff","Smartphone with apps", true,"2025-04-20 09:03:00","2025-04-20 09:03:00","active");

-- inserting sample data into the color table
insert into color(colorName, createdAt, updatedAt, status)
values("Pink","2025-04-21 10:08:00","2025-04-21 10:08:00","inactive"),
("Red","2025-04-21 10:00:00","2025-04-21 10:00:00","active"),
("Blue","2025-04-21 10:01:00","2025-04-21 10:01:00","active"),
("Green","2025-04-21 10:02:00","2025-04-21 10:02:00","active"),
("Black","2025-04-21 10:03:00","2025-04-21 10:03:00","active"),
("White","2025-04-21 10:04:00","2025-04-21 10:04:00","active"),
("Yellow","	2025-04-21 10:05:00","2025-04-21 10:05:00","active"),
("Gray","2025-04-21 10:06:00","2025-04-21 10:06:00","active"),
("Orange","2025-04-21 10:07:00","2025-04-21 10:07:00","active");

-- inserting sample data into the product attribute table
insert into productAttribute(attributeName,unit,isVariant,createdAt,updatedAt,status)
values("weight","g",false,"2025-04-21 10:20:00","2025-04-21 10:20:00","active"),
("Material","NA",true,"	2025-04-21 10:21:00","2025-04-21 10:21:00","active"),
("Sole Type","NA",true,"2025-04-21 10:22:00","2025-04-21 10:22:00","active"),
("Screen Size","inch",false,"2025-04-21 10:23:00","2025-04-21 10:23:00","active"),
("RAM","gb",true,"2025-04-21 10:24:00","2025-04-21 10:24:00","active");

-- inserting sample data into the attribute category table
insert into attributeCategory(categoryName,createdAt,updatedAt,status)
values("Physical","2025-04-21 11:00:00","2025-04-21 11:00:00","active"),
("Material","2025-04-21 11:01:00","2025-04-21 11:01:00","active"),
("Technical","2025-04-21 11:02:00","2025-04-21 11:02:00","active"),
("Appearance","2025-04-21 11:03:00","2025-04-21 11:03:00","active"),
("Packaging","2025-04-21 11:04:00","2025-04-21 11:04:00","active");

-- inserting sample data into the attribute type table
insert into attributeType(typeName,createdAt,updatedAt,status)
values("Weight","2025-04-21 11:10:00","2025-04-21 11:10:00","active"),
("Length","2025-04-21 11:11:00","2025-04-21 11:11:00","active"),
("Material","2025-04-21 11:12:00","2025-04-21 11:12:00","active"),
("Screen Size","2025-04-21 11:13:00","2025-04-21 11:13:00","active"),
("RAM","2025-04-21 11:14:00","2025-04-21 11:14:00","active"),
("Color finish","2025-04-21 11:15:00","2025-04-21 11:15:00","active"),
("Packaging Type","2025-04-21 11:16:00","2025-04-21 11:16:00","active");

