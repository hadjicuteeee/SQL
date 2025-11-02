/*Activity 1 */
SELECT * FROM tblstudents where gwa < 2.0;

/* Activity 2 */
SELECT first_name, last_name, course, gwa
from tblstudents
where course ="bsit"
order by gwa asc;

/* Activity 3 */
SELECT COUNT(*), course as per_course
from tblstudents
group by course;


/* Activity 4 */
SELECT *
from tblstudents
order by age desc
limit 3;

/* Activity 5 */
SELECT course, AVG(gwa) as average_gwa
from tblstudents
group by course;