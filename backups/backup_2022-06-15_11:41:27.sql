--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--

DROP DATABASE "shelter-helper";
DROP DATABASE shelter_helper_test;




--
-- Drop roles
--

DROP ROLE root;


--
-- Roles
--

CREATE ROLE root;
ALTER ROLE root WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:Iw2EvWh3tL0lKPy+PLZSMg==$lSwB7tltguYVHg84UxZA//NAWEzaPmJnxgj0bevcogc=:2t6qje9mPLDcx63BK58o8Zw3B2QHTLEtes04pPi4/E0=';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO root;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: root
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: root
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO root;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: root
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- PostgreSQL database dump complete
--

--
-- Database "shelter-helper" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: shelter-helper; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE "shelter-helper" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE "shelter-helper" OWNER TO root;

\connect -reuse-previous=on "dbname='shelter-helper'"

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
-- Name: animals; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.animals (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    photo character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    weight double precision NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    shelter_id bigint NOT NULL,
    sterilized boolean NOT NULL,
    description text NOT NULL,
    birthday date NOT NULL,
    is_archive date,
    booked timestamp(0) without time zone,
    booked_user_id bigint
);


ALTER TABLE public.animals OWNER TO root;

--
-- Name: animals_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.animals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.animals_id_seq OWNER TO root;

--
-- Name: animals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.animals_id_seq OWNED BY public.animals.id;


--
-- Name: announcements; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.announcements (
    id bigint NOT NULL,
    topic character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    shelter_id bigint NOT NULL,
    done date
);


ALTER TABLE public.announcements OWNER TO root;

--
-- Name: announcements_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.announcements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.announcements_id_seq OWNER TO root;

