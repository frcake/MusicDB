--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.6
-- Dumped by pg_dump version 9.5.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: albums; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE albums (
    id bigint NOT NULL,
    name character varying,
    release_date date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    artist_id bigint,
    band_id bigint
);


ALTER TABLE albums OWNER TO frcake;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE albums_id_seq OWNER TO frcake;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE albums_id_seq OWNED BY albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO frcake;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE artists (
    id bigint NOT NULL,
    country character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint,
    name character varying
);


ALTER TABLE artists OWNER TO frcake;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artists_id_seq OWNER TO frcake;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: bandmembers; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE bandmembers (
    id bigint NOT NULL,
    band_id bigint,
    artist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bandmembers OWNER TO frcake;

--
-- Name: bandmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE bandmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bandmembers_id_seq OWNER TO frcake;

--
-- Name: bandmembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE bandmembers_id_seq OWNED BY bandmembers.id;


--
-- Name: bands; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE bands (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE bands OWNER TO frcake;

--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE bands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bands_id_seq OWNER TO frcake;

--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE bands_id_seq OWNED BY bands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE categories (
    id bigint NOT NULL,
    name character varying,
    parent_id integer,
    lft integer NOT NULL,
    rgt integer NOT NULL,
    depth integer DEFAULT 0 NOT NULL,
    children_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE categories OWNER TO frcake;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO frcake;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE photos (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image_file_name character varying,
    image_content_type character varying,
    image_file_size integer,
    image_updated_at timestamp without time zone,
    imageable_type character varying,
    imageable_id bigint
);


ALTER TABLE photos OWNER TO frcake;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_seq OWNER TO frcake;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO frcake;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE songs (
    id bigint NOT NULL,
    name character varying,
    artist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE songs OWNER TO frcake;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE songs_id_seq OWNER TO frcake;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE songs_id_seq OWNED BY songs.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE tracks (
    id bigint NOT NULL,
    album_id bigint,
    song_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tracks OWNER TO frcake;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tracks_id_seq OWNER TO frcake;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE tracks_id_seq OWNED BY tracks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE users (
    id bigint NOT NULL,
    username character varying,
    email character varying,
    is_admin boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying DEFAULT ''::character varying NOT NULL,
    password_confirmation character varying DEFAULT ''::character varying NOT NULL,
    remember_digest character varying,
    remember_token character varying
);


ALTER TABLE users OWNER TO frcake;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO frcake;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums ALTER COLUMN id SET DEFAULT nextval('albums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY bandmembers ALTER COLUMN id SET DEFAULT nextval('bandmembers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY bands ALTER COLUMN id SET DEFAULT nextval('bands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY songs ALTER COLUMN id SET DEFAULT nextval('songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY tracks ALTER COLUMN id SET DEFAULT nextval('tracks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY albums (id, name, release_date, created_at, updated_at, category_id, artist_id, band_id) FROM stdin;
8	Spine of God	2017-07-06	2017-06-12 13:25:35.250576	2017-06-12 15:24:24.088062	4	\N	26
7	Welcome to the Sky Valley	2017-10-06	2017-06-12 13:25:18.571559	2017-06-12 15:24:35.418148	4	\N	25
9	Busse Woods	2017-01-06	2017-06-12 15:38:59.86417	2017-06-12 15:38:59.86417	4	\N	27
10	The Action is Go!	2017-07-06	2017-06-12 23:32:45.437284	2017-06-12 23:33:21.287616	4	\N	29
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('albums_id_seq', 10, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-05-25 19:10:21.149403	2017-05-25 19:10:21.149403
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY artists (id, country, description, created_at, updated_at, category_id, name) FROM stdin;
6	USA	Frontwoman of the stoner metal band Acid King	2017-06-12 18:17:17.851761	2017-06-12 18:17:17.851761	4	Lori S
7	USa		2017-06-12 18:18:40.125193	2017-06-12 18:18:40.125193	4	Joey Osbourne
8	USA		2017-06-12 18:18:53.479562	2017-06-12 18:18:53.479562	4	Mark Lamb
9	USA	Joshua Michael Homme is an American singer, songwriter, musician, record producer, and actor	2017-06-12 18:19:58.911078	2017-06-12 18:19:58.911078	4	Josh Homme
10	USA	John Garcia is a vocalist and songwriter. Garcia is best known as the vocalist and founding member of Kyuss	2017-06-12 18:20:27.461896	2017-06-12 18:20:27.461896	4	John Garcia
11	USA	Brant Bjork (born March 19, 1973) is an American musician, singer, songwriter, multi-instrumentalist, and producer from Palm Desert, California. He is perhaps best known as the drummer and founder of the influential Californian stoner rock band Kyuss.	2017-06-12 18:21:02.829996	2017-06-12 18:21:02.829996	4	Brant Bjork
12	USA	Kyuss Bass player	2017-06-12 18:22:10.428881	2017-06-12 18:22:10.428881	4	Chris Cockrell
13	USA		2017-06-12 18:22:40.92485	2017-06-12 18:22:40.92485	4	Dave Wyndorf
14	usa		2017-06-12 18:22:49.906007	2017-06-12 18:22:49.906007	4	Garrett Sweeny
15	USA		2017-06-12 18:23:00.830874	2017-06-12 18:23:00.830874	4	Phil Caivano
16	USA		2017-06-12 18:23:15.801759	2017-06-12 18:23:15.801759	4	Bob Pantella
17	USA		2017-06-12 18:23:27.620389	2017-06-12 18:23:27.620389	4	Chris Kosnik
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('artists_id_seq', 17, true);


--
-- Data for Name: bandmembers; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY bandmembers (id, band_id, artist_id, created_at, updated_at) FROM stdin;
75	25	9	2017-06-12 18:23:53.261132	2017-06-12 18:23:53.261132
76	25	10	2017-06-12 18:23:53.270677	2017-06-12 18:23:53.270677
77	25	11	2017-06-12 18:23:53.277472	2017-06-12 18:23:53.277472
78	25	12	2017-06-12 18:23:53.283693	2017-06-12 18:23:53.283693
79	26	13	2017-06-12 18:24:49.630509	2017-06-12 18:24:49.630509
80	26	14	2017-06-12 18:24:49.645744	2017-06-12 18:24:49.645744
81	26	15	2017-06-12 18:24:49.652285	2017-06-12 18:24:49.652285
82	26	16	2017-06-12 18:24:49.660845	2017-06-12 18:24:49.660845
83	26	17	2017-06-12 18:24:49.668521	2017-06-12 18:24:49.668521
84	27	6	2017-06-12 18:25:36.029843	2017-06-12 18:25:36.029843
85	27	7	2017-06-12 18:25:36.038129	2017-06-12 18:25:36.038129
86	27	8	2017-06-12 18:25:36.04512	2017-06-12 18:25:36.04512
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bandmembers_id_seq', 86, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
25	Kyuss	\N	2017-06-12 15:23:56.757865	2017-06-12 15:23:56.757865	4
26	Monster Magnet	\N	2017-06-12 15:24:08.688664	2017-06-12 15:24:08.688664	4
27	Acid King	\N	2017-06-12 15:38:32.43529	2017-06-12 15:38:32.43529	4
28	Metallica	\N	2017-06-12 23:23:07.595399	2017-06-12 23:23:07.595399	3
29	Fu Manchu	\N	2017-06-12 23:30:17.288959	2017-06-12 23:30:17.288959	4
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bands_id_seq', 29, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY categories (id, name, parent_id, lft, rgt, depth, children_count) FROM stdin;
1	Rock	\N	1	6	0	0
2	Hip Hop	\N	7	8	0	0
3	Hard Rock	1	2	5	1	0
4	Stoner Rock	3	3	4	2	0
5	Dance	\N	9	14	0	0
6	IDM	5	10	13	1	0
7	Experimental	6	11	12	2	0
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('categories_id_seq', 7, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY photos (id, created_at, updated_at, image_file_name, image_content_type, image_file_size, image_updated_at, imageable_type, imageable_id) FROM stdin;
1	2017-05-27 19:15:29.473043	2017-05-27 19:15:29.473043	\N	\N	\N	\N	\N	\N
2	2017-05-27 19:31:02.053994	2017-05-27 19:31:02.053994	71-TTnp18dL._SL1500_.jpg	image/jpeg	238649	2017-05-27 19:31:01.741608	\N	\N
3	2017-05-30 02:09:52.265085	2017-05-30 02:09:52.265085	71-TTnp18dL._SL1500_.jpg	image/jpeg	238649	2017-05-30 02:09:51.959552	Album	3
27	2017-06-12 12:53:11.783774	2017-06-12 12:53:11.783774	\N	\N	\N	\N	Album	4
33	2017-06-12 15:23:24.687761	2017-06-12 15:23:24.687761	Kyuss_Welcome_to_Sky_Valley.jpg	image/jpeg	38277	2017-06-12 15:23:24.573522	Album	7
34	2017-06-12 15:23:42.426999	2017-06-12 15:23:42.426999	Monster_Magnet_-_Spine_of_God.jpg	image/jpeg	297773	2017-06-12 15:23:42.273646	Album	8
35	2017-06-12 15:23:56.785275	2017-06-12 15:23:56.785275	\N	\N	\N	\N	Band	25
36	2017-06-12 15:24:08.709436	2017-06-12 15:24:08.709436	\N	\N	\N	\N	Band	26
37	2017-06-12 15:38:32.472898	2017-06-12 15:38:32.472898	\N	\N	\N	\N	Band	27
38	2017-06-12 15:39:00.132603	2017-06-12 15:39:00.132603	busse_woods.jpg	image/jpeg	186974	2017-06-12 15:38:59.872816	Album	9
39	2017-06-12 18:17:17.863219	2017-06-12 18:17:17.863219	\N	\N	\N	\N	Artist	6
40	2017-06-12 18:18:40.150078	2017-06-12 18:18:40.150078	\N	\N	\N	\N	Artist	7
41	2017-06-12 18:18:53.495693	2017-06-12 18:18:53.495693	\N	\N	\N	\N	Artist	8
42	2017-06-12 18:19:58.925584	2017-06-12 18:19:58.925584	\N	\N	\N	\N	Artist	9
43	2017-06-12 18:20:27.474719	2017-06-12 18:20:27.474719	\N	\N	\N	\N	Artist	10
44	2017-06-12 18:21:02.839473	2017-06-12 18:21:02.839473	\N	\N	\N	\N	Artist	11
45	2017-06-12 18:22:10.440863	2017-06-12 18:22:10.440863	\N	\N	\N	\N	Artist	12
46	2017-06-12 18:22:40.941399	2017-06-12 18:22:40.941399	\N	\N	\N	\N	Artist	13
47	2017-06-12 18:22:49.915797	2017-06-12 18:22:49.915797	\N	\N	\N	\N	Artist	14
48	2017-06-12 18:23:00.848832	2017-06-12 18:23:00.848832	\N	\N	\N	\N	Artist	15
49	2017-06-12 18:23:15.810435	2017-06-12 18:23:15.810435	\N	\N	\N	\N	Artist	16
50	2017-06-12 18:23:27.634877	2017-06-12 18:23:27.634877	\N	\N	\N	\N	Artist	17
51	2017-06-12 23:23:07.652346	2017-06-12 23:23:07.652346	\N	\N	\N	\N	Band	28
52	2017-06-12 23:30:17.342643	2017-06-12 23:30:17.342643	\N	\N	\N	\N	Band	29
54	2017-06-12 23:32:58.383582	2017-06-12 23:32:58.383582	R-1828233-1249353053.jpeg.jpg	image/jpeg	195161	2017-06-12 23:32:58.102994	Album	10
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('photos_id_seq', 54, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY schema_migrations (version) FROM stdin;
20170524054317
20170524053646
20170524041948
20170524042005
20170524042332
20170524052500
20170524042000
20170524041956
20170525015538
20170524055855
20170524194841
20170524195710
20170524225810
20170529035238
20170529040059
20170529060740
20170529061758
20170529061809
20170529061830
20170530020815
20170530020858
20170601000916
20170601002155
20170601004058
20170612130958
20170612132219
20170612132710
20170612144258
20170612144313
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY songs (id, name, artist_id, created_at, updated_at, category_id) FROM stdin;
8	Gardenia	\N	2017-06-12 18:26:54.794207	2017-06-12 18:26:54.794207	\N
9	Asteroid	\N	2017-06-12 18:27:03.050492	2017-06-12 18:27:03.050492	\N
10	Supa Scoopa and Mighty Scoop	\N	2017-06-12 18:27:16.031429	2017-06-12 18:27:16.031429	\N
11	100°	\N	2017-06-12 18:27:26.011754	2017-06-12 18:27:26.011754	\N
12	Space Cadet	\N	2017-06-12 18:27:34.584066	2017-06-12 18:27:34.584066	\N
13	Demon Cleaner	\N	2017-06-12 18:27:41.754424	2017-06-12 18:27:41.754424	\N
14	Odyssey	\N	2017-06-12 18:27:49.715557	2017-06-12 18:27:49.715557	\N
15	Conan Troutman	\N	2017-06-12 18:27:56.34427	2017-06-12 18:27:56.34427	\N
16	N.O.	\N	2017-06-12 18:28:03.749224	2017-06-12 18:28:03.749224	\N
17	Whitewater	\N	2017-06-12 18:28:10.983364	2017-06-12 18:28:10.983364	\N
18	Electric Machine	\N	2017-06-12 18:28:34.984785	2017-06-12 18:28:34.984785	\N
19	Silent Circle	\N	2017-06-12 18:28:43.543255	2017-06-12 18:28:43.543255	\N
20	Drive Fast, Take Chances	\N	2017-06-12 18:28:55.275	2017-06-12 18:28:55.275	\N
21	39 Lashes	\N	2017-06-12 18:29:03.406449	2017-06-12 18:29:03.406449	\N
22	Carve the 5	\N	2017-06-12 18:29:10.488614	2017-06-12 18:29:10.488614	\N
23	Busse Woods	\N	2017-06-12 18:29:18.582611	2017-06-12 18:29:18.582611	\N
24	Motorhead	\N	2017-06-12 18:29:27.804968	2017-06-12 18:29:27.804968	\N
25	Not Fragile	\N	2017-06-12 18:29:35.184932	2017-06-12 18:29:35.184932	\N
26	Pill Shovel	\N	2017-06-12 18:30:04.501465	2017-06-12 18:30:04.501465	\N
27	Medicine	\N	2017-06-12 18:30:11.576129	2017-06-12 18:30:11.576129	\N
28	Nod Scene	\N	2017-06-12 18:30:18.90654	2017-06-12 18:30:18.90654	\N
29	Black Mastermind	\N	2017-06-12 18:30:26.665361	2017-06-12 18:30:26.665361	\N
30	Zodiac Lung	\N	2017-06-12 18:30:34.969694	2017-06-12 18:30:34.969694	\N
31	Spine of God	\N	2017-06-12 18:30:41.841993	2017-06-12 18:30:41.841993	\N
32	Snake Dance	\N	2017-06-12 18:30:48.998768	2017-06-12 18:30:48.998768	\N
33	Sin's a Good Man's Brother	\N	2017-06-12 18:30:55.892124	2017-06-12 18:30:55.892124	\N
34	Ozium	\N	2017-06-12 18:31:03.798496	2017-06-12 18:31:03.798496	\N
35	Ozium [Demo]	\N	2017-06-12 18:31:20.329205	2017-06-12 18:31:20.329205	\N
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('songs_id_seq', 35, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY tracks (id, album_id, song_id, created_at, updated_at) FROM stdin;
16	7	8	2017-06-12 18:26:54.839012	2017-06-12 18:26:54.839012
17	7	9	2017-06-12 18:27:03.069659	2017-06-12 18:27:03.069659
18	7	10	2017-06-12 18:27:16.045175	2017-06-12 18:27:16.045175
19	7	11	2017-06-12 18:27:26.026827	2017-06-12 18:27:26.026827
20	7	12	2017-06-12 18:27:34.606811	2017-06-12 18:27:34.606811
21	7	13	2017-06-12 18:27:41.766392	2017-06-12 18:27:41.766392
22	7	14	2017-06-12 18:27:49.729938	2017-06-12 18:27:49.729938
23	7	15	2017-06-12 18:27:56.36747	2017-06-12 18:27:56.36747
24	7	16	2017-06-12 18:28:03.776919	2017-06-12 18:28:03.776919
25	7	17	2017-06-12 18:28:11.002894	2017-06-12 18:28:11.002894
26	9	18	2017-06-12 18:28:34.998299	2017-06-12 18:28:34.998299
27	9	19	2017-06-12 18:28:43.553697	2017-06-12 18:28:43.553697
28	9	20	2017-06-12 18:28:55.294328	2017-06-12 18:28:55.294328
29	9	21	2017-06-12 18:29:03.428073	2017-06-12 18:29:03.428073
30	9	22	2017-06-12 18:29:10.501479	2017-06-12 18:29:10.501479
31	9	23	2017-06-12 18:29:18.609115	2017-06-12 18:29:18.609115
32	9	24	2017-06-12 18:29:27.823519	2017-06-12 18:29:27.823519
33	9	25	2017-06-12 18:29:35.19681	2017-06-12 18:29:35.19681
34	8	26	2017-06-12 18:30:04.515572	2017-06-12 18:30:04.515572
35	8	27	2017-06-12 18:30:11.598499	2017-06-12 18:30:11.598499
36	8	28	2017-06-12 18:30:18.928236	2017-06-12 18:30:18.928236
37	8	29	2017-06-12 18:30:26.675892	2017-06-12 18:30:26.675892
38	8	30	2017-06-12 18:30:34.987425	2017-06-12 18:30:34.987425
39	8	31	2017-06-12 18:30:41.85592	2017-06-12 18:30:41.85592
40	8	32	2017-06-12 18:30:49.019396	2017-06-12 18:30:49.019396
41	8	33	2017-06-12 18:30:55.908359	2017-06-12 18:30:55.908359
42	8	34	2017-06-12 18:31:03.811612	2017-06-12 18:31:03.811612
43	8	35	2017-06-12 18:31:20.340652	2017-06-12 18:31:20.340652
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('tracks_id_seq', 43, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY users (id, username, email, is_admin, created_at, updated_at, password_digest, password_confirmation, remember_digest, remember_token) FROM stdin;
1	Michael	asdf@asdf.com	f	2017-05-25 19:18:20.707833	2017-05-25 19:54:14.072387	$2a$10$koix9tl65HE2GG9FbWCLFuF7Lqbjf7k83HOD8smXRncemx2sXz25m		$2a$10$Yn8b.Ig8uBBkkGJco3JJ3.cs.rlp8mVCD1HW1.kOSAFCJjv0.1Khi	PupbxUy5uz8TZVxfW8-fpQ
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: albums_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: bandmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY bandmembers
    ADD CONSTRAINT bandmembers_pkey PRIMARY KEY (id);


--
-- Name: bands_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT bands_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: songs_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_albums_on_artist_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_albums_on_artist_id ON albums USING btree (artist_id);


--
-- Name: index_albums_on_band_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_albums_on_band_id ON albums USING btree (band_id);


--
-- Name: index_albums_on_category_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_albums_on_category_id ON albums USING btree (category_id);


--
-- Name: index_artists_on_category_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_artists_on_category_id ON artists USING btree (category_id);


--
-- Name: index_bandmembers_on_artist_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_bandmembers_on_artist_id ON bandmembers USING btree (artist_id);


--
-- Name: index_bandmembers_on_band_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_bandmembers_on_band_id ON bandmembers USING btree (band_id);


--
-- Name: index_bands_on_category_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_bands_on_category_id ON bands USING btree (category_id);


--
-- Name: index_categories_on_lft; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_lft ON categories USING btree (lft);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_parent_id ON categories USING btree (parent_id);


--
-- Name: index_categories_on_rgt; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_categories_on_rgt ON categories USING btree (rgt);


--
-- Name: index_photos_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_photos_on_imageable_type_and_imageable_id ON photos USING btree (imageable_type, imageable_id);


--
-- Name: index_songs_on_artist_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_songs_on_artist_id ON songs USING btree (artist_id);


--
-- Name: index_songs_on_category_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_songs_on_category_id ON songs USING btree (category_id);


--
-- Name: index_tracks_on_album_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_tracks_on_album_id ON tracks USING btree (album_id);


--
-- Name: index_tracks_on_song_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_tracks_on_song_id ON tracks USING btree (song_id);


--
-- Name: fk_rails_03d41a7dd1; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT fk_rails_03d41a7dd1 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_124a79559a; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_124a79559a FOREIGN KEY (artist_id) REFERENCES artists(id);


--
-- Name: fk_rails_5b5ea4951b; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_5b5ea4951b FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_7a0c27933d; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT fk_rails_7a0c27933d FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_c68ac6eb00; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT fk_rails_c68ac6eb00 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_dd448a2456; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_dd448a2456 FOREIGN KEY (band_id) REFERENCES bands(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

