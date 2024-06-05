psql --username=freecodecamp --dbname=postgres
CREATE DATABASE universe;

\ c universe;

create table galaxy(
  galaxy_id SERIAL NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  description TEXT UNIQUE,
  Mass INT,
  Distance_from_earth INT,
  Galaxy_type varchar(20),
  Diameter NUMERIC,
  Has_supernovae boolean,
  Has_nebulae boolean,
  Age INT,
  Black_holes_present boolean
);

create table star(
  star_id SERIAL NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  description TEXT UNIQUE,
  Type varchar(20),
  Radius INT,
  Luminosity NUMERIC,
  Temperature INT,
  Age NUMERIC,
  Has_planets boolean,
  galaxy_id SERIAL,
  CONSTRAINT galaxy_stars FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id)
);

create table planet(
  planet_id SERIAL NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  description TEXT UNIQUE,
  Type varchar(20),
  Radius INT,
  Orbital_period NUMERIC,
  Distance_from_star INT,
  Age NUMERIC,
  Has_rings boolean,
  star_id SERIAL,
  CONSTRAINT star_planet FOREIGN KEY(star_id) REFERENCES star(star_id)
);

create table moon(
  moon_id SERIAL NOT NULL PRIMARY KEY,
  name varchar(30) NOT NULL,
  description TEXT UNIQUE,
  Planet_orbiting varchar(20),
  Mass INT,
  Radius INT,
  Has_atmosphere boolean,
  Has_water boolean,
  Has_life boolean,
  Rotation_period NUMERIC,
  planet_id SERIAL,
  CONSTRAINT planet_moon FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);

