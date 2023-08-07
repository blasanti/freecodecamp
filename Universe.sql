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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(45) NOT NULL,
    size numeric(8,1),
    shape character varying(45),
    distance_from_earth numeric(10,1),
    obervable_optical_telescope boolean,
    description text
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
-- Name: is_in; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.is_in (
    star_id integer,
    distance_to_center integer,
    name character varying(45) NOT NULL,
    is_in_id integer NOT NULL
);


ALTER TABLE public.is_in OWNER TO freecodecamp;

--
-- Name: is_in_is_in_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.is_in_is_in_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.is_in_is_in_id_seq OWNER TO freecodecamp;

--
-- Name: is_in_is_in_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.is_in_is_in_id_seq OWNED BY public.is_in.is_in_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(45) NOT NULL,
    distance_to_planet numeric(10,1),
    size numeric(8,1),
    observable_with_telescope boolean,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(45) NOT NULL,
    distance_from_earth numeric(10,1),
    size numeric(8,1),
    earth_analog boolean,
    observable_with_telescope boolean,
    star_id integer,
    number_of_moons integer
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
    name character varying(45) NOT NULL,
    distance_from_earth numeric(10,1),
    type character varying(45),
    observable_with_telescope boolean,
    galaxy_id integer,
    number_of_planets integer
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
-- Name: is_in is_in_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_in ALTER COLUMN is_in_id SET DEFAULT nextval('public.is_in_is_in_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000.0, 'Spiral', 0.0, true, 'The Milky Way: Our barred spiral galaxy, a vast collection of stars, gas, and dust, home to Earth`s solar system.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 220000.0, 'Spiral', 2537000.0, true, 'Nearest spiral neighbor, set to collide with Milky Way in distant future.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 50000.0, 'Spiral', 3000000.0, true, 'Third-largest in Local Group, filled with young stars and nebulae.');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 14000.0, 'Irregular', 160000.0, true, 'Satellite galaxy of Milky Way, rich in star-forming regions.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 50000.0, 'Spiral with bulge', 28000000.0, true, 'Unique appearance resembling a sombrero hat, filled with star clusters.');
INSERT INTO public.galaxy VALUES (6, 'Canis Major Dwarf Galaxy', 10000.0, 'Irregular', 25000.0, false, 'Satellite galaxy of the Milky Way, contains few stars.');
INSERT INTO public.galaxy VALUES (7, 'Leo I', 6500.0, 'Dwarf spheroidal', 820000.0, false, 'Satellite galaxy of the Milky Way, dim and located within the constellation Leo, a member of the Local Group of galaxies.');


--
-- Data for Name: is_in; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.is_in VALUES (3, 28000, 'Sun', 1);
INSERT INTO public.is_in VALUES (1, 29000, 'Proxima Centauri', 2);
INSERT INTO public.is_in VALUES (1, 56000, 'Alpha Andromedae', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 0.4, 0.3, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.0, 0.0, true, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.0, 0.0, true, 4);
INSERT INTO public.moon VALUES (4, 'Io', 0.4, 0.0, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 0.7, 0.0, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1.1, 0.0, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 1.9, 0.0, true, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 1.2, 0.4, true, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 0.2, 0.0, true, 6);
INSERT INTO public.moon VALUES (10, 'Miranda', 0.1, 0.0, true, 7);
INSERT INTO public.moon VALUES (11, 'Ariel', 0.2, 0.0, true, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 0.3, 0.0, true, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 0.4, 0.0, true, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 0.6, 0.0, true, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 0.4, 0.2, true, 8);
INSERT INTO public.moon VALUES (16, 'Charon', 0.0, 0.1, true, 9);
INSERT INTO public.moon VALUES (17, 'Nereid', 0.6, 0.0, true, 9);
INSERT INTO public.moon VALUES (18, 'Proteus', 0.1, 0.0, true, 9);
INSERT INTO public.moon VALUES (19, 'Larissa', 0.1, 0.0, true, 9);
INSERT INTO public.moon VALUES (20, 'Naiad', 0.0, 0.0, true, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.4, 0.1, false, true, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 0.7, 0.8, false, true, 1, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 0.0, 1.0, true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 1.5, 0.1, false, true, 1, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5.2, 317.8, false, true, 1, 79);
INSERT INTO public.planet VALUES (6, 'Saturn', 9.6, 95.2, false, true, 1, 83);
INSERT INTO public.planet VALUES (7, 'Uranus', 19.2, 14.6, false, true, 1, 27);
INSERT INTO public.planet VALUES (8, 'Neptune', 30.1, 17.2, false, true, 1, 14);
INSERT INTO public.planet VALUES (9, 'Pluto', 39.5, 0.0, false, true, 1, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 490.0, 0.1, true, false, 8, 0);
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 159.0, 1.3, false, false, 12, 0);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri b', 4.2, 0.2, true, false, 10, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Andromedae', 96.9, 'single red giant', true, 2, 6);
INSERT INTO public.star VALUES (2, 'Beta Andromedae', 199.0, 'single red giant', true, 2, NULL);
INSERT INTO public.star VALUES (3, 'SUN', 0.0, 'G-type main-sequence', true, 1, 8);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 4.2, 'M-type red dwarf', true, 1, 3);
INSERT INTO public.star VALUES (5, 'Rigil Kentaurus', 4.4, 'G-type main-sequence', true, 1, 0);
INSERT INTO public.star VALUES (6, 'Toliman', 4.4, 'G-type main-sequence', true, 1, 0);
INSERT INTO public.star VALUES (7, 'Barnard''s Star', 6.0, 'M-type red dwarf', true, 1, 0);
INSERT INTO public.star VALUES (8, 'β Tri', 127.0, 'Binary Star', true, 3, NULL);
INSERT INTO public.star VALUES (9, 'α Tri', 63.3, 'Binary Star', true, 3, NULL);
INSERT INTO public.star VALUES (10, 'γ Tri', 391.6, 'blue', true, 3, NULL);
INSERT INTO public.star VALUES (11, 'BAT99-7', 160000.0, 'WN', true, 3, NULL);
INSERT INTO public.star VALUES (12, 'R71 (star)', 2589.8, 'variable', true, 3, NULL);
INSERT INTO public.star VALUES (13, 'Melnick 42', 1630.0, 'supergiant', true, 3, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: is_in_is_in_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.is_in_is_in_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: is_in is_in_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_in
    ADD CONSTRAINT is_in_pkey PRIMARY KEY (is_in_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: is_in unique_name_is_in; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_in
    ADD CONSTRAINT unique_name_is_in UNIQUE (name);


--
-- Name: moon unique_name_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_name_moon UNIQUE (name);


--
-- Name: planet unique_name_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name_planet UNIQUE (name);


--
-- Name: star unique_name_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name_star UNIQUE (name);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: is_in star_is_in_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.is_in
    ADD CONSTRAINT star_is_in_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star strar_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT strar_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

