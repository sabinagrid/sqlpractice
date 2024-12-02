CREATE TABLE continents (
                            id SERIAL PRIMARY KEY,
                            name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE countries (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL UNIQUE,
                           population BIGINT NOT NULL,
                           area FLOAT NOT NULL,
                           continent_id INT REFERENCES continents(id) ON DELETE CASCADE
);

CREATE TABLE people (
                        id SERIAL PRIMARY KEY,
                        name VARCHAR(100) NOT NULL,
                        country_id INT REFERENCES countries(id) ON DELETE CASCADE
);

CREATE TABLE country_people (
                                country_id INT REFERENCES countries(id) ON DELETE CASCADE,
                                person_id INT REFERENCES people(id) ON DELETE CASCADE,
                                PRIMARY KEY (country_id, person_id)
);