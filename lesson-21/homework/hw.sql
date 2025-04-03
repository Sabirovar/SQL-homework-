create database hw_21
use hw_21

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'García', 77000.00),
(10, 1, 'William', 'Martínez', 69000.00),
(11, 5, 'Elizabeth', 'Hernández', 95000.00),
(12, 2, 'David', 'Lopez', 88000.00),
(13, 3, 'Joseph', 'Martinez', 74000.00),
(14, 4, 'Susan', 'Rodriguez', 80000.00),
(15, 5, 'Daniel', 'Wilson', 89000.00),
(16, 1, 'Karen', 'Moore', 67000.00),
(17, 2, 'Charles', 'Taylor', 71000.00),
(18, 3, 'Christopher', 'Anderson', 76000.00),
(19, 4, 'Sarah', 'Thomas', 83000.00),
(20, 5, 'Jessica', 'Jackson', 92000.00),
(21, 1, 'Kevin', 'White', 64000.00),
(22, 2, 'Nancy', 'Harris', 78000.00),
(23, 3,'Edward', 'Clark', 72000.00), (24, 4, 'Helen', 'Lewis', 79000.00), (25, 5, 'Brian', 'Young', 95000.00), 
(26, 1, 'Laura', 'Allen', 67000.00), (27, 2, 'James', 'King', 72000.00), (28, 3, 'Patricia', 'Scott', 78000.00), 
(29, 4, 'Michael', 'Adams', 80000.00), (30, 5, 'Mary', 'Baker', 85000.00), (31, 1, 'Steven', 'Gonzalez', 61000.00),
(32, 2, 'Jessica', 'Nelson', 75000.00), (33, 3, 'Matthew', 'Carter', 71000.00), (34, 4, 'George', 'Mitchell', 80000.00),
(35, 5, 'Ashley', 'Perez', 90000.00), (36, 1, 'Sarah', 'Roberts', 66000.00), (37, 2, 'Joshua', 'Evans', 77000.00), 
(38, 3, 'Nicholas', 'Gonzalez', 78000.00), (39, 4, 'Rachel', 'Kim', 85000.00), (40, 5, 'Alexander', 'Russell', 92000.00);

CREATE TABLE NewEmployees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO NewEmployees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES

(2, 2, 'Jane', 'Smith', 70000.00),      -- обновлён отдел и зарплата
(5, 4, 'Linda', 'Williams', 81000.00),  -- небольшое повышение зарплаты

-- Новые сотрудники:
(41, 1, 'Tom', 'Hardy', 65000.00),
(42, 2, 'Emma', 'Watson', 72000.00),
(43, 3, 'Chris', 'Evans', 78000.00),
(44, 4, 'Scarlett', 'Johansson', 86000.00)
--1
MERGE INTO Employees AS Target
USING NewEmployees AS Source
ON Target.EmployeeID = Source.EmployeeID

WHEN MATCHED THEN
    UPDATE SET 
        Target.DepartmentID = Source.DepartmentID,
        Target.FirstName = Source.FirstName,
        Target.LastName = Source.LastName,
        Target.Salary = Source.Salary