INSERT INTO galaxy (name, description, Mass, Distance_from_earth, Galaxy_type, Diameter, Has_supernovae, Has_nebulae, Age, Black_holes_present) VALUES
('Milky Way', 'The galaxy that contains our Solar System.', 150, 0, 'Spiral', 10, TRUE, TRUE, 137, TRUE),
('Andromeda', 'The nearest spiral galaxy to the Milky Way.', 3, 250, 'Spiral', 22, TRUE, TRUE, 1, TRUE),
('Triangulum', 'A member of the Local Group of galaxies.', 50, 3, 'Spiral', 6, FALSE, TRUE, 1, TRUE),
('Whirlpool', 'A classic spiral galaxy.', 160, 23, 'Spiral', 6, TRUE, TRUE, 5, TRUE),
('Sombrero', 'A spiral galaxy in the Virgo constellation.', 80, 29, 'Spiral', 5, TRUE, TRUE, 10, TRUE),
('Cartwheel', 'A ring galaxy in the constellation Sculptor.', 1, 5, 'Ring', 15, TRUE, TRUE, 5, TRUE),
('Messier 87', 'A supergiant elliptical galaxy in the Virgo constellation.', 6, 53, 'Elliptical', 24, TRUE, TRUE, 110, TRUE),
('Centaurus A', 'A lenticular galaxy in the constellation Centaurus.', 1, 13, 'Lenticular', 6, TRUE, TRUE, 110, TRUE),
('NGC 13', 'A barred spiral galaxy in the constellation Eridanus.', 180, 61, 'Barred Spiral', 11, TRUE, TRUE, 1, TRUE),
('NGC 4565', 'A spiral galaxy in the constellation Coma Berenices.', 2, 3150, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 4038', 'A peculiar galaxy in the constellation Corvus.', 150, 65, 'Peculiar', 750, TRUE, TRUE, 1, TRUE),
('NGC 5128', 'A galaxy in the constellation Centaurus.', 120, 10, 'Lenticular', 6, TRUE, TRUE, 110, TRUE),
('NGC 4258', 'A spiral galaxy in the constellation Canes Venatici.', 150, 25, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 4631', 'A barred spiral galaxy in the constellation Canes Venatici.', 160, 25, 'Barred Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 4826', 'A spiral galaxy in the constellation Coma Berenices.', 150, 17, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 5194', 'A spiral galaxy in the constellation Canes Venatici.', 150, 23, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 6946', 'A barred spiral galaxy in the constellation Cepheus.', 160, 18, 'Barred Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 253', 'A spiral galaxy in the constellation Sculptor.', 150, 11, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 3', 'A spiral galaxy in the constellation Sculptor.', 150, 6, 'Spiral', 10, TRUE, TRUE, 1, TRUE),
('NGC 3628', 'A spiral galaxy in the constellation Leo.', 150, 35, 'Spiral', 10, TRUE, TRUE, 1, TRUE);


INSERT INTO star (name, description, Type, Radius, Luminosity, Temperature, Age, Has_planets, galaxy_id) VALUES
('Sun', 'The star at the center of the Solar System.', 'G-type', 6964, 1.0, 5778, 4.6, TRUE, 16),
('Proxima Centauri', 'The closest known star to the Sun.', 'M-type', 69634, 0.17, 3042, 4.85, TRUE, 16),
('Sirius A', 'The brightest star in the night sky.', 'A-type', 11896, 25.4, 9940, 0.24, FALSE, 16),
('Alpha Centauri A', 'A star in the closest star system to the Solar System.', 'G-type', 864340, 1.52, 5790, 4.85, TRUE, 16),
('Alpha Centauri B', 'B star in the closest star system to the Solar System.', 'K-type', 695510, 0.5, 5232, 4.85, TRUE, 16),
('Barnards Star', 'A red dwarf star in the constellation Ophiuchus.', 'M-type', 7, 0.35, 3134, 10.0, TRUE, 17),
('Wolf 359', 'B red dwarf star in the constellation Leo.', 'M-type', 620, 0.18, 28, 7.9, TRUE, 17),
('Luytens Star', 'C red dwarf star in the constellation Canis Minor.', 'M-type', 7, 0.35, 3134, 8.5, TRUE, 17),
('Tau Ceti', 'A star in the constellation Cetus.', 'G-type', 793840, 0.52, 5344, 5.8, TRUE, 17),
('Epsilon Eridani', 'A star in the constellation Eridanus.', 'K-type', 731520, 0.34, 5144, 0.85, TRUE, 17),
('Vega', 'A star in the constellation Lyra.', 'A-type', 12137, 40.12, 9602, 0.45, FALSE, 21),
('Altair', 'A star in the constellation Aquila.', 'A-type', 14960, 10.6, 7550, 1.2, FALSE, 21),
('Fomalhaut', 'A star in the constellation Piscis Austrinus.', 'A-type', 14220, 16.6, 8590, 0.44, TRUE, 21),
('Betelgeuse', 'A red supergiant star in the constellation Orion.', 'M-type', 12345, 1260, 35, 8.5, FALSE, 21),
('Rigel', 'A blue supergiant star in the constellation Orion.', 'B-type', 78730, 12, 12130, 8.5, FALSE, 21),
('Aldebaran', 'A red giant star in the constellation Taurus.', 'K-type', 43870, 518, 3910, 6.5, TRUE, 22),
('Antares', 'A red supergiant star in the constellation Scorpius.', 'M-type', 883, 6, 35, 12.0, FALSE, 22),
('Spica', 'A binary star system in the constellation Virgo.', 'B-type', 740, 128, 226, 12.5, FALSE, 22),
('Pollux', 'An orange giant star in the constellation Gemini.', 'K-type', 88780, 32.7, 4865, 1.12, TRUE, 22),
('Arcturus', 'A red giant star in the constellation Boötes.', 'K-type', 18347, 170, 4286, 7.1, TRUE, 22);



INSERT INTO planet (name, description, Type, Radius, Orbital_period, Distance_from_star, Age, Has_rings, star_id) VALUES
('Earth', 'The third planet from the Sun.', 'Terrestrial', 6371, 365.25, 14960, 4.5, FALSE, 71),
('Mars', 'The fourth planet from the Sun 2', 'Terrestrial', 3389, 687, 22790, 4.6, FALSE, 71),
('Jupiter', 'The largest planet in the Solar System.', 'Gas Giant', 69911, 4332.59, 77850, 4.5, TRUE, 71),
('Saturn', 'The sixth planet from the Sun.', 'Gas Giant', 58232, 10759, 1434, 4.5, TRUE, 71),
('Uranus', 'The seventh planet from the Sun 2', 'Ice Giant', 25362, 30687, 2871, 4.5, TRUE, 71),
('Neptune', 'The eighth planet from the Sun 3', 'Ice Giant', 24622, 60190, 4495, 4.5, TRUE, 71),
('Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri.', 'Terrestrial', 7150, 11.186, 748, 4.85, FALSE, 72),
('Alpha Centauri Bb', 'A hot exoplanet orbiting Alpha Centauri B.', 'Terrestrial', 48, 3.2, 610, 4.85, FALSE, 72),
('Kepler-452b', 'An exoplanet orbiting Kepler-452.', 'Super-Earth', 1, 385.84, 14960, 6, FALSE, 73),
('TRAPPIST-1d', 'An exoplanet orbiting TRAPPIST-1.', 'Terrestrial', 6150, 4.05, 383, 7.6, FALSE, 73),
('Gliese 581g', 'A potentially habitable exoplanet.', 'Super-Earth', 83, 36.6, 20, 7.5, FALSE, 74),
('HD 189733 b', 'A gas giant exoplanet known for its blue color.', 'Gas Giant', 618, 2.2, 48, 4.4, TRUE, 74),
('55 Cancri e', 'A super-Earth exoplanet with extreme temperatures.', 'Super-Earth', 76, 0.74, 41, 8, FALSE, 75),
('Tau Ceti e', 'A potentially habitable exoplanet 2.', 'Super-Earth', 89, 168.1, 12, 5.8, FALSE, 75),
('Kepler-22b', 'An exoplanet in the habitable zone of Kepler-22.', 'Super-Earth', 89, 289.9, 60, 6, FALSE, 76),
('Wolf 1061c', 'An exoplanet orbiting Wolf 1061.', 'Super-Earth', 93, 17.87, 1380, 4.5, FALSE, 76),
('Kapteyn b', 'An exoplanet orbiting Kapteyns Star.', 'Super-Earth', 80, 48.62, 46, 11.5, FALSE, 77),
('Ross 128 b', 'An exoplanet orbiting Ross 128.', 'Terrestrial', 55, 9.87, 1120, 9.8, FALSE, 77),
('Luyten b', 'An exoplanet orbiting Luytens Star.', 'Terrestrial', 54, 18.6, 12, 6, FALSE, 78),
('Teegarden b', 'An exoplanet orbiting Teegardens Star.', 'Terrestrial', 51, 4.91, 12, 8, FALSE, 78);

INSERT INTO moon (name, description, Planet_orbiting, Mass, Radius, Has_atmosphere, Has_water, Has_life, Rotation_period, planet_id) VALUES
('Moon', 'The only natural satellite of Earth.', 'Earth', 7342, 1737, FALSE, FALSE, FALSE, 27.3, 41),
('Europa', 'A moon of Jupiter with a possible subsurface ocean.', 'Jupiter', 48, 1561, TRUE, TRUE, FALSE, 3.55, 43),
('Io', 'The most volcanically active body in the Solar System.', 'Jupiter', 893190, 1821, FALSE, FALSE, FALSE, 1.77, 43),
('Phobos', 'A moon of Mars.', 'Mars', 10660, 11, FALSE, FALSE, FALSE, 0.319, 42),
('Triton', 'The largest moon of Neptune.', 'Neptune', 214080, 1353, TRUE, FALSE, FALSE, 5.88, 46),
('Titan', 'The largest moon of Saturn and the only moon known to have a dense atmosphere.', 'Saturn', 13452, 2575, TRUE, TRUE, FALSE, 15.94, 44),
('Ganymede', 'The largest moon of Jupiter and the Solar System.', 'Jupiter', 14819, 2634, FALSE, TRUE, FALSE, 7.15, 43),
('Callisto', 'A heavily cratered moon of Jupiter.', 'Jupiter', 10759, 2410, FALSE, FALSE, FALSE, 16.69, 43),
('Enceladus', 'A moon of Saturn known for its geysers.', 'Saturn', 1080, 252, TRUE, TRUE, FALSE, 1.37, 44),
('Mimas', 'The smallest and innermost of Saturns major moons.', 'Saturn', 37493, 198, FALSE, FALSE, FALSE, 0.94, 44),
('Oberon', 'The second largest moon of Uranus.', 'Uranus', 301, 761, FALSE, FALSE, FALSE, 13.46, 45),
('Titania', 'The largest moon of Uranus.', 'Uranus', 340, 789, FALSE, FALSE, FALSE, 8.71, 45),
('Miranda', 'A moon of Uranus with extreme surface features.', 'Uranus', 66, 235, FALSE, FALSE, FALSE, 1.41, 45),
('Ariel', 'A moon of Uranus with a surface covered by valleys and canyons.', 'Uranus', 13530, 578, FALSE, FALSE, FALSE, 2.52, 45),
('Umbriel', 'A dark moon of Uranus.', 'Uranus', 11720, 584, FALSE, FALSE, FALSE, 4.14, 45),
('Charon', 'The largest moon of Pluto, half the size of Pluto itself.', 'Pluto', 15980, 606, FALSE, FALSE, FALSE, 6.39, 47),
('Deimos', 'The smaller of Mars two moons.', 'Mars', 148, 6, FALSE, FALSE, FALSE, 1.26, 42),
('Nereid', 'The third-largest moon of Neptune.', 'Neptune', 320, 340, FALSE, FALSE, FALSE, 360.13, 46),
('Proteus', 'A dark moon of Neptune.', 'Neptune', 44, 210, FALSE, FALSE, FALSE, 1.12, 46),
('Dione', 'A moon of Saturn known for its icy surface.', 'Saturn', 11, 561, FALSE, FALSE, FALSE, 2.74, 44),
('Iapetus', 'A moon of Saturn with a distinctive two-tone coloration.', 'Saturn', 1810, 735, FALSE, FALSE, FALSE, 79.33, 44),
('Rhea', 'The second largest moon of Saturn.', 'Saturn', 23, 764, FALSE, FALSE, FALSE, 4.52, 44),
('Tethys', 'A mid-sized moon of Saturn with a large impact crater.', 'Saturn', 61730, 531, FALSE, FALSE, FALSE, 1.89, 44),
('Hyperion', 'A moon of Saturn known for its chaotic rotation.', 'Saturn', 56, 135, FALSE, FALSE, FALSE, 21.28, 44);


CREATE TABLE satellite (
  satellite_id SERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  description TEXT UNIQUE,
  Type VARCHAR(20), 
  Diameter NUMERIC,
  Orbit_distance NUMERIC,
  Orbital_period NUMERIC,
  Mass NUMERIC,
  Has_ring BOOLEAN,
  planet_id SERIAL,
  CONSTRAINT planet_satellite FOREIGN KEY(planet_id) REFERENCES planet(planet_id)
);


INSERT INTO satellite (name, description, Type, Diameter, Orbit_distance, Orbital_period, Mass, Has_ring, planet_id) VALUES
('Ceres', 'The largest object in the asteroid belt between Mars and Jupiter.', 'Asteroid', 940, 414000, 1680, 9.39e20, FALSE, 41),
('Halleys Comet', 'A short-period comet visible from Earth approximately every 76 years.', 'Comet', 11, 1700000000, 75.3, 2.2e14, TRUE, 41),
('Phobos', 'The larger of Mars two moons.', 'Minor Moon', 22.4, 9376, 0.319, 1.0659e16, FALSE, 42),
('Deimos', 'The smaller of Mars two moons.', 'Minor Moon', 12.4, 23460, 1.26, 1.471e15, FALSE, 42),
('Eris', 'A dwarf planet in the scattered disc.', 'Dwarf Planet', 2390, 1670000000, 557, 1.66e22, FALSE, 35),
('Pluto', 'A dwarf planet in the Kuiper belt.', 'Dwarf Planet', 1188, 590000000, 90, 1.31e22, FALSE, 36),
('Io', 'A moon of Jupiter, known for its volcanic activity.', 'Minor Moon', 1821.6, 421700, 1.77, 8.93e22, FALSE, 37),
('Titan', 'The second-largest moon of Saturn, with a dense atmosphere.', 'Minor Moon', 5150, 1222000, 15.94, 1.35e23, TRUE, 42);
