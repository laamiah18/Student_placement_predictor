
USE student_placement_db;
SELECT DATABASE();
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('student', 'teacher') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DESCRIBE users;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    cgpa FLOAT NOT NULL,
    internship_experience INT NOT NULL,
    internship_flag TINYINT(1) NOT NULL,
    projects INT NOT NULL,
    certifications INT NOT NULL,
    aptitude_score INT NOT NULL,
    communication_skills FLOAT NOT NULL,
    technical_skills FLOAT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
DESCRIBE students;
CREATE TABLE predictions (
    prediction_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    placement_prediction TINYINT(1) NOT NULL,
    placement_probability FLOAT NOT NULL,
    model_version VARCHAR(50),
    predicted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
DESCRIBE predictions;
CREATE TABLE job_role_results (
    job_role_result_id INT AUTO_INCREMENT PRIMARY KEY,
    prediction_id INT NOT NULL,
    job_role_name VARCHAR(100) NOT NULL,
    eligibility_status ENUM('Eligible', 'Not Eligible') NOT NULL,
    suitability_score FLOAT,
    FOREIGN KEY (prediction_id) REFERENCES predictions(prediction_id)
);
DESCRIBE job_role_results;
CREATE TABLE bulk_uploads (
    upload_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    total_records INT NOT NULL,
    processed_records INT DEFAULT 0,
    status ENUM('Pending', 'Processing', 'Completed', 'Failed') DEFAULT 'Pending',
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES users(user_id)
);
DESCRIBE bulk_uploads;











