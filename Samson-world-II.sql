USE world;
-- item 1
SELECT Continent, COUNT(*) AS total_countries, AVG(LifeExpectancy) AS life_expectancy
	FROM country
    WHERE LifeExpectancy > 70
    GROUP BY Continent;
-- item 2
SELECT Continent, COUNT(*) AS total_countries, AVG(LifeExpectancy) AS life_expectancy
	FROM country
    WHERE LifeExpectancy BETWEEN 60 AND 70
    GROUP BY Continent;
-- item 3
SELECT Name AS country, AVG(LifeExpectancy) AS life_expectancy
	FROM country
    WHERE LifeExpectancy > 75
    GROUP BY country;
-- item 4
SELECT Name AS country, AVG(LifeExpectancy) AS life_expectancy
	FROM country
    WHERE LifeExpectancy < 40
    GROUP BY country;
-- item 5
SELECT Name AS country, SUM(Population) as population
	FROM country
    GROUP BY country
    ORDER BY population DESC
    LIMIT 10;
-- item 6
SELECT SUM(Population) AS total_population
	FROM country;
-- item 7
SELECT Continent, SUM(Population) AS total_population
	FROM country
    GROUP BY Continent
    HAVING total_population > 500000000;
-- item 8
SELECT Continent, COUNT(Name) AS total_countries, SUM(Population) AS total_population, AVG(LifeExpectancy) AS life_expectancy
	FROM country
    GROUP BY Continent
    HAVING life_expectancy < 71;
-- item 9
SELECT country.Name AS country, COUNT(city.Name)
	FROM country
		LEFT JOIN city
        ON country.Code = city.CountryCode
	GROUP BY country;
-- item 10
SELECT Language, COUNT(country.Name) AS total_countries
	FROM country
		LEFT JOIN countrylanguage
        ON country.Code = countrylanguage.CountryCode
	GROUP BY Language;
-- item 11
SELECT Language, COUNT(country.Name) AS total_countries, IsOFficial
	FROM countrylanguage
		RIGHT JOIN country
		ON countrylanguage.CountryCode = country.Code
	WHERE IsOfficial = 'T'
	GROUP BY Language;
-- item 12
SELECT Continent, COUNT(city.Name) AS total_cities, AVG(city.Population) AS average_cities_population
	FROM country
		LEFT JOIN city
		ON country.Code = city.CountryCode
	GROUP BY Continent;
-- item 13 
SELECT Language, SUM(Population * Percentage / 100) AS total_population
	FROM countrylanguage
		LEFT JOIN country
        ON countrylanguage.CountryCode = country.Code
	GROUP BY Language
    ORDER BY total_population DESC;