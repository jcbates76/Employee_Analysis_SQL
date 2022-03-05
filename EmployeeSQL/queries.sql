-- Queries on the data tables created

-- 1) List the following details of each employuee:
-- employee number, last name, first name, sex, and salary
CREATE VIEW employee_info AS
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT * FROM employee_info;

-- 2) List first name, last name, and hire date for employees who were hired in 1986.
CREATE VIEW employee_hire_post_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' and hire_date <= '1986-12-31';

SELECT * FROM employee_hire_post_1986;

-- 3) List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, first name
CREATE VIEW department_managers AS
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM dept_manager
INNER JOIN departments
ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees
ON dept_manager.emp_no = employees.emp_no;

SELECT * FROM department_managers;

Select * from employees;

-- 4) List the department of each employee with the following information:
-- employee number, last name, first name, and department name
CREATE VIEW department_employees AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no;

SELECT * FROM department_employees;

-- 5) List first name, last name, and sex for employees
-- whose first name is "Hercules" and last names begin with "B".
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%';

SELECT * from hercules_b;

-- 6) List all employees in the Sales department,
-- including their employee number, last name, first name, and department name.
CREATE VIEW sales_emp AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales';

SELECT * FROM sales_emp;

-- 7) List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
CREATE VIEW sales_development_emp AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name 
FROM employees
INNER JOIN dept_emp
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' or dept_name = 'Development';

SELECT * FROM sales_development_emp;

-- 8) In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
CREATE VIEW last_name_count AS
SELECT last_name, count(emp_no) AS "count_last_name"
FROM employees
GROUP BY last_name
ORDER BY "count_last_name" DESC;

select * from last_name_count;


