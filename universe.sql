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
    name character varying(30) NOT NULL,
    description text,
    number_of_stars_in_billions integer,
    type_of_galaxy character varying(30) NOT NULL
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
    distance_from_planet numeric(15,5) NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_radius_in_km integer NOT NULL
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
    name character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    planet_type character varying(30) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_mission (
    planet_mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year integer NOT NULL,
    is_success boolean NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet_mission OWNER TO freecodecamp;

--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_mission_planet_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_mission_planet_mission_id_seq OWNER TO freecodecamp;

--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_mission_planet_mission_id_seq OWNED BY public.planet_mission.planet_mission_id;


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
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_mission planet_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission ALTER COLUMN planet_mission_id SET DEFAULT nextval('public.planet_mission_planet_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The appearance from Earth of the galaxy—a band of light', 400, 'SB');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Andromeda, which is shortened from "Andromeda Galaxy", gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 1000, 'SA');
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 'Appears similar in shape to a cigar.', NULL, 'IO');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Similar in appearance to a sombrero.', NULL, 'SA');
INSERT INTO public.galaxy VALUES (5, 'Butterfly Galaxy', 'Looks are similar to a butterfly.', NULL, 'SA');
INSERT INTO public.galaxy VALUES (6, 'Carwheel Galaxy', 'Its visual appearance is similar to that of a spoked cartwheel.', NULL, 'S');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 9380.00000, 4, 'Phobos', 11267);
INSERT INTO public.moon VALUES (3, 23469.00000, 4, 'Deimos', 6);
INSERT INTO public.moon VALUES (1, 384.40000, 3, 'Moon', 1738);
INSERT INTO public.moon VALUES (4, 421800.00000, 5, 'Io', 1822);
INSERT INTO public.moon VALUES (5, 671100.00000, 5, 'Europa', 1561);
INSERT INTO public.moon VALUES (6, 1070400.00000, 5, 'Ganymede', 2634);
INSERT INTO public.moon VALUES (7, 1882700.00000, 5, 'Callisto', 2410);
INSERT INTO public.moon VALUES (8, 185.54900, 6, 'Minas', 198);
INSERT INTO public.moon VALUES (9, 238.04000, 6, 'Enceladus', 252);
INSERT INTO public.moon VALUES (10, 294.04000, 6, 'Tethys', 533);
INSERT INTO public.moon VALUES (11, 377.42000, 6, 'Dione', 561);
INSERT INTO public.moon VALUES (12, 527.07000, 6, 'Rhea', 763);
INSERT INTO public.moon VALUES (14, 190.90000, 7, 'Ariel', 578);
INSERT INTO public.moon VALUES (15, 266.00000, 7, 'Umbriel', 584);
INSERT INTO public.moon VALUES (16, 436.30000, 7, 'Titania', 788);
INSERT INTO public.moon VALUES (17, 583.50000, 7, 'Oberon', 761);
INSERT INTO public.moon VALUES (18, 129.90000, 7, 'Miranda', 235);
INSERT INTO public.moon VALUES (19, 49.80000, 7, 'Coldelia', 20);
INSERT INTO public.moon VALUES (20, 53800.00000, 7, 'Ophelia', 21);
INSERT INTO public.moon VALUES (21, 354800.00000, 8, 'Triton', 1353);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 'Inner', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 'Inner', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 'Inner', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 'Inner', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 'Outer', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 'Outer', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 'OUTER', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 'OUTER', 1);
INSERT INTO public.planet VALUES (9, 'PA-99-N2', false, 'Inner', 2);
INSERT INTO public.planet VALUES (10, 'PA-102-N2', false, 'Inner', 2);
INSERT INTO public.planet VALUES (11, 'NA-333-N2', false, 'Uknown', 2);
INSERT INTO public.planet VALUES (12, 'PA-1000-N2', false, 'Inner', 2);


--
-- Data for Name: planet_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_mission VALUES (1, 'Mariner-10', 1973, true, 1);
INSERT INTO public.planet_mission VALUES (2, 'Mars-6', 1973, true, 4);
INSERT INTO public.planet_mission VALUES (3, 'Mars-96', 1996, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, true, 4500, 1, 'Sun');
INSERT INTO public.star VALUES (2, true, NULL, 2, 'Veritate');
INSERT INTO public.star VALUES (3, true, NULL, 2, 'Adhil');
INSERT INTO public.star VALUES (4, true, NULL, 2, 'Alamakh');
INSERT INTO public.star VALUES (5, true, 1700, 2, 'Nerbus');
INSERT INTO public.star VALUES (6, true, 60, 2, 'Alpheratz');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_mission_planet_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_mission_planet_mission_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_mission planet_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_name_key UNIQUE (name);


--
-- Name: planet_mission planet_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_pkey PRIMARY KEY (planet_mission_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_mission planet_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_mission
    ADD CONSTRAINT planet_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