WHEN NOT MATCHED BY TARGET THEN
    INSERT (EmployeeID, DepartmentID, FirstName, LastName, Salary)
    VALUES (Source.EmployeeID, Source.DepartmentID, Source.FirstName, Source.LastName, Source.Salary);

	--2. 
	CREATE TABLE OldProducts (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE CurrentProducts (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO OldProducts (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 450.00),
(4, 'Monitor', 300.00),
(5, 'Mouse', 25.00);

INSERT INTO CurrentProducts (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1100.00),
(2, 'Smartphone', 750.00),
(3, 'Tablet', 430.00);

--3
MERGE INTO OldProducts AS Target
USING CurrentProducts AS Source
ON Target.ProductID = Source.ProductID
WHEN NOT MATCHED BY SOURCE THEN
    DELETE;

	CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees1(EmployeeID, FirstName, LastName, Salary) VALUES
(1, 'John', 'Doe', 60000.00),
(2, 'Jane', 'Smith', 65000.00),
(3, 'James', 'Brown', 70000.00),
(4, 'Mary', 'Johnson', 75000.00);

CREATE TABLE NewSalaryDetails (
    EmployeeID INT PRIMARY KEY,
    NewSalary DECIMAL(10, 2)
);

INSERT INTO NewSalaryDetails (EmployeeID, NewSalary) VALUES
(1, 62000.00),  
(2, 64000.00),  
(3, 70000.00),  
(4, 80000.00);  
  

CREATE TABLE NewSalaryDetails1 (
    EmployeeID INT PRIMARY KEY,
    NewSalary DECIMAL(10, 2)
);

INSERT INTO NewSalaryDetails1 (EmployeeID, NewSalary) VALUES
(1, 62000.00), 
(2, 64000.00),  
(3, 70000.00),  
(4, 80000.00);  

--4
MERGE INTO Employees AS Target
USING NewSalaryDetails AS Source
ON Target.EmployeeID = Source.EmployeeID

WHEN MATCHED AND Source.NewSalary > Target.Salary THEN
    UPDATE SET Target.Salary = Source.NewSalary;

CREATE FUNCTION fn_GetFullName
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
    DECLARE @FullName VARCHAR(101);
    
    SET @FullName = RTRIM(LTRIM(@FirstName)) + ' ' + RTRIM(LTRIM(@LastName));
    
    RETURN @FullName;
END;

SELECT dbo.fn_GetFullName('John', 'Doe') AS FullName;


CREATE TABLE Sales1 (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);
INSERT INTO Sales1(SaleID, CustomerID, ProductID, Amount, SaleDate) VALUES
(1, 101, 201, 500.00, '2024-01-15'),
(2, 102, 202, 1200.00, '2024-02-10'),
(3, 103, 203, 750.00, '2024-03-05'),
(4, 104, 204, 250.00, '2024-03-20'),
(5, 105, 205, 1800.00, '2024-04-01'),
(6, 101, 206, 3000.00, '2024-04-02'),
(7, 102, 207, 950.00, '2024-04-03'),
(8, 106, 208, 400.00, '2024-04-04');

CREATE FUNCTION fn_GetHighSales (@MinAmount DECIMAL(10, 2))
RETURNS TABLE
AS
RETURN
(
    SELECT 
        SaleID, 
        CustomerID, 
        ProductID, 
        Amount, 
        SaleDate
    FROM Sales1
    WHERE Amount > @MinAmount
);
SELECT * FROM dbo.fn_GetHighSales(1000.00);

CREATE FUNCTION fn_GetCustomerStats ()
RETURNS @CustomerStats TABLE
(
    CustomerID INT,
    TotalTransactions INT,
    TotalAmount DECIMAL(18, 2),
    AverageAmount DECIMAL(18, 2)
)
AS
BEGIN
    INSERT INTO @CustomerStats (CustomerID, TotalTransactions, TotalAmount, AverageAmount)
    SELECT 
        CustomerID,
        COUNT(*) AS TotalTransactions,
        SUM(Amount) AS TotalAmount,
        AVG(Amount) AS AverageAmount
    FROM Sales1
    GROUP BY CustomerID;

    RETURN;
END;

SELECT * FROM dbo.fn_GetCustomerStats();

CREATE TABLE StudentRecords (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

INSERT INTO StudentRecords (StudentID, FirstName, LastName, Age) VALUES
(10, 'Liam', 'Walker', 21),
(11, 'Olivia', 'Hall', 23),
(12, 'Noah', 'Allen', 20),
(13, 'Emma', 'Young', 19),
(14, 'Ava', 'Hernandez', 22);

CREATE TABLE MergeLog (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID INT,
    ActionType VARCHAR(10), -- 'INSERT' or 'UPDATE'
    ActionDate DATETIME DEFAULT GETDATE()
);
INSERT INTO MergeLog (StudentID, ActionType)
VALUES 
(1, 'INSERT'),
(3, 'INSERT'),
(5, 'INSERT');
CREATE TABLE NewStudentRecords (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

INSERT INTO NewStudentRecords (StudentID, FirstName, LastName, Age) VALUES
(1, 'Alice', 'Brown', 19),     
(2, 'Bob', 'Smith', 17),      
(3, 'Charlie', 'Davis', 20);   

MERGE INTO StudentRecords AS Target
USING (
    SELECT * FROM NewStudentRecords WHERE Age > 18
) AS Source
ON Target.StudentID = Source.StudentID

WHEN MATCHED THEN 
    UPDATE SET
        Target.FirstName = Source.FirstName,
        Target.LastName = Source.LastName,
        Target.Age = Source.Age

WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, FirstName, LastName, Age)
    VALUES (Source.StudentID, Source.FirstName, Source.LastName, Source.Age)

OUTPUT 
    Source.StudentID,
    $action AS ActionType,
    GETDATE() AS ActionDate
INTO MergeLog (StudentID, ActionType, ActionDate);

MERGE INTO StudentRecords AS Target
USING (
    SELECT * FROM NewStudentRecords WHERE Age > 18
) AS Source
ON Target.StudentID = Source.StudentID

WHEN MATCHED THEN 
    UPDATE SET 
        Target.FirstName = Source.FirstName,
        Target.LastName = Source.LastName,
        Target.Age = Source.Age

WHEN NOT MATCHED BY TARGET THEN
    INSERT (StudentID, FirstName, LastName, Age)
    VALUES (Source.StudentID, Source.FirstName, Source.LastName, Source.Age)

OUTPUT 
    Source.StudentID,
    $action AS ActionType,
    GETDATE() AS ActionDate
INTO MergeLog (StudentID, ActionType, ActionDate);

--View and Function Practice

CREATE TABLE Sales2 (
    SaleID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Amount DECIMAL(10, 2),
    SaleDate DATE
);

INSERT INTO Sales2 (SaleID, CustomerID, ProductID, Amount, SaleDate) VALUES
(1, 101, 201, 150.00, '2024-01-10'),
(2, 101, 202, 250.00, '2024-01-12'),
(3, 102, 203, 300.00, '2024-01-15'),
(4, 102, 204, 450.00, '2024-02-01'),
(5, 103, 205, 500.00, '2024-02-10'),
(6, 101, 206, 100.00, '2024-02-15'),
(7, 104, 207, 200.00, '2024-03-05');
CREATE VIEW SalesSummary AS
SELECT 
    CustomerID,
    COUNT(*) AS OrderCount,
    SUM(Amount) AS TotalAmount
FROM Sales2
GROUP BY CustomerID;

select * from SalesSummary

--2.

cREATE TABLE Employees2 (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
);
INSERT INTO Employees2 (EmployeeID, FirstName, LastName, DepartmentID, Salary) VALUES
(101, 'John', 'Doe', 1, 60000.00),
(102, 'Jane', 'Smith', 2, 65000.00),
(103, 'Michael', 'Johnson', 3, 72000.00),
(104, 'Emily', 'Brown', 4, 58000.00),
(105, 'David', 'Wilson', 5, 70000.00),
(106, 'Olivia', 'Taylor', 3, 68000.00);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Operations');

CREATE VIEW EmployeeDepartmentDetails AS
SELECT 
    E.EmployeeID,
    E.FirstName,
    E.LastName,
    E.Salary,
    D.DepartmentID,
    D.DepartmentName
FROM Employees E
INNER JOIN Departments D ON E.DepartmentID = D.DepartmentID;

SELECT * FROM EmployeeDepartmentDetails;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityInStock INT,
    ReorderLevel INT
);

INSERT INTO Products (ProductID, ProductName, QuantityInStock, ReorderLevel) VALUES
(1, 'Wireless Mouse', 0, 10),       -- Out of Stock
(2, 'Mechanical Keyboard', 5, 10),  -- Low Stock
(3, '27-inch Monitor', 25, 10),     -- In Stock
(4, 'USB-C Hub', 10, 10),           -- In Stock
(5, 'Laptop Stand', 2, 5);          -- Low Stock

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityInStock INT,
    ReorderLevel INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    QuantityInStock INT,
    ReorderLevel INT
);

CREATE VIEW InventoryStatus AS
SELECT 
    ProductID,
    ProductName,
    QuantityInStock,
    ReorderLevel,
    CASE 
        WHEN QuantityInStock = 0 THEN 'Out of Stock'
        WHEN QuantityInStock <= ReorderLevel THEN 'Low Stock'
        ELSE 'In Stock'
    END AS AvailabilityStatus
FROM Products; 

select * from InventoryStatus

CREATE TABLE People (
    PersonID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50)
);

INSERT INTO People (PersonID, FirstName, LastName) VALUES
(1, 'John', 'Doe'),
(2, 'Jane', 'Smith'),
(3, 'Emily', 'Brown'),
(4, 'Michael', 'Johnson');

CREATE FUNCTION fn_GetFullName
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
    RETURN RTRIM(LTRIM(@FirstName)) + ' ' + RTRIM(LTRIM(@LastName));
END;

ALTER FUNCTION fn_GetFullName
(
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50)
)
RETURNS VARCHAR(101)
AS
BEGIN
    RETURN RTRIM(LTRIM(@FirstName)) + ' ' + RTRIM(LTRIM(@LastName));
END;
