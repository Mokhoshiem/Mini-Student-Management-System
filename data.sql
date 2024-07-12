INSERT INTO student(first_name,last_name,email,date_of_birth)
VALUES 
        ('Mohamed','Abokhoshiem','mohamed.Abokhosihem@gmail.com','1991-05-30'),
        ('Adham','Medhat','Adham.Medhat@email.com','2000-01-01'),
        ('Kareem','Tarek','Karem.Tarek@email.com','2005-02-27'),
        ('Abdallah','Albanna','Abdallah.Albanna.com','1997-05-13'),
        ('Mohamed','Elmihy','Mohamed.Elmihy@email.com','1997-05-13'),
        ('Khaled','Younes','Khaled.Younes@gmail.com','1999-08-13'),
        ('Raed','Salah','Raed12@hotmail.com','2004-10-13'),
        ('Yasser','Alaa','Yasser@email.com','2007-04-20'),
        ('Sameh','Ali','Mr.Sameh@gmail.com','1995-05-15'),
        ('Jane','Doe','Jane.Doe@gmail.com.com','2008-5-13');

INSERT INTO instructor(first_name,last_name,email)
VALUES ('Ahmed','Essam','Ahmed.Essam@gmail.com'),
        ('Ahmed','Azab','Ahmed.Azab@hotmail.com'),
        ('Ahmed','Abd Alshafy','Ahmed.Shafy@email.com');

INSERT INTO course(course_name,course_description)
VALUES 
        ('Microsoft Data Engineer','A course in Data and AI track provided by DEPI which aims to help graduates find online freelacnce jobs'),
        ('Power BI Developer','A course in Data and Analytics track provided by DEPI which aims to help graduates find online freelacnce jobs'),
        ('Data Science Track','A course in Data Science track provided by DEPI which aims to help graduates find online freelacnce jobs'),
        ('Machine Learning Engineer','A course in Machine Learining track provided by DEPI which aims to help graduates find online freelacnce jobs'),
        ('Dev Ops Engineer','A course in Dev Ops track provided by DEPI which aims to help graduates find online freelacnce jobs');

INSERT INTO enrollment(student_id,course_id,instructor_id,enrollment_date)
VALUES 
        (1,1,1,'2024-04-30'),
        (2,1,1,'2024-04-30'),
        (3,1,1,'2024-04-30'),
        (4,1,1,'2024-04-30'),
        (2,2,2,'2024-04-30'),
        (3,2,1,'2024-04-30'),
        (10,5,2,'2024-05-15'),
        (9,5,2,'2024-05-15'),
        (8,3,3,'2024-06-02'),
        (7,5,2,'2024-05-15'),
        (5,5,1,'2024-05-15'),
        (4,5,2,'2024-05-15'),
        (8,5,1,'2024-05-15'),
        (6,5,1,'2024-05-15'),
        (1,3,3,'2024-05-15');