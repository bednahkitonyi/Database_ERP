create database Ecommercedb;

use ecommercedb;

-- Creating the different tables

create table product(productid int primary key	auto_increment,productname varchar(255), categoryid int, supplierid int, price decimal, stockquantity int, reorderlevel int, barcode varchar(100), productweight decimal,createdat timestamp,updatedat timestamp, imageurl varchar(255));
create table productcategory(CategoryID int primary key auto_increment,CategoryName varchar(255), CreatedAt timestamp, UpdatedAt timestamp, Status enum('active', 'inactive'));
create table  productitem(ItemID int primary key auto_increment, ProductID int, BatchNumber	varchar(100), SerialNumber varchar(100), Color varchar(50),Quantity_On_Hand	int, CostPrice decimal,SalePrice decimal, ExpiryDate date,CreatedAt timestamp, UpdatedAt timestamp, Status enum('Available', 'Reserved', 'Sold', 'Inactive'));
create table brand(BrandID int primary key	auto_increment, BrandName varchar(255), BrandDescription text, Country_Of_Origin varchar(100), CreatedAt timestamp, UpdatedAt timestamp);
create table productVariation(VariationID int primary key auto_increment, ProductID	int, VariationName varchar(255),Color varchar(50),Size varchar(50),Material varchar(100),Style varchar(100),Price decimal(10, 2), StockQuantity int,CreatedAt timestamp, UpdatedAt timestamp,Status ENUM('Active', 'Inactive'));	
create table sizecategory(SizeCategoryID int primary key auto_increment,SizeCategoryName varchar(100), Unit varchar(50),CreatedAt timestamp,UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table  sizeoption(Sizeid int primary key auto_increment, SizeCategoryID int, SizeLabel varchar(50),SizeValue decimal,CreatedAt timestamp, UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table productimage(ImageID int primary key auto_increment,ProductID int, VariationID int,ImageURL varchar(255), AltText varchar(255), IsPrimary boolean,CreatedAt timestamp, UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table color(ColorID int primary key auto_increment, ColorName varchar(100),Createdat timestamp, UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table productattribute(AttributeID int primary key auto_increment, AttributeName varchar(100), Unit varchar(50), IsVariant boolean, CreatedAt timestamp,UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table  attributecategory(AttributeCategoryID	int primary key auto_increment, CategoryName varchar(100), CreatedAt timestamp, UpdatedAt timestamp, Status ENUM('Active', 'Inactive'));
create table attributetype (AttributeTypeID int primary key auto_increment, TypeName varchar(100), CreatedAt timestamp, Updatedat timestamp, status ENUM('Active', 'Inactive'));

-- inserting sample data into the product table
insert into product(productname,categoryid,supplierid,price,stockquantity,reorderlevel, barcode,productweight,createdat,updatedat,imageurl)
values("Wireless Mouse", 223, 1112,125.50, 678, 100, 12354645,0.05,"2024-12-01 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/wireless_mouse_front.jp"),
("Bluetooth Headphones", 123, 1212,150.50, 1000, 250, 11354745,0.5,"2024-12-01 11:00:00", "2025-01-16 08:30:00", "	https://cdn.example.com/products/wireless_mouse_side.jpg"),
("Cotton T-Shirt", 234, 5612,25.50, 800, 150, 12358945,0.005,"2024-12-06 10:00:00", "2025-01-19 08:30:00","https://cdn.example.com/products/tshirt_white_front.jpg"),
("Laptop Backpack", 456, 4567,80.50, 300, 50, 11235464,0.80,"2025-02-01 10:00:00", "2025-01-20 08:30:00","https://cdn.example.com/products/backpack_open.jpg"),
("LED Desk Lamp", 345, 5678,400.00, 457, 120, 14364645,1.00,"2024-12-11 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/desk_lamp_angle.jpg"),
("Bread", 567, 5678,11.50, 356, 50, 112345,0.65,"2024-12-01 10:00:00", "2025-01-15 08:30:00","https://cdn.example.com/products/bread_packaged.jpg");

-- -- inserting sample data into the product_category table

insert into product_category(categoryname,createdat, updatedat, status)
values("Electronics","	2024-12-01 10:00:00","2025-01-01 10:00:00","Active"),
("Computer Accessories", "2024-12-01 10:05:00","2025-01-01 10:05:00","Active"),
("Audio Equipment","2024-12-01 10:10:00", "2025-01-01 10:10:00","Active"),
("Clothing","2024-12-01 11:15:00","2025-01-01 11:00:00","Active"),
("Backpacks & Bags","2024-12-01 11:15:00","2025-01-01 11:15:00","Active"),
("Home & Lighting","2024-12-01 11:30:00","2025-01-01 11:30:00","Active"),
("Food & Bakery", "2024-12-01 11:45:00","2025-01-01 11:45:00","Active");

-- inserting sample data into the productitem table
insert into productitem(productid, batchnumber, serialnumber, color, quantity_on_hand, costprice, saleprice, expirydate, createdat,updatedat, status)
values(1, "B-WM-2025-01", "SN-WM001-BLK-0001", "Blue", 301, 12.25, 15.10, null, "2024-12-01 10:00:00", "2025-01-05 08:30:00", "available"),
(2,"B-TSH-2025-01", "SN-TSH-M-345678", "Green", 450, 7.00, 19.99, null, "2025-01-10 12:00:00", "2025-02-01 10:15:00", "available"),
(5,"B-DL-2024-11", "SN-DL-99887766","red", 356, 20.00,39.95, null, "2024-11-20 13:00:00", "2025-01-01 07:00:00", "available"),
(6, "B-BRD-2025-04", "SN-DL-99887766", "Pink", 256, 17.00, 20.23, null, "2025-04-01 08:00:00", "2025-04-10 09:00:00","available");

-- inserting sample data into the brand table

insert into brand(brandname, branddescription,country_of_origin,createdat,updatedat)
values("Logitech", "Electronics and computer gear", "Switzerland","2024-12-01 09:00:00", "2025-01-01 10:00:00"),
("Nike", "Sportswear and athletic products", "USA","2024-12-01 09:30:00", "2025-01-01 10:00:00"),
("Beacome","Durable lifestyle accessories","Canada","2024-12-01 10:00:00","2025-04-01 08:00:00"),
("SweetCrust","Artisan bakery and confectionery", "France", "2025-01-15 08:00:00","2025-04-01 08:00:00"),
("GlowLite","	Home lighting and fixtures", "Germany", "2025-01-15 08:30:00","2025-04-01 08:30:00");

-- inserting sample data into the productVariation table
insert into productVariation(productid, variationname, color, size,material, style, price, stockquantity, createdat, updatedat,status)
values(1,"Black Wireless Mouse","black",null, "Plastic", null, 45.86, 345,"2024-12-01 10:00:00", "2025-01-01 10:00:00", "Active"),
(1,"Blue Wireless Mouse","blue",null, "plastic",null, 46.67, 345,"2024-12-01 10:00:00","2025-01-01 10:00:00","Active"),
(3, "Black Medium T-Shirt","Black","L","Cotton","slim fit",50.00,250,"2025-01-10 12:00:00","2025-02-01 12:00:00", "Active"),
(4,"Black Large T-Shirt","Black","M","Cotton", "loose",55.50,560,"2025-01-10 12:00:00","2025-02-01 12:00:00","Active"),
(5,"Black XL T-Shir","Black", "XL","Cotton","loose",55.67,600,"2025-01-10 12:00:00","2025-02-01 12:00:00","Active");


-- inserting sample data into the  sizecategory table

insert into sizecategory(sizecategoryname, unit, createdat, updatedat, status)
values("Clothing", 345, "2024-12-01 09:00:00", "2025-01-01 09:00:00","Active"),
("Footwear",456,"2024-12-01 09:10:00","2025-01-01 09:10:00","Active"),
("Beverage", 230,"2024-12-01 09:20:00","2025-01-01 09:20:00", "Active"),
("Electronics",560, "2024-12-01 09:30:00","2025-01-01 09:30:00","ACtive"),
("Bakery",120, "2024-12-01 09:40:00","2025-01-01 09:40:00","Active");

-- inserting sample data into the sizeoption table
insert into sizeoption(sizecategoryid,sizelabel,sizevalue, createdat,updatedat, status)
values(1,"Small",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(1,"medium",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(2,"US 8",8,"2025-01-01 10:01:00","2025-01-01 10:01:00","Active"),
(3,"Large",null,"2025-01-01 10:00:00","2025-01-01 10:00:00","Active"),
(4,"1 Liter",1000.00,"2025-01-01 10:02:00","2025-01-01 10:02:00","Active"),
(5,"15.6 Inch",15.60,"2025-01-01 10:03:00","2025-01-01 10:03:00","Active"),
(6,"Loaf",1.00,"2025-01-01 10:04:00","2025-01-01 10:04:00","Active");

-- inserting sample data into the productimage table
insert into productimage(productid,variationid,imageurl,alttext,isprimary,createdat,updatedat, status)
values(1,101,"https://images.unsplash.com/photo-1585238342028-3d9d2f9b9b3b","Loaf of bread",true,"2025-04-20 09:00:00","2025-04-20 09:00:00","Active"),
(2,102,"https://images.unsplash.com/photo-1600185363361-b1e1c43bca7a","Plain white T-shirt",true,"2025-04-20 09:01:00","2025-04-20 09:01:00","Active"),
(3,103,"https://images.unsplash.com/photo-1526178619322-6fa77cb2f87d","Red running shoes",true,"2025-04-20 09:02:00","2025-04-20 09:02:00","active"),
(4,104,"https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f","Silver laptop",true,"2025-04-20 09:04:00","2025-04-20 09:04:00","active"),
(5,105,"https://images.unsplash.com/photo-1542291026-7eec264c27ff","Smartphone with apps", true,"2025-04-20 09:03:00","2025-04-20 09:03:00","active");

-- inserting sample data into the color table
insert into color(colorname,createdat,updatedat,status)
values("Pink","2025-04-21 10:08:00","2025-04-21 10:08:00","inactive"),
("Red","2025-04-21 10:00:00","2025-04-21 10:00:00","active"),
("Blue","2025-04-21 10:01:00","2025-04-21 10:01:00","active"),
("Green","2025-04-21 10:02:00","2025-04-21 10:02:00","active"),
("Black","2025-04-21 10:03:00","2025-04-21 10:03:00","active"),
("White","2025-04-21 10:04:00","2025-04-21 10:04:00","active"),
("Yellow","	2025-04-21 10:05:00","2025-04-21 10:05:00","active"),
("Gray","2025-04-21 10:06:00","2025-04-21 10:06:00","active"),
("Orange","2025-04-21 10:07:00","2025-04-21 10:07:00","active");

-- inserting sample data into the productattribute table
insert into productattribute(attributename,unit,isvariant,createdat,updatedat,status)
values("weight","g",false,"2025-04-21 10:20:00","2025-04-21 10:20:00","active"),
("Material","NA",true,"	2025-04-21 10:21:00","2025-04-21 10:21:00","active"),
("Sole Type","NA",true,"2025-04-21 10:22:00","2025-04-21 10:22:00","active"),
("Screen Size","inch",false,"2025-04-21 10:23:00","2025-04-21 10:23:00","active"),
("RAM","gb",true,"2025-04-21 10:24:00","2025-04-21 10:24:00","active");

-- inserting sample data into the attributecategory table
insert into attributecategory(categoryname,createdat,updatedat,status)
values("Physical","2025-04-21 11:00:00","2025-04-21 11:00:00","active"),
("Material","2025-04-21 11:01:00","2025-04-21 11:01:00","active"),
("Technical","2025-04-21 11:02:00","2025-04-21 11:02:00","active"),
("Appearance","2025-04-21 11:03:00","2025-04-21 11:03:00","active"),
("Packaging","2025-04-21 11:04:00","2025-04-21 11:04:00","active");

-- inserting sample data into the attributetype table
insert into attributetype(Typename,createdat,updatedat,status)
values("Weight","2025-04-21 11:10:00","2025-04-21 11:10:00","active"),
("Length","2025-04-21 11:11:00","2025-04-21 11:11:00","active"),
("Material","2025-04-21 11:12:00","2025-04-21 11:12:00","active"),
("Screen Size","2025-04-21 11:13:00","2025-04-21 11:13:00","active"),
("RAM","2025-04-21 11:14:00","2025-04-21 11:14:00","active"),
("Color finish","2025-04-21 11:15:00","2025-04-21 11:15:00","active"),
("Packaging Type","2025-04-21 11:16:00","2025-04-21 11:16:00","active");

