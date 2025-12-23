
CREATE DATABASE universe;

\c universe


CREATE TABLE galaxy (
    galaxy_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    galaxy_types VARCHAR(50),
    distance_from_earth NUMERIC
);


CREATE TABLE star (
    star_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
    description TEXT,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    star_type VARCHAR(50),
    temperature NUMERIC
);


CREATE TABLE planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    star_id INT NOT NULL REFERENCES star(star_id),
    description TEXT,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    planet_types VARCHAR(50),
    diameter_km NUMERIC
);


CREATE TABLE moon (
    moon_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    planet_id INT NOT NULL REFERENCES planet(planet_id),
    description TEXT,
    has_life BOOLEAN NOT NULL,
    is_spherical BOOLEAN NOT NULL,
    age_in_millions_of_years INT NOT NULL,
    orbital_period_days NUMERIC,
    radius_km NUMERIC
);


CREATE TABLE comet (
    comet_id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE NOT NULL,
    description TEXT,
    is_periodic BOOLEAN NOT NULL,
    orbit_period_years NUMERIC,
    last_seen_year INT
);


INSERT INTO galaxy VALUES
(1,'Milky Way','Our home galaxy',true,true,13600,'Spiral',0),
(2,'Andromeda','Nearest spiral galaxy',false,true,10000,'Spiral',2537000),
(3,'Triangulum','Small spiral galaxy',false,true,5000,'Spiral',3000000),
(4,'Sombrero','Bright galaxy',false,true,8800,'Spiral',29000000),
(5,'Whirlpool','Interacting galaxy',false,true,4000,'Spiral',31000000),
(6,'Messier 87','Supergiant galaxy',false,true,12000,'Elliptical',55000000);


INSERT INTO star VALUES
(1,'Sun',1,'Home star',true,true,4600,'G-Type',5778),
(2,'Sirius',1,'Brightest star',false,true,300,'A-Type',9940),
(3,'Alpha Centauri',1,'Closest system',false,true,6000,'G-Type',5790),
(4,'Betelgeuse',1,'Red supergiant',false,true,8000,'M-Type',3500),
(5,'Vega',1,'Bright star',false,true,450,'A-Type',9602),
(6,'Polaris',1,'North Star',false,true,7000,'F-Type',6015);


INSERT INTO planet VALUES
(1,'Mercury',1,'Small planet',false,true,4500,'Terrestrial',4879),
(2,'Venus',1,'Hot planet',false,true,4600,'Terrestrial',12104),
(3,'Earth',1,'Life planet',true,true,4500,'Terrestrial',12742),
(4,'Mars',1,'Red planet',false,true,4600,'Terrestrial',6779),
(5,'Jupiter',1,'Gas giant',false,true,4600,'Gas Giant',139820),
(6,'Saturn',1,'Ringed planet',false,true,4600,'Gas Giant',116460),
(7,'Uranus',1,'Ice giant',false,true,4600,'Ice Giant',50724),
(8,'Neptune',1,'Cold planet',false,true,4600,'Ice Giant',49244),
(9,'Kepler-22b',2,'Exoplanet',false,true,4000,'Exoplanet',50000),
(10,'Proxima b',3,'Nearby exoplanet',false,true,4500,'Exoplanet',11000),
(11,'HD 209458 b',2,'Hot Jupiter',false,true,3000,'Gas Giant',140000),
(12,'Gliese 581c',3,'Rocky exoplanet',false,true,5000,'Exoplanet',15000);


INSERT INTO moon VALUES
(1,'Moon',3,'Earth moon',false,true,4500,27,1737),
(2,'Phobos',4,'Mars moon',false,true,4500,0.3,11),
(3,'Deimos',4,'Mars moon',false,true,4500,1.3,6),
(4,'Io',5,'Volcanic moon',false,true,4500,1.8,1821),
(5,'Europa',5,'Icy moon',false,true,4500,3.5,1560),
(6,'Ganymede',5,'Largest moon',false,true,4500,7.1,2634),
(7,'Callisto',5,'Cratered moon',false,true,4500,16.7,2410),
(8,'Titan',6,'Atmospheric moon',false,true,4500,15.9,2575),
(9,'Rhea',6,'Saturn moon',false,true,4500,4.5,763),
(10,'Iapetus',6,'Two-tone moon',false,true,4500,79,734),
(11,'Dione',6,'Icy moon',false,true,4500,2.7,561),
(12,'Tethys',6,'Ice moon',false,true,4500,1.9,531),
(13,'Miranda',7,'Broken moon',false,true,4500,1.4,236),
(14,'Ariel',7,'Uranus moon',false,true,4500,2.5,578),
(15,'Umbriel',7,'Dark moon',false,true,4500,4.1,584),
(16,'Titania',7,'Largest Uranus moon',false,true,4500,8.7,788),
(17,'Oberon',7,'Outer moon',false,true,4500,13.5,761),
(18,'Triton',8,'Retrograde moon',false,true,4500,5.9,1353),
(19,'Nereid',8,'Irregular moon',false,true,4500,360,170),
(20,'Proteus',8,'Dark moon',false,true,4500,1.1,210);


INSERT INTO comet VALUES
(1,'Halley','Famous comet',true,75,1986),
(2,'Hale-Bopp','Bright comet',false,2500,1997),
(3,'Encke','Short-period comet',true,3.3,2017);
