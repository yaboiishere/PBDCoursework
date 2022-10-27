-- Get car by car_mark

SELECT * from cars
JOIN car_models ON cars.car_models_id = car_models.id
JOIN car_marks ON car_models.car_marks_id = car_marks.id
WHERE car_marks.name = 'Astra';

-- Get car by car_model
SELECT * from cars
JOIN car_models ON cars.car_models_id = car_models.id
WHERE car_models.name = 'Opel';

-- Get car by color
SELECT * from cars
JOIN colors ON cars.colors_id = colors.id
WHERE colors.name = 'black';

-- Get car by year
SELECT * from cars
WHERE year_of_manufacture = 2010;

