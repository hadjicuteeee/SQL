USE DBPROJECT1;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100)
);

INSERT INTO courses (course_id, course_name) VALUES
(1, 'BSIT'),
(2, 'BSCS'),
(3, 'BSHM'),
(4, 'BSED');


CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

INSERT INTO students (student_id, name, course_id) VALUES
(1, 'Stephen Curry', 1),
(2, 'Jihad Apues', 1),
(3, 'Emma Watson', 2),
(4, 'Lebron James', 3),
(5, 'Kobe Br', 1),
(6, 'Manny Pacquiao', 4),
(7, 'Junemar Fajardo', 2);



WITH course_total AS (
	SELECT c.course_name, count(*) from courses as c
    LEFT JOIN students as s on c.course_id = s.course_id
    group by course_name
    )
    
    SELECT * from course_total;
    
    

WITH course_enrollment AS (
	SELECT
    c.course_name,
    count(s.student_id) AS total_students
    FROM students as s
    INNER JOIN courses as c on s.course_id = c.course_id
    group by c.course_name
    )
    
    SELECT course_name, total_students from course_enrollment
    ORDER by total_students DESC;
    
    

WITH course_total AS (
	SELECT
    c.course_name,
    count(s.student_id) as total_students
    FROM students as s
	INNER JOIN courses as c on s.course_id = c.course_id
    group by c.course_name
    
    )
    SELECT course_name, total_students 
    from course_total
    WHERE total_students > 2;