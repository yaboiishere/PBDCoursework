UPDATE EMPLOYEES
SET bonus = bonus + 200
WHERE id = 3;

INSERT INTO employees (name, phone, position_id, bonus) VALUES ('Fireable Employee', '0888888888', 1, 0);

DELETE FROM employees WHERE name = 'Fireable Employee';