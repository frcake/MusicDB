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
11	The Complete BBC Sessions	2016-09-16	2017-11-23 18:25:18.551789	2017-11-23 18:25:18.551789	1	\N	31
12	Live At The Hollywood Bowl	2016-09-09	2017-11-23 18:25:30.55955	2017-11-23 18:25:30.55955	1	\N	32
13	The Endless River	2014-11-07	2017-11-23 18:25:42.423228	2017-11-23 18:25:42.423228	1	\N	33
14	Queen On Air	2016-10-21	2017-11-23 18:25:53.518432	2017-11-23 18:25:53.518432	1	\N	34
15	Rock or Bust	2015-06-30	2017-11-23 18:26:04.50149	2017-11-23 18:26:04.50149	1	\N	35
16	Live in Germany 1988	2016-07-21	2017-11-23 18:29:25.714712	2017-11-23 18:29:25.714712	16	\N	36
17	Sunshine Of Your Love - A Life In Music	2015-10-09	2017-11-23 18:29:37.47033	2017-11-23 18:29:37.47033	16	\N	37
18	Live - Greatest Hits From Around The World	2016-09-09	2017-11-23 18:29:48.426726	2017-11-23 18:29:48.426726	16	\N	38
19	The Ultimate Collection	2017-04-21	2017-11-23 18:29:59.507276	2017-11-23 18:29:59.507276	16	\N	39
20	Maximum As & Bs	2017-10-27	2017-11-23 18:30:10.534393	2017-11-23 18:30:10.534393	16	\N	40
21	Revolution Radio	2016-10-07	2017-11-23 18:33:30.605341	2017-11-23 18:33:30.605341	16	\N	41
22	Milking The Sacred Cow	2007-10-09	2017-11-23 18:33:41.846075	2017-11-23 18:33:41.846075	16	\N	42
23	Live at Shea Stadium	\N	2017-11-23 18:33:53.626906	2017-11-23 18:33:53.626906	16	\N	43
24	DeA.D. Alive!	2013-01-22	2017-11-23 18:34:04.914679	2017-11-23 18:34:04.914679	16	\N	44
25	Christmas Songs	2013-10-29	2017-11-23 18:34:57.32632	2017-11-23 18:34:57.32632	16	\N	45
26	American Epic: The Carter Family	2017-05-12	2017-11-23 18:37:28.666881	2017-11-23 18:37:28.666881	16	\N	46
27	Blue Moon Of Kentucky	2017-03-02	2017-11-23 18:37:40.664894	2017-11-23 18:37:40.664894	16	\N	47
28	American Christmas	2017-10-06	2017-11-23 18:37:52.607741	2017-11-23 18:37:52.607741	16	\N	48
29	Delicious Christmas	2016-10-21	2017-11-23 18:38:04.645705	2017-11-23 18:38:04.645705	16	\N	49
30	Volunteer Jam III & IV (Live)	2017-02-24	2017-11-23 18:38:15.522177	2017-11-23 18:38:15.522177	16	\N	50
31	The Saga Continues	2017-10-13	2017-11-23 18:40:57.53156	2017-11-23 18:40:57.53156	16	\N	51
32	Efil4zaggin	1991-05-28	2017-11-23 18:41:08.482958	2017-11-23 18:41:08.482958	16	\N	52
33	LIVE AT MONTREUX 2001	2007-04-03	2017-11-23 18:41:19.66526	2017-11-23 18:41:19.66526	16	\N	53
34	We got it from Here... Thank You 4 Your service	2016-11-11	2017-11-23 18:41:30.460861	2017-11-23 18:41:30.460861	16	\N	54
35	Live From Metropolis Studios	2015-09-04	2017-11-23 18:41:42.514721	2017-11-23 18:41:42.514721	16	\N	55
36	Hardwired…To Self-Destruct	2016-11-18	2017-11-23 18:44:28.966448	2017-11-23 18:44:28.966448	16	\N	56
37	The Book Of Souls: Live Chapter	2017-11-17	2017-11-23 18:44:40.765048	2017-11-23 18:44:40.765048	16	\N	57
38	The End (Live)	2017-11-17	2017-11-23 18:44:52.806009	2017-11-23 18:44:52.806009	16	\N	58
39	Dystopia (Deluxe Edition)	2017-05-10	2017-11-23 18:45:04.898685	2017-11-23 18:45:04.898685	16	\N	59
40	Turbo 30 (Remastered 30th Anniversary Deluxe Edition)	2017-02-03	2017-11-23 18:45:16.832374	2017-11-23 18:45:16.832374	16	\N	60
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('albums_id_seq', 40, true);


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
18	\N	\N	2017-11-23 18:25:17.388893	2017-11-23 18:25:17.388893	1	Jimmy Page
19	\N	\N	2017-11-23 18:25:17.392662	2017-11-23 18:25:17.392662	1	John Baldwin
20	\N	\N	2017-11-23 18:25:17.395214	2017-11-23 18:25:17.395214	1	John Bonham
21	\N	\N	2017-11-23 18:25:17.397897	2017-11-23 18:25:17.397897	1	Robert Plant
22	\N	\N	2017-11-23 18:25:29.360354	2017-11-23 18:25:29.360354	1	George Harrison
23	\N	\N	2017-11-23 18:25:29.365556	2017-11-23 18:25:29.365556	1	John Lennon
24	\N	\N	2017-11-23 18:25:29.370601	2017-11-23 18:25:29.370601	1	Paul McCartney
25	\N	\N	2017-11-23 18:25:29.375531	2017-11-23 18:25:29.375531	1	Pete Best
26	\N	\N	2017-11-23 18:25:29.380534	2017-11-23 18:25:29.380534	1	Richard Starkey
27	\N	\N	2017-11-23 18:25:29.385381	2017-11-23 18:25:29.385381	1	Stuart Sutcliffe
28	\N	\N	2017-11-23 18:25:41.362312	2017-11-23 18:25:41.362312	1	David Gilmour
29	\N	\N	2017-11-23 18:25:41.367027	2017-11-23 18:25:41.367027	1	Nick Mason
30	\N	\N	2017-11-23 18:25:41.371308	2017-11-23 18:25:41.371308	1	Richard Wright
31	\N	\N	2017-11-23 18:25:41.375377	2017-11-23 18:25:41.375377	1	Roger Waters
32	\N	\N	2017-11-23 18:25:41.379225	2017-11-23 18:25:41.379225	1	Syd Barrett
33	\N	\N	2017-11-23 18:25:52.368509	2017-11-23 18:25:52.368509	1	Barry Mitchell
34	\N	\N	2017-11-23 18:25:52.373305	2017-11-23 18:25:52.373305	1	Brian May
35	\N	\N	2017-11-23 18:25:52.377553	2017-11-23 18:25:52.377553	1	Freddie Mercury
36	\N	\N	2017-11-23 18:25:52.38151	2017-11-23 18:25:52.38151	1	John Deacon
37	\N	\N	2017-11-23 18:25:52.385958	2017-11-23 18:25:52.385958	1	Roger Taylor
38	\N	\N	2017-11-23 18:26:03.361332	2017-11-23 18:26:03.361332	1	Angus Young
39	\N	\N	2017-11-23 18:26:03.36612	2017-11-23 18:26:03.36612	1	Axl Rose
40	\N	\N	2017-11-23 18:26:03.37051	2017-11-23 18:26:03.37051	1	Bon Scott
41	\N	\N	2017-11-23 18:26:03.374705	2017-11-23 18:26:03.374705	1	Brian Johnson
42	\N	\N	2017-11-23 18:26:03.379186	2017-11-23 18:26:03.379186	1	Chris Slade
43	\N	\N	2017-11-23 18:26:03.383429	2017-11-23 18:26:03.383429	1	Cliff Williams
44	\N	\N	2017-11-23 18:26:03.387749	2017-11-23 18:26:03.387749	1	Colin Burgess
45	\N	\N	2017-11-23 18:26:03.392042	2017-11-23 18:26:03.392042	1	Dave Evans
46	\N	\N	2017-11-23 18:26:03.396204	2017-11-23 18:26:03.396204	1	Larry Van Kriedt
47	\N	\N	2017-11-23 18:26:03.400122	2017-11-23 18:26:03.400122	1	Malcolm Young
48	\N	\N	2017-11-23 18:26:03.403908	2017-11-23 18:26:03.403908	1	Mark Evans (3)
49	\N	\N	2017-11-23 18:26:03.407988	2017-11-23 18:26:03.407988	1	Peter Clack
50	\N	\N	2017-11-23 18:26:03.412298	2017-11-23 18:26:03.412298	1	Phil Rudd
51	\N	\N	2017-11-23 18:26:03.416256	2017-11-23 18:26:03.416256	1	Rob Bailey (5)
52	\N	\N	2017-11-23 18:26:03.420239	2017-11-23 18:26:03.420239	1	Simon Wright (4)
53	\N	\N	2017-11-23 18:26:03.424234	2017-11-23 18:26:03.424234	1	Steve Young (7)
54	\N	\N	2017-11-23 18:26:03.428352	2017-11-23 18:26:03.428352	1	Tony Currenti
55	\N	\N	2017-11-23 18:29:24.384122	2017-11-23 18:29:24.384122	16	Alan Skidmore
56	\N	\N	2017-11-23 18:29:24.389414	2017-11-23 18:29:24.389414	16	Aynsley Dunbar
57	\N	\N	2017-11-23 18:29:24.394018	2017-11-23 18:29:24.394018	16	Bobby Haynes
58	\N	\N	2017-11-23 18:29:24.398077	2017-11-23 18:29:24.398077	16	Buddy Whittington
59	\N	\N	2017-11-23 18:29:24.40247	2017-11-23 18:29:24.40247	16	Chris Mercer
60	\N	\N	2017-11-23 18:29:24.405778	2017-11-23 18:29:24.405778	16	Coco Montoya
61	\N	\N	2017-11-23 18:29:24.408948	2017-11-23 18:29:24.408948	16	Colin Allen
62	\N	\N	2017-11-23 18:29:24.412042	2017-11-23 18:29:24.412042	16	Dick Heckstall-Smith
63	\N	\N	2017-11-23 18:29:24.415545	2017-11-23 18:29:24.415545	16	Eric Clapton
64	\N	\N	2017-11-23 18:29:24.419056	2017-11-23 18:29:24.419056	16	Hank Van Sickle
65	\N	\N	2017-11-23 18:29:24.422778	2017-11-23 18:29:24.422778	16	Jimmy McCulloch
66	\N	\N	2017-11-23 18:29:24.42615	2017-11-23 18:29:24.42615	16	Joe Yuele
67	\N	\N	2017-11-23 18:29:24.42955	2017-11-23 18:29:24.42955	16	John Mayall
68	\N	\N	2017-11-23 18:29:24.432327	2017-11-23 18:29:24.432327	16	John McVie
69	\N	\N	2017-11-23 18:29:24.435338	2017-11-23 18:29:24.435338	16	Jon Hiseman
70	\N	\N	2017-11-23 18:29:24.438737	2017-11-23 18:29:24.438737	16	Keef Hartley
71	\N	\N	2017-11-23 18:29:24.442259	2017-11-23 18:29:24.442259	16	Keith Tillman
72	\N	\N	2017-11-23 18:29:24.445305	2017-11-23 18:29:24.445305	16	Larry Taylor
73	\N	\N	2017-11-23 18:29:24.448267	2017-11-23 18:29:24.448267	16	Mick Taylor
74	\N	\N	2017-11-23 18:29:24.451207	2017-11-23 18:29:24.451207	16	Peter Green (2)
75	\N	\N	2017-11-23 18:29:24.454512	2017-11-23 18:29:24.454512	16	Ray Warleigh
76	\N	\N	2017-11-23 18:29:24.457453	2017-11-23 18:29:24.457453	16	Rick Cortes
77	\N	\N	2017-11-23 18:29:24.460348	2017-11-23 18:29:24.460348	16	Rip Kant
78	\N	\N	2017-11-23 18:29:24.46315	2017-11-23 18:29:24.46315	16	Tom Canning
79	\N	\N	2017-11-23 18:29:24.465816	2017-11-23 18:29:24.465816	16	Tony Reeves
80	\N	\N	2017-11-23 18:29:24.468422	2017-11-23 18:29:24.468422	16	Walter Trout
81	\N	\N	2017-11-23 18:29:36.36046	2017-11-23 18:29:36.36046	16	David Larkham
82	\N	\N	2017-11-23 18:29:47.3703	2017-11-23 18:29:47.3703	16	Billy Gibbons
83	\N	\N	2017-11-23 18:29:47.375925	2017-11-23 18:29:47.375925	16	Dan Mitchell (3)
84	\N	\N	2017-11-23 18:29:47.379997	2017-11-23 18:29:47.379997	16	Dusty Hill
85	\N	\N	2017-11-23 18:29:47.383857	2017-11-23 18:29:47.383857	16	Frank Beard
86	\N	\N	2017-11-23 18:29:47.388049	2017-11-23 18:29:47.388049	16	Lanier Greig
87	\N	\N	2017-11-23 18:29:58.371496	2017-11-23 18:29:58.371496	16	Allen Woody
88	\N	\N	2017-11-23 18:29:58.375906	2017-11-23 18:29:58.375906	16	Berry Oakley
89	\N	\N	2017-11-23 18:29:58.379808	2017-11-23 18:29:58.379808	16	Butch Trucks
90	\N	\N	2017-11-23 18:29:58.383225	2017-11-23 18:29:58.383225	16	Chuck Leavell
91	\N	\N	2017-11-23 18:29:58.386464	2017-11-23 18:29:58.386464	16	Dan Toler
92	\N	\N	2017-11-23 18:29:58.389432	2017-11-23 18:29:58.389432	16	David "Frankie" Toler
93	\N	\N	2017-11-23 18:29:58.392231	2017-11-23 18:29:58.392231	16	Derek Trucks
94	\N	\N	2017-11-23 18:29:58.395137	2017-11-23 18:29:58.395137	16	Dickey Betts
95	\N	\N	2017-11-23 18:29:58.398579	2017-11-23 18:29:58.398579	16	Duane Allman
96	\N	\N	2017-11-23 18:29:58.401259	2017-11-23 18:29:58.401259	16	Gregg Allman
97	\N	\N	2017-11-23 18:29:58.404063	2017-11-23 18:29:58.404063	16	Jai Johanny Johanson
98	\N	\N	2017-11-23 18:29:58.406813	2017-11-23 18:29:58.406813	16	Johnny Neel
99	\N	\N	2017-11-23 18:29:58.410229	2017-11-23 18:29:58.410229	16	Lamar Williams
100	\N	\N	2017-11-23 18:29:58.413762	2017-11-23 18:29:58.413762	16	Marc Quinones
101	\N	\N	2017-11-23 18:29:58.416826	2017-11-23 18:29:58.416826	16	Oteil Burbridge
102	\N	\N	2017-11-23 18:29:58.420021	2017-11-23 18:29:58.420021	16	Reese Wynans
103	\N	\N	2017-11-23 18:29:58.423221	2017-11-23 18:29:58.423221	16	Warren Haynes
104	\N	\N	2017-11-23 18:30:09.370185	2017-11-23 18:30:09.370185	16	John "Rabbit" Bundrick
105	\N	\N	2017-11-23 18:30:09.375652	2017-11-23 18:30:09.375652	16	John Entwistle
106	\N	\N	2017-11-23 18:30:09.380711	2017-11-23 18:30:09.380711	16	Keith Moon
107	\N	\N	2017-11-23 18:30:09.384983	2017-11-23 18:30:09.384983	16	Kenny Jones
108	\N	\N	2017-11-23 18:30:09.388674	2017-11-23 18:30:09.388674	16	Pete Townshend
109	\N	\N	2017-11-23 18:30:09.402947	2017-11-23 18:30:09.402947	16	Roger Daltrey
110	\N	\N	2017-11-23 18:30:09.412696	2017-11-23 18:30:09.412696	16	Simon Townshend
111	\N	\N	2017-11-23 18:30:09.416759	2017-11-23 18:30:09.416759	16	Zak Starkey
112	\N	\N	2017-11-23 18:33:29.396477	2017-11-23 18:33:29.396477	16	Billie Joe Armstrong
113	\N	\N	2017-11-23 18:33:29.401226	2017-11-23 18:33:29.401226	16	Frank E. Wright
114	\N	\N	2017-11-23 18:33:29.405992	2017-11-23 18:33:29.405992	16	Jason White (3)
115	\N	\N	2017-11-23 18:33:29.409302	2017-11-23 18:33:29.409302	16	John Kiffmeyer
116	\N	\N	2017-11-23 18:33:29.412432	2017-11-23 18:33:29.412432	16	Michael Pritchard
117	\N	\N	2017-11-23 18:33:40.360114	2017-11-23 18:33:40.360114	16	Brandon Cruz
118	\N	\N	2017-11-23 18:33:40.367217	2017-11-23 18:33:40.367217	16	Bruce Slesinger
119	\N	\N	2017-11-23 18:33:40.371596	2017-11-23 18:33:40.371596	16	Carlos Cadona
120	\N	\N	2017-11-23 18:33:40.375888	2017-11-23 18:33:40.375888	16	D.H. Peligro
121	\N	\N	2017-11-23 18:33:40.380396	2017-11-23 18:33:40.380396	16	Eric Boucher
122	\N	\N	2017-11-23 18:33:40.384982	2017-11-23 18:33:40.384982	16	Geoffrey Lyall
123	\N	\N	2017-11-23 18:33:40.389082	2017-11-23 18:33:40.389082	16	Ray Pepperell
124	\N	\N	2017-11-23 18:33:40.392027	2017-11-23 18:33:40.392027	16	Skip (27)
125	\N	\N	2017-11-23 18:33:40.395232	2017-11-23 18:33:40.395232	16	Steve "Boomstick" Wilson
126	\N	\N	2017-11-23 18:33:52.355944	2017-11-23 18:33:52.355944	16	John Mellor
127	\N	\N	2017-11-23 18:33:52.359729	2017-11-23 18:33:52.359729	16	Keith Levene
128	\N	\N	2017-11-23 18:33:52.362443	2017-11-23 18:33:52.362443	16	Mick Jones
129	\N	\N	2017-11-23 18:33:52.364887	2017-11-23 18:33:52.364887	16	Nick Sheppard
130	\N	\N	2017-11-23 18:33:52.367813	2017-11-23 18:33:52.367813	16	Paul Simonon
131	\N	\N	2017-11-23 18:33:52.370876	2017-11-23 18:33:52.370876	16	Pete Howard
132	\N	\N	2017-11-23 18:33:52.373951	2017-11-23 18:33:52.373951	16	Terry Chimes
133	\N	\N	2017-11-23 18:33:52.378016	2017-11-23 18:33:52.378016	16	Topper Headon
134	\N	\N	2017-11-23 18:33:52.381653	2017-11-23 18:33:52.381653	16	Vince White
135	\N	\N	2017-11-23 18:34:03.361517	2017-11-23 18:34:03.361517	16	Arthur Googy
136	\N	\N	2017-11-23 18:34:03.365855	2017-11-23 18:34:03.365855	16	Bobby Steele
137	\N	\N	2017-11-23 18:34:03.3695	2017-11-23 18:34:03.3695	16	Brian Keats
138	\N	\N	2017-11-23 18:34:03.373232	2017-11-23 18:34:03.373232	16	David Calabrese
139	\N	\N	2017-11-23 18:34:03.376809	2017-11-23 18:34:03.376809	16	Dez Cadena
140	\N	\N	2017-11-23 18:34:03.380434	2017-11-23 18:34:03.380434	16	Eric "Goat" Arce
141	\N	\N	2017-11-23 18:34:03.383908	2017-11-23 18:34:03.383908	16	Frank LiCata
142	\N	\N	2017-11-23 18:34:03.386779	2017-11-23 18:34:03.386779	16	Glenn Anzalone
143	\N	\N	2017-11-23 18:34:03.38964	2017-11-23 18:34:03.38964	16	Jerry Caiafa
144	\N	\N	2017-11-23 18:34:03.392567	2017-11-23 18:34:03.392567	16	Jerry Caiafa II
145	\N	\N	2017-11-23 18:34:03.395497	2017-11-23 18:34:03.395497	16	Jim Catania
146	\N	\N	2017-11-23 18:34:03.398735	2017-11-23 18:34:03.398735	16	Joey Image
147	\N	\N	2017-11-23 18:34:03.401551	2017-11-23 18:34:03.401551	16	Manny
148	\N	\N	2017-11-23 18:34:03.404529	2017-11-23 18:34:03.404529	16	Marc Bell
149	\N	\N	2017-11-23 18:34:03.407457	2017-11-23 18:34:03.407457	16	Marc Rizzo
150	\N	\N	2017-11-23 18:34:03.410244	2017-11-23 18:34:03.410244	16	Michale Graves
151	\N	\N	2017-11-23 18:34:03.414028	2017-11-23 18:34:03.414028	16	Myke Hideous
152	\N	\N	2017-11-23 18:34:03.417447	2017-11-23 18:34:03.417447	16	Paul Caiafa
153	\N	\N	2017-11-23 18:34:03.420324	2017-11-23 18:34:03.420324	16	Robo (3)
154	\N	\N	2017-11-23 18:34:55.980856	2017-11-23 18:34:55.980856	16	Bobby Schayer
155	\N	\N	2017-11-23 18:34:55.984428	2017-11-23 18:34:55.984428	16	Brett Gurewitz
156	\N	\N	2017-11-23 18:34:55.986968	2017-11-23 18:34:55.986968	16	Brian Baker
157	\N	\N	2017-11-23 18:34:55.989464	2017-11-23 18:34:55.989464	16	Brooks Wackerman
158	\N	\N	2017-11-23 18:34:55.992572	2017-11-23 18:34:55.992572	16	Davy Goldman
159	\N	\N	2017-11-23 18:34:55.995169	2017-11-23 18:34:55.995169	16	Greg Graffin
160	\N	\N	2017-11-23 18:34:55.998056	2017-11-23 18:34:55.998056	16	Greg Hetson
161	\N	\N	2017-11-23 18:34:56.000802	2017-11-23 18:34:56.000802	16	Jamie Miller
162	\N	\N	2017-11-23 18:34:56.003451	2017-11-23 18:34:56.003451	16	Jay Bentley
163	\N	\N	2017-11-23 18:34:56.006422	2017-11-23 18:34:56.006422	16	Jay Ziskrout
164	\N	\N	2017-11-23 18:34:56.009263	2017-11-23 18:34:56.009263	16	Keith Lehrer
165	\N	\N	2017-11-23 18:34:56.01161	2017-11-23 18:34:56.01161	16	Mike Dimkich
166	\N	\N	2017-11-23 18:34:56.01418	2017-11-23 18:34:56.01418	16	Paul Dedona
167	\N	\N	2017-11-23 18:34:56.016844	2017-11-23 18:34:56.016844	16	Pete Finestone
168	\N	\N	2017-11-23 18:34:56.019218	2017-11-23 18:34:56.019218	16	Tim Gallegos
169	\N	\N	2017-11-23 18:37:27.384638	2017-11-23 18:37:27.384638	16	A. P. Carter
170	\N	\N	2017-11-23 18:37:27.389502	2017-11-23 18:37:27.389502	16	Anita Carter
171	\N	\N	2017-11-23 18:37:27.393675	2017-11-23 18:37:27.393675	16	Helen Carter (2)
172	\N	\N	2017-11-23 18:37:27.397708	2017-11-23 18:37:27.397708	16	Janette Carter
173	\N	\N	2017-11-23 18:37:27.402077	2017-11-23 18:37:27.402077	16	June Carter Cash
174	\N	\N	2017-11-23 18:37:27.406329	2017-11-23 18:37:27.406329	16	Maybelle Carter
175	\N	\N	2017-11-23 18:37:27.410903	2017-11-23 18:37:27.410903	16	Sara Carter (2)
176	\N	\N	2017-11-23 18:37:39.364547	2017-11-23 18:37:39.364547	16	Benny Martin
177	\N	\N	2017-11-23 18:37:39.370058	2017-11-23 18:37:39.370058	16	Bessie Lee Mauldin
178	\N	\N	2017-11-23 18:37:39.374441	2017-11-23 18:37:39.374441	16	Bill Holden (4)
179	\N	\N	2017-11-23 18:37:39.3785	2017-11-23 18:37:39.3785	16	Bill Monroe
180	\N	\N	2017-11-23 18:37:39.382784	2017-11-23 18:37:39.382784	16	Charlie Cline
181	\N	\N	2017-11-23 18:37:39.38853	2017-11-23 18:37:39.38853	16	Curtis Blackwell
182	\N	\N	2017-11-23 18:37:39.396046	2017-11-23 18:37:39.396046	16	Dana Cupp, Jr.
183	\N	\N	2017-11-23 18:37:39.400995	2017-11-23 18:37:39.400995	16	Don Reno
184	\N	\N	2017-11-23 18:37:39.404783	2017-11-23 18:37:39.404783	16	Jack Cooke
185	\N	\N	2017-11-23 18:37:39.409192	2017-11-23 18:37:39.409192	16	Jimmy Maynard (2)
186	\N	\N	2017-11-23 18:37:39.415373	2017-11-23 18:37:39.415373	16	Mac Wiseman
187	\N	\N	2017-11-23 18:37:39.421233	2017-11-23 18:37:39.421233	16	Peter Rowan
188	\N	\N	2017-11-23 18:37:51.35437	2017-11-23 18:37:51.35437	16	Jeff Cook (2)
189	\N	\N	2017-11-23 18:37:51.357805	2017-11-23 18:37:51.357805	16	Mark Herndon
190	\N	\N	2017-11-23 18:37:51.361276	2017-11-23 18:37:51.361276	16	Randy Owen
191	\N	\N	2017-11-23 18:37:51.364758	2017-11-23 18:37:51.364758	16	Teddy Gentry
192	\N	\N	2017-11-23 18:38:03.360104	2017-11-23 18:38:03.360104	16	Charlie Louvin
193	\N	\N	2017-11-23 18:38:03.364501	2017-11-23 18:38:03.364501	16	Ira Louvin
194	\N	\N	2017-11-23 18:38:14.351373	2017-11-23 18:38:14.351373	16	Barry Barnes
195	\N	\N	2017-11-23 18:38:14.355009	2017-11-23 18:38:14.355009	16	Bruce Ray Brown
196	\N	\N	2017-11-23 18:38:14.358377	2017-11-23 18:38:14.358377	16	Charlie Daniels
197	\N	\N	2017-11-23 18:38:14.361868	2017-11-23 18:38:14.361868	16	Charlie Hayward
198	\N	\N	2017-11-23 18:38:14.365169	2017-11-23 18:38:14.365169	16	Chris Wormer
199	\N	\N	2017-11-23 18:38:14.368065	2017-11-23 18:38:14.368065	16	Don Murray (3)
200	\N	\N	2017-11-23 18:38:14.371096	2017-11-23 18:38:14.371096	16	Fred Edwards
201	\N	\N	2017-11-23 18:38:14.374055	2017-11-23 18:38:14.374055	16	Gary Allen
202	\N	\N	2017-11-23 18:38:14.377384	2017-11-23 18:38:14.377384	16	Jack Gavin
203	\N	\N	2017-11-23 18:38:14.380324	2017-11-23 18:38:14.380324	16	James W. Marshall
204	\N	\N	2017-11-23 18:38:14.38315	2017-11-23 18:38:14.38315	16	Mark Fitzgerald
205	\N	\N	2017-11-23 18:38:14.386224	2017-11-23 18:38:14.386224	16	Pat McDonald
206	\N	\N	2017-11-23 18:38:14.388869	2017-11-23 18:38:14.388869	16	Taz DiGregorio
207	\N	\N	2017-11-23 18:38:14.391522	2017-11-23 18:38:14.391522	16	Tom Crain
208	\N	\N	2017-11-23 18:40:56.382728	2017-11-23 18:40:56.382728	16	Clifford Smith (2)
209	\N	\N	2017-11-23 18:40:56.387179	2017-11-23 18:40:56.387179	16	Corey Woods
210	\N	\N	2017-11-23 18:40:56.391082	2017-11-23 18:40:56.391082	16	Dennis Coles
211	\N	\N	2017-11-23 18:40:56.394979	2017-11-23 18:40:56.394979	16	Elgin Turner
212	\N	\N	2017-11-23 18:40:56.39905	2017-11-23 18:40:56.39905	16	Gary Grice
213	\N	\N	2017-11-23 18:40:56.402917	2017-11-23 18:40:56.402917	16	Jason Hunter (2)
214	\N	\N	2017-11-23 18:40:56.407492	2017-11-23 18:40:56.407492	16	Lamont Hawkins
215	\N	\N	2017-11-23 18:40:56.411837	2017-11-23 18:40:56.411837	16	Robert Diggs
216	\N	\N	2017-11-23 18:40:56.415945	2017-11-23 18:40:56.415945	16	Russel Jones
217	\N	\N	2017-11-23 18:41:07.362534	2017-11-23 18:41:07.362534	16	Andre Young
218	\N	\N	2017-11-23 18:41:07.367655	2017-11-23 18:41:07.367655	16	Antoine Carraby
219	\N	\N	2017-11-23 18:41:07.371675	2017-11-23 18:41:07.371675	16	Eric Wright
220	\N	\N	2017-11-23 18:41:07.375463	2017-11-23 18:41:07.375463	16	Lorenzo Patterson
221	\N	\N	2017-11-23 18:41:07.379264	2017-11-23 18:41:07.379264	16	Mik Lezan
222	\N	\N	2017-11-23 18:41:07.383017	2017-11-23 18:41:07.383017	16	O'Shea Jackson
223	\N	\N	2017-11-23 18:41:18.362134	2017-11-23 18:41:18.362134	16	Darryl McDaniels
224	\N	\N	2017-11-23 18:41:18.367819	2017-11-23 18:41:18.367819	16	Jason Mizell
225	\N	\N	2017-11-23 18:41:18.373154	2017-11-23 18:41:18.373154	16	Joseph Simmons
226	\N	\N	2017-11-23 18:41:29.370222	2017-11-23 18:41:29.370222	16	Ali Shaheed Muhammad
227	\N	\N	2017-11-23 18:41:29.373273	2017-11-23 18:41:29.373273	16	Jarobi White
228	\N	\N	2017-11-23 18:41:29.375838	2017-11-23 18:41:29.375838	16	Kamaal Fareed
229	\N	\N	2017-11-23 18:41:29.378738	2017-11-23 18:41:29.378738	16	Malik Taylor
230	\N	\N	2017-11-23 18:41:41.346973	2017-11-23 18:41:41.346973	16	Brian Hardgroove
231	\N	\N	2017-11-23 18:41:41.350431	2017-11-23 18:41:41.350431	16	Carlton Ridenhour
232	\N	\N	2017-11-23 18:41:41.355046	2017-11-23 18:41:41.355046	16	Johnny Juice Rosado
233	\N	\N	2017-11-23 18:41:41.35896	2017-11-23 18:41:41.35896	16	Khari Wynn
234	\N	\N	2017-11-23 18:41:41.362653	2017-11-23 18:41:41.362653	16	Lisa Williamson (3)
235	\N	\N	2017-11-23 18:41:41.36698	2017-11-23 18:41:41.36698	16	Lord Aswod
236	\N	\N	2017-11-23 18:41:41.371552	2017-11-23 18:41:41.371552	16	Mike Faulkner
237	\N	\N	2017-11-23 18:41:41.376126	2017-11-23 18:41:41.376126	16	Norman Rogers
238	\N	\N	2017-11-23 18:41:41.382322	2017-11-23 18:41:41.382322	16	Richard Griffin
239	\N	\N	2017-11-23 18:41:41.388794	2017-11-23 18:41:41.388794	16	William Jonathan Drayton
240	\N	\N	2017-11-23 18:44:27.381833	2017-11-23 18:44:27.381833	16	Cliff Burton
241	\N	\N	2017-11-23 18:44:27.385191	2017-11-23 18:44:27.385191	16	Dave Mustaine
242	\N	\N	2017-11-23 18:44:27.388063	2017-11-23 18:44:27.388063	16	James Hetfield
243	\N	\N	2017-11-23 18:44:27.391482	2017-11-23 18:44:27.391482	16	Jason Newsted
244	\N	\N	2017-11-23 18:44:27.395091	2017-11-23 18:44:27.395091	16	Kirk Hammett
245	\N	\N	2017-11-23 18:44:27.398734	2017-11-23 18:44:27.398734	16	Lars Ulrich
246	\N	\N	2017-11-23 18:44:27.402539	2017-11-23 18:44:27.402539	16	Lloyd Grant
247	\N	\N	2017-11-23 18:44:27.406221	2017-11-23 18:44:27.406221	16	Robert Trujillo
248	\N	\N	2017-11-23 18:44:27.411508	2017-11-23 18:44:27.411508	16	Ron McGovney
249	\N	\N	2017-11-23 18:44:39.364335	2017-11-23 18:44:39.364335	16	Adrian Smith (2)
250	\N	\N	2017-11-23 18:44:39.368934	2017-11-23 18:44:39.368934	16	Barry Graham (2)
251	\N	\N	2017-11-23 18:44:39.372927	2017-11-23 18:44:39.372927	16	Blaze Bayley
252	\N	\N	2017-11-23 18:44:39.376414	2017-11-23 18:44:39.376414	16	Bob Sawyer (3)
253	\N	\N	2017-11-23 18:44:39.379115	2017-11-23 18:44:39.379115	16	Bruce Dickinson
254	\N	\N	2017-11-23 18:44:39.381821	2017-11-23 18:44:39.381821	16	Clive Burr
255	\N	\N	2017-11-23 18:44:39.384668	2017-11-23 18:44:39.384668	16	Dave Murray (2)
256	\N	\N	2017-11-23 18:44:39.388115	2017-11-23 18:44:39.388115	16	Dennis Stratton
257	\N	\N	2017-11-23 18:44:39.392244	2017-11-23 18:44:39.392244	16	Dennis Willcock
258	\N	\N	2017-11-23 18:44:39.395589	2017-11-23 18:44:39.395589	16	Doug Sampson
259	\N	\N	2017-11-23 18:44:39.398477	2017-11-23 18:44:39.398477	16	Janick Gers
260	\N	\N	2017-11-23 18:44:39.401616	2017-11-23 18:44:39.401616	16	Nicko McBrain
261	\N	\N	2017-11-23 18:44:39.404886	2017-11-23 18:44:39.404886	16	Paul Cairns (2)
262	\N	\N	2017-11-23 18:44:39.408018	2017-11-23 18:44:39.408018	16	Paul Di'Anno
263	\N	\N	2017-11-23 18:44:39.411147	2017-11-23 18:44:39.411147	16	Paul Mario Day
264	\N	\N	2017-11-23 18:44:39.413949	2017-11-23 18:44:39.413949	16	Paul Todd (4)
265	\N	\N	2017-11-23 18:44:39.417252	2017-11-23 18:44:39.417252	16	Ron "Rebel" Matthews
266	\N	\N	2017-11-23 18:44:39.420005	2017-11-23 18:44:39.420005	16	Steve Harris
267	\N	\N	2017-11-23 18:44:39.422752	2017-11-23 18:44:39.422752	16	Terry Rance
268	\N	\N	2017-11-23 18:44:39.425587	2017-11-23 18:44:39.425587	16	Terry Wapram
269	\N	\N	2017-11-23 18:44:39.428699	2017-11-23 18:44:39.428699	16	Tony Hustings-Moore
270	\N	\N	2017-11-23 18:44:39.432165	2017-11-23 18:44:39.432165	16	Tony Parsons (3)
271	\N	\N	2017-11-23 18:44:51.368432	2017-11-23 18:44:51.368432	16	Anthony Philip Harford
272	\N	\N	2017-11-23 18:44:51.373541	2017-11-23 18:44:51.373541	16	Bev Bevan
273	\N	\N	2017-11-23 18:44:51.377799	2017-11-23 18:44:51.377799	16	Bill Ward
274	\N	\N	2017-11-23 18:44:51.382323	2017-11-23 18:44:51.382323	16	Bob Daisley
275	\N	\N	2017-11-23 18:44:51.386629	2017-11-23 18:44:51.386629	16	Bobby Rondinelli
276	\N	\N	2017-11-23 18:44:51.390797	2017-11-23 18:44:51.390797	16	Cozy Powell
277	\N	\N	2017-11-23 18:44:51.39583	2017-11-23 18:44:51.39583	16	Craig Gruber
278	\N	\N	2017-11-23 18:44:51.401563	2017-11-23 18:44:51.401563	16	Dave Spitz
279	\N	\N	2017-11-23 18:44:51.406799	2017-11-23 18:44:51.406799	16	Dave Walker (6)
280	\N	\N	2017-11-23 18:44:51.411735	2017-11-23 18:44:51.411735	16	Don Airey
281	\N	\N	2017-11-23 18:44:51.41652	2017-11-23 18:44:51.41652	16	Eric Singer
282	\N	\N	2017-11-23 18:44:51.421658	2017-11-23 18:44:51.421658	16	Geezer Butler
283	\N	\N	2017-11-23 18:44:51.426872	2017-11-23 18:44:51.426872	16	Geoff Nicholls
284	\N	\N	2017-11-23 18:44:51.431738	2017-11-23 18:44:51.431738	16	Gerald Woodruffe
285	\N	\N	2017-11-23 18:44:51.437063	2017-11-23 18:44:51.437063	16	Glenn Hughes
286	\N	\N	2017-11-23 18:44:51.441433	2017-11-23 18:44:51.441433	16	Gordon Copley
287	\N	\N	2017-11-23 18:44:51.446444	2017-11-23 18:44:51.446444	16	Ian Gillan
288	\N	\N	2017-11-23 18:44:51.451692	2017-11-23 18:44:51.451692	16	Jeff Fenholt
289	\N	\N	2017-11-23 18:44:51.456558	2017-11-23 18:44:51.456558	16	Jo Burt
290	\N	\N	2017-11-23 18:44:51.46118	2017-11-23 18:44:51.46118	16	Neil Murray
291	\N	\N	2017-11-23 18:44:51.465619	2017-11-23 18:44:51.465619	16	Ozzy Osbourne
292	\N	\N	2017-11-23 18:44:51.469772	2017-11-23 18:44:51.469772	16	Ray Gillen
293	\N	\N	2017-11-23 18:44:51.473854	2017-11-23 18:44:51.473854	16	Ronald Padavona
294	\N	\N	2017-11-23 18:44:51.477516	2017-11-23 18:44:51.477516	16	Terry Chimes
295	\N	\N	2017-11-23 18:44:51.480723	2017-11-23 18:44:51.480723	16	Tony Iommi
296	\N	\N	2017-11-23 18:44:51.484039	2017-11-23 18:44:51.484039	16	Vinny Appice
297	\N	\N	2017-11-23 18:45:03.368293	2017-11-23 18:45:03.368293	16	Al Pitrelli
298	\N	\N	2017-11-23 18:45:03.372518	2017-11-23 18:45:03.372518	16	Chris Adler
299	\N	\N	2017-11-23 18:45:03.376958	2017-11-23 18:45:03.376958	16	Chris Broderick
300	\N	\N	2017-11-23 18:45:03.381815	2017-11-23 18:45:03.381815	16	Chris Poland
301	\N	\N	2017-11-23 18:45:03.386448	2017-11-23 18:45:03.386448	16	Chuck Behler
302	\N	\N	2017-11-23 18:45:03.391246	2017-11-23 18:45:03.391246	16	Dave Mustaine
303	\N	\N	2017-11-23 18:45:03.395969	2017-11-23 18:45:03.395969	16	David Ellefson
304	\N	\N	2017-11-23 18:45:03.400358	2017-11-23 18:45:03.400358	16	Dijon Carruthers
305	\N	\N	2017-11-23 18:45:03.404792	2017-11-23 18:45:03.404792	16	Dirk Verbeuren
306	\N	\N	2017-11-23 18:45:03.409254	2017-11-23 18:45:03.409254	16	Gar Samuelson
307	\N	\N	2017-11-23 18:45:03.414971	2017-11-23 18:45:03.414971	16	Glen Drover
308	\N	\N	2017-11-23 18:45:03.4195	2017-11-23 18:45:03.4195	16	Greg Handevidt
309	\N	\N	2017-11-23 18:45:03.422983	2017-11-23 18:45:03.422983	16	James LoMenzo
310	\N	\N	2017-11-23 18:45:03.426818	2017-11-23 18:45:03.426818	16	James McDonough
311	\N	\N	2017-11-23 18:45:03.430845	2017-11-23 18:45:03.430845	16	Jay Reynolds (2)
312	\N	\N	2017-11-23 18:45:03.435438	2017-11-23 18:45:03.435438	16	Jeff Young (3)
313	\N	\N	2017-11-23 18:45:03.441018	2017-11-23 18:45:03.441018	16	Jimmy DeGrasso
314	\N	\N	2017-11-23 18:45:03.44515	2017-11-23 18:45:03.44515	16	Kerry King
315	\N	\N	2017-11-23 18:45:03.449261	2017-11-23 18:45:03.449261	16	Kiko Loureiro
316	\N	\N	2017-11-23 18:45:03.453236	2017-11-23 18:45:03.453236	16	Lee Rauch
317	\N	\N	2017-11-23 18:45:03.457386	2017-11-23 18:45:03.457386	16	Marty Friedman
318	\N	\N	2017-11-23 18:45:03.462753	2017-11-23 18:45:03.462753	16	Nick Menza
319	\N	\N	2017-11-23 18:45:03.466649	2017-11-23 18:45:03.466649	16	Shawn Drover
320	\N	\N	2017-11-23 18:45:15.36547	2017-11-23 18:45:15.36547	16	Alan Atkins
321	\N	\N	2017-11-23 18:45:15.368579	2017-11-23 18:45:15.368579	16	Alan Moore (2)
322	\N	\N	2017-11-23 18:45:15.37244	2017-11-23 18:45:15.37244	16	Dave Holland (2)
323	\N	\N	2017-11-23 18:45:15.375288	2017-11-23 18:45:15.375288	16	Glenn Tipton
324	\N	\N	2017-11-23 18:45:15.377996	2017-11-23 18:45:15.377996	16	Ian Hill (2)
325	\N	\N	2017-11-23 18:45:15.38101	2017-11-23 18:45:15.38101	16	John Hinch
326	\N	\N	2017-11-23 18:45:15.384264	2017-11-23 18:45:15.384264	16	K. K. Downing
327	\N	\N	2017-11-23 18:45:15.387028	2017-11-23 18:45:15.387028	16	Les Binks
328	\N	\N	2017-11-23 18:45:15.390035	2017-11-23 18:45:15.390035	16	Richie Faulkner
329	\N	\N	2017-11-23 18:45:15.393639	2017-11-23 18:45:15.393639	16	Ripper Owens
330	\N	\N	2017-11-23 18:45:15.396494	2017-11-23 18:45:15.396494	16	Rob Halford
331	\N	\N	2017-11-23 18:45:15.399904	2017-11-23 18:45:15.399904	16	Scott Travis
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('artists_id_seq', 331, true);


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
87	31	18	2017-11-23 18:25:17.42372	2017-11-23 18:25:17.42372
88	31	19	2017-11-23 18:25:17.429526	2017-11-23 18:25:17.429526
89	31	20	2017-11-23 18:25:17.433962	2017-11-23 18:25:17.433962
90	31	21	2017-11-23 18:25:17.438344	2017-11-23 18:25:17.438344
91	32	22	2017-11-23 18:25:29.392	2017-11-23 18:25:29.392
92	32	23	2017-11-23 18:25:29.397592	2017-11-23 18:25:29.397592
93	32	24	2017-11-23 18:25:29.403228	2017-11-23 18:25:29.403228
94	32	25	2017-11-23 18:25:29.408793	2017-11-23 18:25:29.408793
95	32	26	2017-11-23 18:25:29.41417	2017-11-23 18:25:29.41417
96	32	27	2017-11-23 18:25:29.419436	2017-11-23 18:25:29.419436
97	33	28	2017-11-23 18:25:41.385976	2017-11-23 18:25:41.385976
98	33	29	2017-11-23 18:25:41.392054	2017-11-23 18:25:41.392054
99	33	30	2017-11-23 18:25:41.396755	2017-11-23 18:25:41.396755
100	33	31	2017-11-23 18:25:41.402138	2017-11-23 18:25:41.402138
101	33	32	2017-11-23 18:25:41.407591	2017-11-23 18:25:41.407591
102	34	33	2017-11-23 18:25:52.393401	2017-11-23 18:25:52.393401
103	34	34	2017-11-23 18:25:52.399859	2017-11-23 18:25:52.399859
104	34	35	2017-11-23 18:25:52.405391	2017-11-23 18:25:52.405391
105	34	36	2017-11-23 18:25:52.412706	2017-11-23 18:25:52.412706
106	34	37	2017-11-23 18:25:52.41882	2017-11-23 18:25:52.41882
107	35	38	2017-11-23 18:26:03.434698	2017-11-23 18:26:03.434698
108	35	39	2017-11-23 18:26:03.439854	2017-11-23 18:26:03.439854
109	35	40	2017-11-23 18:26:03.444984	2017-11-23 18:26:03.444984
110	35	41	2017-11-23 18:26:03.449826	2017-11-23 18:26:03.449826
111	35	42	2017-11-23 18:26:03.454673	2017-11-23 18:26:03.454673
112	35	43	2017-11-23 18:26:03.459527	2017-11-23 18:26:03.459527
113	35	44	2017-11-23 18:26:03.464686	2017-11-23 18:26:03.464686
114	35	45	2017-11-23 18:26:03.469588	2017-11-23 18:26:03.469588
115	35	46	2017-11-23 18:26:03.474645	2017-11-23 18:26:03.474645
116	35	47	2017-11-23 18:26:03.481958	2017-11-23 18:26:03.481958
117	35	48	2017-11-23 18:26:03.486587	2017-11-23 18:26:03.486587
118	35	49	2017-11-23 18:26:03.490977	2017-11-23 18:26:03.490977
119	35	50	2017-11-23 18:26:03.495516	2017-11-23 18:26:03.495516
120	35	51	2017-11-23 18:26:03.50318	2017-11-23 18:26:03.50318
121	35	52	2017-11-23 18:26:03.507677	2017-11-23 18:26:03.507677
122	35	53	2017-11-23 18:26:03.511943	2017-11-23 18:26:03.511943
123	35	54	2017-11-23 18:26:03.517282	2017-11-23 18:26:03.517282
124	36	55	2017-11-23 18:29:24.49202	2017-11-23 18:29:24.49202
125	36	56	2017-11-23 18:29:24.496151	2017-11-23 18:29:24.496151
126	36	57	2017-11-23 18:29:24.500042	2017-11-23 18:29:24.500042
127	36	58	2017-11-23 18:29:24.503754	2017-11-23 18:29:24.503754
128	36	59	2017-11-23 18:29:24.507951	2017-11-23 18:29:24.507951
129	36	60	2017-11-23 18:29:24.513067	2017-11-23 18:29:24.513067
130	36	61	2017-11-23 18:29:24.518689	2017-11-23 18:29:24.518689
131	36	62	2017-11-23 18:29:24.524288	2017-11-23 18:29:24.524288
132	36	63	2017-11-23 18:29:24.529774	2017-11-23 18:29:24.529774
133	36	64	2017-11-23 18:29:24.533925	2017-11-23 18:29:24.533925
134	36	65	2017-11-23 18:29:24.538686	2017-11-23 18:29:24.538686
135	36	66	2017-11-23 18:29:24.544378	2017-11-23 18:29:24.544378
136	36	67	2017-11-23 18:29:24.549429	2017-11-23 18:29:24.549429
137	36	68	2017-11-23 18:29:24.555343	2017-11-23 18:29:24.555343
138	36	69	2017-11-23 18:29:24.561043	2017-11-23 18:29:24.561043
139	36	70	2017-11-23 18:29:24.566643	2017-11-23 18:29:24.566643
140	36	71	2017-11-23 18:29:24.572256	2017-11-23 18:29:24.572256
141	36	72	2017-11-23 18:29:24.577823	2017-11-23 18:29:24.577823
142	36	73	2017-11-23 18:29:24.582891	2017-11-23 18:29:24.582891
143	36	74	2017-11-23 18:29:24.588323	2017-11-23 18:29:24.588323
144	36	75	2017-11-23 18:29:24.593376	2017-11-23 18:29:24.593376
145	36	76	2017-11-23 18:29:24.598607	2017-11-23 18:29:24.598607
146	36	77	2017-11-23 18:29:24.604817	2017-11-23 18:29:24.604817
147	36	78	2017-11-23 18:29:24.612594	2017-11-23 18:29:24.612594
148	36	79	2017-11-23 18:29:24.619682	2017-11-23 18:29:24.619682
149	36	80	2017-11-23 18:29:24.627002	2017-11-23 18:29:24.627002
150	37	81	2017-11-23 18:29:36.365752	2017-11-23 18:29:36.365752
151	38	82	2017-11-23 18:29:47.394011	2017-11-23 18:29:47.394011
152	38	83	2017-11-23 18:29:47.398962	2017-11-23 18:29:47.398962
153	38	84	2017-11-23 18:29:47.404399	2017-11-23 18:29:47.404399
154	38	85	2017-11-23 18:29:47.409697	2017-11-23 18:29:47.409697
155	38	86	2017-11-23 18:29:47.415258	2017-11-23 18:29:47.415258
156	39	87	2017-11-23 18:29:58.428787	2017-11-23 18:29:58.428787
157	39	88	2017-11-23 18:29:58.433116	2017-11-23 18:29:58.433116
158	39	89	2017-11-23 18:29:58.437594	2017-11-23 18:29:58.437594
159	39	90	2017-11-23 18:29:58.442477	2017-11-23 18:29:58.442477
160	39	91	2017-11-23 18:29:58.446922	2017-11-23 18:29:58.446922
161	39	92	2017-11-23 18:29:58.451215	2017-11-23 18:29:58.451215
162	39	93	2017-11-23 18:29:58.455705	2017-11-23 18:29:58.455705
163	39	94	2017-11-23 18:29:58.460521	2017-11-23 18:29:58.460521
164	39	95	2017-11-23 18:29:58.464962	2017-11-23 18:29:58.464962
165	39	96	2017-11-23 18:29:58.469119	2017-11-23 18:29:58.469119
166	39	97	2017-11-23 18:29:58.474769	2017-11-23 18:29:58.474769
167	39	98	2017-11-23 18:29:58.480785	2017-11-23 18:29:58.480785
168	39	99	2017-11-23 18:29:58.487139	2017-11-23 18:29:58.487139
169	39	100	2017-11-23 18:29:58.49376	2017-11-23 18:29:58.49376
170	39	101	2017-11-23 18:29:58.499127	2017-11-23 18:29:58.499127
171	39	102	2017-11-23 18:29:58.504192	2017-11-23 18:29:58.504192
172	39	103	2017-11-23 18:29:58.510671	2017-11-23 18:29:58.510671
173	40	104	2017-11-23 18:30:09.422708	2017-11-23 18:30:09.422708
174	40	105	2017-11-23 18:30:09.427597	2017-11-23 18:30:09.427597
175	40	106	2017-11-23 18:30:09.431903	2017-11-23 18:30:09.431903
176	40	107	2017-11-23 18:30:09.436235	2017-11-23 18:30:09.436235
177	40	108	2017-11-23 18:30:09.440578	2017-11-23 18:30:09.440578
178	40	109	2017-11-23 18:30:09.444515	2017-11-23 18:30:09.444515
179	40	110	2017-11-23 18:30:09.453103	2017-11-23 18:30:09.453103
180	40	111	2017-11-23 18:30:09.45816	2017-11-23 18:30:09.45816
181	41	112	2017-11-23 18:33:29.432465	2017-11-23 18:33:29.432465
182	41	113	2017-11-23 18:33:29.437099	2017-11-23 18:33:29.437099
183	41	114	2017-11-23 18:33:29.441037	2017-11-23 18:33:29.441037
184	41	115	2017-11-23 18:33:29.444563	2017-11-23 18:33:29.444563
185	41	116	2017-11-23 18:33:29.447865	2017-11-23 18:33:29.447865
186	42	117	2017-11-23 18:33:40.401847	2017-11-23 18:33:40.401847
187	42	118	2017-11-23 18:33:40.407504	2017-11-23 18:33:40.407504
188	42	119	2017-11-23 18:33:40.412777	2017-11-23 18:33:40.412777
189	42	120	2017-11-23 18:33:40.417073	2017-11-23 18:33:40.417073
190	42	121	2017-11-23 18:33:40.42173	2017-11-23 18:33:40.42173
191	42	122	2017-11-23 18:33:40.425875	2017-11-23 18:33:40.425875
192	42	123	2017-11-23 18:33:40.430246	2017-11-23 18:33:40.430246
193	42	124	2017-11-23 18:33:40.434732	2017-11-23 18:33:40.434732
194	42	125	2017-11-23 18:33:40.439364	2017-11-23 18:33:40.439364
195	43	126	2017-11-23 18:33:52.388141	2017-11-23 18:33:52.388141
196	43	127	2017-11-23 18:33:52.393473	2017-11-23 18:33:52.393473
197	43	128	2017-11-23 18:33:52.398525	2017-11-23 18:33:52.398525
198	43	129	2017-11-23 18:33:52.403253	2017-11-23 18:33:52.403253
199	43	130	2017-11-23 18:33:52.407532	2017-11-23 18:33:52.407532
200	43	131	2017-11-23 18:33:52.411433	2017-11-23 18:33:52.411433
201	43	132	2017-11-23 18:33:52.415441	2017-11-23 18:33:52.415441
202	43	133	2017-11-23 18:33:52.419559	2017-11-23 18:33:52.419559
203	43	134	2017-11-23 18:33:52.423668	2017-11-23 18:33:52.423668
204	44	135	2017-11-23 18:34:03.426458	2017-11-23 18:34:03.426458
205	44	136	2017-11-23 18:34:03.432352	2017-11-23 18:34:03.432352
206	44	137	2017-11-23 18:34:03.439128	2017-11-23 18:34:03.439128
207	44	138	2017-11-23 18:34:03.444828	2017-11-23 18:34:03.444828
208	44	139	2017-11-23 18:34:03.450594	2017-11-23 18:34:03.450594
209	44	140	2017-11-23 18:34:03.456443	2017-11-23 18:34:03.456443
210	44	141	2017-11-23 18:34:03.462134	2017-11-23 18:34:03.462134
211	44	142	2017-11-23 18:34:03.468732	2017-11-23 18:34:03.468732
212	44	143	2017-11-23 18:34:03.475417	2017-11-23 18:34:03.475417
213	44	144	2017-11-23 18:34:03.483487	2017-11-23 18:34:03.483487
214	44	145	2017-11-23 18:34:03.489547	2017-11-23 18:34:03.489547
215	44	146	2017-11-23 18:34:03.495388	2017-11-23 18:34:03.495388
216	44	147	2017-11-23 18:34:03.500923	2017-11-23 18:34:03.500923
217	44	148	2017-11-23 18:34:03.506148	2017-11-23 18:34:03.506148
218	44	149	2017-11-23 18:34:03.511377	2017-11-23 18:34:03.511377
219	44	150	2017-11-23 18:34:03.516906	2017-11-23 18:34:03.516906
220	44	151	2017-11-23 18:34:03.522593	2017-11-23 18:34:03.522593
221	44	152	2017-11-23 18:34:03.527934	2017-11-23 18:34:03.527934
222	44	153	2017-11-23 18:34:03.533018	2017-11-23 18:34:03.533018
223	45	154	2017-11-23 18:34:56.039746	2017-11-23 18:34:56.039746
224	45	155	2017-11-23 18:34:56.044323	2017-11-23 18:34:56.044323
225	45	156	2017-11-23 18:34:56.047928	2017-11-23 18:34:56.047928
226	45	157	2017-11-23 18:34:56.051814	2017-11-23 18:34:56.051814
227	45	158	2017-11-23 18:34:56.055886	2017-11-23 18:34:56.055886
228	45	159	2017-11-23 18:34:56.060402	2017-11-23 18:34:56.060402
229	45	160	2017-11-23 18:34:56.064771	2017-11-23 18:34:56.064771
230	45	161	2017-11-23 18:34:56.070409	2017-11-23 18:34:56.070409
231	45	162	2017-11-23 18:34:56.075481	2017-11-23 18:34:56.075481
232	45	163	2017-11-23 18:34:56.079723	2017-11-23 18:34:56.079723
233	45	164	2017-11-23 18:34:56.083949	2017-11-23 18:34:56.083949
234	45	165	2017-11-23 18:34:56.088736	2017-11-23 18:34:56.088736
235	45	166	2017-11-23 18:34:56.092918	2017-11-23 18:34:56.092918
236	45	167	2017-11-23 18:34:56.097071	2017-11-23 18:34:56.097071
237	45	168	2017-11-23 18:34:56.101215	2017-11-23 18:34:56.101215
238	46	169	2017-11-23 18:37:27.436444	2017-11-23 18:37:27.436444
239	46	170	2017-11-23 18:37:27.443077	2017-11-23 18:37:27.443077
240	46	171	2017-11-23 18:37:27.448015	2017-11-23 18:37:27.448015
241	46	172	2017-11-23 18:37:27.452722	2017-11-23 18:37:27.452722
242	46	173	2017-11-23 18:37:27.457629	2017-11-23 18:37:27.457629
243	46	174	2017-11-23 18:37:27.462962	2017-11-23 18:37:27.462962
244	46	175	2017-11-23 18:37:27.467639	2017-11-23 18:37:27.467639
245	47	176	2017-11-23 18:37:39.427754	2017-11-23 18:37:39.427754
246	47	177	2017-11-23 18:37:39.433439	2017-11-23 18:37:39.433439
247	47	178	2017-11-23 18:37:39.43929	2017-11-23 18:37:39.43929
248	47	179	2017-11-23 18:37:39.446527	2017-11-23 18:37:39.446527
249	47	180	2017-11-23 18:37:39.453918	2017-11-23 18:37:39.453918
250	47	181	2017-11-23 18:37:39.459874	2017-11-23 18:37:39.459874
251	47	182	2017-11-23 18:37:39.465848	2017-11-23 18:37:39.465848
252	47	183	2017-11-23 18:37:39.471526	2017-11-23 18:37:39.471526
253	47	184	2017-11-23 18:37:39.478513	2017-11-23 18:37:39.478513
254	47	185	2017-11-23 18:37:39.48431	2017-11-23 18:37:39.48431
255	47	186	2017-11-23 18:37:39.49017	2017-11-23 18:37:39.49017
256	47	187	2017-11-23 18:37:39.496015	2017-11-23 18:37:39.496015
257	48	188	2017-11-23 18:37:51.37084	2017-11-23 18:37:51.37084
258	48	189	2017-11-23 18:37:51.375311	2017-11-23 18:37:51.375311
259	48	190	2017-11-23 18:37:51.379607	2017-11-23 18:37:51.379607
260	48	191	2017-11-23 18:37:51.384183	2017-11-23 18:37:51.384183
261	49	192	2017-11-23 18:38:03.371215	2017-11-23 18:38:03.371215
262	49	193	2017-11-23 18:38:03.377477	2017-11-23 18:38:03.377477
263	50	194	2017-11-23 18:38:14.398175	2017-11-23 18:38:14.398175
264	50	195	2017-11-23 18:38:14.402876	2017-11-23 18:38:14.402876
265	50	196	2017-11-23 18:38:14.407557	2017-11-23 18:38:14.407557
266	50	197	2017-11-23 18:38:14.411535	2017-11-23 18:38:14.411535
267	50	198	2017-11-23 18:38:14.415565	2017-11-23 18:38:14.415565
268	50	199	2017-11-23 18:38:14.419651	2017-11-23 18:38:14.419651
269	50	200	2017-11-23 18:38:14.423814	2017-11-23 18:38:14.423814
270	50	201	2017-11-23 18:38:14.427851	2017-11-23 18:38:14.427851
271	50	202	2017-11-23 18:38:14.432242	2017-11-23 18:38:14.432242
272	50	203	2017-11-23 18:38:14.436716	2017-11-23 18:38:14.436716
273	50	204	2017-11-23 18:38:14.441482	2017-11-23 18:38:14.441482
274	50	205	2017-11-23 18:38:14.447173	2017-11-23 18:38:14.447173
275	50	206	2017-11-23 18:38:14.453083	2017-11-23 18:38:14.453083
276	50	207	2017-11-23 18:38:14.459036	2017-11-23 18:38:14.459036
277	51	208	2017-11-23 18:40:56.435332	2017-11-23 18:40:56.435332
278	51	209	2017-11-23 18:40:56.440413	2017-11-23 18:40:56.440413
279	51	210	2017-11-23 18:40:56.446454	2017-11-23 18:40:56.446454
280	51	211	2017-11-23 18:40:56.454204	2017-11-23 18:40:56.454204
281	51	212	2017-11-23 18:40:56.460104	2017-11-23 18:40:56.460104
282	51	213	2017-11-23 18:40:56.465969	2017-11-23 18:40:56.465969
283	51	214	2017-11-23 18:40:56.471222	2017-11-23 18:40:56.471222
284	51	215	2017-11-23 18:40:56.47658	2017-11-23 18:40:56.47658
285	51	216	2017-11-23 18:40:56.482272	2017-11-23 18:40:56.482272
286	52	217	2017-11-23 18:41:07.389683	2017-11-23 18:41:07.389683
287	52	218	2017-11-23 18:41:07.395581	2017-11-23 18:41:07.395581
288	52	219	2017-11-23 18:41:07.401055	2017-11-23 18:41:07.401055
289	52	220	2017-11-23 18:41:07.406506	2017-11-23 18:41:07.406506
290	52	221	2017-11-23 18:41:07.410766	2017-11-23 18:41:07.410766
291	52	222	2017-11-23 18:41:07.414829	2017-11-23 18:41:07.414829
292	53	223	2017-11-23 18:41:18.380991	2017-11-23 18:41:18.380991
293	53	224	2017-11-23 18:41:18.387135	2017-11-23 18:41:18.387135
294	53	225	2017-11-23 18:41:18.392858	2017-11-23 18:41:18.392858
295	54	226	2017-11-23 18:41:29.38369	2017-11-23 18:41:29.38369
296	54	227	2017-11-23 18:41:29.387786	2017-11-23 18:41:29.387786
297	54	228	2017-11-23 18:41:29.391881	2017-11-23 18:41:29.391881
298	54	229	2017-11-23 18:41:29.396214	2017-11-23 18:41:29.396214
299	55	230	2017-11-23 18:41:41.395656	2017-11-23 18:41:41.395656
300	55	231	2017-11-23 18:41:41.401039	2017-11-23 18:41:41.401039
301	55	232	2017-11-23 18:41:41.407602	2017-11-23 18:41:41.407602
302	55	233	2017-11-23 18:41:41.414073	2017-11-23 18:41:41.414073
303	55	234	2017-11-23 18:41:41.419294	2017-11-23 18:41:41.419294
304	55	235	2017-11-23 18:41:41.424084	2017-11-23 18:41:41.424084
305	55	236	2017-11-23 18:41:41.428926	2017-11-23 18:41:41.428926
306	55	237	2017-11-23 18:41:41.433712	2017-11-23 18:41:41.433712
307	55	238	2017-11-23 18:41:41.438569	2017-11-23 18:41:41.438569
308	55	239	2017-11-23 18:41:41.443185	2017-11-23 18:41:41.443185
309	56	240	2017-11-23 18:44:27.437674	2017-11-23 18:44:27.437674
310	56	241	2017-11-23 18:44:27.443647	2017-11-23 18:44:27.443647
311	56	242	2017-11-23 18:44:27.449335	2017-11-23 18:44:27.449335
312	56	243	2017-11-23 18:44:27.454949	2017-11-23 18:44:27.454949
313	56	244	2017-11-23 18:44:27.460485	2017-11-23 18:44:27.460485
314	56	245	2017-11-23 18:44:27.466735	2017-11-23 18:44:27.466735
315	56	246	2017-11-23 18:44:27.472289	2017-11-23 18:44:27.472289
316	56	247	2017-11-23 18:44:27.476949	2017-11-23 18:44:27.476949
317	56	248	2017-11-23 18:44:27.48304	2017-11-23 18:44:27.48304
318	57	249	2017-11-23 18:44:39.43771	2017-11-23 18:44:39.43771
319	57	250	2017-11-23 18:44:39.443817	2017-11-23 18:44:39.443817
320	57	251	2017-11-23 18:44:39.449849	2017-11-23 18:44:39.449849
321	57	252	2017-11-23 18:44:39.456129	2017-11-23 18:44:39.456129
322	57	253	2017-11-23 18:44:39.462691	2017-11-23 18:44:39.462691
323	57	254	2017-11-23 18:44:39.4686	2017-11-23 18:44:39.4686
324	57	255	2017-11-23 18:44:39.474068	2017-11-23 18:44:39.474068
325	57	256	2017-11-23 18:44:39.479838	2017-11-23 18:44:39.479838
326	57	257	2017-11-23 18:44:39.485879	2017-11-23 18:44:39.485879
327	57	258	2017-11-23 18:44:39.491968	2017-11-23 18:44:39.491968
328	57	259	2017-11-23 18:44:39.498039	2017-11-23 18:44:39.498039
329	57	260	2017-11-23 18:44:39.504195	2017-11-23 18:44:39.504195
330	57	261	2017-11-23 18:44:39.510848	2017-11-23 18:44:39.510848
331	57	262	2017-11-23 18:44:39.517247	2017-11-23 18:44:39.517247
332	57	263	2017-11-23 18:44:39.52419	2017-11-23 18:44:39.52419
333	57	264	2017-11-23 18:44:39.530438	2017-11-23 18:44:39.530438
334	57	265	2017-11-23 18:44:39.536356	2017-11-23 18:44:39.536356
335	57	266	2017-11-23 18:44:39.542262	2017-11-23 18:44:39.542262
336	57	267	2017-11-23 18:44:39.5477	2017-11-23 18:44:39.5477
337	57	268	2017-11-23 18:44:39.553139	2017-11-23 18:44:39.553139
338	57	269	2017-11-23 18:44:39.558972	2017-11-23 18:44:39.558972
339	57	270	2017-11-23 18:44:39.58249	2017-11-23 18:44:39.58249
340	58	271	2017-11-23 18:44:51.490987	2017-11-23 18:44:51.490987
341	58	272	2017-11-23 18:44:51.496984	2017-11-23 18:44:51.496984
342	58	273	2017-11-23 18:44:51.502429	2017-11-23 18:44:51.502429
343	58	274	2017-11-23 18:44:51.508224	2017-11-23 18:44:51.508224
344	58	275	2017-11-23 18:44:51.514055	2017-11-23 18:44:51.514055
345	58	276	2017-11-23 18:44:51.518328	2017-11-23 18:44:51.518328
346	58	277	2017-11-23 18:44:51.522212	2017-11-23 18:44:51.522212
347	58	278	2017-11-23 18:44:51.526523	2017-11-23 18:44:51.526523
348	58	279	2017-11-23 18:44:51.531753	2017-11-23 18:44:51.531753
349	58	280	2017-11-23 18:44:51.535713	2017-11-23 18:44:51.535713
350	58	281	2017-11-23 18:44:51.540588	2017-11-23 18:44:51.540588
351	58	282	2017-11-23 18:44:51.544577	2017-11-23 18:44:51.544577
352	58	283	2017-11-23 18:44:51.54883	2017-11-23 18:44:51.54883
353	58	284	2017-11-23 18:44:51.553186	2017-11-23 18:44:51.553186
354	58	285	2017-11-23 18:44:51.557217	2017-11-23 18:44:51.557217
355	58	286	2017-11-23 18:44:51.561296	2017-11-23 18:44:51.561296
356	58	287	2017-11-23 18:44:51.565395	2017-11-23 18:44:51.565395
357	58	288	2017-11-23 18:44:51.569164	2017-11-23 18:44:51.569164
358	58	289	2017-11-23 18:44:51.573371	2017-11-23 18:44:51.573371
359	58	290	2017-11-23 18:44:51.578411	2017-11-23 18:44:51.578411
360	58	291	2017-11-23 18:44:51.58314	2017-11-23 18:44:51.58314
361	58	292	2017-11-23 18:44:51.587816	2017-11-23 18:44:51.587816
362	58	293	2017-11-23 18:44:51.592331	2017-11-23 18:44:51.592331
363	58	294	2017-11-23 18:44:51.596896	2017-11-23 18:44:51.596896
364	58	295	2017-11-23 18:44:51.601336	2017-11-23 18:44:51.601336
365	58	296	2017-11-23 18:44:51.605621	2017-11-23 18:44:51.605621
366	59	297	2017-11-23 18:45:03.472173	2017-11-23 18:45:03.472173
367	59	298	2017-11-23 18:45:03.476389	2017-11-23 18:45:03.476389
368	59	299	2017-11-23 18:45:03.480761	2017-11-23 18:45:03.480761
369	59	300	2017-11-23 18:45:03.485492	2017-11-23 18:45:03.485492
370	59	301	2017-11-23 18:45:03.489875	2017-11-23 18:45:03.489875
371	59	302	2017-11-23 18:45:03.493809	2017-11-23 18:45:03.493809
372	59	303	2017-11-23 18:45:03.497792	2017-11-23 18:45:03.497792
373	59	304	2017-11-23 18:45:03.501422	2017-11-23 18:45:03.501422
374	59	305	2017-11-23 18:45:03.505496	2017-11-23 18:45:03.505496
375	59	306	2017-11-23 18:45:03.510214	2017-11-23 18:45:03.510214
376	59	307	2017-11-23 18:45:03.514937	2017-11-23 18:45:03.514937
377	59	308	2017-11-23 18:45:03.519633	2017-11-23 18:45:03.519633
378	59	309	2017-11-23 18:45:03.523632	2017-11-23 18:45:03.523632
379	59	310	2017-11-23 18:45:03.528357	2017-11-23 18:45:03.528357
380	59	311	2017-11-23 18:45:03.534071	2017-11-23 18:45:03.534071
381	59	312	2017-11-23 18:45:03.539076	2017-11-23 18:45:03.539076
382	59	313	2017-11-23 18:45:03.54314	2017-11-23 18:45:03.54314
383	59	314	2017-11-23 18:45:03.547633	2017-11-23 18:45:03.547633
384	59	315	2017-11-23 18:45:03.552561	2017-11-23 18:45:03.552561
385	59	316	2017-11-23 18:45:03.557285	2017-11-23 18:45:03.557285
386	59	317	2017-11-23 18:45:03.561421	2017-11-23 18:45:03.561421
387	59	318	2017-11-23 18:45:03.565524	2017-11-23 18:45:03.565524
388	59	319	2017-11-23 18:45:03.569565	2017-11-23 18:45:03.569565
389	60	320	2017-11-23 18:45:15.405413	2017-11-23 18:45:15.405413
390	60	321	2017-11-23 18:45:15.409529	2017-11-23 18:45:15.409529
391	60	322	2017-11-23 18:45:15.413789	2017-11-23 18:45:15.413789
392	60	323	2017-11-23 18:45:15.418199	2017-11-23 18:45:15.418199
393	60	324	2017-11-23 18:45:15.422618	2017-11-23 18:45:15.422618
394	60	325	2017-11-23 18:45:15.427156	2017-11-23 18:45:15.427156
395	60	326	2017-11-23 18:45:15.431242	2017-11-23 18:45:15.431242
396	60	327	2017-11-23 18:45:15.43543	2017-11-23 18:45:15.43543
397	60	328	2017-11-23 18:45:15.439606	2017-11-23 18:45:15.439606
398	60	329	2017-11-23 18:45:15.443563	2017-11-23 18:45:15.443563
399	60	330	2017-11-23 18:45:15.448386	2017-11-23 18:45:15.448386
400	60	331	2017-11-23 18:45:15.453628	2017-11-23 18:45:15.453628
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bandmembers_id_seq', 400, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
31	Led Zeppelin	Led Zeppelin formed out of the ashes of [url=http://www.discogs.com/artist/262455-Yardbirds-The]The Yardbirds[/url].  [a180585] had joined the band in its final days, playing a pivotal role on the group's final album, 1967's [m=86344], which also featured string arrangements from [a60149].  During 1967, the Yardbirds were fairly inactive.  Whilst the band members decided the group's future, Page returned to session work in 1967. In the spring of 1968, he played on Jones' arrangement of [a=Donovan]'s "Hurdy Gurdy Man." During the sessions, Jones requested to be part of any future project Page would develop. Page would have to assemble a band sooner than he had planned. In the summer of 1968, the Yardbirds' [a=Keith Relf] and [a=Jim McCarty] left, leaving Page and bassist [a=Chris Dreja] with the rights to the name, as well as the obligation of fulfilling an upcoming fall tour. Page set out to find a replacement vocalist and drummer. Initially, he wanted to enlist singer Terry Reid and Procol Harum's drummer B.J. Wilson, but neither musician was able to join the group. Reid suggested that Page contact Robert Plant, who was singing with a band called Hobbstweedle.\r\n\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer). \r\n	2017-11-23 18:25:17.346238	2017-11-23 18:25:17.346238	1
32	The Beatles	British rock/pop group, formed in Liverpool, England during the late 1950s. Signed to recording contract with EMI in 1962.\r\n\r\nThe lineup (1962-70) comprised John Lennon (vocals, guitar, harmonica, keyboards), Paul McCartney (vocals, bass, guitar, keyboards, percussion), George Harrison (guitar, vocals, sitar), and Ringo Starr (drums, vocals, percussion). During 1961, Stu Sutcliffe (bass) and Pete Best (drums) were also members.\r\n\r\nFollowing an initial period as a straightforward Mersey-beat group, later recordings saw them experiment with psychedelia, incorporating innovative production techniques involving tape loops and other effects. Although the group split in 1970, they have continued to release special products. \r\n\r\nInducted into Rock And Roll Hall of Fame in 1988 (Group). By 2015, all four members were inducted also as individual solo artists.	2017-11-23 18:25:29.340143	2017-11-23 18:25:29.340143	1
33	Pink Floyd	Pink Floyd was an English rock band from London. Founded in 1965, the group achieved worldwide acclaim, initially with innovative psychedelic music, and later in a genre that came to be termed progressive rock. \r\n\r\nDistinguished by philosophical lyrics, musical experimentation, frequent use of sound effects and elaborate live shows, Pink Floyd remains one of the most commercially successful and influential groups in the history of popular music.\r\n\r\n[a=David Gilmour] - guitar, slide guitar, vocals (1968-2014)\r\n[a=Richard Wright] - keyboards, vocals (1965-1980, 1987-2008)\r\n[a=Nick Mason] - drums, percussion, sound effects (1965-2014)\r\n[a=Roger Waters] - bass guitar, vocals, sound effects (1965-1985)\r\n[a=Syd Barrett] - guitar, vocals (1965-1968)\r\n\r\nOther players:\r\n[a=Rado Klose] - guitar (1965)\r\n[a=Jon Carin] - backing vocals, keyboards, slide guitar, sound effects (1985-1995)\r\n\r\nInducted into Rock And Roll Hall of Fame in 1996 (Performer).	2017-11-23 18:25:41.341034	2017-11-23 18:25:41.341034	1
34	Queen	Queen is a British rock band formed in London in 1970. (John Deacon joined in 1971, but the name Queen was taken in 1970.)\r\nThe band has released a total of 18 number-one albums, 18 number-one singles and 10 number-one DVDs, and have sold over 300 million albums worldwide, making them one of the world's best-selling music artists. They have been honoured with seven Ivor Novello awards and were inducted into the Rock and Roll Hall of Fame in 2001.\r\n\r\nLead singer [a=Freddie Mercury] died in November 1991 of AIDS-related complications. A year after his death, Queen continued, first with a tribute concert for the lead singer to commemorate his life (featuring all three remaining members), and then as various "Queen+" incarnations.\r\n	2017-11-23 18:25:52.345024	2017-11-23 18:25:52.345024	1
35	AC/DC	Hard Rock band from Australia, formed in 1973 by Angus and Malcolm Young, they teamed up with Dave Evans (vocals), Larry Van Kriedt (bass) and Colin Burgess (drums).\r\n\r\nIn 1974 both Larry Van Kriedt and Colin Burgess left and were replaced by Rob Bailey (bass) and Peter Clack (drums), a further change in 1974 saw Peter Clack leave and Tony Currenti (drums) join the band. In June 1974 they were signed by Harry Vanda & George Young (Malcolm & Angus's brother) to Albert Productions. In November 1974, Dave Evans left the band and was replaced by Bon Scott (vocals & bagpipes). Rob Bailey also left in 1974 and was replaced by George Young (bass). In 1975 Phil Rudd (drums) replaced Tony Currenti and Mark Evans (bass) replaced George Young.  In June 1977 Mark Evans left and is replaced by Cliff Williams (bass) for their first tour of the USA. On the 19 Feb 1980 Bon Scott died at the age of 33. Brian Johnson (ex Geordie) joined the band to replace him on vocals and the album "Back In Black" was released, a tribute to Bon Scott, this album became the 2nd largest selling album of all time with over 40 million copies sold worldwide. In May 1983, Phil Rudd had a parting of the ways and was replaced by Simon Wright (drums), aged 20 then. November 1989 Simon Wright left and is replaced by Chris Slade (ex Manfred Mann's Earth Band, Uriah Heep & The Firm). In summer 1994 Phil Rudd "quietly" rejoined the band, but left again in 2015, which led to Slade's return. Malcolm Young left AC/DC in 2014 for health reasons. Brian Johnson was forced to stop touring in April 2016 because of hearing issues. To complete the 2016 tour dates, Axl Rose was recruited as a guest singer. In September 2016 Cliff Williams retired from the group.\r\n\r\nAC/DC are Australia's most successful rock band ever, and are popular around the world. The band was inducted into Rock And Roll Hall Of Fame in 2003 as a performer.\r\n\r\nCurrent line-up:\r\nAxl Rose - Vocals (Live only) (2016 - )\r\nAngus Young - Lead guitar (1973 - )\r\nChris Slade - Drums (1989-1994, 2015 - )\r\nSteve Young - Rhythm guitar (1988, 2014 - )	2017-11-23 18:26:03.34029	2017-11-23 18:26:03.34029	1
36	John Mayall & The Bluesbreakers	Group named after the successful 1966 'Blues Breakers' album by [a=John Mayall] with [a=Eric Clapton].\r\n\r\nThe Bluesbreakers' line-ups, along with the interpolating members of [a=Blues Incorporated], had a profound influence on the early British 'Electric Blues' scene, eventually spilling into the mainstream of progressive fusions and popular 'Rock'.\r\n\r\nEarlier members joined/formed some iconic groups, or gained successful solo careers. Like [a=Eric Clapton] and [a=Jack Bruce], later members of [a=Cream (2)].\r\n[a=Peter Green (2)], [a=John McVie] and [a=Mick Fleetwood], who formed Peter Green's Fleetwood Mac - which later evolved without Green into [a=Fleetwood Mac]. [a=Mick Taylor] later member of [a=Rolling Stones]. [a=Colosseum], [a=Free], [a=Don "Sugarcane" Harris], [a=Harvey Mandel], [a=Larry Taylor], [a=Aynsley Dunbar], [a=Johnny Almond], [a=Jon Mark]... the list could scroll until next week\r\n	2017-11-23 18:29:24.340023	2017-11-23 18:29:24.340023	16
37	Cream (7)	Sleeve design company from Amsterdam, The Netherlands\r\nAlso known as The Cream Group	2017-11-23 18:29:36.339143	2017-11-23 18:29:36.339143	16
38	ZZ Top	ZZ Top is an American rock band formed in 1969 in Houston, Texas. The band consists of guitarist and lead vocalist Billy Gibbons, bassist and co-lead vocalist Dusty Hill, and drummer Frank Beard. The band and its members went through several reconfigurations throughout 1969, achieving their current form when Hill replaced bassist Billy Etheridge in February 1970, shortly before the band was signed to London Records. Etheridge's departure issued primarily from his unwillingness to be bound by a recording contract.\r\n\r\nSince the release of the band's debut album in January 1971, ZZ Top has become known for its strong blues roots and humorous lyrical motifs, relying heavily on double entendres and innuendo. ZZ Top's musical style has changed over the years, beginning with blues-inspired rock on their early albums, then incorporating New Wave, punk rock and dance-rock, with heavy use of synthesizers.\r\n\r\nZZ Top was inducted into the Rock and Roll Hall of Fame in 2004. As a group, ZZ Top possesses 11 gold records and 7 platinum (13 multi-platinum) records; their 1983 album, Eliminator, remains the group's most commercially successful record, selling over 10 million units. ZZ Top also ranks 80th in U.S. album sales, with 25 million units.\r\n\r\n	2017-11-23 18:29:47.34555	2017-11-23 18:29:47.34555	16
39	The Allman Brothers Band	American rock/blues band once based in Macon, Georgia.\r\nYears active:  1969–1976, 1978–1982, 1989–2014.\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer).	2017-11-23 18:29:58.353631	2017-11-23 18:29:58.353631	16
40	The Who	Formed in 1964, Hammersmith, London, United Kingdom \r\nMembers:\r\nPete Townshend (guitar, vocals)\r\nRoger Daltrey (vocals, tambourine, harmonica)\r\nJohn Entwistle (bass, vocals, 1964-2002)\r\nKeith Moon (drums, vocals, 1964-78)\r\nKenney Jones (drums, 1978-88)\r\nJohn "Rabbit" Bundrick (keyboards, 1979-present)\r\nSimon Phillips (drums, 1989)\r\nZak Starkey (drums, 1996-present) \r\n \r\nInducted into Rock And Roll Hall of Fame in 1990 (Performer). \r\n	2017-11-23 18:30:09.347938	2017-11-23 18:30:09.347938	16
41	Green Day	Green Day is a pop punk/alternative rock band from East Bay, California that formed in 1987. They were originally called Sweet Children, but changed their name before their first release.\r\n\r\nCurrent lineup \r\nlead vocals, guitars : [a=Billie Joe Armstrong]\r\nbass guitar, backing vocals : Mike Dirnt ([a=Michael Pritchard])\r\ndrums, percussion : Tré Cool ([a=Frank E. Wright] III)\r\nguitars, backing vocals :Jason White ([a=Jason White (3)])\r\n\r\nFormer member:\r\nDrums: [a=John Kiffmeyer] alias [a=Al Sobrante] until 1990.	2017-11-23 18:33:29.358256	2017-11-23 18:33:29.358256	16
42	Dead Kennedys	Legendary punk band hailing from San Francisco, formed in 1978 & fronted by the even more legendary [a=Jello Biafra] (Eric Boucher). They split up in the mid-80s, and there has been animosity between Jello and the rest of the band since the late '90s, with a recent court case awarding all the rights to all the songs to the rest of the band.	2017-11-23 18:33:40.338553	2017-11-23 18:33:40.338553	16
43	The Clash	Influential British punk group from west and south London, active between 1976 and 1985. Adding catchy sloganistic socio-political lyrics to their brand of garage rock 'n' roll, the band soon explored wider musical horizons than most of their contemporaries, incorporating reggae, dub, rockabilly, hip hop and funk influences into their music and a whole lot more. \r\nThe US saw the 2nd album "Give 'Em Enough Rope" relased before the first to coincide with the band's first transatlantic tour in early 1979 (and like in Japan and in Canada) the 1st LP "The Clash" was soon repackaged with an updated track list and the addition of a free 7" "Groovy Times" / "Gates Of The West" which wasn't released separately. A year later they were receiving worlwide acclaim with their classic double album "London Calling".\r\nInducted into Rock And Roll Hall of Fame in 2003 (Performer), their classic line-up comprised [a=Joe Strummer] (vocals / guitar, b. John Graham Mellor August 21, 1952 Ankara, Turkey d. Dec 22, 2002 Broomfield, Somerset, England), Paul Simonon (bass, b.December 15, 1955), Mick Jones (guitar, b. June 26, 1955) and Nicky "Topper" Headon (drums, b.May 30, 1955).\r\n	2017-11-23 18:33:52.340156	2017-11-23 18:33:52.340156	16
44	Misfits	The Misfits are an American horror-themed punk rock band from Lodi, New Jersey. Formed in early 1977, they took the band name from Marilyn Monroe's last film and in fact, thanked the cast of the movie on the back of their first record. The founding members were: Glenn Danzig on vocals and electric piano, Jerry Caiafa (Jerry Only) on bass, and Manny on drums. Their first release on their own label, Blank Records, didn't reflect the characteristic anger and rebellion of most "punk" records, but instead a more brooding and sinister, yet romantic side lingering beneath.  Following the single, Danzig and Only recruited a new drummer and added a guitar player and pursued the horror-based punk rock direction that they are known for.  Danzig and Only presided over several line up changes, eventually culminating with Jerry's younger brother, Paul (aka Doyle) becoming the band's permanent guitarist.\r\n\r\nThe original Misfits broke up in October 1983, having released several 7" singles and 12" records, all of which were DIY limited-edition and most of which were hand-assembled by the band, that have long been considered prime collectors' items.  The bulk of the band's material was released on Glenn's Plan 9 label.  The band's popularity grew exponentially following their split and their material and tapes of their live shows were heavily bootlegged.\r\n\r\nFollowing the Misfits' dissolution, Danzig formed a new band called Samhain while Jerry Only and Doyle, heavily in debt to their father over band expenses, stepped away from music to work full time jobs at their father's company.  Between 1986 and 1988, Glenn continued to issue unreleased and out of print Misfits material.  Some of the songs on these collections featured guitar and bass tracks re-recorded by Glenn while others were all new recordings of old songs performed by Glenn and his Samhain bandmate Eerie Von.  These collections were released by Plan 9 records.  Jerry Only eventually contacted Danzig about royalties from these releases which resulted in a lawsuit between the two.  In 1995, an out of court settlement was reached that gave Only the rights to the Misfits name while Glenn maintained control of the publishing for the band's old material and the Plan 9 label was terminated. \r\n\r\nJerry Only and Doyle reformed The Misfits in 1995, recruiting Michale Graves on vocals and Dr. Chud on drums. The new incarnation of the Misfits released two full-length albums, "American Psycho" and "Famous Monsters" as well as a collection of rare and unreleased "resurrected" Misfits tracks, until Michale Graves and Dr. Chud left the band on October 25, 2000 at a performance at the House of Blues in Orlando.  Doyle went on "indefinite hiatus" from the band, later stating he was frustrated with decisions that his brother had made regarding the band.  In 2004, Doyle reconnected with Glenn Danzig and has periodically made live appearances with Glenn to perform Misfits tunes.  Meanwhile, Jerry Only took over the vocalist spot in the Misfits while recruiting former Black Flag vocalist Dez Cadena to play guitar and Marky Ramone for the drums.  Ramone eventually left and was replaced by former Misfits and Black Flag drummer Robo, who was later replaced by Eric "Chupacabra" Arce.  In 2001, Only and associate John Cafiero set up Misfits Records to release new material by the band.  After releasing an album of cover tunes in 2003, the Only-fronted line up released it's first album of original tunes in 2011.	2017-11-23 18:34:03.340831	2017-11-23 18:34:03.340831	16
45	Bad Religion	Punk/Rock band formed in 1980 in San Fernando Valley/Los Angeles, CA, US by [a=Greg Graffin] (vocals), [a=Brett Gurewitz] (guitar), [a=Jay Ziskrout] (drums), and [a=Jay Bentley] (bass). All the members were teenagers when the band started. Only Graffin has remained with the band through every phase of its career, although Bentley and Gurewitz have participated for substantial chunks of time. Graffin and Gurewitz are the band's primary songwriters, with other members contributing occasionally. The band is known for their rapid-fire songs with a melodic edge and strong backing harmonies.\r\n\r\nBad Religion released their first record, a self-titled EP, in 1981 on [l=Epitaph] Records, a label Gurewitz started after borrowing money from his father.  The band released their first full length, "How Could Hell Be Any Worse?", in 1982. Midway through the recording for the album, Ziskrout quit the band and the record was finished with drummer Pete Finestone. In 1983, the band abruptly shifted gears, issuing the keyboard-heavy, prog rock influenced "Into The Unknown", on which neither Bentley (who quit during the recording of the first track) nor Finestone appeared. The results were disastrous, with the band facing considerable backlash from fans and Epitaph immediately pulling the album off record store shelves. For his part, Gurewitz blamed his participation on his increasing drug habit, although he was quick to point out that the sober Graffin had no such excuse to fall back on, and has disowned the album. With Epitaph out of money and the band's reputation in tatters, Gurewitz quit and the band split. Graffin soon moved out of state for college, but returned to California in 1984 and was convinced by [a=Circle Jerks] guitarist Greg Hetson to reform Bad Religion with him on guitar. Recruiting Pete Finestone and bassist Tim Gallegos, the band issued a 12" EP, called "Back To The Known", with Gurewitz producing but not playing on the record.\r\n\r\nGraffin and Hetson spent the next few years playing sporadically with various line-ups. Eventually, Finestone and Bentley returned on a full-time basis. In 1987, a newly sober Brett Gurewitz returned to the fold and the band continued as a five-piece. In 1988, Bad Religion issued a new LP, "Suffer", to enthusiastic fans and critics. This lineup released 2 more albums before Finestone departed in 1991. He was replaced by Bobby Schayer. In 1993, immediately following the release of their 7th LP, "Recipe For Hate", the band jumped from Epitaph to [l=Atlantic] Records. Following the release of 1994's "Stranger Than Fiction", Brett Gurewitz left the group. Officially, it was said that his reason for leaving was to concentrate on Epitaph following the huge commercial success of the album "Smash" by [a=The Offspring], and he also expressed displeasure with the band's deal with Atlantic. However, it was later revealed the Gurewitz's primary reason for leaving was due to tension with Bentley (in 1996, Gurewitz released a single with his new band, [a=Daredevils], whose A-side, "Hate You" was written about Bentley). Graffin and Gurewitz also publicly feuded for a short time after the departure. Gurewitz was replaced by Brian Baker (ex-[a=Minor Threat] and [a=Dag Nasty]). The band would record 3 more albums for Atlantic with Graffin as the primary songwriter, although 1998's "No Substance" featured significant contributions from the other members of Bad Religion. However, the albums were met with largely mixed critical and commercial responses. Meanwhile, Gurewitz had relapsed into drug abuse and faced a number of personal and legal problems. In 2000, a cleaned-up and sober Gurewitz made a guest appearance on the band's LP, "The New America", prompting rumors of a reunion. The album was the group's last for Atlantic.\r\n\r\nFollowing the release of "The New America", Bobby Schayer exited the group, as a shoulder injury barred him from playing drums. His replacement was Brooks Wackerman (ex-[a=Suicidal Tendencies]). In 2001, it was announced that not only had Brett Gurewitz rejoined the band, but that they would also be returning to Epitaph Records. It turned out the Brett's role would be mostly limited to songwriting and production, as his work with Epitaph makes extended touring impractical, although he would make appearances with the band when they performed in Los Angeles. It was also revealed that since the reunion, Gurewitz rarely actually plays guitar on the albums. Most of the guitar parts are recorded by Brian Baker as he is the most proficient guitarist, although Gurewitz does record parts if he wants to. The band has continued to record and tour steadily since returning to Epitaph.	2017-11-23 18:34:55.931411	2017-11-23 18:34:55.931411	16
46	The Carter Family	American traditional folk music group, formed in 1927. Their music was hugely influential for bluegrass, country, folk, and rock musicians. The original group split up when A.P. Carter and Sara Carter left in 1944, but Maybelle Carter and her daughters continued performing as [a1353326]. In the 1960's, [a1353326] reclaimed the name The Carter Family.\r\n\r\nMembership (as [a307357], 1927-1944, ~1960 to 1996; as [a1353326], 1944-~1960):\r\nA.P. Carter – 1927-1944\r\nMaybelle Carter – 1927-1978\r\nSara Carter – 1927-1944\r\nJanette Carter – 1939-1940\r\nJoe Carter – 1939-1940\r\nHelen Carter – 1939-1940, 1944-1996\r\nJune Carter – 1939-1940, 1944-1969, 1971-1996\r\nAnita Carter – 1939-1940, 1944-1996\r\nRobbie Harden – 1969-1971	2017-11-23 18:37:27.340221	2017-11-23 18:37:27.340221	16
47	Bill Monroe & His Blue Grass Boys		2017-11-23 18:37:39.337749	2017-11-23 18:37:39.337749	16
48	Alabama	Alabama is an American country, Southern rock and bluegrass band formed in Fort Payne, Alabama in 1969.	2017-11-23 18:37:51.335549	2017-11-23 18:37:51.335549	16
49	The Louvin Brothers	Please only use this profile for credits with the word "Brothers", "Bros." etc. Individual credits for Charlie and Ira should be linked to their respective profiles.\r\n\r\nAn American country vocal/harmony duet, consisting of brothers Ira and Charlie Loudermilk. Their professional career began after winning a talent contest by singing "There's a Hole in the Bottom of the Sea." Brief stints on Apollo, Decca, and MGM led to them being signed by Capitol Records. At first their recordings were strictly gospel, but they switched to country with the 1955 release of "When I Stop Dreaming." Their career continued until 1963 when they broke up due to Ira's volatile temper. Charlie began a successful solo career in 1964. Ira was killed in a car wreck in Jefferson City, Missouri on June 20, 1965.  Songs he had recorded for a solo album were released posthumously.\r\n\r\nThe Louvin Brothers were inducted into the Alabama Music Hall of Fame in 1991 and the Country Music Hall of Fame in 2001.\r\n	2017-11-23 18:38:03.337277	2017-11-23 18:38:03.337277	16
50	The Charlie Daniels Band	The Charlie Daniels Band was formed in 1970, with [a=Charlie Daniels] joined by [a=Barry Barnes] (guitar), [a=Mark Fitzgerald] (bass), [a=Fred Edwards] and [a=Gary Allen] (drums), and [a=Taz DiGregorio] (keyboards). They started recording southern rock-styled albums for [l=Kama Sutra]. Although a multi-instrumentalist, Daniels was a limited vocalist, but his voice was well suited to the talking-style "Uneasy Rider", which reached the US Top 10 in 1973. He followed it with his anthem for southern rock, "The South's Gonna Do It". In 1974, Daniels had members of [a=The Marshall Tucker Band] and [a=The Allman Brothers Band] join him onstage in Nashville. It was so successful that he decided to make his so-called Volunteer Jam an annual event. It led to some unlikely combinations of artists such as [a=James Brown] performing with [a=Roy Acuff], and the stylistic mergers have included [a=Crystal Gayle] singing the blues with the Charlie Daniels Band.\r\n\r\nThe Charlie Daniels Band underwent some personnel changes on 1975's Nightrider, with [a=Tom Crain], [a=Charlie Hayward] and [a=Don Murray (3)] replacing Barnes, Fitzgerald and Allen respectively. When Daniels moved to [l=Epic] in 1976, there was a concerted effort to turn the band into a major concert attraction, despite the fact that at 6 feet 4 inches tall and weighing 20 stone Daniels was no teenage idol: he hid his face under an oversized cowboy hat. The albums sold well, and in 1979, when recording his Million Mile Reflections album, he recalled a 20s poem, "The Mountain Whipporwill", by Stephen Vincent Benet. The band developed this into "The Devil Went Down To Georgia", in which Johnny outplays the Devil to win a gold fiddle. Daniels overdubbed his fiddle seven times to create an atmospheric recording that topped the US country charts and reached number 3 in the US pop charts. It was also a UK Top 20 success.\r\n\r\nIn 1980 the band recorded "In America" for the hostages in Iran, and then in 1982, "Still In Saigon" , about Vietnam. The band were featured on the soundtrack for Urban Cowboy and also recorded the theme for the Burt Reynolds movie Stroker Ace. The 13th Volunteer Jam was held in 1987, but financial and time constraints meant the event was put on temporary hiatus (it resumed four years later). In the late 80s Daniels appeared in the movie Lone Star Kid and published a book of short stories, but continued touring and playing his southern boogie to adoring audiences.\r\n\r\nDuring the 90s Daniels updated "The Devil Went Down To Georgia" with [a=Johnny Cash] and continued in his politically incorrect way - in simple language, he advocates both lynching and red-baiting; not a man to stand next to at the bar. He signed a new recording contract with [l=Liberty] in 1993, but also targeted the white gospel market through a deal with [l=Sparrow Records]. The albums The Door and Steel Witness earned Daniels several awards from the Christian recording community. In 1997 Daniels inaugurated his own [l=Blue Hat Records] and also released his first children's album, By The Light Of The Moon: Campfire Songs & Cowboy Tunes, on the Sony Wonder label. Two years later he took his Volunteer Jam event on the road for the first time.\r\n	2017-11-23 18:38:14.333709	2017-11-23 18:38:14.333709	16
51	Wu-Tang Clan	The Wu-Tang Clan is a rap group that formed in Staten Island, New York in 1992. It originally consisted of 9 members: [a=RZA], [a=GZA], [a=Ol' Dirty Bastard], [a=Inspectah Deck], [a=U-God], [a=Raekwon], [a=Ghostface Killah], [a=Method Man], and [a=Masta Killa]. [a=Cappadonna] was later inducted as a 10th member.	2017-11-23 18:40:56.342676	2017-11-23 18:40:56.342676	16
52	N.W.A.	U.S. American group, seminal purveyors of the gangsta rap sub-genre. N.W.A. stands for "Niggaz Wit Attitudes." They were active from 1986 to 1991 and shortly in 1999/2000.\r\n\r\nN.W.A released [m=40320] in 1987 on Macola Records, which was later included on the compilation [m=139509]. The group was still in its developing stages, and only credited on four of the eleven tracks, notably the uncharacteristic electro-hop record "Panic Zone," "8-Ball," and "Dopeman," which marked the first collaboration of [a76220], DJ [a12330],  [a50513], and [a13732]. Hispanic rapper [a663863] co-wrote "Panic Zone," which was originally called "Hispanic Zone," but the title was later changed when Dr. Dre advised Krazy-Dee that the word "hispanic" would hinder sales. Also included was [a76073]'s solo track "Boyz-n-the Hood."\r\n\r\nIn 1988, rapper [a100748] joined N.W.A. and later that year, the group released their debut album [m=26117]. Though not a success at first, "Straight Outta Compton" helped pave the way for the emerging gangsta rap scene in the 1980s, and reached number 37 in the Billboard Top 200 in May 1989, while it reached number 9 on Billboard's Top Soul LPs. The album managed to sell over three million copies without any airplay, and spawned three singles, two of them charting successfully: "Straight Outta Compton," "Gangsta Gangsta" and "Express Yourself".\r\n\r\nIce Cube left in December 1989 over royalty disputes -- having written almost half of the lyrics on "Straight Outta Compton" himself, he felt he was not getting a fair share of the money and profits. He wasted little time putting together his solo debut, 1990's [m=97462], but he avoided mentioning his former label mates. Instead of breaking up, N.W.A. decided to continue without Ice Cube, releasing the EP [m=26111], which went platinum. Their 1991 follow-up album [m=26113] (also referred to as "Niggaz4Life") was the first hip-hop full-length album to reach number one on the Billboard 200. Shortly after the release of "Efil4zaggin," N.W.A. disbanded. All members continued making music since then, with Dr. Dre going solo and Eazy-E running Ruthless Records and releasing more music until he died of AIDS in 1995.	2017-11-23 18:41:07.338848	2017-11-23 18:41:07.338848	16
53	Run-DMC	Run-D.M.C.: \r\n\r\n[a=Joseph Simmons] aka [a=Run]\r\n[a=Darryl McDaniels] aka [a=DMC (2)]\r\n[a=Jason Mizell] aka [a=Jam Master Jay]  R.I.P. (January 21, 1965 – October 30, 2002)\r\n\r\nInducted into the Rock and Roll Hall of Fame in 2009 (Performer). \r\n	2017-11-23 18:41:18.340337	2017-11-23 18:41:18.340337	16
54	A Tribe Called Quest	This US male rap outfit originally comprised [a=Q-Tip] (b. Jonathan Davis ―later changed to Kamaal Ibn John Fareed, in the mid-1990's, on conversion to Islam― 10 April 1970, New York, USA), DJ [a=Ali Shaheed Muhammad] (b. 11 August 1970, Brooklyn, New York City, USA), [a=Jarobi] and [a=Phife Dawg] (b. Malik Taylor, 20 November 1970, Brooklyn, New York City, USA; d. 22 March 2016, USA). They formed at school in Manhattan, New York, where they started out as part of the Native Tongues Posse, with [a=Queen Latifah] and the [a=Jungle Brothers], and were given their name by [a=Afrika Baby Bambaataa] of the Jungle Brothers. \r\n\r\nFollowing their August 1989 debut, "Description Of A Fool", they had a hit with "Bonita Applebum" a year later, which was apparently based on a real person from their school. \r\nTheir biggest success came the following year with the laid-back "Can I Kick It?", typical of their refined jazz/hip-hop cross-match. A UK Top 20 single, it was later used extensively in television advertisements. Q-Tip also appeared on Deee-Lite's August 1990 hit, "Groove Is In The Heart". \r\n\r\nAs members of the Native Tongues Posse they were promoters of the Afrocentricity movement, which set out to make US Africans aware of their heritage, a theme emphasized in the group's music. \r\n\r\nWhile their debut, "People's Instinctive Travels And The Paths Of Rhythm", was more eclectic, and even self-consciously jokey, "The Low-End Theory" (recorded as a trio following the departure of Jarobi) saw them return to their roots with a more bracing, harder funk sound. \r\n\r\nThey were helped considerably by jazz bass player [a=Ron Carter] (who had worked with [a=Miles Davis] and [a=John Coltrane]), whose contribution rather dominated proceedings. Tracks such as "The Infamous Date Rape" stoked controversy, while samples from [a=Lou Reed], [a=Stevie Wonder] and [a=Earth, Wind & Fire] were used in a frugal and intelligent manner. By "Midnight Marauders" there were allusions to the rise of gangsta rap, although they maintained the optimism predominant on their debut. Q-Tip appeared in the 1993 movie "Poetic Justice" opposite [a=Janet Jackson], and helped to produce [a=Tony! Toni! Toné!] (whose Raphael Wiggins made an appearance on "Midnight Marauders"), [a=Nas], [a=Shyheim] and labelmate [a=Shaquille O'Neal]. \r\n\r\nThey were rewarded with the Group Of The Year category at the inaugural Source Magazine Hip Hop Award Show in 1994, before being pulled off the stage by the arrival of 2Pac and his Thug Life crew, attempting to steal some publicity. Two years elapsed before "Beats, Rhymes And Life" debuted at number 1 on the Billboard album chart. Their lyrics on this album were highly evolved, addressing issues with greater philosophy than the crude banter of their past recordings. Q-Tip's conversion to the Islamic faith in the mid-1990's may have had some bearing on this style. \r\n\r\n"The Love Movement", which debuted at US number 3 in October 1998, was another mature, stylish collection of material that lacked the spark of their earlier work.  ATCQ released "We Got It From Here... Thank You 4 Your Service" on November 4, 2016, nearly 18 years after their last album.  In the midst of record verses for the album as well as verses for his solo album, Phife Dawg passed away on March 22, 2016. During its first month of release, the album was greeted with both critical acclaim and fan support.\r\n	2017-11-23 18:41:29.347353	2017-11-23 18:41:29.347353	16
55	Public Enemy	Formed 1986, Long Island (or as PE call it, 'Strong Island'), New York. \r\nMembers: Chuck D (MC, 1986–present); Flavor Flav (MC, 1986–present); Terminator X (DJ, 1986–1998); DJ Lord (DJ,1999–present); Professor Griff ('Minister of Information' and occasional MC, 1986–1990 and 1998–present); Security Of The First World (S1W) (associate non-music group, 1986–present).\r\n\r\nInducted into Rock And Roll Hall of Fame in 2013 (Performer).\r\n	2017-11-23 18:41:41.333883	2017-11-23 18:41:41.333883	16
56	Metallica	Thrash Metal (Heavy Metal) band from Los Angeles, California (USA).\r\n\r\nMetallica formed in 1981 by vocalist/guitarist James Hetfield and drummer Lars Ulrich.  The duo first met through an ad in a Los Angeles-based music newspaper.  At the time, Ulrich had little musical experience and no band but managed to secure a slot on an upcoming compilation record called “Metal Massacre”.   Metallica’s contribution, “Hit The Lights”, featured Hetfield, Ulrich and lead guitarist Lloyd Grant.  Afterwards, Ron McGovney became the band's bassist and Dave Mustaine joined the band as lead guitarist.  This line-up would re-record "Hit The Lights" for subsequent re-pressings of "Metal Massacre" and would also issue several demos.  In 1983, McGovney quit the group and was replaced by Cliff Burton, which also saw the band relocate to San Francisco.  Metallica then traveled to New York after signing a deal with [l=Megaforce Records].  However, once in New York, the band fired Mustaine.  It would mark the beginning of a long feud between Mustaine and Metallica, mostly fueled by remarks Mustaine would make to the press.  Mustaine was replaced by Kirk Hammett of [a=Exodus (6)].\r\n\r\nMetallica's debut LP, "Kill 'Em All", was released in 1983.  It was followed in 1984 by "Ride The Lightning".  This led to a major label deal with [l=Elektra].  In 1986, the band released "Master Of Puppets", which is considered by many to be one of the greatest heavy metal records of all time.  In September of that year, while on tour in Sweden, the band was involved in a bus accident which took the life of Cliff Burton.  Eventually, Jason Newsted (of [a=Flotsam And Jetsam]) was hired as the band's new bassist and he made his debut on 1987's "Garage Days Re-Revisited", an EP of cover tunes.  \r\n\r\nIn 1990, Metallica hooked up with producer [a=Bob Rock] for a self-titled release that would become better known as "The Black Album", due to its cover art. Released in 1991, the black album would become one of the best-selling rock albums of all time, selling over 16 million copies in the US alone.\r\n\r\nIn 1996, the band experimented with Rock music style Alternative Rock, this could be heard on the album "Load".  The following year, "Reload" appeared which had the similiar formula as ''Load''. The albums continued the band’s trend of more accessible music.  In 1999, the group released an album and accompanying film called "S&M", which featured Metallica performing their songs with the San Francisco Symphony Orchestra.\r\n\r\nIn 2001, as the band was preparing to begin work on a new album, Newsted quit the group, citing personal and musical reasons.  Work on the new album was further complicated when Hetfield entered rehab for alcohol abuse.  The album, called "St. Anger", was eventually completed in 2003 with producer Bob Rock handling the bass.  Upon its release, "St. Anger" drew mostly negative reviews.  Following the recording, Robert Trujillo, formerly of [a=Suicidal Tendencies], was hired as bassist.  The making of the album was captured in the documentary “Some Kind Of Monster”.\r\n\r\nIn 2008, "Death Magnetic", produced by [a=Rick Rubin], would surface and was hailed by many as Metallica's return to thrash metal.  The following year, Metallica was inducted into Rock And Roll Hall of Fame.  Former bassist Jason Newsted was present and Cliff Burton's father appeared on Cliff's behalf.  Dave Mustaine, who was not inducted, was invited to the ceremony by the band but declined to attend.  In 2011, Metallica collaborated with [a=Lou Reed] on the album, “Lulu”, which was largely panned by critics and ignored by consumers.    \r\n	2017-11-23 18:44:27.341501	2017-11-23 18:44:27.341501	16
57	Iron Maiden	Founded in Leyton in London's East End in 1975, Iron Maiden released their first album in 1980 as a five-piece with [a=Paul Di'Anno] on vocals. [a=Bruce Dickinson] would replace him in 1981. With several line-up changes [a=Steve Harris] would remain the only original member never to have had a hiatus. \r\n\r\nWhen [a=Bruce Dickinson] quit in 1994 and was replaced by [a=Wolfsbane]'s [a=Blaze Bayley], the band lost a lot of their fanbase. They recorded two albums with Blaze before [a=Bruce Dickinson] and [a=Adrian Smith (2)] returned to the fold for 2000's "Brave New World", and 2003's "Dance of Death", making them a six-piece. As of 1999 the line-up hasn't changed\r\n\r\nBand Members:\r\n\r\n[b]Vocals[/b]\r\n[a=Paul Mario Day] (1975-1976)\r\nDennis Wilcock (1976-1977)\r\n[a=Paul Di'Anno] (1978-1981)\r\n[a=Blaze Bayley] (1994-1998)\r\n[a=Bruce Dickinson] (1981-1993 and 1999-present)\r\n\r\n[b]Drums[/b]\r\nBarry "[a=Thunderstick]" Purkis (1977)\r\n[a=Doug Sampson] (1977-1979)\r\n[a=Clive Burr] (1980-1982)\r\n[a=Nicko McBrain] (1982-present)\r\n\r\n[b]Guitar[/b]\r\n[a=Dave Murray (2)] (1976-present)\r\n[a=Dennis Stratton] (1979-1980)\r\n[a=Adrian Smith (2)] (1980-1990 and 1999-present)\r\n[a=Janick Gers] (1990-present)\r\n\r\n[b]Bass[/b]\r\n[a=Steve Harris] (1975-present)\r\n\r\n[b]Keyboards[/b] \r\n[a=Michael Kenney] (1986-present) (Live performances only, not a full member)	2017-11-23 18:44:39.344595	2017-11-23 18:44:39.344595	16
58	Black Sabbath	Considered by many to be the first heavy metal band, Black Sabbath was formed in 1968 by [a=Tony Iommi], [a=Ozzy Osbourne], [a=Geezer Butler] and [a=Bill Ward].  The band's original name was the Polka Tulk Blues Band (later shortened to Polka Tulk) and later Earth before becoming Black Sabbath.  The original line-up lasted until 1979, after which Osbourne was fired and replaced by [a=Ronnie James Dio]. The line-up changes would continue, with no line-up remaining intact for consecutive studio releases. Throughout the changes, only Tony Iommi and keyboardist [a=Geoff Nicholls], who also joined the band in 1979, would remain with Black Sabbath, although Nicholls would not always be credited as a full member. In 1997, Iommi, Butler, Ward, and Osbourne reunited, touring and releasing a live album in 1998, although a long-rumored studio release did not appear (the group attempted to record a new album in 2001 with producer [a=Rick Rubin] but the sessions were scrapped). After that, the group periodically reunited to tour with Ozzy's "Ozzfest" tour. In 2004, longtime keyboardist Geoff Nicholls was replaced by [a=Adam Wakeman] for an Ozzfest tour. No reason was given for the replacement. In 2006, the original line-up was inducted into the Rock 'n' Roll Hall Of Fame. \r\n\r\nIn 2007, Tony Iommi, Geezer Butler, Ronnie James Dio, and drummer [a=Vinny Appice] (who were featured on 1981's "Mob Rules" and 1992's "Dehumanizer") announced that they would tour together as [a=Heaven & Hell (2)] (with Iommi, who owns the Black Sabbath name, deciding to keep the Black Sabbath name solely for the original line-up in light of their Rock 'n' Roll HOF induction) to support a Dio-era greatest hits release, which also featured 3 new Dio/Iommi compositions. A brand new live album was released under the Heaven & Hell name that same year, followed by a studio album in 2009. \r\n\r\nIn 2009, Osbourne sued Iommi over control of the Black Sabbath name.  The lawsuit was settled the following year.  In late 2011, it was announced that the original line-up would be recording and touring.  Shortly, afterward, Bill Ward dropped out, stating he had been given a contract that was "unsignable".  The three remaining members opted to continue without him.  In 2013, the band released "13", their first studio album with Osbourne in 34 years.  The band played their final live show in Birmingham, UK, on February 4, 2017.  Although the band has announced that full-scale touring is done, Tony Iommi has stated that the door is still open for future music and possible live appearances. \r\n\r\nLine-Ups:\r\nGuitar:\r\nTony Iommi - 1968-2017\r\n\r\nVocals:\r\nOzzy Osbourne - 1968-1977, 1978-1979, 1997-2017\r\nDave Walker - 1977-1978 (rehearsals and a TV appearance only)\r\nRonnie James Dio - 1979-1982, 1991-1992\r\nIan Gillan - 1983-1984\r\nGlenn Hughes - 1985-1986\r\nRay Gillen - 1986-1987 (live only)\r\nTony Martin - 1987-1991, 1993-1996\r\n\r\nBass:\r\nGeezer Butler - 1968-1984, 1991-1994, 1997-2017\r\nCraig Gruber - 1979 (rehearsals only while Butler contemplated leaving the band, the extent of his participation has been disputed)\r\nGordon Copley -1985 (rehearsals and one studio track only)\r\nDave "The Beast" Spitz - 1985-1986, 1987 (live appearances only in 1987)\r\nBob Daisley - 1987 (studio only)\r\nJo Bert - 1987 (live only)\r\nLaurence Cottle - 1988 (studio only)\r\nNeil Murray - 1989-1992, 1995-1996\r\n\r\nDrums:\r\nBill Ward - 1968-1980, 1983 (studio only in 1983), 1994 (live appearances), 1997-2011\r\nVinny Appice - 1981-1982, 1991-1992, 1998 (live only in 1998, filling in for a sick Bill Ward)\r\nBev Bevan - 1983-1984, 1987 (live only)\r\nEric Singer - 1985-1987\r\nTerry Chimes - 1987-1988 (live only)\r\nCozy Powell - 1988-1991, 1994-1995\r\nBobby Rondinelli - 1993-1994, 1995 (live appearances only in 1995)\r\nMike Bordin - 1997 (live only, not a full member)\r\nBrad Wilk - 2013 (studio only, not a full member)\r\nTommy Clufetos - 2012-2017 (live only, not a full member)\r\n\r\nKeyboards:\r\nRick Wakeman - 1973 (studio only, not a full member)\r\nJezz Woodruffe - ?-1977 (not a full member)\r\nDon Airey - 1978 (not a full member)\r\nGeoff Nicholls - 1979-2004\r\nAdam Wakeman - 2004-2017 (live only, not a full member)\r\n	2017-11-23 18:44:51.347665	2017-11-23 18:44:51.347665	16
59	Megadeth	Formed: 1983 in Los Angeles, California. Disbanded: 2002. Reformed: 2004.\r\n\r\nAmerican Thrash Metal band formed by guitarist/vocalist Dave Mustaine and bass guitarist David Ellefson following the formers ejection from [a=Metallica].\r\n\r\nDespite countless line-up changes, Megadeth is partly responsible for the popularization of Thrash Metal in the late 1980s. The band was also notorious for its substance abuse, a contributing factor to their continuous revolving door of band members. The group nonetheless found sobriety and a stable line up with 1990's [r=2017460], a trend which continued until 1998 with the departure of drummer Nick Menza. \r\n\r\nDave Mustaine disbanded Megadeth in 2002 due to a nerve injury he had suffered on his left arm. Following a year of physical therapy Mustaine began work on what was to be his first solo album, however contractual obligations forced [r=379626] to be released under the Megadeth name, following which, Mustaine decided to reform the band.\r\n	2017-11-23 18:45:03.342393	2017-11-23 18:45:03.342393	16
60	Judas Priest	Judas Priest is a pioneering British Heavy Metal band and was a forerunner in the ‘New Wave of British Heavy Metal’ movement, laying the groundwork for the speed and thrash metal of the ’80s and ’90s with numerous classic albums.\r\n\r\nThe band was formed in Birmingham, England in 1969 by guitarist John Perry (who died shortly after and was replaced by Earnest Chataway), bassist Bruno Stapenhill, drummer John Partridge, and singer [a=Alan Atkins], who created a band name from Bob Dylan's song '[i][r=3881740][/i]'. In 1970, guitarist Kenneth [a=K. K. Downing] and bassist [a=Ian Hill (2)] joined, replacing Chataway and Stapenhill. Later, in 1972, [a=Rob Halford] and drummer [a=John Hinch] joined to replace Atkins and Partridge, respectively. A second guitarist, [a=Glenn Tipton], was also added to the line-up in 1974 as compensation for its record company’s (Gull Records) suggestion to add a horn section to the first album, Rocka Rolla.\r\n\r\nThe band featuring Halford, Downing, Tipton and Hill would go on to record 14 albums from 1974 through to 1990. Priest went through a considerable amount of drummers between its formation and 1980 when [a=Trapeze] drummer [a=Dave Holland] joined and stayed until 1988’s Ram It Down. In early 1990 [a=Racer X] drummer [a=Scott Travis] joined the band and recording began on its Painkiller album. In mid 1990 the band was taken to court over the attempted suicide of two young boys in Reno, allegedly driven by subliminal messages on its Stained Class album. The case was eventually thrown out of court and in September 1990, Painkiller was released.\r\n\r\nHalford left the group in 1993 to pursue a solo career but the band was determined to find a suitable replacement vocalist. Tim "Ripper" Owens, an Ohioan tribute band singer was chosen after a lengthy auditioning process and the band recorded 4 albums (2 studio, 2 live) with Owens.\r\n\r\nIn 2003, Judas Priest’s 1990 line-up was restored when Rob Halford returned to the group after rekindling the relationship during work on Judas Priest’s 4-CD career retrospective “Metalogy.” In 2004 the band played Ozzfest and released a CD of new studio material entitled Angel of Retribution and an accompanying live DVD in 2005, enjoying a successful world tour that year. This was followed by the 2CD concept album Nostradamus in 2008 and the release of its fifth live album in 2009.\r\n	2017-11-23 18:45:15.344514	2017-11-23 18:45:15.344514	16
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bands_id_seq', 60, true);


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
56	2017-11-23 18:25:19.092164	2017-11-23 18:25:19.092164	776b35448d2877049145bf9f2a32f7b938c3dd6e	image/jpeg	82269	2017-11-23 18:25:18.934239	Album	11
57	2017-11-23 18:25:31.25049	2017-11-23 18:25:31.25049	94c04cbf2ea221d53c4ca2c93c8228c39945a180	image/jpeg	170147	2017-11-23 18:25:31.058811	Album	12
58	2017-11-23 18:25:43.002336	2017-11-23 18:25:43.002336	e967961e987317a29a014abd0c2339766179c34a	image/jpeg	61314	2017-11-23 18:25:42.835023	Album	13
59	2017-11-23 18:25:54.010733	2017-11-23 18:25:54.010733	83bc8d97de6e16e901409ea9a9d18982bac472e7	image/jpeg	31261	2017-11-23 18:25:53.850995	Album	14
60	2017-11-23 18:26:05.094765	2017-11-23 18:26:05.094765	16f72167c03371e0d30dc71c61e94378f5294cf6	image/jpeg	170721	2017-11-23 18:26:04.916945	Album	15
61	2017-11-23 18:29:26.302178	2017-11-23 18:29:26.302178	bb1d4f4b4de8ed8abba4d25e8fc5cae22a79ceb5	image/jpeg	129444	2017-11-23 18:29:26.136206	Album	16
62	2017-11-23 18:29:37.996801	2017-11-23 18:29:37.996801	933fba0a286498d7934c642922e05b3d8e7a118b	image/jpeg	85209	2017-11-23 18:29:37.838441	Album	17
63	2017-11-23 18:29:49.056396	2017-11-23 18:29:49.056396	f4f148cdaad3f606dc6d484e47caca469a73958f	image/jpeg	272099	2017-11-23 18:29:48.866188	Album	18
64	2017-11-23 18:30:00.096533	2017-11-23 18:30:00.096533	ffd47237d7465f3a6679051ab4abc6c734c27cdd	image/jpeg	140830	2017-11-23 18:29:59.916212	Album	19
65	2017-11-23 18:30:11.145835	2017-11-23 18:30:11.145835	dc99860a79efb6b03d22f4c52bba4e1663fa4833	image/jpeg	115943	2017-11-23 18:30:10.979414	Album	20
66	2017-11-23 18:33:31.18573	2017-11-23 18:33:31.18573	f8aebe68df82729ac2d4c63fd2749ceaa316cff3	image/jpeg	106244	2017-11-23 18:33:31.011982	Album	21
67	2017-11-23 18:33:42.464486	2017-11-23 18:33:42.464486	4324921f652fced5b56dbbba5b26555be5b90248	image/jpeg	267467	2017-11-23 18:33:42.278353	Album	22
68	2017-11-23 18:33:54.229856	2017-11-23 18:33:54.229856	76a3761203a3b60b2800460539e2733f4a2337df	image/jpeg	109381	2017-11-23 18:33:54.05581	Album	23
69	2017-11-23 18:34:05.580227	2017-11-23 18:34:05.580227	4d3a2f8afbe2069798a023242f0dc53d39021b0b	image/jpeg	248457	2017-11-23 18:34:05.397667	Album	24
70	2017-11-23 18:34:57.977061	2017-11-23 18:34:57.977061	93e25bbc54d4c614f74ec51e6cf258de8b9c87e0	image/jpeg	197294	2017-11-23 18:34:57.805282	Album	25
71	2017-11-23 18:37:29.303858	2017-11-23 18:37:29.303858	36a6a1995e450dd70692dd2ea280e3ac1dcf2139	image/jpeg	153415	2017-11-23 18:37:29.110186	Album	26
72	2017-11-23 18:37:41.273478	2017-11-23 18:37:41.273478	2475df651566d8e2934c7a27dff920ab06315361	image/jpeg	101669	2017-11-23 18:37:41.100653	Album	27
73	2017-11-23 18:37:53.232665	2017-11-23 18:37:53.232665	e4c7835e697bb93179a09b36b6a74d7601fbc921	image/jpeg	168477	2017-11-23 18:37:53.058831	Album	28
74	2017-11-23 18:38:05.206399	2017-11-23 18:38:05.206399	7ad83b963b345c041b8e0f99fdbce21fbd87db18	image/jpeg	87428	2017-11-23 18:38:05.017096	Album	29
75	2017-11-23 18:38:16.163579	2017-11-23 18:38:16.163579	d14c1e0c1afedae6e2d41d02d8ae52b1abcea2bb	image/jpeg	210870	2017-11-23 18:38:15.979092	Album	30
76	2017-11-23 18:40:58.151808	2017-11-23 18:40:58.151808	e6882b5183a35fa5c0b0ad931f32504a9ad4c97c	image/jpeg	252721	2017-11-23 18:40:57.965406	Album	31
77	2017-11-23 18:41:09.056916	2017-11-23 18:41:09.056916	acb4710b6372d3652f3fa4454a3fbb2db61084aa	image/jpeg	157290	2017-11-23 18:41:08.883443	Album	32
78	2017-11-23 18:41:20.213205	2017-11-23 18:41:20.213205	c8d3ad8d852ef1a233ad64d467c8fd0c39a0e74c	image/jpeg	78231	2017-11-23 18:41:20.037126	Album	33
79	2017-11-23 18:41:31.050817	2017-11-23 18:41:31.050817	5a609c7f19aeda2908311276e35557eed15d0e26	image/jpeg	187184	2017-11-23 18:41:30.874249	Album	34
80	2017-11-23 18:41:43.07787	2017-11-23 18:41:43.07787	ff09a837dee51d9c8b46888fac88d31f4cae3025	image/jpeg	57259	2017-11-23 18:41:42.895217	Album	35
81	2017-11-23 18:44:29.577223	2017-11-23 18:44:29.577223	47da19a3aa94d5f95e32dd79ad7cc7257eea0533	image/jpeg	91980	2017-11-23 18:44:29.394554	Album	36
82	2017-11-23 18:44:41.396738	2017-11-23 18:44:41.396738	395ad6fbf859f13d1ad536dda1834d4a0ba64fc9	image/jpeg	217765	2017-11-23 18:44:41.198545	Album	37
83	2017-11-23 18:44:53.421153	2017-11-23 18:44:53.421153	f6a80cb4e8ae15d8358d8d7657ebfac8c3f7c1fc	image/jpeg	109544	2017-11-23 18:44:53.231827	Album	38
84	2017-11-23 18:45:05.525775	2017-11-23 18:45:05.525775	331ee10a3b70c1cde36b8795e58956698090954a	image/jpeg	140149	2017-11-23 18:45:05.345885	Album	39
85	2017-11-23 18:45:17.490052	2017-11-23 18:45:17.490052	e532c350221f015f4e6a878a1cbce7bf535c3ecc	image/jpeg	157398	2017-11-23 18:45:17.303432	Album	40
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('photos_id_seq', 85, true);


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
36	You Shook Me - 23/3/69 Top Gear	\N	2017-11-23 18:25:19.133571	2017-11-23 18:25:19.133571	1
37	I Can't Quit You Baby - 23/3/69 Top Gear	\N	2017-11-23 18:25:19.139256	2017-11-23 18:25:19.139256	1
38	Communication Breakdown - 22/6/69 Pop Sundae	\N	2017-11-23 18:25:19.142596	2017-11-23 18:25:19.142596	1
39	Dazed And Confused - 23/3/69 Top Gear	\N	2017-11-23 18:25:19.145967	2017-11-23 18:25:19.145967	1
40	The Girl I Love She Got Long Black Wavy Hair - 22/6/69 Pop Sundae	\N	2017-11-23 18:25:19.149381	2017-11-23 18:25:19.149381	1
41	What Is And What Should Never Be - 29/6/69 Top Gear	\N	2017-11-23 18:25:19.152486	2017-11-23 18:25:19.152486	1
42	Communication Breakdown - 29/6/69 Top Gear	\N	2017-11-23 18:25:19.155189	2017-11-23 18:25:19.155189	1
43	Travelling Riverside Blues - 29/6/69 Top Gear	\N	2017-11-23 18:25:19.158054	2017-11-23 18:25:19.158054	1
44	Whole Lotta Love - 29/6/69 Top Gear	\N	2017-11-23 18:25:19.161105	2017-11-23 18:25:19.161105	1
45	Somethin' Else - 22/6/69 Pop Sundae	\N	2017-11-23 18:25:19.163628	2017-11-23 18:25:19.163628	1
46	Communication Breakdown - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.16617	2017-11-23 18:25:19.16617	1
47	I Can't Quit You Baby - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.16874	2017-11-23 18:25:19.16874	1
48	You Shook Me - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.171419	2017-11-23 18:25:19.171419	1
49	How Many More Times - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.174013	2017-11-23 18:25:19.174013	1
50	Immigrant Song - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.17676	2017-11-23 18:25:19.17676	1
51	Heartbreaker - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.179334	2017-11-23 18:25:19.179334	1
52	Since I've Been Loving You - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.182045	2017-11-23 18:25:19.182045	1
53	Black Dog - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.184778	2017-11-23 18:25:19.184778	1
54	Dazed And Confused - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.187547	2017-11-23 18:25:19.187547	1
55	Stairway To Heaven - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.190483	2017-11-23 18:25:19.190483	1
56	Going To California - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.193978	2017-11-23 18:25:19.193978	1
57	That's The Way - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.197498	2017-11-23 18:25:19.197498	1
58	Whole Lotta Love (Medley) - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.200283	2017-11-23 18:25:19.200283	1
59	Thank You - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.202815	2017-11-23 18:25:19.202815	1
60	Communication Breakdown - 23/3/69 Top Gear	\N	2017-11-23 18:25:19.205284	2017-11-23 18:25:19.205284	1
61	What Is And What Should Never Be - 22/6/69 Pop Sundae	\N	2017-11-23 18:25:19.208552	2017-11-23 18:25:19.208552	1
62	Dazed And Confused - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.211428	2017-11-23 18:25:19.211428	1
63	White Summer - 10/8/69 Playhouse Theatre	\N	2017-11-23 18:25:19.214123	2017-11-23 18:25:19.214123	1
64	What Is And What Should Never Be - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.216815	2017-11-23 18:25:19.216815	1
65	Communication Breakdown - 1/4/71 Paris Theatre	\N	2017-11-23 18:25:19.219617	2017-11-23 18:25:19.219617	1
66	I Can't Quit You Baby - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:25:19.222486	2017-11-23 18:25:19.222486	1
67	You Shook Me - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:25:19.225287	2017-11-23 18:25:19.225287	1
68	Sunshine Woman - 14/4/69 Rhythm & Blues Session	\N	2017-11-23 18:25:19.228037	2017-11-23 18:25:19.228037	1
69	Twist And Shout - Live / Remastered	\N	2017-11-23 18:25:31.274169	2017-11-23 18:25:31.274169	1
70	She's A Woman - Live / Remastered	\N	2017-11-23 18:25:31.278202	2017-11-23 18:25:31.278202	1
71	Dizzy Miss Lizzy - Live / Remastered	\N	2017-11-23 18:25:31.282024	2017-11-23 18:25:31.282024	1
72	Ticket To Ride - Live / Remastered	\N	2017-11-23 18:25:31.287204	2017-11-23 18:25:31.287204	1
73	Can't Buy Me Love - Live / Remastered	\N	2017-11-23 18:25:31.291828	2017-11-23 18:25:31.291828	1
74	Things We Said Today - Live / Remastered	\N	2017-11-23 18:25:31.296177	2017-11-23 18:25:31.296177	1
75	Roll Over Beethoven - Live / Remastered	\N	2017-11-23 18:25:31.300454	2017-11-23 18:25:31.300454	1
76	Boys - Live / Remastered	\N	2017-11-23 18:25:31.305154	2017-11-23 18:25:31.305154	1
77	A Hard Day's Night - Live / Remastered	\N	2017-11-23 18:25:31.310475	2017-11-23 18:25:31.310475	1
78	Help! - Live / Remastered	\N	2017-11-23 18:25:31.315156	2017-11-23 18:25:31.315156	1
79	All My Loving - Live / Remastered	\N	2017-11-23 18:25:31.319776	2017-11-23 18:25:31.319776	1
80	She Loves You - Live / Remastered	\N	2017-11-23 18:25:31.324354	2017-11-23 18:25:31.324354	1
81	Long Tall Sally - Live / Remastered	\N	2017-11-23 18:25:31.328922	2017-11-23 18:25:31.328922	1
82	You Can't Do That - Live / Bonus Track	\N	2017-11-23 18:25:31.333435	2017-11-23 18:25:31.333435	1
83	I Want To Hold Your Hand - Live / Bonus Track	\N	2017-11-23 18:25:31.337155	2017-11-23 18:25:31.337155	1
84	Everybody’s Trying To Be My Baby - Live / Bonus Track	\N	2017-11-23 18:25:31.340924	2017-11-23 18:25:31.340924	1
85	Baby's In Black - Live / Bonus Track	\N	2017-11-23 18:25:31.345507	2017-11-23 18:25:31.345507	1
86	Side 1, Pt. 1: Things Left Unsaid	\N	2017-11-23 18:25:43.023426	2017-11-23 18:25:43.023426	1
87	Side 1, Pt. 2: It's What We Do	\N	2017-11-23 18:25:43.026989	2017-11-23 18:25:43.026989	1
88	Side 1, Pt. 3: Ebb And Flow	\N	2017-11-23 18:25:43.03059	2017-11-23 18:25:43.03059	1
89	Side 2, Pt. 1: Sum	\N	2017-11-23 18:25:43.034491	2017-11-23 18:25:43.034491	1
90	Side 2, Pt. 2: Skins	\N	2017-11-23 18:25:43.038491	2017-11-23 18:25:43.038491	1
91	Side 2, Pt. 3: Unsung	\N	2017-11-23 18:25:43.041926	2017-11-23 18:25:43.041926	1
92	Side 2, Pt. 4: Anisina	\N	2017-11-23 18:25:43.045002	2017-11-23 18:25:43.045002	1
93	Side 3, Pt. 1: The Lost Art Of Conversation	\N	2017-11-23 18:25:43.047587	2017-11-23 18:25:43.047587	1
94	Side 3, Pt. 2: On Noodle Street	\N	2017-11-23 18:25:43.050145	2017-11-23 18:25:43.050145	1
95	Side 3, Pt. 3: Night Light	\N	2017-11-23 18:25:43.053915	2017-11-23 18:25:43.053915	1
96	Side 3, Pt. 4: Allons-y (1)	\N	2017-11-23 18:25:43.057842	2017-11-23 18:25:43.057842	1
97	Side 3, Pt. 5: Autumn '68	\N	2017-11-23 18:25:43.062064	2017-11-23 18:25:43.062064	1
98	Side 3, Pt. 6: Allons-y (2)	\N	2017-11-23 18:25:43.066435	2017-11-23 18:25:43.066435	1
99	Side 3, Pt. 7: Talkin' Hawkin'	\N	2017-11-23 18:25:43.07067	2017-11-23 18:25:43.07067	1
100	Side 4, Pt. 1: Calling	\N	2017-11-23 18:25:43.075241	2017-11-23 18:25:43.075241	1
101	Side 4, Pt. 2: Eyes To Pearls	\N	2017-11-23 18:25:43.079809	2017-11-23 18:25:43.079809	1
102	Side 4, Pt. 3: Surfacing	\N	2017-11-23 18:25:43.084899	2017-11-23 18:25:43.084899	1
103	Side 4, Pt. 4: Louder Than Words	\N	2017-11-23 18:25:43.090721	2017-11-23 18:25:43.090721	1
104	TBS9	\N	2017-11-23 18:25:43.095417	2017-11-23 18:25:43.095417	1
105	TBS14	\N	2017-11-23 18:25:43.099941	2017-11-23 18:25:43.099941	1
106	Nervana	\N	2017-11-23 18:25:43.104293	2017-11-23 18:25:43.104293	1
107	My Fairy King - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.048469	2017-11-23 18:25:54.048469	1
108	Keep Yourself Alive - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.051215	2017-11-23 18:25:54.051215	1
109	Doing All Right - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.053596	2017-11-23 18:25:54.053596	1
110	Liar - BBC Session / February 5th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.056186	2017-11-23 18:25:54.056186	1
111	See What A Fool I've Been - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.058974	2017-11-23 18:25:54.058974	1
112	Keep Yourself Alive - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.062082	2017-11-23 18:25:54.062082	1
113	Liar - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.06514	2017-11-23 18:25:54.06514	1
198	Tush - Live from Chicago	\N	2017-11-23 18:29:49.138365	2017-11-23 18:29:49.138365	16
114	Son And Daughter - BBC Session / July 25th 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.069261	2017-11-23 18:25:54.069261	1
115	Ogre Battle - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.073575	2017-11-23 18:25:54.073575	1
116	Modern Times Rock 'n' Roll - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.078396	2017-11-23 18:25:54.078396	1
117	Great King Rat - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.082833	2017-11-23 18:25:54.082833	1
118	Son And Daughter - BBC Session / December 3rd 1973, Langham 1 Studio	\N	2017-11-23 18:25:54.086717	2017-11-23 18:25:54.086717	1
119	Modern Times Rock 'n' Roll - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:25:54.09096	2017-11-23 18:25:54.09096	1
120	Nevermore - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:25:54.095529	2017-11-23 18:25:54.095529	1
121	White Queen (As It Began) - BBC Session / April 3rd 1974, Langham 1 Studio	\N	2017-11-23 18:25:54.099616	2017-11-23 18:25:54.099616	1
122	Now I'm Here - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.103688	2017-11-23 18:25:54.103688	1
123	Stone Cold Crazy - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.107547	2017-11-23 18:25:54.107547	1
124	Flick Of The Wrist - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.111546	2017-11-23 18:25:54.111546	1
125	Tenement Funster - BBC Session / October 16th 1974, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.115491	2017-11-23 18:25:54.115491	1
126	We Will Rock You - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.11924	2017-11-23 18:25:54.11924	1
127	We Will Rock You (Fast) - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.123186	2017-11-23 18:25:54.123186	1
128	Spread Your Wings - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.127221	2017-11-23 18:25:54.127221	1
129	It's Late - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.131057	2017-11-23 18:25:54.131057	1
130	My Melancholy Blues - BBC Session / October 28th 1977, Maida Vale 4 Studio	\N	2017-11-23 18:25:54.134726	2017-11-23 18:25:54.134726	1
131	Rock or Bust	\N	2017-11-23 18:26:05.117605	2017-11-23 18:26:05.117605	1
132	Play Ball	\N	2017-11-23 18:26:05.120577	2017-11-23 18:26:05.120577	1
133	Rock the Blues Away	\N	2017-11-23 18:26:05.123131	2017-11-23 18:26:05.123131	1
134	Miss Adventure	\N	2017-11-23 18:26:05.125585	2017-11-23 18:26:05.125585	1
135	Dogs of War	\N	2017-11-23 18:26:05.128841	2017-11-23 18:26:05.128841	1
136	Got Some Rock & Roll Thunder	\N	2017-11-23 18:26:05.132434	2017-11-23 18:26:05.132434	1
137	Hard Times	\N	2017-11-23 18:26:05.135641	2017-11-23 18:26:05.135641	1
138	Baptism By Fire	\N	2017-11-23 18:26:05.138471	2017-11-23 18:26:05.138471	1
139	Rock the House	\N	2017-11-23 18:26:05.141422	2017-11-23 18:26:05.141422	1
140	Sweet Candy	\N	2017-11-23 18:26:05.144265	2017-11-23 18:26:05.144265	1
141	Emission Control	\N	2017-11-23 18:26:05.147142	2017-11-23 18:26:05.147142	1
142	Somebody's actiong like a child	\N	2017-11-23 18:29:26.344397	2017-11-23 18:29:26.344397	16
143	Wild about you	\N	2017-11-23 18:29:26.348547	2017-11-23 18:29:26.348547	16
144	The Bear	\N	2017-11-23 18:29:26.351425	2017-11-23 18:29:26.351425	16
145	Riding on the L & N	\N	2017-11-23 18:29:26.353941	2017-11-23 18:29:26.353941	16
146	Oh pretty woman	\N	2017-11-23 18:29:26.356568	2017-11-23 18:29:26.356568	16
147	Rolling with the Blues	\N	2017-11-23 18:29:26.359331	2017-11-23 18:29:26.359331	16
148	Room to move	\N	2017-11-23 18:29:26.362439	2017-11-23 18:29:26.362439	16
149	I ain't got you	\N	2017-11-23 18:29:26.365675	2017-11-23 18:29:26.365675	16
150	N.S.U.	\N	2017-11-23 18:29:38.035426	2017-11-23 18:29:38.035426	16
151	I Feel Free - Mono Version	\N	2017-11-23 18:29:38.039403	2017-11-23 18:29:38.039403	16
152	I'm So Glad - Stereo Mix	\N	2017-11-23 18:29:38.042235	2017-11-23 18:29:38.042235	16
153	Sunshine Of Your Love	\N	2017-11-23 18:29:38.044775	2017-11-23 18:29:38.044775	16
154	We're Going Wrong	\N	2017-11-23 18:29:38.047482	2017-11-23 18:29:38.047482	16
155	White Room	\N	2017-11-23 18:29:38.050381	2017-11-23 18:29:38.050381	16
156	Deserted Cities Of The Heart	\N	2017-11-23 18:29:38.053625	2017-11-23 18:29:38.053625	16
157	Doing That Scrapyard Thing	\N	2017-11-23 18:29:38.057016	2017-11-23 18:29:38.057016	16
158	Never Tell Your Mother She's Out Of Tune	\N	2017-11-23 18:29:38.060663	2017-11-23 18:29:38.060663	16
159	Rope Ladder To The Moon	\N	2017-11-23 18:29:38.064206	2017-11-23 18:29:38.064206	16
160	Theme For An Imaginary Western	\N	2017-11-23 18:29:38.067108	2017-11-23 18:29:38.067108	16
161	Weird Of Hermiston	\N	2017-11-23 18:29:38.069885	2017-11-23 18:29:38.069885	16
162	Folk Song	\N	2017-11-23 18:29:38.072853	2017-11-23 18:29:38.072853	16
163	Can You Follow	\N	2017-11-23 18:29:38.075532	2017-11-23 18:29:38.075532	16
164	Morning Story	\N	2017-11-23 18:29:38.078591	2017-11-23 18:29:38.078591	16
165	You Burned The Tables On Me	\N	2017-11-23 18:29:38.081489	2017-11-23 18:29:38.081489	16
166	Pieces Of Mind	\N	2017-11-23 18:29:38.084311	2017-11-23 18:29:38.084311	16
167	Running Through Our Hands	\N	2017-11-23 18:29:38.087369	2017-11-23 18:29:38.087369	16
168	Keep It Down	\N	2017-11-23 18:29:38.090143	2017-11-23 18:29:38.090143	16
169	Something To Live For	\N	2017-11-23 18:29:38.092887	2017-11-23 18:29:38.092887	16
170	Without A Word	\N	2017-11-23 18:29:38.095983	2017-11-23 18:29:38.095983	16
171	How's Tricks	\N	2017-11-23 18:29:38.09865	2017-11-23 18:29:38.09865	16
172	Childsong	\N	2017-11-23 18:29:38.101225	2017-11-23 18:29:38.101225	16
173	The Best Is Still To Come	\N	2017-11-23 18:29:38.103813	2017-11-23 18:29:38.103813	16
174	She's Moving On	\N	2017-11-23 18:29:38.106546	2017-11-23 18:29:38.106546	16
175	Jet Set Jewel	\N	2017-11-23 18:29:38.109197	2017-11-23 18:29:38.109197	16
176	Ships In The Night	\N	2017-11-23 18:29:38.112061	2017-11-23 18:29:38.112061	16
177	City Of Gold - Remastered 2002	\N	2017-11-23 18:29:38.114883	2017-11-23 18:29:38.114883	16
178	Waiting In The Wings - Remastered 2002	\N	2017-11-23 18:29:38.118302	2017-11-23 18:29:38.118302	16
179	Out Into The Fields	\N	2017-11-23 18:29:38.121008	2017-11-23 18:29:38.121008	16
180	The Night That Once Was Mine	\N	2017-11-23 18:29:38.123411	2017-11-23 18:29:38.123411	16
181	Candlelight	\N	2017-11-23 18:29:38.126047	2017-11-23 18:29:38.126047	16
182	Fields Of Forever	\N	2017-11-23 18:29:38.129188	2017-11-23 18:29:38.129188	16
183	Reach For The Night	\N	2017-11-23 18:29:38.132029	2017-11-23 18:29:38.132029	16
184	Don’t Look Now	\N	2017-11-23 18:29:38.136033	2017-11-23 18:29:38.136033	16
185	Got Me Under Pressure - Live from New York	\N	2017-11-23 18:29:49.078784	2017-11-23 18:29:49.078784	16
186	Beer Drinkers & Hell Raisers - Live from Las Vegas	\N	2017-11-23 18:29:49.082999	2017-11-23 18:29:49.082999	16
187	Cheap Sunglasses - Live from Paris	\N	2017-11-23 18:29:49.086987	2017-11-23 18:29:49.086987	16
188	Waitin For The Bus - Live from Nashville	\N	2017-11-23 18:29:49.091344	2017-11-23 18:29:49.091344	16
189	Jesus Just Left Chicago - Live from Nashville	\N	2017-11-23 18:29:49.09621	2017-11-23 18:29:49.09621	16
190	Legs - Live from Sao Paolo	\N	2017-11-23 18:29:49.102583	2017-11-23 18:29:49.102583	16
191	Sharp Dressed Man - Live from Los Angeles	\N	2017-11-23 18:29:49.107222	2017-11-23 18:29:49.107222	16
192	Rough Boy (feat. Jeff Beck) - Live from London	\N	2017-11-23 18:29:49.111737	2017-11-23 18:29:49.111737	16
193	Pincushion - Live from Berlin	\N	2017-11-23 18:29:49.116142	2017-11-23 18:29:49.116142	16
194	La Grange - Live from Dallas	\N	2017-11-23 18:29:49.120463	2017-11-23 18:29:49.120463	16
195	I'm Bad, I'm Nationwide - Live from Vancouver	\N	2017-11-23 18:29:49.124448	2017-11-23 18:29:49.124448	16
196	Tube Snake Boogie - Live from Rome	\N	2017-11-23 18:29:49.128477	2017-11-23 18:29:49.128477	16
197	Gimme All Your Lovin - Live from Houston	\N	2017-11-23 18:29:49.133209	2017-11-23 18:29:49.133209	16
199	Sixteen Tons (feat. Jeff Beck) - Live from London	\N	2017-11-23 18:29:49.143254	2017-11-23 18:29:49.143254	16
200	Pegasus	\N	2017-11-23 18:30:00.126225	2017-11-23 18:30:00.126225	16
201	Can't Take It With You	\N	2017-11-23 18:30:00.131743	2017-11-23 18:30:00.131743	16
202	Crazy Love	\N	2017-11-23 18:30:00.136832	2017-11-23 18:30:00.136832	16
203	Win, Lose Or Draw	\N	2017-11-23 18:30:00.141372	2017-11-23 18:30:00.141372	16
204	Can't Lose What You Never Had - Live	\N	2017-11-23 18:30:00.145713	2017-11-23 18:30:00.145713	16
205	Jessica - Unedited Version	\N	2017-11-23 18:30:00.150756	2017-11-23 18:30:00.150756	16
206	Southbound	\N	2017-11-23 18:30:00.15583	2017-11-23 18:30:00.15583	16
207	Ramblin' Man	\N	2017-11-23 18:30:00.160615	2017-11-23 18:30:00.160615	16
208	Wasted Words	\N	2017-11-23 18:30:00.165822	2017-11-23 18:30:00.165822	16
209	Little Martha	\N	2017-11-23 18:30:00.17022	2017-11-23 18:30:00.17022	16
210	Blue Sky	\N	2017-11-23 18:30:00.17432	2017-11-23 18:30:00.17432	16
211	Stand Back	\N	2017-11-23 18:30:00.178764	2017-11-23 18:30:00.178764	16
212	Melissa	\N	2017-11-23 18:30:00.183217	2017-11-23 18:30:00.183217	16
213	Ain't Wastin Time No More	\N	2017-11-23 18:30:00.18794	2017-11-23 18:30:00.18794	16
214	One Way Out - Live At The Fillmore East/1971	\N	2017-11-23 18:30:00.19256	2017-11-23 18:30:00.19256	16
215	Hot 'Lanta - Live At The Fillmore East/1971	\N	2017-11-23 18:30:00.196431	2017-11-23 18:30:00.196431	16
216	Statesboro Blues - Live At The Fillmore East/1971	\N	2017-11-23 18:30:00.20034	2017-11-23 18:30:00.20034	16
217	Hoochie Coochie Man	\N	2017-11-23 18:30:00.204559	2017-11-23 18:30:00.204559	16
218	Don't Keep Me Wonderin'	\N	2017-11-23 18:30:00.209203	2017-11-23 18:30:00.209203	16
219	Midnight Rider	\N	2017-11-23 18:30:00.214298	2017-11-23 18:30:00.214298	16
220	Revival	\N	2017-11-23 18:30:00.218551	2017-11-23 18:30:00.218551	16
221	Whipping Post	\N	2017-11-23 18:30:00.222644	2017-11-23 18:30:00.222644	16
222	Black Hearted Woman	\N	2017-11-23 18:30:00.227227	2017-11-23 18:30:00.227227	16
223	Don't Want You No More	\N	2017-11-23 18:30:00.231065	2017-11-23 18:30:00.231065	16
224	It's Not My Cross To Bear	\N	2017-11-23 18:30:00.234672	2017-11-23 18:30:00.234672	16
225	Dreams	\N	2017-11-23 18:30:00.238516	2017-11-23 18:30:00.238516	16
226	Trouble No More - Live At The Fillmore East/1971	\N	2017-11-23 18:30:00.242479	2017-11-23 18:30:00.242479	16
227	Come And Go Blues - Live At Watkins Glen/1973	\N	2017-11-23 18:30:00.246234	2017-11-23 18:30:00.246234	16
228	Zoot Suit	\N	2017-11-23 18:30:11.170203	2017-11-23 18:30:11.170203	16
229	I'm The Face	\N	2017-11-23 18:30:11.172946	2017-11-23 18:30:11.172946	16
230	I Can't Explain - Mono Version	\N	2017-11-23 18:30:11.1756	2017-11-23 18:30:11.1756	16
231	Bald Headed Woman - Mono Version	\N	2017-11-23 18:30:11.178208	2017-11-23 18:30:11.178208	16
232	Anyway, Anyhow, Anywhere - Mono Version	\N	2017-11-23 18:30:11.180589	2017-11-23 18:30:11.180589	16
233	Daddy Rolling Stone - Mono Version	\N	2017-11-23 18:30:11.18364	2017-11-23 18:30:11.18364	16
234	My Generation - Mono Version	\N	2017-11-23 18:30:11.187523	2017-11-23 18:30:11.187523	16
235	Shout And Shimmy	\N	2017-11-23 18:30:11.190089	2017-11-23 18:30:11.190089	16
236	Circles - Revised Mono Version	\N	2017-11-23 18:30:11.192729	2017-11-23 18:30:11.192729	16
237	Instant Party Mixture - Mono Version	\N	2017-11-23 18:30:11.19597	2017-11-23 18:30:11.19597	16
238	A Legal Matter - Mono Version	\N	2017-11-23 18:30:11.199617	2017-11-23 18:30:11.199617	16
239	The Kids Are Alright - Mono Version	\N	2017-11-23 18:30:11.202958	2017-11-23 18:30:11.202958	16
240	The Ox - Mono Version	\N	2017-11-23 18:30:11.20643	2017-11-23 18:30:11.20643	16
241	La-La-La-Lies - Mono Version	\N	2017-11-23 18:30:11.20931	2017-11-23 18:30:11.20931	16
242	The Good's Gone - Mono Version	\N	2017-11-23 18:30:11.216042	2017-11-23 18:30:11.216042	16
243	Substitute - Single Version	\N	2017-11-23 18:30:11.219037	2017-11-23 18:30:11.219037	16
244	Circles - Revised Second Mono Version	\N	2017-11-23 18:30:11.22337	2017-11-23 18:30:11.22337	16
245	Waltz For A Pig	\N	2017-11-23 18:30:11.227754	2017-11-23 18:30:11.227754	16
246	I'm A Boy - Mono Version	\N	2017-11-23 18:30:11.231771	2017-11-23 18:30:11.231771	16
247	In The City - Mono Version	\N	2017-11-23 18:30:11.235735	2017-11-23 18:30:11.235735	16
248	Disguises - Mono Version	\N	2017-11-23 18:30:11.239464	2017-11-23 18:30:11.239464	16
249	Batman - Mono Version	\N	2017-11-23 18:30:11.243113	2017-11-23 18:30:11.243113	16
250	Bucket T - Mono Version	\N	2017-11-23 18:30:11.24693	2017-11-23 18:30:11.24693	16
251	Barbara Ann - Mono Version	\N	2017-11-23 18:30:11.251009	2017-11-23 18:30:11.251009	16
252	Happy Jack - Single Version	\N	2017-11-23 18:30:11.254903	2017-11-23 18:30:11.254903	16
253	I've Been Away - Mono Version	\N	2017-11-23 18:30:11.258599	2017-11-23 18:30:11.258599	16
254	Pictures Of Lily	\N	2017-11-23 18:30:11.262624	2017-11-23 18:30:11.262624	16
255	Doctor, Doctor - Mono Version	\N	2017-11-23 18:30:11.267154	2017-11-23 18:30:11.267154	16
256	The Last Time	\N	2017-11-23 18:30:11.271225	2017-11-23 18:30:11.271225	16
257	Under My Thumb	\N	2017-11-23 18:30:11.275464	2017-11-23 18:30:11.275464	16
258	I Can See For Miles - Mono Version	\N	2017-11-23 18:30:11.279642	2017-11-23 18:30:11.279642	16
259	Someone's Coming	\N	2017-11-23 18:30:11.283877	2017-11-23 18:30:11.283877	16
260	Dogs	\N	2017-11-23 18:30:11.28874	2017-11-23 18:30:11.28874	16
261	Call Me Lightning	\N	2017-11-23 18:30:11.293905	2017-11-23 18:30:11.293905	16
262	Magic Bus - Edit Mono Version	\N	2017-11-23 18:30:11.298915	2017-11-23 18:30:11.298915	16
263	Dr Jekyll & Mr Hyde	\N	2017-11-23 18:30:11.303645	2017-11-23 18:30:11.303645	16
264	Pinball Wizard	\N	2017-11-23 18:30:11.308428	2017-11-23 18:30:11.308428	16
265	Dogs Part Two	\N	2017-11-23 18:30:11.313537	2017-11-23 18:30:11.313537	16
266	The Seeker - Edit	\N	2017-11-23 18:30:11.318251	2017-11-23 18:30:11.318251	16
267	Here For More	\N	2017-11-23 18:30:11.32232	2017-11-23 18:30:11.32232	16
268	Summertime Blues - Live At Leeds	\N	2017-11-23 18:30:11.326581	2017-11-23 18:30:11.326581	16
269	Heaven And Hell - Mono Version	\N	2017-11-23 18:30:11.330952	2017-11-23 18:30:11.330952	16
270	See Me, Feel Me - Single Version	\N	2017-11-23 18:30:11.335414	2017-11-23 18:30:11.335414	16
271	Overture	\N	2017-11-23 18:30:11.339617	2017-11-23 18:30:11.339617	16
272	Christmas - Edit	\N	2017-11-23 18:30:11.343765	2017-11-23 18:30:11.343765	16
273	I'm Free	\N	2017-11-23 18:30:11.348291	2017-11-23 18:30:11.348291	16
274	Won't Get Fooled Again - Single Version	\N	2017-11-23 18:30:11.353005	2017-11-23 18:30:11.353005	16
275	Don't Know Myself	\N	2017-11-23 18:30:11.357691	2017-11-23 18:30:11.357691	16
276	Let's See Action	\N	2017-11-23 18:30:11.36069	2017-11-23 18:30:11.36069	16
277	When I Was A Boy	\N	2017-11-23 18:30:11.363305	2017-11-23 18:30:11.363305	16
278	Somewhere Now	\N	2017-11-23 18:33:31.225991	2017-11-23 18:33:31.225991	16
279	Bang Bang	\N	2017-11-23 18:33:31.230344	2017-11-23 18:33:31.230344	16
280	Revolution Radio	\N	2017-11-23 18:33:31.234145	2017-11-23 18:33:31.234145	16
281	Say Goodbye	\N	2017-11-23 18:33:31.238082	2017-11-23 18:33:31.238082	16
282	Outlaws	\N	2017-11-23 18:33:31.241909	2017-11-23 18:33:31.241909	16
283	Bouncing Off the Wall	\N	2017-11-23 18:33:31.245719	2017-11-23 18:33:31.245719	16
284	Still Breathing	\N	2017-11-23 18:33:31.249624	2017-11-23 18:33:31.249624	16
285	Youngblood	\N	2017-11-23 18:33:31.253354	2017-11-23 18:33:31.253354	16
286	Too Dumb to Die	\N	2017-11-23 18:33:31.256966	2017-11-23 18:33:31.256966	16
287	Troubled Times	\N	2017-11-23 18:33:31.260496	2017-11-23 18:33:31.260496	16
288	Forever Now	\N	2017-11-23 18:33:31.263968	2017-11-23 18:33:31.263968	16
289	Ordinary World	\N	2017-11-23 18:33:31.267472	2017-11-23 18:33:31.267472	16
290	California Über Alles	\N	2017-11-23 18:33:42.489665	2017-11-23 18:33:42.489665	16
291	Police Truck	\N	2017-11-23 18:33:42.493658	2017-11-23 18:33:42.493658	16
292	Kill The Poor	\N	2017-11-23 18:33:42.496271	2017-11-23 18:33:42.496271	16
293	Holiday In Cambodia	\N	2017-11-23 18:33:42.499122	2017-11-23 18:33:42.499122	16
294	Nazi Punks Fuck Off	\N	2017-11-23 18:33:42.502586	2017-11-23 18:33:42.502586	16
295	Too Drunk To Fuck	\N	2017-11-23 18:33:42.505925	2017-11-23 18:33:42.505925	16
296	Viva Las Vegas	\N	2017-11-23 18:33:42.509666	2017-11-23 18:33:42.509666	16
297	Moon Over Marin	\N	2017-11-23 18:33:42.513049	2017-11-23 18:33:42.513049	16
298	Halloween	\N	2017-11-23 18:33:42.516095	2017-11-23 18:33:42.516095	16
299	MTV Get Off The Air	\N	2017-11-23 18:33:42.518815	2017-11-23 18:33:42.518815	16
300	Soup Is Good Food (Live)	\N	2017-11-23 18:33:42.521398	2017-11-23 18:33:42.521398	16
301	Jock-O-Rama (Live)	\N	2017-11-23 18:33:42.524327	2017-11-23 18:33:42.524327	16
302	Kosmo Vinyl Introduction - Live at Shea Stadium	\N	2017-11-23 18:33:54.254189	2017-11-23 18:33:54.254189	16
303	London Calling - Live at Shea Stadium	\N	2017-11-23 18:33:54.257694	2017-11-23 18:33:54.257694	16
304	Police on my Back - Live at Shea Stadium	\N	2017-11-23 18:33:54.261364	2017-11-23 18:33:54.261364	16
305	The Guns of Brixton - Live at Shea Stadium	\N	2017-11-23 18:33:54.264354	2017-11-23 18:33:54.264354	16
306	Tommy Gun - Live at Shea Stadium	\N	2017-11-23 18:33:54.26681	2017-11-23 18:33:54.26681	16
307	The Magnificent Seven - Live at Shea Stadium	\N	2017-11-23 18:33:54.269255	2017-11-23 18:33:54.269255	16
308	Armagideon Time - Live at Shea Stadium	\N	2017-11-23 18:33:54.271542	2017-11-23 18:33:54.271542	16
309	Magnificent Seven (Return) - Live at Shea Stadium	\N	2017-11-23 18:33:54.273945	2017-11-23 18:33:54.273945	16
310	Rock the Casbah - Live at Shea Stadium	\N	2017-11-23 18:33:54.277074	2017-11-23 18:33:54.277074	16
311	Train in Vain - Live at Shea Stadium	\N	2017-11-23 18:33:54.279927	2017-11-23 18:33:54.279927	16
312	Career Opportunities - Live at Shea Stadium	\N	2017-11-23 18:33:54.282818	2017-11-23 18:33:54.282818	16
313	Spanish Bombs - Live at Shea Stadium	\N	2017-11-23 18:33:54.285392	2017-11-23 18:33:54.285392	16
314	Clampdown - Live at Shea Stadium	\N	2017-11-23 18:33:54.288447	2017-11-23 18:33:54.288447	16
315	English Civil War - Live at Shea Stadium	\N	2017-11-23 18:33:54.291891	2017-11-23 18:33:54.291891	16
316	Should I Stay or Should I Go - Live at Shea Stadium	\N	2017-11-23 18:33:54.295485	2017-11-23 18:33:54.295485	16
317	I Fought the Law - Live at Shea Stadium	\N	2017-11-23 18:33:54.298841	2017-11-23 18:33:54.298841	16
318	The Devil's Rain	\N	2017-11-23 18:34:05.604197	2017-11-23 18:34:05.604197	16
319	Vivid Red	\N	2017-11-23 18:34:05.608043	2017-11-23 18:34:05.608043	16
320	Land of the Dead	\N	2017-11-23 18:34:05.61159	2017-11-23 18:34:05.61159	16
321	Curse of the Mummy's Hand	\N	2017-11-23 18:34:05.615706	2017-11-23 18:34:05.615706	16
322	Cold Day In Hell	\N	2017-11-23 18:34:05.620281	2017-11-23 18:34:05.620281	16
323	Dark Shadows	\N	2017-11-23 18:34:05.624874	2017-11-23 18:34:05.624874	16
324	Death Ray	\N	2017-11-23 18:34:05.629625	2017-11-23 18:34:05.629625	16
325	Shining	\N	2017-11-23 18:34:05.634178	2017-11-23 18:34:05.634178	16
326	American Psycho	\N	2017-11-23 18:34:05.63777	2017-11-23 18:34:05.63777	16
327	Dig Up Her Bones	\N	2017-11-23 18:34:05.640294	2017-11-23 18:34:05.640294	16
328	Scream!	\N	2017-11-23 18:34:05.643125	2017-11-23 18:34:05.643125	16
329	Helena	\N	2017-11-23 18:34:05.646476	2017-11-23 18:34:05.646476	16
330	Science Fiction/Double Feature	\N	2017-11-23 18:34:05.650119	2017-11-23 18:34:05.650119	16
331	Saturday Night	\N	2017-11-23 18:34:05.653645	2017-11-23 18:34:05.653645	16
332	Hark! The Herald Angels Sing	\N	2017-11-23 18:34:58.022122	2017-11-23 18:34:58.022122	16
333	O Come All Ye Faithful	\N	2017-11-23 18:34:58.025805	2017-11-23 18:34:58.025805	16
334	O Come, O Come Emmanuel	\N	2017-11-23 18:34:58.028642	2017-11-23 18:34:58.028642	16
335	White Christmas	\N	2017-11-23 18:34:58.03173	2017-11-23 18:34:58.03173	16
336	Little Drummer Boy	\N	2017-11-23 18:34:58.034545	2017-11-23 18:34:58.034545	16
337	God Rest Ye Merry Gentlemen	\N	2017-11-23 18:34:58.037418	2017-11-23 18:34:58.037418	16
338	What Child Is This?	\N	2017-11-23 18:34:58.040257	2017-11-23 18:34:58.040257	16
339	Angels We Have Heard On High	\N	2017-11-23 18:34:58.043193	2017-11-23 18:34:58.043193	16
340	American Jesus - Andy Wallace Mix	\N	2017-11-23 18:34:58.045937	2017-11-23 18:34:58.045937	16
341	Lonesome Valley	\N	2017-11-23 18:37:29.353677	2017-11-23 18:37:29.353677	16
342	The Poor Orphan Child	\N	2017-11-23 18:37:29.358074	2017-11-23 18:37:29.358074	16
343	Bury Me Under the Weeping Willow	\N	2017-11-23 18:37:29.362287	2017-11-23 18:37:29.362287	16
344	The Wandering Boy	\N	2017-11-23 18:37:29.36675	2017-11-23 18:37:29.36675	16
345	Wildwood Flower	\N	2017-11-23 18:37:29.372034	2017-11-23 18:37:29.372034	16
346	The Foggy Mountain Top	\N	2017-11-23 18:37:29.377078	2017-11-23 18:37:29.377078	16
347	The Cannon-Ball	\N	2017-11-23 18:37:29.382084	2017-11-23 18:37:29.382084	16
348	Worried Man Blues	\N	2017-11-23 18:37:29.386636	2017-11-23 18:37:29.386636	16
349	Engine One-Forty-Three	\N	2017-11-23 18:37:29.391348	2017-11-23 18:37:29.391348	16
350	Keep On the Sunny Side	\N	2017-11-23 18:37:29.395423	2017-11-23 18:37:29.395423	16
351	Sweet Fern	\N	2017-11-23 18:37:29.399916	2017-11-23 18:37:29.399916	16
352	John Hardy Was a Desperate Little Man	\N	2017-11-23 18:37:29.404251	2017-11-23 18:37:29.404251	16
353	Anchored in Love	\N	2017-11-23 18:37:29.408522	2017-11-23 18:37:29.408522	16
354	I Will Never Marry	\N	2017-11-23 18:37:29.413203	2017-11-23 18:37:29.413203	16
355	When the World's On Fire	\N	2017-11-23 18:37:29.417364	2017-11-23 18:37:29.417364	16
356	Blue Moon Of Kentucky	\N	2017-11-23 18:37:41.317515	2017-11-23 18:37:41.317515	16
357	Cheyenne	\N	2017-11-23 18:37:41.322163	2017-11-23 18:37:41.322163	16
358	Footprints in the Snow	\N	2017-11-23 18:37:41.326083	2017-11-23 18:37:41.326083	16
359	Raw Hide	\N	2017-11-23 18:37:41.329677	2017-11-23 18:37:41.329677	16
360	Little Cabin On The Hill	\N	2017-11-23 18:37:41.332932	2017-11-23 18:37:41.332932	16
361	Mule Skinner Blues	\N	2017-11-23 18:37:41.336161	2017-11-23 18:37:41.336161	16
362	Wait a Little Longer Please Jesus	\N	2017-11-23 18:37:41.340271	2017-11-23 18:37:41.340271	16
363	Alabama Waltz	\N	2017-11-23 18:37:41.344215	2017-11-23 18:37:41.344215	16
364	In The Pines	\N	2017-11-23 18:37:41.348379	2017-11-23 18:37:41.348379	16
365	Panhandle Country	\N	2017-11-23 18:37:41.352355	2017-11-23 18:37:41.352355	16
366	Im Working on a Building	\N	2017-11-23 18:37:41.356856	2017-11-23 18:37:41.356856	16
367	When the Cactus Is in Bloom	\N	2017-11-23 18:37:41.361231	2017-11-23 18:37:41.361231	16
368	Blue Moon of Kentucky - Alternate Version	\N	2017-11-23 18:37:41.365747	2017-11-23 18:37:41.365747	16
369	Brakemans Blues	\N	2017-11-23 18:37:41.370616	2017-11-23 18:37:41.370616	16
370	I Hope You Have Learned	\N	2017-11-23 18:37:41.375418	2017-11-23 18:37:41.375418	16
371	My Little Georgia Rose	\N	2017-11-23 18:37:41.379922	2017-11-23 18:37:41.379922	16
372	New Mule Skinner Blues	\N	2017-11-23 18:37:41.384596	2017-11-23 18:37:41.384596	16
373	Molly and Tenbrooks	\N	2017-11-23 18:37:41.389117	2017-11-23 18:37:41.389117	16
374	On And On	\N	2017-11-23 18:37:41.393885	2017-11-23 18:37:41.393885	16
375	Kentucky Waltz	\N	2017-11-23 18:37:41.398504	2017-11-23 18:37:41.398504	16
376	Pike County Breakdown	\N	2017-11-23 18:37:41.403071	2017-11-23 18:37:41.403071	16
377	Roanoke	\N	2017-11-23 18:37:41.407866	2017-11-23 18:37:41.407866	16
378	Rocky Road Blues	\N	2017-11-23 18:37:41.412796	2017-11-23 18:37:41.412796	16
379	Uncle Pen	\N	2017-11-23 18:37:41.417239	2017-11-23 18:37:41.417239	16
380	Im Blue Im Lonesome	\N	2017-11-23 18:37:41.421293	2017-11-23 18:37:41.421293	16
381	Get up John	\N	2017-11-23 18:37:41.425756	2017-11-23 18:37:41.425756	16
382	Memories of Mother and Dad	\N	2017-11-23 18:37:41.430438	2017-11-23 18:37:41.430438	16
383	Ain't Santa Cool	\N	2017-11-23 18:37:53.264492	2017-11-23 18:37:53.264492	16
384	Go Tell It On The Mountain	\N	2017-11-23 18:37:53.268935	2017-11-23 18:37:53.268935	16
385	Silent Night	\N	2017-11-23 18:37:53.273092	2017-11-23 18:37:53.273092	16
386	Why Can't Christmas Day Last All Year Long	\N	2017-11-23 18:37:53.277046	2017-11-23 18:37:53.277046	16
387	Away In A Manger	\N	2017-11-23 18:37:53.281444	2017-11-23 18:37:53.281444	16
388	Christmas Joy	\N	2017-11-23 18:37:53.286336	2017-11-23 18:37:53.286336	16
389	First Christmas Without Daddy	\N	2017-11-23 18:37:53.291172	2017-11-23 18:37:53.291172	16
390	Winter Wonderland	\N	2017-11-23 18:37:53.296073	2017-11-23 18:37:53.296073	16
391	Greatest Gift	\N	2017-11-23 18:37:53.300829	2017-11-23 18:37:53.300829	16
392	Jingle Bells	\N	2017-11-23 18:37:53.304452	2017-11-23 18:37:53.304452	16
393	Remember Me	\N	2017-11-23 18:37:53.308848	2017-11-23 18:37:53.308848	16
394	(I Wanna) Rock N Roll Guitar	\N	2017-11-23 18:37:53.312945	2017-11-23 18:37:53.312945	16
395	Christmas In Dixie - Unplugged	\N	2017-11-23 18:37:53.31713	2017-11-23 18:37:53.31713	16
396	Sure Could Use Some Christmas Around Here	\N	2017-11-23 18:37:53.320732	2017-11-23 18:37:53.320732	16
397	Auld Lang Syne	\N	2017-11-23 18:37:53.32407	2017-11-23 18:37:53.32407	16
398	The Friendly Beasts	\N	2017-11-23 18:38:05.229659	2017-11-23 18:38:05.229659	16
399	Silent Night	\N	2017-11-23 18:38:05.232641	2017-11-23 18:38:05.232641	16
400	Hark! the Herald Angels Sing	\N	2017-11-23 18:38:05.235016	2017-11-23 18:38:05.235016	16
401	Good Christian Men, Rejoice	\N	2017-11-23 18:38:05.23748	2017-11-23 18:38:05.23748	16
402	Deck the Halls	\N	2017-11-23 18:38:05.240052	2017-11-23 18:38:05.240052	16
403	While Shepherds Watched Their Flocks	\N	2017-11-23 18:38:05.242558	2017-11-23 18:38:05.242558	16
404	Away in a Manger	\N	2017-11-23 18:38:05.245048	2017-11-23 18:38:05.245048	16
405	O Little Town of Bethlehem	\N	2017-11-23 18:38:05.247599	2017-11-23 18:38:05.247599	16
406	Joy to the World	\N	2017-11-23 18:38:05.25134	2017-11-23 18:38:05.25134	16
407	It Came Upon a Midnight Clear	\N	2017-11-23 18:38:05.255094	2017-11-23 18:38:05.255094	16
408	O Come All Ye Faithful	\N	2017-11-23 18:38:05.258785	2017-11-23 18:38:05.258785	16
409	The First Noel	\N	2017-11-23 18:38:05.262463	2017-11-23 18:38:05.262463	16
410	Sweet Louisiana - Live	\N	2017-11-23 18:38:16.189583	2017-11-23 18:38:16.189583	16
411	Long Haired Country Boy - Live	\N	2017-11-23 18:38:16.192068	2017-11-23 18:38:16.192068	16
412	Trudy - Live	\N	2017-11-23 18:38:16.194546	2017-11-23 18:38:16.194546	16
413	Cumberland Mountain Number Nine - Live	\N	2017-11-23 18:38:16.197351	2017-11-23 18:38:16.197351	16
414	The South's Gonna Do It - Live	\N	2017-11-23 18:38:16.200529	2017-11-23 18:38:16.200529	16
415	Statesboro Blues - Live	\N	2017-11-23 18:38:16.20386	2017-11-23 18:38:16.20386	16
416	Street Corner Serenade - Live	\N	2017-11-23 18:38:16.206935	2017-11-23 18:38:16.206935	16
417	You and Me - Live	\N	2017-11-23 18:38:16.211022	2017-11-23 18:38:16.211022	16
418	Good Hearted Woman - Live	\N	2017-11-23 18:38:16.214368	2017-11-23 18:38:16.214368	16
419	Blues Medley - Live	\N	2017-11-23 18:38:16.218902	2017-11-23 18:38:16.218902	16
420	Will the Circle Be Unbroken - Live	\N	2017-11-23 18:38:16.223635	2017-11-23 18:38:16.223635	16
421	Sang Her Love Songs - Live	\N	2017-11-23 18:38:16.227081	2017-11-23 18:38:16.227081	16
422	Can't You See - Live	\N	2017-11-23 18:38:16.230632	2017-11-23 18:38:16.230632	16
423	Tennessee Waltz - Live	\N	2017-11-23 18:38:16.233528	2017-11-23 18:38:16.233528	16
424	Wu-Tang The Saga Continues Intro (feat. RZA)	\N	2017-11-23 18:40:58.189553	2017-11-23 18:40:58.189553	16
425	Lesson Learn'd (feat. Inspectah Deck and Redman)	\N	2017-11-23 18:40:58.195914	2017-11-23 18:40:58.195914	16
426	Fast and Furious (feat. Hue Hef and Raekwon)	\N	2017-11-23 18:40:58.200692	2017-11-23 18:40:58.200692	16
427	Famous Fighters (Skit)	\N	2017-11-23 18:40:58.206079	2017-11-23 18:40:58.206079	16
428	If Time Is Money (Fly Navigation) [feat. Method Man]	\N	2017-11-23 18:40:58.209879	2017-11-23 18:40:58.209879	16
429	Frozen (feat. Method Man, Killa Priest and Chris Rivers)	\N	2017-11-23 18:40:58.213503	2017-11-23 18:40:58.213503	16
430	Berto and the Fiend (Skit) [feat. Ghostface Killa]	\N	2017-11-23 18:40:58.215976	2017-11-23 18:40:58.215976	16
431	Pearl Harbor (feat. Ghostface Killah, Method Man, RZA and Sean Price)	\N	2017-11-23 18:40:58.218243	2017-11-23 18:40:58.218243	16
432	People Say (feat. Redman)	\N	2017-11-23 18:40:58.220707	2017-11-23 18:40:58.220707	16
433	Family (Skit)	\N	2017-11-23 18:40:58.223406	2017-11-23 18:40:58.223406	16
434	Why Why Why (feat. RZA and Swnkah)	\N	2017-11-23 18:40:58.226119	2017-11-23 18:40:58.226119	16
435	G'd up (feat. Method Man, R-Mean and Mzee Jones)	\N	2017-11-23 18:40:58.229167	2017-11-23 18:40:58.229167	16
436	If What You Say Is True (feat. Streetlife)	\N	2017-11-23 18:40:58.232151	2017-11-23 18:40:58.232151	16
437	Saga (Skit) [feat. RZA	\N	2017-11-23 18:40:58.2349	2017-11-23 18:40:58.2349	16
438	Hood Go Bang! (feat. Redman and Method Man)	\N	2017-11-23 18:40:58.237721	2017-11-23 18:40:58.237721	16
439	My Only One (feat. Ghostface Killah, RZA, Cappadonna, and Steven Latorre)	\N	2017-11-23 18:40:58.24074	2017-11-23 18:40:58.24074	16
440	Message	\N	2017-11-23 18:40:58.24372	2017-11-23 18:40:58.24372	16
441	The Saga Continues Outro (feat. RZA)	\N	2017-11-23 18:40:58.246757	2017-11-23 18:40:58.246757	16
442	Prelude	\N	2017-11-23 18:41:09.081065	2017-11-23 18:41:09.081065	16
443	Real Niggaz Don't Die	\N	2017-11-23 18:41:09.08527	2017-11-23 18:41:09.08527	16
444	Niggaz 4 Life	\N	2017-11-23 18:41:09.090234	2017-11-23 18:41:09.090234	16
445	Protest - Interlude	\N	2017-11-23 18:41:09.094213	2017-11-23 18:41:09.094213	16
446	Appetite For Destruction	\N	2017-11-23 18:41:09.098767	2017-11-23 18:41:09.098767	16
447	Don't Drink That Wine - Interlude	\N	2017-11-23 18:41:09.103365	2017-11-23 18:41:09.103365	16
448	Alwayz Into Somethin'	\N	2017-11-23 18:41:09.10828	2017-11-23 18:41:09.10828	16
449	Message To B.A. - Interlude	\N	2017-11-23 18:41:09.112642	2017-11-23 18:41:09.112642	16
450	Real Niggaz	\N	2017-11-23 18:41:09.116593	2017-11-23 18:41:09.116593	16
451	To Kill A Hooker - Interlude	\N	2017-11-23 18:41:09.12092	2017-11-23 18:41:09.12092	16
452	One Less Bitch	\N	2017-11-23 18:41:09.125513	2017-11-23 18:41:09.125513	16
453	Findum, Fuckum And Flee	\N	2017-11-23 18:41:09.130428	2017-11-23 18:41:09.130428	16
454	Automobile	\N	2017-11-23 18:41:09.13545	2017-11-23 18:41:09.13545	16
455	She Swallowed It	\N	2017-11-23 18:41:09.139845	2017-11-23 18:41:09.139845	16
456	I'd Rather Fuck You	\N	2017-11-23 18:41:09.144114	2017-11-23 18:41:09.144114	16
457	Approach To Danger	\N	2017-11-23 18:41:09.148543	2017-11-23 18:41:09.148543	16
458	1-900-2-COMPTON - Interlude	\N	2017-11-23 18:41:09.15305	2017-11-23 18:41:09.15305	16
459	The Dayz Of Wayback	\N	2017-11-23 18:41:09.156703	2017-11-23 18:41:09.156703	16
460	Intro	\N	2017-11-23 18:41:20.234705	2017-11-23 18:41:20.234705	16
461	It's Like That	\N	2017-11-23 18:41:20.237937	2017-11-23 18:41:20.237937	16
462	It's Tricky	\N	2017-11-23 18:41:20.241021	2017-11-23 18:41:20.241021	16
463	Medley - Rock Box / Sucker MC's / Freestyle / Here We Go / Beats To The Rhyme	\N	2017-11-23 18:41:20.24416	2017-11-23 18:41:20.24416	16
464	King Of Rock	\N	2017-11-23 18:41:20.247341	2017-11-23 18:41:20.247341	16
465	Interlude	\N	2017-11-23 18:41:20.250653	2017-11-23 18:41:20.250653	16
466	Mary Mary	\N	2017-11-23 18:41:20.25385	2017-11-23 18:41:20.25385	16
467	Walk This Way	\N	2017-11-23 18:41:20.257129	2017-11-23 18:41:20.257129	16
468	School Of Old	\N	2017-11-23 18:41:20.25992	2017-11-23 18:41:20.25992	16
469	It's Over	\N	2017-11-23 18:41:20.262724	2017-11-23 18:41:20.262724	16
470	Run's Freestyle	\N	2017-11-23 18:41:20.2655	2017-11-23 18:41:20.2655	16
471	Peter Piper	\N	2017-11-23 18:41:20.268182	2017-11-23 18:41:20.268182	16
472	Down With The King	\N	2017-11-23 18:41:20.270847	2017-11-23 18:41:20.270847	16
473	The Space Program	\N	2017-11-23 18:41:31.073584	2017-11-23 18:41:31.073584	16
474	We The People....	\N	2017-11-23 18:41:31.077784	2017-11-23 18:41:31.077784	16
475	Whateva Will Be	\N	2017-11-23 18:41:31.081414	2017-11-23 18:41:31.081414	16
476	Solid Wall of Sound	\N	2017-11-23 18:41:31.085641	2017-11-23 18:41:31.085641	16
477	Dis Generation	\N	2017-11-23 18:41:31.090445	2017-11-23 18:41:31.090445	16
478	Kids...	\N	2017-11-23 18:41:31.094921	2017-11-23 18:41:31.094921	16
479	Melatonin	\N	2017-11-23 18:41:31.098925	2017-11-23 18:41:31.098925	16
480	Enough!!	\N	2017-11-23 18:41:31.102795	2017-11-23 18:41:31.102795	16
481	Mobius	\N	2017-11-23 18:41:31.1068	2017-11-23 18:41:31.1068	16
482	Black Spasmodic	\N	2017-11-23 18:41:31.110717	2017-11-23 18:41:31.110717	16
483	The Killing Season	\N	2017-11-23 18:41:31.114572	2017-11-23 18:41:31.114572	16
484	Lost Somebody	\N	2017-11-23 18:41:31.11826	2017-11-23 18:41:31.11826	16
485	Movin Backwards	\N	2017-11-23 18:41:31.121957	2017-11-23 18:41:31.121957	16
486	Conrad Tokyo	\N	2017-11-23 18:41:31.125725	2017-11-23 18:41:31.125725	16
487	Ego	\N	2017-11-23 18:41:31.129813	2017-11-23 18:41:31.129813	16
488	The Donald	\N	2017-11-23 18:41:31.133054	2017-11-23 18:41:31.133054	16
489	Intro - Live	\N	2017-11-23 18:41:43.104145	2017-11-23 18:41:43.104145	16
490	Lost At Birth - Live	\N	2017-11-23 18:41:43.107036	2017-11-23 18:41:43.107036	16
491	Miuzi Weighs A Ton - Live	\N	2017-11-23 18:41:43.10953	2017-11-23 18:41:43.10953	16
492	Get Up Stand Up - Live	\N	2017-11-23 18:41:43.111942	2017-11-23 18:41:43.111942	16
493	Rebel Without A Pause - Live	\N	2017-11-23 18:41:43.114386	2017-11-23 18:41:43.114386	16
494	911 Is A Joke - Live	\N	2017-11-23 18:41:43.117056	2017-11-23 18:41:43.117056	16
495	Welcome To The Terrordome - Live	\N	2017-11-23 18:41:43.120048	2017-11-23 18:41:43.120048	16
496	Hoovermusic - Live	\N	2017-11-23 18:41:43.122808	2017-11-23 18:41:43.122808	16
497	Black Steel In The Hour / Do You Wanna Go Our Way - Live	\N	2017-11-23 18:41:43.125729	2017-11-23 18:41:43.125729	16
498	Show 'Em Whatcha Got - Live	\N	2017-11-23 18:41:43.128515	2017-11-23 18:41:43.128515	16
499	Bring The Noise - Live	\N	2017-11-23 18:41:43.131279	2017-11-23 18:41:43.131279	16
500	Don't Believe The Hype - Live	\N	2017-11-23 18:41:43.134346	2017-11-23 18:41:43.134346	16
501	Can't Truss It - Live	\N	2017-11-23 18:41:43.137717	2017-11-23 18:41:43.137717	16
502	He Got Game - Live	\N	2017-11-23 18:41:43.140644	2017-11-23 18:41:43.140644	16
503	Night Of The Living Baseheads - Live	\N	2017-11-23 18:41:43.143377	2017-11-23 18:41:43.143377	16
504	I Shall Not Be Moved - Live	\N	2017-11-23 18:41:43.146125	2017-11-23 18:41:43.146125	16
505	Fight The Power (Soul Power - Who Stole This Soul) - Live	\N	2017-11-23 18:41:43.148947	2017-11-23 18:41:43.148947	16
506	Can't Do Nuttin' For Ya Man - Live	\N	2017-11-23 18:41:43.151557	2017-11-23 18:41:43.151557	16
507	31 Flavors - Live	\N	2017-11-23 18:41:43.154353	2017-11-23 18:41:43.154353	16
508	Shut 'Em Down - Live	\N	2017-11-23 18:41:43.157084	2017-11-23 18:41:43.157084	16
509	Harder Than You Think - Live	\N	2017-11-23 18:41:43.159746	2017-11-23 18:41:43.159746	16
510	Hardwired	\N	2017-11-23 18:44:29.625177	2017-11-23 18:44:29.625177	16
511	Atlas, Rise!	\N	2017-11-23 18:44:29.629147	2017-11-23 18:44:29.629147	16
512	Now That We’re Dead	\N	2017-11-23 18:44:29.632128	2017-11-23 18:44:29.632128	16
513	Moth Into Flame	\N	2017-11-23 18:44:29.635562	2017-11-23 18:44:29.635562	16
514	Dream No More	\N	2017-11-23 18:44:29.639235	2017-11-23 18:44:29.639235	16
515	Halo On Fire	\N	2017-11-23 18:44:29.642621	2017-11-23 18:44:29.642621	16
516	Confusion	\N	2017-11-23 18:44:29.646037	2017-11-23 18:44:29.646037	16
517	ManUNkind	\N	2017-11-23 18:44:29.64885	2017-11-23 18:44:29.64885	16
518	Here Comes Revenge	\N	2017-11-23 18:44:29.651631	2017-11-23 18:44:29.651631	16
519	Am I Savage?	\N	2017-11-23 18:44:29.654738	2017-11-23 18:44:29.654738	16
520	Murder One	\N	2017-11-23 18:44:29.657723	2017-11-23 18:44:29.657723	16
521	Spit Out The Bone	\N	2017-11-23 18:44:29.66163	2017-11-23 18:44:29.66163	16
522	If Eternity Should Fail - Live at Qudos Bank Arena, Sydney, Australia - Friday 6th May 2016	\N	2017-11-23 18:44:41.42823	2017-11-23 18:44:41.42823	16
523	Speed of Light - Live at Grand Arena, GrandWest, Cape Town, South Africa - Wednesday 18th May 2016	\N	2017-11-23 18:44:41.432727	2017-11-23 18:44:41.432727	16
524	Wrathchild - Live at 3 Arena, Dublin, Ireland - Saturday 6th May 2017	\N	2017-11-23 18:44:41.437053	2017-11-23 18:44:41.437053	16
525	Children of the Damned - Live at Bell Center, Montreal, Canada - Friday 1st April 2016	\N	2017-11-23 18:44:41.441304	2017-11-23 18:44:41.441304	16
526	Death or Glory - Live at Wroclaw Stadium, Wroclaw, Poland - Sunday 3rd July 2016	\N	2017-11-23 18:44:41.445392	2017-11-23 18:44:41.445392	16
527	The Red and the Black - Live at Ryogoku Kokugikan, Tokyo, Japan - Thursday 21st April 2016	\N	2017-11-23 18:44:41.449492	2017-11-23 18:44:41.449492	16
528	The Trooper - Live at Estadio Jorge Magico Gonzalez, San Salvador, El Salvador - Sunday 6th March 2016	\N	2017-11-23 18:44:41.45379	2017-11-23 18:44:41.45379	16
529	Powerslave - Live at Plaza Dell'Unita D'Italia, Trieste, Italy - Tuesday 26th July 2016	\N	2017-11-23 18:44:41.457426	2017-11-23 18:44:41.457426	16
530	The Great Unknown - Live at MRA Arena, Newcastle, England - Sunday 14th May 2017	\N	2017-11-23 18:44:41.461592	2017-11-23 18:44:41.461592	16
531	The Book of Souls - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-23 18:44:41.465478	2017-11-23 18:44:41.465478	16
532	Fear of the Dark - Live at Arena Castelao, Fortaleza, Brazil - Thursday 24th March 2016	\N	2017-11-23 18:44:41.469872	2017-11-23 18:44:41.469872	16
533	Iron Maiden - Live at Estadio Velez Sarsfield, Buenos Aires, Argentina - Tuesday 15th March 2016	\N	2017-11-23 18:44:41.474632	2017-11-23 18:44:41.474632	16
534	The Number of the Beast - Live at Open Air Festival, Wacken, Germany - Thursday 4th August 2016	\N	2017-11-23 18:44:41.479193	2017-11-23 18:44:41.479193	16
535	Blood Brothers - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-23 18:44:41.48412	2017-11-23 18:44:41.48412	16
536	Wasted Years - Live at HSBC Arena, Rio De Janeiro, Brazil - Thursday 17th March 2016	\N	2017-11-23 18:44:41.488848	2017-11-23 18:44:41.488848	16
537	Black Sabbath - Live	\N	2017-11-23 18:44:53.452813	2017-11-23 18:44:53.452813	16
538	Fairies Wear Boots - Live	\N	2017-11-23 18:44:53.457018	2017-11-23 18:44:53.457018	16
539	Under The Sun / Every Day Comes And Goes - Live	\N	2017-11-23 18:44:53.461001	2017-11-23 18:44:53.461001	16
540	After Forever - Live	\N	2017-11-23 18:44:53.465722	2017-11-23 18:44:53.465722	16
541	Into The Void - Live	\N	2017-11-23 18:44:53.470705	2017-11-23 18:44:53.470705	16
542	Snowblind - Live	\N	2017-11-23 18:44:53.474288	2017-11-23 18:44:53.474288	16
543	Band Introductions - Live	\N	2017-11-23 18:44:53.478322	2017-11-23 18:44:53.478322	16
544	War Pigs - Live	\N	2017-11-23 18:44:53.482046	2017-11-23 18:44:53.482046	16
545	Behind The Wall Of Sleep - Live	\N	2017-11-23 18:44:53.484824	2017-11-23 18:44:53.484824	16
546	Bassically / N.I.B. - Live	\N	2017-11-23 18:44:53.487403	2017-11-23 18:44:53.487403	16
547	Hand Of Doom - Live	\N	2017-11-23 18:44:53.490054	2017-11-23 18:44:53.490054	16
548	Supernaut / Sabbath Bloody Sabbath / Megalomania - Live	\N	2017-11-23 18:44:53.492856	2017-11-23 18:44:53.492856	16
549	Rat Salad / Drum Solo - Live	\N	2017-11-23 18:44:53.495919	2017-11-23 18:44:53.495919	16
550	Iron Man - Live	\N	2017-11-23 18:44:53.498743	2017-11-23 18:44:53.498743	16
551	Dirty Women - Live	\N	2017-11-23 18:44:53.502425	2017-11-23 18:44:53.502425	16
552	Children Of The Grave - Live	\N	2017-11-23 18:44:53.505104	2017-11-23 18:44:53.505104	16
553	Paranoid - Live	\N	2017-11-23 18:44:53.507761	2017-11-23 18:44:53.507761	16
554	The Threat Is Real	\N	2017-11-23 18:45:05.549959	2017-11-23 18:45:05.549959	16
555	Dystopia	\N	2017-11-23 18:45:05.553825	2017-11-23 18:45:05.553825	16
556	Fatal Illusion	\N	2017-11-23 18:45:05.557363	2017-11-23 18:45:05.557363	16
557	Death From Within	\N	2017-11-23 18:45:05.55968	2017-11-23 18:45:05.55968	16
558	Bullet To The Brain	\N	2017-11-23 18:45:05.5618	2017-11-23 18:45:05.5618	16
559	Post American World	\N	2017-11-23 18:45:05.564527	2017-11-23 18:45:05.564527	16
560	Poisonous Shadows	\N	2017-11-23 18:45:05.566758	2017-11-23 18:45:05.566758	16
561	Look Who's Talking	\N	2017-11-23 18:45:05.569136	2017-11-23 18:45:05.569136	16
562	Conquer Or Die	\N	2017-11-23 18:45:05.571812	2017-11-23 18:45:05.571812	16
563	Lying In State	\N	2017-11-23 18:45:05.574281	2017-11-23 18:45:05.574281	16
564	The Emperor	\N	2017-11-23 18:45:05.577508	2017-11-23 18:45:05.577508	16
565	Last Dying Wish	\N	2017-11-23 18:45:05.580505	2017-11-23 18:45:05.580505	16
566	Foreign Policy	\N	2017-11-23 18:45:05.583498	2017-11-23 18:45:05.583498	16
567	Me Hate You	\N	2017-11-23 18:45:05.586411	2017-11-23 18:45:05.586411	16
568	The Threat Is Real - Live Detroit, MI	\N	2017-11-23 18:45:05.589149	2017-11-23 18:45:05.589149	16
569	Poisonous Shadows - Live Detroit, MI	\N	2017-11-23 18:45:05.591847	2017-11-23 18:45:05.591847	16
570	Dystopia - Live Detroit, MI	\N	2017-11-23 18:45:05.595069	2017-11-23 18:45:05.595069	16
571	Turbo Lover - Remastered	\N	2017-11-23 18:45:17.511868	2017-11-23 18:45:17.511868	16
572	Locked In - Remastered	\N	2017-11-23 18:45:17.514609	2017-11-23 18:45:17.514609	16
573	Private Property - Remastered	\N	2017-11-23 18:45:17.51695	2017-11-23 18:45:17.51695	16
574	Parental Guidance - Remastered	\N	2017-11-23 18:45:17.51939	2017-11-23 18:45:17.51939	16
575	Rock You All Around the World - Remastered	\N	2017-11-23 18:45:17.523067	2017-11-23 18:45:17.523067	16
576	Out in the Cold - Remastered	\N	2017-11-23 18:45:17.526914	2017-11-23 18:45:17.526914	16
577	Wild Nights, Hot & Crazy Days - Remastered	\N	2017-11-23 18:45:17.531406	2017-11-23 18:45:17.531406	16
578	Hot for Love - Remastered	\N	2017-11-23 18:45:17.536489	2017-11-23 18:45:17.536489	16
579	Reckless - Remastered	\N	2017-11-23 18:45:17.540904	2017-11-23 18:45:17.540904	16
580	Out in the Cold - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.544848	2017-11-23 18:45:17.544848	16
581	Locked In - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.548483	2017-11-23 18:45:17.548483	16
582	Heading Out to the Highway - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.552239	2017-11-23 18:45:17.552239	16
583	Metal Gods - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.556874	2017-11-23 18:45:17.556874	16
584	Breaking the Law - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.561452	2017-11-23 18:45:17.561452	16
585	Love Bites - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.565965	2017-11-23 18:45:17.565965	16
586	Some Heads Are Gonna Roll - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.569566	2017-11-23 18:45:17.569566	16
587	The Sentinel - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.573098	2017-11-23 18:45:17.573098	16
588	Private Property - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.57682	2017-11-23 18:45:17.57682	16
589	Desert Plains - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.580796	2017-11-23 18:45:17.580796	16
590	Rock You All Around the World - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.585136	2017-11-23 18:45:17.585136	16
591	The Hellion - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.589086	2017-11-23 18:45:17.589086	16
592	Electric Eye - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.593055	2017-11-23 18:45:17.593055	16
593	Turbo Lover - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.596823	2017-11-23 18:45:17.596823	16
594	Freewheel Burning - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.600655	2017-11-23 18:45:17.600655	16
595	Victim of Changes - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.604298	2017-11-23 18:45:17.604298	16
596	The Green Manalishi (With The Two Pronged Crown) - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.608753	2017-11-23 18:45:17.608753	16
597	Living After Midnight - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.613162	2017-11-23 18:45:17.613162	16
598	You've Got Another Thing Coming - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.617947	2017-11-23 18:45:17.617947	16
599	Hell Bent for Leather - Recorded at Kemper Arena in Kansas City	\N	2017-11-23 18:45:17.622281	2017-11-23 18:45:17.622281	16
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('songs_id_seq', 599, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY tracks (id, album_id, song_id, created_at, updated_at) FROM stdin;
44	11	36	2017-11-23 18:25:19.262917	2017-11-23 18:25:19.262917
45	11	37	2017-11-23 18:25:19.268159	2017-11-23 18:25:19.268159
46	11	38	2017-11-23 18:25:19.273065	2017-11-23 18:25:19.273065
47	11	39	2017-11-23 18:25:19.277952	2017-11-23 18:25:19.277952
48	11	40	2017-11-23 18:25:19.284683	2017-11-23 18:25:19.284683
49	11	41	2017-11-23 18:25:19.291022	2017-11-23 18:25:19.291022
50	11	42	2017-11-23 18:25:19.29677	2017-11-23 18:25:19.29677
51	11	43	2017-11-23 18:25:19.302744	2017-11-23 18:25:19.302744
52	11	44	2017-11-23 18:25:19.309102	2017-11-23 18:25:19.309102
53	11	45	2017-11-23 18:25:19.316303	2017-11-23 18:25:19.316303
54	11	46	2017-11-23 18:25:19.323632	2017-11-23 18:25:19.323632
55	11	47	2017-11-23 18:25:19.330093	2017-11-23 18:25:19.330093
56	11	48	2017-11-23 18:25:19.336168	2017-11-23 18:25:19.336168
57	11	49	2017-11-23 18:25:19.342225	2017-11-23 18:25:19.342225
58	11	50	2017-11-23 18:25:19.348142	2017-11-23 18:25:19.348142
59	11	51	2017-11-23 18:25:19.353763	2017-11-23 18:25:19.353763
60	11	52	2017-11-23 18:25:19.359538	2017-11-23 18:25:19.359538
61	11	53	2017-11-23 18:25:19.365641	2017-11-23 18:25:19.365641
62	11	54	2017-11-23 18:25:19.37225	2017-11-23 18:25:19.37225
63	11	55	2017-11-23 18:25:19.378514	2017-11-23 18:25:19.378514
64	11	56	2017-11-23 18:25:19.384682	2017-11-23 18:25:19.384682
65	11	57	2017-11-23 18:25:19.39057	2017-11-23 18:25:19.39057
66	11	58	2017-11-23 18:25:19.39912	2017-11-23 18:25:19.39912
67	11	59	2017-11-23 18:25:19.405391	2017-11-23 18:25:19.405391
68	11	60	2017-11-23 18:25:19.411828	2017-11-23 18:25:19.411828
69	11	61	2017-11-23 18:25:19.417844	2017-11-23 18:25:19.417844
70	11	62	2017-11-23 18:25:19.423735	2017-11-23 18:25:19.423735
71	11	63	2017-11-23 18:25:19.429242	2017-11-23 18:25:19.429242
72	11	64	2017-11-23 18:25:19.434655	2017-11-23 18:25:19.434655
73	11	65	2017-11-23 18:25:19.440679	2017-11-23 18:25:19.440679
74	11	66	2017-11-23 18:25:19.446162	2017-11-23 18:25:19.446162
75	11	67	2017-11-23 18:25:19.451777	2017-11-23 18:25:19.451777
76	11	68	2017-11-23 18:25:19.458423	2017-11-23 18:25:19.458423
77	12	69	2017-11-23 18:25:31.353632	2017-11-23 18:25:31.353632
78	12	70	2017-11-23 18:25:31.361032	2017-11-23 18:25:31.361032
79	12	71	2017-11-23 18:25:31.367434	2017-11-23 18:25:31.367434
80	12	72	2017-11-23 18:25:31.372914	2017-11-23 18:25:31.372914
81	12	73	2017-11-23 18:25:31.378113	2017-11-23 18:25:31.378113
82	12	74	2017-11-23 18:25:31.383644	2017-11-23 18:25:31.383644
83	12	75	2017-11-23 18:25:31.389269	2017-11-23 18:25:31.389269
84	12	76	2017-11-23 18:25:31.395169	2017-11-23 18:25:31.395169
85	12	77	2017-11-23 18:25:31.401863	2017-11-23 18:25:31.401863
86	12	78	2017-11-23 18:25:31.408153	2017-11-23 18:25:31.408153
87	12	79	2017-11-23 18:25:31.413784	2017-11-23 18:25:31.413784
88	12	80	2017-11-23 18:25:31.418566	2017-11-23 18:25:31.418566
89	12	81	2017-11-23 18:25:31.423177	2017-11-23 18:25:31.423177
90	12	82	2017-11-23 18:25:31.428021	2017-11-23 18:25:31.428021
91	12	83	2017-11-23 18:25:31.432768	2017-11-23 18:25:31.432768
92	12	84	2017-11-23 18:25:31.437749	2017-11-23 18:25:31.437749
93	12	85	2017-11-23 18:25:31.442413	2017-11-23 18:25:31.442413
94	13	86	2017-11-23 18:25:43.111684	2017-11-23 18:25:43.111684
95	13	87	2017-11-23 18:25:43.118413	2017-11-23 18:25:43.118413
96	13	88	2017-11-23 18:25:43.123931	2017-11-23 18:25:43.123931
97	13	89	2017-11-23 18:25:43.130424	2017-11-23 18:25:43.130424
98	13	90	2017-11-23 18:25:43.136054	2017-11-23 18:25:43.136054
99	13	91	2017-11-23 18:25:43.142326	2017-11-23 18:25:43.142326
100	13	92	2017-11-23 18:25:43.149748	2017-11-23 18:25:43.149748
101	13	93	2017-11-23 18:25:43.155769	2017-11-23 18:25:43.155769
102	13	94	2017-11-23 18:25:43.160907	2017-11-23 18:25:43.160907
103	13	95	2017-11-23 18:25:43.165684	2017-11-23 18:25:43.165684
104	13	96	2017-11-23 18:25:43.171431	2017-11-23 18:25:43.171431
105	13	97	2017-11-23 18:25:43.177484	2017-11-23 18:25:43.177484
106	13	98	2017-11-23 18:25:43.183636	2017-11-23 18:25:43.183636
107	13	99	2017-11-23 18:25:43.18985	2017-11-23 18:25:43.18985
108	13	100	2017-11-23 18:25:43.197387	2017-11-23 18:25:43.197387
109	13	101	2017-11-23 18:25:43.203934	2017-11-23 18:25:43.203934
110	13	102	2017-11-23 18:25:43.209924	2017-11-23 18:25:43.209924
111	13	103	2017-11-23 18:25:43.216819	2017-11-23 18:25:43.216819
112	13	104	2017-11-23 18:25:43.223451	2017-11-23 18:25:43.223451
113	13	105	2017-11-23 18:25:43.229574	2017-11-23 18:25:43.229574
114	13	106	2017-11-23 18:25:43.234085	2017-11-23 18:25:43.234085
115	14	107	2017-11-23 18:25:54.140604	2017-11-23 18:25:54.140604
116	14	108	2017-11-23 18:25:54.146407	2017-11-23 18:25:54.146407
117	14	109	2017-11-23 18:25:54.151841	2017-11-23 18:25:54.151841
118	14	110	2017-11-23 18:25:54.158307	2017-11-23 18:25:54.158307
119	14	111	2017-11-23 18:25:54.164322	2017-11-23 18:25:54.164322
120	14	112	2017-11-23 18:25:54.170136	2017-11-23 18:25:54.170136
121	14	113	2017-11-23 18:25:54.175896	2017-11-23 18:25:54.175896
122	14	114	2017-11-23 18:25:54.181605	2017-11-23 18:25:54.181605
123	14	115	2017-11-23 18:25:54.187238	2017-11-23 18:25:54.187238
124	14	116	2017-11-23 18:25:54.194135	2017-11-23 18:25:54.194135
125	14	117	2017-11-23 18:25:54.199973	2017-11-23 18:25:54.199973
126	14	118	2017-11-23 18:25:54.205613	2017-11-23 18:25:54.205613
127	14	119	2017-11-23 18:25:54.211826	2017-11-23 18:25:54.211826
128	14	120	2017-11-23 18:25:54.218164	2017-11-23 18:25:54.218164
129	14	121	2017-11-23 18:25:54.224525	2017-11-23 18:25:54.224525
130	14	122	2017-11-23 18:25:54.22915	2017-11-23 18:25:54.22915
131	14	123	2017-11-23 18:25:54.233695	2017-11-23 18:25:54.233695
132	14	124	2017-11-23 18:25:54.238348	2017-11-23 18:25:54.238348
133	14	125	2017-11-23 18:25:54.244009	2017-11-23 18:25:54.244009
134	14	126	2017-11-23 18:25:54.248393	2017-11-23 18:25:54.248393
135	14	127	2017-11-23 18:25:54.253426	2017-11-23 18:25:54.253426
136	14	128	2017-11-23 18:25:54.258077	2017-11-23 18:25:54.258077
137	14	129	2017-11-23 18:25:54.262663	2017-11-23 18:25:54.262663
138	14	130	2017-11-23 18:25:54.266922	2017-11-23 18:25:54.266922
139	15	131	2017-11-23 18:26:05.152138	2017-11-23 18:26:05.152138
140	15	132	2017-11-23 18:26:05.156495	2017-11-23 18:26:05.156495
141	15	133	2017-11-23 18:26:05.160555	2017-11-23 18:26:05.160555
142	15	134	2017-11-23 18:26:05.16468	2017-11-23 18:26:05.16468
143	15	135	2017-11-23 18:26:05.169435	2017-11-23 18:26:05.169435
144	15	136	2017-11-23 18:26:05.174292	2017-11-23 18:26:05.174292
145	15	137	2017-11-23 18:26:05.179124	2017-11-23 18:26:05.179124
146	15	138	2017-11-23 18:26:05.185385	2017-11-23 18:26:05.185385
147	15	139	2017-11-23 18:26:05.191713	2017-11-23 18:26:05.191713
148	15	140	2017-11-23 18:26:05.197455	2017-11-23 18:26:05.197455
149	15	141	2017-11-23 18:26:05.20318	2017-11-23 18:26:05.20318
150	16	142	2017-11-23 18:29:26.388256	2017-11-23 18:29:26.388256
151	16	143	2017-11-23 18:29:26.392435	2017-11-23 18:29:26.392435
152	16	144	2017-11-23 18:29:26.395961	2017-11-23 18:29:26.395961
153	16	145	2017-11-23 18:29:26.39993	2017-11-23 18:29:26.39993
154	16	146	2017-11-23 18:29:26.404383	2017-11-23 18:29:26.404383
155	16	147	2017-11-23 18:29:26.408615	2017-11-23 18:29:26.408615
156	16	148	2017-11-23 18:29:26.41306	2017-11-23 18:29:26.41306
157	16	149	2017-11-23 18:29:26.417485	2017-11-23 18:29:26.417485
158	17	150	2017-11-23 18:29:38.141958	2017-11-23 18:29:38.141958
159	17	151	2017-11-23 18:29:38.148131	2017-11-23 18:29:38.148131
160	17	152	2017-11-23 18:29:38.153738	2017-11-23 18:29:38.153738
161	17	153	2017-11-23 18:29:38.158999	2017-11-23 18:29:38.158999
162	17	154	2017-11-23 18:29:38.165304	2017-11-23 18:29:38.165304
163	17	155	2017-11-23 18:29:38.171423	2017-11-23 18:29:38.171423
164	17	156	2017-11-23 18:29:38.177194	2017-11-23 18:29:38.177194
165	17	157	2017-11-23 18:29:38.18352	2017-11-23 18:29:38.18352
166	17	158	2017-11-23 18:29:38.189445	2017-11-23 18:29:38.189445
167	17	159	2017-11-23 18:29:38.19549	2017-11-23 18:29:38.19549
168	17	160	2017-11-23 18:29:38.201942	2017-11-23 18:29:38.201942
169	17	161	2017-11-23 18:29:38.208008	2017-11-23 18:29:38.208008
170	17	162	2017-11-23 18:29:38.214175	2017-11-23 18:29:38.214175
171	17	163	2017-11-23 18:29:38.219739	2017-11-23 18:29:38.219739
172	17	164	2017-11-23 18:29:38.225174	2017-11-23 18:29:38.225174
173	17	165	2017-11-23 18:29:38.230767	2017-11-23 18:29:38.230767
174	17	166	2017-11-23 18:29:38.236844	2017-11-23 18:29:38.236844
175	17	167	2017-11-23 18:29:38.24241	2017-11-23 18:29:38.24241
176	17	168	2017-11-23 18:29:38.24801	2017-11-23 18:29:38.24801
177	17	169	2017-11-23 18:29:38.254469	2017-11-23 18:29:38.254469
178	17	170	2017-11-23 18:29:38.260507	2017-11-23 18:29:38.260507
179	17	171	2017-11-23 18:29:38.266582	2017-11-23 18:29:38.266582
180	17	172	2017-11-23 18:29:38.272844	2017-11-23 18:29:38.272844
181	17	173	2017-11-23 18:29:38.278886	2017-11-23 18:29:38.278886
182	17	174	2017-11-23 18:29:38.284742	2017-11-23 18:29:38.284742
183	17	175	2017-11-23 18:29:38.290147	2017-11-23 18:29:38.290147
184	17	176	2017-11-23 18:29:38.295611	2017-11-23 18:29:38.295611
185	17	177	2017-11-23 18:29:38.301098	2017-11-23 18:29:38.301098
186	17	178	2017-11-23 18:29:38.3063	2017-11-23 18:29:38.3063
187	17	179	2017-11-23 18:29:38.311825	2017-11-23 18:29:38.311825
188	17	180	2017-11-23 18:29:38.318375	2017-11-23 18:29:38.318375
189	17	181	2017-11-23 18:29:38.323728	2017-11-23 18:29:38.323728
190	17	182	2017-11-23 18:29:38.33009	2017-11-23 18:29:38.33009
191	17	183	2017-11-23 18:29:38.335733	2017-11-23 18:29:38.335733
192	17	184	2017-11-23 18:29:38.340815	2017-11-23 18:29:38.340815
193	18	185	2017-11-23 18:29:49.150963	2017-11-23 18:29:49.150963
194	18	186	2017-11-23 18:29:49.157889	2017-11-23 18:29:49.157889
195	18	187	2017-11-23 18:29:49.163594	2017-11-23 18:29:49.163594
196	18	188	2017-11-23 18:29:49.169687	2017-11-23 18:29:49.169687
197	18	189	2017-11-23 18:29:49.176701	2017-11-23 18:29:49.176701
198	18	190	2017-11-23 18:29:49.18364	2017-11-23 18:29:49.18364
199	18	191	2017-11-23 18:29:49.191003	2017-11-23 18:29:49.191003
200	18	192	2017-11-23 18:29:49.195553	2017-11-23 18:29:49.195553
201	18	193	2017-11-23 18:29:49.200125	2017-11-23 18:29:49.200125
202	18	194	2017-11-23 18:29:49.204768	2017-11-23 18:29:49.204768
203	18	195	2017-11-23 18:29:49.209072	2017-11-23 18:29:49.209072
204	18	196	2017-11-23 18:29:49.2132	2017-11-23 18:29:49.2132
205	18	197	2017-11-23 18:29:49.217515	2017-11-23 18:29:49.217515
206	18	198	2017-11-23 18:29:49.222468	2017-11-23 18:29:49.222468
207	18	199	2017-11-23 18:29:49.227056	2017-11-23 18:29:49.227056
208	19	200	2017-11-23 18:30:00.251888	2017-11-23 18:30:00.251888
209	19	201	2017-11-23 18:30:00.255729	2017-11-23 18:30:00.255729
210	19	202	2017-11-23 18:30:00.259456	2017-11-23 18:30:00.259456
211	19	203	2017-11-23 18:30:00.263449	2017-11-23 18:30:00.263449
212	19	204	2017-11-23 18:30:00.26895	2017-11-23 18:30:00.26895
213	19	205	2017-11-23 18:30:00.275042	2017-11-23 18:30:00.275042
214	19	206	2017-11-23 18:30:00.280328	2017-11-23 18:30:00.280328
215	19	207	2017-11-23 18:30:00.285067	2017-11-23 18:30:00.285067
216	19	208	2017-11-23 18:30:00.289623	2017-11-23 18:30:00.289623
217	19	209	2017-11-23 18:30:00.294787	2017-11-23 18:30:00.294787
218	19	210	2017-11-23 18:30:00.299727	2017-11-23 18:30:00.299727
219	19	211	2017-11-23 18:30:00.304741	2017-11-23 18:30:00.304741
220	19	212	2017-11-23 18:30:00.309695	2017-11-23 18:30:00.309695
221	19	213	2017-11-23 18:30:00.314427	2017-11-23 18:30:00.314427
222	19	214	2017-11-23 18:30:00.319169	2017-11-23 18:30:00.319169
223	19	215	2017-11-23 18:30:00.337907	2017-11-23 18:30:00.337907
224	19	216	2017-11-23 18:30:00.34323	2017-11-23 18:30:00.34323
225	19	217	2017-11-23 18:30:00.347909	2017-11-23 18:30:00.347909
226	19	218	2017-11-23 18:30:00.352115	2017-11-23 18:30:00.352115
227	19	219	2017-11-23 18:30:00.356263	2017-11-23 18:30:00.356263
228	19	220	2017-11-23 18:30:00.360663	2017-11-23 18:30:00.360663
229	19	221	2017-11-23 18:30:00.364974	2017-11-23 18:30:00.364974
230	19	222	2017-11-23 18:30:00.36952	2017-11-23 18:30:00.36952
231	19	223	2017-11-23 18:30:00.374379	2017-11-23 18:30:00.374379
232	19	224	2017-11-23 18:30:00.379411	2017-11-23 18:30:00.379411
233	19	225	2017-11-23 18:30:00.383228	2017-11-23 18:30:00.383228
234	19	226	2017-11-23 18:30:00.387659	2017-11-23 18:30:00.387659
235	19	227	2017-11-23 18:30:00.391615	2017-11-23 18:30:00.391615
236	20	228	2017-11-23 18:30:11.368227	2017-11-23 18:30:11.368227
237	20	229	2017-11-23 18:30:11.372514	2017-11-23 18:30:11.372514
238	20	230	2017-11-23 18:30:11.376749	2017-11-23 18:30:11.376749
239	20	231	2017-11-23 18:30:11.380993	2017-11-23 18:30:11.380993
240	20	232	2017-11-23 18:30:11.385149	2017-11-23 18:30:11.385149
241	20	233	2017-11-23 18:30:11.390231	2017-11-23 18:30:11.390231
242	20	234	2017-11-23 18:30:11.39535	2017-11-23 18:30:11.39535
243	20	235	2017-11-23 18:30:11.400307	2017-11-23 18:30:11.400307
244	20	236	2017-11-23 18:30:11.406008	2017-11-23 18:30:11.406008
245	20	237	2017-11-23 18:30:11.411336	2017-11-23 18:30:11.411336
246	20	238	2017-11-23 18:30:11.415773	2017-11-23 18:30:11.415773
247	20	239	2017-11-23 18:30:11.420217	2017-11-23 18:30:11.420217
248	20	240	2017-11-23 18:30:11.424619	2017-11-23 18:30:11.424619
249	20	241	2017-11-23 18:30:11.429224	2017-11-23 18:30:11.429224
250	20	242	2017-11-23 18:30:11.433827	2017-11-23 18:30:11.433827
251	20	243	2017-11-23 18:30:11.438349	2017-11-23 18:30:11.438349
252	20	244	2017-11-23 18:30:11.442821	2017-11-23 18:30:11.442821
253	20	245	2017-11-23 18:30:11.447618	2017-11-23 18:30:11.447618
254	20	246	2017-11-23 18:30:11.452496	2017-11-23 18:30:11.452496
255	20	247	2017-11-23 18:30:11.458096	2017-11-23 18:30:11.458096
256	20	248	2017-11-23 18:30:11.462993	2017-11-23 18:30:11.462993
257	20	249	2017-11-23 18:30:11.466964	2017-11-23 18:30:11.466964
258	20	250	2017-11-23 18:30:11.471202	2017-11-23 18:30:11.471202
259	20	251	2017-11-23 18:30:11.475695	2017-11-23 18:30:11.475695
260	20	252	2017-11-23 18:30:11.480303	2017-11-23 18:30:11.480303
261	20	253	2017-11-23 18:30:11.484831	2017-11-23 18:30:11.484831
262	20	254	2017-11-23 18:30:11.490297	2017-11-23 18:30:11.490297
263	20	255	2017-11-23 18:30:11.495795	2017-11-23 18:30:11.495795
264	20	256	2017-11-23 18:30:11.499993	2017-11-23 18:30:11.499993
265	20	257	2017-11-23 18:30:11.504115	2017-11-23 18:30:11.504115
266	20	258	2017-11-23 18:30:11.510006	2017-11-23 18:30:11.510006
267	20	259	2017-11-23 18:30:11.515953	2017-11-23 18:30:11.515953
268	20	260	2017-11-23 18:30:11.522834	2017-11-23 18:30:11.522834
269	20	261	2017-11-23 18:30:11.52902	2017-11-23 18:30:11.52902
270	20	262	2017-11-23 18:30:11.534852	2017-11-23 18:30:11.534852
271	20	263	2017-11-23 18:30:11.54057	2017-11-23 18:30:11.54057
272	20	264	2017-11-23 18:30:11.546184	2017-11-23 18:30:11.546184
273	20	265	2017-11-23 18:30:11.552011	2017-11-23 18:30:11.552011
274	20	266	2017-11-23 18:30:11.557861	2017-11-23 18:30:11.557861
275	20	267	2017-11-23 18:30:11.563839	2017-11-23 18:30:11.563839
276	20	268	2017-11-23 18:30:11.570169	2017-11-23 18:30:11.570169
277	20	269	2017-11-23 18:30:11.576802	2017-11-23 18:30:11.576802
278	20	270	2017-11-23 18:30:11.583706	2017-11-23 18:30:11.583706
279	20	271	2017-11-23 18:30:11.591443	2017-11-23 18:30:11.591443
280	20	272	2017-11-23 18:30:11.597587	2017-11-23 18:30:11.597587
281	20	273	2017-11-23 18:30:11.603791	2017-11-23 18:30:11.603791
282	20	274	2017-11-23 18:30:11.609402	2017-11-23 18:30:11.609402
283	20	275	2017-11-23 18:30:11.614877	2017-11-23 18:30:11.614877
284	20	276	2017-11-23 18:30:11.620832	2017-11-23 18:30:11.620832
285	20	277	2017-11-23 18:30:11.627149	2017-11-23 18:30:11.627149
286	21	278	2017-11-23 18:33:31.288605	2017-11-23 18:33:31.288605
287	21	279	2017-11-23 18:33:31.294077	2017-11-23 18:33:31.294077
288	21	280	2017-11-23 18:33:31.29992	2017-11-23 18:33:31.29992
289	21	281	2017-11-23 18:33:31.305308	2017-11-23 18:33:31.305308
290	21	282	2017-11-23 18:33:31.310679	2017-11-23 18:33:31.310679
291	21	283	2017-11-23 18:33:31.317201	2017-11-23 18:33:31.317201
292	21	284	2017-11-23 18:33:31.322239	2017-11-23 18:33:31.322239
293	21	285	2017-11-23 18:33:31.326469	2017-11-23 18:33:31.326469
294	21	286	2017-11-23 18:33:31.330627	2017-11-23 18:33:31.330627
295	21	287	2017-11-23 18:33:31.334682	2017-11-23 18:33:31.334682
296	21	288	2017-11-23 18:33:31.340173	2017-11-23 18:33:31.340173
297	21	289	2017-11-23 18:33:31.344808	2017-11-23 18:33:31.344808
298	22	290	2017-11-23 18:33:42.529275	2017-11-23 18:33:42.529275
299	22	291	2017-11-23 18:33:42.534682	2017-11-23 18:33:42.534682
300	22	292	2017-11-23 18:33:42.540276	2017-11-23 18:33:42.540276
301	22	293	2017-11-23 18:33:42.544933	2017-11-23 18:33:42.544933
302	22	294	2017-11-23 18:33:42.549608	2017-11-23 18:33:42.549608
303	22	295	2017-11-23 18:33:42.554258	2017-11-23 18:33:42.554258
304	22	296	2017-11-23 18:33:42.55924	2017-11-23 18:33:42.55924
305	22	297	2017-11-23 18:33:42.564466	2017-11-23 18:33:42.564466
306	22	298	2017-11-23 18:33:42.569507	2017-11-23 18:33:42.569507
307	22	299	2017-11-23 18:33:42.574121	2017-11-23 18:33:42.574121
308	22	300	2017-11-23 18:33:42.578037	2017-11-23 18:33:42.578037
309	22	301	2017-11-23 18:33:42.58248	2017-11-23 18:33:42.58248
310	23	302	2017-11-23 18:33:54.306253	2017-11-23 18:33:54.306253
311	23	303	2017-11-23 18:33:54.312302	2017-11-23 18:33:54.312302
312	23	304	2017-11-23 18:33:54.317725	2017-11-23 18:33:54.317725
313	23	305	2017-11-23 18:33:54.323477	2017-11-23 18:33:54.323477
314	23	306	2017-11-23 18:33:54.32895	2017-11-23 18:33:54.32895
315	23	307	2017-11-23 18:33:54.334912	2017-11-23 18:33:54.334912
316	23	308	2017-11-23 18:33:54.339223	2017-11-23 18:33:54.339223
317	23	309	2017-11-23 18:33:54.343563	2017-11-23 18:33:54.343563
318	23	310	2017-11-23 18:33:54.348041	2017-11-23 18:33:54.348041
319	23	311	2017-11-23 18:33:54.352627	2017-11-23 18:33:54.352627
320	23	312	2017-11-23 18:33:54.356893	2017-11-23 18:33:54.356893
321	23	313	2017-11-23 18:33:54.361415	2017-11-23 18:33:54.361415
322	23	314	2017-11-23 18:33:54.365914	2017-11-23 18:33:54.365914
323	23	315	2017-11-23 18:33:54.370388	2017-11-23 18:33:54.370388
324	23	316	2017-11-23 18:33:54.375166	2017-11-23 18:33:54.375166
325	23	317	2017-11-23 18:33:54.379937	2017-11-23 18:33:54.379937
326	24	318	2017-11-23 18:34:05.66015	2017-11-23 18:34:05.66015
327	24	319	2017-11-23 18:34:05.66657	2017-11-23 18:34:05.66657
328	24	320	2017-11-23 18:34:05.672793	2017-11-23 18:34:05.672793
329	24	321	2017-11-23 18:34:05.678608	2017-11-23 18:34:05.678608
330	24	322	2017-11-23 18:34:05.68414	2017-11-23 18:34:05.68414
331	24	323	2017-11-23 18:34:05.689815	2017-11-23 18:34:05.689815
332	24	324	2017-11-23 18:34:05.694445	2017-11-23 18:34:05.694445
333	24	325	2017-11-23 18:34:05.699004	2017-11-23 18:34:05.699004
334	24	326	2017-11-23 18:34:05.703838	2017-11-23 18:34:05.703838
335	24	327	2017-11-23 18:34:05.708416	2017-11-23 18:34:05.708416
336	24	328	2017-11-23 18:34:05.712899	2017-11-23 18:34:05.712899
337	24	329	2017-11-23 18:34:05.717773	2017-11-23 18:34:05.717773
338	24	330	2017-11-23 18:34:05.722835	2017-11-23 18:34:05.722835
339	24	331	2017-11-23 18:34:05.727441	2017-11-23 18:34:05.727441
340	25	332	2017-11-23 18:34:58.069301	2017-11-23 18:34:58.069301
341	25	333	2017-11-23 18:34:58.073974	2017-11-23 18:34:58.073974
342	25	334	2017-11-23 18:34:58.079297	2017-11-23 18:34:58.079297
343	25	335	2017-11-23 18:34:58.084427	2017-11-23 18:34:58.084427
344	25	336	2017-11-23 18:34:58.089407	2017-11-23 18:34:58.089407
345	25	337	2017-11-23 18:34:58.094158	2017-11-23 18:34:58.094158
346	25	338	2017-11-23 18:34:58.098627	2017-11-23 18:34:58.098627
347	25	339	2017-11-23 18:34:58.103666	2017-11-23 18:34:58.103666
348	25	340	2017-11-23 18:34:58.10847	2017-11-23 18:34:58.10847
349	26	341	2017-11-23 18:37:29.444517	2017-11-23 18:37:29.444517
350	26	342	2017-11-23 18:37:29.450505	2017-11-23 18:37:29.450505
351	26	343	2017-11-23 18:37:29.456446	2017-11-23 18:37:29.456446
352	26	344	2017-11-23 18:37:29.462525	2017-11-23 18:37:29.462525
353	26	345	2017-11-23 18:37:29.468927	2017-11-23 18:37:29.468927
354	26	346	2017-11-23 18:37:29.47581	2017-11-23 18:37:29.47581
355	26	347	2017-11-23 18:37:29.481925	2017-11-23 18:37:29.481925
356	26	348	2017-11-23 18:37:29.488241	2017-11-23 18:37:29.488241
357	26	349	2017-11-23 18:37:29.494889	2017-11-23 18:37:29.494889
358	26	350	2017-11-23 18:37:29.50069	2017-11-23 18:37:29.50069
359	26	351	2017-11-23 18:37:29.506166	2017-11-23 18:37:29.506166
360	26	352	2017-11-23 18:37:29.511497	2017-11-23 18:37:29.511497
361	26	353	2017-11-23 18:37:29.517128	2017-11-23 18:37:29.517128
362	26	354	2017-11-23 18:37:29.52218	2017-11-23 18:37:29.52218
363	26	355	2017-11-23 18:37:29.526867	2017-11-23 18:37:29.526867
364	27	356	2017-11-23 18:37:41.43853	2017-11-23 18:37:41.43853
365	27	357	2017-11-23 18:37:41.44529	2017-11-23 18:37:41.44529
366	27	358	2017-11-23 18:37:41.451373	2017-11-23 18:37:41.451373
367	27	359	2017-11-23 18:37:41.45734	2017-11-23 18:37:41.45734
368	27	360	2017-11-23 18:37:41.462968	2017-11-23 18:37:41.462968
369	27	361	2017-11-23 18:37:41.468836	2017-11-23 18:37:41.468836
370	27	362	2017-11-23 18:37:41.475063	2017-11-23 18:37:41.475063
371	27	363	2017-11-23 18:37:41.481075	2017-11-23 18:37:41.481075
372	27	364	2017-11-23 18:37:41.487832	2017-11-23 18:37:41.487832
373	27	365	2017-11-23 18:37:41.494362	2017-11-23 18:37:41.494362
374	27	366	2017-11-23 18:37:41.5025	2017-11-23 18:37:41.5025
375	27	367	2017-11-23 18:37:41.508252	2017-11-23 18:37:41.508252
376	27	368	2017-11-23 18:37:41.512478	2017-11-23 18:37:41.512478
377	27	369	2017-11-23 18:37:41.5169	2017-11-23 18:37:41.5169
378	27	370	2017-11-23 18:37:41.521243	2017-11-23 18:37:41.521243
379	27	371	2017-11-23 18:37:41.525755	2017-11-23 18:37:41.525755
380	27	372	2017-11-23 18:37:41.529893	2017-11-23 18:37:41.529893
381	27	373	2017-11-23 18:37:41.534558	2017-11-23 18:37:41.534558
382	27	374	2017-11-23 18:37:41.539292	2017-11-23 18:37:41.539292
383	27	375	2017-11-23 18:37:41.54426	2017-11-23 18:37:41.54426
384	27	376	2017-11-23 18:37:41.549267	2017-11-23 18:37:41.549267
385	27	377	2017-11-23 18:37:41.554478	2017-11-23 18:37:41.554478
386	27	378	2017-11-23 18:37:41.560298	2017-11-23 18:37:41.560298
387	27	379	2017-11-23 18:37:41.56623	2017-11-23 18:37:41.56623
388	27	380	2017-11-23 18:37:41.570992	2017-11-23 18:37:41.570992
389	27	381	2017-11-23 18:37:41.575775	2017-11-23 18:37:41.575775
390	27	382	2017-11-23 18:37:41.580503	2017-11-23 18:37:41.580503
391	28	383	2017-11-23 18:37:53.329576	2017-11-23 18:37:53.329576
392	28	384	2017-11-23 18:37:53.334829	2017-11-23 18:37:53.334829
393	28	385	2017-11-23 18:37:53.340115	2017-11-23 18:37:53.340115
394	28	386	2017-11-23 18:37:53.3449	2017-11-23 18:37:53.3449
395	28	387	2017-11-23 18:37:53.350409	2017-11-23 18:37:53.350409
396	28	388	2017-11-23 18:37:53.354924	2017-11-23 18:37:53.354924
397	28	389	2017-11-23 18:37:53.359826	2017-11-23 18:37:53.359826
398	28	390	2017-11-23 18:37:53.364698	2017-11-23 18:37:53.364698
399	28	391	2017-11-23 18:37:53.36953	2017-11-23 18:37:53.36953
400	28	392	2017-11-23 18:37:53.374514	2017-11-23 18:37:53.374514
401	28	393	2017-11-23 18:37:53.379769	2017-11-23 18:37:53.379769
402	28	394	2017-11-23 18:37:53.385422	2017-11-23 18:37:53.385422
403	28	395	2017-11-23 18:37:53.391023	2017-11-23 18:37:53.391023
404	28	396	2017-11-23 18:37:53.395961	2017-11-23 18:37:53.395961
405	28	397	2017-11-23 18:37:53.400685	2017-11-23 18:37:53.400685
406	29	398	2017-11-23 18:38:05.268086	2017-11-23 18:38:05.268086
407	29	399	2017-11-23 18:38:05.273358	2017-11-23 18:38:05.273358
408	29	400	2017-11-23 18:38:05.279102	2017-11-23 18:38:05.279102
409	29	401	2017-11-23 18:38:05.284495	2017-11-23 18:38:05.284495
410	29	402	2017-11-23 18:38:05.289569	2017-11-23 18:38:05.289569
411	29	403	2017-11-23 18:38:05.294784	2017-11-23 18:38:05.294784
412	29	404	2017-11-23 18:38:05.300159	2017-11-23 18:38:05.300159
413	29	405	2017-11-23 18:38:05.305262	2017-11-23 18:38:05.305262
414	29	406	2017-11-23 18:38:05.310673	2017-11-23 18:38:05.310673
415	29	407	2017-11-23 18:38:05.316986	2017-11-23 18:38:05.316986
416	29	408	2017-11-23 18:38:05.323464	2017-11-23 18:38:05.323464
417	29	409	2017-11-23 18:38:05.330391	2017-11-23 18:38:05.330391
418	30	410	2017-11-23 18:38:16.238334	2017-11-23 18:38:16.238334
419	30	411	2017-11-23 18:38:16.242748	2017-11-23 18:38:16.242748
420	30	412	2017-11-23 18:38:16.247173	2017-11-23 18:38:16.247173
421	30	413	2017-11-23 18:38:16.252085	2017-11-23 18:38:16.252085
422	30	414	2017-11-23 18:38:16.257845	2017-11-23 18:38:16.257845
423	30	415	2017-11-23 18:38:16.263849	2017-11-23 18:38:16.263849
424	30	416	2017-11-23 18:38:16.26964	2017-11-23 18:38:16.26964
425	30	417	2017-11-23 18:38:16.275215	2017-11-23 18:38:16.275215
426	30	418	2017-11-23 18:38:16.281335	2017-11-23 18:38:16.281335
427	30	419	2017-11-23 18:38:16.287526	2017-11-23 18:38:16.287526
428	30	420	2017-11-23 18:38:16.293155	2017-11-23 18:38:16.293155
429	30	421	2017-11-23 18:38:16.301498	2017-11-23 18:38:16.301498
430	30	422	2017-11-23 18:38:16.308222	2017-11-23 18:38:16.308222
431	30	423	2017-11-23 18:38:16.31309	2017-11-23 18:38:16.31309
432	31	424	2017-11-23 18:40:58.264708	2017-11-23 18:40:58.264708
433	31	425	2017-11-23 18:40:58.270393	2017-11-23 18:40:58.270393
434	31	426	2017-11-23 18:40:58.274697	2017-11-23 18:40:58.274697
435	31	427	2017-11-23 18:40:58.27947	2017-11-23 18:40:58.27947
436	31	428	2017-11-23 18:40:58.284305	2017-11-23 18:40:58.284305
437	31	429	2017-11-23 18:40:58.289042	2017-11-23 18:40:58.289042
438	31	430	2017-11-23 18:40:58.294211	2017-11-23 18:40:58.294211
439	31	431	2017-11-23 18:40:58.299257	2017-11-23 18:40:58.299257
440	31	432	2017-11-23 18:40:58.304081	2017-11-23 18:40:58.304081
441	31	433	2017-11-23 18:40:58.310137	2017-11-23 18:40:58.310137
442	31	434	2017-11-23 18:40:58.315348	2017-11-23 18:40:58.315348
443	31	435	2017-11-23 18:40:58.320161	2017-11-23 18:40:58.320161
444	31	436	2017-11-23 18:40:58.324611	2017-11-23 18:40:58.324611
445	31	437	2017-11-23 18:40:58.329	2017-11-23 18:40:58.329
446	31	438	2017-11-23 18:40:58.333527	2017-11-23 18:40:58.333527
447	31	439	2017-11-23 18:40:58.338413	2017-11-23 18:40:58.338413
448	31	440	2017-11-23 18:40:58.34534	2017-11-23 18:40:58.34534
449	31	441	2017-11-23 18:40:58.35054	2017-11-23 18:40:58.35054
450	32	442	2017-11-23 18:41:09.162284	2017-11-23 18:41:09.162284
451	32	443	2017-11-23 18:41:09.16701	2017-11-23 18:41:09.16701
452	32	444	2017-11-23 18:41:09.172185	2017-11-23 18:41:09.172185
453	32	445	2017-11-23 18:41:09.1765	2017-11-23 18:41:09.1765
454	32	446	2017-11-23 18:41:09.18157	2017-11-23 18:41:09.18157
455	32	447	2017-11-23 18:41:09.186498	2017-11-23 18:41:09.186498
456	32	448	2017-11-23 18:41:09.190778	2017-11-23 18:41:09.190778
457	32	449	2017-11-23 18:41:09.209499	2017-11-23 18:41:09.209499
458	32	450	2017-11-23 18:41:09.215022	2017-11-23 18:41:09.215022
459	32	451	2017-11-23 18:41:09.219349	2017-11-23 18:41:09.219349
460	32	452	2017-11-23 18:41:09.223121	2017-11-23 18:41:09.223121
461	32	453	2017-11-23 18:41:09.227145	2017-11-23 18:41:09.227145
462	32	454	2017-11-23 18:41:09.230871	2017-11-23 18:41:09.230871
463	32	455	2017-11-23 18:41:09.235069	2017-11-23 18:41:09.235069
464	32	456	2017-11-23 18:41:09.239842	2017-11-23 18:41:09.239842
465	32	457	2017-11-23 18:41:09.244529	2017-11-23 18:41:09.244529
466	32	458	2017-11-23 18:41:09.249028	2017-11-23 18:41:09.249028
467	32	459	2017-11-23 18:41:09.25362	2017-11-23 18:41:09.25362
468	33	460	2017-11-23 18:41:20.2752	2017-11-23 18:41:20.2752
469	33	461	2017-11-23 18:41:20.279005	2017-11-23 18:41:20.279005
470	33	462	2017-11-23 18:41:20.283163	2017-11-23 18:41:20.283163
471	33	463	2017-11-23 18:41:20.287784	2017-11-23 18:41:20.287784
472	33	464	2017-11-23 18:41:20.292538	2017-11-23 18:41:20.292538
473	33	465	2017-11-23 18:41:20.296693	2017-11-23 18:41:20.296693
474	33	466	2017-11-23 18:41:20.30098	2017-11-23 18:41:20.30098
475	33	467	2017-11-23 18:41:20.305727	2017-11-23 18:41:20.305727
476	33	468	2017-11-23 18:41:20.310486	2017-11-23 18:41:20.310486
477	33	469	2017-11-23 18:41:20.315613	2017-11-23 18:41:20.315613
478	33	470	2017-11-23 18:41:20.320285	2017-11-23 18:41:20.320285
479	33	471	2017-11-23 18:41:20.324857	2017-11-23 18:41:20.324857
480	33	472	2017-11-23 18:41:20.329292	2017-11-23 18:41:20.329292
481	34	473	2017-11-23 18:41:31.138366	2017-11-23 18:41:31.138366
482	34	474	2017-11-23 18:41:31.142848	2017-11-23 18:41:31.142848
483	34	475	2017-11-23 18:41:31.147181	2017-11-23 18:41:31.147181
484	34	476	2017-11-23 18:41:31.151829	2017-11-23 18:41:31.151829
485	34	477	2017-11-23 18:41:31.156497	2017-11-23 18:41:31.156497
486	34	478	2017-11-23 18:41:31.161247	2017-11-23 18:41:31.161247
487	34	479	2017-11-23 18:41:31.168679	2017-11-23 18:41:31.168679
488	34	480	2017-11-23 18:41:31.173089	2017-11-23 18:41:31.173089
489	34	481	2017-11-23 18:41:31.177393	2017-11-23 18:41:31.177393
490	34	482	2017-11-23 18:41:31.181902	2017-11-23 18:41:31.181902
491	34	483	2017-11-23 18:41:31.186368	2017-11-23 18:41:31.186368
492	34	484	2017-11-23 18:41:31.191163	2017-11-23 18:41:31.191163
493	34	485	2017-11-23 18:41:31.195672	2017-11-23 18:41:31.195672
494	34	486	2017-11-23 18:41:31.200197	2017-11-23 18:41:31.200197
495	34	487	2017-11-23 18:41:31.204613	2017-11-23 18:41:31.204613
496	34	488	2017-11-23 18:41:31.208933	2017-11-23 18:41:31.208933
497	35	489	2017-11-23 18:41:43.16528	2017-11-23 18:41:43.16528
498	35	490	2017-11-23 18:41:43.171612	2017-11-23 18:41:43.171612
499	35	491	2017-11-23 18:41:43.177743	2017-11-23 18:41:43.177743
500	35	492	2017-11-23 18:41:43.183652	2017-11-23 18:41:43.183652
501	35	493	2017-11-23 18:41:43.18948	2017-11-23 18:41:43.18948
502	35	494	2017-11-23 18:41:43.196105	2017-11-23 18:41:43.196105
503	35	495	2017-11-23 18:41:43.202054	2017-11-23 18:41:43.202054
504	35	496	2017-11-23 18:41:43.208567	2017-11-23 18:41:43.208567
505	35	497	2017-11-23 18:41:43.214645	2017-11-23 18:41:43.214645
506	35	498	2017-11-23 18:41:43.220515	2017-11-23 18:41:43.220515
507	35	499	2017-11-23 18:41:43.226483	2017-11-23 18:41:43.226483
508	35	500	2017-11-23 18:41:43.232133	2017-11-23 18:41:43.232133
509	35	501	2017-11-23 18:41:43.237553	2017-11-23 18:41:43.237553
510	35	502	2017-11-23 18:41:43.243445	2017-11-23 18:41:43.243445
511	35	503	2017-11-23 18:41:43.249051	2017-11-23 18:41:43.249051
512	35	504	2017-11-23 18:41:43.254687	2017-11-23 18:41:43.254687
513	35	505	2017-11-23 18:41:43.260752	2017-11-23 18:41:43.260752
514	35	506	2017-11-23 18:41:43.266106	2017-11-23 18:41:43.266106
515	35	507	2017-11-23 18:41:43.27202	2017-11-23 18:41:43.27202
516	35	508	2017-11-23 18:41:43.277927	2017-11-23 18:41:43.277927
517	35	509	2017-11-23 18:41:43.284264	2017-11-23 18:41:43.284264
518	36	510	2017-11-23 18:44:29.689077	2017-11-23 18:44:29.689077
519	36	511	2017-11-23 18:44:29.695188	2017-11-23 18:44:29.695188
520	36	512	2017-11-23 18:44:29.700856	2017-11-23 18:44:29.700856
521	36	513	2017-11-23 18:44:29.706512	2017-11-23 18:44:29.706512
522	36	514	2017-11-23 18:44:29.71344	2017-11-23 18:44:29.71344
523	36	515	2017-11-23 18:44:29.720244	2017-11-23 18:44:29.720244
524	36	516	2017-11-23 18:44:29.72651	2017-11-23 18:44:29.72651
525	36	517	2017-11-23 18:44:29.732341	2017-11-23 18:44:29.732341
526	36	518	2017-11-23 18:44:29.738113	2017-11-23 18:44:29.738113
527	36	519	2017-11-23 18:44:29.74392	2017-11-23 18:44:29.74392
528	36	520	2017-11-23 18:44:29.749478	2017-11-23 18:44:29.749478
529	36	521	2017-11-23 18:44:29.755047	2017-11-23 18:44:29.755047
530	37	522	2017-11-23 18:44:41.496453	2017-11-23 18:44:41.496453
531	37	523	2017-11-23 18:44:41.505119	2017-11-23 18:44:41.505119
532	37	524	2017-11-23 18:44:41.510702	2017-11-23 18:44:41.510702
533	37	525	2017-11-23 18:44:41.516175	2017-11-23 18:44:41.516175
534	37	526	2017-11-23 18:44:41.52158	2017-11-23 18:44:41.52158
535	37	527	2017-11-23 18:44:41.527801	2017-11-23 18:44:41.527801
536	37	528	2017-11-23 18:44:41.533953	2017-11-23 18:44:41.533953
537	37	529	2017-11-23 18:44:41.538332	2017-11-23 18:44:41.538332
538	37	530	2017-11-23 18:44:41.542805	2017-11-23 18:44:41.542805
539	37	531	2017-11-23 18:44:41.547157	2017-11-23 18:44:41.547157
540	37	532	2017-11-23 18:44:41.551238	2017-11-23 18:44:41.551238
541	37	533	2017-11-23 18:44:41.555365	2017-11-23 18:44:41.555365
542	37	534	2017-11-23 18:44:41.559803	2017-11-23 18:44:41.559803
543	37	535	2017-11-23 18:44:41.565407	2017-11-23 18:44:41.565407
544	37	536	2017-11-23 18:44:41.570574	2017-11-23 18:44:41.570574
545	38	537	2017-11-23 18:44:53.514493	2017-11-23 18:44:53.514493
546	38	538	2017-11-23 18:44:53.520214	2017-11-23 18:44:53.520214
547	38	539	2017-11-23 18:44:53.525451	2017-11-23 18:44:53.525451
548	38	540	2017-11-23 18:44:53.544863	2017-11-23 18:44:53.544863
549	38	541	2017-11-23 18:44:53.54873	2017-11-23 18:44:53.54873
550	38	542	2017-11-23 18:44:53.553107	2017-11-23 18:44:53.553107
551	38	543	2017-11-23 18:44:53.557952	2017-11-23 18:44:53.557952
552	38	544	2017-11-23 18:44:53.562779	2017-11-23 18:44:53.562779
553	38	545	2017-11-23 18:44:53.567096	2017-11-23 18:44:53.567096
554	38	546	2017-11-23 18:44:53.571487	2017-11-23 18:44:53.571487
555	38	547	2017-11-23 18:44:53.575803	2017-11-23 18:44:53.575803
556	38	548	2017-11-23 18:44:53.580221	2017-11-23 18:44:53.580221
557	38	549	2017-11-23 18:44:53.585421	2017-11-23 18:44:53.585421
558	38	550	2017-11-23 18:44:53.590013	2017-11-23 18:44:53.590013
559	38	551	2017-11-23 18:44:53.59386	2017-11-23 18:44:53.59386
560	38	552	2017-11-23 18:44:53.597963	2017-11-23 18:44:53.597963
561	38	553	2017-11-23 18:44:53.601914	2017-11-23 18:44:53.601914
562	39	554	2017-11-23 18:45:05.599995	2017-11-23 18:45:05.599995
563	39	555	2017-11-23 18:45:05.604619	2017-11-23 18:45:05.604619
564	39	556	2017-11-23 18:45:05.611219	2017-11-23 18:45:05.611219
565	39	557	2017-11-23 18:45:05.616657	2017-11-23 18:45:05.616657
566	39	558	2017-11-23 18:45:05.621241	2017-11-23 18:45:05.621241
567	39	559	2017-11-23 18:45:05.62586	2017-11-23 18:45:05.62586
568	39	560	2017-11-23 18:45:05.630458	2017-11-23 18:45:05.630458
569	39	561	2017-11-23 18:45:05.634901	2017-11-23 18:45:05.634901
570	39	562	2017-11-23 18:45:05.639108	2017-11-23 18:45:05.639108
571	39	563	2017-11-23 18:45:05.643256	2017-11-23 18:45:05.643256
572	39	564	2017-11-23 18:45:05.647745	2017-11-23 18:45:05.647745
573	39	565	2017-11-23 18:45:05.652284	2017-11-23 18:45:05.652284
574	39	566	2017-11-23 18:45:05.657238	2017-11-23 18:45:05.657238
575	39	567	2017-11-23 18:45:05.662069	2017-11-23 18:45:05.662069
576	39	568	2017-11-23 18:45:05.666673	2017-11-23 18:45:05.666673
577	39	569	2017-11-23 18:45:05.67129	2017-11-23 18:45:05.67129
578	39	570	2017-11-23 18:45:05.675947	2017-11-23 18:45:05.675947
579	40	571	2017-11-23 18:45:17.629527	2017-11-23 18:45:17.629527
580	40	572	2017-11-23 18:45:17.637424	2017-11-23 18:45:17.637424
581	40	573	2017-11-23 18:45:17.643006	2017-11-23 18:45:17.643006
582	40	574	2017-11-23 18:45:17.648389	2017-11-23 18:45:17.648389
583	40	575	2017-11-23 18:45:17.653757	2017-11-23 18:45:17.653757
584	40	576	2017-11-23 18:45:17.659216	2017-11-23 18:45:17.659216
585	40	577	2017-11-23 18:45:17.664547	2017-11-23 18:45:17.664547
586	40	578	2017-11-23 18:45:17.66869	2017-11-23 18:45:17.66869
587	40	579	2017-11-23 18:45:17.672918	2017-11-23 18:45:17.672918
588	40	580	2017-11-23 18:45:17.677009	2017-11-23 18:45:17.677009
589	40	581	2017-11-23 18:45:17.681462	2017-11-23 18:45:17.681462
590	40	582	2017-11-23 18:45:17.685859	2017-11-23 18:45:17.685859
591	40	583	2017-11-23 18:45:17.690347	2017-11-23 18:45:17.690347
592	40	584	2017-11-23 18:45:17.694684	2017-11-23 18:45:17.694684
593	40	585	2017-11-23 18:45:17.698984	2017-11-23 18:45:17.698984
594	40	586	2017-11-23 18:45:17.703356	2017-11-23 18:45:17.703356
595	40	587	2017-11-23 18:45:17.707982	2017-11-23 18:45:17.707982
596	40	588	2017-11-23 18:45:17.712385	2017-11-23 18:45:17.712385
597	40	589	2017-11-23 18:45:17.716771	2017-11-23 18:45:17.716771
598	40	590	2017-11-23 18:45:17.72128	2017-11-23 18:45:17.72128
599	40	591	2017-11-23 18:45:17.726496	2017-11-23 18:45:17.726496
600	40	592	2017-11-23 18:45:17.731278	2017-11-23 18:45:17.731278
601	40	593	2017-11-23 18:45:17.735769	2017-11-23 18:45:17.735769
602	40	594	2017-11-23 18:45:17.74381	2017-11-23 18:45:17.74381
603	40	595	2017-11-23 18:45:17.748283	2017-11-23 18:45:17.748283
604	40	596	2017-11-23 18:45:17.75261	2017-11-23 18:45:17.75261
605	40	597	2017-11-23 18:45:17.756737	2017-11-23 18:45:17.756737
606	40	598	2017-11-23 18:45:17.762231	2017-11-23 18:45:17.762231
607	40	599	2017-11-23 18:45:17.766864	2017-11-23 18:45:17.766864
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('tracks_id_seq', 607, true);


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

