create database hw
use hw

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000)

select * from employees 

--1. 
Select * from employees 
where salary= (Select MIN(Salary)
from employees)


CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);

select * from products 

--2.
Select * from products
where price > 
(Select AVG(price) from products) 

drop table employees

CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);

select * from departments
select * from employees

--3.

Select name
From employees
Where department_id = (
    Select id
    From departments
    Where department_name = 'Sales'

	
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100))


INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select * from customers 
select * from orders

select name 
from customers c
where NOT EXISTS (
select 1 
from orders o
where  o.customer_id = c.customer_id)

drop table products 

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
)
INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

select * from products

--Task: Retrieve products with the highest price in each category.

SELECT * from products e1
WHERE price = (
    SELECT MAX(price)
    FROM products e2
    where e2.category_id = e1.category_id) 

	--Task: Retrieve employees working in the department with the highest average salary.

	CREATE TABLE dep (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
INSERT INTO dep(id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

CREATE TABLE emp (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
)
   INSERT INTO emp (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

Select * from dep
Select * from emp

SELECT e.id AS employee_id,
       e.name AS employee_name,
       e.salary,
       d.department_name
FROM emp e
JOIN dep d ON e.department_id = d.id
WHERE e.department_id = (
    SELECT TOP 1 WITH TIES department_id
    FROM emp
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
)

--7. Find Employees Earning Above Department Average

--Task: Retrieve employees earning more than the average salary in their department.

CREATE TABLE empl (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);
INSERT INTO empl (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

select * from empl 


SELECT id AS employee_id,
       name AS employee_name,
       salary,
       department_id
FROM empl e
WHERE salary > (
    SELECT AVG(salary)
    FROM empl
    WHERE department_id = e.department_id
);

--8. Find Students with Highest Grade per Course

--Task: Retrieve students who received the highest grade in each course.

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

select * from students
select * from grades 

SELECT g.course_id,
s.student_id,
s.name AS srudents_name,
g.grade 
FROM grades g
JOIN students s ON g.student_id = s.student_id
WHERE g.grade =(
SELECT MAX(g2.grade) 
FROM grades g2
WHERE g2.course_id = g.course_id
)


--9. Find Third-Highest Price per Category

--Task: Retrieve products with the third-highest price in each category.


CREATE TABLE products1 (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT)

INSERT INTO products1 (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

SELECT * FROM PRODUCTS1

SELECT
    p1.id,
    p1.product_name,
    p1.price,
    p1.category_id
FROM
    products1 p1
WHERE
    3 = (
       SELECT
            COUNT(DISTINCT p2.price)
       FROM
            products1 p2
       WHERE
            p2.category_id = p1.category_id
       AND p2.price >= p1.price)

--10. Find Employees Between Company Average and Department Max Salary

--Task: Retrieve employees with salaries above the company average but below the maximum in their department.

CREATE TABLE empl2 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO empl2 (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);

select * from empl2

SELECT e.id,
       e.name,
       e.salary,
       e.department_id
FROM empl2 e
WHERE e.salary > (SELECT AVG(salary) FROM empl2)
  AND e.salary < (SELECT MAX(salary)
                  FROM empl2 d
                  WHERE d.department_id = e.department_id);
