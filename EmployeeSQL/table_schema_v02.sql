-- TABLE SCHEMA FOR sql_challenge

-- Create departments table
DROP TABLE IF EXISTS departments;

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4) NOT NULL PRIMARY KEY,
    "dept_name" VARCHAR(30)   NOT NULL
);

-- Verify departments data
SELECT * FROM departments;

-- Create employees table
DROP TABLE IF EXISTS employees;

CREATE TABLE "employees" (
    "emp_no" int NOT NULL PRIMARY KEY,
    "emp_title_id" VARCHAR(5) NOT NULL,
    "birth_date" DATE NOT NULL,
    "first_name" VARCHAR(30) NOT NULL,
    "last_name" VARCHAR(30) NOT NULL,
    "sex" VARCHAR(1) NOT NULL,
    "hire_date" DATE NOT NULL
);

-- Verify employees data
SELECT * FROM employees;

-- Create salaries table
DROP TABLE IF EXISTS salaries;

CREATE TABLE "salaries" (
    "emp_no" INT NOT NULL UNIQUE,
    "salary" int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Verify salaries data
select * from salaries;

-- Create titles table
DROP TABLE IF EXISTS titles;

CREATE TABLE "titles" (
    "title_id" VARCHAR(5) NOT NULL PRIMARY KEY,
    "title" VARCHAR(30) NOT NULL
);

-- Verify titles data
SELECT * FROM titles;

-- Create department/employee table
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE "dept_emp" (
    "emp_no" INT NOT NULL,
    "dept_no" VARCHAR(4) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	CONSTRAINT dept_emp_key PRIMARY KEY (emp_no, dept_no)
);

-- Verify department/employee data
SELECT * FROM dept_emp;

-- Create dept/manager table
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4) NOT NULL,
    "emp_no" INT NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	CONSTRAINT dept_emp_mgr_key PRIMARY KEY (dept_no, emp_no)
);

-- Verify dept/manager data
SELECT * FROM dept_manager;

-- All tables have been created.  