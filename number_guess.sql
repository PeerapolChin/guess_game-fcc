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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game (
    game_id integer NOT NULL,
    guess_times integer DEFAULT 0,
    user_id integer
);


ALTER TABLE public.game OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_game_id_seq OWNED BY public.game.game_id;


--
-- Name: username; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.username (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    total_game integer DEFAULT 0
);


ALTER TABLE public.username OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_user_id_seq OWNER TO freecodecamp;

--
-- Name: username_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_user_id_seq OWNED BY public.username.user_id;


--
-- Name: game game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game ALTER COLUMN game_id SET DEFAULT nextval('public.game_game_id_seq'::regclass);


--
-- Name: username user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username ALTER COLUMN user_id SET DEFAULT nextval('public.username_user_id_seq'::regclass);


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game VALUES (1, 904, 1);
INSERT INTO public.game VALUES (2, 788, 1);
INSERT INTO public.game VALUES (3, 500, 2);
INSERT INTO public.game VALUES (4, 610, 2);
INSERT INTO public.game VALUES (5, 975, 1);
INSERT INTO public.game VALUES (6, 517, 1);
INSERT INTO public.game VALUES (7, 555, 1);
INSERT INTO public.game VALUES (8, 24, 3);
INSERT INTO public.game VALUES (9, 329, 4);
INSERT INTO public.game VALUES (10, 126, 4);
INSERT INTO public.game VALUES (11, 279, 5);
INSERT INTO public.game VALUES (12, 630, 5);
INSERT INTO public.game VALUES (13, 800, 4);
INSERT INTO public.game VALUES (14, 912, 4);
INSERT INTO public.game VALUES (15, 760, 4);


--
-- Data for Name: username; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.username VALUES (2, 'user_1720375309924', 2);
INSERT INTO public.username VALUES (1, 'user_1720375309925', 5);
INSERT INTO public.username VALUES (3, 'o', 1);
INSERT INTO public.username VALUES (5, 'user_1720375524123', 2);
INSERT INTO public.username VALUES (4, 'user_1720375524124', 5);


--
-- Name: game_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_game_id_seq', 15, true);


--
-- Name: username_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_user_id_seq', 5, true);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (game_id);


--
-- Name: username username_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_name_key UNIQUE (name);


--
-- Name: username username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.username
    ADD CONSTRAINT username_pkey PRIMARY KEY (user_id);


--
-- Name: game fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.username(user_id);


--
-- PostgreSQL database dump complete
--

