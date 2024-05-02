-- Create database
CREATE DATABASE donormanage;

-- Use the database
USE donormanage;

-- Table: users
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('donor', 'organization', 'administrator') NOT NULL
);

-- Insert sample data into users
INSERT INTO users (username, password, email, role) VALUES
('john_donor', 'password123', 'john@example.com', 'donor'),
('susan_org', 'secret789', 'susan@organization.org', 'organization'),
('admin1', 'adminpass', 'admin@example.com', 'administrator');

-- Table: donor_profiles
CREATE TABLE donor_profiles (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Insert sample data into donor_profiles
INSERT INTO donor_profiles (user_id, full_name, phone) VALUES
(1, 'John Doe', '123-456-7890');

-- Table: projects
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    organization_id INT NOT NULL,
    project_name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status ENUM('pending', 'ongoing', 'completed') NOT NULL,
    FOREIGN KEY (organization_id) REFERENCES users(user_id)
);

-- Insert sample data into projects
INSERT INTO projects (organization_id, project_name, description, start_date, end_date, status) VALUES
(2, 'Clean Water Initiative', 'Providing clean drinking water to rural areas.', '2024-01-01', '2024-12-31', 'ongoing'),
(2, 'Education for All', 'Supporting education programs in underprivileged communities.', '2024-02-15', '2024-12-31', 'pending');

-- Table: donations
CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    project_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    donation_date DATE,
    FOREIGN KEY (donor_id) REFERENCES donor_profiles(donor_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Insert sample data into donations
INSERT INTO donations (donor_id, project_id, amount, donation_date) VALUES
(1, 1, 100.00, '2024-04-01'),
(1, 2, 50.00, '2024-04-10');

-- Table: surveys
CREATE TABLE surveys (
    survey_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    survey_question VARCHAR(255) NOT NULL,
    response_options TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Table: impact_reports
CREATE TABLE impact_reports (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    project_id INT NOT NULL,
    impact_description TEXT NOT NULL,
    report_date DATE,
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Table: donor_guidelines
CREATE TABLE donor_guidelines (
    guideline_id INT AUTO_INCREMENT PRIMARY KEY,
    guideline_title VARCHAR(255) NOT NULL,
    guideline_description TEXT
);

-- Insert sample data into donor_guidelines
INSERT INTO donor_guidelines (guideline_title, guideline_description) VALUES
('How to Donate', 'Please follow the steps outlined in your account to make a donation.'),
('Volunteering Opportunities', 'Check our website for upcoming volunteering events and opportunities.');

-- Table: communication_logs
CREATE TABLE communication_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(255) NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
