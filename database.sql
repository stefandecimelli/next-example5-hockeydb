--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

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

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: goal; Type: TABLE; Schema: public; Owner: stefan
--

CREATE TABLE public.goal (
    player uuid NOT NULL,
    assist1 uuid,
    assist2 uuid,
    team_for uuid NOT NULL,
    team_against uuid NOT NULL
);


ALTER TABLE public.goal OWNER TO stefan;

--
-- Name: player; Type: TABLE; Schema: public; Owner: stefan
--

CREATE TABLE public.player (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL
);


ALTER TABLE public.player OWNER TO stefan;

--
-- Name: roster; Type: TABLE; Schema: public; Owner: stefan
--

CREATE TABLE public.roster (
    player uuid NOT NULL,
    team uuid NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.roster OWNER TO stefan;

--
-- Name: team; Type: TABLE; Schema: public; Owner: stefan
--

CREATE TABLE public.team (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.team OWNER TO stefan;

--
-- Data for Name: goal; Type: TABLE DATA; Schema: public; Owner: stefan
--

COPY public.goal (player, assist1, assist2, team_for, team_against) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	a881b151-aea1-4d99-8c47-facb2596ee03	\N	ee7bbc0f-48b1-4963-9757-03d942728702	72d6343a-46f3-4684-8d62-4a928fe5b79c
804af1b3-90df-499b-b21b-55fcf172ff3b	a881b151-aea1-4d99-8c47-facb2596ee03	\N	ee7bbc0f-48b1-4963-9757-03d942728702	72d6343a-46f3-4684-8d62-4a928fe5b79c
561dc63b-b684-4663-b801-6909f3b07ada	\N	\N	72d6343a-46f3-4684-8d62-4a928fe5b79c	ee7bbc0f-48b1-4963-9757-03d942728702
a881b151-aea1-4d99-8c47-facb2596ee03	804af1b3-90df-499b-b21b-55fcf172ff3b	\N	ee7bbc0f-48b1-4963-9757-03d942728702	272f84e8-c5dd-4c37-a6cd-f35c663b0bed
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: stefan
--

COPY public.player (id, firstname, lastname) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	Auston	Matthews
a881b151-aea1-4d99-8c47-facb2596ee03	Mitch	Marner
561dc63b-b684-4663-b801-6909f3b07ada	Brad	Marchand
1df3f002-703b-4827-84bf-b32c9fd7dd77	Artemi	Panarin
706751d4-e4c1-4bd8-ba1b-f741d927ec7e	John	Tavares
\.


--
-- Data for Name: roster; Type: TABLE DATA; Schema: public; Owner: stefan
--

COPY public.roster (player, team, number) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	ee7bbc0f-48b1-4963-9757-03d942728702	34
a881b151-aea1-4d99-8c47-facb2596ee03	ee7bbc0f-48b1-4963-9757-03d942728702	16
561dc63b-b684-4663-b801-6909f3b07ada	72d6343a-46f3-4684-8d62-4a928fe5b79c	63
1df3f002-703b-4827-84bf-b32c9fd7dd77	272f84e8-c5dd-4c37-a6cd-f35c663b0bed	10
706751d4-e4c1-4bd8-ba1b-f741d927ec7e	ee7bbc0f-48b1-4963-9757-03d942728702	91
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: stefan
--

COPY public.team (id, name) FROM stdin;
ee7bbc0f-48b1-4963-9757-03d942728702	Toronto Maple Leafs
e6d79d6f-3888-4a5d-b77d-d5bfe479b0f5	Montreal Canadians
72d6343a-46f3-4684-8d62-4a928fe5b79c	Boston Bruins
272f84e8-c5dd-4c37-a6cd-f35c663b0bed	New York Rangers
9a137051-3d92-4719-9d93-1dcf9d6da0fe	Ottawa Senators
\.


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: roster roster_player_key; Type: CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_player_key UNIQUE (player);


--
-- Name: team team_name_key; Type: CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_name_key UNIQUE (name);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: goal fk_a1; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_a1 FOREIGN KEY (assist1) REFERENCES public.player(id);


--
-- Name: goal fk_a2; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_a2 FOREIGN KEY (assist2) REFERENCES public.player(id);


--
-- Name: roster fk_player; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT fk_player FOREIGN KEY (player) REFERENCES public.player(id);


--
-- Name: goal fk_player; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_player FOREIGN KEY (player) REFERENCES public.player(id);


--
-- Name: goal fk_t1; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_t1 FOREIGN KEY (team_for) REFERENCES public.team(id);


--
-- Name: goal fk_t2; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_t2 FOREIGN KEY (team_against) REFERENCES public.team(id);


--
-- Name: roster fk_team; Type: FK CONSTRAINT; Schema: public; Owner: stefan
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT fk_team FOREIGN KEY (team) REFERENCES public.team(id);


--
-- PostgreSQL database dump complete
--

