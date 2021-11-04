DROP DATABASE IF EXISTS northwind_dw;

CREATE DATABASE northwind_dw;

USE northwind_dw;

CREATE TABLE dim_customer (
    CustomerID VARCHAR(5),
    CompanyName VARCHAR(40),
    City VARCHAR(15),
    Country VARCHAR(15),
    PRIMARY KEY (CustomerID)
);

CREATE TABLE dim_product (
    ProductID INTEGER,
    ProductIdentifier INTEGER,
    ProductName VARCHAR(40),
    CategoryName VARCHAR(15),
    VERSION INT,
    DATE_FROM DATETIME,
    DATE_TO DATETIME,
    PRIMARY KEY (ProductID)
);

CREATE TABLE dim_supplier (
    SupplierID INTEGER,
    CompanyName VARCHAR(40),
    City VARCHAR(15),
    Country VARCHAR(15),
    PRIMARY KEY (SupplierID)
);

CREATE TABLE dim_shipper (
    ShipperID INTEGER,
    CompanyName VARCHAR(40),
    PRIMARY KEY (ShipperID)
);

CREATE TABLE dim_time (
    TimeID DATE,
    YearID INTEGER,
    MonthID INTEGER,
    MonthName VARCHAR(255),
    DayID INTEGER,
    PRIMARY KEY (TimeID)
);

CREATE TABLE fact_order (
    OrderID INTEGER,
    CustomerID VARCHAR(5),
    ProductID INTEGER,
    SupplierID INTEGER,
    ShipperID INTEGER,
    TimeID DATE,
    UnitPrice DECIMAL(10,4),
    Quantity SMALLINT(2),
    Discount REAL,
    Sales INTEGER,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (CustomerID) REFERENCES dim_customer (CustomerID),
    FOREIGN KEY (ProductID) REFERENCES dim_product (ProductID),
    FOREIGN KEY (SupplierID) REFERENCES dim_supplier (SupplierID),
    FOREIGN KEY (ShipperID) REFERENCES dim_shipper (ShipperID),
    FOREIGN KEY (TimeID) REFERENCES dim_time (TimeID)
);
