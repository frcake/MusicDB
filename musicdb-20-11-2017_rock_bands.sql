--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

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
-- Name: albums; Type: TABLE; Schema: public; Owner: gdev
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


ALTER TABLE albums OWNER TO gdev;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE albums_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE albums_id_seq OWNER TO gdev;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE albums_id_seq OWNED BY albums.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO gdev;

--
-- Name: artists; Type: TABLE; Schema: public; Owner: gdev
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


ALTER TABLE artists OWNER TO gdev;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE artists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE artists_id_seq OWNER TO gdev;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE artists_id_seq OWNED BY artists.id;


--
-- Name: bandmembers; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE bandmembers (
    id bigint NOT NULL,
    band_id bigint,
    artist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE bandmembers OWNER TO gdev;

--
-- Name: bandmembers_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE bandmembers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bandmembers_id_seq OWNER TO gdev;

--
-- Name: bandmembers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE bandmembers_id_seq OWNED BY bandmembers.id;


--
-- Name: bands; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE bands (
    id bigint NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE bands OWNER TO gdev;

--
-- Name: bands_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE bands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bands_id_seq OWNER TO gdev;

--
-- Name: bands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE bands_id_seq OWNED BY bands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: gdev
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


ALTER TABLE categories OWNER TO gdev;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO gdev;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: friendships; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE friendships (
    id bigint NOT NULL,
    user_id integer,
    friend_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE friendships OWNER TO gdev;

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendships_id_seq OWNER TO gdev;

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE friendships_id_seq OWNED BY friendships.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: gdev
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


ALTER TABLE photos OWNER TO gdev;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE photos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE photos_id_seq OWNER TO gdev;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE photos_id_seq OWNED BY photos.id;


--
-- Name: record_libraries; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE record_libraries (
    id bigint NOT NULL,
    user_id bigint,
    album_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE record_libraries OWNER TO gdev;

--
-- Name: record_libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE record_libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE record_libraries_id_seq OWNER TO gdev;

--
-- Name: record_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE record_libraries_id_seq OWNED BY record_libraries.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO gdev;

--
-- Name: songs; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE songs (
    id bigint NOT NULL,
    name character varying,
    artist_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category_id bigint
);


ALTER TABLE songs OWNER TO gdev;

--
-- Name: songs_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE songs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE songs_id_seq OWNER TO gdev;

--
-- Name: songs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE songs_id_seq OWNED BY songs.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: gdev
--

CREATE TABLE tracks (
    id bigint NOT NULL,
    album_id bigint,
    song_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE tracks OWNER TO gdev;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE tracks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tracks_id_seq OWNER TO gdev;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE tracks_id_seq OWNED BY tracks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gdev
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


ALTER TABLE users OWNER TO gdev;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gdev
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO gdev;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gdev
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY albums ALTER COLUMN id SET DEFAULT nextval('albums_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY artists ALTER COLUMN id SET DEFAULT nextval('artists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY bandmembers ALTER COLUMN id SET DEFAULT nextval('bandmembers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY bands ALTER COLUMN id SET DEFAULT nextval('bands_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY record_libraries ALTER COLUMN id SET DEFAULT nextval('record_libraries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY songs ALTER COLUMN id SET DEFAULT nextval('songs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY tracks ALTER COLUMN id SET DEFAULT nextval('tracks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY albums (id, name, release_date, created_at, updated_at, category_id, artist_id, band_id) FROM stdin;
8	Spine of God	2017-07-06	2017-06-12 13:25:35.250576	2017-06-12 15:24:24.088062	4	\N	26
7	Welcome to the Sky Valley	2017-10-06	2017-06-12 13:25:18.571559	2017-06-12 15:24:35.418148	4	\N	25
9	Busse Woods	2017-01-06	2017-06-12 15:38:59.86417	2017-06-12 15:38:59.86417	4	\N	27
10	The Action is Go!	2017-07-06	2017-06-12 23:32:45.437284	2017-06-12 23:33:21.287616	4	\N	29
11	Strange Days (50th Anniversary Expanded Edition) [Remastered]	2017-11-17	2017-11-20 17:31:58.175138	2017-11-20 17:31:58.175138	1	\N	31
12	Long Road Out Of Eden	2007-01-01	2017-11-20 17:32:17.015406	2017-11-20 17:32:17.015406	1	\N	32
13	One More For The Fans (Live)	2015-07-24	2017-11-20 17:32:54.268879	2017-11-20 17:32:54.268879	1	\N	33
14	Live Over Europe	2007-11-20	2017-11-20 17:33:17.81869	2017-11-20 17:33:17.81869	1	\N	34
15	Songs Of Innocence	2014-01-01	2017-11-20 17:33:46.696072	2017-11-20 17:33:46.696072	1	\N	35
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('albums_id_seq', 15, true);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-05-25 19:10:21.149403	2017-05-25 19:10:21.149403
\.


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: gdev
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
18	\N	\N	2017-11-20 17:31:44.821523	2017-11-20 17:31:44.821523	1	Jim Morrison
19	\N	\N	2017-11-20 17:31:44.826119	2017-11-20 17:31:44.826119	1	John Densmore
20	\N	\N	2017-11-20 17:31:44.829936	2017-11-20 17:31:44.829936	1	Ray Manzarek
21	\N	\N	2017-11-20 17:31:44.834086	2017-11-20 17:31:44.834086	1	Robby Krieger
22	\N	\N	2017-11-20 17:32:03.72917	2017-11-20 17:32:03.72917	1	Bernie Leadon
23	\N	\N	2017-11-20 17:32:03.733122	2017-11-20 17:32:03.733122	1	Don Felder
24	\N	\N	2017-11-20 17:32:03.736854	2017-11-20 17:32:03.736854	1	Don Henley
25	\N	\N	2017-11-20 17:32:03.740571	2017-11-20 17:32:03.740571	1	Glenn Frey
26	\N	\N	2017-11-20 17:32:03.744197	2017-11-20 17:32:03.744197	1	Joe Walsh
27	\N	\N	2017-11-20 17:32:03.747756	2017-11-20 17:32:03.747756	1	Randy Meisner
28	\N	\N	2017-11-20 17:32:03.750686	2017-11-20 17:32:03.750686	1	Timothy B. Schmit
29	\N	\N	2017-11-20 17:32:22.843722	2017-11-20 17:32:22.843722	1	Allen Collins
30	\N	\N	2017-11-20 17:32:22.848566	2017-11-20 17:32:22.848566	1	Artimus Pyle (2)
31	\N	\N	2017-11-20 17:32:22.853248	2017-11-20 17:32:22.853248	1	Billy Powell
32	\N	\N	2017-11-20 17:32:22.858193	2017-11-20 17:32:22.858193	1	Bob Burns (2)
33	\N	\N	2017-11-20 17:32:22.862576	2017-11-20 17:32:22.862576	1	Dale Krantz Rossington
34	\N	\N	2017-11-20 17:32:22.867387	2017-11-20 17:32:22.867387	1	Ean Evans
35	\N	\N	2017-11-20 17:32:22.872387	2017-11-20 17:32:22.872387	1	Ed King (2)
36	\N	\N	2017-11-20 17:32:22.877046	2017-11-20 17:32:22.877046	1	Gary Rossington
37	\N	\N	2017-11-20 17:32:22.881804	2017-11-20 17:32:22.881804	1	Greg T. Walker
38	\N	\N	2017-11-20 17:32:22.886855	2017-11-20 17:32:22.886855	1	Hughie Thomasson
39	\N	\N	2017-11-20 17:32:22.891635	2017-11-20 17:32:22.891635	1	Johnny Colt
40	\N	\N	2017-11-20 17:32:22.896557	2017-11-20 17:32:22.896557	1	Johnny Van Zant
41	\N	\N	2017-11-20 17:32:22.901642	2017-11-20 17:32:22.901642	1	Kurt Custer
42	\N	\N	2017-11-20 17:32:22.906484	2017-11-20 17:32:22.906484	1	Larry Junstrom
43	\N	\N	2017-11-20 17:32:22.911049	2017-11-20 17:32:22.911049	1	Leon Wilkeson
44	\N	\N	2017-11-20 17:32:22.915902	2017-11-20 17:32:22.915902	1	Mark Matejka
45	\N	\N	2017-11-20 17:32:22.921593	2017-11-20 17:32:22.921593	1	Michael Cartellone
46	\N	\N	2017-11-20 17:32:22.926163	2017-11-20 17:32:22.926163	1	Mike Estes
47	\N	\N	2017-11-20 17:32:22.93035	2017-11-20 17:32:22.93035	1	Owen Hale
48	\N	\N	2017-11-20 17:32:22.934393	2017-11-20 17:32:22.934393	1	Peter Pisarczyk
49	\N	\N	2017-11-20 17:32:22.938815	2017-11-20 17:32:22.938815	1	Randall Hall
50	\N	\N	2017-11-20 17:32:22.943547	2017-11-20 17:32:22.943547	1	Rick Medlocke
51	\N	\N	2017-11-20 17:32:22.948614	2017-11-20 17:32:22.948614	1	Robert Kearns
52	\N	\N	2017-11-20 17:32:22.953443	2017-11-20 17:32:22.953443	1	Ronnie Van Zant
53	\N	\N	2017-11-20 17:32:22.957734	2017-11-20 17:32:22.957734	1	Steve Gaines
54	\N	\N	2017-11-20 17:32:22.962827	2017-11-20 17:32:22.962827	1	Twowolf
55	\N	\N	2017-11-20 17:33:01.028237	2017-11-20 17:33:01.028237	1	Anthony Phillips
56	\N	\N	2017-11-20 17:33:01.0318	2017-11-20 17:33:01.0318	1	Chris Stewart (7)
57	\N	\N	2017-11-20 17:33:01.034721	2017-11-20 17:33:01.034721	1	John Mayhew
58	\N	\N	2017-11-20 17:33:01.03795	2017-11-20 17:33:01.03795	1	John Silver (2)
59	\N	\N	2017-11-20 17:33:01.040902	2017-11-20 17:33:01.040902	1	Mike Rutherford
60	\N	\N	2017-11-20 17:33:01.045263	2017-11-20 17:33:01.045263	1	Peter Gabriel
61	\N	\N	2017-11-20 17:33:01.049878	2017-11-20 17:33:01.049878	1	Phil Collins
62	\N	\N	2017-11-20 17:33:01.05455	2017-11-20 17:33:01.05455	1	Ray Wilson
63	\N	\N	2017-11-20 17:33:01.059115	2017-11-20 17:33:01.059115	1	Steve Hackett
64	\N	\N	2017-11-20 17:33:01.063432	2017-11-20 17:33:01.063432	1	Tony Banks
65	\N	\N	2017-11-20 17:33:28.316468	2017-11-20 17:33:28.316468	1	Adam Clayton
66	\N	\N	2017-11-20 17:33:28.321228	2017-11-20 17:33:28.321228	1	Dave Evans (4)
67	\N	\N	2017-11-20 17:33:28.325605	2017-11-20 17:33:28.325605	1	Larry Mullen
68	\N	\N	2017-11-20 17:33:28.329335	2017-11-20 17:33:28.329335	1	Paul Hewson
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('artists_id_seq', 68, true);


--
-- Data for Name: bandmembers; Type: TABLE DATA; Schema: public; Owner: gdev
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
87	31	18	2017-11-20 17:31:44.874049	2017-11-20 17:31:44.874049
88	31	19	2017-11-20 17:31:44.879902	2017-11-20 17:31:44.879902
89	31	20	2017-11-20 17:31:44.886156	2017-11-20 17:31:44.886156
90	31	21	2017-11-20 17:31:44.893033	2017-11-20 17:31:44.893033
91	32	18	2017-11-20 17:32:03.757364	2017-11-20 17:32:03.757364
92	32	19	2017-11-20 17:32:03.762231	2017-11-20 17:32:03.762231
93	32	20	2017-11-20 17:32:03.766776	2017-11-20 17:32:03.766776
94	32	21	2017-11-20 17:32:03.772519	2017-11-20 17:32:03.772519
95	32	22	2017-11-20 17:32:03.778604	2017-11-20 17:32:03.778604
96	32	23	2017-11-20 17:32:03.784432	2017-11-20 17:32:03.784432
97	32	24	2017-11-20 17:32:03.790564	2017-11-20 17:32:03.790564
98	32	25	2017-11-20 17:32:03.796128	2017-11-20 17:32:03.796128
99	32	26	2017-11-20 17:32:03.801606	2017-11-20 17:32:03.801606
100	32	27	2017-11-20 17:32:03.80736	2017-11-20 17:32:03.80736
101	32	28	2017-11-20 17:32:03.812807	2017-11-20 17:32:03.812807
102	33	18	2017-11-20 17:32:22.970938	2017-11-20 17:32:22.970938
103	33	19	2017-11-20 17:32:22.975407	2017-11-20 17:32:22.975407
104	33	20	2017-11-20 17:32:22.980211	2017-11-20 17:32:22.980211
105	33	21	2017-11-20 17:32:22.984683	2017-11-20 17:32:22.984683
106	33	22	2017-11-20 17:32:22.98921	2017-11-20 17:32:22.98921
107	33	23	2017-11-20 17:32:22.993909	2017-11-20 17:32:22.993909
108	33	24	2017-11-20 17:32:22.998893	2017-11-20 17:32:22.998893
109	33	25	2017-11-20 17:32:23.003533	2017-11-20 17:32:23.003533
110	33	26	2017-11-20 17:32:23.008628	2017-11-20 17:32:23.008628
111	33	27	2017-11-20 17:32:23.013476	2017-11-20 17:32:23.013476
112	33	28	2017-11-20 17:32:23.019069	2017-11-20 17:32:23.019069
113	33	29	2017-11-20 17:32:23.024343	2017-11-20 17:32:23.024343
114	33	30	2017-11-20 17:32:23.030327	2017-11-20 17:32:23.030327
115	33	31	2017-11-20 17:32:23.03493	2017-11-20 17:32:23.03493
116	33	32	2017-11-20 17:32:23.039195	2017-11-20 17:32:23.039195
117	33	33	2017-11-20 17:32:23.043405	2017-11-20 17:32:23.043405
118	33	34	2017-11-20 17:32:23.047623	2017-11-20 17:32:23.047623
119	33	35	2017-11-20 17:32:23.052395	2017-11-20 17:32:23.052395
120	33	36	2017-11-20 17:32:23.057144	2017-11-20 17:32:23.057144
121	33	37	2017-11-20 17:32:23.062231	2017-11-20 17:32:23.062231
122	33	38	2017-11-20 17:32:23.06827	2017-11-20 17:32:23.06827
123	33	39	2017-11-20 17:32:23.073801	2017-11-20 17:32:23.073801
124	33	40	2017-11-20 17:32:23.079255	2017-11-20 17:32:23.079255
125	33	41	2017-11-20 17:32:23.083888	2017-11-20 17:32:23.083888
126	33	42	2017-11-20 17:32:23.088472	2017-11-20 17:32:23.088472
127	33	43	2017-11-20 17:32:23.092704	2017-11-20 17:32:23.092704
128	33	44	2017-11-20 17:32:23.097218	2017-11-20 17:32:23.097218
129	33	45	2017-11-20 17:32:23.101693	2017-11-20 17:32:23.101693
130	33	46	2017-11-20 17:32:23.106023	2017-11-20 17:32:23.106023
131	33	47	2017-11-20 17:32:23.110402	2017-11-20 17:32:23.110402
132	33	48	2017-11-20 17:32:23.114512	2017-11-20 17:32:23.114512
133	33	49	2017-11-20 17:32:23.125934	2017-11-20 17:32:23.125934
134	33	50	2017-11-20 17:32:23.130214	2017-11-20 17:32:23.130214
135	33	51	2017-11-20 17:32:23.135671	2017-11-20 17:32:23.135671
136	33	52	2017-11-20 17:32:23.141674	2017-11-20 17:32:23.141674
137	33	53	2017-11-20 17:32:23.14831	2017-11-20 17:32:23.14831
138	33	54	2017-11-20 17:32:23.156204	2017-11-20 17:32:23.156204
139	34	18	2017-11-20 17:33:01.070701	2017-11-20 17:33:01.070701
140	34	19	2017-11-20 17:33:01.077152	2017-11-20 17:33:01.077152
141	34	20	2017-11-20 17:33:01.08301	2017-11-20 17:33:01.08301
142	34	21	2017-11-20 17:33:01.090256	2017-11-20 17:33:01.090256
143	34	22	2017-11-20 17:33:01.096674	2017-11-20 17:33:01.096674
144	34	23	2017-11-20 17:33:01.105122	2017-11-20 17:33:01.105122
145	34	24	2017-11-20 17:33:01.111833	2017-11-20 17:33:01.111833
146	34	25	2017-11-20 17:33:01.1182	2017-11-20 17:33:01.1182
147	34	26	2017-11-20 17:33:01.126053	2017-11-20 17:33:01.126053
148	34	27	2017-11-20 17:33:01.133413	2017-11-20 17:33:01.133413
149	34	28	2017-11-20 17:33:01.139804	2017-11-20 17:33:01.139804
150	34	29	2017-11-20 17:33:01.146013	2017-11-20 17:33:01.146013
151	34	30	2017-11-20 17:33:01.152623	2017-11-20 17:33:01.152623
152	34	31	2017-11-20 17:33:01.159487	2017-11-20 17:33:01.159487
153	34	32	2017-11-20 17:33:01.164847	2017-11-20 17:33:01.164847
154	34	33	2017-11-20 17:33:01.170216	2017-11-20 17:33:01.170216
155	34	34	2017-11-20 17:33:01.17524	2017-11-20 17:33:01.17524
156	34	35	2017-11-20 17:33:01.180694	2017-11-20 17:33:01.180694
157	34	36	2017-11-20 17:33:01.194337	2017-11-20 17:33:01.194337
158	34	37	2017-11-20 17:33:01.200404	2017-11-20 17:33:01.200404
159	34	38	2017-11-20 17:33:01.205419	2017-11-20 17:33:01.205419
160	34	39	2017-11-20 17:33:01.210208	2017-11-20 17:33:01.210208
161	34	40	2017-11-20 17:33:01.215396	2017-11-20 17:33:01.215396
162	34	41	2017-11-20 17:33:01.220934	2017-11-20 17:33:01.220934
163	34	42	2017-11-20 17:33:01.226469	2017-11-20 17:33:01.226469
164	34	43	2017-11-20 17:33:01.231907	2017-11-20 17:33:01.231907
165	34	44	2017-11-20 17:33:01.237409	2017-11-20 17:33:01.237409
166	34	45	2017-11-20 17:33:01.242065	2017-11-20 17:33:01.242065
167	34	46	2017-11-20 17:33:01.246664	2017-11-20 17:33:01.246664
168	34	47	2017-11-20 17:33:01.25081	2017-11-20 17:33:01.25081
169	34	48	2017-11-20 17:33:01.255508	2017-11-20 17:33:01.255508
170	34	49	2017-11-20 17:33:01.260286	2017-11-20 17:33:01.260286
171	34	50	2017-11-20 17:33:01.265326	2017-11-20 17:33:01.265326
172	34	51	2017-11-20 17:33:01.269662	2017-11-20 17:33:01.269662
173	34	52	2017-11-20 17:33:01.275796	2017-11-20 17:33:01.275796
174	34	53	2017-11-20 17:33:01.279964	2017-11-20 17:33:01.279964
175	34	54	2017-11-20 17:33:01.283908	2017-11-20 17:33:01.283908
176	34	55	2017-11-20 17:33:01.287953	2017-11-20 17:33:01.287953
177	34	56	2017-11-20 17:33:01.292442	2017-11-20 17:33:01.292442
178	34	57	2017-11-20 17:33:01.296675	2017-11-20 17:33:01.296675
179	34	58	2017-11-20 17:33:01.300976	2017-11-20 17:33:01.300976
180	34	59	2017-11-20 17:33:01.304946	2017-11-20 17:33:01.304946
181	34	60	2017-11-20 17:33:01.30916	2017-11-20 17:33:01.30916
182	34	61	2017-11-20 17:33:01.313364	2017-11-20 17:33:01.313364
183	34	62	2017-11-20 17:33:01.317576	2017-11-20 17:33:01.317576
184	34	63	2017-11-20 17:33:01.321967	2017-11-20 17:33:01.321967
185	34	64	2017-11-20 17:33:01.32644	2017-11-20 17:33:01.32644
186	35	18	2017-11-20 17:33:28.335306	2017-11-20 17:33:28.335306
187	35	19	2017-11-20 17:33:28.341815	2017-11-20 17:33:28.341815
188	35	20	2017-11-20 17:33:28.346723	2017-11-20 17:33:28.346723
189	35	21	2017-11-20 17:33:28.350694	2017-11-20 17:33:28.350694
190	35	22	2017-11-20 17:33:28.354574	2017-11-20 17:33:28.354574
191	35	23	2017-11-20 17:33:28.358582	2017-11-20 17:33:28.358582
192	35	24	2017-11-20 17:33:28.363037	2017-11-20 17:33:28.363037
193	35	25	2017-11-20 17:33:28.367482	2017-11-20 17:33:28.367482
194	35	26	2017-11-20 17:33:28.371343	2017-11-20 17:33:28.371343
195	35	27	2017-11-20 17:33:28.376042	2017-11-20 17:33:28.376042
196	35	28	2017-11-20 17:33:28.381198	2017-11-20 17:33:28.381198
197	35	29	2017-11-20 17:33:28.386362	2017-11-20 17:33:28.386362
198	35	30	2017-11-20 17:33:28.39154	2017-11-20 17:33:28.39154
199	35	31	2017-11-20 17:33:28.395803	2017-11-20 17:33:28.395803
200	35	32	2017-11-20 17:33:28.400016	2017-11-20 17:33:28.400016
201	35	33	2017-11-20 17:33:28.406143	2017-11-20 17:33:28.406143
202	35	34	2017-11-20 17:33:28.410445	2017-11-20 17:33:28.410445
203	35	35	2017-11-20 17:33:28.414121	2017-11-20 17:33:28.414121
204	35	36	2017-11-20 17:33:28.418061	2017-11-20 17:33:28.418061
205	35	37	2017-11-20 17:33:28.421808	2017-11-20 17:33:28.421808
206	35	38	2017-11-20 17:33:28.425185	2017-11-20 17:33:28.425185
207	35	39	2017-11-20 17:33:28.428992	2017-11-20 17:33:28.428992
208	35	40	2017-11-20 17:33:28.432958	2017-11-20 17:33:28.432958
209	35	41	2017-11-20 17:33:28.437258	2017-11-20 17:33:28.437258
210	35	42	2017-11-20 17:33:28.442586	2017-11-20 17:33:28.442586
211	35	43	2017-11-20 17:33:28.448082	2017-11-20 17:33:28.448082
212	35	44	2017-11-20 17:33:28.453497	2017-11-20 17:33:28.453497
213	35	45	2017-11-20 17:33:28.458667	2017-11-20 17:33:28.458667
214	35	46	2017-11-20 17:33:28.463759	2017-11-20 17:33:28.463759
215	35	47	2017-11-20 17:33:28.469839	2017-11-20 17:33:28.469839
216	35	48	2017-11-20 17:33:28.474676	2017-11-20 17:33:28.474676
217	35	49	2017-11-20 17:33:28.478768	2017-11-20 17:33:28.478768
218	35	50	2017-11-20 17:33:28.482936	2017-11-20 17:33:28.482936
219	35	51	2017-11-20 17:33:28.487106	2017-11-20 17:33:28.487106
220	35	52	2017-11-20 17:33:28.492567	2017-11-20 17:33:28.492567
221	35	53	2017-11-20 17:33:28.497869	2017-11-20 17:33:28.497869
222	35	54	2017-11-20 17:33:28.503246	2017-11-20 17:33:28.503246
223	35	55	2017-11-20 17:33:28.508941	2017-11-20 17:33:28.508941
224	35	56	2017-11-20 17:33:28.514402	2017-11-20 17:33:28.514402
225	35	57	2017-11-20 17:33:28.520953	2017-11-20 17:33:28.520953
226	35	58	2017-11-20 17:33:28.527388	2017-11-20 17:33:28.527388
227	35	59	2017-11-20 17:33:28.532862	2017-11-20 17:33:28.532862
228	35	60	2017-11-20 17:33:28.538909	2017-11-20 17:33:28.538909
229	35	61	2017-11-20 17:33:28.545047	2017-11-20 17:33:28.545047
230	35	62	2017-11-20 17:33:28.55095	2017-11-20 17:33:28.55095
231	35	63	2017-11-20 17:33:28.556971	2017-11-20 17:33:28.556971
232	35	64	2017-11-20 17:33:28.563103	2017-11-20 17:33:28.563103
233	35	65	2017-11-20 17:33:28.568525	2017-11-20 17:33:28.568525
234	35	66	2017-11-20 17:33:28.574054	2017-11-20 17:33:28.574054
235	35	67	2017-11-20 17:33:28.581077	2017-11-20 17:33:28.581077
236	35	68	2017-11-20 17:33:28.587937	2017-11-20 17:33:28.587937
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bandmembers_id_seq', 236, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
25	Kyuss	\N	2017-06-12 15:23:56.757865	2017-06-12 15:23:56.757865	4
26	Monster Magnet	\N	2017-06-12 15:24:08.688664	2017-06-12 15:24:08.688664	4
27	Acid King	\N	2017-06-12 15:38:32.43529	2017-06-12 15:38:32.43529	4
28	Metallica	\N	2017-06-12 23:23:07.595399	2017-06-12 23:23:07.595399	3
29	Fu Manchu	\N	2017-06-12 23:30:17.288959	2017-06-12 23:30:17.288959	4
31	The Doors	American psychedelic rock/blues rock band formed in July, 1965 in Los Angeles, CA, United States and disbanded in 1973.\r\n\r\nInducted into Rock And Roll Hall of Fame in 1993 (Performer).\r\n	2017-11-20 17:31:44.763969	2017-11-20 17:31:44.763969	1
32	Eagles	Founded in 1971 by [a=Glenn Frey] (guitar), [a=Bernie Leadon] (banjo, mandolin, electric guitar, acoustic guitar), [a=Randy Meisner] (bass) and [a=Don Henley] (drums).\r\n\r\n[a=Don Henley]: drums, percussion, vocals\r\n[a=Timothy B. Schmit]: bass, vocals\r\n[a=Joe Walsh]: guitars, organ, vocals\r\n\r\nFormer members: [a=Bernie Leadon], [a=Randy Meisner], [a=Don Felder], [a=Glenn Frey]\r\n\r\nInducted into the Rock And Roll Hall of Fame in 1998 (Performer)	2017-11-20 17:32:03.712196	2017-11-20 17:32:03.712196	1
33	Lynyrd Skynyrd	Lynyrd Skynyrd (pronounced /ˌlɛnərd ˈskɪnərd/ len-ərd-skin-ərd) is an American rock band best known for popularizing the Southern hard rock genre during the 1970s. Originally formed in 1964 as the "Noble Five" in Jacksonville, Florida, the band rose to worldwide recognition on the basis of its driving live performances and signature tunes "Sweet Home Alabama," and "Free Bird." At the peak of their success, three members died in an airplane crash in 1977, putting an abrupt end to the band's most popular incarnation.\r\nSurviving members re-formed in 1987 for a reunion tour with lead singer Ronnie Van Zant's younger brother Johnny as frontman. A version of the band continues to tour and record, with only Gary Rossington of its original members remaining as of 2012. Lynyrd Skynyrd was inducted into the Rock and Roll Hall of Fame on March 13, 2006.\r\n	2017-11-20 17:32:22.816673	2017-11-20 17:32:22.816673	1
34	Genesis	Formed in 1967, Genesis are among the top 30 highest-selling recording artists of all time. \r\n\r\nTheir early work is characterized by complex song structures, elaborate instrumentation and the theatrical antics of founder member and vocalist [a=Peter Gabriel], who left the band in 1975. Unable to find a suitable replacement, it was drummer Phil Collins who assumed vocal duties. This change, as well as the departure of guitarist [a=Steve Hackett], two years later, saw the remaining three members (Phil Collins, Tony Banks and Mike Rutherford) move into more accessible pop-based music. This change in style resulted in a huge growth in Genesis' popularity throughout the 1980s and early 1990s.\r\n\r\nIn 1996 Collins left to concentrate on his solo work and other projects, leaving erstwhile bandmates Mike Rutherford and Tony Banks to forge ahead with new recruit; [a=Stiltskin] vocalist Ray Wilson. This line-up lasted for one album only (1997's "Calling All Stations") and Genesis soon found itself on hiatus after the poor performance and critical reaction of the new album.\r\n\r\nIn 2006 - after years of speculation - Phil Collins, Tony Banks and Mike Rutherford reformed Genesis for the successful "Turn It On Again" tour. A reunion involving ex-members Peter Gabriel and Steve Hackett remains much talked-about and unrealised.\r\n\r\nInducted into the Rock & Roll Hall Of Fame 2010 (performer)\r\n\r\nMembers:\r\n[a=Peter Gabriel] (1967-1975)\r\n[a=Mike Rutherford] \r\n[a=Tony Banks] \r\n[a=Anthony Phillips] (1967-1970)\r\n[a=Chris Stewart (7)] (1967-1968)\r\n[a=John Silver (2)] (1968-1969)\r\n[a=John Mayhew] (1969-1970)\r\n[a=Steve Hackett] (1971-1977)\r\n[a=Phil Collins] (1970-1995, 2006-present)\r\n[a=Ray Wilson] (1996-1998)\r\n\r\nLive Members:\r\n[a=Bill Bruford] (1976)\r\n[a=Chester Thompson] (1977-1995, 2006-present)\r\n[a=Daryl Stuermer] (1978-1995, 2006-present)\r\n[a=Nir Z] (1996-1998)\r\n	2017-11-20 17:33:01.008938	2017-11-20 17:33:01.008938	1
35	U2	Dubliners U2 started in their hometown in 1976. They began their legacy rooting their music in the political turmoil that was all around them.\r\n\r\nAfter having Steve Lillywhite produce their first three albums, U2 looked for a more commercial sound. They hired Daniel Lanois and Brian Eno to produce "The Unforgettable Fire" and "The Joshua Tree" albums, which both put them onto the charts all over the world.\r\n\r\nAfter the 80s ended U2 re-invented themselves once again. Incorporating elements of electronics into their rock construct, U2 created a new sound with "Achtung Baby". Bono and the band used their notoriety more than ever expressing their opinions on social matters on a global scale.\r\n\r\nInducted into Rock And Roll Hall of Fame in 2005 (Performer).\r\n\r\nMembers:\r\nPaul David Hewson (aka Bono)\r\nDavid Howell Evans (aka The Edge)\r\nAdam Charles Clayton\r\nLawrence Joseph Mullen Jr.	2017-11-20 17:33:28.286678	2017-11-20 17:33:28.286678	1
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bands_id_seq', 35, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY categories (id, name, parent_id, lft, rgt, depth, children_count) FROM stdin;
1	Rock	\N	1	6	0	0
2	Hip Hop	\N	7	8	0	0
3	Hard Rock	1	2	5	1	0
4	Stoner Rock	3	3	4	2	0
5	Dance	\N	9	14	0	0
6	IDM	5	10	13	1	0
7	Experimental	6	11	12	2	0
8	Metal	\N	15	20	0	0
9	Death Metal	8	16	19	1	0
10	Electronic Death Metal	9	17	18	2	0
11	Country	\N	21	22	0	0
12	r&b	\N	23	24	0	0
13	Classical	\N	25	26	0	0
14	Jazz	\N	27	28	0	0
15	Reggae	\N	29	30	0	0
16	Blues	\N	31	32	0	0
17	Pop	\N	33	34	0	0
18	Instrumental	\N	35	36	0	0
19	Vocal	\N	37	38	0	0
20	Electronica	\N	39	40	0	0
21	Techno	\N	41	42	0	0
22	Punk	\N	43	44	0	0
23	Drum n Bass	\N	45	46	0	0
24	Indie	\N	47	48	0	0
25	Alternative	\N	49	50	0	0
26	Dubstep	\N	51	52	0	0
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('categories_id_seq', 26, true);


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY friendships (id, user_id, friend_id, created_at, updated_at) FROM stdin;
2	2	8	2017-11-13 18:47:55.734269	2017-11-13 18:47:55.734269
3	2	19	2017-11-13 18:47:57.639854	2017-11-13 18:47:57.639854
4	2	23	2017-11-13 18:47:58.033652	2017-11-13 18:47:58.033652
5	2	9	2017-11-13 18:48:01.84324	2017-11-13 18:48:01.84324
6	2	18	2017-11-13 18:48:02.282948	2017-11-13 18:48:02.282948
7	2	28	2017-11-13 18:48:02.673081	2017-11-13 18:48:02.673081
8	2	37	2017-11-13 18:48:03.054993	2017-11-13 18:48:03.054993
9	2	46	2017-11-13 18:48:03.475438	2017-11-13 18:48:03.475438
10	2	48	2017-11-13 18:48:03.754787	2017-11-13 18:48:03.754787
11	2	65	2017-11-13 18:48:06.641847	2017-11-13 18:48:06.641847
12	2	87	2017-11-13 18:48:07.216207	2017-11-13 18:48:07.216207
13	2	33	2017-11-13 18:48:08.804406	2017-11-13 18:48:08.804406
14	1	2	2017-11-13 19:12:19.183345	2017-11-13 19:12:19.183345
\.


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('friendships_id_seq', 14, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: gdev
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
56	2017-11-20 17:31:59.528469	2017-11-20 17:31:59.528469	173f8cda8412c09ac4c0464bd6f89895edf4d5a7	image/jpeg	172657	2017-11-20 17:31:59.297924	Album	11
57	2017-11-20 17:32:18.215499	2017-11-20 17:32:18.215499	f325ace82507a339c3e0f7783e2a6300d1aa8f76	image/jpeg	93471	2017-11-20 17:32:18.012549	Album	12
58	2017-11-20 17:32:56.793799	2017-11-20 17:32:56.793799	1e533d55913422d045b285422c016c3674264fa5	image/jpeg	202229	2017-11-20 17:32:56.577501	Album	13
59	2017-11-20 17:33:18.942259	2017-11-20 17:33:18.942259	c2bd8108af955eae09b53e14fa6250e4c7f4061f	image/jpeg	119311	2017-11-20 17:33:18.744887	Album	14
60	2017-11-20 17:33:48.317552	2017-11-20 17:33:48.317552	0737936f39dc7479ac65f68f52311680eaaeead0	image/jpeg	58147	2017-11-20 17:33:48.117387	Album	15
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('photos_id_seq', 60, true);


--
-- Data for Name: record_libraries; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY record_libraries (id, user_id, album_id, created_at, updated_at) FROM stdin;
14	2	8	2017-11-13 21:01:35.609129	2017-11-13 21:01:35.609129
15	2	7	2017-11-13 21:01:38.446244	2017-11-13 21:01:38.446244
16	2	9	2017-11-13 21:01:41.504505	2017-11-13 21:01:41.504505
\.


--
-- Name: record_libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('record_libraries_id_seq', 16, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: gdev
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
20171113175455
20171113182649
20171113182715
20171113200115
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: gdev
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
36	Strange Days - Remastered	\N	2017-11-20 17:31:59.586888	2017-11-20 17:31:59.586888	1
37	You're Lost Little Girl - Remastered	\N	2017-11-20 17:31:59.591885	2017-11-20 17:31:59.591885	1
38	Love Me Two Times - Remastered	\N	2017-11-20 17:31:59.59604	2017-11-20 17:31:59.59604	1
39	Unhappy Girl - Remastered	\N	2017-11-20 17:31:59.600136	2017-11-20 17:31:59.600136	1
40	Horse Latitudes - Remastered	\N	2017-11-20 17:31:59.604297	2017-11-20 17:31:59.604297	1
41	Moonlight Drive - Remastered	\N	2017-11-20 17:31:59.608594	2017-11-20 17:31:59.608594	1
42	People Are Strange - Remastered	\N	2017-11-20 17:31:59.613218	2017-11-20 17:31:59.613218	1
43	My Eyes Have Seen You - Remastered	\N	2017-11-20 17:31:59.617878	2017-11-20 17:31:59.617878	1
44	I Can't See Your Face In My Mind - Remastered	\N	2017-11-20 17:31:59.62267	2017-11-20 17:31:59.62267	1
45	When The Music's Over - Remastered	\N	2017-11-20 17:31:59.627047	2017-11-20 17:31:59.627047	1
46	Strange Days - Mono [Remastered]	\N	2017-11-20 17:31:59.631145	2017-11-20 17:31:59.631145	1
47	You're Lost Little Girl - Mono [Remastered]	\N	2017-11-20 17:31:59.635803	2017-11-20 17:31:59.635803	1
48	Love Me Two Times - Mono [Remastered]	\N	2017-11-20 17:31:59.640474	2017-11-20 17:31:59.640474	1
49	Unhappy Girl - Mono [Remastered]	\N	2017-11-20 17:31:59.645096	2017-11-20 17:31:59.645096	1
50	Horse Latitudes - Mono [Remastered]	\N	2017-11-20 17:31:59.649261	2017-11-20 17:31:59.649261	1
51	Moonlight Drive - Mono [Remastered]	\N	2017-11-20 17:31:59.653826	2017-11-20 17:31:59.653826	1
52	People Are Strange - Mono [Remastered]	\N	2017-11-20 17:31:59.659056	2017-11-20 17:31:59.659056	1
53	My Eyes Have Seen You - Mono [Remastered]	\N	2017-11-20 17:31:59.664111	2017-11-20 17:31:59.664111	1
54	I Can't See Your Face In My Mind - Mono [Remastered]	\N	2017-11-20 17:31:59.668586	2017-11-20 17:31:59.668586	1
55	When The Music's Over - Mono [Remastered]	\N	2017-11-20 17:31:59.673155	2017-11-20 17:31:59.673155	1
56	No More Walks In The Wood	\N	2017-11-20 17:32:18.239191	2017-11-20 17:32:18.239191	1
57	How Long	\N	2017-11-20 17:32:18.242382	2017-11-20 17:32:18.242382	1
58	Busy Being Fabulous	\N	2017-11-20 17:32:18.246126	2017-11-20 17:32:18.246126	1
59	What Do I Do With My Heart	\N	2017-11-20 17:32:18.249878	2017-11-20 17:32:18.249878	1
60	Guilty Of The Crime	\N	2017-11-20 17:32:18.253635	2017-11-20 17:32:18.253635	1
61	I Don't Want To Hear Any More	\N	2017-11-20 17:32:18.25752	2017-11-20 17:32:18.25752	1
62	Waiting In The Weeds	\N	2017-11-20 17:32:18.261648	2017-11-20 17:32:18.261648	1
63	No More Cloudy Days	\N	2017-11-20 17:32:18.26521	2017-11-20 17:32:18.26521	1
64	Fast Company	\N	2017-11-20 17:32:18.26891	2017-11-20 17:32:18.26891	1
65	Do Something	\N	2017-11-20 17:32:18.272882	2017-11-20 17:32:18.272882	1
66	You Are Not Alone	\N	2017-11-20 17:32:18.277444	2017-11-20 17:32:18.277444	1
67	Long Road Out Of Eden	\N	2017-11-20 17:32:18.281681	2017-11-20 17:32:18.281681	1
68	I Dreamed There Was No War	\N	2017-11-20 17:32:18.285959	2017-11-20 17:32:18.285959	1
69	Somebody	\N	2017-11-20 17:32:18.29041	2017-11-20 17:32:18.29041	1
70	Frail Grasp On The Big Picture	\N	2017-11-20 17:32:18.29498	2017-11-20 17:32:18.29498	1
71	Last Good Time In Town	\N	2017-11-20 17:32:18.299358	2017-11-20 17:32:18.299358	1
72	I Love To Watch A Woman Dance	\N	2017-11-20 17:32:18.303806	2017-11-20 17:32:18.303806	1
73	Business As Usual	\N	2017-11-20 17:32:18.308256	2017-11-20 17:32:18.308256	1
74	Center Of The Universe	\N	2017-11-20 17:32:18.312639	2017-11-20 17:32:18.312639	1
75	It's Your World Now	\N	2017-11-20 17:32:18.316892	2017-11-20 17:32:18.316892	1
76	Hole In The World - Bonus Track	\N	2017-11-20 17:32:18.320873	2017-11-20 17:32:18.320873	1
77	Whiskey Rock-A-Roller (feat. Randy Houser) - Live	\N	2017-11-20 17:32:56.816287	2017-11-20 17:32:56.816287	1
78	You Got That Right (feat. Jimmy Hall & Robert Randolph) - Live	\N	2017-11-20 17:32:56.819392	2017-11-20 17:32:56.819392	1
79	Saturday Night Special (feat. Aaron Lewis) - Live	\N	2017-11-20 17:32:56.821849	2017-11-20 17:32:56.821849	1
80	Workin' For MCA (feat. Blackberry Smoke) - Live	\N	2017-11-20 17:32:56.82429	2017-11-20 17:32:56.82429	1
81	Don't Ask Me No Questions (feat. O.A.R.) - Live	\N	2017-11-20 17:32:56.826893	2017-11-20 17:32:56.826893	1
82	Gimme Back My Bullets (feat. Cheap Trick) - Live	\N	2017-11-20 17:32:56.829573	2017-11-20 17:32:56.829573	1
83	The Ballad of Curtis Loew (feat. moe. & John Hiatt) - Live	\N	2017-11-20 17:32:56.832213	2017-11-20 17:32:56.832213	1
84	Simple Man (feat. Gov't Mule) - Live	\N	2017-11-20 17:32:56.834887	2017-11-20 17:32:56.834887	1
85	That Smell (feat. Warren Haynes) - Live	\N	2017-11-20 17:32:56.837293	2017-11-20 17:32:56.837293	1
86	Four Walls Of Raiford (feat. Jamey Johnson) - Live	\N	2017-11-20 17:32:56.83967	2017-11-20 17:32:56.83967	1
87	I Know A Little (feat. Jason Isbell) - Live	\N	2017-11-20 17:32:56.842174	2017-11-20 17:32:56.842174	1
88	Call Me The Breeze (feat. Peter Frampton) - Live	\N	2017-11-20 17:32:56.84458	2017-11-20 17:32:56.84458	1
89	What's Your Name (feat. Trace Adkins) - Live	\N	2017-11-20 17:32:56.846967	2017-11-20 17:32:56.846967	1
90	Down South Jukin' (feat. Charlie Daniels & Donnie Van Zant) - Live	\N	2017-11-20 17:32:56.849448	2017-11-20 17:32:56.849448	1
91	Gimme Three Steps (feat. Alabama) - Live	\N	2017-11-20 17:32:56.853296	2017-11-20 17:32:56.853296	1
92	Tuesday's Gone (feat. Gregg Allman) - Live	\N	2017-11-20 17:32:56.8571	2017-11-20 17:32:56.8571	1
93	Travelin' Man - Live	\N	2017-11-20 17:32:56.861054	2017-11-20 17:32:56.861054	1
94	Free Bird - Live	\N	2017-11-20 17:32:56.864738	2017-11-20 17:32:56.864738	1
95	Sweet Home Alabama - Live	\N	2017-11-20 17:32:56.869169	2017-11-20 17:32:56.869169	1
96	Dukes Intro - Live In Manchester	\N	2017-11-20 17:33:18.966271	2017-11-20 17:33:18.966271	1
97	Turn It On Again - Live In Amsterdam	\N	2017-11-20 17:33:18.970284	2017-11-20 17:33:18.970284	1
98	No Son Of Mine - Live In Amsterdam	\N	2017-11-20 17:33:18.974463	2017-11-20 17:33:18.974463	1
99	Land Of Confusion - Live In Helsinki	\N	2017-11-20 17:33:18.978365	2017-11-20 17:33:18.978365	1
100	In The Cage - Includes excerpts from Cinema Show and Dukes Travels Live In Manchester	\N	2017-11-20 17:33:18.982609	2017-11-20 17:33:18.982609	1
101	Afterglow - Live In Manchester	\N	2017-11-20 17:33:18.986583	2017-11-20 17:33:18.986583	1
102	Hold On My Heart - Live In Hannover	\N	2017-11-20 17:33:18.99079	2017-11-20 17:33:18.99079	1
103	Home By The Sea - Live In Dusseldorf & Rome	\N	2017-11-20 17:33:18.995508	2017-11-20 17:33:18.995508	1
104	Follow You Follow Me - Live In Paris	\N	2017-11-20 17:33:19.00035	2017-11-20 17:33:19.00035	1
105	Firth Of Fifth - Excerpt Live In Manchester	\N	2017-11-20 17:33:19.005454	2017-11-20 17:33:19.005454	1
106	I Know What I Like (In Your Wardrobe) - Live In Manchester	\N	2017-11-20 17:33:19.01034	2017-11-20 17:33:19.01034	1
107	Mama - Live In Frankfurt	\N	2017-11-20 17:33:19.014483	2017-11-20 17:33:19.014483	1
108	Ripples - Live In Prague	\N	2017-11-20 17:33:19.018739	2017-11-20 17:33:19.018739	1
109	Throwing It All Away - Live In Paris	\N	2017-11-20 17:33:19.022455	2017-11-20 17:33:19.022455	1
110	Domino - Live In Rome	\N	2017-11-20 17:33:19.026071	2017-11-20 17:33:19.026071	1
111	Conversations With 2 Stools - Live In Munich	\N	2017-11-20 17:33:19.029936	2017-11-20 17:33:19.029936	1
112	Los Endos - Live At Twickenham	\N	2017-11-20 17:33:19.03374	2017-11-20 17:33:19.03374	1
113	Tonight, Tonight, Tonight - Excerpt Live In Rome	\N	2017-11-20 17:33:19.037414	2017-11-20 17:33:19.037414	1
114	Invisible Touch - Live In Rome	\N	2017-11-20 17:33:19.041565	2017-11-20 17:33:19.041565	1
115	I Can't Dance - Live In Munich	\N	2017-11-20 17:33:19.046057	2017-11-20 17:33:19.046057	1
116	Carpet Crawlers - Live In Manchester	\N	2017-11-20 17:33:19.050806	2017-11-20 17:33:19.050806	1
117	The Miracle (Of Joey Ramone)	\N	2017-11-20 17:33:48.343091	2017-11-20 17:33:48.343091	1
118	Every Breaking Wave	\N	2017-11-20 17:33:48.346917	2017-11-20 17:33:48.346917	1
119	California (There Is No End To Love)	\N	2017-11-20 17:33:48.350614	2017-11-20 17:33:48.350614	1
120	Song For Someone	\N	2017-11-20 17:33:48.354364	2017-11-20 17:33:48.354364	1
121	Iris (Hold Me Close)	\N	2017-11-20 17:33:48.358376	2017-11-20 17:33:48.358376	1
122	Volcano	\N	2017-11-20 17:33:48.362223	2017-11-20 17:33:48.362223	1
123	Raised By Wolves	\N	2017-11-20 17:33:48.365936	2017-11-20 17:33:48.365936	1
124	Cedarwood Road	\N	2017-11-20 17:33:48.37361	2017-11-20 17:33:48.37361	1
125	Sleep Like A Baby Tonight	\N	2017-11-20 17:33:48.376257	2017-11-20 17:33:48.376257	1
126	This Is Where You Can Reach Me Now	\N	2017-11-20 17:33:48.379081	2017-11-20 17:33:48.379081	1
127	The Troubles	\N	2017-11-20 17:33:48.381652	2017-11-20 17:33:48.381652	1
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('songs_id_seq', 127, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: gdev
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
44	11	55	2017-11-20 17:31:59.700426	2017-11-20 17:31:59.700426
45	11	55	2017-11-20 17:31:59.706692	2017-11-20 17:31:59.706692
46	11	55	2017-11-20 17:31:59.712564	2017-11-20 17:31:59.712564
47	11	55	2017-11-20 17:31:59.71909	2017-11-20 17:31:59.71909
48	11	55	2017-11-20 17:31:59.724813	2017-11-20 17:31:59.724813
49	11	55	2017-11-20 17:31:59.729739	2017-11-20 17:31:59.729739
50	11	55	2017-11-20 17:31:59.734169	2017-11-20 17:31:59.734169
51	11	55	2017-11-20 17:31:59.740289	2017-11-20 17:31:59.740289
52	11	55	2017-11-20 17:31:59.746346	2017-11-20 17:31:59.746346
53	11	55	2017-11-20 17:31:59.752451	2017-11-20 17:31:59.752451
54	11	55	2017-11-20 17:31:59.761497	2017-11-20 17:31:59.761497
55	11	55	2017-11-20 17:31:59.766641	2017-11-20 17:31:59.766641
56	11	55	2017-11-20 17:31:59.771227	2017-11-20 17:31:59.771227
57	11	55	2017-11-20 17:31:59.775643	2017-11-20 17:31:59.775643
58	11	55	2017-11-20 17:31:59.780623	2017-11-20 17:31:59.780623
59	11	55	2017-11-20 17:31:59.785318	2017-11-20 17:31:59.785318
60	11	55	2017-11-20 17:31:59.790239	2017-11-20 17:31:59.790239
61	11	55	2017-11-20 17:31:59.796145	2017-11-20 17:31:59.796145
62	11	55	2017-11-20 17:31:59.801173	2017-11-20 17:31:59.801173
63	11	55	2017-11-20 17:31:59.805948	2017-11-20 17:31:59.805948
64	12	76	2017-11-20 17:32:18.32741	2017-11-20 17:32:18.32741
65	12	76	2017-11-20 17:32:18.337118	2017-11-20 17:32:18.337118
66	12	76	2017-11-20 17:32:18.344682	2017-11-20 17:32:18.344682
67	12	76	2017-11-20 17:32:18.350183	2017-11-20 17:32:18.350183
68	12	76	2017-11-20 17:32:18.355416	2017-11-20 17:32:18.355416
69	12	76	2017-11-20 17:32:18.36108	2017-11-20 17:32:18.36108
70	12	76	2017-11-20 17:32:18.367289	2017-11-20 17:32:18.367289
71	12	76	2017-11-20 17:32:18.374032	2017-11-20 17:32:18.374032
72	12	76	2017-11-20 17:32:18.379961	2017-11-20 17:32:18.379961
73	12	76	2017-11-20 17:32:18.385068	2017-11-20 17:32:18.385068
74	12	76	2017-11-20 17:32:18.390929	2017-11-20 17:32:18.390929
75	12	76	2017-11-20 17:32:18.396697	2017-11-20 17:32:18.396697
76	12	76	2017-11-20 17:32:18.402139	2017-11-20 17:32:18.402139
77	12	76	2017-11-20 17:32:18.409384	2017-11-20 17:32:18.409384
78	12	76	2017-11-20 17:32:18.414408	2017-11-20 17:32:18.414408
79	12	76	2017-11-20 17:32:18.419052	2017-11-20 17:32:18.419052
80	12	76	2017-11-20 17:32:18.424419	2017-11-20 17:32:18.424419
81	12	76	2017-11-20 17:32:18.428748	2017-11-20 17:32:18.428748
82	12	76	2017-11-20 17:32:18.433468	2017-11-20 17:32:18.433468
83	12	76	2017-11-20 17:32:18.438671	2017-11-20 17:32:18.438671
84	12	76	2017-11-20 17:32:18.443947	2017-11-20 17:32:18.443947
85	13	95	2017-11-20 17:32:56.874993	2017-11-20 17:32:56.874993
86	13	95	2017-11-20 17:32:56.881012	2017-11-20 17:32:56.881012
87	13	95	2017-11-20 17:32:56.886138	2017-11-20 17:32:56.886138
88	13	95	2017-11-20 17:32:56.893465	2017-11-20 17:32:56.893465
89	13	95	2017-11-20 17:32:56.898818	2017-11-20 17:32:56.898818
90	13	95	2017-11-20 17:32:56.904414	2017-11-20 17:32:56.904414
91	13	95	2017-11-20 17:32:56.910086	2017-11-20 17:32:56.910086
92	13	95	2017-11-20 17:32:56.915677	2017-11-20 17:32:56.915677
93	13	95	2017-11-20 17:32:56.921278	2017-11-20 17:32:56.921278
94	13	95	2017-11-20 17:32:56.926502	2017-11-20 17:32:56.926502
95	13	95	2017-11-20 17:32:56.931755	2017-11-20 17:32:56.931755
96	13	95	2017-11-20 17:32:56.937068	2017-11-20 17:32:56.937068
97	13	95	2017-11-20 17:32:56.942283	2017-11-20 17:32:56.942283
98	13	95	2017-11-20 17:32:56.947643	2017-11-20 17:32:56.947643
99	13	95	2017-11-20 17:32:56.953024	2017-11-20 17:32:56.953024
100	13	95	2017-11-20 17:32:56.95825	2017-11-20 17:32:56.95825
101	13	95	2017-11-20 17:32:56.963413	2017-11-20 17:32:56.963413
102	13	95	2017-11-20 17:32:56.968675	2017-11-20 17:32:56.968675
103	13	95	2017-11-20 17:32:56.973845	2017-11-20 17:32:56.973845
104	14	116	2017-11-20 17:33:19.058728	2017-11-20 17:33:19.058728
105	14	116	2017-11-20 17:33:19.064601	2017-11-20 17:33:19.064601
106	14	116	2017-11-20 17:33:19.070187	2017-11-20 17:33:19.070187
107	14	116	2017-11-20 17:33:19.075512	2017-11-20 17:33:19.075512
108	14	116	2017-11-20 17:33:19.08095	2017-11-20 17:33:19.08095
109	14	116	2017-11-20 17:33:19.086448	2017-11-20 17:33:19.086448
110	14	116	2017-11-20 17:33:19.090713	2017-11-20 17:33:19.090713
111	14	116	2017-11-20 17:33:19.094882	2017-11-20 17:33:19.094882
112	14	116	2017-11-20 17:33:19.099136	2017-11-20 17:33:19.099136
113	14	116	2017-11-20 17:33:19.103251	2017-11-20 17:33:19.103251
114	14	116	2017-11-20 17:33:19.108455	2017-11-20 17:33:19.108455
115	14	116	2017-11-20 17:33:19.113615	2017-11-20 17:33:19.113615
116	14	116	2017-11-20 17:33:19.118884	2017-11-20 17:33:19.118884
117	14	116	2017-11-20 17:33:19.124035	2017-11-20 17:33:19.124035
118	14	116	2017-11-20 17:33:19.128661	2017-11-20 17:33:19.128661
119	14	116	2017-11-20 17:33:19.134162	2017-11-20 17:33:19.134162
120	14	116	2017-11-20 17:33:19.139786	2017-11-20 17:33:19.139786
121	14	116	2017-11-20 17:33:19.144788	2017-11-20 17:33:19.144788
122	14	116	2017-11-20 17:33:19.148986	2017-11-20 17:33:19.148986
123	14	116	2017-11-20 17:33:19.153213	2017-11-20 17:33:19.153213
124	14	116	2017-11-20 17:33:19.157275	2017-11-20 17:33:19.157275
125	15	127	2017-11-20 17:33:48.386368	2017-11-20 17:33:48.386368
126	15	127	2017-11-20 17:33:48.390753	2017-11-20 17:33:48.390753
127	15	127	2017-11-20 17:33:48.39511	2017-11-20 17:33:48.39511
128	15	127	2017-11-20 17:33:48.399642	2017-11-20 17:33:48.399642
129	15	127	2017-11-20 17:33:48.403562	2017-11-20 17:33:48.403562
130	15	127	2017-11-20 17:33:48.407671	2017-11-20 17:33:48.407671
131	15	127	2017-11-20 17:33:48.411886	2017-11-20 17:33:48.411886
132	15	127	2017-11-20 17:33:48.415942	2017-11-20 17:33:48.415942
133	15	127	2017-11-20 17:33:48.419894	2017-11-20 17:33:48.419894
134	15	127	2017-11-20 17:33:48.423961	2017-11-20 17:33:48.423961
135	15	127	2017-11-20 17:33:48.428125	2017-11-20 17:33:48.428125
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('tracks_id_seq', 135, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY users (id, username, email, is_admin, created_at, updated_at, password_digest, password_confirmation, remember_digest, remember_token) FROM stdin;
44	Johanna	johanna@example.com	f	2017-11-13 18:45:49.281143	2017-11-13 18:45:49.281143	$2a$10$IYKdojuRSs/RzebAdL85eOzGR9BQ5YUB61RmcYWIzwRNHQ7TG4Uve		\N	\N
45	Tess	tess@example.com	f	2017-11-13 18:45:49.347769	2017-11-13 18:45:49.347769	$2a$10$ddaFMcP2zZHClHiTJiZL6.967p19fvuinV0md6Qbl6KdFpQa0OUkG		\N	\N
3	Glen Cormier	mckenzie@connlubowitz.info	f	2017-11-13 18:39:36.753401	2017-11-13 18:39:36.753401	$2a$10$EToQRMq3p1W5jrCLC/GW1uxiFU3wP38H5PnAyIlXlbJ8dVo0Quu5S		\N	\N
4	Dolly	dolly@example.org	f	2017-11-13 18:43:13.224108	2017-11-13 18:43:13.224108	$2a$10$YwV2/apuGoLyJYciGRwYLOsvsSTy2qSJw2mdCex6adxu6fAH48wTC		\N	\N
5	Orin	orin@example.com	f	2017-11-13 18:45:46.597811	2017-11-13 18:45:46.597811	$2a$10$p0bfiJL0HG.c2Y6KCOt81.xLTgTbfPvNg1RK5My.5Ou0I0FS2JOEC		\N	\N
6	Bette	bette@example.com	f	2017-11-13 18:45:46.670114	2017-11-13 18:45:46.670114	$2a$10$CGPFqSWZzQj9.d5oHBVsiOI9rdSAjKSQh2RSrgRHYP2XHY4CIuwku		\N	\N
7	Alberta	alberta@example.org	f	2017-11-13 18:45:46.738449	2017-11-13 18:45:46.738449	$2a$10$Z944eZ.gxDc/zL2aKiW7Z.PsGQh2xMa1wlNfKkwMwBjIpkGllwQcy		\N	\N
8	Gonzalo	gonzalo@example.com	f	2017-11-13 18:45:46.806805	2017-11-13 18:45:46.806805	$2a$10$.zNpcdWTqJ5GAt4v76Q7eeKmz9Xgaq1FiILHgsAfz/m1smIr3TWwO		\N	\N
9	Jovani	jovani@example.org	f	2017-11-13 18:45:46.883381	2017-11-13 18:45:46.883381	$2a$10$D68r9lJ2APu6bMdDPaRDmOzg18.r5KW2st.8DanDnc3114zxDNLg.		\N	\N
10	Christy	christy@example.org	f	2017-11-13 18:45:46.952086	2017-11-13 18:45:46.952086	$2a$10$SlY6hFpAc.CGMnpY90IW1OtRmbHWXVeSESeVZGZ5i7.4WvfP8KiTa		\N	\N
11	Aiyana	aiyana@example.net	f	2017-11-13 18:45:47.020416	2017-11-13 18:45:47.020416	$2a$10$gq2BjWcz1NDoDdj4MBA.hOgcEth0ironsedAqKWls5EvLWPPFA.8m		\N	\N
12	Sharon	sharon@example.org	f	2017-11-13 18:45:47.088529	2017-11-13 18:45:47.088529	$2a$10$YexLISZD6p0D7kCLn5.L0e8pON0rJePgpwEoVeYjkaT6D6Uz0hzra		\N	\N
13	Oliver	oliver@example.net	f	2017-11-13 18:45:47.156201	2017-11-13 18:45:47.156201	$2a$10$RwjFBcBhrlR4RwFOA2gRHOS.encwU38YYal5E6240v241kMJ2i54q		\N	\N
14	Efren	efren@example.net	f	2017-11-13 18:45:47.224767	2017-11-13 18:45:47.224767	$2a$10$eZyIFWdvYDOfsjOsa3FZaeFHLrw42K/qIXhF0mGqPRpROjWu9pKt6		\N	\N
15	Maureen	maureen@example.net	f	2017-11-13 18:45:47.293179	2017-11-13 18:45:47.293179	$2a$10$NXfZNaJZNwhlaUzuHnrPW.cwco/WH9X6d9qcM7bSDzgLoGxV/9BPS		\N	\N
16	Laverna	laverna@example.com	f	2017-11-13 18:45:47.360875	2017-11-13 18:45:47.360875	$2a$10$S0puRDlsC7lFONzAfvRq..ORUFGhTmcjXCUnXhJnX5cWHLwUo/b1a		\N	\N
17	Elton	elton@example.com	f	2017-11-13 18:45:47.429312	2017-11-13 18:45:47.429312	$2a$10$p/5lrLRqwgX/RqbSkTgqBO1Li9B35kdKFpzQyOPsZMsFhaaBnGXSy		\N	\N
18	Theron	theron@example.com	f	2017-11-13 18:45:47.497887	2017-11-13 18:45:47.497887	$2a$10$lv5y3TgYHtU.1pgrOe0bk.J1d2yeGzmF9oaUgGLG7xQOvaBQvQmBm		\N	\N
19	Suzanne	suzanne@example.com	f	2017-11-13 18:45:47.565469	2017-11-13 18:45:47.565469	$2a$10$ek4JzhA68j4IDPaDVXDqlOnhzjRf82gaxTg.R05ANd5PbyL3NhTeS		\N	\N
20	Giuseppe	giuseppe@example.com	f	2017-11-13 18:45:47.633556	2017-11-13 18:45:47.633556	$2a$10$9wKn1OIhJbnPIwZ2odHDrenIqHpn/NRNGYwNDgo2LFry0.9XrbzQe		\N	\N
21	Baron	baron@example.com	f	2017-11-13 18:45:47.702869	2017-11-13 18:45:47.702869	$2a$10$Ee2OgadQkPOglRo4s1JXrOC2IcaikNpNI2w5qbvIz9b3Cq/VkQwSu		\N	\N
22	Annabel	annabel@example.net	f	2017-11-13 18:45:47.782975	2017-11-13 18:45:47.782975	$2a$10$9NcX/T6ae37XOwqbi3GnEOPMHEDuN7EodcZn3//o8iwClDvVLMYwm		\N	\N
23	Travis	travis@example.org	f	2017-11-13 18:45:47.851151	2017-11-13 18:45:47.851151	$2a$10$LC4RyxMZ6yr2jhw0aX7w4eQvog7j5zCJPQCfGhXj0IVcrFjLzM7gS		\N	\N
24	Trudie	trudie@example.net	f	2017-11-13 18:45:47.91936	2017-11-13 18:45:47.91936	$2a$10$WKgDlXgTUWmurh5SEHOnTeQcHUwBwiI005lcgRsSTTpGgTUFiW3T2		\N	\N
25	Aileen	aileen@example.com	f	2017-11-13 18:45:47.987985	2017-11-13 18:45:47.987985	$2a$10$URcRaZTwgPzqBdWrGr5qH.SpzYLrBMCq/P3JrX4sfNbm9oK1EfrmC		\N	\N
26	Easter	easter@example.org	f	2017-11-13 18:45:48.056521	2017-11-13 18:45:48.056521	$2a$10$RIvkXvoadixJGmxeO95hIOqdJVAyxlViYbNM2rZNVr8KyfkyzaXWC		\N	\N
27	Cordell	cordell@example.net	f	2017-11-13 18:45:48.124924	2017-11-13 18:45:48.124924	$2a$10$NZNLLhO7HNSMPv78n7lbIOmitrzR28TZTziIts18ixHNl.buQh9zG		\N	\N
28	Lacey	lacey@example.com	f	2017-11-13 18:45:48.193356	2017-11-13 18:45:48.193356	$2a$10$x2Pwfi7Io9MZZ/QbuWOQFeZLkqgmT6CATKginqkWujn5rvj/tJvbS		\N	\N
29	Casimir	casimir@example.org	f	2017-11-13 18:45:48.260897	2017-11-13 18:45:48.260897	$2a$10$Jo4crOmigXr//xQpcqqR5OmRRISOEMdGJ33tjH/kilQZX6Y9.8gum		\N	\N
30	Layla	layla@example.com	f	2017-11-13 18:45:48.328625	2017-11-13 18:45:48.328625	$2a$10$3nobn06Z62lcIYyS386oTuvLIbldZUCbydx4i36hDIV.Enx3WD79S		\N	\N
31	Stone	stone@example.com	f	2017-11-13 18:45:48.396289	2017-11-13 18:45:48.396289	$2a$10$extc0UwHI7Qf5JWxprCJxu.tTKGT8up6cbMgImSkZj/zDWJwmydOu		\N	\N
32	Mollie	mollie@example.org	f	2017-11-13 18:45:48.464814	2017-11-13 18:45:48.464814	$2a$10$rJkk6oFkWEbgalDQDZEb5.GsLnYAICu7H5s/NM6/AWV8D75IJ0KGq		\N	\N
33	Herta	herta@example.com	f	2017-11-13 18:45:48.533204	2017-11-13 18:45:48.533204	$2a$10$GkOFeRevMovr.bw2tHZu3ejB.b6GoJ/fkuwFMaaU6GrB9RvzULjo2		\N	\N
34	Ernestina	ernestina@example.com	f	2017-11-13 18:45:48.601474	2017-11-13 18:45:48.601474	$2a$10$Lv89FsoWUy9R8QK95pO0fu7ADbvWajwo..NjfjSX2mA2byKLFuw4W		\N	\N
35	Mossie	mossie@example.com	f	2017-11-13 18:45:48.669096	2017-11-13 18:45:48.669096	$2a$10$28VrWhF/WyqLXJgfJHvsrOSHbcwzqFAYMo25zwBk3NrA6Y5nqAbg2		\N	\N
36	Flavio	flavio@example.net	f	2017-11-13 18:45:48.736595	2017-11-13 18:45:48.736595	$2a$10$Z8a7fMJVztlaJVdq7YJrjeTCar35/ZPIarzk5U1PFJ2gSuhogYOo2		\N	\N
37	Aletha	aletha@example.org	f	2017-11-13 18:45:48.804805	2017-11-13 18:45:48.804805	$2a$10$7PuE.OQ3CoRvh.lEEAKlq.6U63GrDMI8JVayD5djlOVV7ZUd/iU5y		\N	\N
38	Dedrick	dedrick@example.net	f	2017-11-13 18:45:48.872446	2017-11-13 18:45:48.872446	$2a$10$vSayfM2E.fJzQo3CpcLdm.kaFChdgK660zTdQqhtn21dtTzGdeWJa		\N	\N
39	Bernardo	bernardo@example.org	f	2017-11-13 18:45:48.940691	2017-11-13 18:45:48.940691	$2a$10$q0hNci4xeAN1oYaA8QRPb.KuAFYMilVQktOFi7/KSjFqtcn2At.Um		\N	\N
40	Hanna	hanna@example.com	f	2017-11-13 18:45:49.009494	2017-11-13 18:45:49.009494	$2a$10$T3EpFwnAyBvZVb9XbM30SOIdFDQ0zLKPLt/rLA2w0kXCBoU2YQs.K		\N	\N
41	Kaia	kaia@example.org	f	2017-11-13 18:45:49.081751	2017-11-13 18:45:49.081751	$2a$10$vpV99NZbkMtczGlXkQVAhO7lK3t7FoWjSh4hVDSgyMsEojsjgPzXi		\N	\N
42	Roman	roman@example.org	f	2017-11-13 18:45:49.148063	2017-11-13 18:45:49.148063	$2a$10$mDSPEgN6KafP9DHmAYroUeGWAS1RUCFLQJ8l47uAgjbd6Ph0Q3NUa		\N	\N
43	Moises	moises@example.com	f	2017-11-13 18:45:49.214495	2017-11-13 18:45:49.214495	$2a$10$uulg1YvF2uZ2TG87KAA97efhZave0LGxOlB7GStmx4wWXTSPlUJjy		\N	\N
46	Ena	ena@example.org	f	2017-11-13 18:45:49.413859	2017-11-13 18:45:49.413859	$2a$10$mZRL8g0Iz5DaGKbwbhNJSebOW1T7jmHZRYYrYVWPwwFCYABrFBrna		\N	\N
47	Gail	gail@example.org	f	2017-11-13 18:45:49.48026	2017-11-13 18:45:49.48026	$2a$10$IkQUH.SywGQsYJQ817pJgOSXs7BJ6.grCy7qK3JBZ3l3eqaQ4s4xe		\N	\N
48	Mavis	mavis@example.com	f	2017-11-13 18:45:49.549709	2017-11-13 18:45:49.549709	$2a$10$4QNuHTkFjPlmLkRS7/f/k.NJXc4EUBLO/NJyPIDgPH2jk.MptnsF2		\N	\N
49	Francesca	francesca@example.com	f	2017-11-13 18:45:49.618086	2017-11-13 18:45:49.618086	$2a$10$BT/XyIYqSVsJPzQO4eTvI.qMH32KdSwOevxgwCK9MMqH9vG6bgIvC		\N	\N
50	Monica	monica@example.net	f	2017-11-13 18:45:49.686282	2017-11-13 18:45:49.686282	$2a$10$JBxUFS8iXKkPCzBr26b3U.L8Hl77QHRXwLK/ZIFJm.ukrrrkkU5iy		\N	\N
51	Dagmar	dagmar@example.org	f	2017-11-13 18:45:49.754609	2017-11-13 18:45:49.754609	$2a$10$FhWCmF1xDT6SPF.ZUg8BieNJdSluaim//.VpL5tnWZJXNAiR3dDkG		\N	\N
52	Yesenia	yesenia@example.org	f	2017-11-13 18:45:49.823012	2017-11-13 18:45:49.823012	$2a$10$IPCMeA13ea3s.O4lifwIM.4FfdJwsqEpuwCzutjm8vinlcmKWdj2O		\N	\N
53	Adriel	adriel@example.org	f	2017-11-13 18:45:49.891293	2017-11-13 18:45:49.891293	$2a$10$JKQ.fhL5NQ44mnvkybr6weUs.lzfQ89ErYo.Gs.cf0hhpcXfCzAwK		\N	\N
54	Marilou	marilou@example.org	f	2017-11-13 18:45:49.96029	2017-11-13 18:45:49.96029	$2a$10$iT3zS895r8q4dUVuI3BD7uKjNbR82uREni0zzPxfTifeP31gWEOSC		\N	\N
55	Alfonso	alfonso@example.org	f	2017-11-13 18:45:50.028307	2017-11-13 18:45:50.028307	$2a$10$pldHePvZHeWLT8sJE8De3emkdJLFDHeFslm8MQiibjo43bsz4vpLO		\N	\N
56	Kellen	kellen@example.com	f	2017-11-13 18:45:50.096203	2017-11-13 18:45:50.096203	$2a$10$DExnba1pVJltmiCTEwhvgemJbxExLbUYlpbp4hzU5g0tAnNVfG5Iu		\N	\N
57	Celine	celine@example.com	f	2017-11-13 18:45:50.165512	2017-11-13 18:45:50.165512	$2a$10$ab3hLxH26wvFqpTasZNr6OlYeWuj/GlYkmLh0RxxnUNhz5armgek2		\N	\N
58	Kolby	kolby@example.net	f	2017-11-13 18:45:50.240793	2017-11-13 18:45:50.240793	$2a$10$lPtOwFUeRYEDLVsR.iYNSOPFFt95PeMwExFoU.3CpNfPQPTzH7wom		\N	\N
59	Amir	amir@example.org	f	2017-11-13 18:45:50.309376	2017-11-13 18:45:50.309376	$2a$10$7nS/fmYs1R5aQcVz9BFNwuGo1aBqees5djCVZMnNESdKbcj3JN.8a		\N	\N
60	Pat	pat@example.com	f	2017-11-13 18:45:50.377915	2017-11-13 18:45:50.377915	$2a$10$HrIzC8Dff7aqVasoZ.Ic3Ob1P7OKFtAGtN1tOaiHzoWTRRfmc/7hO		\N	\N
61	Ellsworth	ellsworth@example.net	f	2017-11-13 18:45:50.445618	2017-11-13 18:45:50.445618	$2a$10$kRsL.yAT5ZAZstIX7xxlw.fCTtvOb7dTg.YS7gNrQKraCt6v3Zyqu		\N	\N
62	Keagan	keagan@example.com	f	2017-11-13 18:45:50.514097	2017-11-13 18:45:50.514097	$2a$10$MzvLVY9EtR.Rw0i2tNtc6O1/RE3cuPgQFA3feK1eIOpVnPobGOini		\N	\N
63	Alessandro	alessandro@example.org	f	2017-11-13 18:45:50.582292	2017-11-13 18:45:50.582292	$2a$10$LfXpAD46jsmKfsvVDKpvSuEiXrfJn9LqkX1.Hx1SPNEEXJlyRMeEu		\N	\N
64	Darien	darien@example.org	f	2017-11-13 18:45:50.650492	2017-11-13 18:45:50.650492	$2a$10$bJ6dpriXF9MdniEfoxeHF.wNIPuzb1P0s.ExXGGt5vpRyZOZONRrC		\N	\N
65	Euna	euna@example.com	f	2017-11-13 18:45:50.718834	2017-11-13 18:45:50.718834	$2a$10$qocCNJx/r1rt6ghy6k3C4O89uOa5SrZ1ZLlmQx6kB8c905HY/ciK2		\N	\N
66	Ethyl	ethyl@example.com	f	2017-11-13 18:45:50.787126	2017-11-13 18:45:50.787126	$2a$10$rbG8xzKRWiL3zxZI5Aaw9efGGIyoYYCHYEqWpCFsWYUt8HFnC3u.O		\N	\N
67	Myah	myah@example.com	f	2017-11-13 18:45:50.85565	2017-11-13 18:45:50.85565	$2a$10$ZA6.n6wZSh/PgZzqI7yKH.d/ouuoRaHRbGnZYJ.KjHO7.F7Tifrd.		\N	\N
68	Jacques	jacques@example.net	f	2017-11-13 18:45:50.923891	2017-11-13 18:45:50.923891	$2a$10$PQgyUOPHtFNqhxC3JoBjpuKHoLCXYPuhLXgqQJnE/5F62m/INWZbG		\N	\N
69	Kylie	kylie@example.com	f	2017-11-13 18:45:50.992578	2017-11-13 18:45:50.992578	$2a$10$7iqDw8ipwLeJmZAA9/YMgeM/LHfVsPDk8uRa2e7n3S9B3SPZR8J5K		\N	\N
70	Kirstin	kirstin@example.net	f	2017-11-13 18:45:51.061918	2017-11-13 18:45:51.061918	$2a$10$jqXswE.thCGCzDMGsROzDO5XGg5XndecGLnl2TT14bNOJAklpVOTy		\N	\N
71	Destiny	destiny@example.com	f	2017-11-13 18:45:51.130467	2017-11-13 18:45:51.130467	$2a$10$vH/7x0uLaTv2Iy36CKjHdeqt42Q0v2Vhmm.dzgi2ZegAidV9JcpRK		\N	\N
72	Isac	isac@example.net	f	2017-11-13 18:45:51.198903	2017-11-13 18:45:51.198903	$2a$10$LzyIVsXAiJoGb0VjQgqgA.sbpBDQLYLOHQYyRcNK3BCoFFtyeoIuS		\N	\N
73	Will	will@example.net	f	2017-11-13 18:45:51.26723	2017-11-13 18:45:51.26723	$2a$10$H5uS7FjezoZWuLN5Zm5AGeYuW6JI/1SMZtgMyjbktWCx0ArH1R8WC		\N	\N
74	Agustina	agustina@example.net	f	2017-11-13 18:45:51.335751	2017-11-13 18:45:51.335751	$2a$10$xBME0UMhRomspvF7IGc5Z.QSGGQzggr8r6HfERhY9xwOGaw0rk2X2		\N	\N
75	Muriel	muriel@example.com	f	2017-11-13 18:45:51.404184	2017-11-13 18:45:51.404184	$2a$10$RJ/utTGqRWf/puQQXhqf.uN/QwbMR0yIF8xEKtNW73XPyQPwib3Hu		\N	\N
76	Therese	therese@example.com	f	2017-11-13 18:45:51.473012	2017-11-13 18:45:51.473012	$2a$10$zE9.1OE4HVeBOC8WnD9GAeHoXZT4H4DG7khrISRg.hz6U55NoXUC2		\N	\N
77	Alexzander	alexzander@example.com	f	2017-11-13 18:45:51.541576	2017-11-13 18:45:51.541576	$2a$10$66Me5JlBvplqN8LQUpoly.zU/DFK85eHDpbeuZVLGuIMNFFBvP1pK		\N	\N
78	William	william@example.org	f	2017-11-13 18:45:51.608049	2017-11-13 18:45:51.608049	$2a$10$t6RU8j56aoAcY.N1KR4oi.qVWqrI8H5q/Q1Y8ylyauFYLeyWRJ/Gq		\N	\N
79	Jena	jena@example.org	f	2017-11-13 18:45:51.674338	2017-11-13 18:45:51.674338	$2a$10$5G4xMZj08v3SQsT7TLhLDObsaMJMkTXbFTukGTMWFO0jGjj38gECi		\N	\N
80	Darrin	darrin@example.com	f	2017-11-13 18:45:51.740687	2017-11-13 18:45:51.740687	$2a$10$9g3M/JdyAUAFUsUjf8A0buah3sLar2TUo73VXhYDIjDSFTOrd7vUi		\N	\N
81	Lemuel	lemuel@example.org	f	2017-11-13 18:45:51.806984	2017-11-13 18:45:51.806984	$2a$10$YoMdlyVJZgHzmUzd5AXnLuUPpUqpMUi41WRMEGhnO7jYjJe6ot/cm		\N	\N
82	Rusty	rusty@example.org	f	2017-11-13 18:45:51.873328	2017-11-13 18:45:51.873328	$2a$10$1ylNrtd1RKSHM5/2dz7S.uUTWeCgsKv3q4Jfc7EbpEh70uBWRF1cK		\N	\N
83	Allene	allene@example.com	f	2017-11-13 18:45:51.946072	2017-11-13 18:45:51.946072	$2a$10$UkzsY6CibeRwn43j.KM.h.Gcr9KWgKpRoN0WgZTOADVe./976aSyC		\N	\N
84	Ayden	ayden@example.org	f	2017-11-13 18:45:52.012801	2017-11-13 18:45:52.012801	$2a$10$hUkknSbx/yhE9gmvdSgSee1WIiMk0qicz3swk.2Og3q.duG19DNGi		\N	\N
85	Bell	bell@example.com	f	2017-11-13 18:45:52.079386	2017-11-13 18:45:52.079386	$2a$10$JbuW8yp9CLTGSdFxD87wSOlk4T0h7dHLXKlIJ1CKH6ncBu8jOy70G		\N	\N
86	Myrtie	myrtie@example.net	f	2017-11-13 18:45:52.145965	2017-11-13 18:45:52.145965	$2a$10$sGxv2HdK2wmMgYREYbptNOQgYhX5DZKMJxEbv57TjDs5jthp7RKJG		\N	\N
87	Leonardo	leonardo@example.com	f	2017-11-13 18:45:52.212376	2017-11-13 18:45:52.212376	$2a$10$MkZ2vmuD50VVRjZgS.BqceEYaCznxhXBIJ/csCrZZNU5axg6I59iO		\N	\N
88	Eulah	eulah@example.org	f	2017-11-13 18:45:52.278895	2017-11-13 18:45:52.278895	$2a$10$gNg0pqgvUVe.fWfmWd0SJO/ly3O7a9zIPAT6ZPJMmuu4vm51Kg0AK		\N	\N
89	Ariane	ariane@example.net	f	2017-11-13 18:45:52.351897	2017-11-13 18:45:52.351897	$2a$10$HFwu510/4qPSL1UTvQu6Te3qCWapUGv7RWqrS0L6qatictzXF5Kqq		\N	\N
90	Quincy	quincy@example.org	f	2017-11-13 18:45:52.418506	2017-11-13 18:45:52.418506	$2a$10$KLPAebBMygUpHsLO6YvzPec0EbkIRI2RKhwecQSjJXTmX5YVUB4Zi		\N	\N
91	Marcel	marcel@example.org	f	2017-11-13 18:45:52.48524	2017-11-13 18:45:52.48524	$2a$10$a4MENNCWPz.QPkS1CV4L7Oz6M45x3R3wgrGDJOJ1MqeTr0wcRE12i		\N	\N
92	Javon	javon@example.com	f	2017-11-13 18:45:52.551766	2017-11-13 18:45:52.551766	$2a$10$rRkkuodZrFCAWK/6YmCq8uOWs0rkzUxhieXItuvRF4KytYoZQWzVu		\N	\N
93	Kathlyn	kathlyn@example.com	f	2017-11-13 18:45:52.618139	2017-11-13 18:45:52.618139	$2a$10$esZL543IEdGynsWsFFHqleLmGLpG63J56KWvyG2Xgta3VcgMncyOu		\N	\N
94	Alexys	alexys@example.com	f	2017-11-13 18:45:52.684555	2017-11-13 18:45:52.684555	$2a$10$UlISktu2NYGX.U65/okLzuDUao0imBjJ5vJgnKGGicpnHGiivi4Im		\N	\N
95	Keyshawn	keyshawn@example.org	f	2017-11-13 18:45:52.750988	2017-11-13 18:45:52.750988	$2a$10$wj9dXhamc/t8tvF0WITDaOGjfQgrbyAg4MVdQq3rx3vQRdAWdOCq.		\N	\N
96	Emile	emile@example.com	f	2017-11-13 18:45:52.817318	2017-11-13 18:45:52.817318	$2a$10$Ro1hv1bGhTJP20P4Y4p06u0JykgV8ABNH0ZOf1EwGwsawevM9nuoW		\N	\N
97	Adah	adah@example.org	f	2017-11-13 18:45:52.883747	2017-11-13 18:45:52.883747	$2a$10$ZmLDi8w30qE4i6..zHhYuOVAezEUnb76TrT0sdAnAOX.6Lf1IYgn.		\N	\N
98	Trenton	trenton@example.org	f	2017-11-13 18:45:52.95025	2017-11-13 18:45:52.95025	$2a$10$QY3RxtLr5eG8cF4sZSOiLOS5QfX6ULBFC21BgC3D2cJnCJW7dR1HO		\N	\N
99	Devin	devin@example.org	f	2017-11-13 18:45:53.025383	2017-11-13 18:45:53.025383	$2a$10$h5i0Q0jX2.sBaugj6X4mrOoCB24qyEppeOIkdQSaWvIV7aQPok8a2		\N	\N
100	Jaron	jaron@example.net	f	2017-11-13 18:45:53.094166	2017-11-13 18:45:53.094166	$2a$10$e6MmpdOwQelfWHo6mQJTt.6reGASfk6F.Q18j7Sre/KtblMIRIGji		\N	\N
101	Kaylee	kaylee@example.com	f	2017-11-13 18:45:53.163007	2017-11-13 18:45:53.163007	$2a$10$cdFdON.7jA1LmUYF58HzXuWvnRKcCGGixavOaV4g8lsMMyG3zymHy		\N	\N
102	Rosemary	rosemary@example.com	f	2017-11-13 18:45:53.231714	2017-11-13 18:45:53.231714	$2a$10$y.bxopgh1/3M68oNXEzqV.9uFnwR9BKCE2YdPCdqU61nPvIMIoBkC		\N	\N
103	Gilda	gilda@example.net	f	2017-11-13 18:45:53.30008	2017-11-13 18:45:53.30008	$2a$10$Mpw.GRL1xyZCPMwQhRQOVOv6knTH6M8dQatOft/9QqxGguJnPchwe		\N	\N
104	Rosetta	rosetta@example.com	f	2017-11-13 18:45:53.368603	2017-11-13 18:45:53.368603	$2a$10$g2Dk0gUNjtXsSdUYgtN/NekDV7DWoK9EUn8Vjivvzl68R9sTXqO7C		\N	\N
105	Wava	wava@example.net	f	2017-11-13 18:45:53.437123	2017-11-13 18:45:53.437123	$2a$10$QHIVCRLHevyk8xiGs8abGuHUlW6HqGEezM1i4lCyjvSJGhWne1mqi		\N	\N
106	Markus	markus@example.com	f	2017-11-13 18:45:53.505344	2017-11-13 18:45:53.505344	$2a$10$Qq/5hwhQS/vlp2T8N/Hf..sYzTQg1kwcTLZza6rLjbzXoP3CbvDWq		\N	\N
107	Gudrun	gudrun@example.org	f	2017-11-13 18:45:53.57402	2017-11-13 18:45:53.57402	$2a$10$1u6FWEUOGVGbB1Tl94xSUObCDExAbbEa4U5Lsw1cCJj6IuEicp4W6		\N	\N
108	Deja	deja@example.org	f	2017-11-13 18:45:53.642635	2017-11-13 18:45:53.642635	$2a$10$jrhTId.eyQ8cbxhFZZsARO.qOjWwmXRssqMKn72UDUB6WsxYuo7M.		\N	\N
109	Corine	corine@example.org	f	2017-11-13 18:45:53.711609	2017-11-13 18:45:53.711609	$2a$10$eCWxlxdi7L9PBDzE222xhuVDlEQiDyHNteNrzUwqdOq4gTqsJYWGy		\N	\N
110	Patricia	patricia@example.net	f	2017-11-13 18:45:53.78033	2017-11-13 18:45:53.78033	$2a$10$ZDaQh1TcgjakxBUizkIo3Oydqc9Z1J72UXhgr8AsMIFq2cHB5ButW		\N	\N
111	Magnus	magnus@example.org	f	2017-11-13 18:45:53.848748	2017-11-13 18:45:53.848748	$2a$10$3MhqaGWV7FIIrplsCIb25.x6fz37XPtUTrAM1m81LXQHTvxxnI1Am		\N	\N
112	Nettie	nettie@example.org	f	2017-11-13 18:45:53.916972	2017-11-13 18:45:53.916972	$2a$10$NJRHxmwBF1DitieBfLq1We/TMI/L23oGw6xbywk5/UwY/XhTIjzbm		\N	\N
113	Fernando	fernando@example.org	f	2017-11-13 18:45:53.98509	2017-11-13 18:45:53.98509	$2a$10$zoOUuTzkc1ri6e5kY0Sw5uAAhZlXKfeaRZBvfVoyLY9r.qVHQPHtu		\N	\N
114	Manuela	manuela@example.org	f	2017-11-13 18:45:54.05407	2017-11-13 18:45:54.05407	$2a$10$WVjAg6Ke0N9pk0XPN.fEk.bcGH5Vq6NiVIK.4ir/EPgRbS/mjWaDC		\N	\N
115	Lola	lola@example.net	f	2017-11-13 18:45:54.122484	2017-11-13 18:45:54.122484	$2a$10$z1As4nSxrO/qeuqQ7u5Wr.69SfFt5YQifk5YQfuVF/4cpTQo5AN0C		\N	\N
116	Emilie	emilie@example.org	f	2017-11-13 18:45:54.190505	2017-11-13 18:45:54.190505	$2a$10$shbn301TvsLo4qGgP999AORq8gXeslkUs1lNGdj/2ehBlA/6QQXWW		\N	\N
117	Mitchell	mitchell@example.org	f	2017-11-13 18:45:54.258935	2017-11-13 18:45:54.258935	$2a$10$3eCpttz1WA3e1LzoQYjOk.HePdhi7zKigN8NdPmi3OpJBDFYE2z2O		\N	\N
118	Leola	leola@example.net	f	2017-11-13 18:45:54.327544	2017-11-13 18:45:54.327544	$2a$10$djDqNSXIGlb0n5dv25AurepUua50KQdDjaErzXQQbooI6blao/G3G		\N	\N
119	Linda	linda@example.net	f	2017-11-13 18:45:54.395565	2017-11-13 18:45:54.395565	$2a$10$yhTzW4dN6IDZNunwF19MUO2JsmaWLr830j9DYkTrNh4DiP.3KzK1O		\N	\N
120	Franz	franz@example.org	f	2017-11-13 18:45:54.464453	2017-11-13 18:45:54.464453	$2a$10$r0IjQTrjpRBcuF/aR.jEw.kJXczJQXWzq.gq.zgi4C8yGSDZj9Hba		\N	\N
121	Felton	felton@example.com	f	2017-11-13 18:45:54.533159	2017-11-13 18:45:54.533159	$2a$10$9CGCcRfS8lQWEsrvbmrI4ejwLPXzgT3eDgTBUFZTnA61llnp99f1G		\N	\N
122	Foster	foster@example.org	f	2017-11-13 18:45:54.60101	2017-11-13 18:45:54.60101	$2a$10$oXHQZE4EDWvyGemr2lT.0uBcrgyILgSpo7MgSVci3qN3ymESlang6		\N	\N
123	Sheridan	sheridan@example.com	f	2017-11-13 18:45:54.669527	2017-11-13 18:45:54.669527	$2a$10$b4Q3QrLsD/E5HfeB8wU4/OGZIH7EBLN4E3hJPpJz/YiXJfF78kIzO		\N	\N
124	Rosalee	rosalee@example.net	f	2017-11-13 18:45:54.738043	2017-11-13 18:45:54.738043	$2a$10$sC1/UG3oCLRsJuGCrunxVeES8nFOgqAEvBw1MZyuS33rxi2Z5xxs6		\N	\N
125	Mable	mable@example.net	f	2017-11-13 18:45:54.807442	2017-11-13 18:45:54.807442	$2a$10$9WTnukdLBy8xEUUJGuYnMu73J7hXxks4.N3tWTCanzJ5FEImwgmzq		\N	\N
126	Mitchel	mitchel@example.com	f	2017-11-13 18:45:54.876144	2017-11-13 18:45:54.876144	$2a$10$eiHSN0BrCtuQN2g./EUcgey.eLQs7u3mltOmd0hea7PwS0GBC65Jm		\N	\N
127	Magdalena	magdalena@example.org	f	2017-11-13 18:45:54.943712	2017-11-13 18:45:54.943712	$2a$10$2vuDWNX79gJ9wYmeMmW93.VdphYU1j/MlDSsb2l2ZHvGzzDl96SpK		\N	\N
128	Evan	evan@example.org	f	2017-11-13 18:45:55.012099	2017-11-13 18:45:55.012099	$2a$10$7FszRx0ckVODJuRmssBuS.5RDD788Ko/HrQx8vLyOhTCfBpxnui8y		\N	\N
129	Camren	camren@example.org	f	2017-11-13 18:45:55.080362	2017-11-13 18:45:55.080362	$2a$10$BsUhVv0T8pQmpGIiwfZN0uCrZYo/EXoJsPhqftTVHwYBVGzavqKJW		\N	\N
130	Eudora	eudora@example.net	f	2017-11-13 18:45:55.148495	2017-11-13 18:45:55.148495	$2a$10$Wm3vbsi8eLqGbny8wzbxy.3/90tXTahZf8PGFLADE0ZRh/6mQP6hW		\N	\N
131	Shayna	shayna@example.net	f	2017-11-13 18:45:55.216862	2017-11-13 18:45:55.216862	$2a$10$u30L.c3u4DORx0oUdSnQ..seOyXwjvZZtyLsSa898LUzEQY0RDj0a		\N	\N
132	Jerod	jerod@example.org	f	2017-11-13 18:45:55.285265	2017-11-13 18:45:55.285265	$2a$10$Cs3k6IHOd2r31HQXsdHZPOLd7FGtMTvgSCksEUkqvxgMYxQ5.G/7.		\N	\N
133	Sophia	sophia@example.net	f	2017-11-13 18:45:55.353058	2017-11-13 18:45:55.353058	$2a$10$cBxNxEpukIs.hftAr941qekko2FEj5LNOpfoLzsx3aphY3lRovu4e		\N	\N
134	Earlene	earlene@example.org	f	2017-11-13 18:45:55.421705	2017-11-13 18:45:55.421705	$2a$10$zj9wpjT.ewts9mVoVgmZZuDCSe0klyFdNCpgEA1zD0JljUBqo96GG		\N	\N
135	Cleta	cleta@example.org	f	2017-11-13 18:45:55.490757	2017-11-13 18:45:55.490757	$2a$10$32SEfFgREy3a6Jk/AYNfv.My6MFFDGeuGuSeATLROC9OY30UyUco6		\N	\N
136	Edwina	edwina@example.com	f	2017-11-13 18:45:55.55952	2017-11-13 18:45:55.55952	$2a$10$mqK42.vdrUEFz0vRss7X1u5drtIcqZ9/ad9.XDaGR2G.zKh7eIXSO		\N	\N
137	Brianne	brianne@example.net	f	2017-11-13 18:45:55.628164	2017-11-13 18:45:55.628164	$2a$10$B2b94q8BPgk1E4bKMg3/VeX43O4AUWalJRUUqfvZLj183R8Vhs9We		\N	\N
138	Cesar	cesar@example.com	f	2017-11-13 18:45:55.696715	2017-11-13 18:45:55.696715	$2a$10$k4cKxYa2X0kAwa.XANvQSe2lIWY0J3BbHP2QlcAEJuYaWHaiGeSWi		\N	\N
139	Maurine	maurine@example.net	f	2017-11-13 18:45:55.764383	2017-11-13 18:45:55.764383	$2a$10$DYTe6LbdRcLsWvFemj0fR.T6yxx/7WeCzrYBnHh95nhaZ19M5XpnK		\N	\N
140	Jonatan	jonatan@example.com	f	2017-11-13 18:45:55.832095	2017-11-13 18:45:55.832095	$2a$10$69F7eAMjCcdn.Md36Cl4xO4BkxXHhh1T2rOB9Mk7vAMIAUnYlVe5O		\N	\N
141	Mortimer	mortimer@example.net	f	2017-11-13 18:45:55.900634	2017-11-13 18:45:55.900634	$2a$10$o2s2mp3ZH3pT/kYjIwq1EeJJGtSzavNYCFdZ3c7f/8PgNoALunjgu		\N	\N
142	Anastacio	anastacio@example.org	f	2017-11-13 18:45:55.969499	2017-11-13 18:45:55.969499	$2a$10$wDRFCwvY/kRoYepQoLEcyeMbglR4p63jxHAf7UsYbFVMtiwnWrlaq		\N	\N
143	Orlo	orlo@example.org	f	2017-11-13 18:45:56.037588	2017-11-13 18:45:56.037588	$2a$10$b6/lFfmSvytF4WwyG/9.CuiFj7QLMkpzxv2esC.cIbd4dvonJ/C5.		\N	\N
144	Norene	norene@example.com	f	2017-11-13 18:45:56.106352	2017-11-13 18:45:56.106352	$2a$10$crtjobAO8r7A0g3rORxG3.jVblt6URFGVg6Cv4ArfenXLQkLQvYrG		\N	\N
145	Marc	marc@example.net	f	2017-11-13 18:45:56.175234	2017-11-13 18:45:56.175234	$2a$10$hI7e7pTxAg7f0Xi.g2.IVe84z.PLSvFd.PNDb3LW5.IuauFNNz2Uu		\N	\N
146	Alicia	alicia@example.net	f	2017-11-13 18:45:56.243974	2017-11-13 18:45:56.243974	$2a$10$qBEwHxnom5jGkeGZnmlrveTRAK5QtKnW6500umd.I0QincW9fhr6O		\N	\N
147	Merle	merle@example.org	f	2017-11-13 18:45:56.312846	2017-11-13 18:45:56.312846	$2a$10$g22Wij3zWzwzt1B2LWlnuecPH/MxH4HIOjMDKK51m5lvsk/KVySbi		\N	\N
148	Deonte	deonte@example.net	f	2017-11-13 18:45:56.381674	2017-11-13 18:45:56.381674	$2a$10$eekVh4FtOEIC4kOPFCyeqeGcnfCdbWiJcQGfqq4KS5y2dh2uhE7hO		\N	\N
149	Vickie	vickie@example.com	f	2017-11-13 18:45:56.450603	2017-11-13 18:45:56.450603	$2a$10$Eb1T4MELTdN4mqb1NZKsse5Pf/FPuTYso1HMkkVlIWWHwl.zhhgUu		\N	\N
150	Brandt	brandt@example.org	f	2017-11-13 18:45:56.527892	2017-11-13 18:45:56.527892	$2a$10$qLg5snKKvo0aWC.yoUAOTOPYQUSiPk/.lUBl0N76ZTXoZsxKq5SnG		\N	\N
151	Raul	raul@example.com	f	2017-11-13 18:45:56.60354	2017-11-13 18:45:56.60354	$2a$10$xDN0QjqO5LYhsirRtE3NquS8beOmZjYKq1i6SlhT8qdrFAI3f4RjW		\N	\N
152	Cade	cade@example.org	f	2017-11-13 18:45:56.672212	2017-11-13 18:45:56.672212	$2a$10$8xURZSAjV8mOSIcefnynYulnXsfdlvyTn9xFYKeEteV4BhTx/jBR6		\N	\N
153	Charley	charley@example.com	f	2017-11-13 18:45:56.741679	2017-11-13 18:45:56.741679	$2a$10$ykByf225Yvkt9tvpIHOXKO2TEDHkgTbfMSVq8sS9kgs6fpY62DKOy		\N	\N
154	Candido	candido@example.net	f	2017-11-13 18:45:56.810351	2017-11-13 18:45:56.810351	$2a$10$.8TXUTsZWBkfRa3iCTjsHeMXmhxq2GloZLAxeVhYujWH3uqWOQfVO		\N	\N
155	Addison	addison@example.net	f	2017-11-13 18:45:56.878305	2017-11-13 18:45:56.878305	$2a$10$79Ys4IVC7j9OAiBTr8m.burrFpDA07pnfTmVfU58Ly/OwW1PPF706		\N	\N
156	Lilly	lilly@example.com	f	2017-11-13 18:45:56.946852	2017-11-13 18:45:56.946852	$2a$10$6y8E0zYPFog6fft2hJyrqOCNvEIbiBSFwJW4r3WpIRG4yAYKV/4Ee		\N	\N
157	Eldon	eldon@example.org	f	2017-11-13 18:45:57.02128	2017-11-13 18:45:57.02128	$2a$10$z4tl9ECPk.Jo2aAjlpEsT.yMYugV1tbOwIXdPLdEMDtgD3lT66yMy		\N	\N
158	Henry	henry@example.net	f	2017-11-13 18:45:57.09083	2017-11-13 18:45:57.09083	$2a$10$IbyI94xhV15yHIZ5hshKdOFC/gyYKC4pKLWJAzG4xyd4yJq7T1d6C		\N	\N
159	Alberto	alberto@example.net	f	2017-11-13 18:45:57.160052	2017-11-13 18:45:57.160052	$2a$10$b9lEZL33E12lZ04qv7FdI.kPw2.uvrlAd2Ii32w9daPh0dgwPgIIi		\N	\N
160	Orpha	orpha@example.org	f	2017-11-13 18:45:57.227128	2017-11-13 18:45:57.227128	$2a$10$.MWUIgytVye87qnaqP.TmeX9Suw3qinMh3tvEIv5QYgGJhPi8p2/C		\N	\N
161	Payton	payton@example.org	f	2017-11-13 18:45:57.295575	2017-11-13 18:45:57.295575	$2a$10$xCWERctLDaO8XOT4F3TDuOn/QOWRb.I.1Fl5ku67zlLZGxh6bnBUK		\N	\N
162	Leilani	leilani@example.org	f	2017-11-13 18:45:57.363706	2017-11-13 18:45:57.363706	$2a$10$lE34WVcVydxnrs4mzRz.ROQ10/9rfUDKAHroitEjr.WiL1EXvrNKa		\N	\N
163	Mustafa	mustafa@example.net	f	2017-11-13 18:45:57.432109	2017-11-13 18:45:57.432109	$2a$10$RmCw4d5s0Tx9RxOTo/6u/ehUFyPzzU2RARy3/gl6j7tl9i7mOkQ1a		\N	\N
164	Elenora	elenora@example.org	f	2017-11-13 18:45:57.501649	2017-11-13 18:45:57.501649	$2a$10$7f/NYEpjX4RGRdZxTbc4Reau1.wID4XPpbmLcpb42Z1EVDtnvEnMy		\N	\N
165	Daniela	daniela@example.com	f	2017-11-13 18:45:57.570826	2017-11-13 18:45:57.570826	$2a$10$Y3djE.YiR3ealc1TWeAQHe2ZkjcXuwqU4pb0s5HYPX3HoGm.sxVom		\N	\N
166	Kelli	kelli@example.org	f	2017-11-13 18:45:57.639141	2017-11-13 18:45:57.639141	$2a$10$n.nMbi2CXRPvNvraRyH8duKl9jHoowZMLL/cQEeXuhGyWbNTQ.LA6		\N	\N
167	Jonas	jonas@example.com	f	2017-11-13 18:45:57.707733	2017-11-13 18:45:57.707733	$2a$10$MWlmXr3ZZxWx8V6IxuvFhOco.27eXeZDdo9D5YeKhP7OB2dRk2JH6		\N	\N
168	Mckayla	mckayla@example.org	f	2017-11-13 18:45:57.775907	2017-11-13 18:45:57.775907	$2a$10$H8fSEtRs1SLz8mfDh4m2ie0PB9F/pf3xye0Ij4nburi3aNpfktXP2		\N	\N
169	Emelie	emelie@example.org	f	2017-11-13 18:45:57.843969	2017-11-13 18:45:57.843969	$2a$10$vAmbpVA07JAcWWQjC13k4OIgDQS66vheTlRGDDi9k3L3wcjc0wh8K		\N	\N
170	Osvaldo	osvaldo@example.net	f	2017-11-13 18:45:57.912255	2017-11-13 18:45:57.912255	$2a$10$6xdqA/eByNyvDULQxUyfpuDFBeL54cDG3EqIDORN7pdxBaWdjUjF2		\N	\N
171	Laney	laney@example.org	f	2017-11-13 18:45:57.980723	2017-11-13 18:45:57.980723	$2a$10$AD58EZJD9lB9G6xQEsVfk.3RxZ2.QYHAZ7grHpKzYmkgX9uVzF9aS		\N	\N
172	Arnaldo	arnaldo@example.net	f	2017-11-13 18:45:58.049736	2017-11-13 18:45:58.049736	$2a$10$xa9V0D/p1qkvaRhgZ1IRoO2Wv5S6jOYG5xRgkosn9Gp4anq20y2cG		\N	\N
173	Benton	benton@example.org	f	2017-11-13 18:45:58.118421	2017-11-13 18:45:58.118421	$2a$10$InJmCl/Xns5UN7DhDPwXjulNoGo1YWNEndzWlhKESdUG6fASsYhj6		\N	\N
174	Fanny	fanny@example.net	f	2017-11-13 18:45:58.18634	2017-11-13 18:45:58.18634	$2a$10$X58DtQgZASOZP0d6roYZI.19u4uQ49IGCTsz5TDM9OrVSy2SMfkOe		\N	\N
175	Twila	twila@example.net	f	2017-11-13 18:45:58.255038	2017-11-13 18:45:58.255038	$2a$10$.YuoS/UQjqiR7QMQKLw8rObdn0PZIHsgv.iokZ4RsS6Tpo2NlFzCW		\N	\N
176	Scotty	scotty@example.com	f	2017-11-13 18:45:58.330812	2017-11-13 18:45:58.330812	$2a$10$eVSyzFMZzYNvOZ.NM1c/zeU3rZefQj2tbzAf7kXHsSW.H0h8HKl3K		\N	\N
177	Britney	britney@example.net	f	2017-11-13 18:45:58.4004	2017-11-13 18:45:58.4004	$2a$10$cyP3AOCgZQgfeQypba2id.L2gv8qX13mM/P.pCFmdzA9iN/3iki3a		\N	\N
178	Kyleigh	kyleigh@example.org	f	2017-11-13 18:45:58.470072	2017-11-13 18:45:58.470072	$2a$10$Wxv.gD220gvsP.mVIfxcnOXZSZSbha7IkiZwy/qGAo1XqsMEkEtWS		\N	\N
179	Devonte	devonte@example.net	f	2017-11-13 18:45:58.545065	2017-11-13 18:45:58.545065	$2a$10$BinRP8z/q1N17zedIK25HeZlcthqAwdSvkRun86WNubALp/YC7oFy		\N	\N
180	Leslie	leslie@example.com	f	2017-11-13 18:45:58.613391	2017-11-13 18:45:58.613391	$2a$10$tUTFsjbktjJg/pyWYv2D0uI4qyCCxqmCHmAwxQv8mQk8yoscB0/T2		\N	\N
181	Arnoldo	arnoldo@example.net	f	2017-11-13 18:45:58.681878	2017-11-13 18:45:58.681878	$2a$10$sOL8laFzovuZsDOly2VGweUsSdo4JmOicZmJEhjso8OJvujGpE/iW		\N	\N
182	Lottie	lottie@example.org	f	2017-11-13 18:45:58.750386	2017-11-13 18:45:58.750386	$2a$10$cBA/HVe4QSDZWULKOvC73uvKNwCr25pF0iAGdkLXFcvyGU4wWzhQq		\N	\N
183	Romaine	romaine@example.org	f	2017-11-13 18:45:58.820036	2017-11-13 18:45:58.820036	$2a$10$qTqOi84Huv8XcmimvE.2bO.fGE29IcBXYxsP.s3odlH3AGlqFuaae		\N	\N
184	Cole	cole@example.com	f	2017-11-13 18:45:58.888662	2017-11-13 18:45:58.888662	$2a$10$TO1RJZhCnUSnz6ZtxMp8kedxv8507AnyXFLFWae0a3f5H/jBlCEt.		\N	\N
185	Raina	raina@example.net	f	2017-11-13 18:45:58.957635	2017-11-13 18:45:58.957635	$2a$10$WqzXc4BTwvRnGgv7CC0RtuCdd6AMBDLyYKP09atoxyUEpvNdN2A22		\N	\N
186	Josephine	josephine@example.com	f	2017-11-13 18:45:59.025801	2017-11-13 18:45:59.025801	$2a$10$8F3FwZ7Ua2rSjSAZciMRLuWYKZy68Ac15.yflFYpgqrlfeGs9iKUi		\N	\N
187	Jacinto	jacinto@example.net	f	2017-11-13 18:45:59.095499	2017-11-13 18:45:59.095499	$2a$10$BxKjnBBGqWviOp/xhnfcv.BmibxmIfbeqbEYK1K6.uX.E4JAAv9wO		\N	\N
188	Logan	logan@example.net	f	2017-11-13 18:45:59.164207	2017-11-13 18:45:59.164207	$2a$10$7O9XRnchp9R2crK84N4sDeAiJ3GDbMCaUROKaLvulVspgVzwM7PiW		\N	\N
189	Rubie	rubie@example.net	f	2017-11-13 18:45:59.232964	2017-11-13 18:45:59.232964	$2a$10$p3YD7IMnJBAffQyBp29mLOSHdOJy4B.S7c8HVMNH7HXHBcMfo5pnq		\N	\N
190	Benjamin	benjamin@example.org	f	2017-11-13 18:45:59.301095	2017-11-13 18:45:59.301095	$2a$10$G95R3eit0rxTwIBJUIRoze5Tx8nCWtYIAmi6M.mj3o3b5oTSIaGQC		\N	\N
191	Vernice	vernice@example.org	f	2017-11-13 18:45:59.36958	2017-11-13 18:45:59.36958	$2a$10$0zZYvyRuI5.6P./dH4YHWOVA5dCXsP.AbTLgjgwOgua7.oMhRL9HC		\N	\N
192	Roger	roger@example.com	f	2017-11-13 18:45:59.437985	2017-11-13 18:45:59.437985	$2a$10$CTCPaBVvk9wo2hbN34LSJeTrOGXCucG4LMXCcx54uAW3EoAU.Rua2		\N	\N
193	Glennie	glennie@example.net	f	2017-11-13 18:45:59.506999	2017-11-13 18:45:59.506999	$2a$10$iQ4TIob8rPltWmf3.Z6c6O97Yvru7AHO2bXEahfxibPBoq40Sszue		\N	\N
194	Cecelia	cecelia@example.com	f	2017-11-13 18:45:59.576351	2017-11-13 18:45:59.576351	$2a$10$hngfLR0YPtNmBwMasSkNpeh1azoQQODh8EHaZIm.vEDNX7W2yPRAm		\N	\N
195	Drake	drake@example.com	f	2017-11-13 18:45:59.656358	2017-11-13 18:45:59.656358	$2a$10$QxMr.ifjowqS28nDPB0/ke3L7bLzlqD0ty8dg5hYgILjzC0w2YH0C		\N	\N
196	Vinnie	vinnie@example.org	f	2017-11-13 18:45:59.72491	2017-11-13 18:45:59.72491	$2a$10$LAW09THY4XcqJWaQMHSgwuOw2aUvpygYqE6p06rjLK3w.K3wTpRui		\N	\N
197	Scot	scot@example.org	f	2017-11-13 18:45:59.792904	2017-11-13 18:45:59.792904	$2a$10$jpJJL9WrMf/XcVFJnf7MaeRFSgowp72nyoXS4YAMnFbII7zGqnjxi		\N	\N
198	Piper	piper@example.org	f	2017-11-13 18:45:59.861712	2017-11-13 18:45:59.861712	$2a$10$lyZohoYuLhkEKi5fNrSFAuy5YFUGmWFu8aiPKid6fxKPF4iHYoKdS		\N	\N
199	Abbie	abbie@example.com	f	2017-11-13 18:45:59.930377	2017-11-13 18:45:59.930377	$2a$10$O7hI/s25tcpNQ9pw9akfq.cmbemstYABbRsLq3OpXaCLN.LxDOeCi		\N	\N
200	Torrance	torrance@example.net	f	2017-11-13 18:45:59.998872	2017-11-13 18:45:59.998872	$2a$10$0IJKBgpGjc1E9KpPnFhjN.5NGOzUQCEcX1x82KPJMssCYfeHRBC8K		\N	\N
201	Ernest	ernest@example.org	f	2017-11-13 18:46:00.06773	2017-11-13 18:46:00.06773	$2a$10$k0eFahoLBV7.POUhnfBLNujfoKsFQ1DsiOglpUV.qLY5q0Y/Vc3n6		\N	\N
202	Jovany	jovany@example.net	f	2017-11-13 18:46:00.136695	2017-11-13 18:46:00.136695	$2a$10$Loi1tbOIYYKDtI/sBVhmoO2jRQ9H6kft.RIZGH/XqpsDak.4TCGvu		\N	\N
203	Schuyler	schuyler@example.org	f	2017-11-13 18:46:00.204861	2017-11-13 18:46:00.204861	$2a$10$1sBE0.kIb9gmjNiTxATe5eVf7g4fqA7UEPRPmpIWgd4g2CNy44Uvu		\N	\N
204	Shane	shane@example.com	f	2017-11-13 18:46:00.273762	2017-11-13 18:46:00.273762	$2a$10$lYD0qZsUDCwIZkwBauQzMeQghN34AfCOOhGIKCODGOFtD06c4Mp1m		\N	\N
1	Michael	asdf@asdf.com	f	2017-05-25 19:18:20.707833	2017-11-13 20:38:12.717418	$2a$10$koix9tl65HE2GG9FbWCLFuF7Lqbjf7k83HOD8smXRncemx2sXz25m		\N	D-edzlYT_79o1m7GUO_Xlg
2	gogo	go@go.com	f	2017-11-13 18:17:31.928553	2017-11-13 20:38:56.889069	$2a$10$aaydhkl0hQiYjScrftilj.LqKHGybH/lqSEz9NOcWgAxwsQ4mZ29u		$2a$10$9huLMQxNX1V.RxkJm0.kO.bHeEejeDHi8UxU45ENd.DNYwWScvHf.	mxfp4h9g5SXv2KJBpt3JMA
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('users_id_seq', 204, true);


--
-- Name: albums_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: artists_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: bandmembers_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY bandmembers
    ADD CONSTRAINT bandmembers_pkey PRIMARY KEY (id);


--
-- Name: bands_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT bands_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: record_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT record_libraries_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: songs_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (id);


--
-- Name: tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_albums_on_artist_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_albums_on_artist_id ON albums USING btree (artist_id);


--
-- Name: index_albums_on_band_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_albums_on_band_id ON albums USING btree (band_id);


--
-- Name: index_albums_on_category_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_albums_on_category_id ON albums USING btree (category_id);


--
-- Name: index_artists_on_category_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_artists_on_category_id ON artists USING btree (category_id);


--
-- Name: index_bandmembers_on_artist_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_bandmembers_on_artist_id ON bandmembers USING btree (artist_id);


--
-- Name: index_bandmembers_on_band_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_bandmembers_on_band_id ON bandmembers USING btree (band_id);


--
-- Name: index_bands_on_category_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_bands_on_category_id ON bands USING btree (category_id);


--
-- Name: index_categories_on_lft; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_categories_on_lft ON categories USING btree (lft);


--
-- Name: index_categories_on_parent_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_categories_on_parent_id ON categories USING btree (parent_id);


--
-- Name: index_categories_on_rgt; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_categories_on_rgt ON categories USING btree (rgt);


--
-- Name: index_photos_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_photos_on_imageable_type_and_imageable_id ON photos USING btree (imageable_type, imageable_id);


--
-- Name: index_record_libraries_on_album_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_record_libraries_on_album_id ON record_libraries USING btree (album_id);


--
-- Name: index_record_libraries_on_user_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_record_libraries_on_user_id ON record_libraries USING btree (user_id);


--
-- Name: index_songs_on_artist_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_songs_on_artist_id ON songs USING btree (artist_id);


--
-- Name: index_songs_on_category_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_songs_on_category_id ON songs USING btree (category_id);


--
-- Name: index_tracks_on_album_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_tracks_on_album_id ON tracks USING btree (album_id);


--
-- Name: index_tracks_on_song_id; Type: INDEX; Schema: public; Owner: gdev
--

CREATE INDEX index_tracks_on_song_id ON tracks USING btree (song_id);


--
-- Name: fk_rails_03d41a7dd1; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY artists
    ADD CONSTRAINT fk_rails_03d41a7dd1 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_124a79559a; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_124a79559a FOREIGN KEY (artist_id) REFERENCES artists(id);


--
-- Name: fk_rails_5b5ea4951b; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_5b5ea4951b FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_7a0c27933d; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY bands
    ADD CONSTRAINT fk_rails_7a0c27933d FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_a306062978; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT fk_rails_a306062978 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c68ac6eb00; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT fk_rails_c68ac6eb00 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_c90b8138d4; Type: FK CONSTRAINT; Schema: public; Owner: gdev
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT fk_rails_c90b8138d4 FOREIGN KEY (album_id) REFERENCES albums(id);


--
-- Name: fk_rails_dd448a2456; Type: FK CONSTRAINT; Schema: public; Owner: gdev
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

