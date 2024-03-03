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
    name character varying(50),
    shape text,
    has_blackhole boolean,
    is_satellite_galaxy boolean,
    magnitude numeric NOT NULL,
    discovery_yr integer,
    distance_from_earth_centre_in_million_ly numeric NOT NULL,
    diameter_in_ly integer
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
    name character varying(50),
    distance_from_parent_planet_in_km integer,
    discovery_year integer,
    diameter_in_km text,
    orbital_period_in_days numeric NOT NULL,
    is_bigger_than_earth boolean,
    is_spherical boolean NOT NULL,
    planet_id integer
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
-- Name: nebula; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebula (
    nebula_id integer NOT NULL,
    name character varying(50),
    visible_to_naked_eye boolean,
    distance_from_earth_in_ly integer NOT NULL,
    diameter_in_ly integer,
    is_a_planetary_nebula boolean NOT NULL,
    biggest_star_cluster text,
    magnitude numeric,
    galaxy_id integer
);


ALTER TABLE public.nebula OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebula_nebula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebula_nebula_id_seq OWNER TO freecodecamp;

--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebula_nebula_id_seq OWNED BY public.nebula.nebula_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    discovery_year integer,
    orbital_eccentricity numeric,
    orbital_period_in_days numeric NOT NULL,
    life_exists text NOT NULL,
    has_rings boolean,
    no_of_moons integer,
    is_an_exoplanet boolean,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    distance_from_earth_in_ly integer,
    absolute_magnitude numeric,
    temperature_in_k integer NOT NULL,
    is_a_dwarf_star boolean NOT NULL,
    is_part_of_a_constellation boolean,
    star_system text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: nebula nebula_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula ALTER COLUMN nebula_id SET DEFAULT nextval('public.nebula_nebula_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, false, -20.8, 1610, 0.026, 87400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', true, false, -21.58, 1783, 2.538, 152000);
