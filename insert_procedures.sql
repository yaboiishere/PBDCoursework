
--car_marks insert procedure
CREATE OR REPLACE PROCEDURE car_marks_insert
(
    car_marks_name car_marks.name%TYPE
) AS
    BEGIN
    INSERT INTO CAR_MARKS (name) VALUES (car_marks_name);
END;

BEGIN
car_marks_insert('BMW2lol');
END;


--car_models insert procedure
CREATE OR REPLACE PROCEDURE car_models_insert
(
    v_car_models_name car_models.name%TYPE,
    v_car_marks_name car_marks.name%TYPE
) AS
    BEGIN
        CAR_MARKS_INSERT(v_car_marks_name);
        declare
            idd Number;
        Begin
            SELECT ID INTO idd FROM CAR_MARKS  where NAME = v_car_marks_name;
            INSERT INTO CAR_MODELS (NAME, CAR_MARKS_ID ) VALUES (v_car_models_name, idd);
        End;
END;
select * from SYS.USER_ERRORS where NAME = 'CAR_MODELS_INSERT' and type = 'PROCEDURE';

BEGIN
car_models_insert('BMW', 'X5');
END;

SELECT CAR_MODELS.ID, CAR_MODELS.NAME, CM.NAME from CAR_MODELS JOIN CAR_MARKS CM on CM.ID = CAR_MODELS.CAR_MARKS_ID;
SELECT * from CAR_MARKS;

DELETE FROM car_marks WHERE name = 'BMW2lol';
SELECT id FROM CAR_MARKS WHERE NAME = 'X5';