create or replace procedure sold_by_employee(emp_name in EMPLOYEES.name%type) IS
BEGIN
    DECLARE
        CURSOR sold_by_employee_cursor IS
            SELECT SALES.DATE_OF_SALE,
                   CAR_MODELS.NAME as "Model name",
                   CAR_MARKS.NAME  as "Mark name",
                   CARS.KILOMETERS,
                   COLORS.COLOR,
                   CARS.PRICE,
                   CLIENTS.NAME    as "Client Name"
            FROM sales
                     JOIN employees ON sales.employees_id = employees.id
                     JOIN CLIENTS ON sales.clients_id = clients.id
                     JOIN cars ON sales.cars_id = cars.id
                     JOIN car_models ON cars.car_models_id = car_models.id
                     JOIN car_marks ON car_models.car_marks_id = car_marks.id
                     JOIN colors ON cars.colors_id = colors.id
            WHERE EMPLOYEES.NAME = emp_name
            ORDER BY sales.DATE_OF_SALE;
    BEGIN
        FOR sales_rec in sold_by_employee_cursor
            LOOP
                DBMS_OUTPUT.PUT_LINE(sales_rec.DATE_OF_SALE || ' ' || sales_rec."Model name" || ' ' ||
                                     sales_rec."Mark name" || ' ' || sales_rec.KILOMETERS || ' ' || sales_rec.COLOR ||
                                     ' ' || sales_rec.PRICE || ' ' || sales_rec."Client Name");
            END LOOP;
    end;
end;

call sold_by_employee('Theo Ivanov');

--last 5 sales by date
create or replace procedure last_5_sales_by_date IS
BEGIN
    DECLARE
        CURSOR last_5_sales_by_date_cursor IS
            SELECT *
            FROM (SELECT EMPLOYEES.NAME,
                         SALES.DATE_OF_SALE,
                         CAR_MODELS.NAME as "Model name",
                         CAR_MARKS.NAME  as "Mark name",
                         COLORS.COLOR,
                         CARS.PRICE,
                         CLIENTS.NAME    as "Client Name",
                         CARS.KILOMETERS as "Kilometers"
                  FROM sales
                           JOIN employees ON sales.employees_id = employees.id
                           JOIN CLIENTS ON sales.clients_id = clients.id
                           JOIN cars ON sales.cars_id = cars.id
                           JOIN car_models ON cars.car_models_id = car_models.id
                           JOIN car_marks ON car_models.car_marks_id = car_marks.id
                           JOIN colors ON cars.colors_id = colors.id
                  ORDER BY SALES.DATE_OF_SALE DESC)
            WHERE ROWNUM <= 5
            ORDER BY DATE_OF_SALE DESC;
    BEGIN
        FOR sales_rec in last_5_sales_by_date_cursor
            LOOP
                DBMS_OUTPUT.PUT_LINE(sales_rec.DATE_OF_SALE || ' ' || sales_rec."Model name" || ' ' ||
                                     sales_rec."Mark name" || ' ' || sales_rec."Kilometers" || ' ' || sales_rec.COLOR ||
                                     ' ' || sales_rec.PRICE || ' ' || sales_rec."Client Name");
            END LOOP;
    end;
end;

call last_5_sales_by_date();

--cars bought by client
create or replace procedure cars_bought_by_client(client_name in CLIENTS.name%type) IS
BEGIN
    DECLARE
        CURSOR cars_bought_by_client_cursor IS
            SELECT CLIENTS.NAME,
                   CAR_MODELS.NAME as "Model name",
                   CAR_MARKS.NAME  as "Mark name",
                   COLORS.COLOR,
                   CARS.KILOMETERS,
                   CARS.PRICE,
                   SALES.DATE_OF_SALE,
                   EMPLOYEES.Name  as "Sold by"
            FROM sales
                     JOIN employees ON sales.employees_id = employees.id
                     JOIN CLIENTS ON sales.clients_id = clients.id
                     JOIN cars ON sales.cars_id = cars.id
                     JOIN car_models ON cars.car_models_id = car_models.id
                     JOIN car_marks ON car_models.car_marks_id = car_marks.id
                     JOIN colors ON cars.colors_id = colors.id
            WHERE CLIENTS.NAME = client_name;
    BEGIN
        FOR sales_rec in cars_bought_by_client_cursor
            LOOP
                DBMS_OUTPUT.PUT_LINE(sales_rec.DATE_OF_SALE || ' ' || sales_rec."Model name" || ' ' ||
                                     sales_rec."Mark name" || ' ' || sales_rec.KILOMETERS || ' ' || sales_rec.COLOR ||
                                     ' ' || sales_rec.PRICE || ' ' || sales_rec."Sold by");
            END LOOP;
    end;
end;

call cars_bought_by_client('Ivan Ivanov');

--cars sold between dates
create or replace procedure cars_sold_between_dates(start_date in SALES.DATE_OF_SALE%type,
                                                   end_date in SALES.DATE_OF_SALE%type) IS
BEGIN
    DECLARE
        CURSOR cars_sold_between_dates_cursor IS
            SELECT CLIENTS.NAME,
                   CAR_MODELS.NAME as "Model name",
                   CAR_MARKS.NAME  as "Mark name",
                   COLORS.COLOR,
                   CARS.KILOMETERS,
                   CARS.PRICE,
                   SALES.DATE_OF_SALE,
                   EMPLOYEES.Name  as "Sold by"
            FROM sales
                     JOIN employees ON sales.employees_id = employees.id
                     JOIN CLIENTS ON sales.clients_id = clients.id
                     JOIN cars ON sales.cars_id = cars.id
                     JOIN car_models ON cars.car_models_id = car_models.id
                     JOIN car_marks ON car_models.car_marks_id = car_marks.id
                     JOIN colors ON cars.colors_id = colors.id
            WHERE SALES.DATE_OF_SALE BETWEEN start_date AND end_date;
    BEGIN
        FOR sales_rec in cars_sold_between_dates_cursor
            LOOP
                DBMS_OUTPUT.PUT_LINE(sales_rec.DATE_OF_SALE || ' ' || sales_rec."Model name" || ' ' ||
                                     sales_rec."Mark name" || ' ' || sales_rec.KILOMETERS || ' ' || sales_rec.COLOR ||
                                     ' ' || sales_rec.PRICE || ' ' || sales_rec."Sold by");
            END LOOP;
    end;
end;

call cars_sold_between_dates('01-Jan-2010', '31-JAN-2010');
