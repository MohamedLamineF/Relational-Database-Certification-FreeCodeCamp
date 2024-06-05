--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    mass integer,
    distance_from_earth integer,
    galaxy_type character varying(20),
    diameter numeric,
    has_supernovae boolean,
    has_nebulae boolean,
    age integer,
    black_holes_present boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_orbiting character varying(20),
    mass integer,
    radius integer,
    has_atmosphere boolean,
    has_water boolean,
    has_life boolean,
    rotation_period numeric,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(20),
    radius integer,
    orbital_period numeric,
    distance_from_star integer,
    age numeric,
    has_rings boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(20),
    diameter numeric,
    orbit_distance numeric,
    orbital_period numeric,
    mass numeric,
    has_ring boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_planet_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_planet_id_seq OWNED BY public.satellite.planet_id;


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    type character varying(20),
    radius integer,
    luminosity numeric,
    temperature integer,
    age numeric,
    has_planets boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: satellite planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN planet_id SET DEFAULT nextval('public.satellite_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (16, 'Milky Way', 'The galaxy that contains our Solar System.', 150, 0, 'Spiral', 10, true, true, 13700, true);
INSERT INTO public.galaxy VALUES (17, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 300, 250, 'Spiral', 22, true, true, 1, true);
INSERT INTO public.galaxy VALUES (18, 'Triangulum', 'A member of the Local Group of galaxies.', 50, 300, 'Spiral', 6, false, true, 1, true);
INSERT INTO public.galaxy VALUES (19, 'Whirlpool', 'A classic spiral galaxy with a distinctive spiral structure.', 160, 2300, 'Spiral', 6, true, true, 500, true);
INSERT INTO public.galaxy VALUES (20, 'Sombrero', 'A spiral galaxy with a large central bulge in the Virgo constellation.', 80, 2900, 'Spiral', 5, true, true, 1000, true);
INSERT INTO public.galaxy VALUES (21, 'Cartwheel', 'A ring galaxy with a distinctive cartwheel shape.', 100, 5, 'Ring', 15, true, true, 500, true);
INSERT INTO public.galaxy VALUES (22, 'Messier 87', 'A supergiant elliptical galaxy with a prominent jet.', 600, 5300, 'Elliptical', 24, true, true, 11000, true);
INSERT INTO public.galaxy VALUES (23, 'Centaurus A', 'A lenticular galaxy with a massive black hole.', 100, 1300, 'Lenticular', 6, true, true, 11000, true);
INSERT INTO public.galaxy VALUES (24, 'NGC 1300', 'A barred spiral galaxy with a well-defined bar.', 180, 6100, 'Barred Spiral', 11, true, true, 1, true);
INSERT INTO public.galaxy VALUES (25, 'NGC 4565', 'A spiral galaxy seen edge-on.', 200, 3150, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (26, 'NGC 4038', 'A peculiar galaxy undergoing a collision.', 150, 6500, 'Peculiar', 75000, true, true, 1, true);
INSERT INTO public.galaxy VALUES (27, 'NGC 5128', 'A galaxy with a prominent dust lane.', 120, 1000, 'Lenticular', 6, true, true, 11000, true);
INSERT INTO public.galaxy VALUES (28, 'NGC 4258', 'A spiral galaxy with unusual emission lines.', 150, 2500, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (29, 'NGC 4631', 'A barred spiral galaxy with a distinctive whale-like shape.', 160, 2500, 'Barred Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (30, 'NGC 4826', 'A spiral galaxy known as the Black Eye Galaxy.', 150, 1700, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (31, 'NGC 5194', 'A spiral galaxy interacting with NGC 5195.', 150, 2300, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (32, 'NGC 6946', 'A barred spiral galaxy with a high rate of star formation.', 160, 1800, 'Barred Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (33, 'NGC 253', 'A spiral galaxy known as the Sculptor Galaxy.', 150, 1100, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (34, 'NGC 300', 'A spiral galaxy in the constellation Sculptor.', 150, 600, 'Spiral', 10, true, true, 1, true);
INSERT INTO public.galaxy VALUES (35, 'NGC 3628', 'A spiral galaxy in the constellation Leo.', 150, 3500, 'Spiral', 10, true, true, 1, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (25, 'Moon', 'The only natural satellite of Earth.', 'Earth', 7342, 1737, false, false, false, 27.3, 41);
INSERT INTO public.moon VALUES (26, 'Europa', 'A moon of Jupiter with a possible subsurface ocean.', 'Jupiter', 48, 1561, true, true, false, 3.55, 43);
INSERT INTO public.moon VALUES (27, 'Io', 'The most volcanically active body in the Solar System.', 'Jupiter', 893190, 1821, false, false, false, 1.77, 43);
INSERT INTO public.moon VALUES (28, 'Phobos', 'A moon of Mars.', 'Mars', 10660, 11, false, false, false, 0.319, 42);
INSERT INTO public.moon VALUES (29, 'Triton', 'The largest moon of Neptune.', 'Neptune', 214080, 1353, true, false, false, 5.88, 46);
INSERT INTO public.moon VALUES (30, 'Titan', 'The largest moon of Saturn and the only moon known to have a dense atmosphere.', 'Saturn', 13452, 2575, true, true, false, 15.94, 44);
INSERT INTO public.moon VALUES (31, 'Ganymede', 'The largest moon of Jupiter and the Solar System.', 'Jupiter', 14819, 2634, false, true, false, 7.15, 43);
INSERT INTO public.moon VALUES (32, 'Callisto', 'A heavily cratered moon of Jupiter.', 'Jupiter', 10759, 2410, false, false, false, 16.69, 43);
INSERT INTO public.moon VALUES (33, 'Enceladus', 'A moon of Saturn known for its geysers.', 'Saturn', 1080, 252, true, true, false, 1.37, 44);
INSERT INTO public.moon VALUES (34, 'Mimas', 'The smallest and innermost of Saturns major moons.', 'Saturn', 37493, 198, false, false, false, 0.94, 44);
INSERT INTO public.moon VALUES (35, 'Oberon', 'The second largest moon of Uranus.', 'Uranus', 301, 761, false, false, false, 13.46, 45);
INSERT INTO public.moon VALUES (36, 'Titania', 'The largest moon of Uranus.', 'Uranus', 340, 789, false, false, false, 8.71, 45);
INSERT INTO public.moon VALUES (37, 'Miranda', 'A moon of Uranus with extreme surface features.', 'Uranus', 66, 235, false, false, false, 1.41, 45);
INSERT INTO public.moon VALUES (38, 'Ariel', 'A moon of Uranus with a surface covered by valleys and canyons.', 'Uranus', 13530, 578, false, false, false, 2.52, 45);
INSERT INTO public.moon VALUES (39, 'Umbriel', 'A dark moon of Uranus.', 'Uranus', 11720, 584, false, false, false, 4.14, 45);
INSERT INTO public.moon VALUES (40, 'Charon', 'The largest moon of Pluto, half the size of Pluto itself.', 'Pluto', 15980, 606, false, false, false, 6.39, 47);
INSERT INTO public.moon VALUES (41, 'Deimos', 'The smaller of Mars two moons.', 'Mars', 148, 6, false, false, false, 1.26, 42);
INSERT INTO public.moon VALUES (42, 'Nereid', 'The third-largest moon of Neptune.', 'Neptune', 320, 340, false, false, false, 360.13, 46);
INSERT INTO public.moon VALUES (43, 'Proteus', 'A dark moon of Neptune.', 'Neptune', 44, 210, false, false, false, 1.12, 46);
INSERT INTO public.moon VALUES (44, 'Dione', 'A moon of Saturn known for its icy surface.', 'Saturn', 11, 561, false, false, false, 2.74, 44);
INSERT INTO public.moon VALUES (45, 'Iapetus', 'A moon of Saturn with a distinctive two-tone coloration.', 'Saturn', 1810, 735, false, false, false, 79.33, 44);
INSERT INTO public.moon VALUES (46, 'Rhea', 'The second largest moon of Saturn.', 'Saturn', 23, 764, false, false, false, 4.52, 44);
INSERT INTO public.moon VALUES (47, 'Tethys', 'A mid-sized moon of Saturn with a large impact crater.', 'Saturn', 61730, 531, false, false, false, 1.89, 44);
INSERT INTO public.moon VALUES (48, 'Hyperion', 'A moon of Saturn known for its chaotic rotation.', 'Saturn', 56, 135, false, false, false, 21.28, 44);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (35, 'Earth', 'The third planet from the Sun.', 'Terrestrial', 6371, 365.25, 14960, 4.5, false, 71);
INSERT INTO public.planet VALUES (36, 'Mars', 'The fourth planet from the Sun 2', 'Terrestrial', 3389, 687, 22790, 4.6, false, 71);
INSERT INTO public.planet VALUES (37, 'Jupiter', 'The largest planet in the Solar System.', 'Gas Giant', 69911, 4332.59, 77850, 4.5, true, 71);
INSERT INTO public.planet VALUES (38, 'Saturn', 'The sixth planet from the Sun.', 'Gas Giant', 58232, 10759, 1434, 4.5, true, 71);
INSERT INTO public.planet VALUES (39, 'Uranus', 'The seventh planet from the Sun 2', 'Ice Giant', 25362, 30687, 2871, 4.5, true, 71);
INSERT INTO public.planet VALUES (40, 'Neptune', 'The eighth planet from the Sun 3', 'Ice Giant', 24622, 60190, 4495, 4.5, true, 71);
INSERT INTO public.planet VALUES (41, 'Proxima Centauri b', 'An exoplanet orbiting Proxima Centauri.', 'Terrestrial', 7150, 11.186, 748, 4.85, false, 72);
INSERT INTO public.planet VALUES (42, 'Alpha Centauri Bb', 'A hot exoplanet orbiting Alpha Centauri B.', 'Terrestrial', 48, 3.2, 610, 4.85, false, 72);
INSERT INTO public.planet VALUES (43, 'Kepler-452b', 'An exoplanet orbiting Kepler-452.', 'Super-Earth', 1, 385.84, 14960, 6, false, 73);
INSERT INTO public.planet VALUES (44, 'TRAPPIST-1d', 'An exoplanet orbiting TRAPPIST-1.', 'Terrestrial', 6150, 4.05, 383, 7.6, false, 73);
INSERT INTO public.planet VALUES (45, 'Gliese 581g', 'A potentially habitable exoplanet.', 'Super-Earth', 83, 36.6, 20, 7.5, false, 74);
INSERT INTO public.planet VALUES (46, 'HD 189733 b', 'A gas giant exoplanet known for its blue color.', 'Gas Giant', 618, 2.2, 48, 4.4, true, 74);
INSERT INTO public.planet VALUES (47, '55 Cancri e', 'A super-Earth exoplanet with extreme temperatures.', 'Super-Earth', 76, 0.74, 41, 8, false, 75);
INSERT INTO public.planet VALUES (48, 'Tau Ceti e', 'A potentially habitable exoplanet 2.', 'Super-Earth', 89, 168.1, 12, 5.8, false, 75);
INSERT INTO public.planet VALUES (49, 'Kepler-22b', 'An exoplanet in the habitable zone of Kepler-22.', 'Super-Earth', 89, 289.9, 60, 6, false, 76);
INSERT INTO public.planet VALUES (50, 'Wolf 1061c', 'An exoplanet orbiting Wolf 1061.', 'Super-Earth', 93, 17.87, 1380, 4.5, false, 76);
INSERT INTO public.planet VALUES (51, 'Kapteyn b', 'An exoplanet orbiting Kapteyns Star.', 'Super-Earth', 80, 48.62, 46, 11.5, false, 77);
INSERT INTO public.planet VALUES (52, 'Ross 128 b', 'An exoplanet orbiting Ross 128.', 'Terrestrial', 55, 9.87, 1120, 9.8, false, 77);
INSERT INTO public.planet VALUES (53, 'Luyten b', 'An exoplanet orbiting Luytens Star.', 'Terrestrial', 54, 18.6, 12, 6, false, 78);
INSERT INTO public.planet VALUES (54, 'Teegarden b', 'An exoplanet orbiting Teegardens Star.', 'Terrestrial', 51, 4.91, 12, 8, false, 78);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Ceres', 'The largest object in the asteroid belt between Mars and Jupiter.', 'Asteroid', 940, 414000, 1680, 939000000000000000000, false, 41);
INSERT INTO public.satellite VALUES (2, 'Halleys Comet', 'A short-period comet visible from Earth approximately every 76 years.', 'Comet', 11, 1700000000, 75.3, 220000000000000, true, 41);
INSERT INTO public.satellite VALUES (3, 'Phobos', 'The larger of Mars two moons.', 'Minor Moon', 22.4, 9376, 0.319, 10659000000000000, false, 42);
INSERT INTO public.satellite VALUES (4, 'Deimos', 'The smaller of Mars two moons.', 'Minor Moon', 12.4, 23460, 1.26, 1471000000000000, false, 42);
INSERT INTO public.satellite VALUES (5, 'Eris', 'A dwarf planet in the scattered disc.', 'Dwarf Planet', 2390, 1670000000, 557, 16600000000000000000000, false, 35);
INSERT INTO public.satellite VALUES (6, 'Pluto', 'A dwarf planet in the Kuiper belt.', 'Dwarf Planet', 1188, 590000000, 90, 13100000000000000000000, false, 36);
INSERT INTO public.satellite VALUES (7, 'Io', 'A moon of Jupiter, known for its volcanic activity.', 'Minor Moon', 1821.6, 421700, 1.77, 89300000000000000000000, false, 37);
INSERT INTO public.satellite VALUES (8, 'Titan', 'The second-largest moon of Saturn, with a dense atmosphere.', 'Minor Moon', 5150, 1222000, 15.94, 135000000000000000000000, true, 42);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (71, 'Sun', 'The star at the center of the Solar System.', 'G-type', 6964, 1.0, 5778, 4.6, true, 16);
INSERT INTO public.star VALUES (72, 'Proxima Centauri', 'The closest known star to the Sun.', 'M-type', 69634, 0.17, 3042, 4.85, true, 16);
INSERT INTO public.star VALUES (73, 'Sirius A', 'The brightest star in the night sky.', 'A-type', 11896, 25.4, 9940, 0.24, false, 16);
INSERT INTO public.star VALUES (74, 'Alpha Centauri A', 'A star in the closest star system to the Solar System.', 'G-type', 864340, 1.52, 5790, 4.85, true, 16);
INSERT INTO public.star VALUES (75, 'Alpha Centauri B', 'B star in the closest star system to the Solar System.', 'K-type', 695510, 0.5, 5232, 4.85, true, 16);
INSERT INTO public.star VALUES (76, 'Barnards Star', 'A red dwarf star in the constellation Ophiuchus.', 'M-type', 7, 0.35, 3134, 10.0, true, 17);
INSERT INTO public.star VALUES (77, 'Wolf 359', 'B red dwarf star in the constellation Leo.', 'M-type', 620, 0.18, 28, 7.9, true, 17);
INSERT INTO public.star VALUES (78, 'Luytens Star', 'C red dwarf star in the constellation Canis Minor.', 'M-type', 7, 0.35, 3134, 8.5, true, 17);
INSERT INTO public.star VALUES (79, 'Tau Ceti', 'A star in the constellation Cetus.', 'G-type', 793840, 0.52, 5344, 5.8, true, 17);
INSERT INTO public.star VALUES (80, 'Epsilon Eridani', 'A star in the constellation Eridanus.', 'K-type', 731520, 0.34, 5144, 0.85, true, 17);
INSERT INTO public.star VALUES (81, 'Vega', 'A star in the constellation Lyra.', 'A-type', 12137, 40.12, 9602, 0.45, false, 21);
INSERT INTO public.star VALUES (82, 'Altair', 'A star in the constellation Aquila.', 'A-type', 14960, 10.6, 7550, 1.2, false, 21);
INSERT INTO public.star VALUES (83, 'Fomalhaut', 'A star in the constellation Piscis Austrinus.', 'A-type', 14220, 16.6, 8590, 0.44, true, 21);
INSERT INTO public.star VALUES (84, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 'M-type', 12345, 1260, 35, 8.5, false, 21);
INSERT INTO public.star VALUES (85, 'Rigel', 'A blue supergiant star in the constellation Orion.', 'B-type', 78730, 12, 12130, 8.5, false, 21);
INSERT INTO public.star VALUES (86, 'Aldebaran', 'A red giant star in the constellation Taurus.', 'K-type', 43870, 518, 3910, 6.5, true, 22);
INSERT INTO public.star VALUES (87, 'Antares', 'A red supergiant star in the constellation Scorpius.', 'M-type', 883, 6, 35, 12.0, false, 22);
INSERT INTO public.star VALUES (88, 'Spica', 'A binary star system in the constellation Virgo.', 'B-type', 740, 128, 226, 12.5, false, 22);
INSERT INTO public.star VALUES (89, 'Pollux', 'An orange giant star in the constellation Gemini.', 'K-type', 88780, 32.7, 4865, 1.12, true, 22);
INSERT INTO public.star VALUES (90, 'Arcturus', 'A red giant star in the constellation Boötes.', 'K-type', 18347, 170, 4286, 7.1, true, 22);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 36, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 48, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 54, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 1, false);


--
-- Name: satellite_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_planet_id_seq', 1, false);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 8, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 90, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: satellite satellite_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_description_key UNIQUE (description);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_stars; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_stars FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_moon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_moon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: satellite planet_satellite; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT planet_satellite FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_planet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

