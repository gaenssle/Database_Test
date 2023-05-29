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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    symbolism text,
    main_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    brightness numeric,
    distance_kly integer,
    constellation character varying(240),
    notes text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    radius_km numeric(5,1),
    mass_e18kg integer,
    planet_id integer,
    index character varying(5)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    earth_mass numeric(4,2),
    orbital_days numeric(8,2),
    habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_ly numeric(4,1),
    constellation character varying(30),
    brightness numeric(5,2),
    solar_radii numeric(7,3),
    temperature_k integer,
    age_mly integer,
    spectral_type character varying(30),
    visible_to_eye boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (0, 'Andromeda', 'The chained woman', 16);
INSERT INTO public.constellation VALUES (1, 'Triangulum', 'The triangle', 3);
INSERT INTO public.constellation VALUES (2, 'Centraurus', 'Centaur', 11);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (0, 'Milky Way', -6.5, 0, 'Sagittarius (center)', 'Contains the sun, our solar system and most stars visible to the naked eye');
INSERT INTO public.galaxy VALUES (1, 'Large Magellanic Cloud', 0.9, 160, 'Dorado/Mensa', 'Satellite galaxy of the Mily Way');
INSERT INTO public.galaxy VALUES (2, 'Small Magellanic Cloud', 2.7, 200, 'Tucana', 'Swarf galaxy near the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Andromeda Galaxy', 3.4, 2500, 'Andromeda', 'Part of the local group, nearest large galaxy');
INSERT INTO public.galaxy VALUES (4, 'Triangulum Galaxy', 5.7, 2900, 'Triangulum', 'Third-largest galaxy in the local group');
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 6.84, 13700, 'Centaurus', 'The fifth-brightest galaxy in the sky');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (0, 'Moon', 1735.5, 73460, 10, 'I');
INSERT INTO public.moon VALUES (1, 'Io', 1821.6, 89300, 6, 'I');
INSERT INTO public.moon VALUES (2, 'Europa', 1560.8, 48000, 6, 'II');
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634.1, 148200, 6, 'III');
INSERT INTO public.moon VALUES (4, 'Callisto', 2410.3, 107600, 6, 'IV');
INSERT INTO public.moon VALUES (5, 'Triton', 1353.4, 21400, 9, 'I');
INSERT INTO public.moon VALUES (6, 'Nereid', 170.0, NULL, 9, 'II');
INSERT INTO public.moon VALUES (7, 'Proteus', 210.0, 44, 9, 'VII');
INSERT INTO public.moon VALUES (8, 'Minas', 198.2, 37, 7, 'I');
INSERT INTO public.moon VALUES (9, 'Enecladus', 252.1, 108, 7, 'II');
INSERT INTO public.moon VALUES (10, 'Tethys', 533.0, 620, 7, 'III');
INSERT INTO public.moon VALUES (11, 'Phoebe', 106.5, 8, 7, 'IX');
INSERT INTO public.moon VALUES (12, 'Dione', 561.7, 1100, 7, 'IV');
INSERT INTO public.moon VALUES (13, 'Titan', 2574.7, 134500, 7, 'VI');
INSERT INTO public.moon VALUES (14, 'Rhea', 763.8, 2310, 7, 'VI');
INSERT INTO public.moon VALUES (15, 'Hyperion', 135.0, 6, 7, 'VII');
INSERT INTO public.moon VALUES (16, 'Iapetus', 735.6, 1810, 7, 'VIII');
INSERT INTO public.moon VALUES (17, 'Ariel', 578.9, 1250, 8, 'I');
INSERT INTO public.moon VALUES (18, 'Umbriel', 584.7, 1280, 8, 'II');
INSERT INTO public.moon VALUES (19, 'Titania', 788.9, 3400, 8, 'III');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (0, 'd', 0.26, 5122.00, false, 3);
INSERT INTO public.planet VALUES (1, 'b', 1.07, 11.20, true, 3);
INSERT INTO public.planet VALUES (2, 'c', 7.10, 1928.00, false, 3);
INSERT INTO public.planet VALUES (3, 'b', 2.64, 12.90, false, 0);
INSERT INTO public.planet VALUES (4, 'd', 4.10, 215.60, false, 0);
INSERT INTO public.planet VALUES (5, 'c', 14.20, 2806.00, false, 0);
INSERT INTO public.planet VALUES (6, 'Jupiter', 10.97, 433.82, false, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 9.14, 10755.70, false, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 3.87, 30687.15, false, 2);
INSERT INTO public.planet VALUES (9, 'Neptun', 3.87, 60190.03, false, 2);
INSERT INTO public.planet VALUES (10, 'Earth', 1.00, 365.40, true, 2);
INSERT INTO public.planet VALUES (11, 'VENUS', 0.95, 224.70, false, 2);
INSERT INTO public.planet VALUES (12, 'Mars', 0.53, 686.98, false, 2);
INSERT INTO public.planet VALUES (13, 'Mercury', 0.38, 87.97, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (0, 'SP77 46-44', NULL, 'Dorado', 12.15, 1278.000, 3500, NULL, 'M2.5', false, 1);
INSERT INTO public.star VALUES (1, 'Sanduleak -96 202', NULL, 'Dorado', 2.80, 39.600, 16000, NULL, NULL, false, 1);
INSERT INTO public.star VALUES (2, 'Sun', 0.0, NULL, -26.74, 1.000, 5778, 4600, 'G2V', true, 0);
INSERT INTO public.star VALUES (3, 'Alpha centrauri A', 4.4, 'Centaurus', -0.01, 0.860, 5260, 5300, 'G2V', true, 0);
INSERT INTO public.star VALUES (4, 'Sirius', 8.6, 'Canis Major', -1.44, 1.710, 25000, 288, 'A1V', true, 0);
INSERT INTO public.star VALUES (5, 'Arcturus', 37.0, 'Boörtes', -0.05, 25.400, 4286, 7100, 'K1.5 III', true, 0);
INSERT INTO public.star VALUES (6, 'VEGA', 25.0, 'Lyra', 0.58, 2.632, 9600, 455, 'A0Va', true, 0);
INSERT INTO public.star VALUES (7, 'Canopus', 310.0, 'Carina', -5.71, 71.400, 7400, 25, 'A9 III', true, 0);
INSERT INTO public.star VALUES (8, 'Capella', 42.9, 'Auriga', 0.08, 12.000, 4970, 600, 'G3 III', true, 0);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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


