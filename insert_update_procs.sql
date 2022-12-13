-- insert car_marks
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
select * from car_marks;
-- update car_marks
CREATE OR REPLACE PROCEDURE car_marks_update
(
    car_marks_id car_marks.id%TYPE,
    car_marks_name car_marks.name%TYPE
) AS
BEGIN
    UPDATE CAR_MARKS SET name = car_marks_name WHERE id = car_marks_id;
END;

BEGIN
    car_marks_update(21, 'BMW2test');
END;

--insert car_models
CREATE OR REPLACE PROCEDURE car_models_insert
(
    car_models_name car_models.name%TYPE,
    car_models_car_mark_id car_models.car_marks_id%TYPE
) AS
BEGIN
    INSERT INTO CAR_MODELS (name, car_marks_id) VALUES (car_models_name, car_models_car_mark_id);
END;

BEGIN
    car_models_insert('X5lol', 21);
END;

select * from car_models;

--update car_models

CREATE OR REPLACE PROCEDURE car_models_update
(
    car_models_id car_models.id%TYPE,
    car_models_name car_models.name%TYPE,
    car_models_car_mark_id car_models.car_marks_id%TYPE
) AS
BEGIN
    UPDATE CAR_MODELS SET name = car_models_name, car_marks_id = car_models_car_mark_id WHERE id = car_models_id;
END;

BEGIN
    car_models_update(21, 'X5test', 21);
END;

--insert car_colors
CREATE OR REPLACE PROCEDURE car_colors_insert
(
    car_colors_name COLORS.COLOR%TYPE
) AS
BEGIN
    INSERT INTO COLORS (color) VALUES (car_colors_name);
END;

BEGIN
    car_colors_insert('redlol');
END;

select * from colors;

--update car_colors
CREATE OR REPLACE PROCEDURE car_colors_update
(
    car_colors_id COLORS.ID%TYPE,
    car_colors_name COLORS.COLOR%TYPE
) AS
BEGIN
    UPDATE COLORS SET color = car_colors_name WHERE id = car_colors_id;
END;

BEGIN
    car_colors_update(22, 'redtest');
END;

--insert car
CREATE OR REPLACE PROCEDURE car_insert
(
    car_model_id CARS.CAR_MODELS_ID%TYPE,
    car_color_id CARS.COLORS_ID%TYPE,
    car_year CARS.YEAR_OF_MANUFACTURE%TYPE,
    car_price CARS.PRICE%TYPE,
    car_kilometers CARS.KILOMETERS%TYPE
) AS
BEGIN
    INSERT INTO CARS (car_models_id, colors_id, year_of_manufacture, price, kilometers) VALUES (car_model_id, car_color_id, car_year, car_price, car_kilometers);
END;

BEGIN
    car_insert(21, 22, 2015, 100000, 100000);
END;

select * from cars
join CAR_MODELS CM on CM.ID = CARS.CAR_MODELS_ID
join CAR_MARKS CM2 on CM2.ID = CM.CAR_MARKS_ID
join COLORS C on C.ID = CARS.COLORS_ID
where C.COLOR = 'redtest';

--update car
CREATE OR REPLACE PROCEDURE car_update
(
    car_id CARS.ID%TYPE,
    car_model_id CARS.CAR_MODELS_ID%TYPE,
    car_color_id CARS.COLORS_ID%TYPE,
    car_year CARS.YEAR_OF_MANUFACTURE%TYPE,
    car_price CARS.PRICE%TYPE,
    car_kilometers CARS.KILOMETERS%TYPE
) AS
BEGIN
    UPDATE CARS SET car_models_id = car_model_id, colors_id = car_color_id, year_of_manufacture = car_year, price = car_price, kilometers = car_kilometers WHERE id = car_id;
END;

BEGIN
    car_update(21, 21, 22, 2015, 10, 999999);
END;

-- insert city
CREATE OR REPLACE PROCEDURE city_insert
(
    city_name CITY.NAME%TYPE
) AS
BEGIN
    INSERT INTO CITY (name) VALUES (city_name);
END;

BEGIN
    city_insert('CityLol');
END;

select * from city;

-- update city
CREATE OR REPLACE PROCEDURE city_update
(
    city_id CITY.ID%TYPE,
    city_name CITY.NAME%TYPE
) AS
BEGIN
    UPDATE CITY SET name = city_name WHERE id = city_id;
END;

BEGIN
    city_update(21, 'CityTest');
END;

