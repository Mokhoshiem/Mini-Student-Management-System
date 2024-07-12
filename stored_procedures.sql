--  A procedure that inserts a new record to student table.
CREATE OR REPLACE PROCEDURE add_student( f_name VARCHAR, l_name VARCHAR, mail VARCHAR, dob DATE)
LANGUAGE SQL
BEGIN ATOMIC
INSERT INTO Student(first_name,last_name,email,date_of_birth) VALUES (f_name, l_name, mail,dob);
END;

-- A function That calculates the age based on date_of_birth

CREATE OR REPLACE FUNCTION calculate_age(dob DATE)
RETURNS INT
AS $$
BEGIN
    RETURN EXTRACT(YEAR FROM NOW()) - EXTRACT(YEAR FROM dob);
END;
$$
LANGUAGE plpgsql;