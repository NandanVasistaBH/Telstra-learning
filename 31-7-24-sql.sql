use retail_db;
select Count(cus_id) as total_customer , city from customers group by city;

select Count(cus_id) as total_customer , city from customers group by city having count(cus_id)>1;

-- sort names alphabetically
desc customers;
select fname as name from customers order by fname ASC;
select lname as name from customers order by lname DESC;

select cus_id , concat(fname," ",lname) as full_name from customers order by full_name;

-- starts with n
select fname from customers where fname like "n%";

-- joins left outer join all the records from the left and those which matches from the right ; ulta for the right outer join
-- inner join only those which matches eachother (both left table and right table)


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
 
 
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    emp_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES 
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Dave', 2);
 
 
INSERT INTO departments (dept_id, dept_name, emp_id) VALUES 
(1, 'HR', 1),
(2, 'Engineering', 2),
(3, 'Marketing', NULL),
(4, 'Sales', NULL);

select e.emp_id,e.emp_name,d.dept_name 
from employees as e
LEFT JOIN departments as d 
ON e.emp_id=d.emp_id;

select e.emp_id,e.emp_name,d.dept_name 
from employees as e
RIGHT JOIN departments as d 
ON e.emp_id=d.emp_id;

select e.emp_id,e.emp_name,d.dept_name 
from employees as e
JOIN departments as d 
ON e.emp_id=d.emp_id;

-- get emp_name with their manager 

desc employees;
select e1.emp_name as employee_name , e2.emp_name  as manager_name
from employees as e1
JOIN employees as e2 ON e1.manager_id=e2.emp_id ;

-- indexing is done to access data faster

explain select * from employees;
explain select e1.emp_name as employee_name , e2.emp_name  as manager_name
from employees as e1
JOIN employees as e2 ON e1.manager_id=e2.emp_id ;


-- indexing 
create index name_idx on employees (emp_name); -- simple index
create UNIQUE index idx1_emp_id on employees (emp_id); -- index is 100% unique;
create index comp_idx on employees(emp_id,emp_name); -- composite index


-- normalization
-- 1nf  each table has a PK , all values have to be atomic i.e no multiple value,no repeating grps

-- 2nf should be 1nf and redundant data across multiple rows should be moved to seperate tables

-- 3nf should be 2nf + eliminate fields which aren't dependent on PK, 