CREATE TABLE car_marks (
    id   INTEGER NOT NULL,
    name VARCHAR2(50) NOT NULL
);

ALTER TABLE car_marks ADD CONSTRAINT car_marks_pk PRIMARY KEY ( id );

CREATE TABLE car_models (
    id           INTEGER NOT NULL,
    name         VARCHAR2(50) NOT NULL,
    car_marks_id INTEGER NOT NULL
);

ALTER TABLE car_models ADD CONSTRAINT car_models_pk PRIMARY KEY ( id );

CREATE TABLE cars (
    id                  INTEGER NOT NULL,
    year_of_manufacture INTEGER NOT NULL,
    kilometers          INTEGER NOT NULL,
    price               NUMBER(8, 2) NOT NULL,
    car_models_id       INTEGER NOT NULL,
    colors_id           INTEGER NOT NULL
);

ALTER TABLE cars ADD CONSTRAINT cars_pk PRIMARY KEY ( id );

CREATE TABLE city (
    id   INTEGER NOT NULL,
    name VARCHAR2(50) NOT NULL
);

ALTER TABLE city ADD CONSTRAINT city_pk PRIMARY KEY ( id );

CREATE TABLE clients (
    id      INTEGER NOT NULL,
    name    VARCHAR2(60) NOT NULL,
    phone   VARCHAR2(11) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    city_id INTEGER NOT NULL
);

ALTER TABLE clients ADD CONSTRAINT clients_pk PRIMARY KEY ( id );

CREATE TABLE colors (
    id    INTEGER NOT NULL,
    color VARCHAR2(20) NOT NULL
);

ALTER TABLE colors ADD CONSTRAINT colors_pk PRIMARY KEY ( id );

CREATE TABLE employees (
    id          INTEGER NOT NULL,
    name        VARCHAR2(60) NOT NULL,
    phone       VARCHAR2(11) NOT NULL,
    position_id INTEGER NOT NULL,
    bonus       NUMBER(8, 2)
);

ALTER TABLE employees ADD CONSTRAINT employees_pk PRIMARY KEY ( id );

CREATE TABLE position (
    id      INTEGER NOT NULL,
    name    VARCHAR2(60) NOT NULL,
    payment NUMBER(8, 2) NOT NULL
);

ALTER TABLE position ADD CONSTRAINT position_pk PRIMARY KEY ( id );

CREATE TABLE sales (
    id           INTEGER NOT NULL,
    date_of_sale DATE NOT NULL,
    clients_id   INTEGER NOT NULL,
    cars_id      INTEGER NOT NULL,
    employees_id INTEGER NOT NULL
);

ALTER TABLE sales ADD CONSTRAINT sales_pk PRIMARY KEY ( id );

ALTER TABLE car_models
    ADD CONSTRAINT car_models_car_marks_fk FOREIGN KEY ( car_marks_id )
        REFERENCES car_marks ( id );

ALTER TABLE cars
    ADD CONSTRAINT cars_car_models_fk FOREIGN KEY ( car_models_id )
        REFERENCES car_models ( id );

ALTER TABLE cars
    ADD CONSTRAINT cars_colors_fk FOREIGN KEY ( colors_id )
        REFERENCES colors ( id );

ALTER TABLE clients
    ADD CONSTRAINT clients_city_fk FOREIGN KEY ( city_id )
        REFERENCES city ( id );

ALTER TABLE employees
    ADD CONSTRAINT employees_position_fk FOREIGN KEY ( position_id )
        REFERENCES position ( id );

ALTER TABLE sales
    ADD CONSTRAINT sales_cars_fk FOREIGN KEY ( cars_id )
        REFERENCES cars ( id );

ALTER TABLE sales
    ADD CONSTRAINT sales_clients_fk FOREIGN KEY ( clients_id )
        REFERENCES clients ( id );

ALTER TABLE sales
    ADD CONSTRAINT sales_employees_fk FOREIGN KEY ( employees_id )
        REFERENCES employees ( id );


