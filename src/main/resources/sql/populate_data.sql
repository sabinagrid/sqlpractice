INSERT INTO continents (name)
VALUES
    ('Africa'),
    ('Asia'),
    ('Europe'),
    ('North America'),
    ('South America'),
    ('Oceania'),
    ('Antarctica');


INSERT INTO countries (name, population, area, continent_id)
VALUES
    ('Nigeria', 206139589, 923768, 1),
    ('South Africa', 59308690, 1219090, 1),
    ('China', 1439323776, 9596961, 2),
    ('India', 1380004385, 3287263, 2),
    ('Germany', 83783942, 357022, 3),
    ('France', 65273511, 551695, 3),
    ('United States', 331002651, 9833517, 4),
    ('Canada', 37742154, 9984670, 4),
    ('Brazil', 212559417, 8515767, 5),
    ('Argentina', 45195774, 2780400, 5),
    ('Australia', 25499884, 7692024, 6);


INSERT INTO people (name, country_id)
VALUES
    ('John Doe', 3),
    ('Jane Smith', 5),
    ('Mary Johnson', 7),
    ('James Brown', 8),
    ('Emily Davis', 1),
    ('Michael Wilson', 10),
    ('Sarah Johnson', 9),
    ('James Brown', 5);


INSERT INTO country_people (country_id, person_id)
VALUES
    (3, 1),
    (5, 2),
    (7, 3),
    (8, 4),
    (1, 5),
    (10, 6),
    (9, 7),
    (5, 8);