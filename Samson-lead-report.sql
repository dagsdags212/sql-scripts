USE lead_gen_business;
-- item 1
SELECT domain_name AS website, client_id
	FROM sites
    WHERE client_id = 15;
-- item 2
SELECT date_format(created_datetime, '%M') AS month, count(*)
	FROM sites
    WHERE MONTH(created_datetime) = 6 AND YEAR(created_datetime) = 2011;
-- item 3
SELECT date_format(charged_datetime, '%Y-%m-%d') AS date, sum(amount)
	FROM billing
    GROUP BY date
    HAVING date = '2012-11-19';
-- item 4
SELECT client_id, sum(amount) AS total_revenue, date_format(charged_datetime, '%M') AS month, year(charged_datetime) AS year
	FROM billing
    WHERE client_id = 1
    GROUP BY month, year;
-- item 5
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, sum(amount) AS total_revenue, date_format(charged_datetime, '%M') AS month_charged, date_format(charged_datetime, '%Y') AS year_charged
	FROM billing
		LEFT JOIN clients
        ON billing.client_id = clients.client_id
    GROUP BY billing.client_id, month_charged, year_charged
    ORDER BY billing.client_id, year_charged, field(month_charged, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
-- item 6
SELECT domain_name AS website, count(domain_name) AS leads
	FROM leads
		LEFT JOIN sites
		ON leads.site_id = sites.site_id
	WHERE registered_datetime BETWEEN '2011-03-15 00:00:00' AND '2011-04-15 23:59:59'
	GROUP BY leads.site_id;
-- item 7
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, domain_name, count(leads_id) AS leads
	FROM sites
		LEFT JOIN clients
		ON sites.client_id = clients.client_id
		LEFT JOIN leads
		ON sites.site_id = leads.site_id
    GROUP BY domain_name
	ORDER BY client_name, domain_name;
-- item 8
SELECT concat(clients.first_name, ' ', clients.last_name) AS owner, COUNT(leads_id) AS number_of_leads
	FROM sites
		LEFT JOIN clients
		ON sites.client_id = clients.client_id
		LEFT JOIN leads
		ON sites.site_id = leads.site_id
	WHERE YEAR(registered_datetime) = 2012
    GROUP BY owner;
-- item 9
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(leads_id) as num_leads, date_format(registered_datetime, '%M') AS month
	FROM sites
		LEFT JOIN clients
        ON sites.client_id = clients.client_id
        LEFT JOIN leads
		ON sites.site_id = leads.site_id
	WHERE date_format(registered_datetime, '%M') < 6 AND date_format(registered_datetime, '%Y') = 2012
	GROUP BY client_name, month
    ORDER BY date_format(registered_datetime, '%m'), clients.first_name;
-- item 10
SELECT concat(clients.first_name, ' ', clients.last_name) AS client_name, COUNT(domain_name) AS number_of_sites, group_concat(domain_name) AS sites
	FROM clients
		LEFT JOIN sites
        ON clients.client_id = sites.client_id
	GROUP BY client_name;