--
-- Name: announcements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.announcements_id_seq OWNED BY public.announcements.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO root;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth_access_tokens (
    id character varying(100) NOT NULL,
    user_id bigint,
    client_id bigint NOT NULL,
    name character varying(255),
    scopes text,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_access_tokens OWNER TO root;

--
-- Name: oauth_auth_codes; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth_auth_codes (
    id character varying(100) NOT NULL,
    user_id bigint NOT NULL,
    client_id bigint NOT NULL,
    scopes text,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_auth_codes OWNER TO root;

--
-- Name: oauth_clients; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth_clients (
    id bigint NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL,
    secret character varying(100),
    provider character varying(255),
    redirect text NOT NULL,
    personal_access_client boolean NOT NULL,
    password_client boolean NOT NULL,
    revoked boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_clients OWNER TO root;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_clients_id_seq OWNER TO root;

--
-- Name: oauth_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.oauth_clients_id_seq OWNED BY public.oauth_clients.id;


--
-- Name: oauth_personal_access_clients; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth_personal_access_clients (
    id bigint NOT NULL,
    client_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_personal_access_clients OWNER TO root;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.oauth_personal_access_clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_personal_access_clients_id_seq OWNER TO root;

--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.oauth_personal_access_clients_id_seq OWNED BY public.oauth_personal_access_clients.id;


--
-- Name: oauth_refresh_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.oauth_refresh_tokens (
    id character varying(100) NOT NULL,
    access_token_id character varying(100) NOT NULL,
    revoked boolean NOT NULL,
    expires_at timestamp(0) without time zone
);


ALTER TABLE public.oauth_refresh_tokens OWNER TO root;

--
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO root;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- Name: shelters; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.shelters (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    city character varying(255) NOT NULL,
    photo character varying(255) NOT NULL
);


ALTER TABLE public.shelters OWNER TO root;

--
-- Name: shelters_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.shelters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shelters_id_seq OWNER TO root;

--
-- Name: shelters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.shelters_id_seq OWNED BY public.shelters.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    role boolean NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_shelters; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_shelters (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    shelter_id bigint NOT NULL
);


ALTER TABLE public.users_shelters OWNER TO root;

--
-- Name: users_shelters_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_shelters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_shelters_id_seq OWNER TO root;

--
-- Name: users_shelters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_shelters_id_seq OWNED BY public.users_shelters.id;


--
-- Name: animals id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.animals ALTER COLUMN id SET DEFAULT nextval('public.animals_id_seq'::regclass);


--
-- Name: announcements id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.announcements ALTER COLUMN id SET DEFAULT nextval('public.announcements_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: oauth_clients id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_clients_id_seq'::regclass);


--
-- Name: oauth_personal_access_clients id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_personal_access_clients ALTER COLUMN id SET DEFAULT nextval('public.oauth_personal_access_clients_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- Name: shelters id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shelters ALTER COLUMN id SET DEFAULT nextval('public.shelters_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: users_shelters id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_shelters ALTER COLUMN id SET DEFAULT nextval('public.users_shelters_id_seq'::regclass);


--
-- Data for Name: animals; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.animals (id, name, gender, photo, type, weight, created_at, updated_at, shelter_id, sterilized, description, birthday, is_archive, booked, booked_user_id) FROM stdin;
57	Динкe	Дівчинка	11.jpeg	Пес	6	2022-05-23 20:54:21	2022-05-26 18:51:22	44	f	Доросла, але дуже ласкава	2018-01-26	2022-05-26	\N	\N
54	Артемида	Дівчинка	9.jpeg	Пес	4	2022-05-23 20:46:08	2022-05-23 20:46:08	44	f	Грайлива	2021-02-03	2022-05-02	\N	\N
50	Арчи	Хлопчик	8.jpeg	Пес	7	2022-05-23 15:46:50	2022-06-03 18:18:30	29	f	Дуже добрий, стане гарним охоронцем	2020-08-04	\N	2022-06-25 02:41:00	1
70	Алексa	Хлопчик	11.jpeg	Пес	4	2022-06-03 19:17:01	2022-06-03 19:17:01	29	f	ewfwefwef	2019-06-16	\N	\N	\N
69	Слава	Хлопчик	12.jpeg	Пес	10	2022-06-01 23:03:15	2022-06-05 09:04:38	44	f	Добра та ррайлива соакаа	2021-07-07	\N	2022-06-22 16:04:00	1
75	Тимофей	Хлопчик	10.jpeg	Кіт	6	2022-06-03 19:20:57	2022-06-05 09:07:52	29	t	fqfwq	2022-01-05	\N	2022-06-18 12:10:00	1
46	Барсик	Хлопчик	6.jpg	Кіт	6	2022-05-23 15:42:15	2022-05-23 15:42:15	29	t	Добрый, очень игривый и отлично ладит с другими животными	2019-09-08	\N	\N	\N
56	Снежок	Хлопчик	10.jpeg	Пес	3	2022-05-23 20:52:07	2022-05-23 20:52:07	44	t	Дуже грайливий, шукає дім	2022-05-14	\N	\N	\N
37	Анина	Дівчинка	2.jpg	Пес	3	2022-05-18 23:51:04	2022-05-18 23:51:05	29	f	Дуже спокійна і слухняна дівнчина	2020-09-18	\N	\N	\N
39	Алекс	Хлопчик	4.jpg	Кіт	4	2022-05-18 23:53:30	2022-05-18 23:53:36	29	t	Грайливий, весели та дружелюбний	2022-02-09	\N	\N	\N
42	Тимофей	Хлопчик	рыжик.jpeg	Кіт	1	2022-05-23 12:41:54	2022-05-23 12:41:54	29	f	Ласковый котик ищет новый дом	2022-03-01	\N	\N	\N
45	Тишка	Хлопчик	4.jpeg	Кіт	4	2022-05-23 15:34:46	2022-05-23 15:34:46	29	t	Спокойный, ласковый	2020-10-02	\N	\N	\N
67	іацууц	Дівчинка	4.jpeg	Пес	3	2022-05-23 20:58:37	2022-05-23 20:58:37	44	f	цацйайца	2022-05-06	\N	\N	\N
73	Артемида	Дівчинка	4.jpeg	Пес	4	2022-06-03 19:19:23	2022-06-13 08:52:56	29	f	sefwef	2022-06-16	\N	2022-06-24 11:56:00	9
38	Мурка	Дівчинка	3.jpeg	Пес	4	2022-05-18 23:52:24	2022-06-13 08:56:35	29	t	Ласкава кішечка дуже	2017-02-21	2022-04-11	\N	\N
76	wfwfq	Дівчинка	10.jpeg	Пес	100	2022-06-13 09:00:01	2022-06-13 09:00:01	29	t	wefwef	2022-02-03	\N	\N	\N
36	Дружок	Хлопчик	1.jpeg	Пес	5	2022-05-18 23:49:17	2022-06-13 14:23:34	29	f	Грайливий Дружок шукає собі новий дім	2021-05-19	\N	\N	\N
77	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-14 21:17:17	2022-06-14 21:17:17	44	t	wefwefwef	2018-01-25	\N	\N	\N
78	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-14 21:17:50	2022-06-14 21:17:50	44	t	wefwefwef	2018-01-25	\N	\N	\N
79	wefwefs	Хлопчик	9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY	Пес	4	2022-06-14 21:19:08	2022-06-14 21:23:51	44	t	wefwefwef	2018-01-25	\N	\N	\N
80	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-14 21:29:29	2022-06-14 21:29:29	44	t	wefwefwef	2018-01-25	\N	\N	\N
43	Булочка	Дівчинка	2.jpeg	Кіт	4	2022-05-23 15:30:31	2022-06-14 21:58:29	29	t	Игривая,добрая,милая	2022-03-04	\N	\N	117
81	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-14 22:21:55	2022-06-14 22:21:55	44	t	wefwefwef	2018-01-25	\N	\N	\N
82	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-14 22:23:09	2022-06-14 22:23:09	44	t	wefwefwef	2018-01-25	\N	\N	\N
83	Gamwefs	Хлопчик	9.jpeg	Пес	4	2022-06-15 08:35:38	2022-06-15 08:35:38	44	t	wefwefwef	2018-01-25	\N	\N	\N
66	Персик	Хлопчик	12.jpeg	Пес	1	2022-05-23 20:57:10	2022-06-15 08:38:12	44	f	Дуже добрий	2020-12-31	2022-06-15	\N	\N
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.announcements (id, topic, description, created_at, updated_at, shelter_id, done) FROM stdin;
7	medicines	wefwef	2022-05-23 21:14:01	2022-05-23 21:14:01	44	\N
6	food	wefwef	2022-05-23 21:14:01	2022-05-23 21:14:01	44	\N
4	toys	asdasda	2022-03-29 16:15:41	\N	44	\N
8	dishes	cdfc	2022-06-03 19:23:30	2022-06-04 10:07:29	29	2022-06-04
9	medicines	ascscw	2022-06-13 09:41:51	2022-06-13 14:20:54	29	2022-06-13
10	Gamwefs	wfwefw	2022-06-14 21:37:57	2022-06-14 21:37:57	44	\N
11	Gamwefs	wfwefw	2022-06-14 21:38:07	2022-06-14 21:38:07	44	\N
12	Gamwefs	wfwefw	2022-06-14 21:38:50	2022-06-14 21:38:50	44	\N
13	Gamwefs	wfwefw	2022-06-14 21:39:50	2022-06-14 21:39:50	44	\N
14	Gamwefs	wfwefw	2022-06-14 22:21:56	2022-06-14 22:21:56	44	\N
15	Gamwefs	wfwefw	2022-06-14 22:23:10	2022-06-14 22:23:10	44	\N
16	Gamwefs	wfwefw	2022-06-15 08:38:58	2022-06-15 08:38:58	44	\N
17	Gamwefs	wfwefw	2022-06-15 08:39:04	2022-06-15 08:39:04	44	\N
3	dishes	wefwef	2022-05-23 21:14:01	2022-06-15 08:40:03	44	2022-06-15
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	2016_06_01_000001_create_oauth_auth_codes_table	1
2	2016_06_01_000002_create_oauth_access_tokens_table	1
3	2016_06_01_000003_create_oauth_refresh_tokens_table	1
4	2016_06_01_000004_create_oauth_clients_table	1
5	2016_06_01_000005_create_oauth_personal_access_clients_table	1
6	2019_12_14_000001_create_personal_access_tokens_table	1
7	2022_05_09_091650_init_migration	1
10	2022_05_10_194207_shelter_edit_data	2
12	2022_05_15_115326_animal_edit_data	3
13	2022_05_17_185923_add_photo_to_shelter	4
15	2022_05_18_193328_add_description_animal	5
16	2022_05_23_193038_change_isacrhived	6
17	2022_05_29_131033_add_done_filed_announcement	7
19	2022_06_01_194228_add_booked_field_animal	8
\.


--
-- Data for Name: oauth_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_access_tokens (id, user_id, client_id, name, scopes, revoked, created_at, updated_at, expires_at) FROM stdin;
a4ec1156839cc3a48efe15c80da0870c55d5f70d1c83d696ea6c3325c441d63b9b36a41cf941be6e	2	1	Laravel	["user"]	f	2022-05-09 12:06:08	2022-05-09 12:06:08	2023-05-09 12:06:08
7ac17e50cdbd4244779e439eb0b6f4de31b524da62fc700a13223f370be8cdbf7e9f105bb4808cb7	3	3	Laravel	["user"]	f	2022-05-15 14:05:45	2022-05-15 14:05:45	2022-05-16 14:05:45
54a3e53b10466839d7b23ed8cde69ff2530a9710a99301c1534814e5a397b6151752059d0be3559d	2	1	Laravel	["user"]	f	2022-05-09 12:06:37	2022-05-09 12:06:37	2022-05-10 12:06:37
878c90f543f04e6a8e8d671825f982a26668d6643ff6a6a7eac0c59d4daaad2763914d348d3569cf	2	1	Laravel	["user"]	f	2022-05-09 12:22:35	2022-05-09 12:22:35	2022-05-10 12:22:35
6d0785e69e999af49b50b5cd22bbf7242d5224b6a87512fb285fe60ade18df2bffc9b37373ac461f	2	1	Laravel	["user"]	f	2022-05-09 12:06:38	2022-05-09 12:06:38	2022-05-10 12:06:38
b82cb42af37732b4e259d74043861474b22e1a030ebfea76ebbefcba3fdf9724870850d68a1e3edf	2	1	Laravel	["user"]	f	2022-05-09 12:22:10	2022-05-09 12:22:10	2022-05-10 12:22:10
82e195868a2855b9f779c3ca157603688d0085db98cd05905c72dc8807001b54868286c572bf7ee5	2	1	Laravel	["user"]	f	2022-05-09 16:43:20	2022-05-09 16:43:20	2022-05-10 16:43:20
a6fcd42b4a9d8aeec227e2f52c9f50ea024974ec6079d3ac302b60489894301c3039e6966a02eae4	2	1	Laravel	["user"]	f	2022-05-09 12:22:13	2022-05-09 12:22:13	2022-05-10 12:22:13
014d2096a05e38fccfa1cf647119191837db995bd0a019295912d1a0c9c0d71db30b9d569444201d	2	1	Laravel	["user"]	f	2022-05-09 12:22:36	2022-05-09 12:22:36	2022-05-10 12:22:36
4e72aa3eb142e6e68cad01600fc55856ecf2f2c25094dfb1bc66ed99a5a5005ed103aaa17bda0fdd	2	1	Laravel	["user"]	f	2022-05-09 12:22:13	2022-05-09 12:22:13	2022-05-10 12:22:13
fdeebb4949415619cb6dc951ca508c53d7978f3d459fc5febb6e690627fe1b79c19129edc7b8d39e	2	1	Laravel	["user"]	f	2022-05-09 12:22:13	2022-05-09 12:22:13	2022-05-10 12:22:14
2f7cb47363ee686ad98f3ba7bb9b0a2f2caee96c08dfbb2ee0583d4c9049dbe455b6c271199ea52e	2	1	Laravel	["user"]	f	2022-05-09 12:22:24	2022-05-09 12:22:24	2022-05-10 12:22:24
b8e675ff7ef319546bedcdaed8af0b8e8cb9f5f67af84615cb20146448a60ea4946a52059e2ff7da	2	1	Laravel	["user"]	f	2022-05-09 12:22:36	2022-05-09 12:22:36	2022-05-10 12:22:36
ecdae374f0eb85cda26b2f7d6745c91b6c20fb2fab56c75d152612242b7183037d7d0ad6b25bf9f0	2	1	Laravel	["user"]	f	2022-05-09 12:22:26	2022-05-09 12:22:26	2022-05-10 12:22:26
754d0cf010e81e3c26c5b34adafd1bfa1c0398888cf65c0793c26a515af8b51f48ce1ed4b6be4cfb	2	1	Laravel	["user"]	f	2022-05-09 12:22:34	2022-05-09 12:22:34	2022-05-10 12:22:34
ca6cd191421b5be8cedfefa197468612ed0f2091a26b9823e09be0638ca870c6fc4809646893cebb	2	3	Laravel	["user"]	f	2022-05-12 17:36:42	2022-05-12 17:36:42	2022-05-13 17:36:42
436f7f42c27ba610bc5f2ec7555f3d172e4ed4b3391108cb4add3028eb124b9a9d4f52bbfe1e6ae5	2	1	Laravel	["user"]	f	2022-05-09 12:22:34	2022-05-09 12:22:34	2022-05-10 12:22:35
2e2ae8907816f72c65e9dd2630a43a1cd5803f3e04c33df5e03c232a372326516a5553cc1467c7df	2	1	Laravel	["user"]	f	2022-05-09 12:22:36	2022-05-09 12:22:36	2022-05-10 12:22:36
18d9909ec0b34435db87638ed5021c38d60baabe9438cde25fd3619e0727f3830899a93509b565cc	2	1	Laravel	["user"]	f	2022-05-09 12:22:35	2022-05-09 12:22:35	2022-05-10 12:22:35
a96281162022e578590f6afedc2621ae48f334a1a6b10fa4fd64b22ab387540078f27e1ad33958b2	2	1	Laravel	["user"]	f	2022-05-09 12:22:35	2022-05-09 12:22:35	2022-05-10 12:22:35
6a465b35571b226ea5b53dc72e1550b795a8adbc9fda5a69b17c24179786817913b2523b875ab476	2	1	Laravel	["user"]	f	2022-05-09 17:23:18	2022-05-09 17:23:18	2022-05-10 17:23:18
50dec8e1627c27934c8521fece9458459eef147ffbc915633c1bf2aa412445c473797c63dbcef254	2	1	Laravel	["user"]	f	2022-05-09 12:22:35	2022-05-09 12:22:35	2022-05-10 12:22:35
e4aadcada1cd06136935fa02f1b269e0f5894605b9d6b14bca9b52a6b23cd21188220dc0858efa0c	2	1	Laravel	["user"]	f	2022-05-09 12:22:36	2022-05-09 12:22:36	2022-05-10 12:22:36
bffc1038a27b5c7fd92f2f660a1ffa562b4b6ff8f46c6f85b5a6374a15b2ba6b955181d6a6c96dd2	2	1	Laravel	["user"]	f	2022-05-09 12:24:48	2022-05-09 12:24:48	2022-05-10 12:24:48
b22335607b10e9f4da5279023b124b1e74e980241f59451b7680c1fcf71e96f0dea39de8ff2be979	2	1	Laravel	["user"]	f	2022-05-09 12:24:52	2022-05-09 12:24:52	2022-05-10 12:24:52
81cbae8bd923f42821d4fea4b2c9ea0d1e344e573c49e3832e5632dec553d195906d99a67ce59986	2	1	Laravel	["user"]	f	2022-05-09 17:23:18	2022-05-09 17:23:18	2022-05-10 17:23:18
98bf5cd3709e65b58ff7c0c51dfd9632f3cfc262ee0a55fd5f03671807ba170b5c13c4e33c08ed82	2	1	Laravel	["user"]	f	2022-05-09 12:28:09	2022-05-09 12:28:09	2022-05-10 12:28:09
7c03a869d13dc53c374a9b90994f0021f94f60d792b87aadace6666def5f224717515c1a1b1ed3bc	2	1	Laravel	["user"]	f	2022-05-09 12:28:10	2022-05-09 12:28:10	2022-05-10 12:28:10
f91215b557728d80851c60f2e76ac284d61acd410a0b81fc3e42089e5bd1c48c8706d3f7889cbce9	3	3	Laravel	["user"]	f	2022-05-15 10:02:53	2022-05-15 10:02:53	2022-05-16 10:02:53
b55bf4b9642afb448a81a36bb0764ac6ee9ef580a7c3f845975cb9f217a9cf0570b2d312946f29c3	2	3	Laravel	["user"]	f	2022-05-09 17:35:22	2022-05-09 17:35:22	2022-05-10 17:35:22
7601b4d0fbdc4e00276ee2d258681d532220e0ff4742a8dc0eaf9c6dec931ee39d2f27b475caf077	2	3	Laravel	["user"]	f	2022-05-12 17:37:27	2022-05-12 17:37:27	2022-05-13 17:37:27
e104c93dc6e1d93f89cb66e7dc3b514097ec512eff1b1b6953a91acebb0f5ce76721ad2a5034d483	2	3	Laravel	["user"]	f	2022-05-10 18:05:33	2022-05-10 18:05:33	2022-05-11 18:05:33
2178b6d6a0a525657e558022185529044c3c209ba17e33f5501a9f7597ae95589365d4d45c4a4853	3	3	Laravel	["user"]	f	2022-05-10 18:50:35	2022-05-10 18:50:35	2022-05-11 18:50:35
37a604c658af35f4e6bf8aa6f736da3b4a7419134f5f9b99ca18b027debfa683c72b13c94a4d44f4	3	3	Laravel	["user"]	f	2022-05-12 17:38:05	2022-05-12 17:38:05	2022-05-13 17:38:05
e4df6563916f8191ba15248fa601b5bf4f2e1d64eeccb626cc02ebadc064939f1cf60dc3365aeb2d	2	3	Laravel	["user"]	f	2022-05-14 14:11:47	2022-05-14 14:11:47	2022-05-15 14:11:47
c6bbd828a8a0acecdbb6cde1bd343b7a43c38b517f2869aba57f5c65a39e644e1d29aeae4659f558	2	3	Laravel	["user"]	f	2022-05-15 14:04:11	2022-05-15 14:04:11	2022-05-16 14:04:11
105219b769d0928c11f00fad3f30463724cd02dcfa2cd9281f1d6ffe052363115f24aae58b528287	3	3	Laravel	["user"]	f	2022-05-15 14:08:48	2022-05-15 14:08:48	2022-05-16 14:08:48
0597299dc32c98f27f1c9d3318551e178c562540ffeed4b0d1da384a066399d26a43388cc27f5b5d	3	3	Laravel	["user"]	f	2022-05-15 14:05:45	2022-05-15 14:05:45	2022-05-16 14:05:45
d823b7c5045160281395ff91f62781eee001f002df4cbd845a97477edf4f8f421dfb321750b14472	3	3	Laravel	["user"]	f	2022-05-15 15:57:11	2022-05-15 15:57:11	2022-05-16 15:57:11
78dbd28ae03328995d93e6243d51c569ca3390fb2d2a60279ff9d4dc32b9a42fb1b1077ec8256842	3	3	Laravel	["user"]	f	2022-05-15 18:00:33	2022-05-15 18:00:33	2022-05-16 18:00:33
a4193d6ca8694799bf856fc6f9d4ceb7342ace90d1614370479beb7d1c00884a355bd1703b590d9c	3	3	Laravel	["user"]	f	2022-05-15 19:28:05	2022-05-15 19:28:05	2022-05-16 19:28:05
dea9bea54a12945c4ecebb663c41e8b18138592c825e5fd94948f135a0075e32ab0a9f63ee3847fc	3	3	Laravel	["user"]	f	2022-05-15 19:28:06	2022-05-15 19:28:06	2022-05-16 19:28:06
7ee41efbac7a7b7eb269d05cf686eaef20af9fcdaa2a1d78afcbcb093086738f67b1a65b3714e390	2	3	Laravel	["user"]	f	2022-05-16 17:55:19	2022-05-16 17:55:19	2022-05-17 17:55:19
981b54061172f53f98baf505badd729cae6806248af8ab22380d6e230cc34f56bf7b10ac661b11ba	3	3	Laravel	["user"]	f	2022-05-17 20:01:46	2022-05-17 20:01:46	2022-05-18 20:01:46
1a4a9c4ca4eb7bcad70e63bfb5a218ffeb42dd93398104a8f20b3bbd41130e210d367a50b8ce70f2	2	3	Laravel	["user"]	f	2022-05-17 18:24:51	2022-05-17 18:24:51	2022-05-18 18:24:51
54590acb9b32b7aa4a8978d41233642b3d15e2ee0c8fd1dbbf7b24348448cf4083dbbd8f73018f94	2	3	Laravel	["user"]	f	2022-05-17 18:51:29	2022-05-17 18:51:29	2022-05-18 18:51:29
373a317d046aac808acd0a44e17ac0e1e67a0853ae1ec2e37be409f32a81894459374d8d1c25834f	3	3	Laravel	["user"]	f	2022-05-22 13:40:39	2022-05-22 13:40:39	2022-05-23 13:40:39
5853c45abc93440c3545e4a9d5b4de16eb6ca5bbb035a4752aed9e9c3bc5b9b9b6b2eceb2089d59c	3	3	Laravel	["user"]	f	2022-05-17 18:52:07	2022-05-17 18:52:07	2022-05-18 18:52:07
48405c4982bb963d4af674099f9fc3dcdb81577896f9cf1f51fa8c2b3aabf5f23ad0b6a05175adca	2	3	Laravel	["user"]	f	2022-05-17 20:49:27	2022-05-17 20:49:27	2022-05-18 20:49:27
688c35d08469c37716599bb9ec66230e94a414d3bce2b80460c601835f70459c1cdf29bd29e317ff	3	3	Laravel	["user"]	f	2022-05-17 19:24:45	2022-05-17 19:24:45	2022-05-18 19:24:45
452c5fe0e9c712c88e2ce53e08c6492d0b430e9aae5cc2317887efefd803aa181b2f334dcb647283	3	3	Laravel	["user"]	f	2022-05-17 19:27:17	2022-05-17 19:27:17	2022-05-18 19:27:17
f7bb0a3ed6f29d351133face48b1d77cd0fc10fa2349adce50c6348f566bb46f92b53e49f67ccf19	3	3	Laravel	["user"]	f	2022-05-17 19:29:02	2022-05-17 19:29:02	2022-05-18 19:29:02
6753dfc6c723eb29369547a623cb9087b841d65251386ec9f626ebb87dccdf70343da3f60043f03a	3	3	Laravel	["user"]	f	2022-05-17 20:50:04	2022-05-17 20:50:04	2022-05-18 20:50:04
cab89cd41b5daba93b374c42f1c65e27db3ebe4021e8d304a166fe129cb2f5a6a4cd3f45326255d2	3	3	Laravel	["user"]	f	2022-05-17 19:53:38	2022-05-17 19:53:38	2022-05-18 19:53:38
a44c1a33d68083adb526f7c39e54227160e8531cc444cb9f40f9a7b5c84aad4706e8e4285310b49c	3	3	Laravel	["user"]	f	2022-05-17 19:54:30	2022-05-17 19:54:30	2022-05-18 19:54:30
f0010834e2acfe011be8c0b5ecf50320a9b08690e932e312e17704c6e459dc927153b23505fd286b	2	3	Laravel	["user"]	f	2022-05-23 15:50:03	2022-05-23 15:50:03	2022-05-24 15:50:03
ce93a89a3e28e90566cd6a582d2737e8566eb9c5f2fe63eda428e306a8301bfc77f63335ec5b1af4	3	3	Laravel	["user"]	f	2022-05-17 19:55:37	2022-05-17 19:55:37	2022-05-18 19:55:37
033f8c17b423a95f61bc605e4c420bd8f21ff750cb2aafdd68ae6eeae5d9d973fad5a023669a5330	3	3	Laravel	["user"]	f	2022-05-18 18:12:28	2022-05-18 18:12:28	2022-05-19 18:12:28
288fa77cf07820ffc729ba95d6217cdbe500cf957d4df3b5387cfbf07a9b06e43e6a1f291bc22c11	3	3	Laravel	["user"]	f	2022-05-17 19:56:30	2022-05-17 19:56:30	2022-05-18 19:56:30
2ad5d604ac6524377f581e3186ecaf98356819f3ace8107dcddfc5f754665c164a00139ca21415e7	3	3	Laravel	["user"]	f	2022-05-17 19:56:30	2022-05-17 19:56:30	2022-05-18 19:56:30
14b7a0b4426d1d107d04f5766e9dfdde425b49e9f46826868fe5b7077a955d0cfac19084576d78e4	3	3	Laravel	["user"]	f	2022-05-22 13:44:10	2022-05-22 13:44:10	2022-05-23 13:44:10
742e087a8c2de0f2adc677756f18a68c102465489a9afed259c1df24b5e6d1451f94f013991761a2	3	3	Laravel	["user"]	f	2022-05-17 20:01:19	2022-05-17 20:01:19	2022-05-18 20:01:19
5f30416f176d2dcf2421136a23c855b5755e3f71c2fee44ab0705e7ea209320567f34a2a2402be20	2	3	Laravel	["user"]	f	2022-05-22 13:34:14	2022-05-22 13:34:14	2022-05-23 13:34:14
51c23c921b9e2711655343af7ccb88b69255fc3690a3bae584d05e349cdb23f49f025fbbeaaf292a	3	3	Laravel	["user"]	f	2022-05-17 20:01:19	2022-05-17 20:01:19	2022-05-18 20:01:19
5eb622e9e406ebdf82bb941bf0aab7a22381e8319ba29cc76abf4371bfcb27765cd6b0d046ec16db	3	3	Laravel	["user"]	f	2022-05-22 13:39:07	2022-05-22 13:39:07	2022-05-23 13:39:07
706a002c387c51cf3117a64bf1ce954acfb241f294d789424df41037b33dcf436201215112a5a079	3	3	Laravel	["user"]	f	2022-05-22 13:45:46	2022-05-22 13:45:46	2022-05-23 13:45:46
244a4d8a5389ab1bd986990682e8f1a6ae8cd45d97cb2caa8ee03aa9db29fd76c2a60f069f5ee5b5	3	3	Laravel	["user"]	f	2022-05-22 13:39:07	2022-05-22 13:39:07	2022-05-23 13:39:07
5748f4a5817655493f9563a41015d0ddcf5214f39ba44dc47f2e2d71f92b15ebece027ece5c8a450	3	3	Laravel	["user"]	f	2022-05-22 13:39:25	2022-05-22 13:39:25	2022-05-23 13:39:25
23276f24f8abb31efd645351f84e7c980c0278748982869d433a8c8f09a9409499d1ce2354eee8f2	3	3	Laravel	["user"]	f	2022-05-23 16:36:33	2022-05-23 16:36:33	2022-05-24 16:36:33
96649576b886a9db9023f47c71e2fcfdad6a0773f6d51a1b5ab73b26254bd31416fc0a9436c43637	3	3	Laravel	["user"]	f	2022-05-22 13:39:26	2022-05-22 13:39:26	2022-05-23 13:39:26
47d8387a14a804797c94e02bb41d091b961e42e46bd79e3cd56ccfeda3410aea527c2d758b837cf1	2	3	Laravel	["user"]	f	2022-05-23 15:56:04	2022-05-23 15:56:04	2022-05-24 15:56:04
aabf7e29c7436828cc04f1419ee5b2e9f72d050ac97906a627a70f9af05e6568932889ad8b359ac1	2	3	Laravel	["user"]	f	2022-05-22 13:47:16	2022-05-22 13:47:16	2022-05-23 13:47:16
e2508723e6548067807b8747ac3773003138e0ae29baf14dd99485c4351661024865cd2dc37aef4b	3	3	Laravel	["user"]	f	2022-05-23 12:29:38	2022-05-23 12:29:38	2022-05-24 12:29:38
489c3d20aa7711d3370db0f83543fea0bd4f4e685dc616b76ca5d5032d6817f58f0f1cfb078bebc7	2	3	Laravel	["user"]	f	2022-05-23 15:50:02	2022-05-23 15:50:02	2022-05-24 15:50:02
c3f48149df6e8aaed444fe5adac53cbc0da3dff1cad637b7deb8bc3f9b26ca3fcc8cb875ccca66f8	3	3	Laravel	["user"]	f	2022-05-23 16:28:41	2022-05-23 16:28:41	2022-05-24 16:28:41
1c3cb610c9d495a3eab6bb564080d0f448da4cb2b5a7c5cd156e35438fe454323c3442c2bbbef9af	3	3	Laravel	["user"]	f	2022-05-23 16:38:28	2022-05-23 16:38:28	2022-05-24 16:38:28
c5c53d57411dd43f1730b126b5ebc56692f80993de9a023309b87962ff14b5797d57e5a49a18fbd4	3	3	Laravel	["user"]	f	2022-05-23 16:35:45	2022-05-23 16:35:45	2022-05-24 16:35:45
3af246dc72051fb63a55b8a0a6e65408f1aa81b2392d7214bdd03cc1b1c905eea8d701aee00c6fd5	2	3	Laravel	["user"]	f	2022-05-23 17:45:44	2022-05-23 17:45:44	2022-05-24 17:45:44
7ff8d44d76b8fab59307819684f8eee83feaf95d140a0adb139aea39af250b775bfaff01b2c12aa8	3	3	Laravel	["user"]	f	2022-05-23 16:38:57	2022-05-23 16:38:57	2022-05-24 16:38:57
2070e1bff4c0bad5d5984bda1f8132dc9d339c3f4c471a86728eec4a8d1d8d5284bf38c84c7e328c	3	3	Laravel	["user"]	f	2022-05-23 19:46:46	2022-05-23 19:46:46	2022-05-24 19:46:46
200ed758689d1a38e8d04fff6c4d95e078b99cca2f3534453aea25f99d754a9b3e1601ce0ed9162f	2	3	Laravel	["user"]	f	2022-05-23 19:38:20	2022-05-23 19:38:20	2022-05-24 19:38:20
87a6531b230287d8b0a64381cd3118146d9bd248706d05cb9f99f8a32bf8e520028807097ae22c6e	2	3	Laravel	["user"]	f	2022-05-23 19:47:53	2022-05-23 19:47:53	2022-05-24 19:47:54
5a2d07670ba41bede89cef2d38857dcbee96d6ea56c61270841a6a0dd1eab6fff7a2decc64e64820	2	3	Laravel	["user"]	f	2022-05-23 20:15:23	2022-05-23 20:15:23	2022-05-24 20:15:23
a3965c86213335cc65021fe249d0bc90f2f0b55f6d0b392c08d1eb15aceed25560cec1b16276e161	2	3	Laravel	["user"]	f	2022-05-23 20:17:36	2022-05-23 20:17:36	2022-05-24 20:17:36
88b21ddde0380ade1d212e36021886775fd91e643d4ee90717dabd4b22df27f847c09ec2d7fcd348	2	3	Laravel	["user"]	f	2022-05-23 20:19:56	2022-05-23 20:19:56	2022-05-24 20:19:56
882af3eb6a3e08ca06567ae62b1c9508551933a39a1b3e442408e34f082e09074f27b69b2652d5c8	2	3	Laravel	["user"]	f	2022-05-23 20:23:12	2022-05-23 20:23:12	2022-05-24 20:23:12
383ec08b781e13615ab58d0956cf8dd5e7044e0a29f266bdf583aa604fca69b9ac907d7e52f486d9	1	3	Laravel	["user"]	f	2022-06-03 18:32:35	2022-06-03 18:32:35	2022-06-04 18:32:35
5522227b38ff76e6f9d252340c207b2929b1a7219e0514ca2df19cf0017d29ae73eeb12da52f779c	2	3	Laravel	["user"]	f	2022-05-23 20:23:13	2022-05-23 20:23:13	2022-05-24 20:23:13
0f705f3123733c7b5b4188e2e923dea7cc5f7349433080d5ab8f605aa222ec0771467a5a4271a98f	3	3	Laravel	["user"]	f	2022-05-26 18:35:44	2022-05-26 18:35:44	2022-05-27 18:35:44
66e9fdfdb2ed212474616afb89f7e75b1b2dcf3a334eb54c68e9b882cad6db1bf2f2477c0c3b6272	1	3	Laravel	["user"]	f	2022-06-04 18:37:33	2022-06-04 18:37:33	2022-06-05 18:37:33
13dfadc38b90c1672786bfb305267e2455d3508bef2b020e201d50404d76262d972ff0dad521484d	2	3	Laravel	["user"]	f	2022-05-26 18:36:15	2022-05-26 18:36:15	2022-05-27 18:36:15
ce289529d6e7fa6661593b5748e46a3bea248643d8a804abc44a552ff66ff03009614c2c9d7c1543	1	3	Laravel	["user"]	f	2022-06-03 18:43:31	2022-06-03 18:43:31	2022-06-04 18:43:31
7ba923686212882a8385f554c0d6153dff934cd4bb674e394ea09ccc99440e7481b99b83b2f8e5c2	3	3	Laravel	["user"]	f	2022-05-26 20:16:59	2022-05-26 20:16:59	2022-05-27 20:16:59
197c1c90830c072b62bca4abc26896ed565186cb2446c065c132b478f69685f88c5b5555839b7c87	3	3	Laravel	["user"]	f	2022-05-28 18:30:14	2022-05-28 18:30:14	2022-05-29 18:30:14
1e56b1483dc851a13ac6d466692897c803159e1da4fcb3ca748ea9f87dae873c914d3124d0027956	3	3	Laravel	["user"]	f	2022-05-31 18:25:29	2022-05-31 18:25:29	2022-06-01 18:25:29
802d7caa3918d1ed3b3c9daaee87f269fba581dcdfda21384f005fdc2e7cc3cc47d6297458b90307	1	3	Laravel	["user"]	f	2022-06-03 18:43:31	2022-06-03 18:43:31	2022-06-04 18:43:31
a6b54d2733e2e9554cb4af7f56bd4a32760267bb42b99476a91d68266a7096640eb9344249f73f8f	3	3	Laravel	["user"]	f	2022-05-31 18:36:09	2022-05-31 18:36:09	2022-06-01 18:36:09
60f16c63ee3f50f719a6b8a6d3ade622c51d4dc5227aa6094e680a44361bfcdd99e39e04862689ad	3	3	Laravel	["user"]	f	2022-05-31 18:36:09	2022-05-31 18:36:09	2022-06-01 18:36:09
727f1a7e4e34b3e9f2ae4bdbd071fd664c174e8c65f6dca46fbe73265a92cb0f894d14cbabb76f9a	3	3	Laravel	["user"]	f	2022-06-04 20:10:27	2022-06-04 20:10:27	2022-06-05 20:10:27
5c7caac4462a8781a9b444b75963809c57b0aa8bbbf0c847d9ef45b478b722a299b7858011a18eba	3	3	Laravel	["user"]	f	2022-05-31 18:37:10	2022-05-31 18:37:10	2022-06-01 18:37:10
811c36bda59408be774f589947a29eedbc7ae13503ecbe822e0d88c9b045706b85490333dfd7e9db	3	3	Laravel	["user"]	f	2022-06-03 18:44:35	2022-06-03 18:44:35	2022-06-04 18:44:35
2b17fc3fe0eec96a99dbf80b71a72b9a23c9a030c4cae4e3ae2e84a97943c01c0d17ef245f9aee92	3	3	Laravel	["user"]	f	2022-05-31 18:39:31	2022-05-31 18:39:31	2022-06-01 18:39:31
1816a0459dda5612fcfd687a2cb12a9f33a70c00fb30fcd2ee597b04487dc0e6e67b13a3878383b3	3	3	Laravel	["user"]	f	2022-06-01 14:01:48	2022-06-01 14:01:48	2022-06-02 14:01:48
3ba614e55ef9e9108791edd56dd1b9dff2dc21bef551a478cb8034308aaba79be22202f20945f15b	3	3	Laravel	["user"]	f	2022-06-04 18:55:54	2022-06-04 18:55:54	2022-06-05 18:55:54
8e74a739037e0492747d3a5671c03722f4d9399563cb966db165ac225893260cb612d03656406e38	2	3	Laravel	["user"]	f	2022-06-01 17:48:51	2022-06-01 17:48:51	2022-06-02 17:48:51
3228e65ab6aea104023c663c5c76cc9bda36e5e2bb9b85a737b6066abe24e03967b108460747ed99	3	3	Laravel	["user"]	f	2022-06-03 19:07:22	2022-06-03 19:07:22	2022-06-04 19:07:22
0f56e747e652366c65c1e6d3025d31e9cc8fd0094e78606ef09a779b131b7a2adf90ea615017e7c1	1	3	Laravel	["user"]	f	2022-06-01 18:52:35	2022-06-01 18:52:35	2022-06-02 18:52:35
7bc839e75ce6e0a260fb452c2586efb3eedfc2e7a2853db043da3091ff6d714cac9938119e52921a	3	3	Laravel	["user"]	f	2022-06-03 19:16:16	2022-06-03 19:16:16	2022-06-04 19:16:16
7bcdf8bdd9d222b19357b0724ed0b70277a7ce310e928c5601df6271ae981de2092425c74e88afca	1	3	Laravel	["user"]	f	2022-06-04 19:00:48	2022-06-04 19:00:48	2022-06-05 19:00:48
1560422a73e8d90259281a1111ff4e60a107ab5970a8b9a1c05c27a35f181681eecb01ceb3838f44	3	3	Laravel	["user"]	f	2022-06-03 19:18:58	2022-06-03 19:18:58	2022-06-04 19:18:58
4c44f54e996f10a75b8aa98c308ec842ed99f32420f3178da6ec5092b1fe5eee9f4549a4a732a305	3	3	Laravel	["user"]	f	2022-06-04 18:36:49	2022-06-04 18:36:49	2022-06-05 18:36:49
98d76284105ebb445d018f92f7389709e61cace735b125ab553409f3e4ed3efad73d3eb7d5252959	3	3	Laravel	["user"]	f	2022-06-05 08:51:17	2022-06-05 08:51:17	2022-06-06 08:51:17
757bf7b25db74267e52ab1e25a5eabd3089cdc34e05e76c3f9b3f881335aa5820bf930ef2832ebef	3	3	Laravel	["user"]	f	2022-06-04 18:36:50	2022-06-04 18:36:50	2022-06-05 18:36:50
f04e70b02c8d61befb19d4c25b44ee00e4186cc35228a265d44adb3a214e13699083ccd19455292e	1	3	Laravel	["user"]	f	2022-06-04 20:19:13	2022-06-04 20:19:13	2022-06-05 20:19:13
78132f082e9760461e524aa1d05d127acb1221d6dc79333e7a986f4a336e46621a1226bb7bb3a2cd	1	3	Laravel	["user"]	f	2022-06-04 19:00:49	2022-06-04 19:00:49	2022-06-05 19:00:49
1b40c08bb2db9047b8c40d674493f1017aa68fbe28f1de8154dd4688874e30077e1dc267c5dd6cf0	3	3	Laravel	["user"]	f	2022-06-04 19:02:53	2022-06-04 19:02:53	2022-06-05 19:02:53
9fc7bb52b2d71f5f464b0c84c5abe4aa9f095d1ab89d2414c68bd55fe0fef29d675968dbc83c18a9	1	3	Laravel	["user"]	f	2022-06-04 19:04:19	2022-06-04 19:04:19	2022-06-05 19:04:19
c0e7d75c7a83078f906e68f6c80f06d91c21a5459ea4ed4dff5aac7063c3548d0f65a3935038dacf	1	3	Laravel	["user"]	f	2022-06-04 20:19:13	2022-06-04 20:19:13	2022-06-05 20:19:13
caee0134cf35a0316580adb38dcd513dd220e3bbd21c6f3df354338ed7adde650208525856f950a3	1	3	Laravel	["user"]	f	2022-06-05 09:04:11	2022-06-05 09:04:11	2022-06-06 09:04:11
0f12db38f0f2865112574b1aecdd938bd6212ae3067a7fcc2e0e2169edb316acadfa38d9bdea4c2a	3	3	Laravel	["user"]	f	2022-06-04 20:19:53	2022-06-04 20:19:53	2022-06-05 20:19:53
448cd8addec10e5fc9f20a3de252ad7dd266d843ee6b9f500fe8fcdfc884ba0fd3495df2ab7b42d8	3	3	Laravel	["user"]	f	2022-06-05 15:48:30	2022-06-05 15:48:30	2022-06-06 15:48:30
5177db107c495e8a8487040513cb5f2970835686e5a5c996de82b4335632f10c25e1fc701948e0c7	1	3	Laravel	["user"]	f	2022-06-05 09:26:34	2022-06-05 09:26:34	2022-06-06 09:26:34
15bc2e60848f4136dbe620ae7f29464424fb8439f05a1245d085e74bc8975335a4fc6075e54233e6	9	3	Laravel	["user"]	f	2022-06-13 08:47:46	2022-06-13 08:47:46	2022-06-14 08:47:46
402a6a8e7c242fba7d2627d179c1af70830f6bafe9a4a307290a0934e7f8885e4b25ccffdaed46f1	3	3	Laravel	["user"]	f	2022-06-13 08:53:21	2022-06-13 08:53:21	2022-06-14 08:53:21
25ba6221e0c70152a2ed08ab7fe62996330fa18e2098ae773a17967086eb4828860b0c211ba4a49d	3	3	Laravel	["user"]	f	2022-06-13 14:17:17	2022-06-13 14:17:17	2022-06-14 14:17:17
c8935f01b820f48d9802b6fe03e7fffc6f83e0a083981d54d9acc57a05bb61eabd985c100b2f1ed4	3	3	Laravel	["user"]	f	2022-06-13 08:58:27	2022-06-13 08:58:27	2022-06-14 08:58:27
1e03f0d027cf8d9b6b1a874ee10ffa44e52c04901ddb1f31e90eee500f0c7ce9c3f120467afd79a6	9	3	Laravel	["user"]	f	2022-06-13 14:22:03	2022-06-13 14:22:03	2022-06-14 14:22:03
320dc26a02b85a5f7e1c38dbae6b39c207ab205ef522325766d6fe7f35618f4d8a2f47bed094dacf	3	3	Laravel	["user"]	f	2022-06-13 14:25:31	2022-06-13 14:25:31	2022-06-14 14:25:31
253e388046897b1367b93f0496b7cb7965258a0c03758e318db705010c3dc066df5b5869ce556f6d	9	3	Laravel	["user"]	f	2022-06-13 14:25:45	2022-06-13 14:25:45	2022-06-14 14:25:45
681416993fbee01df164ab1c8a467af3609b1876a772a30121a010785ac82560476b51d51a4a9c55	2	11	Laravel	["user"]	f	2022-06-14 18:26:14	2022-06-14 18:26:14	2022-06-15 18:26:14
dcb066101a832e60eae9c9dce0c021b38f9aa83db5b8e0b1856aee2690b7acaa8513b71dfd967078	3	11	Laravel	["user"]	f	2022-06-14 18:29:00	2022-06-14 18:29:00	2022-06-15 18:29:00
ec34e16e5bc4ee75281feccfe515430c245a63f80c24021693c8e9a1f81e05139a910755429c5139	2	13	Laravel	["user"]	f	2022-06-14 18:30:26	2022-06-14 18:30:26	2022-06-15 18:30:26
46605e682125427efb31a6f223cc6d51d136ce8989f95bb6882b76d44a75a1c4bf2850db8e289902	2	27	Laravel	["user"]	f	2022-06-14 18:40:33	2022-06-14 18:40:33	2022-06-15 18:40:33
a7faae1d2d01b23bdf7d0d2b090b84e9016094c1d08c9f2feba44b860fe0da861f29d7ae4d8b7300	2	29	Laravel	["user"]	f	2022-06-14 18:42:57	2022-06-14 18:42:57	2022-06-15 18:42:57
60d841bcdf9ccb744a4636276365eed7533e639356975cee0275a7b49b81c6fa4913fea9a2d44b47	2	81	Laravel	["user"]	f	2022-06-14 19:05:43	2022-06-14 19:05:43	2022-06-15 19:05:43
7c1cd5d8f8e9207190fbe12da3be5629e0cc2dd0ae1da25254c5bd277044bf0a7a351f82b201357e	2	31	Laravel	["user"]	f	2022-06-14 18:43:51	2022-06-14 18:43:51	2022-06-15 18:43:51
14d497ba6b790fd384ffaa5e18455a01e948d764bdc0b3a2df736f2006eb8b91c52941635f81e384	2	33	Laravel	["user"]	f	2022-06-14 18:50:02	2022-06-14 18:50:02	2022-06-15 18:50:02
e7ded607e2ac8fd05e9ab81f60b161ecdd1db743e35ba54958132bcb78d630d7da3012d8133f2cc0	2	505	Laravel	["user"]	f	2022-06-15 08:23:44	2022-06-15 08:23:44	2022-06-16 08:23:44
2b0a870e8ebf2583cb3b54f488a732ef282303a9d21d99c7366757381da51d21105359bdf8263232	2	37	Laravel	["user"]	f	2022-06-14 18:50:33	2022-06-14 18:50:33	2022-06-15 18:50:33
d18dd63640f835b62f740b5043c9aea11fcbb249577b048a6696a37d2f5b599da60f591591bbf5ee	3	165	Laravel	["user"]	f	2022-06-14 20:00:48	2022-06-14 20:00:48	2022-06-15 20:00:48
62e5d49636d74544f7bb924d4d1ab6dabbe9ff363c07fa8d71f24b25a010cf0d4431492ea09eefda	2	41	Laravel	["user"]	f	2022-06-14 18:52:18	2022-06-14 18:52:18	2022-06-15 18:52:18
d1dd064470c8f52b7d7f10e0c6e5b98bbe1df4c3c131c4995ea5759eb7cdcdca8ca645bc94d44d17	2	45	Laravel	["user"]	f	2022-06-14 18:52:40	2022-06-14 18:52:40	2022-06-15 18:52:40
365d566c65c8cfc0445e57a2c75396e4121147af68a1a7bd8bce43a69eaadb4fb17bb8d8f30f1c88	2	49	Laravel	["user"]	f	2022-06-14 18:56:07	2022-06-14 18:56:07	2022-06-15 18:56:07
0bd8d3585fb3ff4e98be3a4dc8d3d8af83a13a24c4df2e2c1406ab61f23a3e03c308b44f7bb18625	9	287	Laravel	["user"]	f	2022-06-14 21:50:03	2022-06-14 21:50:03	2022-06-15 21:50:03
06493e63abe02a8c79e586d9f8b22e6371f74ff1985a604c65cb4f13a7c4b6c33eec693e39c52090	2	53	Laravel	["user"]	f	2022-06-14 18:56:44	2022-06-14 18:56:44	2022-06-15 18:56:45
e3898318176fab89f516e9294e5d2c27ff544fb0913a8256be7928fbe69a059ecf4c0fd66239267a	2	57	Laravel	["user"]	f	2022-06-14 18:57:03	2022-06-14 18:57:03	2022-06-15 18:57:03
22dc0073302090a15bc8e923f9ce87e67f0783fd93620bac1b6c769fb21f3347de6e46654cff1dbd	2	61	Laravel	["user"]	f	2022-06-14 18:57:41	2022-06-14 18:57:41	2022-06-15 18:57:41
5ce46c1821e402c62f1a030b2f4609697c788516cb92dd1ed8b12ec1037978a7f927ec148aacc85b	2	397	Laravel	["user"]	f	2022-06-14 22:21:57	2022-06-14 22:21:57	2022-06-15 22:21:57
b70fd9856d34637266923576f6c08ef1fae5ffb63210b317a47d54fe043dcb51e6eb6adc4f524a74	2	65	Laravel	["user"]	f	2022-06-14 18:59:08	2022-06-14 18:59:08	2022-06-15 18:59:08
d1579605c4daf66ca3250e6eaccc0e94bad7618fe48b162da86979e130f92a46f628c34f7f506b6b	2	69	Laravel	["user"]	f	2022-06-14 19:00:51	2022-06-14 19:00:51	2022-06-15 19:00:51
341f358cc712420842c3d8031cf50572a4f9f0c0860dbed644e9f53aa1e4eadcd8d12a5a42eece5f	2	519	Laravel	["user"]	f	2022-06-15 08:29:03	2022-06-15 08:29:03	2022-06-16 08:29:03
c198166b542b095c20f19ccae363cd9d03e854a4e1b8aaf89a584424e8e2b225bf0fbbd8af11e4b1	2	73	Laravel	["user"]	f	2022-06-14 19:01:36	2022-06-14 19:01:36	2022-06-15 19:01:36
0ab1b52acfcdd907cb9529b85ebd0255ee30d09d14cd1866414ee188fc748ce59ebd2df6d89f7d76	2	461	Laravel	["user"]	f	2022-06-14 22:23:11	2022-06-14 22:23:11	2022-06-15 22:23:11
344f068c4e12decd5f5b67bab8ee9174c42c0f18e1d93efc6ef683934eb63bae6c6520bcc12c13a5	2	77	Laravel	["user"]	f	2022-06-14 19:03:53	2022-06-14 19:03:53	2022-06-15 19:03:53
f0984a62876510309cf41e67fa88c035d3665f291de33f336c0d3ba0f6b6a872a438be520617643f	2	473	Laravel	["user"]	f	2022-06-14 22:24:32	2022-06-14 22:24:32	2022-06-15 22:24:32
5d38304b81c3c10c3626f7399f026524483e0d18bc493b0cbc088de6fa18876294e341281b7edcce	2	485	Laravel	["user"]	f	2022-06-14 22:24:45	2022-06-14 22:24:45	2022-06-15 22:24:45
a311378f66fa7a8820e171590fa64fbc580940ab4a588e19ddb45e78c5d67eb135698a728d70de31	2	501	Laravel	["user"]	f	2022-06-15 08:22:17	2022-06-15 08:22:17	2022-06-16 08:22:17
21e6dc35fe09d0788a29f5f05546ac94e729489954576f4f7207b9bcd8dc6665b2e48ed7a84bcfa0	2	503	Laravel	["user"]	f	2022-06-15 08:22:36	2022-06-15 08:22:36	2022-06-16 08:22:36
\.


--
-- Data for Name: oauth_auth_codes; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_auth_codes (id, user_id, client_id, scopes, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_clients (id, user_id, name, secret, provider, redirect, personal_access_client, password_client, revoked, created_at, updated_at) FROM stdin;
1	\N	Laravel Personal Access Client	XKjL23UZAzweJHNMZ96aocKEEehN1v0CjKkPqsnw	\N	http://localhost	t	f	f	2022-05-09 10:48:27	2022-05-09 10:48:27
2	\N	Laravel Password Grant Client	paowT4YzyhfThsxm6Z8z9kCw2OxlWgY8ePrQNYc7	users	http://localhost	f	t	f	2022-05-09 10:48:27	2022-05-09 10:48:27
3	\N	Laravel Personal Access Client	gsVtjIoSGLQdylpTiwIiZAIGvgPMTIFSyuBGMN3K	\N	http://localhost	t	f	f	2022-05-09 17:34:48	2022-05-09 17:34:48
4	\N	Laravel Password Grant Client	oj6OIo8IL5fIOhvdxb6M85wKIicgBBhEc16TJFYR	users	http://localhost	f	t	f	2022-05-09 17:34:48	2022-05-09 17:34:48
5	\N	Laravel Personal Access Client	RrhAjmNQjTHKmZsD0ywqKxlnIGsjG8ld46seYFKP	\N	http://localhost	t	f	f	2022-06-14 18:18:52	2022-06-14 18:18:52
6	\N	Laravel Password Grant Client	ThvHmc5Zmb4DR55ikFjhTlOIqzgf97SfEI5Mhk5c	users	http://localhost	f	t	f	2022-06-14 18:18:52	2022-06-14 18:18:52
7	\N	Laravel Personal Access Client	YsD3l1T1ZCgsA4xoHjN7aqG6wq29U21gN9bHWeBI	\N	http://localhost	t	f	f	2022-06-14 18:19:16	2022-06-14 18:19:16
8	\N	Laravel Password Grant Client	vc9GXcpdHJHhx0WvK114lpaDyG4kc3sAYTTEYE5S	users	http://localhost	f	t	f	2022-06-14 18:19:16	2022-06-14 18:19:16
9	\N	Laravel Personal Access Client	pKtC3X0fQ36IEvZR20z4BVgw4QKbUeVJJf592dOi	\N	http://localhost	t	f	f	2022-06-14 18:20:00	2022-06-14 18:20:00
10	\N	Laravel Password Grant Client	gCgcIlLy3BEBgY7qNIdCCmXBsWdxpl5BMYGEbkaE	users	http://localhost	f	t	f	2022-06-14 18:20:00	2022-06-14 18:20:00
11	\N	Laravel Personal Access Client	A2OQJLgHeLMSpiOA8uDCQ2nwl1gqKr3saJygDooE	\N	http://localhost	t	f	f	2022-06-14 18:26:14	2022-06-14 18:26:14
12	\N	Laravel Password Grant Client	TW9kkhsljpJAHvqPZyHK4Iw8K3aMuHqi753dHiOh	users	http://localhost	f	t	f	2022-06-14 18:26:14	2022-06-14 18:26:14
13	\N	Laravel Personal Access Client	nhi7yIsp2FFCt7DUJRwDjSsdlBWMNFY9YcXvEBZd	\N	http://localhost	t	f	f	2022-06-14 18:30:26	2022-06-14 18:30:26
14	\N	Laravel Password Grant Client	AkZqXGTdeln6572MOINWz3ZdLFmoegDfcgLeCBtZ	users	http://localhost	f	t	f	2022-06-14 18:30:26	2022-06-14 18:30:26
15	\N	Laravel Personal Access Client	HFb5RzlrYfa9AEgnRuWcFvCLmcUB2NrsE8PKfB7x	\N	http://localhost	t	f	f	2022-06-14 18:36:00	2022-06-14 18:36:00
16	\N	Laravel Password Grant Client	uiwbUWebYpydBa84HyfQ7O4yGsruk66iGpLhSDOy	users	http://localhost	f	t	f	2022-06-14 18:36:00	2022-06-14 18:36:00
17	\N	Laravel Personal Access Client	B2o2o7pLfAzTEL50dAax5qB9vVwUt8nSMOWhCPTn	\N	http://localhost	t	f	f	2022-06-14 18:36:30	2022-06-14 18:36:30
18	\N	Laravel Password Grant Client	gehVb2LSDSSm4fTV975L9Z5lTKngshsmdlQbu5H3	users	http://localhost	f	t	f	2022-06-14 18:36:30	2022-06-14 18:36:30
19	\N	Laravel Personal Access Client	FXG13D1lGFUwu3VB8HAmJsstxGeBI7fmRLNnk3Nn	\N	http://localhost	t	f	f	2022-06-14 18:38:06	2022-06-14 18:38:06
20	\N	Laravel Password Grant Client	NeRzvpJjHvLQzt6sKfdSdOfNd8Gkmd8wfdZHSZIS	users	http://localhost	f	t	f	2022-06-14 18:38:06	2022-06-14 18:38:06
21	\N	Laravel Personal Access Client	2sNcSSFuBnJgDrnmLwSZSaEn4SjX8Gm5dcMVpxWR	\N	http://localhost	t	f	f	2022-06-14 18:39:30	2022-06-14 18:39:30
22	\N	Laravel Password Grant Client	BFkCOGNvDKVelVI6AthLe5expoWcr6eeB39MT72e	users	http://localhost	f	t	f	2022-06-14 18:39:30	2022-06-14 18:39:30
23	\N	Laravel Personal Access Client	59ujJ6xxkB8yjF4DxLc7XAhT0QF42qdI1YztWR2Z	\N	http://localhost	t	f	f	2022-06-14 18:40:03	2022-06-14 18:40:03
24	\N	Laravel Password Grant Client	Tlp8XE4q0JJYOl6DUHLgmDpJkjX85CrmTbbIQylW	users	http://localhost	f	t	f	2022-06-14 18:40:03	2022-06-14 18:40:03
25	\N	Laravel Personal Access Client	gfmz9barAOpm6HmqrYXxaEyC1LbP5ZS5opAUqJSP	\N	http://localhost	t	f	f	2022-06-14 18:40:20	2022-06-14 18:40:20
26	\N	Laravel Password Grant Client	3w7oH5ZFOGkDolCGGToJEgD5YCDaEAxSe4eOkQbF	users	http://localhost	f	t	f	2022-06-14 18:40:20	2022-06-14 18:40:20
27	\N	Laravel Personal Access Client	gPyuZygv0xH7z4l0tF9UDMAvoIPdkmjdvzRIiH4D	\N	http://localhost	t	f	f	2022-06-14 18:40:33	2022-06-14 18:40:33
28	\N	Laravel Password Grant Client	RGOUbxUItPCcsFngGk1m8ydhALoTTY03nkJh4vis	users	http://localhost	f	t	f	2022-06-14 18:40:33	2022-06-14 18:40:33
29	\N	Laravel Personal Access Client	gyWuLcUz3IGfrQnYOiLCsaQsxJV1Y3RkKdqWkHIb	\N	http://localhost	t	f	f	2022-06-14 18:42:57	2022-06-14 18:42:57
30	\N	Laravel Password Grant Client	gyxq5F6wDByw6tUPAWQ9FeTxAcNbBN8bDjPlfDrF	users	http://localhost	f	t	f	2022-06-14 18:42:57	2022-06-14 18:42:57
31	\N	Laravel Personal Access Client	KF0yfEWt6AQU7W9ZHJjEwQCEOQGlTnAW4E1GQFt0	\N	http://localhost	t	f	f	2022-06-14 18:43:51	2022-06-14 18:43:51
32	\N	Laravel Password Grant Client	5WdQbUqvVfN75ig20FwfxMmHV0kXbtIaNvqjeTP2	users	http://localhost	f	t	f	2022-06-14 18:43:51	2022-06-14 18:43:51
33	\N	Laravel Personal Access Client	9mSt579PCr39Gq6f5qDqFvCUtHFOrCUyjd6p91Nm	\N	http://localhost	t	f	f	2022-06-14 18:50:02	2022-06-14 18:50:02
34	\N	Laravel Password Grant Client	8hzo6sf2VlOJ2Lc82R75S9RPXkVeTtLUjHI4rSFt	users	http://localhost	f	t	f	2022-06-14 18:50:02	2022-06-14 18:50:02
35	\N	Laravel Personal Access Client	S1VzaOCc62QwUIjzlaKSrWWc2HwEvdto4DwBhmYs	\N	http://localhost	t	f	f	2022-06-14 18:50:02	2022-06-14 18:50:02
36	\N	Laravel Password Grant Client	bucoUjke5NjDa5FW1hP66yOTXMxixgYVz3S3h5Hl	users	http://localhost	f	t	f	2022-06-14 18:50:02	2022-06-14 18:50:02
37	\N	Laravel Personal Access Client	2LwohIOuhdOIJam09NOK3iPb2oo1ie9TkcGowoHk	\N	http://localhost	t	f	f	2022-06-14 18:50:33	2022-06-14 18:50:33
38	\N	Laravel Password Grant Client	E8ug0SKZzMpgkRspizxUiCxJmK3EPu6uJxJwnl9y	users	http://localhost	f	t	f	2022-06-14 18:50:33	2022-06-14 18:50:33
39	\N	Laravel Personal Access Client	jp7TG3TPcgFCQs9IL1IjqvvPIFu8ZxU8dAlNkY7z	\N	http://localhost	t	f	f	2022-06-14 18:50:33	2022-06-14 18:50:33
40	\N	Laravel Password Grant Client	5icV4bAiD3xtmeuzRIJ5EIecmzNIqzrINUKVtp3u	users	http://localhost	f	t	f	2022-06-14 18:50:33	2022-06-14 18:50:33
41	\N	Laravel Personal Access Client	Yr0kjIV0dFCtQKvf1FZUmd7zsg9aiI5NAp0eRjHm	\N	http://localhost	t	f	f	2022-06-14 18:52:18	2022-06-14 18:52:18
42	\N	Laravel Password Grant Client	fLqjIExj89JF9NlXqksBAGEE0OaxhSOnPlPznJBC	users	http://localhost	f	t	f	2022-06-14 18:52:18	2022-06-14 18:52:18
43	\N	Laravel Personal Access Client	53aGQRz5yMLn9dE8cs8RXb70xrEybE4WM7kQuWgq	\N	http://localhost	t	f	f	2022-06-14 18:52:18	2022-06-14 18:52:18
44	\N	Laravel Password Grant Client	J98RWySn4NG7IvEACkuw1lVpBm16jefGe5mEXvcZ	users	http://localhost	f	t	f	2022-06-14 18:52:18	2022-06-14 18:52:18
45	\N	Laravel Personal Access Client	ZsSfBzY54Zy4NfcsI11MOEYYFmQSdNHsF8y0VhM3	\N	http://localhost	t	f	f	2022-06-14 18:52:39	2022-06-14 18:52:39
46	\N	Laravel Password Grant Client	LLACRNc3HcdWSFoIV8tqp9nE2PywVeaHWH0cmfTn	users	http://localhost	f	t	f	2022-06-14 18:52:39	2022-06-14 18:52:39
47	\N	Laravel Personal Access Client	8tWsJWfwT2lY8RdWMyYEqSO9WHHRImHMnCr87HRS	\N	http://localhost	t	f	f	2022-06-14 18:52:40	2022-06-14 18:52:40
48	\N	Laravel Password Grant Client	TOiH8sGsw7Fvn2o98hzHSeagB9mTHTXrwLRpkiM0	users	http://localhost	f	t	f	2022-06-14 18:52:40	2022-06-14 18:52:40
49	\N	Laravel Personal Access Client	jrVKuMSFMT07yjrUoBfz0Uw8BXuIGCh3vfzMhldM	\N	http://localhost	t	f	f	2022-06-14 18:56:07	2022-06-14 18:56:07
50	\N	Laravel Password Grant Client	R9b0aa4FXPo53GxJnwj9ifiI1RwZDtMgGpBANnHq	users	http://localhost	f	t	f	2022-06-14 18:56:07	2022-06-14 18:56:07
51	\N	Laravel Personal Access Client	LPssYos4yP72sr6cGQHolCoGIhQps3K3mfqa1fNn	\N	http://localhost	t	f	f	2022-06-14 18:56:07	2022-06-14 18:56:07
52	\N	Laravel Password Grant Client	CYbR0PNKvg56Ayjwq9o1Bw6I5BuN77OdUIe9Fy7r	users	http://localhost	f	t	f	2022-06-14 18:56:07	2022-06-14 18:56:07
53	\N	Laravel Personal Access Client	XKeRrGgMoZ522pxjfDakCvSfh7ori70g84SzT8B2	\N	http://localhost	t	f	f	2022-06-14 18:56:44	2022-06-14 18:56:44
54	\N	Laravel Password Grant Client	Q5T4mT7AIUAU02KyFePr2CKDIPFErQRTkdLrmgGf	users	http://localhost	f	t	f	2022-06-14 18:56:44	2022-06-14 18:56:44
55	\N	Laravel Personal Access Client	38lx7XMpOfzzzYpuse2fJJcYkOUxJ3L3y5TODWEB	\N	http://localhost	t	f	f	2022-06-14 18:56:45	2022-06-14 18:56:45
56	\N	Laravel Password Grant Client	n0rQq2sIgwT5uoF2587YyJHTnxgwqPeeF0uhoo22	users	http://localhost	f	t	f	2022-06-14 18:56:45	2022-06-14 18:56:45
57	\N	Laravel Personal Access Client	V8FyJ5dmsVp5xXezFtB0GLo2TVA8Y6LdQ4xgqtnz	\N	http://localhost	t	f	f	2022-06-14 18:57:02	2022-06-14 18:57:02
58	\N	Laravel Password Grant Client	jxWDJljTdbzf6TeWLU68LyNGWwMYnfeU5awKClmN	users	http://localhost	f	t	f	2022-06-14 18:57:02	2022-06-14 18:57:02
59	\N	Laravel Personal Access Client	Pd2kEOV18piUOpEUI2GuvYZIJHDhr57r3Uqznjw0	\N	http://localhost	t	f	f	2022-06-14 18:57:03	2022-06-14 18:57:03
60	\N	Laravel Password Grant Client	8BsOUwJrMkjg6LIaDNNNG7vXqhR95ST4bhymBjHy	users	http://localhost	f	t	f	2022-06-14 18:57:03	2022-06-14 18:57:03
61	\N	Laravel Personal Access Client	gigexDf6I1KwI8pq6NzMJMrFnEW3l1E9th91Ouj9	\N	http://localhost	t	f	f	2022-06-14 18:57:41	2022-06-14 18:57:41
62	\N	Laravel Password Grant Client	RkKuVXMN0ajCZzxnX8Qj1babLBAa3sxoW0Do16Ck	users	http://localhost	f	t	f	2022-06-14 18:57:41	2022-06-14 18:57:41
63	\N	Laravel Personal Access Client	We8yD3UAuppOCsIPrRl8XnlP6BwQuJS3J0cMIUEe	\N	http://localhost	t	f	f	2022-06-14 18:57:41	2022-06-14 18:57:41
64	\N	Laravel Password Grant Client	pf0wrxSp0AgqxOnoxONu7RDjENvwJYqWkDg5kfO6	users	http://localhost	f	t	f	2022-06-14 18:57:41	2022-06-14 18:57:41
65	\N	Laravel Personal Access Client	6lu0i8xcSOTkn3YQLVPfKCaOJ0WXWrWaoc0cMMwN	\N	http://localhost	t	f	f	2022-06-14 18:59:08	2022-06-14 18:59:08
66	\N	Laravel Password Grant Client	hJhBge6xD9BRVV2VnbE2ryBsA2y5ccropScLtJWT	users	http://localhost	f	t	f	2022-06-14 18:59:08	2022-06-14 18:59:08
67	\N	Laravel Personal Access Client	C0wsL56vyQnTiDZTOn6YNSSMeMeHpJX58kbY3a5i	\N	http://localhost	t	f	f	2022-06-14 18:59:09	2022-06-14 18:59:09
68	\N	Laravel Password Grant Client	WMZ0FzLLKLRR2mp9oNLN3IO1ng9rc3BEFchTvhGZ	users	http://localhost	f	t	f	2022-06-14 18:59:09	2022-06-14 18:59:09
69	\N	Laravel Personal Access Client	huhxjzzRl7dlgWyYxD87q2zwwVDneFmbf9sL8dKL	\N	http://localhost	t	f	f	2022-06-14 19:00:51	2022-06-14 19:00:51
70	\N	Laravel Password Grant Client	JBWfWMJilw4l1dCdnxMnQqCD1hsv4QOyoQM4N4qr	users	http://localhost	f	t	f	2022-06-14 19:00:51	2022-06-14 19:00:51
71	\N	Laravel Personal Access Client	733PEbicXnhj8Ro9Xe55PjN4fym1leC1bbs6rnG6	\N	http://localhost	t	f	f	2022-06-14 19:00:51	2022-06-14 19:00:51
72	\N	Laravel Password Grant Client	c9o59AgeY7jbWoNBcUX7ufXhGLQZs90lt6FwyMNl	users	http://localhost	f	t	f	2022-06-14 19:00:51	2022-06-14 19:00:51
73	\N	Laravel Personal Access Client	ROf9DZuXZSDXwQa6pik9ER3fm4pTjDuArMF7fvo8	\N	http://localhost	t	f	f	2022-06-14 19:01:36	2022-06-14 19:01:36
74	\N	Laravel Password Grant Client	Jpjh5IKCEqNUbmG0XFY9cPX0HRAaLtnWH3Pzs1tU	users	http://localhost	f	t	f	2022-06-14 19:01:36	2022-06-14 19:01:36
75	\N	Laravel Personal Access Client	043EuY8hBJmidM7aiUHaIisghZ5jnm8l5gr5wIT5	\N	http://localhost	t	f	f	2022-06-14 19:01:36	2022-06-14 19:01:36
76	\N	Laravel Password Grant Client	Ub5zeDsiTRcvPRlIrfF2CzQRmc4xH370ZTY7LVdT	users	http://localhost	f	t	f	2022-06-14 19:01:36	2022-06-14 19:01:36
77	\N	Laravel Personal Access Client	KRSXsddxgEBXZOujPvgRxDCMy3T4CQwT7963b9G4	\N	http://localhost	t	f	f	2022-06-14 19:03:52	2022-06-14 19:03:52
78	\N	Laravel Password Grant Client	PoREERz9XOleOI3djsntZjZbgVtSO7WYjnJRdJjO	users	http://localhost	f	t	f	2022-06-14 19:03:53	2022-06-14 19:03:53
79	\N	Laravel Personal Access Client	kbNspfxAzvUxUV509IhX7fBIhobJ63e6SS2V6JtJ	\N	http://localhost	t	f	f	2022-06-14 19:03:53	2022-06-14 19:03:53
80	\N	Laravel Password Grant Client	NOVA28mekYYPm3QUE2qWUmt7wmRaJc2ckmWybKMm	users	http://localhost	f	t	f	2022-06-14 19:03:53	2022-06-14 19:03:53
81	\N	Laravel Personal Access Client	nVNJsYjxDVIB2xw7P8evXMqKQae4K1Gmy9UeBMpA	\N	http://localhost	t	f	f	2022-06-14 19:05:43	2022-06-14 19:05:43
82	\N	Laravel Password Grant Client	7VXcibLCTKa9ylX6y4ZoL7iJZD0PvaeTAQIlMims	users	http://localhost	f	t	f	2022-06-14 19:05:43	2022-06-14 19:05:43
83	\N	Laravel Personal Access Client	yjr2wHQeKiAUXzdXY09eLkECwUKVXDJUqjPLU5TT	\N	http://localhost	t	f	f	2022-06-14 19:05:43	2022-06-14 19:05:43
84	\N	Laravel Password Grant Client	beyK95v4sGQ1s3rFHuYcvXSWGTHiikLmhdOSjA3M	users	http://localhost	f	t	f	2022-06-14 19:05:43	2022-06-14 19:05:43
85	\N	Laravel Personal Access Client	9Deuh3ic0wTjaLBKZDNvF3SApG0QYSa7DgqUoAS2	\N	http://localhost	t	f	f	2022-06-14 19:06:17	2022-06-14 19:06:17
86	\N	Laravel Password Grant Client	7CVXWvji4Tp40np6UsEBPHgLBwDKtzBkQmyLxQ0D	users	http://localhost	f	t	f	2022-06-14 19:06:17	2022-06-14 19:06:17
87	\N	Laravel Personal Access Client	RmqzBOpk5rKqePLcJ7bPmZVRjpJSLOcyFjJqIvpm	\N	http://localhost	t	f	f	2022-06-14 19:07:04	2022-06-14 19:07:04
88	\N	Laravel Password Grant Client	OdrEXO6BQ5C2WlAFvEc9HRbaw5UNwaYNnU3j8Ho4	users	http://localhost	f	t	f	2022-06-14 19:07:04	2022-06-14 19:07:04
89	\N	Laravel Personal Access Client	CpdEwiI8a5zBvwUcWOfOUpRlgDD5qOn7nMD60mvD	\N	http://localhost	t	f	f	2022-06-14 19:08:30	2022-06-14 19:08:30
90	\N	Laravel Password Grant Client	rxoPPUl2IRpZ9wcmpOQZMG21ex27YjQG8VppqAL4	users	http://localhost	f	t	f	2022-06-14 19:08:30	2022-06-14 19:08:30
91	\N	Laravel Personal Access Client	yCrYi0F6DJEpwRd2jCjwhZoGPHiICRUSXLXCKmDn	\N	http://localhost	t	f	f	2022-06-14 19:08:45	2022-06-14 19:08:45
92	\N	Laravel Password Grant Client	tgrd7G3mVwFD1dgvb5zay78osx6giCjTJN0GuENQ	users	http://localhost	f	t	f	2022-06-14 19:08:45	2022-06-14 19:08:45
93	\N	Laravel Personal Access Client	WvKH8lOzAKizhkZqXOmBrDGpIT7gsCeLToteLAc7	\N	http://localhost	t	f	f	2022-06-14 19:09:36	2022-06-14 19:09:36
94	\N	Laravel Password Grant Client	MauKrbzyz4f9j6ooLLciuoBq6InvtLfUZfSLjRHk	users	http://localhost	f	t	f	2022-06-14 19:09:36	2022-06-14 19:09:36
95	\N	Laravel Personal Access Client	5GgO1EomvYcviEbXMc98kse1JhyA180tyxjHtELB	\N	http://localhost	t	f	f	2022-06-14 19:11:28	2022-06-14 19:11:28
96	\N	Laravel Password Grant Client	Tmsnlzdi5ZcPNjIMN2i73KetOFLjTlN3alihlyUy	users	http://localhost	f	t	f	2022-06-14 19:11:28	2022-06-14 19:11:28
97	\N	Laravel Personal Access Client	QrsPbtyJmEgHv5oBjOzXQUIBhB5U7MM9Vd0REb1e	\N	http://localhost	t	f	f	2022-06-14 19:11:28	2022-06-14 19:11:28
98	\N	Laravel Password Grant Client	hRmjp468ldI1KsgNsE6Oc8DNwVPBtDIyVrXQBTe1	users	http://localhost	f	t	f	2022-06-14 19:11:28	2022-06-14 19:11:28
99	\N	Laravel Personal Access Client	7JPRP7Vf8MnR8ynuXjGoq8ytczTBIVNrtjzRSB7S	\N	http://localhost	t	f	f	2022-06-14 19:13:53	2022-06-14 19:13:53
100	\N	Laravel Password Grant Client	JUKaMpMFt3qGMV1Gh8km6Lt320xDL5cd09AdMU0P	users	http://localhost	f	t	f	2022-06-14 19:13:53	2022-06-14 19:13:53
101	\N	Laravel Personal Access Client	G1WEbLfimIosWeBh6qVBbyG6ZwxcXq8qa8oLlJ6z	\N	http://localhost	t	f	f	2022-06-14 19:13:53	2022-06-14 19:13:53
102	\N	Laravel Password Grant Client	xzSGBHrDyP2UTo4ugo9TzUYsm80OoUc7UnfLATdA	users	http://localhost	f	t	f	2022-06-14 19:13:53	2022-06-14 19:13:53
103	\N	Laravel Personal Access Client	5OhRtyyAPVskWgB1937mJ9xHgWQ4uD7v8FvhBmPC	\N	http://localhost	t	f	f	2022-06-14 19:13:53	2022-06-14 19:13:53
104	\N	Laravel Password Grant Client	T6G97IEVuDL4GM5kwYWavZFZq1vT3xx0CPxck5yP	users	http://localhost	f	t	f	2022-06-14 19:13:53	2022-06-14 19:13:53
105	\N	Laravel Personal Access Client	jqWxDKmOyRjYbKI3SRSFs0vBKZKLERNDXdbaG2Dt	\N	http://localhost	t	f	f	2022-06-14 19:15:36	2022-06-14 19:15:36
106	\N	Laravel Password Grant Client	xh5JmzEBAlE6HmVorEuob4NGL7h1KKyrT0UY2OVN	users	http://localhost	f	t	f	2022-06-14 19:15:36	2022-06-14 19:15:36
107	\N	Laravel Personal Access Client	XplvP3aa3Hb5zLFEiz3yQB7RAXv9BYDxaozmvSX9	\N	http://localhost	t	f	f	2022-06-14 19:15:36	2022-06-14 19:15:36
108	\N	Laravel Password Grant Client	hmuNDM97bCSsxSjMgRr5v85EniE0rqjSq4Ogw7NC	users	http://localhost	f	t	f	2022-06-14 19:15:36	2022-06-14 19:15:36
109	\N	Laravel Personal Access Client	lgz6GUc1C3ZusWU3Kk3YLJgARziIuHgR7OL9MLVX	\N	http://localhost	t	f	f	2022-06-14 19:16:03	2022-06-14 19:16:03
110	\N	Laravel Password Grant Client	v18gzOdvgZ9TWYnlFNY4gPwANXNXLgnwASn3nyFT	users	http://localhost	f	t	f	2022-06-14 19:16:03	2022-06-14 19:16:03
111	\N	Laravel Personal Access Client	fY6N1n381bBx5RAbiVA7sGW15MvtcUldZyApqOYE	\N	http://localhost	t	f	f	2022-06-14 19:16:03	2022-06-14 19:16:03
112	\N	Laravel Password Grant Client	iFO6g5AWAwuPu8fhKlTAywMxc2pzFs44M7E5HEg9	users	http://localhost	f	t	f	2022-06-14 19:16:03	2022-06-14 19:16:03
113	\N	Laravel Personal Access Client	kADudG0GOxrwZh7svYoRBC264EyG7ZAZPjyL692B	\N	http://localhost	t	f	f	2022-06-14 19:16:39	2022-06-14 19:16:39
114	\N	Laravel Password Grant Client	DcMMvczF2KdjMc4hLYqPaSRbQy1WrbR58trGHeCM	users	http://localhost	f	t	f	2022-06-14 19:16:39	2022-06-14 19:16:39
115	\N	Laravel Personal Access Client	u12oQr1y5070MeHlpWrD7RmR14LBj5h6NtW0nmQw	\N	http://localhost	t	f	f	2022-06-14 19:16:39	2022-06-14 19:16:39
116	\N	Laravel Password Grant Client	gVt064rTe1WC7LqR5fzQTZRHHIhRtFX0ZZGo4dXv	users	http://localhost	f	t	f	2022-06-14 19:16:39	2022-06-14 19:16:39
117	\N	Laravel Personal Access Client	W39VbIVfLijgSnTOXSCKq3rjxAg5uO55wvkMV5HA	\N	http://localhost	t	f	f	2022-06-14 19:17:01	2022-06-14 19:17:01
118	\N	Laravel Password Grant Client	7hbKfrFTPG1uXIUXQsowNZZdzfI3Fwh8D3Q45yuh	users	http://localhost	f	t	f	2022-06-14 19:17:01	2022-06-14 19:17:01
119	\N	Laravel Personal Access Client	G2xZFrvnBunMMSWjFpvQtNUTBKgcYo3z3up4GqM4	\N	http://localhost	t	f	f	2022-06-14 19:17:01	2022-06-14 19:17:01
120	\N	Laravel Password Grant Client	4EdlLeeUCcSZUspVhLvTeLnHlYQrfvRpqYSUks1k	users	http://localhost	f	t	f	2022-06-14 19:17:01	2022-06-14 19:17:01
121	\N	Laravel Personal Access Client	yEsy6zxDmJfPbv18NsgpBEnPX9G03nbL4VYVBZ09	\N	http://localhost	t	f	f	2022-06-14 19:17:19	2022-06-14 19:17:19
122	\N	Laravel Password Grant Client	DHVLJ7ki1o44ZLo6ZWZyyPeMHN2BmuYoJhuwhMSu	users	http://localhost	f	t	f	2022-06-14 19:17:19	2022-06-14 19:17:19
123	\N	Laravel Personal Access Client	2u3jtHIUJWzx4WuaIbSGJfSDLBliuNPsrkgCGE8C	\N	http://localhost	t	f	f	2022-06-14 19:17:19	2022-06-14 19:17:19
124	\N	Laravel Password Grant Client	tKU7WvHHCjz1ONeilfooDIrMKdJZfINSirBxGzWr	users	http://localhost	f	t	f	2022-06-14 19:17:19	2022-06-14 19:17:19
125	\N	Laravel Personal Access Client	hshwHj7Dg4xfDigJU5AkZfiiWSeevt7QtGwWHmPi	\N	http://localhost	t	f	f	2022-06-14 19:17:37	2022-06-14 19:17:37
126	\N	Laravel Password Grant Client	hBlAq4Tf7NvyMh4RjxgN5wlmeADZA5QYOHhqV5di	users	http://localhost	f	t	f	2022-06-14 19:17:37	2022-06-14 19:17:37
127	\N	Laravel Personal Access Client	R66DU3i2q0RaEE4y9PyvSwff1fcd8V5nXk6lvgb3	\N	http://localhost	t	f	f	2022-06-14 19:17:37	2022-06-14 19:17:37
128	\N	Laravel Password Grant Client	mfHxg4O6UMpSkZp7NTeyu3lxOk1UKC5idv8WmU90	users	http://localhost	f	t	f	2022-06-14 19:17:37	2022-06-14 19:17:37
129	\N	Laravel Personal Access Client	hXVCtIW2yYu7JsC3LNgRHWugRksJOaywKw7kiaD6	\N	http://localhost	t	f	f	2022-06-14 19:18:17	2022-06-14 19:18:17
130	\N	Laravel Password Grant Client	zXJx9C5KRGI9su2QN2ft4pQjQoVuB2VQG7v82Fv4	users	http://localhost	f	t	f	2022-06-14 19:18:17	2022-06-14 19:18:17
131	\N	Laravel Personal Access Client	NUoeDBkcVxUdIbfgWWI2dSLnYooB2OSsSpNeXRPf	\N	http://localhost	t	f	f	2022-06-14 19:19:08	2022-06-14 19:19:08
132	\N	Laravel Password Grant Client	a8BqOTgQi8GC01OlX63r8nyOCnVTlyK1UwZH4sK8	users	http://localhost	f	t	f	2022-06-14 19:19:08	2022-06-14 19:19:08
133	\N	Laravel Personal Access Client	qMeVIyIFOBIvDNVRQjrbdyxTsiKoGFbYRaHxubFy	\N	http://localhost	t	f	f	2022-06-14 19:20:00	2022-06-14 19:20:00
134	\N	Laravel Password Grant Client	tWEc9DgqwWlMN9wSmFtX15RmqyO8a5bjM8VWpMeB	users	http://localhost	f	t	f	2022-06-14 19:20:00	2022-06-14 19:20:00
135	\N	Laravel Personal Access Client	5vPBm96RgTc4foLGqWIUdAHjmt5raqopEhjCvi2z	\N	http://localhost	t	f	f	2022-06-14 19:20:29	2022-06-14 19:20:29
136	\N	Laravel Password Grant Client	HloFr7Vqs8XDaGK9cV6GWF7o5jhYFSDK4Zv2xcCB	users	http://localhost	f	t	f	2022-06-14 19:20:29	2022-06-14 19:20:29
137	\N	Laravel Personal Access Client	JF2rCPEC4FVtRaJw7hcUoWc4Fjx872F11973WuuI	\N	http://localhost	t	f	f	2022-06-14 19:20:53	2022-06-14 19:20:53
138	\N	Laravel Password Grant Client	sU4KzGuHgxbADXnuRtibu9vcS5G7zU9yznZSAaVs	users	http://localhost	f	t	f	2022-06-14 19:20:53	2022-06-14 19:20:53
139	\N	Laravel Personal Access Client	btlwoCF0tXeMhAxT5pjZzCvepzqlidPVeumdkUmX	\N	http://localhost	t	f	f	2022-06-14 19:38:45	2022-06-14 19:38:45
140	\N	Laravel Password Grant Client	nZ8uaX1On5oNk8xEEWw23c7B7heeEsY5iFVyA85c	users	http://localhost	f	t	f	2022-06-14 19:38:45	2022-06-14 19:38:45
141	\N	Laravel Personal Access Client	na5jPDShLBT2ub7TFTl1ghHDOMxcTVUwLlgx67PX	\N	http://localhost	t	f	f	2022-06-14 19:40:41	2022-06-14 19:40:41
142	\N	Laravel Password Grant Client	EYpJ3NkXrwkYCwE7TkkKWRR5nbs8vqTv7HDLLhjx	users	http://localhost	f	t	f	2022-06-14 19:40:41	2022-06-14 19:40:41
143	\N	Laravel Personal Access Client	ThjLupZXPdxGTRJBgfn9JXhCGZQofuQ8Uo9EMOJy	\N	http://localhost	t	f	f	2022-06-14 19:41:16	2022-06-14 19:41:16
144	\N	Laravel Password Grant Client	0ehfBMeiTZ91hSztKl1bVgtN79XhMV6BpMs5yr5g	users	http://localhost	f	t	f	2022-06-14 19:41:16	2022-06-14 19:41:16
145	\N	Laravel Personal Access Client	uu4kO2BI8Gj7oM7qo6REjWxLoeBVm3wo60fRlRU4	\N	http://localhost	t	f	f	2022-06-14 19:41:43	2022-06-14 19:41:43
146	\N	Laravel Password Grant Client	gVmi6nZ0eoq5Yoh2KxaDNAXwjhR8SIQMMFwFJwgD	users	http://localhost	f	t	f	2022-06-14 19:41:43	2022-06-14 19:41:43
147	\N	Laravel Personal Access Client	2zvsLRN1AKqi0tvNDXNytIHpbML6RMB0Bs6oj2PG	\N	http://localhost	t	f	f	2022-06-14 19:49:42	2022-06-14 19:49:42
148	\N	Laravel Password Grant Client	TuisKIbAmuxTCrhvx7o0b7Fyw83Dhhs3jUFWWAyk	users	http://localhost	f	t	f	2022-06-14 19:49:42	2022-06-14 19:49:42
149	\N	Laravel Personal Access Client	ZOL1kjZWolA6ttfTMAm3dF0n9ECzLvnLXyYxwRz8	\N	http://localhost	t	f	f	2022-06-14 19:50:22	2022-06-14 19:50:22
150	\N	Laravel Password Grant Client	8jInkLzVbEDQlw3PAK1dhOMhLnyWygSC72YhMRTl	users	http://localhost	f	t	f	2022-06-14 19:50:22	2022-06-14 19:50:22
151	\N	Laravel Personal Access Client	goXOlyghQdUd9ZfN0uXW5TYxOOUgxSNLw26bOWIN	\N	http://localhost	t	f	f	2022-06-14 19:51:55	2022-06-14 19:51:55
152	\N	Laravel Password Grant Client	xDcDIEI59LCTxu3k8yxQCMSpRO6QnpTnTDRwz38g	users	http://localhost	f	t	f	2022-06-14 19:51:55	2022-06-14 19:51:55
153	\N	Laravel Personal Access Client	Xeb2iGPJhRnC19e0i2ElxaFiypc053fICN05IpcH	\N	http://localhost	t	f	f	2022-06-14 19:52:56	2022-06-14 19:52:56
154	\N	Laravel Password Grant Client	nhRfRqstBPUMm7tql3opj9Yq6K3vcjiSTAFrxGhO	users	http://localhost	f	t	f	2022-06-14 19:52:56	2022-06-14 19:52:56
155	\N	Laravel Personal Access Client	M1yYzwpyNBFkb6bYIbnsCuotW4RPusbkeHTzRV4P	\N	http://localhost	t	f	f	2022-06-14 19:52:56	2022-06-14 19:52:56
156	\N	Laravel Password Grant Client	BbDvjobJDRjcKNfnwGKsBJf4fjAGi6XeDOi1kimF	users	http://localhost	f	t	f	2022-06-14 19:52:56	2022-06-14 19:52:56
157	\N	Laravel Personal Access Client	EkISj4mGIJW2r51Sp5fo4joHyiGhWl0v6vMTPoU3	\N	http://localhost	t	f	f	2022-06-14 19:53:18	2022-06-14 19:53:18
158	\N	Laravel Password Grant Client	i5fyvROH9uIz1fVzRhTwL3DDR2SVkvEJbXorP8bo	users	http://localhost	f	t	f	2022-06-14 19:53:18	2022-06-14 19:53:18
159	\N	Laravel Personal Access Client	3a5m51At2E8o65xOtGvrA1xr4HjJuqyFsJlsgiR4	\N	http://localhost	t	f	f	2022-06-14 19:53:18	2022-06-14 19:53:18
160	\N	Laravel Password Grant Client	YaNUBhGWwQ2qPpAo35vtuK5AWkQyCng9FRCt7VIt	users	http://localhost	f	t	f	2022-06-14 19:53:18	2022-06-14 19:53:18
161	\N	Laravel Personal Access Client	5Bp3V6WK9c7nrQ0kq19h2YIhC22qLniPqN3KhvKr	\N	http://localhost	t	f	f	2022-06-14 19:53:35	2022-06-14 19:53:35
162	\N	Laravel Password Grant Client	nPQY2zNZSRwthJQOII31fRG6LIYVSXqDlsGmm9bR	users	http://localhost	f	t	f	2022-06-14 19:53:35	2022-06-14 19:53:35
163	\N	Laravel Personal Access Client	mmcNK6Vu4gNKXJzzcsUerPyOtpSkLNfAaNcAJYIn	\N	http://localhost	t	f	f	2022-06-14 19:58:50	2022-06-14 19:58:50
164	\N	Laravel Password Grant Client	BPar5jNZ7KF8KClZH519IVbavELWBtIlAFZgvmhM	users	http://localhost	f	t	f	2022-06-14 19:58:50	2022-06-14 19:58:50
165	\N	Laravel Personal Access Client	p9QBoEXxFgWQwb4P9BbmIDqdEvU1KmITBCcBcUR8	\N	http://localhost	t	f	f	2022-06-14 19:59:19	2022-06-14 19:59:19
166	\N	Laravel Password Grant Client	n9iS8IwBn1d4MgSvsE8CEzexSTuKMKLHM5dxSy7T	users	http://localhost	f	t	f	2022-06-14 19:59:19	2022-06-14 19:59:19
167	\N	Laravel Personal Access Client	V1L7p1t16v6VHsrUCrPocrdXKlldKq3lPGA03ieH	\N	http://localhost	t	f	f	2022-06-14 20:02:18	2022-06-14 20:02:18
168	\N	Laravel Password Grant Client	uk4c4zXeDMyWjv06CSuJEq4FLvnanbfnh7e2Qenw	users	http://localhost	f	t	f	2022-06-14 20:02:18	2022-06-14 20:02:18
169	\N	Laravel Personal Access Client	f87H3KExJ0GWLbs9G1bMyElOhXg3qvAesm2TFp48	\N	http://localhost	t	f	f	2022-06-14 20:03:21	2022-06-14 20:03:21
170	\N	Laravel Password Grant Client	Ur1mlH47Ns6r6MJ2r8SXMFFmVTF56Fu5Sb4wK7NX	users	http://localhost	f	t	f	2022-06-14 20:03:21	2022-06-14 20:03:21
171	\N	Laravel Personal Access Client	V1wRZcQKdORovzXyHWJqFXzgh4DgqIvuF1Q5EKhl	\N	http://localhost	t	f	f	2022-06-14 20:03:48	2022-06-14 20:03:48
172	\N	Laravel Password Grant Client	QpMrUaMekQLaCcTFwdaQU2dbhPBAgZcSMfIB6a8h	users	http://localhost	f	t	f	2022-06-14 20:03:48	2022-06-14 20:03:48
173	\N	Laravel Personal Access Client	GlCiKGvkj11Xawn1JpfjN4g4d5DO7t2fPX2LO6hi	\N	http://localhost	t	f	f	2022-06-14 20:04:18	2022-06-14 20:04:18
174	\N	Laravel Password Grant Client	dhqzGi3bWtTkgxUNI2S8IWgxxfCKQ7sqkhX4iP3Q	users	http://localhost	f	t	f	2022-06-14 20:04:18	2022-06-14 20:04:18
175	\N	Laravel Personal Access Client	FIA658Yfk3PdPex3iWEPpYOv4BqLWmaNF7vTcmCt	\N	http://localhost	t	f	f	2022-06-14 20:05:24	2022-06-14 20:05:24
176	\N	Laravel Password Grant Client	MlzibNhSa1BgVviphcfIhru1Mk1VLJhaIq1waNCQ	users	http://localhost	f	t	f	2022-06-14 20:05:24	2022-06-14 20:05:24
177	\N	Laravel Personal Access Client	IuVdXMzHpdBci9uDuuyelJjTfRHyikFAihHgTfO0	\N	http://localhost	t	f	f	2022-06-14 20:06:08	2022-06-14 20:06:08
178	\N	Laravel Password Grant Client	H1tJkYjPfRX2xtfpX7DMvE9CsX2sbXBjdMy6fYRe	users	http://localhost	f	t	f	2022-06-14 20:06:08	2022-06-14 20:06:08
179	\N	Laravel Personal Access Client	591Wq0zoqnyUYEJnLQFwDiQ2bIhm1MlJNIIrOgEu	\N	http://localhost	t	f	f	2022-06-14 20:06:09	2022-06-14 20:06:09
180	\N	Laravel Password Grant Client	jrEgFKXBIfMnFV9gBq9U7fN6RbYsxMiIpkiGitdl	users	http://localhost	f	t	f	2022-06-14 20:06:09	2022-06-14 20:06:09
181	\N	Laravel Personal Access Client	tiTw04PFMTdFdPdsc8KVInws09OItWrufOqGAGYu	\N	http://localhost	t	f	f	2022-06-14 20:08:22	2022-06-14 20:08:22
182	\N	Laravel Password Grant Client	fxPqvBOF4kEFpMkFakuwlOpcnCzYPC2HqqXLHvK2	users	http://localhost	f	t	f	2022-06-14 20:08:22	2022-06-14 20:08:22
183	\N	Laravel Personal Access Client	SmzZtsalrl34yK5Ll6MHIoGT5ST7qeLsC73j2k5r	\N	http://localhost	t	f	f	2022-06-14 20:08:22	2022-06-14 20:08:22
184	\N	Laravel Password Grant Client	u9WSiiynYs9lHXgGzSe5iUSk9Mg06HdRz5JgiidF	users	http://localhost	f	t	f	2022-06-14 20:08:22	2022-06-14 20:08:22
185	\N	Laravel Personal Access Client	h9x52IXPcA1yq47FnzXsJ05raX2fbs7e2MDD0tVs	\N	http://localhost	t	f	f	2022-06-14 20:13:05	2022-06-14 20:13:05
186	\N	Laravel Password Grant Client	KWuSWXDQfgoGhPtvNxWJinvgTCyBAdlgYGpcfsKE	users	http://localhost	f	t	f	2022-06-14 20:13:05	2022-06-14 20:13:05
187	\N	Laravel Personal Access Client	V6VixYqvxcEdlLf5KtmyZX2QW6Zp0FhHqCGsLeKw	\N	http://localhost	t	f	f	2022-06-14 20:16:58	2022-06-14 20:16:58
188	\N	Laravel Password Grant Client	ljDD2Ipd13BJmoFHLWYpfNAXbml3RBHTCxW0MAlq	users	http://localhost	f	t	f	2022-06-14 20:16:58	2022-06-14 20:16:58
189	\N	Laravel Personal Access Client	4Kxtp3ZhzkTyaJJ1g2kbaAP4IuvCQ7n9WuqMCMUk	\N	http://localhost	t	f	f	2022-06-14 20:16:58	2022-06-14 20:16:58
190	\N	Laravel Password Grant Client	0UUcBcGTDOQu5faNevHOvBCDkvj9XNbLDXQCShNh	users	http://localhost	f	t	f	2022-06-14 20:16:58	2022-06-14 20:16:58
191	\N	Laravel Personal Access Client	DQSNd5E2JXvjDkZ0U4E6xi5VVMsHeXherjimfqef	\N	http://localhost	t	f	f	2022-06-14 20:20:03	2022-06-14 20:20:03
192	\N	Laravel Password Grant Client	2JksOLW1KOeB5zHIhd7wuTmLQuFVqJuCMgvnubKB	users	http://localhost	f	t	f	2022-06-14 20:20:03	2022-06-14 20:20:03
193	\N	Laravel Personal Access Client	gWZqilyjW7y3mCCd74WQd0DQAATl5zCbnn4A5alo	\N	http://localhost	t	f	f	2022-06-14 20:20:03	2022-06-14 20:20:03
194	\N	Laravel Password Grant Client	wP5oAOJMaPMWYOLjIxM8OgRe0VmJDS01A8BbIFm7	users	http://localhost	f	t	f	2022-06-14 20:20:03	2022-06-14 20:20:03
195	\N	Laravel Personal Access Client	rZGiyUPSgXDPudQ8A5jm6gV9U65Dddlw8DMvCv1D	\N	http://localhost	t	f	f	2022-06-14 20:33:33	2022-06-14 20:33:33
196	\N	Laravel Password Grant Client	wVyWT4YDmTrAZqLaiJMFZLmDLoqooIE0Uq7Trd5A	users	http://localhost	f	t	f	2022-06-14 20:33:33	2022-06-14 20:33:33
197	\N	Laravel Personal Access Client	m8grYon5F59Bq5vLHolSckw3g2BaYRBZtoAnPl7z	\N	http://localhost	t	f	f	2022-06-14 20:33:33	2022-06-14 20:33:33
198	\N	Laravel Password Grant Client	0hW4KGaxCRPxwbqVRsHmblt3J8ELRwdjfpNe1lcw	users	http://localhost	f	t	f	2022-06-14 20:33:33	2022-06-14 20:33:33
199	\N	Laravel Personal Access Client	Qrj2bH5BV3zNb82E2dHhF5wW8vbzXZoQPMcuFKT7	\N	http://localhost	t	f	f	2022-06-14 20:33:47	2022-06-14 20:33:47
200	\N	Laravel Password Grant Client	o9o0QRCPt7Ey6UvGOHALTBblzV8g9ijAuunQooyV	users	http://localhost	f	t	f	2022-06-14 20:33:47	2022-06-14 20:33:47
201	\N	Laravel Personal Access Client	QTawkZnVgB3RXlYLyMEpsUngNXZZDkMPUYxbAV7G	\N	http://localhost	t	f	f	2022-06-14 20:34:26	2022-06-14 20:34:26
202	\N	Laravel Password Grant Client	PVP3ojg1BiQg6w826TPLafiMbASIuabP3Aj5KCVu	users	http://localhost	f	t	f	2022-06-14 20:34:27	2022-06-14 20:34:27
203	\N	Laravel Personal Access Client	SPrc1A7fZA0Z5Ttr3AGXvsJrivLpPsVPwRZ9qxYD	\N	http://localhost	t	f	f	2022-06-14 20:37:43	2022-06-14 20:37:43
204	\N	Laravel Password Grant Client	xIphgROqVU27pIPgHrxLKAJ81OZwxmecaDksh9Er	users	http://localhost	f	t	f	2022-06-14 20:37:43	2022-06-14 20:37:43
205	\N	Laravel Personal Access Client	feF9MeScQnI5AYdtXWKlNVC1h7muElleAMcq5P3L	\N	http://localhost	t	f	f	2022-06-14 20:38:03	2022-06-14 20:38:03
206	\N	Laravel Password Grant Client	Oeu0OyzYY9y66WOtMEhyhprqSm4srct4UZ7qx7Cv	users	http://localhost	f	t	f	2022-06-14 20:38:03	2022-06-14 20:38:03
207	\N	Laravel Personal Access Client	PMsZjuNXiHdDbDv9LQKo7nKFCBwnkbmRWeZBsTmJ	\N	http://localhost	t	f	f	2022-06-14 20:38:03	2022-06-14 20:38:03
208	\N	Laravel Password Grant Client	aoq5EJh3W37h7MuM2ZSm8kMgpoJO16jpTX9OZvTb	users	http://localhost	f	t	f	2022-06-14 20:38:03	2022-06-14 20:38:03
209	\N	Laravel Personal Access Client	P82Iic6456njnGSan2EFcMOqksA5b6I3pxG6GbgN	\N	http://localhost	t	f	f	2022-06-14 20:40:05	2022-06-14 20:40:05
210	\N	Laravel Password Grant Client	0Al0fNLnxMUfPrBEJiNTEG6ZDvXpsjkCiUIN3NJN	users	http://localhost	f	t	f	2022-06-14 20:40:05	2022-06-14 20:40:05
211	\N	Laravel Personal Access Client	ALvidvlOzcFaySqthJorO1NmniPCjcTUinF3ilXh	\N	http://localhost	t	f	f	2022-06-14 20:40:05	2022-06-14 20:40:05
212	\N	Laravel Password Grant Client	z89z3DBGCu9aM1SfDr0oxSfNSohVCbZXyU49p8Ji	users	http://localhost	f	t	f	2022-06-14 20:40:05	2022-06-14 20:40:05
213	\N	Laravel Personal Access Client	hlKRvRgMagQazsFRSbz14eo44a7BpOO2cGXJHJVm	\N	http://localhost	t	f	f	2022-06-14 20:40:18	2022-06-14 20:40:18
214	\N	Laravel Password Grant Client	id2QenlmeakMVy14599sq2pIQWyEG3HlPdgHkSXy	users	http://localhost	f	t	f	2022-06-14 20:40:18	2022-06-14 20:40:18
215	\N	Laravel Personal Access Client	ItQJDbbWemOBHLhxf4qe6cH4kcCPa1zwwdKlkTDK	\N	http://localhost	t	f	f	2022-06-14 20:40:35	2022-06-14 20:40:35
216	\N	Laravel Password Grant Client	03mlVoGQ7Yp9hQbN2tDF3obYApwp2othhdR0qFDG	users	http://localhost	f	t	f	2022-06-14 20:40:35	2022-06-14 20:40:35
217	\N	Laravel Personal Access Client	NaILU4k66sKT9mwiEvFcTe9XN1X0jDQQekPH4l8R	\N	http://localhost	t	f	f	2022-06-14 20:40:59	2022-06-14 20:40:59
218	\N	Laravel Password Grant Client	pb525z7zYhK8MVcvQ9ruiyV3379PwTKt89bVeZpg	users	http://localhost	f	t	f	2022-06-14 20:40:59	2022-06-14 20:40:59
219	\N	Laravel Personal Access Client	7tGhuti6qqLKKVBKd0D9sAcLeSrlFBb6LpzQofQU	\N	http://localhost	t	f	f	2022-06-14 20:41:41	2022-06-14 20:41:41
220	\N	Laravel Password Grant Client	0zcGpwn5uGTPxSOe2K1SFsFRpzN6VEsGksp87viy	users	http://localhost	f	t	f	2022-06-14 20:41:41	2022-06-14 20:41:41
221	\N	Laravel Personal Access Client	9C7R0OyHvgRpgYIl4fGYvlQpvlBZzfJ7eY0hgm6T	\N	http://localhost	t	f	f	2022-06-14 20:50:28	2022-06-14 20:50:28
222	\N	Laravel Password Grant Client	KKx4iw7XgjCDlJ6PCi1jy1z9g9a0qnXoKfxZRvls	users	http://localhost	f	t	f	2022-06-14 20:50:28	2022-06-14 20:50:28
223	\N	Laravel Personal Access Client	UYQ5n3BuOZedtaoSNBNMUKUs9ar761LjHpwX7xQs	\N	http://localhost	t	f	f	2022-06-14 20:50:54	2022-06-14 20:50:54
224	\N	Laravel Password Grant Client	uGL9tayvH0uxY96WnD9Na27TApNGxJMqTrJQeldp	users	http://localhost	f	t	f	2022-06-14 20:50:54	2022-06-14 20:50:54
225	\N	Laravel Personal Access Client	LCbjKIgO5dsWTQSGPv3cBFaCvZEGoZAOQATWYzW5	\N	http://localhost	t	f	f	2022-06-14 20:52:23	2022-06-14 20:52:23
226	\N	Laravel Password Grant Client	nL0CxWvKUnhsdjMHlT9dgU1QQcEwUYGhZfyu3MTI	users	http://localhost	f	t	f	2022-06-14 20:52:23	2022-06-14 20:52:23
227	\N	Laravel Personal Access Client	ZR9MRhBL8qRZELQrbhSzsn15Vy63owVpmw6RnvrZ	\N	http://localhost	t	f	f	2022-06-14 21:16:41	2022-06-14 21:16:41
228	\N	Laravel Password Grant Client	UVxIXNC9lFLWNzxks7GqFgP7cJgRZo8cNyUoj9Ib	users	http://localhost	f	t	f	2022-06-14 21:16:41	2022-06-14 21:16:41
229	\N	Laravel Personal Access Client	gwBPj4JOMc4thvuNJhdkksYrbZY4cJMaFocbVIzu	\N	http://localhost	t	f	f	2022-06-14 21:17:05	2022-06-14 21:17:05
230	\N	Laravel Password Grant Client	UJVBv0SJB1pd72TKAU0CZURpWm9QtqZGzcXRTG3A	users	http://localhost	f	t	f	2022-06-14 21:17:05	2022-06-14 21:17:05
231	\N	Laravel Personal Access Client	H7FSsmeZxlB0YzHPI5k7Z24WH3pEnZsHUbZ50QHQ	\N	http://localhost	t	f	f	2022-06-14 21:17:17	2022-06-14 21:17:17
232	\N	Laravel Password Grant Client	AaB6VnYFkeVhSEHeQ6LgEfrExC0a2p0vRAFkFAI3	users	http://localhost	f	t	f	2022-06-14 21:17:17	2022-06-14 21:17:17
233	\N	Laravel Personal Access Client	IIyNYomR96u1OOxkjavuqSYTLLxdO8mgVY2wwGPv	\N	http://localhost	t	f	f	2022-06-14 21:17:50	2022-06-14 21:17:50
234	\N	Laravel Password Grant Client	9bYPpAks9ibbNRxRRmd7PtPlXPsNAuM4r34aBcxx	users	http://localhost	f	t	f	2022-06-14 21:17:50	2022-06-14 21:17:50
235	\N	Laravel Personal Access Client	KrQSaKS2Tz51fPdN2oLS0rI1cUQg8QbcaB7Emv4n	\N	http://localhost	t	f	f	2022-06-14 21:19:08	2022-06-14 21:19:08
236	\N	Laravel Password Grant Client	t1cZVdYp7RKcWBXd3gP9GKJDoz1JJjHQeuT2Hd9z	users	http://localhost	f	t	f	2022-06-14 21:19:08	2022-06-14 21:19:08
237	\N	Laravel Personal Access Client	SRDDHjrpOmQhyA5csOfN9upaI3264SG0Fjser6SE	\N	http://localhost	t	f	f	2022-06-14 21:19:36	2022-06-14 21:19:36
238	\N	Laravel Password Grant Client	BIrw2swAz6QHCGXUdE4Px47YOlqvvjAG6tpVgI5I	users	http://localhost	f	t	f	2022-06-14 21:19:36	2022-06-14 21:19:36
239	\N	Laravel Personal Access Client	wZvm1ebkJg8c5sFt3S8hTkfvePCQGiwWc3DO9uIN	\N	http://localhost	t	f	f	2022-06-14 21:20:18	2022-06-14 21:20:18
240	\N	Laravel Password Grant Client	INSVdvYIQlSsM57RSO3juGWhD4g2eOsFltzn3k8j	users	http://localhost	f	t	f	2022-06-14 21:20:18	2022-06-14 21:20:18
241	\N	Laravel Personal Access Client	j8v18bApSWgeUE9Pu5fPvaWa1FwwgwRZGTL2gVce	\N	http://localhost	t	f	f	2022-06-14 21:20:39	2022-06-14 21:20:39
242	\N	Laravel Password Grant Client	2DuNaXz4DCkiVzxh1WWpLkkOOqhLVNtY4OwYxgA7	users	http://localhost	f	t	f	2022-06-14 21:20:39	2022-06-14 21:20:39
243	\N	Laravel Personal Access Client	e3nMpkKNmKRceNf0OBZQePlxrUUfZ5AjD5zMItM3	\N	http://localhost	t	f	f	2022-06-14 21:21:19	2022-06-14 21:21:19
244	\N	Laravel Password Grant Client	VOg386awwGoQGphXD0SMsxoBFs6xlbNOfNGzCs60	users	http://localhost	f	t	f	2022-06-14 21:21:19	2022-06-14 21:21:19
245	\N	Laravel Personal Access Client	2YaskL6JknyKONCkb4COVaRngL1vGERmVOCrZSf3	\N	http://localhost	t	f	f	2022-06-14 21:23:35	2022-06-14 21:23:35
246	\N	Laravel Password Grant Client	m6rkwL61PY6LnbSSoYMsoPzoRrxuQlN5tYeoX3Xq	users	http://localhost	f	t	f	2022-06-14 21:23:35	2022-06-14 21:23:35
247	\N	Laravel Personal Access Client	8RlloGmg6HLn809HFRLKojizk5I12UMfIZBZAbkP	\N	http://localhost	t	f	f	2022-06-14 21:23:51	2022-06-14 21:23:51
248	\N	Laravel Password Grant Client	NFzZ3yn6OG0CHFJi4lr125OaT2HW6APs4rGB2e95	users	http://localhost	f	t	f	2022-06-14 21:23:51	2022-06-14 21:23:51
249	\N	Laravel Personal Access Client	OcaIb0kKtIED2Cm1ppeMkKfcOQwM9qMwZM8Hm6lN	\N	http://localhost	t	f	f	2022-06-14 21:24:01	2022-06-14 21:24:01
250	\N	Laravel Password Grant Client	2dxMbKFHh0oEhRhZ0LVBMXOOrIczIBaLHhw1W97d	users	http://localhost	f	t	f	2022-06-14 21:24:01	2022-06-14 21:24:01
251	\N	Laravel Personal Access Client	Xrsq1D3rHoHvLAR51AEk4Gkmh4i4rUGhU3VM16EN	\N	http://localhost	t	f	f	2022-06-14 21:24:24	2022-06-14 21:24:24
252	\N	Laravel Password Grant Client	db2QENo77hbupLu5CWusVkJFJKZZWNDlYknlIIhl	users	http://localhost	f	t	f	2022-06-14 21:24:24	2022-06-14 21:24:24
253	\N	Laravel Personal Access Client	6ztaZxY8LXobBLK7TKUgqpRBRn7b2tszT4lRnlWu	\N	http://localhost	t	f	f	2022-06-14 21:26:27	2022-06-14 21:26:27
254	\N	Laravel Password Grant Client	RLXaiC4XL4oRkaf8dbq4VYjAZC45tsXvUzs7Mk3R	users	http://localhost	f	t	f	2022-06-14 21:26:27	2022-06-14 21:26:27
255	\N	Laravel Personal Access Client	9K1IFatFg0zCj3jYC59esijS2iq2IzehI0BHEgNM	\N	http://localhost	t	f	f	2022-06-14 21:28:13	2022-06-14 21:28:13
256	\N	Laravel Password Grant Client	lBWgclk627hkwx9AygbSoqZeXxUyroMsmDKlWLR8	users	http://localhost	f	t	f	2022-06-14 21:28:13	2022-06-14 21:28:13
257	\N	Laravel Personal Access Client	Lj7iVRCa1PBaEhVZCJIVYkKtDtAdsOWFj0xbzK4P	\N	http://localhost	t	f	f	2022-06-14 21:28:28	2022-06-14 21:28:28
258	\N	Laravel Password Grant Client	xu56zGecWiWSsqnKSLxz9iV3sHUpqKdjXfymanSw	users	http://localhost	f	t	f	2022-06-14 21:28:28	2022-06-14 21:28:28
259	\N	Laravel Personal Access Client	MCOauOnroRBYjopLky0Y6LHeKQPbyuQArSlI6iCc	\N	http://localhost	t	f	f	2022-06-14 21:29:10	2022-06-14 21:29:10
260	\N	Laravel Password Grant Client	hCelF3MFNcX39i9P8z4qEHoOS34rK3GrxI6i6jJW	users	http://localhost	f	t	f	2022-06-14 21:29:10	2022-06-14 21:29:10
261	\N	Laravel Personal Access Client	g75Nfq7KmP9I2lR7wgHKe14RrVog4MXJGALlhbpt	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
262	\N	Laravel Password Grant Client	78dVqAVleigvMEQsCCfHNKhcGMzKXGvdJrWkz1H7	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
263	\N	Laravel Personal Access Client	07DtnljknlPhjz5Pghox0UeQju6DO6Z8P6N64VYj	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
264	\N	Laravel Password Grant Client	mDiEXfpflh8PQeLIBO4iqiaQMZWiThtsZ5t6DAeG	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
265	\N	Laravel Personal Access Client	iMOLqpBq1L7TkiyqbsYl6WGwAowdO0SKakaRVVXd	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
266	\N	Laravel Password Grant Client	tQqPbsHQtkyB7E71h4YFs6Xt1iXriAIzNVsPb9kL	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
267	\N	Laravel Personal Access Client	l0xdCkKcc7s6fBQjFUEFny7v1UDNV54HEKOq303O	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
268	\N	Laravel Password Grant Client	IoFRMcjvHSNyDcHBMWY7KhK7BxHVCiXmtx5L1jTT	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
269	\N	Laravel Personal Access Client	cIEx21hYdKkcm1OCnVqa2ufWB3FMuE8imOOWLgJL	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
270	\N	Laravel Password Grant Client	urAIJUEP5DO533BT7nxFaA7NJXzvjLqv80YOhVcN	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
271	\N	Laravel Personal Access Client	cD1NQccdwzr1TrTZZddkIiU66EtsQOfYO9an8kaN	\N	http://localhost	t	f	f	2022-06-14 21:29:29	2022-06-14 21:29:29
272	\N	Laravel Password Grant Client	1IbUkblAIoPiRKvT7vzQxGWCeDMVrBYLQEtqeNgu	users	http://localhost	f	t	f	2022-06-14 21:29:29	2022-06-14 21:29:29
273	\N	Laravel Personal Access Client	CQ1ZeppUQWOyDnktdFpW1sielbT3JA1rY1PiCpuF	\N	http://localhost	t	f	f	2022-06-14 21:37:57	2022-06-14 21:37:57
274	\N	Laravel Password Grant Client	xQQ0oZs4lH381oXojLcms4Taw4w7tcFg7n2ohV4Z	users	http://localhost	f	t	f	2022-06-14 21:37:57	2022-06-14 21:37:57
275	\N	Laravel Personal Access Client	8uxTjhIxwQmXc6PcCp6b4tP95LeY7RXKjOifdwZV	\N	http://localhost	t	f	f	2022-06-14 21:38:06	2022-06-14 21:38:06
276	\N	Laravel Password Grant Client	KypI5pnIvspDxlrWdx7NbnSG6FdCr5SDfuxPYmas	users	http://localhost	f	t	f	2022-06-14 21:38:06	2022-06-14 21:38:06
277	\N	Laravel Personal Access Client	antCLP9576r70xKASmqO7J1Udvdt2I2FSDM3C3UU	\N	http://localhost	t	f	f	2022-06-14 21:38:50	2022-06-14 21:38:50
278	\N	Laravel Password Grant Client	BlNInjo550lsmCsRtpNrqv3mHrPHIIERcGUtj97n	users	http://localhost	f	t	f	2022-06-14 21:38:50	2022-06-14 21:38:50
279	\N	Laravel Personal Access Client	c88iVN2QC7UhzKWi2St6lgQtOcEOHvHwAFYDofT2	\N	http://localhost	t	f	f	2022-06-14 21:39:50	2022-06-14 21:39:50
280	\N	Laravel Password Grant Client	GTwQ1HTxRGNwsUk401oyzvQyutmd8LtZlto8OpwX	users	http://localhost	f	t	f	2022-06-14 21:39:50	2022-06-14 21:39:50
281	\N	Laravel Personal Access Client	joI6dYniG2kqFMV8xAm198dJThvGzuffllIB5I0K	\N	http://localhost	t	f	f	2022-06-14 21:40:11	2022-06-14 21:40:11
282	\N	Laravel Password Grant Client	8pWKSuFLyZZcp97z5ZEpDhkedwBDtGsYjZV6X307	users	http://localhost	f	t	f	2022-06-14 21:40:11	2022-06-14 21:40:11
283	\N	Laravel Personal Access Client	IaylyFnVNJZW1FxkEpPJsU1ycvSUMLGWS8pt8Ezp	\N	http://localhost	t	f	f	2022-06-14 21:41:12	2022-06-14 21:41:12
284	\N	Laravel Password Grant Client	kug79hGoMkuTDo4fuLzwWP7DbEwNkKoyjzqPlE6z	users	http://localhost	f	t	f	2022-06-14 21:41:12	2022-06-14 21:41:12
285	\N	Laravel Personal Access Client	6fGy5VHX5tPFiATjcnv8bQxH5IWQfuSUZON8J9WL	\N	http://localhost	t	f	f	2022-06-14 21:41:27	2022-06-14 21:41:27
286	\N	Laravel Password Grant Client	EYGwKKfxqJhH2hgz3oNIRNQwfZzYnfyuVaGu7cRT	users	http://localhost	f	t	f	2022-06-14 21:41:27	2022-06-14 21:41:27
287	\N	Laravel Personal Access Client	SLI9VYKHiCYeXN5MM1QAl1Q1VuZ8WzBr40eZmuZx	\N	http://localhost	t	f	f	2022-06-14 21:41:34	2022-06-14 21:41:34
288	\N	Laravel Password Grant Client	V9QvSJkSSsmLGhWKBkkCL6ywv0uBhBE1fdpsZ8bh	users	http://localhost	f	t	f	2022-06-14 21:41:34	2022-06-14 21:41:34
289	\N	Laravel Personal Access Client	Ho0R7XqbyzH6tPAIP6rvV7POS3W6Ol7pcwMy3Z08	\N	http://localhost	t	f	f	2022-06-14 21:55:49	2022-06-14 21:55:49
290	\N	Laravel Password Grant Client	dJVqUCDATltjAbuhqgQn3g07L6eoiMevQ6vAaee8	users	http://localhost	f	t	f	2022-06-14 21:55:49	2022-06-14 21:55:49
291	\N	Laravel Personal Access Client	zXwUU3idTncHLiHm76Gyn9Gcl1yD6N1wnGIIfIsm	\N	http://localhost	t	f	f	2022-06-14 21:56:14	2022-06-14 21:56:14
292	\N	Laravel Password Grant Client	CjtOhDxgP2pWSBlH3BKAbIHsE6KmcMGojrAYP7Yl	users	http://localhost	f	t	f	2022-06-14 21:56:14	2022-06-14 21:56:14
293	\N	Laravel Personal Access Client	QInL5Yp9tgi2916M4GrWPh8a26KDh2jrMpVRwVds	\N	http://localhost	t	f	f	2022-06-14 21:56:28	2022-06-14 21:56:28
294	\N	Laravel Password Grant Client	3tu9h1c6XQLwyVuvj00jfV0MdY8yMrhFf3VJIoFE	users	http://localhost	f	t	f	2022-06-14 21:56:28	2022-06-14 21:56:28
295	\N	Laravel Personal Access Client	FqqFi93gAd1CNfBN7Um9mQnzx7xIzYKLa1qqGsVo	\N	http://localhost	t	f	f	2022-06-14 21:57:03	2022-06-14 21:57:03
296	\N	Laravel Password Grant Client	90MXC1r1ETSrHuhJwjTUmzutnSzu1aQdYMQJ7auw	users	http://localhost	f	t	f	2022-06-14 21:57:03	2022-06-14 21:57:03
297	\N	Laravel Personal Access Client	GifQymdHplApsY0jiwY4nQAdg464fobIiPSgy0zC	\N	http://localhost	t	f	f	2022-06-14 21:57:49	2022-06-14 21:57:49
298	\N	Laravel Password Grant Client	WEp0lcJa0Bbsf8GXZNaT4ZMwkAFfL5dEjG6E0ALM	users	http://localhost	f	t	f	2022-06-14 21:57:49	2022-06-14 21:57:49
299	\N	Laravel Personal Access Client	vbeAzQ15nNdkFLTKiX3NElVHOQFkvukHczTnvjN0	\N	http://localhost	t	f	f	2022-06-14 21:58:01	2022-06-14 21:58:01
300	\N	Laravel Password Grant Client	7UmmT3ILrRoPvwkw9WYdyNbqgyTRSPNuAkQXrzqC	users	http://localhost	f	t	f	2022-06-14 21:58:01	2022-06-14 21:58:01
301	\N	Laravel Personal Access Client	Dv49o9F3xwQhG0PCB9xuEJok4ma1HzM5EqeW2FM6	\N	http://localhost	t	f	f	2022-06-14 21:58:29	2022-06-14 21:58:29
302	\N	Laravel Password Grant Client	VmN5WVYFyxPZMabz7BTS1CywV0iUOc8WRuGSFmnG	users	http://localhost	f	t	f	2022-06-14 21:58:29	2022-06-14 21:58:29
303	\N	Laravel Personal Access Client	bTYTAwBVXXw6zHysommu5qceOkY2LV4RbwS4nl48	\N	http://localhost	t	f	f	2022-06-14 21:58:58	2022-06-14 21:58:58
304	\N	Laravel Password Grant Client	Y5A8tGMwPH1wugvAnQ4DW54qm6FxlnfRRYrjbxD5	users	http://localhost	f	t	f	2022-06-14 21:58:58	2022-06-14 21:58:58
305	\N	Laravel Personal Access Client	FJ81xNafDDEJv2XKjzB4xWXMnnj14QgLsBPqi28J	\N	http://localhost	t	f	f	2022-06-14 21:59:07	2022-06-14 21:59:07
306	\N	Laravel Password Grant Client	X0HdlvyYGpRuPZKOnUHrHvQeQU1AeTgryTyQJGdK	users	http://localhost	f	t	f	2022-06-14 21:59:07	2022-06-14 21:59:07
307	\N	Laravel Personal Access Client	c3TU9b20dVTDLkQfLYTD7hWytsO7iTJ3BNMGVlNv	\N	http://localhost	t	f	f	2022-06-14 21:59:13	2022-06-14 21:59:13
308	\N	Laravel Password Grant Client	wrOehDOw4CB1amoS9ge6H15WuHH3nc4bgCGS6Obq	users	http://localhost	f	t	f	2022-06-14 21:59:13	2022-06-14 21:59:13
309	\N	Laravel Personal Access Client	cvzQU1NKeV3558vJUKkUUHxKJyj2uUl5BRAtRg2I	\N	http://localhost	t	f	f	2022-06-14 22:00:30	2022-06-14 22:00:30
310	\N	Laravel Password Grant Client	aC6xRfiSGFNxEQEHjx70NJVME6poIdHKgR9uoZpU	users	http://localhost	f	t	f	2022-06-14 22:00:30	2022-06-14 22:00:30
311	\N	Laravel Personal Access Client	poGEJknm7W9XJBKBe1x354VLtQvdXKp3ZXeL2kBr	\N	http://localhost	t	f	f	2022-06-14 22:02:56	2022-06-14 22:02:56
312	\N	Laravel Password Grant Client	4NlXwiwPVDm8kv9KUZOQwUbN5cyWlDyrr7A13FLP	users	http://localhost	f	t	f	2022-06-14 22:02:56	2022-06-14 22:02:56
313	\N	Laravel Personal Access Client	wOYiqNxRTouYwkq5ys1D7bZZCcHeXK2nsSQxcrin	\N	http://localhost	t	f	f	2022-06-14 22:03:35	2022-06-14 22:03:35
314	\N	Laravel Password Grant Client	2BadCUBy9LhxTfBXh5H7dhTUBnqDsu606BD0Wslp	users	http://localhost	f	t	f	2022-06-14 22:03:35	2022-06-14 22:03:35
315	\N	Laravel Personal Access Client	g4uGtNJkCTwd6U1bTNdptqCzymhrkbMkeEHGlP8H	\N	http://localhost	t	f	f	2022-06-14 22:04:29	2022-06-14 22:04:29
316	\N	Laravel Password Grant Client	XGyKtuegb4lmUyOztgXqWuncCk3pmhVULKYlqGuo	users	http://localhost	f	t	f	2022-06-14 22:04:29	2022-06-14 22:04:29
317	\N	Laravel Personal Access Client	GE3koDvtXk1BiytRFsKvKIcXAcJdoDiB1sIfH3G3	\N	http://localhost	t	f	f	2022-06-14 22:05:05	2022-06-14 22:05:05
318	\N	Laravel Password Grant Client	63AczPPg4OqAyPgTq8UDYW5NcpcRhUP9YnIVdjGm	users	http://localhost	f	t	f	2022-06-14 22:05:05	2022-06-14 22:05:05
319	\N	Laravel Personal Access Client	BYgImHvTZkCqjghlzltyL60ByqYvABZNlGozRjaO	\N	http://localhost	t	f	f	2022-06-14 22:06:28	2022-06-14 22:06:28
320	\N	Laravel Password Grant Client	M5bxkZu4CecVqz4lPzW0kaROAsHw4vOvz0ymFAx2	users	http://localhost	f	t	f	2022-06-14 22:06:28	2022-06-14 22:06:28
321	\N	Laravel Personal Access Client	3BV91CVpaDSkUTWoGwjgbsGFXOLfZPQVfi5RCDvz	\N	http://localhost	t	f	f	2022-06-14 22:07:58	2022-06-14 22:07:58
322	\N	Laravel Password Grant Client	KqPiXXQdFnIPGdoMou3RjXkQE0xItwPQXtRnZNMS	users	http://localhost	f	t	f	2022-06-14 22:07:58	2022-06-14 22:07:58
323	\N	Laravel Personal Access Client	JAdConckWdjaN1O0fHDTBFWU9rbanQzJ07kfd1Yf	\N	http://localhost	t	f	f	2022-06-14 22:10:52	2022-06-14 22:10:52
324	\N	Laravel Password Grant Client	tWgXXJ4fnrH56ATrhhGqkIGRQzgiSvmB4GaYpUum	users	http://localhost	f	t	f	2022-06-14 22:10:52	2022-06-14 22:10:52
325	\N	Laravel Personal Access Client	mbRhc9sFBGiG8ZaCELsRHt9JRoJ7koxE8wyP6JRY	\N	http://localhost	t	f	f	2022-06-14 22:12:35	2022-06-14 22:12:35
326	\N	Laravel Password Grant Client	UEgkJR5eSVoVeLMWsYiKFt16xBwKLWlATkTP6AyX	users	http://localhost	f	t	f	2022-06-14 22:12:35	2022-06-14 22:12:35
327	\N	Laravel Personal Access Client	WWIkdTsuVucAst63SImefw1PxZketIEeosABj4gI	\N	http://localhost	t	f	f	2022-06-14 22:13:29	2022-06-14 22:13:29
328	\N	Laravel Password Grant Client	npJ8o5QhxEFGesdjkN2Pfqsv9Gd2utnX0sFkcCC0	users	http://localhost	f	t	f	2022-06-14 22:13:29	2022-06-14 22:13:29
329	\N	Laravel Personal Access Client	ef4GmeMEQsIPhPzUQwldff1GHrIwmrdpcsZkIbcZ	\N	http://localhost	t	f	f	2022-06-14 22:13:53	2022-06-14 22:13:53
330	\N	Laravel Password Grant Client	IMNy38M1XWWnht0iF4v7bicnZICWlggNb5RpI3T1	users	http://localhost	f	t	f	2022-06-14 22:13:53	2022-06-14 22:13:53
331	\N	Laravel Personal Access Client	76q7pVHfWNxDSW1MpoyOGf6dcRHw90IJMQcOHsmI	\N	http://localhost	t	f	f	2022-06-14 22:14:02	2022-06-14 22:14:02
332	\N	Laravel Password Grant Client	YBoasNs7OqEzInm1J0kRGyfUsdr4QJoYpm3e6ryy	users	http://localhost	f	t	f	2022-06-14 22:14:02	2022-06-14 22:14:02
333	\N	Laravel Personal Access Client	YfOogRq4btscg6iZtcqISs4SMgpdT4Dz6OvrQXtO	\N	http://localhost	t	f	f	2022-06-14 22:14:41	2022-06-14 22:14:41
334	\N	Laravel Password Grant Client	bEZknl5sF2yIEwZNJijN1xYbFsUFZvDlE2zLrwlj	users	http://localhost	f	t	f	2022-06-14 22:14:41	2022-06-14 22:14:41
335	\N	Laravel Personal Access Client	lF7faazBxzEQZRmQ6BI8iUGlMW355xq40i8XFRcR	\N	http://localhost	t	f	f	2022-06-14 22:15:02	2022-06-14 22:15:02
336	\N	Laravel Password Grant Client	A049UJ5fOfdn1UPvHTKrOoe93zKoAjasY407F568	users	http://localhost	f	t	f	2022-06-14 22:15:03	2022-06-14 22:15:03
337	\N	Laravel Personal Access Client	vmR0B9uCynpTp3gjH8dUdPSNtzMIuqPzzBthtk7s	\N	http://localhost	t	f	f	2022-06-14 22:16:23	2022-06-14 22:16:23
338	\N	Laravel Password Grant Client	kFlg7YA5Un3qGdx0M2anJx0cdQvt2hPGcgpDsMJg	users	http://localhost	f	t	f	2022-06-14 22:16:23	2022-06-14 22:16:23
339	\N	Laravel Personal Access Client	Bxe6T7fHqQAlvyaSXHwr8pDPAVZPJCPc5r1Z996E	\N	http://localhost	t	f	f	2022-06-14 22:17:26	2022-06-14 22:17:26
340	\N	Laravel Password Grant Client	6MfUGPuzgu6GfY6ISFn6QPyvcAdvnWM9xReiZPHn	users	http://localhost	f	t	f	2022-06-14 22:17:26	2022-06-14 22:17:26
341	\N	Laravel Personal Access Client	j131TboChvxxxv3mVlGuUdirmc02VIBZkxpkBYEf	\N	http://localhost	t	f	f	2022-06-14 22:19:13	2022-06-14 22:19:13
342	\N	Laravel Password Grant Client	MKe9R4ceF8GOSUr556HxFhiXYxOW3bKYtA9B8Go2	users	http://localhost	f	t	f	2022-06-14 22:19:13	2022-06-14 22:19:13
343	\N	Laravel Personal Access Client	PPOaFoortYLbKzXfmyL3Olj881E0ZC7FrUMvdWhd	\N	http://localhost	t	f	f	2022-06-14 22:20:07	2022-06-14 22:20:07
344	\N	Laravel Password Grant Client	xoOFIQzc3q5N8fpzPn5tbHbvdHQWggVXtHFWYFE1	users	http://localhost	f	t	f	2022-06-14 22:20:07	2022-06-14 22:20:07
345	\N	Laravel Personal Access Client	t5jgOzWA0CnSMGwspP19flzMFnBr0fws09Dow129	\N	http://localhost	t	f	f	2022-06-14 22:21:55	2022-06-14 22:21:55
346	\N	Laravel Password Grant Client	oZ39CtVD95p26ORJdnNIhGCAu2WTPQKXpR10rBR4	users	http://localhost	f	t	f	2022-06-14 22:21:55	2022-06-14 22:21:55
347	\N	Laravel Personal Access Client	3iKl08xyFXPSEJpBaWrW9FJEvziIon8ZYrYfKvFm	\N	http://localhost	t	f	f	2022-06-14 22:21:55	2022-06-14 22:21:55
348	\N	Laravel Password Grant Client	ClCAFKMiIbsjKTVgS0ZHs37fPqZebU1qXVyt1zNl	users	http://localhost	f	t	f	2022-06-14 22:21:55	2022-06-14 22:21:55
349	\N	Laravel Personal Access Client	evdaH2X9fy0ZlnxBMsNOfirQkMDRaNUBrXKtmhxA	\N	http://localhost	t	f	f	2022-06-14 22:21:55	2022-06-14 22:21:55
350	\N	Laravel Password Grant Client	wK4bmDKGS01JUPw9A4vJ2ALGaT66YbRHom2gr0K6	users	http://localhost	f	t	f	2022-06-14 22:21:55	2022-06-14 22:21:55
351	\N	Laravel Personal Access Client	U1wJUFaXXZURE6MmzppLJjKYefnYLLACW820eP4R	\N	http://localhost	t	f	f	2022-06-14 22:21:55	2022-06-14 22:21:55
352	\N	Laravel Password Grant Client	Pzi1zROzBAtfoAhWCDDIlsw8RBuufwfp6Iv4dvAA	users	http://localhost	f	t	f	2022-06-14 22:21:55	2022-06-14 22:21:55
353	\N	Laravel Personal Access Client	zwMABvsEkxUJd6VlsRBoGqm3a2AlnC2Rrpk6sYZS	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
354	\N	Laravel Password Grant Client	gfWTmmqM9RF68TSgUBN5p21pjhGGMReUFwIbsDkv	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
355	\N	Laravel Personal Access Client	H0LAKgjpzX1JLZn10pFTaoBx5Pvpe8h4dDvGp2UX	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
356	\N	Laravel Password Grant Client	oGLNCrYPzY49m3S5aQfnyHJLXCCZtR0jizvj8FO1	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
357	\N	Laravel Personal Access Client	qPsfqQwVIyczwZgVCROvOQCvhjzVyZayWgckXPtq	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
358	\N	Laravel Password Grant Client	R1d5NOgxBum0ctJOgtofNYrpjNcQtNfwtsoQFVOX	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
359	\N	Laravel Personal Access Client	3ZDfgzEdg0QOsLGECoLC53H6gHRd27tK62prRjtT	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
360	\N	Laravel Password Grant Client	mFPA48yTeByVbi49EOkpgOOy1fyJ4UmwhK47bvTz	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
361	\N	Laravel Personal Access Client	zZaa1ZmdAsPNsfEnIGLC4XXZs7gTwf7JZ6uCSIRv	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
362	\N	Laravel Password Grant Client	wDRbPPYxMn8h2NtbAggiWXNecxvrlLtklxgQUVdM	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
363	\N	Laravel Personal Access Client	OahHiDs62Srhqk50dL3lms4q2A7f5G8BqaW9VauL	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
364	\N	Laravel Password Grant Client	65OKNZFgdC9DkWCKuD4qhRgYPSVPKiWF67GkvDcS	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
365	\N	Laravel Personal Access Client	5ABDQInZ6cuZ1AvpjRQYyt7MkNRR7U3GFP2MdWR6	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
366	\N	Laravel Password Grant Client	tcSDhZP9DEUKLY6QIyK8M6Ft1Tc6EhfK4YxQUZwK	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
367	\N	Laravel Personal Access Client	D5y5APssBJymfsmqjfwm0tdXnZuuQ9b6tvMN2HZN	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
368	\N	Laravel Password Grant Client	sD3h2BuRdsN5QqypCdDKG5zd8FlxTlXbgEOn74t4	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
369	\N	Laravel Personal Access Client	QL9g2xYc989YcguXS7yCHTdMIpMegRzgfdaJCoXi	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
370	\N	Laravel Password Grant Client	KbGEspdnl7Kh0WoUhY3MP5vQJ9whnrgNSviIrTg4	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
371	\N	Laravel Personal Access Client	M1yHv7ujgrLV6iotVNJkaU4vUcZrVV64ZjcMHyRD	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
372	\N	Laravel Password Grant Client	T3Ly4Z6yBz4N9C4ufiqVOWHSOVThz6cR48f8DIye	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
373	\N	Laravel Personal Access Client	ybb3xxf1S5zwexp96Rp5PHvo8zmaCQXukmZNe6jO	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
374	\N	Laravel Password Grant Client	3ZyXUYzsylXIaKmv4JTlCXleMbGKdH0PGaiOPKt8	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
375	\N	Laravel Personal Access Client	HdtShU9zAabzsNQWjMIgesw91AzTBigtW8AGc4J9	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
376	\N	Laravel Password Grant Client	DAVN7WvkL2MPIRGI98eQNxRNl4wt8mLfqVzM1iqi	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
377	\N	Laravel Personal Access Client	5eCeCm2nDuXm58QtcrtDpirqsL5SLNEMtvmxOvcD	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
378	\N	Laravel Password Grant Client	eNQwExquKyE4qUJcJnmSIAobrGAmTWi5CQ3h9Daj	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
379	\N	Laravel Personal Access Client	47jFpLYVRXf606UrMTCNlqEVlfNUJjOeSevYtCfN	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
380	\N	Laravel Password Grant Client	j8ERVFqFjHZmkjMKuHAotqRF66SY2wbMc2u1KjKE	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
381	\N	Laravel Personal Access Client	0YoefCVd4fV8AZQV9hG9XIKZy1pACjBSTLAMlUQH	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
382	\N	Laravel Password Grant Client	U5EsbMVXeTAPj7eyY36B4mDgozntNiIgpjF2R6ge	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
383	\N	Laravel Personal Access Client	7wkJjKIKsWZcxfFxmPKm2PnxKpjjgNIJ1DwCoUos	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
384	\N	Laravel Password Grant Client	qMyiTjClrM1OLFldA8QoC2x8OKW7A1ig0GCv4vZM	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
385	\N	Laravel Personal Access Client	NKcsVgFVbqSkSMVQx1LkaBcoJ4dRMpXSVEhSmmsU	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
386	\N	Laravel Password Grant Client	ndNiinR9z8Aph5GAlXLm1VogymWEqJRcpjSYt6wj	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
387	\N	Laravel Personal Access Client	sjp4HpLfQCyjCAj1a3EENP4IZTWIbmDrEtgmYxsW	\N	http://localhost	t	f	f	2022-06-14 22:21:56	2022-06-14 22:21:56
388	\N	Laravel Password Grant Client	UPSPwEq3EqiEAf5YTvxiWWbyMi3sEasoRLRLEVmh	users	http://localhost	f	t	f	2022-06-14 22:21:56	2022-06-14 22:21:56
389	\N	Laravel Personal Access Client	Cq1CswhmCwW54p5r34Zb2RGzqGNVpbirmWPRF4Jy	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
390	\N	Laravel Password Grant Client	nIsIJDdBgnz7QwkdnWIGkutyxN91AvlaGWDRnVX3	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
391	\N	Laravel Personal Access Client	DfyWfi7fpAAFr89VmPQ4GHKN5CgDDlB1YhSMfvZk	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
392	\N	Laravel Password Grant Client	nugAFeW8W2oxAhYla31kk02U2qdh3QNBsl6MSrty	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
393	\N	Laravel Personal Access Client	llkeMpvCzR4D0AxgOLhzbtbQKk7STUupkZWexzZQ	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
394	\N	Laravel Password Grant Client	CNdKS7E58avnjbSiYitWA4v9XLpK818IIWkjpLWI	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
395	\N	Laravel Personal Access Client	Fu5ncg5KOqhwTA2Lb9xQfJfW6k5ixxYDz8dsctG1	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
396	\N	Laravel Password Grant Client	WtjXIG1fUDLwNDm3QUYJ5kZvHoaq9z0TVWPRTnNT	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
397	\N	Laravel Personal Access Client	OkTXFqnDFrW5GAMrRlvIBVMUmDk7qQe7KhUSki5q	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
398	\N	Laravel Password Grant Client	IKdzOPhY8HOdEqbVhMXZm3vMN6tirTUteTIN4dCD	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
399	\N	Laravel Personal Access Client	lSwM4FwQgY4T4kjD07Zhq5yhinbKotu8G6DlHwjs	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
400	\N	Laravel Password Grant Client	N1AvjLF4AFy1VxpQPz34Vm3KNMxZwX3yiHYAuJW3	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
401	\N	Laravel Personal Access Client	IYp33V3PXmUZuVV6N2gVqdlJgl89JT0Oe0uh8p2a	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
402	\N	Laravel Password Grant Client	QabCrpthj1sd1ve1ZTOrtcJwQTQE01oyhWn4k7Pp	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
403	\N	Laravel Personal Access Client	SEJnsooWTuVILL8LFyKZKB24feQXPP6kH7MTcltL	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
404	\N	Laravel Password Grant Client	bXgrQxEaYxij4KftMNsCEW4OyQPAws07Ehh2I4nr	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
405	\N	Laravel Personal Access Client	WydbMrv6LWqta84jbgO7Y0t5rxr2d7gMkK3IzrQf	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
406	\N	Laravel Password Grant Client	0kiYJKf7OiloDB79EnUuw8ZOHg6wn1aV9x7nW0EJ	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
407	\N	Laravel Personal Access Client	VhTnuXbVzb4wApw5OmqA30y72Aujof33xihAh7c2	\N	http://localhost	t	f	f	2022-06-14 22:21:57	2022-06-14 22:21:57
408	\N	Laravel Password Grant Client	bDgZPtbp9xT6y2m67vFTm9UBYfpwqYzXE8yMdAKu	users	http://localhost	f	t	f	2022-06-14 22:21:57	2022-06-14 22:21:57
409	\N	Laravel Personal Access Client	xCrl1ArnueD08m8rBYUVVtWT6kOQSNARdEqFxL9b	\N	http://localhost	t	f	f	2022-06-14 22:23:09	2022-06-14 22:23:09
410	\N	Laravel Password Grant Client	ERaPSlV7uPGVhGow4i9ibUgYowNzmh0T7Z4gCJgj	users	http://localhost	f	t	f	2022-06-14 22:23:09	2022-06-14 22:23:09
411	\N	Laravel Personal Access Client	rKpmY3M3gQhFvy4l8jtVmhLgXpGaszljmqGk1dtd	\N	http://localhost	t	f	f	2022-06-14 22:23:09	2022-06-14 22:23:09
412	\N	Laravel Password Grant Client	9JwrDp9cKtksS2JOvqzbqR7iCtvcSUzQfRpqtTs6	users	http://localhost	f	t	f	2022-06-14 22:23:09	2022-06-14 22:23:09
413	\N	Laravel Personal Access Client	IsMWMkT14kkoGzB46i2RQFXCi3apAAVd9A0j4EZM	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
414	\N	Laravel Password Grant Client	esM3IxtqrjD39eHfq9VxxBwgqoT4jhlRDloeT4xG	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
415	\N	Laravel Personal Access Client	zHyjinMjAJiXwdMI2tUFTJQF3VxfR5DWxr6azwxC	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
416	\N	Laravel Password Grant Client	vwEEfSp9SZIGkBUXCio2OPWNFehXVN7hDTAf4bx8	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
417	\N	Laravel Personal Access Client	I7Ai6habMc65jdqyzbi5aLQIPHsmrh9xQ5uUZQQD	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
418	\N	Laravel Password Grant Client	Dyx4EQtI35Y7TQwBkxCKqxDpbZ2XIgBgepfJWOJH	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
419	\N	Laravel Personal Access Client	EY830yIaH9oZxmec78B8aU4JnoAutIgLR7Jm5Vsg	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
420	\N	Laravel Password Grant Client	FELeN6uKYtf9okSJQJHoFuerrGGyOF3QTMbuulzz	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
421	\N	Laravel Personal Access Client	YMuXBP52IbYg1XZc9ghfh8ESm92EQVT8VOrCCiQQ	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
422	\N	Laravel Password Grant Client	iDKO8JA3MbPyRtE9xXRpQggefKPiUBSKlc9hyWOL	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
423	\N	Laravel Personal Access Client	GkIyzlXpAzqVpicpPP2E8XEfEIRsDb2yqq5LdI3N	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
424	\N	Laravel Password Grant Client	wqjaLNdAQhgTG3BRAkSloE7PG3jENXuM1aWJsv3I	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
425	\N	Laravel Personal Access Client	AjNMzE9vGI3HnAWmxwoxt2bemYPXDqdNtDSqE6LY	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
426	\N	Laravel Password Grant Client	psXftr6IMWtgJEuxTMCI4DsVK0H17UfTlAeKqMxJ	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
427	\N	Laravel Personal Access Client	VCHVRpiU5Ct3waySTUzOOmiRbIlXDOfRGLIkjwfW	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
428	\N	Laravel Password Grant Client	mlOx3znuXY4uuEjSXuYXxQBmVjzhDPEStFzle6EG	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
429	\N	Laravel Personal Access Client	Zz1BINej4mjXIYBvCB7cqUGcSWEQ8Eb70vMbkCPb	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
430	\N	Laravel Password Grant Client	OB2WJX7FFtUNyDz3Y0OI9WBYf8QYnFCy5rY7mUgp	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
431	\N	Laravel Personal Access Client	YHLHvjp7NwREGZP3rs5UqNYfS6g1fOfyASBmvyua	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
432	\N	Laravel Password Grant Client	24cbEVFCii6IHCkhmiYuZnUMOekXayl6iF8IkGgk	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
433	\N	Laravel Personal Access Client	ElWJmmHdQeS9MsC6f1kwRMScG9ijM9FAwl8OlMbB	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
434	\N	Laravel Password Grant Client	e4cv0QIr4kRcfjrygC8wTJlzoex4O3SEu2POHTd4	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
435	\N	Laravel Personal Access Client	OZtVK3rftUM42dlzXuE5gFx9a9OVQqUuacXh4fx2	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
436	\N	Laravel Password Grant Client	e2PaKCUiPnxiHEd9Oce0TzM2iHUborIDh9T4L7GI	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
437	\N	Laravel Personal Access Client	FtPCFsfZjd7gSr5PkvAHiBUySoAkwcrevlpLfk6G	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
438	\N	Laravel Password Grant Client	Z7LtxXVg5WxPirbBrbNxNWx87AIR76lATOpskFfv	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
439	\N	Laravel Personal Access Client	IbW1MhzBlChXxYXf4f3B4LGOsQMsCepXCJP17zft	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
440	\N	Laravel Password Grant Client	nsqxi9X9l6tKD9KyxxJDDqpFDUvWcmMp3Cpe62B6	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
441	\N	Laravel Personal Access Client	2qyhf1dImQlHpPDKy51KZiXOXAGx6c7rBAgD5166	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
442	\N	Laravel Password Grant Client	MYxtq0wTgxynruw8uhbhHghbKQCTVGeGUWgGNTDu	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
443	\N	Laravel Personal Access Client	0O6DoqLM78UnGuM9yvuyKB4BGcKSkldlOxGA4ZL5	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
444	\N	Laravel Password Grant Client	zLQv2hoWgKn0GWRuMrB3zRmQDKsp7eQWL2ERpnCP	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
445	\N	Laravel Personal Access Client	cB2PTjux8iW2VEhjxa6ZTIElfFayiXyhzKw1bozJ	\N	http://localhost	t	f	f	2022-06-14 22:23:10	2022-06-14 22:23:10
446	\N	Laravel Password Grant Client	ioVhKH5M7JGK6fZPFA3JtyLV38BXXiYOPZJitQAZ	users	http://localhost	f	t	f	2022-06-14 22:23:10	2022-06-14 22:23:10
447	\N	Laravel Personal Access Client	9Syv5xvadz8R5ZTBveyraJLclgD1NPn6zQVPJhqe	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
448	\N	Laravel Password Grant Client	mKmhvkQmMyKbL3RD7Oi415F1vPTQ1z4VPH4Xu2f0	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
449	\N	Laravel Personal Access Client	23PxhUrrqRBhjacpWsRN5HU609TmUtCFKKjm1184	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
450	\N	Laravel Password Grant Client	e9ZX39JfO8ubkuvIUgUv6A44muv9bwXf5dCmPhlR	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
451	\N	Laravel Personal Access Client	iKVLo7XunERNVQvaLnMkq5E8bC4Si3ytkWpU39cl	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
452	\N	Laravel Password Grant Client	YWsYwei812UgwlTdnz3vzygSe8Afc6mXS0HhNEBR	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
453	\N	Laravel Personal Access Client	XetQWK0bzH0X6HGQH1tjUTAum1VQgNUASIUtSLIK	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
454	\N	Laravel Password Grant Client	zGM9p302UPoobxWf8JpT5n0DyyEqNSyaOJuydoqs	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
455	\N	Laravel Personal Access Client	FPi7g19l2GpAqNLJYNZ4KWoLFMyGBhjf90SBWY0B	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
456	\N	Laravel Password Grant Client	L6tTOixBkIntQy7drOTaTvY8rxQBCi2f3lv6C9Ch	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
457	\N	Laravel Personal Access Client	eqABXwd98vQiiBDP7ezNCaYfxYlA9h9XYe6Lj1SN	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
458	\N	Laravel Password Grant Client	HFvbulzCz9NcDxeUZeAcMukIRScHraTxS8hoi5ny	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
459	\N	Laravel Personal Access Client	xvxhSmKSkl6A8n8ivJRxw9YVsohSc8xA0NNZAupv	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
460	\N	Laravel Password Grant Client	MYwqtzAGPAqRAZ0pwrRB4xTq1RTmiJvAI6rucXi8	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
461	\N	Laravel Personal Access Client	NE7GKBHn3KjSf9ESFnzuJPSXvdHMsF3R5ZZQO2c2	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
462	\N	Laravel Password Grant Client	X7APrkkYdhM7lyOVkuhbpCMW2LlVoTanXbD8IzP1	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
463	\N	Laravel Personal Access Client	e2dv8Pw4BNUwiKNjGQOCmwuZQqjlyQEfCB11hhWw	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
464	\N	Laravel Password Grant Client	BCYO0w8z1QVlZ3gDCZOPLR2hf4JY2OVVtpHgpmz0	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
465	\N	Laravel Personal Access Client	KdDw7VmnplSrAtMuUv7U7N6jUfsfCRMcbAThgADN	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
466	\N	Laravel Password Grant Client	rMZEreuprrF3uBfd7qpLV435IjtaVtQeKtmWnh8L	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
467	\N	Laravel Personal Access Client	HVgE6CiQSVS7sQILCtP3pqHJZxEav7b5jlYXoKjT	\N	http://localhost	t	f	f	2022-06-14 22:23:11	2022-06-14 22:23:11
468	\N	Laravel Password Grant Client	hHch4aoWDwniacqYfpKiXIYOhPb59Erncgv96tzp	users	http://localhost	f	t	f	2022-06-14 22:23:11	2022-06-14 22:23:11
469	\N	Laravel Personal Access Client	ybX6MsDGNDl19IIHP2EN8cdE7aYa5X5eUP754MZu	\N	http://localhost	t	f	f	2022-06-14 22:23:12	2022-06-14 22:23:12
470	\N	Laravel Password Grant Client	0PgG0iDRJYoSw12fiQVzGB25ho6SDFRg4mXBYhf5	users	http://localhost	f	t	f	2022-06-14 22:23:12	2022-06-14 22:23:12
471	\N	Laravel Personal Access Client	TlQq0WYG8WUKvzO0uRtDsO8zuveD1YtBhKpwHSrC	\N	http://localhost	t	f	f	2022-06-14 22:23:12	2022-06-14 22:23:12
472	\N	Laravel Password Grant Client	XZrUtJtqg2ti5H9rBBUEQnVPuA64WVcK9uWlKnwF	users	http://localhost	f	t	f	2022-06-14 22:23:12	2022-06-14 22:23:12
473	\N	Laravel Personal Access Client	cKy5fTaNoOohPeUfQMIRU6L3e8wD8dWQhPVclmFF	\N	http://localhost	t	f	f	2022-06-14 22:24:31	2022-06-14 22:24:31
474	\N	Laravel Password Grant Client	i6Ff6TrvmHb7encm8yvt9UwlNj2amEyRubPp3fcs	users	http://localhost	f	t	f	2022-06-14 22:24:31	2022-06-14 22:24:31
475	\N	Laravel Personal Access Client	d98EAEujtqLwGmauz5j176Fh2aHCYLxBwVL69MOb	\N	http://localhost	t	f	f	2022-06-14 22:24:32	2022-06-14 22:24:32
476	\N	Laravel Password Grant Client	rcx7aAXjWUMZG6J7MJPWLCBZnttftNUEvJCfR6Yv	users	http://localhost	f	t	f	2022-06-14 22:24:32	2022-06-14 22:24:32
477	\N	Laravel Personal Access Client	MWQhQhRtOmwDYf7VeKgNfa1JKIk7QCN08C8tNJHy	\N	http://localhost	t	f	f	2022-06-14 22:24:32	2022-06-14 22:24:32
478	\N	Laravel Password Grant Client	GgJAOYu55zde1rAhXtEKOj5Hk6COpyqcHTJubj7R	users	http://localhost	f	t	f	2022-06-14 22:24:32	2022-06-14 22:24:32
479	\N	Laravel Personal Access Client	559WIO3YVKqeYhKhdogDsIUY2wbz7hjbQufaAP99	\N	http://localhost	t	f	f	2022-06-14 22:24:32	2022-06-14 22:24:32
480	\N	Laravel Password Grant Client	wDDHkCO7lNZ09wpvxL84ZBlogt1tEB8JAThdYDm6	users	http://localhost	f	t	f	2022-06-14 22:24:32	2022-06-14 22:24:32
481	\N	Laravel Personal Access Client	j1Youhs4zpvwjBDJiqSViOYYswxlCI9mHh7reeCz	\N	http://localhost	t	f	f	2022-06-14 22:24:32	2022-06-14 22:24:32
482	\N	Laravel Password Grant Client	bT4De858nYpFeGFcqjjZAKBUnnSGFWGAsbHXWcXl	users	http://localhost	f	t	f	2022-06-14 22:24:32	2022-06-14 22:24:32
483	\N	Laravel Personal Access Client	mMxCFpFZ0SiWn278BCODo1oUE5OBNb52ZGL0BnAu	\N	http://localhost	t	f	f	2022-06-14 22:24:32	2022-06-14 22:24:32
484	\N	Laravel Password Grant Client	GghtvfTgKf4mV0OJnVBOBHVwOkrVg654YwQpCQs4	users	http://localhost	f	t	f	2022-06-14 22:24:32	2022-06-14 22:24:32
485	\N	Laravel Personal Access Client	KVQ49bA9yUgkHldXucWeerZi7RUobJgnPQzoVYjN	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
486	\N	Laravel Password Grant Client	iFPi3ZiT978anIJJuRgCaDTbiLweD4YoHFqUtjWf	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
487	\N	Laravel Personal Access Client	nUbybGKKyqJo13WLbVIm3YOTv8Pos83hXOK9QeNH	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
488	\N	Laravel Password Grant Client	Q1mLyDYwCHxmAYe2hdynVIrQSkr3tY0LZixC4DAI	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
489	\N	Laravel Personal Access Client	fLzgkiNiriapLHKAmOaKusBPf88QSDcOey0aWnrD	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
490	\N	Laravel Password Grant Client	hQTDZ7dIuGAm7Rbr4sXWheCIQ4GSrrEbkVX8fgBW	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
491	\N	Laravel Personal Access Client	Symr6okz10SQKb2877zr0dlOGEVer4uOvJtmzL5A	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
492	\N	Laravel Password Grant Client	2NBqMxWvbxLPaJibN0FNoOK5cpSOfT5nc4PmxdMM	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
493	\N	Laravel Personal Access Client	53KcCdxK7KlYD8WuF5mihWp2dI6qxD9zkHtt3bMU	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
494	\N	Laravel Password Grant Client	YV25zdyyfDRbJ6AWyfCZR18FYiijcPvAIoRW6FAw	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
495	\N	Laravel Personal Access Client	NPw8MtPr8bwyuBEEFqkMg0PXW3w85oLdaBrrhos7	\N	http://localhost	t	f	f	2022-06-14 22:24:45	2022-06-14 22:24:45
496	\N	Laravel Password Grant Client	9qvMQYMbPMeRjqpsaEEuxbHzej82NzzGbBTuuDOr	users	http://localhost	f	t	f	2022-06-14 22:24:45	2022-06-14 22:24:45
497	\N	Laravel Personal Access Client	eLe2GEe2IKGElxRgavyOYOcrkurp18dsVp7YPJpA	\N	http://localhost	t	f	f	2022-06-14 22:30:00	2022-06-14 22:30:00
498	\N	Laravel Password Grant Client	p2XbAR6IZOD1LpEFyKLRdQrA9ZyqHnVKqq1K0WQD	users	http://localhost	f	t	f	2022-06-14 22:30:00	2022-06-14 22:30:00
499	\N	Laravel Personal Access Client	0uXFe6FF29rEPT4juiQJTWzpRTzv6tazjuLGoU7J	\N	http://localhost	t	f	f	2022-06-14 22:30:09	2022-06-14 22:30:09
500	\N	Laravel Password Grant Client	cW7btDxzdWwneWFhS4kDxeysvC7qZYhX9mvbvgHa	users	http://localhost	f	t	f	2022-06-14 22:30:09	2022-06-14 22:30:09
501	\N	Laravel Personal Access Client	g9dVVJyCGIlJmTYKd2ND0zzcA8MVGdjfCUEu35Xt	\N	http://localhost	t	f	f	2022-06-15 08:22:17	2022-06-15 08:22:17
502	\N	Laravel Password Grant Client	7epsDLMCnq2CJpS7letg1WkDal6shc0exwTX6izU	users	http://localhost	f	t	f	2022-06-15 08:22:17	2022-06-15 08:22:17
503	\N	Laravel Personal Access Client	xzNqOZYxfIxuiMLLcwO0BZC9Q0fc7TeYNBwLOmjV	\N	http://localhost	t	f	f	2022-06-15 08:22:36	2022-06-15 08:22:36
504	\N	Laravel Password Grant Client	8vKiC1FRt471hFPC4McbvnKtTj00h8DmO11Ott3Q	users	http://localhost	f	t	f	2022-06-15 08:22:36	2022-06-15 08:22:36
505	\N	Laravel Personal Access Client	ox03NKPQCQw04ltlzm2rSKiJmDqSHObLSTBKSS2c	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
506	\N	Laravel Password Grant Client	btx3V8K4RsblpeD4Tdpi7puu3JrnEbBkdMuFeFMl	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
507	\N	Laravel Personal Access Client	py4M9pdwk4fqWuxWBEqqukVIHw7wabqUuspnmhFg	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
508	\N	Laravel Password Grant Client	LMA1cJ10efh2vKVVjTYM6XCxSusLdRmIEVjKoMWz	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
509	\N	Laravel Personal Access Client	xDimIZIC3czqeFVXsC1f7UEbJWFuz5Dsv5r0ZLZE	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
510	\N	Laravel Password Grant Client	mjyubOvEb9FIUvSuc5gmjZg1wqAeQ4L5YLX6QU0W	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
511	\N	Laravel Personal Access Client	YdmmfXSPgkHcFAgI0zvzxz7lk3ne2G7oEG5K52ef	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
512	\N	Laravel Password Grant Client	rBFp93NvOJfdqvUZLgDTcrMubJltn10A4IpqLZRR	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
513	\N	Laravel Personal Access Client	SsJzsZi8k9ccaURT7E73eGvdvbA7xW01dcCgItzH	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
514	\N	Laravel Password Grant Client	NOCgoCnTu9iBrTK8Sr11bFRV9HshmINdJnKEUJaZ	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
515	\N	Laravel Personal Access Client	kEBBvJn4eTvccLtvLjEtlaIvQimQ0WlbMQ5yukqB	\N	http://localhost	t	f	f	2022-06-15 08:23:44	2022-06-15 08:23:44
516	\N	Laravel Password Grant Client	35dHJvbRkCQvuB1OIGpzc6OU2jZrCPcHiXN4QPV4	users	http://localhost	f	t	f	2022-06-15 08:23:44	2022-06-15 08:23:44
517	\N	Laravel Personal Access Client	zOvjeUuCt1O6hAeEtuwClTebcMSHVoPECMwJ2zGZ	\N	http://localhost	t	f	f	2022-06-15 08:23:45	2022-06-15 08:23:45
518	\N	Laravel Password Grant Client	6dbzaxxtOgRwWQ92WvKHwRha7jDujBvCwXQx0WR3	users	http://localhost	f	t	f	2022-06-15 08:23:45	2022-06-15 08:23:45
519	\N	Laravel Personal Access Client	68fn7kp2pG1YnxAW8kZcoMMkiyl4Tvj3ITWA1G9D	\N	http://localhost	t	f	f	2022-06-15 08:29:03	2022-06-15 08:29:03
520	\N	Laravel Password Grant Client	1kScRuXwJ7s7Zpukrb3MNc03jCt4lxNrebW0oXf6	users	http://localhost	f	t	f	2022-06-15 08:29:03	2022-06-15 08:29:03
521	\N	Laravel Personal Access Client	XUqtSyJlGGtlpAROvXV62sCbngAJ5g2U3vjL3ORy	\N	http://localhost	t	f	f	2022-06-15 08:29:27	2022-06-15 08:29:27
522	\N	Laravel Password Grant Client	wauyuLpdblYlBcQ9MctRJKzOstSjutQe0UgKLl6P	users	http://localhost	f	t	f	2022-06-15 08:29:27	2022-06-15 08:29:27
523	\N	Laravel Personal Access Client	Eg4KEs8KhIUAsX94e8FNKW60MlSl9WFDhTXkSrGF	\N	http://localhost	t	f	f	2022-06-15 08:30:01	2022-06-15 08:30:01
524	\N	Laravel Password Grant Client	KsSbXSbf36GouJZymXR6OZFBNrLO9kpCRKCG5f11	users	http://localhost	f	t	f	2022-06-15 08:30:01	2022-06-15 08:30:01
525	\N	Laravel Personal Access Client	lJ1RFduENWEFzwcL8skt9eHaOjqNAnHTvTVSX6Dq	\N	http://localhost	t	f	f	2022-06-15 08:30:21	2022-06-15 08:30:21
526	\N	Laravel Password Grant Client	wHuq2Sh1n6Tmyqjtc7fuBKqIP82BTgGuXlYurRtu	users	http://localhost	f	t	f	2022-06-15 08:30:21	2022-06-15 08:30:21
527	\N	Laravel Personal Access Client	RKrcPihzKBCj85Z5Lqku7rwDvxm6bdbK7QdVnAdg	\N	http://localhost	t	f	f	2022-06-15 08:31:30	2022-06-15 08:31:30
528	\N	Laravel Password Grant Client	DgKCRcpAhPFStjYXnJBylDBCQKnlcuNcw5rX0SQ4	users	http://localhost	f	t	f	2022-06-15 08:31:30	2022-06-15 08:31:30
529	\N	Laravel Personal Access Client	605OYY9Gku0nYK1DYTXwbUiO8A4NrqfIpnMCRycc	\N	http://localhost	t	f	f	2022-06-15 08:32:37	2022-06-15 08:32:37
530	\N	Laravel Password Grant Client	bgwaHw4YL3wc9PgC4byv0PiFmfy8QEhs2JXgYQh6	users	http://localhost	f	t	f	2022-06-15 08:32:37	2022-06-15 08:32:37
531	\N	Laravel Personal Access Client	FKgTkEJRxEeRT9NJwF9bOUTIS9vvJqC3q9cBP9Gl	\N	http://localhost	t	f	f	2022-06-15 08:33:17	2022-06-15 08:33:17
532	\N	Laravel Password Grant Client	tde6tm0i2VxaNMkEweZpY5Hc9XhJ4hctexHe5bIT	users	http://localhost	f	t	f	2022-06-15 08:33:17	2022-06-15 08:33:17
533	\N	Laravel Personal Access Client	PDety7VHqDpO2HvDROOnOfdE3MPysw4IedxuzqXb	\N	http://localhost	t	f	f	2022-06-15 08:33:43	2022-06-15 08:33:43
534	\N	Laravel Password Grant Client	iG0EScHF67Nq8nW6gcYdCBOeHBdR3i3SeNQ4cPOX	users	http://localhost	f	t	f	2022-06-15 08:33:43	2022-06-15 08:33:43
535	\N	Laravel Personal Access Client	t6E58EPCk1RStAqQp6KbBk94Wi23IhXnd6ShY0BP	\N	http://localhost	t	f	f	2022-06-15 08:35:38	2022-06-15 08:35:38
536	\N	Laravel Password Grant Client	OsYKTCOScKC5CJxJhCR9tBpTIo3xZTXwvOAsnyvf	users	http://localhost	f	t	f	2022-06-15 08:35:38	2022-06-15 08:35:38
537	\N	Laravel Personal Access Client	gwavIyRWqRAjhpr7p1qMVXa1g4AtHhTJqAbNrfAx	\N	http://localhost	t	f	f	2022-06-15 08:35:57	2022-06-15 08:35:57
538	\N	Laravel Password Grant Client	6q6e762h34QpZzjpx7Y9YEwxnV9k7A2IRqbJdleV	users	http://localhost	f	t	f	2022-06-15 08:35:57	2022-06-15 08:35:57
539	\N	Laravel Personal Access Client	l7qTZZoyaMxurFlNuESTygis1NLAUeBcFcA6cr37	\N	http://localhost	t	f	f	2022-06-15 08:36:25	2022-06-15 08:36:25
540	\N	Laravel Password Grant Client	mZbBeaJkE1rtZUAfoQuC06rJw091CM2L46ylqe1d	users	http://localhost	f	t	f	2022-06-15 08:36:25	2022-06-15 08:36:25
541	\N	Laravel Personal Access Client	7tuOSa4ZvCaDlrutIhHP3rKGhKdB5mBfpeYmiwgl	\N	http://localhost	t	f	f	2022-06-15 08:36:45	2022-06-15 08:36:45
542	\N	Laravel Password Grant Client	sSBylj11UdZig3eIIPWdEdIOcxQqMTi2UMwR5fOO	users	http://localhost	f	t	f	2022-06-15 08:36:45	2022-06-15 08:36:45
543	\N	Laravel Personal Access Client	n3QbsqEf1467XJURsS7MLyUEmNumAyZYXekwQuRN	\N	http://localhost	t	f	f	2022-06-15 08:37:14	2022-06-15 08:37:14
544	\N	Laravel Password Grant Client	YUCGJ4BAv9fGK5Zc0tdHjJha4aJcPCgsT8nhMsn5	users	http://localhost	f	t	f	2022-06-15 08:37:14	2022-06-15 08:37:14
545	\N	Laravel Personal Access Client	o1SNIioaIVkpNEdOehWWlr2GEYFU2d030svQBBG2	\N	http://localhost	t	f	f	2022-06-15 08:37:34	2022-06-15 08:37:34
546	\N	Laravel Password Grant Client	REoUsRZx1JFQfMhzJwdWC8lB5hvqarBhCnwnXFvi	users	http://localhost	f	t	f	2022-06-15 08:37:34	2022-06-15 08:37:34
547	\N	Laravel Personal Access Client	w9HRT49ufeZb1v51Ea9gkm1ZyRyb2MaXzag7sKuE	\N	http://localhost	t	f	f	2022-06-15 08:38:12	2022-06-15 08:38:12
548	\N	Laravel Password Grant Client	o7IjAOKCu2ULypv4ODMQWb77UL3i11yPGJN12hHw	users	http://localhost	f	t	f	2022-06-15 08:38:12	2022-06-15 08:38:12
549	\N	Laravel Personal Access Client	QT2JiAdFUxNLKbutyc5NuseMasFQyRVHU3snOdmc	\N	http://localhost	t	f	f	2022-06-15 08:38:30	2022-06-15 08:38:30
550	\N	Laravel Password Grant Client	pRQlTLroTnXT5z2zKunbDw0eSSymS1UHvBzc9ZVQ	users	http://localhost	f	t	f	2022-06-15 08:38:30	2022-06-15 08:38:30
551	\N	Laravel Personal Access Client	M3NfaN0emd8f0WPzsMbvTAeatm9hoKq3W0R2QOdC	\N	http://localhost	t	f	f	2022-06-15 08:38:57	2022-06-15 08:38:57
552	\N	Laravel Password Grant Client	bqI6kgACzKXt2SXiwcA8qiVwdWWm9wRForY1wDbv	users	http://localhost	f	t	f	2022-06-15 08:38:57	2022-06-15 08:38:57
553	\N	Laravel Personal Access Client	WLPunWWNkxYzF5TMHoltoIKgxktTPsGVUohP3Qfy	\N	http://localhost	t	f	f	2022-06-15 08:39:04	2022-06-15 08:39:04
554	\N	Laravel Password Grant Client	hFkCSA4M0IdK0zXmq3S0VPmfP2OL8nS9hy0naAw7	users	http://localhost	f	t	f	2022-06-15 08:39:04	2022-06-15 08:39:04
555	\N	Laravel Personal Access Client	KqZNu6y72v4f4k7as2LTDdgg9a3k2m8dZa1AH6Wm	\N	http://localhost	t	f	f	2022-06-15 08:39:32	2022-06-15 08:39:32
556	\N	Laravel Password Grant Client	1aDSqDqbhJIrZJrzj0Pl7d14bC9Dgw4TvYPxCxDC	users	http://localhost	f	t	f	2022-06-15 08:39:32	2022-06-15 08:39:32
557	\N	Laravel Personal Access Client	QejZxPiOgTemQrNBoY6XOkzkgCG1CHPYv35MKVI7	\N	http://localhost	t	f	f	2022-06-15 08:40:03	2022-06-15 08:40:03
558	\N	Laravel Password Grant Client	aSn3Vmcsh8p56HURDZFKejOejbLxTLkDRjvrlQdc	users	http://localhost	f	t	f	2022-06-15 08:40:03	2022-06-15 08:40:03
559	\N	Laravel Personal Access Client	h1I1TAOFt7tWWWl8bTYEigGXpdQacZ6zt73KGsxg	\N	http://localhost	t	f	f	2022-06-15 08:40:22	2022-06-15 08:40:22
560	\N	Laravel Password Grant Client	o6nHwvkafgWQr5eNNU4mQpmnKFSzKtm3qbJ9onum	users	http://localhost	f	t	f	2022-06-15 08:40:22	2022-06-15 08:40:22
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2022-05-09 10:48:27	2022-05-09 10:48:27
2	3	2022-05-09 17:34:48	2022-05-09 17:34:48
3	5	2022-06-14 18:18:52	2022-06-14 18:18:52
4	7	2022-06-14 18:19:16	2022-06-14 18:19:16
5	9	2022-06-14 18:20:00	2022-06-14 18:20:00
6	11	2022-06-14 18:26:14	2022-06-14 18:26:14
7	13	2022-06-14 18:30:26	2022-06-14 18:30:26
8	15	2022-06-14 18:36:00	2022-06-14 18:36:00
9	17	2022-06-14 18:36:30	2022-06-14 18:36:30
10	19	2022-06-14 18:38:06	2022-06-14 18:38:06
11	21	2022-06-14 18:39:30	2022-06-14 18:39:30
12	23	2022-06-14 18:40:03	2022-06-14 18:40:03
13	25	2022-06-14 18:40:20	2022-06-14 18:40:20
14	27	2022-06-14 18:40:33	2022-06-14 18:40:33
15	29	2022-06-14 18:42:57	2022-06-14 18:42:57
16	31	2022-06-14 18:43:51	2022-06-14 18:43:51
17	33	2022-06-14 18:50:02	2022-06-14 18:50:02
18	35	2022-06-14 18:50:02	2022-06-14 18:50:02
19	37	2022-06-14 18:50:33	2022-06-14 18:50:33
20	39	2022-06-14 18:50:33	2022-06-14 18:50:33
21	41	2022-06-14 18:52:18	2022-06-14 18:52:18
22	43	2022-06-14 18:52:18	2022-06-14 18:52:18
23	45	2022-06-14 18:52:39	2022-06-14 18:52:39
24	47	2022-06-14 18:52:40	2022-06-14 18:52:40
25	49	2022-06-14 18:56:07	2022-06-14 18:56:07
26	51	2022-06-14 18:56:07	2022-06-14 18:56:07
27	53	2022-06-14 18:56:44	2022-06-14 18:56:44
28	55	2022-06-14 18:56:45	2022-06-14 18:56:45
29	57	2022-06-14 18:57:02	2022-06-14 18:57:02
30	59	2022-06-14 18:57:03	2022-06-14 18:57:03
31	61	2022-06-14 18:57:41	2022-06-14 18:57:41
32	63	2022-06-14 18:57:41	2022-06-14 18:57:41
33	65	2022-06-14 18:59:08	2022-06-14 18:59:08
34	67	2022-06-14 18:59:09	2022-06-14 18:59:09
35	69	2022-06-14 19:00:51	2022-06-14 19:00:51
36	71	2022-06-14 19:00:51	2022-06-14 19:00:51
37	73	2022-06-14 19:01:36	2022-06-14 19:01:36
38	75	2022-06-14 19:01:36	2022-06-14 19:01:36
39	77	2022-06-14 19:03:53	2022-06-14 19:03:53
40	79	2022-06-14 19:03:53	2022-06-14 19:03:53
41	81	2022-06-14 19:05:43	2022-06-14 19:05:43
42	83	2022-06-14 19:05:43	2022-06-14 19:05:43
43	85	2022-06-14 19:06:17	2022-06-14 19:06:17
44	87	2022-06-14 19:07:04	2022-06-14 19:07:04
45	89	2022-06-14 19:08:30	2022-06-14 19:08:30
46	91	2022-06-14 19:08:45	2022-06-14 19:08:45
47	93	2022-06-14 19:09:36	2022-06-14 19:09:36
48	95	2022-06-14 19:11:28	2022-06-14 19:11:28
49	97	2022-06-14 19:11:28	2022-06-14 19:11:28
50	99	2022-06-14 19:13:53	2022-06-14 19:13:53
51	101	2022-06-14 19:13:53	2022-06-14 19:13:53
52	103	2022-06-14 19:13:53	2022-06-14 19:13:53
53	105	2022-06-14 19:15:36	2022-06-14 19:15:36
54	107	2022-06-14 19:15:36	2022-06-14 19:15:36
55	109	2022-06-14 19:16:03	2022-06-14 19:16:03
56	111	2022-06-14 19:16:03	2022-06-14 19:16:03
57	113	2022-06-14 19:16:39	2022-06-14 19:16:39
58	115	2022-06-14 19:16:39	2022-06-14 19:16:39
59	117	2022-06-14 19:17:01	2022-06-14 19:17:01
60	119	2022-06-14 19:17:01	2022-06-14 19:17:01
61	121	2022-06-14 19:17:19	2022-06-14 19:17:19
62	123	2022-06-14 19:17:19	2022-06-14 19:17:19
63	125	2022-06-14 19:17:37	2022-06-14 19:17:37
64	127	2022-06-14 19:17:37	2022-06-14 19:17:37
65	129	2022-06-14 19:18:17	2022-06-14 19:18:17
66	131	2022-06-14 19:19:08	2022-06-14 19:19:08
67	133	2022-06-14 19:20:00	2022-06-14 19:20:00
68	135	2022-06-14 19:20:29	2022-06-14 19:20:29
69	137	2022-06-14 19:20:53	2022-06-14 19:20:53
70	139	2022-06-14 19:38:45	2022-06-14 19:38:45
71	141	2022-06-14 19:40:41	2022-06-14 19:40:41
72	143	2022-06-14 19:41:16	2022-06-14 19:41:16
73	145	2022-06-14 19:41:43	2022-06-14 19:41:43
74	147	2022-06-14 19:49:42	2022-06-14 19:49:42
75	149	2022-06-14 19:50:22	2022-06-14 19:50:22
76	151	2022-06-14 19:51:55	2022-06-14 19:51:55
77	153	2022-06-14 19:52:56	2022-06-14 19:52:56
78	155	2022-06-14 19:52:56	2022-06-14 19:52:56
79	157	2022-06-14 19:53:18	2022-06-14 19:53:18
80	159	2022-06-14 19:53:18	2022-06-14 19:53:18
81	161	2022-06-14 19:53:35	2022-06-14 19:53:35
82	163	2022-06-14 19:58:50	2022-06-14 19:58:50
83	165	2022-06-14 19:59:19	2022-06-14 19:59:19
84	167	2022-06-14 20:02:18	2022-06-14 20:02:18
85	169	2022-06-14 20:03:21	2022-06-14 20:03:21
86	171	2022-06-14 20:03:48	2022-06-14 20:03:48
87	173	2022-06-14 20:04:18	2022-06-14 20:04:18
88	175	2022-06-14 20:05:24	2022-06-14 20:05:24
89	177	2022-06-14 20:06:08	2022-06-14 20:06:08
90	179	2022-06-14 20:06:09	2022-06-14 20:06:09
91	181	2022-06-14 20:08:22	2022-06-14 20:08:22
92	183	2022-06-14 20:08:22	2022-06-14 20:08:22
93	185	2022-06-14 20:13:05	2022-06-14 20:13:05
94	187	2022-06-14 20:16:58	2022-06-14 20:16:58
95	189	2022-06-14 20:16:58	2022-06-14 20:16:58
96	191	2022-06-14 20:20:03	2022-06-14 20:20:03
97	193	2022-06-14 20:20:03	2022-06-14 20:20:03
98	195	2022-06-14 20:33:33	2022-06-14 20:33:33
99	197	2022-06-14 20:33:33	2022-06-14 20:33:33
100	199	2022-06-14 20:33:47	2022-06-14 20:33:47
101	201	2022-06-14 20:34:27	2022-06-14 20:34:27
102	203	2022-06-14 20:37:43	2022-06-14 20:37:43
103	205	2022-06-14 20:38:03	2022-06-14 20:38:03
104	207	2022-06-14 20:38:03	2022-06-14 20:38:03
105	209	2022-06-14 20:40:05	2022-06-14 20:40:05
106	211	2022-06-14 20:40:05	2022-06-14 20:40:05
107	213	2022-06-14 20:40:18	2022-06-14 20:40:18
108	215	2022-06-14 20:40:35	2022-06-14 20:40:35
109	217	2022-06-14 20:40:59	2022-06-14 20:40:59
110	219	2022-06-14 20:41:41	2022-06-14 20:41:41
111	221	2022-06-14 20:50:28	2022-06-14 20:50:28
112	223	2022-06-14 20:50:54	2022-06-14 20:50:54
113	225	2022-06-14 20:52:23	2022-06-14 20:52:23
114	227	2022-06-14 21:16:41	2022-06-14 21:16:41
115	229	2022-06-14 21:17:05	2022-06-14 21:17:05
116	231	2022-06-14 21:17:17	2022-06-14 21:17:17
117	233	2022-06-14 21:17:50	2022-06-14 21:17:50
118	235	2022-06-14 21:19:08	2022-06-14 21:19:08
119	237	2022-06-14 21:19:36	2022-06-14 21:19:36
120	239	2022-06-14 21:20:18	2022-06-14 21:20:18
121	241	2022-06-14 21:20:39	2022-06-14 21:20:39
122	243	2022-06-14 21:21:19	2022-06-14 21:21:19
123	245	2022-06-14 21:23:35	2022-06-14 21:23:35
124	247	2022-06-14 21:23:51	2022-06-14 21:23:51
125	249	2022-06-14 21:24:01	2022-06-14 21:24:01
126	251	2022-06-14 21:24:24	2022-06-14 21:24:24
127	253	2022-06-14 21:26:27	2022-06-14 21:26:27
128	255	2022-06-14 21:28:13	2022-06-14 21:28:13
129	257	2022-06-14 21:28:28	2022-06-14 21:28:28
130	259	2022-06-14 21:29:10	2022-06-14 21:29:10
131	261	2022-06-14 21:29:29	2022-06-14 21:29:29
132	263	2022-06-14 21:29:29	2022-06-14 21:29:29
133	265	2022-06-14 21:29:29	2022-06-14 21:29:29
134	267	2022-06-14 21:29:29	2022-06-14 21:29:29
135	269	2022-06-14 21:29:29	2022-06-14 21:29:29
136	271	2022-06-14 21:29:29	2022-06-14 21:29:29
137	273	2022-06-14 21:37:57	2022-06-14 21:37:57
138	275	2022-06-14 21:38:06	2022-06-14 21:38:06
139	277	2022-06-14 21:38:50	2022-06-14 21:38:50
140	279	2022-06-14 21:39:50	2022-06-14 21:39:50
141	281	2022-06-14 21:40:11	2022-06-14 21:40:11
142	283	2022-06-14 21:41:12	2022-06-14 21:41:12
143	285	2022-06-14 21:41:27	2022-06-14 21:41:27
144	287	2022-06-14 21:41:34	2022-06-14 21:41:34
145	289	2022-06-14 21:55:49	2022-06-14 21:55:49
146	291	2022-06-14 21:56:14	2022-06-14 21:56:14
147	293	2022-06-14 21:56:28	2022-06-14 21:56:28
148	295	2022-06-14 21:57:03	2022-06-14 21:57:03
149	297	2022-06-14 21:57:49	2022-06-14 21:57:49
150	299	2022-06-14 21:58:01	2022-06-14 21:58:01
151	301	2022-06-14 21:58:29	2022-06-14 21:58:29
152	303	2022-06-14 21:58:58	2022-06-14 21:58:58
153	305	2022-06-14 21:59:07	2022-06-14 21:59:07
154	307	2022-06-14 21:59:13	2022-06-14 21:59:13
155	309	2022-06-14 22:00:30	2022-06-14 22:00:30
156	311	2022-06-14 22:02:56	2022-06-14 22:02:56
157	313	2022-06-14 22:03:35	2022-06-14 22:03:35
158	315	2022-06-14 22:04:29	2022-06-14 22:04:29
159	317	2022-06-14 22:05:05	2022-06-14 22:05:05
160	319	2022-06-14 22:06:28	2022-06-14 22:06:28
161	321	2022-06-14 22:07:58	2022-06-14 22:07:58
162	323	2022-06-14 22:10:52	2022-06-14 22:10:52
163	325	2022-06-14 22:12:35	2022-06-14 22:12:35
164	327	2022-06-14 22:13:29	2022-06-14 22:13:29
165	329	2022-06-14 22:13:53	2022-06-14 22:13:53
166	331	2022-06-14 22:14:02	2022-06-14 22:14:02
167	333	2022-06-14 22:14:41	2022-06-14 22:14:41
168	335	2022-06-14 22:15:03	2022-06-14 22:15:03
169	337	2022-06-14 22:16:23	2022-06-14 22:16:23
170	339	2022-06-14 22:17:26	2022-06-14 22:17:26
171	341	2022-06-14 22:19:13	2022-06-14 22:19:13
172	343	2022-06-14 22:20:07	2022-06-14 22:20:07
173	345	2022-06-14 22:21:55	2022-06-14 22:21:55
174	347	2022-06-14 22:21:55	2022-06-14 22:21:55
175	349	2022-06-14 22:21:55	2022-06-14 22:21:55
176	351	2022-06-14 22:21:55	2022-06-14 22:21:55
177	353	2022-06-14 22:21:56	2022-06-14 22:21:56
178	355	2022-06-14 22:21:56	2022-06-14 22:21:56
179	357	2022-06-14 22:21:56	2022-06-14 22:21:56
180	359	2022-06-14 22:21:56	2022-06-14 22:21:56
181	361	2022-06-14 22:21:56	2022-06-14 22:21:56
182	363	2022-06-14 22:21:56	2022-06-14 22:21:56
183	365	2022-06-14 22:21:56	2022-06-14 22:21:56
184	367	2022-06-14 22:21:56	2022-06-14 22:21:56
185	369	2022-06-14 22:21:56	2022-06-14 22:21:56
186	371	2022-06-14 22:21:56	2022-06-14 22:21:56
187	373	2022-06-14 22:21:56	2022-06-14 22:21:56
188	375	2022-06-14 22:21:56	2022-06-14 22:21:56
189	377	2022-06-14 22:21:56	2022-06-14 22:21:56
190	379	2022-06-14 22:21:56	2022-06-14 22:21:56
191	381	2022-06-14 22:21:56	2022-06-14 22:21:56
192	383	2022-06-14 22:21:56	2022-06-14 22:21:56
193	385	2022-06-14 22:21:56	2022-06-14 22:21:56
194	387	2022-06-14 22:21:56	2022-06-14 22:21:56
195	389	2022-06-14 22:21:57	2022-06-14 22:21:57
196	391	2022-06-14 22:21:57	2022-06-14 22:21:57
197	393	2022-06-14 22:21:57	2022-06-14 22:21:57
198	395	2022-06-14 22:21:57	2022-06-14 22:21:57
199	397	2022-06-14 22:21:57	2022-06-14 22:21:57
200	399	2022-06-14 22:21:57	2022-06-14 22:21:57
201	401	2022-06-14 22:21:57	2022-06-14 22:21:57
202	403	2022-06-14 22:21:57	2022-06-14 22:21:57
203	405	2022-06-14 22:21:57	2022-06-14 22:21:57
204	407	2022-06-14 22:21:57	2022-06-14 22:21:57
205	409	2022-06-14 22:23:09	2022-06-14 22:23:09
206	411	2022-06-14 22:23:09	2022-06-14 22:23:09
207	413	2022-06-14 22:23:10	2022-06-14 22:23:10
208	415	2022-06-14 22:23:10	2022-06-14 22:23:10
209	417	2022-06-14 22:23:10	2022-06-14 22:23:10
210	419	2022-06-14 22:23:10	2022-06-14 22:23:10
211	421	2022-06-14 22:23:10	2022-06-14 22:23:10
212	423	2022-06-14 22:23:10	2022-06-14 22:23:10
213	425	2022-06-14 22:23:10	2022-06-14 22:23:10
214	427	2022-06-14 22:23:10	2022-06-14 22:23:10
215	429	2022-06-14 22:23:10	2022-06-14 22:23:10
216	431	2022-06-14 22:23:10	2022-06-14 22:23:10
217	433	2022-06-14 22:23:10	2022-06-14 22:23:10
218	435	2022-06-14 22:23:10	2022-06-14 22:23:10
219	437	2022-06-14 22:23:10	2022-06-14 22:23:10
220	439	2022-06-14 22:23:10	2022-06-14 22:23:10
221	441	2022-06-14 22:23:10	2022-06-14 22:23:10
222	443	2022-06-14 22:23:10	2022-06-14 22:23:10
223	445	2022-06-14 22:23:10	2022-06-14 22:23:10
224	447	2022-06-14 22:23:11	2022-06-14 22:23:11
225	449	2022-06-14 22:23:11	2022-06-14 22:23:11
226	451	2022-06-14 22:23:11	2022-06-14 22:23:11
227	453	2022-06-14 22:23:11	2022-06-14 22:23:11
228	455	2022-06-14 22:23:11	2022-06-14 22:23:11
229	457	2022-06-14 22:23:11	2022-06-14 22:23:11
230	459	2022-06-14 22:23:11	2022-06-14 22:23:11
231	461	2022-06-14 22:23:11	2022-06-14 22:23:11
232	463	2022-06-14 22:23:11	2022-06-14 22:23:11
233	465	2022-06-14 22:23:11	2022-06-14 22:23:11
234	467	2022-06-14 22:23:11	2022-06-14 22:23:11
235	469	2022-06-14 22:23:12	2022-06-14 22:23:12
236	471	2022-06-14 22:23:12	2022-06-14 22:23:12
237	473	2022-06-14 22:24:31	2022-06-14 22:24:31
238	475	2022-06-14 22:24:32	2022-06-14 22:24:32
239	477	2022-06-14 22:24:32	2022-06-14 22:24:32
240	479	2022-06-14 22:24:32	2022-06-14 22:24:32
241	481	2022-06-14 22:24:32	2022-06-14 22:24:32
242	483	2022-06-14 22:24:32	2022-06-14 22:24:32
243	485	2022-06-14 22:24:45	2022-06-14 22:24:45
244	487	2022-06-14 22:24:45	2022-06-14 22:24:45
245	489	2022-06-14 22:24:45	2022-06-14 22:24:45
246	491	2022-06-14 22:24:45	2022-06-14 22:24:45
247	493	2022-06-14 22:24:45	2022-06-14 22:24:45
248	495	2022-06-14 22:24:45	2022-06-14 22:24:45
249	497	2022-06-14 22:30:00	2022-06-14 22:30:00
250	499	2022-06-14 22:30:09	2022-06-14 22:30:09
251	501	2022-06-15 08:22:17	2022-06-15 08:22:17
252	503	2022-06-15 08:22:36	2022-06-15 08:22:36
253	505	2022-06-15 08:23:44	2022-06-15 08:23:44
254	507	2022-06-15 08:23:44	2022-06-15 08:23:44
255	509	2022-06-15 08:23:44	2022-06-15 08:23:44
256	511	2022-06-15 08:23:44	2022-06-15 08:23:44
257	513	2022-06-15 08:23:44	2022-06-15 08:23:44
258	515	2022-06-15 08:23:44	2022-06-15 08:23:44
259	517	2022-06-15 08:23:45	2022-06-15 08:23:45
260	519	2022-06-15 08:29:03	2022-06-15 08:29:03
261	521	2022-06-15 08:29:27	2022-06-15 08:29:27
262	523	2022-06-15 08:30:01	2022-06-15 08:30:01
263	525	2022-06-15 08:30:21	2022-06-15 08:30:21
264	527	2022-06-15 08:31:30	2022-06-15 08:31:30
265	529	2022-06-15 08:32:37	2022-06-15 08:32:37
266	531	2022-06-15 08:33:17	2022-06-15 08:33:17
267	533	2022-06-15 08:33:43	2022-06-15 08:33:43
268	535	2022-06-15 08:35:38	2022-06-15 08:35:38
269	537	2022-06-15 08:35:57	2022-06-15 08:35:57
270	539	2022-06-15 08:36:25	2022-06-15 08:36:25
271	541	2022-06-15 08:36:45	2022-06-15 08:36:45
272	543	2022-06-15 08:37:14	2022-06-15 08:37:14
273	545	2022-06-15 08:37:34	2022-06-15 08:37:34
274	547	2022-06-15 08:38:12	2022-06-15 08:38:12
275	549	2022-06-15 08:38:30	2022-06-15 08:38:30
276	551	2022-06-15 08:38:57	2022-06-15 08:38:57
277	553	2022-06-15 08:39:04	2022-06-15 08:39:04
278	555	2022-06-15 08:39:32	2022-06-15 08:39:32
279	557	2022-06-15 08:40:03	2022-06-15 08:40:03
280	559	2022-06-15 08:40:22	2022-06-15 08:40:22
\.


--
-- Data for Name: oauth_refresh_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_refresh_tokens (id, access_token_id, revoked, expires_at) FROM stdin;
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shelters; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.shelters (id, name, address, phone, email, created_at, updated_at, city, photo) FROM stdin;
30	Они ищут дом	бульвар Вацлава Гавела 15	+380943434443	help@gmail.com	2022-05-23 19:58:38	2022-05-23 19:58:38	Киев	shelter.jpg
41	Новий дом	бульвар Вацлава Гавела 15	0958303233	friend@gmail.com	2022-05-23 20:13:19	2022-05-23 20:13:19	Киев	shelter.jpg
42	Сохрани жизнь	бульвар Вацлава Гавела 15	0950006692	help@gmail.com	2022-05-23 20:18:24	2022-05-23 20:18:24	Киев	shelter.jpg
44	HelpAnimal	бульвар Вацлава Гавела 15	0958306333	helpAnimal@gmail.com	2022-05-23 20:25:38	2022-05-23 20:25:38	Киев	shelter.jpg
29	Друг челов	вул. Пушкинская 38	+380958306690	navwie@gmail.com	2022-03-17 19:27:59	2022-06-13 09:11:33	Харьков	приют.jpg
57	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:02:18	2022-06-14 20:02:18	wef	9.jpeg
58	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:03:21	2022-06-14 20:03:21	wef	9.jpeg
59	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:03:49	2022-06-14 20:03:49	wef	9.jpeg
60	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:04:18	2022-06-14 20:04:18	wef	9.jpeg
61	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:05:24	2022-06-14 20:05:24	wef	9.jpeg
62	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:06:09	2022-06-14 20:06:09	wef	9.jpeg
63	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:06:09	2022-06-14 20:06:09	wef	9.jpeg
64	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:08:22	2022-06-14 20:08:22	wef	9.jpeg
65	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:08:22	2022-06-14 20:08:22	wef	9.jpeg
66	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:16:58	2022-06-14 20:16:58	wef	9.jpeg
67	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:16:58	2022-06-14 20:16:58	wef	9.jpeg
68	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:37:43	2022-06-14 20:37:43	wef	9.jpeg
69	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:38:03	2022-06-14 20:38:03	wef	9.jpeg
70	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 20:40:05	2022-06-14 20:40:05	wef	9.jpeg
71	Gamwefs	wef	+380958305322	friends@gmail.com	2022-06-14 20:40:19	2022-06-14 20:50:28	wef	9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY
72	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 22:21:57	2022-06-14 22:21:57	wef	9.jpeg
73	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-14 22:23:11	2022-06-14 22:23:11	wef	9.jpeg
74	Gamwefs	sdfwe	+380958305592	friendsw@gmail.com	2022-06-15 08:32:37	2022-06-15 08:32:37	wef	9.jpeg
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users (id, name, surname, email, phone, password, role, created_at, updated_at) FROM stdin;
1	Алеся	Лиховой	lihovayaolga@gmail.com	+380500526959	$2y$10$06FaxZOMTcQPElxZ6AClOuXenpRh27c2tRtlFHCHRpwdP8EMMNhc6	f	2022-05-09 10:07:08	2022-05-09 10:07:08
3	Артем	Купцов	ardad@gmail.com	+380958136180	$2y$10$KWb4E6JyLo0o1mdfpbOHq.oXjPiOrsZGotcjoCN6tbOcveNZEs/D6	t	2022-05-10 18:48:22	2022-05-10 19:07:20
2	Алеся	Солнышкоwef	navwie@gmail.com	+380958306693	$2y$10$TXBPKYyhiSxd7m3dz6bEce00KXSz1e8IrpKaDw6UmdA5.FMLqBcEu	t	2022-05-09 10:24:00	2022-05-23 15:49:41
5	Геннадий Лиховой	Лиховой	lihov@gmail.com	+380500006959	$2y$10$qs/7sE7a8eYay2RJ/iDBwu9lck3jc9XLyEvAyJhuwZEv.mNbphe0W	f	2022-06-03 18:52:39	2022-06-03 18:52:39
6	Lykhova Aliesia Gennadievna	Gennadievna	efwefnavwie@gmail.com	0958306692	$2y$10$BtToBVTMh3xFYD7lMqH7.O8gPXMBqro8V6q.oqXEAcugSrAHrrAHq	f	2022-06-03 18:58:41	2022-06-03 18:58:41
7	Lykhova Aliesia Gennadievna	Gennadievna	efwefwie@gmail.com	0958306665	$2y$10$QbonbFsv7iBa2QU.oAUU..p0/8cYby6vnP/VXIkGVZSQlcpL4e..K	f	2022-06-03 19:05:14	2022-06-03 19:05:14
8	Геннадий Лиховой	Лиховой	lihovayaga@gmail.com	+380500526922	$2y$10$i48WMV82srOLKMi8/XTqzuY4YwOt/VnIyKLdNiOHmY0RfPoql/UGO	f	2022-06-05 12:14:36	2022-06-05 12:14:36
9	Юля	Шата	julia@gmail.com	+380500526959	$2y$10$l/aog/mjmYv/N9Y4L1qs0.zxqRzjvVnRgkmTjipXCWBAPuYMA.UYi	f	2022-06-13 08:47:29	2022-06-13 08:52:25
10	Ольга	Ольга	lihovaolga@gmail.com	+380500526959	$2y$10$m7qgX23X8dQ/8wtgg02dBuVegJxwmZCUEO6hCoBSvrX1X6NygDRE6	f	2022-06-13 14:13:54	2022-06-13 14:13:54
11	Gillian	Wunsch	vida14@yahoo.com	+18386064686	$2y$04$D3atryHj9kP0yuMLYCryX.CM.xYgjrOpBpoZf.b.yBJtI3UvTkhCu	f	2022-06-14 18:36:30	2022-06-14 18:36:30
12	Benedict	Goyette	loraine.wehner@hotmail.com	(607) 279-3254	$2y$04$1/etQj6AVffFvDVnCs.1BOWb/VwiKlQ6mxqsfBLohhqUZaU9lIpyy	t	2022-06-14 18:38:06	2022-06-14 18:38:06
13	Herminio	Witting	bogan.felicia@brekke.com	786-967-5043	$2y$04$Tl39DOFHYIpGvl0kHFKXDOqxzYR.FwZ21AQQPVQZw0mOKFzuv2uc.	t	2022-06-14 18:39:30	2022-06-14 18:39:30
14	Jermaine	Wuckert	kemmer.neoma@hotmail.com	1-559-449-2383	$2y$04$QwQiBci.iykWRXH.cAOdYeeU.wp74LrgLNGV8ZsSYfW/qLE0yVqq2	t	2022-06-14 18:40:03	2022-06-14 18:40:03
15	Korbin	Kub	jerel.sauer@yahoo.com	805.274.6602	$2y$04$iXu2nn9noYbxos4AldSqA.Lo7S.M.TAbp.j/.LcqYB/x4gZG92036	t	2022-06-14 18:40:20	2022-06-14 18:40:20
16	Raegan	Gusikowski	augusta.kunde@runte.com	+1 (628) 937-1531	$2y$04$qGpwQJf2TAY7E.MHb7QwxObD.YVTrRo59Slv9yjp7pzKZ/e.6KK5O	t	2022-06-14 18:47:19	2022-06-14 18:47:19
17	Wilford	Schiller	dino46@gmail.com	(929) 425-4009	$2y$04$9JFHUpP.3MhBsqpKtovSPudleYxxf/LhkFbyBjkHRGYBJWIMcLC8i	t	2022-06-14 18:47:48	2022-06-14 18:47:48
18	Dianna	Heller	lkuphal@kling.biz	(660) 840-7551	$2y$04$Qwju2UATnFiBK/Reo7eytO8eGea30Vd//Hf/OwmOLjmyUxu1N9HU6	t	2022-06-14 18:49:47	2022-06-14 18:49:47
19	Wava	Nikolaus	conroy.christian@hotmail.com	+1 (240) 389-4548	$2y$04$EJG/HK./W7YY53rHTq6KDO0zKEMURO7.hVjsITtTCQks9lk8caJYq	t	2022-06-14 19:08:30	2022-06-14 19:08:30
21	Вероника	Лукянко	Dna@gmail.com	+383295300204	$2y$04$Ly7OL6.5odlvPl/J0atJVuItLQGVldOqJRKtz.RCVbD2/JNxcqyXy	f	2022-06-14 19:17:01	2022-06-14 19:17:01
22	Вероника	Лукянко	Dnawe@gmail.com	+3832953204	$2y$04$3vCnrgpM8ikx1309KclBX.GX18FDTjH96ASBtbrnhKTLiAYgN53ze	f	2022-06-14 19:17:37	2022-06-14 19:17:37
23	Вероника	Лукянко	Dnaw@gmail.com	+3832953204	$2y$04$b6dcD3MvFhXp6DkXno5P/esUG9GQGNXwkniyhw3qt287oGq.H5DYu	f	2022-06-14 19:18:17	2022-06-14 19:18:17
24	Elenor	Lynch	tschuster@gmail.com	660-325-3889	$2y$04$J164LFsafDeZTHXauXShZuopGPxhr5Nr.UKkZaXW5cttCCRgSkKi2	t	2022-06-14 19:27:07	2022-06-14 19:27:07
25	Leora	Oberbrunner	briana.glover@yahoo.com	1-281-517-8054	$2y$04$8LkyJ7mE1r9x9uSLZukVvuHgdgf3/k/J5ROhhWTWENrDcJx9/PZaW	t	2022-06-14 19:27:34	2022-06-14 19:27:34
26	Antone	Dickens	drobel@nienow.biz	+17326088782	$2y$04$dy3Ho/OZEwE4ncYrh7BF1uJO3t7oPfwyNvRt9CqY9r7qasjkN8zJ2	t	2022-06-14 19:29:00	2022-06-14 19:29:00
27	Halle	Blick	zlubowitz@hotmail.com	(602) 699-1196	$2y$04$K.d.2vZv1KPQSjdz/ud9L.NWoOy2dOelpXU041qsc6AHZ98SnWkwy	t	2022-06-14 19:29:00	2022-06-14 19:29:00
28	Nathanial	Tromp	isidro.trantow@breitenberg.com	(352) 208-8510	$2y$04$CI0N9IVQcD2Up.6sIsinU.b.TBjx8G64NxnRltSGlF6EHHbRxB.7u	t	2022-06-14 19:29:35	2022-06-14 19:29:35
29	Jessyca	Sawayn	pierre89@yahoo.com	1-707-308-9674	$2y$04$lTLceDEIhDVJ/98C/9ezjuGXsEQMH3W//HQLyunm9kvrPP6tfBV8y	t	2022-06-14 19:29:50	2022-06-14 19:29:50
30	Cortez	Mayert	keyshawn.king@grimes.com	+1 (802) 943-5197	$2y$04$epaL0yWGHqbAvIWt4vKH/u8dQ7BA2a44HDoqLs6a7d9ALhuQyWTzm	t	2022-06-14 19:30:24	2022-06-14 19:30:24
31	Shayna	Langworth	hudson.delpha@turcotte.biz	+19479850943	$2y$04$ZPujfnh3uDKqFHIZ0oX4JuxACkttqd6GyyMRmtj.rJbvyoCd9aHmC	t	2022-06-14 19:30:56	2022-06-14 19:30:56
32	Bernice	Larson	kshlerin.krystal@yahoo.com	610.925.3143	$2y$04$E.q5TbW1TfsEG8QQOXLGceWdisADCGAjkipxpR3rhh5RmiIFqa./.	t	2022-06-14 19:31:43	2022-06-14 19:31:43
33	Terrill	Reichel	frederik83@block.com	+1 (915) 440-7579	$2y$04$m2mxChl5pomnePrfeCIFOu9YrWxsI0.piV54sEA7poA/VvBQAMcS2	t	2022-06-14 19:32:02	2022-06-14 19:32:02
34	Kathryn	Nienow	kathlyn.zulauf@hotmail.com	407-683-6142	$2y$04$10F6HRZbs6EgpiGxlnJoXO6g3vhpH.QB29bJ4/WqT03rYfX0pSjXS	t	2022-06-14 19:32:24	2022-06-14 19:32:24
35	Kimberly	Ortiz	cortney50@rodriguez.com	1-440-454-9388	$2y$04$OqjdMPlM9DS/r/uEl939au8hlcigGVO1bgCNeaPOttfNJIKF398AO	t	2022-06-14 19:35:38	2022-06-14 19:35:38
36	Marian	McClure	pascale.nikolaus@gmail.com	1-302-670-6769	$2y$04$hRZFaNHP.e/NRUCDangz4.ZZBk41s4it4SkZ6ZRb.bBQ.Zi9C4Sva	t	2022-06-14 19:36:00	2022-06-14 19:36:00
37	Ralph	McLaughlin	nader.izaiah@hotmail.com	715-655-9489	$2y$04$nzkE4esa/gN0C.gLY5e6buoLUJ5VpXF2U4NWqboOtEopOwLrvmY.W	t	2022-06-14 19:38:45	2022-06-14 19:38:45
38	Alden	Mante	rutherford.dominic@weissnat.com	920.770.9137	$2y$04$kwVFAynr6o9RgyI79Kac2uUDt3BF9Wmc5.C2A9Vz675q2MtimztJS	t	2022-06-14 19:40:41	2022-06-14 19:40:41
39	Marques	Runte	leila.windler@gmail.com	(445) 730-5070	$2y$04$SFE4yoigvXaT77yJFaSByOD2Cqdz0B8mUjx33.XOJZVwEuZUjXPbi	t	2022-06-14 19:41:16	2022-06-14 19:41:16
40	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$2tozh0lbW/XW8tByjm7SXeNW5U.xX1YarDWggImP8OzAV.HC/sGai	t	2022-06-14 19:41:43	2022-06-14 19:41:43
41	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$0xCWWVmHOuGWzJuf2S1NQeQNUAgYTIHFPTJeaxqDai8HMQ2bVzI1m	t	2022-06-14 19:49:42	2022-06-14 19:49:42
42	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$rVwRGjzKhR5WlCOD/16yvOJOEujJFJ72bSmIEoSjXJ/aPsgZqIRuK	t	2022-06-14 19:50:22	2022-06-14 19:50:22
43	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$rK2NZB7ttGzV1qxUm17i5eZfnuLjVbqoWrsL2JQtF1GVyPfKjv2QW	t	2022-06-14 19:51:55	2022-06-14 19:51:55
44	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$E8EfkEG1LtjC/gh3T/jDg.23PU9R4LncykEnbroicSLkjFzEL3kQq	t	2022-06-14 19:52:56	2022-06-14 19:52:56
45	Santiago	Sporer	megane21@gmail.com	1-248-454-2842	$2y$04$uR6fwMf0c69nxxWBu4GWV.Z1ooAZyN7uymdoWmR7bWvKbDMpR4fgO	t	2022-06-14 19:52:56	2022-06-14 19:52:56
46	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$QT4s0y9hdr5mH0z2fAeQme2MhAm8f/O88x/W8p4lQf4ybZlSlIuu6	t	2022-06-14 19:53:18	2022-06-14 19:53:18
47	Cora	Emmerich	daniel.raquel@yahoo.com	+13606494705	$2y$04$LafsLxZWHgLgwOFF.mJiAOX/R6ZpWoTaImr9G87VAPnnshL3Qomxa	t	2022-06-14 19:53:18	2022-06-14 19:53:18
48	Aaron	Trantow	dhegmann@gmail.com	+18456719718	$2y$04$OH6J83n8/FRXtP8U2zkopuwLdWE7TqFQ.ZnBJDuLjfqXB1gmhMqZ2	t	2022-06-14 19:53:35	2022-06-14 19:53:35
49	Bradford	Wilkinson	leland.wunsch@yahoo.com	651-220-0307	$2y$04$tz8hD5ZIgmMiKq4X0UJrMeqIXepIpDSUhg.oiKCHCzIoDq1aNxsgm	t	2022-06-14 19:58:50	2022-06-14 19:58:50
50	Mackenzie	Schulist	glittel@hotmail.com	281-817-3906	$2y$04$JMQKPiD5hg.J0tEAPoj/uetVTwpmE70XVmtkzbpgbV1Ye35F8T0.G	t	2022-06-14 19:59:19	2022-06-14 19:59:19
51	Lucinda	Wehner	shodkiewicz@yahoo.com	916-952-1646	$2y$04$MmBdQ5xqZUnlbcXdzAE7benEywfhIv6oMvKjIZQbHbcwbPEroOUpG	t	2022-06-14 20:02:18	2022-06-14 20:02:18
52	Adriana	Dicki	marielle.moen@yahoo.com	+1 (820) 578-5210	$2y$04$bxwGS1.FCpHYo1g5m76p/.wRKOHJuqFQmw15BCg2e4AC3Lql0PxC2	t	2022-06-14 20:03:21	2022-06-14 20:03:21
53	Hassie	Berge	hintz.jeremy@strosin.biz	+1-856-639-6417	$2y$04$.rfcE2KES5wC837ZeL4O8eEj4FSRaQvEM54YqMhsGhxfSBxyGRH6m	t	2022-06-14 20:03:48	2022-06-14 20:03:48
54	Celestine	Fay	brown.carmine@yahoo.com	986-928-7852	$2y$04$R5qREGqLod5VMl/i.t7XuOH17jUGukY.grQRe/LV2oTZjG.idBU0i	t	2022-06-14 20:04:18	2022-06-14 20:04:18
55	Asa	Quitzon	cecelia69@gmail.com	+1-386-571-4167	$2y$04$thVSPzPDXUhk235phZ0IcOhncsG5YPuYNLcDjoEBCb1NPQZSUSLDq	t	2022-06-14 20:05:24	2022-06-14 20:05:24
56	Reyna	Waelchi	johnston.ephraim@steuber.info	+1-717-805-0077	$2y$04$msSqwHtWVUvj5Rd0AGy5se89Dv80Jgj2ZettYcJH8XeSWy9F8puwu	t	2022-06-14 20:06:08	2022-06-14 20:06:08
57	Oral	Keebler	carroll.gaston@damore.com	1-930-322-0649	$2y$04$iZmuAFeWzVITjwLSu429T.D3XTfqEKBOQ5GSuvzF/dHYMGvcRENdu	t	2022-06-14 20:06:09	2022-06-14 20:06:09
58	Tevin	Stiedemann	srutherford@gmail.com	(678) 377-3369	$2y$04$1HXLWYGkJIX65uzl28zTneY6QZwbw006.Ef4U49W6ZyLNJ9iFGRH6	t	2022-06-14 20:08:22	2022-06-14 20:08:22
59	Maggie	Simonis	loyce98@blick.info	843-949-4977	$2y$04$rCBiODEFWmtA7LLBBgj7h.K//03z.lJ0wrPtFNleUC.E1j.vAmJcS	t	2022-06-14 20:08:22	2022-06-14 20:08:22
60	Letha	Oberbrunner	hhuels@bosco.com	+1.713.907.8594	$2y$04$sLUWBLe.JAAQmiCXMUdH0ePkv.WTnXrrtUG8tQKaQ76n.gGx01Wma	t	2022-06-14 20:16:58	2022-06-14 20:16:58
61	Odie	Zboncak	mclaughlin.zander@hessel.com	(754) 574-2532	$2y$04$3CGRCOIeN6ehyxQHIGDRBeYpSooiLvMzCg6ZuRPEhSr0duXUwHJhC	t	2022-06-14 20:16:58	2022-06-14 20:16:58
62	Renee	Watsica	wehner.roberta@huel.org	(312) 374-5511	$2y$04$N3w2zs3qUz8sLcL/R3cg9eajFIhcb/x/qxMvrUvQuZU7CxtP2gIG6	t	2022-06-14 20:20:03	2022-06-14 20:20:03
63	Trenton	Hermann	damian.erdman@gmail.com	+1 (530) 433-1968	$2y$04$cqAGa57TEzG8mEDemJXtPu/KqUkrBpDZTbd3ZDQgTJfO2NeLdKUrq	t	2022-06-14 20:20:03	2022-06-14 20:20:03
64	Caesar	Wuckert	osinski.torrance@goyette.info	818.387.8247	$2y$04$A21zDOBR23AaQt.ziwk5Fug6NcMB8oudwNMNfwhBQ27iz3kQUoJs6	t	2022-06-14 20:33:33	2022-06-14 20:33:33
65	Dana	Spinka	elnora98@yahoo.com	276-663-6703	$2y$04$55u0op42ho0eMhAV8Nbk0uLKUR8w.XTOegWTM0Hx/cHbbRBrf9sxq	t	2022-06-14 20:33:33	2022-06-14 20:33:33
66	Aniyah	Baumbach	freddie87@willms.org	+1-347-369-6921	$2y$04$KPV.gMPc1k64fry.FtSemurKaZznPMBtzyzmACKUl56ENCJaeXXwy	t	2022-06-14 20:33:47	2022-06-14 20:33:47
67	Nicole	Lueilwitz	keshaun.doyle@beatty.com	+1-904-425-2992	$2y$04$Z5wEJhLBSfIdGEtkf1heC.EvpXefw5x/uRZQC0ID8jiQHPwButND.	t	2022-06-14 20:34:27	2022-06-14 20:34:27
68	Braeden	Yost	botsford.ressie@gmail.com	+1-847-855-2385	$2y$04$8EzKzfPe7m.PUhZJc8BNAOGQfmO03gM/pJxX5/Kn0IZEl8T1fXEPa	t	2022-06-14 20:37:43	2022-06-14 20:37:43
69	Dolly	Legros	aric.okon@gmail.com	1-458-547-2359	$2y$04$2M6oDAstY45M9w/ifHImG.gZZmeFJ/Fx4EW43/A3bECH3aouFU/c6	t	2022-06-14 20:38:03	2022-06-14 20:38:03
70	Kirsten	Gleichner	jerod.beier@kiehn.com	+1 (951) 993-3654	$2y$04$eezH.EJFamemgahaNNYbdOncjObmtsaTJb.8Y.wwOK.RSWatFqdGG	t	2022-06-14 20:38:03	2022-06-14 20:38:03
71	Lela	Ziemann	bergnaum.angelina@yahoo.com	+1.484.440.8975	$2y$04$wdK6mCbZIAHcVmkQnaKtLOkP20rz3VAt1TcGA0Cd1/Td2wi.D4n7O	t	2022-06-14 20:40:05	2022-06-14 20:40:05
72	Susana	Schinner	justen.orn@gmail.com	(520) 745-6394	$2y$04$uidcxPml9.q0CzDbpSJmieYivUn.jEY3RGsY5hiFPxns4Q.EMcZwy	t	2022-06-14 20:40:05	2022-06-14 20:40:05
73	Nikita	Okuneva	deondre17@gerlach.com	+1-283-541-5884	$2y$04$fDUv5bk4V07b/DbF5Qf0tu5dRuBRj2EzU/05P/9XRIoa6VwwaIfJe	t	2022-06-14 20:40:18	2022-06-14 20:40:18
74	Kaitlyn	Medhurst	nikolaus.lukas@yahoo.com	+1-817-362-9358	$2y$04$uZFXP3pj.vT/sYwSt1YV2OY9S8S.hpP1Oe0yCJ6uwoW7xIVU7X7Yq	t	2022-06-14 20:40:35	2022-06-14 20:40:35
75	Albin	Langosh	liliana75@dibbert.com	+1-425-371-0596	$2y$04$q6MIQIJHy9fTbmbET8O4Bu2jAQxgUGNq17LV76QdrDEScpqJw4YIW	t	2022-06-14 20:40:59	2022-06-14 20:40:59
76	Hope	Schoen	brittany.stracke@gottlieb.org	(445) 307-4309	$2y$04$BSpUvi5tCtCZ85Qby5tWdOPkxrTYyE7oCuoAj3OmNFBx11kekLV9u	t	2022-06-14 20:41:41	2022-06-14 20:41:41
77	Louisa	Tillman	jjenkins@ruecker.org	+1.956.634.3554	$2y$04$1oGvxiKr63uRP6WLbNCHPeBqK3VrNUizuPVK74Qc85KmZtn2vnd.G	t	2022-06-14 20:50:28	2022-06-14 20:50:28
78	Gregg	Casper	rframi@bahringer.com	+13605568728	$2y$04$CcijlXi6.RejlGbB3.yVweRtbAxvSET/zP7rteSa1wAt7lnMLOli2	t	2022-06-14 20:50:54	2022-06-14 20:50:54
79	Rowan	Block	don.satterfield@gutkowski.com	724.282.0171	$2y$04$10ML.rHkrhGs/pMaTfv3fO9NhX2tI4qbnD.7DZf7Mnb43f57z4DL2	t	2022-06-14 20:52:23	2022-06-14 20:52:23
80	Alfredo	Bernier	oleta.block@schinner.biz	+1-469-990-7080	$2y$04$XFQRzA9qs6TINuG6A7eZGub2rcJrZU12caIUbaKEGVLJHGFfe4Gd6	t	2022-06-14 21:16:41	2022-06-14 21:16:41
81	Haylie	Leannon	nedra09@gmail.com	228-516-4586	$2y$04$TTg8cn2UnXDoTZ48a30sH.pjrA81ERcwbsnKy43X0pSGvE4YtPL1O	t	2022-06-14 21:17:06	2022-06-14 21:17:06
82	Sheridan	VonRueden	hosea.kshlerin@hotmail.com	1-413-320-9970	$2y$04$lBzhpDE2ToGVfYO9eK64wOF/XwUcThEM3/qpUOgEAA9jEwQeRHZcu	t	2022-06-14 21:17:17	2022-06-14 21:17:17
83	Henry	Schaefer	dane.emmerich@gmail.com	228.624.3272	$2y$04$Mqg8v5ADlpvL.HmUH5Q64eQDFbvQ32Wd39XSffxj5Ms/DyK827bC.	t	2022-06-14 21:17:50	2022-06-14 21:17:50
84	Jaleel	Cronin	delbert.corwin@ruecker.com	+1-754-598-7472	$2y$04$V/P9ThuOcVmDPMZC4pS2C.jfiuZnnwLNTe8VhaOuPLz1z8K7brHda	t	2022-06-14 21:19:08	2022-06-14 21:19:08
85	Jules	Torp	nhagenes@hotmail.com	+1-608-830-9498	$2y$04$hsc0iaaK8GgB2Ac6ZdGZv.AC4.lZg9R23a3vsqtpKrOXVkWKdBCz6	t	2022-06-14 21:19:36	2022-06-14 21:19:36
86	Brycen	Rogahn	jenifer59@yahoo.com	346-816-4161	$2y$04$OQiFc2foN2XpKRT776Qn0.6xjnKBbo1tQucrSsRfnA5bhUWq/N8yq	t	2022-06-14 21:20:18	2022-06-14 21:20:18
87	Lazaro	Jakubowski	walter.connelly@watsica.com	+1-715-221-9087	$2y$04$7vo2nd9NzC7O94rFeDSUheZkXU8q.OLklZ/SuyBu1Lw4XyeA.CHmG	t	2022-06-14 21:20:39	2022-06-14 21:20:39
88	Marcel	Labadie	jillian99@hotmail.com	(213) 373-2975	$2y$04$P0b6SPJrVHA4gARVvca5B.jWQApJrmF1BOswxQrCfX4tFPCJICtie	t	2022-06-14 21:21:19	2022-06-14 21:21:19
89	Trey	Pacocha	xnitzsche@hahn.info	+1.214.943.5641	$2y$04$kWieXCt7WQyx2lYOh7hAQOahYcGt7EvqCdtH7Mg2QBgsMca.91yqS	t	2022-06-14 21:23:35	2022-06-14 21:23:35
90	Juvenal	Hammes	rafaela70@graham.info	878-712-7851	$2y$04$e2VQuWx2GjydBhoYD62LK.RDe8QANU8ntrbQvopOVlq/fIyktMmnC	t	2022-06-14 21:23:51	2022-06-14 21:23:51
91	Marcelo	Stroman	ally18@blanda.org	+1 (702) 754-6231	$2y$04$c8ZghLn3RGTere2HYamJdORnZiQGu7jJEftbWsY8yk0AT/XEC59fu	t	2022-06-14 21:24:01	2022-06-14 21:24:01
92	Shirley	Nienow	iliana25@gmail.com	+1-978-331-9511	$2y$04$2URuewEzaSr.WJDhD1XnQOYYapCsxrUeht3C9nGMBazugI/xR/Dra	t	2022-06-14 21:24:24	2022-06-14 21:24:24
93	Wilbert	O'Keefe	rosina.kling@yahoo.com	+1-678-747-2021	$2y$04$uKxx80UKsrUuumVsKOeWu.TBlYw2LyNxNS3U6XtoPbgbxCMIcvTbO	t	2022-06-14 21:26:27	2022-06-14 21:26:27
94	Jackie	Schumm	madaline74@sanford.com	(786) 661-6430	$2y$04$waCGgiPrnHJ/007aNlW6keYNJ0v.bnPxlfMrVDoa1zh/E58L.b4Ku	t	2022-06-14 21:28:13	2022-06-14 21:28:13
95	Aaliyah	Gaylord	ysatterfield@davis.biz	219.261.6682	$2y$04$E0URfW4H6bt/4S5WighoY.VD5E/RQmrX/eq0M0wsCQa3QzohmqUgG	t	2022-06-14 21:28:28	2022-06-14 21:28:28
96	Unique	Bartell	donato.mcglynn@greenholt.biz	1-847-810-5531	$2y$04$RnHZom3tqBOkZn/ySE9pauG.zcXkggwPQvvH528ddQDjuCmH7xR/6	t	2022-06-14 21:29:10	2022-06-14 21:29:10
97	Cortez	Walsh	kelley40@gmail.com	(727) 928-7942	$2y$04$AftXRXqVAwK0C25OkYkfJebmiEK7P/ns7JJmuxp5ClL4LPzD7oTHa	t	2022-06-14 21:29:29	2022-06-14 21:29:29
98	Lyla	Shanahan	oren97@kessler.net	848-826-0343	$2y$04$XV74B0kJEWcItvREcSyZV.pab/T9RrZqrUX4cae9ebwKTdE6dvqf6	t	2022-06-14 21:29:29	2022-06-14 21:29:29
99	Lon	Emmerich	cecilia94@hotmail.com	+1 (757) 401-1220	$2y$04$K.MvgZ2yHv8VDH82o9BwdORWwpyimCj8LUcthSYfzF1hP8MurLrpe	t	2022-06-14 21:29:29	2022-06-14 21:29:29
100	Clarissa	Fisher	mavis.schmeler@oconnell.biz	1-507-466-5646	$2y$04$W4/sq8I3dphyNPhda.h8u.Sejv9S45jVMMfFdA6APH.lUYMkb/x9C	t	2022-06-14 21:29:29	2022-06-14 21:29:29
101	Estell	Cruickshank	sgrant@yahoo.com	1-216-468-9831	$2y$04$1q/kG4L/aAVIGKl47pjwhuh9fO8YjM8nwYANw8ELH9xarNEsGtSza	t	2022-06-14 21:29:29	2022-06-14 21:29:29
102	Hannah	Schoen	smith.kyler@gmail.com	1-240-509-9302	$2y$04$Yi0SdMu.Dy7oYhivEGmEhOvIhPAPtUHwA923i6OZtuC33CUeyoUk.	t	2022-06-14 21:29:29	2022-06-14 21:29:29
103	Gina	Parker	davin68@barton.net	1-319-938-9393	$2y$04$WLk4E1/CcDe.W6w/KsU8UOjp6e77nAuc6OL3Ez9vDZm2ecyJKvvve	t	2022-06-14 21:37:57	2022-06-14 21:37:57
104	Marian	Raynor	yhermiston@gmail.com	+1-949-653-0902	$2y$04$b/Xwc00UockzLlslADWQbOtBZgALo2FC4NfHnXkfeFraHbbZzWHB.	t	2022-06-14 21:38:06	2022-06-14 21:38:06
105	Lois	Fritsch	xschneider@yahoo.com	530-254-3039	$2y$04$SQX76bVaLGbqG7HXVuSO0u/pV.j2aLa8FE76kEMPIoaCcvt1iIWNW	t	2022-06-14 21:38:50	2022-06-14 21:38:50
106	Matteo	Larkin	conroy.rupert@howe.info	530.418.6550	$2y$04$IbsJtAMWsck/3eWZESH2A.sFP1gW5M/SempQs6seIHyCPeQfs.BZq	t	2022-06-14 21:39:50	2022-06-14 21:39:50
107	Kristina	Kuvalis	daisy.graham@stracke.com	(479) 214-6110	$2y$04$pgSPSRfSz/5pS4fU3kGHlO8aVVwTkXtE6fGl.4AcSqkX.a/gwZ7n2	t	2022-06-14 21:40:11	2022-06-14 21:40:11
108	Judah	Schumm	heffertz@gmail.com	(667) 565-7124	$2y$04$sKqSSZKOm7KgSZRL9C7.AeaPe6O0ZB.9bNxdjIb6cZXvi5oNjR/f2	t	2022-06-14 21:41:12	2022-06-14 21:41:12
109	Reid	Satterfield	dickens.graciela@gmail.com	+1-269-828-1895	$2y$04$sJbnh.cYYwvNw0LNSX.6mu5x81dSBIyuLy2VmsX64VNWQxxRUca7C	t	2022-06-14 21:41:27	2022-06-14 21:41:27
110	Ladarius	Hoppe	kohler.christa@anderson.org	909-406-3791	$2y$04$JntAtAglCP7IoY5B3OhKtuBY2OlrY74WzS5LFoB/J39l8RljWhIAC	t	2022-06-14 21:41:34	2022-06-14 21:41:34
111	Jerrod	Muller	jaycee.walker@yahoo.com	404.770.1213	$2y$04$v.r4j86Nv/e.lmPZeMwvzuFOnl9hoI3awnW/lZ5zCvTGj/.lb5Um2	t	2022-06-14 21:55:49	2022-06-14 21:55:49
112	Leatha	Romaguera	evert38@will.biz	+16153984424	$2y$04$JLgzCmPv5WeC6hcbFlXvf.LyJ1JXxEsWj2SLeMVs979JhpeN9b2UO	t	2022-06-14 21:56:14	2022-06-14 21:56:14
113	Jarod	Franecki	kaylee10@yahoo.com	458-354-3852	$2y$04$bNkq4sfdeua.94SVqxjhEe.WwSuA9.74uBkw/M2aqAWmO1hL9A88y	t	2022-06-14 21:56:28	2022-06-14 21:56:28
114	Lillian	Stroman	gislason.celia@yahoo.com	802.837.1420	$2y$04$QXwE6o.8CDXshL2WynCoH.0CUz9nQ6Yi5jwV4JKeoOLOleUgeicy6	t	2022-06-14 21:57:03	2022-06-14 21:57:03
115	Garth	Kunde	berge.abel@gmail.com	1-559-600-8887	$2y$04$f4Crpy..lzevhpUeWXD2CuzIDA.A8i5YLke.zjoDfIVCoAQ.bmurG	t	2022-06-14 21:57:49	2022-06-14 21:57:49
116	Gillian	Johnston	koby.padberg@gmail.com	424.518.7633	$2y$04$Oa1J/nVIMdAa44aeRQ8VMe5zHyqs9b6tb6OUyM991SP0hAyZgfzza	t	2022-06-14 21:58:01	2022-06-14 21:58:01
117	Jaclyn	Hodkiewicz	roreilly@predovic.org	1-215-706-6542	$2y$04$dnRO6wdrPojIVWMd.MVaZOtepbSV6KxFuI0QLOhsuHv1oC0KPKC9O	t	2022-06-14 21:58:29	2022-06-14 21:58:29
118	Vincenzo	Turner	elinor52@hotmail.com	850-370-0239	$2y$04$aizTNJngjFxfxOh/JwgkVevZhbFCMLQu0LHDbGuMxWQ00sadJJ1vy	t	2022-06-14 21:58:58	2022-06-14 21:58:58
119	Shaniya	Dach	bryce.wiegand@yahoo.com	(575) 984-4361	$2y$04$q4DaznrsY4Fh9r13P9rvfeDs2mPuKeiUGfLRsRFptyPlCLq7OND2W	t	2022-06-14 21:59:07	2022-06-14 21:59:07
120	Delta	Cartwright	damien.mayer@gmail.com	+1 (364) 302-3795	$2y$04$CsZVfRCuBuGfmid3AoxVFuSrFBuKIw/FTNPWxP5uOGHjvJdMBLq3q	t	2022-06-14 21:59:13	2022-06-14 21:59:13
121	Darron	Ledner	jerome.runolfsson@yahoo.com	+1 (510) 541-3688	$2y$04$vTcLJSJGZ9r2oJ5C1Eiq0OKKS2glwNbojK9BOGXjmZqgAtM2Y6KU6	t	2022-06-14 22:00:30	2022-06-14 22:00:30
122	Easter	Johns	kristofer.beahan@grady.com	432.763.7523	$2y$04$DTaJahVCtUH0p2W5KdbuCuhwWmPwjh31BOeuUzyLNp9VEXiPf0LVe	t	2022-06-14 22:02:56	2022-06-14 22:02:56
123	Rodger	Welch	amara92@gmail.com	1-515-450-2206	$2y$04$OQa91s5Upd8T46OMFngcqu7pDAqb4cPYrM3UlSEwivCjOtmNFOs8W	t	2022-06-14 22:03:35	2022-06-14 22:03:35
124	Joyce	Thiel	colton74@ebert.com	657.544.9628	$2y$04$rEZy9lfxxU749V8W637W7un/c45CDHesuTjj.WkCwM1zBEhYidrd2	t	2022-06-14 22:04:29	2022-06-14 22:04:29
125	Kieran	Gutkowski	zion07@gmail.com	(719) 843-8934	$2y$04$iXdNxwCD85Hyu9RurYZobuu7EWOMQPRkRh5C1SwJ/nwrAPIUj.R9q	t	2022-06-14 22:05:05	2022-06-14 22:05:05
126	Patience	Corkery	zachary90@hotmail.com	(256) 587-5836	$2y$04$VL0WYbdYFoxXKgeTXsSlWes/hsuh2iPNOhMKnorTqToMvoWRmHvYi	t	2022-06-14 22:06:28	2022-06-14 22:06:28
127	Maya	Heathcote	runolfsson.jewel@yahoo.com	954-821-9869	$2y$04$vNR7CFDLb0/zkzbV2RTZFOmKpHAelGRFjNbe6IAi6bYwluU8Th2XO	t	2022-06-14 22:07:58	2022-06-14 22:07:58
128	Althea	Lubowitz	prosacco.micaela@predovic.com	+1-931-360-4786	$2y$04$pPU9Timn1683WckYaEGVQO2y8xNycXmHcRJ5B3n7TT7mPRlLkQpWO	t	2022-06-14 22:10:52	2022-06-14 22:10:52
129	Madisen	Rath	kunze.jaeden@gmail.com	540-675-6109	$2y$04$JdAXKihrT.NugNBUsPBWeuF31oyWxgOGRdlxABSWplv0S0Uy.9Nw2	t	2022-06-14 22:12:35	2022-06-14 22:12:35
130	Zula	Schuster	astroman@yahoo.com	910-848-6841	$2y$04$T3rODt8PdjNZdj2EFuwacOKnjr0nwqBy3ylaqqkBJ/yKSvXGlztDG	t	2022-06-14 22:13:29	2022-06-14 22:13:29
131	Elwin	Botsford	abshire.johann@tremblay.com	938.434.8638	$2y$04$nuLEiQ47pCtwhxETcWuOv.CyL8c8c9BQ0Z0p2cydgD7tShwm4ijsa	t	2022-06-14 22:13:53	2022-06-14 22:13:53
132	Lia	Waelchi	daphnee61@gottlieb.biz	1-712-236-8809	$2y$04$Wv16pqJJTVfFWsq5F1kkeuSuWEavLmRrwWjpqdQJ.dWLzTe8kILS2	t	2022-06-14 22:14:02	2022-06-14 22:14:02
133	Marie	Cronin	marvin.enola@hotmail.com	(270) 467-2185	$2y$04$THiBF4H0bvu2i0z1af4dTekxCY.qofVMCTY81mD8SDokr98CN1agm	t	2022-06-14 22:14:41	2022-06-14 22:14:41
134	Dannie	Wiza	bart.mayert@yundt.com	+1 (847) 210-1079	$2y$04$c94CYaOK8qflfcXD5dWVpereREyk93ljUaHp4x3SGIOI2Tig9dAXC	t	2022-06-14 22:15:03	2022-06-14 22:15:03
135	Cecilia	Sipes	fwisozk@gmail.com	1-769-800-2832	$2y$04$mM1q2fF/RFSKEmw.hrwzWOORZ8ZQlJsOV/lBYYHfje9wjolGjLLZy	t	2022-06-14 22:16:23	2022-06-14 22:16:23
136	Mylene	Emard	oconnell.silas@gleichner.biz	(315) 217-2702	$2y$04$PkHiSc2t1QH5LzQfvhSqG.UWdBM.mMGP4zHWNT2I0mb3M5Yh6rpUW	t	2022-06-14 22:17:26	2022-06-14 22:17:26
137	Ethelyn	Bogan	jnienow@gmail.com	+1 (501) 635-3976	$2y$04$dSh1APT9KDKVtIuHMf3U0uqqb7FVOxHb09PdkHGvhvorey3XY6qLe	t	2022-06-14 22:19:13	2022-06-14 22:19:13
138	Drake	Murphy	austin69@sanford.org	+1 (947) 287-5733	$2y$04$md5LJZJRhVu3dWNMsWLvQu/nMTqcLBq2MYM5f0wb62tI3sMekTjiq	t	2022-06-14 22:20:08	2022-06-14 22:20:08
139	Deanna	McClure	wyman.aniya@bode.biz	+1 (781) 900-1444	$2y$04$.Xsz8fNEefMteNgk2noW7O6UM2V1BKj9akguoiS8fTYQQgUBaqAmO	t	2022-06-14 22:21:55	2022-06-14 22:21:55
140	Vern	Goldner	alta.swift@hotmail.com	(515) 743-6903	$2y$04$fqUFZp6ySUK.by1ZuKcnteEMH7tRswYuwVADGthryN5//Pjxnh2CW	t	2022-06-14 22:21:55	2022-06-14 22:21:55
141	Aliyah	Mayert	pschmeler@beier.com	+1-520-236-4739	$2y$04$s3GKQs9/ecM/qvflaxcF/.gChD1Xo8BEftiF/vXom1AFtNXToFFN.	t	2022-06-14 22:21:55	2022-06-14 22:21:55
142	Bertrand	Feil	zmuller@yahoo.com	256-836-3146	$2y$04$mz.LCtrFb6slji8kiSq1XO56SS3MK81PiWKzYf5gIBy0WlPJU1owC	t	2022-06-14 22:21:55	2022-06-14 22:21:55
143	Jeff	Miller	vhyatt@bednar.biz	(385) 968-0577	$2y$04$bBYCcprdSk3FXzG9kj.A..z/WDMdLVvjp0bR0LJb8isqsV8J63Nfi	t	2022-06-14 22:21:56	2022-06-14 22:21:56
144	Jonathan	Doyle	bernardo25@yahoo.com	+14782826607	$2y$04$3sVa.XLP35n4zip40hHwa..kzvxLZKPEtVnlgvkV2kuehO76exrVu	t	2022-06-14 22:21:56	2022-06-14 22:21:56
145	Makenna	Rolfson	rohara@bechtelar.biz	+1-305-492-2649	$2y$04$H.N1t/J.h4WIDeXEdE5M0ezWFsrE3Yk9aKMgGJ5EsBokRZc1k23fy	t	2022-06-14 22:21:56	2022-06-14 22:21:56
146	Zoie	Howell	xcollier@ward.biz	(540) 610-1758	$2y$04$P9a7KMh/T2PpyeubrKDkjeRV29YD6i.7TPc9W3G6YZDo5jwcoHwcC	t	2022-06-14 22:21:56	2022-06-14 22:21:56
147	Bud	Harris	xconroy@hotmail.com	1-562-851-8035	$2y$04$EfIiW35jXyxyjUGt07i0ROmzq24dcVHw02AJ4KGdDzmLkDfXu3tIS	t	2022-06-14 22:21:56	2022-06-14 22:21:56
148	Georgiana	Schneider	littel.precious@gmail.com	1-508-778-5552	$2y$04$n3V1AOxldzdDnKD68KD02.XNpDMp3dizolgswuo.FjpfqSTKFbJda	t	2022-06-14 22:21:56	2022-06-14 22:21:56
149	Clark	Aufderhar	douglas75@yahoo.com	1-650-354-9633	$2y$04$mseWPimzWNIElz8JW8pzP.mr9hls33b9LeDzxNwZMDxRkIaOapVx2	t	2022-06-14 22:21:56	2022-06-14 22:21:56
150	Celine	Witting	schaden.anika@gmail.com	+1.820.307.5638	$2y$04$YftTRqKBFuVy7NMW/uNDW.wPODQRcgGvwfVzKe7SWT4a6XOJs7liW	t	2022-06-14 22:21:56	2022-06-14 22:21:56
151	Adeline	Koelpin	becker.hermann@gmail.com	+1 (769) 670-5079	$2y$04$V.awI8k.MaBiAUFZS96hn.eSc25RMNyQ.IXyprBriKMtROwX3.pxu	t	2022-06-14 22:21:56	2022-06-14 22:21:56
152	Loma	Paucek	adrienne77@mraz.com	(551) 735-2582	$2y$04$T12c4orFld9m5tX3M9mcQOxw3M334YtmBJzzurAQwUXf5Wu2f8e0q	t	2022-06-14 22:21:56	2022-06-14 22:21:56
153	Emmett	Krajcik	bartoletti.trenton@gmail.com	(931) 256-3474	$2y$04$gHl.9JDRanTrnpAXaTUJGuaQedrpvOqG6r9wuELoNYlqa6L90xyHS	t	2022-06-14 22:21:56	2022-06-14 22:21:56
154	Jon	Grant	nharber@yahoo.com	+13478094418	$2y$04$w58dXMbT.hNpRbFr0VieueNRsqXufuyURenUj.kEHs1vIjsXJYS7a	t	2022-06-14 22:21:56	2022-06-14 22:21:56
155	Amya	Luettgen	arnold13@yahoo.com	+1-757-814-7053	$2y$04$0WRZsyEyLizefmawxNeVwOgwcnyOrOGpZh.pbywimLrTzD1qm29Pe	t	2022-06-14 22:21:56	2022-06-14 22:21:56
156	Lois	Braun	pablo57@sauer.biz	+1.540.279.2312	$2y$04$ai5AnuSaszug5DdfdaJYhO1l6trf0tDd/6Oiy9tC3aHDbGQtjniFi	t	2022-06-14 22:21:56	2022-06-14 22:21:56
157	Opal	Franecki	keira.rowe@koelpin.com	628.977.8718	$2y$04$WiNnvuLPDtVyELSQnTpi1.IhIYJ.nlWXgScRgNyA9/aX6jDOtaFHS	t	2022-06-14 22:21:56	2022-06-14 22:21:56
158	Willa	Moore	zola.abshire@klocko.com	1-248-633-7038	$2y$04$gB/4E2b36vvJBWVraXBtrOy9l7TfSWoka4dD4cCs/hU./mmXjcrpS	t	2022-06-14 22:21:56	2022-06-14 22:21:56
159	Clovis	Koss	kutch.orie@boyle.org	+1-838-840-8882	$2y$04$GI5fv2ohK2DIJV977w9L8u1aLSxRW5hlep1iLQX8.mYJdVdspKoV2	t	2022-06-14 22:21:56	2022-06-14 22:21:56
160	Erik	Bartell	haleigh96@aufderhar.info	+1.336.297.9338	$2y$04$C1v7JEULc/ovzBKBzVm24uWrErPjebY9lxId4BDo9UcHjn/5CzugW	t	2022-06-14 22:21:56	2022-06-14 22:21:56
161	Jamir	Rohan	vwolff@hotmail.com	206-656-4643	$2y$04$mRxxUNIXGIv006oVVtJG4emmq5XMQBtbSo.LtTsdJduDf/Oko.P8O	t	2022-06-14 22:21:57	2022-06-14 22:21:57
162	Caesar	Weimann	vschmidt@stark.biz	854.822.7898	$2y$04$dy/mcWIe2m.w2g4/4i04aulnTZ1tE2/GcPgr3Ewg0FYCGXXIiPxh.	t	2022-06-14 22:21:57	2022-06-14 22:21:57
163	Steve	Corkery	jazmin60@gmail.com	(610) 378-4270	$2y$04$HbcEgNQVIOLkyVr5Z8xLHOUnmRtsprzPgk7OaVbul8VOLu24BAtby	t	2022-06-14 22:21:57	2022-06-14 22:21:57
164	Dexter	Prosacco	aspinka@yahoo.com	248.442.2717	$2y$04$.hleN3EuZINxJaToXFKQsOTenOAGXZ1vUhA03bH5vf1JKBDOuuPZG	t	2022-06-14 22:21:57	2022-06-14 22:21:57
165	Вероника	Лукянко	Dnцуаw@gmail.com	+3832953204	$2y$04$e8A0VwHYTRoDU.JO.5GqluiWZ0IEcM/mG06xy.cK9ajVVeQiu3aEG	f	2022-06-14 22:21:57	2022-06-14 22:21:57
166	Salvador	Wiegand	omaggio@hotmail.com	630.220.7398	$2y$04$.tnQ2v7dqLCtOv62gVJ/v.mU62h909vo0gV3qeaTk8SCi8SSLDZRO	t	2022-06-14 22:21:57	2022-06-14 22:21:57
167	Ernestina	Bartell	treutel.arielle@hotmail.com	+14585335956	$2y$04$lG8Hh4ieNrOqRMGS/N3L4e9bVC1QoBN9A7YrkMv6x0Zd5kK7tiHAu	t	2022-06-14 22:21:57	2022-06-14 22:21:57
168	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$docSF21k5qcZC.2BxNOLFO3g6D7/3bBTfRv1TdZo2ruHYwWn8i6ji	t	2022-06-14 22:21:57	2022-06-14 22:21:57
169	Rashawn	Haag	delaney.eichmann@feest.com	+1-520-463-5320	$2y$04$wx760GjC.fWRNCkm6whV1eWt10oGhhpCyGVaim2mBWyHhHthKUGW6	t	2022-06-14 22:21:57	2022-06-14 22:21:57
170	Coty	Stoltenberg	xdeckow@murray.com	609.915.6055	$2y$04$noEYHYRPE6AUYGcKi/2AlOnlwYTljQwEHed5L1fa/dzXx8ZzgFikm	t	2022-06-14 22:23:09	2022-06-14 22:23:09
171	Fermin	Kilback	june.schumm@gmail.com	+1 (832) 979-0784	$2y$04$tpROrJE.nYtzSKvEXGkZ0uViORxdTOJbVswgN71iQLdKbSH0Gi8aa	t	2022-06-14 22:23:09	2022-06-14 22:23:09
172	Tierra	Berge	ceichmann@bins.info	646-302-8981	$2y$04$bdS2peQF.LGfIfOJkck7DevSYBNLKzatGoKvg0uZnPoJM.8buQBka	t	2022-06-14 22:23:10	2022-06-14 22:23:10
173	Sandy	Harber	wilderman.lloyd@gibson.com	+1-313-425-6767	$2y$04$m89iRyInt29UCCtkUIdzUO7ixzhsfzUaKTVdg8s.7kVxItqo5vZYm	t	2022-06-14 22:23:10	2022-06-14 22:23:10
174	Deanna	Cassin	kirsten70@nolan.com	1-484-592-5807	$2y$04$MAxXOErwbxjtufGWmf2fh.cJpNFCdS53b2RPQLOtO9FsSRQ/Kstge	t	2022-06-14 22:23:10	2022-06-14 22:23:10
175	Rosemarie	Schultz	rath.deontae@yahoo.com	747-320-4737	$2y$04$bZRpWWYYY.QMxLNe55kAzOhN3O45e1zSyaRrEOdX1oDqsMn8Dd9U2	t	2022-06-14 22:23:10	2022-06-14 22:23:10
176	Carmella	Legros	simonis.moriah@hotmail.com	+1-820-975-1010	$2y$04$wdBEOpQchRFPnhowdHUA9.zSbBIb9rLc0dr9GleETqaGaLQFilp3W	t	2022-06-14 22:23:10	2022-06-14 22:23:10
177	Della	Lesch	ettie63@gmail.com	+13858395933	$2y$04$/RBEYa39qjVJyUXUG0plb.OxWusIbZ53Gf5u4cFF0QD/IehjOpgtq	t	2022-06-14 22:23:10	2022-06-14 22:23:10
178	Monica	Shields	alivia45@hotmail.com	+1-352-408-1148	$2y$04$ITWvZAFGgn1SkEqkt6PckuqeQRLrlAKM9sHl26p.wjYdsAJ4lQ/lW	t	2022-06-14 22:23:10	2022-06-14 22:23:10
179	Amparo	Lehner	rturcotte@hotmail.com	+18067670170	$2y$04$pJg0c73AVHWgFFJh02VShu2pBwzRGKIUOLJ.j3QIN.ueiRLL5mbW.	t	2022-06-14 22:23:10	2022-06-14 22:23:10
180	Scotty	Huel	ignatius.waters@emmerich.com	(854) 508-9142	$2y$04$EjaGTOspgi4Z78CcjN/Ll.a9RVVwd2WWCTYcLlL3p23Qg7R8Q4yZm	t	2022-06-14 22:23:10	2022-06-14 22:23:10
181	Juston	O'Hara	ufeil@corkery.info	+1-424-208-1947	$2y$04$/Rs/p5LnmEEIGd3677QOUO/gcFr74UbXL6nX9R.BWNoHdNBR0XqYO	t	2022-06-14 22:23:10	2022-06-14 22:23:10
182	Marisol	Dach	jordane33@yahoo.com	+1-931-892-6178	$2y$04$SKQ0PFJLKCHD4q.3tjOIZ.K9cdN/Pr2mPcLOx7W800anQP6hkrkju	t	2022-06-14 22:23:10	2022-06-14 22:23:10
183	Fay	Roberts	vance53@johns.com	+1-760-960-8100	$2y$04$6yYkMecrunvMIFFOa/pvBug8Ee6NxBnnmZOJdPzLSOsubfeDyLeZe	t	2022-06-14 22:23:10	2022-06-14 22:23:10
184	Hiram	Bahringer	alessia84@yahoo.com	1-424-694-6648	$2y$04$FgODhUDy6R4JvoIdIOQo.uO06ED1x2/gzUZDpU32CUzvh/5mJgAkW	t	2022-06-14 22:23:10	2022-06-14 22:23:10
185	Sylvester	Collier	purdy.godfrey@gmail.com	(317) 548-2458	$2y$04$lETN67Fef3MT4xVNN1VALOHO/cncUd7ipRjHtBz5FFLeWLbDoR9ii	t	2022-06-14 22:23:10	2022-06-14 22:23:10
186	Zaria	Ferry	lorna34@yahoo.com	1-470-629-7465	$2y$04$.91nWmiKAvIDehngBknT9O28bCaT1nJmkS53b2qLROipI9wWRaPPy	t	2022-06-14 22:23:10	2022-06-14 22:23:10
187	Maegan	Rice	madge68@hotmail.com	843.680.5946	$2y$04$O.lKqoE4vqw2r2wSY7/./Oz1.vexUpEUW5NFCrrrMXJJMEtttii76	t	2022-06-14 22:23:10	2022-06-14 22:23:10
188	Howard	Ullrich	connie.schuppe@weber.org	1-425-817-4331	$2y$04$m7p2rZVHu109hb3qrX2lU.W52PpBEEirORqiFlj4F/zWxtRGorHyy	t	2022-06-14 22:23:10	2022-06-14 22:23:10
189	Julianne	Brekke	zgoldner@yahoo.com	(484) 737-1212	$2y$04$aNvOfDvZ/gPqgFCkCf8QMOEzNutd6Bd4EPmteqNhrhlh.LuRvY9iG	t	2022-06-14 22:23:11	2022-06-14 22:23:11
190	Mark	Little	buford32@gmail.com	(747) 579-9660	$2y$04$iyc3WYIYQdYeQ.aWSwZvzOKhCVboKKVLxE9rEmNcmmcJjtkzsTxOW	t	2022-06-14 22:23:11	2022-06-14 22:23:11
191	Norval	Tromp	aurore.leffler@gmail.com	+1 (432) 985-9561	$2y$04$sEooD/Kc.B3RhVeY0Qj8uundl9o3mDV.628qBHcvUjq8PUV.3Toym	t	2022-06-14 22:23:11	2022-06-14 22:23:11
192	Margie	Waelchi	ezekiel81@gmail.com	570-571-1057	$2y$04$9AfuN.RZyeGBxNanlfXXQ.vfE.U5SXjwO.Dfm2szsFe4BPJql/M/O	t	2022-06-14 22:23:11	2022-06-14 22:23:11
193	Stone	Hintz	ashton43@yahoo.com	1-281-973-5479	$2y$04$U81.Zm1OI0kfjB7QqFGLeePpiYe5Me/VW2G48u.PiiVXMFWUjWqdW	t	2022-06-14 22:23:11	2022-06-14 22:23:11
194	Jadyn	Gusikowski	dallin.jerde@simonis.org	+1.520.210.7628	$2y$04$RTSUFONxXg5akvdO1kZi0u2GpAUkBSTipLkKWMwZG9Ll5JvNJsqyy	t	2022-06-14 22:23:11	2022-06-14 22:23:11
195	Broderick	Wunsch	darius.beier@yahoo.com	(937) 279-6268	$2y$04$rGBplavOHVipoEpTJkLNuuZBexkWJ4MT1.E1.m4Bs/ng8e.tGGCh.	t	2022-06-14 22:23:11	2022-06-14 22:23:11
196	Elouise	Langosh	jrempel@harber.com	(318) 708-2354	$2y$04$t4.57.w0a.a9uTi3xVhLgOm0KLP.w8VOdyv9/7ZfZpVkbOX6X80Vu	t	2022-06-14 22:23:11	2022-06-14 22:23:11
197	Donald	Jakubowski	kurtis.strosin@stanton.com	+1-272-755-8270	$2y$04$W7klknWf00nKewWUmP/JEOD4Z6BIRo5/GyhieIRD1eTac5jKNg4Oa	t	2022-06-14 22:23:11	2022-06-14 22:23:11
198	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$c.7M2WR5XqzVXNzxai1ckemEZIkjoA9zkVxjX6qH8Mi.6pS4TbWVS	t	2022-06-14 22:23:12	2022-06-14 22:23:12
199	Jett	Bergnaum	medhurst.zelda@gmail.com	726-668-3907	$2y$04$snNPjqpaiCqSHa25H8peou5aQp9z2/3jku1iLdId42nWhJxKp5NFS	t	2022-06-14 22:23:12	2022-06-14 22:23:12
200	Brigitte	Ortiz	josh.leuschke@durgan.com	+1-959-618-5716	$2y$04$KWnRCIHIm2kOpsfnv6s2H.j/ouwFLCHfp.Dfu2RrLr/C5sV8RWQYG	t	2022-06-14 22:24:32	2022-06-14 22:24:32
201	Sofia	Schiller	bpouros@schuster.org	848-440-6324	$2y$04$67Qx0QsdUSzVovQ4cPE1z.1gTMtxaMKB1u.2ku.JZA.e6X48EzywC	t	2022-06-14 22:24:32	2022-06-14 22:24:32
202	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$0xCR88/FQ4AnsI9cps3tb.m6DwVWW6Rf4hXUHJSkByA5cKrplD9VO	t	2022-06-14 22:24:32	2022-06-14 22:24:32
203	Nicola	Ruecker	morar.ismael@gmail.com	310.638.5633	$2y$04$SkAqA5jdFTnhZzobJ4nGnuSsXBO5B5fxCl92RxJpgdk1N5rVekTZ2	t	2022-06-14 22:24:32	2022-06-14 22:24:32
204	Вероника	Лукянко	Dnцwefwefуаw@gmail.com	+3832953204	$2y$04$dA2tATLNoucWtzETTwF/Ou2.3BVWpjVFJnNgdcj9LXZCxIao9aoBS	f	2022-06-14 22:24:45	2022-06-14 22:24:45
205	Karine	Bergstrom	hillary91@hotmail.com	+12198340395	$2y$04$2pULs6fIpl9z4FlLhOW/ve5lIGLGYDqoQUPJop8kJA03.Q6eRm6S6	t	2022-06-14 22:24:45	2022-06-14 22:24:45
206	Kelley	Blick	adolphus74@yahoo.com	850.435.7690	$2y$04$UWlD/nahLbGoexLt6IVpVuVRt50Qo0jbpYp6HFVkW8ZG34UnwSEZu	t	2022-06-14 22:24:45	2022-06-14 22:24:45
207	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$.huWhHEz9IX0zENg2RiFX.F0pccsqGQBbmSX.UxUKfv8TVlIzh4/a	t	2022-06-14 22:24:45	2022-06-14 22:24:45
208	Samanta	Leffler	eskiles@hotmail.com	(205) 378-7950	$2y$04$xrzMXCNpJpDuLIJ5mZuvqOpiaksU4CqbgBc.f709VPK3J.EUXg4F6	t	2022-06-14 22:24:45	2022-06-14 22:24:45
209	Avis	Bahringer	ipaucek@mckenzie.com	(847) 380-9827	$2y$04$KqD9OEV6SrWkfyI3L5pXPeibgcxtmfvilXB3a6bt6BvXwyh3H3xiS	t	2022-06-14 22:25:42	2022-06-14 22:25:42
210	Reese	Brown	zbode@gmail.com	567-929-5065	$2y$04$Bcp59rI2JPYu2b3P76f8juFj9/0u6xVAVjGEBd0.HCvO2ex1w7xeO	t	2022-06-14 22:25:42	2022-06-14 22:25:42
211	Elmer	Fahey	kmarvin@sporer.com	+16783262966	$2y$04$eoWzzGzX2xD9lkXqyHA9AOd5SJ4F7A1yGhF.W1qiodTgiPfjtdUlG	t	2022-06-14 22:25:59	2022-06-14 22:25:59
212	Lamont	Legros	hazel.wisozk@hotmail.com	1-484-874-9819	$2y$04$.IB4qKqCYTSXU5bEXYzcdOKcZm4.t5u.BOP79usyWC8Q6f8g.nsUq	t	2022-06-14 22:27:19	2022-06-14 22:27:19
213	Danika	Turner	madisyn84@yahoo.com	+1-475-485-6691	$2y$04$fYHhQLCPgHaOc7zqXIOqJ.hDBOTkFBUF8BCFR2bhVGeMt.myGv.WG	t	2022-06-14 22:30:00	2022-06-14 22:30:00
214	Syble	O'Connell	brayan14@kunze.com	240.722.3293	$2y$04$jivR/emAW72MdRLyas4tm.dNM9RsZ74NKybtd.f7ljSoaeU6BNST6	t	2022-06-14 22:30:09	2022-06-14 22:30:09
215	Dedrick	Wisozk	lottie.kulas@pouros.com	(954) 385-7147	$2y$04$iTneIPZgZAYQFtii.BSNBe0uu5Pz/hNd0YK9TJFBuBSUCYDrHKYiu	t	2022-06-15 08:23:44	2022-06-15 08:23:44
216	Adelia	Moen	callie99@haag.com	+1.820.299.7394	$2y$04$8I5LtybUEqcZRB6YI76pZOHQmheIrpYPUqWwy9QLD.RAPeUnnpD7m	t	2022-06-15 08:23:44	2022-06-15 08:23:44
217	efwijefw	wefwjeif	ardadwe@gmail.com	+380958305593	$2y$04$UVEtXjYLrFc8tj6et4Uo6.h27maB.QTKx9mKb0rc0Ai.dJoygsQ42	t	2022-06-15 08:23:44	2022-06-15 08:23:44
218	Armando	Smitham	heathcote.lexie@gmail.com	+1.678.964.2683	$2y$04$SOR2UBh75VKGfFtEq5f4.uAh4/dXUZr7uvs4XS50wUcLb3ez9h39W	t	2022-06-15 08:23:44	2022-06-15 08:23:44
219	Fiona	Heller	rene16@purdy.com	+1.463.560.1210	$2y$04$dQ4cEBIEI6DI/wO3TbrGGOdcjO.2ioH/D0KMh9PpgvDbh8ym0kXUa	t	2022-06-15 08:23:45	2022-06-15 08:23:45
220	Вероника	Лукянко	Dnfwefуаw@gmail.com	+3832953204	$2y$04$KwBV1Jyw0iaSnrLQB7LjGOGIgNndzV4TnoutwpfHhDDw3fdF8giG6	f	2022-06-15 08:30:01	2022-06-15 08:30:01
221	Jett	Hill	sigmund.ritchie@gmail.com	1-934-497-6877	$2y$04$8HuyIbGaTjFFKa5QMuWwC.G4AsTrBMFsDMlmefiS9C21n5z67SKdS	t	2022-06-15 08:30:51	2022-06-15 08:30:51
222	Tristin	Ortiz	mhudson@gmail.com	(575) 207-7272	$2y$04$NCXtMYIXwx1q8O9LWoD.pORKNxL1Jjb3SvXQABMUDXdny.kuOWYTC	t	2022-06-15 08:31:08	2022-06-15 08:31:08
223	Paul	Feest	toy.elsa@wehner.com	714-329-4555	$2y$04$aIqM6XG0ob6zBvaF7bkB2eXEPQKmLgMeJKggOoOwUK5OrXRHWp/6G	t	2022-06-15 08:31:30	2022-06-15 08:31:30
224	Milton	Balistreri	xstroman@hotmail.com	+1 (206) 372-4975	$2y$04$JKTV1qBrStHLGM56VfqChOAKU0iuO5AEoI5/7CJvnu4L6Sf9/cqyW	t	2022-06-15 08:32:37	2022-06-15 08:32:37
225	Micah	Wilkinson	kaitlin.willms@schiller.com	1-360-905-0687	$2y$04$y8v9/q.n20m3MW/wTlB2LupGXtfAXrpBeF4LMMy2dvCVfRdIVJ6ca	t	2022-06-15 08:33:17	2022-06-15 08:33:17
226	Ransom	Bartell	fwisoky@yahoo.com	(646) 905-9460	$2y$04$k6GuOsCW/Sq.SUlgEqizbeLZlTahnag39dzPx6SQbLmHxhfKoDR0i	t	2022-06-15 08:33:43	2022-06-15 08:33:43
227	Nora	Pfeffer	hflatley@yahoo.com	+1.435.774.9202	$2y$04$qh79j2TLxzvnsSyLLuZ8aeRsY70wwyo1d.Rai4AW6V5i0P5nLNt4C	t	2022-06-15 08:35:38	2022-06-15 08:35:38
228	Darrel	Swaniawski	mohara@huel.com	424.398.9543	$2y$04$AfyZxPM3xrBQIH2VTRvlNOxyttTcKblwwQveW0FrUFynJthTW6g0e	t	2022-06-15 08:35:57	2022-06-15 08:35:57
229	Geovany	Ferry	smann@gusikowski.info	(346) 817-0065	$2y$04$l4PgE3FsdC86sMjxsQHu0uAFC2pxv8qPPISpbSHybiQYnvQpCtgWi	t	2022-06-15 08:36:25	2022-06-15 08:36:25
230	Kimberly	Lehner	allie60@yahoo.com	313.532.8802	$2y$04$uZzyRqDSg6qCtkz51V1x1uyEgBEfzTqeEUpgNhfewGa5gCNy808.C	t	2022-06-15 08:36:45	2022-06-15 08:36:45
231	Davon	Robel	dherzog@gmail.com	+12344910218	$2y$04$joN/tH3aAaaMWvgNb2FoIegMLjtJ1114qZNdlWj4O3PDEoM.Wbt7a	t	2022-06-15 08:37:14	2022-06-15 08:37:14
232	Zola	Hoppe	yanderson@bogisich.com	1-361-816-4834	$2y$04$fQkBakS2aMZWTKRyV/J9RuwT2ojYdDDCY2.K/20GWzrFl1IlHBZEi	t	2022-06-15 08:37:34	2022-06-15 08:37:34
233	Keith	Lubowitz	adrienne82@bartoletti.com	(443) 758-0732	$2y$04$oCvA.NSuGJUYFrW0nnWbj.ifGzVJ/Zs0FHiLVhZ5J82WaiS9VxBky	t	2022-06-15 08:38:12	2022-06-15 08:38:12
234	Alexandria	Johns	mozell44@gmail.com	+1 (585) 473-4244	$2y$04$p4e4Z5qu8gPzAorYUgoeJu25PQB9U7SUJuYZX0gfTrzphgPvI5Xii	t	2022-06-15 08:38:31	2022-06-15 08:38:31
235	Sigmund	Stiedemann	block.brent@gmail.com	564.380.6114	$2y$04$FdXp7bHqU67.VyiCAbKNsOgdlpgVRTF0TeKzjv/9emIPGa24hYvrS	t	2022-06-15 08:38:57	2022-06-15 08:38:57
236	Leola	Monahan	lorenzo.donnelly@tremblay.biz	+1.484.617.0911	$2y$04$eZbUf6xD4gOrPCtCjtx5TuW7nRmEUqnyfYJrYRk4AJnmKEbj56f9q	t	2022-06-15 08:39:04	2022-06-15 08:39:04
237	Xzavier	Kling	thalia.goodwin@gmail.com	270.503.6606	$2y$04$ats70Xfa53YNkh.OfRtxnegfwAoamx7a2K37LAcx01XZ2qx2uFLri	t	2022-06-15 08:39:32	2022-06-15 08:39:32
238	Tristin	Howell	christiansen.melvina@gmail.com	872.489.5906	$2y$04$b6sFNx50j.W3U/dxj1zjMuF/b8BSNIIuY6RW7FKn4JggeWdY1WqDq	t	2022-06-15 08:40:03	2022-06-15 08:40:03
239	Gina	Lueilwitz	charles.murphy@gmail.com	385-770-9954	$2y$04$LY2NqBHwr020MVW/Nwqj6.cCv7NF5T.EyGdq0H3g6RzPtDZCbbNLe	t	2022-06-15 08:40:22	2022-06-15 08:40:22
\.


--
-- Data for Name: users_shelters; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_shelters (id, user_id, shelter_id) FROM stdin;
2	3	29
15	2	44
\.


--
-- Name: animals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.animals_id_seq', 83, true);


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.announcements_id_seq', 17, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 560, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 280, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: shelters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shelters_id_seq', 74, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 239, true);


--
-- Name: users_shelters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_shelters_id_seq', 17, true);


--
-- Name: animals animals_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY (id);


--
-- Name: announcements announcements_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_auth_codes oauth_auth_codes_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_auth_codes
    ADD CONSTRAINT oauth_auth_codes_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_personal_access_clients oauth_personal_access_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_personal_access_clients
    ADD CONSTRAINT oauth_personal_access_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_refresh_tokens oauth_refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.oauth_refresh_tokens
    ADD CONSTRAINT oauth_refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: shelters shelters_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.shelters
    ADD CONSTRAINT shelters_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_shelters users_shelters_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_shelters
    ADD CONSTRAINT users_shelters_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth_access_tokens_user_id_index ON public.oauth_access_tokens USING btree (user_id);


--
-- Name: oauth_auth_codes_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth_auth_codes_user_id_index ON public.oauth_auth_codes USING btree (user_id);


--
-- Name: oauth_clients_user_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth_clients_user_id_index ON public.oauth_clients USING btree (user_id);


--
-- Name: oauth_refresh_tokens_access_token_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX oauth_refresh_tokens_access_token_id_index ON public.oauth_refresh_tokens USING btree (access_token_id);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: animals animals_booked_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_booked_user_id_foreign FOREIGN KEY (booked_user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: animals animals_shelter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_shelter_id_foreign FOREIGN KEY (shelter_id) REFERENCES public.shelters(id) ON DELETE CASCADE;


--
-- Name: announcements announcements_shelter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.announcements
    ADD CONSTRAINT announcements_shelter_id_foreign FOREIGN KEY (shelter_id) REFERENCES public.shelters(id) ON DELETE CASCADE;


--
-- Name: users_shelters users_shelters_shelter_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_shelters
    ADD CONSTRAINT users_shelters_shelter_id_foreign FOREIGN KEY (shelter_id) REFERENCES public.shelters(id) ON DELETE CASCADE;


--
-- Name: users_shelters users_shelters_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_shelters
    ADD CONSTRAINT users_shelters_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

--
-- Database "shelter_helper_test" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

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
-- Name: shelter_helper_test; Type: DATABASE; Schema: -; Owner: root
--

CREATE DATABASE shelter_helper_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE shelter_helper_test OWNER TO root;

\connect shelter_helper_test

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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

