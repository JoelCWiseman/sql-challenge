--List the employee number, last name, first name, sex, and salary of each employee
CREATE TABLE EmployeeInfo AS
SELECT e."Emp_No", e."Last_Name", e."First_Name", e."Sex", s."Salary"
FROM "Employees" e
JOIN "Salaries" s ON e."Emp_No" = s."Emp_No";

SELECT * FROM "employeeinfo";

--List the first name, last name, and hire date for the employees who were hired in 1986
CREATE TABLE Employees1986 AS
SELECT "First_Name", "Last_Name", "Hire_Date"
FROM "Employees"
WHERE TO_CHAR(TO_DATE("Hire_Date", 'MM/DD/YYYY'), 'YYYY') = '1986';

SELECT * FROM "employees1986";

--List the manager of each department along with their department number, department name, employee number, last name, and first name 
CREATE TABLE DepartmentManagers AS
SELECT dm."Dept_No", d."Dept_Name", dm."Emp_No", e."Last_Name", e."First_Name"
FROM "Dept_Mgr" dm
JOIN "Departments" d ON dm."Dept_No" = d."Dept_No"
JOIN "Employees" e ON dm."Emp_No" = e."Emp_No";

SELECT * FROM "departmentmanagers";

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
CREATE TABLE EmployeeDepartment AS
SELECT de."Dept_No", e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
FROM "Dept_Emp" de
JOIN "Employees" e ON de."Emp_No" = e."Emp_No"
JOIN "Departments" d ON de."Dept_No" = d."Dept_No";

SELECT * FROM "employeedepartment";

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
CREATE TABLE HerculesEmployees AS
SELECT "First_Name", "Last_Name", "Sex"
FROM "Employees"
WHERE "First_Name" = 'Hercules' AND "Last_Name" LIKE 'B%';

SELECT * FROM "herculesemployees";

--List each employee in the Sales department, including their employee number, last name, and first name
CREATE TABLE SalesEmployees AS
SELECT e."Emp_No", e."Last_Name", e."First_Name"
FROM "Employees" e
JOIN "Dept_Emp" de ON e."Emp_No" = de."Emp_No"
JOIN "Departments" d ON de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" = 'Sales';

SELECT * FROM "salesemployees";

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name
CREATE TABLE SalesAndDevelopmentEmployees AS
SELECT e."Emp_No", e."Last_Name", e."First_Name", d."Dept_Name"
FROM "Employees" e
JOIN "Dept_Emp" de ON e."Emp_No" = de."Emp_No"
JOIN "Departments" d ON de."Dept_No" = d."Dept_No"
WHERE d."Dept_Name" IN ('Sales', 'Development');

SELECT * FROM "salesanddevelopmentemployees";

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT "Last_Name", COUNT(*) AS "Frequency"
FROM "Employees"
GROUP BY "Last_Name"
ORDER BY "Frequency" DESC;

