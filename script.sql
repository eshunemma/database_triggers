SELECT *
FROM customers
ORDER BY customer_id;

SELECT * 
FROM customers_log; 

CREATE TRIGGER update_first_last
BEFORE UPDATE ON customers
FOR EACH ROW 
EXECUTE PROCEDURE log_customers_change();

UPDATE customers
SET last_name = 'Eshun'
WHERE customer_id = 3;

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;
/*
UPDATE customers
SET city = 'Kumasi'
WHERE customer_id = 1;

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;
*/

CREATE TRIGGER customer_insert
AFTER INSERT ON customers
FOR EACH STATEMENT
EXECUTE PROCEDURE log_customers_change();


INSERT INTO customers(first_name, last_name, email_address,	home_phone,	city,	state_name,	years_old)
VALUES('Emmanuel', 'Eshun', 'emmanuel.eshun@amalitech.org', 0554488232, 'Kumasi', 'Abuakwa', 25),
('Esther', 'ampong', 'esther.ampong@amalitech.org', 0554488232, 'Kumasi', 'Abuakwa', 25),
('Gary', 'Quainoo', 'gary.q@amalitech.org', 0554488232, 'Kumasi', 'Abuakwa', 25); 

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

CREATE TRIGGER customer_min_age
AFTER UPDATE ON customers
FOR EACH ROW
EXECUTE PROCEDURE override_with_min_age();

UPDATE customers
SET years_old = 10
WHERE customer_id = 5;

UPDATE customers
SET years_old = 50
WHERE customer_id = 6;

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

UPDATE customers
SET first_name = 'Derek',
    years_old = 25
WHERE customer_id = 1;

SELECT * FROM customers
ORDER BY customer_id;

SELECT * FROM customers_log;

DROP TRIGGER IF EXISTS customer_min_age ON
customers;

SELECT * FROM information_schema.triggers;