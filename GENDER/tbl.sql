
SELECT gender, Max(age), MIN(age), COUNT(age)
FROM tblGender
GROUP BY gender;




SELECT * FROM tblGender
ORDER BY gender, age DESC;