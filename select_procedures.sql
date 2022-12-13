create or replace procedure sold_by_employee(emp_name in EMPLOYEES.name%type) IS
BEGIN
    DECLARE
    CURSOR sales_cursor IS
        SELECT SALES.DATE_OF_SALE, CAR_MODELS.NAME as "Model name", CAR_MARKS.NAME as "Mark name", CARS.KILOMETERS, COLORS.COLOR, CARS.PRICE, CLIENTS.NAME as "Client Name" FROM sales
        JOIN employees ON sales.employees_id = employees.id
        JOIN CLIENTS ON sales.clients_id = clients.id
        JOIN cars ON sales.cars_id = cars.id
        JOIN car_models ON cars.car_models_id = car_models.id
        JOIN car_marks ON car_models.car_marks_id = car_marks.id
        JOIN colors ON cars.colors_id = colors.id
        WHERE EMPLOYEES.NAME = emp_name
        ORDER BY sales.DATE_OF_SALE;
    BEGIN
        FOR sales_rec in sales_cursor
        LOOP
            DBMS_OUTPUT.PUT_LINE(sales_rec.DATE_OF_SALE || ' ' || sales_rec."Model name" || ' ' || sales_rec."Mark name" || ' ' || sales_rec.KILOMETERS || ' ' || sales_rec.COLOR || ' ' || sales_rec.PRICE || ' ' || sales_rec."Client Name");
        END LOOP;
    end;
end;

call sold_by_employee('Theo Ivanov');