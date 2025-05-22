CREATE DATABASE student_management; 
USE student_management; 
-- --------------------------------
-- CREATE DATABASE CONNECTION FIRST
-- --------------------------------

-- -------------------
-- SECOND CREATE TABLE
-- -------------------
--  Student table
CREATE TABLE student (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    ic_number VARCHAR(20),
    kelas VARCHAR(50)
);

--  Subject table
CREATE TABLE subject (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

--  Exam types table
CREATE TABLE exam (
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(50) NOT NULL
);

--  Marks table
CREATE TABLE marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    exam_id INT,
    mark INT,
    FOREIGN KEY (student_id) REFERENCES student(id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subject(id) ON DELETE CASCADE,
    FOREIGN KEY (exam_id) REFERENCES exam(id) ON DELETE CASCADE
);

-- -----------------
-- THIRD INSERT DATA
-- -----------------
-- Insert subject names
INSERT INTO subject (name) VALUES 
('BM'),
('BI'),
('Math'),
('Science'),
('Sejarah');

-- Insert exam types
INSERT INTO exam (type) VALUES 
('1st Exam'),
('2nd Exam'),  
('Final Exam');