-- insert clients
CREATE OR REPLACE PROCEDURE clients_insert
(
    clients_name CLIENTS.NAME%TYPE,
    clients_address CLIENTS.ADDRESS%TYPE,
    clients_phone CLIENTS.PHONE%TYPE,
    clients_city_id CLIENTS.CITY_ID%TYPE
) AS
BEGIN
    INSERT INTO CLIENTS (name, address, phone, city_id) VALUES (clients_name, clients_address, clients_phone, clients_city_id);
END;

BEGIN
    clients_insert('ClientLol', 'ClientAddressLol', 'PhoneLol', 21);
END;

select * from clients;

-- update clients
CREATE OR REPLACE PROCEDURE clients_update
(
    clients_id CLIENTS.ID%TYPE,
    clients_name CLIENTS.NAME%TYPE,
    clients_address CLIENTS.ADDRESS%TYPE,
    clients_phone CLIENTS.PHONE%TYPE,
    clients_city_id CLIENTS.CITY_ID%TYPE
) AS
BEGIN
    UPDATE CLIENTS SET name = clients_name, address = clients_address, phone = clients_phone, city_id = clients_city_id WHERE id = clients_id;
END;

BEGIN
    clients_update(21, 'ClientTest', 'ClientAddressTest', 'PhoneTest', 21);
END;

-- insert positions
CREATE OR REPLACE PROCEDURE positions_insert
(
    positions_name POSITION.NAME%TYPE,
    positions_payment POSITION.PAYMENT%TYPE
) AS
BEGIN
    INSERT INTO POSITION (name, payment) VALUES (positions_name, positions_payment);
END;

BEGIN
    positions_insert('PositionLol', 100);
END;

select * from position;

-- update positions
CREATE OR REPLACE PROCEDURE positions_update
(
    positions_id POSITION.ID%TYPE,
    positions_name POSITION.NAME%TYPE,
    positions_payment POSITION.PAYMENT%TYPE
) AS
BEGIN
    UPDATE POSITION SET name = positions_name, payment = positions_payment WHERE id = positions_id;
END;

BEGIN
    positions_update(21, 'PositionTest', 1000);
END;

-- insert employees
CREATE OR REPLACE PROCEDURE employees_insert
(
    employees_name EMPLOYEES.NAME%TYPE,
    employees_position_id EMPLOYEES.POSITION_ID%TYPE,
    employees_phone EMPLOYEES.PHONE%TYPE,
    employees_bonus EMPLOYEES.BONUS%TYPE
) AS
BEGIN
    INSERT INTO EMPLOYEES (name, position_id, phone, bonus) VALUES (employees_name, employees_position_id, employees_phone, employees_bonus);
END;

BEGIN
    employees_insert('EmployeeLol', 21, 'PhoneLol', 100);
END;

select * from employees;

-- update employees
CREATE OR REPLACE PROCEDURE employees_update
(
    employees_id EMPLOYEES.ID%TYPE,
    employees_name EMPLOYEES.NAME%TYPE,
    employees_position_id EMPLOYEES.POSITION_ID%TYPE,
    employees_phone EMPLOYEES.PHONE%TYPE,
    employees_bonus EMPLOYEES.BONUS%TYPE
) AS
BEGIN
    UPDATE EMPLOYEES SET name = employees_name, position_id = employees_position_id, phone = employees_phone, bonus = employees_bonus WHERE id = employees_id;
END;

BEGIN
    employees_update(21, 'EmployeeTest', 21, 'PhoneTest', 1000);
END;

-- insert sales
CREATE OR REPLACE PROCEDURE sales_insert
(
    sales_date SALES.DATE_OF_SALE%TYPE,
    sales_clients_id SALES.CLIENTS_ID%TYPE,
    sales_employees_id SALES.EMPLOYEES_ID%TYPE,
    sales_car_id SALES.CARS_ID%TYPE
) AS
BEGIN
    INSERT INTO SALES (date_of_sale, clients_id, employees_id, cars_id) VALUES (sales_date, sales_clients_id, sales_employees_id, sales_car_id);
END;

BEGIN
    sales_insert('01.JAN.1970', 21, 21, 21);
END;

select * from sales;

-- update sales
CREATE OR REPLACE PROCEDURE sales_update
(
    sales_id SALES.ID%TYPE,
    sales_date SALES.DATE_OF_SALE%TYPE,
    sales_clients_id SALES.CLIENTS_ID%TYPE,
    sales_employees_id SALES.EMPLOYEES_ID%TYPE,
    sales_car_id SALES.CARS_ID%TYPE
) AS
BEGIN
    UPDATE SALES SET date_of_sale = sales_date, clients_id = sales_clients_id, employees_id = sales_employees_id, cars_id = sales_car_id WHERE id = sales_id;
END;

BEGIN
    sales_update(41, '01.Feb.1970', 21, 21, 21);
END;