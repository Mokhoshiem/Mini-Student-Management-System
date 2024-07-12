-- Basic Queries: Select all students. Select all courses. Select all enrollments with student names and course names.
-- SELECT ALL Student
SELECT 'ALL STUDENTS RESULT:......' AS QUERYING;
SELECT * FROM Student;

-- SELECT ALL COURSES
SELECT 'ALL COURSES RESULT: .....' AS QUERYING;
SELECT * FROM course;

--  SELECT ALL ENROLLMENTS WITH STUDENTS NAMES AND COURSES:
SELECT 'ALL ENROLLMENTS RESULT: .....' AS QUERYING;
SELECT e.enrollment_id, CONCAT(s.first_name,' ',s.last_name) AS student_name, c.course_name, e.enrollment_date
FROM enrollment e
JOIN student s ON e.student_id = s.student_id
JOIN course c ON e.course_id = c.course_id;

-- Select students who enrolled in a specific course.
-- SELECT STUDENTS WHO ENROLLED IN DATA ENGINEERING COURSE:
SELECT 'Students enrolled in Microsoft Data Engineering Course....' AS QUERYING;

SELECT CONCAT(s.first_name,' ',s.last_name) AS Student_name
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
WHERE e.course_id = (SELECT course_id FROM course WHERE course_name = 'Microsoft Data Engineer');

-- Select courses with more than 5 students. 
SELECT 'Courses With More Than 5 Students..........' AS QUERYING;

SELECT c.course_name, count(e.course_id) AS Students_count
FROM enrollment e
join course c ON e.course_id = c.course_id
GROUP BY c.course_id
HAVING count(e.course_id) > 5
ORDER BY c.course_name;

-- Update a student's email.
SELECT 'Updating Yasser Allaa email..........' AS QUERYING;

UPDATE student set email = 'yasser.alaa@newmail.co'
WHERE first_name = 'yasser' AND last_name = 'Alaa';

-- Delete a course that no students are enrolled in.
SELECT 'Deleting Zero Enrollment Courses.......' AS QUERYING;

DELETE FROM course
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollment);

-- Calculate the average age of students.
SELECT 'Calculating AVG AGE ......' AS QUERYING;

select round(AVG(EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM date_of_birth))) AS Students_average_age
FROM Student;

-- Find the course with the maximum enrollments.
SELECT 'TOP ENROLLED COURSE......' AS QUERYING;

SELECT c.course_name, count(e.course_id) AS Students_count
FROM enrollment e
join course c ON e.course_id = c.course_id
GROUP BY c.course_id
ORDER BY Students_count desc 
LIMIT 1;

-- List courses along with the number of students enrolled (use GROUP BY).
SELECT 'COURSES ALINGSIDE WITH ENROLLMENTS .........' AS QUERYING;

SELECT c.course_name, count(e.course_id) AS Students_count
FROM enrollment e
join course c ON e.course_id = c.course_id
GROUP BY c.course_id
ORDER BY Students_count desc;

-- Join Queries Select all students with their enrolled courses (use JOIN).
SELECT 'STUDENT WITH ENROLLED COURSES..........' AS QUERYING;

SELECT CONCAT(s.first_name,' ',s.last_name), c.course_name
FROM student s
JOIN enrollment e ON s.student_id = e.student_id
join course c ON c.course_id = e.course_id;

-- List all instructors and their courses.
SELECT 'Instructors Courses......' AS QUERYING;

SELECT DISTINCT CONCAT(i.first_name,' ', i.last_name),c.course_name
FROM instructor i
LEFT JOIN enrollment e ON i.instructor_id = e.instructor_id
LEFT JOIN course c ON c.course_id = e.course_id;

-- Find students who are not enrolled in any course.
SELECT 'Students Are Not Assigned To Courses.........' AS QUERYING;

SELECT * FROM Student
WHERE student_id NOT IN (SELECT DISTINCT student_id FROM enrollment);

-- Select students enrolled in more than one course.
SELECT 'STUDENTS ENROLLED TO MORE THAN ONE COURSE......' AS QUERYING;

