USE sakila;
-- item 1
SELECT country, COUNT(customer_id)
	FROM customer
		LEFT JOIN address
        ON customer.address_id = address.address_id
        LEFT JOIN city
        ON address.city_id = city.city_id
        LEFT JOIN country
        ON city.country_id = country.country_id
	GROUP BY country
    ORDER BY country ASC;
-- item 2
SELECT country, city, COUNT(customer_id)
	FROM customer
		LEFT JOIN address
        ON customer.address_id = address.address_id
        LEFT JOIN city
        ON address.city_id = city.city_id
        LEFT JOIN country
        ON city.country_id = country.country_id
	GROUP BY city, country;
-- item 3
SELECT  DATE_FORMAT(payment_date, '%M-%Y') AS month_and_year, SUM(amount) AS total_rental_amount, COUNT(rental.rental_id) AS total_transactions, AVG(amount) AS average_rental_amount
	FROM customer
		LEFT JOIN rental
        ON customer.customer_id = rental.customer_id
        LEFT JOIN payment
        ON rental.rental_id = payment.rental_id
	GROUP BY month_and_year
	ORDER BY YEAR(month_and_year);
-- item 4
SELECT DATE_FORMAT(payment_date, '%h %p') AS hour_of_the_day, SUM(amount) AS total_payment_received
	FROM payment
    GROUP BY hour_of_the_day
    ORDER BY total_payment_received DESC;