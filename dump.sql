--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: genre; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.genre_id_seq OWNED BY public.genre.id;


--
-- Name: movie; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movie (
    id integer NOT NULL,
    name text NOT NULL,
    "idGenre" integer NOT NULL
);


--
-- Name: moviePlatform; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."moviePlatform" (
    id integer NOT NULL,
    "idMovie" integer NOT NULL,
    "idPlatform" integer NOT NULL
);


--
-- Name: moviePlatform_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."moviePlatform_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moviePlatform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."moviePlatform_id_seq" OWNED BY public."moviePlatform".id;


--
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.movie_id_seq OWNED BY public.movie.id;


--
-- Name: platform; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.platform (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: platform_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.platform_id_seq OWNED BY public.platform.id;


--
-- Name: userMovieStatus; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."userMovieStatus" (
    id integer NOT NULL,
    username text NOT NULL,
    "idMovie" integer NOT NULL,
    watched boolean NOT NULL,
    note text,
    summary text
);


--
-- Name: userMovieStatus_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."userMovieStatus_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userMovieStatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."userMovieStatus_id_seq" OWNED BY public."userMovieStatus".id;


--
-- Name: genre id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre ALTER COLUMN id SET DEFAULT nextval('public.genre_id_seq'::regclass);


--
-- Name: movie id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie ALTER COLUMN id SET DEFAULT nextval('public.movie_id_seq'::regclass);


--
-- Name: moviePlatform id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."moviePlatform" ALTER COLUMN id SET DEFAULT nextval('public."moviePlatform_id_seq"'::regclass);


--
-- Name: platform id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platform ALTER COLUMN id SET DEFAULT nextval('public.platform_id_seq'::regclass);


--
-- Name: userMovieStatus id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userMovieStatus" ALTER COLUMN id SET DEFAULT nextval('public."userMovieStatus_id_seq"'::regclass);


--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.genre VALUES (1, 'Aventura');
INSERT INTO public.genre VALUES (2, 'Terror');
INSERT INTO public.genre VALUES (3, 'Drama');
INSERT INTO public.genre VALUES (4, 'Acao');
INSERT INTO public.genre VALUES (5, 'Zumbi');


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.movie VALUES (1, 'Avatar', 2);
INSERT INTO public.movie VALUES (3, 'Piratas do caribe', 2);
INSERT INTO public.movie VALUES (4, 'Piratas do caribe 2', 2);
INSERT INTO public.movie VALUES (5, 'O Hobbit', 2);


--
-- Data for Name: moviePlatform; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."moviePlatform" VALUES (1, 1, 4);
INSERT INTO public."moviePlatform" VALUES (2, 3, 4);
INSERT INTO public."moviePlatform" VALUES (3, 4, 1);
INSERT INTO public."moviePlatform" VALUES (4, 5, 1);


--
-- Data for Name: platform; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.platform VALUES (1, 'Netflix');
INSERT INTO public.platform VALUES (2, 'Prime Video');
INSERT INTO public.platform VALUES (3, 'Star Plus');
INSERT INTO public.platform VALUES (4, 'Paramount');
INSERT INTO public.platform VALUES (5, 'HBO max');


--
-- Data for Name: userMovieStatus; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."userMovieStatus" VALUES (4, 'pedro', 4, true, 'MUITO LEGAL', 'muito bom');
INSERT INTO public."userMovieStatus" VALUES (5, 'pedro', 5, true, 'MUITO LEGAL', 'muito bom');


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.genre_id_seq', 5, true);


--
-- Name: moviePlatform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."moviePlatform_id_seq"', 4, true);


--
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.movie_id_seq', 5, true);


--
-- Name: platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.platform_id_seq', 5, true);


--
-- Name: userMovieStatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."userMovieStatus_id_seq"', 6, true);


--
-- Name: genre genre_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_name_key UNIQUE (name);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: moviePlatform moviePlatform_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."moviePlatform"
    ADD CONSTRAINT "moviePlatform_pkey" PRIMARY KEY (id);


--
-- Name: movie movie_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_name_key UNIQUE (name);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (id);


--
-- Name: platform platform_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_name_key UNIQUE (name);


--
-- Name: platform platform_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.platform
    ADD CONSTRAINT platform_pkey PRIMARY KEY (id);


--
-- Name: userMovieStatus userMovieStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userMovieStatus"
    ADD CONSTRAINT "userMovieStatus_pkey" PRIMARY KEY (id);


--
-- Name: moviePlatform moviePlatform_idMovie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."moviePlatform"
    ADD CONSTRAINT "moviePlatform_idMovie_fkey" FOREIGN KEY ("idMovie") REFERENCES public.movie(id);


--
-- Name: moviePlatform moviePlatform_idPlatform_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."moviePlatform"
    ADD CONSTRAINT "moviePlatform_idPlatform_fkey" FOREIGN KEY ("idPlatform") REFERENCES public.platform(id);


--
-- Name: movie movie_idGenre_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT "movie_idGenre_fkey" FOREIGN KEY ("idGenre") REFERENCES public.genre(id);


--
-- Name: userMovieStatus userMovieStatus_idMovie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."userMovieStatus"
    ADD CONSTRAINT "userMovieStatus_idMovie_fkey" FOREIGN KEY ("idMovie") REFERENCES public.movie(id);


--
-- PostgreSQL database dump complete
--

