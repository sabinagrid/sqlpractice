--Country with the biggest population
SELECT id, name
FROM countries
ORDER BY population DESC
    LIMIT 1;

--Top 10 countries with the lowest population density
SELECT name
FROM countries
ORDER BY (population / area) ASC
    LIMIT 10;

--Countries with population density higher than average
SELECT name
FROM countries
WHERE (population / area) > (SELECT AVG(population / area) FROM countries);

--Country with the longest name
SELECT name
FROM countries
WHERE LENGTH(name) = (SELECT MAX(LENGTH(name)) FROM countries);

--All countries with names containing "F", sorted alphabetically
SELECT name
FROM countries
WHERE name LIKE '%F%'
ORDER BY name;

--Country with population closest to the average
SELECT id, name, ABS(population - (SELECT AVG(population) FROM countries)) AS diff
FROM countries
ORDER BY diff ASC
    LIMIT 1;

--Count of countries for each continent
SELECT c.name AS continent, COUNT(co.id) AS country_count
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name;

--Total area for each continent, sorted by area
SELECT c.name AS continent, SUM(co.area) AS total_area
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name
ORDER BY total_area DESC;

--Average population density per continent
SELECT c.name AS continent, AVG(co.population / co.area) AS avg_density
FROM continents c
         LEFT JOIN countries co ON c.id = co.continent_id
GROUP BY c.name;

--For each continent, find the country with the smallest area
SELECT c.name AS continent, co.name AS country, co.area
FROM continents c
         JOIN countries co ON c.id = co.continent_id
WHERE co.area = (
    SELECT MIN(area)
    FROM countries
    WHERE continent_id = c.id
);

--Find continents with average country population < 20 million
SELECT c.name AS continent
FROM continents c
         JOIN countries co ON c.id = co.continent_id
GROUP BY c.name
HAVING AVG(co.population) < 20000000;

--Person with the biggest number of citizenships
SELECT p.name, COUNT(cp.country_id) AS citizenships
FROM people p
         JOIN country_people cp ON p.id = cp.person_id
GROUP BY p.id
ORDER BY citizenships DESC
    LIMIT 1;

--All people who have no citizenship
SELECT p.name
FROM people p
         LEFT JOIN country_people cp ON p.id = cp.person_id
WHERE cp.country_id IS NULL;

--Country with the least people in the People table
SELECT c.name, COUNT(cp.person_id) AS person_count
FROM countries c
         LEFT JOIN country_people cp ON c.id = cp.country_id
GROUP BY c.id
ORDER BY person_count ASC
    LIMIT 1;

--Continent with the most people in the People table
SELECT c.name, COUNT(cp.person_id) AS person_count
FROM continents c
         JOIN countries co ON c.id = co.continent_id
         JOIN country_people cp ON co.id = cp.country_id
GROUP BY c.name
ORDER BY person_count DESC
    LIMIT 1;

--Find pairs of people with the same name
SELECT p1.id AS person1_id, p2.id AS person2_id, p1.name
FROM people p1
         JOIN people p2 ON p1.name = p2.name AND p1.id < p2.id;


