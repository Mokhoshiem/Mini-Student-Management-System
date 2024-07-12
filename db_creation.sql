-- Creating the database
CREATE DATABASE StudentCourseManagement;
\C StudentCourseManagement;
CREATE TABLE student (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) DEFAULT 'some.email@email.com',
    date_of_birth DATE NOT NULL
);
CREATE TABLE course(
    course_id SERIAL PRIMARY KEY,
    course_name varchar(100) NOT NULL,
    course_description TEXT
);
CREATE TABLE instructor(
    instructor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) DEFAULT 'some.email@email.com'
);
CREATE TABLE enrollment(
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    instructor_id INT,
    enrollment_date DATE NOT NULl
);

ALTER TABLE enrollment ADD FOREIGN KEY (student_id) REFERENCES student(student_id);
ALTER TABLE enrollment ADD FOREIGN KEY (course_id) REFERENCES course(course_id);
ALTER TABLE enrollment ADD FOREIGN KEY (instructor_id) REFERENCES instructor(instructor_id);