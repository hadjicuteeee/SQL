USE dbsales;


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    enrollment_date DATE
);

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    units INT
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    subject_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(subject_id)
);

-- INSERT DATA
INSERT INTO Students (student_id, name, enrollment_date) VALUES
(1, 'Juan Dela Cruz', '2024-06-10'),
(2, 'Maria Santos', '2024-06-15'),
(3, 'Pedro Reyes', '2024-07-01'),
(4, 'Ana Lopez', '2024-07-05'),
(5, 'Mark Villanueva', '2024-07-08'),
(6, 'Carla Dizon', '2024-07-12'),
(7, 'Leo Mendoza', '2024-07-15'),
(8, 'Sofia Cruz', '2024-06-20'),
(9, 'Daniel Torres', '2024-07-18'),
(10, 'Ella Navarro', '2024-07-25');

INSERT INTO Subjects (subject_id, subject_name, units) VALUES
(101, 'Database', 3),
(102, 'Networking', 4),
(103, 'Programming', 5);

INSERT INTO Attendance (attendance_id, student_id, subject_id, attendance_date, status) VALUES
(201, 1, 101, '2024-07-10', 'Present'),
(202, 1, 103, '2024-07-12', 'Absent'),
(203, 2, 102, '2024-07-10', 'Present'),
(204, 3, 101, '2024-07-15', 'Present'),
(205, 4, 103, '2024-07-20', 'Present'),
(206, 4, 102, '2024-07-21', 'Absent'),
(207, 5, 101, '2024-07-11', 'Present'),
(208, 5, 102, '2024-07-12', 'Present'),
(209, 6, 103, '2024-07-13', 'Absent'),
(210, 7, 101, '2024-07-15', 'Present'),
(211, 8, 102, '2024-07-18', 'Present'),
(212, 9, 103, '2024-07-20', 'Absent'),
(213, 10, 101, '2024-07-25', 'Present'),
(214, 2, 103, '2024-07-19', 'Present'),
(215, 6, 102, '2024-07-22', 'Present');


