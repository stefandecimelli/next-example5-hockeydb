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
-- Name: goal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.goal (
    player uuid NOT NULL,
    assist1 uuid,
    assist2 uuid,
    team_for uuid NOT NULL,
    team_against uuid NOT NULL
);


ALTER TABLE public.goal OWNER TO postgres;

--
-- Name: player; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.player (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL
);


ALTER TABLE public.player OWNER TO postgres;

--
-- Name: roster; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roster (
    player uuid NOT NULL,
    team uuid NOT NULL,
    number integer NOT NULL
);


ALTER TABLE public.roster OWNER TO postgres;

--
-- Name: team; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.team (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.team OWNER TO postgres;

--
-- Data for Name: goal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.goal (player, assist1, assist2, team_for, team_against) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	a881b151-aea1-4d99-8c47-facb2596ee03	\N	ee7bbc0f-48b1-4963-9757-03d942728702	72d6343a-46f3-4684-8d62-4a928fe5b79c
804af1b3-90df-499b-b21b-55fcf172ff3b	a881b151-aea1-4d99-8c47-facb2596ee03	\N	ee7bbc0f-48b1-4963-9757-03d942728702	72d6343a-46f3-4684-8d62-4a928fe5b79c
561dc63b-b684-4663-b801-6909f3b07ada	\N	\N	72d6343a-46f3-4684-8d62-4a928fe5b79c	ee7bbc0f-48b1-4963-9757-03d942728702
a881b151-aea1-4d99-8c47-facb2596ee03	804af1b3-90df-499b-b21b-55fcf172ff3b	\N	ee7bbc0f-48b1-4963-9757-03d942728702	272f84e8-c5dd-4c37-a6cd-f35c663b0bed
\.


--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.player (id, firstname, lastname) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	Auston	Matthews
a881b151-aea1-4d99-8c47-facb2596ee03	Mitch	Marner
561dc63b-b684-4663-b801-6909f3b07ada	Brad	Marchand
1df3f002-703b-4827-84bf-b32c9fd7dd77	Artemi	Panarin
706751d4-e4c1-4bd8-ba1b-f741d927ec7e	John	Tavares
\.


--
-- Data for Name: roster; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roster (player, team, number) FROM stdin;
804af1b3-90df-499b-b21b-55fcf172ff3b	ee7bbc0f-48b1-4963-9757-03d942728702	34
a881b151-aea1-4d99-8c47-facb2596ee03	ee7bbc0f-48b1-4963-9757-03d942728702	16
561dc63b-b684-4663-b801-6909f3b07ada	72d6343a-46f3-4684-8d62-4a928fe5b79c	63
1df3f002-703b-4827-84bf-b32c9fd7dd77	272f84e8-c5dd-4c37-a6cd-f35c663b0bed	10
706751d4-e4c1-4bd8-ba1b-f741d927ec7e	ee7bbc0f-48b1-4963-9757-03d942728702	91
\.


--
-- Data for Name: team; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.team (id, name) FROM stdin;
ee7bbc0f-48b1-4963-9757-03d942728702	Toronto Maple Leafs
e6d79d6f-3888-4a5d-b77d-d5bfe479b0f5	Montreal Canadians
72d6343a-46f3-4684-8d62-4a928fe5b79c	Boston Bruins
272f84e8-c5dd-4c37-a6cd-f35c663b0bed	New York Rangers
9a137051-3d92-4719-9d93-1dcf9d6da0fe	Ottawa Senators
7fa8b87e-5f09-42d3-8f21-213b6a5c7eb2    Detroit Red Wings
1fd8f06f-8c2d-4e89-8acb-65d9a9e0e8b6    Chicago Blackhawks
a4f5c0c3-7f8c-4d3a-a39f-9e28f5c3f7c8    St. Louis Blues
5b12a8b7-3ea7-4e91-b23c-85bf2f4f5b50    Los Angeles Kings
c67a8d9a-7c4b-4047-8f63-305c3a9b9f1e    Philadelphia Flyers
d3e1073f-21bf-47d6-86f6-ff56d046f5e7    Pittsburgh Penguins
8e1b8e1c-b1b2-4b4e-8b5f-4f839c36a5e1    New York Islanders
4ad9f7c6-a1f6-4f95-9dac-6e3f08f7ea2a    New Jersey Devils
b7d025c2-14ce-4d8f-adeb-3f8b735e1c7d    Washington Capitals
f9b4d3e2-ffcc-4d93-bf9e-9bf0f4e3e4a1    Edmonton Oilers
3ac0e4ae-9c9f-4b64-a91b-3c9a8f9e4ecf    Vancouver Canucks
12b3c23d-8e68-4a1e-b1e5-69b5b66f5c85    Calgary Flames
4c5d12b7-cc79-406c-8db1-1b4869a60b1e    Winnipeg Jets
2edc0be4-0bae-443c-8f7e-b0e5d44b5b72    San Jose Sharks
6e3f307e-7153-4c60-9d04-1a2a3b9c8c3a    Colorado Avalanche
79da4b1b-3c5b-4c77-8e3a-6fcb87f0f600    Florida Panthers
1e8b4f5e-b7c4-47a2-9b19-fb1e04c2e6f9    Anaheim Ducks
0fd3dbf3-4a56-44b6-984f-933c0aaf44d4    Dallas Stars
9f8b79db-39a6-4e93-8061-416b7a7e5c7a    Arizona Coyotes
5a7c1d6e-77d5-4d2a-8c3b-1e5dc0e0f3c6    Nashville Predators
f1d2c2e5-6c7e-4567-acaf-ff6d6f32e283    Tampa Bay Lightning
8b5f4578-8eb4-49b2-a579-890c6f91a5f7    Carolina Hurricanes
3b9f5b36-f0f1-45ed-9e25-4e5e5c9ed5c8    Columbus Blue Jackets
7e8f62be-2ad2-4d19-bff7-3d66b0af15d7    Minnesota Wild
6f80f1a2-57b9-4e0a-8a8d-e5f6ef136ae3    Vegas Golden Knights
2a6f0e45-3aa1-477e-92f8-6380e6daf56c    Seattle Kraken
9a3b0e8d-62c4-4a7a-9c77-4f2c9e3b9e67    Buffalo Sabres
\.


--
-- Name: player player_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.player
    ADD CONSTRAINT player_pkey PRIMARY KEY (id);


--
-- Name: roster roster_player_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT roster_player_key UNIQUE (player);


--
-- Name: team team_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_name_key UNIQUE (name);


--
-- Name: team team_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.team
    ADD CONSTRAINT team_pkey PRIMARY KEY (id);


--
-- Name: goal fk_a1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_a1 FOREIGN KEY (assist1) REFERENCES public.player(id);


--
-- Name: goal fk_a2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_a2 FOREIGN KEY (assist2) REFERENCES public.player(id);


--
-- Name: roster fk_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT fk_player FOREIGN KEY (player) REFERENCES public.player(id);


--
-- Name: goal fk_player; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_player FOREIGN KEY (player) REFERENCES public.player(id);


--
-- Name: goal fk_t1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_t1 FOREIGN KEY (team_for) REFERENCES public.team(id);


--
-- Name: goal fk_t2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.goal
    ADD CONSTRAINT fk_t2 FOREIGN KEY (team_against) REFERENCES public.team(id);


--
-- Name: roster fk_team; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roster
    ADD CONSTRAINT fk_team FOREIGN KEY (team) REFERENCES public.team(id);


--
-- PostgreSQL database dump complete
--

