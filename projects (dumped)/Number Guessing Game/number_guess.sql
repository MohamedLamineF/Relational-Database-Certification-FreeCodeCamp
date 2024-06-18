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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22),
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 14, 2);
INSERT INTO public.games VALUES (2, 15, 2);
INSERT INTO public.games VALUES (3, 16, 1);
INSERT INTO public.games VALUES (4, 13, 2);
INSERT INTO public.games VALUES (5, 17, 3);
INSERT INTO public.games VALUES (6, 17, 4);
INSERT INTO public.games VALUES (7, 18, 4);
INSERT INTO public.games VALUES (8, 18, 3);
INSERT INTO public.games VALUES (9, 17, 5);
INSERT INTO public.games VALUES (10, 17, 4);
INSERT INTO public.games VALUES (11, 17, 2);
INSERT INTO public.games VALUES (12, 19, 2);
INSERT INTO public.games VALUES (13, 19, 3);
INSERT INTO public.games VALUES (14, 20, 3);
INSERT INTO public.games VALUES (15, 20, 4);
INSERT INTO public.games VALUES (16, 19, 6);
INSERT INTO public.games VALUES (17, 19, 5);
INSERT INTO public.games VALUES (18, 19, 2);
INSERT INTO public.games VALUES (19, 21, 3);
INSERT INTO public.games VALUES (20, 21, 4);
INSERT INTO public.games VALUES (21, 22, 2);
INSERT INTO public.games VALUES (22, 22, 3);
INSERT INTO public.games VALUES (23, 21, 6);
INSERT INTO public.games VALUES (24, 21, 3);
INSERT INTO public.games VALUES (25, 21, 3);
INSERT INTO public.games VALUES (26, 23, 4);
INSERT INTO public.games VALUES (27, 23, 2);
INSERT INTO public.games VALUES (28, 24, 2);
INSERT INTO public.games VALUES (29, 24, 2);
INSERT INTO public.games VALUES (30, 23, 6);
INSERT INTO public.games VALUES (31, 23, 3);
INSERT INTO public.games VALUES (32, 23, 3);
INSERT INTO public.games VALUES (33, 25, 2);
INSERT INTO public.games VALUES (34, 25, 2);
INSERT INTO public.games VALUES (35, 26, 2);
INSERT INTO public.games VALUES (36, 26, 2);
INSERT INTO public.games VALUES (37, 25, 1);
INSERT INTO public.games VALUES (38, 25, 4);
INSERT INTO public.games VALUES (39, 25, 4);
INSERT INTO public.games VALUES (40, 27, 3);
INSERT INTO public.games VALUES (41, 27, 3);
INSERT INTO public.games VALUES (42, 28, 2);
INSERT INTO public.games VALUES (43, 28, 2);
INSERT INTO public.games VALUES (44, 27, 6);
INSERT INTO public.games VALUES (45, 27, 5);
INSERT INTO public.games VALUES (46, 27, 2);
INSERT INTO public.games VALUES (47, 29, 4);
INSERT INTO public.games VALUES (48, 29, 2);
INSERT INTO public.games VALUES (49, 30, 2);
INSERT INTO public.games VALUES (50, 30, 3);
INSERT INTO public.games VALUES (51, 29, 6);
INSERT INTO public.games VALUES (52, 29, 4);
INSERT INTO public.games VALUES (53, 29, 4);
INSERT INTO public.games VALUES (54, 31, 4);
INSERT INTO public.games VALUES (55, 31, 3);
INSERT INTO public.games VALUES (56, 32, 4);
INSERT INTO public.games VALUES (57, 32, 4);
INSERT INTO public.games VALUES (58, 31, 6);
INSERT INTO public.games VALUES (59, 31, 4);
INSERT INTO public.games VALUES (60, 31, 2);
INSERT INTO public.games VALUES (61, 33, 3);
INSERT INTO public.games VALUES (62, 33, 3);
INSERT INTO public.games VALUES (63, 34, 3);
INSERT INTO public.games VALUES (64, 34, 3);
INSERT INTO public.games VALUES (65, 33, 6);
INSERT INTO public.games VALUES (66, 33, 3);
INSERT INTO public.games VALUES (67, 33, 3);
INSERT INTO public.games VALUES (68, 35, 3);
INSERT INTO public.games VALUES (69, 35, 2);
INSERT INTO public.games VALUES (70, 36, 3);
INSERT INTO public.games VALUES (71, 36, 2);
INSERT INTO public.games VALUES (72, 35, 6);
INSERT INTO public.games VALUES (73, 35, 4);
INSERT INTO public.games VALUES (74, 35, 4);
INSERT INTO public.games VALUES (75, 37, 562);
INSERT INTO public.games VALUES (76, 37, 618);
INSERT INTO public.games VALUES (77, 38, 403);
INSERT INTO public.games VALUES (78, 38, 831);
INSERT INTO public.games VALUES (79, 37, 825);
INSERT INTO public.games VALUES (80, 37, 988);
INSERT INTO public.games VALUES (81, 37, 760);
INSERT INTO public.games VALUES (82, 39, 2);
INSERT INTO public.games VALUES (83, 40, 5);
INSERT INTO public.games VALUES (84, 40, 3);
INSERT INTO public.games VALUES (85, 41, 5);
INSERT INTO public.games VALUES (86, 41, 2);
INSERT INTO public.games VALUES (87, 40, 7);
INSERT INTO public.games VALUES (88, 40, 5);
INSERT INTO public.games VALUES (89, 40, 4);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (9, 'user_1718737839084', 1, 0);
INSERT INTO public.users VALUES (10, 'user_1718737839083', 1, 0);
INSERT INTO public.users VALUES (11, 'user_1718737863439', 1, 0);
INSERT INTO public.users VALUES (12, 'user_1718737863438', 1, 0);
INSERT INTO public.users VALUES (14, 'ni', 1, 0);
INSERT INTO public.users VALUES (15, 'nino', 1, 0);
INSERT INTO public.users VALUES (16, 'lamien', 1, 0);
INSERT INTO public.users VALUES (13, 'lamine', 2, 0);
INSERT INTO public.users VALUES (18, 'user_1718738641924', 2, 0);
INSERT INTO public.users VALUES (36, 'user_1718739446897', 2, 0);
INSERT INTO public.users VALUES (17, 'user_1718738641925', 5, 0);
INSERT INTO public.users VALUES (35, 'user_1718739446898', 5, 0);
INSERT INTO public.users VALUES (20, 'user_1718738775542', 2, 0);
INSERT INTO public.users VALUES (19, 'user_1718738775543', 5, 0);
INSERT INTO public.users VALUES (22, 'user_1718738855326', 2, 0);
INSERT INTO public.users VALUES (38, 'user_1718739591736', 2, 403);
INSERT INTO public.users VALUES (21, 'user_1718738855327', 5, 0);
INSERT INTO public.users VALUES (37, 'user_1718739591737', 5, 562);
INSERT INTO public.users VALUES (24, 'user_1718738883248', 2, 0);
INSERT INTO public.users VALUES (39, '3', 1, 2);
INSERT INTO public.users VALUES (23, 'user_1718738883249', 5, 0);
INSERT INTO public.users VALUES (26, 'user_1718739162683', 2, 0);
INSERT INTO public.users VALUES (41, 'user_1718739801966', 2, 2);
INSERT INTO public.users VALUES (25, 'user_1718739162684', 5, 0);
INSERT INTO public.users VALUES (40, 'user_1718739801967', 5, 3);
INSERT INTO public.users VALUES (28, 'user_1718739274514', 2, 0);
INSERT INTO public.users VALUES (27, 'user_1718739274515', 5, 0);
INSERT INTO public.users VALUES (30, 'user_1718739381717', 2, 0);
INSERT INTO public.users VALUES (29, 'user_1718739381718', 5, 0);
INSERT INTO public.users VALUES (32, 'user_1718739409131', 2, 0);
INSERT INTO public.users VALUES (31, 'user_1718739409132', 5, 0);
INSERT INTO public.users VALUES (34, 'user_1718739420383', 2, 0);
INSERT INTO public.users VALUES (33, 'user_1718739420384', 5, 0);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 89, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 41, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games game_user; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT game_user FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