SELECT s.student_id, s.first_name, s.last_name, e.n_courses AS course_count
FROM student s
LEFT JOIN (
    SELECT student_id,count(student_id) AS n_courses
    FROM enrollment
    GROUP BY student_id) e
ON s.student_id = e.student_id
WHERE e.n_courses > 1;

-- Find courses taught by a specific instructor.
SELECT 'Courses taught by Ahmed Azaz.....' AS QUERYING;

SELECT DISTINCT i.first_name, i.last_name, e.course_name
FROM instructor i
LEFT JOIN 
(SELECT e.instructor_id, c.course_name
FROM enrollment e 
JOIN course c ON e.course_id = c.course_id) e
ON e.instructor_id = i.instructor_id
WHERE i.first_name = 'Ahmed' AND i.last_name = 'Azab';

-- Select the top 3 students with the most enrollments.
SELECT 'TOP 3 students with the most enrollments.....' AS QUERYING;

SELECT s.student_id, s.first_name, s.last_name, e.n_courses AS course_count
FROM student s
LEFT JOIN (
    SELECT student_id,count(student_id) AS n_courses
    FROM enrollment
    GROUP BY student_id) e
ON s.student_id = e.student_id
ORDER BY course_count DESC LIMIT 3;

-- Use UNION to combine results of two different SELECT queries.
-- SELECT ALL Studennts In Data Engineering and Devops
SELECT 'ALL Studennts In Data Engineering and Devops....' AS QUERYING;

SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM student s
JOIN enrollment e on e.student_id = s.student_id
JOIN course c ON c.course_id = e.course_id
WHERE course_name = 'Microsoft Data Engineer'
UNION ALL
SELECT s.student_id, s.first_name, s.last_name, c.course_name
FROM student s
JOIN enrollment e on e.student_id = s.student_id
JOIN course c ON c.course_id = e.course_id
WHERE course_name = 'Dev Ops Engineer';


-- Create a stored procedure to add a new student.

CREATE OR REPLACE PROCEDURE add_student( f_name VARCHAR, l_name VARCHAR, mail VARCHAR, dob DATE)
LANGUAGE SQL
BEGIN ATOMIC
INSERT INTO Student(first_name,last_name,email,date_of_birth) VALUES (f_name, l_name, mail,dob);
END;
--  Adding a student Using Procedure
CALL add_student('Hossam','Ahmed','Hossam.Ahmed@eg.Company.com','1990-01-20');
SELECT * FROM student;

-- Create a function to calculate the age of a student based on their date of birth.

-- A function That calculates the age based on date_of_birth

CREATE OR REPLACE FUNCTION calculate_age(dob DATE)
RETURNS INT
AS $$
BEGIN
    RETURN EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM dob);
END;
$$
LANGUAGE plpgsql;

-- Calling the function to get the age if birthdate is '2000-01-01'
SELECT * FROM calculate_age('2000-01-01') AS Age;

-- Calculate the average enrollments per course
--  Average enrollments = number of enrollments / number of enrolled courses
SELECT (COUNT(enrollment_id) / count(DISTINCT course_id)) AS average_enrollments_per_course
FROM enrollment;

--  Get The maximum course enrollments
SELECT c.course_name, count(e.course_id) AS max_enrollment_numbers
FROM course c
JOIN enrollment e ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY max_enrollment_numbers DESC LIMIT 1;

-- Get The Minimum course enrollments
SELECT c.course_name, count(e.course_id) AS min_enrollment_numbers
FROM course c
JOIN enrollment e ON e.course_id = c.course_id
GROUP BY c.course_name
ORDER BY min_enrollment_numbers LIMIT 1;

-- Use CASE to categorize students based on their age.
select *,
    CASE
        WHEN (EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM date_of_birth)) < 20 THEN 'Age is less Than 20 years old'
        WHEN (EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM date_of_birth)) < 30 THEN 'Age is between 20 and 30 years old'
        Else 'Age is more Than 30 years old'
    END AS age_categories
FROM Student;
