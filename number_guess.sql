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
-- Name: usern_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.usern_info (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.usern_info OWNER TO freecodecamp;

--
-- Name: usern_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.usern_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usern_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: usern_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.usern_info_user_id_seq OWNED BY public.usern_info.user_id;


--
-- Name: usern_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usern_info ALTER COLUMN user_id SET DEFAULT nextval('public.usern_info_user_id_seq'::regclass);


--
-- Data for Name: usern_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.usern_info VALUES (10, 'user_1707833639098', 2, 900);
INSERT INTO public.usern_info VALUES (9, 'user_1707833639099', 6, 367);
INSERT INTO public.usern_info VALUES (11, 'Wasabee', 2, 6);
INSERT INTO public.usern_info VALUES (13, 'user_1707834143532', 2, 22);
INSERT INTO public.usern_info VALUES (12, 'user_1707834143533', 6, 49);


--
-- Name: usern_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.usern_info_user_id_seq', 13, true);


--
-- Name: usern_info usern_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.usern_info
    ADD CONSTRAINT usern_info_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

