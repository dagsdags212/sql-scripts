USE world;
-- item 1
SELECT * FROM country WHERE Continent = 'Europe';
-- item 2
SELECT * FROM country WHERE Continent in ('North America', 'Africa');
-- item 3
SELECT Code AS country_code, country.Name AS country_name, Continent, country.Population AS country_population, city.Name as city FROM country
	LEFT JOIN city
    ON country.Code = city.CountryCode
WHERE country.Population > 100000000;
-- item 4
SELECT Name AS country, language FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE language = 'Spanish';
-- item 5
SELECT Name AS country, language, IsOfficial FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE language = 'Spanish' AND IsOfficial = 'T';
-- item 6
SELECT Name AS country, language FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE language in ('Spanish', 'English') AND IsOfficial = 'T';
-- item 7
SELECT Name as country, Language, Percentage, IsOfficial FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE Language = 'Arabic' AND Percentage > 30 AND IsOfficial = 'F';
-- item 8
SELECT Name as country, Language, IsOfficial, Percentage FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE Language = 'French' AND IsOfficial = 'T' AND Percentage < 50;
-- item 9
SELECT Name as country, Language, IsOfficial FROM country
	LEFT JOIN countrylanguage
    ON country.Code = countrylanguage.CountryCode
WHERE IsOfficial = 'T'
ORDER BY Language;
-- item 10
SELECT country.Name AS country, city.Name as city, Language, IsOfficial FROM city
	LEFT JOIN countrylanguage
	ON city.CountryCode = countrylanguage.CountryCode
    LEFT JOIN country
	ON city.CountryCode = country.Code
WHERE IsOfficial = 'T'
ORDER BY city.Population DESC;
-- item 11
SELECT country.Name AS Country, LifeExpectancy, city.Name AS City, city.Population FROM country
	LEFT JOIN city
    ON country.Code = city.CountryCode
WHERE LifeExpectancy < 40
ORDER BY city.Population DESC
LIMIT 100;
-- item 12
SELECT country.Name AS Country, city.Name AS City, LifeExpectancy FROM country
	LEFT JOIN city
    ON country.Code = city.CountryCode
    LEFT JOIN countrylanguage
	ON country.Code = countrylanguage.CountryCode
WHERE Language = 'English'
ORDER BY LifeExpectancy DESC
LIMIT 100;
	

