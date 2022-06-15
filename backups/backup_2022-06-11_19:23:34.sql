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
38	Мурка	Дівчинка	3.jpeg	Кіт	4	2022-05-18 23:52:24	2022-05-18 23:52:20	29	t	Ласкава кішечка дуже хоче стати тобі хорошим другом	2017-02-21	2022-04-11	\N	\N
50	Арчи	Хлопчик	8.jpeg	Пес	7	2022-05-23 15:46:50	2022-06-03 18:18:30	29	f	Дуже добрий, стане гарним охоронцем	2020-08-04	\N	2022-06-25 02:41:00	1
70	Алексa	Хлопчик	11.jpeg	Пес	4	2022-06-03 19:17:01	2022-06-03 19:17:01	29	f	ewfwefwef	2019-06-16	\N	\N	\N
73	Артемида	Дівчинка	4.jpeg	Пес	4	2022-06-03 19:19:23	2022-06-03 19:19:23	29	f	sefwef	2022-06-16	\N	\N	\N
69	Слава	Хлопчик	12.jpeg	Пес	10	2022-06-01 23:03:15	2022-06-05 09:04:38	44	f	Добра та ррайлива соакаа	2021-07-07	\N	2022-06-22 16:04:00	1
75	Тимофей	Хлопчик	10.jpeg	Кіт	6	2022-06-03 19:20:57	2022-06-05 09:07:52	29	t	fqfwq	2022-01-05	\N	2022-06-18 12:10:00	1
46	Барсик	Хлопчик	6.jpg	Кіт	6	2022-05-23 15:42:15	2022-05-23 15:42:15	29	t	Добрый, очень игривый и отлично ладит с другими животными	2019-09-08	\N	\N	\N
56	Снежок	Хлопчик	10.jpeg	Пес	3	2022-05-23 20:52:07	2022-05-23 20:52:07	44	t	Дуже грайливий, шукає дім	2022-05-14	\N	\N	\N
36	Дружок	Хлопчик	1.jpeg	Пес	5	2022-05-18 23:49:17	2022-05-18 23:49:15	29	f	Грайливий Дружок шукає собі новий дім	2021-05-19	\N	\N	\N
37	Анина	Дівчинка	2.jpg	Пес	3	2022-05-18 23:51:04	2022-05-18 23:51:05	29	f	Дуже спокійна і слухняна дівнчина	2020-09-18	\N	\N	\N
39	Алекс	Хлопчик	4.jpg	Кіт	4	2022-05-18 23:53:30	2022-05-18 23:53:36	29	t	Грайливий, весели та дружелюбний	2022-02-09	\N	\N	\N
42	Тимофей	Хлопчик	рыжик.jpeg	Кіт	1	2022-05-23 12:41:54	2022-05-23 12:41:54	29	f	Ласковый котик ищет новый дом	2022-03-01	\N	\N	\N
43	Булочка	Дівчинка	2.jpeg	Кіт	4	2022-05-23 15:30:31	2022-05-23 15:30:31	29	t	Игривая,добрая,милая	2022-03-04	\N	\N	\N
45	Тишка	Хлопчик	4.jpeg	Кіт	4	2022-05-23 15:34:46	2022-05-23 15:34:46	29	t	Спокойный, ласковый	2020-10-02	\N	\N	\N
66	Персик	Хлопчик	12.jpeg	Пес	1	2022-05-23 20:57:10	2022-05-23 20:57:10	44	f	Дуже добрий	2020-12-31	\N	\N	\N
67	іацууц	Дівчинка	4.jpeg	Пес	3	2022-05-23 20:58:37	2022-05-23 20:58:37	44	f	цацйайца	2022-05-06	\N	\N	\N
\.


--
-- Data for Name: announcements; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.announcements (id, topic, description, created_at, updated_at, shelter_id, done) FROM stdin;
3	dishes	wefwef	2022-05-23 21:14:01	2022-05-23 21:14:01	44	2022-05-21
7	medicines	wefwef	2022-05-23 21:14:01	2022-05-23 21:14:01	44	\N
6	food	wefwef	2022-05-23 21:14:01	2022-05-23 21:14:01	44	\N
4	toys	asdasda	2022-03-29 16:15:41	\N	44	\N
8	dishes	cdfc	2022-06-03 19:23:30	2022-06-04 10:07:29	29	2022-06-04
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
\.


--
-- Data for Name: oauth_personal_access_clients; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.oauth_personal_access_clients (id, client_id, created_at, updated_at) FROM stdin;
1	1	2022-05-09 10:48:27	2022-05-09 10:48:27
2	3	2022-05-09 17:34:48	2022-05-09 17:34:48
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
29	Друг человека	вул. Пушкинская 38	+380958306690	navwie@gmail.com	2022-03-17 19:27:59	2022-05-17 19:27:59	Харьков	приют.jpg
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

SELECT pg_catalog.setval('public.animals_id_seq', 75, true);


--
-- Name: announcements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.announcements_id_seq', 8, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.migrations_id_seq', 19, true);


--
-- Name: oauth_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth_clients_id_seq', 4, true);


--
-- Name: oauth_personal_access_clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.oauth_personal_access_clients_id_seq', 2, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- Name: shelters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.shelters_id_seq', 55, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_id_seq', 8, true);


--
-- Name: users_shelters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_shelters_id_seq', 16, true);


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

