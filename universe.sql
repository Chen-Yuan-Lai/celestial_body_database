--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    cycle integer,
    epoch_year integer,
    description text,
    eccentricity numeric(6,4),
    is_spherical boolean,
    has_ice boolean,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_in_lightyear integer,
    description text,
    galaxy_types character varying(40),
    is_visible boolean,
    has_black_hole boolean,
    apparent_magnitude numeric(3,2)
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
    name character varying(20) NOT NULL,
    find_year integer,
    average_temperature integer,
    description text,
    average_radius_in_km numeric(5,1),
    had_been_visited boolean,
    has_autosphere boolean,
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
    name character varying(20) NOT NULL,
    age_in_millions_of_years integer,
    average_temperature integer,
    description text,
    planet_types character varying(20),
    has_water boolean,
    has_oxygen boolean,
    average_radius_in_km numeric(6,1),
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
    name character varying(20) NOT NULL,
    apparent_magnitude numeric(5,2),
    distance_from_earth_in_lightyear integer,
    description text,
    star_types character varying,
    is_main_sequence_star boolean,
    in_milky_way boolean,
    find_year integer,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 75, 1994, NULL, 0.9670, false, true, 3, 'Halley');
INSERT INTO public.comet VALUES (2, 3, 1786, NULL, 0.8474, false, NULL, 3, 'Encke');
INSERT INTO public.comet VALUES (3, 6, 1852, NULL, 0.7559, false, NULL, 5, 'Biela');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 100, 2500000, 'the closest spiral galaxy to earth', 'spiral galaxy', true, true, 4.36);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 136, 0, 'has hazy band of light seen in the night sky formed from stars', 'barred spiral galaxy', true, true, -6.50);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', NULL, 160000, 'It was named by Fredinand Msgellan', 'irregular galaxy', true, false, 0.90);
INSERT INTO public.galaxy VALUES (4, 'Black Eye Galaxy', NULL, 17000000, 'is well known among amateur astronomers due to its form in small telescopes', 'spiral galaxy', true, false, 9.40);
INSERT INTO public.galaxy VALUES (5, 'M81', 133, 11700000, 'Its large size and releatively high brightness makes it a popular target for amateur astronomers', 'sprial galaxy', true, true, 6.94);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel Galaxy', 200, 500000000, 'its shape was caused by a collision with another galaxy', 'lenticular ring galaxy', false, true, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'lo', 16102, -163, NULL, 1812.3, true, true, 5);
INSERT INTO public.moon VALUES (2, 'Europa', 1610, -171, NULL, 1560.8, false, true, 5);
INSERT INTO public.moon VALUES (3, 'Ganymede', 1610, -163, NULL, 2634.1, false, true, 5);
INSERT INTO public.moon VALUES (4, 'Callisto', 1610, -139, NULL, 2410.3, false, true, 5);
INSERT INTO public.moon VALUES (5, 'lunar', NULL, -53, 'only one moon of Earth', 1737.1, true, true, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 1655, -179, NULL, 2576.0, false, true, 6);
INSERT INTO public.moon VALUES (7, 'Tethys', 1684, -187, NULL, 531.1, false, true, 6);
INSERT INTO public.moon VALUES (8, 'Dione', 1684, -186, NULL, 561.4, false, true, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 1672, NULL, NULL, 764.3, false, true, 6);
INSERT INTO public.moon VALUES (10, 'Triton', 1846, -235, NULL, 1353.4, false, true, 8);
INSERT INTO public.moon VALUES (11, 'Phobos', 1877, -40, NULL, 11.1, true, true, 4);
INSERT INTO public.moon VALUES (12, 'Deimos', 1877, -40, NULL, 6.2, false, true, 4);
INSERT INTO public.moon VALUES (13, 'Ariel', 1851, -215, NULL, 578.9, false, false, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1851, -198, NULL, 584.7, false, false, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 1787, -215, NULL, 788.4, false, false, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 1787, -215, NULL, NULL, false, false, 7);
INSERT INTO public.moon VALUES (17, 'Charon', 1978, -220, NULL, NULL, false, false, 12);
INSERT INTO public.moon VALUES (18, 'Dysnomia', 2005, NULL, NULL, 342.0, false, false, NULL);
INSERT INTO public.moon VALUES (19, 'Nereid', 1949, -223, NULL, 170.0, false, false, 8);
INSERT INTO public.moon VALUES (20, 'Despina', 1989, NULL, NULL, NULL, NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 450, 130, 'It is the smallest planet in the Solar System', 'terrestrial planet', true, true, 2439.7, 4);
INSERT INTO public.planet VALUES (2, 'Venus', 450, 464, 'It is the second from the Sun', 'terrestrial planet', false, false, 6051.8, 4);
INSERT INTO public.planet VALUES (3, 'Earth', 454, 15, NULL, 'terrestrial planet', true, true, 6731.0, 4);
INSERT INTO public.planet VALUES (4, 'Mars', 460, -63, 'It is named for the Roman god of war', 'terrestrial planet', true, false, 3390.0, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 460, -108, 'It is a gas giant with a mass more than two and a half times that of all the other planets', 'Joivan planet', false, true, 69911.0, 4);
INSERT INTO public.planet VALUES (6, 'Saturun', 150, -139, 'It has a prominent ring system', 'Joivan planet', true, false, 58232.0, 4);
INSERT INTO public.planet VALUES (7, 'Uranus', 454, -197, 'It has the third-largest planetary redius', 'Jovian planet', false, false, 25559.0, 4);
INSERT INTO public.planet VALUES (8, 'Neptune', 450, -201, 'It is the farthest known planet in the Solar System', 'Jovian planet', false, false, 24622.0, 4);
INSERT INTO public.planet VALUES (9, 'Ceres', 457, -38, 'a dwarf planet in the asteroid belt', 'Dwarfn planet', false, false, 473.0, 4);
INSERT INTO public.planet VALUES (10, 'Pallas', NULL, -8, NULL, 'dwarf planet', false, false, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Vesta', NULL, -92, NULL, 'dwarfn planet', false, false, NULL, 4);
INSERT INTO public.planet VALUES (12, 'Pluto', NULL, -229, 'In the Ktiper belt', 'dwarf planet', false, false, 1188.3, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, '55 Cancri b', 2.07, 97, 'Brightest star in Andromeda', 'B', true, false, 1988, NULL);
INSERT INTO public.star VALUES (3, 'Pollux', 1.16, 34, 'It is the brightest star in the constellation of Gemini', 'K', false, false, 1993, NULL);
INSERT INTO public.star VALUES (2, 'Beta', 3.53, 290, NULL, 'K', NULL, false, 1988, 1);
INSERT INTO public.star VALUES (4, 'Solar', -26.71, 0, 'G', NULL, true, true, NULL, 2);
INSERT INTO public.star VALUES (5, 'R71', -11.20, 3545, 'It is one of the most luminous stars in the LMC', 'B', true, false, NULL, 3);
INSERT INTO public.star VALUES (6, 'alpha Centauria C', -26.71, 11, 'M', 'It is a small faint red dwarf', true, true, NULL, 2);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: comet comet_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

