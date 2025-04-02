
CREATE DATABASE HW_CLASS19
USE  HW_CLASS19

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);
drop table employees 
INSERT INTO Employees (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
(1, 1, 'John', 'Doe', 60000.00),
(2, 1, 'Jane', 'Smith', 65000.00),
(3, 2, 'James', 'Brown', 70000.00),
(4, 3, 'Mary', 'Johnson', 75000.00),
(5, 4, 'Linda', 'Williams', 80000.00),
(6, 2, 'Michael', 'Jones', 85000.00),
(7, 1, 'Robert', 'Miller', 55000.00),
(8, 3, 'Patricia', 'Davis', 72000.00),
(9, 4, 'Jennifer', 'Garc?a', 77000.00),
(10, 1, 'William', 'Mart?nez', 69000.00),
(11, 5, 'Elizabeth', 'Hern?ndez', 95000.00),
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

select * from Employees
-- Write a query to assign a row number to each employee in the **Employees** table ordered by their Salary.


Select 
	*,
	ROW_NUMBER() over( order by salary)	AS rownum
from
	Employees

	--2. Create a query to rank all products based on their Price in descending order.

	
Select *,
RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees

--3.Use the **DENSE_RANK()** function to rank employees by Salary in the **Employees** table.

select *, 
DENSE_RANK()over(order by salary desc) AS Ranking 
from Employees

--4. Write a query to display the next (lead) salary for each employee in the same department using the **LEAD()** function.

Select *,
LEAD(salary) over(partition by departmentID order by Salary DESC
    ) AS NextSalary
from employees 

--5. Use **ROW_NUMBER()** to assign a unique number to each order in the **Orders** table.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderAmount DECIMAL(10, 2),
    OrderDate DATE
);

INSERT INTO Orders (OrderID, CustomerID, OrderAmount, OrderDate) VALUES
(1, 1, 550.00, '2025-01-01'),
(2, 2, 700.00, '2025-01-02'),
(3, 3, 450.00, '2025-01-03'),
(4, 4, 800.00, '2025-01-04'),
(5, 5, 1200.00, '2025-01-05'),
(6, 6, 950.00, '2025-01-06'),
(7, 7, 700.00, '2025-01-07'),
(8, 8, 600.00, '2025-01-08'),
(9, 9, 800.00, '2025-01-09'),
(10, 10, 700.00, '2025-01-10'),
(11, 11, 650.00, '2025-01-11'),
(12, 12, 550.00, '2025-01-12'),
(13, 13, 450.00, '2025-01-13'),
(14, 14, 600.00, '2025-01-14'),
(15, 15, 550.00, '2025-01-15'),
(16, 16, 600.00, '2025-01-16'),
(17, 17, 800.00, '2025-01-17'),
(18, 18, 1000.00, '2025-01-18'),
(19, 19, 700.00, '2025-01-19'),
(20, 20, 600.00, '2025-01-20'),
(21, 21, 500.00, '2025-01-21'),
(22, 22, 450.00, '2025-01-22'),
(23, 23, 700.00, '2025-01-23'),
(24, 24, 650.00, '2025-01-24'),
(25, 25, 600.00, '2025-01-25'),
(26, 26, 700.00, '2025-01-26'),
(27, 27, 800.00, '2025-01-27'),
(28, 28, 950.00, '2025-01-28'),
(29, 29, 1000.00, '2025-01-29'),
(30, 30, 700.00, '2025-01-30'),
(31, 31, 600.00, '2025-02-01'),
(32, 32, 550.00, '2025-02-02'),
(33, 33, 450.00, '2025-02-03'),
(34, 34, 600.00, '2025-02-04'),
(35, 35, 650.00, '2025-02-05'),
(36, 36, 700.00, '2025-02-06'),
(37, 37, 800.00, '2025-02-07'),
(38, 38, 750.00, '2025-02-08'),
(39, 39, 900.00, '2025-02-09'),
(40, 40, 950.00, '2025-02-10');
 drop table orders 
Select * from orders 

SELECT*, 
 ROW_NUMBER() OVER (ORDER BY OrderDate, OrderID) AS RowNum
FROM Orders
  ORDER BY
      RowNum
	  
--6.  Create a query using **RANK()** to identify the highest and second-highest salaries in the **Employees** table.
WITH SalaryRanks AS (
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary,
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM
        Employees
)
SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    SalaryRank
FROM
    SalaryRanks
WHERE
    SalaryRank IN (1, 2)

	--7.Write a query to show the previous (lagged) salary for each employee in the **Employees** table using the **LAG()** function.
	SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    LAG(Salary) OVER (ORDER BY EmployeeID) AS PreviousSalary
FROM
    Employees;

	--8 Use **NTILE(4)** to divide employees into 4 groups based on their Salary
	SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    NTILE(4) OVER (ORDER BY Salary DESC) AS SalaryQuartile
FROM
    Employees
   
   --9 Write a query to partition employees by **DepartmentID** and assign a row number within each department.
   CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'Operations'),
