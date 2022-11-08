--insert into car_marks (name) values

INSERT INTO car_marks (name) VALUES ('A3');
INSERT INTO car_marks (name) VALUES ('A4');
INSERT INTO car_marks (name) VALUES ('A5');
INSERT INTO car_marks (name) VALUES ('Astra');
INSERT INTO car_marks (name) VALUES ('Vectra');
INSERT INTO car_marks (name) VALUES ('Corsa');
INSERT INTO car_marks (name) VALUES ('Clio');
INSERT INTO car_marks (name) VALUES ('Megane');
INSERT INTO car_marks (name) VALUES ('Laguna');
INSERT INTO car_marks (name) VALUES ('9-3');
INSERT INTO car_marks (name) VALUES ('9-5');

--insert into car_models (name, car_marks_id) values

INSERT INTO car_models (name, car_marks_id) VALUES ('Audi', 1);
INSERT INTO car_models (name, car_marks_id) VALUES ('Audi', 2);
INSERT INTO car_models (name, car_marks_id) VALUES ('Audi', 3);
INSERT INTO car_models (name, car_marks_id) VALUES ('Opel', 4);
INSERT INTO car_models (name, car_marks_id) VALUES ('Opel', 5);
INSERT INTO car_models (name, car_marks_id) VALUES ('Opel', 6);
INSERT INTO car_models (name, car_marks_id) VALUES ('Renault', 7);
INSERT INTO car_models (name, car_marks_id) VALUES ('Renault', 8);
INSERT INTO car_models (name, car_marks_id) VALUES ('Renault', 9);
INSERT INTO car_models (name, car_marks_id) VALUES ('Saab', 10);
INSERT INTO car_models (name, car_marks_id) VALUES ('Saab', 11);

--insert into colors (name) values

INSERT INTO colors (color) VALUES ('Black');
INSERT INTO colors (color) VALUES ('White');
INSERT INTO colors (color) VALUES ('Red');
INSERT INTO colors (color) VALUES ('Blue');
INSERT INTO colors (color) VALUES ('Green');
INSERT INTO colors (color) VALUES ('Yellow');

--insert into cars (car_models_id, colors_id, price, year_of_manufacture, kilometers)

INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (1, 1, 10000, 2000, 104523);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (2, 2, 20000, 2001, 100230);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (3, 3, 25000, 2002, 130121);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (4, 4, 3000, 2003, 202012);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (5, 5, 3000, 2004, 240705);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (6, 1, 2200, 2005, 203005);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (7, 2, 2300, 2006, 234005);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (8, 3, 2400, 2007, 208535);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (9, 4, 2500, 2008, 200235);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (10, 5, 4600, 2003, 200235);
INSERT INTO cars (car_models_id, colors_id, price, year_of_manufacture, kilometers) VALUES (11, 1, 5700, 2004, 200235);

--insert into city (name) values

INSERT INTO city (name) VALUES ('Varna');
INSERT INTO city (name) VALUES ('Sofia');
INSERT INTO city (name) VALUES ('Plovdiv');
INSERT INTO city (name) VALUES ('Burgas');
INSERT INTO city (name) VALUES ('Ruse');

--insert into clients CREATE TABLE clients ( name, phone, address, city_id);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Ivan Ivanov', '0888888888', 'Studentska 2', 1);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Petar Petrov', '0888888888', 'Studentska 1', 2);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Georgi Georgiev', '0888888888', 'Jelezni Vrata 5', 1);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Stoyan Stoyanov', '0888888888', 'Roza 7', 4);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Ivan Petrov', '0888888888', 'Ruse 15', 1);
INSERT INTO clients (name, phone, address, city_id) VALUES ('Ivan Georgiev', '0888888888', 'Nikola Kozlev 25', 1);

--insert position (name, payment) values
INSERT INTO position (name, payment) VALUES ('Manager', 1000);
INSERT INTO position (name, payment) VALUES ('Sales', 500);
INSERT INTO position (name, payment) VALUES ('Accountant', 800);
INSERT INTO position (name, payment) VALUES ('CEO', 4000);

-- CREATE TABLE employees (
--     id          INTEGER NOT NULL,
--     name        VARCHAR2(60) NOT NULL,
--     phone       VARCHAR2(11) NOT NULL,
--     position_id INTEGER NOT NULL,
--     bonus       NUMBER(8, 2)
-- );

INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Theo Ivanov', '0888888888', 1, 100);
INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Gethin Petrov', '0888888888', 2, 200);
INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Kane Lee', '0888888888', 2, 300);
INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Calvin Ralph', '0888888888', 2, 300);
INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Georgi Georgiev', '0888888888', 3, 300);
INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Yusuf Eden', '0888888888', 4, 400);

-- CREATE TABLE sales (
--     id           INTEGER NOT NULL,
--     date_of_sale DATE NOT NULL,
--     clients_id   INTEGER NOT NULL,
--     cars_id      INTEGER NOT NULL,
--     employees_id INTEGER NOT NULL
-- );

INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('14.JAN.2010', 1, 1, 1);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('15.JAN.2010', 2, 2, 1);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('29.JAN.2010', 3, 4, 2);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('06.FEB.2010', 4, 5, 2);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('06.FEB.2010', 4, 7, 2);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('09.FEB.2010', 5, 8, 3);
INSERT INTO sales (date_of_sale, clients_id, cars_id, employees_id) VALUES ('02.MAR.2010', 6, 10, 3);