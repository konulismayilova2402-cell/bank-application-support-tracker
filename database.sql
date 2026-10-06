-- Bank Application Support Incident Tracker
-- Database Schema

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE applications (
    application_id INT PRIMARY KEY,
    application_name VARCHAR(100) NOT NULL,
    department_id INT,
    criticality VARCHAR(20),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE incidents (
    incident_id INT PRIMARY KEY,
    application_id INT,
    priority VARCHAR(20),
    status VARCHAR(20),
    incident_date DATE,
    resolution_date DATE,
    description VARCHAR(255),
    FOREIGN KEY (application_id) REFERENCES applications(application_id)
);

CREATE TABLE support_users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    team VARCHAR(100)
);