(4, 'Finance'),
(5, 'HR');

SELECT * FROM Departments

SELECT
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.DepartmentID,
    e.Salary,
    ROW_NUMBER() OVER (PARTITION BY e.DepartmentID ORDER BY e.EmployeeID) AS RowNum
FROM
    Employees e
ORDER BY
    e.DepartmentID,
    RowNum;

	--10. Use **DENSE_RANK()** to rank products by Price in ascending order.
	CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 800.00),
(2, 'Smartphone', 600.00),
(3, 'Headphones', 100.00),
(4, 'Keyboard', 30.00),
(5, 'Mouse', 20.00),
(6, 'Monitor', 250.00),
(7, 'Printer', 150.00),
(8, 'Tablet', 350.00),
(9, 'Smartwatch', 120.00),
(10, 'Speaker', 50.00),
(11, 'Refrigerator', 500.00),
(12, 'Washing Machine', 400.00),
(13, 'Microwave', 120.00),
(14, 'Blender', 60.00),
(15, 'Air Conditioner', 250.00),
(16, 'Hair Dryer', 30.00),
(17, 'Vacuum Cleaner', 150.00),
(18, 'Coffee Maker', 90.00),
(19, 'Toaster', 40.00),
(20, 'Iron', 25.00),
(21, 'Shirt', 30.00),
(22, 'Jeans', 40.00), (23, 'Shoes', 70.00), (24, 'Socks', 5.00), (25, 'Jacket', 100.00), 
(26, 'T-shirt', 20.00), (27, 'Sweater', 50.00), (28, 'Shorts', 30.00), (29, 'Hat', 15.00), 
(30, 'Gloves', 20.00), (31, 'Backpack', 60.00), (32, 'Wallet', 25.00), (33, 'Sunglasses', 40.00), 
(34, 'Scarf', 15.00), (35, 'Belt', 25.00), (36, 'Watch', 120.00), (37, 'Ring', 50.00), (38, 'Necklace', 80.00), 
(39, 'Earrings', 30.00), (40, 'Bracelet', 20.00);

SELECT
    ProductID,
    ProductName,
    Price,
    DENSE_RANK() OVER (ORDER BY Price ASC) AS PriceRank
FROM
    Products

	--11. Write a query to calculate the moving average of Price in the **Products** table using window functions

	SELECT
    ProductID,
    ProductName,
    Price,
    AVG(Price) OVER (
        ORDER BY ProductID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAverage
FROM
    Products
	
	 --12. Use the **LEAD()** function to display the salary of the next employee for each row in the **Employees** table.

	 SELECT
    EmployeeID,
    FirstName,
    LastName,
    Salary,
    LEAD(Salary) OVER (ORDER BY EmployeeID) AS NextEmployeeSalary
FROM
    Employees
ORDER BY
    EmployeeID

	--13.  Create a query to compute the cumulative sum of **SalesAmount** in the **Sales** table.
	CREATE TABLE Sales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SalesDate DATE
);

INSERT INTO Sales (SalesID, ProductID, SalesAmount, SalesDate) VALUES
(1, 1, 200.00, '2025-01-01'),
(2, 2, 500.00, '2025-01-02'),
(3, 3, 80.00, '2025-01-03'),
(4, 4, 20.00, '2025-01-04'),
(5, 5, 15.00, '2025-01-05'),
(6, 6, 200.00, '2025-01-06'),
(7, 7, 120.00, '2025-01-07'),
(8, 8, 350.00, '2025-01-08'), (9, 9, 110.00, '2025-01-09'), (10, 10, 50.00, '2025-01-10'), (11, 11, 500.00, '2025-01-11'), (12, 12, 350.00, '2025-01-12'), (13, 13, 100.00, '2025-01-13'), (14, 14, 60.00, '2025-01-14'), (15, 15, 200.00, '2025-01-15'), (16, 16, 30.00, '2025-01-16'), (17, 17, 150.00, '2025-01-17'), (18, 18, 90.00, '2025-01-18'), (19, 19, 40.00, '2025-01-19'), (20, 20, 20.00, '2025-01-20'), (21, 21, 30.00, '2025-01-21'), (22, 22, 40.00, '2025-01-22'), (23, 23, 60.00, '2025-01-23'), (24, 24, 50.00, '2025-01-24'), (25, 25, 150.00, '2025-01-25'), (26, 26, 100.00, '2025-01-26'), (27, 27, 100.00, '2025-01-27'), (28, 28, 90.00, '2025-01-28'), (29, 29, 80.00, '2025-01-29'), (30, 30, 70.00, '2025-01-30'), (31, 31, 50.00, '2025-02-01'), (32, 32, 60.00, '2025-02-02'), (33, 33, 120.00, '2025-02-03'), (34, 34, 150.00, '2025-02-04'), (35, 35, 200.00, '2025-02-05'), (36, 36, 40.00, '2025-02-06'), (37, 37, 80.00, '2025-02-07'), (38, 38, 60.00, '2025-02-08'), (39, 39, 100.00, '2025-02-09'), (40, 40, 120.00, '2025-02-10');
	SELECT
    SalesID,
    ProductID,
    SalesAmount,
    SalesDate,
    SUM(SalesAmount) OVER (
        ORDER BY SalesDate
    ) AS CumulativeSales
