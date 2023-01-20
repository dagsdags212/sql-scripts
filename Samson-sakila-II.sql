USE sakila;
-- item 1
SELECT * FROM customer;  
-- item 2 
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address 
FROM customer 
	LEFT JOIN address 
    ON customer.address_id = address.address_id;
-- item 3
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city
FROM customer
	LEFT JOIN address
	ON customer.address_id = address.address_id
	LEFT JOIN city
    ON address.city_id = city.city_id;
-- item 4
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city, country
FROM customer
	LEFT JOIN address
	ON customer.address_id = address.address_id
	LEFT JOIN city
    ON address.city_id = city.city_id
    LEFT JOIN country
    ON city.country_id = country.country_id
ORDER BY country, city;
-- item 5
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city, country
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
    LEFT JOIN country
	ON city.country_id = country.country_id
WHERE country = 'Bolivia';
-- item 6
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city, country
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
    LEFT JOIN country
	ON city.country_id = country.country_id
WHERE country in ('Bolivia', 'Germany', 'Greece')
ORDER BY country;
-- item 7
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city, country
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
    LEFT JOIN country
	ON city.country_id = country.country_id
WHERE city = 'Baku';
-- item 8
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, address, city, country
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
	LEFT JOIN country
    ON city.country_id = country.country_id
WHERE city in ('Baku', 'Beira', 'Bergamo');
-- item 9
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, country, LENGTH(country) as country_name_length
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
	LEFT JOIN country
    ON city.country_id = country.country_id
WHERE LENGTH(country) < 5
ORDER BY LENGTH(customer_name) DESC;
-- item 10
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, country, city, LENGTH(city) AS city_name_length
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
	LEFT JOIN country
    ON city.country_id = country.country_id
WHERE LENGTH(city) > 10
ORDER BY country;
-- item 11
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, city
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
WHERE city LIKE 'Ba%' OR city LIKE '%ba%' OR city LIKE '%ba';
-- item 12
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, city, LENGTH(city) as city_name_length
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
WHERE city LIKE '% %'
ORDER BY city_name_length DESC;
-- item 13
SELECT CONCAT(customer.first_name, ' ', customer.last_name) AS customer_name, city, country, LENGTH(city) AS city_name_length, LENGTH(country) AS country_name_length
FROM customer
	LEFT JOIN address
    ON customer.address_id = address.address_id
    LEFT JOIN city
    ON address.city_id = city.city_id
    LEFT JOIN country
    ON city.country_id = country.country_id
WHERE LENGTH(country) > LENGTH(city);