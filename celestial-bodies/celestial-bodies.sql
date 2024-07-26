-- Criação do banco de dados
CREATE DATABASE universe;

-- Conectar ao banco de dados
\c universe

-- Criação da tabela galaxy
CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    age NUMERIC NOT NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE,
    description TEXT
);

-- Criação da tabela star
CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    temperature NUMERIC,
    has_planets BOOLEAN NOT NULL DEFAULT TRUE,
    brightness INT,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Criação da tabela planet
CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    star_id INT NOT NULL,
    diameter NUMERIC,
    is_habitable BOOLEAN NOT NULL DEFAULT FALSE,
    orbit_period INT NOT NULL,
    FOREIGN KEY (star_id) REFERENCES star(star_id)
);

-- Criação da tabela moon
CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    planet_id INT NOT NULL,
    radius NUMERIC,
    has_water BOOLEAN NOT NULL DEFAULT FALSE,
    orbital_period INT NOT NULL,
    FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

-- Criação da tabela nebula
CREATE TABLE nebula (
    nebula_id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL,
    size NUMERIC,
    is_visible BOOLEAN NOT NULL DEFAULT TRUE,
    distance_from_earth NUMERIC,
    FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

-- Inserção de dados na tabela galaxy
INSERT INTO galaxy (name, age, is_active, description) VALUES
('Milky Way', 13.8, TRUE, 'Our home galaxy.'),
('Andromeda', 10.0, TRUE, 'Nearest galaxy to Milky Way.'),
('Triangulum', 3.0, TRUE, 'Small spiral galaxy.'),
('Whirlpool', 1.5, TRUE, 'Beautiful spiral galaxy.'),
('Messier 82', 2.0, TRUE, 'Cigar-shaped galaxy.'),
('Messier 87', 1.5, TRUE, 'Contains a supermassive black hole.');

-- Inserção de dados na tabela star
INSERT INTO star (name, galaxy_id, temperature, has_planets, brightness) VALUES
('Sun', 1, 5778, TRUE, 100),
('Proxima Centauri', 1, 3050, TRUE, 0.5),
('Sirius', 1, 9940, TRUE, 25),
('Betelgeuse', 1, 3500, TRUE, 0.5),
('Altair', 1, 7550, TRUE, 10),
('Rigel', 1, 12100, TRUE, 85);

-- Inserção de dados na tabela planet
INSERT INTO planet (name, star_id, diameter, is_habitable, orbit_period) VALUES
('Earth', 1, 12742, TRUE, 365),
('Mars', 1, 6779, FALSE, 687),
('Venus', 1, 12104, FALSE, 225),
('Jupiter', 1, 139820, FALSE, 4333),
('Saturn', 1, 116460, FALSE, 10759),
('Uranus', 1, 50724, FALSE, 30687),
('Neptune', 1, 49244, FALSE, 60190),
('Mercury', 1, 4879, FALSE, 88),
('Pluto', 1, 2376, FALSE, 90560),
('Eris', 1, 2326, FALSE, 100000),
('Haumea', 1, 1960, FALSE, 2830),
('Makemake', 1, 1430, FALSE, 111800);

-- Inserção de dados na tabela moon
INSERT INTO moon (name, planet_id, radius, has_water, orbital_period) VALUES
('Moon', 1, 1737, TRUE, 27),
('Phobos', 2, 11, FALSE, 0.3),
('Deimos', 2, 6, FALSE, 1.3),
('Io', 4, 1821, FALSE, 1.8),
('Europa', 4, 1560, TRUE, 3.5),
('Ganymede', 4, 2634, FALSE, 7.2),
('Callisto', 4, 2400, FALSE, 16.7),
('Titan', 5, 2575, TRUE, 15.9),
('Rhea', 5, 764, FALSE, 4.5),
('Iapetus', 5, 735, FALSE, 79.3),
('Dione', 5, 561, FALSE, 2.7),
('Tethys', 5, 533, FALSE, 1.9),
('Enceladus', 5, 252, TRUE, 1.4),
('Mimas', 5, 198, FALSE, 0.9),
('Miranda', 6, 235, FALSE, 1.4),
('Ariel', 6, 578, FALSE, 2.5),
('Umbriel', 6, 584, FALSE, 4.1),
('Titania', 6, 788, FALSE, 8.7),
('Oberon', 6, 761, FALSE, 13.5),
('Charon', 9, 606, TRUE, 6.4);

-- Inserção de dados na tabela nebula
INSERT INTO nebula (name, galaxy_id, size, is_visible, distance_from_earth) VALUES
('Orion Nebula', 1, 24.0, TRUE, 1344),
('Crab Nebula', 1, 11.0, TRUE, 6500),
('Eagle Nebula', 1, 70.0, TRUE, 7000),
('Helix Nebula', 1, 2.5, TRUE, 700),
('Carina Nebula', 1, 300.0, TRUE, 7500);