FROM
    Sales
ORDER BY
    SalesDate

	--14. Use **ROW_NUMBER()** to identify the top 5 most expensive products in the **Products** table.

	WITH cte AS (
    SELECT
        ProductID,
        ProductName,
        Price,
        ROW_NUMBER() OVER (ORDER BY Price DESC) AS Rank
    FROM
        Products
)
SELECT
    ProductID,
    ProductName,
    Price
FROM
    cte
WHERE
    Rank <= 5
ORDER BY
    Rank

	--15. Write a query to partition the **Orders** table by **CustomerID** and calculate the total **OrderAmount** per customer.
	 
	 SELECT
	 customerID,
	 SUM(orderamount) AS TotalOrderAmount
FROM
    Orders
GROUP BY
    CustomerID
ORDER BY
    CustomerID

--16.  Use **RANK()** to rank orders in the **Orders** table based on their **OrderAmount**
SELECT
    OrderID,
    CustomerID,
    OrderAmount,
    RANK() OVER (ORDER BY OrderAmount DESC) AS OrderRank
FROM
    Orders
ORDER BY
    OrderRank

--17. Write a query to compute the percentage contribution of **SalesAmount** by **ProductCategory** in the **Sales** table.

CREATE TABLE Sales1 (
    SalesID INT PRIMARY KEY,
    EmployeeID INT,
    ProductID INT,
    SalesAmount DECIMAL(10, 2),
    SalesDate DATE
);

INSERT INTO Sales1(SalesID, EmployeeID, ProductID, SalesAmount, SalesDate) VALUES
(1, 1, 1, 500.00, '2025-01-01'),
(2, 2, 2, 1200.00, '2025-01-02'),
(3, 3, 3, 800.00, '2025-01-03'),
(4, 4, 4, 1500.00, '2025-01-04'),
(5, 5, 5, 300.00, '2025-01-05'),
(6, 6, 6, 1000.00, '2025-01-06'),
(7, 7, 7, 850.00, '2025-01-07'),
(8, 8, 8, 500.00, '2025-01-08'),
(9, 9, 9, 600.00, '2025-01-09'),
(10, 10, 10, 450.00, '2025-01-10'),
(11, 11, 11, 700.00, '2025-01-11'),
(12, 12, 12, 800.00, '2025-01-12'),
(13, 13, 13, 1200.00, '2025-01-13'),
(14, 14, 14, 1500.00, '2025-01-14'),
(15, 15, 15, 950.00, '2025-01-15'),
(16, 16, 16, 600.00, '2025-01-16'),
(17, 17, 17, 700.00, '2025-01-17'),
(18, 18, 18, 1100.00, '2025-01-18'),
(19, 19, 19, 500.00, '2025-01-19'),
(20, 20, 20, 400.00, '2025-01-20'),
(21, 21, 21, 800.00, '2025-01-21'),
(22, 22, 22, 650.00, '2025-01-22'),
(23, 23, 23, 700.00, '2025-01-23'),
(24, 24, 24, 1200.00, '2025-01-24'),
(25, 25, 25, 500.00, '2025-01-25'),
(26, 26, 26, 850.00, '2025-01-26'),
(27, 27, 27, 600.00, '2025-01-27'),
(28, 28, 28, 1200.00, '2025-01-28'),
(29, 29, 29, 700.00, '2025-01-29'),
(30, 30, 30, 450.00, '2025-01-30'),
(31, 31, 31, 800.00, '2025-02-01'),
(32, 32, 32, 1200.00, '2025-02-02'),
(33, 33, 33, 900.00, '2025-02-03'),
(34, 34, 34, 600.00, '2025-02-04'),
(35, 35, 35, 950.00, '2025-02-05'),
(36, 36, 36, 1000.00, '2025-02-06'),
(37, 37, 37, 700.00, '2025-02-07'),
(38, 38, 38, 850.00, '2025-02-08'),
(39, 39, 39, 600.00, '2025-02-09'),
(40, 40, 40, 500.00, '2025-02-10');


 Employees Table
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    DepartmentID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees1 (EmployeeID, DepartmentID, FirstName, LastName, Salary) VALUES
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


--18. Use the **LEAD()** function to retrieve the next order date for each order in the **Orders** table.
SELECT
    OrderID,
    CustomerID,
    OrderDate,
    LEAD(OrderDate) OVER (ORDER BY OrderDate) AS NextOrderDate
FROM
    Orders

	--19. 
	SELECT
    EmployeeID,
    FirstName,
    LastName,
    Age,
    NTILE(3) OVER (ORDER BY Age) AS AgeGroup
FROM
    Employees1;
