CREATE DATABASE IF NOT EXISTS enterprise;

USE enterprise;

CREATE TABLE IF NOT EXISTS jobs_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(255),
    department_id INT,
    PRIMARY KEY (employee_id, start_date)
);

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    hire_date DATE,
    job_id VARCHAR(255),
    salary INT,
    commission_pct DECIMAL(4,2),
    manager_id INT,
    department_id INT
);

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255),
    manager_id INT,
    location_id INT
);

CREATE TABLE IF NOT EXISTS locations (
    location_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    postal_code VARCHAR(255),
    city VARCHAR(255),
    state_province VARCHAR(255),
    country_id VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS regions (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS countries (
    country_id VARCHAR(255) PRIMARY KEY,
    country_name VARCHAR(255),
    region_id INT
);

CREATE TABLE IF NOT EXISTS jobs (
    job_id VARCHAR(255) PRIMARY KEY,
    job_title VARCHAR(255),
    min_salary INT,
    max_salary INT
);

--FOREIGN KEYS ---------------------------------------------------------------
/*
ALTER TABLE employees
ADD CONSTRAINT fk_employees_job_id
FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager_id
FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE employees
ADD CONSTRAINT fk_employees_department_id
FOREIGN KEY (department_id) REFERENCES departments(department_id);

ALTER TABLE departments
ADD CONSTRAINT fk_departments_manager_id
FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

ALTER TABLE departments
ADD CONSTRAINT fk_departments_location_id
FOREIGN KEY (location_id) REFERENCES locations(location_id);

ALTER TABLE locations
ADD CONSTRAINT fk_locations_country_id
FOREIGN KEY (country_id) REFERENCES countries(country_id);

ALTER TABLE countries
ADD CONSTRAINT fk_countries_region_id
FOREIGN KEY (region_id) REFERENCES regions(region_id);

ALTER TABLE jobs_history
ADD CONSTRAINT fk_jobs_history_employee_id
FOREIGN KEY (employee_id) REFERENCES employees(employee_id);

ALTER TABLE jobs_history
ADD CONSTRAINT fk_jobs_history_job_id
FOREIGN KEY (job_id) REFERENCES jobs(job_id);

ALTER TABLE jobs_history
ADD CONSTRAINT fk_jobs_history_department_id
FOREIGN KEY (department_id) REFERENCES departments(department_id);

*/


-- POPULATING DATA ----------------------------------------------------------- 

-- Populate employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '2021-10-30', 'IT_PROG', 5000, 0.1, NULL, 1),
       (2, 'Jane', 'Doe', 'janedoe@example.com', '555-5678', '2021-10-30', 'SA_MAN', 10000, 0.2, 1, 2),
       (3, 'Bob', 'Smith', 'bobsmith@example.com', '555-9012', '2021-10-30', 'SA_REP', 8000, 0.15, 2, 2),
       (4, 'Alice', 'Johnson', 'alicejohnson@example.com', '555-3456', '2021-10-30', 'HR_REP', 6000, 0.1, 3, 3),
       (5, 'David', 'Lee', 'davidlee@example.com', '555-7890', '2021-10-30', 'IT_PROG', 5500, 0.05, 1, 1),
       (6, 'Sarah', 'Kim', 'sarahkim@example.com', '555-2345', '2021-10-30', 'ST_CLERK', 3000, NULL, 2, 4),
       (7, 'Michael', 'Brown', 'michaelbrown@example.com', '555-6789', '2021-10-30', 'SA_REP', 9000, 0.2, 2, 2),
       (8, 'Karen', 'Davis', 'karendavis@example.com', '555-0123', '2021-10-30', 'ST_CLERK', 3500, NULL, 6, 4),
       (9, 'Steven', 'Wright', 'stevenwright@example.com', '555-4567', '2021-10-30', 'IT_PROG', 6000, 0.05, 1, 1),
       (10, 'Emily', 'Taylor', 'emilytaylor@example.com', '555-8901', '2021-10-30', 'SA_REP', 7500, 0.1, 2, 2);



-- Populate departments table
INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (1, 'IT', 1, 1),
       (2, 'Sales', 2, 2),
       (3, 'HR', 3, 3),
       (4, 'Finance', 4, 4);

-- Populate locations table
INSERT INTO locations (location_id, street_address, postal_code, city, state_province, country_id)
VALUES (1, '123 Main St', '12345', 'New York', 'NY', 'US'),
       (2, '456 Main St', '67890', 'Los Angeles', 'CA', 'US'),
       (3, '789 Main St', '13579', 'Chicago', 'IL', 'US'),
       (4, '321 Main St', '24680', 'Houston', 'TX', 'US');

-- Populate regions table

INSERT INTO regions (region_id, region_name)
VALUES (1, 'North America'),
       (2, 'South America'),
       (3, 'Europe'),
       (4, 'Asia'),
       (5, 'Australia'),
       (6, 'Antarctica'),
       (7, 'Africa');

-- Populate countries table

INSERT INTO countries (country_id, country_name, region_id)
VALUES ('US', 'United States of America', 1),
       ('CA', 'Canada', 1),
       ('MX', 'Mexico', 1),
       ('BR', 'Brazil', 2),
       ('AR', 'Argentina', 2),
       ('UK', 'United Kingdom', 3),
       ('DE', 'Germany', 3),
       ('FR', 'France', 3),
       ('JP', 'Japan', 4),
       ('CN', 'China', 4),
       ('AU', 'Australia', 5),
       ('NZ', 'New Zealand', 5),
       ('ZA', 'South Africa', 7);

-- Populate jobs table
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('AD_PRES', 'President', 20000, 40000),
       ('AD_VP', 'Administration Vice President', 15000, 30000),
       ('AD_ASST', 'Administration Assistant', 3000, 6000),
       ('FI_MGR', 'Finance Manager', 10000, 20000),
       ('FI_ACCOUNT', 'Accountant', 5000, 10000),
       ('AC_MGR', 'Accounting Manager', 8000, 15000),
       ('AC_ACCOUNT', 'Public Accountant', 4000, 9000),
       ('SA_MAN', 'Sales Manager', 10000, 20000),
       ('SA_REP', 'Sales Representative', 6000, 12000),
       ('PU_MAN', 'Purchasing Manager', 8000, 15000),
       ('PU_CLERK', 'Purchasing Clerk', 2500, 5500),
       ('ST_MAN', 'Stock Manager', 5500, 8500),
       ('ST_CLERK', 'Stock Clerk', 2000, 5000),
       ('SH_CLERK', 'Shipping Clerk', 2500, 5500),
       ('IT_PROG', 'Programmer', 4000, 10000),
       ('MK_MAN', 'Marketing Manager', 9000, 15000),
       ('MK_REP', 'Marketing Representative', 4000, 9000);




-- Populate jobs_history table
INSERT INTO jobs_history (employee_id, start_date, end_date, job_id, department_id)
VALUES (1, '2021-10-30', NULL, 'IT_PROG', 1),
       (2, '2021-10-30', NULL, 'SA_MAN', 2),
       (3, '2021-10-30', NULL, 'SA_REP', 2),
       (4, '2021-10-30', NULL, 'HR_REP', 3),
       (5, '2021-10-30', NULL, 'IT_PROG', 1),
       (6, '2021-10-30', NULL, 'ST_CLERK', 4),
       (7, '2021-10-30', NULL, 'SA_REP', 2),
       (8, '2021-10-30', NULL, 'ST_CLERK', 4),
       (9, '2021-10-30', NULL, 'IT_PROG', 1),
       (10, '2021-10-30', NULL, 'SA_REP', 2);