INSERT INTO public.galaxy VALUES (3, 'Sextans B', 'Irregular', true, false, -13.95, 1687, 4.47, 6000);
INSERT INTO public.galaxy VALUES (4, 'Barnard''s', 'Irregular', false, false, -15.22, 1884, 1.859, 7000);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 'Spiral', true, false, -18.87, 1654, 2.73, 61600);
INSERT INTO public.galaxy VALUES (6, 'Leo I', 'Spheroidal', true, true, -12, 1950, 0.82, 2000);
INSERT INTO public.galaxy VALUES (7, 'Canis Major', 'Elliptical', false, false, -0.1, 2002, 0.025, NULL);
INSERT INTO public.galaxy VALUES (8, 'Whirlpool', 'Spiral', true, false, 8.4, 1773, 31, 76900);
INSERT INTO public.galaxy VALUES (9, 'LMC', 'Magellanic-type Spiral', true, true, 0.4, 1519, 0.163, 32200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', 23460, 1877, '12.4', 1.26, false, false, 4);
INSERT INTO public.moon VALUES (2, 'Charon', 19571, 1978, '1207', 6.38, false, true, 16);
INSERT INTO public.moon VALUES (3, 'Atlas', 137640, 1980, '37*27', 0.6, false, true, 6);
INSERT INTO public.moon VALUES (4, 'Hyperion', 1481000, 1848, '360*226', 21.27, true, false, 6);
INSERT INTO public.moon VALUES (5, 'Mimas', 185520, 1789, '398', 0.94, false, false, 6);
INSERT INTO public.moon VALUES (6, 'Iapetus', 3561300, 1671, '1436', 79.32, false, false, 6);
INSERT INTO public.moon VALUES (7, 'Pan', 133630, 1990, '19.32', 0.57, false, false, 6);
INSERT INTO public.moon VALUES (8, 'Nereid', 5513400, 1949, '340', 360.16, false, false, 8);
INSERT INTO public.moon VALUES (9, 'Callisto', 1883000, 1610, '4800', 16.68, false, true, 5);
INSERT INTO public.moon VALUES (10, 'Phobos', 9270, 1877, '22.5', 0.31, false, false, 4);
INSERT INTO public.moon VALUES (11, 'Ganymede', 1070000, 1610, '5276', 7.15, false, true, 5);
INSERT INTO public.moon VALUES (12, 'Miranda', 129780, 1948, '472', 1.41, false, true, 7);
INSERT INTO public.moon VALUES (13, 'Janus', 151472, 1966, '190*154', 0.69, true, false, 6);
INSERT INTO public.moon VALUES (14, 'Triton', 354800, 1846, '2705', 5.87, false, true, 8);
INSERT INTO public.moon VALUES (15, 'Titan', 1221850, 1655, '5150', 15.94, false, true, 6);
INSERT INTO public.moon VALUES (16, 'Io', 421600, 1610, '3629', 1.76, false, true, 5);
INSERT INTO public.moon VALUES (17, 'Rhea', 527040, 1672, '1528', 4.51, false, true, 6);
INSERT INTO public.moon VALUES (18, 'Europa', 670900, 1610, '3126', 3.55, false, true, 5);
INSERT INTO public.moon VALUES (19, 'The Moon', 384400, NULL, '3475', 27.32, false, true, 3);
INSERT INTO public.moon VALUES (21, 'Epimetheus', 151422, 1966, '138*110', 0.694, true, false, 6);


--
-- Data for Name: nebula; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebula VALUES (1, 'Helix', false, 650, 6, true, 'White Dwarf Star', 7.6, 1);
INSERT INTO public.nebula VALUES (2, 'Orion', true, 1300, 24, false, 'Trapezium', 4, 1);
INSERT INTO public.nebula VALUES (3, 'Tarantula', true, 160000, 1862, false, 'R136', 8, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1631, 0.205, 87.96, 'No', false, 0, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 1639, 0.007, 224.7, 'Unknown', false, 0, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', NULL, 0.016, 365.2, 'Yes', false, 1, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1576, 0.09, 687, 'Unknown', false, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1973, 0.049, 4331, 'No', true, 95, false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 1610, 0.056, 10747, 'No', true, 146, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 1781, 0.047, 30589, 'No', true, 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 1846, 0.008, 59800, 'No', true, 14, false, 1);
INSERT INTO public.planet VALUES (9, 'Wasp-103 b', 2014, 0.14, 0.9, 'No', false, 0, true, 13);
INSERT INTO public.planet VALUES (10, 'Hoth', 2005, 0, 3287.25, 'No', false, 3, true, 14);
INSERT INTO public.planet VALUES (11, 'Osiris', 1999, 0, 3.5, 'Unknown', false, 0, true, 15);
INSERT INTO public.planet VALUES (12, 'Ceres', 1801, 0.078, 1680.15, 'Yes', false, 0, false, 1);
INSERT INTO public.planet VALUES (13, 'Au Microscopii B', 2020, 0.186, 8.5, 'Unknown', true, 0, true, 10);
INSERT INTO public.planet VALUES (14, '11 Ursae Minoris B', 2009, 0.08, 511.35, 'Unknown', false, 0, true, 11);
INSERT INTO public.planet VALUES (15, '81 Ceti B', 2008, 0.21, 949.65, 'No', false, 0, true, 12);
INSERT INTO public.planet VALUES (16, 'Pluto', 1930, 0.248, 90560, 'No', false, 5, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 0, -26.74, 5778, true, false, 'Solar System', 1);
INSERT INTO public.star VALUES (2, 'Rigil Kentaurus', 4, 4.39, 5533, false, true, 'Alpha Centauri', 1);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 6, 13.24, 273, true, true, 'Opiuchus', 1);
INSERT INTO public.star VALUES (4, 'Sirius', 9, 1.45, 11122, false, true, 'Alpha Canis Majoris', 7);
INSERT INTO public.star VALUES (5, 'Alphertaz', 97, -0.3, 10293, true, true, 'Andromeda', 2);
INSERT INTO public.star VALUES (6, 'Atria', 391, -3.48, 4093, false, true, 'Triangulum Australe', 5);
INSERT INTO public.star VALUES (7, 'Ascella', 88, 0.44, 8815, false, true, 'Sagittarius', 1);
INSERT INTO public.star VALUES (8, 'Deneb', 1412, -6.93, 8573, false, true, 'Cygnus', 1);
INSERT INTO public.star VALUES (9, 'Foramen', 8, -8.6, 25000, false, true, 'Carina', 1);
INSERT INTO public.star VALUES (10, 'Au_mic', 32, 8.83, 4042, false, true, 'Microscopium', 1);
INSERT INTO public.star VALUES (11, '11 Ursae Minoris', 398, -0.41, 4248, false, true, 'Ursa Minor', 1);
INSERT INTO public.star VALUES (12, '81 Ceti', 302, 0.82, 4829, false, true, 'Cetus', 1);
INSERT INTO public.star VALUES (13, 'Wasp-103', 1533, 3.64, 6000, false, true, 'Hercules', 1);
INSERT INTO public.star VALUES (14, 'OGLE-2005-BLG-390L', 21207, 15.7, 3000, false, true, 'Scorpius', 1);
INSERT INTO public.star VALUES (15, 'HD 209458', 162, 4.17, 5898, false, true, 'Pegasus', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: nebula_nebula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebula_nebula_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 15, true);


--
-- Name: galaxy galaxy_magnitude_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_magnitude_key UNIQUE (magnitude);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_orbital_period_in_days_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_orbital_period_in_days_key UNIQUE (orbital_period_in_days);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebula nebula_distance_from_earth_in_ly_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_distance_from_earth_in_ly_key UNIQUE (distance_from_earth_in_ly);


--
-- Name: nebula nebula_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_pkey PRIMARY KEY (nebula_id);


--
-- Name: planet planet_orbital_period_in_days_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_orbital_period_in_days_key UNIQUE (orbital_period_in_days);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_temperature_in_k_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_temperature_in_k_key UNIQUE (temperature_in_k);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: nebula nebula_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebula
    ADD CONSTRAINT nebula_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

