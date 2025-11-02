SELECT 
    st.name,                                    
    st.enrollment_date,                        
    DATEDIFF(CURDATE(), enrollment_date) AS DaySinceEnrollment  
FROM Students AS st
WHERE MONTH(enrollment_date) = 7               
  AND YEAR(enrollment_date) = 2024;              


--  Attendance count (present at absent) kada subject
SELECT  
    s.subject_name,                              -- Pangalan ng subject
    SUM(CASE WHEN status = "Present" THEN 1 ELSE 0 END) AS total_present, 
    SUM(CASE WHEN status = "Absent" THEN 1 ELSE 0 END) AS total_absent    
FROM students AS st
INNER JOIN attendance AS a ON st.student_id = a.student_id
INNER JOIN subjects AS s ON a.subject_id = s.subject_id
GROUP BY s.subject_name
ORDER BY s.subject_name DESC;                  


-- Mga estudyanteng pumasok sa higit 1 subject sa isang araw
SELECT 
    st.name,                                     
    a.attendance_date,                           
    COUNT(DISTINCT a.subject_id) AS subjects_attended  
FROM Students AS st
INNER JOIN Attendance AS a 
    ON st.student_id = a.student_id
GROUP BY st.name, a.attendance_date
HAVING COUNT(DISTINCT a.subject_id) > 1;         


-- Mga subject na hindi pa ina-attend-an ng kahit isang estudyante
SELECT  
    s.subject_id,                                
    s.subject_name                               
FROM subjects AS s
LEFT JOIN attendance AS a
    ON s.subject_id = a.subject_id
WHERE subject_name IS NULL;                     


-- Total absent per student noong July 2024
SELECT  
    st.name,                                    
    COUNT(status) AS total_absent_july           
FROM STUDENTS AS st
INNER JOIN attendance AS a ON st.student_id = a.student_id
INNER JOIN subjects AS s ON a.subject_id = s.subject_id
WHERE status = "Absent"
  AND a.attendance_date BETWEEN '2024-07-01' AND '2024-07-31'
GROUP BY st.name, status;


-- Total present at absent per student noong July 2024
SELECT  
    st.name,                                    
    SUM(CASE WHEN status = "Present" THEN 1 ELSE 0 END) AS total_present, 
    SUM(CASE WHEN status = "Absent" THEN 1 ELSE 0 END) AS total_absent     
FROM students AS st
INNER JOIN attendance AS a ON st.student_id = a.student_id
INNER JOIN subjects AS s ON a.subject_id = s.subject_id
WHERE MONTH(attendance_date) = 7 
  AND YEAR(attendance_date) = 2024
GROUP BY st.name;


-- Mga estudyanteng may unang attendance record sa loob ng 5 araw mula enrollment
SELECT  
    name,                                       
    enrollment_date,                             
    attendance_date AS first_attendance,         
    DATEDIFF(attendance_date, enrollment_date) AS days_diff  -- Araw mula enrollment hanggang first attendance
FROM (
    SELECT  
        st.name, 
        st.enrollment_date, 
        a.attendance_date,
        ROW_NUMBER() OVER (PARTITION BY st.student_id ORDER BY a.attendance_date ASC) AS rn
    FROM students AS st
    INNER JOIN attendance AS a ON st.student_id = a.student_id
) t
WHERE rn = 1                                     -- Kukunin lang yung unang attendance
  AND DATEDIFF(attendance_date, enrollment_date) <= 5;  -- Within 5 days mula enrollment
