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
11	Live in Tokyo	2017-06-23	2017-11-23 18:54:15.893064	2017-11-23 18:54:15.893064	14	\N	31
12	Silver	2015-01-01	2017-11-23 18:54:27.522946	2017-11-23 18:54:27.522946	14	\N	32
13	The Best: 2004-2017	2017-08-25	2017-11-23 18:54:38.974677	2017-11-23 18:54:38.974677	14	\N	33
14	Cohearence	2016-04-22	2017-11-23 18:54:50.555	2017-11-23 18:54:50.555	14	\N	34
15	Just Funkin' Around	2017-05-26	2017-11-23 18:55:01.544361	2017-11-23 18:55:01.544361	14	\N	35
16	Hardwired…To Self-Destruct	2016-11-18	2017-11-23 18:55:30.591287	2017-11-23 18:55:30.591287	8	\N	36
17	The Book Of Souls: Live Chapter	2017-11-17	2017-11-23 18:55:41.708879	2017-11-23 18:55:41.708879	8	\N	37
18	The End (Live)	2017-11-17	2017-11-23 18:55:53.735528	2017-11-23 18:55:53.735528	8	\N	38
19	Dystopia (Deluxe Edition)	2017-05-10	2017-11-23 18:56:05.708338	2017-11-23 18:56:05.708338	8	\N	39
20	Turbo 30 (Remastered 30th Anniversary Deluxe Edition)	2017-02-03	2017-11-23 18:56:17.633291	2017-11-23 18:56:17.633291	8	\N	40
21	The Complete BBC Sessions	2016-09-16	2017-11-23 18:56:56.227426	2017-11-23 18:56:56.227426	1	\N	41
22	Live At The Hollywood Bowl	2016-09-09	2017-11-23 18:57:07.528775	2017-11-23 18:57:07.528775	1	\N	42
23	The Endless River	2014-11-07	2017-11-23 18:57:18.538397	2017-11-23 18:57:18.538397	1	\N	43
24	Queen On Air	2016-10-21	2017-11-23 18:57:29.540812	2017-11-23 18:57:29.540812	1	\N	44
25	Rock or Bust	2015-06-30	2017-11-23 18:57:40.614397	2017-11-23 18:57:40.614397	1	\N	45
26	Live in Germany 1988	2016-07-21	2017-11-23 18:58:11.783018	2017-11-23 18:58:11.783018	16	\N	46
27	Sunshine Of Your Love - A Life In Music	2015-10-09	2017-11-23 18:58:23.422838	2017-11-23 18:58:23.422838	16	\N	47
28	Live - Greatest Hits From Around The World	2016-09-09	2017-11-23 18:58:34.413762	2017-11-23 18:58:34.413762	16	\N	48
29	The Ultimate Collection	2017-04-21	2017-11-23 18:58:45.584536	2017-11-23 18:58:45.584536	16	\N	49
30	Maximum As & Bs	2017-10-27	2017-11-23 18:58:57.476561	2017-11-23 18:58:57.476561	16	\N	50
31	Revolution Radio	2016-10-07	2017-11-23 18:59:28.650087	2017-11-23 18:59:28.650087	22	\N	51
32	Milking The Sacred Cow	2007-10-09	2017-11-23 18:59:40.466375	2017-11-23 18:59:40.466375	22	\N	52
33	Live at Shea Stadium	\N	2017-11-23 18:59:51.500566	2017-11-23 18:59:51.500566	22	\N	53
34	DeA.D. Alive!	2013-01-22	2017-11-23 19:00:02.951391	2017-11-23 19:00:02.951391	22	\N	54
35	Christmas Songs	2013-10-29	2017-11-23 19:00:14.555014	2017-11-23 19:00:14.555014	22	\N	55
36	American Epic: The Carter Family	2017-05-12	2017-11-23 19:00:32.469562	2017-11-23 19:00:32.469562	11	\N	56
37	Blue Moon Of Kentucky	2017-03-02	2017-11-23 19:00:43.499205	2017-11-23 19:00:43.499205	11	\N	57
38	American Christmas	2017-10-06	2017-11-23 19:00:54.659057	2017-11-23 19:00:54.659057	11	\N	58
39	Delicious Christmas	2016-10-21	2017-11-23 19:01:06.414742	2017-11-23 19:01:06.414742	11	\N	59
40	Volunteer Jam III & IV (Live)	2017-02-24	2017-11-23 19:01:17.652528	2017-11-23 19:01:17.652528	11	\N	60
41	The Saga Continues	2017-10-13	2017-11-23 19:03:18.728108	2017-11-23 19:03:18.728108	2	\N	61
42	Efil4zaggin	1991-05-28	2017-11-23 19:03:30.613213	2017-11-23 19:03:30.613213	2	\N	62
43	LIVE AT MONTREUX 2001	2007-04-03	2017-11-23 19:03:42.580874	2017-11-23 19:03:42.580874	2	\N	63
44	We got it from Here... Thank You 4 Your service	2016-11-11	2017-11-23 19:03:54.4155	2017-11-23 19:03:54.4155	2	\N	64
45	Live From Metropolis Studios	2015-09-04	2017-11-23 19:04:05.614065	2017-11-23 19:04:05.614065	2	\N	65
46	Live At Wembley Arena	2014-01-01	2017-11-23 19:05:13.664088	2017-11-23 19:05:13.664088	17	\N	66
47	This Is Where I Came In	2001-01-01	2017-11-23 19:05:26.548073	2017-11-23 19:05:26.548073	17	\N	67
48	Forever	2016-08-26	2017-11-23 19:05:38.707506	2017-11-23 19:05:38.707506	17	\N	68
49	1967 - Sunshine Tomorrow	2017-06-30	2017-11-23 19:05:50.678284	2017-11-23 19:05:50.678284	17	\N	69
50	Big Bang Concert Series: The B-52's (Live)	2017-02-03	2017-11-23 19:06:02.442583	2017-11-23 19:06:02.442583	17	\N	70
51	Toots & The Maytals Reggae Live Sessions	2016-03-15	2017-11-23 19:16:22.534554	2017-11-23 19:16:22.534554	15	\N	71
52	Handsworth Revolution (Deluxe)	2015-03-20	2017-11-23 19:16:34.498598	2017-11-23 19:16:34.498598	15	\N	72
53	Majestic Warriors (Tabu Expanded Edition)	2014-06-02	2017-11-23 19:16:46.390488	2017-11-23 19:16:46.390488	15	\N	73
54	Comedown Machine	2013-03-22	2017-11-23 19:22:26.453394	2017-11-23 19:22:26.453394	24	\N	75
55	OK Computer OKNOTOK 1997 2017	2017-06-23	2017-11-23 19:22:37.404792	2017-11-23 19:22:37.404792	24	\N	76
56	Wonderful Wonderful	2017-09-22	2017-11-23 19:22:48.489785	2017-11-23 19:22:48.489785	24	\N	77
57	Everything Now	2017-07-28	2017-11-23 19:22:59.458396	2017-11-23 19:22:59.458396	24	\N	78
58	Live at Reading	2009-01-01	2017-11-23 19:25:16.743629	2017-11-23 19:25:16.743629	25	\N	79
59	One More Light	2017-05-19	2017-11-23 19:25:28.430799	2017-11-23 19:25:28.430799	25	\N	80
60	OK Computer OKNOTOK 1997 2017	2017-06-23	2017-11-23 19:25:39.455927	2017-11-23 19:25:39.455927	25	\N	76
61	A Head Full Of Dreams	2015-12-04	2017-11-23 19:25:50.439906	2017-11-23 19:25:50.439906	25	\N	82
62	The Ultimate Collection	2016-08-05	2017-11-23 19:29:14.650297	2017-11-23 19:29:14.650297	12	\N	84
63	Live in Tokyo	2017-06-23	2017-11-23 19:29:36.722293	2017-11-23 19:29:36.722293	12	\N	31
64	Power Of Peace	2017-07-28	2017-11-23 19:29:48.496945	2017-11-23 19:29:48.496945	12	\N	87
65	The Ultimate Collection	2017-04-21	2017-11-23 19:29:59.598491	2017-11-23 19:29:59.598491	12	\N	88
66	Humanz	2017-04-28	2017-11-23 19:33:03.702961	2017-11-23 19:33:03.702961	5	\N	89
67	Complete Music	2016-05-13	2017-11-23 19:33:15.536198	2017-11-23 19:33:15.536198	5	\N	90
68	The Day Is My Enemy (Expanded Edition)	2015-03-30	2017-11-23 19:33:26.621286	2017-11-23 19:33:26.621286	5	\N	91
69	SUPER	2016-04-01	2017-11-23 19:33:38.504298	2017-11-23 19:33:38.504298	5	\N	92
70	Born In The Echoes	2015-07-17	2017-11-23 19:33:49.472033	2017-11-23 19:33:49.472033	5	\N	93
71	Carnegie Hall (Live At Carnegie Hall/1971)	2011-11-21	2017-11-23 19:40:47.999226	2017-11-23 19:40:47.999226	18	\N	94
72	Quantum Gate	2017-09-29	2017-11-23 19:41:09.71389	2017-11-23 19:41:09.71389	18	\N	96
73	The Early Years	2013-09-16	2017-11-23 19:41:21.554832	2017-11-23 19:41:21.554832	18	\N	97
74	The Tornados Greatest Hits	2016-12-19	2017-11-23 19:41:33.603469	2017-11-23 19:41:33.603469	18	\N	98
75	Going Backwards (Remixes)	2017-08-11	2017-11-23 19:44:12.521485	2017-11-23 19:44:12.521485	20	\N	99
76	3-D Der Katalog	2017-05-26	2017-11-23 19:44:23.535508	2017-11-23 19:44:23.535508	20	\N	100
77	Complete Music	2016-05-13	2017-11-23 19:44:35.524788	2017-11-23 19:44:35.524788	20	\N	90
78	Heligoland	2010-02-08	2017-11-23 19:44:46.44978	2017-11-23 19:44:46.44978	20	\N	102
79	Random Access Memories	2013-05-17	2017-11-23 19:44:57.395253	2017-11-23 19:44:57.395253	20	\N	103
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('albums_id_seq', 79, true);


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
18	\N	\N	2017-11-23 18:54:14.394085	2017-11-23 18:54:14.394085	14	Al McKay
19	\N	\N	2017-11-23 18:54:14.398694	2017-11-23 18:54:14.398694	14	Alexander Thomas
20	\N	\N	2017-11-23 18:54:14.402849	2017-11-23 18:54:14.402849	14	Andrew Woolfolk
21	\N	\N	2017-11-23 18:54:14.407298	2017-11-23 18:54:14.407298	14	Beloyd Taylor
22	\N	\N	2017-11-23 18:54:14.411239	2017-11-23 18:54:14.411239	14	Chester Washington
23	\N	\N	2017-11-23 18:54:14.415494	2017-11-23 18:54:14.415494	14	David Whitworth
24	\N	\N	2017-11-23 18:54:14.420264	2017-11-23 18:54:14.420264	14	Don Whitehead
25	\N	\N	2017-11-23 18:54:14.424628	2017-11-23 18:54:14.424628	14	Fred White
26	\N	\N	2017-11-23 18:54:14.429934	2017-11-23 18:54:14.429934	14	Greg Moore
27	\N	\N	2017-11-23 18:54:14.433405	2017-11-23 18:54:14.433405	14	Jessica Cleaves
28	\N	\N	2017-11-23 18:54:14.436392	2017-11-23 18:54:14.436392	14	John Paris
29	\N	\N	2017-11-23 18:54:14.439139	2017-11-23 18:54:14.439139	14	Johnny Graham
30	\N	\N	2017-11-23 18:54:14.441805	2017-11-23 18:54:14.441805	14	Larry Dunn
31	\N	\N	2017-11-23 18:54:14.444556	2017-11-23 18:54:14.444556	14	Leslie Drayton
32	\N	\N	2017-11-23 18:54:14.447163	2017-11-23 18:54:14.447163	14	Maurice White
33	\N	\N	2017-11-23 18:54:14.449745	2017-11-23 18:54:14.449745	14	Michael Beal
34	\N	\N	2017-11-23 18:54:14.452464	2017-11-23 18:54:14.452464	14	Morris O'Connor
35	\N	\N	2017-11-23 18:54:14.455093	2017-11-23 18:54:14.455093	14	Morris Pleasure
36	\N	\N	2017-11-23 18:54:14.457653	2017-11-23 18:54:14.457653	14	Myron McKinley
37	\N	\N	2017-11-23 18:54:14.460259	2017-11-23 18:54:14.460259	14	Philip Bailey
38	\N	\N	2017-11-23 18:54:14.463664	2017-11-23 18:54:14.463664	14	Philip Doron Bailey
39	\N	\N	2017-11-23 18:54:14.466458	2017-11-23 18:54:14.466458	14	Ralph Johnson
40	\N	\N	2017-11-23 18:54:14.468919	2017-11-23 18:54:14.468919	14	Robert Brookins
41	\N	\N	2017-11-23 18:54:14.471769	2017-11-23 18:54:14.471769	14	Roland Bautista
42	\N	\N	2017-11-23 18:54:14.474931	2017-11-23 18:54:14.474931	14	Ronnie Laws
43	\N	\N	2017-11-23 18:54:14.477842	2017-11-23 18:54:14.477842	14	Sheldon Reynolds
44	\N	\N	2017-11-23 18:54:14.481089	2017-11-23 18:54:14.481089	14	Sherry Scott
45	\N	\N	2017-11-23 18:54:14.483962	2017-11-23 18:54:14.483962	14	Sonny Emory
46	\N	\N	2017-11-23 18:54:14.486669	2017-11-23 18:54:14.486669	14	Verdine White
47	\N	\N	2017-11-23 18:54:14.489417	2017-11-23 18:54:14.489417	14	Wade Flemons
48	\N	\N	2017-11-23 18:54:14.492056	2017-11-23 18:54:14.492056	14	Wayne Vaughn
49	\N	\N	2017-11-23 18:54:14.494634	2017-11-23 18:54:14.494634	14	Yackov Ben Israel
50	\N	\N	2017-11-23 18:54:26.353464	2017-11-23 18:54:26.353464	14	Bob James
51	\N	\N	2017-11-23 18:54:26.357578	2017-11-23 18:54:26.357578	14	Chuck Loeb
52	\N	\N	2017-11-23 18:54:26.361354	2017-11-23 18:54:26.361354	14	Harvey Mason
53	\N	\N	2017-11-23 18:54:26.365471	2017-11-23 18:54:26.365471	14	Larry Carlton
54	\N	\N	2017-11-23 18:54:26.369358	2017-11-23 18:54:26.369358	14	Lee Ritenour
55	\N	\N	2017-11-23 18:54:26.373383	2017-11-23 18:54:26.373383	14	Nathan East
56	\N	\N	2017-11-23 18:54:37.35435	2017-11-23 18:54:37.35435	14	Andy Ross (2)
57	\N	\N	2017-11-23 18:54:37.358517	2017-11-23 18:54:37.358517	14	Daniel Maunick
58	\N	\N	2017-11-23 18:54:37.362616	2017-11-23 18:54:37.362616	14	Dominic Glover
59	\N	\N	2017-11-23 18:54:37.36672	2017-11-23 18:54:37.36672	14	Dominic Oakenfull
60	\N	\N	2017-11-23 18:54:37.370726	2017-11-23 18:54:37.370726	14	Fayyaz Virji
61	\N	\N	2017-11-23 18:54:37.37566	2017-11-23 18:54:37.37566	14	Francesco Mendolia
62	\N	\N	2017-11-23 18:54:37.380489	2017-11-23 18:54:37.380489	14	Francis Hylton
63	\N	\N	2017-11-23 18:54:37.385282	2017-11-23 18:54:37.385282	14	Francisco Sales
64	\N	\N	2017-11-23 18:54:37.389315	2017-11-23 18:54:37.389315	14	Gee Bello
65	\N	\N	2017-11-23 18:54:37.392378	2017-11-23 18:54:37.392378	14	Graham Harvey
66	\N	\N	2017-11-23 18:54:37.395654	2017-11-23 18:54:37.395654	14	Imaani
67	\N	\N	2017-11-23 18:54:37.398429	2017-11-23 18:54:37.398429	14	Ivan Hussey
68	\N	\N	2017-11-23 18:54:37.401294	2017-11-23 18:54:37.401294	14	Jamie Anderson (2)
69	\N	\N	2017-11-23 18:54:37.404309	2017-11-23 18:54:37.404309	14	Jean-Paul Maunick
70	\N	\N	2017-11-23 18:54:37.407248	2017-11-23 18:54:37.407248	14	João Caetano (3)
71	\N	\N	2017-11-23 18:54:37.410021	2017-11-23 18:54:37.410021	14	Jocelyn Brown
72	\N	\N	2017-11-23 18:54:37.41291	2017-11-23 18:54:37.41291	14	Joy Malcolm
73	\N	\N	2017-11-23 18:54:37.41584	2017-11-23 18:54:37.41584	14	Joy Rose
74	\N	\N	2017-11-23 18:54:37.419046	2017-11-23 18:54:37.419046	14	Julian Crampton
75	\N	\N	2017-11-23 18:54:37.422313	2017-11-23 18:54:37.422313	14	Katie Leone
76	\N	\N	2017-11-23 18:54:37.425562	2017-11-23 18:54:37.425562	14	Kelli Sae
77	\N	\N	2017-11-23 18:54:37.428675	2017-11-23 18:54:37.428675	14	Kevin Robinson (4)
78	\N	\N	2017-11-23 18:54:37.431133	2017-11-23 18:54:37.431133	14	Linda Muriel
79	\N	\N	2017-11-23 18:54:37.433502	2017-11-23 18:54:37.433502	14	Mark Anthoni
80	\N	\N	2017-11-23 18:54:37.436123	2017-11-23 18:54:37.436123	14	Matt Cooper
81	\N	\N	2017-11-23 18:54:37.438805	2017-11-23 18:54:37.438805	14	Max Beesley
82	\N	\N	2017-11-23 18:54:37.441712	2017-11-23 18:54:37.441712	14	Maysa Leak
83	\N	\N	2017-11-23 18:54:37.445478	2017-11-23 18:54:37.445478	14	Mo Brandis
84	\N	\N	2017-11-23 18:54:37.448738	2017-11-23 18:54:37.448738	14	Nichol Thomson
85	\N	\N	2017-11-23 18:54:37.451416	2017-11-23 18:54:37.451416	14	Pamela Anderson
86	\N	\N	2017-11-23 18:54:37.454564	2017-11-23 18:54:37.454564	14	Patrick Clahar
87	\N	\N	2017-11-23 18:54:37.458016	2017-11-23 18:54:37.458016	14	Paul "Tubbs" Williams
88	\N	\N	2017-11-23 18:54:37.461378	2017-11-23 18:54:37.461378	14	Paul Booth (2)
89	\N	\N	2017-11-23 18:54:37.464342	2017-11-23 18:54:37.464342	14	Paul Greenwood
90	\N	\N	2017-11-23 18:54:37.466952	2017-11-23 18:54:37.466952	14	Pete Biggin
91	\N	\N	2017-11-23 18:54:37.469528	2017-11-23 18:54:37.469528	14	Peter Hinds
92	\N	\N	2017-11-23 18:54:37.472314	2017-11-23 18:54:37.472314	14	Randy Hope-Taylor
93	\N	\N	2017-11-23 18:54:37.47526	2017-11-23 18:54:37.47526	14	Ray Carless
94	\N	\N	2017-11-23 18:54:37.478475	2017-11-23 18:54:37.478475	14	Richard Bailey
95	\N	\N	2017-11-23 18:54:37.481344	2017-11-23 18:54:37.481344	14	Richard Bull
96	\N	\N	2017-11-23 18:54:37.485188	2017-11-23 18:54:37.485188	14	Richard Spaven
97	\N	\N	2017-11-23 18:54:37.488956	2017-11-23 18:54:37.488956	14	Sid Gauld
98	\N	\N	2017-11-23 18:54:37.492739	2017-11-23 18:54:37.492739	14	Stuart Zender
99	\N	\N	2017-11-23 18:54:37.496508	2017-11-23 18:54:37.496508	14	Thomas Dyani
100	\N	\N	2017-11-23 18:54:37.500267	2017-11-23 18:54:37.500267	14	Tony Momrelle
101	\N	\N	2017-11-23 18:54:37.50407	2017-11-23 18:54:37.50407	14	Tony Remy
102	\N	\N	2017-11-23 18:54:37.509401	2017-11-23 18:54:37.509401	14	Trevor Mires
103	\N	\N	2017-11-23 18:54:37.513499	2017-11-23 18:54:37.513499	14	Vanessa Haynes
104	\N	\N	2017-11-23 18:54:37.517747	2017-11-23 18:54:37.517747	14	Vula Malinga
105	\N	\N	2017-11-23 18:54:49.35772	2017-11-23 18:54:49.35772	14	Bob Mintzer
106	\N	\N	2017-11-23 18:54:49.362359	2017-11-23 18:54:49.362359	14	Dane Alderson
107	\N	\N	2017-11-23 18:54:49.366367	2017-11-23 18:54:49.366367	14	Felix Pastorius
108	\N	\N	2017-11-23 18:54:49.370312	2017-11-23 18:54:49.370312	14	Jimmy Haslip
109	\N	\N	2017-11-23 18:54:49.374968	2017-11-23 18:54:49.374968	14	Marc Russo
110	\N	\N	2017-11-23 18:54:49.379326	2017-11-23 18:54:49.379326	14	Marcus Baylor
111	\N	\N	2017-11-23 18:54:49.383837	2017-11-23 18:54:49.383837	14	Ricky Lawson
112	\N	\N	2017-11-23 18:54:49.388563	2017-11-23 18:54:49.388563	14	Russell Ferrante
113	\N	\N	2017-11-23 18:54:49.393581	2017-11-23 18:54:49.393581	14	William Kennedy
114	\N	\N	2017-11-23 18:55:00.360044	2017-11-23 18:55:00.360044	14	Cedric A. Napoleon
115	\N	\N	2017-11-23 18:55:00.363177	2017-11-23 18:55:00.363177	14	Curtis Harmon
116	\N	\N	2017-11-23 18:55:00.3673	2017-11-23 18:55:00.3673	14	James K. Lloyd
117	\N	\N	2017-11-23 18:55:00.371211	2017-11-23 18:55:00.371211	14	Norwood
118	\N	\N	2017-11-23 18:55:00.375154	2017-11-23 18:55:00.375154	14	Tracy Hamlin
119	\N	\N	2017-11-23 18:55:29.38037	2017-11-23 18:55:29.38037	8	Cliff Burton
120	\N	\N	2017-11-23 18:55:29.384759	2017-11-23 18:55:29.384759	8	Dave Mustaine
121	\N	\N	2017-11-23 18:55:29.388975	2017-11-23 18:55:29.388975	8	James Hetfield
122	\N	\N	2017-11-23 18:55:29.393302	2017-11-23 18:55:29.393302	8	Jason Newsted
123	\N	\N	2017-11-23 18:55:29.39727	2017-11-23 18:55:29.39727	8	Kirk Hammett
124	\N	\N	2017-11-23 18:55:29.401333	2017-11-23 18:55:29.401333	8	Lars Ulrich
125	\N	\N	2017-11-23 18:55:29.405905	2017-11-23 18:55:29.405905	8	Lloyd Grant
126	\N	\N	2017-11-23 18:55:29.410566	2017-11-23 18:55:29.410566	8	Robert Trujillo
127	\N	\N	2017-11-23 18:55:29.416566	2017-11-23 18:55:29.416566	8	Ron McGovney
128	\N	\N	2017-11-23 18:55:40.430542	2017-11-23 18:55:40.430542	8	Adrian Smith (2)
129	\N	\N	2017-11-23 18:55:40.434143	2017-11-23 18:55:40.434143	8	Barry Graham (2)
130	\N	\N	2017-11-23 18:55:40.437534	2017-11-23 18:55:40.437534	8	Blaze Bayley
131	\N	\N	2017-11-23 18:55:40.440295	2017-11-23 18:55:40.440295	8	Bob Sawyer (3)
132	\N	\N	2017-11-23 18:55:40.44291	2017-11-23 18:55:40.44291	8	Bruce Dickinson
133	\N	\N	2017-11-23 18:55:40.445454	2017-11-23 18:55:40.445454	8	Clive Burr
134	\N	\N	2017-11-23 18:55:40.448103	2017-11-23 18:55:40.448103	8	Dave Murray (2)
135	\N	\N	2017-11-23 18:55:40.451215	2017-11-23 18:55:40.451215	8	Dennis Stratton
136	\N	\N	2017-11-23 18:55:40.454541	2017-11-23 18:55:40.454541	8	Dennis Willcock
137	\N	\N	2017-11-23 18:55:40.457355	2017-11-23 18:55:40.457355	8	Doug Sampson
138	\N	\N	2017-11-23 18:55:40.46064	2017-11-23 18:55:40.46064	8	Janick Gers
139	\N	\N	2017-11-23 18:55:40.463926	2017-11-23 18:55:40.463926	8	Nicko McBrain
140	\N	\N	2017-11-23 18:55:40.467729	2017-11-23 18:55:40.467729	8	Paul Cairns (2)
141	\N	\N	2017-11-23 18:55:40.470646	2017-11-23 18:55:40.470646	8	Paul Di'Anno
142	\N	\N	2017-11-23 18:55:40.473523	2017-11-23 18:55:40.473523	8	Paul Mario Day
143	\N	\N	2017-11-23 18:55:40.47594	2017-11-23 18:55:40.47594	8	Paul Todd (4)
144	\N	\N	2017-11-23 18:55:40.47857	2017-11-23 18:55:40.47857	8	Ron "Rebel" Matthews
145	\N	\N	2017-11-23 18:55:40.482562	2017-11-23 18:55:40.482562	8	Steve Harris
146	\N	\N	2017-11-23 18:55:40.486858	2017-11-23 18:55:40.486858	8	Terry Rance
147	\N	\N	2017-11-23 18:55:40.490878	2017-11-23 18:55:40.490878	8	Terry Wapram
148	\N	\N	2017-11-23 18:55:40.49481	2017-11-23 18:55:40.49481	8	Tony Hustings-Moore
149	\N	\N	2017-11-23 18:55:40.499145	2017-11-23 18:55:40.499145	8	Tony Parsons (3)
150	\N	\N	2017-11-23 18:55:52.353924	2017-11-23 18:55:52.353924	8	Anthony Philip Harford
151	\N	\N	2017-11-23 18:55:52.357971	2017-11-23 18:55:52.357971	8	Bev Bevan
152	\N	\N	2017-11-23 18:55:52.361387	2017-11-23 18:55:52.361387	8	Bill Ward
153	\N	\N	2017-11-23 18:55:52.364674	2017-11-23 18:55:52.364674	8	Bob Daisley
154	\N	\N	2017-11-23 18:55:52.367489	2017-11-23 18:55:52.367489	8	Bobby Rondinelli
155	\N	\N	2017-11-23 18:55:52.370377	2017-11-23 18:55:52.370377	8	Cozy Powell
156	\N	\N	2017-11-23 18:55:52.373918	2017-11-23 18:55:52.373918	8	Craig Gruber
157	\N	\N	2017-11-23 18:55:52.376918	2017-11-23 18:55:52.376918	8	Dave Spitz
158	\N	\N	2017-11-23 18:55:52.381059	2017-11-23 18:55:52.381059	8	Dave Walker (6)
159	\N	\N	2017-11-23 18:55:52.385329	2017-11-23 18:55:52.385329	8	Don Airey
160	\N	\N	2017-11-23 18:55:52.389611	2017-11-23 18:55:52.389611	8	Eric Singer
161	\N	\N	2017-11-23 18:55:52.39435	2017-11-23 18:55:52.39435	8	Geezer Butler
162	\N	\N	2017-11-23 18:55:52.398119	2017-11-23 18:55:52.398119	8	Geoff Nicholls
163	\N	\N	2017-11-23 18:55:52.401916	2017-11-23 18:55:52.401916	8	Gerald Woodruffe
164	\N	\N	2017-11-23 18:55:52.405927	2017-11-23 18:55:52.405927	8	Glenn Hughes
165	\N	\N	2017-11-23 18:55:52.409935	2017-11-23 18:55:52.409935	8	Gordon Copley
166	\N	\N	2017-11-23 18:55:52.413595	2017-11-23 18:55:52.413595	8	Ian Gillan
167	\N	\N	2017-11-23 18:55:52.417282	2017-11-23 18:55:52.417282	8	Jeff Fenholt
168	\N	\N	2017-11-23 18:55:52.421155	2017-11-23 18:55:52.421155	8	Jo Burt
169	\N	\N	2017-11-23 18:55:52.424925	2017-11-23 18:55:52.424925	8	Neil Murray
170	\N	\N	2017-11-23 18:55:52.428763	2017-11-23 18:55:52.428763	8	Ozzy Osbourne
171	\N	\N	2017-11-23 18:55:52.432917	2017-11-23 18:55:52.432917	8	Ray Gillen
172	\N	\N	2017-11-23 18:55:52.43667	2017-11-23 18:55:52.43667	8	Ronald Padavona
173	\N	\N	2017-11-23 18:55:52.440948	2017-11-23 18:55:52.440948	8	Terry Chimes
174	\N	\N	2017-11-23 18:55:52.444949	2017-11-23 18:55:52.444949	8	Tony Iommi
175	\N	\N	2017-11-23 18:55:52.449255	2017-11-23 18:55:52.449255	8	Vinny Appice
176	\N	\N	2017-11-23 18:56:04.365038	2017-11-23 18:56:04.365038	8	Al Pitrelli
177	\N	\N	2017-11-23 18:56:04.369211	2017-11-23 18:56:04.369211	8	Chris Adler
178	\N	\N	2017-11-23 18:56:04.372928	2017-11-23 18:56:04.372928	8	Chris Broderick
179	\N	\N	2017-11-23 18:56:04.376144	2017-11-23 18:56:04.376144	8	Chris Poland
180	\N	\N	2017-11-23 18:56:04.379436	2017-11-23 18:56:04.379436	8	Chuck Behler
181	\N	\N	2017-11-23 18:56:04.382595	2017-11-23 18:56:04.382595	8	Dave Mustaine
182	\N	\N	2017-11-23 18:56:04.385308	2017-11-23 18:56:04.385308	8	David Ellefson
183	\N	\N	2017-11-23 18:56:04.388671	2017-11-23 18:56:04.388671	8	Dijon Carruthers
184	\N	\N	2017-11-23 18:56:04.392248	2017-11-23 18:56:04.392248	8	Dirk Verbeuren
185	\N	\N	2017-11-23 18:56:04.395203	2017-11-23 18:56:04.395203	8	Gar Samuelson
186	\N	\N	2017-11-23 18:56:04.398072	2017-11-23 18:56:04.398072	8	Glen Drover
187	\N	\N	2017-11-23 18:56:04.401124	2017-11-23 18:56:04.401124	8	Greg Handevidt
188	\N	\N	2017-11-23 18:56:04.404116	2017-11-23 18:56:04.404116	8	James LoMenzo
189	\N	\N	2017-11-23 18:56:04.406948	2017-11-23 18:56:04.406948	8	James McDonough
190	\N	\N	2017-11-23 18:56:04.410341	2017-11-23 18:56:04.410341	8	Jay Reynolds (2)
191	\N	\N	2017-11-23 18:56:04.414251	2017-11-23 18:56:04.414251	8	Jeff Young (3)
192	\N	\N	2017-11-23 18:56:04.417065	2017-11-23 18:56:04.417065	8	Jimmy DeGrasso
193	\N	\N	2017-11-23 18:56:04.420036	2017-11-23 18:56:04.420036	8	Kerry King
194	\N	\N	2017-11-23 18:56:04.423382	2017-11-23 18:56:04.423382	8	Kiko Loureiro
195	\N	\N	2017-11-23 18:56:04.426769	2017-11-23 18:56:04.426769	8	Lee Rauch
196	\N	\N	2017-11-23 18:56:04.430067	2017-11-23 18:56:04.430067	8	Marty Friedman
197	\N	\N	2017-11-23 18:56:04.433545	2017-11-23 18:56:04.433545	8	Nick Menza
198	\N	\N	2017-11-23 18:56:04.436734	2017-11-23 18:56:04.436734	8	Shawn Drover
199	\N	\N	2017-11-23 18:56:16.355121	2017-11-23 18:56:16.355121	8	Alan Atkins
200	\N	\N	2017-11-23 18:56:16.359159	2017-11-23 18:56:16.359159	8	Alan Moore (2)
201	\N	\N	2017-11-23 18:56:16.362799	2017-11-23 18:56:16.362799	8	Dave Holland (2)
202	\N	\N	2017-11-23 18:56:16.366376	2017-11-23 18:56:16.366376	8	Glenn Tipton
203	\N	\N	2017-11-23 18:56:16.369168	2017-11-23 18:56:16.369168	8	Ian Hill (2)
204	\N	\N	2017-11-23 18:56:16.372824	2017-11-23 18:56:16.372824	8	John Hinch
205	\N	\N	2017-11-23 18:56:16.376126	2017-11-23 18:56:16.376126	8	K. K. Downing
206	\N	\N	2017-11-23 18:56:16.378973	2017-11-23 18:56:16.378973	8	Les Binks
207	\N	\N	2017-11-23 18:56:16.381481	2017-11-23 18:56:16.381481	8	Richie Faulkner
208	\N	\N	2017-11-23 18:56:16.38407	2017-11-23 18:56:16.38407	8	Ripper Owens
209	\N	\N	2017-11-23 18:56:16.387797	2017-11-23 18:56:16.387797	8	Rob Halford
210	\N	\N	2017-11-23 18:56:16.391459	2017-11-23 18:56:16.391459	8	Scott Travis
211	\N	\N	2017-11-23 18:56:53.383356	2017-11-23 18:56:53.383356	1	Jimmy Page
212	\N	\N	2017-11-23 18:56:53.389971	2017-11-23 18:56:53.389971	1	John Baldwin
213	\N	\N	2017-11-23 18:56:53.39406	2017-11-23 18:56:53.39406	1	John Bonham
214	\N	\N	2017-11-23 18:56:53.398795	2017-11-23 18:56:53.398795	1	Robert Plant
215	\N	\N	2017-11-23 18:57:06.35402	2017-11-23 18:57:06.35402	1	George Harrison
216	\N	\N	2017-11-23 18:57:06.358129	2017-11-23 18:57:06.358129	1	John Lennon
217	\N	\N	2017-11-23 18:57:06.361305	2017-11-23 18:57:06.361305	1	Paul McCartney
218	\N	\N	2017-11-23 18:57:06.364603	2017-11-23 18:57:06.364603	1	Pete Best
219	\N	\N	2017-11-23 18:57:06.367769	2017-11-23 18:57:06.367769	1	Richard Starkey
220	\N	\N	2017-11-23 18:57:06.37076	2017-11-23 18:57:06.37076	1	Stuart Sutcliffe
221	\N	\N	2017-11-23 18:57:17.361623	2017-11-23 18:57:17.361623	1	David Gilmour
222	\N	\N	2017-11-23 18:57:17.365615	2017-11-23 18:57:17.365615	1	Nick Mason
223	\N	\N	2017-11-23 18:57:17.369197	2017-11-23 18:57:17.369197	1	Richard Wright
224	\N	\N	2017-11-23 18:57:17.372588	2017-11-23 18:57:17.372588	1	Roger Waters
225	\N	\N	2017-11-23 18:57:17.37625	2017-11-23 18:57:17.37625	1	Syd Barrett
226	\N	\N	2017-11-23 18:57:28.362897	2017-11-23 18:57:28.362897	1	Barry Mitchell
227	\N	\N	2017-11-23 18:57:28.36765	2017-11-23 18:57:28.36765	1	Brian May
228	\N	\N	2017-11-23 18:57:28.372113	2017-11-23 18:57:28.372113	1	Freddie Mercury
229	\N	\N	2017-11-23 18:57:28.376507	2017-11-23 18:57:28.376507	1	John Deacon
230	\N	\N	2017-11-23 18:57:28.379292	2017-11-23 18:57:28.379292	1	Roger Taylor
231	\N	\N	2017-11-23 18:57:39.350833	2017-11-23 18:57:39.350833	1	Angus Young
232	\N	\N	2017-11-23 18:57:39.355397	2017-11-23 18:57:39.355397	1	Axl Rose
233	\N	\N	2017-11-23 18:57:39.359075	2017-11-23 18:57:39.359075	1	Bon Scott
234	\N	\N	2017-11-23 18:57:39.362251	2017-11-23 18:57:39.362251	1	Brian Johnson
235	\N	\N	2017-11-23 18:57:39.364989	2017-11-23 18:57:39.364989	1	Chris Slade
236	\N	\N	2017-11-23 18:57:39.367797	2017-11-23 18:57:39.367797	1	Cliff Williams
237	\N	\N	2017-11-23 18:57:39.371045	2017-11-23 18:57:39.371045	1	Colin Burgess
238	\N	\N	2017-11-23 18:57:39.374496	2017-11-23 18:57:39.374496	1	Dave Evans
239	\N	\N	2017-11-23 18:57:39.377871	2017-11-23 18:57:39.377871	1	Larry Van Kriedt
240	\N	\N	2017-11-23 18:57:39.381339	2017-11-23 18:57:39.381339	1	Malcolm Young
241	\N	\N	2017-11-23 18:57:39.384262	2017-11-23 18:57:39.384262	1	Mark Evans (3)
242	\N	\N	2017-11-23 18:57:39.387095	2017-11-23 18:57:39.387095	1	Peter Clack
243	\N	\N	2017-11-23 18:57:39.389878	2017-11-23 18:57:39.389878	1	Phil Rudd
244	\N	\N	2017-11-23 18:57:39.392406	2017-11-23 18:57:39.392406	1	Rob Bailey (5)
245	\N	\N	2017-11-23 18:57:39.394969	2017-11-23 18:57:39.394969	1	Simon Wright (4)
246	\N	\N	2017-11-23 18:57:39.398	2017-11-23 18:57:39.398	1	Steve Young (7)
247	\N	\N	2017-11-23 18:57:39.401662	2017-11-23 18:57:39.401662	1	Tony Currenti
248	\N	\N	2017-11-23 18:58:10.369374	2017-11-23 18:58:10.369374	16	Alan Skidmore
249	\N	\N	2017-11-23 18:58:10.372568	2017-11-23 18:58:10.372568	16	Aynsley Dunbar
250	\N	\N	2017-11-23 18:58:10.375527	2017-11-23 18:58:10.375527	16	Bobby Haynes
251	\N	\N	2017-11-23 18:58:10.378251	2017-11-23 18:58:10.378251	16	Buddy Whittington
252	\N	\N	2017-11-23 18:58:10.381055	2017-11-23 18:58:10.381055	16	Chris Mercer
253	\N	\N	2017-11-23 18:58:10.384353	2017-11-23 18:58:10.384353	16	Coco Montoya
254	\N	\N	2017-11-23 18:58:10.387827	2017-11-23 18:58:10.387827	16	Colin Allen
255	\N	\N	2017-11-23 18:58:10.390799	2017-11-23 18:58:10.390799	16	Dick Heckstall-Smith
256	\N	\N	2017-11-23 18:58:10.393708	2017-11-23 18:58:10.393708	16	Eric Clapton
257	\N	\N	2017-11-23 18:58:10.396515	2017-11-23 18:58:10.396515	16	Hank Van Sickle
258	\N	\N	2017-11-23 18:58:10.39907	2017-11-23 18:58:10.39907	16	Jimmy McCulloch
259	\N	\N	2017-11-23 18:58:10.401842	2017-11-23 18:58:10.401842	16	Joe Yuele
260	\N	\N	2017-11-23 18:58:10.404807	2017-11-23 18:58:10.404807	16	John Mayall
261	\N	\N	2017-11-23 18:58:10.408212	2017-11-23 18:58:10.408212	16	John McVie
262	\N	\N	2017-11-23 18:58:10.411636	2017-11-23 18:58:10.411636	16	Jon Hiseman
263	\N	\N	2017-11-23 18:58:10.414423	2017-11-23 18:58:10.414423	16	Keef Hartley
264	\N	\N	2017-11-23 18:58:10.417212	2017-11-23 18:58:10.417212	16	Keith Tillman
265	\N	\N	2017-11-23 18:58:10.420253	2017-11-23 18:58:10.420253	16	Larry Taylor
266	\N	\N	2017-11-23 18:58:10.423103	2017-11-23 18:58:10.423103	16	Mick Taylor
267	\N	\N	2017-11-23 18:58:10.426956	2017-11-23 18:58:10.426956	16	Peter Green (2)
268	\N	\N	2017-11-23 18:58:10.43106	2017-11-23 18:58:10.43106	16	Ray Warleigh
269	\N	\N	2017-11-23 18:58:10.434797	2017-11-23 18:58:10.434797	16	Rick Cortes
270	\N	\N	2017-11-23 18:58:10.43859	2017-11-23 18:58:10.43859	16	Rip Kant
271	\N	\N	2017-11-23 18:58:10.442372	2017-11-23 18:58:10.442372	16	Tom Canning
272	\N	\N	2017-11-23 18:58:10.446286	2017-11-23 18:58:10.446286	16	Tony Reeves
273	\N	\N	2017-11-23 18:58:10.450538	2017-11-23 18:58:10.450538	16	Walter Trout
274	\N	\N	2017-11-23 18:58:22.355812	2017-11-23 18:58:22.355812	16	David Larkham
275	\N	\N	2017-11-23 18:58:33.353911	2017-11-23 18:58:33.353911	16	Billy Gibbons
276	\N	\N	2017-11-23 18:58:33.358487	2017-11-23 18:58:33.358487	16	Dan Mitchell (3)
277	\N	\N	2017-11-23 18:58:33.362771	2017-11-23 18:58:33.362771	16	Dusty Hill
278	\N	\N	2017-11-23 18:58:33.367034	2017-11-23 18:58:33.367034	16	Frank Beard
279	\N	\N	2017-11-23 18:58:33.370422	2017-11-23 18:58:33.370422	16	Lanier Greig
280	\N	\N	2017-11-23 18:58:44.363772	2017-11-23 18:58:44.363772	16	Allen Woody
281	\N	\N	2017-11-23 18:58:44.367065	2017-11-23 18:58:44.367065	16	Berry Oakley
282	\N	\N	2017-11-23 18:58:44.37035	2017-11-23 18:58:44.37035	16	Butch Trucks
283	\N	\N	2017-11-23 18:58:44.374476	2017-11-23 18:58:44.374476	16	Chuck Leavell
284	\N	\N	2017-11-23 18:58:44.378039	2017-11-23 18:58:44.378039	16	Dan Toler
285	\N	\N	2017-11-23 18:58:44.38132	2017-11-23 18:58:44.38132	16	David "Frankie" Toler
286	\N	\N	2017-11-23 18:58:44.38452	2017-11-23 18:58:44.38452	16	Derek Trucks
287	\N	\N	2017-11-23 18:58:44.387885	2017-11-23 18:58:44.387885	16	Dickey Betts
288	\N	\N	2017-11-23 18:58:44.391142	2017-11-23 18:58:44.391142	16	Duane Allman
289	\N	\N	2017-11-23 18:58:44.396322	2017-11-23 18:58:44.396322	16	Gregg Allman
290	\N	\N	2017-11-23 18:58:44.401293	2017-11-23 18:58:44.401293	16	Jai Johanny Johanson
291	\N	\N	2017-11-23 18:58:44.404969	2017-11-23 18:58:44.404969	16	Johnny Neel
292	\N	\N	2017-11-23 18:58:44.408801	2017-11-23 18:58:44.408801	16	Lamar Williams
293	\N	\N	2017-11-23 18:58:44.413018	2017-11-23 18:58:44.413018	16	Marc Quinones
294	\N	\N	2017-11-23 18:58:44.417678	2017-11-23 18:58:44.417678	16	Oteil Burbridge
295	\N	\N	2017-11-23 18:58:44.421976	2017-11-23 18:58:44.421976	16	Reese Wynans
296	\N	\N	2017-11-23 18:58:44.426751	2017-11-23 18:58:44.426751	16	Warren Haynes
297	\N	\N	2017-11-23 18:58:56.347694	2017-11-23 18:58:56.347694	16	John "Rabbit" Bundrick
298	\N	\N	2017-11-23 18:58:56.351418	2017-11-23 18:58:56.351418	16	John Entwistle
299	\N	\N	2017-11-23 18:58:56.355158	2017-11-23 18:58:56.355158	16	Keith Moon
300	\N	\N	2017-11-23 18:58:56.358496	2017-11-23 18:58:56.358496	16	Kenny Jones
301	\N	\N	2017-11-23 18:58:56.362295	2017-11-23 18:58:56.362295	16	Pete Townshend
302	\N	\N	2017-11-23 18:58:56.365134	2017-11-23 18:58:56.365134	16	Roger Daltrey
303	\N	\N	2017-11-23 18:58:56.367846	2017-11-23 18:58:56.367846	16	Simon Townshend
304	\N	\N	2017-11-23 18:58:56.370567	2017-11-23 18:58:56.370567	16	Zak Starkey
305	\N	\N	2017-11-23 18:59:27.380044	2017-11-23 18:59:27.380044	22	Billie Joe Armstrong
306	\N	\N	2017-11-23 18:59:27.384322	2017-11-23 18:59:27.384322	22	Frank E. Wright
307	\N	\N	2017-11-23 18:59:27.388246	2017-11-23 18:59:27.388246	22	Jason White (3)
308	\N	\N	2017-11-23 18:59:27.391929	2017-11-23 18:59:27.391929	22	John Kiffmeyer
309	\N	\N	2017-11-23 18:59:27.395599	2017-11-23 18:59:27.395599	22	Michael Pritchard
310	\N	\N	2017-11-23 18:59:39.35531	2017-11-23 18:59:39.35531	22	Brandon Cruz
311	\N	\N	2017-11-23 18:59:39.360247	2017-11-23 18:59:39.360247	22	Bruce Slesinger
312	\N	\N	2017-11-23 18:59:39.364427	2017-11-23 18:59:39.364427	22	Carlos Cadona
313	\N	\N	2017-11-23 18:59:39.368429	2017-11-23 18:59:39.368429	22	D.H. Peligro
314	\N	\N	2017-11-23 18:59:39.372206	2017-11-23 18:59:39.372206	22	Eric Boucher
315	\N	\N	2017-11-23 18:59:39.376523	2017-11-23 18:59:39.376523	22	Geoffrey Lyall
316	\N	\N	2017-11-23 18:59:39.381357	2017-11-23 18:59:39.381357	22	Ray Pepperell
317	\N	\N	2017-11-23 18:59:39.385969	2017-11-23 18:59:39.385969	22	Skip (27)
318	\N	\N	2017-11-23 18:59:39.390753	2017-11-23 18:59:39.390753	22	Steve "Boomstick" Wilson
319	\N	\N	2017-11-23 18:59:50.356491	2017-11-23 18:59:50.356491	22	John Mellor
320	\N	\N	2017-11-23 18:59:50.359824	2017-11-23 18:59:50.359824	22	Keith Levene
321	\N	\N	2017-11-23 18:59:50.362606	2017-11-23 18:59:50.362606	22	Mick Jones
322	\N	\N	2017-11-23 18:59:50.365315	2017-11-23 18:59:50.365315	22	Nick Sheppard
323	\N	\N	2017-11-23 18:59:50.368659	2017-11-23 18:59:50.368659	22	Paul Simonon
324	\N	\N	2017-11-23 18:59:50.371771	2017-11-23 18:59:50.371771	22	Pete Howard
325	\N	\N	2017-11-23 18:59:50.374752	2017-11-23 18:59:50.374752	22	Terry Chimes
326	\N	\N	2017-11-23 18:59:50.37761	2017-11-23 18:59:50.37761	22	Topper Headon
327	\N	\N	2017-11-23 18:59:50.38069	2017-11-23 18:59:50.38069	22	Vince White
328	\N	\N	2017-11-23 19:00:01.370223	2017-11-23 19:00:01.370223	22	Arthur Googy
329	\N	\N	2017-11-23 19:00:01.373921	2017-11-23 19:00:01.373921	22	Bobby Steele
330	\N	\N	2017-11-23 19:00:01.37733	2017-11-23 19:00:01.37733	22	Brian Keats
331	\N	\N	2017-11-23 19:00:01.380598	2017-11-23 19:00:01.380598	22	David Calabrese
332	\N	\N	2017-11-23 19:00:01.38434	2017-11-23 19:00:01.38434	22	Dez Cadena
333	\N	\N	2017-11-23 19:00:01.387973	2017-11-23 19:00:01.387973	22	Eric "Goat" Arce
334	\N	\N	2017-11-23 19:00:01.39244	2017-11-23 19:00:01.39244	22	Frank LiCata
335	\N	\N	2017-11-23 19:00:01.395814	2017-11-23 19:00:01.395814	22	Glenn Anzalone
336	\N	\N	2017-11-23 19:00:01.39889	2017-11-23 19:00:01.39889	22	Jerry Caiafa
337	\N	\N	2017-11-23 19:00:01.403166	2017-11-23 19:00:01.403166	22	Jerry Caiafa II
338	\N	\N	2017-11-23 19:00:01.407789	2017-11-23 19:00:01.407789	22	Jim Catania
339	\N	\N	2017-11-23 19:00:01.412634	2017-11-23 19:00:01.412634	22	Joey Image
340	\N	\N	2017-11-23 19:00:01.41705	2017-11-23 19:00:01.41705	22	Manny
341	\N	\N	2017-11-23 19:00:01.42112	2017-11-23 19:00:01.42112	22	Marc Bell
342	\N	\N	2017-11-23 19:00:01.42542	2017-11-23 19:00:01.42542	22	Marc Rizzo
343	\N	\N	2017-11-23 19:00:01.430014	2017-11-23 19:00:01.430014	22	Michale Graves
344	\N	\N	2017-11-23 19:00:01.43417	2017-11-23 19:00:01.43417	22	Myke Hideous
345	\N	\N	2017-11-23 19:00:01.438655	2017-11-23 19:00:01.438655	22	Paul Caiafa
346	\N	\N	2017-11-23 19:00:01.443193	2017-11-23 19:00:01.443193	22	Robo (3)
347	\N	\N	2017-11-23 19:00:13.369093	2017-11-23 19:00:13.369093	22	Bobby Schayer
348	\N	\N	2017-11-23 19:00:13.374329	2017-11-23 19:00:13.374329	22	Brett Gurewitz
349	\N	\N	2017-11-23 19:00:13.378953	2017-11-23 19:00:13.378953	22	Brian Baker
350	\N	\N	2017-11-23 19:00:13.382835	2017-11-23 19:00:13.382835	22	Brooks Wackerman
351	\N	\N	2017-11-23 19:00:13.386591	2017-11-23 19:00:13.386591	22	Davy Goldman
352	\N	\N	2017-11-23 19:00:13.38977	2017-11-23 19:00:13.38977	22	Greg Graffin
353	\N	\N	2017-11-23 19:00:13.393634	2017-11-23 19:00:13.393634	22	Greg Hetson
354	\N	\N	2017-11-23 19:00:13.397001	2017-11-23 19:00:13.397001	22	Jamie Miller
355	\N	\N	2017-11-23 19:00:13.400336	2017-11-23 19:00:13.400336	22	Jay Bentley
356	\N	\N	2017-11-23 19:00:13.403613	2017-11-23 19:00:13.403613	22	Jay Ziskrout
357	\N	\N	2017-11-23 19:00:13.407256	2017-11-23 19:00:13.407256	22	Keith Lehrer
358	\N	\N	2017-11-23 19:00:13.411282	2017-11-23 19:00:13.411282	22	Mike Dimkich
359	\N	\N	2017-11-23 19:00:13.414915	2017-11-23 19:00:13.414915	22	Paul Dedona
360	\N	\N	2017-11-23 19:00:13.417627	2017-11-23 19:00:13.417627	22	Pete Finestone
361	\N	\N	2017-11-23 19:00:13.420019	2017-11-23 19:00:13.420019	22	Tim Gallegos
362	\N	\N	2017-11-23 19:00:31.374857	2017-11-23 19:00:31.374857	11	A. P. Carter
363	\N	\N	2017-11-23 19:00:31.377953	2017-11-23 19:00:31.377953	11	Anita Carter
364	\N	\N	2017-11-23 19:00:31.380584	2017-11-23 19:00:31.380584	11	Helen Carter (2)
365	\N	\N	2017-11-23 19:00:31.383075	2017-11-23 19:00:31.383075	11	Janette Carter
366	\N	\N	2017-11-23 19:00:31.385974	2017-11-23 19:00:31.385974	11	June Carter Cash
367	\N	\N	2017-11-23 19:00:31.389316	2017-11-23 19:00:31.389316	11	Maybelle Carter
368	\N	\N	2017-11-23 19:00:31.393089	2017-11-23 19:00:31.393089	11	Sara Carter (2)
369	\N	\N	2017-11-23 19:00:42.346823	2017-11-23 19:00:42.346823	11	Benny Martin
370	\N	\N	2017-11-23 19:00:42.350654	2017-11-23 19:00:42.350654	11	Bessie Lee Mauldin
371	\N	\N	2017-11-23 19:00:42.353361	2017-11-23 19:00:42.353361	11	Bill Holden (4)
372	\N	\N	2017-11-23 19:00:42.355782	2017-11-23 19:00:42.355782	11	Bill Monroe
373	\N	\N	2017-11-23 19:00:42.359427	2017-11-23 19:00:42.359427	11	Charlie Cline
374	\N	\N	2017-11-23 19:00:42.363292	2017-11-23 19:00:42.363292	11	Curtis Blackwell
375	\N	\N	2017-11-23 19:00:42.367112	2017-11-23 19:00:42.367112	11	Dana Cupp, Jr.
376	\N	\N	2017-11-23 19:00:42.37062	2017-11-23 19:00:42.37062	11	Don Reno
377	\N	\N	2017-11-23 19:00:42.374263	2017-11-23 19:00:42.374263	11	Jack Cooke
378	\N	\N	2017-11-23 19:00:42.378215	2017-11-23 19:00:42.378215	11	Jimmy Maynard (2)
379	\N	\N	2017-11-23 19:00:42.381946	2017-11-23 19:00:42.381946	11	Mac Wiseman
380	\N	\N	2017-11-23 19:00:42.386242	2017-11-23 19:00:42.386242	11	Peter Rowan
381	\N	\N	2017-11-23 19:00:53.439893	2017-11-23 19:00:53.439893	11	Jeff Cook (2)
382	\N	\N	2017-11-23 19:00:53.444828	2017-11-23 19:00:53.444828	11	Mark Herndon
383	\N	\N	2017-11-23 19:00:53.449177	2017-11-23 19:00:53.449177	11	Randy Owen
384	\N	\N	2017-11-23 19:00:53.453854	2017-11-23 19:00:53.453854	11	Teddy Gentry
385	\N	\N	2017-11-23 19:01:05.35937	2017-11-23 19:01:05.35937	11	Charlie Louvin
386	\N	\N	2017-11-23 19:01:05.362923	2017-11-23 19:01:05.362923	11	Ira Louvin
387	\N	\N	2017-11-23 19:01:16.364058	2017-11-23 19:01:16.364058	11	Barry Barnes
388	\N	\N	2017-11-23 19:01:16.367638	2017-11-23 19:01:16.367638	11	Bruce Ray Brown
389	\N	\N	2017-11-23 19:01:16.37086	2017-11-23 19:01:16.37086	11	Charlie Daniels
390	\N	\N	2017-11-23 19:01:16.374925	2017-11-23 19:01:16.374925	11	Charlie Hayward
391	\N	\N	2017-11-23 19:01:16.378857	2017-11-23 19:01:16.378857	11	Chris Wormer
392	\N	\N	2017-11-23 19:01:16.382769	2017-11-23 19:01:16.382769	11	Don Murray (3)
393	\N	\N	2017-11-23 19:01:16.386911	2017-11-23 19:01:16.386911	11	Fred Edwards
394	\N	\N	2017-11-23 19:01:16.39062	2017-11-23 19:01:16.39062	11	Gary Allen
395	\N	\N	2017-11-23 19:01:16.394649	2017-11-23 19:01:16.394649	11	Jack Gavin
396	\N	\N	2017-11-23 19:01:16.399299	2017-11-23 19:01:16.399299	11	James W. Marshall
397	\N	\N	2017-11-23 19:01:16.403781	2017-11-23 19:01:16.403781	11	Mark Fitzgerald
398	\N	\N	2017-11-23 19:01:16.408153	2017-11-23 19:01:16.408153	11	Pat McDonald
399	\N	\N	2017-11-23 19:01:16.412184	2017-11-23 19:01:16.412184	11	Taz DiGregorio
400	\N	\N	2017-11-23 19:01:16.416088	2017-11-23 19:01:16.416088	11	Tom Crain
401	\N	\N	2017-11-23 19:03:17.380611	2017-11-23 19:03:17.380611	2	Clifford Smith (2)
402	\N	\N	2017-11-23 19:03:17.384943	2017-11-23 19:03:17.384943	2	Corey Woods
403	\N	\N	2017-11-23 19:03:17.388764	2017-11-23 19:03:17.388764	2	Dennis Coles
404	\N	\N	2017-11-23 19:03:17.392636	2017-11-23 19:03:17.392636	2	Elgin Turner
405	\N	\N	2017-11-23 19:03:17.396627	2017-11-23 19:03:17.396627	2	Gary Grice
406	\N	\N	2017-11-23 19:03:17.400897	2017-11-23 19:03:17.400897	2	Jason Hunter (2)
407	\N	\N	2017-11-23 19:03:17.405006	2017-11-23 19:03:17.405006	2	Lamont Hawkins
408	\N	\N	2017-11-23 19:03:17.409195	2017-11-23 19:03:17.409195	2	Robert Diggs
409	\N	\N	2017-11-23 19:03:17.412398	2017-11-23 19:03:17.412398	2	Russel Jones
410	\N	\N	2017-11-23 19:03:29.359528	2017-11-23 19:03:29.359528	2	Andre Young
411	\N	\N	2017-11-23 19:03:29.364329	2017-11-23 19:03:29.364329	2	Antoine Carraby
412	\N	\N	2017-11-23 19:03:29.369489	2017-11-23 19:03:29.369489	2	Eric Wright
413	\N	\N	2017-11-23 19:03:29.374292	2017-11-23 19:03:29.374292	2	Lorenzo Patterson
414	\N	\N	2017-11-23 19:03:29.378304	2017-11-23 19:03:29.378304	2	Mik Lezan
415	\N	\N	2017-11-23 19:03:29.382432	2017-11-23 19:03:29.382432	2	O'Shea Jackson
416	\N	\N	2017-11-23 19:03:41.352319	2017-11-23 19:03:41.352319	2	Darryl McDaniels
417	\N	\N	2017-11-23 19:03:41.356518	2017-11-23 19:03:41.356518	2	Jason Mizell
418	\N	\N	2017-11-23 19:03:41.360277	2017-11-23 19:03:41.360277	2	Joseph Simmons
419	\N	\N	2017-11-23 19:03:52.348167	2017-11-23 19:03:52.348167	2	Ali Shaheed Muhammad
420	\N	\N	2017-11-23 19:03:52.352656	2017-11-23 19:03:52.352656	2	Jarobi White
421	\N	\N	2017-11-23 19:03:52.357055	2017-11-23 19:03:52.357055	2	Kamaal Fareed
422	\N	\N	2017-11-23 19:03:52.361151	2017-11-23 19:03:52.361151	2	Malik Taylor
423	\N	\N	2017-11-23 19:04:04.353788	2017-11-23 19:04:04.353788	2	Brian Hardgroove
424	\N	\N	2017-11-23 19:04:04.359135	2017-11-23 19:04:04.359135	2	Carlton Ridenhour
425	\N	\N	2017-11-23 19:04:04.363975	2017-11-23 19:04:04.363975	2	Johnny Juice Rosado
426	\N	\N	2017-11-23 19:04:04.368732	2017-11-23 19:04:04.368732	2	Khari Wynn
427	\N	\N	2017-11-23 19:04:04.373427	2017-11-23 19:04:04.373427	2	Lisa Williamson (3)
428	\N	\N	2017-11-23 19:04:04.378271	2017-11-23 19:04:04.378271	2	Lord Aswod
429	\N	\N	2017-11-23 19:04:04.383132	2017-11-23 19:04:04.383132	2	Mike Faulkner
430	\N	\N	2017-11-23 19:04:04.387598	2017-11-23 19:04:04.387598	2	Norman Rogers
431	\N	\N	2017-11-23 19:04:04.39196	2017-11-23 19:04:04.39196	2	Richard Griffin
432	\N	\N	2017-11-23 19:04:04.396527	2017-11-23 19:04:04.396527	2	William Jonathan Drayton
433	\N	\N	2017-11-23 19:05:12.373959	2017-11-23 19:05:12.373959	17	Agnetha Fältskog
434	\N	\N	2017-11-23 19:05:12.37767	2017-11-23 19:05:12.37767	17	Anni-Frid Lyngstad
435	\N	\N	2017-11-23 19:05:12.380347	2017-11-23 19:05:12.380347	17	Benny Andersson
436	\N	\N	2017-11-23 19:05:12.382744	2017-11-23 19:05:12.382744	17	Björn Ulvaeus
437	\N	\N	2017-11-23 19:05:25.352791	2017-11-23 19:05:25.352791	17	Alan Kendall
438	\N	\N	2017-11-23 19:05:25.356541	2017-11-23 19:05:25.356541	17	Barry Gibb
439	\N	\N	2017-11-23 19:05:25.360266	2017-11-23 19:05:25.360266	17	Blue Weaver
440	\N	\N	2017-11-23 19:05:25.36393	2017-11-23 19:05:25.36393	17	Colin Petersen
441	\N	\N	2017-11-23 19:05:25.367096	2017-11-23 19:05:25.367096	17	Dennis Bryon
442	\N	\N	2017-11-23 19:05:25.370827	2017-11-23 19:05:25.370827	17	Geoff Bridgford
443	\N	\N	2017-11-23 19:05:25.375009	2017-11-23 19:05:25.375009	17	Maurice Gibb
444	\N	\N	2017-11-23 19:05:25.379605	2017-11-23 19:05:25.379605	17	Robin Gibb
445	\N	\N	2017-11-23 19:05:25.384092	2017-11-23 19:05:25.384092	17	Vince Melouney
446	\N	\N	2017-11-23 19:05:37.349074	2017-11-23 19:05:37.349074	17	Davy Jones
447	\N	\N	2017-11-23 19:05:37.353612	2017-11-23 19:05:37.353612	17	Michael Nesmith
448	\N	\N	2017-11-23 19:05:37.356728	2017-11-23 19:05:37.356728	17	Micky Dolenz
449	\N	\N	2017-11-23 19:05:37.359674	2017-11-23 19:05:37.359674	17	Peter Tork
450	\N	\N	2017-11-23 19:05:49.354706	2017-11-23 19:05:49.354706	17	Alan Jardine
451	\N	\N	2017-11-23 19:05:49.359817	2017-11-23 19:05:49.359817	17	Blondie Chaplin
452	\N	\N	2017-11-23 19:05:49.364667	2017-11-23 19:05:49.364667	17	Brian Wilson
453	\N	\N	2017-11-23 19:05:49.369047	2017-11-23 19:05:49.369047	17	Bruce Johnston
454	\N	\N	2017-11-23 19:05:49.373054	2017-11-23 19:05:49.373054	17	Carl Wilson
455	\N	\N	2017-11-23 19:05:49.377304	2017-11-23 19:05:49.377304	17	David Marks
456	\N	\N	2017-11-23 19:05:49.381845	2017-11-23 19:05:49.381845	17	Dennis Wilson (2)
457	\N	\N	2017-11-23 19:05:49.386175	2017-11-23 19:05:49.386175	17	Mike Love
458	\N	\N	2017-11-23 19:05:49.390139	2017-11-23 19:05:49.390139	17	Ricky Fataar
459	\N	\N	2017-11-23 19:06:01.348696	2017-11-23 19:06:01.348696	17	Cindy Wilson
460	\N	\N	2017-11-23 19:06:01.351878	2017-11-23 19:06:01.351878	17	Fred Schneider
461	\N	\N	2017-11-23 19:06:01.35489	2017-11-23 19:06:01.35489	17	Kate Pierson
462	\N	\N	2017-11-23 19:06:01.357807	2017-11-23 19:06:01.357807	17	Keith Strickland
463	\N	\N	2017-11-23 19:06:01.360908	2017-11-23 19:06:01.360908	17	Pat Irwin
464	\N	\N	2017-11-23 19:06:01.365135	2017-11-23 19:06:01.365135	17	Ricky Wilson (3)
465	\N	\N	2017-11-23 19:06:01.368888	2017-11-23 19:06:01.368888	17	Sara Lee
466	\N	\N	2017-11-23 19:16:21.388849	2017-11-23 19:16:21.388849	15	Andy Bassford
467	\N	\N	2017-11-23 19:16:21.39375	2017-11-23 19:16:21.39375	15	Frederick Hibbert
468	\N	\N	2017-11-23 19:16:21.398148	2017-11-23 19:16:21.398148	15	Harold Butler
469	\N	\N	2017-11-23 19:16:21.402965	2017-11-23 19:16:21.402965	15	Henry "Raleigh" Gordon
470	\N	\N	2017-11-23 19:16:21.407724	2017-11-23 19:16:21.407724	15	Nathaniel "Jerry" Matthias
471	\N	\N	2017-11-23 19:16:21.412343	2017-11-23 19:16:21.412343	15	Paul Douglas
472	\N	\N	2017-11-23 19:16:33.362064	2017-11-23 19:16:33.362064	15	Alphonso Martin
473	\N	\N	2017-11-23 19:16:33.366966	2017-11-23 19:16:33.366966	15	Basil Gabbidon (2)
474	\N	\N	2017-11-23 19:16:33.371253	2017-11-23 19:16:33.371253	15	Carlton Bryan
475	\N	\N	2017-11-23 19:16:33.375265	2017-11-23 19:16:33.375265	15	David Hinds
476	\N	\N	2017-11-23 19:16:33.37963	2017-11-23 19:16:33.37963	15	Errol Reid (2)
477	\N	\N	2017-11-23 19:16:33.38385	2017-11-23 19:16:33.38385	15	Mykaell Riley
478	\N	\N	2017-11-23 19:16:33.388523	2017-11-23 19:16:33.388523	15	Ronnie McQueen
479	\N	\N	2017-11-23 19:16:33.393131	2017-11-23 19:16:33.393131	15	Selwyn Brown
480	\N	\N	2017-11-23 19:16:33.397815	2017-11-23 19:16:33.397815	15	Steve Nesbitt
481	\N	\N	2017-11-23 19:16:45.363765	2017-11-23 19:16:45.363765	15	Aston "Family Man" Barrett
482	\N	\N	2017-11-23 19:16:45.372848	2017-11-23 19:16:45.372848	15	Ian Winter
483	\N	\N	2017-11-23 19:22:15.390132	2017-11-23 19:22:15.390132	24	Alex Turner
484	\N	\N	2017-11-23 19:22:15.393849	2017-11-23 19:22:15.393849	24	Andy Nicholson (2)
485	\N	\N	2017-11-23 19:22:15.397147	2017-11-23 19:22:15.397147	24	Jamie Cook
486	\N	\N	2017-11-23 19:22:15.400519	2017-11-23 19:22:15.400519	24	Matt Helders
487	\N	\N	2017-11-23 19:22:15.403427	2017-11-23 19:22:15.403427	24	Nick O'Malley (2)
488	\N	\N	2017-11-23 19:22:25.362693	2017-11-23 19:22:25.362693	24	Albert Hammond Jr.
489	\N	\N	2017-11-23 19:22:25.368121	2017-11-23 19:22:25.368121	24	Fabrizio Moretti
490	\N	\N	2017-11-23 19:22:25.372906	2017-11-23 19:22:25.372906	24	Julian Casablancas
491	\N	\N	2017-11-23 19:22:25.377451	2017-11-23 19:22:25.377451	24	Nick Valensi
492	\N	\N	2017-11-23 19:22:25.381637	2017-11-23 19:22:25.381637	24	Nikolai Fraiture
493	\N	\N	2017-11-23 19:22:36.37303	2017-11-23 19:22:36.37303	24	Colin Greenwood
494	\N	\N	2017-11-23 19:22:36.377566	2017-11-23 19:22:36.377566	24	Ed O'Brien
495	\N	\N	2017-11-23 19:22:36.381812	2017-11-23 19:22:36.381812	24	Jonny Greenwood
496	\N	\N	2017-11-23 19:22:36.386087	2017-11-23 19:22:36.386087	24	Phil Selway
497	\N	\N	2017-11-23 19:22:36.390103	2017-11-23 19:22:36.390103	24	Thom Yorke
498	\N	\N	2017-11-23 19:22:47.361536	2017-11-23 19:22:47.361536	24	Brandon Flowers
499	\N	\N	2017-11-23 19:22:47.366536	2017-11-23 19:22:47.366536	24	Dave Keuning
500	\N	\N	2017-11-23 19:22:47.370718	2017-11-23 19:22:47.370718	24	Mark Stoermer
501	\N	\N	2017-11-23 19:22:47.374718	2017-11-23 19:22:47.374718	24	Ronnie Vannucci
502	\N	\N	2017-11-23 19:22:58.379001	2017-11-23 19:22:58.379001	24	Brendan Reed
503	\N	\N	2017-11-23 19:22:58.383073	2017-11-23 19:22:58.383073	24	Dane Mills
504	\N	\N	2017-11-23 19:22:58.386675	2017-11-23 19:22:58.386675	24	Howard Bilerman
505	\N	\N	2017-11-23 19:22:58.390246	2017-11-23 19:22:58.390246	24	Jeremy Gara
506	\N	\N	2017-11-23 19:22:58.392945	2017-11-23 19:22:58.392945	24	Myles Broscoe
507	\N	\N	2017-11-23 19:22:58.395919	2017-11-23 19:22:58.395919	24	Régine Chassagne
508	\N	\N	2017-11-23 19:22:58.39872	2017-11-23 19:22:58.39872	24	Richard Reed Parry
509	\N	\N	2017-11-23 19:22:58.401252	2017-11-23 19:22:58.401252	24	Sarah Neufeld
510	\N	\N	2017-11-23 19:22:58.403869	2017-11-23 19:22:58.403869	24	Timothy Kingsbury
511	\N	\N	2017-11-23 19:22:58.406574	2017-11-23 19:22:58.406574	24	William Butler
512	\N	\N	2017-11-23 19:22:58.40978	2017-11-23 19:22:58.40978	24	Win Butler
513	\N	\N	2017-11-23 19:25:15.49894	2017-11-23 19:25:15.49894	25	Aaron Burckhard
514	\N	\N	2017-11-23 19:25:15.503275	2017-11-23 19:25:15.503275	25	Chad Channing
515	\N	\N	2017-11-23 19:25:15.5074	2017-11-23 19:25:15.5074	25	Dale Crover
516	\N	\N	2017-11-23 19:25:15.511021	2017-11-23 19:25:15.511021	25	Dan Peters
517	\N	\N	2017-11-23 19:25:15.515191	2017-11-23 19:25:15.515191	25	Dave Foster (14)
518	\N	\N	2017-11-23 19:25:15.520316	2017-11-23 19:25:15.520316	25	Dave Grohl
519	\N	\N	2017-11-23 19:25:15.525482	2017-11-23 19:25:15.525482	25	Georg Ruthenberg
520	\N	\N	2017-11-23 19:25:15.530048	2017-11-23 19:25:15.530048	25	Jason Everman
521	\N	\N	2017-11-23 19:25:15.534513	2017-11-23 19:25:15.534513	25	Krist Novoselic
522	\N	\N	2017-11-23 19:25:15.538708	2017-11-23 19:25:15.538708	25	Kurt Cobain
523	\N	\N	2017-11-23 19:25:15.543586	2017-11-23 19:25:15.543586	25	Lori Goldston
524	\N	\N	2017-11-23 19:25:15.548772	2017-11-23 19:25:15.548772	25	Melora Creager
525	\N	\N	2017-11-23 19:25:15.553523	2017-11-23 19:25:15.553523	25	Pat Smear
526	\N	\N	2017-11-23 19:25:27.358875	2017-11-23 19:25:27.358875	25	Brad Delson
527	\N	\N	2017-11-23 19:25:27.361933	2017-11-23 19:25:27.361933	25	Chester Bennington
528	\N	\N	2017-11-23 19:25:27.364781	2017-11-23 19:25:27.364781	25	Dave Farrell
529	\N	\N	2017-11-23 19:25:27.367416	2017-11-23 19:25:27.367416	25	Joseph Hahn
530	\N	\N	2017-11-23 19:25:27.369854	2017-11-23 19:25:27.369854	25	Mike Shinoda
531	\N	\N	2017-11-23 19:25:27.372513	2017-11-23 19:25:27.372513	25	Rob Bourdon
532	\N	\N	2017-11-23 19:25:38.368846	2017-11-23 19:25:38.368846	25	Colin Greenwood
533	\N	\N	2017-11-23 19:25:38.372774	2017-11-23 19:25:38.372774	25	Ed O'Brien
534	\N	\N	2017-11-23 19:25:38.376483	2017-11-23 19:25:38.376483	25	Jonny Greenwood
535	\N	\N	2017-11-23 19:25:38.380103	2017-11-23 19:25:38.380103	25	Phil Selway
536	\N	\N	2017-11-23 19:25:38.383593	2017-11-23 19:25:38.383593	25	Thom Yorke
537	\N	\N	2017-11-23 19:25:49.380019	2017-11-23 19:25:49.380019	25	Chris Martin
538	\N	\N	2017-11-23 19:25:49.382633	2017-11-23 19:25:49.382633	25	Guy Berryman
539	\N	\N	2017-11-23 19:25:49.385473	2017-11-23 19:25:49.385473	25	Jon Buckland
540	\N	\N	2017-11-23 19:25:49.389059	2017-11-23 19:25:49.389059	25	Will Champion
541	\N	\N	2017-11-23 19:26:00.468121	2017-11-23 19:26:00.468121	25	Anthony Kiedis
542	\N	\N	2017-11-23 19:26:00.473336	2017-11-23 19:26:00.473336	25	Arik Marshall
543	\N	\N	2017-11-23 19:26:00.477861	2017-11-23 19:26:00.477861	25	Chad Smith
544	\N	\N	2017-11-23 19:26:00.482786	2017-11-23 19:26:00.482786	25	Cliff Martinez
545	\N	\N	2017-11-23 19:26:00.487737	2017-11-23 19:26:00.487737	25	Dave Navarro
546	\N	\N	2017-11-23 19:26:00.49225	2017-11-23 19:26:00.49225	25	Hillel Slovak
547	\N	\N	2017-11-23 19:26:00.496353	2017-11-23 19:26:00.496353	25	Jack Irons
548	\N	\N	2017-11-23 19:26:00.500139	2017-11-23 19:26:00.500139	25	Jack Sherman
549	\N	\N	2017-11-23 19:26:00.503862	2017-11-23 19:26:00.503862	25	John Frusciante
550	\N	\N	2017-11-23 19:26:00.507788	2017-11-23 19:26:00.507788	25	Josh Klinghoffer
551	\N	\N	2017-11-23 19:26:00.511758	2017-11-23 19:26:00.511758	25	Michael Balzary
552	\N	\N	2017-11-23 19:29:13.407726	2017-11-23 19:29:13.407726	12	Barbara Martin
553	\N	\N	2017-11-23 19:29:13.412401	2017-11-23 19:29:13.412401	12	Cindy Birdsong
554	\N	\N	2017-11-23 19:29:13.416515	2017-11-23 19:29:13.416515	12	Diana Ross
555	\N	\N	2017-11-23 19:29:13.420367	2017-11-23 19:29:13.420367	12	Florence Ballard
556	\N	\N	2017-11-23 19:29:13.424572	2017-11-23 19:29:13.424572	12	Jean Terrell
557	\N	\N	2017-11-23 19:29:13.429041	2017-11-23 19:29:13.429041	12	Lynda Laurence
558	\N	\N	2017-11-23 19:29:13.433585	2017-11-23 19:29:13.433585	12	Mary Wilson
559	\N	\N	2017-11-23 19:29:13.437921	2017-11-23 19:29:13.437921	12	Rens Nieuwland
560	\N	\N	2017-11-23 19:29:13.442595	2017-11-23 19:29:13.442595	12	Scherrie Payne
561	\N	\N	2017-11-23 19:29:13.447399	2017-11-23 19:29:13.447399	12	Susaye Greene
562	\N	\N	2017-11-23 19:29:25.365772	2017-11-23 19:29:25.365772	12	Jackie Jackson
563	\N	\N	2017-11-23 19:29:25.370668	2017-11-23 19:29:25.370668	12	Jermaine Jackson
564	\N	\N	2017-11-23 19:29:25.37529	2017-11-23 19:29:25.37529	12	Marlon Jackson
565	\N	\N	2017-11-23 19:29:25.379569	2017-11-23 19:29:25.379569	12	Michael Jackson
566	\N	\N	2017-11-23 19:29:25.383316	2017-11-23 19:29:25.383316	12	Randy Jackson
567	\N	\N	2017-11-23 19:29:25.386242	2017-11-23 19:29:25.386242	12	Tito Jackson
568	\N	\N	2017-11-23 19:29:35.375297	2017-11-23 19:29:35.375297	12	Al McKay
569	\N	\N	2017-11-23 19:29:35.379083	2017-11-23 19:29:35.379083	12	Alexander Thomas
570	\N	\N	2017-11-23 19:29:35.382383	2017-11-23 19:29:35.382383	12	Andrew Woolfolk
571	\N	\N	2017-11-23 19:29:35.385017	2017-11-23 19:29:35.385017	12	Beloyd Taylor
572	\N	\N	2017-11-23 19:29:35.388302	2017-11-23 19:29:35.388302	12	Chester Washington
573	\N	\N	2017-11-23 19:29:35.392315	2017-11-23 19:29:35.392315	12	David Whitworth
574	\N	\N	2017-11-23 19:29:35.395757	2017-11-23 19:29:35.395757	12	Don Whitehead
575	\N	\N	2017-11-23 19:29:35.400138	2017-11-23 19:29:35.400138	12	Fred White
576	\N	\N	2017-11-23 19:29:35.404861	2017-11-23 19:29:35.404861	12	Greg Moore
577	\N	\N	2017-11-23 19:29:35.409102	2017-11-23 19:29:35.409102	12	Jessica Cleaves
578	\N	\N	2017-11-23 19:29:35.413481	2017-11-23 19:29:35.413481	12	John Paris
579	\N	\N	2017-11-23 19:29:35.417947	2017-11-23 19:29:35.417947	12	Johnny Graham
580	\N	\N	2017-11-23 19:29:35.422568	2017-11-23 19:29:35.422568	12	Larry Dunn
581	\N	\N	2017-11-23 19:29:35.426985	2017-11-23 19:29:35.426985	12	Leslie Drayton
582	\N	\N	2017-11-23 19:29:35.431479	2017-11-23 19:29:35.431479	12	Maurice White
583	\N	\N	2017-11-23 19:29:35.436782	2017-11-23 19:29:35.436782	12	Michael Beal
584	\N	\N	2017-11-23 19:29:35.441883	2017-11-23 19:29:35.441883	12	Morris O'Connor
585	\N	\N	2017-11-23 19:29:35.446565	2017-11-23 19:29:35.446565	12	Morris Pleasure
586	\N	\N	2017-11-23 19:29:35.451306	2017-11-23 19:29:35.451306	12	Myron McKinley
587	\N	\N	2017-11-23 19:29:35.455362	2017-11-23 19:29:35.455362	12	Philip Bailey
588	\N	\N	2017-11-23 19:29:35.459109	2017-11-23 19:29:35.459109	12	Philip Doron Bailey
589	\N	\N	2017-11-23 19:29:35.463236	2017-11-23 19:29:35.463236	12	Ralph Johnson
590	\N	\N	2017-11-23 19:29:35.467057	2017-11-23 19:29:35.467057	12	Robert Brookins
591	\N	\N	2017-11-23 19:29:35.470857	2017-11-23 19:29:35.470857	12	Roland Bautista
592	\N	\N	2017-11-23 19:29:35.474471	2017-11-23 19:29:35.474471	12	Ronnie Laws
593	\N	\N	2017-11-23 19:29:35.478142	2017-11-23 19:29:35.478142	12	Sheldon Reynolds
594	\N	\N	2017-11-23 19:29:35.481838	2017-11-23 19:29:35.481838	12	Sherry Scott
595	\N	\N	2017-11-23 19:29:35.48636	2017-11-23 19:29:35.48636	12	Sonny Emory
596	\N	\N	2017-11-23 19:29:35.491017	2017-11-23 19:29:35.491017	12	Verdine White
597	\N	\N	2017-11-23 19:29:35.495507	2017-11-23 19:29:35.495507	12	Wade Flemons
598	\N	\N	2017-11-23 19:29:35.508334	2017-11-23 19:29:35.508334	12	Wayne Vaughn
599	\N	\N	2017-11-23 19:29:35.512418	2017-11-23 19:29:35.512418	12	Yackov Ben Israel
600	\N	\N	2017-11-23 19:29:47.372715	2017-11-23 19:29:47.372715	12	Chris Jasper
601	\N	\N	2017-11-23 19:29:47.377662	2017-11-23 19:29:47.377662	12	Ernie Isley
602	\N	\N	2017-11-23 19:29:47.382571	2017-11-23 19:29:47.382571	12	George Moreland
603	\N	\N	2017-11-23 19:29:47.387111	2017-11-23 19:29:47.387111	12	Marvin Isley
604	\N	\N	2017-11-23 19:29:47.39144	2017-11-23 19:29:47.39144	12	O'Kelly Isley
605	\N	\N	2017-11-23 19:29:47.395752	2017-11-23 19:29:47.395752	12	Ronald Isley
606	\N	\N	2017-11-23 19:29:47.400188	2017-11-23 19:29:47.400188	12	Rudolph Isley
607	\N	\N	2017-11-23 19:29:58.365447	2017-11-23 19:29:58.365447	12	Ali-Ollie Woodson
608	\N	\N	2017-11-23 19:29:58.370625	2017-11-23 19:29:58.370625	12	Barrington Henderson
609	\N	\N	2017-11-23 19:29:58.375064	2017-11-23 19:29:58.375064	12	Damon Harris
610	\N	\N	2017-11-23 19:29:58.379196	2017-11-23 19:29:58.379196	12	David Ruffin
611	\N	\N	2017-11-23 19:29:58.382842	2017-11-23 19:29:58.382842	12	Dennis Edwards
612	\N	\N	2017-11-23 19:29:58.3868	2017-11-23 19:29:58.3868	12	Eddie Kendricks
613	\N	\N	2017-11-23 19:29:58.391229	2017-11-23 19:29:58.391229	12	Elbridge Bryant
614	\N	\N	2017-11-23 19:29:58.395899	2017-11-23 19:29:58.395899	12	G.C. Cameron
615	\N	\N	2017-11-23 19:29:58.400378	2017-11-23 19:29:58.400378	12	Glenn Leonard
616	\N	\N	2017-11-23 19:29:58.404359	2017-11-23 19:29:58.404359	12	Louis Price
617	\N	\N	2017-11-23 19:29:58.408096	2017-11-23 19:29:58.408096	12	Melvin Franklin
618	\N	\N	2017-11-23 19:29:58.412381	2017-11-23 19:29:58.412381	12	Otis Williams
619	\N	\N	2017-11-23 19:29:58.416597	2017-11-23 19:29:58.416597	12	Paul Williams (4)
620	\N	\N	2017-11-23 19:29:58.41984	2017-11-23 19:29:58.41984	12	Richard Street
621	\N	\N	2017-11-23 19:29:58.423243	2017-11-23 19:29:58.423243	12	Ron Tyson
622	\N	\N	2017-11-23 19:29:58.426481	2017-11-23 19:29:58.426481	12	Terry Weeks (2)
623	\N	\N	2017-11-23 19:29:58.429582	2017-11-23 19:29:58.429582	12	Theo Peoples
624	\N	\N	2017-11-23 19:33:02.39622	2017-11-23 19:33:02.39622	5	Brian Burton
625	\N	\N	2017-11-23 19:33:02.400757	2017-11-23 19:33:02.400757	5	Cass Browne
626	\N	\N	2017-11-23 19:33:02.404406	2017-11-23 19:33:02.404406	5	Damon Albarn
627	\N	\N	2017-11-23 19:33:02.408495	2017-11-23 19:33:02.408495	5	Dan Nakamura
628	\N	\N	2017-11-23 19:33:02.413069	2017-11-23 19:33:02.413069	5	Jamie Hewlett
629	\N	\N	2017-11-23 19:33:02.415642	2017-11-23 19:33:02.415642	5	Jeff Wootton
630	\N	\N	2017-11-23 19:33:02.418169	2017-11-23 19:33:02.418169	5	Mick Jones
631	\N	\N	2017-11-23 19:33:02.420738	2017-11-23 19:33:02.420738	5	Miho Hatori
632	\N	\N	2017-11-23 19:33:02.423085	2017-11-23 19:33:02.423085	5	Mike Smith (3)
633	\N	\N	2017-11-23 19:33:02.425941	2017-11-23 19:33:02.425941	5	Morgan Nicholls
634	\N	\N	2017-11-23 19:33:02.429754	2017-11-23 19:33:02.429754	5	Nelson De Freitas
635	\N	\N	2017-11-23 19:33:02.433649	2017-11-23 19:33:02.433649	5	Paul Simonon
636	\N	\N	2017-11-23 19:33:02.436545	2017-11-23 19:33:02.436545	5	Phil Cornwell
637	\N	\N	2017-11-23 19:33:02.439385	2017-11-23 19:33:02.439385	5	Remi Kabaka Jr.
638	\N	\N	2017-11-23 19:33:02.442156	2017-11-23 19:33:02.442156	5	Seye Adelekan
639	\N	\N	2017-11-23 19:33:02.445028	2017-11-23 19:33:02.445028	5	Simon Katz
640	\N	\N	2017-11-23 19:33:02.44778	2017-11-23 19:33:02.44778	5	Simon Tong
641	\N	\N	2017-11-23 19:33:02.450318	2017-11-23 19:33:02.450318	5	Stephen Sedgwick
642	\N	\N	2017-11-23 19:33:02.453282	2017-11-23 19:33:02.453282	5	Teren Delvon Jones
643	\N	\N	2017-11-23 19:33:02.456374	2017-11-23 19:33:02.456374	5	Wayne Hernandez
644	\N	\N	2017-11-23 19:33:14.364925	2017-11-23 19:33:14.364925	5	Bernard Sumner
645	\N	\N	2017-11-23 19:33:14.36915	2017-11-23 19:33:14.36915	5	Gillian Gilbert
646	\N	\N	2017-11-23 19:33:14.37291	2017-11-23 19:33:14.37291	5	Peter Hook
647	\N	\N	2017-11-23 19:33:14.376246	2017-11-23 19:33:14.376246	5	Phil Cunningham
648	\N	\N	2017-11-23 19:33:14.37864	2017-11-23 19:33:14.37864	5	Stephen Morris
649	\N	\N	2017-11-23 19:33:14.381126	2017-11-23 19:33:14.381126	5	Tom Chapman (2)
650	\N	\N	2017-11-23 19:33:25.377835	2017-11-23 19:33:25.377835	5	Keith Flint
651	\N	\N	2017-11-23 19:33:25.382183	2017-11-23 19:33:25.382183	5	Keith Palmer
652	\N	\N	2017-11-23 19:33:25.386167	2017-11-23 19:33:25.386167	5	Leeroy Thornhill
653	\N	\N	2017-11-23 19:33:25.390081	2017-11-23 19:33:25.390081	5	Liam Howlett
654	\N	\N	2017-11-23 19:33:37.374137	2017-11-23 19:33:37.374137	5	Chris Lowe
655	\N	\N	2017-11-23 19:33:37.379079	2017-11-23 19:33:37.379079	5	Neil Tennant
656	\N	\N	2017-11-23 19:33:48.369032	2017-11-23 19:33:48.369032	5	Ed Simons
657	\N	\N	2017-11-23 19:33:48.374174	2017-11-23 19:33:48.374174	5	Tom Rowlands
658	\N	\N	2017-11-23 19:40:46.389113	2017-11-23 19:40:46.389113	18	Alan Estes
659	\N	\N	2017-11-23 19:40:46.392258	2017-11-23 19:40:46.392258	18	Alex Dmochowski
660	\N	\N	2017-11-23 19:40:46.394721	2017-11-23 19:40:46.394721	18	Alice Stuart
661	\N	\N	2017-11-23 19:40:46.397279	2017-11-23 19:40:46.397279	18	Andre Lewis
662	\N	\N	2017-11-23 19:40:46.399764	2017-11-23 19:40:46.399764	18	Anthony Ortega
663	\N	\N	2017-11-23 19:40:46.402588	2017-11-23 19:40:46.402588	18	Art Tripp
664	\N	\N	2017-11-23 19:40:46.405615	2017-11-23 19:40:46.405615	18	Arthur Barrow
665	\N	\N	2017-11-23 19:40:46.408419	2017-11-23 19:40:46.408419	18	Aynsley Dunbar
666	\N	\N	2017-11-23 19:40:46.411189	2017-11-23 19:40:46.411189	18	Billy Byers
667	\N	\N	2017-11-23 19:40:46.413954	2017-11-23 19:40:46.413954	18	Billy Mundi
668	\N	\N	2017-11-23 19:40:46.416729	2017-11-23 19:40:46.416729	18	Bob Harris (5)
669	\N	\N	2017-11-23 19:40:46.419279	2017-11-23 19:40:46.419279	18	Bob Zimmitti
670	\N	\N	2017-11-23 19:40:46.422045	2017-11-23 19:40:46.422045	18	Bobby Martin (2)
671	\N	\N	2017-11-23 19:40:46.42495	2017-11-23 19:40:46.42495	18	Bruce Fowler (3)
672	\N	\N	2017-11-23 19:40:46.428008	2017-11-23 19:40:46.428008	18	Bunk Gardner
673	\N	\N	2017-11-23 19:40:46.431159	2017-11-23 19:40:46.431159	18	Chad Wackerman
674	\N	\N	2017-11-23 19:40:46.434457	2017-11-23 19:40:46.434457	18	Chester Thompson
675	\N	\N	2017-11-23 19:40:46.437488	2017-11-23 19:40:46.437488	18	Chunky (3)
676	\N	\N	2017-11-23 19:40:46.44059	2017-11-23 19:40:46.44059	18	Denny Walley
677	\N	\N	2017-11-23 19:40:46.443752	2017-11-23 19:40:46.443752	18	Don "Sugarcane" Harris
678	\N	\N	2017-11-23 19:40:46.446931	2017-11-23 19:40:46.446931	18	Don Preston
679	\N	\N	2017-11-23 19:40:46.449895	2017-11-23 19:40:46.449895	18	Don Van Vliet
680	\N	\N	2017-11-23 19:40:46.452811	2017-11-23 19:40:46.452811	18	Earl Dumler
681	\N	\N	2017-11-23 19:40:46.45559	2017-11-23 19:40:46.45559	18	Ed Mann
682	\N	\N	2017-11-23 19:40:46.458452	2017-11-23 19:40:46.458452	18	Elliot Ingber
683	\N	\N	2017-11-23 19:40:46.462438	2017-11-23 19:40:46.462438	18	Ernie Tack
684	\N	\N	2017-11-23 19:40:46.466642	2017-11-23 19:40:46.466642	18	Ernie Watts
685	\N	\N	2017-11-23 19:40:46.470508	2017-11-23 19:40:46.470508	18	Frank Zappa
686	\N	\N	2017-11-23 19:40:46.474612	2017-11-23 19:40:46.474612	18	Fred Jackson
687	\N	\N	2017-11-23 19:40:46.478519	2017-11-23 19:40:46.478519	18	George Duke
688	\N	\N	2017-11-23 19:40:46.482821	2017-11-23 19:40:46.482821	18	Henry Vestine
689	\N	\N	2017-11-23 19:40:46.486948	2017-11-23 19:40:46.486948	18	Howard Kaylan
690	\N	\N	2017-11-23 19:40:46.490958	2017-11-23 19:40:46.490958	18	Ian Underwood
691	\N	\N	2017-11-23 19:40:46.494942	2017-11-23 19:40:46.494942	18	Ike Willis
692	\N	\N	2017-11-23 19:40:46.498689	2017-11-23 19:40:46.498689	18	James William Guercio
693	\N	\N	2017-11-23 19:40:46.502626	2017-11-23 19:40:46.502626	18	Janet Ferguson
694	\N	\N	2017-11-23 19:40:46.50623	2017-11-23 19:40:46.50623	18	Jean-Luc Ponty
695	\N	\N	2017-11-23 19:40:46.510507	2017-11-23 19:40:46.510507	18	Jeff Simmons
696	\N	\N	2017-11-23 19:40:46.514372	2017-11-23 19:40:46.514372	18	Jim Fielder
697	\N	\N	2017-11-23 19:40:46.518559	2017-11-23 19:40:46.518559	18	Jim Pons
698	\N	\N	2017-11-23 19:40:46.522817	2017-11-23 19:40:46.522817	18	Jimmy Carl Black
699	\N	\N	2017-11-23 19:40:46.527308	2017-11-23 19:40:46.527308	18	Joanne Caldwell McNabb
700	\N	\N	2017-11-23 19:40:46.53138	2017-11-23 19:40:46.53138	18	Joel Peskin
701	\N	\N	2017-11-23 19:40:46.535523	2017-11-23 19:40:46.535523	18	John Guerin
702	\N	\N	2017-11-23 19:40:46.541145	2017-11-23 19:40:46.541145	18	John Rotella
703	\N	\N	2017-11-23 19:40:46.546032	2017-11-23 19:40:46.546032	18	Kenny Shroyer
704	\N	\N	2017-11-23 19:40:46.550698	2017-11-23 19:40:46.550698	18	Kurt McGettrick
705	\N	\N	2017-11-23 19:40:46.555247	2017-11-23 19:40:46.555247	18	Lowell George
706	\N	\N	2017-11-23 19:40:46.559783	2017-11-23 19:40:46.559783	18	Malcolm McNab
707	\N	\N	2017-11-23 19:40:46.564706	2017-11-23 19:40:46.564706	18	Mark Volman
708	\N	\N	2017-11-23 19:40:46.570056	2017-11-23 19:40:46.570056	18	Mike Altschul
709	\N	\N	2017-11-23 19:40:46.574771	2017-11-23 19:40:46.574771	18	Moon Zappa
710	\N	\N	2017-11-23 19:40:46.579109	2017-11-23 19:40:46.579109	18	Motorhead Sherwood
711	\N	\N	2017-11-23 19:40:46.583634	2017-11-23 19:40:46.583634	18	Napoleon M. Brock
712	\N	\N	2017-11-23 19:40:46.588	2017-11-23 19:40:46.588	18	Norma Jean Bell
713	\N	\N	2017-11-23 19:40:46.59359	2017-11-23 19:40:46.59359	18	Peter Wolf (3)
714	\N	\N	2017-11-23 19:40:46.598402	2017-11-23 19:40:46.598402	18	Ralph Humphrey
715	\N	\N	2017-11-23 19:40:46.601955	2017-11-23 19:40:46.601955	18	Ray Collins
716	\N	\N	2017-11-23 19:40:46.605213	2017-11-23 19:40:46.605213	18	Robert 'Frog' Camarena
717	\N	\N	2017-11-23 19:40:46.608793	2017-11-23 19:40:46.608793	18	Roy Estrada
718	\N	\N	2017-11-23 19:40:46.611688	2017-11-23 19:40:46.611688	18	Ruben Ladron De Guevara
719	\N	\N	2017-11-23 19:40:46.614454	2017-11-23 19:40:46.614454	18	Ruth Underwood
720	\N	\N	2017-11-23 19:40:46.617215	2017-11-23 19:40:46.617215	18	Sal Marquez
721	\N	\N	2017-11-23 19:40:46.619966	2017-11-23 19:40:46.619966	18	Steve Mann (7)
722	\N	\N	2017-11-23 19:40:46.622951	2017-11-23 19:40:46.622951	18	Suzy Creamcheese
723	\N	\N	2017-11-23 19:40:46.626104	2017-11-23 19:40:46.626104	18	Tom Fowler
724	\N	\N	2017-11-23 19:40:46.628804	2017-11-23 19:40:46.628804	18	Tommy Mariano
725	\N	\N	2017-11-23 19:40:46.631318	2017-11-23 19:40:46.631318	18	Tony Duran
726	\N	\N	2017-11-23 19:40:58.371927	2017-11-23 19:40:58.371927	18	Billy Cobham
727	\N	\N	2017-11-23 19:40:58.376908	2017-11-23 19:40:58.376908	18	Danny Gottlieb
728	\N	\N	2017-11-23 19:40:58.381675	2017-11-23 19:40:58.381675	18	Gayle Moran
729	\N	\N	2017-11-23 19:40:58.3863	2017-11-23 19:40:58.3863	18	Jan Hammer
730	\N	\N	2017-11-23 19:40:58.390701	2017-11-23 19:40:58.390701	18	Jean-Luc Ponty
731	\N	\N	2017-11-23 19:40:58.395304	2017-11-23 19:40:58.395304	18	Jerry Goodman
732	\N	\N	2017-11-23 19:40:58.399857	2017-11-23 19:40:58.399857	18	John McLaughlin
733	\N	\N	2017-11-23 19:40:58.404519	2017-11-23 19:40:58.404519	18	Jonas Hellborg
734	\N	\N	2017-11-23 19:40:58.409034	2017-11-23 19:40:58.409034	18	Narada Michael Walden
735	\N	\N	2017-11-23 19:40:58.413605	2017-11-23 19:40:58.413605	18	Ralphe Armstrong
736	\N	\N	2017-11-23 19:40:58.4183	2017-11-23 19:40:58.4183	18	Rick Laird
737	\N	\N	2017-11-23 19:40:58.424182	2017-11-23 19:40:58.424182	18	Stu Goldberg
738	\N	\N	2017-11-23 19:41:08.385254	2017-11-23 19:41:08.385254	18	Bernhard Beibl
739	\N	\N	2017-11-23 19:41:08.38979	2017-11-23 19:41:08.38979	18	Charlie Prince
740	\N	\N	2017-11-23 19:41:08.39373	2017-11-23 19:41:08.39373	18	Charly Weiss
741	\N	\N	2017-11-23 19:41:08.397382	2017-11-23 19:41:08.397382	18	Christopher Franke
742	\N	\N	2017-11-23 19:41:08.400237	2017-11-23 19:41:08.400237	18	Conrad Schnitzler
743	\N	\N	2017-11-23 19:41:08.403322	2017-11-23 19:41:08.403322	18	Edgar Froese
744	\N	\N	2017-11-23 19:41:08.406128	2017-11-23 19:41:08.406128	18	Eliot Cromwell
745	\N	\N	2017-11-23 19:41:08.409113	2017-11-23 19:41:08.409113	18	Emil Hachfeld
746	\N	\N	2017-11-23 19:41:08.412366	2017-11-23 19:41:08.412366	18	Gerald Gradwohl
747	\N	\N	2017-11-23 19:41:08.415164	2017-11-23 19:41:08.415164	18	Hoshiko Yamane
748	\N	\N	2017-11-23 19:41:08.417933	2017-11-23 19:41:08.417933	18	Iris Camaa
749	\N	\N	2017-11-23 19:41:08.4208	2017-11-23 19:41:08.4208	18	Jerome Froese
750	\N	\N	2017-11-23 19:41:08.423882	2017-11-23 19:41:08.423882	18	Johannes Schmölling
751	\N	\N	2017-11-23 19:41:08.426835	2017-11-23 19:41:08.426835	18	Karsten Dorinth
752	\N	\N	2017-11-23 19:41:08.429878	2017-11-23 19:41:08.429878	18	Klaus Krüger
753	\N	\N	2017-11-23 19:41:08.432891	2017-11-23 19:41:08.432891	18	Klaus Schulze
754	\N	\N	2017-11-23 19:41:08.435737	2017-11-23 19:41:08.435737	18	Kurt Herkenberg
755	\N	\N	2017-11-23 19:41:08.438276	2017-11-23 19:41:08.438276	18	Lanse Hapshash
756	\N	\N	2017-11-23 19:41:08.440905	2017-11-23 19:41:08.440905	18	Linda Spa
757	\N	\N	2017-11-23 19:41:08.444328	2017-11-23 19:41:08.444328	18	Michael Hoenig
758	\N	\N	2017-11-23 19:41:08.44786	2017-11-23 19:41:08.44786	18	Paul Haslinger
759	\N	\N	2017-11-23 19:41:08.452845	2017-11-23 19:41:08.452845	18	Peter Baumann
760	\N	\N	2017-11-23 19:41:08.4577	2017-11-23 19:41:08.4577	18	Ralf Wadephul
761	\N	\N	2017-11-23 19:41:08.461945	2017-11-23 19:41:08.461945	18	Steve Jolliffe
762	\N	\N	2017-11-23 19:41:08.466938	2017-11-23 19:41:08.466938	18	Steve Schroyder
763	\N	\N	2017-11-23 19:41:08.471177	2017-11-23 19:41:08.471177	18	Thorsten Quaeschning
764	\N	\N	2017-11-23 19:41:08.47491	2017-11-23 19:41:08.47491	18	Ulrich Schnauss
765	\N	\N	2017-11-23 19:41:08.478839	2017-11-23 19:41:08.478839	18	Volker Hombach
766	\N	\N	2017-11-23 19:41:08.482831	2017-11-23 19:41:08.482831	18	Zlatko Perica
767	\N	\N	2017-11-23 19:41:20.377698	2017-11-23 19:41:20.377698	18	Alan Hawkshaw
768	\N	\N	2017-11-23 19:41:20.382518	2017-11-23 19:41:20.382518	18	Alan Tarney
769	\N	\N	2017-11-23 19:41:20.386861	2017-11-23 19:41:20.386861	18	Brian Bennett
770	\N	\N	2017-11-23 19:41:20.390996	2017-11-23 19:41:20.390996	18	Brian Locking
771	\N	\N	2017-11-23 19:41:20.398126	2017-11-23 19:41:20.398126	18	Bruce Welch
772	\N	\N	2017-11-23 19:41:20.402343	2017-11-23 19:41:20.402343	18	Cliff Hall (2)
773	\N	\N	2017-11-23 19:41:20.406619	2017-11-23 19:41:20.406619	18	Hank Marvin
774	\N	\N	2017-11-23 19:41:20.410869	2017-11-23 19:41:20.410869	18	Jet Harris
775	\N	\N	2017-11-23 19:41:20.415654	2017-11-23 19:41:20.415654	18	John Farrar
776	\N	\N	2017-11-23 19:41:20.420773	2017-11-23 19:41:20.420773	18	John Rostill
777	\N	\N	2017-11-23 19:41:20.425615	2017-11-23 19:41:20.425615	18	Mark Griffiths
778	\N	\N	2017-11-23 19:41:20.429682	2017-11-23 19:41:20.429682	18	Tony Meehan
779	\N	\N	2017-11-23 19:41:32.372223	2017-11-23 19:41:32.372223	18	Alan Caddy
780	\N	\N	2017-11-23 19:41:32.376511	2017-11-23 19:41:32.376511	18	Brian Gregg
781	\N	\N	2017-11-23 19:41:32.380725	2017-11-23 19:41:32.380725	18	Bryan Irwin
782	\N	\N	2017-11-23 19:41:32.384445	2017-11-23 19:41:32.384445	18	Clem Cattini
783	\N	\N	2017-11-23 19:41:32.388368	2017-11-23 19:41:32.388368	18	Dave Watts (3)
784	\N	\N	2017-11-23 19:41:32.392465	2017-11-23 19:41:32.392465	18	George Bellamy
785	\N	\N	2017-11-23 19:41:32.396356	2017-11-23 19:41:32.396356	18	Heinz
786	\N	\N	2017-11-23 19:41:32.400367	2017-11-23 19:41:32.400367	18	Norman Hale
787	\N	\N	2017-11-23 19:41:32.404896	2017-11-23 19:41:32.404896	18	Peter Holder
788	\N	\N	2017-11-23 19:41:32.409525	2017-11-23 19:41:32.409525	18	Ray Randall
789	\N	\N	2017-11-23 19:41:32.414466	2017-11-23 19:41:32.414466	18	Robb Huxley
790	\N	\N	2017-11-23 19:41:32.419767	2017-11-23 19:41:32.419767	18	Roger LaVern
791	\N	\N	2017-11-23 19:41:32.424644	2017-11-23 19:41:32.424644	18	Roy Phillips
792	\N	\N	2017-11-23 19:41:32.429585	2017-11-23 19:41:32.429585	18	Stuart Taylor
793	\N	\N	2017-11-23 19:41:32.434261	2017-11-23 19:41:32.434261	18	Tab Martin
794	\N	\N	2017-11-23 19:44:11.414537	2017-11-23 19:44:11.414537	20	Alan Wilder
795	\N	\N	2017-11-23 19:44:11.41932	2017-11-23 19:44:11.41932	20	Andrew Fletcher
796	\N	\N	2017-11-23 19:44:11.423623	2017-11-23 19:44:11.423623	20	Dave Gahan
797	\N	\N	2017-11-23 19:44:11.428232	2017-11-23 19:44:11.428232	20	Martin L. Gore
798	\N	\N	2017-11-23 19:44:11.433711	2017-11-23 19:44:11.433711	20	Vince Clarke
799	\N	\N	2017-11-23 19:44:22.371487	2017-11-23 19:44:22.371487	20	Andreas Hohmann
800	\N	\N	2017-11-23 19:44:22.374513	2017-11-23 19:44:22.374513	20	Charly Weiss
801	\N	\N	2017-11-23 19:44:22.377276	2017-11-23 19:44:22.377276	20	Eberhard Kranemann
802	\N	\N	2017-11-23 19:44:22.380541	2017-11-23 19:44:22.380541	20	Fernando Abrantes
803	\N	\N	2017-11-23 19:44:22.384558	2017-11-23 19:44:22.384558	20	Florian Schneider
804	\N	\N	2017-11-23 19:44:22.387898	2017-11-23 19:44:22.387898	20	Fritz Hilpert
805	\N	\N	2017-11-23 19:44:22.39086	2017-11-23 19:44:22.39086	20	Henning Schmitz
806	\N	\N	2017-11-23 19:44:22.393497	2017-11-23 19:44:22.393497	20	Houschäng Nejadépour
807	\N	\N	2017-11-23 19:44:22.396258	2017-11-23 19:44:22.396258	20	Karl Bartos
808	\N	\N	2017-11-23 19:44:22.398861	2017-11-23 19:44:22.398861	20	Klaus Dinger
809	\N	\N	2017-11-23 19:44:22.402892	2017-11-23 19:44:22.402892	20	Klaus Röder
810	\N	\N	2017-11-23 19:44:22.40686	2017-11-23 19:44:22.40686	20	Michael Rother
811	\N	\N	2017-11-23 19:44:22.410771	2017-11-23 19:44:22.410771	20	Ralf Hütter
812	\N	\N	2017-11-23 19:44:22.414685	2017-11-23 19:44:22.414685	20	Wolfgang Flür
813	\N	\N	2017-11-23 19:44:34.372299	2017-11-23 19:44:34.372299	20	Bernard Sumner
814	\N	\N	2017-11-23 19:44:34.376511	2017-11-23 19:44:34.376511	20	Gillian Gilbert
815	\N	\N	2017-11-23 19:44:34.380567	2017-11-23 19:44:34.380567	20	Peter Hook
816	\N	\N	2017-11-23 19:44:34.385065	2017-11-23 19:44:34.385065	20	Phil Cunningham
817	\N	\N	2017-11-23 19:44:34.389516	2017-11-23 19:44:34.389516	20	Stephen Morris
818	\N	\N	2017-11-23 19:44:34.393553	2017-11-23 19:44:34.393553	20	Tom Chapman (2)
819	\N	\N	2017-11-23 19:44:45.373736	2017-11-23 19:44:45.373736	20	Alex Swift
820	\N	\N	2017-11-23 19:44:45.378332	2017-11-23 19:44:45.378332	20	Andrew Vowles
821	\N	\N	2017-11-23 19:44:45.382708	2017-11-23 19:44:45.382708	20	Grant Marshall
822	\N	\N	2017-11-23 19:44:45.38677	2017-11-23 19:44:45.38677	20	Robert Del Naja
823	\N	\N	2017-11-23 19:44:56.365085	2017-11-23 19:44:56.365085	20	Guy-Manuel de Homem-Christo
824	\N	\N	2017-11-23 19:44:56.368748	2017-11-23 19:44:56.368748	20	Thomas Bangalter
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('artists_id_seq', 824, true);


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
87	31	18	2017-11-23 18:54:14.520604	2017-11-23 18:54:14.520604
88	31	19	2017-11-23 18:54:14.524798	2017-11-23 18:54:14.524798
89	31	20	2017-11-23 18:54:14.528483	2017-11-23 18:54:14.528483
90	31	21	2017-11-23 18:54:14.532552	2017-11-23 18:54:14.532552
91	31	22	2017-11-23 18:54:14.536021	2017-11-23 18:54:14.536021
92	31	23	2017-11-23 18:54:14.539528	2017-11-23 18:54:14.539528
93	31	24	2017-11-23 18:54:14.543412	2017-11-23 18:54:14.543412
94	31	25	2017-11-23 18:54:14.548915	2017-11-23 18:54:14.548915
95	31	26	2017-11-23 18:54:14.555144	2017-11-23 18:54:14.555144
96	31	27	2017-11-23 18:54:14.561456	2017-11-23 18:54:14.561456
97	31	28	2017-11-23 18:54:14.567686	2017-11-23 18:54:14.567686
98	31	29	2017-11-23 18:54:14.57297	2017-11-23 18:54:14.57297
99	31	30	2017-11-23 18:54:14.57811	2017-11-23 18:54:14.57811
100	31	31	2017-11-23 18:54:14.583966	2017-11-23 18:54:14.583966
101	31	32	2017-11-23 18:54:14.589328	2017-11-23 18:54:14.589328
102	31	33	2017-11-23 18:54:14.59469	2017-11-23 18:54:14.59469
103	31	34	2017-11-23 18:54:14.601075	2017-11-23 18:54:14.601075
104	31	35	2017-11-23 18:54:14.607127	2017-11-23 18:54:14.607127
105	31	36	2017-11-23 18:54:14.613587	2017-11-23 18:54:14.613587
106	31	37	2017-11-23 18:54:14.619966	2017-11-23 18:54:14.619966
107	31	38	2017-11-23 18:54:14.626086	2017-11-23 18:54:14.626086
108	31	39	2017-11-23 18:54:14.631061	2017-11-23 18:54:14.631061
109	31	40	2017-11-23 18:54:14.636467	2017-11-23 18:54:14.636467
110	31	41	2017-11-23 18:54:14.641765	2017-11-23 18:54:14.641765
111	31	42	2017-11-23 18:54:14.646927	2017-11-23 18:54:14.646927
112	31	43	2017-11-23 18:54:14.652176	2017-11-23 18:54:14.652176
113	31	44	2017-11-23 18:54:14.657923	2017-11-23 18:54:14.657923
114	31	45	2017-11-23 18:54:14.663566	2017-11-23 18:54:14.663566
115	31	46	2017-11-23 18:54:14.669079	2017-11-23 18:54:14.669079
116	31	47	2017-11-23 18:54:14.674269	2017-11-23 18:54:14.674269
117	31	48	2017-11-23 18:54:14.67955	2017-11-23 18:54:14.67955
118	31	49	2017-11-23 18:54:14.685079	2017-11-23 18:54:14.685079
119	32	50	2017-11-23 18:54:26.37976	2017-11-23 18:54:26.37976
120	32	51	2017-11-23 18:54:26.386251	2017-11-23 18:54:26.386251
121	32	52	2017-11-23 18:54:26.391378	2017-11-23 18:54:26.391378
122	32	53	2017-11-23 18:54:26.398294	2017-11-23 18:54:26.398294
123	32	54	2017-11-23 18:54:26.405005	2017-11-23 18:54:26.405005
124	32	55	2017-11-23 18:54:26.411229	2017-11-23 18:54:26.411229
125	33	56	2017-11-23 18:54:37.524782	2017-11-23 18:54:37.524782
126	33	57	2017-11-23 18:54:37.531399	2017-11-23 18:54:37.531399
127	33	58	2017-11-23 18:54:37.537891	2017-11-23 18:54:37.537891
128	33	59	2017-11-23 18:54:37.543346	2017-11-23 18:54:37.543346
129	33	60	2017-11-23 18:54:37.548358	2017-11-23 18:54:37.548358
130	33	61	2017-11-23 18:54:37.553475	2017-11-23 18:54:37.553475
131	33	62	2017-11-23 18:54:37.558581	2017-11-23 18:54:37.558581
132	33	63	2017-11-23 18:54:37.564497	2017-11-23 18:54:37.564497
133	33	64	2017-11-23 18:54:37.57042	2017-11-23 18:54:37.57042
134	33	65	2017-11-23 18:54:37.575457	2017-11-23 18:54:37.575457
135	33	66	2017-11-23 18:54:37.582043	2017-11-23 18:54:37.582043
136	33	67	2017-11-23 18:54:37.589243	2017-11-23 18:54:37.589243
137	33	68	2017-11-23 18:54:37.596654	2017-11-23 18:54:37.596654
138	33	69	2017-11-23 18:54:37.603946	2017-11-23 18:54:37.603946
139	33	70	2017-11-23 18:54:37.611373	2017-11-23 18:54:37.611373
140	33	71	2017-11-23 18:54:37.617003	2017-11-23 18:54:37.617003
141	33	72	2017-11-23 18:54:37.622592	2017-11-23 18:54:37.622592
142	33	73	2017-11-23 18:54:37.630353	2017-11-23 18:54:37.630353
143	33	74	2017-11-23 18:54:37.636493	2017-11-23 18:54:37.636493
144	33	75	2017-11-23 18:54:37.641719	2017-11-23 18:54:37.641719
145	33	76	2017-11-23 18:54:37.646954	2017-11-23 18:54:37.646954
146	33	77	2017-11-23 18:54:37.652127	2017-11-23 18:54:37.652127
147	33	78	2017-11-23 18:54:37.658214	2017-11-23 18:54:37.658214
148	33	79	2017-11-23 18:54:37.66255	2017-11-23 18:54:37.66255
149	33	80	2017-11-23 18:54:37.666897	2017-11-23 18:54:37.666897
150	33	81	2017-11-23 18:54:37.671143	2017-11-23 18:54:37.671143
151	33	82	2017-11-23 18:54:37.675518	2017-11-23 18:54:37.675518
152	33	83	2017-11-23 18:54:37.6796	2017-11-23 18:54:37.6796
153	33	84	2017-11-23 18:54:37.683956	2017-11-23 18:54:37.683956
154	33	85	2017-11-23 18:54:37.688192	2017-11-23 18:54:37.688192
155	33	86	2017-11-23 18:54:37.692795	2017-11-23 18:54:37.692795
156	33	87	2017-11-23 18:54:37.69687	2017-11-23 18:54:37.69687
157	33	88	2017-11-23 18:54:37.701203	2017-11-23 18:54:37.701203
158	33	89	2017-11-23 18:54:37.70527	2017-11-23 18:54:37.70527
159	33	90	2017-11-23 18:54:37.709739	2017-11-23 18:54:37.709739
160	33	91	2017-11-23 18:54:37.714489	2017-11-23 18:54:37.714489
161	33	92	2017-11-23 18:54:37.718692	2017-11-23 18:54:37.718692
162	33	93	2017-11-23 18:54:37.722672	2017-11-23 18:54:37.722672
163	33	94	2017-11-23 18:54:37.727037	2017-11-23 18:54:37.727037
164	33	95	2017-11-23 18:54:37.731026	2017-11-23 18:54:37.731026
165	33	96	2017-11-23 18:54:37.734788	2017-11-23 18:54:37.734788
166	33	97	2017-11-23 18:54:37.738765	2017-11-23 18:54:37.738765
167	33	98	2017-11-23 18:54:37.742828	2017-11-23 18:54:37.742828
168	33	99	2017-11-23 18:54:37.746817	2017-11-23 18:54:37.746817
169	33	100	2017-11-23 18:54:37.751227	2017-11-23 18:54:37.751227
170	33	101	2017-11-23 18:54:37.755881	2017-11-23 18:54:37.755881
171	33	102	2017-11-23 18:54:37.760185	2017-11-23 18:54:37.760185
172	33	103	2017-11-23 18:54:37.764266	2017-11-23 18:54:37.764266
173	33	104	2017-11-23 18:54:37.769204	2017-11-23 18:54:37.769204
174	34	105	2017-11-23 18:54:49.401299	2017-11-23 18:54:49.401299
175	34	106	2017-11-23 18:54:49.407744	2017-11-23 18:54:49.407744
176	34	107	2017-11-23 18:54:49.413917	2017-11-23 18:54:49.413917
177	34	108	2017-11-23 18:54:49.42006	2017-11-23 18:54:49.42006
178	34	109	2017-11-23 18:54:49.425738	2017-11-23 18:54:49.425738
179	34	110	2017-11-23 18:54:49.431042	2017-11-23 18:54:49.431042
180	34	111	2017-11-23 18:54:49.436379	2017-11-23 18:54:49.436379
181	34	112	2017-11-23 18:54:49.441755	2017-11-23 18:54:49.441755
182	34	113	2017-11-23 18:54:49.446212	2017-11-23 18:54:49.446212
183	35	114	2017-11-23 18:55:00.381149	2017-11-23 18:55:00.381149
184	35	115	2017-11-23 18:55:00.38661	2017-11-23 18:55:00.38661
185	35	116	2017-11-23 18:55:00.392614	2017-11-23 18:55:00.392614
186	35	117	2017-11-23 18:55:00.398664	2017-11-23 18:55:00.398664
187	35	118	2017-11-23 18:55:00.405026	2017-11-23 18:55:00.405026
188	36	119	2017-11-23 18:55:29.441211	2017-11-23 18:55:29.441211
189	36	120	2017-11-23 18:55:29.446938	2017-11-23 18:55:29.446938
190	36	121	2017-11-23 18:55:29.452362	2017-11-23 18:55:29.452362
191	36	122	2017-11-23 18:55:29.458673	2017-11-23 18:55:29.458673
192	36	123	2017-11-23 18:55:29.463859	2017-11-23 18:55:29.463859
193	36	124	2017-11-23 18:55:29.46905	2017-11-23 18:55:29.46905
194	36	125	2017-11-23 18:55:29.474856	2017-11-23 18:55:29.474856
195	36	126	2017-11-23 18:55:29.480751	2017-11-23 18:55:29.480751
196	36	127	2017-11-23 18:55:29.48678	2017-11-23 18:55:29.48678
197	37	128	2017-11-23 18:55:40.505606	2017-11-23 18:55:40.505606
198	37	129	2017-11-23 18:55:40.511532	2017-11-23 18:55:40.511532
199	37	130	2017-11-23 18:55:40.517171	2017-11-23 18:55:40.517171
200	37	131	2017-11-23 18:55:40.522978	2017-11-23 18:55:40.522978
201	37	132	2017-11-23 18:55:40.528571	2017-11-23 18:55:40.528571
202	37	133	2017-11-23 18:55:40.533955	2017-11-23 18:55:40.533955
203	37	134	2017-11-23 18:55:40.539758	2017-11-23 18:55:40.539758
204	37	135	2017-11-23 18:55:40.545538	2017-11-23 18:55:40.545538
205	37	136	2017-11-23 18:55:40.550884	2017-11-23 18:55:40.550884
206	37	137	2017-11-23 18:55:40.55701	2017-11-23 18:55:40.55701
207	37	138	2017-11-23 18:55:40.5628	2017-11-23 18:55:40.5628
208	37	139	2017-11-23 18:55:40.568612	2017-11-23 18:55:40.568612
209	37	140	2017-11-23 18:55:40.574687	2017-11-23 18:55:40.574687
210	37	141	2017-11-23 18:55:40.58038	2017-11-23 18:55:40.58038
211	37	142	2017-11-23 18:55:40.586651	2017-11-23 18:55:40.586651
212	37	143	2017-11-23 18:55:40.593231	2017-11-23 18:55:40.593231
213	37	144	2017-11-23 18:55:40.599595	2017-11-23 18:55:40.599595
214	37	145	2017-11-23 18:55:40.605889	2017-11-23 18:55:40.605889
215	37	146	2017-11-23 18:55:40.611182	2017-11-23 18:55:40.611182
216	37	147	2017-11-23 18:55:40.616562	2017-11-23 18:55:40.616562
217	37	148	2017-11-23 18:55:40.62221	2017-11-23 18:55:40.62221
218	37	149	2017-11-23 18:55:40.628715	2017-11-23 18:55:40.628715
219	38	150	2017-11-23 18:55:52.455705	2017-11-23 18:55:52.455705
220	38	151	2017-11-23 18:55:52.461386	2017-11-23 18:55:52.461386
221	38	152	2017-11-23 18:55:52.467157	2017-11-23 18:55:52.467157
222	38	153	2017-11-23 18:55:52.472379	2017-11-23 18:55:52.472379
223	38	154	2017-11-23 18:55:52.477917	2017-11-23 18:55:52.477917
224	38	155	2017-11-23 18:55:52.483429	2017-11-23 18:55:52.483429
225	38	156	2017-11-23 18:55:52.488507	2017-11-23 18:55:52.488507
226	38	157	2017-11-23 18:55:52.494431	2017-11-23 18:55:52.494431
227	38	158	2017-11-23 18:55:52.499778	2017-11-23 18:55:52.499778
228	38	159	2017-11-23 18:55:52.504158	2017-11-23 18:55:52.504158
229	38	160	2017-11-23 18:55:52.508869	2017-11-23 18:55:52.508869
230	38	161	2017-11-23 18:55:52.51382	2017-11-23 18:55:52.51382
231	38	162	2017-11-23 18:55:52.518813	2017-11-23 18:55:52.518813
232	38	163	2017-11-23 18:55:52.524548	2017-11-23 18:55:52.524548
233	38	164	2017-11-23 18:55:52.529378	2017-11-23 18:55:52.529378
234	38	165	2017-11-23 18:55:52.534042	2017-11-23 18:55:52.534042
235	38	166	2017-11-23 18:55:52.538231	2017-11-23 18:55:52.538231
236	38	167	2017-11-23 18:55:52.544052	2017-11-23 18:55:52.544052
237	38	168	2017-11-23 18:55:52.549818	2017-11-23 18:55:52.549818
238	38	169	2017-11-23 18:55:52.553787	2017-11-23 18:55:52.553787
239	38	170	2017-11-23 18:55:52.557629	2017-11-23 18:55:52.557629
240	38	171	2017-11-23 18:55:52.561532	2017-11-23 18:55:52.561532
241	38	172	2017-11-23 18:55:52.565917	2017-11-23 18:55:52.565917
242	38	173	2017-11-23 18:55:52.5697	2017-11-23 18:55:52.5697
243	38	174	2017-11-23 18:55:52.573768	2017-11-23 18:55:52.573768
244	38	175	2017-11-23 18:55:52.577912	2017-11-23 18:55:52.577912
245	39	176	2017-11-23 18:56:04.441708	2017-11-23 18:56:04.441708
246	39	177	2017-11-23 18:56:04.446707	2017-11-23 18:56:04.446707
247	39	178	2017-11-23 18:56:04.452034	2017-11-23 18:56:04.452034
248	39	179	2017-11-23 18:56:04.457159	2017-11-23 18:56:04.457159
249	39	180	2017-11-23 18:56:04.462244	2017-11-23 18:56:04.462244
250	39	181	2017-11-23 18:56:04.467638	2017-11-23 18:56:04.467638
251	39	182	2017-11-23 18:56:04.473163	2017-11-23 18:56:04.473163
252	39	183	2017-11-23 18:56:04.479341	2017-11-23 18:56:04.479341
253	39	184	2017-11-23 18:56:04.485143	2017-11-23 18:56:04.485143
254	39	185	2017-11-23 18:56:04.491664	2017-11-23 18:56:04.491664
255	39	186	2017-11-23 18:56:04.497107	2017-11-23 18:56:04.497107
256	39	187	2017-11-23 18:56:04.502664	2017-11-23 18:56:04.502664
257	39	188	2017-11-23 18:56:04.50845	2017-11-23 18:56:04.50845
258	39	189	2017-11-23 18:56:04.514076	2017-11-23 18:56:04.514076
259	39	190	2017-11-23 18:56:04.519863	2017-11-23 18:56:04.519863
260	39	191	2017-11-23 18:56:04.52569	2017-11-23 18:56:04.52569
261	39	192	2017-11-23 18:56:04.532083	2017-11-23 18:56:04.532083
262	39	193	2017-11-23 18:56:04.538169	2017-11-23 18:56:04.538169
263	39	194	2017-11-23 18:56:04.543378	2017-11-23 18:56:04.543378
264	39	195	2017-11-23 18:56:04.549234	2017-11-23 18:56:04.549234
265	39	196	2017-11-23 18:56:04.555619	2017-11-23 18:56:04.555619
266	39	197	2017-11-23 18:56:04.562213	2017-11-23 18:56:04.562213
267	39	198	2017-11-23 18:56:04.570174	2017-11-23 18:56:04.570174
268	40	199	2017-11-23 18:56:16.395853	2017-11-23 18:56:16.395853
269	40	200	2017-11-23 18:56:16.400705	2017-11-23 18:56:16.400705
270	40	201	2017-11-23 18:56:16.405394	2017-11-23 18:56:16.405394
271	40	202	2017-11-23 18:56:16.41027	2017-11-23 18:56:16.41027
272	40	203	2017-11-23 18:56:16.41619	2017-11-23 18:56:16.41619
273	40	204	2017-11-23 18:56:16.422697	2017-11-23 18:56:16.422697
274	40	205	2017-11-23 18:56:16.429342	2017-11-23 18:56:16.429342
275	40	206	2017-11-23 18:56:16.435016	2017-11-23 18:56:16.435016
276	40	207	2017-11-23 18:56:16.440124	2017-11-23 18:56:16.440124
277	40	208	2017-11-23 18:56:16.445215	2017-11-23 18:56:16.445215
278	40	209	2017-11-23 18:56:16.450527	2017-11-23 18:56:16.450527
279	40	210	2017-11-23 18:56:16.456646	2017-11-23 18:56:16.456646
280	41	211	2017-11-23 18:56:53.424258	2017-11-23 18:56:53.424258
281	41	212	2017-11-23 18:56:53.42993	2017-11-23 18:56:53.42993
282	41	213	2017-11-23 18:56:53.435234	2017-11-23 18:56:53.435234
283	41	214	2017-11-23 18:56:53.440839	2017-11-23 18:56:53.440839
284	42	215	2017-11-23 18:57:06.375489	2017-11-23 18:57:06.375489
285	42	216	2017-11-23 18:57:06.379873	2017-11-23 18:57:06.379873
286	42	217	2017-11-23 18:57:06.38403	2017-11-23 18:57:06.38403
287	42	218	2017-11-23 18:57:06.388493	2017-11-23 18:57:06.388493
288	42	219	2017-11-23 18:57:06.392797	2017-11-23 18:57:06.392797
289	42	220	2017-11-23 18:57:06.397349	2017-11-23 18:57:06.397349
290	43	221	2017-11-23 18:57:17.381329	2017-11-23 18:57:17.381329
291	43	222	2017-11-23 18:57:17.385547	2017-11-23 18:57:17.385547
292	43	223	2017-11-23 18:57:17.389622	2017-11-23 18:57:17.389622
293	43	224	2017-11-23 18:57:17.393755	2017-11-23 18:57:17.393755
294	43	225	2017-11-23 18:57:17.397884	2017-11-23 18:57:17.397884
295	44	226	2017-11-23 18:57:28.385339	2017-11-23 18:57:28.385339
296	44	227	2017-11-23 18:57:28.390852	2017-11-23 18:57:28.390852
297	44	228	2017-11-23 18:57:28.394785	2017-11-23 18:57:28.394785
298	44	229	2017-11-23 18:57:28.398616	2017-11-23 18:57:28.398616
299	44	230	2017-11-23 18:57:28.402455	2017-11-23 18:57:28.402455
300	45	231	2017-11-23 18:57:39.407935	2017-11-23 18:57:39.407935
301	45	232	2017-11-23 18:57:39.412377	2017-11-23 18:57:39.412377
302	45	233	2017-11-23 18:57:39.416968	2017-11-23 18:57:39.416968
303	45	234	2017-11-23 18:57:39.422104	2017-11-23 18:57:39.422104
304	45	235	2017-11-23 18:57:39.426743	2017-11-23 18:57:39.426743
305	45	236	2017-11-23 18:57:39.431458	2017-11-23 18:57:39.431458
306	45	237	2017-11-23 18:57:39.435874	2017-11-23 18:57:39.435874
307	45	238	2017-11-23 18:57:39.442117	2017-11-23 18:57:39.442117
308	45	239	2017-11-23 18:57:39.447731	2017-11-23 18:57:39.447731
309	45	240	2017-11-23 18:57:39.453415	2017-11-23 18:57:39.453415
310	45	241	2017-11-23 18:57:39.45918	2017-11-23 18:57:39.45918
311	45	242	2017-11-23 18:57:39.46459	2017-11-23 18:57:39.46459
312	45	243	2017-11-23 18:57:39.470319	2017-11-23 18:57:39.470319
313	45	244	2017-11-23 18:57:39.476188	2017-11-23 18:57:39.476188
314	45	245	2017-11-23 18:57:39.486186	2017-11-23 18:57:39.486186
315	45	246	2017-11-23 18:57:39.49275	2017-11-23 18:57:39.49275
316	45	247	2017-11-23 18:57:39.498424	2017-11-23 18:57:39.498424
317	46	248	2017-11-23 18:58:10.473363	2017-11-23 18:58:10.473363
318	46	249	2017-11-23 18:58:10.479417	2017-11-23 18:58:10.479417
319	46	250	2017-11-23 18:58:10.485125	2017-11-23 18:58:10.485125
320	46	251	2017-11-23 18:58:10.490386	2017-11-23 18:58:10.490386
321	46	252	2017-11-23 18:58:10.495361	2017-11-23 18:58:10.495361
322	46	253	2017-11-23 18:58:10.501109	2017-11-23 18:58:10.501109
323	46	254	2017-11-23 18:58:10.506917	2017-11-23 18:58:10.506917
324	46	255	2017-11-23 18:58:10.512719	2017-11-23 18:58:10.512719
325	46	256	2017-11-23 18:58:10.518091	2017-11-23 18:58:10.518091
326	46	257	2017-11-23 18:58:10.52346	2017-11-23 18:58:10.52346
327	46	258	2017-11-23 18:58:10.529029	2017-11-23 18:58:10.529029
328	46	259	2017-11-23 18:58:10.53428	2017-11-23 18:58:10.53428
329	46	260	2017-11-23 18:58:10.539858	2017-11-23 18:58:10.539858
330	46	261	2017-11-23 18:58:10.545851	2017-11-23 18:58:10.545851
331	46	262	2017-11-23 18:58:10.55143	2017-11-23 18:58:10.55143
332	46	263	2017-11-23 18:58:10.557837	2017-11-23 18:58:10.557837
333	46	264	2017-11-23 18:58:10.564854	2017-11-23 18:58:10.564854
334	46	265	2017-11-23 18:58:10.571035	2017-11-23 18:58:10.571035
335	46	266	2017-11-23 18:58:10.577235	2017-11-23 18:58:10.577235
336	46	267	2017-11-23 18:58:10.582855	2017-11-23 18:58:10.582855
337	46	268	2017-11-23 18:58:10.588087	2017-11-23 18:58:10.588087
338	46	269	2017-11-23 18:58:10.593872	2017-11-23 18:58:10.593872
339	46	270	2017-11-23 18:58:10.599184	2017-11-23 18:58:10.599184
340	46	271	2017-11-23 18:58:10.604763	2017-11-23 18:58:10.604763
341	46	272	2017-11-23 18:58:10.610747	2017-11-23 18:58:10.610747
342	46	273	2017-11-23 18:58:10.615528	2017-11-23 18:58:10.615528
343	47	274	2017-11-23 18:58:22.363594	2017-11-23 18:58:22.363594
344	48	275	2017-11-23 18:58:33.37564	2017-11-23 18:58:33.37564
345	48	276	2017-11-23 18:58:33.380167	2017-11-23 18:58:33.380167
346	48	277	2017-11-23 18:58:33.384391	2017-11-23 18:58:33.384391
347	48	278	2017-11-23 18:58:33.388939	2017-11-23 18:58:33.388939
348	48	279	2017-11-23 18:58:33.393812	2017-11-23 18:58:33.393812
349	49	280	2017-11-23 18:58:44.434752	2017-11-23 18:58:44.434752
350	49	281	2017-11-23 18:58:44.44174	2017-11-23 18:58:44.44174
351	49	282	2017-11-23 18:58:44.447921	2017-11-23 18:58:44.447921
352	49	283	2017-11-23 18:58:44.453067	2017-11-23 18:58:44.453067
353	49	284	2017-11-23 18:58:44.458765	2017-11-23 18:58:44.458765
354	49	285	2017-11-23 18:58:44.463937	2017-11-23 18:58:44.463937
355	49	286	2017-11-23 18:58:44.469031	2017-11-23 18:58:44.469031
356	49	287	2017-11-23 18:58:44.474253	2017-11-23 18:58:44.474253
357	49	288	2017-11-23 18:58:44.480557	2017-11-23 18:58:44.480557
358	49	289	2017-11-23 18:58:44.487315	2017-11-23 18:58:44.487315
359	49	290	2017-11-23 18:58:44.49455	2017-11-23 18:58:44.49455
360	49	291	2017-11-23 18:58:44.501357	2017-11-23 18:58:44.501357
361	49	292	2017-11-23 18:58:44.5076	2017-11-23 18:58:44.5076
362	49	293	2017-11-23 18:58:44.513849	2017-11-23 18:58:44.513849
363	49	294	2017-11-23 18:58:44.519755	2017-11-23 18:58:44.519755
364	49	295	2017-11-23 18:58:44.526225	2017-11-23 18:58:44.526225
365	49	296	2017-11-23 18:58:44.531889	2017-11-23 18:58:44.531889
366	50	297	2017-11-23 18:58:56.375933	2017-11-23 18:58:56.375933
367	50	298	2017-11-23 18:58:56.380473	2017-11-23 18:58:56.380473
368	50	299	2017-11-23 18:58:56.384708	2017-11-23 18:58:56.384708
369	50	300	2017-11-23 18:58:56.389687	2017-11-23 18:58:56.389687
370	50	301	2017-11-23 18:58:56.394608	2017-11-23 18:58:56.394608
371	50	302	2017-11-23 18:58:56.401423	2017-11-23 18:58:56.401423
372	50	303	2017-11-23 18:58:56.408213	2017-11-23 18:58:56.408213
373	50	304	2017-11-23 18:58:56.414753	2017-11-23 18:58:56.414753
374	51	305	2017-11-23 18:59:27.41908	2017-11-23 18:59:27.41908
375	51	306	2017-11-23 18:59:27.425565	2017-11-23 18:59:27.425565
376	51	307	2017-11-23 18:59:27.429571	2017-11-23 18:59:27.429571
377	51	308	2017-11-23 18:59:27.433548	2017-11-23 18:59:27.433548
378	51	309	2017-11-23 18:59:27.436807	2017-11-23 18:59:27.436807
379	52	310	2017-11-23 18:59:39.39816	2017-11-23 18:59:39.39816
380	52	311	2017-11-23 18:59:39.404903	2017-11-23 18:59:39.404903
381	52	312	2017-11-23 18:59:39.411663	2017-11-23 18:59:39.411663
382	52	313	2017-11-23 18:59:39.418201	2017-11-23 18:59:39.418201
383	52	314	2017-11-23 18:59:39.423326	2017-11-23 18:59:39.423326
384	52	315	2017-11-23 18:59:39.429013	2017-11-23 18:59:39.429013
385	52	316	2017-11-23 18:59:39.434618	2017-11-23 18:59:39.434618
386	52	317	2017-11-23 18:59:39.439908	2017-11-23 18:59:39.439908
387	52	318	2017-11-23 18:59:39.44596	2017-11-23 18:59:39.44596
388	53	319	2017-11-23 18:59:50.385445	2017-11-23 18:59:50.385445
389	53	320	2017-11-23 18:59:50.389712	2017-11-23 18:59:50.389712
390	53	321	2017-11-23 18:59:50.393928	2017-11-23 18:59:50.393928
391	53	322	2017-11-23 18:59:50.398411	2017-11-23 18:59:50.398411
392	53	323	2017-11-23 18:59:50.403082	2017-11-23 18:59:50.403082
393	53	324	2017-11-23 18:59:50.40792	2017-11-23 18:59:50.40792
394	53	325	2017-11-23 18:59:50.412726	2017-11-23 18:59:50.412726
395	53	326	2017-11-23 18:59:50.417573	2017-11-23 18:59:50.417573
396	53	327	2017-11-23 18:59:50.422317	2017-11-23 18:59:50.422317
397	54	328	2017-11-23 19:00:01.449913	2017-11-23 19:00:01.449913
398	54	329	2017-11-23 19:00:01.45581	2017-11-23 19:00:01.45581
399	54	330	2017-11-23 19:00:01.461626	2017-11-23 19:00:01.461626
400	54	331	2017-11-23 19:00:01.467153	2017-11-23 19:00:01.467153
401	54	332	2017-11-23 19:00:01.472435	2017-11-23 19:00:01.472435
402	54	333	2017-11-23 19:00:01.477673	2017-11-23 19:00:01.477673
403	54	334	2017-11-23 19:00:01.482785	2017-11-23 19:00:01.482785
404	54	335	2017-11-23 19:00:01.488765	2017-11-23 19:00:01.488765
405	54	336	2017-11-23 19:00:01.495434	2017-11-23 19:00:01.495434
406	54	337	2017-11-23 19:00:01.502383	2017-11-23 19:00:01.502383
407	54	338	2017-11-23 19:00:01.509403	2017-11-23 19:00:01.509403
408	54	339	2017-11-23 19:00:01.514939	2017-11-23 19:00:01.514939
409	54	340	2017-11-23 19:00:01.520547	2017-11-23 19:00:01.520547
410	54	341	2017-11-23 19:00:01.525722	2017-11-23 19:00:01.525722
411	54	342	2017-11-23 19:00:01.530787	2017-11-23 19:00:01.530787
412	54	343	2017-11-23 19:00:01.53657	2017-11-23 19:00:01.53657
413	54	344	2017-11-23 19:00:01.542999	2017-11-23 19:00:01.542999
414	54	345	2017-11-23 19:00:01.549384	2017-11-23 19:00:01.549384
415	54	346	2017-11-23 19:00:01.55597	2017-11-23 19:00:01.55597
416	55	347	2017-11-23 19:00:13.424002	2017-11-23 19:00:13.424002
417	55	348	2017-11-23 19:00:13.427609	2017-11-23 19:00:13.427609
418	55	349	2017-11-23 19:00:13.431127	2017-11-23 19:00:13.431127
419	55	350	2017-11-23 19:00:13.434557	2017-11-23 19:00:13.434557
420	55	351	2017-11-23 19:00:13.43836	2017-11-23 19:00:13.43836
421	55	352	2017-11-23 19:00:13.442157	2017-11-23 19:00:13.442157
422	55	353	2017-11-23 19:00:13.445806	2017-11-23 19:00:13.445806
423	55	354	2017-11-23 19:00:13.449408	2017-11-23 19:00:13.449408
424	55	355	2017-11-23 19:00:13.453409	2017-11-23 19:00:13.453409
425	55	356	2017-11-23 19:00:13.45751	2017-11-23 19:00:13.45751
426	55	357	2017-11-23 19:00:13.461579	2017-11-23 19:00:13.461579
427	55	358	2017-11-23 19:00:13.465793	2017-11-23 19:00:13.465793
428	55	359	2017-11-23 19:00:13.470116	2017-11-23 19:00:13.470116
429	55	360	2017-11-23 19:00:13.474461	2017-11-23 19:00:13.474461
430	55	361	2017-11-23 19:00:13.478792	2017-11-23 19:00:13.478792
431	56	362	2017-11-23 19:00:31.41681	2017-11-23 19:00:31.41681
432	56	363	2017-11-23 19:00:31.422291	2017-11-23 19:00:31.422291
433	56	364	2017-11-23 19:00:31.427655	2017-11-23 19:00:31.427655
434	56	365	2017-11-23 19:00:31.432744	2017-11-23 19:00:31.432744
435	56	366	2017-11-23 19:00:31.437578	2017-11-23 19:00:31.437578
436	56	367	2017-11-23 19:00:31.442734	2017-11-23 19:00:31.442734
437	56	368	2017-11-23 19:00:31.448583	2017-11-23 19:00:31.448583
438	57	369	2017-11-23 19:00:42.394034	2017-11-23 19:00:42.394034
439	57	370	2017-11-23 19:00:42.399559	2017-11-23 19:00:42.399559
440	57	371	2017-11-23 19:00:42.40617	2017-11-23 19:00:42.40617
441	57	372	2017-11-23 19:00:42.412155	2017-11-23 19:00:42.412155
442	57	373	2017-11-23 19:00:42.417728	2017-11-23 19:00:42.417728
443	57	374	2017-11-23 19:00:42.423177	2017-11-23 19:00:42.423177
444	57	375	2017-11-23 19:00:42.428596	2017-11-23 19:00:42.428596
445	57	376	2017-11-23 19:00:42.434209	2017-11-23 19:00:42.434209
446	57	377	2017-11-23 19:00:42.439669	2017-11-23 19:00:42.439669
447	57	378	2017-11-23 19:00:42.44474	2017-11-23 19:00:42.44474
448	57	379	2017-11-23 19:00:42.450463	2017-11-23 19:00:42.450463
449	57	380	2017-11-23 19:00:42.456749	2017-11-23 19:00:42.456749
450	58	381	2017-11-23 19:00:53.461621	2017-11-23 19:00:53.461621
451	58	382	2017-11-23 19:00:53.46854	2017-11-23 19:00:53.46854
452	58	383	2017-11-23 19:00:53.474819	2017-11-23 19:00:53.474819
453	58	384	2017-11-23 19:00:53.480479	2017-11-23 19:00:53.480479
454	59	385	2017-11-23 19:01:05.370382	2017-11-23 19:01:05.370382
455	59	386	2017-11-23 19:01:05.37593	2017-11-23 19:01:05.37593
456	60	387	2017-11-23 19:01:16.422014	2017-11-23 19:01:16.422014
457	60	388	2017-11-23 19:01:16.427412	2017-11-23 19:01:16.427412
458	60	389	2017-11-23 19:01:16.432681	2017-11-23 19:01:16.432681
459	60	390	2017-11-23 19:01:16.438733	2017-11-23 19:01:16.438733
460	60	391	2017-11-23 19:01:16.444015	2017-11-23 19:01:16.444015
461	60	392	2017-11-23 19:01:16.449787	2017-11-23 19:01:16.449787
462	60	393	2017-11-23 19:01:16.454502	2017-11-23 19:01:16.454502
463	60	394	2017-11-23 19:01:16.459723	2017-11-23 19:01:16.459723
464	60	395	2017-11-23 19:01:16.464327	2017-11-23 19:01:16.464327
465	60	396	2017-11-23 19:01:16.468706	2017-11-23 19:01:16.468706
466	60	397	2017-11-23 19:01:16.474152	2017-11-23 19:01:16.474152
467	60	398	2017-11-23 19:01:16.47928	2017-11-23 19:01:16.47928
468	60	399	2017-11-23 19:01:16.484313	2017-11-23 19:01:16.484313
469	60	400	2017-11-23 19:01:16.489603	2017-11-23 19:01:16.489603
470	61	401	2017-11-23 19:03:17.43586	2017-11-23 19:03:17.43586
471	61	402	2017-11-23 19:03:17.440322	2017-11-23 19:03:17.440322
472	61	403	2017-11-23 19:03:17.445228	2017-11-23 19:03:17.445228
473	61	404	2017-11-23 19:03:17.449178	2017-11-23 19:03:17.449178
474	61	405	2017-11-23 19:03:17.453125	2017-11-23 19:03:17.453125
475	61	406	2017-11-23 19:03:17.457017	2017-11-23 19:03:17.457017
476	61	407	2017-11-23 19:03:17.461862	2017-11-23 19:03:17.461862
477	61	408	2017-11-23 19:03:17.468544	2017-11-23 19:03:17.468544
478	61	409	2017-11-23 19:03:17.473131	2017-11-23 19:03:17.473131
479	62	410	2017-11-23 19:03:29.388477	2017-11-23 19:03:29.388477
480	62	411	2017-11-23 19:03:29.392614	2017-11-23 19:03:29.392614
481	62	412	2017-11-23 19:03:29.396996	2017-11-23 19:03:29.396996
482	62	413	2017-11-23 19:03:29.401565	2017-11-23 19:03:29.401565
483	62	414	2017-11-23 19:03:29.406238	2017-11-23 19:03:29.406238
484	62	415	2017-11-23 19:03:29.410677	2017-11-23 19:03:29.410677
485	63	416	2017-11-23 19:03:41.365621	2017-11-23 19:03:41.365621
486	63	417	2017-11-23 19:03:41.369936	2017-11-23 19:03:41.369936
487	63	418	2017-11-23 19:03:41.374554	2017-11-23 19:03:41.374554
488	64	419	2017-11-23 19:03:52.367454	2017-11-23 19:03:52.367454
489	64	420	2017-11-23 19:03:52.371797	2017-11-23 19:03:52.371797
490	64	421	2017-11-23 19:03:52.375966	2017-11-23 19:03:52.375966
491	64	422	2017-11-23 19:03:52.380146	2017-11-23 19:03:52.380146
492	65	423	2017-11-23 19:04:04.404028	2017-11-23 19:04:04.404028
493	65	424	2017-11-23 19:04:04.410422	2017-11-23 19:04:04.410422
494	65	425	2017-11-23 19:04:04.416272	2017-11-23 19:04:04.416272
495	65	426	2017-11-23 19:04:04.422246	2017-11-23 19:04:04.422246
496	65	427	2017-11-23 19:04:04.429149	2017-11-23 19:04:04.429149
497	65	428	2017-11-23 19:04:04.437502	2017-11-23 19:04:04.437502
498	65	429	2017-11-23 19:04:04.443986	2017-11-23 19:04:04.443986
499	65	430	2017-11-23 19:04:04.449325	2017-11-23 19:04:04.449325
500	65	431	2017-11-23 19:04:04.454412	2017-11-23 19:04:04.454412
501	65	432	2017-11-23 19:04:04.459806	2017-11-23 19:04:04.459806
502	66	433	2017-11-23 19:05:12.40091	2017-11-23 19:05:12.40091
503	66	434	2017-11-23 19:05:12.4046	2017-11-23 19:05:12.4046
504	66	435	2017-11-23 19:05:12.407924	2017-11-23 19:05:12.407924
505	66	436	2017-11-23 19:05:12.41174	2017-11-23 19:05:12.41174
506	67	437	2017-11-23 19:05:25.390921	2017-11-23 19:05:25.390921
507	67	438	2017-11-23 19:05:25.396741	2017-11-23 19:05:25.396741
508	67	439	2017-11-23 19:05:25.402936	2017-11-23 19:05:25.402936
509	67	440	2017-11-23 19:05:25.408668	2017-11-23 19:05:25.408668
510	67	441	2017-11-23 19:05:25.414295	2017-11-23 19:05:25.414295
511	67	442	2017-11-23 19:05:25.41969	2017-11-23 19:05:25.41969
512	67	443	2017-11-23 19:05:25.424801	2017-11-23 19:05:25.424801
513	67	444	2017-11-23 19:05:25.430163	2017-11-23 19:05:25.430163
514	67	445	2017-11-23 19:05:25.435448	2017-11-23 19:05:25.435448
515	68	446	2017-11-23 19:05:37.364791	2017-11-23 19:05:37.364791
516	68	447	2017-11-23 19:05:37.369254	2017-11-23 19:05:37.369254
517	68	448	2017-11-23 19:05:37.374204	2017-11-23 19:05:37.374204
518	68	449	2017-11-23 19:05:37.378799	2017-11-23 19:05:37.378799
519	69	450	2017-11-23 19:05:49.395699	2017-11-23 19:05:49.395699
520	69	451	2017-11-23 19:05:49.400911	2017-11-23 19:05:49.400911
521	69	452	2017-11-23 19:05:49.405853	2017-11-23 19:05:49.405853
522	69	453	2017-11-23 19:05:49.411216	2017-11-23 19:05:49.411216
523	69	454	2017-11-23 19:05:49.416044	2017-11-23 19:05:49.416044
524	69	455	2017-11-23 19:05:49.421028	2017-11-23 19:05:49.421028
525	69	456	2017-11-23 19:05:49.425672	2017-11-23 19:05:49.425672
526	69	457	2017-11-23 19:05:49.431493	2017-11-23 19:05:49.431493
527	69	458	2017-11-23 19:05:49.437821	2017-11-23 19:05:49.437821
528	70	459	2017-11-23 19:06:01.376971	2017-11-23 19:06:01.376971
529	70	460	2017-11-23 19:06:01.385239	2017-11-23 19:06:01.385239
530	70	461	2017-11-23 19:06:01.391843	2017-11-23 19:06:01.391843
531	70	462	2017-11-23 19:06:01.395535	2017-11-23 19:06:01.395535
532	70	463	2017-11-23 19:06:01.399503	2017-11-23 19:06:01.399503
533	70	464	2017-11-23 19:06:01.403351	2017-11-23 19:06:01.403351
534	70	465	2017-11-23 19:06:01.407418	2017-11-23 19:06:01.407418
535	71	466	2017-11-23 19:16:21.440099	2017-11-23 19:16:21.440099
536	71	467	2017-11-23 19:16:21.44774	2017-11-23 19:16:21.44774
537	71	468	2017-11-23 19:16:21.454571	2017-11-23 19:16:21.454571
538	71	469	2017-11-23 19:16:21.460121	2017-11-23 19:16:21.460121
539	71	470	2017-11-23 19:16:21.465428	2017-11-23 19:16:21.465428
540	71	471	2017-11-23 19:16:21.471128	2017-11-23 19:16:21.471128
541	72	472	2017-11-23 19:16:33.403936	2017-11-23 19:16:33.403936
542	72	473	2017-11-23 19:16:33.409331	2017-11-23 19:16:33.409331
543	72	474	2017-11-23 19:16:33.415258	2017-11-23 19:16:33.415258
544	72	475	2017-11-23 19:16:33.42359	2017-11-23 19:16:33.42359
545	72	476	2017-11-23 19:16:33.432267	2017-11-23 19:16:33.432267
546	72	477	2017-11-23 19:16:33.439352	2017-11-23 19:16:33.439352
547	72	478	2017-11-23 19:16:33.44522	2017-11-23 19:16:33.44522
548	72	479	2017-11-23 19:16:33.450105	2017-11-23 19:16:33.450105
549	72	480	2017-11-23 19:16:33.455593	2017-11-23 19:16:33.455593
550	73	481	2017-11-23 19:16:45.378821	2017-11-23 19:16:45.378821
551	73	482	2017-11-23 19:16:45.384067	2017-11-23 19:16:45.384067
552	74	483	2017-11-23 19:22:15.427127	2017-11-23 19:22:15.427127
553	74	484	2017-11-23 19:22:15.431964	2017-11-23 19:22:15.431964
554	74	485	2017-11-23 19:22:15.436582	2017-11-23 19:22:15.436582
555	74	486	2017-11-23 19:22:15.440852	2017-11-23 19:22:15.440852
556	74	487	2017-11-23 19:22:15.445337	2017-11-23 19:22:15.445337
557	75	488	2017-11-23 19:22:25.389424	2017-11-23 19:22:25.389424
558	75	489	2017-11-23 19:22:25.395579	2017-11-23 19:22:25.395579
559	75	490	2017-11-23 19:22:25.400661	2017-11-23 19:22:25.400661
560	75	491	2017-11-23 19:22:25.405686	2017-11-23 19:22:25.405686
561	75	492	2017-11-23 19:22:25.411019	2017-11-23 19:22:25.411019
562	76	493	2017-11-23 19:22:36.3947	2017-11-23 19:22:36.3947
563	76	494	2017-11-23 19:22:36.398558	2017-11-23 19:22:36.398558
564	76	495	2017-11-23 19:22:36.402711	2017-11-23 19:22:36.402711
565	76	496	2017-11-23 19:22:36.407995	2017-11-23 19:22:36.407995
566	76	497	2017-11-23 19:22:36.412595	2017-11-23 19:22:36.412595
567	77	498	2017-11-23 19:22:47.382381	2017-11-23 19:22:47.382381
568	77	499	2017-11-23 19:22:47.389055	2017-11-23 19:22:47.389055
569	77	500	2017-11-23 19:22:47.395364	2017-11-23 19:22:47.395364
570	77	501	2017-11-23 19:22:47.400921	2017-11-23 19:22:47.400921
571	78	502	2017-11-23 19:22:58.414916	2017-11-23 19:22:58.414916
572	78	503	2017-11-23 19:22:58.418745	2017-11-23 19:22:58.418745
573	78	504	2017-11-23 19:22:58.422431	2017-11-23 19:22:58.422431
574	78	505	2017-11-23 19:22:58.426051	2017-11-23 19:22:58.426051
575	78	506	2017-11-23 19:22:58.429837	2017-11-23 19:22:58.429837
576	78	507	2017-11-23 19:22:58.433628	2017-11-23 19:22:58.433628
577	78	508	2017-11-23 19:22:58.437525	2017-11-23 19:22:58.437525
578	78	509	2017-11-23 19:22:58.442057	2017-11-23 19:22:58.442057
579	78	510	2017-11-23 19:22:58.44825	2017-11-23 19:22:58.44825
580	78	511	2017-11-23 19:22:58.45226	2017-11-23 19:22:58.45226
581	78	512	2017-11-23 19:22:58.456119	2017-11-23 19:22:58.456119
582	79	513	2017-11-23 19:25:15.582649	2017-11-23 19:25:15.582649
583	79	514	2017-11-23 19:25:15.588201	2017-11-23 19:25:15.588201
584	79	515	2017-11-23 19:25:15.612159	2017-11-23 19:25:15.612159
585	79	516	2017-11-23 19:25:15.616351	2017-11-23 19:25:15.616351
586	79	517	2017-11-23 19:25:15.619976	2017-11-23 19:25:15.619976
587	79	518	2017-11-23 19:25:15.624219	2017-11-23 19:25:15.624219
588	79	519	2017-11-23 19:25:15.628545	2017-11-23 19:25:15.628545
589	79	520	2017-11-23 19:25:15.632993	2017-11-23 19:25:15.632993
590	79	521	2017-11-23 19:25:15.637073	2017-11-23 19:25:15.637073
591	79	522	2017-11-23 19:25:15.641032	2017-11-23 19:25:15.641032
592	79	523	2017-11-23 19:25:15.644868	2017-11-23 19:25:15.644868
593	79	524	2017-11-23 19:25:15.649077	2017-11-23 19:25:15.649077
594	79	525	2017-11-23 19:25:15.653182	2017-11-23 19:25:15.653182
595	80	526	2017-11-23 19:25:27.377435	2017-11-23 19:25:27.377435
596	80	527	2017-11-23 19:25:27.381928	2017-11-23 19:25:27.381928
597	80	528	2017-11-23 19:25:27.386891	2017-11-23 19:25:27.386891
598	80	529	2017-11-23 19:25:27.393143	2017-11-23 19:25:27.393143
599	80	530	2017-11-23 19:25:27.398838	2017-11-23 19:25:27.398838
600	80	531	2017-11-23 19:25:27.403644	2017-11-23 19:25:27.403644
601	81	532	2017-11-23 19:25:38.388893	2017-11-23 19:25:38.388893
602	81	533	2017-11-23 19:25:38.392964	2017-11-23 19:25:38.392964
603	81	534	2017-11-23 19:25:38.397083	2017-11-23 19:25:38.397083
604	81	535	2017-11-23 19:25:38.402737	2017-11-23 19:25:38.402737
605	81	536	2017-11-23 19:25:38.407787	2017-11-23 19:25:38.407787
606	82	537	2017-11-23 19:25:49.394091	2017-11-23 19:25:49.394091
607	82	538	2017-11-23 19:25:49.398045	2017-11-23 19:25:49.398045
608	82	539	2017-11-23 19:25:49.402378	2017-11-23 19:25:49.402378
609	82	540	2017-11-23 19:25:49.408412	2017-11-23 19:25:49.408412
610	83	541	2017-11-23 19:26:00.518078	2017-11-23 19:26:00.518078
611	83	542	2017-11-23 19:26:00.523983	2017-11-23 19:26:00.523983
612	83	543	2017-11-23 19:26:00.529468	2017-11-23 19:26:00.529468
613	83	544	2017-11-23 19:26:00.534869	2017-11-23 19:26:00.534869
614	83	545	2017-11-23 19:26:00.540601	2017-11-23 19:26:00.540601
615	83	546	2017-11-23 19:26:00.545893	2017-11-23 19:26:00.545893
616	83	547	2017-11-23 19:26:00.551772	2017-11-23 19:26:00.551772
617	83	548	2017-11-23 19:26:00.556015	2017-11-23 19:26:00.556015
618	83	549	2017-11-23 19:26:00.560171	2017-11-23 19:26:00.560171
619	83	550	2017-11-23 19:26:00.56416	2017-11-23 19:26:00.56416
620	83	551	2017-11-23 19:26:00.568062	2017-11-23 19:26:00.568062
621	84	552	2017-11-23 19:29:13.476049	2017-11-23 19:29:13.476049
622	84	553	2017-11-23 19:29:13.481342	2017-11-23 19:29:13.481342
623	84	554	2017-11-23 19:29:13.508192	2017-11-23 19:29:13.508192
624	84	555	2017-11-23 19:29:13.514322	2017-11-23 19:29:13.514322
625	84	556	2017-11-23 19:29:13.520138	2017-11-23 19:29:13.520138
626	84	557	2017-11-23 19:29:13.525742	2017-11-23 19:29:13.525742
627	84	558	2017-11-23 19:29:13.531848	2017-11-23 19:29:13.531848
628	84	559	2017-11-23 19:29:13.537411	2017-11-23 19:29:13.537411
629	84	560	2017-11-23 19:29:13.542887	2017-11-23 19:29:13.542887
630	84	561	2017-11-23 19:29:13.548047	2017-11-23 19:29:13.548047
631	85	562	2017-11-23 19:29:25.391335	2017-11-23 19:29:25.391335
632	85	563	2017-11-23 19:29:25.395708	2017-11-23 19:29:25.395708
633	85	564	2017-11-23 19:29:25.400065	2017-11-23 19:29:25.400065
634	85	565	2017-11-23 19:29:25.404032	2017-11-23 19:29:25.404032
635	85	566	2017-11-23 19:29:25.407867	2017-11-23 19:29:25.407867
636	85	567	2017-11-23 19:29:25.411973	2017-11-23 19:29:25.411973
637	86	568	2017-11-23 19:29:35.518952	2017-11-23 19:29:35.518952
638	86	569	2017-11-23 19:29:35.524843	2017-11-23 19:29:35.524843
639	86	570	2017-11-23 19:29:35.531057	2017-11-23 19:29:35.531057
640	86	571	2017-11-23 19:29:35.536343	2017-11-23 19:29:35.536343
641	86	572	2017-11-23 19:29:35.542142	2017-11-23 19:29:35.542142
642	86	573	2017-11-23 19:29:35.54722	2017-11-23 19:29:35.54722
643	86	574	2017-11-23 19:29:35.552541	2017-11-23 19:29:35.552541
644	86	575	2017-11-23 19:29:35.5572	2017-11-23 19:29:35.5572
645	86	576	2017-11-23 19:29:35.561357	2017-11-23 19:29:35.561357
646	86	577	2017-11-23 19:29:35.565482	2017-11-23 19:29:35.565482
647	86	578	2017-11-23 19:29:35.570138	2017-11-23 19:29:35.570138
648	86	579	2017-11-23 19:29:35.575179	2017-11-23 19:29:35.575179
649	86	580	2017-11-23 19:29:35.580138	2017-11-23 19:29:35.580138
650	86	581	2017-11-23 19:29:35.584554	2017-11-23 19:29:35.584554
651	86	582	2017-11-23 19:29:35.58924	2017-11-23 19:29:35.58924
652	86	583	2017-11-23 19:29:35.59471	2017-11-23 19:29:35.59471
653	86	584	2017-11-23 19:29:35.599046	2017-11-23 19:29:35.599046
654	86	585	2017-11-23 19:29:35.60435	2017-11-23 19:29:35.60435
655	86	586	2017-11-23 19:29:35.609808	2017-11-23 19:29:35.609808
656	86	587	2017-11-23 19:29:35.616191	2017-11-23 19:29:35.616191
657	86	588	2017-11-23 19:29:35.622035	2017-11-23 19:29:35.622035
658	86	589	2017-11-23 19:29:35.627118	2017-11-23 19:29:35.627118
659	86	590	2017-11-23 19:29:35.631339	2017-11-23 19:29:35.631339
660	86	591	2017-11-23 19:29:35.635765	2017-11-23 19:29:35.635765
661	86	592	2017-11-23 19:29:35.639818	2017-11-23 19:29:35.639818
662	86	593	2017-11-23 19:29:35.643642	2017-11-23 19:29:35.643642
663	86	594	2017-11-23 19:29:35.647892	2017-11-23 19:29:35.647892
664	86	595	2017-11-23 19:29:35.651976	2017-11-23 19:29:35.651976
665	86	596	2017-11-23 19:29:35.655826	2017-11-23 19:29:35.655826
666	86	597	2017-11-23 19:29:35.659748	2017-11-23 19:29:35.659748
667	86	598	2017-11-23 19:29:35.663753	2017-11-23 19:29:35.663753
668	86	599	2017-11-23 19:29:35.667803	2017-11-23 19:29:35.667803
669	87	600	2017-11-23 19:29:47.407791	2017-11-23 19:29:47.407791
670	87	601	2017-11-23 19:29:47.414465	2017-11-23 19:29:47.414465
671	87	602	2017-11-23 19:29:47.420529	2017-11-23 19:29:47.420529
672	87	603	2017-11-23 19:29:47.426346	2017-11-23 19:29:47.426346
673	87	604	2017-11-23 19:29:47.43221	2017-11-23 19:29:47.43221
674	87	605	2017-11-23 19:29:47.439986	2017-11-23 19:29:47.439986
675	87	606	2017-11-23 19:29:47.446827	2017-11-23 19:29:47.446827
676	88	607	2017-11-23 19:29:58.434647	2017-11-23 19:29:58.434647
677	88	608	2017-11-23 19:29:58.439018	2017-11-23 19:29:58.439018
678	88	609	2017-11-23 19:29:58.443354	2017-11-23 19:29:58.443354
679	88	610	2017-11-23 19:29:58.447489	2017-11-23 19:29:58.447489
680	88	611	2017-11-23 19:29:58.451825	2017-11-23 19:29:58.451825
681	88	612	2017-11-23 19:29:58.456128	2017-11-23 19:29:58.456128
682	88	613	2017-11-23 19:29:58.46061	2017-11-23 19:29:58.46061
683	88	614	2017-11-23 19:29:58.465495	2017-11-23 19:29:58.465495
684	88	615	2017-11-23 19:29:58.470051	2017-11-23 19:29:58.470051
685	88	616	2017-11-23 19:29:58.474591	2017-11-23 19:29:58.474591
686	88	617	2017-11-23 19:29:58.47888	2017-11-23 19:29:58.47888
687	88	618	2017-11-23 19:29:58.48368	2017-11-23 19:29:58.48368
688	88	619	2017-11-23 19:29:58.487753	2017-11-23 19:29:58.487753
689	88	620	2017-11-23 19:29:58.49188	2017-11-23 19:29:58.49188
690	88	621	2017-11-23 19:29:58.496086	2017-11-23 19:29:58.496086
691	88	622	2017-11-23 19:29:58.5004	2017-11-23 19:29:58.5004
692	88	623	2017-11-23 19:29:58.504098	2017-11-23 19:29:58.504098
693	89	624	2017-11-23 19:33:02.50023	2017-11-23 19:33:02.50023
694	89	625	2017-11-23 19:33:02.5045	2017-11-23 19:33:02.5045
695	89	626	2017-11-23 19:33:02.50794	2017-11-23 19:33:02.50794
696	89	627	2017-11-23 19:33:02.512029	2017-11-23 19:33:02.512029
697	89	628	2017-11-23 19:33:02.517146	2017-11-23 19:33:02.517146
698	89	629	2017-11-23 19:33:02.521122	2017-11-23 19:33:02.521122
699	89	630	2017-11-23 19:33:02.526179	2017-11-23 19:33:02.526179
700	89	631	2017-11-23 19:33:02.531556	2017-11-23 19:33:02.531556
701	89	632	2017-11-23 19:33:02.537008	2017-11-23 19:33:02.537008
702	89	633	2017-11-23 19:33:02.542889	2017-11-23 19:33:02.542889
703	89	634	2017-11-23 19:33:02.547973	2017-11-23 19:33:02.547973
704	89	635	2017-11-23 19:33:02.552737	2017-11-23 19:33:02.552737
705	89	636	2017-11-23 19:33:02.557797	2017-11-23 19:33:02.557797
706	89	637	2017-11-23 19:33:02.564802	2017-11-23 19:33:02.564802
707	89	638	2017-11-23 19:33:02.570393	2017-11-23 19:33:02.570393
708	89	639	2017-11-23 19:33:02.574826	2017-11-23 19:33:02.574826
709	89	640	2017-11-23 19:33:02.579629	2017-11-23 19:33:02.579629
710	89	641	2017-11-23 19:33:02.584193	2017-11-23 19:33:02.584193
711	89	642	2017-11-23 19:33:02.588594	2017-11-23 19:33:02.588594
712	89	643	2017-11-23 19:33:02.593011	2017-11-23 19:33:02.593011
713	90	644	2017-11-23 19:33:14.385236	2017-11-23 19:33:14.385236
714	90	645	2017-11-23 19:33:14.389434	2017-11-23 19:33:14.389434
715	90	646	2017-11-23 19:33:14.393731	2017-11-23 19:33:14.393731
716	90	647	2017-11-23 19:33:14.397886	2017-11-23 19:33:14.397886
717	90	648	2017-11-23 19:33:14.401975	2017-11-23 19:33:14.401975
718	90	649	2017-11-23 19:33:14.405943	2017-11-23 19:33:14.405943
719	91	650	2017-11-23 19:33:25.395922	2017-11-23 19:33:25.395922
720	91	651	2017-11-23 19:33:25.402628	2017-11-23 19:33:25.402628
721	91	652	2017-11-23 19:33:25.409276	2017-11-23 19:33:25.409276
722	91	653	2017-11-23 19:33:25.414461	2017-11-23 19:33:25.414461
723	92	654	2017-11-23 19:33:37.386864	2017-11-23 19:33:37.386864
724	92	655	2017-11-23 19:33:37.391633	2017-11-23 19:33:37.391633
725	93	656	2017-11-23 19:33:48.381682	2017-11-23 19:33:48.381682
726	93	657	2017-11-23 19:33:48.387477	2017-11-23 19:33:48.387477
727	94	658	2017-11-23 19:40:46.65217	2017-11-23 19:40:46.65217
728	94	659	2017-11-23 19:40:46.656036	2017-11-23 19:40:46.656036
729	94	660	2017-11-23 19:40:46.659563	2017-11-23 19:40:46.659563
730	94	661	2017-11-23 19:40:46.662982	2017-11-23 19:40:46.662982
731	94	662	2017-11-23 19:40:46.66643	2017-11-23 19:40:46.66643
732	94	663	2017-11-23 19:40:46.669721	2017-11-23 19:40:46.669721
733	94	664	2017-11-23 19:40:46.673069	2017-11-23 19:40:46.673069
734	94	665	2017-11-23 19:40:46.676471	2017-11-23 19:40:46.676471
735	94	666	2017-11-23 19:40:46.679821	2017-11-23 19:40:46.679821
736	94	667	2017-11-23 19:40:46.683008	2017-11-23 19:40:46.683008
737	94	668	2017-11-23 19:40:46.686295	2017-11-23 19:40:46.686295
738	94	669	2017-11-23 19:40:46.689513	2017-11-23 19:40:46.689513
739	94	670	2017-11-23 19:40:46.693415	2017-11-23 19:40:46.693415
740	94	671	2017-11-23 19:40:46.69735	2017-11-23 19:40:46.69735
741	94	672	2017-11-23 19:40:46.702125	2017-11-23 19:40:46.702125
742	94	673	2017-11-23 19:40:46.706138	2017-11-23 19:40:46.706138
743	94	674	2017-11-23 19:40:46.709865	2017-11-23 19:40:46.709865
744	94	675	2017-11-23 19:40:46.713476	2017-11-23 19:40:46.713476
745	94	676	2017-11-23 19:40:46.716972	2017-11-23 19:40:46.716972
746	94	677	2017-11-23 19:40:46.720511	2017-11-23 19:40:46.720511
747	94	678	2017-11-23 19:40:46.725275	2017-11-23 19:40:46.725275
748	94	679	2017-11-23 19:40:46.730064	2017-11-23 19:40:46.730064
749	94	680	2017-11-23 19:40:46.73494	2017-11-23 19:40:46.73494
750	94	681	2017-11-23 19:40:46.740866	2017-11-23 19:40:46.740866
751	94	682	2017-11-23 19:40:46.747114	2017-11-23 19:40:46.747114
752	94	683	2017-11-23 19:40:46.753625	2017-11-23 19:40:46.753625
753	94	684	2017-11-23 19:40:46.760149	2017-11-23 19:40:46.760149
754	94	685	2017-11-23 19:40:46.76687	2017-11-23 19:40:46.76687
755	94	686	2017-11-23 19:40:46.77237	2017-11-23 19:40:46.77237
756	94	687	2017-11-23 19:40:46.778047	2017-11-23 19:40:46.778047
757	94	688	2017-11-23 19:40:46.784217	2017-11-23 19:40:46.784217
758	94	689	2017-11-23 19:40:46.789925	2017-11-23 19:40:46.789925
759	94	690	2017-11-23 19:40:46.798297	2017-11-23 19:40:46.798297
760	94	691	2017-11-23 19:40:46.803717	2017-11-23 19:40:46.803717
761	94	692	2017-11-23 19:40:46.810508	2017-11-23 19:40:46.810508
762	94	693	2017-11-23 19:40:46.816075	2017-11-23 19:40:46.816075
763	94	694	2017-11-23 19:40:46.821127	2017-11-23 19:40:46.821127
764	94	695	2017-11-23 19:40:46.826305	2017-11-23 19:40:46.826305
765	94	696	2017-11-23 19:40:46.832049	2017-11-23 19:40:46.832049
766	94	697	2017-11-23 19:40:46.838204	2017-11-23 19:40:46.838204
767	94	698	2017-11-23 19:40:46.843947	2017-11-23 19:40:46.843947
768	94	699	2017-11-23 19:40:46.849487	2017-11-23 19:40:46.849487
769	94	700	2017-11-23 19:40:46.854694	2017-11-23 19:40:46.854694
770	94	701	2017-11-23 19:40:46.860439	2017-11-23 19:40:46.860439
771	94	702	2017-11-23 19:40:46.866172	2017-11-23 19:40:46.866172
772	94	703	2017-11-23 19:40:46.871686	2017-11-23 19:40:46.871686
773	94	704	2017-11-23 19:40:46.876874	2017-11-23 19:40:46.876874
774	94	705	2017-11-23 19:40:46.882292	2017-11-23 19:40:46.882292
775	94	706	2017-11-23 19:40:46.887778	2017-11-23 19:40:46.887778
776	94	707	2017-11-23 19:40:46.893424	2017-11-23 19:40:46.893424
777	94	708	2017-11-23 19:40:46.899711	2017-11-23 19:40:46.899711
778	94	709	2017-11-23 19:40:46.906449	2017-11-23 19:40:46.906449
779	94	710	2017-11-23 19:40:46.910976	2017-11-23 19:40:46.910976
780	94	711	2017-11-23 19:40:46.915361	2017-11-23 19:40:46.915361
781	94	712	2017-11-23 19:40:46.919958	2017-11-23 19:40:46.919958
782	94	713	2017-11-23 19:40:46.924492	2017-11-23 19:40:46.924492
783	94	714	2017-11-23 19:40:46.929033	2017-11-23 19:40:46.929033
784	94	715	2017-11-23 19:40:46.933525	2017-11-23 19:40:46.933525
785	94	716	2017-11-23 19:40:46.937882	2017-11-23 19:40:46.937882
786	94	717	2017-11-23 19:40:46.942327	2017-11-23 19:40:46.942327
787	94	718	2017-11-23 19:40:46.946764	2017-11-23 19:40:46.946764
788	94	719	2017-11-23 19:40:46.951588	2017-11-23 19:40:46.951588
789	94	720	2017-11-23 19:40:46.956257	2017-11-23 19:40:46.956257
790	94	721	2017-11-23 19:40:46.9619	2017-11-23 19:40:46.9619
791	94	722	2017-11-23 19:40:46.966569	2017-11-23 19:40:46.966569
792	94	723	2017-11-23 19:40:46.970772	2017-11-23 19:40:46.970772
793	94	724	2017-11-23 19:40:46.975457	2017-11-23 19:40:46.975457
794	94	725	2017-11-23 19:40:46.979818	2017-11-23 19:40:46.979818
795	95	726	2017-11-23 19:40:58.431373	2017-11-23 19:40:58.431373
796	95	727	2017-11-23 19:40:58.437096	2017-11-23 19:40:58.437096
797	95	728	2017-11-23 19:40:58.442453	2017-11-23 19:40:58.442453
798	95	729	2017-11-23 19:40:58.449428	2017-11-23 19:40:58.449428
799	95	730	2017-11-23 19:40:58.45476	2017-11-23 19:40:58.45476
800	95	731	2017-11-23 19:40:58.460122	2017-11-23 19:40:58.460122
801	95	732	2017-11-23 19:40:58.465854	2017-11-23 19:40:58.465854
802	95	733	2017-11-23 19:40:58.471407	2017-11-23 19:40:58.471407
803	95	734	2017-11-23 19:40:58.475955	2017-11-23 19:40:58.475955
804	95	735	2017-11-23 19:40:58.479919	2017-11-23 19:40:58.479919
805	95	736	2017-11-23 19:40:58.483736	2017-11-23 19:40:58.483736
806	95	737	2017-11-23 19:40:58.487639	2017-11-23 19:40:58.487639
807	96	738	2017-11-23 19:41:08.489014	2017-11-23 19:41:08.489014
808	96	739	2017-11-23 19:41:08.494863	2017-11-23 19:41:08.494863
809	96	740	2017-11-23 19:41:08.500483	2017-11-23 19:41:08.500483
810	96	741	2017-11-23 19:41:08.506345	2017-11-23 19:41:08.506345
811	96	742	2017-11-23 19:41:08.511697	2017-11-23 19:41:08.511697
812	96	743	2017-11-23 19:41:08.516882	2017-11-23 19:41:08.516882
813	96	744	2017-11-23 19:41:08.521934	2017-11-23 19:41:08.521934
814	96	745	2017-11-23 19:41:08.527306	2017-11-23 19:41:08.527306
815	96	746	2017-11-23 19:41:08.532881	2017-11-23 19:41:08.532881
816	96	747	2017-11-23 19:41:08.538641	2017-11-23 19:41:08.538641
817	96	748	2017-11-23 19:41:08.544168	2017-11-23 19:41:08.544168
818	96	749	2017-11-23 19:41:08.55023	2017-11-23 19:41:08.55023
819	96	750	2017-11-23 19:41:08.556003	2017-11-23 19:41:08.556003
820	96	751	2017-11-23 19:41:08.561509	2017-11-23 19:41:08.561509
821	96	752	2017-11-23 19:41:08.566872	2017-11-23 19:41:08.566872
822	96	753	2017-11-23 19:41:08.571877	2017-11-23 19:41:08.571877
823	96	754	2017-11-23 19:41:08.576952	2017-11-23 19:41:08.576952
824	96	755	2017-11-23 19:41:08.582602	2017-11-23 19:41:08.582602
825	96	756	2017-11-23 19:41:08.588973	2017-11-23 19:41:08.588973
826	96	757	2017-11-23 19:41:08.594198	2017-11-23 19:41:08.594198
827	96	758	2017-11-23 19:41:08.599313	2017-11-23 19:41:08.599313
828	96	759	2017-11-23 19:41:08.604827	2017-11-23 19:41:08.604827
829	96	760	2017-11-23 19:41:08.61134	2017-11-23 19:41:08.61134
830	96	761	2017-11-23 19:41:08.618062	2017-11-23 19:41:08.618062
831	96	762	2017-11-23 19:41:08.622179	2017-11-23 19:41:08.622179
832	96	763	2017-11-23 19:41:08.627657	2017-11-23 19:41:08.627657
833	96	764	2017-11-23 19:41:08.632739	2017-11-23 19:41:08.632739
834	96	765	2017-11-23 19:41:08.63767	2017-11-23 19:41:08.63767
835	96	766	2017-11-23 19:41:08.641624	2017-11-23 19:41:08.641624
836	97	767	2017-11-23 19:41:20.436419	2017-11-23 19:41:20.436419
837	97	768	2017-11-23 19:41:20.443448	2017-11-23 19:41:20.443448
838	97	769	2017-11-23 19:41:20.450836	2017-11-23 19:41:20.450836
839	97	770	2017-11-23 19:41:20.456914	2017-11-23 19:41:20.456914
840	97	771	2017-11-23 19:41:20.462545	2017-11-23 19:41:20.462545
841	97	772	2017-11-23 19:41:20.467826	2017-11-23 19:41:20.467826
842	97	773	2017-11-23 19:41:20.473241	2017-11-23 19:41:20.473241
843	97	774	2017-11-23 19:41:20.478981	2017-11-23 19:41:20.478981
844	97	775	2017-11-23 19:41:20.484366	2017-11-23 19:41:20.484366
845	97	776	2017-11-23 19:41:20.488987	2017-11-23 19:41:20.488987
846	97	777	2017-11-23 19:41:20.494018	2017-11-23 19:41:20.494018
847	97	778	2017-11-23 19:41:20.498475	2017-11-23 19:41:20.498475
848	98	779	2017-11-23 19:41:32.441709	2017-11-23 19:41:32.441709
849	98	780	2017-11-23 19:41:32.448259	2017-11-23 19:41:32.448259
850	98	781	2017-11-23 19:41:32.453956	2017-11-23 19:41:32.453956
851	98	782	2017-11-23 19:41:32.459695	2017-11-23 19:41:32.459695
852	98	783	2017-11-23 19:41:32.465421	2017-11-23 19:41:32.465421
853	98	784	2017-11-23 19:41:32.471306	2017-11-23 19:41:32.471306
854	98	785	2017-11-23 19:41:32.477248	2017-11-23 19:41:32.477248
855	98	786	2017-11-23 19:41:32.483474	2017-11-23 19:41:32.483474
856	98	787	2017-11-23 19:41:32.489212	2017-11-23 19:41:32.489212
857	98	788	2017-11-23 19:41:32.494549	2017-11-23 19:41:32.494549
858	98	789	2017-11-23 19:41:32.499705	2017-11-23 19:41:32.499705
859	98	790	2017-11-23 19:41:32.505201	2017-11-23 19:41:32.505201
860	98	791	2017-11-23 19:41:32.510611	2017-11-23 19:41:32.510611
861	98	792	2017-11-23 19:41:32.516227	2017-11-23 19:41:32.516227
862	98	793	2017-11-23 19:41:32.522296	2017-11-23 19:41:32.522296
863	99	794	2017-11-23 19:44:11.457935	2017-11-23 19:44:11.457935
864	99	795	2017-11-23 19:44:11.465463	2017-11-23 19:44:11.465463
865	99	796	2017-11-23 19:44:11.492415	2017-11-23 19:44:11.492415
866	99	797	2017-11-23 19:44:11.49747	2017-11-23 19:44:11.49747
867	99	798	2017-11-23 19:44:11.501706	2017-11-23 19:44:11.501706
868	100	799	2017-11-23 19:44:22.422022	2017-11-23 19:44:22.422022
869	100	800	2017-11-23 19:44:22.427587	2017-11-23 19:44:22.427587
870	100	801	2017-11-23 19:44:22.432475	2017-11-23 19:44:22.432475
871	100	802	2017-11-23 19:44:22.437489	2017-11-23 19:44:22.437489
872	100	803	2017-11-23 19:44:22.442845	2017-11-23 19:44:22.442845
873	100	804	2017-11-23 19:44:22.44835	2017-11-23 19:44:22.44835
874	100	805	2017-11-23 19:44:22.453402	2017-11-23 19:44:22.453402
875	100	806	2017-11-23 19:44:22.458433	2017-11-23 19:44:22.458433
876	100	807	2017-11-23 19:44:22.463838	2017-11-23 19:44:22.463838
877	100	808	2017-11-23 19:44:22.469961	2017-11-23 19:44:22.469961
878	100	809	2017-11-23 19:44:22.475573	2017-11-23 19:44:22.475573
879	100	810	2017-11-23 19:44:22.480593	2017-11-23 19:44:22.480593
880	100	811	2017-11-23 19:44:22.48576	2017-11-23 19:44:22.48576
881	100	812	2017-11-23 19:44:22.491268	2017-11-23 19:44:22.491268
882	101	813	2017-11-23 19:44:34.399631	2017-11-23 19:44:34.399631
883	101	814	2017-11-23 19:44:34.404854	2017-11-23 19:44:34.404854
884	101	815	2017-11-23 19:44:34.410094	2017-11-23 19:44:34.410094
885	101	816	2017-11-23 19:44:34.415856	2017-11-23 19:44:34.415856
886	101	817	2017-11-23 19:44:34.422766	2017-11-23 19:44:34.422766
887	101	818	2017-11-23 19:44:34.42855	2017-11-23 19:44:34.42855
888	102	819	2017-11-23 19:44:45.400204	2017-11-23 19:44:45.400204
889	102	820	2017-11-23 19:44:45.405944	2017-11-23 19:44:45.405944
890	102	821	2017-11-23 19:44:45.411794	2017-11-23 19:44:45.411794
891	102	822	2017-11-23 19:44:45.417469	2017-11-23 19:44:45.417469
892	103	823	2017-11-23 19:44:56.375098	2017-11-23 19:44:56.375098
893	103	824	2017-11-23 19:44:56.379015	2017-11-23 19:44:56.379015
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bandmembers_id_seq', 893, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
31	Earth, Wind & Fire	Soul funk band\r\n\r\nFounded in Chicago, Illinois, in 1970 by [a=Maurice White].\r\nThey have sold over 90 million units worldwide.\r\nInducted into Rock And Roll Hall of Fame in 2000 (Performer).\r\n	2017-11-23 18:54:14.346667	2017-11-23 18:54:14.346667	14
32	Fourplay (3)	Jazz supergroup consisting of bassist [a215920], drummer [a64652], guitarist [a258119] and keyboardist [a48397]. [a37735] was in the original line-up, but was replaced by Larry Carlton.	2017-11-23 18:54:26.333443	2017-11-23 18:54:26.333443	14
33	Incognito	London group. The line up of Incognito is constantly changing. Here's a list of artists who have collaborated with the group:\r\n\r\n[b]Lead vocals[/b]: Christopher Ballin, Chyna, Imaani, Dianna Joseph, Jocelyn Brown, Joy Malcolm, Karen Bernod, Kelli Sae, Linda Muriel, Mark Anthoni, Maysa Leak, Pamela Anderson, Xavier Barnett, Ed Motta, Joy Rose, Tony Momrelle\r\n[b]Background vocals[/b]: Barry Stewart, Bernita Turner, Charlise Rockwood, Claudia Fontaine, Elizabeth Gray, Elizabeth Troy, Lennox Cameron, Ogadinma Umelo, Paul Lewis, Ray Simpson, Sarah Brown, Sophia Jones, Valerie Etienne, Veronique DeMargary, Xavier Barnett, Luaraine McIntosh, Paige Lackey, Gail Evans\r\n[b]Guitars[/b]: Jean-Paul 'Bluey' Maunick, Paul Weller, Tony Remy \r\n[b]Bass[/b]: Alpheus Little, Julian Crampton, Paul 'Tubbs' Williams, Randy Hope-Taylor, Ski Oakenfull, Andy Kremer, Alex Malheiros, Gavin W Pearce, Mark Edwards, Francis Hylton\r\n[b]Keyboards[/b]: Gary Sanctuary, Graham Harvey, Jim Watson, Michael Gorman, Peter Hinds, Ski Oakenfull, Paul Weller, Mark Edwards, Matt Cooper, Jamie Norton, Simon Grey, John Deley\r\n[b]Drums[/b]: Andy Gangadeen, Gavin Harrison, Matthew Stuart, Richard Bailey, Ski Oakenfull, Ian Thomas\r\n[b]Percussion[/b]: Chris Joris, Daniel Sadownick, Karl Vandenbossche, Louis Jardin, Maxton 'Gig' Beesley Jr., Snowboy, Thomas Dyani-Akuru, Martin Verdonk\r\n[b]Trumpet[/b]: Alexander Pope Norris, Anthony Kadleck, Basilo Marquez, Dominic Glover, Donald Downs, Duncan McKay, Gerard Presencer, Greg Gisbert, Julio Enrique Padron, Kevin Robinson, Tim Hagans, Sidney Gauld, Kenny Wellington\r\n[b]Sax[/b]: Adrian Ravell, Bud Beadle, Chris DeMargary, Denys Babtiste, Ed Jones, Irving Acao, Jason Yarde, Patrick Clahar, Ray Carless, Roman Filiu, Ronnie Cuber, Snake Davies, Tim Ries, Andrew Ross\r\n[b]Flutes[/b]: Ken Hitchcock, Ed Xiques, Rowland Sutherland\r\n[b]Trombone[/b]: Adrian Fry, Avi Lebo Leibovich, Charles Gordon, Fayyaz Virji, Jimmy Bosch, Mark Nightingale, Matt Coleman, Michael Davies, Richard Edwards, Winston Rollins, Nichol Thomson, Trevor Mires\r\n[b]Programming[/b]: Alex Rizzo, Daniel 'Venom' Maunick, Ray Hayden, Richard Bull, Simon Cotsworth, Tyrrell\r\n[b]Strings[/b]: Aaron Stowlow, Alexander Vselensky, Barry Finclair, Diane Monroe, Ellen Blair, Elliot Rosoff, Ivan Hussey, Jean Ingraham, Kurt Briggs, Kurt Coble, Marion Pinheiro, Marshall Coid, Ming Yeh, Myra Segal, Paul Woodiel, Rebekah Johnson, Rudy Perrault, Sandra Billingslea, Sanford Allen, Sara Loewenthal, Sheila Reinhold, Stanley Hunte, Stephen Hussey, Winterton Garvey, Xin Zhao, Yolisa Phale, Yuri Vodovoz.\r\n\r\nIn January 1981, Blues And Soul magazine announced the "first ever live appearance of Incognito" due to be made on 29 January 1981 at Flicks, Dartford.  \r\n	2017-11-23 18:54:37.331433	2017-11-23 18:54:37.331433	14
34	Yellowjackets	US Jazz-Rock & Fusion Outfit Active Since 1981.\r\n	2017-11-23 18:54:49.336097	2017-11-23 18:54:49.336097	14
35	Pieces Of A Dream	Founded in 1975 by James K. Lloyd (keyboards), Cedric Napoleon (bass) and Curtis Harmon (drums), they performed all over Philadelphia as 'Classic Touch', 'A Touch of Class', and 'Galaxy'. The group changed their name to 'Pieces Of A Dream' in 1979, a nod to “Pieces of Dreams,” a Stanley Turrentine tune that the group performed. They were discovered by Grover Washington, Jr. whilst performing as the house band on TV show "City Lights". Grover went on to produce their first three albums Pieces of a Dream, We Are One and Imagine This. Soon after completing Joyride, their last effort for Elektra, they moved to EMI/Blue Note and went on to record seven more albums. During this period, the group amicably parted ways with long time friend Cedric Napoleon. Signed with Heads Up International in 2001 and have so far released four albums: Acquainted with the Night, Love's Silhouette, No Assembly Required and Pillow Talk.\r\nPersonnel currently consist of Lloyd, Harmon, Eddie Baccus Jr.(saxophone), Todd Parsnow (guitar) and Tracy Hamlin (vocals).\r\nWere (and still are) managed by the drummer’s father and uncle, Danny and Bill Harmon, respectively.\r\n	2017-11-23 18:55:00.344401	2017-11-23 18:55:00.344401	14
36	Metallica	Thrash Metal (Heavy Metal) band from Los Angeles, California (USA).\r\n\r\nMetallica formed in 1981 by vocalist/guitarist James Hetfield and drummer Lars Ulrich.  The duo first met through an ad in a Los Angeles-based music newspaper.  At the time, Ulrich had little musical experience and no band but managed to secure a slot on an upcoming compilation record called “Metal Massacre”.   Metallica’s contribution, “Hit The Lights”, featured Hetfield, Ulrich and lead guitarist Lloyd Grant.  Afterwards, Ron McGovney became the band's bassist and Dave Mustaine joined the band as lead guitarist.  This line-up would re-record "Hit The Lights" for subsequent re-pressings of "Metal Massacre" and would also issue several demos.  In 1983, McGovney quit the group and was replaced by Cliff Burton, which also saw the band relocate to San Francisco.  Metallica then traveled to New York after signing a deal with [l=Megaforce Records].  However, once in New York, the band fired Mustaine.  It would mark the beginning of a long feud between Mustaine and Metallica, mostly fueled by remarks Mustaine would make to the press.  Mustaine was replaced by Kirk Hammett of [a=Exodus (6)].\r\n\r\nMetallica's debut LP, "Kill 'Em All", was released in 1983.  It was followed in 1984 by "Ride The Lightning".  This led to a major label deal with [l=Elektra].  In 1986, the band released "Master Of Puppets", which is considered by many to be one of the greatest heavy metal records of all time.  In September of that year, while on tour in Sweden, the band was involved in a bus accident which took the life of Cliff Burton.  Eventually, Jason Newsted (of [a=Flotsam And Jetsam]) was hired as the band's new bassist and he made his debut on 1987's "Garage Days Re-Revisited", an EP of cover tunes.  \r\n\r\nIn 1990, Metallica hooked up with producer [a=Bob Rock] for a self-titled release that would become better known as "The Black Album", due to its cover art. Released in 1991, the black album would become one of the best-selling rock albums of all time, selling over 16 million copies in the US alone.\r\n\r\nIn 1996, the band experimented with Rock music style Alternative Rock, this could be heard on the album "Load".  The following year, "Reload" appeared which had the similiar formula as ''Load''. The albums continued the band’s trend of more accessible music.  In 1999, the group released an album and accompanying film called "S&M", which featured Metallica performing their songs with the San Francisco Symphony Orchestra.\r\n\r\nIn 2001, as the band was preparing to begin work on a new album, Newsted quit the group, citing personal and musical reasons.  Work on the new album was further complicated when Hetfield entered rehab for alcohol abuse.  The album, called "St. Anger", was eventually completed in 2003 with producer Bob Rock handling the bass.  Upon its release, "St. Anger" drew mostly negative reviews.  Following the recording, Robert Trujillo, formerly of [a=Suicidal Tendencies], was hired as bassist.  The making of the album was captured in the documentary “Some Kind Of Monster”.\r\n\r\nIn 2008, "Death Magnetic", produced by [a=Rick Rubin], would surface and was hailed by many as Metallica's return to thrash metal.  The following year, Metallica was inducted into Rock And Roll Hall of Fame.  Former bassist Jason Newsted was present and Cliff Burton's father appeared on Cliff's behalf.  Dave Mustaine, who was not inducted, was invited to the ceremony by the band but declined to attend.  In 2011, Metallica collaborated with [a=Lou Reed] on the album, “Lulu”, which was largely panned by critics and ignored by consumers.    \r\n	2017-11-23 18:55:29.336713	2017-11-23 18:55:29.336713	8
37	Iron Maiden	Founded in Leyton in London's East End in 1975, Iron Maiden released their first album in 1980 as a five-piece with [a=Paul Di'Anno] on vocals. [a=Bruce Dickinson] would replace him in 1981. With several line-up changes [a=Steve Harris] would remain the only original member never to have had a hiatus. \r\n\r\nWhen [a=Bruce Dickinson] quit in 1994 and was replaced by [a=Wolfsbane]'s [a=Blaze Bayley], the band lost a lot of their fanbase. They recorded two albums with Blaze before [a=Bruce Dickinson] and [a=Adrian Smith (2)] returned to the fold for 2000's "Brave New World", and 2003's "Dance of Death", making them a six-piece. As of 1999 the line-up hasn't changed\r\n\r\nBand Members:\r\n\r\n[b]Vocals[/b]\r\n[a=Paul Mario Day] (1975-1976)\r\nDennis Wilcock (1976-1977)\r\n[a=Paul Di'Anno] (1978-1981)\r\n[a=Blaze Bayley] (1994-1998)\r\n[a=Bruce Dickinson] (1981-1993 and 1999-present)\r\n\r\n[b]Drums[/b]\r\nBarry "[a=Thunderstick]" Purkis (1977)\r\n[a=Doug Sampson] (1977-1979)\r\n[a=Clive Burr] (1980-1982)\r\n[a=Nicko McBrain] (1982-present)\r\n\r\n[b]Guitar[/b]\r\n[a=Dave Murray (2)] (1976-present)\r\n[a=Dennis Stratton] (1979-1980)\r\n[a=Adrian Smith (2)] (1980-1990 and 1999-present)\r\n[a=Janick Gers] (1990-present)\r\n\r\n[b]Bass[/b]\r\n[a=Steve Harris] (1975-present)\r\n\r\n[b]Keyboards[/b] \r\n[a=Michael Kenney] (1986-present) (Live performances only, not a full member)	2017-11-23 18:55:40.413903	2017-11-23 18:55:40.413903	8
38	Black Sabbath	Considered by many to be the first heavy metal band, Black Sabbath was formed in 1968 by [a=Tony Iommi], [a=Ozzy Osbourne], [a=Geezer Butler] and [a=Bill Ward].  The band's original name was the Polka Tulk Blues Band (later shortened to Polka Tulk) and later Earth before becoming Black Sabbath.  The original line-up lasted until 1979, after which Osbourne was fired and replaced by [a=Ronnie James Dio]. The line-up changes would continue, with no line-up remaining intact for consecutive studio releases. Throughout the changes, only Tony Iommi and keyboardist [a=Geoff Nicholls], who also joined the band in 1979, would remain with Black Sabbath, although Nicholls would not always be credited as a full member. In 1997, Iommi, Butler, Ward, and Osbourne reunited, touring and releasing a live album in 1998, although a long-rumored studio release did not appear (the group attempted to record a new album in 2001 with producer [a=Rick Rubin] but the sessions were scrapped). After that, the group periodically reunited to tour with Ozzy's "Ozzfest" tour. In 2004, longtime keyboardist Geoff Nicholls was replaced by [a=Adam Wakeman] for an Ozzfest tour. No reason was given for the replacement. In 2006, the original line-up was inducted into the Rock 'n' Roll Hall Of Fame. \r\n\r\nIn 2007, Tony Iommi, Geezer Butler, Ronnie James Dio, and drummer [a=Vinny Appice] (who were featured on 1981's "Mob Rules" and 1992's "Dehumanizer") announced that they would tour together as [a=Heaven & Hell (2)] (with Iommi, who owns the Black Sabbath name, deciding to keep the Black Sabbath name solely for the original line-up in light of their Rock 'n' Roll HOF induction) to support a Dio-era greatest hits release, which also featured 3 new Dio/Iommi compositions. A brand new live album was released under the Heaven & Hell name that same year, followed by a studio album in 2009. \r\n\r\nIn 2009, Osbourne sued Iommi over control of the Black Sabbath name.  The lawsuit was settled the following year.  In late 2011, it was announced that the original line-up would be recording and touring.  Shortly, afterward, Bill Ward dropped out, stating he had been given a contract that was "unsignable".  The three remaining members opted to continue without him.  In 2013, the band released "13", their first studio album with Osbourne in 34 years.  The band played their final live show in Birmingham, UK, on February 4, 2017.  Although the band has announced that full-scale touring is done, Tony Iommi has stated that the door is still open for future music and possible live appearances. \r\n\r\nLine-Ups:\r\nGuitar:\r\nTony Iommi - 1968-2017\r\n\r\nVocals:\r\nOzzy Osbourne - 1968-1977, 1978-1979, 1997-2017\r\nDave Walker - 1977-1978 (rehearsals and a TV appearance only)\r\nRonnie James Dio - 1979-1982, 1991-1992\r\nIan Gillan - 1983-1984\r\nGlenn Hughes - 1985-1986\r\nRay Gillen - 1986-1987 (live only)\r\nTony Martin - 1987-1991, 1993-1996\r\n\r\nBass:\r\nGeezer Butler - 1968-1984, 1991-1994, 1997-2017\r\nCraig Gruber - 1979 (rehearsals only while Butler contemplated leaving the band, the extent of his participation has been disputed)\r\nGordon Copley -1985 (rehearsals and one studio track only)\r\nDave "The Beast" Spitz - 1985-1986, 1987 (live appearances only in 1987)\r\nBob Daisley - 1987 (studio only)\r\nJo Bert - 1987 (live only)\r\nLaurence Cottle - 1988 (studio only)\r\nNeil Murray - 1989-1992, 1995-1996\r\n\r\nDrums:\r\nBill Ward - 1968-1980, 1983 (studio only in 1983), 1994 (live appearances), 1997-2011\r\nVinny Appice - 1981-1982, 1991-1992, 1998 (live only in 1998, filling in for a sick Bill Ward)\r\nBev Bevan - 1983-1984, 1987 (live only)\r\nEric Singer - 1985-1987\r\nTerry Chimes - 1987-1988 (live only)\r\nCozy Powell - 1988-1991, 1994-1995\r\nBobby Rondinelli - 1993-1994, 1995 (live appearances only in 1995)\r\nMike Bordin - 1997 (live only, not a full member)\r\nBrad Wilk - 2013 (studio only, not a full member)\r\nTommy Clufetos - 2012-2017 (live only, not a full member)\r\n\r\nKeyboards:\r\nRick Wakeman - 1973 (studio only, not a full member)\r\nJezz Woodruffe - ?-1977 (not a full member)\r\nDon Airey - 1978 (not a full member)\r\nGeoff Nicholls - 1979-2004\r\nAdam Wakeman - 2004-2017 (live only, not a full member)\r\n	2017-11-23 18:55:52.336447	2017-11-23 18:55:52.336447	8
39	Megadeth	Formed: 1983 in Los Angeles, California. Disbanded: 2002. Reformed: 2004.\r\n\r\nAmerican Thrash Metal band formed by guitarist/vocalist Dave Mustaine and bass guitarist David Ellefson following the formers ejection from [a=Metallica].\r\n\r\nDespite countless line-up changes, Megadeth is partly responsible for the popularization of Thrash Metal in the late 1980s. The band was also notorious for its substance abuse, a contributing factor to their continuous revolving door of band members. The group nonetheless found sobriety and a stable line up with 1990's [r=2017460], a trend which continued until 1998 with the departure of drummer Nick Menza. \r\n\r\nDave Mustaine disbanded Megadeth in 2002 due to a nerve injury he had suffered on his left arm. Following a year of physical therapy Mustaine began work on what was to be his first solo album, however contractual obligations forced [r=379626] to be released under the Megadeth name, following which, Mustaine decided to reform the band.\r\n	2017-11-23 18:56:04.348741	2017-11-23 18:56:04.348741	8
40	Judas Priest	Judas Priest is a pioneering British Heavy Metal band and was a forerunner in the ‘New Wave of British Heavy Metal’ movement, laying the groundwork for the speed and thrash metal of the ’80s and ’90s with numerous classic albums.\r\n\r\nThe band was formed in Birmingham, England in 1969 by guitarist John Perry (who died shortly after and was replaced by Earnest Chataway), bassist Bruno Stapenhill, drummer John Partridge, and singer [a=Alan Atkins], who created a band name from Bob Dylan's song '[i][r=3881740][/i]'. In 1970, guitarist Kenneth [a=K. K. Downing] and bassist [a=Ian Hill (2)] joined, replacing Chataway and Stapenhill. Later, in 1972, [a=Rob Halford] and drummer [a=John Hinch] joined to replace Atkins and Partridge, respectively. A second guitarist, [a=Glenn Tipton], was also added to the line-up in 1974 as compensation for its record company’s (Gull Records) suggestion to add a horn section to the first album, Rocka Rolla.\r\n\r\nThe band featuring Halford, Downing, Tipton and Hill would go on to record 14 albums from 1974 through to 1990. Priest went through a considerable amount of drummers between its formation and 1980 when [a=Trapeze] drummer [a=Dave Holland] joined and stayed until 1988’s Ram It Down. In early 1990 [a=Racer X] drummer [a=Scott Travis] joined the band and recording began on its Painkiller album. In mid 1990 the band was taken to court over the attempted suicide of two young boys in Reno, allegedly driven by subliminal messages on its Stained Class album. The case was eventually thrown out of court and in September 1990, Painkiller was released.\r\n\r\nHalford left the group in 1993 to pursue a solo career but the band was determined to find a suitable replacement vocalist. Tim "Ripper" Owens, an Ohioan tribute band singer was chosen after a lengthy auditioning process and the band recorded 4 albums (2 studio, 2 live) with Owens.\r\n\r\nIn 2003, Judas Priest’s 1990 line-up was restored when Rob Halford returned to the group after rekindling the relationship during work on Judas Priest’s 4-CD career retrospective “Metalogy.” In 2004 the band played Ozzfest and released a CD of new studio material entitled Angel of Retribution and an accompanying live DVD in 2005, enjoying a successful world tour that year. This was followed by the 2CD concept album Nostradamus in 2008 and the release of its fifth live album in 2009.\r\n	2017-11-23 18:56:16.340216	2017-11-23 18:56:16.340216	8
41	Led Zeppelin	Led Zeppelin formed out of the ashes of [url=http://www.discogs.com/artist/262455-Yardbirds-The]The Yardbirds[/url].  [a180585] had joined the band in its final days, playing a pivotal role on the group's final album, 1967's [m=86344], which also featured string arrangements from [a60149].  During 1967, the Yardbirds were fairly inactive.  Whilst the band members decided the group's future, Page returned to session work in 1967. In the spring of 1968, he played on Jones' arrangement of [a=Donovan]'s "Hurdy Gurdy Man." During the sessions, Jones requested to be part of any future project Page would develop. Page would have to assemble a band sooner than he had planned. In the summer of 1968, the Yardbirds' [a=Keith Relf] and [a=Jim McCarty] left, leaving Page and bassist [a=Chris Dreja] with the rights to the name, as well as the obligation of fulfilling an upcoming fall tour. Page set out to find a replacement vocalist and drummer. Initially, he wanted to enlist singer Terry Reid and Procol Harum's drummer B.J. Wilson, but neither musician was able to join the group. Reid suggested that Page contact Robert Plant, who was singing with a band called Hobbstweedle.\r\n\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer). \r\n	2017-11-23 18:56:53.339817	2017-11-23 18:56:53.339817	1
42	The Beatles	British rock/pop group, formed in Liverpool, England during the late 1950s. Signed to recording contract with EMI in 1962.\r\n\r\nThe lineup (1962-70) comprised John Lennon (vocals, guitar, harmonica, keyboards), Paul McCartney (vocals, bass, guitar, keyboards, percussion), George Harrison (guitar, vocals, sitar), and Ringo Starr (drums, vocals, percussion). During 1961, Stu Sutcliffe (bass) and Pete Best (drums) were also members.\r\n\r\nFollowing an initial period as a straightforward Mersey-beat group, later recordings saw them experiment with psychedelia, incorporating innovative production techniques involving tape loops and other effects. Although the group split in 1970, they have continued to release special products. \r\n\r\nInducted into Rock And Roll Hall of Fame in 1988 (Group). By 2015, all four members were inducted also as individual solo artists.	2017-11-23 18:57:06.334423	2017-11-23 18:57:06.334423	1
43	Pink Floyd	Pink Floyd was an English rock band from London. Founded in 1965, the group achieved worldwide acclaim, initially with innovative psychedelic music, and later in a genre that came to be termed progressive rock. \r\n\r\nDistinguished by philosophical lyrics, musical experimentation, frequent use of sound effects and elaborate live shows, Pink Floyd remains one of the most commercially successful and influential groups in the history of popular music.\r\n\r\n[a=David Gilmour] - guitar, slide guitar, vocals (1968-2014)\r\n[a=Richard Wright] - keyboards, vocals (1965-1980, 1987-2008)\r\n[a=Nick Mason] - drums, percussion, sound effects (1965-2014)\r\n[a=Roger Waters] - bass guitar, vocals, sound effects (1965-1985)\r\n[a=Syd Barrett] - guitar, vocals (1965-1968)\r\n\r\nOther players:\r\n[a=Rado Klose] - guitar (1965)\r\n[a=Jon Carin] - backing vocals, keyboards, slide guitar, sound effects (1985-1995)\r\n\r\nInducted into Rock And Roll Hall of Fame in 1996 (Performer).	2017-11-23 18:57:17.337197	2017-11-23 18:57:17.337197	1
44	Queen	Queen is a British rock band formed in London in 1970. (John Deacon joined in 1971, but the name Queen was taken in 1970.)\r\nThe band has released a total of 18 number-one albums, 18 number-one singles and 10 number-one DVDs, and have sold over 300 million albums worldwide, making them one of the world's best-selling music artists. They have been honoured with seven Ivor Novello awards and were inducted into the Rock and Roll Hall of Fame in 2001.\r\n\r\nLead singer [a=Freddie Mercury] died in November 1991 of AIDS-related complications. A year after his death, Queen continued, first with a tribute concert for the lead singer to commemorate his life (featuring all three remaining members), and then as various "Queen+" incarnations.\r\n	2017-11-23 18:57:28.343523	2017-11-23 18:57:28.343523	1
45	AC/DC	Hard Rock band from Australia, formed in 1973 by Angus and Malcolm Young, they teamed up with Dave Evans (vocals), Larry Van Kriedt (bass) and Colin Burgess (drums).\r\n\r\nIn 1974 both Larry Van Kriedt and Colin Burgess left and were replaced by Rob Bailey (bass) and Peter Clack (drums), a further change in 1974 saw Peter Clack leave and Tony Currenti (drums) join the band. In June 1974 they were signed by Harry Vanda & George Young (Malcolm & Angus's brother) to Albert Productions. In November 1974, Dave Evans left the band and was replaced by Bon Scott (vocals & bagpipes). Rob Bailey also left in 1974 and was replaced by George Young (bass). In 1975 Phil Rudd (drums) replaced Tony Currenti and Mark Evans (bass) replaced George Young.  In June 1977 Mark Evans left and is replaced by Cliff Williams (bass) for their first tour of the USA. On the 19 Feb 1980 Bon Scott died at the age of 33. Brian Johnson (ex Geordie) joined the band to replace him on vocals and the album "Back In Black" was released, a tribute to Bon Scott, this album became the 2nd largest selling album of all time with over 40 million copies sold worldwide. In May 1983, Phil Rudd had a parting of the ways and was replaced by Simon Wright (drums), aged 20 then. November 1989 Simon Wright left and is replaced by Chris Slade (ex Manfred Mann's Earth Band, Uriah Heep & The Firm). In summer 1994 Phil Rudd "quietly" rejoined the band, but left again in 2015, which led to Slade's return. Malcolm Young left AC/DC in 2014 for health reasons. Brian Johnson was forced to stop touring in April 2016 because of hearing issues. To complete the 2016 tour dates, Axl Rose was recruited as a guest singer. In September 2016 Cliff Williams retired from the group.\r\n\r\nAC/DC are Australia's most successful rock band ever, and are popular around the world. The band was inducted into Rock And Roll Hall Of Fame in 2003 as a performer.\r\n\r\nCurrent line-up:\r\nAxl Rose - Vocals (Live only) (2016 - )\r\nAngus Young - Lead guitar (1973 - )\r\nChris Slade - Drums (1989-1994, 2015 - )\r\nSteve Young - Rhythm guitar (1988, 2014 - )	2017-11-23 18:57:39.335347	2017-11-23 18:57:39.335347	1
46	John Mayall & The Bluesbreakers	Group named after the successful 1966 'Blues Breakers' album by [a=John Mayall] with [a=Eric Clapton].\r\n\r\nThe Bluesbreakers' line-ups, along with the interpolating members of [a=Blues Incorporated], had a profound influence on the early British 'Electric Blues' scene, eventually spilling into the mainstream of progressive fusions and popular 'Rock'.\r\n\r\nEarlier members joined/formed some iconic groups, or gained successful solo careers. Like [a=Eric Clapton] and [a=Jack Bruce], later members of [a=Cream (2)].\r\n[a=Peter Green (2)], [a=John McVie] and [a=Mick Fleetwood], who formed Peter Green's Fleetwood Mac - which later evolved without Green into [a=Fleetwood Mac]. [a=Mick Taylor] later member of [a=Rolling Stones]. [a=Colosseum], [a=Free], [a=Don "Sugarcane" Harris], [a=Harvey Mandel], [a=Larry Taylor], [a=Aynsley Dunbar], [a=Johnny Almond], [a=Jon Mark]... the list could scroll until next week\r\n	2017-11-23 18:58:10.330765	2017-11-23 18:58:10.330765	16
47	Cream (7)	Sleeve design company from Amsterdam, The Netherlands\r\nAlso known as The Cream Group	2017-11-23 18:58:22.332774	2017-11-23 18:58:22.332774	16
48	ZZ Top	ZZ Top is an American rock band formed in 1969 in Houston, Texas. The band consists of guitarist and lead vocalist Billy Gibbons, bassist and co-lead vocalist Dusty Hill, and drummer Frank Beard. The band and its members went through several reconfigurations throughout 1969, achieving their current form when Hill replaced bassist Billy Etheridge in February 1970, shortly before the band was signed to London Records. Etheridge's departure issued primarily from his unwillingness to be bound by a recording contract.\r\n\r\nSince the release of the band's debut album in January 1971, ZZ Top has become known for its strong blues roots and humorous lyrical motifs, relying heavily on double entendres and innuendo. ZZ Top's musical style has changed over the years, beginning with blues-inspired rock on their early albums, then incorporating New Wave, punk rock and dance-rock, with heavy use of synthesizers.\r\n\r\nZZ Top was inducted into the Rock and Roll Hall of Fame in 2004. As a group, ZZ Top possesses 11 gold records and 7 platinum (13 multi-platinum) records; their 1983 album, Eliminator, remains the group's most commercially successful record, selling over 10 million units. ZZ Top also ranks 80th in U.S. album sales, with 25 million units.\r\n\r\n	2017-11-23 18:58:33.333601	2017-11-23 18:58:33.333601	16
49	The Allman Brothers Band	American rock/blues band once based in Macon, Georgia.\r\nYears active:  1969–1976, 1978–1982, 1989–2014.\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer).	2017-11-23 18:58:44.349386	2017-11-23 18:58:44.349386	16
50	The Who	Formed in 1964, Hammersmith, London, United Kingdom \r\nMembers:\r\nPete Townshend (guitar, vocals)\r\nRoger Daltrey (vocals, tambourine, harmonica)\r\nJohn Entwistle (bass, vocals, 1964-2002)\r\nKeith Moon (drums, vocals, 1964-78)\r\nKenney Jones (drums, 1978-88)\r\nJohn "Rabbit" Bundrick (keyboards, 1979-present)\r\nSimon Phillips (drums, 1989)\r\nZak Starkey (drums, 1996-present) \r\n \r\nInducted into Rock And Roll Hall of Fame in 1990 (Performer). \r\n	2017-11-23 18:58:56.333035	2017-11-23 18:58:56.333035	16
51	Green Day	Green Day is a pop punk/alternative rock band from East Bay, California that formed in 1987. They were originally called Sweet Children, but changed their name before their first release.\r\n\r\nCurrent lineup \r\nlead vocals, guitars : [a=Billie Joe Armstrong]\r\nbass guitar, backing vocals : Mike Dirnt ([a=Michael Pritchard])\r\ndrums, percussion : Tré Cool ([a=Frank E. Wright] III)\r\nguitars, backing vocals :Jason White ([a=Jason White (3)])\r\n\r\nFormer member:\r\nDrums: [a=John Kiffmeyer] alias [a=Al Sobrante] until 1990.	2017-11-23 18:59:27.334192	2017-11-23 18:59:27.334192	22
52	Dead Kennedys	Legendary punk band hailing from San Francisco, formed in 1978 & fronted by the even more legendary [a=Jello Biafra] (Eric Boucher). They split up in the mid-80s, and there has been animosity between Jello and the rest of the band since the late '90s, with a recent court case awarding all the rights to all the songs to the rest of the band.	2017-11-23 18:59:39.334545	2017-11-23 18:59:39.334545	22
53	The Clash	Influential British punk group from west and south London, active between 1976 and 1985. Adding catchy sloganistic socio-political lyrics to their brand of garage rock 'n' roll, the band soon explored wider musical horizons than most of their contemporaries, incorporating reggae, dub, rockabilly, hip hop and funk influences into their music and a whole lot more. \r\nThe US saw the 2nd album "Give 'Em Enough Rope" relased before the first to coincide with the band's first transatlantic tour in early 1979 (and like in Japan and in Canada) the 1st LP "The Clash" was soon repackaged with an updated track list and the addition of a free 7" "Groovy Times" / "Gates Of The West" which wasn't released separately. A year later they were receiving worlwide acclaim with their classic double album "London Calling".\r\nInducted into Rock And Roll Hall of Fame in 2003 (Performer), their classic line-up comprised [a=Joe Strummer] (vocals / guitar, b. John Graham Mellor August 21, 1952 Ankara, Turkey d. Dec 22, 2002 Broomfield, Somerset, England), Paul Simonon (bass, b.December 15, 1955), Mick Jones (guitar, b. June 26, 1955) and Nicky "Topper" Headon (drums, b.May 30, 1955).\r\n	2017-11-23 18:59:50.337094	2017-11-23 18:59:50.337094	22
54	Misfits	The Misfits are an American horror-themed punk rock band from Lodi, New Jersey. Formed in early 1977, they took the band name from Marilyn Monroe's last film and in fact, thanked the cast of the movie on the back of their first record. The founding members were: Glenn Danzig on vocals and electric piano, Jerry Caiafa (Jerry Only) on bass, and Manny on drums. Their first release on their own label, Blank Records, didn't reflect the characteristic anger and rebellion of most "punk" records, but instead a more brooding and sinister, yet romantic side lingering beneath.  Following the single, Danzig and Only recruited a new drummer and added a guitar player and pursued the horror-based punk rock direction that they are known for.  Danzig and Only presided over several line up changes, eventually culminating with Jerry's younger brother, Paul (aka Doyle) becoming the band's permanent guitarist.\r\n\r\nThe original Misfits broke up in October 1983, having released several 7" singles and 12" records, all of which were DIY limited-edition and most of which were hand-assembled by the band, that have long been considered prime collectors' items.  The bulk of the band's material was released on Glenn's Plan 9 label.  The band's popularity grew exponentially following their split and their material and tapes of their live shows were heavily bootlegged.\r\n\r\nFollowing the Misfits' dissolution, Danzig formed a new band called Samhain while Jerry Only and Doyle, heavily in debt to their father over band expenses, stepped away from music to work full time jobs at their father's company.  Between 1986 and 1988, Glenn continued to issue unreleased and out of print Misfits material.  Some of the songs on these collections featured guitar and bass tracks re-recorded by Glenn while others were all new recordings of old songs performed by Glenn and his Samhain bandmate Eerie Von.  These collections were released by Plan 9 records.  Jerry Only eventually contacted Danzig about royalties from these releases which resulted in a lawsuit between the two.  In 1995, an out of court settlement was reached that gave Only the rights to the Misfits name while Glenn maintained control of the publishing for the band's old material and the Plan 9 label was terminated. \r\n\r\nJerry Only and Doyle reformed The Misfits in 1995, recruiting Michale Graves on vocals and Dr. Chud on drums. The new incarnation of the Misfits released two full-length albums, "American Psycho" and "Famous Monsters" as well as a collection of rare and unreleased "resurrected" Misfits tracks, until Michale Graves and Dr. Chud left the band on October 25, 2000 at a performance at the House of Blues in Orlando.  Doyle went on "indefinite hiatus" from the band, later stating he was frustrated with decisions that his brother had made regarding the band.  In 2004, Doyle reconnected with Glenn Danzig and has periodically made live appearances with Glenn to perform Misfits tunes.  Meanwhile, Jerry Only took over the vocalist spot in the Misfits while recruiting former Black Flag vocalist Dez Cadena to play guitar and Marky Ramone for the drums.  Ramone eventually left and was replaced by former Misfits and Black Flag drummer Robo, who was later replaced by Eric "Chupacabra" Arce.  In 2001, Only and associate John Cafiero set up Misfits Records to release new material by the band.  After releasing an album of cover tunes in 2003, the Only-fronted line up released it's first album of original tunes in 2011.	2017-11-23 19:00:01.338731	2017-11-23 19:00:01.338731	22
55	Bad Religion	Punk/Rock band formed in 1980 in San Fernando Valley/Los Angeles, CA, US by [a=Greg Graffin] (vocals), [a=Brett Gurewitz] (guitar), [a=Jay Ziskrout] (drums), and [a=Jay Bentley] (bass). All the members were teenagers when the band started. Only Graffin has remained with the band through every phase of its career, although Bentley and Gurewitz have participated for substantial chunks of time. Graffin and Gurewitz are the band's primary songwriters, with other members contributing occasionally. The band is known for their rapid-fire songs with a melodic edge and strong backing harmonies.\r\n\r\nBad Religion released their first record, a self-titled EP, in 1981 on [l=Epitaph] Records, a label Gurewitz started after borrowing money from his father.  The band released their first full length, "How Could Hell Be Any Worse?", in 1982. Midway through the recording for the album, Ziskrout quit the band and the record was finished with drummer Pete Finestone. In 1983, the band abruptly shifted gears, issuing the keyboard-heavy, prog rock influenced "Into The Unknown", on which neither Bentley (who quit during the recording of the first track) nor Finestone appeared. The results were disastrous, with the band facing considerable backlash from fans and Epitaph immediately pulling the album off record store shelves. For his part, Gurewitz blamed his participation on his increasing drug habit, although he was quick to point out that the sober Graffin had no such excuse to fall back on, and has disowned the album. With Epitaph out of money and the band's reputation in tatters, Gurewitz quit and the band split. Graffin soon moved out of state for college, but returned to California in 1984 and was convinced by [a=Circle Jerks] guitarist Greg Hetson to reform Bad Religion with him on guitar. Recruiting Pete Finestone and bassist Tim Gallegos, the band issued a 12" EP, called "Back To The Known", with Gurewitz producing but not playing on the record.\r\n\r\nGraffin and Hetson spent the next few years playing sporadically with various line-ups. Eventually, Finestone and Bentley returned on a full-time basis. In 1987, a newly sober Brett Gurewitz returned to the fold and the band continued as a five-piece. In 1988, Bad Religion issued a new LP, "Suffer", to enthusiastic fans and critics. This lineup released 2 more albums before Finestone departed in 1991. He was replaced by Bobby Schayer. In 1993, immediately following the release of their 7th LP, "Recipe For Hate", the band jumped from Epitaph to [l=Atlantic] Records. Following the release of 1994's "Stranger Than Fiction", Brett Gurewitz left the group. Officially, it was said that his reason for leaving was to concentrate on Epitaph following the huge commercial success of the album "Smash" by [a=The Offspring], and he also expressed displeasure with the band's deal with Atlantic. However, it was later revealed the Gurewitz's primary reason for leaving was due to tension with Bentley (in 1996, Gurewitz released a single with his new band, [a=Daredevils], whose A-side, "Hate You" was written about Bentley). Graffin and Gurewitz also publicly feuded for a short time after the departure. Gurewitz was replaced by Brian Baker (ex-[a=Minor Threat] and [a=Dag Nasty]). The band would record 3 more albums for Atlantic with Graffin as the primary songwriter, although 1998's "No Substance" featured significant contributions from the other members of Bad Religion. However, the albums were met with largely mixed critical and commercial responses. Meanwhile, Gurewitz had relapsed into drug abuse and faced a number of personal and legal problems. In 2000, a cleaned-up and sober Gurewitz made a guest appearance on the band's LP, "The New America", prompting rumors of a reunion. The album was the group's last for Atlantic.\r\n\r\nFollowing the release of "The New America", Bobby Schayer exited the group, as a shoulder injury barred him from playing drums. His replacement was Brooks Wackerman (ex-[a=Suicidal Tendencies]). In 2001, it was announced that not only had Brett Gurewitz rejoined the band, but that they would also be returning to Epitaph Records. It turned out the Brett's role would be mostly limited to songwriting and production, as his work with Epitaph makes extended touring impractical, although he would make appearances with the band when they performed in Los Angeles. It was also revealed that since the reunion, Gurewitz rarely actually plays guitar on the albums. Most of the guitar parts are recorded by Brian Baker as he is the most proficient guitarist, although Gurewitz does record parts if he wants to. The band has continued to record and tour steadily since returning to Epitaph.	2017-11-23 19:00:13.345917	2017-11-23 19:00:13.345917	22
56	The Carter Family	American traditional folk music group, formed in 1927. Their music was hugely influential for bluegrass, country, folk, and rock musicians. The original group split up when A.P. Carter and Sara Carter left in 1944, but Maybelle Carter and her daughters continued performing as [a1353326]. In the 1960's, [a1353326] reclaimed the name The Carter Family.\r\n\r\nMembership (as [a307357], 1927-1944, ~1960 to 1996; as [a1353326], 1944-~1960):\r\nA.P. Carter – 1927-1944\r\nMaybelle Carter – 1927-1978\r\nSara Carter – 1927-1944\r\nJanette Carter – 1939-1940\r\nJoe Carter – 1939-1940\r\nHelen Carter – 1939-1940, 1944-1996\r\nJune Carter – 1939-1940, 1944-1969, 1971-1996\r\nAnita Carter – 1939-1940, 1944-1996\r\nRobbie Harden – 1969-1971	2017-11-23 19:00:31.337102	2017-11-23 19:00:31.337102	11
57	Bill Monroe & His Blue Grass Boys		2017-11-23 19:00:42.331576	2017-11-23 19:00:42.331576	11
58	Alabama	Alabama is an American country, Southern rock and bluegrass band formed in Fort Payne, Alabama in 1969.	2017-11-23 19:00:53.419058	2017-11-23 19:00:53.419058	11
59	The Louvin Brothers	Please only use this profile for credits with the word "Brothers", "Bros." etc. Individual credits for Charlie and Ira should be linked to their respective profiles.\r\n\r\nAn American country vocal/harmony duet, consisting of brothers Ira and Charlie Loudermilk. Their professional career began after winning a talent contest by singing "There's a Hole in the Bottom of the Sea." Brief stints on Apollo, Decca, and MGM led to them being signed by Capitol Records. At first their recordings were strictly gospel, but they switched to country with the 1955 release of "When I Stop Dreaming." Their career continued until 1963 when they broke up due to Ira's volatile temper. Charlie began a successful solo career in 1964. Ira was killed in a car wreck in Jefferson City, Missouri on June 20, 1965.  Songs he had recorded for a solo album were released posthumously.\r\n\r\nThe Louvin Brothers were inducted into the Alabama Music Hall of Fame in 1991 and the Country Music Hall of Fame in 2001.\r\n	2017-11-23 19:01:05.3438	2017-11-23 19:01:05.3438	11
60	The Charlie Daniels Band	The Charlie Daniels Band was formed in 1970, with [a=Charlie Daniels] joined by [a=Barry Barnes] (guitar), [a=Mark Fitzgerald] (bass), [a=Fred Edwards] and [a=Gary Allen] (drums), and [a=Taz DiGregorio] (keyboards). They started recording southern rock-styled albums for [l=Kama Sutra]. Although a multi-instrumentalist, Daniels was a limited vocalist, but his voice was well suited to the talking-style "Uneasy Rider", which reached the US Top 10 in 1973. He followed it with his anthem for southern rock, "The South's Gonna Do It". In 1974, Daniels had members of [a=The Marshall Tucker Band] and [a=The Allman Brothers Band] join him onstage in Nashville. It was so successful that he decided to make his so-called Volunteer Jam an annual event. It led to some unlikely combinations of artists such as [a=James Brown] performing with [a=Roy Acuff], and the stylistic mergers have included [a=Crystal Gayle] singing the blues with the Charlie Daniels Band.\r\n\r\nThe Charlie Daniels Band underwent some personnel changes on 1975's Nightrider, with [a=Tom Crain], [a=Charlie Hayward] and [a=Don Murray (3)] replacing Barnes, Fitzgerald and Allen respectively. When Daniels moved to [l=Epic] in 1976, there was a concerted effort to turn the band into a major concert attraction, despite the fact that at 6 feet 4 inches tall and weighing 20 stone Daniels was no teenage idol: he hid his face under an oversized cowboy hat. The albums sold well, and in 1979, when recording his Million Mile Reflections album, he recalled a 20s poem, "The Mountain Whipporwill", by Stephen Vincent Benet. The band developed this into "The Devil Went Down To Georgia", in which Johnny outplays the Devil to win a gold fiddle. Daniels overdubbed his fiddle seven times to create an atmospheric recording that topped the US country charts and reached number 3 in the US pop charts. It was also a UK Top 20 success.\r\n\r\nIn 1980 the band recorded "In America" for the hostages in Iran, and then in 1982, "Still In Saigon" , about Vietnam. The band were featured on the soundtrack for Urban Cowboy and also recorded the theme for the Burt Reynolds movie Stroker Ace. The 13th Volunteer Jam was held in 1987, but financial and time constraints meant the event was put on temporary hiatus (it resumed four years later). In the late 80s Daniels appeared in the movie Lone Star Kid and published a book of short stories, but continued touring and playing his southern boogie to adoring audiences.\r\n\r\nDuring the 90s Daniels updated "The Devil Went Down To Georgia" with [a=Johnny Cash] and continued in his politically incorrect way - in simple language, he advocates both lynching and red-baiting; not a man to stand next to at the bar. He signed a new recording contract with [l=Liberty] in 1993, but also targeted the white gospel market through a deal with [l=Sparrow Records]. The albums The Door and Steel Witness earned Daniels several awards from the Christian recording community. In 1997 Daniels inaugurated his own [l=Blue Hat Records] and also released his first children's album, By The Light Of The Moon: Campfire Songs & Cowboy Tunes, on the Sony Wonder label. Two years later he took his Volunteer Jam event on the road for the first time.\r\n	2017-11-23 19:01:16.345927	2017-11-23 19:01:16.345927	11
61	Wu-Tang Clan	The Wu-Tang Clan is a rap group that formed in Staten Island, New York in 1992. It originally consisted of 9 members: [a=RZA], [a=GZA], [a=Ol' Dirty Bastard], [a=Inspectah Deck], [a=U-God], [a=Raekwon], [a=Ghostface Killah], [a=Method Man], and [a=Masta Killa]. [a=Cappadonna] was later inducted as a 10th member.	2017-11-23 19:03:17.337849	2017-11-23 19:03:17.337849	2
62	N.W.A.	U.S. American group, seminal purveyors of the gangsta rap sub-genre. N.W.A. stands for "Niggaz Wit Attitudes." They were active from 1986 to 1991 and shortly in 1999/2000.\r\n\r\nN.W.A released [m=40320] in 1987 on Macola Records, which was later included on the compilation [m=139509]. The group was still in its developing stages, and only credited on four of the eleven tracks, notably the uncharacteristic electro-hop record "Panic Zone," "8-Ball," and "Dopeman," which marked the first collaboration of [a76220], DJ [a12330],  [a50513], and [a13732]. Hispanic rapper [a663863] co-wrote "Panic Zone," which was originally called "Hispanic Zone," but the title was later changed when Dr. Dre advised Krazy-Dee that the word "hispanic" would hinder sales. Also included was [a76073]'s solo track "Boyz-n-the Hood."\r\n\r\nIn 1988, rapper [a100748] joined N.W.A. and later that year, the group released their debut album [m=26117]. Though not a success at first, "Straight Outta Compton" helped pave the way for the emerging gangsta rap scene in the 1980s, and reached number 37 in the Billboard Top 200 in May 1989, while it reached number 9 on Billboard's Top Soul LPs. The album managed to sell over three million copies without any airplay, and spawned three singles, two of them charting successfully: "Straight Outta Compton," "Gangsta Gangsta" and "Express Yourself".\r\n\r\nIce Cube left in December 1989 over royalty disputes -- having written almost half of the lyrics on "Straight Outta Compton" himself, he felt he was not getting a fair share of the money and profits. He wasted little time putting together his solo debut, 1990's [m=97462], but he avoided mentioning his former label mates. Instead of breaking up, N.W.A. decided to continue without Ice Cube, releasing the EP [m=26111], which went platinum. Their 1991 follow-up album [m=26113] (also referred to as "Niggaz4Life") was the first hip-hop full-length album to reach number one on the Billboard 200. Shortly after the release of "Efil4zaggin," N.W.A. disbanded. All members continued making music since then, with Dr. Dre going solo and Eazy-E running Ruthless Records and releasing more music until he died of AIDS in 1995.	2017-11-23 19:03:29.336818	2017-11-23 19:03:29.336818	2
63	Run-DMC	Run-D.M.C.: \r\n\r\n[a=Joseph Simmons] aka [a=Run]\r\n[a=Darryl McDaniels] aka [a=DMC (2)]\r\n[a=Jason Mizell] aka [a=Jam Master Jay]  R.I.P. (January 21, 1965 – October 30, 2002)\r\n\r\nInducted into the Rock and Roll Hall of Fame in 2009 (Performer). \r\n	2017-11-23 19:03:41.336111	2017-11-23 19:03:41.336111	2
64	A Tribe Called Quest	This US male rap outfit originally comprised [a=Q-Tip] (b. Jonathan Davis ―later changed to Kamaal Ibn John Fareed, in the mid-1990's, on conversion to Islam― 10 April 1970, New York, USA), DJ [a=Ali Shaheed Muhammad] (b. 11 August 1970, Brooklyn, New York City, USA), [a=Jarobi] and [a=Phife Dawg] (b. Malik Taylor, 20 November 1970, Brooklyn, New York City, USA; d. 22 March 2016, USA). They formed at school in Manhattan, New York, where they started out as part of the Native Tongues Posse, with [a=Queen Latifah] and the [a=Jungle Brothers], and were given their name by [a=Afrika Baby Bambaataa] of the Jungle Brothers. \r\n\r\nFollowing their August 1989 debut, "Description Of A Fool", they had a hit with "Bonita Applebum" a year later, which was apparently based on a real person from their school. \r\nTheir biggest success came the following year with the laid-back "Can I Kick It?", typical of their refined jazz/hip-hop cross-match. A UK Top 20 single, it was later used extensively in television advertisements. Q-Tip also appeared on Deee-Lite's August 1990 hit, "Groove Is In The Heart". \r\n\r\nAs members of the Native Tongues Posse they were promoters of the Afrocentricity movement, which set out to make US Africans aware of their heritage, a theme emphasized in the group's music. \r\n\r\nWhile their debut, "People's Instinctive Travels And The Paths Of Rhythm", was more eclectic, and even self-consciously jokey, "The Low-End Theory" (recorded as a trio following the departure of Jarobi) saw them return to their roots with a more bracing, harder funk sound. \r\n\r\nThey were helped considerably by jazz bass player [a=Ron Carter] (who had worked with [a=Miles Davis] and [a=John Coltrane]), whose contribution rather dominated proceedings. Tracks such as "The Infamous Date Rape" stoked controversy, while samples from [a=Lou Reed], [a=Stevie Wonder] and [a=Earth, Wind & Fire] were used in a frugal and intelligent manner. By "Midnight Marauders" there were allusions to the rise of gangsta rap, although they maintained the optimism predominant on their debut. Q-Tip appeared in the 1993 movie "Poetic Justice" opposite [a=Janet Jackson], and helped to produce [a=Tony! Toni! Toné!] (whose Raphael Wiggins made an appearance on "Midnight Marauders"), [a=Nas], [a=Shyheim] and labelmate [a=Shaquille O'Neal]. \r\n\r\nThey were rewarded with the Group Of The Year category at the inaugural Source Magazine Hip Hop Award Show in 1994, before being pulled off the stage by the arrival of 2Pac and his Thug Life crew, attempting to steal some publicity. Two years elapsed before "Beats, Rhymes And Life" debuted at number 1 on the Billboard album chart. Their lyrics on this album were highly evolved, addressing issues with greater philosophy than the crude banter of their past recordings. Q-Tip's conversion to the Islamic faith in the mid-1990's may have had some bearing on this style. \r\n\r\n"The Love Movement", which debuted at US number 3 in October 1998, was another mature, stylish collection of material that lacked the spark of their earlier work.  ATCQ released "We Got It From Here... Thank You 4 Your Service" on November 4, 2016, nearly 18 years after their last album.  In the midst of record verses for the album as well as verses for his solo album, Phife Dawg passed away on March 22, 2016. During its first month of release, the album was greeted with both critical acclaim and fan support.\r\n	2017-11-23 19:03:52.332875	2017-11-23 19:03:52.332875	2
65	Public Enemy	Formed 1986, Long Island (or as PE call it, 'Strong Island'), New York. \r\nMembers: Chuck D (MC, 1986–present); Flavor Flav (MC, 1986–present); Terminator X (DJ, 1986–1998); DJ Lord (DJ,1999–present); Professor Griff ('Minister of Information' and occasional MC, 1986–1990 and 1998–present); Security Of The First World (S1W) (associate non-music group, 1986–present).\r\n\r\nInducted into Rock And Roll Hall of Fame in 2013 (Performer).\r\n	2017-11-23 19:04:04.33051	2017-11-23 19:04:04.33051	2
66	ABBA	[a149038] (born April 5th, 1950): vocals\r\n[a268733] (born April 25th, 1945): guitars, vocals\r\n[a69873] (born December 16th, 1946): keyboards, vocals\r\n[a688940] (born November 15th, 1945): vocals\r\n\r\nInternationally successful Swedish pop group, active from 1972 until 1983. The most commercially successful artists of the 1970s, their biggest hits include Dancing Queen, Fernando, Waterloo, Chiquitita, Mamma Mia, and Take A Chance On Me. Sales figures for the group are widely varying, with the official estimate at 370 million records.\r\n\r\nTheir music has seen a resurgence in interest in part due to the release of their multi-platinum greatest hits album "ABBA Gold" in 1992 and a general revival in interest in disco and '70s music around the same time. Their music gained even greater visibility with the jukebox musical "Mamma Mia!" based on their hits, which opened in 1999 and is still running in venues around the world.\r\n\r\nABBA were inducted into the Rock & Roll Hall of Fame in 2010 in the category of performer.\r\n	2017-11-23 19:05:12.337854	2017-11-23 19:05:12.337854	17
80	Linkin Park	Alternative Rock / Modern Rock band from Agoura Hills, California. Formed in 1996.\r\n\r\nLinkin Park are one of the most popular bands of the so called "nü-metal" movement, along with [a108722], [a18837] and several others. Their sound is a wide range of influences, including metal, alternate rock, hip-hop, electronica and industrial. Linkin Park's debut album "[[m=74519]]" was a multi-platinum smash worldwide, selling over 13 million copies, 8 million of them in the US alone. [m=61489] is the correspondent remix album.\r\n\r\nOriginally named [a1118966], the band changed its name to [a901845]. However, this name caused a legal dispute when [a=Hybrid], a popular House music group, threatened to sue Hybrid Theory if the name was not changed. Searching for a new name, [a241527] was driving along when he saw a street sign for the park named "Lincoln Park" in Los Angeles. Originally, the band members wanted to use the name "Lincoln Park", however they changed it to "Linkin" to acquire the internet domain "linkinpark.com".\r\n\r\nFrontman Chester Bennington committed suicide on July 20, 2017.	2017-11-23 19:25:27.342102	2017-11-23 19:25:27.342102	25
67	Bee Gees	A singing trio of brothers — [a151481], [a179142], and [a290019]. They were born on the Isle Of Man to English parents, lived in Chorlton-cum-Hardy, Manchester, England, UK and during their childhood years moved to Brisbane, Australia, where they began their musical careers. Their worldwide success came when they returned to the UK and signed with producer [a272144]. \r\n\r\nThe multiple award-winning group was successful for most of its forty years of recording music, but it had two distinct periods of exceptional success: as a harmonic 'soft rock' act in the late 1960s and early 1970s, and as the foremost stars of the disco music era in the late 1970s. \r\n\r\nNo matter the style, the Bee Gees sang three-part tight harmonies that were instantly recognizable; as brothers, their voices blended perfectly, in the same way that The Everly Brothers and Beach Boys did. Barry sang lead on many songs, in an R&B falsetto introduced in the disco years; Robin provided the clear vibrato lead that was a hallmark of their pre-disco music; Maurice sang high and low harmonies throughout their career. The three brothers co-wrote most of their hits, and they said that they felt like they became 'one person' when they were writing. \r\n\r\nIn 1994 [a746270] were inducted into the Songwriters Hall of Fame, in 1997 the Band was inducted into Rock And Roll Hall of Fame (Performer).\r\n\r\nThey were all given CBE's (Commander of the Order of the British Empire) in the 2001-2002 New Year's Honours List. The group's name was retired by the remaining brothers after Maurice died in January 2003.\r\n\r\nHowever, as time passed, they decided to perform occasionally under the Bee Gees banner until brother Robin Gibb died in May 2012.\r\n	2017-11-23 19:05:25.332073	2017-11-23 19:05:25.332073	17
68	The Monkees	American pop group. Formed on September 12, 1966. \r\nMembers: Davy Jones (vocals, guitar), Mike Nesmith (vocals, guitar), Peter Tork (vocals, guitar), Micky Dolenz (vocals, drums)\r\nDavy Jones passed away 2012-02-29 due to a heart attack.\r\n	2017-11-23 19:05:37.329964	2017-11-23 19:05:37.329964	17
69	The Beach Boys	Formed 1961, Hawthorne, CA.\r\nInducted into Rock And Roll Hall of Fame in 1988 (Performer).\r\nCurrent Line Up-Mike Love, Al Jardine, Brian Wilson, David Marks	2017-11-23 19:05:49.334638	2017-11-23 19:05:49.334638	17
70	The B-52's	American New Wave / Art Pop band formed in Athens, Georgia, USA in 1976.\r\n\r\nKate Pierson (b. 27 April 1948, Weehawken, New Jersey, USA; organ/vocals)\r\nCindy Wilson (b. 28 February 1957, Athens, Georgia, USA; guitar/vocals)\r\nRicky Wilson (b. 19 March 1953, Athens, Georgia, USA d. 12 October 1985; guitar)\r\nFred Schneider (b. 1 July 1951, Newark, New Jersey, USA; keyboards/vocals)\r\nKeith Strickland (b. 26 October 1953, Athens, Georgia, USA; drums. Later switched to guitar after Ricky Wilson's passing.)\r\n\r\n	2017-11-23 19:06:01.332231	2017-11-23 19:06:01.332231	17
71	Toots & The Maytals	Jamaican musical group and one of the best known ska and reggae vocal groups, formed in the early 1960s.	2017-11-23 19:16:21.343151	2017-11-23 19:16:21.343151	15
72	Steel Pulse	Roots reggae band, formed in 1975 at Handsworth Wood Boys School, in Birmingham, England, by David Hinds (lead vocals, guitar), Basil Gabbidon (lead guitar, vocals), and Ronald McQueen (bass).\r\n	2017-11-23 19:16:33.336396	2017-11-23 19:16:33.336396	15
73	The Wailers Band	This is the name of the band following [a=Bob Marley]'s untimely death in 1981.	2017-11-23 19:16:45.344175	2017-11-23 19:16:45.344175	15
74	Arctic Monkeys	Indie/Rock band formed in 2002 in High Green, a suburb of Sheffield, South Yorkshire, UK.\r\n\r\nMembers: Alex Turner (guitar, vocals) James Cook (guitar), Nick O'Malley (bass), Matt Helders (drums)\r\n\r\nFormer Member: Andy Nicholson (bass)\r\n	2017-11-23 19:22:15.346377	2017-11-23 19:22:15.346377	24
75	The Strokes	The Strokes are an American garage rock, post-punk, indie rock band from New York, founded 1998.	2017-11-23 19:22:25.343348	2017-11-23 19:22:25.343348	24
76	Radiohead	Alternative Rock (Modern Rock) band from Oxfordshire, England (United Kingdom).\r\n\r\nThe name Radiohead comes from the [a=Talking Heads] song, "Radio Head", from the "[url=http://www.discogs.com/Talking-Heads-True-Stories/master/39386]True Stories[/url]" album. \r\n\r\nFormed by school friends in 1986, Radiohead did not release their first single until 1992's "[r=767600]". The cathartic "[url=http://www.discogs.com/Radiohead-Creep/master/21481]Creep[/url]", from the debut album "[url=http://www.discogs.com/Radiohead-Pablo-Honey/master/13344]Pablo Honey[/url]" (1993), became a worldwide hit as grunge music dominated radio airwaves. \r\n\r\nRadiohead were initially branded as a one-hit wonder abroad, but caught on at home in the UK with their second album, "[url=http://www.discogs.com/Radiohead-The-Bends/master/17008]The Bends[/url]" (1995), earning fans with their dense guitar atmospheres and front man [a=Thom Yorke]'s expressive singing. The album featured the hits "[url=http://www.discogs.com/Radiohead-High-Dry-Planet-Telex/release/199387]High & Dry[/url]", "[r=1463625]" and "[url=http://www.discogs.com/Radiohead-Fake-Plastic-Trees/master/21526]Fake Plastic Trees[/url]". \r\n\r\nThe band's third album, "[url=http://www.discogs.com/Radiohead-OK-Computer/master/21491]OK Computer[/url]" (1997), propelled them to greater attention. Popular both for its expansive sound and themes of modern alienation, the album has been acclaimed by critics as a landmark record of the 1990's, some critics go as far to consider it one of the best of all time. "[url=http://www.discogs.com/Radiohead-Kid-A/master/21501]Kid A[/url]" (2000) marked further evolution, containing influences from experimental electronic music.\r\n\r\n"[url=http://www.discogs.com/Radiohead-Hail-To-The-Thief/master/16962]Hail To The Thief[/url]" (2003) was seen as a conventional return to the guitar and piano-led rock sound. After fulfilling their contract with EMI, Radiohead released "[url=http://www.discogs.com/Radiohead-In-Rainbows/master/21520]In Rainbows[/url]" (2007) famously via a pay-what-you-want model. Their latest album,  "[url=https://www.discogs.com/Radiohead-A-Moon-Shaped-Pool/master/998252]A Moon Shaped Pool[/url]", was released in May 2016.\r\n \r\nRadiohead's original influences were cited as alternative rock and post-punk bands like [url=http://www.discogs.com/artist/Smiths,+The]The Smiths[/url], [a=Pixies], [a=Magazine], [a=Joy Division], and [a=R.E.M.] (with lead singer of the band, Thom Yorke, refering to himself as an 'R.E.M. groupie').	2017-11-23 19:22:36.349697	2017-11-23 19:22:36.349697	24
77	The Killers	American rock band that was formed in 2001, by Brandon Flowers (lead vocals, keyboards) and Dave Keuning (guitar, backing vocals). Mark Stoermer (bass, backing vocals) and Ronnie Vannucci Jr. (drums, percussion) would complete the current line-up of the band in 2002. The band originated in Las Vegas, Nevada. The name The Killers is derived from a logo on the bass drum of a fictitious band portrayed in the music video for the [A=New Order] Song [b]Crystal[/b].	2017-11-23 19:22:47.341917	2017-11-23 19:22:47.341917	24
78	Arcade Fire	Indie rock band based in Montreal, Quebec, Canada, formed in 2001.	2017-11-23 19:22:58.358138	2017-11-23 19:22:58.358138	24
79	Nirvana	Alternative Rock (Modern Rock) band from Aberdeen, Washington (USA).\r\n\r\nNirvana formed in 1987. Considered by many to be the leading lights of the Seattle grunge scene of the late 1980s/early 1990s, and perhaps the most influential rock band of Generations X & Y, Nirvana was a powerful trio of musicians who brought a unique aesthetic to a growing-stale rock scene.  They had already made some waves on Sub Pop with their debut, "[m=13773]".  But it wasn't until their major-label debut for [l=DGC]/[l=Geffen Records], 1991's "[m=13814]" - perhaps, more specifically, the first 30 seconds of "[m=22439]" - that they broke into the mainstream of America - not really because they wanted to. Lead singer frontman [a=Kurt Cobain]'s death (suspected suicide) in April 1994 brought an untimely end to the band. Drummer [a=Dave Grohl] went on to form the [a=Foo Fighters].  In the fall of 2004, "[m=42482]" (a 3-CD/DVD set of mostly unreleased material) confirmed that interest in the band is still very high. Most young rock stars today will likely cite Nirvana as a major influence on them. Nirvana disbanded in 1994.\r\n	2017-11-23 19:25:15.455281	2017-11-23 19:25:15.455281	25
97	The Shadows	British (mainly) instrumental pop/rock band, renamed in October 1959 from [a=The Drifters (2)], originally also the backing band for [a=Cliff Richard], fronted by best known member guitarist [a=Hank Marvin].\r\n\r\nWhen appearing with [a125101] please use [b][a1290833][/b].	2017-11-23 19:41:20.352806	2017-11-23 19:41:20.352806	18
81	Radiohead	Alternative Rock (Modern Rock) band from Oxfordshire, England (United Kingdom).\r\n\r\nThe name Radiohead comes from the [a=Talking Heads] song, "Radio Head", from the "[url=http://www.discogs.com/Talking-Heads-True-Stories/master/39386]True Stories[/url]" album. \r\n\r\nFormed by school friends in 1986, Radiohead did not release their first single until 1992's "[r=767600]". The cathartic "[url=http://www.discogs.com/Radiohead-Creep/master/21481]Creep[/url]", from the debut album "[url=http://www.discogs.com/Radiohead-Pablo-Honey/master/13344]Pablo Honey[/url]" (1993), became a worldwide hit as grunge music dominated radio airwaves. \r\n\r\nRadiohead were initially branded as a one-hit wonder abroad, but caught on at home in the UK with their second album, "[url=http://www.discogs.com/Radiohead-The-Bends/master/17008]The Bends[/url]" (1995), earning fans with their dense guitar atmospheres and front man [a=Thom Yorke]'s expressive singing. The album featured the hits "[url=http://www.discogs.com/Radiohead-High-Dry-Planet-Telex/release/199387]High & Dry[/url]", "[r=1463625]" and "[url=http://www.discogs.com/Radiohead-Fake-Plastic-Trees/master/21526]Fake Plastic Trees[/url]". \r\n\r\nThe band's third album, "[url=http://www.discogs.com/Radiohead-OK-Computer/master/21491]OK Computer[/url]" (1997), propelled them to greater attention. Popular both for its expansive sound and themes of modern alienation, the album has been acclaimed by critics as a landmark record of the 1990's, some critics go as far to consider it one of the best of all time. "[url=http://www.discogs.com/Radiohead-Kid-A/master/21501]Kid A[/url]" (2000) marked further evolution, containing influences from experimental electronic music.\r\n\r\n"[url=http://www.discogs.com/Radiohead-Hail-To-The-Thief/master/16962]Hail To The Thief[/url]" (2003) was seen as a conventional return to the guitar and piano-led rock sound. After fulfilling their contract with EMI, Radiohead released "[url=http://www.discogs.com/Radiohead-In-Rainbows/master/21520]In Rainbows[/url]" (2007) famously via a pay-what-you-want model. Their latest album,  "[url=https://www.discogs.com/Radiohead-A-Moon-Shaped-Pool/master/998252]A Moon Shaped Pool[/url]", was released in May 2016.\r\n \r\nRadiohead's original influences were cited as alternative rock and post-punk bands like [url=http://www.discogs.com/artist/Smiths,+The]The Smiths[/url], [a=Pixies], [a=Magazine], [a=Joy Division], and [a=R.E.M.] (with lead singer of the band, Thom Yorke, refering to himself as an 'R.E.M. groupie').	2017-11-23 19:25:38.351102	2017-11-23 19:25:38.351102	25
82	Coldplay	Coldplay is an English rock band from London, England. They've been a band since January 16, 1998 when they lost a demotape competition on XFM in London. Philip Christopher Harvey is the band's manager.\r\n\r\n[b][u]Line-up:[/u][/b]\r\nJonny Buckland (Jonathan Mark Buckland) - Guitar\r\nWill Champion (William Champion) - Drums\r\nGuy Berryman (Guy Rupert Berryman) - Bass\r\nChris Martin (Christopher Anthony John Martin) - Vocals	2017-11-23 19:25:49.343013	2017-11-23 19:25:49.343013	25
83	Red Hot Chili Peppers	Formed: 1983 in Los Angeles, California, United States \r\n\r\n[b]Current members:[/b]\r\nAnthony Kiedis: Lead Vocals, Additional Guitar* (1983-present)\r\nMichael "Flea" Balzary: Bass, Trumpet, Piano, Backing Vocals (1983-present)\r\nChad Smith: Drums, Percussion (1988-present)\r\nJosh Klinghoffer: Lead Guitar, Keyboards, Six-String Bass, Organ, Percussion, Banjo, Backing Vocals (2009-present)\r\n* Live Only 1991-1998\r\n\r\n[b]Former members:[/b]\r\nHillel Slovak: Guitar, Backing Vocals (1983, 1985-88)\r\nJack Irons: Drums, Percussion (1983, 1986-88)\r\nJack Sherman: Guitar, Backing Vocals (1983-85)\r\nCliff Martinez: Drums, Percussion, Backing Vocals (1984-86)\r\nDeWayne McKnight: Lead Guitar, Backing Vocals (1988)\r\nD.H. Peligro: Drums, Percussion (1988)\r\nJohn Frusciante: Lead Guitar, Keyboards, Backing Vocals (1988-92, 1998-09)\r\nArik Marshall: Lead Guitar, Backing Vocals (1992-93)\r\nJesse Tobias: Lead Guitar, Backing Vocals (1993)\r\nDave Navarro: Lead Guitar, Backing Vocals (1993-98)	2017-11-23 19:26:00.445216	2017-11-23 19:26:00.445216	25
84	The Supremes	American soul and R&B group, recording during the 1960s and 1970s. \r\n\r\nKnown initially and lastly as "The Supremes", with a period called "Diana Ross & The Supremes", in which case they should be credited separately as "[a47742] & [a17966]".\r\n\r\n[a=Mary Wilson] (1961 to 1977) \r\n[a=Florence Ballard] (1961 to 1967) \r\n[a=Barbara Martin] (1961 to 1962) \r\n[a=Cindy Birdsong] (1967 to 1972, 1974 to 1976) \r\n[a=Jean Terrell] (1970 to 1973) \r\n[a=Lynda Laurence] (1972 to 1973) \r\n[a=Scherrie Payne] (1974 to 1977) \r\n[a=Susaye Greene] (1976 to 1977) \r\n\r\n\r\nHugely successful female vocal group formed in 1961, after initially after being called [url=http://www.discogs.com/artist/Primettes,+The]The Primettes[/url] from 1959 to 1960. Their best-known and most stable lineup was Diana Ross, Florence Ballard and Mary Wilson, in which configuration they became Motown's top act of the 1960s, though of that line-up only Wilson remained in the group by the time of the 1970s disco incarnation represented here. \r\n\r\nThe Supremes changed name in early 1967 to Diana Ross & The Supremes. Motown president [a=Berry Gordy] stated that the name change was done so that Motown could demand more money from live bookings, but rumors began to spread of an approaching Diana Ross solo career. \r\n\r\nAt that time member Florence Ballard had begun drinking and occasionally missing performance and, by June 1967, was replaced by Cindy Birdsong, a member of [url=http://www.discogs.com/artist/Patti+LaBelle+And+The+Bluebells]Patti LaBelle & The Blue Belles[/url]. \r\n\r\nIn January 1970, Diana Ross & The Supremes gave their final performance and Ross began her solo career. Jean Terrell replaced Diana as the lead singer and thereby renaming the group back to The Supremes. \r\n\r\nInducted into Rock And Roll Hall of Fame in 1988 (Performer). 	2017-11-23 19:29:13.362708	2017-11-23 19:29:13.362708	12
85	The Jacksons	The Jacksons were a group made-up of five brothers from Gary, Indiana, USA –Michael, Jackie, Tito, Marlon, Randy (with Jermaine instead of Randy pre-1976)– under the leadership of their father Joseph Jackson. \r\n\r\nInitially called [a41157], they changed their name when they switched labels from Motown to Epic, via [l=Philadelphia International Records]. \r\n	2017-11-23 19:29:25.343608	2017-11-23 19:29:25.343608	12
86	Earth, Wind & Fire	Soul funk band\r\n\r\nFounded in Chicago, Illinois, in 1970 by [a=Maurice White].\r\nThey have sold over 90 million units worldwide.\r\nInducted into Rock And Roll Hall of Fame in 2000 (Performer).\r\n	2017-11-23 19:29:35.360516	2017-11-23 19:29:35.360516	12
87	The Isley Brothers	American R&B/soul group from Cincinnati, Ohio, established in the early 1950s. O’Kelly Isley, Rudolph Isley, Ronald Isley and Vernon Isley (died 1956 in automobile accident) comprised the original group. They released their early hit “Shout!” in 1959. In 1963 they started own label T-Neck, and added a young [a=Jimi Hendrix] on lead guitar. In 1965 they signed on to Motown where they recorded “This Old Heart Of Mine”. They left Motown in 1968 and re-launched the T-Neck label in 1969 when they released  “It's Your Thing”. In 1973 they added the younger brothers Ernie and Marvin Isley, as well as O’Kelly's brother-in-law Chris Jasper to their regular lineup. During this era from 1973 to 1983 the group continued to release hits like “Between the Sheets”, “Choosey Lover” or “For the Love Of You”. \r\nInducted into Rock And Roll Hall of Fame in 1992 (Performer). 	2017-11-23 19:29:47.349154	2017-11-23 19:29:47.349154	12
98	The Tornados	 English instrumental group mostly active in the 1960's.\r\n\r\nThe house band for pioneering record producer [a=Joe Meek]. Their original and classic line-up comprised [a=Alan Caddy] (guitar), [a=Clem Cattini] (drums), [a=Heinz] Burt (bass), [a=George Bellamy] (rhythm guitar) and [a=Roger LaVern] (keyboards). Their instrumental material was composed and produced by Meek, and frequently had a futuristic sound which reflected Meek's interest in electronics and sound manipulation. Although their first single "Love And Fury" bombed, the follow-up "[r=1240431]" caught the public imagination and was a number one hit in both the UK and USA (they were the first British group ever to top the US Hot Hundred). The quintet enjoyed several more UK hits, though the original line-up began to fall apart when Heinz Burt left for a solo career as a vocalist in 1963 (he scored one major UK hit, "Just Like Eddie" later that year), and none of the original members remained by the time the Tornados finally disbanded upon Meek's death in 1967.\r\n\r\nDo not confuse with american surf rock band [a252795], famous for the track "Bustin' Surfboards".	2017-11-23 19:41:32.351779	2017-11-23 19:41:32.351779	18
88	The Temptations	American vocal group known for their success with Motown Records during the 1960s and 1970s.\r\nWith their distinct harmonies, choreography, & flashy wardrobe, the group was highly influential in the evolution R&B and soul music.\r\n\r\nFormed in 1960 in Detroit, Michigan under the name The Elgins (not to be confused with the other Motown act with the same name), they changed their name to The Temptations before being signed at Motown in 1962.\r\nThe first Motown recording act to win a Grammy Award, over the course of their career, they have released four Billboard Hot 100 #one singles and fourteen R&B #one singles, making them one of the most successful groups in music history.\r\n\r\nThe Temptations Family Tree 1961 - 2006\r\n\r\nOtis Williams (1960 – present) \r\nElbridge "Al" Bryant (1960 – 1963) \r\nMelvin Franklin (1960 – 1994) \r\nEddie Kendricks (1960 – 1971, 1982 reunion) \r\nPaul Williams (1960 – 1971) \r\nDavid Ruffin (1964 – 1968, 1982 reunion) \r\nDennis Edwards (1968 –1977, 1980 – 1984, 1987 - 1989) \r\nRicky Owens (1971) \r\nRichard Street (1971 – 1993) \r\nDamon Harris (1971 – 1975) \r\nGlenn Leonard (1975 – 1982) \r\nLouis Price (1977 – 1980) \r\nRon Tyson (1983 – present) \r\nAli-Ollie Woodson (1984 – 1987, 1989 -1998) \r\nTheo Peoples (1992 – 1998) \r\nRay Davis (1994 - 1996) \r\nHarry McGilberry (1995 - 2003) \r\nBarrington "Bo" Henderson (1998 - 2003) \r\nTerry Weeks (1998 - present) \r\nG.C. Cameron (2003 – present) \r\nJoe Herndon (2003 – present)\r\n\r\nInducted into Rock And Roll Hall of Fame in 1989 (Performer).\r\n	2017-11-23 19:29:58.343881	2017-11-23 19:29:58.343881	12
89	Gorillaz	Virtual band founded in 1998 by [a=Damon Albarn] from [a=Blur], and comic-book artist [a=Jamie Hewlett] designing and drawing the band. It can be found in [i]The Guiness Book of World Records[/I] under Most Successful Virtual Band. When the band were first created in 1998, the original concept was a group named 'Gorilla', with a slightly different lineup.\r\n\r\nThe lineup of characters is:\r\n[a=2D (3)] - Lead singer, keyboards, additional instruments. Gained his nickname from injuries he sustained in a car accident (vocals performed by [a=Damon Albarn]).\r\n[a=Murdoc Niccals] - Bassist, additional instruments. Sold his soul and middle name to the devil for the band's success.\r\n[a=Noodle (2)] - Guitarist. A Japanese expat, she was shipped to the band in a crate at 8.\r\n[a=Russel Hobbs] - Drummer. An American expatriate, possessed by the ghosts of his late friends.\r\n\r\nFormer members:\r\nDel The Ghost Rapper - Rapper. One of the above friends, he was sent to the afterlife by the Grim Reaper following their first album (vocals performed by [a=Del Tha Funkee Homosapien]).\r\nPaula Cracker - Guitarist. 2D's girlfriend of two months, she was kicked out of the band for having an affair with Murdoc. She was a part of the band when they were known as 'Gorilla'.\r\nCyborg Noodle - Guitarist. Robotic replica of the real Noodle who replaces her on Plastic Beach.\r\nThere was also an actual gorilla who played bongos, also during the band's time as 'Gorilla'.	2017-11-23 19:33:02.351445	2017-11-23 19:33:02.351445	5
90	New Order	Formed 1980 in Manchester, United Kingdom shortly after the suicide of [a=Ian Curtis] ([a=Joy Division], [url=http://www.discogs.com/artist/Warsaw+(3)]Warsaw[/url])\r\nMembers : [a=Bernard Sumner] (vocals, guitar, keyboards), [a=Peter Hook] (bass, keyboards, 1980–2010), [a=Stephen Morris] (drums, keyboards), [a=Gillian Gilbert] (keyboards, guitar, 1981–2001, 2011–present), [a=Phil Cunningham] (guitar, keyboards, 2001–present), [a=Tom Chapman (2)] (bass, 2011–present).\r\n	2017-11-23 19:33:14.347198	2017-11-23 19:33:14.347198	5
91	The Prodigy	British electronic group, founded in 1990. Their first release was single "What Evil Lurks" (1991). Their early music was mostly rave/breakbeat, but has become more mainstream mixing in rock guitars with the third album "The Fat Of The Land" (1997). \r\n\r\nBand members: \r\n- [a=Liam Howlett] (head of the group; producer). \r\n- [a=Keith Flint] (vocals, dancing). \r\n- [a=Maxim] (MCing, vocals). \r\n(- [a=Leeroy Thornhill] (dancing) – former longterm member). \r\n\r\nThe original Prodigy line-up was Liam on keyboards and Leeroy, Keith and Sharky as dancers. Maxim was recruited at short notice to MC at their debut gig at Labrynth in Dalston, London. Sharky left the group at Christmas 1990 after they got their record deal with XL as she didn't want to devote more time to the band. Their initial deal with XL was for 4 singles, with XL paying a £1500 advance prior to the first single. \r\n\r\nThe Prodigy briefly used the pseudonym [a=Earthbound (6)] (named after Liam's studio) for the original white-label summer releases of "One Love" (1993). [a=Leeroy Thornhill] left the band in 2000. 	2017-11-23 19:33:25.354505	2017-11-23 19:33:25.354505	5
92	Pet Shop Boys	Pet Shop Boys are an English musical duo, formed in London in 1981 and consisting of Neil Tennant (main vocals, keyboards, occasional guitar) and Chris Lowe (keyboards, occasional vocals). They are listed as the most successful duo in UK music history by The Guinness Book of Records. \r\nIn the early 90s they ran [l=Spaghetti Recordings] and more recently, [l=Olde English] and [l=Lucky Kunst] labels. \r\nIn March 2013, the duo officially left [l=Parlophone] after 28 years and entered into a new arrangement with [l=Kobalt Label Services] for their 12th studio album which would be the band's first release on their own music imprint [l=x2 (2)].	2017-11-23 19:33:37.352477	2017-11-23 19:33:37.352477	5
93	The Chemical Brothers	Tom & Ed met in history class at Manchester University in 1988. They started off as DJs known as "The 237 Turbo Nutters" (named after the number of their house on Dickenson Road in Manchester and a reference to their Blackburn raving days). They then opted for "The Dust Brothers" which they nicked from the L.A. producers of "Pauls Boutique" (as they thought they would never be famous). In 1995 they changed their name to "The Chemical Brothers" after the real Dust Brothers threatened to sue.	2017-11-23 19:33:48.34683	2017-11-23 19:33:48.34683	5
94	The Mothers	The Mothers or [b]The Mothers Of Invention[/b].\r\n[a=Frank Zappa] teamed with gigging R&B group 'The Soul Giants' in 1964. The band included vocalist [a=Ray Collins], bassist [a=Roy Estrada] and drummer [a=Jimmy Carl Black]. Zappa emerged as their creative leader and the band became 'The Mothers' (as in mother-f**kers = good musicians). After signing to [l=Verve Records] this was appended to 'The Mothers Of Invention' at the insistence of the label. Until Zappa founded his own label the appendage was usually added in mock deference and the band were usually referred to as 'The Mothers'.\r\n\r\nGuitarist [a=Elliot Ingber] then joined and, for much of their seminal 1960's albums, the group also included woodwind player [a=Bunk Gardner], saxophonist [a=Motorhead Sherwood], keyboardist [a=Don Preston], multi-instrumentalist [a=Ian Underwood] and additional drummers [a=Billy Mundi] and [a=Art Tripp]. Most of these artists appeared on "Freak Out!" (1966), "Absolutely Free" and "We're Only In It For The Money" (1967), "Cruising With Ruben & the Jets" (1968) and "Uncle Meat" (1969).\r\nDuring Zappa's jazz/classical rock period of 1969-1970, his works were augmented by violinists [a=Don "Sugarcane" Harris] and [a=Jean-Luc Ponty], percussionist [a=Ruth Underwood] and drummers [a=Aynsley Dunbar] and [a=John Guerin]. Most of these artists appeared on "Uncle Meat", "Hot Rats", "Weasels Ripped My Flesh" and "Burnt Weeny Sandwich". \r\n\r\nFrom 1970-72, Zappa formed a new line-up with former [a48408] members [a=Flo & Eddie] and bassist [a=Jim Pons]. Preston, Underwood and Dunbar remained in the line-up, along with additional keyboardist [a=George Duke]. This line-up was disbanded, after Zappa was pushed from the stage by a fan in 1972. (He could not tour for the next year). Two more jazz rock albums, "Waka Jawaka" and "The Grand Wazoo", were recorded with much of the previous jazz-rock group including Preston, Ian and Ruth Underwood, Dunbar, Ponty, Huerin and Duke. Trumpeter [a=Sal Marquez] was also added. Zappa and the band went back to vocal rock songs with jazz elements in 1973 on "Over-Nite Sensation", then 1974's "Apostrophe" and 1975's "One Size Fits All". Much of the same band remained, along with new members [a=Bruce Lambourne Fowler] (trombone), [a=Tom Fowler] (bass) and [a=Napoleon M. Brock] (saxophone). In 1975 Zappa called a halt to this backing band. By the late '70s an entirely new support band was formed, with only occasional participation from past members, including a re-appearance of [a=Captain Beefheart]. Beginning in the 80's, past 'Mothers' members Collins, Black, Gardner, Sherwood, Preston, Tom and Bruce Fowler occasionally played in a mock Zappa band, 'The Grandmothers'. In 1985 Zappa adroitly used 'The Mothers Of Prevention' in his assault on American censorship aspects of the music industry.\r\n	2017-11-23 19:40:46.352702	2017-11-23 19:40:46.352702	18
95	Mahavishnu Orchestra	One of the premiere fusion groups, the [b]Mahavishnu Orchestra[/b] was considered by most observers during its prime to be a rock band, but its sophisticated improvisations actually put its high-powered music between rock and jazz. Founder and leader [a=John McLaughlin] had recently played with [a=Miles Davis] and Tony Williams' Lifetime. The original lineup of the group was McLaughlin on electric guitar, violinist [a=Jerry Goodman], keyboardist [a=Jan Hammer], electric bassist [a=Rick Laird], and drummer [a=Billy Cobham]. They recorded three intense albums for [l=Columbia Records] during 1971-1973 and then the personnel changed completely for the second version of the group. In addition to McLaughlin, the 1974 incarnation of the band consisted of violinist [a=Jean-Luc Ponty], [a=Gayle Moran] on keyboards and vocals, electric bassist [a=Ralphe Armstrong], and drummer [a=Narada Michael Walden]; by 1975 [a=Stu Goldberg] had replaced Moran and Ponty had left. John McLaughlin's dual interests in Eastern religion and playing acoustic guitar resulted in the band breaking up in 1975. Surprisingly, an attempt to revive the [b]Mahavishnu Orchestra[/b] in 1984 (using Cobham, saxophonist Bill Evans, keyboardist [a=Mitchel Forman], electric bassist [a=Jonas Hellborg], and percussionist [a=Danny Gottlieb]) was unsuccessful; one [l=Warner Bros. Records, Inc.] album resulted. However, when one thinks of the [b]Mahavishnu Orchestra[/b], it is of the original lineup, which was very influential throughout the 1970s.	2017-11-23 19:40:58.350943	2017-11-23 19:40:58.350943	18
96	Tangerine Dream	Founded by the late [a=Edgar Froese], Tangerine Dream is perhaps the premier exponent of "electronic rock" music of the "Berlin School". From their "free-rock" beginnings in the nascent "krautrock" scene to the eventual synthesizer-based trio which signed to [l=Virgin], this German group can take significant credit in introducing synthesizer/sequenced electronic music to most of the Western rock world. At the height of their success - during the mid to late 1970s - the Dream's spacey, pulsing music earned them a tenacious cult following. By the late Seventies, however, line-ups, and more importantly, the formula changed, tilting towards more conventional "rock" music. By the early 1980s, TD was primarily releasing influential  soundtrack work, before settling into New Age content by mid-decade.\r\n\r\nFormed in Berlin in 1967, the initial line up (on their first release Electronic Meditation) included [a=Edgar Froese], [a=Conrad Schnitzler] (cello) and [a=Klaus Schulze] (drums). Their compositions, or rather experimental improvisations, had roots in the psychedelia of London albeit with the "krautrock" twist. [i]Electronic Meditation[/i] is perhaps a misnomer; traditional instrumentation of organ, drums, guitar, cello, flute were hardly electronic and "freak out jamming" is the more appropriate adjective, reflecting the confluence of Twentieth Century avant-garde music. Both Schnitzler and Schulze would depart after this album, with the latter forming [a=Ash Ra Tempel] and going on to become the other major proponent of the "Berlin School". Second album, [i]Alpha Centauri[/i], saw the addition of long-standing member [a=Christopher Franke] replacing Schulze, while [a=Peter Baumann] would come aboard for [i]Zeit[/i]. Although unissued until the mid-1980s, [i]Green Desert[/i] was recorded in 1973. The core of Froese, Franke and Baumann would sign to Virgin Records in 1973, and the subsequent release [i]Phaedra[/i] would cement their style for years to come. Understated, droning keyboard and guitar melodies intertwined with ambient washes of reverberating electronic textures, utilizing synthesizers and sequencers, was typical of the TD sound. Compositions were long, melodic, pulsing pieces. [a=Michael Hoenig] temporarily replaced Baumann for an Australian tour in 1975. One highlight of the Virgin period was [i]Sorcerer[/i], a soundtrack to the film of the same name. After Baumann's departure in 1978, TD experimented with the formula on [i]Cyclone[/i], which saw the addition of [a=Steve Jolliffe], adding vocals and woodwinds and [a=Klaus Krüger] on drums. [i]Force Majeure[/i] was the classic of this period. [a=Johannes Schmölling] would join for [i]Tangram[/i]. This line-up remained stable until the mid-1980s, as the group shifted toward more rhythmic textures. The increased emphasis on sequencers and rhythm in the first half of the 1980s divided fans, as did subsequent releases which veered heavily into relatively accessible, uplifting melodies.\r\n\r\nAfter a brief stint with [l=Jive Records] from 1984 to 1988, TD signed to Baumann's [l=Private Music] label and then the equally New Agey [l=Miramar], fully embracing digital textures and seeking to distance the group from its moody, psychedelic past. [a=Paul Haslinger] replaced Schmölling in 1985, and was in turn replaced by Froese's son [a=Jerome Froese] in 1990. Franke left in 1987 over creative differences with Froese. After a mid-1990s move to Edgar Froese's own [l=TDI Music] label (later renamed [l=Eastgate]), TD's reputation as a New Age band became less appropriate - father and son experimented with more modern sounds and revisited elements of past glories - but the group's artist direction remained fairly entrenched in melodic pop-rock territory, with an increased use of acoustic instruments, particularly on stage. With Edgar Froese's death in 2015, the band continues, but with none of its original members. \r\n	2017-11-23 19:41:08.364628	2017-11-23 19:41:08.364628	18
99	Depeche Mode	English electronic music band formed March 1980 in Basildon, Essex, and named after a popular French fashion magazine. The group's original line-up consisted of Dave Gahan (lead vocals, occasional songwriter since 2005), Martin Gore (keyboards, guitar, vocals, chief songwriter after 1981), Andy Fletcher (keyboards), and Vince Clarke (keyboards, chief songwriter from 1980 until 1981). Depeche Mode released their debut record in 1981, Speak & Spell, bringing the band onto the British new wave scene. Clarke left the band after the release of the album, leaving the band as a trio to record A Broken Frame, released the following year. Gore took over lead songwriting duties and, later in 1982, Alan Wilder (keyboards, drums, occasional songwriter) officially joined the band to fill Clarke's spot, establishing a line up that would continue for the next thirteen years.\r\n\r\nThe band's last albums of the 1980s, Black Celebration and Music for the Masses, established them as a dominant force on the mainstream electronic music scene. A highlight of this era was the band's concert at the Pasadena Rose Bowl, where they drew a crowd in excess of 60,000 people. In the new decade, Depeche Mode released Violator, a mainstream success. The subsequent album, Songs of Faith and Devotion, and the supporting Devotional Tour exacerbated tensions within the band to the point where Alan Wilder quit in 1995, leading to intense media and fan speculation that the band would split. Now a trio once again, the band released Ultra in 1997, recorded at the height of Gahan's near-fatal drug abuse, Gore's alcoholism and seizures and Fletcher's depression. The release of Exciter confirmed Depeche Mode's willingness to remain together, the subsequent, and very successful, Exciter Tour being their first tour in support of an original album in eight years since the Devotional Tour, although the band had toured in 1998 to support The Singles 86–98 compilation album.\r\n\r\nDepeche Mode have had fifty songs in the UK Singles Chart and thirteen top 10 albums in the UK charts, two of which debuted at No. 1. Depeche Mode have to this day sold over 100 million records worldwide, making them one of the most commercially successful electronic bands and one of the world's best-selling music artists in the world. Q magazine calls Depeche Mode "the most popular electronic band the world has ever known" and included the band in the list of the "50 Bands That Changed the World!". Depeche Mode also rank number 98 on VH1's "100 Greatest Artists Of All Time.\r\n\r\nCurrent lineup:\r\n[a=Martin L. Gore]: keyboards, guitar, vocals\r\n[a=Dave Gahan]: lead vocals\r\n[a=Andrew Fletcher]: keyboards\r\n\r\nFormer members:\r\n[a=Vince Clarke] (1980-81): keyboards\r\n[a=Alan Wilder] (1982-95): keyboards, drums	2017-11-23 19:44:11.36258	2017-11-23 19:44:11.36258	20
100	Kraftwerk	Krautrock > electronic experimental > electro-pop band from Düsseldorf, Germany, formed in 1970.\r\n\r\nFormerly known as [a=Organisation], Kraftwerk debuted live as the trio of Ralf Hütter, Florian Schneider-Esleben and Charly Weiss at the Tivoli Popfestival, Aachen on 11 July 1970. Klaus Dinger took over as drummer after that. Gigs between 26 December 1970 and 30 July 1971 omitted Hutter, with various line-ups including Michael Rother and others. Dinger & Rother then split-off forming [a=Neu!]. First known Hutter/Schneider gig is 2 February 1972 at the Fabrik, Altona, Hamburg, which instigated the partnership that developed into the well-known electro pop band continuing for decades with an expanded line-up after the hit single Autobahn.\r\n\r\nCurrent members:\r\nRalf Hütter (July 1970 to December 1970, January 1972-) Lead Vocals, Vocoder, Synthesizers, Keyboards, Organ, Drums and Percussion, Guitar, Bass Guitar\r\nHenning Schmitz (1987-) Electronic Percussion (1987–) Sound Engineering\r\nFritz Hilpert (1987-) Electronic Percussion, Sound Engineering\r\nFalk Grieffenhagen (2013-)  Video Technician\r\n\r\nFormer Members:\r\nKarl Bartos (1975-1991) Electronic Percussion\r\nKlaus Dinger (1970-1971) Drum\r\nWolfgang Flür (1973-1987) Electronic Percussion\r\nAndreas Hohmann (1970) Drum\r\nEberhard Kranemann (1970) Bass Guitar\r\nThomas Lohmann (1970) Drum\r\nHouschäng Néjadepour (1970) Electric Guitar\r\nMichael Rother (1971) Electric Guitar\r\nFlorian Schneider-Esleben (1970–2008) \r\nCharly Weiss (1970) Drums\r\nPlato Kostic (a.k.a. Plato Riviera) (1970) Bass Guitar\r\nPeter Schmidt (1970) Drums\r\nEmil Schult (1973) Electric guitar, Electronic violin\r\nKlaus Röder (1974) Electric guitar, Electronic violin\r\nFernando Abrantes (1991) Electronic Percussion, Synthesizer\r\nStefan Pfaffe (2008-2012) Video Technician\r\n\r\n[a=Maxime Schmitt] has been a close friend of the group as well as an advisor and collaborator. \r\n[a=Emil Schult] has also collaborated on many releases, contributing both lyrics and graphics. \r\n	2017-11-23 19:44:22.35623	2017-11-23 19:44:22.35623	20
101	New Order	Formed 1980 in Manchester, United Kingdom shortly after the suicide of [a=Ian Curtis] ([a=Joy Division], [url=http://www.discogs.com/artist/Warsaw+(3)]Warsaw[/url])\r\nMembers : [a=Bernard Sumner] (vocals, guitar, keyboards), [a=Peter Hook] (bass, keyboards, 1980–2010), [a=Stephen Morris] (drums, keyboards), [a=Gillian Gilbert] (keyboards, guitar, 1981–2001, 2011–present), [a=Phil Cunningham] (guitar, keyboards, 2001–present), [a=Tom Chapman (2)] (bass, 2011–present).\r\n	2017-11-23 19:44:34.347514	2017-11-23 19:44:34.347514	20
102	Massive Attack	Collaborative british music production duo from Bristol, UK. During the 1991 Gulf War the group name was shown on some releases as 'Massive' in order to maintain airplay after pressure from the British Government on radio programmers. The group did not actually change their name.	2017-11-23 19:44:45.349843	2017-11-23 19:44:45.349843	20
103	Daft Punk	Daft Punk is a French electronic music group. The two members are [a=Thomas Bangalter] (born January 3, 1975) and [a=Guy-Manuel de Homem-Christo] (born February 8, 1974). Bangalter and de Homem-Christo were previously in the rock band [a=Darlin'] with [a=Laurent Brancowitz]. After Brancowitz left the group to join his brother's band, [a=Phoenix], the remaining duo formed Daft Punk.\r\n	2017-11-23 19:44:56.350905	2017-11-23 19:44:56.350905	20
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bands_id_seq', 103, true);


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
56	2017-11-23 18:54:16.508328	2017-11-23 18:54:16.508328	99cbf06f6f05590458e7cb844e9c00e73cdc7d95	image/jpeg	175437	2017-11-23 18:54:16.323258	Album	11
57	2017-11-23 18:54:28.144517	2017-11-23 18:54:28.144517	d4b7ccb5051896d10e4a5658565dc0d6c3c4e065	image/jpeg	147287	2017-11-23 18:54:27.976102	Album	12
58	2017-11-23 18:54:39.657036	2017-11-23 18:54:39.657036	20097f68ea257b8b8102e90784770c4f187ca3ef	image/jpeg	250093	2017-11-23 18:54:39.466904	Album	13
59	2017-11-23 18:54:51.146846	2017-11-23 18:54:51.146846	e5f274ee8a88b302ef7cf232b8321a8bd62683fe	image/jpeg	213257	2017-11-23 18:54:50.963551	Album	14
60	2017-11-23 18:55:02.088146	2017-11-23 18:55:02.088146	ed904530562593544962cef60efcbd2e6f463476	image/jpeg	79281	2017-11-23 18:55:01.924523	Album	15
61	2017-11-23 18:55:31.174804	2017-11-23 18:55:31.174804	47da19a3aa94d5f95e32dd79ad7cc7257eea0533	image/jpeg	91980	2017-11-23 18:55:30.988386	Album	16
62	2017-11-23 18:55:42.363506	2017-11-23 18:55:42.363506	395ad6fbf859f13d1ad536dda1834d4a0ba64fc9	image/jpeg	217765	2017-11-23 18:55:42.164524	Album	17
63	2017-11-23 18:55:54.306273	2017-11-23 18:55:54.306273	f6a80cb4e8ae15d8358d8d7657ebfac8c3f7c1fc	image/jpeg	109544	2017-11-23 18:55:54.124502	Album	18
64	2017-11-23 18:56:06.283657	2017-11-23 18:56:06.283657	331ee10a3b70c1cde36b8795e58956698090954a	image/jpeg	140149	2017-11-23 18:56:06.107862	Album	19
65	2017-11-23 18:56:18.233108	2017-11-23 18:56:18.233108	e532c350221f015f4e6a878a1cbce7bf535c3ecc	image/jpeg	157398	2017-11-23 18:56:18.052666	Album	20
66	2017-11-23 18:56:56.785944	2017-11-23 18:56:56.785944	776b35448d2877049145bf9f2a32f7b938c3dd6e	image/jpeg	82269	2017-11-23 18:56:56.621095	Album	21
67	2017-11-23 18:57:08.155954	2017-11-23 18:57:08.155954	94c04cbf2ea221d53c4ca2c93c8228c39945a180	image/jpeg	170147	2017-11-23 18:57:07.974211	Album	22
68	2017-11-23 18:57:19.076232	2017-11-23 18:57:19.076232	e967961e987317a29a014abd0c2339766179c34a	image/jpeg	61314	2017-11-23 18:57:18.889263	Album	23
69	2017-11-23 18:57:30.040343	2017-11-23 18:57:30.040343	83bc8d97de6e16e901409ea9a9d18982bac472e7	image/jpeg	31261	2017-11-23 18:57:29.872435	Album	24
70	2017-11-23 18:57:41.227187	2017-11-23 18:57:41.227187	16f72167c03371e0d30dc71c61e94378f5294cf6	image/jpeg	170721	2017-11-23 18:57:41.063179	Album	25
71	2017-11-23 18:58:12.403968	2017-11-23 18:58:12.403968	bb1d4f4b4de8ed8abba4d25e8fc5cae22a79ceb5	image/jpeg	129444	2017-11-23 18:58:12.211397	Album	26
72	2017-11-23 18:58:23.965274	2017-11-23 18:58:23.965274	933fba0a286498d7934c642922e05b3d8e7a118b	image/jpeg	85209	2017-11-23 18:58:23.798549	Album	27
73	2017-11-23 18:58:35.025569	2017-11-23 18:58:35.025569	f4f148cdaad3f606dc6d484e47caca469a73958f	image/jpeg	272099	2017-11-23 18:58:34.842114	Album	28
74	2017-11-23 18:58:46.193761	2017-11-23 18:58:46.193761	ffd47237d7465f3a6679051ab4abc6c734c27cdd	image/jpeg	140830	2017-11-23 18:58:46.017915	Album	29
75	2017-11-23 18:58:58.0928	2017-11-23 18:58:58.0928	dc99860a79efb6b03d22f4c52bba4e1663fa4833	image/jpeg	115943	2017-11-23 18:58:57.920962	Album	30
76	2017-11-23 18:59:29.227516	2017-11-23 18:59:29.227516	f8aebe68df82729ac2d4c63fd2749ceaa316cff3	image/jpeg	106244	2017-11-23 18:59:29.039917	Album	31
77	2017-11-23 18:59:41.091857	2017-11-23 18:59:41.091857	4324921f652fced5b56dbbba5b26555be5b90248	image/jpeg	267467	2017-11-23 18:59:40.899204	Album	32
78	2017-11-23 18:59:52.034053	2017-11-23 18:59:52.034053	76a3761203a3b60b2800460539e2733f4a2337df	image/jpeg	109381	2017-11-23 18:59:51.872151	Album	33
79	2017-11-23 19:00:03.566437	2017-11-23 19:00:03.566437	4d3a2f8afbe2069798a023242f0dc53d39021b0b	image/jpeg	248457	2017-11-23 19:00:03.379557	Album	34
80	2017-11-23 19:00:15.136585	2017-11-23 19:00:15.136585	93e25bbc54d4c614f74ec51e6cf258de8b9c87e0	image/jpeg	197294	2017-11-23 19:00:14.961032	Album	35
81	2017-11-23 19:00:33.08889	2017-11-23 19:00:33.08889	36a6a1995e450dd70692dd2ea280e3ac1dcf2139	image/jpeg	153415	2017-11-23 19:00:32.905269	Album	36
82	2017-11-23 19:00:44.05192	2017-11-23 19:00:44.05192	2475df651566d8e2934c7a27dff920ab06315361	image/jpeg	101669	2017-11-23 19:00:43.880342	Album	37
83	2017-11-23 19:00:55.318973	2017-11-23 19:00:55.318973	e4c7835e697bb93179a09b36b6a74d7601fbc921	image/jpeg	168477	2017-11-23 19:00:55.095559	Album	38
84	2017-11-23 19:01:06.984899	2017-11-23 19:01:06.984899	7ad83b963b345c041b8e0f99fdbce21fbd87db18	image/jpeg	87428	2017-11-23 19:01:06.798153	Album	39
85	2017-11-23 19:01:18.298384	2017-11-23 19:01:18.298384	d14c1e0c1afedae6e2d41d02d8ae52b1abcea2bb	image/jpeg	210870	2017-11-23 19:01:18.115351	Album	40
86	2017-11-23 19:03:19.367099	2017-11-23 19:03:19.367099	e6882b5183a35fa5c0b0ad931f32504a9ad4c97c	image/jpeg	252721	2017-11-23 19:03:19.189077	Album	41
87	2017-11-23 19:03:31.200862	2017-11-23 19:03:31.200862	acb4710b6372d3652f3fa4454a3fbb2db61084aa	image/jpeg	157290	2017-11-23 19:03:31.018276	Album	42
88	2017-11-23 19:03:43.137968	2017-11-23 19:03:43.137968	c8d3ad8d852ef1a233ad64d467c8fd0c39a0e74c	image/jpeg	78231	2017-11-23 19:03:42.957931	Album	43
89	2017-11-23 19:03:55.004337	2017-11-23 19:03:55.004337	5a609c7f19aeda2908311276e35557eed15d0e26	image/jpeg	187184	2017-11-23 19:03:54.827289	Album	44
90	2017-11-23 19:04:06.146879	2017-11-23 19:04:06.146879	ff09a837dee51d9c8b46888fac88d31f4cae3025	image/jpeg	57259	2017-11-23 19:04:05.969876	Album	45
91	2017-11-23 19:05:14.265645	2017-11-23 19:05:14.265645	ed072730188f91b5d9cf222a57c27645eae25676	image/jpeg	118758	2017-11-23 19:05:14.084795	Album	46
92	2017-11-23 19:05:27.081305	2017-11-23 19:05:27.081305	09fb9e6ff6399ec18e77f41d9885b23f76c68d2a	image/jpeg	75475	2017-11-23 19:05:26.910522	Album	47
93	2017-11-23 19:05:39.305461	2017-11-23 19:05:39.305461	85e092afb64767022ac604f8647ae44344484490	image/jpeg	183521	2017-11-23 19:05:39.123072	Album	48
94	2017-11-23 19:05:51.334281	2017-11-23 19:05:51.334281	24c0c10c4dd8443b22a3a4613aa1ed53cf906f13	image/jpeg	181370	2017-11-23 19:05:51.14242	Album	49
95	2017-11-23 19:06:03.054444	2017-11-23 19:06:03.054444	1d7f0a846018f1770aab74bf725837ceec3c7aaf	image/jpeg	94963	2017-11-23 19:06:02.880203	Album	50
96	2017-11-23 19:16:23.236314	2017-11-23 19:16:23.236314	aa039163988b1bfd27346006197421816684e6e2	image/jpeg	192771	2017-11-23 19:16:23.049503	Album	51
97	2017-11-23 19:16:35.122654	2017-11-23 19:16:35.122654	f9367fe3c1ea7139ba8e4afb96fc2419eb5d47cc	image/jpeg	187673	2017-11-23 19:16:34.938965	Album	52
98	2017-11-23 19:16:46.986609	2017-11-23 19:16:46.986609	69a038e4594ec262cbb378252b4dc0fd5644c9c3	image/jpeg	122385	2017-11-23 19:16:46.823205	Album	53
99	2017-11-23 19:22:27.003374	2017-11-23 19:22:27.003374	b2f03b81b97e17058b57400138564213ea69620b	image/jpeg	43273	2017-11-23 19:22:26.835273	Album	54
100	2017-11-23 19:22:38.036127	2017-11-23 19:22:38.036127	9f858d307aa0bedbc2be9d4276ed39329d11ad92	image/jpeg	140946	2017-11-23 19:22:37.856619	Album	55
101	2017-11-23 19:22:49.011859	2017-11-23 19:22:49.011859	a8a97a4cdd16f40820c565bf48ee5078ec89c9f9	image/jpeg	79707	2017-11-23 19:22:48.834554	Album	56
102	2017-11-23 19:23:00.064782	2017-11-23 19:23:00.064782	18ac0c80feb31410ad8bb006ff057adf09fc115e	image/jpeg	110688	2017-11-23 19:22:59.882773	Album	57
103	2017-11-23 19:25:17.36056	2017-11-23 19:25:17.36056	dbf4b940d5154c4ff1eda27cbe4338bf11059370	image/jpeg	139792	2017-11-23 19:25:17.178888	Album	58
104	2017-11-23 19:25:28.98965	2017-11-23 19:25:28.98965	24b1591bc4ecc8fe201465a9c1bf1af96c93224d	image/jpeg	125865	2017-11-23 19:25:28.813568	Album	59
105	2017-11-23 19:25:40.068073	2017-11-23 19:25:40.068073	9f858d307aa0bedbc2be9d4276ed39329d11ad92	image/jpeg	140946	2017-11-23 19:25:39.891789	Album	60
106	2017-11-23 19:25:51.085688	2017-11-23 19:25:51.085688	9c2c4a9ac9726bfd996ff96383178bbb5efc59ab	image/jpeg	210822	2017-11-23 19:25:50.887477	Album	61
107	2017-11-23 19:29:15.351279	2017-11-23 19:29:15.351279	5ddd3d611412936aa6a3bf9872b9a4f422167aeb	image/jpeg	94000	2017-11-23 19:29:15.161016	Album	62
108	2017-11-23 19:29:37.336775	2017-11-23 19:29:37.336775	99cbf06f6f05590458e7cb844e9c00e73cdc7d95	image/jpeg	175437	2017-11-23 19:29:37.145398	Album	63
109	2017-11-23 19:29:49.043441	2017-11-23 19:29:49.043441	36fc40c35e2c0e887c480ef8d67ca9c9ea9c2da5	image/jpeg	45086	2017-11-23 19:29:48.873381	Album	64
110	2017-11-23 19:30:00.181359	2017-11-23 19:30:00.181359	c1cc24cd1c33ea43792c1eba52fa2837a2cf0c89	image/jpeg	128750	2017-11-23 19:29:59.999635	Album	65
111	2017-11-23 19:33:04.281341	2017-11-23 19:33:04.281341	84f8c446ff7ee2189a36fad3b01a129d7b8d0ecb	image/jpeg	81160	2017-11-23 19:33:04.114833	Album	66
112	2017-11-23 19:33:16.092664	2017-11-23 19:33:16.092664	c4b8692c4a516d4ec6124ebf35e98aa2fc422825	image/jpeg	36948	2017-11-23 19:33:15.919658	Album	67
113	2017-11-23 19:33:27.158455	2017-11-23 19:33:27.158455	6da41903d03b1a8568ec86e28c7d489ee8fdc752	image/jpeg	62173	2017-11-23 19:33:26.990841	Album	68
114	2017-11-23 19:33:39.031339	2017-11-23 19:33:39.031339	61c3bf2ede66b7fafd6582af08856db259f58950	image/jpeg	33021	2017-11-23 19:33:38.852359	Album	69
115	2017-11-23 19:33:50.062061	2017-11-23 19:33:50.062061	5fa791f48d2bc2d664a6bff1ef2781e42d14938f	image/jpeg	159519	2017-11-23 19:33:49.883954	Album	70
116	2017-11-23 19:40:48.586411	2017-11-23 19:40:48.586411	08aebdb676f6d463ed5aad4666a051df7f874e09	image/jpeg	107633	2017-11-23 19:40:48.397415	Album	71
117	2017-11-23 19:41:10.299753	2017-11-23 19:41:10.299753	8de900e71ae8608e5a3e034bc8ec83c019344391	image/jpeg	137095	2017-11-23 19:41:10.120399	Album	72
118	2017-11-23 19:41:22.078205	2017-11-23 19:41:22.078205	bf58c9ad4c93c37f6b49829d2e9211af43032414	image/jpeg	81129	2017-11-23 19:41:21.914383	Album	73
119	2017-11-23 19:41:34.186833	2017-11-23 19:41:34.186833	c966c16f77d9207fb8fdf6f744513107017944eb	image/jpeg	167441	2017-11-23 19:41:34.010424	Album	74
120	2017-11-23 19:44:13.061073	2017-11-23 19:44:13.061073	c910fb803a7a387bc80f2642c1f42856eb240526	image/jpeg	62758	2017-11-23 19:44:12.896082	Album	75
121	2017-11-23 19:44:24.037094	2017-11-23 19:44:24.037094	6c6f449bb6964223b40079eefed20b7cb360e934	image/jpeg	33632	2017-11-23 19:44:23.867309	Album	76
122	2017-11-23 19:44:36.076813	2017-11-23 19:44:36.076813	c4b8692c4a516d4ec6124ebf35e98aa2fc422825	image/jpeg	36948	2017-11-23 19:44:35.904414	Album	77
123	2017-11-23 19:44:47.025209	2017-11-23 19:44:47.025209	9c021dffa4400f14d5639f8361b9456042062aa7	image/jpeg	129598	2017-11-23 19:44:46.84138	Album	78
124	2017-11-23 19:44:57.905699	2017-11-23 19:44:57.905699	720c461b76e099758677df449324572e124c8fb4	image/jpeg	52677	2017-11-23 19:44:57.735346	Album	79
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('photos_id_seq', 124, true);


--
-- Data for Name: record_libraries; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY record_libraries (id, user_id, album_id, created_at, updated_at) FROM stdin;
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
36	September - LIVE	\N	2017-11-23 18:54:16.543909	2017-11-23 18:54:16.543909	14
37	Let Your Feelings Show - LIVE	\N	2017-11-23 18:54:16.548938	2017-11-23 18:54:16.548938	14
38	Let's Groove - LIVE	\N	2017-11-23 18:54:16.553077	2017-11-23 18:54:16.553077	14
39	Runnin' - LIVE	\N	2017-11-23 18:54:16.556721	2017-11-23 18:54:16.556721	14
40	Boogie Wonderland - LIVE	\N	2017-11-23 18:54:16.561112	2017-11-23 18:54:16.561112	14
41	Can't Hide Love - LIVE	\N	2017-11-23 18:54:16.566122	2017-11-23 18:54:16.566122	14
42	Fantasy - LIVE	\N	2017-11-23 18:54:16.570563	2017-11-23 18:54:16.570563	14
43	Kalimba Interlude - LIVE	\N	2017-11-23 18:54:16.575227	2017-11-23 18:54:16.575227	14
44	Evil - LIVE	\N	2017-11-23 18:54:16.579602	2017-11-23 18:54:16.579602	14
45	Shining Star - LIVE	\N	2017-11-23 18:54:16.584506	2017-11-23 18:54:16.584506	14
46	Keep Your Head to the Sky - LIVE	\N	2017-11-23 18:54:16.589121	2017-11-23 18:54:16.589121	14
47	Reasons - LIVE	\N	2017-11-23 18:54:16.593049	2017-11-23 18:54:16.593049	14
48	Sing a Song - LIVE	\N	2017-11-23 18:54:16.596933	2017-11-23 18:54:16.596933	14
49	That's the Way of the World - LIVE	\N	2017-11-23 18:54:16.601235	2017-11-23 18:54:16.601235	14
50	Wouldn't Change a Thing About You - LIVE	\N	2017-11-23 18:54:16.605779	2017-11-23 18:54:16.605779	14
51	After the Love Is Gone - LIVE	\N	2017-11-23 18:54:16.612307	2017-11-23 18:54:16.612307	14
52	System of Survival - LIVE	\N	2017-11-23 18:54:16.617501	2017-11-23 18:54:16.617501	14
53	Quicksilver	\N	2017-11-23 18:54:28.167951	2017-11-23 18:54:28.167951	14
54	Horace	\N	2017-11-23 18:54:28.172082	2017-11-23 18:54:28.172082	14
55	Sterling	\N	2017-11-23 18:54:28.175794	2017-11-23 18:54:28.175794	14
56	A Silver Lining	\N	2017-11-23 18:54:28.179805	2017-11-23 18:54:28.179805	14
57	Silverado	\N	2017-11-23 18:54:28.184395	2017-11-23 18:54:28.184395	14
58	Mine	\N	2017-11-23 18:54:28.187742	2017-11-23 18:54:28.187742	14
59	Silver Streak	\N	2017-11-23 18:54:28.191734	2017-11-23 18:54:28.191734	14
60	Precious Metal	\N	2017-11-23 18:54:28.195251	2017-11-23 18:54:28.195251	14
61	Anniversario	\N	2017-11-23 18:54:28.198545	2017-11-23 18:54:28.198545	14
62	Windmill	\N	2017-11-23 18:54:28.201228	2017-11-23 18:54:28.201228	14
63	Until the 12th of Never	\N	2017-11-23 18:54:39.681827	2017-11-23 18:54:39.681827	14
64	Just Say Nothing	\N	2017-11-23 18:54:39.684998	2017-11-23 18:54:39.684998	14
65	Goodbye to Yesterday	\N	2017-11-23 18:54:39.687875	2017-11-23 18:54:39.687875	14
66	Craziest High	\N	2017-11-23 18:54:39.690945	2017-11-23 18:54:39.690945	14
67	I Couldn't Love You More	\N	2017-11-23 18:54:39.693864	2017-11-23 18:54:39.693864	14
68	Jam on the Tyne	\N	2017-11-23 18:54:39.696406	2017-11-23 18:54:39.696406	14
69	Hats (Makes Me Wanna Holler)	\N	2017-11-23 18:54:39.698973	2017-11-23 18:54:39.698973	14
70	Don't Turn My Love Away	\N	2017-11-23 18:54:39.701647	2017-11-23 18:54:39.701647	14
71	Lowdown	\N	2017-11-23 18:54:39.704475	2017-11-23 18:54:39.704475	14
72	It's Just One of Those Things	\N	2017-11-23 18:54:39.707152	2017-11-23 18:54:39.707152	14
73	Pyramids on Mars	\N	2017-11-23 18:54:39.710077	2017-11-23 18:54:39.710077	14
74	Step Aside	\N	2017-11-23 18:54:39.712903	2017-11-23 18:54:39.712903	14
75	Love Born In Flames	\N	2017-11-23 18:54:39.715683	2017-11-23 18:54:39.715683	14
76	Village Life	\N	2017-11-23 18:54:39.718408	2017-11-23 18:54:39.718408	14
77	Always There (Live)	\N	2017-11-23 18:54:39.721261	2017-11-23 18:54:39.721261	14
78	Still a Friend of Mine (Live)	\N	2017-11-23 18:54:39.724032	2017-11-23 18:54:39.724032	14
79	Givin' It Up (Live)	\N	2017-11-23 18:54:39.726503	2017-11-23 18:54:39.726503	14
80	Golden State	\N	2017-11-23 18:54:51.166661	2017-11-23 18:54:51.166661	14
81	Guarded Optimism	\N	2017-11-23 18:54:51.170647	2017-11-23 18:54:51.170647	14
82	Anticipation	\N	2017-11-23 18:54:51.174223	2017-11-23 18:54:51.174223	14
83	Inevitable Outcome	\N	2017-11-23 18:54:51.178055	2017-11-23 18:54:51.178055	14
84	Trane Changing	\N	2017-11-23 18:54:51.183723	2017-11-23 18:54:51.183723	14
85	Eddie's in the House	\N	2017-11-23 18:54:51.187695	2017-11-23 18:54:51.187695	14
86	Fran's Scene	\N	2017-11-23 18:54:51.191742	2017-11-23 18:54:51.191742	14
87	Child's Play	\N	2017-11-23 18:54:51.196371	2017-11-23 18:54:51.196371	14
88	Shenandoah	\N	2017-11-23 18:54:51.201215	2017-11-23 18:54:51.201215	14
89	Cohearance	\N	2017-11-23 18:54:51.205597	2017-11-23 18:54:51.205597	14
90	Right Back Atcha	\N	2017-11-23 18:55:02.126409	2017-11-23 18:55:02.126409	14
91	Just Funkin' Around	\N	2017-11-23 18:55:02.129253	2017-11-23 18:55:02.129253	14
92	Shaken, Not Stirred	\N	2017-11-23 18:55:02.132022	2017-11-23 18:55:02.132022	14
93	Sensuosity	\N	2017-11-23 18:55:02.134639	2017-11-23 18:55:02.134639	14
94	Fast Lane	\N	2017-11-23 18:55:02.138027	2017-11-23 18:55:02.138027	14
95	A New Day	\N	2017-11-23 18:55:02.141642	2017-11-23 18:55:02.141642	14
96	On The Move	\N	2017-11-23 18:55:02.146406	2017-11-23 18:55:02.146406	14
97	No Doubt	\N	2017-11-23 18:55:02.150393	2017-11-23 18:55:02.150393	14
98	Let's Do This	\N	2017-11-23 18:55:02.154471	2017-11-23 18:55:02.154471	14
99	Manhattan	\N	2017-11-23 18:55:02.158587	2017-11-23 18:55:02.158587	14
100	Hardwired	\N	2017-11-23 18:55:31.211125	2017-11-23 18:55:31.211125	8
101	Atlas, Rise!	\N	2017-11-23 18:55:31.214827	2017-11-23 18:55:31.214827	8
102	Now That We’re Dead	\N	2017-11-23 18:55:31.217463	2017-11-23 18:55:31.217463	8
103	Moth Into Flame	\N	2017-11-23 18:55:31.220441	2017-11-23 18:55:31.220441	8
104	Dream No More	\N	2017-11-23 18:55:31.223175	2017-11-23 18:55:31.223175	8
105	Halo On Fire	\N	2017-11-23 18:55:31.225922	2017-11-23 18:55:31.225922	8
106	Confusion	\N	2017-11-23 18:55:31.229151	2017-11-23 18:55:31.229151	8
107	ManUNkind	\N	2017-11-23 18:55:31.233566	2017-11-23 18:55:31.233566	8
108	Here Comes Revenge	\N	2017-11-23 18:55:31.237735	2017-11-23 18:55:31.237735	8
109	Am I Savage?	\N	2017-11-23 18:55:31.241825	2017-11-23 18:55:31.241825	8
110	Murder One	\N	2017-11-23 18:55:31.245725	2017-11-23 18:55:31.245725	8
111	Spit Out The Bone	\N	2017-11-23 18:55:31.250354	2017-11-23 18:55:31.250354	8
112	If Eternity Should Fail - Live at Qudos Bank Arena, Sydney, Australia - Friday 6th May 2016	\N	2017-11-23 18:55:42.385128	2017-11-23 18:55:42.385128	8
113	Speed of Light - Live at Grand Arena, GrandWest, Cape Town, South Africa - Wednesday 18th May 2016	\N	2017-11-23 18:55:42.387981	2017-11-23 18:55:42.387981	8
114	Wrathchild - Live at 3 Arena, Dublin, Ireland - Saturday 6th May 2017	\N	2017-11-23 18:55:42.390897	2017-11-23 18:55:42.390897	8
115	Children of the Damned - Live at Bell Center, Montreal, Canada - Friday 1st April 2016	\N	2017-11-23 18:55:42.394029	2017-11-23 18:55:42.394029	8
116	Death or Glory - Live at Wroclaw Stadium, Wroclaw, Poland - Sunday 3rd July 2016	\N	2017-11-23 18:55:42.396973	2017-11-23 18:55:42.396973	8
117	The Red and the Black - Live at Ryogoku Kokugikan, Tokyo, Japan - Thursday 21st April 2016	\N	2017-11-23 18:55:42.399619	2017-11-23 18:55:42.399619	8
118	The Trooper - Live at Estadio Jorge Magico Gonzalez, San Salvador, El Salvador - Sunday 6th March 2016	\N	2017-11-23 18:55:42.40242	2017-11-23 18:55:42.40242	8
119	Powerslave - Live at Plaza Dell'Unita D'Italia, Trieste, Italy - Tuesday 26th July 2016	\N	2017-11-23 18:55:42.405099	2017-11-23 18:55:42.405099	8
120	The Great Unknown - Live at MRA Arena, Newcastle, England - Sunday 14th May 2017	\N	2017-11-23 18:55:42.407738	2017-11-23 18:55:42.407738	8
121	The Book of Souls - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-23 18:55:42.410142	2017-11-23 18:55:42.410142	8
122	Fear of the Dark - Live at Arena Castelao, Fortaleza, Brazil - Thursday 24th March 2016	\N	2017-11-23 18:55:42.4129	2017-11-23 18:55:42.4129	8
123	Iron Maiden - Live at Estadio Velez Sarsfield, Buenos Aires, Argentina - Tuesday 15th March 2016	\N	2017-11-23 18:55:42.416966	2017-11-23 18:55:42.416966	8
124	The Number of the Beast - Live at Open Air Festival, Wacken, Germany - Thursday 4th August 2016	\N	2017-11-23 18:55:42.421262	2017-11-23 18:55:42.421262	8
125	Blood Brothers - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-23 18:55:42.424151	2017-11-23 18:55:42.424151	8
126	Wasted Years - Live at HSBC Arena, Rio De Janeiro, Brazil - Thursday 17th March 2016	\N	2017-11-23 18:55:42.426895	2017-11-23 18:55:42.426895	8
127	Black Sabbath - Live	\N	2017-11-23 18:55:54.331839	2017-11-23 18:55:54.331839	8
128	Fairies Wear Boots - Live	\N	2017-11-23 18:55:54.336525	2017-11-23 18:55:54.336525	8
129	Under The Sun / Every Day Comes And Goes - Live	\N	2017-11-23 18:55:54.340953	2017-11-23 18:55:54.340953	8
130	After Forever - Live	\N	2017-11-23 18:55:54.34496	2017-11-23 18:55:54.34496	8
131	Into The Void - Live	\N	2017-11-23 18:55:54.348783	2017-11-23 18:55:54.348783	8
132	Snowblind - Live	\N	2017-11-23 18:55:54.352429	2017-11-23 18:55:54.352429	8
133	Band Introductions - Live	\N	2017-11-23 18:55:54.356603	2017-11-23 18:55:54.356603	8
134	War Pigs - Live	\N	2017-11-23 18:55:54.360906	2017-11-23 18:55:54.360906	8
135	Behind The Wall Of Sleep - Live	\N	2017-11-23 18:55:54.364994	2017-11-23 18:55:54.364994	8
136	Bassically / N.I.B. - Live	\N	2017-11-23 18:55:54.369038	2017-11-23 18:55:54.369038	8
137	Hand Of Doom - Live	\N	2017-11-23 18:55:54.37289	2017-11-23 18:55:54.37289	8
138	Supernaut / Sabbath Bloody Sabbath / Megalomania - Live	\N	2017-11-23 18:55:54.376785	2017-11-23 18:55:54.376785	8
139	Rat Salad / Drum Solo - Live	\N	2017-11-23 18:55:54.381049	2017-11-23 18:55:54.381049	8
140	Iron Man - Live	\N	2017-11-23 18:55:54.385429	2017-11-23 18:55:54.385429	8
141	Dirty Women - Live	\N	2017-11-23 18:55:54.389566	2017-11-23 18:55:54.389566	8
142	Children Of The Grave - Live	\N	2017-11-23 18:55:54.393622	2017-11-23 18:55:54.393622	8
143	Paranoid - Live	\N	2017-11-23 18:55:54.397517	2017-11-23 18:55:54.397517	8
144	The Threat Is Real	\N	2017-11-23 18:56:06.305995	2017-11-23 18:56:06.305995	8
145	Dystopia	\N	2017-11-23 18:56:06.308889	2017-11-23 18:56:06.308889	8
146	Fatal Illusion	\N	2017-11-23 18:56:06.311508	2017-11-23 18:56:06.311508	8
147	Death From Within	\N	2017-11-23 18:56:06.314174	2017-11-23 18:56:06.314174	8
148	Bullet To The Brain	\N	2017-11-23 18:56:06.316836	2017-11-23 18:56:06.316836	8
149	Post American World	\N	2017-11-23 18:56:06.319652	2017-11-23 18:56:06.319652	8
150	Poisonous Shadows	\N	2017-11-23 18:56:06.322554	2017-11-23 18:56:06.322554	8
151	Look Who's Talking	\N	2017-11-23 18:56:06.326641	2017-11-23 18:56:06.326641	8
152	Conquer Or Die	\N	2017-11-23 18:56:06.330573	2017-11-23 18:56:06.330573	8
153	Lying In State	\N	2017-11-23 18:56:06.334446	2017-11-23 18:56:06.334446	8
154	The Emperor	\N	2017-11-23 18:56:06.338925	2017-11-23 18:56:06.338925	8
155	Last Dying Wish	\N	2017-11-23 18:56:06.343489	2017-11-23 18:56:06.343489	8
156	Foreign Policy	\N	2017-11-23 18:56:06.34801	2017-11-23 18:56:06.34801	8
157	Me Hate You	\N	2017-11-23 18:56:06.353365	2017-11-23 18:56:06.353365	8
158	The Threat Is Real - Live Detroit, MI	\N	2017-11-23 18:56:06.358262	2017-11-23 18:56:06.358262	8
159	Poisonous Shadows - Live Detroit, MI	\N	2017-11-23 18:56:06.36287	2017-11-23 18:56:06.36287	8
160	Dystopia - Live Detroit, MI	\N	2017-11-23 18:56:06.367191	2017-11-23 18:56:06.367191	8
161	Turbo Lover - Remastered	\N	2017-11-23 18:56:18.258015	2017-11-23 18:56:18.258015	8
162	Locked In - Remastered	\N	2017-11-23 18:56:18.260862	2017-11-23 18:56:18.260862	8
163	Private Property - Remastered	\N	2017-11-23 18:56:18.263338	2017-11-23 18:56:18.263338	8
164	Parental Guidance - Remastered	\N	2017-11-23 18:56:18.265932	2017-11-23 18:56:18.265932	8
165	Rock You All Around the World - Remastered	\N	2017-11-23 18:56:18.268545	2017-11-23 18:56:18.268545	8
166	Out in the Cold - Remastered	\N	2017-11-23 18:56:18.271064	2017-11-23 18:56:18.271064	8
167	Wild Nights, Hot & Crazy Days - Remastered	\N	2017-11-23 18:56:18.273547	2017-11-23 18:56:18.273547	8
168	Hot for Love - Remastered	\N	2017-11-23 18:56:18.276273	2017-11-23 18:56:18.276273	8
169	Reckless - Remastered	\N	2017-11-23 18:56:18.279112	2017-11-23 18:56:18.279112	8
170	Out in the Cold - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.281723	2017-11-23 18:56:18.281723	8
171	Locked In - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.284441	2017-11-23 18:56:18.284441	8
172	Heading Out to the Highway - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.287248	2017-11-23 18:56:18.287248	8
173	Metal Gods - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.289832	2017-11-23 18:56:18.289832	8
174	Breaking the Law - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.292546	2017-11-23 18:56:18.292546	8
175	Love Bites - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.295568	2017-11-23 18:56:18.295568	8
176	Some Heads Are Gonna Roll - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.298172	2017-11-23 18:56:18.298172	8
177	The Sentinel - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.30096	2017-11-23 18:56:18.30096	8
178	Private Property - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.303624	2017-11-23 18:56:18.303624	8
179	Desert Plains - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.306199	2017-11-23 18:56:18.306199	8
180	Rock You All Around the World - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.30873	2017-11-23 18:56:18.30873	8
181	The Hellion - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.311264	2017-11-23 18:56:18.311264	8
182	Electric Eye - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.314008	2017-11-23 18:56:18.314008	8
183	Turbo Lover - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.316637	2017-11-23 18:56:18.316637	8
184	Freewheel Burning - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.319189	2017-11-23 18:56:18.319189	8
185	Victim of Changes - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.322874	2017-11-23 18:56:18.322874	8
186	The Green Manalishi (With The Two Pronged Crown) - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.326734	2017-11-23 18:56:18.326734	8
187	Living After Midnight - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.330801	2017-11-23 18:56:18.330801	8
188	You've Got Another Thing Coming - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.335663	2017-11-23 18:56:18.335663	8
189	Hell Bent for Leather - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:56:18.339809	2017-11-23 18:56:18.339809	8
190	You Shook Me - 23/3/69 Top Gear	\N	2017-11-23 18:56:56.823295	2017-11-23 18:56:56.823295	1
191	I Can't Quit You Baby - 23/3/69 Top Gear	\N	2017-11-23 18:56:56.829394	2017-11-23 18:56:56.829394	1
192	Communication Breakdown - 22/6/69 Pop Sundae	\N	2017-11-23 18:56:56.833458	2017-11-23 18:56:56.833458	1
193	Dazed And Confused - 23/3/69 Top Gear	\N	2017-11-23 18:56:56.837341	2017-11-23 18:56:56.837341	1
194	The Girl I Love She Got Long Black Wavy Hair - 22/6/69 Pop Sundae	\N	2017-11-23 18:56:56.841451	2017-11-23 18:56:56.841451	1
195	What Is And What Should Never Be - 29/6/69 Top Gear	\N	2017-11-23 18:56:56.846094	2017-11-23 18:56:56.846094	1
196	Communication Breakdown - 29/6/69 Top Gear	\N	2017-11-23 18:56:56.850698	2017-11-23 18:56:56.850698	1
197	Travelling Riverside Blues - 29/6/69 Top Gear	\N	2017-11-23 18:56:56.855389	2017-11-23 18:56:56.855389	1
198	Whole Lotta Love - 29/6/69 Top Gear	\N	2017-11-23 18:56:56.860275	2017-11-23 18:56:56.860275	1
199	Somethin' Else - 22/6/69 Pop Sundae	\N	2017-11-23 18:56:56.86485	2017-11-23 18:56:56.86485	1
200	Communication Breakdown - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.86964	2017-11-23 18:56:56.86964	1
201	I Can't Quit You Baby - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.874285	2017-11-23 18:56:56.874285	1
202	You Shook Me - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.878895	2017-11-23 18:56:56.878895	1
203	How Many More Times - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.883708	2017-11-23 18:56:56.883708	1
204	Immigrant Song - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.888972	2017-11-23 18:56:56.888972	1
205	Heartbreaker - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.893364	2017-11-23 18:56:56.893364	1
206	Since I've Been Loving You - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.897284	2017-11-23 18:56:56.897284	1
207	Black Dog - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.901187	2017-11-23 18:56:56.901187	1
208	Dazed And Confused - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.905175	2017-11-23 18:56:56.905175	1
209	Stairway To Heaven - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.907915	2017-11-23 18:56:56.907915	1
210	Going To California - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.910674	2017-11-23 18:56:56.910674	1
211	That's The Way - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.91352	2017-11-23 18:56:56.91352	1
212	Whole Lotta Love (Medley) - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.916231	2017-11-23 18:56:56.916231	1
213	Thank You - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.919112	2017-11-23 18:56:56.919112	1
214	Communication Breakdown - 23/3/69 Top Gear	\N	2017-11-23 18:56:56.921797	2017-11-23 18:56:56.921797	1
215	What Is And What Should Never Be - 22/6/69 Pop Sundae	\N	2017-11-23 18:56:56.924558	2017-11-23 18:56:56.924558	1
216	Dazed And Confused - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.928088	2017-11-23 18:56:56.928088	1
217	White Summer - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:56:56.9309	2017-11-23 18:56:56.9309	1
218	What Is And What Should Never Be - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.933909	2017-11-23 18:56:56.933909	1
219	Communication Breakdown - 1/4/71 Paris Theatre	\N	2017-11-23 18:56:56.936627	2017-11-23 18:56:56.936627	1
220	I Can't Quit You Baby - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:56:56.939358	2017-11-23 18:56:56.939358	1
221	You Shook Me - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:56:56.942241	2017-11-23 18:56:56.942241	1
222	Sunshine Woman - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:56:56.945005	2017-11-23 18:56:56.945005	1
223	Twist And Shout - Live / Remastered	\N	2017-11-23 18:57:08.191929	2017-11-23 18:57:08.191929	1
224	She's A Woman - Live / Remastered	\N	2017-11-23 18:57:08.196287	2017-11-23 18:57:08.196287	1
225	Dizzy Miss Lizzy - Live / Remastered	\N	2017-11-23 18:57:08.200975	2017-11-23 18:57:08.200975	1
226	Ticket To Ride - Live / Remastered	\N	2017-11-23 18:57:08.205594	2017-11-23 18:57:08.205594	1
227	Can't Buy Me Love - Live / Remastered	\N	2017-11-23 18:57:08.209819	2017-11-23 18:57:08.209819	1
228	Things We Said Today - Live / Remastered	\N	2017-11-23 18:57:08.213503	2017-11-23 18:57:08.213503	1
229	Roll Over Beethoven - Live / Remastered	\N	2017-11-23 18:57:08.216609	2017-11-23 18:57:08.216609	1
230	Boys - Live / Remastered	\N	2017-11-23 18:57:08.220299	2017-11-23 18:57:08.220299	1
231	A Hard Day's Night - Live / Remastered	\N	2017-11-23 18:57:08.223863	2017-11-23 18:57:08.223863	1
232	Help! - Live / Remastered	\N	2017-11-23 18:57:08.227126	2017-11-23 18:57:08.227126	1
233	All My Loving - Live / Remastered	\N	2017-11-23 18:57:08.230431	2017-11-23 18:57:08.230431	1
234	She Loves You - Live / Remastered	\N	2017-11-23 18:57:08.233018	2017-11-23 18:57:08.233018	1
235	Long Tall Sally - Live / Remastered	\N	2017-11-23 18:57:08.235653	2017-11-23 18:57:08.235653	1
236	You Can't Do That - Live / Bonus Track	\N	2017-11-23 18:57:08.238291	2017-11-23 18:57:08.238291	1
237	I Want To Hold Your Hand - Live / Bonus Track	\N	2017-11-23 18:57:08.240963	2017-11-23 18:57:08.240963	1
238	Everybody’s Trying To Be My Baby - Live / Bonus Track	\N	2017-11-23 18:57:08.243708	2017-11-23 18:57:08.243708	1
239	Baby's In Black - Live / Bonus Track	\N	2017-11-23 18:57:08.246355	2017-11-23 18:57:08.246355	1
240	Side 1, Pt. 1: Things Left Unsaid	\N	2017-11-23 18:57:19.103882	2017-11-23 18:57:19.103882	1
241	Side 1, Pt. 2: It's What We Do	\N	2017-11-23 18:57:19.108228	2017-11-23 18:57:19.108228	1
242	Side 1, Pt. 3: Ebb And Flow	\N	2017-11-23 18:57:19.112527	2017-11-23 18:57:19.112527	1
243	Side 2, Pt. 1: Sum	\N	2017-11-23 18:57:19.1163	2017-11-23 18:57:19.1163	1
244	Side 2, Pt. 2: Skins	\N	2017-11-23 18:57:19.119892	2017-11-23 18:57:19.119892	1
245	Side 2, Pt. 3: Unsung	\N	2017-11-23 18:57:19.12388	2017-11-23 18:57:19.12388	1
246	Side 2, Pt. 4: Anisina	\N	2017-11-23 18:57:19.128188	2017-11-23 18:57:19.128188	1
247	Side 3, Pt. 1: The Lost Art Of Conversation	\N	2017-11-23 18:57:19.132249	2017-11-23 18:57:19.132249	1
248	Side 3, Pt. 2: On Noodle Street	\N	2017-11-23 18:57:19.136438	2017-11-23 18:57:19.136438	1
249	Side 3, Pt. 3: Night Light	\N	2017-11-23 18:57:19.140437	2017-11-23 18:57:19.140437	1
250	Side 3, Pt. 4: Allons-y (1)	\N	2017-11-23 18:57:19.144317	2017-11-23 18:57:19.144317	1
251	Side 3, Pt. 5: Autumn '68	\N	2017-11-23 18:57:19.148256	2017-11-23 18:57:19.148256	1
252	Side 3, Pt. 6: Allons-y (2)	\N	2017-11-23 18:57:19.152095	2017-11-23 18:57:19.152095	1
253	Side 3, Pt. 7: Talkin' Hawkin'	\N	2017-11-23 18:57:19.156256	2017-11-23 18:57:19.156256	1
254	Side 4, Pt. 1: Calling	\N	2017-11-23 18:57:19.1604	2017-11-23 18:57:19.1604	1
255	Side 4, Pt. 2: Eyes To Pearls	\N	2017-11-23 18:57:19.164321	2017-11-23 18:57:19.164321	1
256	Side 4, Pt. 3: Surfacing	\N	2017-11-23 18:57:19.168107	2017-11-23 18:57:19.168107	1
257	Side 4, Pt. 4: Louder Than Words	\N	2017-11-23 18:57:19.172341	2017-11-23 18:57:19.172341	1
258	TBS9	\N	2017-11-23 18:57:19.176869	2017-11-23 18:57:19.176869	1
259	TBS14	\N	2017-11-23 18:57:19.181121	2017-11-23 18:57:19.181121	1
260	Nervana	\N	2017-11-23 18:57:19.185476	2017-11-23 18:57:19.185476	1
261	My Fairy King - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.065234	2017-11-23 18:57:30.065234	1
262	Keep Yourself Alive - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.06832	2017-11-23 18:57:30.06832	1
263	Doing All Right - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.070787	2017-11-23 18:57:30.070787	1
264	Liar - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.07347	2017-11-23 18:57:30.07347	1
265	See What A Fool I've Been - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.07615	2017-11-23 18:57:30.07615	1
266	Keep Yourself Alive - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.078997	2017-11-23 18:57:30.078997	1
267	Liar - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.081718	2017-11-23 18:57:30.081718	1
268	Son And Daughter - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.084531	2017-11-23 18:57:30.084531	1
269	Ogre Battle - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.087593	2017-11-23 18:57:30.087593	1
270	Modern Times Rock 'n' Roll - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.090556	2017-11-23 18:57:30.090556	1
271	Great King Rat - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.094368	2017-11-23 18:57:30.094368	1
272	Son And Daughter - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:57:30.098171	2017-11-23 18:57:30.098171	1
273	Modern Times Rock 'n' Roll - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:57:30.102699	2017-11-23 18:57:30.102699	1
274	Nevermore - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:57:30.107173	2017-11-23 18:57:30.107173	1
275	White Queen (As It Began) - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:57:30.111743	2017-11-23 18:57:30.111743	1
276	Now I'm Here - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.116322	2017-11-23 18:57:30.116322	1
277	Stone Cold Crazy - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.121701	2017-11-23 18:57:30.121701	1
278	Flick Of The Wrist - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.12651	2017-11-23 18:57:30.12651	1
279	Tenement Funster - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.13092	2017-11-23 18:57:30.13092	1
280	We Will Rock You - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.135475	2017-11-23 18:57:30.135475	1
281	We Will Rock You (Fast) - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.140119	2017-11-23 18:57:30.140119	1
282	Spread Your Wings - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.144783	2017-11-23 18:57:30.144783	1
283	It's Late - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.149046	2017-11-23 18:57:30.149046	1
284	My Melancholy Blues - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:57:30.153452	2017-11-23 18:57:30.153452	1
285	Rock or Bust	\N	2017-11-23 18:57:41.264481	2017-11-23 18:57:41.264481	1
286	Play Ball	\N	2017-11-23 18:57:41.26871	2017-11-23 18:57:41.26871	1
287	Rock the Blues Away	\N	2017-11-23 18:57:41.272694	2017-11-23 18:57:41.272694	1
288	Miss Adventure	\N	2017-11-23 18:57:41.276342	2017-11-23 18:57:41.276342	1
289	Dogs of War	\N	2017-11-23 18:57:41.280012	2017-11-23 18:57:41.280012	1
290	Got Some Rock & Roll Thunder	\N	2017-11-23 18:57:41.283191	2017-11-23 18:57:41.283191	1
291	Hard Times	\N	2017-11-23 18:57:41.286452	2017-11-23 18:57:41.286452	1
292	Baptism By Fire	\N	2017-11-23 18:57:41.289367	2017-11-23 18:57:41.289367	1
293	Rock the House	\N	2017-11-23 18:57:41.292377	2017-11-23 18:57:41.292377	1
294	Sweet Candy	\N	2017-11-23 18:57:41.29516	2017-11-23 18:57:41.29516	1
295	Emission Control	\N	2017-11-23 18:57:41.297929	2017-11-23 18:57:41.297929	1
296	Somebody's actiong like a child	\N	2017-11-23 18:58:12.455347	2017-11-23 18:58:12.455347	16
297	Wild about you	\N	2017-11-23 18:58:12.681088	2017-11-23 18:58:12.681088	16
298	The Bear	\N	2017-11-23 18:58:12.686744	2017-11-23 18:58:12.686744	16
299	Riding on the L & N	\N	2017-11-23 18:58:12.691775	2017-11-23 18:58:12.691775	16
300	Oh pretty woman	\N	2017-11-23 18:58:12.696319	2017-11-23 18:58:12.696319	16
301	Rolling with the Blues	\N	2017-11-23 18:58:12.700453	2017-11-23 18:58:12.700453	16
302	Room to move	\N	2017-11-23 18:58:12.704763	2017-11-23 18:58:12.704763	16
303	I ain't got you	\N	2017-11-23 18:58:12.708086	2017-11-23 18:58:12.708086	16
304	N.S.U.	\N	2017-11-23 18:58:23.999524	2017-11-23 18:58:23.999524	16
305	I Feel Free - Mono Version	\N	2017-11-23 18:58:24.003553	2017-11-23 18:58:24.003553	16
306	I'm So Glad - Stereo Mix	\N	2017-11-23 18:58:24.007792	2017-11-23 18:58:24.007792	16
307	Sunshine Of Your Love	\N	2017-11-23 18:58:24.011925	2017-11-23 18:58:24.011925	16
308	We're Going Wrong	\N	2017-11-23 18:58:24.015972	2017-11-23 18:58:24.015972	16
309	White Room	\N	2017-11-23 18:58:24.020423	2017-11-23 18:58:24.020423	16
310	Deserted Cities Of The Heart	\N	2017-11-23 18:58:24.025037	2017-11-23 18:58:24.025037	16
311	Doing That Scrapyard Thing	\N	2017-11-23 18:58:24.028829	2017-11-23 18:58:24.028829	16
312	Never Tell Your Mother She's Out Of Tune	\N	2017-11-23 18:58:24.032357	2017-11-23 18:58:24.032357	16
313	Rope Ladder To The Moon	\N	2017-11-23 18:58:24.036071	2017-11-23 18:58:24.036071	16
314	Theme For An Imaginary Western	\N	2017-11-23 18:58:24.039863	2017-11-23 18:58:24.039863	16
315	Weird Of Hermiston	\N	2017-11-23 18:58:24.043855	2017-11-23 18:58:24.043855	16
316	Folk Song	\N	2017-11-23 18:58:24.047793	2017-11-23 18:58:24.047793	16
317	Can You Follow	\N	2017-11-23 18:58:24.05146	2017-11-23 18:58:24.05146	16
318	Morning Story	\N	2017-11-23 18:58:24.055287	2017-11-23 18:58:24.055287	16
319	You Burned The Tables On Me	\N	2017-11-23 18:58:24.058996	2017-11-23 18:58:24.058996	16
320	Pieces Of Mind	\N	2017-11-23 18:58:24.062947	2017-11-23 18:58:24.062947	16
321	Running Through Our Hands	\N	2017-11-23 18:58:24.066749	2017-11-23 18:58:24.066749	16
322	Keep It Down	\N	2017-11-23 18:58:24.071323	2017-11-23 18:58:24.071323	16
323	Something To Live For	\N	2017-11-23 18:58:24.075395	2017-11-23 18:58:24.075395	16
324	Without A Word	\N	2017-11-23 18:58:24.078077	2017-11-23 18:58:24.078077	16
325	How's Tricks	\N	2017-11-23 18:58:24.080717	2017-11-23 18:58:24.080717	16
326	Childsong	\N	2017-11-23 18:58:24.083535	2017-11-23 18:58:24.083535	16
327	The Best Is Still To Come	\N	2017-11-23 18:58:24.086466	2017-11-23 18:58:24.086466	16
328	She's Moving On	\N	2017-11-23 18:58:24.089074	2017-11-23 18:58:24.089074	16
329	Jet Set Jewel	\N	2017-11-23 18:58:24.091754	2017-11-23 18:58:24.091754	16
330	Ships In The Night	\N	2017-11-23 18:58:24.094345	2017-11-23 18:58:24.094345	16
331	City Of Gold - Remastered 2002	\N	2017-11-23 18:58:24.0972	2017-11-23 18:58:24.0972	16
332	Waiting In The Wings - Remastered 2002	\N	2017-11-23 18:58:24.100581	2017-11-23 18:58:24.100581	16
333	Out Into The Fields	\N	2017-11-23 18:58:24.10381	2017-11-23 18:58:24.10381	16
334	The Night That Once Was Mine	\N	2017-11-23 18:58:24.106599	2017-11-23 18:58:24.106599	16
335	Candlelight	\N	2017-11-23 18:58:24.109476	2017-11-23 18:58:24.109476	16
336	Fields Of Forever	\N	2017-11-23 18:58:24.113205	2017-11-23 18:58:24.113205	16
337	Reach For The Night	\N	2017-11-23 18:58:24.117472	2017-11-23 18:58:24.117472	16
338	Don’t Look Now	\N	2017-11-23 18:58:24.121073	2017-11-23 18:58:24.121073	16
339	Got Me Under Pressure - Live from New York	\N	2017-11-23 18:58:35.048325	2017-11-23 18:58:35.048325	16
340	Beer Drinkers & Hell Raisers - Live from Las Vegas	\N	2017-11-23 18:58:35.052348	2017-11-23 18:58:35.052348	16
341	Cheap Sunglasses - Live from Paris	\N	2017-11-23 18:58:35.056907	2017-11-23 18:58:35.056907	16
342	Waitin For The Bus - Live from Nashville	\N	2017-11-23 18:58:35.061058	2017-11-23 18:58:35.061058	16
343	Jesus Just Left Chicago - Live from Nashville	\N	2017-11-23 18:58:35.064842	2017-11-23 18:58:35.064842	16
344	Legs - Live from Sao Paolo	\N	2017-11-23 18:58:35.067756	2017-11-23 18:58:35.067756	16
345	Sharp Dressed Man - Live from Los Angeles	\N	2017-11-23 18:58:35.071433	2017-11-23 18:58:35.071433	16
346	Rough Boy (feat. Jeff Beck) - Live from London	\N	2017-11-23 18:58:35.074969	2017-11-23 18:58:35.074969	16
347	Pincushion - Live from Berlin	\N	2017-11-23 18:58:35.07841	2017-11-23 18:58:35.07841	16
348	La Grange - Live from Dallas	\N	2017-11-23 18:58:35.081512	2017-11-23 18:58:35.081512	16
349	I'm Bad, I'm Nationwide - Live from Vancouver	\N	2017-11-23 18:58:35.084727	2017-11-23 18:58:35.084727	16
350	Tube Snake Boogie - Live from Rome	\N	2017-11-23 18:58:35.087845	2017-11-23 18:58:35.087845	16
351	Gimme All Your Lovin - Live from Houston	\N	2017-11-23 18:58:35.090696	2017-11-23 18:58:35.090696	16
352	Tush - Live from Chicago	\N	2017-11-23 18:58:35.093385	2017-11-23 18:58:35.093385	16
353	Sixteen Tons (feat. Jeff Beck) - Live from London	\N	2017-11-23 18:58:35.096137	2017-11-23 18:58:35.096137	16
354	Pegasus	\N	2017-11-23 18:58:46.217044	2017-11-23 18:58:46.217044	16
355	Can't Take It With You	\N	2017-11-23 18:58:46.220231	2017-11-23 18:58:46.220231	16
356	Crazy Love	\N	2017-11-23 18:58:46.222988	2017-11-23 18:58:46.222988	16
357	Win, Lose Or Draw	\N	2017-11-23 18:58:46.22622	2017-11-23 18:58:46.22622	16
358	Can't Lose What You Never Had - Live	\N	2017-11-23 18:58:46.230163	2017-11-23 18:58:46.230163	16
359	Jessica - Unedited Version	\N	2017-11-23 18:58:46.234796	2017-11-23 18:58:46.234796	16
360	Southbound	\N	2017-11-23 18:58:46.241243	2017-11-23 18:58:46.241243	16
361	Ramblin' Man	\N	2017-11-23 18:58:46.246821	2017-11-23 18:58:46.246821	16
362	Wasted Words	\N	2017-11-23 18:58:46.251343	2017-11-23 18:58:46.251343	16
363	Little Martha	\N	2017-11-23 18:58:46.256004	2017-11-23 18:58:46.256004	16
364	Blue Sky	\N	2017-11-23 18:58:46.260646	2017-11-23 18:58:46.260646	16
365	Stand Back	\N	2017-11-23 18:58:46.265096	2017-11-23 18:58:46.265096	16
366	Melissa	\N	2017-11-23 18:58:46.269274	2017-11-23 18:58:46.269274	16
367	Ain't Wastin Time No More	\N	2017-11-23 18:58:46.273187	2017-11-23 18:58:46.273187	16
368	One Way Out - Live At The Fillmore East/1971	\N	2017-11-23 18:58:46.277312	2017-11-23 18:58:46.277312	16
369	Hot 'Lanta - Live At The Fillmore East/1971	\N	2017-11-23 18:58:46.282246	2017-11-23 18:58:46.282246	16
370	Statesboro Blues - Live At The Fillmore East/1971	\N	2017-11-23 18:58:46.287267	2017-11-23 18:58:46.287267	16
371	Hoochie Coochie Man	\N	2017-11-23 18:58:46.292059	2017-11-23 18:58:46.292059	16
372	Don't Keep Me Wonderin'	\N	2017-11-23 18:58:46.296818	2017-11-23 18:58:46.296818	16
373	Midnight Rider	\N	2017-11-23 18:58:46.301687	2017-11-23 18:58:46.301687	16
374	Revival	\N	2017-11-23 18:58:46.306093	2017-11-23 18:58:46.306093	16
375	Whipping Post	\N	2017-11-23 18:58:46.310736	2017-11-23 18:58:46.310736	16
376	Black Hearted Woman	\N	2017-11-23 18:58:46.315834	2017-11-23 18:58:46.315834	16
377	Don't Want You No More	\N	2017-11-23 18:58:46.32045	2017-11-23 18:58:46.32045	16
378	It's Not My Cross To Bear	\N	2017-11-23 18:58:46.325031	2017-11-23 18:58:46.325031	16
379	Dreams	\N	2017-11-23 18:58:46.329299	2017-11-23 18:58:46.329299	16
380	Trouble No More - Live At The Fillmore East/1971	\N	2017-11-23 18:58:46.333712	2017-11-23 18:58:46.333712	16
381	Come And Go Blues - Live At Watkins Glen/1973	\N	2017-11-23 18:58:46.33885	2017-11-23 18:58:46.33885	16
382	Zoot Suit	\N	2017-11-23 18:58:58.11705	2017-11-23 18:58:58.11705	16
383	I'm The Face	\N	2017-11-23 18:58:58.120126	2017-11-23 18:58:58.120126	16
384	I Can't Explain - Mono Version	\N	2017-11-23 18:58:58.122571	2017-11-23 18:58:58.122571	16
385	Bald Headed Woman - Mono Version	\N	2017-11-23 18:58:58.125178	2017-11-23 18:58:58.125178	16
386	Anyway, Anyhow, Anywhere - Mono Version	\N	2017-11-23 18:58:58.128156	2017-11-23 18:58:58.128156	16
387	Daddy Rolling Stone - Mono Version	\N	2017-11-23 18:58:58.131763	2017-11-23 18:58:58.131763	16
388	My Generation - Mono Version	\N	2017-11-23 18:58:58.138529	2017-11-23 18:58:58.138529	16
389	Shout And Shimmy	\N	2017-11-23 18:58:58.141462	2017-11-23 18:58:58.141462	16
390	Circles - Revised Mono Version	\N	2017-11-23 18:58:58.144369	2017-11-23 18:58:58.144369	16
391	Instant Party Mixture - Mono Version	\N	2017-11-23 18:58:58.147643	2017-11-23 18:58:58.147643	16
392	A Legal Matter - Mono Version	\N	2017-11-23 18:58:58.150321	2017-11-23 18:58:58.150321	16
393	The Kids Are Alright - Mono Version	\N	2017-11-23 18:58:58.152976	2017-11-23 18:58:58.152976	16
394	The Ox - Mono Version	\N	2017-11-23 18:58:58.155345	2017-11-23 18:58:58.155345	16
395	La-La-La-Lies - Mono Version	\N	2017-11-23 18:58:58.157556	2017-11-23 18:58:58.157556	16
396	The Good's Gone - Mono Version	\N	2017-11-23 18:58:58.159864	2017-11-23 18:58:58.159864	16
397	Substitute - Single Version	\N	2017-11-23 18:58:58.162296	2017-11-23 18:58:58.162296	16
398	Circles - Revised Second Mono Version	\N	2017-11-23 18:58:58.165566	2017-11-23 18:58:58.165566	16
399	Waltz For A Pig	\N	2017-11-23 18:58:58.168717	2017-11-23 18:58:58.168717	16
400	I'm A Boy - Mono Version	\N	2017-11-23 18:58:58.1717	2017-11-23 18:58:58.1717	16
401	In The City - Mono Version	\N	2017-11-23 18:58:58.174817	2017-11-23 18:58:58.174817	16
402	Disguises - Mono Version	\N	2017-11-23 18:58:58.177439	2017-11-23 18:58:58.177439	16
403	Batman - Mono Version	\N	2017-11-23 18:58:58.180976	2017-11-23 18:58:58.180976	16
404	Bucket T - Mono Version	\N	2017-11-23 18:58:58.184653	2017-11-23 18:58:58.184653	16
405	Barbara Ann - Mono Version	\N	2017-11-23 18:58:58.188307	2017-11-23 18:58:58.188307	16
406	Happy Jack - Single Version	\N	2017-11-23 18:58:58.191887	2017-11-23 18:58:58.191887	16
407	I've Been Away - Mono Version	\N	2017-11-23 18:58:58.195564	2017-11-23 18:58:58.195564	16
408	Pictures Of Lily	\N	2017-11-23 18:58:58.199502	2017-11-23 18:58:58.199502	16
409	Doctor, Doctor - Mono Version	\N	2017-11-23 18:58:58.203888	2017-11-23 18:58:58.203888	16
410	The Last Time	\N	2017-11-23 18:58:58.207959	2017-11-23 18:58:58.207959	16
411	Under My Thumb	\N	2017-11-23 18:58:58.212195	2017-11-23 18:58:58.212195	16
412	I Can See For Miles - Mono Version	\N	2017-11-23 18:58:58.216172	2017-11-23 18:58:58.216172	16
413	Someone's Coming	\N	2017-11-23 18:58:58.220136	2017-11-23 18:58:58.220136	16
414	Dogs	\N	2017-11-23 18:58:58.22423	2017-11-23 18:58:58.22423	16
415	Call Me Lightning	\N	2017-11-23 18:58:58.228361	2017-11-23 18:58:58.228361	16
416	Magic Bus - Edit Mono Version	\N	2017-11-23 18:58:58.232232	2017-11-23 18:58:58.232232	16
417	Dr Jekyll & Mr Hyde	\N	2017-11-23 18:58:58.236201	2017-11-23 18:58:58.236201	16
418	Pinball Wizard	\N	2017-11-23 18:58:58.240104	2017-11-23 18:58:58.240104	16
419	Dogs Part Two	\N	2017-11-23 18:58:58.243849	2017-11-23 18:58:58.243849	16
420	The Seeker - Edit	\N	2017-11-23 18:58:58.24755	2017-11-23 18:58:58.24755	16
421	Here For More	\N	2017-11-23 18:58:58.251162	2017-11-23 18:58:58.251162	16
422	Summertime Blues - Live At Leeds	\N	2017-11-23 18:58:58.25486	2017-11-23 18:58:58.25486	16
423	Heaven And Hell - Mono Version	\N	2017-11-23 18:58:58.258857	2017-11-23 18:58:58.258857	16
424	See Me, Feel Me - Single Version	\N	2017-11-23 18:58:58.262759	2017-11-23 18:58:58.262759	16
425	Overture	\N	2017-11-23 18:58:58.266288	2017-11-23 18:58:58.266288	16
426	Christmas - Edit	\N	2017-11-23 18:58:58.270249	2017-11-23 18:58:58.270249	16
427	I'm Free	\N	2017-11-23 18:58:58.274222	2017-11-23 18:58:58.274222	16
428	Won't Get Fooled Again - Single Version	\N	2017-11-23 18:58:58.278158	2017-11-23 18:58:58.278158	16
429	Don't Know Myself	\N	2017-11-23 18:58:58.282758	2017-11-23 18:58:58.282758	16
430	Let's See Action	\N	2017-11-23 18:58:58.288045	2017-11-23 18:58:58.288045	16
431	When I Was A Boy	\N	2017-11-23 18:58:58.292946	2017-11-23 18:58:58.292946	16
432	Somewhere Now	\N	2017-11-23 18:59:29.2766	2017-11-23 18:59:29.2766	22
433	Bang Bang	\N	2017-11-23 18:59:29.281265	2017-11-23 18:59:29.281265	22
434	Revolution Radio	\N	2017-11-23 18:59:29.286034	2017-11-23 18:59:29.286034	22
435	Say Goodbye	\N	2017-11-23 18:59:29.290745	2017-11-23 18:59:29.290745	22
436	Outlaws	\N	2017-11-23 18:59:29.298732	2017-11-23 18:59:29.298732	22
437	Bouncing Off the Wall	\N	2017-11-23 18:59:29.304427	2017-11-23 18:59:29.304427	22
438	Still Breathing	\N	2017-11-23 18:59:29.309083	2017-11-23 18:59:29.309083	22
439	Youngblood	\N	2017-11-23 18:59:29.313901	2017-11-23 18:59:29.313901	22
440	Too Dumb to Die	\N	2017-11-23 18:59:29.319227	2017-11-23 18:59:29.319227	22
441	Troubled Times	\N	2017-11-23 18:59:29.32426	2017-11-23 18:59:29.32426	22
442	Forever Now	\N	2017-11-23 18:59:29.328597	2017-11-23 18:59:29.328597	22
443	Ordinary World	\N	2017-11-23 18:59:29.33274	2017-11-23 18:59:29.33274	22
444	California Über Alles	\N	2017-11-23 18:59:41.113908	2017-11-23 18:59:41.113908	22
445	Police Truck	\N	2017-11-23 18:59:41.11782	2017-11-23 18:59:41.11782	22
446	Kill The Poor	\N	2017-11-23 18:59:41.121467	2017-11-23 18:59:41.121467	22
447	Holiday In Cambodia	\N	2017-11-23 18:59:41.126252	2017-11-23 18:59:41.126252	22
448	Nazi Punks Fuck Off	\N	2017-11-23 18:59:41.130748	2017-11-23 18:59:41.130748	22
449	Too Drunk To Fuck	\N	2017-11-23 18:59:41.134859	2017-11-23 18:59:41.134859	22
450	Viva Las Vegas	\N	2017-11-23 18:59:41.139116	2017-11-23 18:59:41.139116	22
451	Moon Over Marin	\N	2017-11-23 18:59:41.143183	2017-11-23 18:59:41.143183	22
452	Halloween	\N	2017-11-23 18:59:41.147279	2017-11-23 18:59:41.147279	22
453	MTV Get Off The Air	\N	2017-11-23 18:59:41.151649	2017-11-23 18:59:41.151649	22
454	Soup Is Good Food (Live)	\N	2017-11-23 18:59:41.156364	2017-11-23 18:59:41.156364	22
455	Jock-O-Rama (Live)	\N	2017-11-23 18:59:41.160396	2017-11-23 18:59:41.160396	22
456	Kosmo Vinyl Introduction - Live at Shea Stadium	\N	2017-11-23 18:59:52.056779	2017-11-23 18:59:52.056779	22
457	London Calling - Live at Shea Stadium	\N	2017-11-23 18:59:52.060831	2017-11-23 18:59:52.060831	22
458	Police on my Back - Live at Shea Stadium	\N	2017-11-23 18:59:52.064541	2017-11-23 18:59:52.064541	22
459	The Guns of Brixton - Live at Shea Stadium	\N	2017-11-23 18:59:52.067915	2017-11-23 18:59:52.067915	22
460	Tommy Gun - Live at Shea Stadium	\N	2017-11-23 18:59:52.071143	2017-11-23 18:59:52.071143	22
461	The Magnificent Seven - Live at Shea Stadium	\N	2017-11-23 18:59:52.074353	2017-11-23 18:59:52.074353	22
462	Armagideon Time - Live at Shea Stadium	\N	2017-11-23 18:59:52.077128	2017-11-23 18:59:52.077128	22
463	Magnificent Seven (Return) - Live at Shea Stadium	\N	2017-11-23 18:59:52.080261	2017-11-23 18:59:52.080261	22
464	Rock the Casbah - Live at Shea Stadium	\N	2017-11-23 18:59:52.084408	2017-11-23 18:59:52.084408	22
465	Train in Vain - Live at Shea Stadium	\N	2017-11-23 18:59:52.086958	2017-11-23 18:59:52.086958	22
466	Career Opportunities - Live at Shea Stadium	\N	2017-11-23 18:59:52.089324	2017-11-23 18:59:52.089324	22
467	Spanish Bombs - Live at Shea Stadium	\N	2017-11-23 18:59:52.092563	2017-11-23 18:59:52.092563	22
468	Clampdown - Live at Shea Stadium	\N	2017-11-23 18:59:52.096129	2017-11-23 18:59:52.096129	22
469	English Civil War - Live at Shea Stadium	\N	2017-11-23 18:59:52.099355	2017-11-23 18:59:52.099355	22
470	Should I Stay or Should I Go - Live at Shea Stadium	\N	2017-11-23 18:59:52.102716	2017-11-23 18:59:52.102716	22
471	I Fought the Law - Live at Shea Stadium	\N	2017-11-23 18:59:52.105522	2017-11-23 18:59:52.105522	22
472	The Devil's Rain	\N	2017-11-23 19:00:03.591026	2017-11-23 19:00:03.591026	22
473	Vivid Red	\N	2017-11-23 19:00:03.594992	2017-11-23 19:00:03.594992	22
474	Land of the Dead	\N	2017-11-23 19:00:03.59921	2017-11-23 19:00:03.59921	22
475	Curse of the Mummy's Hand	\N	2017-11-23 19:00:03.603863	2017-11-23 19:00:03.603863	22
476	Cold Day In Hell	\N	2017-11-23 19:00:03.60887	2017-11-23 19:00:03.60887	22
477	Dark Shadows	\N	2017-11-23 19:00:03.613464	2017-11-23 19:00:03.613464	22
478	Death Ray	\N	2017-11-23 19:00:03.617644	2017-11-23 19:00:03.617644	22
479	Shining	\N	2017-11-23 19:00:03.621801	2017-11-23 19:00:03.621801	22
480	American Psycho	\N	2017-11-23 19:00:03.626707	2017-11-23 19:00:03.626707	22
481	Dig Up Her Bones	\N	2017-11-23 19:00:03.63128	2017-11-23 19:00:03.63128	22
482	Scream!	\N	2017-11-23 19:00:03.635859	2017-11-23 19:00:03.635859	22
483	Helena	\N	2017-11-23 19:00:03.640554	2017-11-23 19:00:03.640554	22
484	Science Fiction/Double Feature	\N	2017-11-23 19:00:03.645326	2017-11-23 19:00:03.645326	22
485	Saturday Night	\N	2017-11-23 19:00:03.65012	2017-11-23 19:00:03.65012	22
486	Hark! The Herald Angels Sing	\N	2017-11-23 19:00:15.161545	2017-11-23 19:00:15.161545	22
487	O Come All Ye Faithful	\N	2017-11-23 19:00:15.164497	2017-11-23 19:00:15.164497	22
488	O Come, O Come Emmanuel	\N	2017-11-23 19:00:15.167136	2017-11-23 19:00:15.167136	22
489	White Christmas	\N	2017-11-23 19:00:15.170831	2017-11-23 19:00:15.170831	22
490	Little Drummer Boy	\N	2017-11-23 19:00:15.173884	2017-11-23 19:00:15.173884	22
491	God Rest Ye Merry Gentlemen	\N	2017-11-23 19:00:15.176522	2017-11-23 19:00:15.176522	22
492	What Child Is This?	\N	2017-11-23 19:00:15.179128	2017-11-23 19:00:15.179128	22
493	Angels We Have Heard On High	\N	2017-11-23 19:00:15.181809	2017-11-23 19:00:15.181809	22
494	American Jesus - Andy Wallace Mix	\N	2017-11-23 19:00:15.185242	2017-11-23 19:00:15.185242	22
495	Lonesome Valley	\N	2017-11-23 19:00:33.142313	2017-11-23 19:00:33.142313	11
496	The Poor Orphan Child	\N	2017-11-23 19:00:33.146353	2017-11-23 19:00:33.146353	11
497	Bury Me Under the Weeping Willow	\N	2017-11-23 19:00:33.150691	2017-11-23 19:00:33.150691	11
498	The Wandering Boy	\N	2017-11-23 19:00:33.15443	2017-11-23 19:00:33.15443	11
499	Wildwood Flower	\N	2017-11-23 19:00:33.157452	2017-11-23 19:00:33.157452	11
500	The Foggy Mountain Top	\N	2017-11-23 19:00:33.160525	2017-11-23 19:00:33.160525	11
501	The Cannon-Ball	\N	2017-11-23 19:00:33.163965	2017-11-23 19:00:33.163965	11
502	Worried Man Blues	\N	2017-11-23 19:00:33.167239	2017-11-23 19:00:33.167239	11
503	Engine One-Forty-Three	\N	2017-11-23 19:00:33.170253	2017-11-23 19:00:33.170253	11
504	Keep On the Sunny Side	\N	2017-11-23 19:00:33.172811	2017-11-23 19:00:33.172811	11
505	Sweet Fern	\N	2017-11-23 19:00:33.175235	2017-11-23 19:00:33.175235	11
506	John Hardy Was a Desperate Little Man	\N	2017-11-23 19:00:33.177634	2017-11-23 19:00:33.177634	11
507	Anchored in Love	\N	2017-11-23 19:00:33.180231	2017-11-23 19:00:33.180231	11
508	I Will Never Marry	\N	2017-11-23 19:00:33.182726	2017-11-23 19:00:33.182726	11
509	When the World's On Fire	\N	2017-11-23 19:00:33.185367	2017-11-23 19:00:33.185367	11
510	Blue Moon Of Kentucky	\N	2017-11-23 19:00:44.071596	2017-11-23 19:00:44.071596	11
511	Cheyenne	\N	2017-11-23 19:00:44.074879	2017-11-23 19:00:44.074879	11
512	Footprints in the Snow	\N	2017-11-23 19:00:44.07807	2017-11-23 19:00:44.07807	11
513	Raw Hide	\N	2017-11-23 19:00:44.081085	2017-11-23 19:00:44.081085	11
514	Little Cabin On The Hill	\N	2017-11-23 19:00:44.084212	2017-11-23 19:00:44.084212	11
515	Mule Skinner Blues	\N	2017-11-23 19:00:44.087111	2017-11-23 19:00:44.087111	11
516	Wait a Little Longer Please Jesus	\N	2017-11-23 19:00:44.089719	2017-11-23 19:00:44.089719	11
517	Alabama Waltz	\N	2017-11-23 19:00:44.092294	2017-11-23 19:00:44.092294	11
518	In The Pines	\N	2017-11-23 19:00:44.094851	2017-11-23 19:00:44.094851	11
519	Panhandle Country	\N	2017-11-23 19:00:44.097464	2017-11-23 19:00:44.097464	11
520	Im Working on a Building	\N	2017-11-23 19:00:44.100157	2017-11-23 19:00:44.100157	11
521	When the Cactus Is in Bloom	\N	2017-11-23 19:00:44.102855	2017-11-23 19:00:44.102855	11
522	Blue Moon of Kentucky - Alternate Version	\N	2017-11-23 19:00:44.105933	2017-11-23 19:00:44.105933	11
523	Brakemans Blues	\N	2017-11-23 19:00:44.108872	2017-11-23 19:00:44.108872	11
524	I Hope You Have Learned	\N	2017-11-23 19:00:44.111256	2017-11-23 19:00:44.111256	11
525	My Little Georgia Rose	\N	2017-11-23 19:00:44.114858	2017-11-23 19:00:44.114858	11
526	New Mule Skinner Blues	\N	2017-11-23 19:00:44.118479	2017-11-23 19:00:44.118479	11
527	Molly and Tenbrooks	\N	2017-11-23 19:00:44.122075	2017-11-23 19:00:44.122075	11
528	On And On	\N	2017-11-23 19:00:44.125544	2017-11-23 19:00:44.125544	11
529	Kentucky Waltz	\N	2017-11-23 19:00:44.1294	2017-11-23 19:00:44.1294	11
530	Pike County Breakdown	\N	2017-11-23 19:00:44.133756	2017-11-23 19:00:44.133756	11
531	Roanoke	\N	2017-11-23 19:00:44.137724	2017-11-23 19:00:44.137724	11
532	Rocky Road Blues	\N	2017-11-23 19:00:44.141449	2017-11-23 19:00:44.141449	11
533	Uncle Pen	\N	2017-11-23 19:00:44.145353	2017-11-23 19:00:44.145353	11
534	Im Blue Im Lonesome	\N	2017-11-23 19:00:44.150001	2017-11-23 19:00:44.150001	11
535	Get up John	\N	2017-11-23 19:00:44.155114	2017-11-23 19:00:44.155114	11
536	Memories of Mother and Dad	\N	2017-11-23 19:00:44.159631	2017-11-23 19:00:44.159631	11
537	Ain't Santa Cool	\N	2017-11-23 19:00:55.339546	2017-11-23 19:00:55.339546	11
538	Go Tell It On The Mountain	\N	2017-11-23 19:00:55.343626	2017-11-23 19:00:55.343626	11
539	Silent Night	\N	2017-11-23 19:00:55.347484	2017-11-23 19:00:55.347484	11
540	Why Can't Christmas Day Last All Year Long	\N	2017-11-23 19:00:55.350999	2017-11-23 19:00:55.350999	11
541	Away In A Manger	\N	2017-11-23 19:00:55.354342	2017-11-23 19:00:55.354342	11
542	Christmas Joy	\N	2017-11-23 19:00:55.357157	2017-11-23 19:00:55.357157	11
543	First Christmas Without Daddy	\N	2017-11-23 19:00:55.359817	2017-11-23 19:00:55.359817	11
544	Winter Wonderland	\N	2017-11-23 19:00:55.363779	2017-11-23 19:00:55.363779	11
545	Greatest Gift	\N	2017-11-23 19:00:55.367714	2017-11-23 19:00:55.367714	11
546	Jingle Bells	\N	2017-11-23 19:00:55.371674	2017-11-23 19:00:55.371674	11
547	Remember Me	\N	2017-11-23 19:00:55.375457	2017-11-23 19:00:55.375457	11
548	(I Wanna) Rock N Roll Guitar	\N	2017-11-23 19:00:55.379196	2017-11-23 19:00:55.379196	11
549	Christmas In Dixie - Unplugged	\N	2017-11-23 19:00:55.383219	2017-11-23 19:00:55.383219	11
550	Sure Could Use Some Christmas Around Here	\N	2017-11-23 19:00:55.387199	2017-11-23 19:00:55.387199	11
551	Auld Lang Syne	\N	2017-11-23 19:00:55.391496	2017-11-23 19:00:55.391496	11
552	The Friendly Beasts	\N	2017-11-23 19:01:07.006058	2017-11-23 19:01:07.006058	11
553	Silent Night	\N	2017-11-23 19:01:07.010123	2017-11-23 19:01:07.010123	11
554	Hark! the Herald Angels Sing	\N	2017-11-23 19:01:07.014265	2017-11-23 19:01:07.014265	11
555	Good Christian Men, Rejoice	\N	2017-11-23 19:01:07.01873	2017-11-23 19:01:07.01873	11
556	Deck the Halls	\N	2017-11-23 19:01:07.02341	2017-11-23 19:01:07.02341	11
557	While Shepherds Watched Their Flocks	\N	2017-11-23 19:01:07.027943	2017-11-23 19:01:07.027943	11
558	Away in a Manger	\N	2017-11-23 19:01:07.032567	2017-11-23 19:01:07.032567	11
559	O Little Town of Bethlehem	\N	2017-11-23 19:01:07.037716	2017-11-23 19:01:07.037716	11
560	Joy to the World	\N	2017-11-23 19:01:07.042367	2017-11-23 19:01:07.042367	11
561	It Came Upon a Midnight Clear	\N	2017-11-23 19:01:07.046657	2017-11-23 19:01:07.046657	11
562	O Come All Ye Faithful	\N	2017-11-23 19:01:07.050854	2017-11-23 19:01:07.050854	11
563	The First Noel	\N	2017-11-23 19:01:07.055466	2017-11-23 19:01:07.055466	11
564	Sweet Louisiana - Live	\N	2017-11-23 19:01:18.32737	2017-11-23 19:01:18.32737	11
565	Long Haired Country Boy - Live	\N	2017-11-23 19:01:18.330197	2017-11-23 19:01:18.330197	11
566	Trudy - Live	\N	2017-11-23 19:01:18.333032	2017-11-23 19:01:18.333032	11
567	Cumberland Mountain Number Nine - Live	\N	2017-11-23 19:01:18.336798	2017-11-23 19:01:18.336798	11
568	The South's Gonna Do It - Live	\N	2017-11-23 19:01:18.34048	2017-11-23 19:01:18.34048	11
569	Statesboro Blues - Live	\N	2017-11-23 19:01:18.343972	2017-11-23 19:01:18.343972	11
570	Street Corner Serenade - Live	\N	2017-11-23 19:01:18.347228	2017-11-23 19:01:18.347228	11
571	You and Me - Live	\N	2017-11-23 19:01:18.349911	2017-11-23 19:01:18.349911	11
572	Good Hearted Woman - Live	\N	2017-11-23 19:01:18.353021	2017-11-23 19:01:18.353021	11
573	Blues Medley - Live	\N	2017-11-23 19:01:18.35589	2017-11-23 19:01:18.35589	11
574	Will the Circle Be Unbroken - Live	\N	2017-11-23 19:01:18.360024	2017-11-23 19:01:18.360024	11
575	Sang Her Love Songs - Live	\N	2017-11-23 19:01:18.363979	2017-11-23 19:01:18.363979	11
576	Can't You See - Live	\N	2017-11-23 19:01:18.367624	2017-11-23 19:01:18.367624	11
577	Tennessee Waltz - Live	\N	2017-11-23 19:01:18.371139	2017-11-23 19:01:18.371139	11
578	Wu-Tang The Saga Continues Intro (feat. RZA)	\N	2017-11-23 19:03:19.397263	2017-11-23 19:03:19.397263	2
579	Lesson Learn'd (feat. Inspectah Deck and Redman)	\N	2017-11-23 19:03:19.401317	2017-11-23 19:03:19.401317	2
580	Fast and Furious (feat. Hue Hef and Raekwon)	\N	2017-11-23 19:03:19.403825	2017-11-23 19:03:19.403825	2
581	Famous Fighters (Skit)	\N	2017-11-23 19:03:19.406162	2017-11-23 19:03:19.406162	2
582	If Time Is Money (Fly Navigation) [feat. Method Man]	\N	2017-11-23 19:03:19.409314	2017-11-23 19:03:19.409314	2
583	Frozen (feat. Method Man, Killa Priest and Chris Rivers)	\N	2017-11-23 19:03:19.412146	2017-11-23 19:03:19.412146	2
584	Berto and the Fiend (Skit) [feat. Ghostface Killa]	\N	2017-11-23 19:03:19.415234	2017-11-23 19:03:19.415234	2
585	Pearl Harbor (feat. Ghostface Killah, Method Man, RZA and Sean Price)	\N	2017-11-23 19:03:19.419629	2017-11-23 19:03:19.419629	2
586	People Say (feat. Redman)	\N	2017-11-23 19:03:19.423716	2017-11-23 19:03:19.423716	2
587	Family (Skit)	\N	2017-11-23 19:03:19.427563	2017-11-23 19:03:19.427563	2
588	Why Why Why (feat. RZA and Swnkah)	\N	2017-11-23 19:03:19.431604	2017-11-23 19:03:19.431604	2
589	G'd up (feat. Method Man, R-Mean and Mzee Jones)	\N	2017-11-23 19:03:19.43552	2017-11-23 19:03:19.43552	2
590	If What You Say Is True (feat. Streetlife)	\N	2017-11-23 19:03:19.439517	2017-11-23 19:03:19.439517	2
591	Saga (Skit) [feat. RZA	\N	2017-11-23 19:03:19.443658	2017-11-23 19:03:19.443658	2
592	Hood Go Bang! (feat. Redman and Method Man)	\N	2017-11-23 19:03:19.447411	2017-11-23 19:03:19.447411	2
593	My Only One (feat. Ghostface Killah, RZA, Cappadonna, and Steven Latorre)	\N	2017-11-23 19:03:19.451168	2017-11-23 19:03:19.451168	2
594	Message	\N	2017-11-23 19:03:19.454904	2017-11-23 19:03:19.454904	2
595	The Saga Continues Outro (feat. RZA)	\N	2017-11-23 19:03:19.458855	2017-11-23 19:03:19.458855	2
596	Prelude	\N	2017-11-23 19:03:31.227087	2017-11-23 19:03:31.227087	2
597	Real Niggaz Don't Die	\N	2017-11-23 19:03:31.233182	2017-11-23 19:03:31.233182	2
598	Niggaz 4 Life	\N	2017-11-23 19:03:31.237663	2017-11-23 19:03:31.237663	2
599	Protest - Interlude	\N	2017-11-23 19:03:31.24169	2017-11-23 19:03:31.24169	2
600	Appetite For Destruction	\N	2017-11-23 19:03:31.246651	2017-11-23 19:03:31.246651	2
601	Don't Drink That Wine - Interlude	\N	2017-11-23 19:03:31.251234	2017-11-23 19:03:31.251234	2
602	Alwayz Into Somethin'	\N	2017-11-23 19:03:31.25565	2017-11-23 19:03:31.25565	2
603	Message To B.A. - Interlude	\N	2017-11-23 19:03:31.260125	2017-11-23 19:03:31.260125	2
604	Real Niggaz	\N	2017-11-23 19:03:31.264858	2017-11-23 19:03:31.264858	2
605	To Kill A Hooker - Interlude	\N	2017-11-23 19:03:31.269446	2017-11-23 19:03:31.269446	2
606	One Less Bitch	\N	2017-11-23 19:03:31.274231	2017-11-23 19:03:31.274231	2
607	Findum, Fuckum And Flee	\N	2017-11-23 19:03:31.278712	2017-11-23 19:03:31.278712	2
608	Automobile	\N	2017-11-23 19:03:31.283398	2017-11-23 19:03:31.283398	2
609	She Swallowed It	\N	2017-11-23 19:03:31.288028	2017-11-23 19:03:31.288028	2
610	I'd Rather Fuck You	\N	2017-11-23 19:03:31.292299	2017-11-23 19:03:31.292299	2
611	Approach To Danger	\N	2017-11-23 19:03:31.296642	2017-11-23 19:03:31.296642	2
612	1-900-2-COMPTON - Interlude	\N	2017-11-23 19:03:31.301202	2017-11-23 19:03:31.301202	2
613	The Dayz Of Wayback	\N	2017-11-23 19:03:31.305624	2017-11-23 19:03:31.305624	2
614	Intro	\N	2017-11-23 19:03:43.160237	2017-11-23 19:03:43.160237	2
615	It's Like That	\N	2017-11-23 19:03:43.163907	2017-11-23 19:03:43.163907	2
616	It's Tricky	\N	2017-11-23 19:03:43.167375	2017-11-23 19:03:43.167375	2
617	Medley - Rock Box / Sucker MC's / Freestyle / Here We Go / Beats To The Rhyme	\N	2017-11-23 19:03:43.170104	2017-11-23 19:03:43.170104	2
618	King Of Rock	\N	2017-11-23 19:03:43.172888	2017-11-23 19:03:43.172888	2
619	Interlude	\N	2017-11-23 19:03:43.175611	2017-11-23 19:03:43.175611	2
620	Mary Mary	\N	2017-11-23 19:03:43.178501	2017-11-23 19:03:43.178501	2
621	Walk This Way	\N	2017-11-23 19:03:43.181425	2017-11-23 19:03:43.181425	2
622	School Of Old	\N	2017-11-23 19:03:43.184713	2017-11-23 19:03:43.184713	2
623	It's Over	\N	2017-11-23 19:03:43.187682	2017-11-23 19:03:43.187682	2
624	Run's Freestyle	\N	2017-11-23 19:03:43.19059	2017-11-23 19:03:43.19059	2
625	Peter Piper	\N	2017-11-23 19:03:43.193493	2017-11-23 19:03:43.193493	2
626	Down With The King	\N	2017-11-23 19:03:43.196481	2017-11-23 19:03:43.196481	2
627	The Space Program	\N	2017-11-23 19:03:55.022952	2017-11-23 19:03:55.022952	2
628	We The People....	\N	2017-11-23 19:03:55.02574	2017-11-23 19:03:55.02574	2
629	Whateva Will Be	\N	2017-11-23 19:03:55.028427	2017-11-23 19:03:55.028427	2
630	Solid Wall of Sound	\N	2017-11-23 19:03:55.030982	2017-11-23 19:03:55.030982	2
631	Dis Generation	\N	2017-11-23 19:03:55.034088	2017-11-23 19:03:55.034088	2
632	Kids...	\N	2017-11-23 19:03:55.036902	2017-11-23 19:03:55.036902	2
633	Melatonin	\N	2017-11-23 19:03:55.039668	2017-11-23 19:03:55.039668	2
634	Enough!!	\N	2017-11-23 19:03:55.04247	2017-11-23 19:03:55.04247	2
635	Mobius	\N	2017-11-23 19:03:55.045222	2017-11-23 19:03:55.045222	2
636	Black Spasmodic	\N	2017-11-23 19:03:55.048277	2017-11-23 19:03:55.048277	2
637	The Killing Season	\N	2017-11-23 19:03:55.051773	2017-11-23 19:03:55.051773	2
638	Lost Somebody	\N	2017-11-23 19:03:55.05485	2017-11-23 19:03:55.05485	2
639	Movin Backwards	\N	2017-11-23 19:03:55.057735	2017-11-23 19:03:55.057735	2
640	Conrad Tokyo	\N	2017-11-23 19:03:55.060594	2017-11-23 19:03:55.060594	2
641	Ego	\N	2017-11-23 19:03:55.063456	2017-11-23 19:03:55.063456	2
642	The Donald	\N	2017-11-23 19:03:55.066552	2017-11-23 19:03:55.066552	2
643	Intro - Live	\N	2017-11-23 19:04:06.167967	2017-11-23 19:04:06.167967	2
644	Lost At Birth - Live	\N	2017-11-23 19:04:06.170699	2017-11-23 19:04:06.170699	2
645	Miuzi Weighs A Ton - Live	\N	2017-11-23 19:04:06.173204	2017-11-23 19:04:06.173204	2
646	Get Up Stand Up - Live	\N	2017-11-23 19:04:06.17596	2017-11-23 19:04:06.17596	2
647	Rebel Without A Pause - Live	\N	2017-11-23 19:04:06.179415	2017-11-23 19:04:06.179415	2
648	911 Is A Joke - Live	\N	2017-11-23 19:04:06.182661	2017-11-23 19:04:06.182661	2
649	Welcome To The Terrordome - Live	\N	2017-11-23 19:04:06.185661	2017-11-23 19:04:06.185661	2
650	Hoovermusic - Live	\N	2017-11-23 19:04:06.189035	2017-11-23 19:04:06.189035	2
651	Black Steel In The Hour / Do You Wanna Go Our Way - Live	\N	2017-11-23 19:04:06.19171	2017-11-23 19:04:06.19171	2
652	Show 'Em Whatcha Got - Live	\N	2017-11-23 19:04:06.19411	2017-11-23 19:04:06.19411	2
653	Bring The Noise - Live	\N	2017-11-23 19:04:06.196501	2017-11-23 19:04:06.196501	2
654	Don't Believe The Hype - Live	\N	2017-11-23 19:04:06.19996	2017-11-23 19:04:06.19996	2
655	Can't Truss It - Live	\N	2017-11-23 19:04:06.203897	2017-11-23 19:04:06.203897	2
656	He Got Game - Live	\N	2017-11-23 19:04:06.207824	2017-11-23 19:04:06.207824	2
657	Night Of The Living Baseheads - Live	\N	2017-11-23 19:04:06.211568	2017-11-23 19:04:06.211568	2
658	I Shall Not Be Moved - Live	\N	2017-11-23 19:04:06.215993	2017-11-23 19:04:06.215993	2
659	Fight The Power (Soul Power - Who Stole This Soul) - Live	\N	2017-11-23 19:04:06.220187	2017-11-23 19:04:06.220187	2
660	Can't Do Nuttin' For Ya Man - Live	\N	2017-11-23 19:04:06.224495	2017-11-23 19:04:06.224495	2
661	31 Flavors - Live	\N	2017-11-23 19:04:06.2289	2017-11-23 19:04:06.2289	2
662	Shut 'Em Down - Live	\N	2017-11-23 19:04:06.233279	2017-11-23 19:04:06.233279	2
663	Harder Than You Think - Live	\N	2017-11-23 19:04:06.237487	2017-11-23 19:04:06.237487	2
664	Gammal fäbodpsalm - Live	\N	2017-11-23 19:05:14.315206	2017-11-23 19:05:14.315206	17
665	Voulez-Vous - Live	\N	2017-11-23 19:05:14.32033	2017-11-23 19:05:14.32033	17
666	If It Wasn't For The Nights - Live	\N	2017-11-23 19:05:14.324533	2017-11-23 19:05:14.324533	17
667	As Good As New - Live	\N	2017-11-23 19:05:14.328582	2017-11-23 19:05:14.328582	17
668	Knowing Me, Knowing You - Live	\N	2017-11-23 19:05:14.333069	2017-11-23 19:05:14.333069	17
669	Rock Me - Live	\N	2017-11-23 19:05:14.337673	2017-11-23 19:05:14.337673	17
670	Chiquitita - Live	\N	2017-11-23 19:05:14.343118	2017-11-23 19:05:14.343118	17
671	Money, Money, Money - Live	\N	2017-11-23 19:05:14.347515	2017-11-23 19:05:14.347515	17
672	I Have A Dream - Live	\N	2017-11-23 19:05:14.35155	2017-11-23 19:05:14.35155	17
673	Gimme! Gimme! Gimme! (A Man After Midnight) - Live	\N	2017-11-23 19:05:14.355969	2017-11-23 19:05:14.355969	17
674	S.O.S. - Live	\N	2017-11-23 19:05:14.360643	2017-11-23 19:05:14.360643	17
675	Fernando - Live	\N	2017-11-23 19:05:14.366268	2017-11-23 19:05:14.366268	17
676	The Name Of The Game - Live	\N	2017-11-23 19:05:14.371559	2017-11-23 19:05:14.371559	17
677	Eagle - Live	\N	2017-11-23 19:05:14.376115	2017-11-23 19:05:14.376115	17
678	Thank You For The Music - Live	\N	2017-11-23 19:05:14.381039	2017-11-23 19:05:14.381039	17
679	Why Did It Have To Be Me? - Live	\N	2017-11-23 19:05:14.386105	2017-11-23 19:05:14.386105	17
680	Intermezzo No.1 - Live	\N	2017-11-23 19:05:14.390729	2017-11-23 19:05:14.390729	17
681	I'm Still Alive - Live	\N	2017-11-23 19:05:14.394889	2017-11-23 19:05:14.394889	17
682	Summer Night City - Live	\N	2017-11-23 19:05:14.398843	2017-11-23 19:05:14.398843	17
683	Take A Chance On Me - Live	\N	2017-11-23 19:05:14.402712	2017-11-23 19:05:14.402712	17
684	Does Your Mother Know - Live	\N	2017-11-23 19:05:14.406929	2017-11-23 19:05:14.406929	17
685	Hole In Your Soul - Live	\N	2017-11-23 19:05:14.411384	2017-11-23 19:05:14.411384	17
686	The Way Old Friends Do - Live	\N	2017-11-23 19:05:14.414598	2017-11-23 19:05:14.414598	17
687	Dancing Queen - Live	\N	2017-11-23 19:05:14.417826	2017-11-23 19:05:14.417826	17
688	Waterloo - Live	\N	2017-11-23 19:05:14.421176	2017-11-23 19:05:14.421176	17
689	This Is Where I Came In	\N	2017-11-23 19:05:27.109051	2017-11-23 19:05:27.109051	17
690	She Keeps On Coming	\N	2017-11-23 19:05:27.11273	2017-11-23 19:05:27.11273	17
691	Sacred Trust	\N	2017-11-23 19:05:27.115823	2017-11-23 19:05:27.115823	17
692	Wedding Day	\N	2017-11-23 19:05:27.118848	2017-11-23 19:05:27.118848	17
693	Man In The Middle	\N	2017-11-23 19:05:27.121606	2017-11-23 19:05:27.121606	17
694	Déjà Vu	\N	2017-11-23 19:05:27.124399	2017-11-23 19:05:27.124399	17
695	Technicolor Dreams	\N	2017-11-23 19:05:27.127689	2017-11-23 19:05:27.127689	17
696	Walking On Air	\N	2017-11-23 19:05:27.130763	2017-11-23 19:05:27.130763	17
697	Loose Talk Costs Lives	\N	2017-11-23 19:05:27.133965	2017-11-23 19:05:27.133965	17
698	Embrace	\N	2017-11-23 19:05:27.137076	2017-11-23 19:05:27.137076	17
699	The Extra Mile	\N	2017-11-23 19:05:27.140563	2017-11-23 19:05:27.140563	17
700	Voice In The Wilderness	\N	2017-11-23 19:05:27.143762	2017-11-23 19:05:27.143762	17
701	I'm a Believer - 2006 Remastered Original Stereo Version	\N	2017-11-23 19:05:39.33912	2017-11-23 19:05:39.33912	17
702	Valleri	\N	2017-11-23 19:05:39.341894	2017-11-23 19:05:39.341894	17
703	You Just May Be The One - TV Version	\N	2017-11-23 19:05:39.34443	2017-11-23 19:05:39.34443	17
704	That Was Then, This Is Now	\N	2017-11-23 19:05:39.347209	2017-11-23 19:05:39.347209	17
705	(I'm Not Your) Steppin' Stone	\N	2017-11-23 19:05:39.350943	2017-11-23 19:05:39.350943	17
706	Pleasant Valley Sunday	\N	2017-11-23 19:05:39.355067	2017-11-23 19:05:39.355067	17
707	Daydream Believer	\N	2017-11-23 19:05:39.359545	2017-11-23 19:05:39.359545	17
708	Last Train To Clarksville	\N	2017-11-23 19:05:39.3644	2017-11-23 19:05:39.3644	17
709	She Makes Me Laugh	\N	2017-11-23 19:05:39.369387	2017-11-23 19:05:39.369387	17
710	A Little Bit Me, A Little Bit You - Stereo Remix	\N	2017-11-23 19:05:39.374221	2017-11-23 19:05:39.374221	17
711	Porpoise Song (Theme from "Head")	\N	2017-11-23 19:05:39.379097	2017-11-23 19:05:39.379097	17
712	Heart And Soul	\N	2017-11-23 19:05:39.383802	2017-11-23 19:05:39.383802	17
713	Words	\N	2017-11-23 19:05:39.388139	2017-11-23 19:05:39.388139	17
714	Goin' Down (45 Version)	\N	2017-11-23 19:05:39.392964	2017-11-23 19:05:39.392964	17
715	Wild Honey - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.363169	2017-11-23 19:05:51.363169	17
716	Aren't You Glad - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.36779	2017-11-23 19:05:51.36779	17
717	I Was Made To Love Her - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.372115	2017-11-23 19:05:51.372115	17
718	Country Air - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.376852	2017-11-23 19:05:51.376852	17
719	A Thing Or Two - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.381671	2017-11-23 19:05:51.381671	17
720	Darlin' - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.385746	2017-11-23 19:05:51.385746	17
721	I'd Love Just Once To See You - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.389592	2017-11-23 19:05:51.389592	17
722	Here Comes The Night - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.393618	2017-11-23 19:05:51.393618	17
723	Let The Wind Blow - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.398258	2017-11-23 19:05:51.398258	17
724	How She Boogalooed It - Stereo Mix / Remastered 2017	\N	2017-11-23 19:05:51.402944	2017-11-23 19:05:51.402944	17
725	Mama Says	\N	2017-11-23 19:05:51.407273	2017-11-23 19:05:51.407273	17
726	Lonely Days - Alternate Version	\N	2017-11-23 19:05:51.411784	2017-11-23 19:05:51.411784	17
727	Cool, Cool, Water - Alternate Version	\N	2017-11-23 19:05:51.415247	2017-11-23 19:05:51.415247	17
728	Time To Get Alone - Alternate Version	\N	2017-11-23 19:05:51.418814	2017-11-23 19:05:51.418814	17
729	Can't Wait Too Long - Alternate Version	\N	2017-11-23 19:05:51.42223	2017-11-23 19:05:51.42223	17
730	I'd Love Just Once To See You - Alternate Version	\N	2017-11-23 19:05:51.425116	2017-11-23 19:05:51.425116	17
731	I Was Made To Love Her - Vocal Insert Session	\N	2017-11-23 19:05:51.427931	2017-11-23 19:05:51.427931	17
732	I Was Made To Love Her - Long Version	\N	2017-11-23 19:05:51.431146	2017-11-23 19:05:51.431146	17
733	Hide Go Seek - Backing Track Master Take - Instrumental	\N	2017-11-23 19:05:51.434712	2017-11-23 19:05:51.434712	17
734	Honey Get Home - Backing Track Master Take - Instrumental	\N	2017-11-23 19:05:51.438152	2017-11-23 19:05:51.438152	17
735	Wild Honey - Session Highlights Instrumental	\N	2017-11-23 19:05:51.440978	2017-11-23 19:05:51.440978	17
736	Aren't You Glad - Session Highlights Instrumental	\N	2017-11-23 19:05:51.443744	2017-11-23 19:05:51.443744	17
737	A Thing Or Two - Track And Backing Vocals	\N	2017-11-23 19:05:51.446699	2017-11-23 19:05:51.446699	17
738	Darlin' - Session Highlights Instrumental	\N	2017-11-23 19:05:51.450196	2017-11-23 19:05:51.450196	17
739	Let The Wind Blow - Session Highlights Instrumental	\N	2017-11-23 19:05:51.453072	2017-11-23 19:05:51.453072	17
740	Wild Honey - Live In Detroit / 11/17/67	\N	2017-11-23 19:05:51.456064	2017-11-23 19:05:51.456064	17
741	Country Air - Live In Detroit / 1967	\N	2017-11-23 19:05:51.458869	2017-11-23 19:05:51.458869	17
742	Darlin' - Live In Pittsburgh / 1967	\N	2017-11-23 19:05:51.4617	2017-11-23 19:05:51.4617	17
743	How She Boogalooed It - Live In Detroit / 11/17/67	\N	2017-11-23 19:05:51.465028	2017-11-23 19:05:51.465028	17
744	Aren't You Glad - Live / 1970	\N	2017-11-23 19:05:51.468132	2017-11-23 19:05:51.468132	17
745	Mama Says - Session Highlights	\N	2017-11-23 19:05:51.471402	2017-11-23 19:05:51.471402	17
746	Heroes And Villains - Single Version Backing Track	\N	2017-11-23 19:05:51.474701	2017-11-23 19:05:51.474701	17
747	Vegetables - Long Version	\N	2017-11-23 19:05:51.477618	2017-11-23 19:05:51.477618	17
748	Fall Breaks And Back To Winter - Alternate Mix	\N	2017-11-23 19:05:51.480586	2017-11-23 19:05:51.480586	17
749	Wind Chimes - Alternate Tag Section	\N	2017-11-23 19:05:51.483263	2017-11-23 19:05:51.483263	17
750	Wonderful - Backing Track / Instrumental	\N	2017-11-23 19:05:51.486436	2017-11-23 19:05:51.486436	17
751	With Me Tonight - Alternate Version With Session Intro	\N	2017-11-23 19:05:51.489816	2017-11-23 19:05:51.489816	17
752	Little Pad - Backing Track / Instrumental	\N	2017-11-23 19:05:51.49286	2017-11-23 19:05:51.49286	17
753	All Day All Night (Whistle In) - Alternate Version 1	\N	2017-11-23 19:05:51.49565	2017-11-23 19:05:51.49565	17
754	All Day All Night (Whistle In) - Alternate Version 2	\N	2017-11-23 19:05:51.498593	2017-11-23 19:05:51.498593	17
755	Untitled (Redwood) - Instrumental	\N	2017-11-23 19:05:51.501499	2017-11-23 19:05:51.501499	17
756	Fred Vail Intro - Live / 1967	\N	2017-11-23 19:05:51.504128	2017-11-23 19:05:51.504128	17
757	The Letter - Alternate Mono Mix - Live / 1967	\N	2017-11-23 19:05:51.506891	2017-11-23 19:05:51.506891	17
758	You're So Good To Me - Live / 1967	\N	2017-11-23 19:05:51.509721	2017-11-23 19:05:51.509721	17
759	Help Me, Rhonda - Mono Mix / Live / 1967	\N	2017-11-23 19:05:51.513536	2017-11-23 19:05:51.513536	17
760	California Girls - Mono Mix / Live / 1967	\N	2017-11-23 19:05:51.51758	2017-11-23 19:05:51.51758	17
761	Surfer Girl - Mono Mix / Live / 1967	\N	2017-11-23 19:05:51.521823	2017-11-23 19:05:51.521823	17
762	Sloop John B - Live / 1967	\N	2017-11-23 19:05:51.525835	2017-11-23 19:05:51.525835	17
763	With A Little Help From My Friends - Mono Mix / Live / 1967	\N	2017-11-23 19:05:51.530543	2017-11-23 19:05:51.530543	17
764	Their Hearts Were Full Of Spring - Mono Mix / Live / 1967	\N	2017-11-23 19:05:51.535344	2017-11-23 19:05:51.535344	17
765	Planet Claire (Live)	\N	2017-11-23 19:06:03.088534	2017-11-23 19:06:03.088534	17
766	Channel Z (Live)	\N	2017-11-23 19:06:03.092797	2017-11-23 19:06:03.092797	17
767	Dance Song (Live)	\N	2017-11-23 19:06:03.096968	2017-11-23 19:06:03.096968	17
768	Good Stuff (Live)	\N	2017-11-23 19:06:03.101734	2017-11-23 19:06:03.101734	17
769	Quiche Lorraine (Live)	\N	2017-11-23 19:06:03.107417	2017-11-23 19:06:03.107417	17
770	Roam (Live)	\N	2017-11-23 19:06:03.112172	2017-11-23 19:06:03.112172	17
771	Strobelight (Live)	\N	2017-11-23 19:06:03.116664	2017-11-23 19:06:03.116664	17
772	Loveshack (Live)	\N	2017-11-23 19:06:03.121342	2017-11-23 19:06:03.121342	17
773	Party out of Bounds (Live)	\N	2017-11-23 19:06:03.126439	2017-11-23 19:06:03.126439	17
774	Rock Lobster (Live)	\N	2017-11-23 19:06:03.132342	2017-11-23 19:06:03.132342	17
775	Pressure Drop - Live	\N	2017-11-23 19:16:23.289622	2017-11-23 19:16:23.289622	15
776	Get up Stand Up - Live	\N	2017-11-23 19:16:23.295618	2017-11-23 19:16:23.295618	15
777	Louie Louie - Live	\N	2017-11-23 19:16:23.299998	2017-11-23 19:16:23.299998	15
778	Time Tough - Live	\N	2017-11-23 19:16:23.304068	2017-11-23 19:16:23.304068	15
779	My Love Is so Strong - Live	\N	2017-11-23 19:16:23.308743	2017-11-23 19:16:23.308743	15
780	Intro Country Roads - Live	\N	2017-11-23 19:16:23.312796	2017-11-23 19:16:23.312796	15
781	Country Roads - Live	\N	2017-11-23 19:16:23.317012	2017-11-23 19:16:23.317012	15
782	Toots Rock the Reggae - Live	\N	2017-11-23 19:16:23.32156	2017-11-23 19:16:23.32156	15
783	Monkey Man - Live	\N	2017-11-23 19:16:23.326112	2017-11-23 19:16:23.326112	15
784	54-46 Was My Number - Live	\N	2017-11-23 19:16:23.331177	2017-11-23 19:16:23.331177	15
785	Handsworth Revolution	\N	2017-11-23 19:16:35.14248	2017-11-23 19:16:35.14248	15
786	Bad Man	\N	2017-11-23 19:16:35.147097	2017-11-23 19:16:35.147097	15
787	Soldiers	\N	2017-11-23 19:16:35.151164	2017-11-23 19:16:35.151164	15
788	Sound Check	\N	2017-11-23 19:16:35.154924	2017-11-23 19:16:35.154924	15
789	Prodigal Son	\N	2017-11-23 19:16:35.159708	2017-11-23 19:16:35.159708	15
790	Ku Klux Klan	\N	2017-11-23 19:16:35.164835	2017-11-23 19:16:35.164835	15
791	Prediction	\N	2017-11-23 19:16:35.169899	2017-11-23 19:16:35.169899	15
792	Macka Splaff	\N	2017-11-23 19:16:35.173865	2017-11-23 19:16:35.173865	15
793	Bun Dem - 12" Version	\N	2017-11-23 19:16:35.177726	2017-11-23 19:16:35.177726	15
794	Revolution - Dub / Take 1 / Extended Mix	\N	2017-11-23 19:16:35.182018	2017-11-23 19:16:35.182018	15
795	Prodigal Son - Single Mix	\N	2017-11-23 19:16:35.187315	2017-11-23 19:16:35.187315	15
796	Prodigal Son - Dub	\N	2017-11-23 19:16:35.192125	2017-11-23 19:16:35.192125	15
797	Ku Klux Klan - 12" Version	\N	2017-11-23 19:16:35.196512	2017-11-23 19:16:35.196512	15
798	Prediction - 12" Mix	\N	2017-11-23 19:16:35.201467	2017-11-23 19:16:35.201467	15
799	Revolution - Dub / Take 3	\N	2017-11-23 19:16:35.205357	2017-11-23 19:16:35.205357	15
800	Handsworth Revolution - BBC Session, London / 1978	\N	2017-11-23 19:16:35.209807	2017-11-23 19:16:35.209807	15
801	Bad Man - BBC Session, London / 1977	\N	2017-11-23 19:16:35.2146	2017-11-23 19:16:35.2146	15
802	Prodigal Son - BBC Session, London / 1977	\N	2017-11-23 19:16:35.219861	2017-11-23 19:16:35.219861	15
803	Ku Klux Klan - BBC Session, London / 1977	\N	2017-11-23 19:16:35.223917	2017-11-23 19:16:35.223917	15
804	Macka Splaff - BBC Session, London / 1978	\N	2017-11-23 19:16:35.227885	2017-11-23 19:16:35.227885	15
805	Prediction - BBC Session, London / 1977	\N	2017-11-23 19:16:35.231773	2017-11-23 19:16:35.231773	15
806	Revolution - Dub, Pt. 2	\N	2017-11-23 19:16:35.23577	2017-11-23 19:16:35.23577	15
807	Bad Man - Dub / Take 1	\N	2017-11-23 19:16:35.239892	2017-11-23 19:16:35.239892	15
808	Soldiers - Dub	\N	2017-11-23 19:16:35.243979	2017-11-23 19:16:35.243979	15
809	Sound Check - Dub	\N	2017-11-23 19:16:35.248263	2017-11-23 19:16:35.248263	15
810	Prodigal Son - Dub / Extended	\N	2017-11-23 19:16:35.252699	2017-11-23 19:16:35.252699	15
811	Ku Klux Klan - Dub	\N	2017-11-23 19:16:35.257295	2017-11-23 19:16:35.257295	15
812	Macka Dub - Alternative Take	\N	2017-11-23 19:16:35.262011	2017-11-23 19:16:35.262011	15
813	Prediction - 7" Mix	\N	2017-11-23 19:16:35.266612	2017-11-23 19:16:35.266612	15
814	Prediction - 7" Mix / Dub	\N	2017-11-23 19:16:35.271119	2017-11-23 19:16:35.271119	15
815	Liberty	\N	2017-11-23 19:16:47.012235	2017-11-23 19:16:47.012235	15
816	Trip	\N	2017-11-23 19:16:47.015614	2017-11-23 19:16:47.015614	15
817	Dancing Boys	\N	2017-11-23 19:16:47.018497	2017-11-23 19:16:47.018497	15
818	Sweet Cry Freedom	\N	2017-11-23 19:16:47.021459	2017-11-23 19:16:47.021459	15
819	My Friend	\N	2017-11-23 19:16:47.025352	2017-11-23 19:16:47.025352	15
820	Out of Exile	\N	2017-11-23 19:16:47.029796	2017-11-23 19:16:47.029796	15
821	Showdown	\N	2017-11-23 19:16:47.033852	2017-11-23 19:16:47.033852	15
822	Bad Mind People	\N	2017-11-23 19:16:47.038553	2017-11-23 19:16:47.038553	15
823	Nothin' for Nothin'	\N	2017-11-23 19:16:47.043181	2017-11-23 19:16:47.043181	15
824	Live and Love	\N	2017-11-23 19:16:47.047791	2017-11-23 19:16:47.047791	15
825	Rock on, Be Strong	\N	2017-11-23 19:16:47.053077	2017-11-23 19:16:47.053077	15
826	Could You Be Loved?	\N	2017-11-23 19:16:47.057765	2017-11-23 19:16:47.057765	15
827	My Friend (Toast Rap)	\N	2017-11-23 19:16:47.062005	2017-11-23 19:16:47.062005	15
828	My Friend (Toast Hip Hop)	\N	2017-11-23 19:16:47.066073	2017-11-23 19:16:47.066073	15
829	My Friend (Remix)	\N	2017-11-23 19:16:47.071293	2017-11-23 19:16:47.071293	15
830	My Friend (Remix Instrumental)	\N	2017-11-23 19:16:47.075522	2017-11-23 19:16:47.075522	15
831	My Friend (Extended Toast Rap)	\N	2017-11-23 19:16:47.080514	2017-11-23 19:16:47.080514	15
832	My Friend (Extended Dub Edge)	\N	2017-11-23 19:16:47.085883	2017-11-23 19:16:47.085883	15
833	Tap Out	\N	2017-11-23 19:22:27.043231	2017-11-23 19:22:27.043231	24
834	All The Time	\N	2017-11-23 19:22:27.047331	2017-11-23 19:22:27.047331	24
835	One Way Trigger	\N	2017-11-23 19:22:27.050676	2017-11-23 19:22:27.050676	24
836	Welcome To Japan	\N	2017-11-23 19:22:27.053841	2017-11-23 19:22:27.053841	24
837	80's Comedown Machine	\N	2017-11-23 19:22:27.057267	2017-11-23 19:22:27.057267	24
838	50/50	\N	2017-11-23 19:22:27.06017	2017-11-23 19:22:27.06017	24
839	Slow Animals	\N	2017-11-23 19:22:27.064166	2017-11-23 19:22:27.064166	24
840	Partners In Crime	\N	2017-11-23 19:22:27.069772	2017-11-23 19:22:27.069772	24
841	Chances	\N	2017-11-23 19:22:27.075944	2017-11-23 19:22:27.075944	24
842	Happy Ending	\N	2017-11-23 19:22:27.08027	2017-11-23 19:22:27.08027	24
843	Call It Fate, Call It Karma	\N	2017-11-23 19:22:27.083397	2017-11-23 19:22:27.083397	24
844	Airbag (Remastered)	\N	2017-11-23 19:22:38.060169	2017-11-23 19:22:38.060169	24
845	Paranoid Android (Remastered)	\N	2017-11-23 19:22:38.065956	2017-11-23 19:22:38.065956	24
846	Subterranean Homesick Alien (Remastered)	\N	2017-11-23 19:22:38.070574	2017-11-23 19:22:38.070574	24
847	Exit Music (For a Film) (Remastered)	\N	2017-11-23 19:22:38.075224	2017-11-23 19:22:38.075224	24
848	Let Down (Remastered)	\N	2017-11-23 19:22:38.079684	2017-11-23 19:22:38.079684	24
849	Karma Police (Remastered)	\N	2017-11-23 19:22:38.083925	2017-11-23 19:22:38.083925	24
850	Fitter Happier (Remastered)	\N	2017-11-23 19:22:38.088026	2017-11-23 19:22:38.088026	24
851	Electioneering (Remastered)	\N	2017-11-23 19:22:38.091819	2017-11-23 19:22:38.091819	24
852	Climbing Up the Walls (Remastered)	\N	2017-11-23 19:22:38.095575	2017-11-23 19:22:38.095575	24
853	No Surprises (Remastered)	\N	2017-11-23 19:22:38.099735	2017-11-23 19:22:38.099735	24
854	Lucky (Remastered)	\N	2017-11-23 19:22:38.103852	2017-11-23 19:22:38.103852	24
855	The Tourist (Remastered)	\N	2017-11-23 19:22:38.107816	2017-11-23 19:22:38.107816	24
856	I Promise	\N	2017-11-23 19:22:38.112027	2017-11-23 19:22:38.112027	24
857	Man of War	\N	2017-11-23 19:22:38.116767	2017-11-23 19:22:38.116767	24
858	Lift	\N	2017-11-23 19:22:38.121485	2017-11-23 19:22:38.121485	24
859	Lull (Remastered)	\N	2017-11-23 19:22:38.125708	2017-11-23 19:22:38.125708	24
860	Meeting in the Aisle (Remastered)	\N	2017-11-23 19:22:38.129807	2017-11-23 19:22:38.129807	24
861	Melatonin (Remastered)	\N	2017-11-23 19:22:38.134304	2017-11-23 19:22:38.134304	24
862	A Reminder (Remastered)	\N	2017-11-23 19:22:38.147721	2017-11-23 19:22:38.147721	24
863	Polyethylene (Parts 1 & 2) (Remastered)	\N	2017-11-23 19:22:38.151493	2017-11-23 19:22:38.151493	24
864	Pearly* (Remastered)	\N	2017-11-23 19:22:38.155142	2017-11-23 19:22:38.155142	24
865	Palo Alto (Remastered)	\N	2017-11-23 19:22:38.158941	2017-11-23 19:22:38.158941	24
866	How I Made My Millions (Remastered)	\N	2017-11-23 19:22:38.163573	2017-11-23 19:22:38.163573	24
867	Wonderful Wonderful	\N	2017-11-23 19:22:49.037756	2017-11-23 19:22:49.037756	24
868	The Man	\N	2017-11-23 19:22:49.040682	2017-11-23 19:22:49.040682	24
869	Rut	\N	2017-11-23 19:22:49.043248	2017-11-23 19:22:49.043248	24
870	Life To Come	\N	2017-11-23 19:22:49.046108	2017-11-23 19:22:49.046108	24
871	Run For Cover	\N	2017-11-23 19:22:49.048846	2017-11-23 19:22:49.048846	24
872	Tyson vs Douglas	\N	2017-11-23 19:22:49.051386	2017-11-23 19:22:49.051386	24
873	Some Kind Of Love	\N	2017-11-23 19:22:49.053663	2017-11-23 19:22:49.053663	24
874	Out Of My Mind	\N	2017-11-23 19:22:49.055904	2017-11-23 19:22:49.055904	24
875	The Calling	\N	2017-11-23 19:22:49.058101	2017-11-23 19:22:49.058101	24
876	Have All The Songs Been Written?	\N	2017-11-23 19:22:49.060532	2017-11-23 19:22:49.060532	24
877	Everything_Now (continued)	\N	2017-11-23 19:23:00.08883	2017-11-23 19:23:00.08883	24
878	Everything Now	\N	2017-11-23 19:23:00.093571	2017-11-23 19:23:00.093571	24
879	Signs of Life	\N	2017-11-23 19:23:00.098013	2017-11-23 19:23:00.098013	24
880	Creature Comfort	\N	2017-11-23 19:23:00.111818	2017-11-23 19:23:00.111818	24
881	Peter Pan	\N	2017-11-23 19:23:00.115572	2017-11-23 19:23:00.115572	24
882	Chemistry	\N	2017-11-23 19:23:00.119247	2017-11-23 19:23:00.119247	24
883	Infinite Content	\N	2017-11-23 19:23:00.122964	2017-11-23 19:23:00.122964	24
884	Infinite_Content	\N	2017-11-23 19:23:00.126918	2017-11-23 19:23:00.126918	24
885	Electric Blue	\N	2017-11-23 19:23:00.13099	2017-11-23 19:23:00.13099	24
886	Good God Damn	\N	2017-11-23 19:23:00.13463	2017-11-23 19:23:00.13463	24
887	Put Your Money on Me	\N	2017-11-23 19:23:00.138426	2017-11-23 19:23:00.138426	24
888	We Don't Deserve Love	\N	2017-11-23 19:23:00.141114	2017-11-23 19:23:00.141114	24
889	Everything Now (continued)	\N	2017-11-23 19:23:00.143779	2017-11-23 19:23:00.143779	24
890	Breed - 1992/Live at Reading	\N	2017-11-23 19:25:17.397601	2017-11-23 19:25:17.397601	25
891	Drain You - 1992/Live at Reading	\N	2017-11-23 19:25:17.40329	2017-11-23 19:25:17.40329	25
892	Aneurysm - 1992/Live at Reading	\N	2017-11-23 19:25:17.408702	2017-11-23 19:25:17.408702	25
893	School - 1992/Live at Reading	\N	2017-11-23 19:25:17.413362	2017-11-23 19:25:17.413362	25
894	Sliver - 1992/Live at Reading	\N	2017-11-23 19:25:17.417297	2017-11-23 19:25:17.417297	25
895	In Bloom - 1992/Live at Reading	\N	2017-11-23 19:25:17.421701	2017-11-23 19:25:17.421701	25
896	Come As You Are - 1992/Live at Reading	\N	2017-11-23 19:25:17.426011	2017-11-23 19:25:17.426011	25
897	Lithium - 1992/Live at Reading	\N	2017-11-23 19:25:17.430816	2017-11-23 19:25:17.430816	25
898	About A Girl - 1992/Live at Reading	\N	2017-11-23 19:25:17.435382	2017-11-23 19:25:17.435382	25
899	Tourette's - 1992/Live at Reading	\N	2017-11-23 19:25:17.44034	2017-11-23 19:25:17.44034	25
900	Polly - 1992/Live at Reading	\N	2017-11-23 19:25:17.445416	2017-11-23 19:25:17.445416	25
901	Lounge Act - 1992/Live at Reading	\N	2017-11-23 19:25:17.449656	2017-11-23 19:25:17.449656	25
902	Smells Like Teen Spirit - 1992/Live at Reading	\N	2017-11-23 19:25:17.452549	2017-11-23 19:25:17.452549	25
903	On A Plain - 1992/Live at Reading	\N	2017-11-23 19:25:17.45557	2017-11-23 19:25:17.45557	25
904	Negative Creep - 1992/Live at Reading	\N	2017-11-23 19:25:17.458289	2017-11-23 19:25:17.458289	25
905	Been A Son - 1992/Live at Reading	\N	2017-11-23 19:25:17.460908	2017-11-23 19:25:17.460908	25
906	All Apologies - 1992/Live at Reading	\N	2017-11-23 19:25:17.463421	2017-11-23 19:25:17.463421	25
907	Blew - 1992/Live at Reading	\N	2017-11-23 19:25:17.465967	2017-11-23 19:25:17.465967	25
908	Dumb - 1992/Live at Reading	\N	2017-11-23 19:25:17.468671	2017-11-23 19:25:17.468671	25
909	Stay Away - 1992/Live at Reading	\N	2017-11-23 19:25:17.47111	2017-11-23 19:25:17.47111	25
910	Spank Thru - 1992/Live at Reading	\N	2017-11-23 19:25:17.4738	2017-11-23 19:25:17.4738	25
911	The Money Will Roll Right In - 1992/Live at Reading	\N	2017-11-23 19:25:17.476619	2017-11-23 19:25:17.476619	25
912	D-7 - 1992/Live at Reading	\N	2017-11-23 19:25:17.479464	2017-11-23 19:25:17.479464	25
913	Territorial Pissings - 1992/Live at Reading	\N	2017-11-23 19:25:17.482647	2017-11-23 19:25:17.482647	25
914	Nobody Can Save Me	\N	2017-11-23 19:25:29.021973	2017-11-23 19:25:29.021973	25
915	Good Goodbye (feat. Pusha T and Stormzy)	\N	2017-11-23 19:25:29.027191	2017-11-23 19:25:29.027191	25
916	Talking to Myself	\N	2017-11-23 19:25:29.031844	2017-11-23 19:25:29.031844	25
917	Battle Symphony	\N	2017-11-23 19:25:29.036248	2017-11-23 19:25:29.036248	25
918	Invisible	\N	2017-11-23 19:25:29.04083	2017-11-23 19:25:29.04083	25
919	Heavy (feat. Kiiara)	\N	2017-11-23 19:25:29.045088	2017-11-23 19:25:29.045088	25
920	Sorry for Now	\N	2017-11-23 19:25:29.049469	2017-11-23 19:25:29.049469	25
921	Halfway Right	\N	2017-11-23 19:25:29.053576	2017-11-23 19:25:29.053576	25
922	One More Light	\N	2017-11-23 19:25:29.057511	2017-11-23 19:25:29.057511	25
923	Sharp Edges	\N	2017-11-23 19:25:29.061333	2017-11-23 19:25:29.061333	25
924	Airbag (Remastered)	\N	2017-11-23 19:25:40.092868	2017-11-23 19:25:40.092868	25
925	Paranoid Android (Remastered)	\N	2017-11-23 19:25:40.096731	2017-11-23 19:25:40.096731	25
926	Subterranean Homesick Alien (Remastered)	\N	2017-11-23 19:25:40.100217	2017-11-23 19:25:40.100217	25
927	Exit Music (For a Film) (Remastered)	\N	2017-11-23 19:25:40.103814	2017-11-23 19:25:40.103814	25
928	Let Down (Remastered)	\N	2017-11-23 19:25:40.107428	2017-11-23 19:25:40.107428	25
929	Karma Police (Remastered)	\N	2017-11-23 19:25:40.110929	2017-11-23 19:25:40.110929	25
930	Fitter Happier (Remastered)	\N	2017-11-23 19:25:40.11434	2017-11-23 19:25:40.11434	25
931	Electioneering (Remastered)	\N	2017-11-23 19:25:40.117687	2017-11-23 19:25:40.117687	25
932	Climbing Up the Walls (Remastered)	\N	2017-11-23 19:25:40.121166	2017-11-23 19:25:40.121166	25
933	No Surprises (Remastered)	\N	2017-11-23 19:25:40.124848	2017-11-23 19:25:40.124848	25
934	Lucky (Remastered)	\N	2017-11-23 19:25:40.128028	2017-11-23 19:25:40.128028	25
935	The Tourist (Remastered)	\N	2017-11-23 19:25:40.131195	2017-11-23 19:25:40.131195	25
936	I Promise	\N	2017-11-23 19:25:40.134095	2017-11-23 19:25:40.134095	25
937	Man of War	\N	2017-11-23 19:25:40.136888	2017-11-23 19:25:40.136888	25
938	Lift	\N	2017-11-23 19:25:40.139612	2017-11-23 19:25:40.139612	25
939	Lull (Remastered)	\N	2017-11-23 19:25:40.142509	2017-11-23 19:25:40.142509	25
940	Meeting in the Aisle (Remastered)	\N	2017-11-23 19:25:40.145734	2017-11-23 19:25:40.145734	25
941	Melatonin (Remastered)	\N	2017-11-23 19:25:40.148907	2017-11-23 19:25:40.148907	25
942	A Reminder (Remastered)	\N	2017-11-23 19:25:40.152063	2017-11-23 19:25:40.152063	25
943	Polyethylene (Parts 1 & 2) (Remastered)	\N	2017-11-23 19:25:40.155391	2017-11-23 19:25:40.155391	25
944	Pearly* (Remastered)	\N	2017-11-23 19:25:40.158714	2017-11-23 19:25:40.158714	25
945	Palo Alto (Remastered)	\N	2017-11-23 19:25:40.161814	2017-11-23 19:25:40.161814	25
946	How I Made My Millions (Remastered)	\N	2017-11-23 19:25:40.165703	2017-11-23 19:25:40.165703	25
947	A Head Full Of Dreams	\N	2017-11-23 19:25:51.113169	2017-11-23 19:25:51.113169	25
948	Birds	\N	2017-11-23 19:25:51.117243	2017-11-23 19:25:51.117243	25
949	Hymn For The Weekend	\N	2017-11-23 19:25:51.121135	2017-11-23 19:25:51.121135	25
950	Everglow	\N	2017-11-23 19:25:51.125045	2017-11-23 19:25:51.125045	25
951	Adventure Of A Lifetime	\N	2017-11-23 19:25:51.129001	2017-11-23 19:25:51.129001	25
952	Fun (feat. Tove Lo)	\N	2017-11-23 19:25:51.133305	2017-11-23 19:25:51.133305	25
953	Kaleidoscope	\N	2017-11-23 19:25:51.137912	2017-11-23 19:25:51.137912	25
954	Army Of One	\N	2017-11-23 19:25:51.142868	2017-11-23 19:25:51.142868	25
955	Amazing Day	\N	2017-11-23 19:25:51.147501	2017-11-23 19:25:51.147501	25
956	Colour Spectrum	\N	2017-11-23 19:25:51.151488	2017-11-23 19:25:51.151488	25
957	Up&Up	\N	2017-11-23 19:25:51.155255	2017-11-23 19:25:51.155255	25
958	Love Train	\N	2017-11-23 19:29:15.387731	2017-11-23 19:29:15.387731	12
959	Everybody's Got The Right To Love	\N	2017-11-23 19:29:15.391512	2017-11-23 19:29:15.391512	12
960	You're My Driving Wheel - Promo Single Version	\N	2017-11-23 19:29:15.395694	2017-11-23 19:29:15.395694	12
961	Up The Ladder To The Roof - Single Version / Mono	\N	2017-11-23 19:29:15.399186	2017-11-23 19:29:15.399186	12
962	The Sha-La Bandit	\N	2017-11-23 19:29:15.402135	2017-11-23 19:29:15.402135	12
963	Floy Joy - Single Version	\N	2017-11-23 19:29:15.404725	2017-11-23 19:29:15.404725	12
964	I'm Gonna Let My Heart Do The Walking	\N	2017-11-23 19:29:15.407504	2017-11-23 19:29:15.407504	12
965	Stoned Love - Single Version	\N	2017-11-23 19:29:15.410296	2017-11-23 19:29:15.410296	12
966	The Composer - Single Version (Mono)	\N	2017-11-23 19:29:15.413048	2017-11-23 19:29:15.413048	12
967	No Matter What Sign You Are	\N	2017-11-23 19:29:15.415844	2017-11-23 19:29:15.415844	12
968	I'm Livin' In Shame	\N	2017-11-23 19:29:15.418715	2017-11-23 19:29:15.418715	12
969	In And Out Of Love - Single Version / Stereo	\N	2017-11-23 19:29:15.421816	2017-11-23 19:29:15.421816	12
970	Forever Came Today	\N	2017-11-23 19:29:15.424452	2017-11-23 19:29:15.424452	12
971	Some Things You Never Get Used To	\N	2017-11-23 19:29:15.426934	2017-11-23 19:29:15.426934	12
972	Love Child	\N	2017-11-23 19:29:15.429459	2017-11-23 19:29:15.429459	12
973	Reflections - Stereo	\N	2017-11-23 19:29:15.431889	2017-11-23 19:29:15.431889	12
974	There's No Stopping Us Now	\N	2017-11-23 19:29:15.434465	2017-11-23 19:29:15.434465	12
975	Love Is Like An Itching In My Heart	\N	2017-11-23 19:29:15.437715	2017-11-23 19:29:15.437715	12
976	Standing At The Crossroads Of Love - Single Version	\N	2017-11-23 19:29:15.441201	2017-11-23 19:29:15.441201	12
977	You Can't Hurry Love	\N	2017-11-23 19:29:15.444561	2017-11-23 19:29:15.444561	12
978	The Happening - Stereo	\N	2017-11-23 19:29:15.447744	2017-11-23 19:29:15.447744	12
979	Whisper You Love Me Boy	\N	2017-11-23 19:29:15.450687	2017-11-23 19:29:15.450687	12
980	My World Is Empty Without You - Stereo	\N	2017-11-23 19:29:15.453352	2017-11-23 19:29:15.453352	12
981	Love Is Here And Now You're Gone	\N	2017-11-23 19:29:15.456246	2017-11-23 19:29:15.456246	12
982	I Hear A Symphony	\N	2017-11-23 19:29:15.458889	2017-11-23 19:29:15.458889	12
983	Everything Is Good About You	\N	2017-11-23 19:29:15.46153	2017-11-23 19:29:15.46153	12
984	Nothing But Heartaches - Juke Box Single Version / Stereo	\N	2017-11-23 19:29:15.464206	2017-11-23 19:29:15.464206	12
985	Run, Run, Run - Single Version / Mono	\N	2017-11-23 19:29:15.46698	2017-11-23 19:29:15.46698	12
986	Ask Any Girl - Mono	\N	2017-11-23 19:29:15.469629	2017-11-23 19:29:15.469629	12
987	When The Lovelight Starts Shining Through His Eyes	\N	2017-11-23 19:29:15.472723	2017-11-23 19:29:15.472723	12
988	Stop! In The Name Of Love	\N	2017-11-23 19:29:15.4758	2017-11-23 19:29:15.4758	12
989	I'm Gonna Make You Love Me	\N	2017-11-23 19:29:15.482983	2017-11-23 19:29:15.482983	12
990	September - LIVE	\N	2017-11-23 19:29:37.359991	2017-11-23 19:29:37.359991	12
991	Let Your Feelings Show - LIVE	\N	2017-11-23 19:29:37.362541	2017-11-23 19:29:37.362541	12
992	Let's Groove - LIVE	\N	2017-11-23 19:29:37.364885	2017-11-23 19:29:37.364885	12
993	Runnin' - LIVE	\N	2017-11-23 19:29:37.367112	2017-11-23 19:29:37.367112	12
994	Boogie Wonderland - LIVE	\N	2017-11-23 19:29:37.369258	2017-11-23 19:29:37.369258	12
995	Can't Hide Love - LIVE	\N	2017-11-23 19:29:37.371576	2017-11-23 19:29:37.371576	12
996	Fantasy - LIVE	\N	2017-11-23 19:29:37.375197	2017-11-23 19:29:37.375197	12
997	Kalimba Interlude - LIVE	\N	2017-11-23 19:29:37.378834	2017-11-23 19:29:37.378834	12
998	Evil - LIVE	\N	2017-11-23 19:29:37.382771	2017-11-23 19:29:37.382771	12
999	Shining Star - LIVE	\N	2017-11-23 19:29:37.386736	2017-11-23 19:29:37.386736	12
1000	Keep Your Head to the Sky - LIVE	\N	2017-11-23 19:29:37.390086	2017-11-23 19:29:37.390086	12
1001	Reasons - LIVE	\N	2017-11-23 19:29:37.393517	2017-11-23 19:29:37.393517	12
1002	Sing a Song - LIVE	\N	2017-11-23 19:29:37.396879	2017-11-23 19:29:37.396879	12
1003	That's the Way of the World - LIVE	\N	2017-11-23 19:29:37.40037	2017-11-23 19:29:37.40037	12
1004	Wouldn't Change a Thing About You - LIVE	\N	2017-11-23 19:29:37.404305	2017-11-23 19:29:37.404305	12
1005	After the Love Is Gone - LIVE	\N	2017-11-23 19:29:37.408939	2017-11-23 19:29:37.408939	12
1006	System of Survival - LIVE	\N	2017-11-23 19:29:37.413358	2017-11-23 19:29:37.413358	12
1007	Are You Ready	\N	2017-11-23 19:29:49.069938	2017-11-23 19:29:49.069938	12
1008	Total Destruction to Your Mind	\N	2017-11-23 19:29:49.073926	2017-11-23 19:29:49.073926	12
1009	Higher Ground	\N	2017-11-23 19:29:49.077528	2017-11-23 19:29:49.077528	12
1010	God Bless the Child	\N	2017-11-23 19:29:49.080591	2017-11-23 19:29:49.080591	12
1011	I Remember	\N	2017-11-23 19:29:49.083532	2017-11-23 19:29:49.083532	12
1012	Body Talk	\N	2017-11-23 19:29:49.086642	2017-11-23 19:29:49.086642	12
1013	Gypsy Woman	\N	2017-11-23 19:29:49.089697	2017-11-23 19:29:49.089697	12
1014	I Just Want to Make Love to You	\N	2017-11-23 19:29:49.092641	2017-11-23 19:29:49.092641	12
1015	Love, Peace, Happiness	\N	2017-11-23 19:29:49.095214	2017-11-23 19:29:49.095214	12
1016	What the World Needs Now Is Love Sweet Love	\N	2017-11-23 19:29:49.097773	2017-11-23 19:29:49.097773	12
1017	Mercy Mercy Me (The Ecology)	\N	2017-11-23 19:29:49.100348	2017-11-23 19:29:49.100348	12
1018	Let the Rain Fall On Me	\N	2017-11-23 19:29:49.10395	2017-11-23 19:29:49.10395	12
1019	Let There Be Peace On Earth	\N	2017-11-23 19:29:49.10772	2017-11-23 19:29:49.10772	12
1020	Lady	\N	2017-11-23 19:30:00.204045	2017-11-23 19:30:00.204045	12
1021	I'm Here - Metro Mix	\N	2017-11-23 19:30:00.208219	2017-11-23 19:30:00.208219	12
1022	Stay	\N	2017-11-23 19:30:00.212753	2017-11-23 19:30:00.212753	12
1023	Some Enchanted Evening - Fiji Island Mix	\N	2017-11-23 19:30:00.217135	2017-11-23 19:30:00.217135	12
1024	The Way You Do The Things You Do	\N	2017-11-23 19:30:00.222195	2017-11-23 19:30:00.222195	12
1025	Treat Her Like A Lady - Single Version	\N	2017-11-23 19:30:00.225823	2017-11-23 19:30:00.225823	12
1026	Standing On The Top - Pt. 1	\N	2017-11-23 19:30:00.231333	2017-11-23 19:30:00.231333	12
1027	Power - Single Version	\N	2017-11-23 19:30:00.237098	2017-11-23 19:30:00.237098	12
1028	Shakey Ground	\N	2017-11-23 19:30:00.241809	2017-11-23 19:30:00.241809	12
1029	Let Your Hair Down	\N	2017-11-23 19:30:00.246196	2017-11-23 19:30:00.246196	12
1030	Hey Girl (I Like Your Style) - Single Edit Version	\N	2017-11-23 19:30:00.249494	2017-11-23 19:30:00.249494	12
1031	Masterpiece - Single Version	\N	2017-11-23 19:30:00.253086	2017-11-23 19:30:00.253086	12
1032	Papa Was A Rollin' Stone - Single Version	\N	2017-11-23 19:30:00.256626	2017-11-23 19:30:00.256626	12
1033	Superstar (Remember How You Got Where You Are) - Single Version	\N	2017-11-23 19:30:00.26016	2017-11-23 19:30:00.26016	12
1034	Just My Imagination (Running Away With Me)	\N	2017-11-23 19:30:00.263902	2017-11-23 19:30:00.263902	12
1035	Ball Of Confusion (That's What The World Is Today) - Stereo Version	\N	2017-11-23 19:30:00.267479	2017-11-23 19:30:00.267479	12
1036	My Girl	\N	2017-11-23 19:30:00.271175	2017-11-23 19:30:00.271175	12
1037	I Can't Get Next To You	\N	2017-11-23 19:30:00.27492	2017-11-23 19:30:00.27492	12
1038	Runaway Child, Running Wild - Greatest Hits Version (Stereo)	\N	2017-11-23 19:30:00.278679	2017-11-23 19:30:00.278679	12
1039	Cloud Nine	\N	2017-11-23 19:30:00.282265	2017-11-23 19:30:00.282265	12
1040	I Could Never Love Another (After Loving You)	\N	2017-11-23 19:30:00.28582	2017-11-23 19:30:00.28582	12
1041	I Wish It Would Rain - Single Version	\N	2017-11-23 19:30:00.28892	2017-11-23 19:30:00.28892	12
1042	You're My Everything	\N	2017-11-23 19:30:00.291978	2017-11-23 19:30:00.291978	12
1043	All I Need - Edit	\N	2017-11-23 19:30:00.294706	2017-11-23 19:30:00.294706	12
1044	(I Know) I'm Losing You	\N	2017-11-23 19:30:00.297631	2017-11-23 19:30:00.297631	12
1045	Beauty Is Only Skin Deep - Single Version/Mono	\N	2017-11-23 19:30:00.301439	2017-11-23 19:30:00.301439	12
1046	Ain't Too Proud To Beg	\N	2017-11-23 19:30:00.305383	2017-11-23 19:30:00.305383	12
1047	Get Ready	\N	2017-11-23 19:30:00.308882	2017-11-23 19:30:00.308882	12
1048	Intro: I Switched My Robot Off	\N	2017-11-23 19:33:04.318025	2017-11-23 19:33:04.318025	5
1049	Ascension (feat. Vince Staples)	\N	2017-11-23 19:33:04.321734	2017-11-23 19:33:04.321734	5
1050	Strobelite (feat. Peven Everett)	\N	2017-11-23 19:33:04.324684	2017-11-23 19:33:04.324684	5
1051	Saturnz Barz (feat. Popcaan)	\N	2017-11-23 19:33:04.328338	2017-11-23 19:33:04.328338	5
1052	Momentz (feat. De La Soul)	\N	2017-11-23 19:33:04.331907	2017-11-23 19:33:04.331907	5
1053	Interlude: The Non-conformist Oath	\N	2017-11-23 19:33:04.334774	2017-11-23 19:33:04.334774	5
1054	Submission (feat. Danny Brown & Kelela)	\N	2017-11-23 19:33:04.337663	2017-11-23 19:33:04.337663	5
1055	Charger (feat. Grace Jones)	\N	2017-11-23 19:33:04.34028	2017-11-23 19:33:04.34028	5
1056	Interlude: Elevator Going Up	\N	2017-11-23 19:33:04.342929	2017-11-23 19:33:04.342929	5
1057	Andromeda (feat. DRAM)	\N	2017-11-23 19:33:04.345799	2017-11-23 19:33:04.345799	5
1058	Busted and Blue	\N	2017-11-23 19:33:04.34857	2017-11-23 19:33:04.34857	5
1059	Interlude: Talk Radio	\N	2017-11-23 19:33:04.35152	2017-11-23 19:33:04.35152	5
1060	Carnival (feat. Anthony Hamilton)	\N	2017-11-23 19:33:04.354391	2017-11-23 19:33:04.354391	5
1061	Let Me Out (feat. Mavis Staples & Pusha T)	\N	2017-11-23 19:33:04.357537	2017-11-23 19:33:04.357537	5
1062	Interlude: Penthouse	\N	2017-11-23 19:33:04.36037	2017-11-23 19:33:04.36037	5
1063	She's My Collar (feat. Kali Uchis)	\N	2017-11-23 19:33:04.36303	2017-11-23 19:33:04.36303	5
1064	Interlude: The Elephant	\N	2017-11-23 19:33:04.365662	2017-11-23 19:33:04.365662	5
1065	Hallelujah Money (feat. Benjamin Clementine)	\N	2017-11-23 19:33:04.368738	2017-11-23 19:33:04.368738	5
1066	We Got The Power (feat. Jehnny Beth)	\N	2017-11-23 19:33:04.371739	2017-11-23 19:33:04.371739	5
1067	Restless - Extended Mix	\N	2017-11-23 19:33:16.123865	2017-11-23 19:33:16.123865	5
1068	Singularity - Extended Mix	\N	2017-11-23 19:33:16.128269	2017-11-23 19:33:16.128269	5
1069	Plastic - Extended Mix	\N	2017-11-23 19:33:16.132227	2017-11-23 19:33:16.132227	5
1070	Tutti Frutti - Extended Mix	\N	2017-11-23 19:33:16.136055	2017-11-23 19:33:16.136055	5
1071	People on the High Line - Extended Mix	\N	2017-11-23 19:33:16.139939	2017-11-23 19:33:16.139939	5
1072	Stray Dog - Extended Mix	\N	2017-11-23 19:33:16.143653	2017-11-23 19:33:16.143653	5
1073	Academic - Extended Mix	\N	2017-11-23 19:33:16.147314	2017-11-23 19:33:16.147314	5
1074	Nothing but a Fool - Extended Mix 2	\N	2017-11-23 19:33:16.150976	2017-11-23 19:33:16.150976	5
1075	Unlearn this Hatred - Extended Mix	\N	2017-11-23 19:33:16.155832	2017-11-23 19:33:16.155832	5
1076	The Game - Extended Mix	\N	2017-11-23 19:33:16.159991	2017-11-23 19:33:16.159991	5
1077	Superheated - Extended Mix 2	\N	2017-11-23 19:33:16.163999	2017-11-23 19:33:16.163999	5
1078	Restless	\N	2017-11-23 19:33:16.167663	2017-11-23 19:33:16.167663	5
1079	Singularity	\N	2017-11-23 19:33:16.171459	2017-11-23 19:33:16.171459	5
1080	Plastic	\N	2017-11-23 19:33:16.175363	2017-11-23 19:33:16.175363	5
1081	Tutti Frutti	\N	2017-11-23 19:33:16.179349	2017-11-23 19:33:16.179349	5
1082	People On The High Line	\N	2017-11-23 19:33:16.18395	2017-11-23 19:33:16.18395	5
1083	Stray Dog	\N	2017-11-23 19:33:16.189049	2017-11-23 19:33:16.189049	5
1084	Academic	\N	2017-11-23 19:33:16.193713	2017-11-23 19:33:16.193713	5
1085	Nothing But A Fool	\N	2017-11-23 19:33:16.198289	2017-11-23 19:33:16.198289	5
1086	Unlearn This Hatred	\N	2017-11-23 19:33:16.202778	2017-11-23 19:33:16.202778	5
1087	The Game	\N	2017-11-23 19:33:16.207312	2017-11-23 19:33:16.207312	5
1088	Superheated	\N	2017-11-23 19:33:16.211205	2017-11-23 19:33:16.211205	5
1089	The Day Is My Enemy	\N	2017-11-23 19:33:27.182875	2017-11-23 19:33:27.182875	5
1090	Nasty	\N	2017-11-23 19:33:27.186487	2017-11-23 19:33:27.186487	5
1091	Rebel Radio	\N	2017-11-23 19:33:27.190258	2017-11-23 19:33:27.190258	5
1092	Ibiza (feat. Sleaford Mods)	\N	2017-11-23 19:33:27.194967	2017-11-23 19:33:27.194967	5
1093	Destroy	\N	2017-11-23 19:33:27.199765	2017-11-23 19:33:27.199765	5
1094	Wild Frontier	\N	2017-11-23 19:33:27.204409	2017-11-23 19:33:27.204409	5
1095	Rok-Weiler	\N	2017-11-23 19:33:27.209256	2017-11-23 19:33:27.209256	5
1096	Beyond The Deathray	\N	2017-11-23 19:33:27.213743	2017-11-23 19:33:27.213743	5
1097	Rhythm Bomb (feat. Flux Pavilion)	\N	2017-11-23 19:33:27.217666	2017-11-23 19:33:27.217666	5
1098	Roadblox	\N	2017-11-23 19:33:27.221813	2017-11-23 19:33:27.221813	5
1099	Get Your Fight On	\N	2017-11-23 19:33:27.225737	2017-11-23 19:33:27.225737	5
1100	Medicine	\N	2017-11-23 19:33:27.229587	2017-11-23 19:33:27.229587	5
1101	Invisible Sun	\N	2017-11-23 19:33:27.233236	2017-11-23 19:33:27.233236	5
1102	Wall Of Death	\N	2017-11-23 19:33:27.23742	2017-11-23 19:33:27.23742	5
1103	The Day Is My Enemy - Liam H Remix feat. Dope D.O.D.	\N	2017-11-23 19:33:27.241837	2017-11-23 19:33:27.241837	5
1104	Shut 'Em Up	\N	2017-11-23 19:33:27.246063	2017-11-23 19:33:27.246063	5
1105	Get Your Fight On - Live at Alexandra Palace 2015	\N	2017-11-23 19:33:27.250133	2017-11-23 19:33:27.250133	5
1106	Roadblox - Live at Sonicmania Japan 2015	\N	2017-11-23 19:33:27.254184	2017-11-23 19:33:27.254184	5
1107	Roadblox - The Jaguar Skills Ninja Terminator Remix	\N	2017-11-23 19:33:27.257897	2017-11-23 19:33:27.257897	5
1108	Roadblox - Reso Remix	\N	2017-11-23 19:33:27.261752	2017-11-23 19:33:27.261752	5
1109	Medicine - South Central Remix	\N	2017-11-23 19:33:27.264619	2017-11-23 19:33:27.264619	5
1110	AWOL (Strike One)	\N	2017-11-23 19:33:27.267044	2017-11-23 19:33:27.267044	5
1111	Nasty - Spor Remix	\N	2017-11-23 19:33:27.269913	2017-11-23 19:33:27.269913	5
1112	Nasty - Zinc Remix	\N	2017-11-23 19:33:27.272652	2017-11-23 19:33:27.272652	5
1113	Nasty - Onen Remix	\N	2017-11-23 19:33:27.275245	2017-11-23 19:33:27.275245	5
1114	Wild Frontier - KillSonik Remix	\N	2017-11-23 19:33:27.277887	2017-11-23 19:33:27.277887	5
1115	Wild Frontier - Wilkinson Remix	\N	2017-11-23 19:33:27.280619	2017-11-23 19:33:27.280619	5
1116	Wild Frontier - Jessie And The Wolf Remix	\N	2017-11-23 19:33:27.283439	2017-11-23 19:33:27.283439	5
1117	Wild Frontier - Shadow Child VIP Remix	\N	2017-11-23 19:33:27.286224	2017-11-23 19:33:27.286224	5
1118	Ibiza (feat. Sleaford Mods) - Instrumental	\N	2017-11-23 19:33:27.288809	2017-11-23 19:33:27.288809	5
1119	Rebel Radio - Proxy Remix	\N	2017-11-23 19:33:27.291405	2017-11-23 19:33:27.291405	5
1120	Rebel Radio - René LaVice's Start A F***ing Riot Remix	\N	2017-11-23 19:33:27.294418	2017-11-23 19:33:27.294418	5
1121	The Day Is My Enemy - Caspa Remix	\N	2017-11-23 19:33:27.297123	2017-11-23 19:33:27.297123	5
1122	The Day Is My Enemy - Chris Avantgarde Remix	\N	2017-11-23 19:33:27.299805	2017-11-23 19:33:27.299805	5
1123	The Day Is My Enemy - LH Edit	\N	2017-11-23 19:33:27.30222	2017-11-23 19:33:27.30222	5
1124	Happiness	\N	2017-11-23 19:33:39.057015	2017-11-23 19:33:39.057015	5
1125	The Pop Kids	\N	2017-11-23 19:33:39.060432	2017-11-23 19:33:39.060432	5
1126	Twenty-something	\N	2017-11-23 19:33:39.064065	2017-11-23 19:33:39.064065	5
1127	Groovy	\N	2017-11-23 19:33:39.067503	2017-11-23 19:33:39.067503	5
1128	The Dictator Decides	\N	2017-11-23 19:33:39.071012	2017-11-23 19:33:39.071012	5
1129	Pazzo!	\N	2017-11-23 19:33:39.074209	2017-11-23 19:33:39.074209	5
1130	Inner Sanctum	\N	2017-11-23 19:33:39.076954	2017-11-23 19:33:39.076954	5
1131	Undertow	\N	2017-11-23 19:33:39.07984	2017-11-23 19:33:39.07984	5
1132	Sad Robot World	\N	2017-11-23 19:33:39.082634	2017-11-23 19:33:39.082634	5
1133	Say It To Me	\N	2017-11-23 19:33:39.085762	2017-11-23 19:33:39.085762	5
1134	Burn	\N	2017-11-23 19:33:39.090025	2017-11-23 19:33:39.090025	5
1135	Into Thin Air	\N	2017-11-23 19:33:39.094113	2017-11-23 19:33:39.094113	5
1136	Sometimes I Feel So Deserted	\N	2017-11-23 19:33:50.083903	2017-11-23 19:33:50.083903	5
1137	Go	\N	2017-11-23 19:33:50.086801	2017-11-23 19:33:50.086801	5
1138	Under Neon Lights	\N	2017-11-23 19:33:50.089449	2017-11-23 19:33:50.089449	5
1139	EML Ritual	\N	2017-11-23 19:33:50.092001	2017-11-23 19:33:50.092001	5
1140	I'll See You There	\N	2017-11-23 19:33:50.094675	2017-11-23 19:33:50.094675	5
1141	Just Bang	\N	2017-11-23 19:33:50.097255	2017-11-23 19:33:50.097255	5
1142	Reflexion	\N	2017-11-23 19:33:50.099983	2017-11-23 19:33:50.099983	5
1143	Taste Of Honey	\N	2017-11-23 19:33:50.10306	2017-11-23 19:33:50.10306	5
1144	Born In The Echoes	\N	2017-11-23 19:33:50.105762	2017-11-23 19:33:50.105762	5
1145	Radiate	\N	2017-11-23 19:33:50.108391	2017-11-23 19:33:50.108391	5
1146	Wide Open	\N	2017-11-23 19:33:50.110875	2017-11-23 19:33:50.110875	5
1147	Direct Buki - Bonus Track	\N	2017-11-23 19:33:50.113423	2017-11-23 19:33:50.113423	5
1148	Let Us Build A City - Bonus Track	\N	2017-11-23 19:33:50.116027	2017-11-23 19:33:50.116027	5
1149	Wo Ha - Bonus Track	\N	2017-11-23 19:33:50.118658	2017-11-23 19:33:50.118658	5
1150	Go - Extended Mix / Bonus Track	\N	2017-11-23 19:33:50.121207	2017-11-23 19:33:50.121207	5
1151	Reflexion - Extended Mix / Bonus Track	\N	2017-11-23 19:33:50.123844	2017-11-23 19:33:50.123844	5
1152	Hello (To FOH)/Ready?! (To The Band) - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.630483	2017-11-23 19:40:48.630483	18
1153	Call Any Vegetable - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.636959	2017-11-23 19:40:48.636959	18
1154	Anyway The Wind Blows - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.641037	2017-11-23 19:40:48.641037	18
1155	Magdalena - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.646414	2017-11-23 19:40:48.646414	18
1156	Dog Breath - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.651013	2017-11-23 19:40:48.651013	18
1157	Peaches En Regalia - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.65583	2017-11-23 19:40:48.65583	18
1158	Tears Began To Fall - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.660247	2017-11-23 19:40:48.660247	18
1159	Shove It Right In - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.664345	2017-11-23 19:40:48.664345	18
1160	King Kong - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.668111	2017-11-23 19:40:48.668111	18
1161	200 Motels Finale - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.672735	2017-11-23 19:40:48.672735	18
1162	Who Are The Brain Police? - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.677892	2017-11-23 19:40:48.677892	18
1163	Auspicious Occasion - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.681654	2017-11-23 19:40:48.681654	18
1164	Divan: Once Upon A Time - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.684912	2017-11-23 19:40:48.684912	18
1165	Divan: Sofa #1 - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.687792	2017-11-23 19:40:48.687792	18
1166	Divan: Magic Pig - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.706549	2017-11-23 19:40:48.706549	18
1167	Divan: Stick It Out - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.709607	2017-11-23 19:40:48.709607	18
1168	Divan: Divan Ends Here - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.712016	2017-11-23 19:40:48.712016	18
1169	Pound For A Brown - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.714593	2017-11-23 19:40:48.714593	18
1170	Sleeping In A Jar - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.717083	2017-11-23 19:40:48.717083	18
1171	Wonderful Wino - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.719775	2017-11-23 19:40:48.719775	18
1172	Sharleena - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.722729	2017-11-23 19:40:48.722729	18
1173	Cruising For Burgers - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.726102	2017-11-23 19:40:48.726102	18
1174	Billy The Mountain - Pt. 1/Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.729267	2017-11-23 19:40:48.729267	18
1175	Billy The Mountain - Live At Carnegie Hall/1971/The Carnegie Solos	\N	2017-11-23 19:40:48.732286	2017-11-23 19:40:48.732286	18
1176	Billy The Mountain - Pt. 2/Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.735218	2017-11-23 19:40:48.735218	18
1177	The $600 Mud Shark Prelude - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.737786	2017-11-23 19:40:48.737786	18
1178	The Mud Shark - Live At Carnegie Hall/1971	\N	2017-11-23 19:40:48.740627	2017-11-23 19:40:48.740627	18
1179	Sensing Elements	\N	2017-11-23 19:41:10.328566	2017-11-23 19:41:10.328566	18
1180	Roll the Seven Twice	\N	2017-11-23 19:41:10.333312	2017-11-23 19:41:10.333312	18
1181	Granular Blankets	\N	2017-11-23 19:41:10.338708	2017-11-23 19:41:10.338708	18
1182	It Is Time to Leave When Everyone Is Dancing	\N	2017-11-23 19:41:10.343931	2017-11-23 19:41:10.343931	18
1183	Identity Proven Matrix	\N	2017-11-23 19:41:10.349191	2017-11-23 19:41:10.349191	18
1184	Non-Locality Destination	\N	2017-11-23 19:41:10.354494	2017-11-23 19:41:10.354494	18
1185	Proton Bonfire	\N	2017-11-23 19:41:10.359776	2017-11-23 19:41:10.359776	18
1186	Tear Down the Grey Skies	\N	2017-11-23 19:41:10.36361	2017-11-23 19:41:10.36361	18
1187	Genesis of Precious Thoughts	\N	2017-11-23 19:41:10.368005	2017-11-23 19:41:10.368005	18
1188	Feelin' Fine	\N	2017-11-23 19:41:22.112856	2017-11-23 19:41:22.112856	18
1189	Don't Be A Fool	\N	2017-11-23 19:41:22.117182	2017-11-23 19:41:22.117182	18
1190	Driftin'	\N	2017-11-23 19:41:22.12145	2017-11-23 19:41:22.12145	18
1191	Jet Black	\N	2017-11-23 19:41:22.126169	2017-11-23 19:41:22.126169	18
1192	Chinchilla	\N	2017-11-23 19:41:22.129963	2017-11-23 19:41:22.129963	18
1193	Saturday Dance	\N	2017-11-23 19:41:22.133913	2017-11-23 19:41:22.133913	18
1194	Lonesome Fella	\N	2017-11-23 19:41:22.137898	2017-11-23 19:41:22.137898	18
1195	Bongo Blues	\N	2017-11-23 19:41:22.142949	2017-11-23 19:41:22.142949	18
1196	Apache	\N	2017-11-23 19:41:22.147784	2017-11-23 19:41:22.147784	18
1197	Quartermaster's Stores	\N	2017-11-23 19:41:22.152678	2017-11-23 19:41:22.152678	18
1198	Man Of Mystery	\N	2017-11-23 19:41:22.157317	2017-11-23 19:41:22.157317	18
1199	The Stranger	\N	2017-11-23 19:41:22.161314	2017-11-23 19:41:22.161314	18
1200	Mustang	\N	2017-11-23 19:41:22.165132	2017-11-23 19:41:22.165132	18
1201	The Theme From 'Shane'	\N	2017-11-23 19:41:22.16953	2017-11-23 19:41:22.16953	18
1202	Shotgun	\N	2017-11-23 19:41:22.174922	2017-11-23 19:41:22.174922	18
1203	The Theme From 'Giant'	\N	2017-11-23 19:41:22.180167	2017-11-23 19:41:22.180167	18
1204	F.B.I. - 2013 - Remaster [Stereo]	\N	2017-11-23 19:41:22.185232	2017-11-23 19:41:22.185232	18
1205	Midnight	\N	2017-11-23 19:41:22.189622	2017-11-23 19:41:22.189622	18
1206	The Frightened City	\N	2017-11-23 19:41:22.193687	2017-11-23 19:41:22.193687	18
1207	Back Home	\N	2017-11-23 19:41:22.197591	2017-11-23 19:41:22.197591	18
1208	Kon-Tiki	\N	2017-11-23 19:41:22.201559	2017-11-23 19:41:22.201559	18
1209	36-24-36	\N	2017-11-23 19:41:22.205449	2017-11-23 19:41:22.205449	18
1210	Shadoogie	\N	2017-11-23 19:41:22.209463	2017-11-23 19:41:22.209463	18
1211	Blue Star	\N	2017-11-23 19:41:22.21341	2017-11-23 19:41:22.21341	18
1212	Nivram	\N	2017-11-23 19:41:22.217303	2017-11-23 19:41:22.217303	18
1213	Baby My Heart	\N	2017-11-23 19:41:22.220812	2017-11-23 19:41:22.220812	18
1214	See You In My Drums	\N	2017-11-23 19:41:22.224507	2017-11-23 19:41:22.224507	18
1215	All My Sorrows	\N	2017-11-23 19:41:22.228532	2017-11-23 19:41:22.228532	18
1216	Stand Up And Say That	\N	2017-11-23 19:41:22.233048	2017-11-23 19:41:22.233048	18
1217	Gonzales	\N	2017-11-23 19:41:22.237536	2017-11-23 19:41:22.237536	18
1218	Find Me A Golden Street	\N	2017-11-23 19:41:22.242229	2017-11-23 19:41:22.242229	18
1219	Theme From A Filleted Place	\N	2017-11-23 19:41:22.246726	2017-11-23 19:41:22.246726	18
1220	That's My Desire	\N	2017-11-23 19:41:22.250127	2017-11-23 19:41:22.250127	18
1221	My Resistance Is Low	\N	2017-11-23 19:41:22.254126	2017-11-23 19:41:22.254126	18
1222	Sleepwalk	\N	2017-11-23 19:41:22.25794	2017-11-23 19:41:22.25794	18
1223	Big Boy	\N	2017-11-23 19:41:22.260935	2017-11-23 19:41:22.260935	18
1224	The Savage	\N	2017-11-23 19:41:22.263883	2017-11-23 19:41:22.263883	18
1225	Peace Pipe	\N	2017-11-23 19:41:22.266789	2017-11-23 19:41:22.266789	18
1226	Wonderful Land	\N	2017-11-23 19:41:22.269858	2017-11-23 19:41:22.269858	18
1227	Stars Fell On Stockton	\N	2017-11-23 19:41:22.272851	2017-11-23 19:41:22.272851	18
1228	Guitar Tango	\N	2017-11-23 19:41:22.276072	2017-11-23 19:41:22.276072	18
1229	What A Lovely Tune - Unissued Version	\N	2017-11-23 19:41:22.279464	2017-11-23 19:41:22.279464	18
1230	The Theme from 'The Boys'	\N	2017-11-23 19:41:22.282796	2017-11-23 19:41:22.282796	18
1231	The Girls	\N	2017-11-23 19:41:22.286443	2017-11-23 19:41:22.286443	18
1232	Sweet Dreams	\N	2017-11-23 19:41:22.290247	2017-11-23 19:41:22.290247	18
1233	The Boys - 2013 - Remaster [Stereo]	\N	2017-11-23 19:41:22.29421	2017-11-23 19:41:22.29421	18
1234	The Rumble	\N	2017-11-23 19:41:22.297488	2017-11-23 19:41:22.297488	18
1235	The Bandit	\N	2017-11-23 19:41:22.300105	2017-11-23 19:41:22.300105	18
1236	Cosy	\N	2017-11-23 19:41:22.303304	2017-11-23 19:41:22.303304	18
1237	1861	\N	2017-11-23 19:41:22.306304	2017-11-23 19:41:22.306304	18
1238	Telstar	\N	2017-11-23 19:41:34.21065	2017-11-23 19:41:34.21065	18
1239	Red Roses and a Sky of Blue	\N	2017-11-23 19:41:34.2148	2017-11-23 19:41:34.2148	18
1240	Chasing Moonbeams	\N	2017-11-23 19:41:34.218768	2017-11-23 19:41:34.218768	18
1241	Earthy	\N	2017-11-23 19:41:34.22357	2017-11-23 19:41:34.22357	18
1242	Swinging Beefeater	\N	2017-11-23 19:41:34.228687	2017-11-23 19:41:34.228687	18
1243	Theme (From "A Summer Place")	\N	2017-11-23 19:41:34.233818	2017-11-23 19:41:34.233818	18
1244	Love and Fury	\N	2017-11-23 19:41:34.238402	2017-11-23 19:41:34.238402	18
1245	Dreamin' on a Cloud	\N	2017-11-23 19:41:34.242945	2017-11-23 19:41:34.242945	18
1246	Ridin' the Wind	\N	2017-11-23 19:41:34.247387	2017-11-23 19:41:34.247387	18
1247	The Breeze and I	\N	2017-11-23 19:41:34.251933	2017-11-23 19:41:34.251933	18
1248	Jungle Fever	\N	2017-11-23 19:41:34.256315	2017-11-23 19:41:34.256315	18
1249	Popeye Twist	\N	2017-11-23 19:41:34.260182	2017-11-23 19:41:34.260182	18
1250	Going Backwards - Radio Edit	\N	2017-11-23 19:44:13.096115	2017-11-23 19:44:13.096115	20
1251	Going Backwards - Chris Liebing Mix	\N	2017-11-23 19:44:13.100903	2017-11-23 19:44:13.100903	20
1252	Going Backwards - Chris Liebing Burn Slow Mix	\N	2017-11-23 19:44:13.104835	2017-11-23 19:44:13.104835	20
1253	Going Backwards - Solomun Extended Radio Remix	\N	2017-11-23 19:44:13.108811	2017-11-23 19:44:13.108811	20
1254	Going Backwards - Solomun Remix Radio Version	\N	2017-11-23 19:44:13.112466	2017-11-23 19:44:13.112466	20
1255	Going Backwards - Solomun Club Remix	\N	2017-11-23 19:44:13.116385	2017-11-23 19:44:13.116385	20
1256	Going Backwards - The Belleville Three Full Vocal Mix	\N	2017-11-23 19:44:13.120159	2017-11-23 19:44:13.120159	20
1257	Going Backwards - The Belleville Three Deep Bass Dub	\N	2017-11-23 19:44:13.124301	2017-11-23 19:44:13.124301	20
1258	Going Backwards - The Belleville Three Raw Detroit Dub	\N	2017-11-23 19:44:13.129124	2017-11-23 19:44:13.129124	20
1259	Going Backwards - The Belleville Three Full Vocal Mix Radio Edit	\N	2017-11-23 19:44:13.133933	2017-11-23 19:44:13.133933	20
1260	Going Backwards - Point Point Remix	\N	2017-11-23 19:44:13.137413	2017-11-23 19:44:13.137413	20
1261	Going Backwards - Maya Jane Coles Remix	\N	2017-11-23 19:44:13.140972	2017-11-23 19:44:13.140972	20
1262	Poison Heart - Soulsavers Re-Work	\N	2017-11-23 19:44:13.143786	2017-11-23 19:44:13.143786	20
1263	You Move - Latroit Remix	\N	2017-11-23 19:44:13.147066	2017-11-23 19:44:13.147066	20
1264	Autobahn - 3-D	\N	2017-11-23 19:44:24.068063	2017-11-23 19:44:24.068063	20
1265	Kometenmelodie 1 / Kometenmelodie 2 / Mitternacht / Morgenspaziergang - 3-D	\N	2017-11-23 19:44:24.070584	2017-11-23 19:44:24.070584	20
1266	Geigerzähler / Radioaktivität - 3-D	\N	2017-11-23 19:44:24.072781	2017-11-23 19:44:24.072781	20
1267	Radioland - 3-D	\N	2017-11-23 19:44:24.075969	2017-11-23 19:44:24.075969	20
1268	Äetherwellen - 3-D	\N	2017-11-23 19:44:24.079049	2017-11-23 19:44:24.079049	20
1269	Senderpause / Nachrichten / Die Stimme Der Energie - 3-D	\N	2017-11-23 19:44:24.081687	2017-11-23 19:44:24.081687	20
1270	Atenne - 3-D	\N	2017-11-23 19:44:24.084489	2017-11-23 19:44:24.084489	20
1271	Radio Sterne / Uran / Transistor / Ohm Sweet Ohm - 3-D	\N	2017-11-23 19:44:24.087101	2017-11-23 19:44:24.087101	20
1272	Trans Europa Express / Metall Auf Metall / Abzug - 3-D	\N	2017-11-23 19:44:24.089757	2017-11-23 19:44:24.089757	20
1273	Franz Schubert / Europa Endlos - 3-D	\N	2017-11-23 19:44:24.092385	2017-11-23 19:44:24.092385	20
1274	Spiegelsaal - 3-D	\N	2017-11-23 19:44:24.095524	2017-11-23 19:44:24.095524	20
1275	Schaufensterpuppen - 3-D	\N	2017-11-23 19:44:24.099059	2017-11-23 19:44:24.099059	20
1276	Die Mensch-Maschine - 3-D	\N	2017-11-23 19:44:24.103389	2017-11-23 19:44:24.103389	20
1277	Spacelab - 3-D	\N	2017-11-23 19:44:24.107496	2017-11-23 19:44:24.107496	20
1278	Das Model - 3-D	\N	2017-11-23 19:44:24.111345	2017-11-23 19:44:24.111345	20
1279	Neonlicht - 3-D	\N	2017-11-23 19:44:24.114948	2017-11-23 19:44:24.114948	20
1280	Die Roboter - 3-D	\N	2017-11-23 19:44:24.11772	2017-11-23 19:44:24.11772	20
1281	Metropolis - 3-D	\N	2017-11-23 19:44:24.120431	2017-11-23 19:44:24.120431	20
1282	Nummern / Computerwelt - 3-D	\N	2017-11-23 19:44:24.123093	2017-11-23 19:44:24.123093	20
1283	It's More Fun To Compute / Heim Computer - 3-D	\N	2017-11-23 19:44:24.126693	2017-11-23 19:44:24.126693	20
1284	Computer Liebe - 3-D	\N	2017-11-23 19:44:24.130639	2017-11-23 19:44:24.130639	20
1285	Taschenrechner / Dentaku - 3-D	\N	2017-11-23 19:44:24.135294	2017-11-23 19:44:24.135294	20
1286	Electric Cafe - 3-D	\N	2017-11-23 19:44:24.13964	2017-11-23 19:44:24.13964	20
1287	Der Telefon Anruf / House Phone - 3-D	\N	2017-11-23 19:44:24.14403	2017-11-23 19:44:24.14403	20
1288	Sex Objekt - 3-D	\N	2017-11-23 19:44:24.148498	2017-11-23 19:44:24.148498	20
1289	Boing Boom Tschak - 3-D	\N	2017-11-23 19:44:24.152899	2017-11-23 19:44:24.152899	20
1290	Techno Pop - 3-D	\N	2017-11-23 19:44:24.157297	2017-11-23 19:44:24.157297	20
1291	Musik Non Stop - 3-D	\N	2017-11-23 19:44:24.161235	2017-11-23 19:44:24.161235	20
1292	Die Roboter - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.165214	2017-11-23 19:44:24.165214	20
1293	Computer Liebe - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.169336	2017-11-23 19:44:24.169336	20
1294	Taschenrechner / Dentaku - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.173818	2017-11-23 19:44:24.173818	20
1295	Autobahn - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.178287	2017-11-23 19:44:24.178287	20
1296	Geigerzähler / Radioaktivität - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.182544	2017-11-23 19:44:24.182544	20
1297	Trans Europa Express / Metall Auf Metall / Abzug - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.187036	2017-11-23 19:44:24.187036	20
1298	It's More Fun To Compute / Heim Computer - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.191486	2017-11-23 19:44:24.191486	20
1299	Boing Boom Tschak / Techno Pop / Musik Non Stop - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.195814	2017-11-23 19:44:24.195814	20
1300	Planet Der Visionen - Headphone Surround 3-D Mix	\N	2017-11-23 19:44:24.200007	2017-11-23 19:44:24.200007	20
1301	Tour De France / Prologue / Etape 1 / Chrono / Etape 2 - 3-D	\N	2017-11-23 19:44:24.204958	2017-11-23 19:44:24.204958	20
1302	Vitamin - 3-D	\N	2017-11-23 19:44:24.209436	2017-11-23 19:44:24.209436	20
1303	Aero Dynamik - 3-D	\N	2017-11-23 19:44:24.213343	2017-11-23 19:44:24.213343	20
1304	Elektro Kardiogramm - 3-D	\N	2017-11-23 19:44:24.217176	2017-11-23 19:44:24.217176	20
1305	La Forme / Régéneration - 3-D	\N	2017-11-23 19:44:24.221251	2017-11-23 19:44:24.221251	20
1306	Restless - Extended Mix	\N	2017-11-23 19:44:36.097028	2017-11-23 19:44:36.097028	20
1307	Singularity - Extended Mix	\N	2017-11-23 19:44:36.099966	2017-11-23 19:44:36.099966	20
1308	Plastic - Extended Mix	\N	2017-11-23 19:44:36.102357	2017-11-23 19:44:36.102357	20
1309	Tutti Frutti - Extended Mix	\N	2017-11-23 19:44:36.104922	2017-11-23 19:44:36.104922	20
1310	People on the High Line - Extended Mix	\N	2017-11-23 19:44:36.107246	2017-11-23 19:44:36.107246	20
1311	Stray Dog - Extended Mix	\N	2017-11-23 19:44:36.110108	2017-11-23 19:44:36.110108	20
1312	Academic - Extended Mix	\N	2017-11-23 19:44:36.11302	2017-11-23 19:44:36.11302	20
1313	Nothing but a Fool - Extended Mix 2	\N	2017-11-23 19:44:36.116042	2017-11-23 19:44:36.116042	20
1314	Unlearn this Hatred - Extended Mix	\N	2017-11-23 19:44:36.120467	2017-11-23 19:44:36.120467	20
1315	The Game - Extended Mix	\N	2017-11-23 19:44:36.126335	2017-11-23 19:44:36.126335	20
1316	Superheated - Extended Mix 2	\N	2017-11-23 19:44:36.131076	2017-11-23 19:44:36.131076	20
1317	Restless	\N	2017-11-23 19:44:36.135723	2017-11-23 19:44:36.135723	20
1318	Singularity	\N	2017-11-23 19:44:36.140029	2017-11-23 19:44:36.140029	20
1319	Plastic	\N	2017-11-23 19:44:36.144333	2017-11-23 19:44:36.144333	20
1320	Tutti Frutti	\N	2017-11-23 19:44:36.148548	2017-11-23 19:44:36.148548	20
1321	People On The High Line	\N	2017-11-23 19:44:36.152959	2017-11-23 19:44:36.152959	20
1322	Stray Dog	\N	2017-11-23 19:44:36.157253	2017-11-23 19:44:36.157253	20
1323	Academic	\N	2017-11-23 19:44:36.161581	2017-11-23 19:44:36.161581	20
1324	Nothing But A Fool	\N	2017-11-23 19:44:36.165505	2017-11-23 19:44:36.165505	20
1325	Unlearn This Hatred	\N	2017-11-23 19:44:36.170187	2017-11-23 19:44:36.170187	20
1326	The Game	\N	2017-11-23 19:44:36.174852	2017-11-23 19:44:36.174852	20
1327	Superheated	\N	2017-11-23 19:44:36.179784	2017-11-23 19:44:36.179784	20
1328	Pray For Rain	\N	2017-11-23 19:44:47.047218	2017-11-23 19:44:47.047218	20
1329	Babel	\N	2017-11-23 19:44:47.051506	2017-11-23 19:44:47.051506	20
1330	Splitting The Atom	\N	2017-11-23 19:44:47.055635	2017-11-23 19:44:47.055635	20
1331	Girl I Love You	\N	2017-11-23 19:44:47.059437	2017-11-23 19:44:47.059437	20
1332	Psyche	\N	2017-11-23 19:44:47.063293	2017-11-23 19:44:47.063293	20
1333	Flat Of The Blade	\N	2017-11-23 19:44:47.067601	2017-11-23 19:44:47.067601	20
1334	Paradise Circus	\N	2017-11-23 19:44:47.072064	2017-11-23 19:44:47.072064	20
1335	Rush Minute	\N	2017-11-23 19:44:47.076408	2017-11-23 19:44:47.076408	20
1336	Saturday Come Slow	\N	2017-11-23 19:44:47.081175	2017-11-23 19:44:47.081175	20
1337	Atlas Air - Instrumental	\N	2017-11-23 19:44:47.085947	2017-11-23 19:44:47.085947	20
1338	Paradise Circus - Gui Boratto Remix	\N	2017-11-23 19:44:47.090439	2017-11-23 19:44:47.090439	20
1339	Fatalism - Ryuichi Sakamoto & Yukihiro Takahashi Remix	\N	2017-11-23 19:44:47.093965	2017-11-23 19:44:47.093965	20
1340	Girl I Love You - She is Danger Remix	\N	2017-11-23 19:44:47.098501	2017-11-23 19:44:47.098501	20
1341	Paradise Circus - Breakage's Tight Rope Remix	\N	2017-11-23 19:44:47.103146	2017-11-23 19:44:47.103146	20
1342	Give Life Back to Music	\N	2017-11-23 19:44:57.933073	2017-11-23 19:44:57.933073	20
1343	The Game of Love	\N	2017-11-23 19:44:57.938285	2017-11-23 19:44:57.938285	20
1344	Giorgio by Moroder	\N	2017-11-23 19:44:57.94302	2017-11-23 19:44:57.94302	20
1345	Within	\N	2017-11-23 19:44:57.947779	2017-11-23 19:44:57.947779	20
1346	Instant Crush	\N	2017-11-23 19:44:57.952568	2017-11-23 19:44:57.952568	20
1347	Lose Yourself to Dance	\N	2017-11-23 19:44:57.957418	2017-11-23 19:44:57.957418	20
1348	Touch	\N	2017-11-23 19:44:57.961574	2017-11-23 19:44:57.961574	20
1349	Get Lucky	\N	2017-11-23 19:44:57.965354	2017-11-23 19:44:57.965354	20
1350	Beyond	\N	2017-11-23 19:44:57.969419	2017-11-23 19:44:57.969419	20
1351	Motherboard	\N	2017-11-23 19:44:57.973432	2017-11-23 19:44:57.973432	20
1352	Fragments of Time	\N	2017-11-23 19:44:57.977414	2017-11-23 19:44:57.977414	20
1353	Doin' it Right	\N	2017-11-23 19:44:57.981464	2017-11-23 19:44:57.981464	20
1354	Contact	\N	2017-11-23 19:44:57.986038	2017-11-23 19:44:57.986038	20
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('songs_id_seq', 1354, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY tracks (id, album_id, song_id, created_at, updated_at) FROM stdin;
44	11	36	2017-11-23 18:54:16.638324	2017-11-23 18:54:16.638324
45	11	37	2017-11-23 18:54:16.645291	2017-11-23 18:54:16.645291
46	11	38	2017-11-23 18:54:16.650739	2017-11-23 18:54:16.650739
47	11	39	2017-11-23 18:54:16.65821	2017-11-23 18:54:16.65821
48	11	40	2017-11-23 18:54:16.664811	2017-11-23 18:54:16.664811
49	11	41	2017-11-23 18:54:16.671262	2017-11-23 18:54:16.671262
50	11	42	2017-11-23 18:54:16.677131	2017-11-23 18:54:16.677131
51	11	43	2017-11-23 18:54:16.683153	2017-11-23 18:54:16.683153
52	11	44	2017-11-23 18:54:16.689622	2017-11-23 18:54:16.689622
53	11	45	2017-11-23 18:54:16.696465	2017-11-23 18:54:16.696465
54	11	46	2017-11-23 18:54:16.701959	2017-11-23 18:54:16.701959
55	11	47	2017-11-23 18:54:16.70729	2017-11-23 18:54:16.70729
56	11	48	2017-11-23 18:54:16.712759	2017-11-23 18:54:16.712759
57	11	49	2017-11-23 18:54:16.718238	2017-11-23 18:54:16.718238
58	11	50	2017-11-23 18:54:16.724082	2017-11-23 18:54:16.724082
59	11	51	2017-11-23 18:54:16.728677	2017-11-23 18:54:16.728677
60	11	52	2017-11-23 18:54:16.733173	2017-11-23 18:54:16.733173
61	12	53	2017-11-23 18:54:28.206349	2017-11-23 18:54:28.206349
62	12	54	2017-11-23 18:54:28.210869	2017-11-23 18:54:28.210869
63	12	55	2017-11-23 18:54:28.21608	2017-11-23 18:54:28.21608
64	12	56	2017-11-23 18:54:28.220945	2017-11-23 18:54:28.220945
65	12	57	2017-11-23 18:54:28.225296	2017-11-23 18:54:28.225296
66	12	58	2017-11-23 18:54:28.22955	2017-11-23 18:54:28.22955
67	12	59	2017-11-23 18:54:28.23379	2017-11-23 18:54:28.23379
68	12	60	2017-11-23 18:54:28.238244	2017-11-23 18:54:28.238244
69	12	61	2017-11-23 18:54:28.242627	2017-11-23 18:54:28.242627
70	12	62	2017-11-23 18:54:28.24732	2017-11-23 18:54:28.24732
71	13	63	2017-11-23 18:54:39.730998	2017-11-23 18:54:39.730998
72	13	64	2017-11-23 18:54:39.735283	2017-11-23 18:54:39.735283
73	13	65	2017-11-23 18:54:39.740619	2017-11-23 18:54:39.740619
74	13	66	2017-11-23 18:54:39.746355	2017-11-23 18:54:39.746355
75	13	67	2017-11-23 18:54:39.752204	2017-11-23 18:54:39.752204
76	13	68	2017-11-23 18:54:39.758635	2017-11-23 18:54:39.758635
77	13	69	2017-11-23 18:54:39.764552	2017-11-23 18:54:39.764552
78	13	70	2017-11-23 18:54:39.772627	2017-11-23 18:54:39.772627
79	13	71	2017-11-23 18:54:39.778683	2017-11-23 18:54:39.778683
80	13	72	2017-11-23 18:54:39.784489	2017-11-23 18:54:39.784489
81	13	73	2017-11-23 18:54:39.790091	2017-11-23 18:54:39.790091
82	13	74	2017-11-23 18:54:39.795601	2017-11-23 18:54:39.795601
83	13	75	2017-11-23 18:54:39.801079	2017-11-23 18:54:39.801079
84	13	76	2017-11-23 18:54:39.806535	2017-11-23 18:54:39.806535
85	13	77	2017-11-23 18:54:39.811915	2017-11-23 18:54:39.811915
86	13	78	2017-11-23 18:54:39.817575	2017-11-23 18:54:39.817575
87	13	79	2017-11-23 18:54:39.823523	2017-11-23 18:54:39.823523
88	14	80	2017-11-23 18:54:51.213187	2017-11-23 18:54:51.213187
89	14	81	2017-11-23 18:54:51.218734	2017-11-23 18:54:51.218734
90	14	82	2017-11-23 18:54:51.22415	2017-11-23 18:54:51.22415
91	14	83	2017-11-23 18:54:51.229607	2017-11-23 18:54:51.229607
92	14	84	2017-11-23 18:54:51.235661	2017-11-23 18:54:51.235661
93	14	85	2017-11-23 18:54:51.241581	2017-11-23 18:54:51.241581
94	14	86	2017-11-23 18:54:51.247483	2017-11-23 18:54:51.247483
95	14	87	2017-11-23 18:54:51.25353	2017-11-23 18:54:51.25353
96	14	88	2017-11-23 18:54:51.260947	2017-11-23 18:54:51.260947
97	14	89	2017-11-23 18:54:51.266731	2017-11-23 18:54:51.266731
98	15	90	2017-11-23 18:55:02.166125	2017-11-23 18:55:02.166125
99	15	91	2017-11-23 18:55:02.172533	2017-11-23 18:55:02.172533
100	15	92	2017-11-23 18:55:02.178689	2017-11-23 18:55:02.178689
101	15	93	2017-11-23 18:55:02.18459	2017-11-23 18:55:02.18459
102	15	94	2017-11-23 18:55:02.190237	2017-11-23 18:55:02.190237
103	15	95	2017-11-23 18:55:02.19611	2017-11-23 18:55:02.19611
104	15	96	2017-11-23 18:55:02.201929	2017-11-23 18:55:02.201929
105	15	97	2017-11-23 18:55:02.207764	2017-11-23 18:55:02.207764
106	15	98	2017-11-23 18:55:02.213429	2017-11-23 18:55:02.213429
107	15	99	2017-11-23 18:55:02.218762	2017-11-23 18:55:02.218762
108	16	100	2017-11-23 18:55:31.274301	2017-11-23 18:55:31.274301
109	16	101	2017-11-23 18:55:31.279641	2017-11-23 18:55:31.279641
110	16	102	2017-11-23 18:55:31.284775	2017-11-23 18:55:31.284775
111	16	103	2017-11-23 18:55:31.290315	2017-11-23 18:55:31.290315
112	16	104	2017-11-23 18:55:31.297379	2017-11-23 18:55:31.297379
113	16	105	2017-11-23 18:55:31.304669	2017-11-23 18:55:31.304669
114	16	106	2017-11-23 18:55:31.310748	2017-11-23 18:55:31.310748
115	16	107	2017-11-23 18:55:31.316979	2017-11-23 18:55:31.316979
116	16	108	2017-11-23 18:55:31.323353	2017-11-23 18:55:31.323353
117	16	109	2017-11-23 18:55:31.329037	2017-11-23 18:55:31.329037
118	16	110	2017-11-23 18:55:31.334773	2017-11-23 18:55:31.334773
119	16	111	2017-11-23 18:55:31.341277	2017-11-23 18:55:31.341277
120	17	112	2017-11-23 18:55:42.431807	2017-11-23 18:55:42.431807
121	17	113	2017-11-23 18:55:42.43645	2017-11-23 18:55:42.43645
122	17	114	2017-11-23 18:55:42.440899	2017-11-23 18:55:42.440899
123	17	115	2017-11-23 18:55:42.445413	2017-11-23 18:55:42.445413
124	17	116	2017-11-23 18:55:42.453026	2017-11-23 18:55:42.453026
125	17	117	2017-11-23 18:55:42.45919	2017-11-23 18:55:42.45919
126	17	118	2017-11-23 18:55:42.464325	2017-11-23 18:55:42.464325
127	17	119	2017-11-23 18:55:42.469156	2017-11-23 18:55:42.469156
128	17	120	2017-11-23 18:55:42.474529	2017-11-23 18:55:42.474529
129	17	121	2017-11-23 18:55:42.480188	2017-11-23 18:55:42.480188
130	17	122	2017-11-23 18:55:42.485948	2017-11-23 18:55:42.485948
131	17	123	2017-11-23 18:55:42.491953	2017-11-23 18:55:42.491953
132	17	124	2017-11-23 18:55:42.498772	2017-11-23 18:55:42.498772
133	17	125	2017-11-23 18:55:42.504863	2017-11-23 18:55:42.504863
134	17	126	2017-11-23 18:55:42.510602	2017-11-23 18:55:42.510602
135	18	127	2017-11-23 18:55:54.403415	2017-11-23 18:55:54.403415
136	18	128	2017-11-23 18:55:54.411736	2017-11-23 18:55:54.411736
137	18	129	2017-11-23 18:55:54.41874	2017-11-23 18:55:54.41874
138	18	130	2017-11-23 18:55:54.425219	2017-11-23 18:55:54.425219
139	18	131	2017-11-23 18:55:54.435086	2017-11-23 18:55:54.435086
140	18	132	2017-11-23 18:55:54.440767	2017-11-23 18:55:54.440767
141	18	133	2017-11-23 18:55:54.445478	2017-11-23 18:55:54.445478
142	18	134	2017-11-23 18:55:54.449805	2017-11-23 18:55:54.449805
143	18	135	2017-11-23 18:55:54.453952	2017-11-23 18:55:54.453952
144	18	136	2017-11-23 18:55:54.458667	2017-11-23 18:55:54.458667
145	18	137	2017-11-23 18:55:54.464005	2017-11-23 18:55:54.464005
146	18	138	2017-11-23 18:55:54.469248	2017-11-23 18:55:54.469248
147	18	139	2017-11-23 18:55:54.474067	2017-11-23 18:55:54.474067
148	18	140	2017-11-23 18:55:54.478086	2017-11-23 18:55:54.478086
149	18	141	2017-11-23 18:55:54.482329	2017-11-23 18:55:54.482329
150	18	142	2017-11-23 18:55:54.487223	2017-11-23 18:55:54.487223
151	18	143	2017-11-23 18:55:54.491829	2017-11-23 18:55:54.491829
152	19	144	2017-11-23 18:56:06.374244	2017-11-23 18:56:06.374244
153	19	145	2017-11-23 18:56:06.394325	2017-11-23 18:56:06.394325
154	19	146	2017-11-23 18:56:06.399612	2017-11-23 18:56:06.399612
155	19	147	2017-11-23 18:56:06.405005	2017-11-23 18:56:06.405005
156	19	148	2017-11-23 18:56:06.411276	2017-11-23 18:56:06.411276
157	19	149	2017-11-23 18:56:06.417471	2017-11-23 18:56:06.417471
158	19	150	2017-11-23 18:56:06.423139	2017-11-23 18:56:06.423139
159	19	151	2017-11-23 18:56:06.428821	2017-11-23 18:56:06.428821
160	19	152	2017-11-23 18:56:06.434753	2017-11-23 18:56:06.434753
161	19	153	2017-11-23 18:56:06.440722	2017-11-23 18:56:06.440722
162	19	154	2017-11-23 18:56:06.446714	2017-11-23 18:56:06.446714
163	19	155	2017-11-23 18:56:06.45231	2017-11-23 18:56:06.45231
164	19	156	2017-11-23 18:56:06.458497	2017-11-23 18:56:06.458497
165	19	157	2017-11-23 18:56:06.464758	2017-11-23 18:56:06.464758
166	19	158	2017-11-23 18:56:06.470531	2017-11-23 18:56:06.470531
167	19	159	2017-11-23 18:56:06.4761	2017-11-23 18:56:06.4761
168	19	160	2017-11-23 18:56:06.4816	2017-11-23 18:56:06.4816
169	20	161	2017-11-23 18:56:18.346477	2017-11-23 18:56:18.346477
170	20	162	2017-11-23 18:56:18.352555	2017-11-23 18:56:18.352555
171	20	163	2017-11-23 18:56:18.358685	2017-11-23 18:56:18.358685
172	20	164	2017-11-23 18:56:18.364996	2017-11-23 18:56:18.364996
173	20	165	2017-11-23 18:56:18.371225	2017-11-23 18:56:18.371225
174	20	166	2017-11-23 18:56:18.377607	2017-11-23 18:56:18.377607
175	20	167	2017-11-23 18:56:18.384639	2017-11-23 18:56:18.384639
176	20	168	2017-11-23 18:56:18.393222	2017-11-23 18:56:18.393222
177	20	169	2017-11-23 18:56:18.399629	2017-11-23 18:56:18.399629
178	20	170	2017-11-23 18:56:18.405452	2017-11-23 18:56:18.405452
179	20	171	2017-11-23 18:56:18.417434	2017-11-23 18:56:18.417434
180	20	172	2017-11-23 18:56:18.423389	2017-11-23 18:56:18.423389
181	20	173	2017-11-23 18:56:18.42926	2017-11-23 18:56:18.42926
182	20	174	2017-11-23 18:56:18.435195	2017-11-23 18:56:18.435195
183	20	175	2017-11-23 18:56:18.441892	2017-11-23 18:56:18.441892
184	20	176	2017-11-23 18:56:18.448042	2017-11-23 18:56:18.448042
185	20	177	2017-11-23 18:56:18.454328	2017-11-23 18:56:18.454328
186	20	178	2017-11-23 18:56:18.460737	2017-11-23 18:56:18.460737
187	20	179	2017-11-23 18:56:18.467555	2017-11-23 18:56:18.467555
188	20	180	2017-11-23 18:56:18.473604	2017-11-23 18:56:18.473604
189	20	181	2017-11-23 18:56:18.47957	2017-11-23 18:56:18.47957
190	20	182	2017-11-23 18:56:18.485535	2017-11-23 18:56:18.485535
191	20	183	2017-11-23 18:56:18.491627	2017-11-23 18:56:18.491627
192	20	184	2017-11-23 18:56:18.497645	2017-11-23 18:56:18.497645
193	20	185	2017-11-23 18:56:18.504143	2017-11-23 18:56:18.504143
194	20	186	2017-11-23 18:56:18.510217	2017-11-23 18:56:18.510217
195	20	187	2017-11-23 18:56:18.516272	2017-11-23 18:56:18.516272
196	20	188	2017-11-23 18:56:18.521395	2017-11-23 18:56:18.521395
197	20	189	2017-11-23 18:56:18.525972	2017-11-23 18:56:18.525972
198	21	190	2017-11-23 18:56:56.967327	2017-11-23 18:56:56.967327
199	21	191	2017-11-23 18:56:56.973082	2017-11-23 18:56:56.973082
200	21	192	2017-11-23 18:56:56.97761	2017-11-23 18:56:56.97761
201	21	193	2017-11-23 18:56:56.982061	2017-11-23 18:56:56.982061
202	21	194	2017-11-23 18:56:56.986665	2017-11-23 18:56:56.986665
203	21	195	2017-11-23 18:56:56.991339	2017-11-23 18:56:56.991339
204	21	196	2017-11-23 18:56:56.995895	2017-11-23 18:56:56.995895
205	21	197	2017-11-23 18:56:57.000324	2017-11-23 18:56:57.000324
206	21	198	2017-11-23 18:56:57.005289	2017-11-23 18:56:57.005289
207	21	199	2017-11-23 18:56:57.010634	2017-11-23 18:56:57.010634
208	21	200	2017-11-23 18:56:57.015677	2017-11-23 18:56:57.015677
209	21	201	2017-11-23 18:56:57.020372	2017-11-23 18:56:57.020372
210	21	202	2017-11-23 18:56:57.024873	2017-11-23 18:56:57.024873
211	21	203	2017-11-23 18:56:57.029002	2017-11-23 18:56:57.029002
212	21	204	2017-11-23 18:56:57.033353	2017-11-23 18:56:57.033353
213	21	205	2017-11-23 18:56:57.038167	2017-11-23 18:56:57.038167
214	21	206	2017-11-23 18:56:57.042576	2017-11-23 18:56:57.042576
215	21	207	2017-11-23 18:56:57.046885	2017-11-23 18:56:57.046885
216	21	208	2017-11-23 18:56:57.052083	2017-11-23 18:56:57.052083
217	21	209	2017-11-23 18:56:57.057719	2017-11-23 18:56:57.057719
218	21	210	2017-11-23 18:56:57.063279	2017-11-23 18:56:57.063279
219	21	211	2017-11-23 18:56:57.06889	2017-11-23 18:56:57.06889
220	21	212	2017-11-23 18:56:57.074152	2017-11-23 18:56:57.074152
221	21	213	2017-11-23 18:56:57.079525	2017-11-23 18:56:57.079525
222	21	214	2017-11-23 18:56:57.085206	2017-11-23 18:56:57.085206
223	21	215	2017-11-23 18:56:57.091123	2017-11-23 18:56:57.091123
224	21	216	2017-11-23 18:56:57.097169	2017-11-23 18:56:57.097169
225	21	217	2017-11-23 18:56:57.102872	2017-11-23 18:56:57.102872
226	21	218	2017-11-23 18:56:57.108892	2017-11-23 18:56:57.108892
227	21	219	2017-11-23 18:56:57.115486	2017-11-23 18:56:57.115486
228	21	220	2017-11-23 18:56:57.121963	2017-11-23 18:56:57.121963
229	21	221	2017-11-23 18:56:57.128995	2017-11-23 18:56:57.128995
230	21	222	2017-11-23 18:56:57.135435	2017-11-23 18:56:57.135435
231	22	223	2017-11-23 18:57:08.251058	2017-11-23 18:57:08.251058
232	22	224	2017-11-23 18:57:08.255704	2017-11-23 18:57:08.255704
233	22	225	2017-11-23 18:57:08.260918	2017-11-23 18:57:08.260918
234	22	226	2017-11-23 18:57:08.265335	2017-11-23 18:57:08.265335
235	22	227	2017-11-23 18:57:08.270247	2017-11-23 18:57:08.270247
236	22	228	2017-11-23 18:57:08.275077	2017-11-23 18:57:08.275077
237	22	229	2017-11-23 18:57:08.279538	2017-11-23 18:57:08.279538
238	22	230	2017-11-23 18:57:08.283751	2017-11-23 18:57:08.283751
239	22	231	2017-11-23 18:57:08.288236	2017-11-23 18:57:08.288236
240	22	232	2017-11-23 18:57:08.292549	2017-11-23 18:57:08.292549
241	22	233	2017-11-23 18:57:08.296804	2017-11-23 18:57:08.296804
242	22	234	2017-11-23 18:57:08.301397	2017-11-23 18:57:08.301397
243	22	235	2017-11-23 18:57:08.305503	2017-11-23 18:57:08.305503
244	22	236	2017-11-23 18:57:08.309917	2017-11-23 18:57:08.309917
245	22	237	2017-11-23 18:57:08.314212	2017-11-23 18:57:08.314212
246	22	238	2017-11-23 18:57:08.318865	2017-11-23 18:57:08.318865
247	22	239	2017-11-23 18:57:08.323432	2017-11-23 18:57:08.323432
248	23	240	2017-11-23 18:57:19.19303	2017-11-23 18:57:19.19303
249	23	241	2017-11-23 18:57:19.199363	2017-11-23 18:57:19.199363
250	23	242	2017-11-23 18:57:19.204822	2017-11-23 18:57:19.204822
251	23	243	2017-11-23 18:57:19.210154	2017-11-23 18:57:19.210154
252	23	244	2017-11-23 18:57:19.215716	2017-11-23 18:57:19.215716
253	23	245	2017-11-23 18:57:19.221416	2017-11-23 18:57:19.221416
254	23	246	2017-11-23 18:57:19.227373	2017-11-23 18:57:19.227373
255	23	247	2017-11-23 18:57:19.23314	2017-11-23 18:57:19.23314
256	23	248	2017-11-23 18:57:19.238654	2017-11-23 18:57:19.238654
257	23	249	2017-11-23 18:57:19.243803	2017-11-23 18:57:19.243803
258	23	250	2017-11-23 18:57:19.248074	2017-11-23 18:57:19.248074
259	23	251	2017-11-23 18:57:19.252171	2017-11-23 18:57:19.252171
260	23	252	2017-11-23 18:57:19.259282	2017-11-23 18:57:19.259282
261	23	253	2017-11-23 18:57:19.264825	2017-11-23 18:57:19.264825
262	23	254	2017-11-23 18:57:19.269973	2017-11-23 18:57:19.269973
263	23	255	2017-11-23 18:57:19.274235	2017-11-23 18:57:19.274235
264	23	256	2017-11-23 18:57:19.278659	2017-11-23 18:57:19.278659
265	23	257	2017-11-23 18:57:19.283124	2017-11-23 18:57:19.283124
266	23	258	2017-11-23 18:57:19.287478	2017-11-23 18:57:19.287478
267	23	259	2017-11-23 18:57:19.291616	2017-11-23 18:57:19.291616
268	23	260	2017-11-23 18:57:19.298162	2017-11-23 18:57:19.298162
269	24	261	2017-11-23 18:57:30.160571	2017-11-23 18:57:30.160571
270	24	262	2017-11-23 18:57:30.165957	2017-11-23 18:57:30.165957
271	24	263	2017-11-23 18:57:30.170832	2017-11-23 18:57:30.170832
272	24	264	2017-11-23 18:57:30.176598	2017-11-23 18:57:30.176598
273	24	265	2017-11-23 18:57:30.18197	2017-11-23 18:57:30.18197
274	24	266	2017-11-23 18:57:30.187259	2017-11-23 18:57:30.187259
275	24	267	2017-11-23 18:57:30.19279	2017-11-23 18:57:30.19279
276	24	268	2017-11-23 18:57:30.198719	2017-11-23 18:57:30.198719
277	24	269	2017-11-23 18:57:30.205166	2017-11-23 18:57:30.205166
278	24	270	2017-11-23 18:57:30.212077	2017-11-23 18:57:30.212077
279	24	271	2017-11-23 18:57:30.218043	2017-11-23 18:57:30.218043
280	24	272	2017-11-23 18:57:30.224769	2017-11-23 18:57:30.224769
281	24	273	2017-11-23 18:57:30.230678	2017-11-23 18:57:30.230678
282	24	274	2017-11-23 18:57:30.236584	2017-11-23 18:57:30.236584
283	24	275	2017-11-23 18:57:30.243049	2017-11-23 18:57:30.243049
284	24	276	2017-11-23 18:57:30.249098	2017-11-23 18:57:30.249098
285	24	277	2017-11-23 18:57:30.255243	2017-11-23 18:57:30.255243
286	24	278	2017-11-23 18:57:30.276315	2017-11-23 18:57:30.276315
287	24	279	2017-11-23 18:57:30.280927	2017-11-23 18:57:30.280927
288	24	280	2017-11-23 18:57:30.285246	2017-11-23 18:57:30.285246
289	24	281	2017-11-23 18:57:30.289694	2017-11-23 18:57:30.289694
290	24	282	2017-11-23 18:57:30.294227	2017-11-23 18:57:30.294227
291	24	283	2017-11-23 18:57:30.29957	2017-11-23 18:57:30.29957
292	24	284	2017-11-23 18:57:30.304973	2017-11-23 18:57:30.304973
293	25	285	2017-11-23 18:57:41.303061	2017-11-23 18:57:41.303061
294	25	286	2017-11-23 18:57:41.307839	2017-11-23 18:57:41.307839
295	25	287	2017-11-23 18:57:41.312803	2017-11-23 18:57:41.312803
296	25	288	2017-11-23 18:57:41.317553	2017-11-23 18:57:41.317553
297	25	289	2017-11-23 18:57:41.322603	2017-11-23 18:57:41.322603
298	25	290	2017-11-23 18:57:41.329084	2017-11-23 18:57:41.329084
299	25	291	2017-11-23 18:57:41.334803	2017-11-23 18:57:41.334803
300	25	292	2017-11-23 18:57:41.34083	2017-11-23 18:57:41.34083
301	25	293	2017-11-23 18:57:41.347145	2017-11-23 18:57:41.347145
302	25	294	2017-11-23 18:57:41.35345	2017-11-23 18:57:41.35345
303	25	295	2017-11-23 18:57:41.359186	2017-11-23 18:57:41.359186
304	26	296	2017-11-23 18:58:12.732021	2017-11-23 18:58:12.732021
305	26	297	2017-11-23 18:58:12.750949	2017-11-23 18:58:12.750949
306	26	298	2017-11-23 18:58:12.758235	2017-11-23 18:58:12.758235
307	26	299	2017-11-23 18:58:12.76277	2017-11-23 18:58:12.76277
308	26	300	2017-11-23 18:58:12.767694	2017-11-23 18:58:12.767694
309	26	301	2017-11-23 18:58:12.774256	2017-11-23 18:58:12.774256
310	26	302	2017-11-23 18:58:12.780914	2017-11-23 18:58:12.780914
311	26	303	2017-11-23 18:58:12.786272	2017-11-23 18:58:12.786272
312	27	304	2017-11-23 18:58:24.127718	2017-11-23 18:58:24.127718
313	27	305	2017-11-23 18:58:24.133805	2017-11-23 18:58:24.133805
314	27	306	2017-11-23 18:58:24.139205	2017-11-23 18:58:24.139205
315	27	307	2017-11-23 18:58:24.143814	2017-11-23 18:58:24.143814
316	27	308	2017-11-23 18:58:24.148408	2017-11-23 18:58:24.148408
317	27	309	2017-11-23 18:58:24.153169	2017-11-23 18:58:24.153169
318	27	310	2017-11-23 18:58:24.157604	2017-11-23 18:58:24.157604
319	27	311	2017-11-23 18:58:24.162615	2017-11-23 18:58:24.162615
320	27	312	2017-11-23 18:58:24.167113	2017-11-23 18:58:24.167113
321	27	313	2017-11-23 18:58:24.171608	2017-11-23 18:58:24.171608
322	27	314	2017-11-23 18:58:24.176484	2017-11-23 18:58:24.176484
323	27	315	2017-11-23 18:58:24.181106	2017-11-23 18:58:24.181106
324	27	316	2017-11-23 18:58:24.186187	2017-11-23 18:58:24.186187
325	27	317	2017-11-23 18:58:24.191314	2017-11-23 18:58:24.191314
326	27	318	2017-11-23 18:58:24.195915	2017-11-23 18:58:24.195915
327	27	319	2017-11-23 18:58:24.200366	2017-11-23 18:58:24.200366
328	27	320	2017-11-23 18:58:24.205062	2017-11-23 18:58:24.205062
329	27	321	2017-11-23 18:58:24.21092	2017-11-23 18:58:24.21092
330	27	322	2017-11-23 18:58:24.216846	2017-11-23 18:58:24.216846
331	27	323	2017-11-23 18:58:24.223373	2017-11-23 18:58:24.223373
332	27	324	2017-11-23 18:58:24.22887	2017-11-23 18:58:24.22887
333	27	325	2017-11-23 18:58:24.23429	2017-11-23 18:58:24.23429
334	27	326	2017-11-23 18:58:24.240492	2017-11-23 18:58:24.240492
335	27	327	2017-11-23 18:58:24.247165	2017-11-23 18:58:24.247165
336	27	328	2017-11-23 18:58:24.253093	2017-11-23 18:58:24.253093
337	27	329	2017-11-23 18:58:24.259173	2017-11-23 18:58:24.259173
338	27	330	2017-11-23 18:58:24.265586	2017-11-23 18:58:24.265586
339	27	331	2017-11-23 18:58:24.271596	2017-11-23 18:58:24.271596
340	27	332	2017-11-23 18:58:24.277319	2017-11-23 18:58:24.277319
341	27	333	2017-11-23 18:58:24.283052	2017-11-23 18:58:24.283052
342	27	334	2017-11-23 18:58:24.288361	2017-11-23 18:58:24.288361
343	27	335	2017-11-23 18:58:24.293746	2017-11-23 18:58:24.293746
344	27	336	2017-11-23 18:58:24.298955	2017-11-23 18:58:24.298955
345	27	337	2017-11-23 18:58:24.304421	2017-11-23 18:58:24.304421
346	27	338	2017-11-23 18:58:24.309739	2017-11-23 18:58:24.309739
347	28	339	2017-11-23 18:58:35.10151	2017-11-23 18:58:35.10151
348	28	340	2017-11-23 18:58:35.106634	2017-11-23 18:58:35.106634
349	28	341	2017-11-23 18:58:35.113617	2017-11-23 18:58:35.113617
350	28	342	2017-11-23 18:58:35.117762	2017-11-23 18:58:35.117762
351	28	343	2017-11-23 18:58:35.122041	2017-11-23 18:58:35.122041
352	28	344	2017-11-23 18:58:35.126254	2017-11-23 18:58:35.126254
353	28	345	2017-11-23 18:58:35.13062	2017-11-23 18:58:35.13062
354	28	346	2017-11-23 18:58:35.135133	2017-11-23 18:58:35.135133
355	28	347	2017-11-23 18:58:35.14077	2017-11-23 18:58:35.14077
356	28	348	2017-11-23 18:58:35.147219	2017-11-23 18:58:35.147219
357	28	349	2017-11-23 18:58:35.151299	2017-11-23 18:58:35.151299
358	28	350	2017-11-23 18:58:35.155696	2017-11-23 18:58:35.155696
359	28	351	2017-11-23 18:58:35.159778	2017-11-23 18:58:35.159778
360	28	352	2017-11-23 18:58:35.164025	2017-11-23 18:58:35.164025
361	28	353	2017-11-23 18:58:35.168487	2017-11-23 18:58:35.168487
362	29	354	2017-11-23 18:58:46.346817	2017-11-23 18:58:46.346817
363	29	355	2017-11-23 18:58:46.352608	2017-11-23 18:58:46.352608
364	29	356	2017-11-23 18:58:46.359398	2017-11-23 18:58:46.359398
365	29	357	2017-11-23 18:58:46.367005	2017-11-23 18:58:46.367005
366	29	358	2017-11-23 18:58:46.376074	2017-11-23 18:58:46.376074
367	29	359	2017-11-23 18:58:46.383283	2017-11-23 18:58:46.383283
368	29	360	2017-11-23 18:58:46.389323	2017-11-23 18:58:46.389323
369	29	361	2017-11-23 18:58:46.395315	2017-11-23 18:58:46.395315
370	29	362	2017-11-23 18:58:46.39977	2017-11-23 18:58:46.39977
371	29	363	2017-11-23 18:58:46.404669	2017-11-23 18:58:46.404669
372	29	364	2017-11-23 18:58:46.409172	2017-11-23 18:58:46.409172
373	29	365	2017-11-23 18:58:46.414032	2017-11-23 18:58:46.414032
374	29	366	2017-11-23 18:58:46.418808	2017-11-23 18:58:46.418808
375	29	367	2017-11-23 18:58:46.423528	2017-11-23 18:58:46.423528
376	29	368	2017-11-23 18:58:46.428506	2017-11-23 18:58:46.428506
377	29	369	2017-11-23 18:58:46.433648	2017-11-23 18:58:46.433648
378	29	370	2017-11-23 18:58:46.439219	2017-11-23 18:58:46.439219
379	29	371	2017-11-23 18:58:46.444467	2017-11-23 18:58:46.444467
380	29	372	2017-11-23 18:58:46.449113	2017-11-23 18:58:46.449113
381	29	373	2017-11-23 18:58:46.453767	2017-11-23 18:58:46.453767
382	29	374	2017-11-23 18:58:46.457866	2017-11-23 18:58:46.457866
383	29	375	2017-11-23 18:58:46.461801	2017-11-23 18:58:46.461801
384	29	376	2017-11-23 18:58:46.465545	2017-11-23 18:58:46.465545
385	29	377	2017-11-23 18:58:46.470331	2017-11-23 18:58:46.470331
386	29	378	2017-11-23 18:58:46.475765	2017-11-23 18:58:46.475765
387	29	379	2017-11-23 18:58:46.480186	2017-11-23 18:58:46.480186
388	29	380	2017-11-23 18:58:46.484994	2017-11-23 18:58:46.484994
389	29	381	2017-11-23 18:58:46.489273	2017-11-23 18:58:46.489273
390	30	382	2017-11-23 18:58:58.300232	2017-11-23 18:58:58.300232
391	30	383	2017-11-23 18:58:58.307088	2017-11-23 18:58:58.307088
392	30	384	2017-11-23 18:58:58.313159	2017-11-23 18:58:58.313159
393	30	385	2017-11-23 18:58:58.319545	2017-11-23 18:58:58.319545
394	30	386	2017-11-23 18:58:58.325234	2017-11-23 18:58:58.325234
395	30	387	2017-11-23 18:58:58.330489	2017-11-23 18:58:58.330489
396	30	388	2017-11-23 18:58:58.334771	2017-11-23 18:58:58.334771
397	30	389	2017-11-23 18:58:58.339711	2017-11-23 18:58:58.339711
398	30	390	2017-11-23 18:58:58.344073	2017-11-23 18:58:58.344073
399	30	391	2017-11-23 18:58:58.34847	2017-11-23 18:58:58.34847
400	30	392	2017-11-23 18:58:58.352954	2017-11-23 18:58:58.352954
401	30	393	2017-11-23 18:58:58.357747	2017-11-23 18:58:58.357747
402	30	394	2017-11-23 18:58:58.361739	2017-11-23 18:58:58.361739
403	30	395	2017-11-23 18:58:58.365893	2017-11-23 18:58:58.365893
404	30	396	2017-11-23 18:58:58.371361	2017-11-23 18:58:58.371361
405	30	397	2017-11-23 18:58:58.376279	2017-11-23 18:58:58.376279
406	30	398	2017-11-23 18:58:58.380636	2017-11-23 18:58:58.380636
407	30	399	2017-11-23 18:58:58.385401	2017-11-23 18:58:58.385401
408	30	400	2017-11-23 18:58:58.390614	2017-11-23 18:58:58.390614
409	30	401	2017-11-23 18:58:58.39532	2017-11-23 18:58:58.39532
410	30	402	2017-11-23 18:58:58.399767	2017-11-23 18:58:58.399767
411	30	403	2017-11-23 18:58:58.404384	2017-11-23 18:58:58.404384
412	30	404	2017-11-23 18:58:58.408897	2017-11-23 18:58:58.408897
413	30	405	2017-11-23 18:58:58.413148	2017-11-23 18:58:58.413148
414	30	406	2017-11-23 18:58:58.417157	2017-11-23 18:58:58.417157
415	30	407	2017-11-23 18:58:58.421726	2017-11-23 18:58:58.421726
416	30	408	2017-11-23 18:58:58.426569	2017-11-23 18:58:58.426569
417	30	409	2017-11-23 18:58:58.431106	2017-11-23 18:58:58.431106
418	30	410	2017-11-23 18:58:58.435833	2017-11-23 18:58:58.435833
419	30	411	2017-11-23 18:58:58.440536	2017-11-23 18:58:58.440536
420	30	412	2017-11-23 18:58:58.444836	2017-11-23 18:58:58.444836
421	30	413	2017-11-23 18:58:58.449065	2017-11-23 18:58:58.449065
422	30	414	2017-11-23 18:58:58.453678	2017-11-23 18:58:58.453678
423	30	415	2017-11-23 18:58:58.458009	2017-11-23 18:58:58.458009
424	30	416	2017-11-23 18:58:58.461957	2017-11-23 18:58:58.461957
425	30	417	2017-11-23 18:58:58.467498	2017-11-23 18:58:58.467498
426	30	418	2017-11-23 18:58:58.473499	2017-11-23 18:58:58.473499
427	30	419	2017-11-23 18:58:58.478769	2017-11-23 18:58:58.478769
428	30	420	2017-11-23 18:58:58.484744	2017-11-23 18:58:58.484744
429	30	421	2017-11-23 18:58:58.49117	2017-11-23 18:58:58.49117
430	30	422	2017-11-23 18:58:58.496856	2017-11-23 18:58:58.496856
431	30	423	2017-11-23 18:58:58.503891	2017-11-23 18:58:58.503891
432	30	424	2017-11-23 18:58:58.510402	2017-11-23 18:58:58.510402
433	30	425	2017-11-23 18:58:58.516138	2017-11-23 18:58:58.516138
434	30	426	2017-11-23 18:58:58.522701	2017-11-23 18:58:58.522701
435	30	427	2017-11-23 18:58:58.528635	2017-11-23 18:58:58.528635
436	30	428	2017-11-23 18:58:58.534785	2017-11-23 18:58:58.534785
437	30	429	2017-11-23 18:58:58.556694	2017-11-23 18:58:58.556694
438	30	430	2017-11-23 18:58:58.563009	2017-11-23 18:58:58.563009
439	30	431	2017-11-23 18:58:58.569254	2017-11-23 18:58:58.569254
440	31	432	2017-11-23 18:59:29.362485	2017-11-23 18:59:29.362485
441	31	433	2017-11-23 18:59:29.367826	2017-11-23 18:59:29.367826
442	31	434	2017-11-23 18:59:29.373323	2017-11-23 18:59:29.373323
443	31	435	2017-11-23 18:59:29.379125	2017-11-23 18:59:29.379125
444	31	436	2017-11-23 18:59:29.385284	2017-11-23 18:59:29.385284
445	31	437	2017-11-23 18:59:29.392046	2017-11-23 18:59:29.392046
446	31	438	2017-11-23 18:59:29.398416	2017-11-23 18:59:29.398416
447	31	439	2017-11-23 18:59:29.404946	2017-11-23 18:59:29.404946
448	31	440	2017-11-23 18:59:29.411409	2017-11-23 18:59:29.411409
449	31	441	2017-11-23 18:59:29.417004	2017-11-23 18:59:29.417004
450	31	442	2017-11-23 18:59:29.422794	2017-11-23 18:59:29.422794
451	31	443	2017-11-23 18:59:29.428722	2017-11-23 18:59:29.428722
452	32	444	2017-11-23 18:59:41.16587	2017-11-23 18:59:41.16587
453	32	445	2017-11-23 18:59:41.171231	2017-11-23 18:59:41.171231
454	32	446	2017-11-23 18:59:41.177595	2017-11-23 18:59:41.177595
455	32	447	2017-11-23 18:59:41.184613	2017-11-23 18:59:41.184613
456	32	448	2017-11-23 18:59:41.188991	2017-11-23 18:59:41.188991
457	32	449	2017-11-23 18:59:41.194154	2017-11-23 18:59:41.194154
458	32	450	2017-11-23 18:59:41.198314	2017-11-23 18:59:41.198314
459	32	451	2017-11-23 18:59:41.202144	2017-11-23 18:59:41.202144
460	32	452	2017-11-23 18:59:41.206615	2017-11-23 18:59:41.206615
461	32	453	2017-11-23 18:59:41.211715	2017-11-23 18:59:41.211715
462	32	454	2017-11-23 18:59:41.216481	2017-11-23 18:59:41.216481
463	32	455	2017-11-23 18:59:41.220385	2017-11-23 18:59:41.220385
464	33	456	2017-11-23 18:59:52.110942	2017-11-23 18:59:52.110942
465	33	457	2017-11-23 18:59:52.116135	2017-11-23 18:59:52.116135
466	33	458	2017-11-23 18:59:52.120757	2017-11-23 18:59:52.120757
467	33	459	2017-11-23 18:59:52.125736	2017-11-23 18:59:52.125736
468	33	460	2017-11-23 18:59:52.130211	2017-11-23 18:59:52.130211
469	33	461	2017-11-23 18:59:52.134396	2017-11-23 18:59:52.134396
470	33	462	2017-11-23 18:59:52.138681	2017-11-23 18:59:52.138681
471	33	463	2017-11-23 18:59:52.14346	2017-11-23 18:59:52.14346
472	33	464	2017-11-23 18:59:52.148414	2017-11-23 18:59:52.148414
473	33	465	2017-11-23 18:59:52.153295	2017-11-23 18:59:52.153295
474	33	466	2017-11-23 18:59:52.158368	2017-11-23 18:59:52.158368
475	33	467	2017-11-23 18:59:52.162978	2017-11-23 18:59:52.162978
476	33	468	2017-11-23 18:59:52.167826	2017-11-23 18:59:52.167826
477	33	469	2017-11-23 18:59:52.172908	2017-11-23 18:59:52.172908
478	33	470	2017-11-23 18:59:52.179866	2017-11-23 18:59:52.179866
479	33	471	2017-11-23 18:59:52.186791	2017-11-23 18:59:52.186791
480	34	472	2017-11-23 19:00:03.657605	2017-11-23 19:00:03.657605
481	34	473	2017-11-23 19:00:03.663579	2017-11-23 19:00:03.663579
482	34	474	2017-11-23 19:00:03.669541	2017-11-23 19:00:03.669541
483	34	475	2017-11-23 19:00:03.675133	2017-11-23 19:00:03.675133
484	34	476	2017-11-23 19:00:03.68068	2017-11-23 19:00:03.68068
485	34	477	2017-11-23 19:00:03.68746	2017-11-23 19:00:03.68746
486	34	478	2017-11-23 19:00:03.694698	2017-11-23 19:00:03.694698
487	34	479	2017-11-23 19:00:03.704356	2017-11-23 19:00:03.704356
488	34	480	2017-11-23 19:00:03.710022	2017-11-23 19:00:03.710022
489	34	481	2017-11-23 19:00:03.715498	2017-11-23 19:00:03.715498
490	34	482	2017-11-23 19:00:03.721435	2017-11-23 19:00:03.721435
491	34	483	2017-11-23 19:00:03.727401	2017-11-23 19:00:03.727401
492	34	484	2017-11-23 19:00:03.733288	2017-11-23 19:00:03.733288
493	34	485	2017-11-23 19:00:03.739397	2017-11-23 19:00:03.739397
494	35	486	2017-11-23 19:00:15.191617	2017-11-23 19:00:15.191617
495	35	487	2017-11-23 19:00:15.197785	2017-11-23 19:00:15.197785
496	35	488	2017-11-23 19:00:15.203256	2017-11-23 19:00:15.203256
497	35	489	2017-11-23 19:00:15.207993	2017-11-23 19:00:15.207993
498	35	490	2017-11-23 19:00:15.212206	2017-11-23 19:00:15.212206
499	35	491	2017-11-23 19:00:15.216701	2017-11-23 19:00:15.216701
500	35	492	2017-11-23 19:00:15.221152	2017-11-23 19:00:15.221152
501	35	493	2017-11-23 19:00:15.225622	2017-11-23 19:00:15.225622
502	35	494	2017-11-23 19:00:15.230464	2017-11-23 19:00:15.230464
503	36	495	2017-11-23 19:00:33.205402	2017-11-23 19:00:33.205402
504	36	496	2017-11-23 19:00:33.210868	2017-11-23 19:00:33.210868
505	36	497	2017-11-23 19:00:33.215387	2017-11-23 19:00:33.215387
506	36	498	2017-11-23 19:00:33.219971	2017-11-23 19:00:33.219971
507	36	499	2017-11-23 19:00:33.224846	2017-11-23 19:00:33.224846
508	36	500	2017-11-23 19:00:33.22942	2017-11-23 19:00:33.22942
509	36	501	2017-11-23 19:00:33.234135	2017-11-23 19:00:33.234135
510	36	502	2017-11-23 19:00:33.238354	2017-11-23 19:00:33.238354
511	36	503	2017-11-23 19:00:33.242509	2017-11-23 19:00:33.242509
512	36	504	2017-11-23 19:00:33.247204	2017-11-23 19:00:33.247204
513	36	505	2017-11-23 19:00:33.252381	2017-11-23 19:00:33.252381
514	36	506	2017-11-23 19:00:33.256537	2017-11-23 19:00:33.256537
515	36	507	2017-11-23 19:00:33.260698	2017-11-23 19:00:33.260698
516	36	508	2017-11-23 19:00:33.264616	2017-11-23 19:00:33.264616
517	36	509	2017-11-23 19:00:33.2684	2017-11-23 19:00:33.2684
518	37	510	2017-11-23 19:00:44.167528	2017-11-23 19:00:44.167528
519	37	511	2017-11-23 19:00:44.174951	2017-11-23 19:00:44.174951
520	37	512	2017-11-23 19:00:44.18108	2017-11-23 19:00:44.18108
521	37	513	2017-11-23 19:00:44.186494	2017-11-23 19:00:44.186494
522	37	514	2017-11-23 19:00:44.192241	2017-11-23 19:00:44.192241
523	37	515	2017-11-23 19:00:44.198029	2017-11-23 19:00:44.198029
524	37	516	2017-11-23 19:00:44.203714	2017-11-23 19:00:44.203714
525	37	517	2017-11-23 19:00:44.209126	2017-11-23 19:00:44.209126
526	37	518	2017-11-23 19:00:44.215471	2017-11-23 19:00:44.215471
527	37	519	2017-11-23 19:00:44.223041	2017-11-23 19:00:44.223041
528	37	520	2017-11-23 19:00:44.229155	2017-11-23 19:00:44.229155
529	37	521	2017-11-23 19:00:44.235053	2017-11-23 19:00:44.235053
530	37	522	2017-11-23 19:00:44.240648	2017-11-23 19:00:44.240648
531	37	523	2017-11-23 19:00:44.246845	2017-11-23 19:00:44.246845
532	37	524	2017-11-23 19:00:44.252388	2017-11-23 19:00:44.252388
533	37	525	2017-11-23 19:00:44.257881	2017-11-23 19:00:44.257881
534	37	526	2017-11-23 19:00:44.263702	2017-11-23 19:00:44.263702
535	37	527	2017-11-23 19:00:44.269201	2017-11-23 19:00:44.269201
536	37	528	2017-11-23 19:00:44.274768	2017-11-23 19:00:44.274768
537	37	529	2017-11-23 19:00:44.280802	2017-11-23 19:00:44.280802
538	37	530	2017-11-23 19:00:44.285625	2017-11-23 19:00:44.285625
539	37	531	2017-11-23 19:00:44.29027	2017-11-23 19:00:44.29027
540	37	532	2017-11-23 19:00:44.294772	2017-11-23 19:00:44.294772
541	37	533	2017-11-23 19:00:44.299333	2017-11-23 19:00:44.299333
542	37	534	2017-11-23 19:00:44.304141	2017-11-23 19:00:44.304141
543	37	535	2017-11-23 19:00:44.308718	2017-11-23 19:00:44.308718
544	37	536	2017-11-23 19:00:44.314122	2017-11-23 19:00:44.314122
545	38	537	2017-11-23 19:00:55.398051	2017-11-23 19:00:55.398051
546	38	538	2017-11-23 19:00:55.403695	2017-11-23 19:00:55.403695
547	38	539	2017-11-23 19:00:55.409106	2017-11-23 19:00:55.409106
548	38	540	2017-11-23 19:00:55.414297	2017-11-23 19:00:55.414297
549	38	541	2017-11-23 19:00:55.419598	2017-11-23 19:00:55.419598
550	38	542	2017-11-23 19:00:55.425404	2017-11-23 19:00:55.425404
551	38	543	2017-11-23 19:00:55.431246	2017-11-23 19:00:55.431246
552	38	544	2017-11-23 19:00:55.436839	2017-11-23 19:00:55.436839
553	38	545	2017-11-23 19:00:55.442019	2017-11-23 19:00:55.442019
554	38	546	2017-11-23 19:00:55.44738	2017-11-23 19:00:55.44738
555	38	547	2017-11-23 19:00:55.452822	2017-11-23 19:00:55.452822
556	38	548	2017-11-23 19:00:55.45845	2017-11-23 19:00:55.45845
557	38	549	2017-11-23 19:00:55.464238	2017-11-23 19:00:55.464238
558	38	550	2017-11-23 19:00:55.470582	2017-11-23 19:00:55.470582
559	38	551	2017-11-23 19:00:55.476176	2017-11-23 19:00:55.476176
560	39	552	2017-11-23 19:01:07.061647	2017-11-23 19:01:07.061647
561	39	553	2017-11-23 19:01:07.067045	2017-11-23 19:01:07.067045
562	39	554	2017-11-23 19:01:07.071533	2017-11-23 19:01:07.071533
563	39	555	2017-11-23 19:01:07.076129	2017-11-23 19:01:07.076129
564	39	556	2017-11-23 19:01:07.080891	2017-11-23 19:01:07.080891
565	39	557	2017-11-23 19:01:07.085374	2017-11-23 19:01:07.085374
566	39	558	2017-11-23 19:01:07.08993	2017-11-23 19:01:07.08993
567	39	559	2017-11-23 19:01:07.094365	2017-11-23 19:01:07.094365
568	39	560	2017-11-23 19:01:07.098634	2017-11-23 19:01:07.098634
569	39	561	2017-11-23 19:01:07.103122	2017-11-23 19:01:07.103122
570	39	562	2017-11-23 19:01:07.107766	2017-11-23 19:01:07.107766
571	39	563	2017-11-23 19:01:07.112444	2017-11-23 19:01:07.112444
572	40	564	2017-11-23 19:01:18.376999	2017-11-23 19:01:18.376999
573	40	565	2017-11-23 19:01:18.381794	2017-11-23 19:01:18.381794
574	40	566	2017-11-23 19:01:18.386673	2017-11-23 19:01:18.386673
575	40	567	2017-11-23 19:01:18.391317	2017-11-23 19:01:18.391317
576	40	568	2017-11-23 19:01:18.395871	2017-11-23 19:01:18.395871
577	40	569	2017-11-23 19:01:18.400308	2017-11-23 19:01:18.400308
578	40	570	2017-11-23 19:01:18.405278	2017-11-23 19:01:18.405278
579	40	571	2017-11-23 19:01:18.410198	2017-11-23 19:01:18.410198
580	40	572	2017-11-23 19:01:18.414766	2017-11-23 19:01:18.414766
581	40	573	2017-11-23 19:01:18.419368	2017-11-23 19:01:18.419368
582	40	574	2017-11-23 19:01:18.424092	2017-11-23 19:01:18.424092
583	40	575	2017-11-23 19:01:18.428556	2017-11-23 19:01:18.428556
584	40	576	2017-11-23 19:01:18.433334	2017-11-23 19:01:18.433334
585	40	577	2017-11-23 19:01:18.438225	2017-11-23 19:01:18.438225
586	41	578	2017-11-23 19:03:19.482226	2017-11-23 19:03:19.482226
587	41	579	2017-11-23 19:03:19.488232	2017-11-23 19:03:19.488232
588	41	580	2017-11-23 19:03:19.494982	2017-11-23 19:03:19.494982
589	41	581	2017-11-23 19:03:19.500453	2017-11-23 19:03:19.500453
590	41	582	2017-11-23 19:03:19.505958	2017-11-23 19:03:19.505958
591	41	583	2017-11-23 19:03:19.512341	2017-11-23 19:03:19.512341
592	41	584	2017-11-23 19:03:19.519409	2017-11-23 19:03:19.519409
593	41	585	2017-11-23 19:03:19.526017	2017-11-23 19:03:19.526017
594	41	586	2017-11-23 19:03:19.531353	2017-11-23 19:03:19.531353
595	41	587	2017-11-23 19:03:19.537636	2017-11-23 19:03:19.537636
596	41	588	2017-11-23 19:03:19.543408	2017-11-23 19:03:19.543408
597	41	589	2017-11-23 19:03:19.548823	2017-11-23 19:03:19.548823
598	41	590	2017-11-23 19:03:19.554233	2017-11-23 19:03:19.554233
599	41	591	2017-11-23 19:03:19.560426	2017-11-23 19:03:19.560426
600	41	592	2017-11-23 19:03:19.566654	2017-11-23 19:03:19.566654
601	41	593	2017-11-23 19:03:19.572163	2017-11-23 19:03:19.572163
602	41	594	2017-11-23 19:03:19.577791	2017-11-23 19:03:19.577791
603	41	595	2017-11-23 19:03:19.583185	2017-11-23 19:03:19.583185
604	42	596	2017-11-23 19:03:31.313038	2017-11-23 19:03:31.313038
605	42	597	2017-11-23 19:03:31.319693	2017-11-23 19:03:31.319693
606	42	598	2017-11-23 19:03:31.326073	2017-11-23 19:03:31.326073
607	42	599	2017-11-23 19:03:31.331849	2017-11-23 19:03:31.331849
608	42	600	2017-11-23 19:03:31.336512	2017-11-23 19:03:31.336512
609	42	601	2017-11-23 19:03:31.340962	2017-11-23 19:03:31.340962
610	42	602	2017-11-23 19:03:31.345368	2017-11-23 19:03:31.345368
611	42	603	2017-11-23 19:03:31.349681	2017-11-23 19:03:31.349681
612	42	604	2017-11-23 19:03:31.354167	2017-11-23 19:03:31.354167
613	42	605	2017-11-23 19:03:31.358768	2017-11-23 19:03:31.358768
614	42	606	2017-11-23 19:03:31.364037	2017-11-23 19:03:31.364037
615	42	607	2017-11-23 19:03:31.369351	2017-11-23 19:03:31.369351
616	42	608	2017-11-23 19:03:31.373638	2017-11-23 19:03:31.373638
617	42	609	2017-11-23 19:03:31.377435	2017-11-23 19:03:31.377435
618	42	610	2017-11-23 19:03:31.381776	2017-11-23 19:03:31.381776
619	42	611	2017-11-23 19:03:31.386621	2017-11-23 19:03:31.386621
620	42	612	2017-11-23 19:03:31.390836	2017-11-23 19:03:31.390836
621	42	613	2017-11-23 19:03:31.39504	2017-11-23 19:03:31.39504
622	43	614	2017-11-23 19:03:43.2017	2017-11-23 19:03:43.2017
623	43	615	2017-11-23 19:03:43.206231	2017-11-23 19:03:43.206231
624	43	616	2017-11-23 19:03:43.210445	2017-11-23 19:03:43.210445
625	43	617	2017-11-23 19:03:43.214912	2017-11-23 19:03:43.214912
626	43	618	2017-11-23 19:03:43.219145	2017-11-23 19:03:43.219145
627	43	619	2017-11-23 19:03:43.223495	2017-11-23 19:03:43.223495
628	43	620	2017-11-23 19:03:43.228506	2017-11-23 19:03:43.228506
629	43	621	2017-11-23 19:03:43.234102	2017-11-23 19:03:43.234102
630	43	622	2017-11-23 19:03:43.238719	2017-11-23 19:03:43.238719
631	43	623	2017-11-23 19:03:43.243884	2017-11-23 19:03:43.243884
632	43	624	2017-11-23 19:03:43.249452	2017-11-23 19:03:43.249452
633	43	625	2017-11-23 19:03:43.254745	2017-11-23 19:03:43.254745
634	43	626	2017-11-23 19:03:43.260341	2017-11-23 19:03:43.260341
635	44	627	2017-11-23 19:03:55.071621	2017-11-23 19:03:55.071621
636	44	628	2017-11-23 19:03:55.076129	2017-11-23 19:03:55.076129
637	44	629	2017-11-23 19:03:55.080776	2017-11-23 19:03:55.080776
638	44	630	2017-11-23 19:03:55.085101	2017-11-23 19:03:55.085101
639	44	631	2017-11-23 19:03:55.08896	2017-11-23 19:03:55.08896
640	44	632	2017-11-23 19:03:55.092906	2017-11-23 19:03:55.092906
641	44	633	2017-11-23 19:03:55.097098	2017-11-23 19:03:55.097098
642	44	634	2017-11-23 19:03:55.101305	2017-11-23 19:03:55.101305
643	44	635	2017-11-23 19:03:55.105384	2017-11-23 19:03:55.105384
644	44	636	2017-11-23 19:03:55.109452	2017-11-23 19:03:55.109452
645	44	637	2017-11-23 19:03:55.113537	2017-11-23 19:03:55.113537
646	44	638	2017-11-23 19:03:55.117862	2017-11-23 19:03:55.117862
647	44	639	2017-11-23 19:03:55.123068	2017-11-23 19:03:55.123068
648	44	640	2017-11-23 19:03:55.129118	2017-11-23 19:03:55.129118
649	44	641	2017-11-23 19:03:55.135358	2017-11-23 19:03:55.135358
650	44	642	2017-11-23 19:03:55.141642	2017-11-23 19:03:55.141642
651	45	643	2017-11-23 19:04:06.243726	2017-11-23 19:04:06.243726
652	45	644	2017-11-23 19:04:06.249461	2017-11-23 19:04:06.249461
653	45	645	2017-11-23 19:04:06.254723	2017-11-23 19:04:06.254723
654	45	646	2017-11-23 19:04:06.260067	2017-11-23 19:04:06.260067
655	45	647	2017-11-23 19:04:06.265724	2017-11-23 19:04:06.265724
656	45	648	2017-11-23 19:04:06.271506	2017-11-23 19:04:06.271506
657	45	649	2017-11-23 19:04:06.277133	2017-11-23 19:04:06.277133
658	45	650	2017-11-23 19:04:06.282785	2017-11-23 19:04:06.282785
659	45	651	2017-11-23 19:04:06.288292	2017-11-23 19:04:06.288292
660	45	652	2017-11-23 19:04:06.293647	2017-11-23 19:04:06.293647
661	45	653	2017-11-23 19:04:06.299382	2017-11-23 19:04:06.299382
662	45	654	2017-11-23 19:04:06.305528	2017-11-23 19:04:06.305528
663	45	655	2017-11-23 19:04:06.311375	2017-11-23 19:04:06.311375
664	45	656	2017-11-23 19:04:06.317495	2017-11-23 19:04:06.317495
665	45	657	2017-11-23 19:04:06.32333	2017-11-23 19:04:06.32333
666	45	658	2017-11-23 19:04:06.328687	2017-11-23 19:04:06.328687
667	45	659	2017-11-23 19:04:06.333819	2017-11-23 19:04:06.333819
668	45	660	2017-11-23 19:04:06.358784	2017-11-23 19:04:06.358784
669	45	661	2017-11-23 19:04:06.365402	2017-11-23 19:04:06.365402
670	45	662	2017-11-23 19:04:06.371565	2017-11-23 19:04:06.371565
671	45	663	2017-11-23 19:04:06.377828	2017-11-23 19:04:06.377828
672	46	664	2017-11-23 19:05:14.448121	2017-11-23 19:05:14.448121
673	46	665	2017-11-23 19:05:14.454003	2017-11-23 19:05:14.454003
674	46	666	2017-11-23 19:05:14.45908	2017-11-23 19:05:14.45908
675	46	667	2017-11-23 19:05:14.464599	2017-11-23 19:05:14.464599
676	46	668	2017-11-23 19:05:14.470357	2017-11-23 19:05:14.470357
677	46	669	2017-11-23 19:05:14.4757	2017-11-23 19:05:14.4757
678	46	670	2017-11-23 19:05:14.480517	2017-11-23 19:05:14.480517
679	46	671	2017-11-23 19:05:14.485288	2017-11-23 19:05:14.485288
680	46	672	2017-11-23 19:05:14.48953	2017-11-23 19:05:14.48953
681	46	673	2017-11-23 19:05:14.493926	2017-11-23 19:05:14.493926
682	46	674	2017-11-23 19:05:14.498901	2017-11-23 19:05:14.498901
683	46	675	2017-11-23 19:05:14.504233	2017-11-23 19:05:14.504233
684	46	676	2017-11-23 19:05:14.509545	2017-11-23 19:05:14.509545
685	46	677	2017-11-23 19:05:14.51492	2017-11-23 19:05:14.51492
686	46	678	2017-11-23 19:05:14.520141	2017-11-23 19:05:14.520141
687	46	679	2017-11-23 19:05:14.525829	2017-11-23 19:05:14.525829
688	46	680	2017-11-23 19:05:14.531491	2017-11-23 19:05:14.531491
689	46	681	2017-11-23 19:05:14.537049	2017-11-23 19:05:14.537049
690	46	682	2017-11-23 19:05:14.541896	2017-11-23 19:05:14.541896
691	46	683	2017-11-23 19:05:14.546543	2017-11-23 19:05:14.546543
692	46	684	2017-11-23 19:05:14.551838	2017-11-23 19:05:14.551838
693	46	685	2017-11-23 19:05:14.556819	2017-11-23 19:05:14.556819
694	46	686	2017-11-23 19:05:14.562462	2017-11-23 19:05:14.562462
695	46	687	2017-11-23 19:05:14.568564	2017-11-23 19:05:14.568564
696	46	688	2017-11-23 19:05:14.574819	2017-11-23 19:05:14.574819
697	47	689	2017-11-23 19:05:27.149857	2017-11-23 19:05:27.149857
698	47	690	2017-11-23 19:05:27.155644	2017-11-23 19:05:27.155644
699	47	691	2017-11-23 19:05:27.160336	2017-11-23 19:05:27.160336
700	47	692	2017-11-23 19:05:27.165345	2017-11-23 19:05:27.165345
701	47	693	2017-11-23 19:05:27.169945	2017-11-23 19:05:27.169945
702	47	694	2017-11-23 19:05:27.174466	2017-11-23 19:05:27.174466
703	47	695	2017-11-23 19:05:27.17894	2017-11-23 19:05:27.17894
704	47	696	2017-11-23 19:05:27.183287	2017-11-23 19:05:27.183287
705	47	697	2017-11-23 19:05:27.191021	2017-11-23 19:05:27.191021
706	47	698	2017-11-23 19:05:27.195977	2017-11-23 19:05:27.195977
707	47	699	2017-11-23 19:05:27.200767	2017-11-23 19:05:27.200767
708	47	700	2017-11-23 19:05:27.205477	2017-11-23 19:05:27.205477
709	48	701	2017-11-23 19:05:39.399935	2017-11-23 19:05:39.399935
710	48	702	2017-11-23 19:05:39.406326	2017-11-23 19:05:39.406326
711	48	703	2017-11-23 19:05:39.412959	2017-11-23 19:05:39.412959
712	48	704	2017-11-23 19:05:39.419064	2017-11-23 19:05:39.419064
713	48	705	2017-11-23 19:05:39.425397	2017-11-23 19:05:39.425397
714	48	706	2017-11-23 19:05:39.431518	2017-11-23 19:05:39.431518
715	48	707	2017-11-23 19:05:39.438052	2017-11-23 19:05:39.438052
716	48	708	2017-11-23 19:05:39.444302	2017-11-23 19:05:39.444302
717	48	709	2017-11-23 19:05:39.450797	2017-11-23 19:05:39.450797
718	48	710	2017-11-23 19:05:39.456845	2017-11-23 19:05:39.456845
719	48	711	2017-11-23 19:05:39.462672	2017-11-23 19:05:39.462672
720	48	712	2017-11-23 19:05:39.468673	2017-11-23 19:05:39.468673
721	48	713	2017-11-23 19:05:39.475631	2017-11-23 19:05:39.475631
722	48	714	2017-11-23 19:05:39.482389	2017-11-23 19:05:39.482389
723	49	715	2017-11-23 19:05:51.543168	2017-11-23 19:05:51.543168
724	49	716	2017-11-23 19:05:51.54938	2017-11-23 19:05:51.54938
725	49	717	2017-11-23 19:05:51.556244	2017-11-23 19:05:51.556244
726	49	718	2017-11-23 19:05:51.56217	2017-11-23 19:05:51.56217
727	49	719	2017-11-23 19:05:51.567832	2017-11-23 19:05:51.567832
728	49	720	2017-11-23 19:05:51.57344	2017-11-23 19:05:51.57344
729	49	721	2017-11-23 19:05:51.579032	2017-11-23 19:05:51.579032
730	49	722	2017-11-23 19:05:51.585116	2017-11-23 19:05:51.585116
731	49	723	2017-11-23 19:05:51.590842	2017-11-23 19:05:51.590842
732	49	724	2017-11-23 19:05:51.596633	2017-11-23 19:05:51.596633
733	49	725	2017-11-23 19:05:51.602489	2017-11-23 19:05:51.602489
734	49	726	2017-11-23 19:05:51.608793	2017-11-23 19:05:51.608793
735	49	727	2017-11-23 19:05:51.614548	2017-11-23 19:05:51.614548
736	49	728	2017-11-23 19:05:51.620342	2017-11-23 19:05:51.620342
737	49	729	2017-11-23 19:05:51.626064	2017-11-23 19:05:51.626064
738	49	730	2017-11-23 19:05:51.631617	2017-11-23 19:05:51.631617
739	49	731	2017-11-23 19:05:51.637132	2017-11-23 19:05:51.637132
740	49	732	2017-11-23 19:05:51.643932	2017-11-23 19:05:51.643932
741	49	733	2017-11-23 19:05:51.65103	2017-11-23 19:05:51.65103
742	49	734	2017-11-23 19:05:51.658058	2017-11-23 19:05:51.658058
743	49	735	2017-11-23 19:05:51.664185	2017-11-23 19:05:51.664185
744	49	736	2017-11-23 19:05:51.669958	2017-11-23 19:05:51.669958
745	49	737	2017-11-23 19:05:51.675686	2017-11-23 19:05:51.675686
746	49	738	2017-11-23 19:05:51.681832	2017-11-23 19:05:51.681832
747	49	739	2017-11-23 19:05:51.687349	2017-11-23 19:05:51.687349
748	49	740	2017-11-23 19:05:51.693516	2017-11-23 19:05:51.693516
749	49	741	2017-11-23 19:05:51.698593	2017-11-23 19:05:51.698593
750	49	742	2017-11-23 19:05:51.70303	2017-11-23 19:05:51.70303
751	49	743	2017-11-23 19:05:51.70752	2017-11-23 19:05:51.70752
752	49	744	2017-11-23 19:05:51.712389	2017-11-23 19:05:51.712389
753	49	745	2017-11-23 19:05:51.71701	2017-11-23 19:05:51.71701
754	49	746	2017-11-23 19:05:51.721932	2017-11-23 19:05:51.721932
755	49	747	2017-11-23 19:05:51.726656	2017-11-23 19:05:51.726656
756	49	748	2017-11-23 19:05:51.732013	2017-11-23 19:05:51.732013
757	49	749	2017-11-23 19:05:51.737072	2017-11-23 19:05:51.737072
758	49	750	2017-11-23 19:05:51.741855	2017-11-23 19:05:51.741855
759	49	751	2017-11-23 19:05:51.746317	2017-11-23 19:05:51.746317
760	49	752	2017-11-23 19:05:51.750548	2017-11-23 19:05:51.750548
761	49	753	2017-11-23 19:05:51.754803	2017-11-23 19:05:51.754803
762	49	754	2017-11-23 19:05:51.759445	2017-11-23 19:05:51.759445
763	49	755	2017-11-23 19:05:51.763737	2017-11-23 19:05:51.763737
764	49	756	2017-11-23 19:05:51.768416	2017-11-23 19:05:51.768416
765	49	757	2017-11-23 19:05:51.773143	2017-11-23 19:05:51.773143
766	49	758	2017-11-23 19:05:51.777534	2017-11-23 19:05:51.777534
767	49	759	2017-11-23 19:05:51.782001	2017-11-23 19:05:51.782001
768	49	760	2017-11-23 19:05:51.786099	2017-11-23 19:05:51.786099
769	49	761	2017-11-23 19:05:51.7908	2017-11-23 19:05:51.7908
770	49	762	2017-11-23 19:05:51.795206	2017-11-23 19:05:51.795206
771	49	763	2017-11-23 19:05:51.80119	2017-11-23 19:05:51.80119
772	49	764	2017-11-23 19:05:51.805836	2017-11-23 19:05:51.805836
773	50	765	2017-11-23 19:06:03.13876	2017-11-23 19:06:03.13876
774	50	766	2017-11-23 19:06:03.144216	2017-11-23 19:06:03.144216
775	50	767	2017-11-23 19:06:03.149099	2017-11-23 19:06:03.149099
776	50	768	2017-11-23 19:06:03.154145	2017-11-23 19:06:03.154145
777	50	769	2017-11-23 19:06:03.158496	2017-11-23 19:06:03.158496
778	50	770	2017-11-23 19:06:03.162696	2017-11-23 19:06:03.162696
779	50	771	2017-11-23 19:06:03.167086	2017-11-23 19:06:03.167086
780	50	772	2017-11-23 19:06:03.171665	2017-11-23 19:06:03.171665
781	50	773	2017-11-23 19:06:03.177052	2017-11-23 19:06:03.177052
782	50	774	2017-11-23 19:06:03.182266	2017-11-23 19:06:03.182266
783	51	775	2017-11-23 19:16:23.360559	2017-11-23 19:16:23.360559
784	51	776	2017-11-23 19:16:23.366782	2017-11-23 19:16:23.366782
785	51	777	2017-11-23 19:16:23.372233	2017-11-23 19:16:23.372233
786	51	778	2017-11-23 19:16:23.377298	2017-11-23 19:16:23.377298
787	51	779	2017-11-23 19:16:23.381773	2017-11-23 19:16:23.381773
788	51	780	2017-11-23 19:16:23.38545	2017-11-23 19:16:23.38545
789	51	781	2017-11-23 19:16:23.389239	2017-11-23 19:16:23.389239
790	51	782	2017-11-23 19:16:23.394045	2017-11-23 19:16:23.394045
791	51	783	2017-11-23 19:16:23.398641	2017-11-23 19:16:23.398641
792	51	784	2017-11-23 19:16:23.403242	2017-11-23 19:16:23.403242
793	52	785	2017-11-23 19:16:35.278732	2017-11-23 19:16:35.278732
794	52	786	2017-11-23 19:16:35.286571	2017-11-23 19:16:35.286571
795	52	787	2017-11-23 19:16:35.293348	2017-11-23 19:16:35.293348
796	52	788	2017-11-23 19:16:35.297838	2017-11-23 19:16:35.297838
797	52	789	2017-11-23 19:16:35.303212	2017-11-23 19:16:35.303212
798	52	790	2017-11-23 19:16:35.308362	2017-11-23 19:16:35.308362
799	52	791	2017-11-23 19:16:35.313612	2017-11-23 19:16:35.313612
800	52	792	2017-11-23 19:16:35.318657	2017-11-23 19:16:35.318657
801	52	793	2017-11-23 19:16:35.325303	2017-11-23 19:16:35.325303
802	52	794	2017-11-23 19:16:35.330507	2017-11-23 19:16:35.330507
803	52	795	2017-11-23 19:16:35.335216	2017-11-23 19:16:35.335216
804	52	796	2017-11-23 19:16:35.339731	2017-11-23 19:16:35.339731
805	52	797	2017-11-23 19:16:35.344532	2017-11-23 19:16:35.344532
806	52	798	2017-11-23 19:16:35.349044	2017-11-23 19:16:35.349044
807	52	799	2017-11-23 19:16:35.353805	2017-11-23 19:16:35.353805
808	52	800	2017-11-23 19:16:35.358521	2017-11-23 19:16:35.358521
809	52	801	2017-11-23 19:16:35.363388	2017-11-23 19:16:35.363388
810	52	802	2017-11-23 19:16:35.368158	2017-11-23 19:16:35.368158
811	52	803	2017-11-23 19:16:35.373103	2017-11-23 19:16:35.373103
812	52	804	2017-11-23 19:16:35.378145	2017-11-23 19:16:35.378145
813	52	805	2017-11-23 19:16:35.382807	2017-11-23 19:16:35.382807
814	52	806	2017-11-23 19:16:35.387983	2017-11-23 19:16:35.387983
815	52	807	2017-11-23 19:16:35.392789	2017-11-23 19:16:35.392789
816	52	808	2017-11-23 19:16:35.397486	2017-11-23 19:16:35.397486
817	52	809	2017-11-23 19:16:35.402239	2017-11-23 19:16:35.402239
818	52	810	2017-11-23 19:16:35.406959	2017-11-23 19:16:35.406959
819	52	811	2017-11-23 19:16:35.411338	2017-11-23 19:16:35.411338
820	52	812	2017-11-23 19:16:35.415946	2017-11-23 19:16:35.415946
821	52	813	2017-11-23 19:16:35.42034	2017-11-23 19:16:35.42034
822	52	814	2017-11-23 19:16:35.42501	2017-11-23 19:16:35.42501
823	53	815	2017-11-23 19:16:47.094342	2017-11-23 19:16:47.094342
824	53	816	2017-11-23 19:16:47.104308	2017-11-23 19:16:47.104308
825	53	817	2017-11-23 19:16:47.110615	2017-11-23 19:16:47.110615
826	53	818	2017-11-23 19:16:47.117607	2017-11-23 19:16:47.117607
827	53	819	2017-11-23 19:16:47.124138	2017-11-23 19:16:47.124138
828	53	820	2017-11-23 19:16:47.129707	2017-11-23 19:16:47.129707
829	53	821	2017-11-23 19:16:47.135403	2017-11-23 19:16:47.135403
830	53	822	2017-11-23 19:16:47.141851	2017-11-23 19:16:47.141851
831	53	823	2017-11-23 19:16:47.148253	2017-11-23 19:16:47.148253
832	53	824	2017-11-23 19:16:47.154846	2017-11-23 19:16:47.154846
833	53	825	2017-11-23 19:16:47.160738	2017-11-23 19:16:47.160738
834	53	826	2017-11-23 19:16:47.166651	2017-11-23 19:16:47.166651
835	53	827	2017-11-23 19:16:47.174168	2017-11-23 19:16:47.174168
836	53	828	2017-11-23 19:16:47.180317	2017-11-23 19:16:47.180317
837	53	829	2017-11-23 19:16:47.187217	2017-11-23 19:16:47.187217
838	53	830	2017-11-23 19:16:47.192965	2017-11-23 19:16:47.192965
839	53	831	2017-11-23 19:16:47.198666	2017-11-23 19:16:47.198666
840	53	832	2017-11-23 19:16:47.205668	2017-11-23 19:16:47.205668
841	54	833	2017-11-23 19:22:27.107937	2017-11-23 19:22:27.107937
842	54	834	2017-11-23 19:22:27.112147	2017-11-23 19:22:27.112147
843	54	835	2017-11-23 19:22:27.115927	2017-11-23 19:22:27.115927
844	54	836	2017-11-23 19:22:27.120543	2017-11-23 19:22:27.120543
845	54	837	2017-11-23 19:22:27.125409	2017-11-23 19:22:27.125409
846	54	838	2017-11-23 19:22:27.130788	2017-11-23 19:22:27.130788
847	54	839	2017-11-23 19:22:27.136033	2017-11-23 19:22:27.136033
848	54	840	2017-11-23 19:22:27.14208	2017-11-23 19:22:27.14208
849	54	841	2017-11-23 19:22:27.146049	2017-11-23 19:22:27.146049
850	54	842	2017-11-23 19:22:27.149938	2017-11-23 19:22:27.149938
851	54	843	2017-11-23 19:22:27.154302	2017-11-23 19:22:27.154302
852	55	844	2017-11-23 19:22:38.168029	2017-11-23 19:22:38.168029
853	55	845	2017-11-23 19:22:38.172981	2017-11-23 19:22:38.172981
854	55	846	2017-11-23 19:22:38.177842	2017-11-23 19:22:38.177842
855	55	847	2017-11-23 19:22:38.182668	2017-11-23 19:22:38.182668
856	55	848	2017-11-23 19:22:38.187235	2017-11-23 19:22:38.187235
857	55	849	2017-11-23 19:22:38.191735	2017-11-23 19:22:38.191735
858	55	850	2017-11-23 19:22:38.196126	2017-11-23 19:22:38.196126
859	55	851	2017-11-23 19:22:38.200268	2017-11-23 19:22:38.200268
860	55	852	2017-11-23 19:22:38.204408	2017-11-23 19:22:38.204408
861	55	853	2017-11-23 19:22:38.208616	2017-11-23 19:22:38.208616
862	55	854	2017-11-23 19:22:38.212761	2017-11-23 19:22:38.212761
863	55	855	2017-11-23 19:22:38.21757	2017-11-23 19:22:38.21757
864	55	856	2017-11-23 19:22:38.222618	2017-11-23 19:22:38.222618
865	55	857	2017-11-23 19:22:38.227508	2017-11-23 19:22:38.227508
866	55	858	2017-11-23 19:22:38.23207	2017-11-23 19:22:38.23207
867	55	859	2017-11-23 19:22:38.239671	2017-11-23 19:22:38.239671
868	55	860	2017-11-23 19:22:38.24712	2017-11-23 19:22:38.24712
869	55	861	2017-11-23 19:22:38.251503	2017-11-23 19:22:38.251503
870	55	862	2017-11-23 19:22:38.255813	2017-11-23 19:22:38.255813
871	55	863	2017-11-23 19:22:38.260389	2017-11-23 19:22:38.260389
872	55	864	2017-11-23 19:22:38.265971	2017-11-23 19:22:38.265971
873	55	865	2017-11-23 19:22:38.271727	2017-11-23 19:22:38.271727
874	55	866	2017-11-23 19:22:38.277632	2017-11-23 19:22:38.277632
875	56	867	2017-11-23 19:22:49.065331	2017-11-23 19:22:49.065331
876	56	868	2017-11-23 19:22:49.069778	2017-11-23 19:22:49.069778
877	56	869	2017-11-23 19:22:49.074191	2017-11-23 19:22:49.074191
878	56	870	2017-11-23 19:22:49.078362	2017-11-23 19:22:49.078362
879	56	871	2017-11-23 19:22:49.083914	2017-11-23 19:22:49.083914
880	56	872	2017-11-23 19:22:49.08981	2017-11-23 19:22:49.08981
881	56	873	2017-11-23 19:22:49.095396	2017-11-23 19:22:49.095396
882	56	874	2017-11-23 19:22:49.101025	2017-11-23 19:22:49.101025
883	56	875	2017-11-23 19:22:49.106568	2017-11-23 19:22:49.106568
884	56	876	2017-11-23 19:22:49.112205	2017-11-23 19:22:49.112205
885	57	877	2017-11-23 19:23:00.149743	2017-11-23 19:23:00.149743
886	57	878	2017-11-23 19:23:00.154995	2017-11-23 19:23:00.154995
887	57	879	2017-11-23 19:23:00.159439	2017-11-23 19:23:00.159439
888	57	880	2017-11-23 19:23:00.163952	2017-11-23 19:23:00.163952
889	57	881	2017-11-23 19:23:00.168555	2017-11-23 19:23:00.168555
890	57	882	2017-11-23 19:23:00.173528	2017-11-23 19:23:00.173528
891	57	883	2017-11-23 19:23:00.17861	2017-11-23 19:23:00.17861
892	57	884	2017-11-23 19:23:00.18314	2017-11-23 19:23:00.18314
893	57	885	2017-11-23 19:23:00.188195	2017-11-23 19:23:00.188195
894	57	886	2017-11-23 19:23:00.192732	2017-11-23 19:23:00.192732
895	57	887	2017-11-23 19:23:00.197248	2017-11-23 19:23:00.197248
896	57	888	2017-11-23 19:23:00.202205	2017-11-23 19:23:00.202205
897	57	889	2017-11-23 19:23:00.208313	2017-11-23 19:23:00.208313
898	58	890	2017-11-23 19:25:17.501505	2017-11-23 19:25:17.501505
899	58	891	2017-11-23 19:25:17.505796	2017-11-23 19:25:17.505796
900	58	892	2017-11-23 19:25:17.510071	2017-11-23 19:25:17.510071
901	58	893	2017-11-23 19:25:17.514552	2017-11-23 19:25:17.514552
902	58	894	2017-11-23 19:25:17.519135	2017-11-23 19:25:17.519135
903	58	895	2017-11-23 19:25:17.5236	2017-11-23 19:25:17.5236
904	58	896	2017-11-23 19:25:17.528109	2017-11-23 19:25:17.528109
905	58	897	2017-11-23 19:25:17.532245	2017-11-23 19:25:17.532245
906	58	898	2017-11-23 19:25:17.536382	2017-11-23 19:25:17.536382
907	58	899	2017-11-23 19:25:17.540291	2017-11-23 19:25:17.540291
908	58	900	2017-11-23 19:25:17.544482	2017-11-23 19:25:17.544482
909	58	901	2017-11-23 19:25:17.548647	2017-11-23 19:25:17.548647
910	58	902	2017-11-23 19:25:17.55331	2017-11-23 19:25:17.55331
911	58	903	2017-11-23 19:25:17.557914	2017-11-23 19:25:17.557914
912	58	904	2017-11-23 19:25:17.562632	2017-11-23 19:25:17.562632
913	58	905	2017-11-23 19:25:17.566658	2017-11-23 19:25:17.566658
914	58	906	2017-11-23 19:25:17.57051	2017-11-23 19:25:17.57051
915	58	907	2017-11-23 19:25:17.574757	2017-11-23 19:25:17.574757
916	58	908	2017-11-23 19:25:17.578794	2017-11-23 19:25:17.578794
917	58	909	2017-11-23 19:25:17.582929	2017-11-23 19:25:17.582929
918	58	910	2017-11-23 19:25:17.588351	2017-11-23 19:25:17.588351
919	58	911	2017-11-23 19:25:17.593621	2017-11-23 19:25:17.593621
920	58	912	2017-11-23 19:25:17.599115	2017-11-23 19:25:17.599115
921	58	913	2017-11-23 19:25:17.604542	2017-11-23 19:25:17.604542
922	59	914	2017-11-23 19:25:29.069048	2017-11-23 19:25:29.069048
923	59	915	2017-11-23 19:25:29.078437	2017-11-23 19:25:29.078437
924	59	916	2017-11-23 19:25:29.084289	2017-11-23 19:25:29.084289
925	59	917	2017-11-23 19:25:29.089933	2017-11-23 19:25:29.089933
926	59	918	2017-11-23 19:25:29.096015	2017-11-23 19:25:29.096015
927	59	919	2017-11-23 19:25:29.101919	2017-11-23 19:25:29.101919
928	59	920	2017-11-23 19:25:29.108281	2017-11-23 19:25:29.108281
929	59	921	2017-11-23 19:25:29.114817	2017-11-23 19:25:29.114817
930	59	922	2017-11-23 19:25:29.122322	2017-11-23 19:25:29.122322
931	59	923	2017-11-23 19:25:29.127726	2017-11-23 19:25:29.127726
932	60	924	2017-11-23 19:25:40.172422	2017-11-23 19:25:40.172422
933	60	925	2017-11-23 19:25:40.178069	2017-11-23 19:25:40.178069
934	60	926	2017-11-23 19:25:40.182051	2017-11-23 19:25:40.182051
935	60	927	2017-11-23 19:25:40.186251	2017-11-23 19:25:40.186251
936	60	928	2017-11-23 19:25:40.190819	2017-11-23 19:25:40.190819
937	60	929	2017-11-23 19:25:40.196149	2017-11-23 19:25:40.196149
938	60	930	2017-11-23 19:25:40.201708	2017-11-23 19:25:40.201708
939	60	931	2017-11-23 19:25:40.207508	2017-11-23 19:25:40.207508
940	60	932	2017-11-23 19:25:40.212961	2017-11-23 19:25:40.212961
941	60	933	2017-11-23 19:25:40.218348	2017-11-23 19:25:40.218348
942	60	934	2017-11-23 19:25:40.224145	2017-11-23 19:25:40.224145
943	60	935	2017-11-23 19:25:40.230475	2017-11-23 19:25:40.230475
944	60	936	2017-11-23 19:25:40.236243	2017-11-23 19:25:40.236243
945	60	937	2017-11-23 19:25:40.241883	2017-11-23 19:25:40.241883
946	60	938	2017-11-23 19:25:40.247589	2017-11-23 19:25:40.247589
947	60	939	2017-11-23 19:25:40.253022	2017-11-23 19:25:40.253022
948	60	940	2017-11-23 19:25:40.258751	2017-11-23 19:25:40.258751
949	60	941	2017-11-23 19:25:40.265345	2017-11-23 19:25:40.265345
950	60	942	2017-11-23 19:25:40.272226	2017-11-23 19:25:40.272226
951	60	943	2017-11-23 19:25:40.279211	2017-11-23 19:25:40.279211
952	60	944	2017-11-23 19:25:40.285887	2017-11-23 19:25:40.285887
953	60	945	2017-11-23 19:25:40.291579	2017-11-23 19:25:40.291579
954	60	946	2017-11-23 19:25:40.297305	2017-11-23 19:25:40.297305
955	61	947	2017-11-23 19:25:51.160373	2017-11-23 19:25:51.160373
956	61	948	2017-11-23 19:25:51.165845	2017-11-23 19:25:51.165845
957	61	949	2017-11-23 19:25:51.171286	2017-11-23 19:25:51.171286
958	61	950	2017-11-23 19:25:51.176636	2017-11-23 19:25:51.176636
959	61	951	2017-11-23 19:25:51.183314	2017-11-23 19:25:51.183314
960	61	952	2017-11-23 19:25:51.190124	2017-11-23 19:25:51.190124
961	61	953	2017-11-23 19:25:51.195601	2017-11-23 19:25:51.195601
962	61	954	2017-11-23 19:25:51.201026	2017-11-23 19:25:51.201026
963	61	955	2017-11-23 19:25:51.205632	2017-11-23 19:25:51.205632
964	61	956	2017-11-23 19:25:51.209632	2017-11-23 19:25:51.209632
965	61	957	2017-11-23 19:25:51.213777	2017-11-23 19:25:51.213777
966	62	958	2017-11-23 19:29:15.502112	2017-11-23 19:29:15.502112
967	62	959	2017-11-23 19:29:15.506731	2017-11-23 19:29:15.506731
968	62	960	2017-11-23 19:29:15.510346	2017-11-23 19:29:15.510346
969	62	961	2017-11-23 19:29:15.514059	2017-11-23 19:29:15.514059
970	62	962	2017-11-23 19:29:15.517672	2017-11-23 19:29:15.517672
971	62	963	2017-11-23 19:29:15.521245	2017-11-23 19:29:15.521245
972	62	964	2017-11-23 19:29:15.524959	2017-11-23 19:29:15.524959
973	62	965	2017-11-23 19:29:15.529748	2017-11-23 19:29:15.529748
974	62	966	2017-11-23 19:29:15.53471	2017-11-23 19:29:15.53471
975	62	967	2017-11-23 19:29:15.539455	2017-11-23 19:29:15.539455
976	62	968	2017-11-23 19:29:15.543846	2017-11-23 19:29:15.543846
977	62	969	2017-11-23 19:29:15.548408	2017-11-23 19:29:15.548408
978	62	970	2017-11-23 19:29:15.553451	2017-11-23 19:29:15.553451
979	62	971	2017-11-23 19:29:15.559252	2017-11-23 19:29:15.559252
980	62	972	2017-11-23 19:29:15.564487	2017-11-23 19:29:15.564487
981	62	973	2017-11-23 19:29:15.569475	2017-11-23 19:29:15.569475
982	62	974	2017-11-23 19:29:15.575401	2017-11-23 19:29:15.575401
983	62	975	2017-11-23 19:29:15.582246	2017-11-23 19:29:15.582246
984	62	976	2017-11-23 19:29:15.588324	2017-11-23 19:29:15.588324
985	62	977	2017-11-23 19:29:15.593885	2017-11-23 19:29:15.593885
986	62	978	2017-11-23 19:29:15.599655	2017-11-23 19:29:15.599655
987	62	979	2017-11-23 19:29:15.605139	2017-11-23 19:29:15.605139
988	62	980	2017-11-23 19:29:15.610593	2017-11-23 19:29:15.610593
989	62	981	2017-11-23 19:29:15.61571	2017-11-23 19:29:15.61571
990	62	982	2017-11-23 19:29:15.620827	2017-11-23 19:29:15.620827
991	62	983	2017-11-23 19:29:15.626043	2017-11-23 19:29:15.626043
992	62	984	2017-11-23 19:29:15.631099	2017-11-23 19:29:15.631099
993	62	985	2017-11-23 19:29:15.636516	2017-11-23 19:29:15.636516
994	62	986	2017-11-23 19:29:15.64167	2017-11-23 19:29:15.64167
995	62	987	2017-11-23 19:29:15.64723	2017-11-23 19:29:15.64723
996	62	988	2017-11-23 19:29:15.6547	2017-11-23 19:29:15.6547
997	62	989	2017-11-23 19:29:15.660912	2017-11-23 19:29:15.660912
998	63	990	2017-11-23 19:29:37.420554	2017-11-23 19:29:37.420554
999	63	991	2017-11-23 19:29:37.426994	2017-11-23 19:29:37.426994
1000	63	992	2017-11-23 19:29:37.432271	2017-11-23 19:29:37.432271
1001	63	993	2017-11-23 19:29:37.438006	2017-11-23 19:29:37.438006
1002	63	994	2017-11-23 19:29:37.443746	2017-11-23 19:29:37.443746
1003	63	995	2017-11-23 19:29:37.449287	2017-11-23 19:29:37.449287
1004	63	996	2017-11-23 19:29:37.454957	2017-11-23 19:29:37.454957
1005	63	997	2017-11-23 19:29:37.461625	2017-11-23 19:29:37.461625
1006	63	998	2017-11-23 19:29:37.470138	2017-11-23 19:29:37.470138
1007	63	999	2017-11-23 19:29:37.479331	2017-11-23 19:29:37.479331
1008	63	1000	2017-11-23 19:29:37.484981	2017-11-23 19:29:37.484981
1009	63	1001	2017-11-23 19:29:37.492103	2017-11-23 19:29:37.492103
1010	63	1002	2017-11-23 19:29:37.498682	2017-11-23 19:29:37.498682
1011	63	1003	2017-11-23 19:29:37.504005	2017-11-23 19:29:37.504005
1012	63	1004	2017-11-23 19:29:37.509464	2017-11-23 19:29:37.509464
1013	63	1005	2017-11-23 19:29:37.515021	2017-11-23 19:29:37.515021
1014	63	1006	2017-11-23 19:29:37.522091	2017-11-23 19:29:37.522091
1015	64	1007	2017-11-23 19:29:49.121117	2017-11-23 19:29:49.121117
1016	64	1008	2017-11-23 19:29:49.126661	2017-11-23 19:29:49.126661
1017	64	1009	2017-11-23 19:29:49.132135	2017-11-23 19:29:49.132135
1018	64	1010	2017-11-23 19:29:49.137293	2017-11-23 19:29:49.137293
1019	64	1011	2017-11-23 19:29:49.142759	2017-11-23 19:29:49.142759
1020	64	1012	2017-11-23 19:29:49.148927	2017-11-23 19:29:49.148927
1021	64	1013	2017-11-23 19:29:49.155028	2017-11-23 19:29:49.155028
1022	64	1014	2017-11-23 19:29:49.161439	2017-11-23 19:29:49.161439
1023	64	1015	2017-11-23 19:29:49.168819	2017-11-23 19:29:49.168819
1024	64	1016	2017-11-23 19:29:49.175456	2017-11-23 19:29:49.175456
1025	64	1017	2017-11-23 19:29:49.181946	2017-11-23 19:29:49.181946
1026	64	1018	2017-11-23 19:29:49.188202	2017-11-23 19:29:49.188202
1027	64	1019	2017-11-23 19:29:49.19403	2017-11-23 19:29:49.19403
1028	65	1020	2017-11-23 19:30:00.315305	2017-11-23 19:30:00.315305
1029	65	1021	2017-11-23 19:30:00.320779	2017-11-23 19:30:00.320779
1030	65	1022	2017-11-23 19:30:00.325167	2017-11-23 19:30:00.325167
1031	65	1023	2017-11-23 19:30:00.329215	2017-11-23 19:30:00.329215
1032	65	1024	2017-11-23 19:30:00.333112	2017-11-23 19:30:00.333112
1033	65	1025	2017-11-23 19:30:00.33728	2017-11-23 19:30:00.33728
1034	65	1026	2017-11-23 19:30:00.341414	2017-11-23 19:30:00.341414
1035	65	1027	2017-11-23 19:30:00.345558	2017-11-23 19:30:00.345558
1036	65	1028	2017-11-23 19:30:00.349913	2017-11-23 19:30:00.349913
1037	65	1029	2017-11-23 19:30:00.354036	2017-11-23 19:30:00.354036
1038	65	1030	2017-11-23 19:30:00.358405	2017-11-23 19:30:00.358405
1039	65	1031	2017-11-23 19:30:00.36275	2017-11-23 19:30:00.36275
1040	65	1032	2017-11-23 19:30:00.36713	2017-11-23 19:30:00.36713
1041	65	1033	2017-11-23 19:30:00.371537	2017-11-23 19:30:00.371537
1042	65	1034	2017-11-23 19:30:00.378104	2017-11-23 19:30:00.378104
1043	65	1035	2017-11-23 19:30:00.384247	2017-11-23 19:30:00.384247
1044	65	1036	2017-11-23 19:30:00.390203	2017-11-23 19:30:00.390203
1045	65	1037	2017-11-23 19:30:00.395899	2017-11-23 19:30:00.395899
1046	65	1038	2017-11-23 19:30:00.401745	2017-11-23 19:30:00.401745
1047	65	1039	2017-11-23 19:30:00.40768	2017-11-23 19:30:00.40768
1048	65	1040	2017-11-23 19:30:00.413605	2017-11-23 19:30:00.413605
1049	65	1041	2017-11-23 19:30:00.419451	2017-11-23 19:30:00.419451
1050	65	1042	2017-11-23 19:30:00.425297	2017-11-23 19:30:00.425297
1051	65	1043	2017-11-23 19:30:00.431444	2017-11-23 19:30:00.431444
1052	65	1044	2017-11-23 19:30:00.438315	2017-11-23 19:30:00.438315
1053	65	1045	2017-11-23 19:30:00.44636	2017-11-23 19:30:00.44636
1054	65	1046	2017-11-23 19:30:00.452336	2017-11-23 19:30:00.452336
1055	65	1047	2017-11-23 19:30:00.458038	2017-11-23 19:30:00.458038
1056	66	1048	2017-11-23 19:33:04.394168	2017-11-23 19:33:04.394168
1057	66	1049	2017-11-23 19:33:04.399217	2017-11-23 19:33:04.399217
1058	66	1050	2017-11-23 19:33:04.403739	2017-11-23 19:33:04.403739
1059	66	1051	2017-11-23 19:33:04.408291	2017-11-23 19:33:04.408291
1060	66	1052	2017-11-23 19:33:04.413828	2017-11-23 19:33:04.413828
1061	66	1053	2017-11-23 19:33:04.418973	2017-11-23 19:33:04.418973
1062	66	1054	2017-11-23 19:33:04.424254	2017-11-23 19:33:04.424254
1063	66	1055	2017-11-23 19:33:04.429686	2017-11-23 19:33:04.429686
1064	66	1056	2017-11-23 19:33:04.435445	2017-11-23 19:33:04.435445
1065	66	1057	2017-11-23 19:33:04.440743	2017-11-23 19:33:04.440743
1066	66	1058	2017-11-23 19:33:04.446114	2017-11-23 19:33:04.446114
1067	66	1059	2017-11-23 19:33:04.452235	2017-11-23 19:33:04.452235
1068	66	1060	2017-11-23 19:33:04.459067	2017-11-23 19:33:04.459067
1069	66	1061	2017-11-23 19:33:04.465648	2017-11-23 19:33:04.465648
1070	66	1062	2017-11-23 19:33:04.470999	2017-11-23 19:33:04.470999
1071	66	1063	2017-11-23 19:33:04.476442	2017-11-23 19:33:04.476442
1072	66	1064	2017-11-23 19:33:04.482021	2017-11-23 19:33:04.482021
1073	66	1065	2017-11-23 19:33:04.488083	2017-11-23 19:33:04.488083
1074	66	1066	2017-11-23 19:33:04.495008	2017-11-23 19:33:04.495008
1075	67	1067	2017-11-23 19:33:16.21782	2017-11-23 19:33:16.21782
1076	67	1068	2017-11-23 19:33:16.223088	2017-11-23 19:33:16.223088
1077	67	1069	2017-11-23 19:33:16.227168	2017-11-23 19:33:16.227168
1078	67	1070	2017-11-23 19:33:16.231166	2017-11-23 19:33:16.231166
1079	67	1071	2017-11-23 19:33:16.235652	2017-11-23 19:33:16.235652
1080	67	1072	2017-11-23 19:33:16.240166	2017-11-23 19:33:16.240166
1081	67	1073	2017-11-23 19:33:16.245319	2017-11-23 19:33:16.245319
1082	67	1074	2017-11-23 19:33:16.249727	2017-11-23 19:33:16.249727
1083	67	1075	2017-11-23 19:33:16.253997	2017-11-23 19:33:16.253997
1084	67	1076	2017-11-23 19:33:16.258186	2017-11-23 19:33:16.258186
1085	67	1077	2017-11-23 19:33:16.262278	2017-11-23 19:33:16.262278
1086	67	1078	2017-11-23 19:33:16.266347	2017-11-23 19:33:16.266347
1087	67	1079	2017-11-23 19:33:16.270438	2017-11-23 19:33:16.270438
1088	67	1080	2017-11-23 19:33:16.274505	2017-11-23 19:33:16.274505
1089	67	1081	2017-11-23 19:33:16.278466	2017-11-23 19:33:16.278466
1090	67	1082	2017-11-23 19:33:16.282443	2017-11-23 19:33:16.282443
1091	67	1083	2017-11-23 19:33:16.286473	2017-11-23 19:33:16.286473
1092	67	1084	2017-11-23 19:33:16.290855	2017-11-23 19:33:16.290855
1093	67	1085	2017-11-23 19:33:16.295493	2017-11-23 19:33:16.295493
1094	67	1086	2017-11-23 19:33:16.299815	2017-11-23 19:33:16.299815
1095	67	1087	2017-11-23 19:33:16.305269	2017-11-23 19:33:16.305269
1096	67	1088	2017-11-23 19:33:16.311487	2017-11-23 19:33:16.311487
1097	68	1089	2017-11-23 19:33:27.306749	2017-11-23 19:33:27.306749
1098	68	1090	2017-11-23 19:33:27.311186	2017-11-23 19:33:27.311186
1099	68	1091	2017-11-23 19:33:27.31548	2017-11-23 19:33:27.31548
1100	68	1092	2017-11-23 19:33:27.320524	2017-11-23 19:33:27.320524
1101	68	1093	2017-11-23 19:33:27.324984	2017-11-23 19:33:27.324984
1102	68	1094	2017-11-23 19:33:27.329518	2017-11-23 19:33:27.329518
1103	68	1095	2017-11-23 19:33:27.333398	2017-11-23 19:33:27.333398
1104	68	1096	2017-11-23 19:33:27.337956	2017-11-23 19:33:27.337956
1105	68	1097	2017-11-23 19:33:27.342902	2017-11-23 19:33:27.342902
1106	68	1098	2017-11-23 19:33:27.348044	2017-11-23 19:33:27.348044
1107	68	1099	2017-11-23 19:33:27.352575	2017-11-23 19:33:27.352575
1108	68	1100	2017-11-23 19:33:27.356888	2017-11-23 19:33:27.356888
1109	68	1101	2017-11-23 19:33:27.36149	2017-11-23 19:33:27.36149
1110	68	1102	2017-11-23 19:33:27.365905	2017-11-23 19:33:27.365905
1111	68	1103	2017-11-23 19:33:27.37036	2017-11-23 19:33:27.37036
1112	68	1104	2017-11-23 19:33:27.375115	2017-11-23 19:33:27.375115
1113	68	1105	2017-11-23 19:33:27.379725	2017-11-23 19:33:27.379725
1114	68	1106	2017-11-23 19:33:27.385608	2017-11-23 19:33:27.385608
1115	68	1107	2017-11-23 19:33:27.391256	2017-11-23 19:33:27.391256
1116	68	1108	2017-11-23 19:33:27.396971	2017-11-23 19:33:27.396971
1117	68	1109	2017-11-23 19:33:27.402811	2017-11-23 19:33:27.402811
1118	68	1110	2017-11-23 19:33:27.408937	2017-11-23 19:33:27.408937
1119	68	1111	2017-11-23 19:33:27.416123	2017-11-23 19:33:27.416123
1120	68	1112	2017-11-23 19:33:27.423	2017-11-23 19:33:27.423
1121	68	1113	2017-11-23 19:33:27.428627	2017-11-23 19:33:27.428627
1122	68	1114	2017-11-23 19:33:27.43423	2017-11-23 19:33:27.43423
1123	68	1115	2017-11-23 19:33:27.442352	2017-11-23 19:33:27.442352
1124	68	1116	2017-11-23 19:33:27.449367	2017-11-23 19:33:27.449367
1125	68	1117	2017-11-23 19:33:27.455282	2017-11-23 19:33:27.455282
1126	68	1118	2017-11-23 19:33:27.464252	2017-11-23 19:33:27.464252
1127	68	1119	2017-11-23 19:33:27.470857	2017-11-23 19:33:27.470857
1128	68	1120	2017-11-23 19:33:27.47634	2017-11-23 19:33:27.47634
1129	68	1121	2017-11-23 19:33:27.481528	2017-11-23 19:33:27.481528
1130	68	1122	2017-11-23 19:33:27.487076	2017-11-23 19:33:27.487076
1131	68	1123	2017-11-23 19:33:27.493114	2017-11-23 19:33:27.493114
1132	69	1124	2017-11-23 19:33:39.102888	2017-11-23 19:33:39.102888
1133	69	1125	2017-11-23 19:33:39.109884	2017-11-23 19:33:39.109884
1134	69	1126	2017-11-23 19:33:39.115495	2017-11-23 19:33:39.115495
1135	69	1127	2017-11-23 19:33:39.121443	2017-11-23 19:33:39.121443
1136	69	1128	2017-11-23 19:33:39.126938	2017-11-23 19:33:39.126938
1137	69	1129	2017-11-23 19:33:39.13279	2017-11-23 19:33:39.13279
1138	69	1130	2017-11-23 19:33:39.138475	2017-11-23 19:33:39.138475
1139	69	1131	2017-11-23 19:33:39.145484	2017-11-23 19:33:39.145484
1140	69	1132	2017-11-23 19:33:39.151175	2017-11-23 19:33:39.151175
1141	69	1133	2017-11-23 19:33:39.156811	2017-11-23 19:33:39.156811
1142	69	1134	2017-11-23 19:33:39.166141	2017-11-23 19:33:39.166141
1143	69	1135	2017-11-23 19:33:39.172748	2017-11-23 19:33:39.172748
1144	70	1136	2017-11-23 19:33:50.129512	2017-11-23 19:33:50.129512
1145	70	1137	2017-11-23 19:33:50.136995	2017-11-23 19:33:50.136995
1146	70	1138	2017-11-23 19:33:50.143787	2017-11-23 19:33:50.143787
1147	70	1139	2017-11-23 19:33:50.150411	2017-11-23 19:33:50.150411
1148	70	1140	2017-11-23 19:33:50.155751	2017-11-23 19:33:50.155751
1149	70	1141	2017-11-23 19:33:50.161166	2017-11-23 19:33:50.161166
1150	70	1142	2017-11-23 19:33:50.167373	2017-11-23 19:33:50.167373
1151	70	1143	2017-11-23 19:33:50.173915	2017-11-23 19:33:50.173915
1152	70	1144	2017-11-23 19:33:50.179734	2017-11-23 19:33:50.179734
1153	70	1145	2017-11-23 19:33:50.185447	2017-11-23 19:33:50.185447
1154	70	1146	2017-11-23 19:33:50.1916	2017-11-23 19:33:50.1916
1155	70	1147	2017-11-23 19:33:50.198135	2017-11-23 19:33:50.198135
1156	70	1148	2017-11-23 19:33:50.203607	2017-11-23 19:33:50.203607
1157	70	1149	2017-11-23 19:33:50.208847	2017-11-23 19:33:50.208847
1158	70	1150	2017-11-23 19:33:50.21493	2017-11-23 19:33:50.21493
1159	70	1151	2017-11-23 19:33:50.22105	2017-11-23 19:33:50.22105
1160	71	1152	2017-11-23 19:40:48.761878	2017-11-23 19:40:48.761878
1161	71	1153	2017-11-23 19:40:48.767026	2017-11-23 19:40:48.767026
1162	71	1154	2017-11-23 19:40:48.771112	2017-11-23 19:40:48.771112
1163	71	1155	2017-11-23 19:40:48.774824	2017-11-23 19:40:48.774824
1164	71	1156	2017-11-23 19:40:48.778432	2017-11-23 19:40:48.778432
1165	71	1157	2017-11-23 19:40:48.782474	2017-11-23 19:40:48.782474
1166	71	1158	2017-11-23 19:40:48.787579	2017-11-23 19:40:48.787579
1167	71	1159	2017-11-23 19:40:48.792333	2017-11-23 19:40:48.792333
1168	71	1160	2017-11-23 19:40:48.797018	2017-11-23 19:40:48.797018
1169	71	1161	2017-11-23 19:40:48.801465	2017-11-23 19:40:48.801465
1170	71	1162	2017-11-23 19:40:48.805737	2017-11-23 19:40:48.805737
1171	71	1163	2017-11-23 19:40:48.810533	2017-11-23 19:40:48.810533
1172	71	1164	2017-11-23 19:40:48.81685	2017-11-23 19:40:48.81685
1173	71	1165	2017-11-23 19:40:48.821828	2017-11-23 19:40:48.821828
1174	71	1166	2017-11-23 19:40:48.827014	2017-11-23 19:40:48.827014
1175	71	1167	2017-11-23 19:40:48.832945	2017-11-23 19:40:48.832945
1176	71	1168	2017-11-23 19:40:48.839105	2017-11-23 19:40:48.839105
1177	71	1169	2017-11-23 19:40:48.845329	2017-11-23 19:40:48.845329
1178	71	1170	2017-11-23 19:40:48.851148	2017-11-23 19:40:48.851148
1179	71	1171	2017-11-23 19:40:48.857814	2017-11-23 19:40:48.857814
1180	71	1172	2017-11-23 19:40:48.864293	2017-11-23 19:40:48.864293
1181	71	1173	2017-11-23 19:40:48.869843	2017-11-23 19:40:48.869843
1182	71	1174	2017-11-23 19:40:48.875528	2017-11-23 19:40:48.875528
1183	71	1175	2017-11-23 19:40:48.880653	2017-11-23 19:40:48.880653
1184	71	1176	2017-11-23 19:40:48.885753	2017-11-23 19:40:48.885753
1185	71	1177	2017-11-23 19:40:48.891106	2017-11-23 19:40:48.891106
1186	71	1178	2017-11-23 19:40:48.896363	2017-11-23 19:40:48.896363
1187	72	1179	2017-11-23 19:41:10.375007	2017-11-23 19:41:10.375007
1188	72	1180	2017-11-23 19:41:10.380829	2017-11-23 19:41:10.380829
1189	72	1181	2017-11-23 19:41:10.388685	2017-11-23 19:41:10.388685
1190	72	1182	2017-11-23 19:41:10.395238	2017-11-23 19:41:10.395238
1191	72	1183	2017-11-23 19:41:10.402607	2017-11-23 19:41:10.402607
1192	72	1184	2017-11-23 19:41:10.410062	2017-11-23 19:41:10.410062
1193	72	1185	2017-11-23 19:41:10.416206	2017-11-23 19:41:10.416206
1194	72	1186	2017-11-23 19:41:10.422357	2017-11-23 19:41:10.422357
1195	72	1187	2017-11-23 19:41:10.429087	2017-11-23 19:41:10.429087
1196	73	1188	2017-11-23 19:41:22.311305	2017-11-23 19:41:22.311305
1197	73	1189	2017-11-23 19:41:22.315444	2017-11-23 19:41:22.315444
1198	73	1190	2017-11-23 19:41:22.319601	2017-11-23 19:41:22.319601
1199	73	1191	2017-11-23 19:41:22.323917	2017-11-23 19:41:22.323917
1200	73	1192	2017-11-23 19:41:22.328512	2017-11-23 19:41:22.328512
1201	73	1193	2017-11-23 19:41:22.332916	2017-11-23 19:41:22.332916
1202	73	1194	2017-11-23 19:41:22.337367	2017-11-23 19:41:22.337367
1203	73	1195	2017-11-23 19:41:22.341552	2017-11-23 19:41:22.341552
1204	73	1196	2017-11-23 19:41:22.345712	2017-11-23 19:41:22.345712
1205	73	1197	2017-11-23 19:41:22.350175	2017-11-23 19:41:22.350175
1206	73	1198	2017-11-23 19:41:22.354845	2017-11-23 19:41:22.354845
1207	73	1199	2017-11-23 19:41:22.360022	2017-11-23 19:41:22.360022
1208	73	1200	2017-11-23 19:41:22.365106	2017-11-23 19:41:22.365106
1209	73	1201	2017-11-23 19:41:22.370012	2017-11-23 19:41:22.370012
1210	73	1202	2017-11-23 19:41:22.375622	2017-11-23 19:41:22.375622
1211	73	1203	2017-11-23 19:41:22.381204	2017-11-23 19:41:22.381204
1212	73	1204	2017-11-23 19:41:22.387168	2017-11-23 19:41:22.387168
1213	73	1205	2017-11-23 19:41:22.393223	2017-11-23 19:41:22.393223
1214	73	1206	2017-11-23 19:41:22.399921	2017-11-23 19:41:22.399921
1215	73	1207	2017-11-23 19:41:22.405928	2017-11-23 19:41:22.405928
1216	73	1208	2017-11-23 19:41:22.411171	2017-11-23 19:41:22.411171
1217	73	1209	2017-11-23 19:41:22.41654	2017-11-23 19:41:22.41654
1218	73	1210	2017-11-23 19:41:22.422182	2017-11-23 19:41:22.422182
1219	73	1211	2017-11-23 19:41:22.427844	2017-11-23 19:41:22.427844
1220	73	1212	2017-11-23 19:41:22.433708	2017-11-23 19:41:22.433708
1221	73	1213	2017-11-23 19:41:22.439823	2017-11-23 19:41:22.439823
1222	73	1214	2017-11-23 19:41:22.447168	2017-11-23 19:41:22.447168
1223	73	1215	2017-11-23 19:41:22.453928	2017-11-23 19:41:22.453928
1224	73	1216	2017-11-23 19:41:22.45976	2017-11-23 19:41:22.45976
1225	73	1217	2017-11-23 19:41:22.465191	2017-11-23 19:41:22.465191
1226	73	1218	2017-11-23 19:41:22.470746	2017-11-23 19:41:22.470746
1227	73	1219	2017-11-23 19:41:22.477351	2017-11-23 19:41:22.477351
1228	73	1220	2017-11-23 19:41:22.484504	2017-11-23 19:41:22.484504
1229	73	1221	2017-11-23 19:41:22.490647	2017-11-23 19:41:22.490647
1230	73	1222	2017-11-23 19:41:22.496075	2017-11-23 19:41:22.496075
1231	73	1223	2017-11-23 19:41:22.501704	2017-11-23 19:41:22.501704
1232	73	1224	2017-11-23 19:41:22.507208	2017-11-23 19:41:22.507208
1233	73	1225	2017-11-23 19:41:22.512791	2017-11-23 19:41:22.512791
1234	73	1226	2017-11-23 19:41:22.518451	2017-11-23 19:41:22.518451
1235	73	1227	2017-11-23 19:41:22.524109	2017-11-23 19:41:22.524109
1236	73	1228	2017-11-23 19:41:22.529831	2017-11-23 19:41:22.529831
1237	73	1229	2017-11-23 19:41:22.536772	2017-11-23 19:41:22.536772
1238	73	1230	2017-11-23 19:41:22.543912	2017-11-23 19:41:22.543912
1239	73	1231	2017-11-23 19:41:22.550898	2017-11-23 19:41:22.550898
1240	73	1232	2017-11-23 19:41:22.55797	2017-11-23 19:41:22.55797
1241	73	1233	2017-11-23 19:41:22.565121	2017-11-23 19:41:22.565121
1242	73	1234	2017-11-23 19:41:22.570732	2017-11-23 19:41:22.570732
1243	73	1235	2017-11-23 19:41:22.575835	2017-11-23 19:41:22.575835
1244	73	1236	2017-11-23 19:41:22.580487	2017-11-23 19:41:22.580487
1245	73	1237	2017-11-23 19:41:22.584828	2017-11-23 19:41:22.584828
1246	74	1238	2017-11-23 19:41:34.266805	2017-11-23 19:41:34.266805
1247	74	1239	2017-11-23 19:41:34.272951	2017-11-23 19:41:34.272951
1248	74	1240	2017-11-23 19:41:34.278791	2017-11-23 19:41:34.278791
1249	74	1241	2017-11-23 19:41:34.284687	2017-11-23 19:41:34.284687
1250	74	1242	2017-11-23 19:41:34.28909	2017-11-23 19:41:34.28909
1251	74	1243	2017-11-23 19:41:34.293644	2017-11-23 19:41:34.293644
1252	74	1244	2017-11-23 19:41:34.297828	2017-11-23 19:41:34.297828
1253	74	1245	2017-11-23 19:41:34.302218	2017-11-23 19:41:34.302218
1254	74	1246	2017-11-23 19:41:34.306369	2017-11-23 19:41:34.306369
1255	74	1247	2017-11-23 19:41:34.310723	2017-11-23 19:41:34.310723
1256	74	1248	2017-11-23 19:41:34.315439	2017-11-23 19:41:34.315439
1257	74	1249	2017-11-23 19:41:34.319919	2017-11-23 19:41:34.319919
1258	75	1250	2017-11-23 19:44:13.169098	2017-11-23 19:44:13.169098
1259	75	1251	2017-11-23 19:44:13.173863	2017-11-23 19:44:13.173863
1260	75	1252	2017-11-23 19:44:13.177862	2017-11-23 19:44:13.177862
1261	75	1253	2017-11-23 19:44:13.18191	2017-11-23 19:44:13.18191
1262	75	1254	2017-11-23 19:44:13.185853	2017-11-23 19:44:13.185853
1263	75	1255	2017-11-23 19:44:13.190501	2017-11-23 19:44:13.190501
1264	75	1256	2017-11-23 19:44:13.196165	2017-11-23 19:44:13.196165
1265	75	1257	2017-11-23 19:44:13.201777	2017-11-23 19:44:13.201777
1266	75	1258	2017-11-23 19:44:13.206613	2017-11-23 19:44:13.206613
1267	75	1259	2017-11-23 19:44:13.211342	2017-11-23 19:44:13.211342
1268	75	1260	2017-11-23 19:44:13.215846	2017-11-23 19:44:13.215846
1269	75	1261	2017-11-23 19:44:13.220026	2017-11-23 19:44:13.220026
1270	75	1262	2017-11-23 19:44:13.224272	2017-11-23 19:44:13.224272
1271	75	1263	2017-11-23 19:44:13.22854	2017-11-23 19:44:13.22854
1272	76	1264	2017-11-23 19:44:24.228146	2017-11-23 19:44:24.228146
1273	76	1265	2017-11-23 19:44:24.234885	2017-11-23 19:44:24.234885
1274	76	1266	2017-11-23 19:44:24.241372	2017-11-23 19:44:24.241372
1275	76	1267	2017-11-23 19:44:24.247126	2017-11-23 19:44:24.247126
1276	76	1268	2017-11-23 19:44:24.25379	2017-11-23 19:44:24.25379
1277	76	1269	2017-11-23 19:44:24.260332	2017-11-23 19:44:24.260332
1278	76	1270	2017-11-23 19:44:24.266486	2017-11-23 19:44:24.266486
1279	76	1271	2017-11-23 19:44:24.274325	2017-11-23 19:44:24.274325
1280	76	1272	2017-11-23 19:44:24.279756	2017-11-23 19:44:24.279756
1281	76	1273	2017-11-23 19:44:24.285075	2017-11-23 19:44:24.285075
1282	76	1274	2017-11-23 19:44:24.291334	2017-11-23 19:44:24.291334
1283	76	1275	2017-11-23 19:44:24.295605	2017-11-23 19:44:24.295605
1284	76	1276	2017-11-23 19:44:24.299993	2017-11-23 19:44:24.299993
1285	76	1277	2017-11-23 19:44:24.304807	2017-11-23 19:44:24.304807
1286	76	1278	2017-11-23 19:44:24.309314	2017-11-23 19:44:24.309314
1287	76	1279	2017-11-23 19:44:24.313619	2017-11-23 19:44:24.313619
1288	76	1280	2017-11-23 19:44:24.317577	2017-11-23 19:44:24.317577
1289	76	1281	2017-11-23 19:44:24.321382	2017-11-23 19:44:24.321382
1290	76	1282	2017-11-23 19:44:24.325256	2017-11-23 19:44:24.325256
1291	76	1283	2017-11-23 19:44:24.329429	2017-11-23 19:44:24.329429
1292	76	1284	2017-11-23 19:44:24.333611	2017-11-23 19:44:24.333611
1293	76	1285	2017-11-23 19:44:24.337892	2017-11-23 19:44:24.337892
1294	76	1286	2017-11-23 19:44:24.342113	2017-11-23 19:44:24.342113
1295	76	1287	2017-11-23 19:44:24.346393	2017-11-23 19:44:24.346393
1296	76	1288	2017-11-23 19:44:24.35051	2017-11-23 19:44:24.35051
1297	76	1289	2017-11-23 19:44:24.354669	2017-11-23 19:44:24.354669
1298	76	1290	2017-11-23 19:44:24.358758	2017-11-23 19:44:24.358758
1299	76	1291	2017-11-23 19:44:24.363107	2017-11-23 19:44:24.363107
1300	76	1292	2017-11-23 19:44:24.367588	2017-11-23 19:44:24.367588
1301	76	1293	2017-11-23 19:44:24.372151	2017-11-23 19:44:24.372151
1302	76	1294	2017-11-23 19:44:24.376924	2017-11-23 19:44:24.376924
1303	76	1295	2017-11-23 19:44:24.381198	2017-11-23 19:44:24.381198
1304	76	1296	2017-11-23 19:44:24.385354	2017-11-23 19:44:24.385354
1305	76	1297	2017-11-23 19:44:24.389533	2017-11-23 19:44:24.389533
1306	76	1298	2017-11-23 19:44:24.393762	2017-11-23 19:44:24.393762
1307	76	1299	2017-11-23 19:44:24.397782	2017-11-23 19:44:24.397782
1308	76	1300	2017-11-23 19:44:24.401618	2017-11-23 19:44:24.401618
1309	76	1301	2017-11-23 19:44:24.405399	2017-11-23 19:44:24.405399
1310	76	1302	2017-11-23 19:44:24.409268	2017-11-23 19:44:24.409268
1311	76	1303	2017-11-23 19:44:24.413386	2017-11-23 19:44:24.413386
1312	76	1304	2017-11-23 19:44:24.417595	2017-11-23 19:44:24.417595
1313	76	1305	2017-11-23 19:44:24.422779	2017-11-23 19:44:24.422779
1314	77	1306	2017-11-23 19:44:36.187749	2017-11-23 19:44:36.187749
1315	77	1307	2017-11-23 19:44:36.193878	2017-11-23 19:44:36.193878
1316	77	1308	2017-11-23 19:44:36.199674	2017-11-23 19:44:36.199674
1317	77	1309	2017-11-23 19:44:36.205487	2017-11-23 19:44:36.205487
1318	77	1310	2017-11-23 19:44:36.211558	2017-11-23 19:44:36.211558
1319	77	1311	2017-11-23 19:44:36.217232	2017-11-23 19:44:36.217232
1320	77	1312	2017-11-23 19:44:36.223822	2017-11-23 19:44:36.223822
1321	77	1313	2017-11-23 19:44:36.229526	2017-11-23 19:44:36.229526
1322	77	1314	2017-11-23 19:44:36.235305	2017-11-23 19:44:36.235305
1323	77	1315	2017-11-23 19:44:36.241388	2017-11-23 19:44:36.241388
1324	77	1316	2017-11-23 19:44:36.247465	2017-11-23 19:44:36.247465
1325	77	1317	2017-11-23 19:44:36.252927	2017-11-23 19:44:36.252927
1326	77	1318	2017-11-23 19:44:36.258596	2017-11-23 19:44:36.258596
1327	77	1319	2017-11-23 19:44:36.265629	2017-11-23 19:44:36.265629
1328	77	1320	2017-11-23 19:44:36.272537	2017-11-23 19:44:36.272537
1329	77	1321	2017-11-23 19:44:36.278911	2017-11-23 19:44:36.278911
1330	77	1322	2017-11-23 19:44:36.284561	2017-11-23 19:44:36.284561
1331	77	1323	2017-11-23 19:44:36.290912	2017-11-23 19:44:36.290912
1332	77	1324	2017-11-23 19:44:36.296468	2017-11-23 19:44:36.296468
1333	77	1325	2017-11-23 19:44:36.301603	2017-11-23 19:44:36.301603
1334	77	1326	2017-11-23 19:44:36.305935	2017-11-23 19:44:36.305935
1335	77	1327	2017-11-23 19:44:36.311046	2017-11-23 19:44:36.311046
1336	78	1328	2017-11-23 19:44:47.11028	2017-11-23 19:44:47.11028
1337	78	1329	2017-11-23 19:44:47.117442	2017-11-23 19:44:47.117442
1338	78	1330	2017-11-23 19:44:47.124055	2017-11-23 19:44:47.124055
1339	78	1331	2017-11-23 19:44:47.129378	2017-11-23 19:44:47.129378
1340	78	1332	2017-11-23 19:44:47.134853	2017-11-23 19:44:47.134853
1341	78	1333	2017-11-23 19:44:47.140583	2017-11-23 19:44:47.140583
1342	78	1334	2017-11-23 19:44:47.145951	2017-11-23 19:44:47.145951
1343	78	1335	2017-11-23 19:44:47.151623	2017-11-23 19:44:47.151623
1344	78	1336	2017-11-23 19:44:47.157156	2017-11-23 19:44:47.157156
1345	78	1337	2017-11-23 19:44:47.162939	2017-11-23 19:44:47.162939
1346	78	1338	2017-11-23 19:44:47.169167	2017-11-23 19:44:47.169167
1347	78	1339	2017-11-23 19:44:47.17501	2017-11-23 19:44:47.17501
1348	78	1340	2017-11-23 19:44:47.180845	2017-11-23 19:44:47.180845
1349	78	1341	2017-11-23 19:44:47.187843	2017-11-23 19:44:47.187843
1350	79	1342	2017-11-23 19:44:57.992414	2017-11-23 19:44:57.992414
1351	79	1343	2017-11-23 19:44:57.99859	2017-11-23 19:44:57.99859
1352	79	1344	2017-11-23 19:44:58.005123	2017-11-23 19:44:58.005123
1353	79	1345	2017-11-23 19:44:58.010547	2017-11-23 19:44:58.010547
1354	79	1346	2017-11-23 19:44:58.015083	2017-11-23 19:44:58.015083
1355	79	1347	2017-11-23 19:44:58.019811	2017-11-23 19:44:58.019811
1356	79	1348	2017-11-23 19:44:58.024333	2017-11-23 19:44:58.024333
1357	79	1349	2017-11-23 19:44:58.028507	2017-11-23 19:44:58.028507
1358	79	1350	2017-11-23 19:44:58.032753	2017-11-23 19:44:58.032753
1359	79	1351	2017-11-23 19:44:58.037067	2017-11-23 19:44:58.037067
1360	79	1352	2017-11-23 19:44:58.041153	2017-11-23 19:44:58.041153
1361	79	1353	2017-11-23 19:44:58.045182	2017-11-23 19:44:58.045182
1362	79	1354	2017-11-23 19:44:58.04926	2017-11-23 19:44:58.04926
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('tracks_id_seq', 1362, true);


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

