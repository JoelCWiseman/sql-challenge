DROP TABLE IF EXISTS "Salaries";
DROP TABLE IF EXISTS "Titles";
DROP TABLE IF EXISTS "Employees";
DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Dept_Mgr";
DROP TABLE IF EXISTS "Dept_Emp";

CREATE TABLE "Departments" (
   "Dept_No" VARCHAR NOT NULL,
   "Dept_Name" VARCHAR NOT NULL,
   PRIMARY KEY ("Dept_No")
);

SELECT * FROM "Departments";

CREATE TABLE "Titles" (
   "Title_ID" VARCHAR NOT NULL,
   "Title" VARCHAR NOT NULL,
   PRIMARY KEY ("Title_ID")
);

SELECT * FROM "Titles";

CREATE TABLE "Employees" (
   "Emp_No" INTEGER NOT NULL,
   "Emp_Title_ID" VARCHAR NOT NULL,
   "Birth_Date" VARCHAR NOT NULL,
   "First_Name" VARCHAR NOT NULL,
   "Last_Name" VARCHAR NOT NULL,
   "Sex" VARCHAR NOT NULL,
   "Hire_Date" VARCHAR NOT NULL,
   PRIMARY KEY ("Emp_No"),
   FOREIGN KEY ("Emp_Title_ID") REFERENCES "Titles" ("Title_ID")
);

SELECT * FROM "Employees";

CREATE TABLE "Dept_Emp" (
   "Emp_No" INTEGER NOT NULL,
   "Dept_No" VARCHAR NOT NULL,
   PRIMARY KEY ("Emp_No", "Dept_No"),
   FOREIGN KEY ("Emp_No") REFERENCES "Employees" ("Emp_No"),
   FOREIGN KEY ("Dept_No") REFERENCES "Departments" ("Dept_No")
);

SELECT * FROM "Dept_Emp";

CREATE TABLE "Dept_Mgr" (
   "Dept_No" VARCHAR NOT NULL,
   "Emp_No" INTEGER NOT NULL,
   FOREIGN KEY ("Dept_No") REFERENCES "Departments" ("Dept_No"),
   FOREIGN KEY ("Emp_No") REFERENCES "Employees" ("Emp_No"),
   PRIMARY KEY ("Dept_No", "Emp_No")
);

SELECT * FROM "Dept_Mgr";

CREATE TABLE "Salaries" (
   "Emp_No" INTEGER NOT NULL,
   "Salary" INTEGER NOT NULL,
   FOREIGN KEY ("Emp_No") REFERENCES "Employees" ("Emp_No"),
   PRIMARY KEY ("Emp_No")
);

SELECT * FROM "Salaries";