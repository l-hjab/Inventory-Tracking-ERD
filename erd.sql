create database inventory;
use inventory;

CREATE TABLE productCategory (
    categoryID INT PRIMARY KEY,
    categoryName VARCHAR(100),
    quantity INT,
    description VARCHAR
);

CREATE TABLE supplier (
    supplierID INT PRIMARY KEY,
    supplier VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT,
    address VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE products (
    productID INT PRIMARY KEY,
    productName VARCHAR(100),
    quantity INT,
    unitPrice DECIMAL(10, 2),
    categoryID INT,
    FOREIGN KEY (categoryID) REFERENCES productCategory(categoryID)
);

CREATE TABLE purchaseOrders (
    orderID INT PRIMARY KEY,
    productID INT,
    orderDate DATE,
    status VARCHAR(50),
    supplierID INT,
    FOREIGN KEY (productID) REFERENCES products(productID),
    FOREIGN KEY (supplierID) REFERENCES supplier(supplierID)
);

CREATE TABLE purchaseOrderDetails (
    orderDetailsID INT PRIMARY KEY,
    orderID INT,
    productID INT,
    quantity INT,
    unitCost DECIMAL(10, 2),
    FOREIGN KEY (orderID) REFERENCES purchaseOrders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

CREATE TABLE sales (
    salesID INT PRIMARY KEY,
    saleDate DATE,
    cashierName VARCHAR(100),
    totalAmount DECIMAL(10, 2)
);

CREATE TABLE salesDetails (
    salesDetailID INT PRIMARY KEY,
    salesID INT,
    productID INT,
    quantitySold INT,
    unitPrice DECIMAL(10, 2),
    FOREIGN KEY (salesID) REFERENCES sales(salesID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);
