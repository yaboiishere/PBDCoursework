
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

-- colors insert procedure
CREATE OR REPLACE PROCEDURE colors_insert
(
    v_colors_name colors.color%TYPE
) AS
    BEGIN
    INSERT INTO COLORS (color) VALUES (v_colors_name);
END;

BEGIN
colors_insert('testred');
end;

select * from colors;
delete from colors where color = 'testred';

--car insert procedure
CREATE OR REPLACE PROCEDURE car_insert
(
    v_car_models_name car_models.name%TYPE,
    v_car_marks_name car_marks.name%TYPE,
    v_colors_name colors.color%TYPE,
    v_car_year cars.YEAR_OF_MANUFACTURE%TYPE,
    v_car_price cars.PRICE%TYPE,
    v_car_kilometers cars.KILOMETERS%TYPE
) AS
    BEGIN
        CAR_MODELS_INSERT(v_car_models_name, v_car_marks_name);
        COLORS_INSERT(v_colors_name);
        declare
            idd Number;
            idd2 Number;
        Begin
            SELECT ID INTO idd FROM CAR_MODELS  where NAME = v_car_models_name;
            SELECT ID INTO idd2 FROM COLORS  where COLOR = v_colors_name;
            INSERT INTO CARS (CAR_MODELS_ID, COLORS_ID, YEAR_OF_MANUFACTURE, PRICE, KILOMETERS)
            VALUES (idd, idd2, v_car_year, v_car_price, v_car_kilometers);
        End;
END;

BEGIN
car_insert('BMW', 'X5testtt', 'red', 2010, 10000, 100000);
end;