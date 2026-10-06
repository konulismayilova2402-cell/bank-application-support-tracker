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

-- Sample Data

INSERT INTO departments VALUES
(1, 'IT Support'),
(2, 'Digital Banking'),
(3, 'Operations'),
(4, 'Risk Management');

INSERT INTO applications VALUES
(1, 'Core Banking', 1, 'Critical'),
(2, 'Mobile Banking', 2, 'Critical'),
(3, 'Internet Banking', 2, 'High'),
(4, 'CRM System', 3, 'Medium'),
(5, 'Payment Gateway', 1, 'Critical');

INSERT INTO incidents VALUES
(1, 1, 'High', 'Resolved', '2026-09-01', '2026-09-01', 'Login failure'),
(2, 2, 'Critical', 'Resolved', '2026-09-02', '2026-09-02', 'Mobile app unavailable'),
(3, 2, 'High', 'Open', '2026-09-05', NULL, 'Slow response'),
(4, 3, 'Medium', 'Resolved', '2026-09-07', '2026-09-07', 'Transaction error'),
(5, 1, 'Critical', 'Open', '2026-09-10', NULL, 'Database connection issue'),
(6, 5, 'Critical', 'Resolved', '2026-09-11', '2026-09-11', 'Payment processing failure'),
(7, 2, 'High', 'Resolved', '2026-09-12', '2026-09-12', 'Authentication error'),
(8, 4, 'Low', 'Resolved', '2026-09-15', '2026-09-15', 'Report generation issue'),
(9, 5, 'High', 'Open', '2026-09-18', NULL, 'Payment timeout'),
(10, 1, 'Medium', 'Resolved', '2026-09-20', '2026-09-20', 'Slow database query');

INSERT INTO support_users VALUES
(1, 'Support Analyst 1', 'Application Support'),
(2, 'Support Analyst 2', 'Application Support'),
(3, 'Database Support', 'DBA Team');
