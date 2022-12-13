-- Get car by car_mark

SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE car_marks.name = 'Astra';

-- Get car by car_model
SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE car_models.name = 'Opel';

-- Get car by color
SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE colors.color = 'Black';

-- Get car by year
SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE year_of_manufacture = 2000;

-- Get car by kilometers
SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE KILOMETERS < 300000;

-- Get car by price
SELECT CAR_MODELS.NAME, CAR_MARKS.NAME, COLORS.COLOR, PRICE, YEAR_OF_MANUFACTURE, KILOMETERS from cars
JOIN colors ON cars.colors_id = colors.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE PRICE < 10000;

-- Get all sales by employee sorted by date
SELECT SALES.DATE_OF_SALE, CAR_MODELS.NAME as "Model name", CAR_MARKS.NAME as "Mark name", CARS.KILOMETERS, COLORS.COLOR, CARS.PRICE, CLIENTS.NAME as "Client Name" FROM sales
JOIN employees ON sales.employees_id = employees.id
JOIN CLIENTS ON sales.clients_id = clients.id
JOIN cars ON sales.cars_id = cars.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
JOIN colors ON cars.colors_id = colors.id
WHERE EMPLOYEES.NAME = 'Theo Ivanov'
-- WHERE EMPLOYEES_ID = 2
-- WHERE EMPLOYEES.NAME = ?
ORDER BY sales.DATE_OF_SALE;

-- last 5 sales sorted by date
SELECT * FROM (  SELECT EMPLOYEES.NAME, SALES.DATE_OF_SALE, CAR_MODELS.NAME as "Model name", CAR_MARKS.NAME as "Mark name", COLORS.COLOR, CARS.PRICE, CLIENTS.NAME as "Client Name" FROM sales
JOIN employees ON sales.employees_id = employees.id
JOIN CLIENTS ON sales.clients_id = clients.id
JOIN cars ON sales.cars_id = cars.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
JOIN colors ON cars.colors_id = colors.id
ORDER BY SALES.DATE_OF_SALE DESC)  WHERE ROWNUM <= 5 ORDER BY PRICE DESC;

--cars bought by client
SELECT CLIENTS.NAME, CAR_MODELS.NAME as "Model name", CAR_MARKS.NAME as "Mark name", COLORS.COLOR, CARS.KILOMETERS, CARS.PRICE, SALES.DATE_OF_SALE, EMPLOYEES.Name as "Sold by" FROM sales
JOIN employees ON sales.employees_id = employees.id
JOIN CLIENTS ON sales.clients_id = clients.id
JOIN cars ON sales.cars_id = cars.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
JOIN colors ON cars.colors_id = colors.id
-- WHERE CLIENTS.NAME = 'Stoyan Stoyanov';
WHERE CLIENTS.NAME = ?;

--cars sold between dates
SELECT EMPLOYEES.NAME, SALES.DATE_OF_SALE, CAR_MODELS.NAME as "Model name", CAR_MARKS.NAME as "Mark name", COLORS.COLOR, CARS.KILOMETERS, CARS.PRICE, CLIENTS.NAME as "Client Name" FROM sales
JOIN employees ON sales.employees_id = employees.id
JOIN CLIENTS ON sales.clients_id = clients.id
JOIN cars ON sales.cars_id = cars.id
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
JOIN colors ON cars.colors_id = colors.id
-- WHERE SALES.DATE_OF_SALE BETWEEN TO_DATE('2010-01-01', 'yyyy-mm-dd') AND TO_DATE('2010-01-31', 'yyyy-mm-dd')
WHERE SALES.DATE_OF_SALE BETWEEN TO_DATE(?, 'yyyy-mm-dd') AND TO_DATE(?, 'yyyy-mm-dd')
ORDER BY sales.DATE_OF_SALE;
