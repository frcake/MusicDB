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
11	Strange Days (50th Anniversary Expanded Edition) [Remastered]	2017-11-17	2017-11-20 18:16:53.684903	2017-11-20 18:16:53.684903	1	\N	31
12	Long Road Out Of Eden	2007-01-01	2017-11-20 18:17:09.47604	2017-11-20 18:17:09.47604	1	\N	32
13	One More For The Fans (Live)	2015-07-24	2017-11-20 18:17:25.31574	2017-11-20 18:17:25.31574	1	\N	33
14	Live Over Europe	2007-11-20	2017-11-20 18:17:48.503855	2017-11-20 18:17:48.503855	1	\N	34
15	Songs Of Innocence	2014-01-01	2017-11-20 18:18:06.843585	2017-11-20 18:18:06.843585	1	\N	35
16	Hardwired…To Self-Destruct	2016-11-18	2017-11-20 18:22:50.035134	2017-11-20 18:22:50.035134	8	\N	28
17	The Book Of Souls: Live Chapter	2017-11-17	2017-11-20 18:23:06.175451	2017-11-20 18:23:06.175451	8	\N	37
18	The End (Live)	2017-11-17	2017-11-20 18:23:24.367163	2017-11-20 18:23:24.367163	8	\N	38
19	Dystopia (Deluxe Edition)	2017-05-10	2017-11-20 18:23:39.254278	2017-11-20 18:23:39.254278	8	\N	39
20	Turbo 30 (Remastered 30th Anniversary Deluxe Edition)	2017-02-03	2017-11-20 18:23:53.790181	2017-11-20 18:23:53.790181	8	\N	40
21	Revolution Radio	2016-10-07	2017-11-20 18:39:04.639161	2017-11-20 18:39:04.639161	22	\N	41
22	Brain Drain/Adios Amigos	2003-03-03	2017-11-20 18:39:26.253858	2017-11-20 18:39:26.253858	22	\N	42
23	Milking The Sacred Cow	2007-10-09	2017-11-20 18:39:41.410225	2017-11-20 18:39:41.410225	22	\N	43
24	Live at Shea Stadium	\N	2017-11-20 18:40:00.812217	2017-11-20 18:40:00.812217	22	\N	44
25	DeA.D. Alive!	2013-01-22	2017-11-20 18:40:17.651652	2017-11-20 18:40:17.651652	22	\N	45
26	The Saga Continues	2017-10-13	2017-11-20 18:44:01.885962	2017-11-20 18:44:01.885962	2	\N	46
27	Efil4zaggin	1991-05-28	2017-11-20 18:44:22.702804	2017-11-20 18:44:22.702804	2	\N	47
28	LIVE AT MONTREUX 2001	2007-04-03	2017-11-20 18:44:43.843754	2017-11-20 18:44:43.843754	2	\N	48
29	We got it from Here... Thank You 4 Your service	2016-11-11	2017-11-20 18:45:00.970824	2017-11-20 18:45:00.970824	2	\N	49
30	Live From Metropolis Studios	2015-09-04	2017-11-20 18:45:19.335948	2017-11-20 18:45:19.335948	2	\N	50
31	American Epic: The Carter Family	2017-05-12	2017-11-20 18:54:48.765036	2017-11-20 18:54:48.765036	11	\N	51
32	Blue Moon Of Kentucky	2017-03-02	2017-11-20 18:55:12.243688	2017-11-20 18:55:12.243688	11	\N	52
33	On My Mind	2015-11-21	2017-11-20 18:55:19.218325	2017-11-20 18:55:19.218325	11	\N	53
34	American Christmas	2017-10-06	2017-11-20 18:55:25.587097	2017-11-20 18:55:25.587097	11	\N	54
35	Delicious Christmas	2016-10-21	2017-11-20 18:55:32.175943	2017-11-20 18:55:32.175943	11	\N	55
36	Live At Wembley Arena	2014-01-01	2017-11-20 18:58:51.52725	2017-11-20 18:58:51.52725	17	\N	56
37	This Is Where I Came In	2001-01-01	2017-11-20 18:58:59.621089	2017-11-20 18:58:59.621089	17	\N	57
38	Forever	2016-08-26	2017-11-20 18:59:05.520158	2017-11-20 18:59:05.520158	17	\N	58
39	1967 - Sunshine Tomorrow	2017-06-30	2017-11-20 18:59:13.082886	2017-11-20 18:59:13.082886	17	\N	59
40	Tango In the Night (Deluxe)	2017-03-31	2017-11-20 18:59:20.237312	2017-11-20 18:59:20.237312	17	\N	60
41	...And The Circus Leaves Town	1995-05-30	2017-11-20 19:01:46.631916	2017-11-20 19:01:46.631916	4	\N	25
42	California Crossing (1st Demo)	2017-07-27	2017-11-20 19:01:54.47761	2017-11-20 19:01:54.47761	4	\N	29
43	Villains	2017-08-25	2017-11-20 19:02:04.218249	2017-11-20 19:02:04.218249	4	\N	63
44	Full Fathom Five Audio Field Recordings (Live)	2016-09-16	2017-11-20 19:02:13.039809	2017-11-20 19:02:13.039809	4	\N	64
45	Cobras And Fire (The Mastermind Redux)	2015-10-02	2017-11-20 19:02:19.676323	2017-11-20 19:02:19.676323	4	\N	26
46	The Whole of the Law	2016-10-28	2017-11-20 19:10:05.867704	2017-11-20 19:10:05.867704	10	\N	66
47	Brute Force	2016-04-01	2017-11-20 19:10:11.931025	2017-11-20 19:10:11.931025	10	\N	67
48	Live in Germany 1988	2016-07-21	2017-11-20 19:16:40.726876	2017-11-20 19:16:40.726876	16	\N	71
49	Sunshine Of Your Love - A Life In Music	2015-10-09	2017-11-20 19:16:46.528939	2017-11-20 19:16:46.528939	16	\N	72
50	Live - Greatest Hits From Around The World	2016-09-09	2017-11-20 19:16:52.394803	2017-11-20 19:16:52.394803	16	\N	73
51	The Ultimate Collection	2017-04-21	2017-11-20 19:16:58.372579	2017-11-20 19:16:58.372579	16	\N	74
52	Maximum As & Bs	2017-10-27	2017-11-20 19:17:04.551954	2017-11-20 19:17:04.551954	16	\N	75
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('albums_id_seq', 52, true);


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
18	\N	\N	2017-11-20 18:16:43.425076	2017-11-20 18:16:43.425076	1	Jim Morrison
19	\N	\N	2017-11-20 18:16:43.429776	2017-11-20 18:16:43.429776	1	John Densmore
20	\N	\N	2017-11-20 18:16:43.43377	2017-11-20 18:16:43.43377	1	Ray Manzarek
21	\N	\N	2017-11-20 18:16:43.437742	2017-11-20 18:16:43.437742	1	Robby Krieger
22	\N	\N	2017-11-20 18:16:58.113149	2017-11-20 18:16:58.113149	1	Bernie Leadon
23	\N	\N	2017-11-20 18:16:58.119749	2017-11-20 18:16:58.119749	1	Don Felder
24	\N	\N	2017-11-20 18:16:58.123803	2017-11-20 18:16:58.123803	1	Don Henley
25	\N	\N	2017-11-20 18:16:58.128023	2017-11-20 18:16:58.128023	1	Glenn Frey
26	\N	\N	2017-11-20 18:16:58.1324	2017-11-20 18:16:58.1324	1	Joe Walsh
27	\N	\N	2017-11-20 18:16:58.136399	2017-11-20 18:16:58.136399	1	Randy Meisner
28	\N	\N	2017-11-20 18:16:58.139283	2017-11-20 18:16:58.139283	1	Timothy B. Schmit
29	\N	\N	2017-11-20 18:17:13.959837	2017-11-20 18:17:13.959837	1	Allen Collins
30	\N	\N	2017-11-20 18:17:13.964121	2017-11-20 18:17:13.964121	1	Artimus Pyle (2)
31	\N	\N	2017-11-20 18:17:13.967954	2017-11-20 18:17:13.967954	1	Billy Powell
32	\N	\N	2017-11-20 18:17:13.971858	2017-11-20 18:17:13.971858	1	Bob Burns (2)
33	\N	\N	2017-11-20 18:17:13.976051	2017-11-20 18:17:13.976051	1	Dale Krantz Rossington
34	\N	\N	2017-11-20 18:17:13.980535	2017-11-20 18:17:13.980535	1	Ean Evans
35	\N	\N	2017-11-20 18:17:13.984969	2017-11-20 18:17:13.984969	1	Ed King (2)
36	\N	\N	2017-11-20 18:17:13.989356	2017-11-20 18:17:13.989356	1	Gary Rossington
37	\N	\N	2017-11-20 18:17:13.993861	2017-11-20 18:17:13.993861	1	Greg T. Walker
38	\N	\N	2017-11-20 18:17:13.998382	2017-11-20 18:17:13.998382	1	Hughie Thomasson
39	\N	\N	2017-11-20 18:17:14.00378	2017-11-20 18:17:14.00378	1	Johnny Colt
40	\N	\N	2017-11-20 18:17:14.008371	2017-11-20 18:17:14.008371	1	Johnny Van Zant
41	\N	\N	2017-11-20 18:17:14.014141	2017-11-20 18:17:14.014141	1	Kurt Custer
42	\N	\N	2017-11-20 18:17:14.0198	2017-11-20 18:17:14.0198	1	Larry Junstrom
43	\N	\N	2017-11-20 18:17:14.024003	2017-11-20 18:17:14.024003	1	Leon Wilkeson
44	\N	\N	2017-11-20 18:17:14.028402	2017-11-20 18:17:14.028402	1	Mark Matejka
45	\N	\N	2017-11-20 18:17:14.032858	2017-11-20 18:17:14.032858	1	Michael Cartellone
46	\N	\N	2017-11-20 18:17:14.037013	2017-11-20 18:17:14.037013	1	Mike Estes
47	\N	\N	2017-11-20 18:17:14.041241	2017-11-20 18:17:14.041241	1	Owen Hale
48	\N	\N	2017-11-20 18:17:14.04614	2017-11-20 18:17:14.04614	1	Peter Pisarczyk
49	\N	\N	2017-11-20 18:17:14.05212	2017-11-20 18:17:14.05212	1	Randall Hall
50	\N	\N	2017-11-20 18:17:14.057937	2017-11-20 18:17:14.057937	1	Rick Medlocke
51	\N	\N	2017-11-20 18:17:14.062575	2017-11-20 18:17:14.062575	1	Robert Kearns
52	\N	\N	2017-11-20 18:17:14.066698	2017-11-20 18:17:14.066698	1	Ronnie Van Zant
53	\N	\N	2017-11-20 18:17:14.071278	2017-11-20 18:17:14.071278	1	Steve Gaines
54	\N	\N	2017-11-20 18:17:14.074719	2017-11-20 18:17:14.074719	1	Twowolf
55	\N	\N	2017-11-20 18:17:29.72826	2017-11-20 18:17:29.72826	1	Anthony Phillips
56	\N	\N	2017-11-20 18:17:29.731781	2017-11-20 18:17:29.731781	1	Chris Stewart (7)
57	\N	\N	2017-11-20 18:17:29.735161	2017-11-20 18:17:29.735161	1	John Mayhew
58	\N	\N	2017-11-20 18:17:29.738641	2017-11-20 18:17:29.738641	1	John Silver (2)
59	\N	\N	2017-11-20 18:17:29.741645	2017-11-20 18:17:29.741645	1	Mike Rutherford
60	\N	\N	2017-11-20 18:17:29.744496	2017-11-20 18:17:29.744496	1	Peter Gabriel
61	\N	\N	2017-11-20 18:17:29.747572	2017-11-20 18:17:29.747572	1	Phil Collins
62	\N	\N	2017-11-20 18:17:29.750381	2017-11-20 18:17:29.750381	1	Ray Wilson
63	\N	\N	2017-11-20 18:17:29.753376	2017-11-20 18:17:29.753376	1	Steve Hackett
64	\N	\N	2017-11-20 18:17:29.755956	2017-11-20 18:17:29.755956	1	Tony Banks
65	\N	\N	2017-11-20 18:17:53.760924	2017-11-20 18:17:53.760924	1	Adam Clayton
66	\N	\N	2017-11-20 18:17:53.766005	2017-11-20 18:17:53.766005	1	Dave Evans (4)
67	\N	\N	2017-11-20 18:17:53.770474	2017-11-20 18:17:53.770474	1	Larry Mullen
68	\N	\N	2017-11-20 18:17:53.775081	2017-11-20 18:17:53.775081	1	Paul Hewson
69	\N	\N	2017-11-20 18:22:26.853121	2017-11-20 18:22:26.853121	8	Cliff Burton
70	\N	\N	2017-11-20 18:22:26.858249	2017-11-20 18:22:26.858249	8	Dave Mustaine
71	\N	\N	2017-11-20 18:22:26.863254	2017-11-20 18:22:26.863254	8	James Hetfield
72	\N	\N	2017-11-20 18:22:26.867296	2017-11-20 18:22:26.867296	8	Jason Newsted
73	\N	\N	2017-11-20 18:22:26.871207	2017-11-20 18:22:26.871207	8	Kirk Hammett
74	\N	\N	2017-11-20 18:22:26.875348	2017-11-20 18:22:26.875348	8	Lars Ulrich
75	\N	\N	2017-11-20 18:22:26.879615	2017-11-20 18:22:26.879615	8	Lloyd Grant
76	\N	\N	2017-11-20 18:22:26.883737	2017-11-20 18:22:26.883737	8	Robert Trujillo
77	\N	\N	2017-11-20 18:22:26.888312	2017-11-20 18:22:26.888312	8	Ron McGovney
78	\N	\N	2017-11-20 18:22:55.373437	2017-11-20 18:22:55.373437	8	Adrian Smith (2)
79	\N	\N	2017-11-20 18:22:55.377211	2017-11-20 18:22:55.377211	8	Barry Graham (2)
80	\N	\N	2017-11-20 18:22:55.380515	2017-11-20 18:22:55.380515	8	Blaze Bayley
81	\N	\N	2017-11-20 18:22:55.383796	2017-11-20 18:22:55.383796	8	Bob Sawyer (3)
82	\N	\N	2017-11-20 18:22:55.386759	2017-11-20 18:22:55.386759	8	Bruce Dickinson
83	\N	\N	2017-11-20 18:22:55.389607	2017-11-20 18:22:55.389607	8	Clive Burr
84	\N	\N	2017-11-20 18:22:55.392327	2017-11-20 18:22:55.392327	8	Dave Murray (2)
85	\N	\N	2017-11-20 18:22:55.395241	2017-11-20 18:22:55.395241	8	Dennis Stratton
86	\N	\N	2017-11-20 18:22:55.397773	2017-11-20 18:22:55.397773	8	Dennis Willcock
87	\N	\N	2017-11-20 18:22:55.400275	2017-11-20 18:22:55.400275	8	Doug Sampson
88	\N	\N	2017-11-20 18:22:55.403007	2017-11-20 18:22:55.403007	8	Janick Gers
89	\N	\N	2017-11-20 18:22:55.405704	2017-11-20 18:22:55.405704	8	Nicko McBrain
90	\N	\N	2017-11-20 18:22:55.40835	2017-11-20 18:22:55.40835	8	Paul Cairns (2)
91	\N	\N	2017-11-20 18:22:55.410799	2017-11-20 18:22:55.410799	8	Paul Di'Anno
92	\N	\N	2017-11-20 18:22:55.414718	2017-11-20 18:22:55.414718	8	Paul Mario Day
93	\N	\N	2017-11-20 18:22:55.418226	2017-11-20 18:22:55.418226	8	Paul Todd (4)
94	\N	\N	2017-11-20 18:22:55.422286	2017-11-20 18:22:55.422286	8	Ron "Rebel" Matthews
95	\N	\N	2017-11-20 18:22:55.426407	2017-11-20 18:22:55.426407	8	Steve Harris
96	\N	\N	2017-11-20 18:22:55.431561	2017-11-20 18:22:55.431561	8	Terry Rance
97	\N	\N	2017-11-20 18:22:55.43589	2017-11-20 18:22:55.43589	8	Terry Wapram
98	\N	\N	2017-11-20 18:22:55.441136	2017-11-20 18:22:55.441136	8	Tony Hustings-Moore
99	\N	\N	2017-11-20 18:22:55.445885	2017-11-20 18:22:55.445885	8	Tony Parsons (3)
100	\N	\N	2017-11-20 18:23:10.534197	2017-11-20 18:23:10.534197	8	Anthony Philip Harford
101	\N	\N	2017-11-20 18:23:10.536916	2017-11-20 18:23:10.536916	8	Bev Bevan
102	\N	\N	2017-11-20 18:23:10.539401	2017-11-20 18:23:10.539401	8	Bill Ward
103	\N	\N	2017-11-20 18:23:10.54224	2017-11-20 18:23:10.54224	8	Bob Daisley
104	\N	\N	2017-11-20 18:23:10.54493	2017-11-20 18:23:10.54493	8	Bobby Rondinelli
105	\N	\N	2017-11-20 18:23:10.547593	2017-11-20 18:23:10.547593	8	Cozy Powell
106	\N	\N	2017-11-20 18:23:10.549889	2017-11-20 18:23:10.549889	8	Craig Gruber
107	\N	\N	2017-11-20 18:23:10.552129	2017-11-20 18:23:10.552129	8	Dave Spitz
108	\N	\N	2017-11-20 18:23:10.555589	2017-11-20 18:23:10.555589	8	Dave Walker (6)
109	\N	\N	2017-11-20 18:23:10.559378	2017-11-20 18:23:10.559378	8	Don Airey
110	\N	\N	2017-11-20 18:23:10.563415	2017-11-20 18:23:10.563415	8	Eric Singer
111	\N	\N	2017-11-20 18:23:10.56706	2017-11-20 18:23:10.56706	8	Geezer Butler
112	\N	\N	2017-11-20 18:23:10.570659	2017-11-20 18:23:10.570659	8	Geoff Nicholls
113	\N	\N	2017-11-20 18:23:10.574389	2017-11-20 18:23:10.574389	8	Gerald Woodruffe
114	\N	\N	2017-11-20 18:23:10.578607	2017-11-20 18:23:10.578607	8	Glenn Hughes
115	\N	\N	2017-11-20 18:23:10.58731	2017-11-20 18:23:10.58731	8	Gordon Copley
116	\N	\N	2017-11-20 18:23:10.591554	2017-11-20 18:23:10.591554	8	Ian Gillan
117	\N	\N	2017-11-20 18:23:10.595801	2017-11-20 18:23:10.595801	8	Jeff Fenholt
118	\N	\N	2017-11-20 18:23:10.599931	2017-11-20 18:23:10.599931	8	Jo Burt
119	\N	\N	2017-11-20 18:23:10.604475	2017-11-20 18:23:10.604475	8	Neil Murray
120	\N	\N	2017-11-20 18:23:10.608931	2017-11-20 18:23:10.608931	8	Ozzy Osbourne
121	\N	\N	2017-11-20 18:23:10.61343	2017-11-20 18:23:10.61343	8	Ray Gillen
122	\N	\N	2017-11-20 18:23:10.618089	2017-11-20 18:23:10.618089	8	Ronald Padavona
123	\N	\N	2017-11-20 18:23:10.622766	2017-11-20 18:23:10.622766	8	Terry Chimes
124	\N	\N	2017-11-20 18:23:10.627316	2017-11-20 18:23:10.627316	8	Tony Iommi
125	\N	\N	2017-11-20 18:23:10.63189	2017-11-20 18:23:10.63189	8	Vinny Appice
126	\N	\N	2017-11-20 18:23:28.572176	2017-11-20 18:23:28.572176	8	Al Pitrelli
127	\N	\N	2017-11-20 18:23:28.575896	2017-11-20 18:23:28.575896	8	Chris Adler
128	\N	\N	2017-11-20 18:23:28.579518	2017-11-20 18:23:28.579518	8	Chris Broderick
129	\N	\N	2017-11-20 18:23:28.582718	2017-11-20 18:23:28.582718	8	Chris Poland
130	\N	\N	2017-11-20 18:23:28.585888	2017-11-20 18:23:28.585888	8	Chuck Behler
131	\N	\N	2017-11-20 18:23:28.58926	2017-11-20 18:23:28.58926	8	Dave Mustaine
132	\N	\N	2017-11-20 18:23:28.591961	2017-11-20 18:23:28.591961	8	David Ellefson
133	\N	\N	2017-11-20 18:23:28.595225	2017-11-20 18:23:28.595225	8	Dijon Carruthers
134	\N	\N	2017-11-20 18:23:28.598669	2017-11-20 18:23:28.598669	8	Dirk Verbeuren
135	\N	\N	2017-11-20 18:23:28.601935	2017-11-20 18:23:28.601935	8	Gar Samuelson
136	\N	\N	2017-11-20 18:23:28.605298	2017-11-20 18:23:28.605298	8	Glen Drover
137	\N	\N	2017-11-20 18:23:28.608494	2017-11-20 18:23:28.608494	8	Greg Handevidt
138	\N	\N	2017-11-20 18:23:28.611613	2017-11-20 18:23:28.611613	8	James LoMenzo
139	\N	\N	2017-11-20 18:23:28.614891	2017-11-20 18:23:28.614891	8	James McDonough
140	\N	\N	2017-11-20 18:23:28.618175	2017-11-20 18:23:28.618175	8	Jay Reynolds (2)
141	\N	\N	2017-11-20 18:23:28.621498	2017-11-20 18:23:28.621498	8	Jeff Young (3)
142	\N	\N	2017-11-20 18:23:28.624298	2017-11-20 18:23:28.624298	8	Jimmy DeGrasso
143	\N	\N	2017-11-20 18:23:28.627155	2017-11-20 18:23:28.627155	8	Kerry King
144	\N	\N	2017-11-20 18:23:28.630142	2017-11-20 18:23:28.630142	8	Kiko Loureiro
145	\N	\N	2017-11-20 18:23:28.633123	2017-11-20 18:23:28.633123	8	Lee Rauch
146	\N	\N	2017-11-20 18:23:28.636043	2017-11-20 18:23:28.636043	8	Marty Friedman
147	\N	\N	2017-11-20 18:23:28.638779	2017-11-20 18:23:28.638779	8	Nick Menza
148	\N	\N	2017-11-20 18:23:28.641523	2017-11-20 18:23:28.641523	8	Shawn Drover
149	\N	\N	2017-11-20 18:23:43.454457	2017-11-20 18:23:43.454457	8	Alan Atkins
150	\N	\N	2017-11-20 18:23:43.458549	2017-11-20 18:23:43.458549	8	Alan Moore (2)
151	\N	\N	2017-11-20 18:23:43.46184	2017-11-20 18:23:43.46184	8	Dave Holland (2)
152	\N	\N	2017-11-20 18:23:43.465152	2017-11-20 18:23:43.465152	8	Glenn Tipton
153	\N	\N	2017-11-20 18:23:43.468223	2017-11-20 18:23:43.468223	8	Ian Hill (2)
154	\N	\N	2017-11-20 18:23:43.471663	2017-11-20 18:23:43.471663	8	John Hinch
155	\N	\N	2017-11-20 18:23:43.474788	2017-11-20 18:23:43.474788	8	K. K. Downing
156	\N	\N	2017-11-20 18:23:43.477863	2017-11-20 18:23:43.477863	8	Les Binks
157	\N	\N	2017-11-20 18:23:43.480688	2017-11-20 18:23:43.480688	8	Richie Faulkner
158	\N	\N	2017-11-20 18:23:43.483877	2017-11-20 18:23:43.483877	8	Ripper Owens
159	\N	\N	2017-11-20 18:23:43.486913	2017-11-20 18:23:43.486913	8	Rob Halford
160	\N	\N	2017-11-20 18:23:43.489885	2017-11-20 18:23:43.489885	8	Scott Travis
161	\N	\N	2017-11-20 18:38:51.572385	2017-11-20 18:38:51.572385	22	Billie Joe Armstrong
162	\N	\N	2017-11-20 18:38:51.577517	2017-11-20 18:38:51.577517	22	Frank E. Wright
163	\N	\N	2017-11-20 18:38:51.581683	2017-11-20 18:38:51.581683	22	Jason White (3)
164	\N	\N	2017-11-20 18:38:51.585766	2017-11-20 18:38:51.585766	22	John Kiffmeyer
165	\N	\N	2017-11-20 18:38:51.589938	2017-11-20 18:38:51.589938	22	Michael Pritchard
166	\N	\N	2017-11-20 18:39:09.143909	2017-11-20 18:39:09.143909	22	CJ Ward
167	\N	\N	2017-11-20 18:39:09.149851	2017-11-20 18:39:09.149851	22	Clem Burke
168	\N	\N	2017-11-20 18:39:09.15365	2017-11-20 18:39:09.15365	22	Douglas Colvin
169	\N	\N	2017-11-20 18:39:09.157637	2017-11-20 18:39:09.157637	22	Jeffrey Hyman
170	\N	\N	2017-11-20 18:39:09.161632	2017-11-20 18:39:09.161632	22	John Cummings (3)
171	\N	\N	2017-11-20 18:39:09.166291	2017-11-20 18:39:09.166291	22	Marc Bell
172	\N	\N	2017-11-20 18:39:09.170919	2017-11-20 18:39:09.170919	22	Richard Reinhardt
173	\N	\N	2017-11-20 18:39:09.175839	2017-11-20 18:39:09.175839	22	Tom Erdelyi
174	\N	\N	2017-11-20 18:39:30.59447	2017-11-20 18:39:30.59447	22	Brandon Cruz
175	\N	\N	2017-11-20 18:39:30.599818	2017-11-20 18:39:30.599818	22	Bruce Slesinger
176	\N	\N	2017-11-20 18:39:30.605364	2017-11-20 18:39:30.605364	22	Carlos Cadona
177	\N	\N	2017-11-20 18:39:30.609744	2017-11-20 18:39:30.609744	22	D.H. Peligro
178	\N	\N	2017-11-20 18:39:30.614039	2017-11-20 18:39:30.614039	22	Eric Boucher
179	\N	\N	2017-11-20 18:39:30.618609	2017-11-20 18:39:30.618609	22	Geoffrey Lyall
180	\N	\N	2017-11-20 18:39:30.623399	2017-11-20 18:39:30.623399	22	Ray Pepperell
181	\N	\N	2017-11-20 18:39:30.627958	2017-11-20 18:39:30.627958	22	Skip (27)
182	\N	\N	2017-11-20 18:39:30.631951	2017-11-20 18:39:30.631951	22	Steve "Boomstick" Wilson
183	\N	\N	2017-11-20 18:39:46.198579	2017-11-20 18:39:46.198579	22	John Mellor
184	\N	\N	2017-11-20 18:39:46.203266	2017-11-20 18:39:46.203266	22	Keith Levene
185	\N	\N	2017-11-20 18:39:46.207197	2017-11-20 18:39:46.207197	22	Mick Jones
186	\N	\N	2017-11-20 18:39:46.211127	2017-11-20 18:39:46.211127	22	Nick Sheppard
187	\N	\N	2017-11-20 18:39:46.215604	2017-11-20 18:39:46.215604	22	Paul Simonon
188	\N	\N	2017-11-20 18:39:46.220062	2017-11-20 18:39:46.220062	22	Pete Howard
189	\N	\N	2017-11-20 18:39:46.223649	2017-11-20 18:39:46.223649	22	Terry Chimes
190	\N	\N	2017-11-20 18:39:46.22833	2017-11-20 18:39:46.22833	22	Topper Headon
191	\N	\N	2017-11-20 18:39:46.232616	2017-11-20 18:39:46.232616	22	Vince White
192	\N	\N	2017-11-20 18:40:06.454863	2017-11-20 18:40:06.454863	22	Arthur Googy
193	\N	\N	2017-11-20 18:40:06.457808	2017-11-20 18:40:06.457808	22	Bobby Steele
194	\N	\N	2017-11-20 18:40:06.460531	2017-11-20 18:40:06.460531	22	Brian Keats
195	\N	\N	2017-11-20 18:40:06.46325	2017-11-20 18:40:06.46325	22	David Calabrese
196	\N	\N	2017-11-20 18:40:06.465833	2017-11-20 18:40:06.465833	22	Dez Cadena
197	\N	\N	2017-11-20 18:40:06.468372	2017-11-20 18:40:06.468372	22	Eric "Goat" Arce
198	\N	\N	2017-11-20 18:40:06.471028	2017-11-20 18:40:06.471028	22	Frank LiCata
199	\N	\N	2017-11-20 18:40:06.473606	2017-11-20 18:40:06.473606	22	Glenn Anzalone
200	\N	\N	2017-11-20 18:40:06.476079	2017-11-20 18:40:06.476079	22	Jerry Caiafa
201	\N	\N	2017-11-20 18:40:06.478577	2017-11-20 18:40:06.478577	22	Jerry Caiafa II
202	\N	\N	2017-11-20 18:40:06.481298	2017-11-20 18:40:06.481298	22	Jim Catania
203	\N	\N	2017-11-20 18:40:06.483856	2017-11-20 18:40:06.483856	22	Joey Image
204	\N	\N	2017-11-20 18:40:06.487682	2017-11-20 18:40:06.487682	22	Manny
205	\N	\N	2017-11-20 18:40:06.491495	2017-11-20 18:40:06.491495	22	Marc Bell
206	\N	\N	2017-11-20 18:40:06.495068	2017-11-20 18:40:06.495068	22	Marc Rizzo
207	\N	\N	2017-11-20 18:40:06.49939	2017-11-20 18:40:06.49939	22	Michale Graves
208	\N	\N	2017-11-20 18:40:06.503784	2017-11-20 18:40:06.503784	22	Myke Hideous
209	\N	\N	2017-11-20 18:40:06.508303	2017-11-20 18:40:06.508303	22	Paul Caiafa
210	\N	\N	2017-11-20 18:40:06.512671	2017-11-20 18:40:06.512671	22	Robo (3)
211	\N	\N	2017-11-20 18:43:49.085535	2017-11-20 18:43:49.085535	2	Clifford Smith (2)
212	\N	\N	2017-11-20 18:43:49.08971	2017-11-20 18:43:49.08971	2	Corey Woods
213	\N	\N	2017-11-20 18:43:49.093275	2017-11-20 18:43:49.093275	2	Dennis Coles
214	\N	\N	2017-11-20 18:43:49.096826	2017-11-20 18:43:49.096826	2	Elgin Turner
215	\N	\N	2017-11-20 18:43:49.100409	2017-11-20 18:43:49.100409	2	Gary Grice
216	\N	\N	2017-11-20 18:43:49.10419	2017-11-20 18:43:49.10419	2	Jason Hunter (2)
217	\N	\N	2017-11-20 18:43:49.108603	2017-11-20 18:43:49.108603	2	Lamont Hawkins
218	\N	\N	2017-11-20 18:43:49.112562	2017-11-20 18:43:49.112562	2	Robert Diggs
219	\N	\N	2017-11-20 18:43:49.116566	2017-11-20 18:43:49.116566	2	Russel Jones
220	\N	\N	2017-11-20 18:44:06.74544	2017-11-20 18:44:06.74544	2	Andre Young
221	\N	\N	2017-11-20 18:44:06.749786	2017-11-20 18:44:06.749786	2	Antoine Carraby
222	\N	\N	2017-11-20 18:44:06.754224	2017-11-20 18:44:06.754224	2	Eric Wright
223	\N	\N	2017-11-20 18:44:06.758695	2017-11-20 18:44:06.758695	2	Lorenzo Patterson
224	\N	\N	2017-11-20 18:44:06.763218	2017-11-20 18:44:06.763218	2	Mik Lezan
225	\N	\N	2017-11-20 18:44:06.767624	2017-11-20 18:44:06.767624	2	O'Shea Jackson
226	\N	\N	2017-11-20 18:44:27.134947	2017-11-20 18:44:27.134947	2	Darryl McDaniels
227	\N	\N	2017-11-20 18:44:27.139809	2017-11-20 18:44:27.139809	2	Jason Mizell
228	\N	\N	2017-11-20 18:44:27.145345	2017-11-20 18:44:27.145345	2	Joseph Simmons
229	\N	\N	2017-11-20 18:44:48.577027	2017-11-20 18:44:48.577027	2	Ali Shaheed Muhammad
230	\N	\N	2017-11-20 18:44:48.582552	2017-11-20 18:44:48.582552	2	Jarobi White
231	\N	\N	2017-11-20 18:44:48.587352	2017-11-20 18:44:48.587352	2	Kamaal Fareed
232	\N	\N	2017-11-20 18:44:48.592692	2017-11-20 18:44:48.592692	2	Malik Taylor
233	\N	\N	2017-11-20 18:45:07.525379	2017-11-20 18:45:07.525379	2	Brian Hardgroove
234	\N	\N	2017-11-20 18:45:07.529201	2017-11-20 18:45:07.529201	2	Carlton Ridenhour
235	\N	\N	2017-11-20 18:45:07.53305	2017-11-20 18:45:07.53305	2	Johnny Juice Rosado
236	\N	\N	2017-11-20 18:45:07.53634	2017-11-20 18:45:07.53634	2	Khari Wynn
237	\N	\N	2017-11-20 18:45:07.539716	2017-11-20 18:45:07.539716	2	Lisa Williamson (3)
238	\N	\N	2017-11-20 18:45:07.542479	2017-11-20 18:45:07.542479	2	Lord Aswod
239	\N	\N	2017-11-20 18:45:07.545218	2017-11-20 18:45:07.545218	2	Mike Faulkner
240	\N	\N	2017-11-20 18:45:07.547935	2017-11-20 18:45:07.547935	2	Norman Rogers
241	\N	\N	2017-11-20 18:45:07.550909	2017-11-20 18:45:07.550909	2	Richard Griffin
242	\N	\N	2017-11-20 18:45:07.55381	2017-11-20 18:45:07.55381	2	William Jonathan Drayton
243	\N	\N	2017-11-20 18:54:46.440715	2017-11-20 18:54:46.440715	11	A. P. Carter
244	\N	\N	2017-11-20 18:54:46.446076	2017-11-20 18:54:46.446076	11	Anita Carter
245	\N	\N	2017-11-20 18:54:46.449934	2017-11-20 18:54:46.449934	11	Helen Carter (2)
246	\N	\N	2017-11-20 18:54:46.453623	2017-11-20 18:54:46.453623	11	Janette Carter
247	\N	\N	2017-11-20 18:54:46.457331	2017-11-20 18:54:46.457331	11	June Carter Cash
248	\N	\N	2017-11-20 18:54:46.46137	2017-11-20 18:54:46.46137	11	Maybelle Carter
249	\N	\N	2017-11-20 18:54:46.466177	2017-11-20 18:54:46.466177	11	Sara Carter (2)
250	\N	\N	2017-11-20 18:55:09.489418	2017-11-20 18:55:09.489418	11	Benny Martin
251	\N	\N	2017-11-20 18:55:09.492959	2017-11-20 18:55:09.492959	11	Bessie Lee Mauldin
252	\N	\N	2017-11-20 18:55:09.496166	2017-11-20 18:55:09.496166	11	Bill Holden (4)
253	\N	\N	2017-11-20 18:55:09.499783	2017-11-20 18:55:09.499783	11	Bill Monroe
254	\N	\N	2017-11-20 18:55:09.503345	2017-11-20 18:55:09.503345	11	Charlie Cline
255	\N	\N	2017-11-20 18:55:09.50655	2017-11-20 18:55:09.50655	11	Curtis Blackwell
256	\N	\N	2017-11-20 18:55:09.509539	2017-11-20 18:55:09.509539	11	Dana Cupp, Jr.
257	\N	\N	2017-11-20 18:55:09.511998	2017-11-20 18:55:09.511998	11	Don Reno
258	\N	\N	2017-11-20 18:55:09.514624	2017-11-20 18:55:09.514624	11	Jack Cooke
259	\N	\N	2017-11-20 18:55:09.517113	2017-11-20 18:55:09.517113	11	Jimmy Maynard (2)
260	\N	\N	2017-11-20 18:55:09.51969	2017-11-20 18:55:09.51969	11	Mac Wiseman
261	\N	\N	2017-11-20 18:55:09.52225	2017-11-20 18:55:09.52225	11	Peter Rowan
262	\N	\N	2017-11-20 18:55:16.819088	2017-11-20 18:55:16.819088	11	Earl Scruggs
263	\N	\N	2017-11-20 18:55:16.822714	2017-11-20 18:55:16.822714	11	Lester Flatt
264	\N	\N	2017-11-20 18:55:23.939515	2017-11-20 18:55:23.939515	11	Jeff Cook (2)
265	\N	\N	2017-11-20 18:55:23.9447	2017-11-20 18:55:23.9447	11	Mark Herndon
266	\N	\N	2017-11-20 18:55:23.947725	2017-11-20 18:55:23.947725	11	Randy Owen
267	\N	\N	2017-11-20 18:55:23.951394	2017-11-20 18:55:23.951394	11	Teddy Gentry
268	\N	\N	2017-11-20 18:55:30.43695	2017-11-20 18:55:30.43695	11	Charlie Louvin
269	\N	\N	2017-11-20 18:55:30.441458	2017-11-20 18:55:30.441458	11	Ira Louvin
270	\N	\N	2017-11-20 18:58:50.188067	2017-11-20 18:58:50.188067	17	Agnetha Fältskog
271	\N	\N	2017-11-20 18:58:50.192021	2017-11-20 18:58:50.192021	17	Anni-Frid Lyngstad
272	\N	\N	2017-11-20 18:58:50.195152	2017-11-20 18:58:50.195152	17	Benny Andersson
273	\N	\N	2017-11-20 18:58:50.198712	2017-11-20 18:58:50.198712	17	Björn Ulvaeus
274	\N	\N	2017-11-20 18:58:55.958608	2017-11-20 18:58:55.958608	17	Alan Kendall
275	\N	\N	2017-11-20 18:58:55.963605	2017-11-20 18:58:55.963605	17	Barry Gibb
276	\N	\N	2017-11-20 18:58:55.968287	2017-11-20 18:58:55.968287	17	Blue Weaver
277	\N	\N	2017-11-20 18:58:55.972434	2017-11-20 18:58:55.972434	17	Colin Petersen
278	\N	\N	2017-11-20 18:58:55.97706	2017-11-20 18:58:55.97706	17	Dennis Bryon
279	\N	\N	2017-11-20 18:58:55.981676	2017-11-20 18:58:55.981676	17	Geoff Bridgford
280	\N	\N	2017-11-20 18:58:55.986432	2017-11-20 18:58:55.986432	17	Maurice Gibb
281	\N	\N	2017-11-20 18:58:55.991331	2017-11-20 18:58:55.991331	17	Robin Gibb
282	\N	\N	2017-11-20 18:58:55.996237	2017-11-20 18:58:55.996237	17	Vince Melouney
283	\N	\N	2017-11-20 18:59:03.927345	2017-11-20 18:59:03.927345	17	Davy Jones
284	\N	\N	2017-11-20 18:59:03.931364	2017-11-20 18:59:03.931364	17	Michael Nesmith
285	\N	\N	2017-11-20 18:59:03.935048	2017-11-20 18:59:03.935048	17	Micky Dolenz
286	\N	\N	2017-11-20 18:59:03.938818	2017-11-20 18:59:03.938818	17	Peter Tork
287	\N	\N	2017-11-20 18:59:10.209381	2017-11-20 18:59:10.209381	17	Alan Jardine
288	\N	\N	2017-11-20 18:59:10.214773	2017-11-20 18:59:10.214773	17	Blondie Chaplin
289	\N	\N	2017-11-20 18:59:10.217969	2017-11-20 18:59:10.217969	17	Brian Wilson
290	\N	\N	2017-11-20 18:59:10.220825	2017-11-20 18:59:10.220825	17	Bruce Johnston
291	\N	\N	2017-11-20 18:59:10.223989	2017-11-20 18:59:10.223989	17	Carl Wilson
292	\N	\N	2017-11-20 18:59:10.226637	2017-11-20 18:59:10.226637	17	David Marks
293	\N	\N	2017-11-20 18:59:10.229321	2017-11-20 18:59:10.229321	17	Dennis Wilson (2)
294	\N	\N	2017-11-20 18:59:10.232128	2017-11-20 18:59:10.232128	17	Mike Love
295	\N	\N	2017-11-20 18:59:10.234944	2017-11-20 18:59:10.234944	17	Ricky Fataar
296	\N	\N	2017-11-20 18:59:18.777386	2017-11-20 18:59:18.777386	17	Bekka Bramlett
297	\N	\N	2017-11-20 18:59:18.783773	2017-11-20 18:59:18.783773	17	Billy Burnette
298	\N	\N	2017-11-20 18:59:18.787729	2017-11-20 18:59:18.787729	17	Bob Brunning
299	\N	\N	2017-11-20 18:59:18.791999	2017-11-20 18:59:18.791999	17	Bob Welch
300	\N	\N	2017-11-20 18:59:18.794715	2017-11-20 18:59:18.794715	17	Bob Weston
301	\N	\N	2017-11-20 18:59:18.797347	2017-11-20 18:59:18.797347	17	Christine McVie
302	\N	\N	2017-11-20 18:59:18.800063	2017-11-20 18:59:18.800063	17	Danny Kirwan
303	\N	\N	2017-11-20 18:59:18.802689	2017-11-20 18:59:18.802689	17	Dave Mason
304	\N	\N	2017-11-20 18:59:18.805426	2017-11-20 18:59:18.805426	17	Dave Walker (6)
305	\N	\N	2017-11-20 18:59:18.808121	2017-11-20 18:59:18.808121	17	Jeremy Spencer
306	\N	\N	2017-11-20 18:59:18.810813	2017-11-20 18:59:18.810813	17	John McVie
307	\N	\N	2017-11-20 18:59:18.813383	2017-11-20 18:59:18.813383	17	Lindsey Buckingham
308	\N	\N	2017-11-20 18:59:18.816071	2017-11-20 18:59:18.816071	17	Mick Fleetwood
309	\N	\N	2017-11-20 18:59:18.819462	2017-11-20 18:59:18.819462	17	Peter Green (2)
310	\N	\N	2017-11-20 18:59:18.822408	2017-11-20 18:59:18.822408	17	Rick Vito
311	\N	\N	2017-11-20 18:59:18.825022	2017-11-20 18:59:18.825022	17	Stevie Nicks
312	\N	\N	2017-11-20 19:01:44.174485	2017-11-20 19:01:44.174485	4	Alfredo Hernandez
313	\N	\N	2017-11-20 19:01:44.178166	2017-11-20 19:01:44.178166	4	Brant Bjork
314	\N	\N	2017-11-20 19:01:44.18052	2017-11-20 19:01:44.18052	4	Chris Cockrell
315	\N	\N	2017-11-20 19:01:44.183143	2017-11-20 19:01:44.183143	4	John Garcia (2)
316	\N	\N	2017-11-20 19:01:44.185417	2017-11-20 19:01:44.185417	4	Josh Homme
317	\N	\N	2017-11-20 19:01:44.187682	2017-11-20 19:01:44.187682	4	Nick Oliveri
318	\N	\N	2017-11-20 19:01:44.190149	2017-11-20 19:01:44.190149	4	Scott Reeder
319	\N	\N	2017-11-20 19:01:52.712298	2017-11-20 19:01:52.712298	4	Bob Balch
320	\N	\N	2017-11-20 19:01:52.717798	2017-11-20 19:01:52.717798	4	Brad Davis (3)
321	\N	\N	2017-11-20 19:01:52.722921	2017-11-20 19:01:52.722921	4	Brant Bjork
322	\N	\N	2017-11-20 19:01:52.725869	2017-11-20 19:01:52.725869	4	Eddie Glass
323	\N	\N	2017-11-20 19:01:52.728531	2017-11-20 19:01:52.728531	4	Glenn Chivens
324	\N	\N	2017-11-20 19:01:52.731303	2017-11-20 19:01:52.731303	4	Greg McCaughey
325	\N	\N	2017-11-20 19:01:52.734937	2017-11-20 19:01:52.734937	4	Mark Abshire
326	\N	\N	2017-11-20 19:01:52.738924	2017-11-20 19:01:52.738924	4	Ruben Romano
327	\N	\N	2017-11-20 19:01:52.742274	2017-11-20 19:01:52.742274	4	Scott Hill (2)
328	\N	\N	2017-11-20 19:01:52.745403	2017-11-20 19:01:52.745403	4	Scott Reeder (2)
329	\N	\N	2017-11-20 19:01:52.748598	2017-11-20 19:01:52.748598	4	Scott Votaw
330	\N	\N	2017-11-20 19:02:00.349239	2017-11-20 19:02:00.349239	4	Alfredo Hernandez
331	\N	\N	2017-11-20 19:02:00.352451	2017-11-20 19:02:00.352451	4	Brendon McNichol
332	\N	\N	2017-11-20 19:02:00.355889	2017-11-20 19:02:00.355889	4	Chris Goss
333	\N	\N	2017-11-20 19:02:00.36029	2017-11-20 19:02:00.36029	4	Dan Druff
334	\N	\N	2017-11-20 19:02:00.363621	2017-11-20 19:02:00.363621	4	Dave Grohl
335	\N	\N	2017-11-20 19:02:00.366399	2017-11-20 19:02:00.366399	4	David Catching
336	\N	\N	2017-11-20 19:02:00.369582	2017-11-20 19:02:00.369582	4	Dean Fertita
337	\N	\N	2017-11-20 19:02:00.372979	2017-11-20 19:02:00.372979	4	Eva Nahon
338	\N	\N	2017-11-20 19:02:00.375884	2017-11-20 19:02:00.375884	4	Gene Trautmann
339	\N	\N	2017-11-20 19:02:00.378657	2017-11-20 19:02:00.378657	4	Jason Albertini
340	\N	\N	2017-11-20 19:02:00.381604	2017-11-20 19:02:00.381604	4	Joey Castillo
341	\N	\N	2017-11-20 19:02:00.384776	2017-11-20 19:02:00.384776	4	John McBain
342	\N	\N	2017-11-20 19:02:00.387701	2017-11-20 19:02:00.387701	4	Jon Theodore
343	\N	\N	2017-11-20 19:02:00.390556	2017-11-20 19:02:00.390556	4	Josh Homme
344	\N	\N	2017-11-20 19:02:00.393879	2017-11-20 19:02:00.393879	4	Mario Lalli
345	\N	\N	2017-11-20 19:02:00.396454	2017-11-20 19:02:00.396454	4	Mark Lanegan
346	\N	\N	2017-11-20 19:02:00.39937	2017-11-20 19:02:00.39937	4	Matt Cameron
347	\N	\N	2017-11-20 19:02:00.402131	2017-11-20 19:02:00.402131	4	Mike Johnson (8)
348	\N	\N	2017-11-20 19:02:00.404784	2017-11-20 19:02:00.404784	4	Mikey Shuman
349	\N	\N	2017-11-20 19:02:00.407761	2017-11-20 19:02:00.407761	4	Milo Beenhakker
350	\N	\N	2017-11-20 19:02:00.410487	2017-11-20 19:02:00.410487	4	Nick Lucero
351	\N	\N	2017-11-20 19:02:00.414477	2017-11-20 19:02:00.414477	4	Nick Oliveri
352	\N	\N	2017-11-20 19:02:00.418422	2017-11-20 19:02:00.418422	4	Troy Van Leeuwen
353	\N	\N	2017-11-20 19:02:00.422804	2017-11-20 19:02:00.422804	4	Van Conner
354	\N	\N	2017-11-20 19:02:10.954529	2017-11-20 19:02:10.954529	4	Dan Maines
355	\N	\N	2017-11-20 19:02:10.959817	2017-11-20 19:02:10.959817	4	Jean Paul Gaster
356	\N	\N	2017-11-20 19:02:10.96445	2017-11-20 19:02:10.96445	4	Mick Schauer
357	\N	\N	2017-11-20 19:02:10.969092	2017-11-20 19:02:10.969092	4	Neil Fallon
358	\N	\N	2017-11-20 19:02:10.973488	2017-11-20 19:02:10.973488	4	Tim Sult
359	\N	\N	2017-11-20 19:02:18.165198	2017-11-20 19:02:18.165198	4	Bob Pantella
360	\N	\N	2017-11-20 19:02:18.171568	2017-11-20 19:02:18.171568	4	Dave Wyndorf
361	\N	\N	2017-11-20 19:02:18.175418	2017-11-20 19:02:18.175418	4	Ed Mundell
362	\N	\N	2017-11-20 19:02:18.179188	2017-11-20 19:02:18.179188	4	Garrett Sweeny
363	\N	\N	2017-11-20 19:02:18.182861	2017-11-20 19:02:18.182861	4	Jim Baglino
364	\N	\N	2017-11-20 19:02:18.187063	2017-11-20 19:02:18.187063	4	Joe Calandra
365	\N	\N	2017-11-20 19:02:18.191553	2017-11-20 19:02:18.191553	4	John McBain
366	\N	\N	2017-11-20 19:02:18.195849	2017-11-20 19:02:18.195849	4	Jon Kleiman
367	\N	\N	2017-11-20 19:02:18.201485	2017-11-20 19:02:18.201485	4	Michael Wildwood
368	\N	\N	2017-11-20 19:02:18.207743	2017-11-20 19:02:18.207743	4	Phil Caivano
369	\N	\N	2017-11-20 19:02:18.212263	2017-11-20 19:02:18.212263	4	Scott Garrett
370	\N	\N	2017-11-20 19:02:18.216755	2017-11-20 19:02:18.216755	4	Tim Cronin
371	\N	\N	2017-11-20 19:10:04.469728	2017-11-20 19:10:04.469728	10	David Hunt (7)
372	\N	\N	2017-11-20 19:10:04.474474	2017-11-20 19:10:04.474474	10	Duncan Wilkins
373	\N	\N	2017-11-20 19:10:04.477979	2017-11-20 19:10:04.477979	10	James Walford
374	\N	\N	2017-11-20 19:10:04.482429	2017-11-20 19:10:04.482429	10	Mick Kenney
375	\N	\N	2017-11-20 19:10:04.487294	2017-11-20 19:10:04.487294	10	Paul Harrington (2)
376	\N	\N	2017-11-20 19:10:10.230054	2017-11-20 19:10:10.230054	10	Remi Gallego
377	\N	\N	2017-11-20 19:16:39.036908	2017-11-20 19:16:39.036908	16	Alan Skidmore
378	\N	\N	2017-11-20 19:16:39.040654	2017-11-20 19:16:39.040654	16	Aynsley Dunbar
379	\N	\N	2017-11-20 19:16:39.043564	2017-11-20 19:16:39.043564	16	Bobby Haynes
380	\N	\N	2017-11-20 19:16:39.046221	2017-11-20 19:16:39.046221	16	Buddy Whittington
381	\N	\N	2017-11-20 19:16:39.048918	2017-11-20 19:16:39.048918	16	Chris Mercer
382	\N	\N	2017-11-20 19:16:39.051637	2017-11-20 19:16:39.051637	16	Coco Montoya
383	\N	\N	2017-11-20 19:16:39.054289	2017-11-20 19:16:39.054289	16	Colin Allen
384	\N	\N	2017-11-20 19:16:39.056778	2017-11-20 19:16:39.056778	16	Dick Heckstall-Smith
385	\N	\N	2017-11-20 19:16:39.059482	2017-11-20 19:16:39.059482	16	Eric Clapton
386	\N	\N	2017-11-20 19:16:39.06203	2017-11-20 19:16:39.06203	16	Hank Van Sickle
387	\N	\N	2017-11-20 19:16:39.064937	2017-11-20 19:16:39.064937	16	Jimmy McCulloch
388	\N	\N	2017-11-20 19:16:39.067867	2017-11-20 19:16:39.067867	16	Joe Yuele
389	\N	\N	2017-11-20 19:16:39.070812	2017-11-20 19:16:39.070812	16	John Mayall
390	\N	\N	2017-11-20 19:16:39.073801	2017-11-20 19:16:39.073801	16	John McVie
391	\N	\N	2017-11-20 19:16:39.078017	2017-11-20 19:16:39.078017	16	Jon Hiseman
392	\N	\N	2017-11-20 19:16:39.082359	2017-11-20 19:16:39.082359	16	Keef Hartley
393	\N	\N	2017-11-20 19:16:39.086654	2017-11-20 19:16:39.086654	16	Keith Tillman
394	\N	\N	2017-11-20 19:16:39.091694	2017-11-20 19:16:39.091694	16	Larry Taylor
395	\N	\N	2017-11-20 19:16:39.096233	2017-11-20 19:16:39.096233	16	Mick Taylor
396	\N	\N	2017-11-20 19:16:39.101362	2017-11-20 19:16:39.101362	16	Peter Green (2)
397	\N	\N	2017-11-20 19:16:39.105803	2017-11-20 19:16:39.105803	16	Ray Warleigh
398	\N	\N	2017-11-20 19:16:39.110179	2017-11-20 19:16:39.110179	16	Rick Cortes
399	\N	\N	2017-11-20 19:16:39.114729	2017-11-20 19:16:39.114729	16	Rip Kant
400	\N	\N	2017-11-20 19:16:39.119072	2017-11-20 19:16:39.119072	16	Tom Canning
401	\N	\N	2017-11-20 19:16:39.123446	2017-11-20 19:16:39.123446	16	Tony Reeves
402	\N	\N	2017-11-20 19:16:39.127803	2017-11-20 19:16:39.127803	16	Walter Trout
403	\N	\N	2017-11-20 19:16:45.161347	2017-11-20 19:16:45.161347	16	David Larkham
404	\N	\N	2017-11-20 19:16:51.020344	2017-11-20 19:16:51.020344	16	Billy Gibbons
405	\N	\N	2017-11-20 19:16:51.024803	2017-11-20 19:16:51.024803	16	Dan Mitchell (3)
406	\N	\N	2017-11-20 19:16:51.028721	2017-11-20 19:16:51.028721	16	Dusty Hill
407	\N	\N	2017-11-20 19:16:51.033131	2017-11-20 19:16:51.033131	16	Frank Beard
408	\N	\N	2017-11-20 19:16:51.037791	2017-11-20 19:16:51.037791	16	Lanier Greig
409	\N	\N	2017-11-20 19:16:56.848793	2017-11-20 19:16:56.848793	16	Allen Woody
410	\N	\N	2017-11-20 19:16:56.852311	2017-11-20 19:16:56.852311	16	Berry Oakley
411	\N	\N	2017-11-20 19:16:56.855445	2017-11-20 19:16:56.855445	16	Butch Trucks
412	\N	\N	2017-11-20 19:16:56.858609	2017-11-20 19:16:56.858609	16	Chuck Leavell
413	\N	\N	2017-11-20 19:16:56.862719	2017-11-20 19:16:56.862719	16	Dan Toler
414	\N	\N	2017-11-20 19:16:56.86634	2017-11-20 19:16:56.86634	16	David "Frankie" Toler
415	\N	\N	2017-11-20 19:16:56.871301	2017-11-20 19:16:56.871301	16	Derek Trucks
416	\N	\N	2017-11-20 19:16:56.875865	2017-11-20 19:16:56.875865	16	Dickey Betts
417	\N	\N	2017-11-20 19:16:56.88059	2017-11-20 19:16:56.88059	16	Duane Allman
418	\N	\N	2017-11-20 19:16:56.885562	2017-11-20 19:16:56.885562	16	Gregg Allman
419	\N	\N	2017-11-20 19:16:56.889938	2017-11-20 19:16:56.889938	16	Jai Johanny Johanson
420	\N	\N	2017-11-20 19:16:56.901666	2017-11-20 19:16:56.901666	16	Johnny Neel
421	\N	\N	2017-11-20 19:16:56.906996	2017-11-20 19:16:56.906996	16	Lamar Williams
422	\N	\N	2017-11-20 19:16:56.912143	2017-11-20 19:16:56.912143	16	Marc Quinones
423	\N	\N	2017-11-20 19:16:56.916521	2017-11-20 19:16:56.916521	16	Oteil Burbridge
424	\N	\N	2017-11-20 19:16:56.921242	2017-11-20 19:16:56.921242	16	Reese Wynans
425	\N	\N	2017-11-20 19:16:56.926026	2017-11-20 19:16:56.926026	16	Warren Haynes
426	\N	\N	2017-11-20 19:17:02.961211	2017-11-20 19:17:02.961211	16	John "Rabbit" Bundrick
427	\N	\N	2017-11-20 19:17:02.965355	2017-11-20 19:17:02.965355	16	John Entwistle
428	\N	\N	2017-11-20 19:17:02.968072	2017-11-20 19:17:02.968072	16	Keith Moon
429	\N	\N	2017-11-20 19:17:02.970722	2017-11-20 19:17:02.970722	16	Kenny Jones
430	\N	\N	2017-11-20 19:17:02.973313	2017-11-20 19:17:02.973313	16	Pete Townshend
431	\N	\N	2017-11-20 19:17:02.977252	2017-11-20 19:17:02.977252	16	Roger Daltrey
432	\N	\N	2017-11-20 19:17:02.981293	2017-11-20 19:17:02.981293	16	Simon Townshend
433	\N	\N	2017-11-20 19:17:02.985011	2017-11-20 19:17:02.985011	16	Zak Starkey
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('artists_id_seq', 433, true);


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
87	31	18	2017-11-20 18:16:43.471491	2017-11-20 18:16:43.471491
88	31	19	2017-11-20 18:16:43.476813	2017-11-20 18:16:43.476813
89	31	20	2017-11-20 18:16:43.481733	2017-11-20 18:16:43.481733
90	31	21	2017-11-20 18:16:43.487011	2017-11-20 18:16:43.487011
91	32	18	2017-11-20 18:16:58.146247	2017-11-20 18:16:58.146247
92	32	19	2017-11-20 18:16:58.151983	2017-11-20 18:16:58.151983
93	32	20	2017-11-20 18:16:58.156853	2017-11-20 18:16:58.156853
94	32	21	2017-11-20 18:16:58.161547	2017-11-20 18:16:58.161547
95	32	22	2017-11-20 18:16:58.166366	2017-11-20 18:16:58.166366
96	32	23	2017-11-20 18:16:58.171287	2017-11-20 18:16:58.171287
97	32	24	2017-11-20 18:16:58.176209	2017-11-20 18:16:58.176209
98	32	25	2017-11-20 18:16:58.181023	2017-11-20 18:16:58.181023
99	32	26	2017-11-20 18:16:58.185455	2017-11-20 18:16:58.185455
100	32	27	2017-11-20 18:16:58.189642	2017-11-20 18:16:58.189642
101	32	28	2017-11-20 18:16:58.194589	2017-11-20 18:16:58.194589
102	33	18	2017-11-20 18:17:14.08058	2017-11-20 18:17:14.08058
103	33	19	2017-11-20 18:17:14.085168	2017-11-20 18:17:14.085168
104	33	20	2017-11-20 18:17:14.089678	2017-11-20 18:17:14.089678
105	33	21	2017-11-20 18:17:14.094217	2017-11-20 18:17:14.094217
106	33	22	2017-11-20 18:17:14.100855	2017-11-20 18:17:14.100855
107	33	23	2017-11-20 18:17:14.10798	2017-11-20 18:17:14.10798
108	33	24	2017-11-20 18:17:14.112713	2017-11-20 18:17:14.112713
109	33	25	2017-11-20 18:17:14.11721	2017-11-20 18:17:14.11721
110	33	26	2017-11-20 18:17:14.121223	2017-11-20 18:17:14.121223
111	33	27	2017-11-20 18:17:14.12514	2017-11-20 18:17:14.12514
112	33	28	2017-11-20 18:17:14.129277	2017-11-20 18:17:14.129277
113	33	29	2017-11-20 18:17:14.133689	2017-11-20 18:17:14.133689
114	33	30	2017-11-20 18:17:14.138296	2017-11-20 18:17:14.138296
115	33	31	2017-11-20 18:17:14.142507	2017-11-20 18:17:14.142507
116	33	32	2017-11-20 18:17:14.148991	2017-11-20 18:17:14.148991
117	33	33	2017-11-20 18:17:14.155907	2017-11-20 18:17:14.155907
118	33	34	2017-11-20 18:17:14.162742	2017-11-20 18:17:14.162742
119	33	35	2017-11-20 18:17:14.167014	2017-11-20 18:17:14.167014
120	33	36	2017-11-20 18:17:14.170411	2017-11-20 18:17:14.170411
121	33	37	2017-11-20 18:17:14.173699	2017-11-20 18:17:14.173699
122	33	38	2017-11-20 18:17:14.177355	2017-11-20 18:17:14.177355
123	33	39	2017-11-20 18:17:14.181475	2017-11-20 18:17:14.181475
124	33	40	2017-11-20 18:17:14.18554	2017-11-20 18:17:14.18554
125	33	41	2017-11-20 18:17:14.189375	2017-11-20 18:17:14.189375
126	33	42	2017-11-20 18:17:14.194506	2017-11-20 18:17:14.194506
127	33	43	2017-11-20 18:17:14.200589	2017-11-20 18:17:14.200589
128	33	44	2017-11-20 18:17:14.204884	2017-11-20 18:17:14.204884
129	33	45	2017-11-20 18:17:14.209271	2017-11-20 18:17:14.209271
130	33	46	2017-11-20 18:17:14.213368	2017-11-20 18:17:14.213368
131	33	47	2017-11-20 18:17:14.217448	2017-11-20 18:17:14.217448
132	33	48	2017-11-20 18:17:14.221464	2017-11-20 18:17:14.221464
133	33	49	2017-11-20 18:17:14.227069	2017-11-20 18:17:14.227069
134	33	50	2017-11-20 18:17:14.232165	2017-11-20 18:17:14.232165
135	33	51	2017-11-20 18:17:14.237347	2017-11-20 18:17:14.237347
136	33	52	2017-11-20 18:17:14.242672	2017-11-20 18:17:14.242672
137	33	53	2017-11-20 18:17:14.247877	2017-11-20 18:17:14.247877
138	33	54	2017-11-20 18:17:14.253778	2017-11-20 18:17:14.253778
139	34	18	2017-11-20 18:17:29.760843	2017-11-20 18:17:29.760843
140	34	19	2017-11-20 18:17:29.76498	2017-11-20 18:17:29.76498
141	34	20	2017-11-20 18:17:29.769458	2017-11-20 18:17:29.769458
142	34	21	2017-11-20 18:17:29.773926	2017-11-20 18:17:29.773926
143	34	22	2017-11-20 18:17:29.778215	2017-11-20 18:17:29.778215
144	34	23	2017-11-20 18:17:29.782379	2017-11-20 18:17:29.782379
145	34	24	2017-11-20 18:17:29.787435	2017-11-20 18:17:29.787435
146	34	25	2017-11-20 18:17:29.79284	2017-11-20 18:17:29.79284
147	34	26	2017-11-20 18:17:29.799036	2017-11-20 18:17:29.799036
148	34	27	2017-11-20 18:17:29.805886	2017-11-20 18:17:29.805886
149	34	28	2017-11-20 18:17:29.811941	2017-11-20 18:17:29.811941
150	34	29	2017-11-20 18:17:29.817044	2017-11-20 18:17:29.817044
151	34	30	2017-11-20 18:17:29.822376	2017-11-20 18:17:29.822376
152	34	31	2017-11-20 18:17:29.827339	2017-11-20 18:17:29.827339
153	34	32	2017-11-20 18:17:29.832567	2017-11-20 18:17:29.832567
154	34	33	2017-11-20 18:17:29.838322	2017-11-20 18:17:29.838322
155	34	34	2017-11-20 18:17:29.84402	2017-11-20 18:17:29.84402
156	34	35	2017-11-20 18:17:29.84948	2017-11-20 18:17:29.84948
157	34	36	2017-11-20 18:17:29.854637	2017-11-20 18:17:29.854637
158	34	37	2017-11-20 18:17:29.859842	2017-11-20 18:17:29.859842
159	34	38	2017-11-20 18:17:29.865846	2017-11-20 18:17:29.865846
160	34	39	2017-11-20 18:17:29.871883	2017-11-20 18:17:29.871883
161	34	40	2017-11-20 18:17:29.877577	2017-11-20 18:17:29.877577
162	34	41	2017-11-20 18:17:29.882919	2017-11-20 18:17:29.882919
163	34	42	2017-11-20 18:17:29.889021	2017-11-20 18:17:29.889021
164	34	43	2017-11-20 18:17:29.895026	2017-11-20 18:17:29.895026
165	34	44	2017-11-20 18:17:29.901308	2017-11-20 18:17:29.901308
166	34	45	2017-11-20 18:17:29.907483	2017-11-20 18:17:29.907483
167	34	46	2017-11-20 18:17:29.912606	2017-11-20 18:17:29.912606
168	34	47	2017-11-20 18:17:29.917548	2017-11-20 18:17:29.917548
169	34	48	2017-11-20 18:17:29.922914	2017-11-20 18:17:29.922914
170	34	49	2017-11-20 18:17:29.928021	2017-11-20 18:17:29.928021
171	34	50	2017-11-20 18:17:29.933802	2017-11-20 18:17:29.933802
172	34	51	2017-11-20 18:17:29.940296	2017-11-20 18:17:29.940296
173	34	52	2017-11-20 18:17:29.946678	2017-11-20 18:17:29.946678
174	34	53	2017-11-20 18:17:29.95223	2017-11-20 18:17:29.95223
175	34	54	2017-11-20 18:17:29.957523	2017-11-20 18:17:29.957523
176	34	55	2017-11-20 18:17:29.962853	2017-11-20 18:17:29.962853
177	34	56	2017-11-20 18:17:29.967421	2017-11-20 18:17:29.967421
178	34	57	2017-11-20 18:17:29.971338	2017-11-20 18:17:29.971338
179	34	58	2017-11-20 18:17:29.975442	2017-11-20 18:17:29.975442
180	34	59	2017-11-20 18:17:29.979532	2017-11-20 18:17:29.979532
181	34	60	2017-11-20 18:17:29.984272	2017-11-20 18:17:29.984272
182	34	61	2017-11-20 18:17:29.988787	2017-11-20 18:17:29.988787
183	34	62	2017-11-20 18:17:29.99303	2017-11-20 18:17:29.99303
184	34	63	2017-11-20 18:17:29.997376	2017-11-20 18:17:29.997376
185	34	64	2017-11-20 18:17:30.001803	2017-11-20 18:17:30.001803
186	35	18	2017-11-20 18:17:53.781769	2017-11-20 18:17:53.781769
187	35	19	2017-11-20 18:17:53.787515	2017-11-20 18:17:53.787515
188	35	20	2017-11-20 18:17:53.793745	2017-11-20 18:17:53.793745
189	35	21	2017-11-20 18:17:53.799911	2017-11-20 18:17:53.799911
190	35	22	2017-11-20 18:17:53.805958	2017-11-20 18:17:53.805958
191	35	23	2017-11-20 18:17:53.811773	2017-11-20 18:17:53.811773
192	35	24	2017-11-20 18:17:53.817831	2017-11-20 18:17:53.817831
193	35	25	2017-11-20 18:17:53.824143	2017-11-20 18:17:53.824143
194	35	26	2017-11-20 18:17:53.829478	2017-11-20 18:17:53.829478
195	35	27	2017-11-20 18:17:53.834727	2017-11-20 18:17:53.834727
196	35	28	2017-11-20 18:17:53.839947	2017-11-20 18:17:53.839947
197	35	29	2017-11-20 18:17:53.845538	2017-11-20 18:17:53.845538
198	35	30	2017-11-20 18:17:53.851224	2017-11-20 18:17:53.851224
199	35	31	2017-11-20 18:17:53.855861	2017-11-20 18:17:53.855861
200	35	32	2017-11-20 18:17:53.860166	2017-11-20 18:17:53.860166
201	35	33	2017-11-20 18:17:53.864395	2017-11-20 18:17:53.864395
202	35	34	2017-11-20 18:17:53.868578	2017-11-20 18:17:53.868578
203	35	35	2017-11-20 18:17:53.872562	2017-11-20 18:17:53.872562
204	35	36	2017-11-20 18:17:53.876967	2017-11-20 18:17:53.876967
205	35	37	2017-11-20 18:17:53.881368	2017-11-20 18:17:53.881368
206	35	38	2017-11-20 18:17:53.885563	2017-11-20 18:17:53.885563
207	35	39	2017-11-20 18:17:53.889793	2017-11-20 18:17:53.889793
208	35	40	2017-11-20 18:17:53.894274	2017-11-20 18:17:53.894274
209	35	41	2017-11-20 18:17:53.898741	2017-11-20 18:17:53.898741
210	35	42	2017-11-20 18:17:53.903132	2017-11-20 18:17:53.903132
211	35	43	2017-11-20 18:17:53.907846	2017-11-20 18:17:53.907846
212	35	44	2017-11-20 18:17:53.912326	2017-11-20 18:17:53.912326
213	35	45	2017-11-20 18:17:53.916383	2017-11-20 18:17:53.916383
214	35	46	2017-11-20 18:17:53.920741	2017-11-20 18:17:53.920741
215	35	47	2017-11-20 18:17:53.925059	2017-11-20 18:17:53.925059
216	35	48	2017-11-20 18:17:53.929264	2017-11-20 18:17:53.929264
217	35	49	2017-11-20 18:17:53.933552	2017-11-20 18:17:53.933552
218	35	50	2017-11-20 18:17:53.93784	2017-11-20 18:17:53.93784
219	35	51	2017-11-20 18:17:53.942064	2017-11-20 18:17:53.942064
220	35	52	2017-11-20 18:17:53.946066	2017-11-20 18:17:53.946066
221	35	53	2017-11-20 18:17:53.950161	2017-11-20 18:17:53.950161
222	35	54	2017-11-20 18:17:53.954123	2017-11-20 18:17:53.954123
223	35	55	2017-11-20 18:17:53.958118	2017-11-20 18:17:53.958118
224	35	56	2017-11-20 18:17:53.962128	2017-11-20 18:17:53.962128
225	35	57	2017-11-20 18:17:53.966086	2017-11-20 18:17:53.966086
226	35	58	2017-11-20 18:17:53.970235	2017-11-20 18:17:53.970235
227	35	59	2017-11-20 18:17:53.974952	2017-11-20 18:17:53.974952
228	35	60	2017-11-20 18:17:53.979515	2017-11-20 18:17:53.979515
229	35	61	2017-11-20 18:17:53.984209	2017-11-20 18:17:53.984209
230	35	62	2017-11-20 18:17:53.98834	2017-11-20 18:17:53.98834
231	35	63	2017-11-20 18:17:53.993683	2017-11-20 18:17:53.993683
232	35	64	2017-11-20 18:17:53.999122	2017-11-20 18:17:53.999122
233	35	65	2017-11-20 18:17:54.004459	2017-11-20 18:17:54.004459
234	35	66	2017-11-20 18:17:54.010999	2017-11-20 18:17:54.010999
235	35	67	2017-11-20 18:17:54.023377	2017-11-20 18:17:54.023377
236	35	68	2017-11-20 18:17:54.028853	2017-11-20 18:17:54.028853
237	36	69	2017-11-20 18:22:26.915075	2017-11-20 18:22:26.915075
238	36	70	2017-11-20 18:22:26.920758	2017-11-20 18:22:26.920758
239	36	71	2017-11-20 18:22:26.928227	2017-11-20 18:22:26.928227
240	36	72	2017-11-20 18:22:26.933566	2017-11-20 18:22:26.933566
241	36	73	2017-11-20 18:22:26.939309	2017-11-20 18:22:26.939309
242	36	74	2017-11-20 18:22:26.944571	2017-11-20 18:22:26.944571
243	36	75	2017-11-20 18:22:26.949664	2017-11-20 18:22:26.949664
244	36	76	2017-11-20 18:22:26.955277	2017-11-20 18:22:26.955277
245	36	77	2017-11-20 18:22:26.959229	2017-11-20 18:22:26.959229
246	37	69	2017-11-20 18:22:55.453912	2017-11-20 18:22:55.453912
247	37	70	2017-11-20 18:22:55.459532	2017-11-20 18:22:55.459532
248	37	71	2017-11-20 18:22:55.464699	2017-11-20 18:22:55.464699
249	37	72	2017-11-20 18:22:55.470054	2017-11-20 18:22:55.470054
250	37	73	2017-11-20 18:22:55.4765	2017-11-20 18:22:55.4765
251	37	74	2017-11-20 18:22:55.483007	2017-11-20 18:22:55.483007
252	37	75	2017-11-20 18:22:55.489878	2017-11-20 18:22:55.489878
253	37	76	2017-11-20 18:22:55.495808	2017-11-20 18:22:55.495808
254	37	77	2017-11-20 18:22:55.501172	2017-11-20 18:22:55.501172
255	37	78	2017-11-20 18:22:55.506909	2017-11-20 18:22:55.506909
256	37	79	2017-11-20 18:22:55.512231	2017-11-20 18:22:55.512231
257	37	80	2017-11-20 18:22:55.518217	2017-11-20 18:22:55.518217
258	37	81	2017-11-20 18:22:55.526831	2017-11-20 18:22:55.526831
259	37	82	2017-11-20 18:22:55.534129	2017-11-20 18:22:55.534129
260	37	83	2017-11-20 18:22:55.540406	2017-11-20 18:22:55.540406
261	37	84	2017-11-20 18:22:55.545662	2017-11-20 18:22:55.545662
262	37	85	2017-11-20 18:22:55.551201	2017-11-20 18:22:55.551201
263	37	86	2017-11-20 18:22:55.556648	2017-11-20 18:22:55.556648
264	37	87	2017-11-20 18:22:55.562285	2017-11-20 18:22:55.562285
265	37	88	2017-11-20 18:22:55.569495	2017-11-20 18:22:55.569495
266	37	89	2017-11-20 18:22:55.576993	2017-11-20 18:22:55.576993
267	37	90	2017-11-20 18:22:55.583444	2017-11-20 18:22:55.583444
268	37	91	2017-11-20 18:22:55.590427	2017-11-20 18:22:55.590427
269	37	92	2017-11-20 18:22:55.599415	2017-11-20 18:22:55.599415
270	37	93	2017-11-20 18:22:55.604914	2017-11-20 18:22:55.604914
271	37	94	2017-11-20 18:22:55.610055	2017-11-20 18:22:55.610055
272	37	95	2017-11-20 18:22:55.614688	2017-11-20 18:22:55.614688
273	37	96	2017-11-20 18:22:55.618931	2017-11-20 18:22:55.618931
274	37	97	2017-11-20 18:22:55.623465	2017-11-20 18:22:55.623465
275	37	98	2017-11-20 18:22:55.627929	2017-11-20 18:22:55.627929
276	37	99	2017-11-20 18:22:55.63282	2017-11-20 18:22:55.63282
277	38	69	2017-11-20 18:23:10.63968	2017-11-20 18:23:10.63968
278	38	70	2017-11-20 18:23:10.645533	2017-11-20 18:23:10.645533
279	38	71	2017-11-20 18:23:10.651495	2017-11-20 18:23:10.651495
280	38	72	2017-11-20 18:23:10.656763	2017-11-20 18:23:10.656763
281	38	73	2017-11-20 18:23:10.661809	2017-11-20 18:23:10.661809
282	38	74	2017-11-20 18:23:10.667051	2017-11-20 18:23:10.667051
283	38	75	2017-11-20 18:23:10.672348	2017-11-20 18:23:10.672348
284	38	76	2017-11-20 18:23:10.678391	2017-11-20 18:23:10.678391
285	38	77	2017-11-20 18:23:10.684256	2017-11-20 18:23:10.684256
286	38	78	2017-11-20 18:23:10.689286	2017-11-20 18:23:10.689286
287	38	79	2017-11-20 18:23:10.705661	2017-11-20 18:23:10.705661
288	38	80	2017-11-20 18:23:10.710873	2017-11-20 18:23:10.710873
289	38	81	2017-11-20 18:23:10.715959	2017-11-20 18:23:10.715959
290	38	82	2017-11-20 18:23:10.721412	2017-11-20 18:23:10.721412
291	38	83	2017-11-20 18:23:10.726197	2017-11-20 18:23:10.726197
292	38	84	2017-11-20 18:23:10.731314	2017-11-20 18:23:10.731314
293	38	85	2017-11-20 18:23:10.735245	2017-11-20 18:23:10.735245
294	38	86	2017-11-20 18:23:10.738708	2017-11-20 18:23:10.738708
295	38	87	2017-11-20 18:23:10.742297	2017-11-20 18:23:10.742297
296	38	88	2017-11-20 18:23:10.745797	2017-11-20 18:23:10.745797
297	38	89	2017-11-20 18:23:10.749416	2017-11-20 18:23:10.749416
298	38	90	2017-11-20 18:23:10.753276	2017-11-20 18:23:10.753276
299	38	91	2017-11-20 18:23:10.756986	2017-11-20 18:23:10.756986
300	38	92	2017-11-20 18:23:10.760587	2017-11-20 18:23:10.760587
301	38	93	2017-11-20 18:23:10.764523	2017-11-20 18:23:10.764523
302	38	94	2017-11-20 18:23:10.768795	2017-11-20 18:23:10.768795
303	38	95	2017-11-20 18:23:10.773051	2017-11-20 18:23:10.773051
304	38	96	2017-11-20 18:23:10.777198	2017-11-20 18:23:10.777198
305	38	97	2017-11-20 18:23:10.781484	2017-11-20 18:23:10.781484
306	38	98	2017-11-20 18:23:10.785934	2017-11-20 18:23:10.785934
307	38	99	2017-11-20 18:23:10.790029	2017-11-20 18:23:10.790029
308	38	100	2017-11-20 18:23:10.794228	2017-11-20 18:23:10.794228
309	38	101	2017-11-20 18:23:10.798506	2017-11-20 18:23:10.798506
310	38	102	2017-11-20 18:23:10.802388	2017-11-20 18:23:10.802388
311	38	103	2017-11-20 18:23:10.806503	2017-11-20 18:23:10.806503
312	38	104	2017-11-20 18:23:10.810767	2017-11-20 18:23:10.810767
313	38	105	2017-11-20 18:23:10.815281	2017-11-20 18:23:10.815281
314	38	106	2017-11-20 18:23:10.81981	2017-11-20 18:23:10.81981
315	38	107	2017-11-20 18:23:10.823806	2017-11-20 18:23:10.823806
316	38	108	2017-11-20 18:23:10.828739	2017-11-20 18:23:10.828739
317	38	109	2017-11-20 18:23:10.833173	2017-11-20 18:23:10.833173
318	38	110	2017-11-20 18:23:10.837367	2017-11-20 18:23:10.837367
319	38	111	2017-11-20 18:23:10.841592	2017-11-20 18:23:10.841592
320	38	112	2017-11-20 18:23:10.845904	2017-11-20 18:23:10.845904
321	38	113	2017-11-20 18:23:10.850064	2017-11-20 18:23:10.850064
322	38	114	2017-11-20 18:23:10.854391	2017-11-20 18:23:10.854391
323	38	115	2017-11-20 18:23:10.859925	2017-11-20 18:23:10.859925
324	38	116	2017-11-20 18:23:10.866025	2017-11-20 18:23:10.866025
325	38	117	2017-11-20 18:23:10.872681	2017-11-20 18:23:10.872681
326	38	118	2017-11-20 18:23:10.879492	2017-11-20 18:23:10.879492
327	38	119	2017-11-20 18:23:10.885174	2017-11-20 18:23:10.885174
328	38	120	2017-11-20 18:23:10.890667	2017-11-20 18:23:10.890667
329	38	121	2017-11-20 18:23:10.896503	2017-11-20 18:23:10.896503
330	38	122	2017-11-20 18:23:10.90281	2017-11-20 18:23:10.90281
331	38	123	2017-11-20 18:23:10.908479	2017-11-20 18:23:10.908479
332	38	124	2017-11-20 18:23:10.913532	2017-11-20 18:23:10.913532
333	38	125	2017-11-20 18:23:10.918835	2017-11-20 18:23:10.918835
334	39	69	2017-11-20 18:23:28.646423	2017-11-20 18:23:28.646423
335	39	70	2017-11-20 18:23:28.650643	2017-11-20 18:23:28.650643
336	39	71	2017-11-20 18:23:28.655098	2017-11-20 18:23:28.655098
337	39	72	2017-11-20 18:23:28.659458	2017-11-20 18:23:28.659458
338	39	73	2017-11-20 18:23:28.663748	2017-11-20 18:23:28.663748
339	39	74	2017-11-20 18:23:28.667713	2017-11-20 18:23:28.667713
340	39	75	2017-11-20 18:23:28.671732	2017-11-20 18:23:28.671732
341	39	76	2017-11-20 18:23:28.676848	2017-11-20 18:23:28.676848
342	39	77	2017-11-20 18:23:28.683348	2017-11-20 18:23:28.683348
343	39	78	2017-11-20 18:23:28.690264	2017-11-20 18:23:28.690264
344	39	79	2017-11-20 18:23:28.697793	2017-11-20 18:23:28.697793
345	39	80	2017-11-20 18:23:28.70383	2017-11-20 18:23:28.70383
346	39	81	2017-11-20 18:23:28.70953	2017-11-20 18:23:28.70953
347	39	82	2017-11-20 18:23:28.716201	2017-11-20 18:23:28.716201
348	39	83	2017-11-20 18:23:28.723282	2017-11-20 18:23:28.723282
349	39	84	2017-11-20 18:23:28.729226	2017-11-20 18:23:28.729226
350	39	85	2017-11-20 18:23:28.735093	2017-11-20 18:23:28.735093
351	39	86	2017-11-20 18:23:28.741472	2017-11-20 18:23:28.741472
352	39	87	2017-11-20 18:23:28.748274	2017-11-20 18:23:28.748274
353	39	88	2017-11-20 18:23:28.754496	2017-11-20 18:23:28.754496
354	39	89	2017-11-20 18:23:28.761191	2017-11-20 18:23:28.761191
355	39	90	2017-11-20 18:23:28.767691	2017-11-20 18:23:28.767691
356	39	91	2017-11-20 18:23:28.773859	2017-11-20 18:23:28.773859
357	39	92	2017-11-20 18:23:28.778759	2017-11-20 18:23:28.778759
358	39	93	2017-11-20 18:23:28.783808	2017-11-20 18:23:28.783808
359	39	94	2017-11-20 18:23:28.788605	2017-11-20 18:23:28.788605
360	39	95	2017-11-20 18:23:28.792969	2017-11-20 18:23:28.792969
361	39	96	2017-11-20 18:23:28.797547	2017-11-20 18:23:28.797547
362	39	97	2017-11-20 18:23:28.801887	2017-11-20 18:23:28.801887
363	39	98	2017-11-20 18:23:28.806554	2017-11-20 18:23:28.806554
364	39	99	2017-11-20 18:23:28.811005	2017-11-20 18:23:28.811005
365	39	100	2017-11-20 18:23:28.815772	2017-11-20 18:23:28.815772
366	39	101	2017-11-20 18:23:28.822133	2017-11-20 18:23:28.822133
367	39	102	2017-11-20 18:23:28.828508	2017-11-20 18:23:28.828508
368	39	103	2017-11-20 18:23:28.834872	2017-11-20 18:23:28.834872
369	39	104	2017-11-20 18:23:28.840592	2017-11-20 18:23:28.840592
370	39	105	2017-11-20 18:23:28.846087	2017-11-20 18:23:28.846087
371	39	106	2017-11-20 18:23:28.852606	2017-11-20 18:23:28.852606
372	39	107	2017-11-20 18:23:28.85906	2017-11-20 18:23:28.85906
373	39	108	2017-11-20 18:23:28.864152	2017-11-20 18:23:28.864152
374	39	109	2017-11-20 18:23:28.869577	2017-11-20 18:23:28.869577
375	39	110	2017-11-20 18:23:28.87397	2017-11-20 18:23:28.87397
376	39	111	2017-11-20 18:23:28.878644	2017-11-20 18:23:28.878644
377	39	112	2017-11-20 18:23:28.896103	2017-11-20 18:23:28.896103
378	39	113	2017-11-20 18:23:28.89992	2017-11-20 18:23:28.89992
379	39	114	2017-11-20 18:23:28.903488	2017-11-20 18:23:28.903488
380	39	115	2017-11-20 18:23:28.906761	2017-11-20 18:23:28.906761
381	39	116	2017-11-20 18:23:28.910254	2017-11-20 18:23:28.910254
382	39	117	2017-11-20 18:23:28.914484	2017-11-20 18:23:28.914484
383	39	118	2017-11-20 18:23:28.918545	2017-11-20 18:23:28.918545
384	39	119	2017-11-20 18:23:28.922368	2017-11-20 18:23:28.922368
385	39	120	2017-11-20 18:23:28.927268	2017-11-20 18:23:28.927268
386	39	121	2017-11-20 18:23:28.932869	2017-11-20 18:23:28.932869
387	39	122	2017-11-20 18:23:28.937387	2017-11-20 18:23:28.937387
388	39	123	2017-11-20 18:23:28.941281	2017-11-20 18:23:28.941281
389	39	124	2017-11-20 18:23:28.944786	2017-11-20 18:23:28.944786
390	39	125	2017-11-20 18:23:28.947998	2017-11-20 18:23:28.947998
391	39	126	2017-11-20 18:23:28.951367	2017-11-20 18:23:28.951367
392	39	127	2017-11-20 18:23:28.954674	2017-11-20 18:23:28.954674
393	39	128	2017-11-20 18:23:28.959468	2017-11-20 18:23:28.959468
394	39	129	2017-11-20 18:23:28.964435	2017-11-20 18:23:28.964435
395	39	130	2017-11-20 18:23:28.969718	2017-11-20 18:23:28.969718
396	39	131	2017-11-20 18:23:28.974836	2017-11-20 18:23:28.974836
397	39	132	2017-11-20 18:23:28.980211	2017-11-20 18:23:28.980211
398	39	133	2017-11-20 18:23:28.98554	2017-11-20 18:23:28.98554
399	39	134	2017-11-20 18:23:28.990554	2017-11-20 18:23:28.990554
400	39	135	2017-11-20 18:23:28.995845	2017-11-20 18:23:28.995845
401	39	136	2017-11-20 18:23:29.000931	2017-11-20 18:23:29.000931
402	39	137	2017-11-20 18:23:29.005874	2017-11-20 18:23:29.005874
403	39	138	2017-11-20 18:23:29.013663	2017-11-20 18:23:29.013663
404	39	139	2017-11-20 18:23:29.020659	2017-11-20 18:23:29.020659
405	39	140	2017-11-20 18:23:29.025648	2017-11-20 18:23:29.025648
406	39	141	2017-11-20 18:23:29.031252	2017-11-20 18:23:29.031252
407	39	142	2017-11-20 18:23:29.036475	2017-11-20 18:23:29.036475
408	39	143	2017-11-20 18:23:29.04202	2017-11-20 18:23:29.04202
409	39	144	2017-11-20 18:23:29.047585	2017-11-20 18:23:29.047585
410	39	145	2017-11-20 18:23:29.052864	2017-11-20 18:23:29.052864
411	39	146	2017-11-20 18:23:29.057915	2017-11-20 18:23:29.057915
412	39	147	2017-11-20 18:23:29.062828	2017-11-20 18:23:29.062828
413	39	148	2017-11-20 18:23:29.067731	2017-11-20 18:23:29.067731
414	40	69	2017-11-20 18:23:43.494752	2017-11-20 18:23:43.494752
415	40	70	2017-11-20 18:23:43.498781	2017-11-20 18:23:43.498781
416	40	71	2017-11-20 18:23:43.502954	2017-11-20 18:23:43.502954
417	40	72	2017-11-20 18:23:43.506932	2017-11-20 18:23:43.506932
418	40	73	2017-11-20 18:23:43.511098	2017-11-20 18:23:43.511098
419	40	74	2017-11-20 18:23:43.515326	2017-11-20 18:23:43.515326
420	40	75	2017-11-20 18:23:43.51962	2017-11-20 18:23:43.51962
421	40	76	2017-11-20 18:23:43.523701	2017-11-20 18:23:43.523701
422	40	77	2017-11-20 18:23:43.527643	2017-11-20 18:23:43.527643
423	40	78	2017-11-20 18:23:43.532395	2017-11-20 18:23:43.532395
424	40	79	2017-11-20 18:23:43.536775	2017-11-20 18:23:43.536775
425	40	80	2017-11-20 18:23:43.540895	2017-11-20 18:23:43.540895
426	40	81	2017-11-20 18:23:43.546122	2017-11-20 18:23:43.546122
427	40	82	2017-11-20 18:23:43.551683	2017-11-20 18:23:43.551683
428	40	83	2017-11-20 18:23:43.557244	2017-11-20 18:23:43.557244
429	40	84	2017-11-20 18:23:43.562644	2017-11-20 18:23:43.562644
430	40	85	2017-11-20 18:23:43.567877	2017-11-20 18:23:43.567877
431	40	86	2017-11-20 18:23:43.573245	2017-11-20 18:23:43.573245
432	40	87	2017-11-20 18:23:43.579123	2017-11-20 18:23:43.579123
433	40	88	2017-11-20 18:23:43.584656	2017-11-20 18:23:43.584656
434	40	89	2017-11-20 18:23:43.59099	2017-11-20 18:23:43.59099
435	40	90	2017-11-20 18:23:43.597309	2017-11-20 18:23:43.597309
436	40	91	2017-11-20 18:23:43.604176	2017-11-20 18:23:43.604176
437	40	92	2017-11-20 18:23:43.609572	2017-11-20 18:23:43.609572
438	40	93	2017-11-20 18:23:43.615313	2017-11-20 18:23:43.615313
439	40	94	2017-11-20 18:23:43.62085	2017-11-20 18:23:43.62085
440	40	95	2017-11-20 18:23:43.626193	2017-11-20 18:23:43.626193
441	40	96	2017-11-20 18:23:43.631572	2017-11-20 18:23:43.631572
442	40	97	2017-11-20 18:23:43.63741	2017-11-20 18:23:43.63741
443	40	98	2017-11-20 18:23:43.643708	2017-11-20 18:23:43.643708
444	40	99	2017-11-20 18:23:43.649442	2017-11-20 18:23:43.649442
445	40	100	2017-11-20 18:23:43.65498	2017-11-20 18:23:43.65498
446	40	101	2017-11-20 18:23:43.660476	2017-11-20 18:23:43.660476
447	40	102	2017-11-20 18:23:43.666209	2017-11-20 18:23:43.666209
448	40	103	2017-11-20 18:23:43.67178	2017-11-20 18:23:43.67178
449	40	104	2017-11-20 18:23:43.677494	2017-11-20 18:23:43.677494
450	40	105	2017-11-20 18:23:43.683109	2017-11-20 18:23:43.683109
451	40	106	2017-11-20 18:23:43.68869	2017-11-20 18:23:43.68869
452	40	107	2017-11-20 18:23:43.694631	2017-11-20 18:23:43.694631
453	40	108	2017-11-20 18:23:43.711794	2017-11-20 18:23:43.711794
454	40	109	2017-11-20 18:23:43.718433	2017-11-20 18:23:43.718433
455	40	110	2017-11-20 18:23:43.724542	2017-11-20 18:23:43.724542
456	40	111	2017-11-20 18:23:43.729954	2017-11-20 18:23:43.729954
457	40	112	2017-11-20 18:23:43.735977	2017-11-20 18:23:43.735977
458	40	113	2017-11-20 18:23:43.74291	2017-11-20 18:23:43.74291
459	40	114	2017-11-20 18:23:43.747572	2017-11-20 18:23:43.747572
460	40	115	2017-11-20 18:23:43.751532	2017-11-20 18:23:43.751532
461	40	116	2017-11-20 18:23:43.755386	2017-11-20 18:23:43.755386
462	40	117	2017-11-20 18:23:43.759302	2017-11-20 18:23:43.759302
463	40	118	2017-11-20 18:23:43.763521	2017-11-20 18:23:43.763521
464	40	119	2017-11-20 18:23:43.768499	2017-11-20 18:23:43.768499
465	40	120	2017-11-20 18:23:43.772628	2017-11-20 18:23:43.772628
466	40	121	2017-11-20 18:23:43.776419	2017-11-20 18:23:43.776419
467	40	122	2017-11-20 18:23:43.783968	2017-11-20 18:23:43.783968
468	40	123	2017-11-20 18:23:43.791999	2017-11-20 18:23:43.791999
469	40	124	2017-11-20 18:23:43.796378	2017-11-20 18:23:43.796378
470	40	125	2017-11-20 18:23:43.801675	2017-11-20 18:23:43.801675
471	40	126	2017-11-20 18:23:43.806861	2017-11-20 18:23:43.806861
472	40	127	2017-11-20 18:23:43.81128	2017-11-20 18:23:43.81128
473	40	128	2017-11-20 18:23:43.816129	2017-11-20 18:23:43.816129
474	40	129	2017-11-20 18:23:43.819883	2017-11-20 18:23:43.819883
475	40	130	2017-11-20 18:23:43.824003	2017-11-20 18:23:43.824003
476	40	131	2017-11-20 18:23:43.828231	2017-11-20 18:23:43.828231
477	40	132	2017-11-20 18:23:43.832063	2017-11-20 18:23:43.832063
478	40	133	2017-11-20 18:23:43.837061	2017-11-20 18:23:43.837061
479	40	134	2017-11-20 18:23:43.841909	2017-11-20 18:23:43.841909
480	40	135	2017-11-20 18:23:43.845866	2017-11-20 18:23:43.845866
481	40	136	2017-11-20 18:23:43.849768	2017-11-20 18:23:43.849768
482	40	137	2017-11-20 18:23:43.853563	2017-11-20 18:23:43.853563
483	40	138	2017-11-20 18:23:43.858014	2017-11-20 18:23:43.858014
484	40	139	2017-11-20 18:23:43.862375	2017-11-20 18:23:43.862375
485	40	140	2017-11-20 18:23:43.866566	2017-11-20 18:23:43.866566
486	40	141	2017-11-20 18:23:43.871274	2017-11-20 18:23:43.871274
487	40	142	2017-11-20 18:23:43.87583	2017-11-20 18:23:43.87583
488	40	143	2017-11-20 18:23:43.879933	2017-11-20 18:23:43.879933
489	40	144	2017-11-20 18:23:43.884474	2017-11-20 18:23:43.884474
490	40	145	2017-11-20 18:23:43.889926	2017-11-20 18:23:43.889926
491	40	146	2017-11-20 18:23:43.895403	2017-11-20 18:23:43.895403
492	40	147	2017-11-20 18:23:43.900949	2017-11-20 18:23:43.900949
493	40	148	2017-11-20 18:23:43.906273	2017-11-20 18:23:43.906273
494	40	149	2017-11-20 18:23:43.91171	2017-11-20 18:23:43.91171
495	40	150	2017-11-20 18:23:43.920131	2017-11-20 18:23:43.920131
496	40	151	2017-11-20 18:23:43.925936	2017-11-20 18:23:43.925936
497	40	152	2017-11-20 18:23:43.931641	2017-11-20 18:23:43.931641
498	40	153	2017-11-20 18:23:43.937909	2017-11-20 18:23:43.937909
499	40	154	2017-11-20 18:23:43.944473	2017-11-20 18:23:43.944473
500	40	155	2017-11-20 18:23:43.950873	2017-11-20 18:23:43.950873
501	40	156	2017-11-20 18:23:43.956857	2017-11-20 18:23:43.956857
502	40	157	2017-11-20 18:23:43.962659	2017-11-20 18:23:43.962659
503	40	158	2017-11-20 18:23:43.968562	2017-11-20 18:23:43.968562
504	40	159	2017-11-20 18:23:43.974037	2017-11-20 18:23:43.974037
505	40	160	2017-11-20 18:23:43.979004	2017-11-20 18:23:43.979004
506	41	161	2017-11-20 18:38:51.626124	2017-11-20 18:38:51.626124
507	41	162	2017-11-20 18:38:51.631665	2017-11-20 18:38:51.631665
508	41	163	2017-11-20 18:38:51.636332	2017-11-20 18:38:51.636332
509	41	164	2017-11-20 18:38:51.642929	2017-11-20 18:38:51.642929
510	41	165	2017-11-20 18:38:51.65133	2017-11-20 18:38:51.65133
511	42	161	2017-11-20 18:39:09.183624	2017-11-20 18:39:09.183624
512	42	162	2017-11-20 18:39:09.189273	2017-11-20 18:39:09.189273
513	42	163	2017-11-20 18:39:09.194914	2017-11-20 18:39:09.194914
514	42	164	2017-11-20 18:39:09.200601	2017-11-20 18:39:09.200601
515	42	165	2017-11-20 18:39:09.206387	2017-11-20 18:39:09.206387
516	42	166	2017-11-20 18:39:09.211814	2017-11-20 18:39:09.211814
517	42	167	2017-11-20 18:39:09.217888	2017-11-20 18:39:09.217888
518	42	168	2017-11-20 18:39:09.223784	2017-11-20 18:39:09.223784
519	42	169	2017-11-20 18:39:09.229341	2017-11-20 18:39:09.229341
520	42	170	2017-11-20 18:39:09.235242	2017-11-20 18:39:09.235242
521	42	171	2017-11-20 18:39:09.241829	2017-11-20 18:39:09.241829
522	42	172	2017-11-20 18:39:09.248475	2017-11-20 18:39:09.248475
523	42	173	2017-11-20 18:39:09.254402	2017-11-20 18:39:09.254402
524	43	161	2017-11-20 18:39:30.640117	2017-11-20 18:39:30.640117
525	43	162	2017-11-20 18:39:30.645523	2017-11-20 18:39:30.645523
526	43	163	2017-11-20 18:39:30.650538	2017-11-20 18:39:30.650538
527	43	164	2017-11-20 18:39:30.655424	2017-11-20 18:39:30.655424
528	43	165	2017-11-20 18:39:30.660755	2017-11-20 18:39:30.660755
529	43	166	2017-11-20 18:39:30.665749	2017-11-20 18:39:30.665749
530	43	167	2017-11-20 18:39:30.671016	2017-11-20 18:39:30.671016
531	43	168	2017-11-20 18:39:30.676716	2017-11-20 18:39:30.676716
532	43	169	2017-11-20 18:39:30.683328	2017-11-20 18:39:30.683328
533	43	170	2017-11-20 18:39:30.688961	2017-11-20 18:39:30.688961
534	43	171	2017-11-20 18:39:30.695295	2017-11-20 18:39:30.695295
535	43	172	2017-11-20 18:39:30.701545	2017-11-20 18:39:30.701545
536	43	173	2017-11-20 18:39:30.707559	2017-11-20 18:39:30.707559
537	43	174	2017-11-20 18:39:30.713198	2017-11-20 18:39:30.713198
538	43	175	2017-11-20 18:39:30.718376	2017-11-20 18:39:30.718376
539	43	176	2017-11-20 18:39:30.72345	2017-11-20 18:39:30.72345
540	43	177	2017-11-20 18:39:30.728806	2017-11-20 18:39:30.728806
541	43	178	2017-11-20 18:39:30.732856	2017-11-20 18:39:30.732856
542	43	179	2017-11-20 18:39:30.737116	2017-11-20 18:39:30.737116
543	43	180	2017-11-20 18:39:30.741063	2017-11-20 18:39:30.741063
544	43	181	2017-11-20 18:39:30.747643	2017-11-20 18:39:30.747643
545	43	182	2017-11-20 18:39:30.75278	2017-11-20 18:39:30.75278
546	44	161	2017-11-20 18:39:46.237858	2017-11-20 18:39:46.237858
547	44	162	2017-11-20 18:39:46.242329	2017-11-20 18:39:46.242329
548	44	163	2017-11-20 18:39:46.246357	2017-11-20 18:39:46.246357
549	44	164	2017-11-20 18:39:46.250444	2017-11-20 18:39:46.250444
550	44	165	2017-11-20 18:39:46.254994	2017-11-20 18:39:46.254994
551	44	166	2017-11-20 18:39:46.261276	2017-11-20 18:39:46.261276
552	44	167	2017-11-20 18:39:46.266184	2017-11-20 18:39:46.266184
553	44	168	2017-11-20 18:39:46.271444	2017-11-20 18:39:46.271444
554	44	169	2017-11-20 18:39:46.276135	2017-11-20 18:39:46.276135
555	44	170	2017-11-20 18:39:46.280331	2017-11-20 18:39:46.280331
556	44	171	2017-11-20 18:39:46.285422	2017-11-20 18:39:46.285422
557	44	172	2017-11-20 18:39:46.291135	2017-11-20 18:39:46.291135
558	44	173	2017-11-20 18:39:46.296694	2017-11-20 18:39:46.296694
559	44	174	2017-11-20 18:39:46.30239	2017-11-20 18:39:46.30239
560	44	175	2017-11-20 18:39:46.306937	2017-11-20 18:39:46.306937
561	44	176	2017-11-20 18:39:46.3108	2017-11-20 18:39:46.3108
562	44	177	2017-11-20 18:39:46.315211	2017-11-20 18:39:46.315211
563	44	178	2017-11-20 18:39:46.319637	2017-11-20 18:39:46.319637
564	44	179	2017-11-20 18:39:46.325359	2017-11-20 18:39:46.325359
565	44	180	2017-11-20 18:39:46.330116	2017-11-20 18:39:46.330116
566	44	181	2017-11-20 18:39:46.334107	2017-11-20 18:39:46.334107
567	44	182	2017-11-20 18:39:46.338081	2017-11-20 18:39:46.338081
568	44	183	2017-11-20 18:39:46.344098	2017-11-20 18:39:46.344098
569	44	184	2017-11-20 18:39:46.348794	2017-11-20 18:39:46.348794
570	44	185	2017-11-20 18:39:46.352892	2017-11-20 18:39:46.352892
571	44	186	2017-11-20 18:39:46.357466	2017-11-20 18:39:46.357466
572	44	187	2017-11-20 18:39:46.361526	2017-11-20 18:39:46.361526
573	44	188	2017-11-20 18:39:46.365469	2017-11-20 18:39:46.365469
574	44	189	2017-11-20 18:39:46.369137	2017-11-20 18:39:46.369137
575	44	190	2017-11-20 18:39:46.374239	2017-11-20 18:39:46.374239
576	44	191	2017-11-20 18:39:46.379367	2017-11-20 18:39:46.379367
577	45	161	2017-11-20 18:40:06.519772	2017-11-20 18:40:06.519772
578	45	162	2017-11-20 18:40:06.526139	2017-11-20 18:40:06.526139
579	45	163	2017-11-20 18:40:06.532036	2017-11-20 18:40:06.532036
580	45	164	2017-11-20 18:40:06.53806	2017-11-20 18:40:06.53806
581	45	165	2017-11-20 18:40:06.544066	2017-11-20 18:40:06.544066
582	45	166	2017-11-20 18:40:06.549138	2017-11-20 18:40:06.549138
583	45	167	2017-11-20 18:40:06.554656	2017-11-20 18:40:06.554656
584	45	168	2017-11-20 18:40:06.559941	2017-11-20 18:40:06.559941
585	45	169	2017-11-20 18:40:06.565071	2017-11-20 18:40:06.565071
586	45	170	2017-11-20 18:40:06.569824	2017-11-20 18:40:06.569824
587	45	171	2017-11-20 18:40:06.574809	2017-11-20 18:40:06.574809
588	45	172	2017-11-20 18:40:06.57984	2017-11-20 18:40:06.57984
589	45	173	2017-11-20 18:40:06.585303	2017-11-20 18:40:06.585303
590	45	174	2017-11-20 18:40:06.590633	2017-11-20 18:40:06.590633
591	45	175	2017-11-20 18:40:06.596288	2017-11-20 18:40:06.596288
592	45	176	2017-11-20 18:40:06.601627	2017-11-20 18:40:06.601627
593	45	177	2017-11-20 18:40:06.607958	2017-11-20 18:40:06.607958
594	45	178	2017-11-20 18:40:06.614722	2017-11-20 18:40:06.614722
595	45	179	2017-11-20 18:40:06.621301	2017-11-20 18:40:06.621301
596	45	180	2017-11-20 18:40:06.627598	2017-11-20 18:40:06.627598
597	45	181	2017-11-20 18:40:06.632835	2017-11-20 18:40:06.632835
598	45	182	2017-11-20 18:40:06.638628	2017-11-20 18:40:06.638628
599	45	183	2017-11-20 18:40:06.644565	2017-11-20 18:40:06.644565
600	45	184	2017-11-20 18:40:06.653409	2017-11-20 18:40:06.653409
601	45	185	2017-11-20 18:40:06.660105	2017-11-20 18:40:06.660105
602	45	186	2017-11-20 18:40:06.664643	2017-11-20 18:40:06.664643
603	45	187	2017-11-20 18:40:06.668755	2017-11-20 18:40:06.668755
604	45	188	2017-11-20 18:40:06.673237	2017-11-20 18:40:06.673237
605	45	189	2017-11-20 18:40:06.677401	2017-11-20 18:40:06.677401
606	45	190	2017-11-20 18:40:06.682088	2017-11-20 18:40:06.682088
607	45	191	2017-11-20 18:40:06.687603	2017-11-20 18:40:06.687603
608	45	192	2017-11-20 18:40:06.691856	2017-11-20 18:40:06.691856
609	45	193	2017-11-20 18:40:06.696301	2017-11-20 18:40:06.696301
610	45	194	2017-11-20 18:40:06.701256	2017-11-20 18:40:06.701256
611	45	195	2017-11-20 18:40:06.706428	2017-11-20 18:40:06.706428
612	45	196	2017-11-20 18:40:06.711949	2017-11-20 18:40:06.711949
613	45	197	2017-11-20 18:40:06.71695	2017-11-20 18:40:06.71695
614	45	198	2017-11-20 18:40:06.72146	2017-11-20 18:40:06.72146
615	45	199	2017-11-20 18:40:06.726067	2017-11-20 18:40:06.726067
616	45	200	2017-11-20 18:40:06.730004	2017-11-20 18:40:06.730004
617	45	201	2017-11-20 18:40:06.733869	2017-11-20 18:40:06.733869
618	45	202	2017-11-20 18:40:06.738039	2017-11-20 18:40:06.738039
619	45	203	2017-11-20 18:40:06.742048	2017-11-20 18:40:06.742048
620	45	204	2017-11-20 18:40:06.746161	2017-11-20 18:40:06.746161
621	45	205	2017-11-20 18:40:06.750571	2017-11-20 18:40:06.750571
622	45	206	2017-11-20 18:40:06.755063	2017-11-20 18:40:06.755063
623	45	207	2017-11-20 18:40:06.759926	2017-11-20 18:40:06.759926
624	45	208	2017-11-20 18:40:06.764195	2017-11-20 18:40:06.764195
625	45	209	2017-11-20 18:40:06.768176	2017-11-20 18:40:06.768176
626	45	210	2017-11-20 18:40:06.772457	2017-11-20 18:40:06.772457
627	46	211	2017-11-20 18:43:49.137555	2017-11-20 18:43:49.137555
628	46	212	2017-11-20 18:43:49.143652	2017-11-20 18:43:49.143652
629	46	213	2017-11-20 18:43:49.149359	2017-11-20 18:43:49.149359
630	46	214	2017-11-20 18:43:49.154941	2017-11-20 18:43:49.154941
631	46	215	2017-11-20 18:43:49.160741	2017-11-20 18:43:49.160741
632	46	216	2017-11-20 18:43:49.166304	2017-11-20 18:43:49.166304
633	46	217	2017-11-20 18:43:49.171774	2017-11-20 18:43:49.171774
634	46	218	2017-11-20 18:43:49.177074	2017-11-20 18:43:49.177074
635	46	219	2017-11-20 18:43:49.182402	2017-11-20 18:43:49.182402
636	47	211	2017-11-20 18:44:06.774854	2017-11-20 18:44:06.774854
637	47	212	2017-11-20 18:44:06.780235	2017-11-20 18:44:06.780235
638	47	213	2017-11-20 18:44:06.786094	2017-11-20 18:44:06.786094
639	47	214	2017-11-20 18:44:06.79252	2017-11-20 18:44:06.79252
640	47	215	2017-11-20 18:44:06.79866	2017-11-20 18:44:06.79866
641	47	216	2017-11-20 18:44:06.803794	2017-11-20 18:44:06.803794
642	47	217	2017-11-20 18:44:06.809545	2017-11-20 18:44:06.809545
643	47	218	2017-11-20 18:44:06.815633	2017-11-20 18:44:06.815633
644	47	219	2017-11-20 18:44:06.821945	2017-11-20 18:44:06.821945
645	47	220	2017-11-20 18:44:06.827543	2017-11-20 18:44:06.827543
646	47	221	2017-11-20 18:44:06.833376	2017-11-20 18:44:06.833376
647	47	222	2017-11-20 18:44:06.839781	2017-11-20 18:44:06.839781
648	47	223	2017-11-20 18:44:06.845189	2017-11-20 18:44:06.845189
649	47	224	2017-11-20 18:44:06.850166	2017-11-20 18:44:06.850166
650	47	225	2017-11-20 18:44:06.855243	2017-11-20 18:44:06.855243
651	48	211	2017-11-20 18:44:27.152069	2017-11-20 18:44:27.152069
652	48	212	2017-11-20 18:44:27.158234	2017-11-20 18:44:27.158234
653	48	213	2017-11-20 18:44:27.164286	2017-11-20 18:44:27.164286
654	48	214	2017-11-20 18:44:27.170314	2017-11-20 18:44:27.170314
655	48	215	2017-11-20 18:44:27.174987	2017-11-20 18:44:27.174987
656	48	216	2017-11-20 18:44:27.179207	2017-11-20 18:44:27.179207
657	48	217	2017-11-20 18:44:27.183258	2017-11-20 18:44:27.183258
658	48	218	2017-11-20 18:44:27.187245	2017-11-20 18:44:27.187245
659	48	219	2017-11-20 18:44:27.192213	2017-11-20 18:44:27.192213
660	48	220	2017-11-20 18:44:27.197755	2017-11-20 18:44:27.197755
661	48	221	2017-11-20 18:44:27.20257	2017-11-20 18:44:27.20257
662	48	222	2017-11-20 18:44:27.207037	2017-11-20 18:44:27.207037
663	48	223	2017-11-20 18:44:27.211658	2017-11-20 18:44:27.211658
664	48	224	2017-11-20 18:44:27.216289	2017-11-20 18:44:27.216289
665	48	225	2017-11-20 18:44:27.220716	2017-11-20 18:44:27.220716
666	48	226	2017-11-20 18:44:27.225274	2017-11-20 18:44:27.225274
667	48	227	2017-11-20 18:44:27.229857	2017-11-20 18:44:27.229857
668	48	228	2017-11-20 18:44:27.234243	2017-11-20 18:44:27.234243
669	49	211	2017-11-20 18:44:48.600682	2017-11-20 18:44:48.600682
670	49	212	2017-11-20 18:44:48.608167	2017-11-20 18:44:48.608167
671	49	213	2017-11-20 18:44:48.615314	2017-11-20 18:44:48.615314
672	49	214	2017-11-20 18:44:48.623148	2017-11-20 18:44:48.623148
673	49	215	2017-11-20 18:44:48.630357	2017-11-20 18:44:48.630357
674	49	216	2017-11-20 18:44:48.636727	2017-11-20 18:44:48.636727
675	49	217	2017-11-20 18:44:48.64329	2017-11-20 18:44:48.64329
676	49	218	2017-11-20 18:44:48.65023	2017-11-20 18:44:48.65023
677	49	219	2017-11-20 18:44:48.657644	2017-11-20 18:44:48.657644
678	49	220	2017-11-20 18:44:48.662979	2017-11-20 18:44:48.662979
679	49	221	2017-11-20 18:44:48.679803	2017-11-20 18:44:48.679803
680	49	222	2017-11-20 18:44:48.68436	2017-11-20 18:44:48.68436
681	49	223	2017-11-20 18:44:48.68828	2017-11-20 18:44:48.68828
682	49	224	2017-11-20 18:44:48.692292	2017-11-20 18:44:48.692292
683	49	225	2017-11-20 18:44:48.695995	2017-11-20 18:44:48.695995
684	49	226	2017-11-20 18:44:48.699948	2017-11-20 18:44:48.699948
685	49	227	2017-11-20 18:44:48.704072	2017-11-20 18:44:48.704072
686	49	228	2017-11-20 18:44:48.708058	2017-11-20 18:44:48.708058
687	49	229	2017-11-20 18:44:48.712278	2017-11-20 18:44:48.712278
688	49	230	2017-11-20 18:44:48.716576	2017-11-20 18:44:48.716576
689	49	231	2017-11-20 18:44:48.721144	2017-11-20 18:44:48.721144
690	49	232	2017-11-20 18:44:48.72628	2017-11-20 18:44:48.72628
691	50	211	2017-11-20 18:45:07.559325	2017-11-20 18:45:07.559325
692	50	212	2017-11-20 18:45:07.566592	2017-11-20 18:45:07.566592
693	50	213	2017-11-20 18:45:07.572458	2017-11-20 18:45:07.572458
694	50	214	2017-11-20 18:45:07.580307	2017-11-20 18:45:07.580307
695	50	215	2017-11-20 18:45:07.586498	2017-11-20 18:45:07.586498
696	50	216	2017-11-20 18:45:07.591672	2017-11-20 18:45:07.591672
697	50	217	2017-11-20 18:45:07.597281	2017-11-20 18:45:07.597281
698	50	218	2017-11-20 18:45:07.603363	2017-11-20 18:45:07.603363
699	50	219	2017-11-20 18:45:07.609182	2017-11-20 18:45:07.609182
700	50	220	2017-11-20 18:45:07.614268	2017-11-20 18:45:07.614268
701	50	221	2017-11-20 18:45:07.621197	2017-11-20 18:45:07.621197
702	50	222	2017-11-20 18:45:07.627707	2017-11-20 18:45:07.627707
703	50	223	2017-11-20 18:45:07.63301	2017-11-20 18:45:07.63301
704	50	224	2017-11-20 18:45:07.638132	2017-11-20 18:45:07.638132
705	50	225	2017-11-20 18:45:07.643084	2017-11-20 18:45:07.643084
706	50	226	2017-11-20 18:45:07.649404	2017-11-20 18:45:07.649404
707	50	227	2017-11-20 18:45:07.655432	2017-11-20 18:45:07.655432
708	50	228	2017-11-20 18:45:07.661008	2017-11-20 18:45:07.661008
709	50	229	2017-11-20 18:45:07.666259	2017-11-20 18:45:07.666259
710	50	230	2017-11-20 18:45:07.671984	2017-11-20 18:45:07.671984
711	50	231	2017-11-20 18:45:07.679168	2017-11-20 18:45:07.679168
712	50	232	2017-11-20 18:45:07.685278	2017-11-20 18:45:07.685278
713	50	233	2017-11-20 18:45:07.691135	2017-11-20 18:45:07.691135
714	50	234	2017-11-20 18:45:07.697026	2017-11-20 18:45:07.697026
715	50	235	2017-11-20 18:45:07.703046	2017-11-20 18:45:07.703046
716	50	236	2017-11-20 18:45:07.709102	2017-11-20 18:45:07.709102
717	50	237	2017-11-20 18:45:07.715136	2017-11-20 18:45:07.715136
718	50	238	2017-11-20 18:45:07.720814	2017-11-20 18:45:07.720814
719	50	239	2017-11-20 18:45:07.72544	2017-11-20 18:45:07.72544
720	50	240	2017-11-20 18:45:07.730351	2017-11-20 18:45:07.730351
721	50	241	2017-11-20 18:45:07.735277	2017-11-20 18:45:07.735277
722	50	242	2017-11-20 18:45:07.740386	2017-11-20 18:45:07.740386
723	51	243	2017-11-20 18:54:46.502201	2017-11-20 18:54:46.502201
724	51	244	2017-11-20 18:54:46.508344	2017-11-20 18:54:46.508344
725	51	245	2017-11-20 18:54:46.513625	2017-11-20 18:54:46.513625
726	51	246	2017-11-20 18:54:46.520581	2017-11-20 18:54:46.520581
727	51	247	2017-11-20 18:54:46.526617	2017-11-20 18:54:46.526617
728	51	248	2017-11-20 18:54:46.530785	2017-11-20 18:54:46.530785
729	51	249	2017-11-20 18:54:46.5344	2017-11-20 18:54:46.5344
730	52	243	2017-11-20 18:55:09.527309	2017-11-20 18:55:09.527309
731	52	244	2017-11-20 18:55:09.53195	2017-11-20 18:55:09.53195
732	52	245	2017-11-20 18:55:09.536312	2017-11-20 18:55:09.536312
733	52	246	2017-11-20 18:55:09.541266	2017-11-20 18:55:09.541266
734	52	247	2017-11-20 18:55:09.546006	2017-11-20 18:55:09.546006
735	52	248	2017-11-20 18:55:09.55037	2017-11-20 18:55:09.55037
736	52	249	2017-11-20 18:55:09.554786	2017-11-20 18:55:09.554786
737	52	250	2017-11-20 18:55:09.55921	2017-11-20 18:55:09.55921
738	52	251	2017-11-20 18:55:09.563534	2017-11-20 18:55:09.563534
739	52	252	2017-11-20 18:55:09.567991	2017-11-20 18:55:09.567991
740	52	253	2017-11-20 18:55:09.572674	2017-11-20 18:55:09.572674
741	52	254	2017-11-20 18:55:09.576707	2017-11-20 18:55:09.576707
742	52	255	2017-11-20 18:55:09.582173	2017-11-20 18:55:09.582173
743	52	256	2017-11-20 18:55:09.587958	2017-11-20 18:55:09.587958
744	52	257	2017-11-20 18:55:09.593784	2017-11-20 18:55:09.593784
745	52	258	2017-11-20 18:55:09.599566	2017-11-20 18:55:09.599566
746	52	259	2017-11-20 18:55:09.605356	2017-11-20 18:55:09.605356
747	52	260	2017-11-20 18:55:09.610875	2017-11-20 18:55:09.610875
748	52	261	2017-11-20 18:55:09.616922	2017-11-20 18:55:09.616922
749	53	243	2017-11-20 18:55:16.827821	2017-11-20 18:55:16.827821
750	53	244	2017-11-20 18:55:16.833127	2017-11-20 18:55:16.833127
751	53	245	2017-11-20 18:55:16.841905	2017-11-20 18:55:16.841905
752	53	246	2017-11-20 18:55:16.848352	2017-11-20 18:55:16.848352
753	53	247	2017-11-20 18:55:16.853013	2017-11-20 18:55:16.853013
754	53	248	2017-11-20 18:55:16.858066	2017-11-20 18:55:16.858066
755	53	249	2017-11-20 18:55:16.863979	2017-11-20 18:55:16.863979
756	53	250	2017-11-20 18:55:16.869184	2017-11-20 18:55:16.869184
757	53	251	2017-11-20 18:55:16.874428	2017-11-20 18:55:16.874428
758	53	252	2017-11-20 18:55:16.879822	2017-11-20 18:55:16.879822
759	53	253	2017-11-20 18:55:16.885866	2017-11-20 18:55:16.885866
760	53	254	2017-11-20 18:55:16.890882	2017-11-20 18:55:16.890882
761	53	255	2017-11-20 18:55:16.895467	2017-11-20 18:55:16.895467
762	53	256	2017-11-20 18:55:16.900234	2017-11-20 18:55:16.900234
763	53	257	2017-11-20 18:55:16.904877	2017-11-20 18:55:16.904877
764	53	258	2017-11-20 18:55:16.909861	2017-11-20 18:55:16.909861
765	53	259	2017-11-20 18:55:16.914873	2017-11-20 18:55:16.914873
766	53	260	2017-11-20 18:55:16.920125	2017-11-20 18:55:16.920125
767	53	261	2017-11-20 18:55:16.926399	2017-11-20 18:55:16.926399
768	53	262	2017-11-20 18:55:16.935383	2017-11-20 18:55:16.935383
769	53	263	2017-11-20 18:55:16.941724	2017-11-20 18:55:16.941724
770	54	243	2017-11-20 18:55:23.958304	2017-11-20 18:55:23.958304
771	54	244	2017-11-20 18:55:23.966673	2017-11-20 18:55:23.966673
772	54	245	2017-11-20 18:55:23.972325	2017-11-20 18:55:23.972325
773	54	246	2017-11-20 18:55:23.977568	2017-11-20 18:55:23.977568
774	54	247	2017-11-20 18:55:23.981965	2017-11-20 18:55:23.981965
775	54	248	2017-11-20 18:55:23.986486	2017-11-20 18:55:23.986486
776	54	249	2017-11-20 18:55:23.993152	2017-11-20 18:55:23.993152
777	54	250	2017-11-20 18:55:23.999028	2017-11-20 18:55:23.999028
778	54	251	2017-11-20 18:55:24.005666	2017-11-20 18:55:24.005666
779	54	252	2017-11-20 18:55:24.014229	2017-11-20 18:55:24.014229
780	54	253	2017-11-20 18:55:24.019513	2017-11-20 18:55:24.019513
781	54	254	2017-11-20 18:55:24.023829	2017-11-20 18:55:24.023829
782	54	255	2017-11-20 18:55:24.02894	2017-11-20 18:55:24.02894
783	54	256	2017-11-20 18:55:24.033402	2017-11-20 18:55:24.033402
784	54	257	2017-11-20 18:55:24.038289	2017-11-20 18:55:24.038289
785	54	258	2017-11-20 18:55:24.04345	2017-11-20 18:55:24.04345
786	54	259	2017-11-20 18:55:24.048582	2017-11-20 18:55:24.048582
787	54	260	2017-11-20 18:55:24.053666	2017-11-20 18:55:24.053666
788	54	261	2017-11-20 18:55:24.058709	2017-11-20 18:55:24.058709
789	54	262	2017-11-20 18:55:24.063656	2017-11-20 18:55:24.063656
790	54	263	2017-11-20 18:55:24.067632	2017-11-20 18:55:24.067632
791	54	264	2017-11-20 18:55:24.071746	2017-11-20 18:55:24.071746
792	54	265	2017-11-20 18:55:24.075805	2017-11-20 18:55:24.075805
793	54	266	2017-11-20 18:55:24.079793	2017-11-20 18:55:24.079793
794	54	267	2017-11-20 18:55:24.083833	2017-11-20 18:55:24.083833
795	55	243	2017-11-20 18:55:30.447362	2017-11-20 18:55:30.447362
796	55	244	2017-11-20 18:55:30.451054	2017-11-20 18:55:30.451054
797	55	245	2017-11-20 18:55:30.454714	2017-11-20 18:55:30.454714
798	55	246	2017-11-20 18:55:30.458186	2017-11-20 18:55:30.458186
799	55	247	2017-11-20 18:55:30.462768	2017-11-20 18:55:30.462768
800	55	248	2017-11-20 18:55:30.467933	2017-11-20 18:55:30.467933
801	55	249	2017-11-20 18:55:30.473247	2017-11-20 18:55:30.473247
802	55	250	2017-11-20 18:55:30.47854	2017-11-20 18:55:30.47854
803	55	251	2017-11-20 18:55:30.484939	2017-11-20 18:55:30.484939
804	55	252	2017-11-20 18:55:30.491404	2017-11-20 18:55:30.491404
805	55	253	2017-11-20 18:55:30.49756	2017-11-20 18:55:30.49756
806	55	254	2017-11-20 18:55:30.50428	2017-11-20 18:55:30.50428
807	55	255	2017-11-20 18:55:30.510866	2017-11-20 18:55:30.510866
808	55	256	2017-11-20 18:55:30.516504	2017-11-20 18:55:30.516504
809	55	257	2017-11-20 18:55:30.522269	2017-11-20 18:55:30.522269
810	55	258	2017-11-20 18:55:30.528134	2017-11-20 18:55:30.528134
811	55	259	2017-11-20 18:55:30.534399	2017-11-20 18:55:30.534399
812	55	260	2017-11-20 18:55:30.540323	2017-11-20 18:55:30.540323
813	55	261	2017-11-20 18:55:30.547355	2017-11-20 18:55:30.547355
814	55	262	2017-11-20 18:55:30.556571	2017-11-20 18:55:30.556571
815	55	263	2017-11-20 18:55:30.562755	2017-11-20 18:55:30.562755
816	55	264	2017-11-20 18:55:30.57021	2017-11-20 18:55:30.57021
817	55	265	2017-11-20 18:55:30.577194	2017-11-20 18:55:30.577194
818	55	266	2017-11-20 18:55:30.584791	2017-11-20 18:55:30.584791
819	55	267	2017-11-20 18:55:30.590988	2017-11-20 18:55:30.590988
820	55	268	2017-11-20 18:55:30.597283	2017-11-20 18:55:30.597283
821	55	269	2017-11-20 18:55:30.604427	2017-11-20 18:55:30.604427
822	56	270	2017-11-20 18:58:50.238065	2017-11-20 18:58:50.238065
823	56	271	2017-11-20 18:58:50.245003	2017-11-20 18:58:50.245003
824	56	272	2017-11-20 18:58:50.250133	2017-11-20 18:58:50.250133
825	56	273	2017-11-20 18:58:50.255163	2017-11-20 18:58:50.255163
826	57	270	2017-11-20 18:58:56.004395	2017-11-20 18:58:56.004395
827	57	271	2017-11-20 18:58:56.012177	2017-11-20 18:58:56.012177
828	57	272	2017-11-20 18:58:56.019246	2017-11-20 18:58:56.019246
829	57	273	2017-11-20 18:58:56.025348	2017-11-20 18:58:56.025348
830	57	274	2017-11-20 18:58:56.032018	2017-11-20 18:58:56.032018
831	57	275	2017-11-20 18:58:56.038989	2017-11-20 18:58:56.038989
832	57	276	2017-11-20 18:58:56.045526	2017-11-20 18:58:56.045526
833	57	277	2017-11-20 18:58:56.052102	2017-11-20 18:58:56.052102
834	57	278	2017-11-20 18:58:56.05899	2017-11-20 18:58:56.05899
835	57	279	2017-11-20 18:58:56.064419	2017-11-20 18:58:56.064419
836	57	280	2017-11-20 18:58:56.069933	2017-11-20 18:58:56.069933
837	57	281	2017-11-20 18:58:56.075335	2017-11-20 18:58:56.075335
838	57	282	2017-11-20 18:58:56.081456	2017-11-20 18:58:56.081456
839	58	270	2017-11-20 18:59:03.94522	2017-11-20 18:59:03.94522
840	58	271	2017-11-20 18:59:03.950646	2017-11-20 18:59:03.950646
841	58	272	2017-11-20 18:59:03.955782	2017-11-20 18:59:03.955782
842	58	273	2017-11-20 18:59:03.959717	2017-11-20 18:59:03.959717
843	58	274	2017-11-20 18:59:03.964341	2017-11-20 18:59:03.964341
844	58	275	2017-11-20 18:59:03.968685	2017-11-20 18:59:03.968685
845	58	276	2017-11-20 18:59:03.972887	2017-11-20 18:59:03.972887
846	58	277	2017-11-20 18:59:03.976861	2017-11-20 18:59:03.976861
847	58	278	2017-11-20 18:59:03.981193	2017-11-20 18:59:03.981193
848	58	279	2017-11-20 18:59:03.986271	2017-11-20 18:59:03.986271
849	58	280	2017-11-20 18:59:03.991728	2017-11-20 18:59:03.991728
850	58	281	2017-11-20 18:59:03.996742	2017-11-20 18:59:03.996742
851	58	282	2017-11-20 18:59:04.001961	2017-11-20 18:59:04.001961
852	58	283	2017-11-20 18:59:04.007535	2017-11-20 18:59:04.007535
853	58	284	2017-11-20 18:59:04.01324	2017-11-20 18:59:04.01324
854	58	285	2017-11-20 18:59:04.019416	2017-11-20 18:59:04.019416
855	58	286	2017-11-20 18:59:04.024922	2017-11-20 18:59:04.024922
856	59	270	2017-11-20 18:59:10.240235	2017-11-20 18:59:10.240235
857	59	271	2017-11-20 18:59:10.245527	2017-11-20 18:59:10.245527
858	59	272	2017-11-20 18:59:10.250847	2017-11-20 18:59:10.250847
859	59	273	2017-11-20 18:59:10.256193	2017-11-20 18:59:10.256193
860	59	274	2017-11-20 18:59:10.262107	2017-11-20 18:59:10.262107
861	59	275	2017-11-20 18:59:10.267803	2017-11-20 18:59:10.267803
862	59	276	2017-11-20 18:59:10.273074	2017-11-20 18:59:10.273074
863	59	277	2017-11-20 18:59:10.281412	2017-11-20 18:59:10.281412
864	59	278	2017-11-20 18:59:10.288667	2017-11-20 18:59:10.288667
865	59	279	2017-11-20 18:59:10.293408	2017-11-20 18:59:10.293408
866	59	280	2017-11-20 18:59:10.298353	2017-11-20 18:59:10.298353
867	59	281	2017-11-20 18:59:10.304594	2017-11-20 18:59:10.304594
868	59	282	2017-11-20 18:59:10.310797	2017-11-20 18:59:10.310797
869	59	283	2017-11-20 18:59:10.315796	2017-11-20 18:59:10.315796
870	59	284	2017-11-20 18:59:10.320998	2017-11-20 18:59:10.320998
871	59	285	2017-11-20 18:59:10.326153	2017-11-20 18:59:10.326153
872	59	286	2017-11-20 18:59:10.331058	2017-11-20 18:59:10.331058
873	59	287	2017-11-20 18:59:10.33604	2017-11-20 18:59:10.33604
874	59	288	2017-11-20 18:59:10.340993	2017-11-20 18:59:10.340993
875	59	289	2017-11-20 18:59:10.34583	2017-11-20 18:59:10.34583
876	59	290	2017-11-20 18:59:10.350938	2017-11-20 18:59:10.350938
877	59	291	2017-11-20 18:59:10.356023	2017-11-20 18:59:10.356023
878	59	292	2017-11-20 18:59:10.361142	2017-11-20 18:59:10.361142
879	59	293	2017-11-20 18:59:10.36638	2017-11-20 18:59:10.36638
880	59	294	2017-11-20 18:59:10.37168	2017-11-20 18:59:10.37168
881	59	295	2017-11-20 18:59:10.376968	2017-11-20 18:59:10.376968
882	60	270	2017-11-20 18:59:18.829811	2017-11-20 18:59:18.829811
883	60	271	2017-11-20 18:59:18.833675	2017-11-20 18:59:18.833675
884	60	272	2017-11-20 18:59:18.837617	2017-11-20 18:59:18.837617
885	60	273	2017-11-20 18:59:18.841563	2017-11-20 18:59:18.841563
886	60	274	2017-11-20 18:59:18.845462	2017-11-20 18:59:18.845462
887	60	275	2017-11-20 18:59:18.849849	2017-11-20 18:59:18.849849
888	60	276	2017-11-20 18:59:18.854206	2017-11-20 18:59:18.854206
889	60	277	2017-11-20 18:59:18.858346	2017-11-20 18:59:18.858346
890	60	278	2017-11-20 18:59:18.863262	2017-11-20 18:59:18.863262
891	60	279	2017-11-20 18:59:18.867838	2017-11-20 18:59:18.867838
892	60	280	2017-11-20 18:59:18.872022	2017-11-20 18:59:18.872022
893	60	281	2017-11-20 18:59:18.876525	2017-11-20 18:59:18.876525
894	60	282	2017-11-20 18:59:18.880747	2017-11-20 18:59:18.880747
895	60	283	2017-11-20 18:59:18.885113	2017-11-20 18:59:18.885113
896	60	284	2017-11-20 18:59:18.889361	2017-11-20 18:59:18.889361
897	60	285	2017-11-20 18:59:18.89395	2017-11-20 18:59:18.89395
898	60	286	2017-11-20 18:59:18.898511	2017-11-20 18:59:18.898511
899	60	287	2017-11-20 18:59:18.902824	2017-11-20 18:59:18.902824
900	60	288	2017-11-20 18:59:18.906981	2017-11-20 18:59:18.906981
901	60	289	2017-11-20 18:59:18.911107	2017-11-20 18:59:18.911107
902	60	290	2017-11-20 18:59:18.916574	2017-11-20 18:59:18.916574
903	60	291	2017-11-20 18:59:18.922131	2017-11-20 18:59:18.922131
904	60	292	2017-11-20 18:59:18.927131	2017-11-20 18:59:18.927131
905	60	293	2017-11-20 18:59:18.932375	2017-11-20 18:59:18.932375
906	60	294	2017-11-20 18:59:18.937701	2017-11-20 18:59:18.937701
907	60	295	2017-11-20 18:59:18.943321	2017-11-20 18:59:18.943321
908	60	296	2017-11-20 18:59:18.949297	2017-11-20 18:59:18.949297
909	60	297	2017-11-20 18:59:18.95465	2017-11-20 18:59:18.95465
910	60	298	2017-11-20 18:59:18.960041	2017-11-20 18:59:18.960041
911	60	299	2017-11-20 18:59:18.965347	2017-11-20 18:59:18.965347
912	60	300	2017-11-20 18:59:18.970935	2017-11-20 18:59:18.970935
913	60	301	2017-11-20 18:59:18.976694	2017-11-20 18:59:18.976694
914	60	302	2017-11-20 18:59:18.983317	2017-11-20 18:59:18.983317
915	60	303	2017-11-20 18:59:18.989029	2017-11-20 18:59:18.989029
916	60	304	2017-11-20 18:59:18.997106	2017-11-20 18:59:18.997106
917	60	305	2017-11-20 18:59:19.003618	2017-11-20 18:59:19.003618
918	60	306	2017-11-20 18:59:19.008652	2017-11-20 18:59:19.008652
919	60	307	2017-11-20 18:59:19.014416	2017-11-20 18:59:19.014416
920	60	308	2017-11-20 18:59:19.020601	2017-11-20 18:59:19.020601
921	60	309	2017-11-20 18:59:19.026825	2017-11-20 18:59:19.026825
922	60	310	2017-11-20 18:59:19.032481	2017-11-20 18:59:19.032481
923	60	311	2017-11-20 18:59:19.038183	2017-11-20 18:59:19.038183
924	61	312	2017-11-20 19:01:44.207025	2017-11-20 19:01:44.207025
925	61	313	2017-11-20 19:01:44.211126	2017-11-20 19:01:44.211126
926	61	314	2017-11-20 19:01:44.214788	2017-11-20 19:01:44.214788
927	61	315	2017-11-20 19:01:44.218484	2017-11-20 19:01:44.218484
928	61	316	2017-11-20 19:01:44.222056	2017-11-20 19:01:44.222056
929	61	317	2017-11-20 19:01:44.226335	2017-11-20 19:01:44.226335
930	61	318	2017-11-20 19:01:44.230501	2017-11-20 19:01:44.230501
931	62	312	2017-11-20 19:01:52.756031	2017-11-20 19:01:52.756031
932	62	313	2017-11-20 19:01:52.760958	2017-11-20 19:01:52.760958
933	62	314	2017-11-20 19:01:52.765174	2017-11-20 19:01:52.765174
934	62	315	2017-11-20 19:01:52.769683	2017-11-20 19:01:52.769683
935	62	316	2017-11-20 19:01:52.774418	2017-11-20 19:01:52.774418
936	62	317	2017-11-20 19:01:52.779402	2017-11-20 19:01:52.779402
937	62	318	2017-11-20 19:01:52.783954	2017-11-20 19:01:52.783954
938	62	319	2017-11-20 19:01:52.788974	2017-11-20 19:01:52.788974
939	62	320	2017-11-20 19:01:52.793956	2017-11-20 19:01:52.793956
940	62	321	2017-11-20 19:01:52.798869	2017-11-20 19:01:52.798869
941	62	322	2017-11-20 19:01:52.804423	2017-11-20 19:01:52.804423
942	62	323	2017-11-20 19:01:52.810274	2017-11-20 19:01:52.810274
943	62	324	2017-11-20 19:01:52.814603	2017-11-20 19:01:52.814603
944	62	325	2017-11-20 19:01:52.818697	2017-11-20 19:01:52.818697
945	62	326	2017-11-20 19:01:52.82365	2017-11-20 19:01:52.82365
946	62	327	2017-11-20 19:01:52.828788	2017-11-20 19:01:52.828788
947	62	328	2017-11-20 19:01:52.833736	2017-11-20 19:01:52.833736
948	62	329	2017-11-20 19:01:52.838683	2017-11-20 19:01:52.838683
949	63	312	2017-11-20 19:02:00.429592	2017-11-20 19:02:00.429592
950	63	313	2017-11-20 19:02:00.435545	2017-11-20 19:02:00.435545
951	63	314	2017-11-20 19:02:00.440457	2017-11-20 19:02:00.440457
952	63	315	2017-11-20 19:02:00.445186	2017-11-20 19:02:00.445186
953	63	316	2017-11-20 19:02:00.449821	2017-11-20 19:02:00.449821
954	63	317	2017-11-20 19:02:00.454606	2017-11-20 19:02:00.454606
955	63	318	2017-11-20 19:02:00.460209	2017-11-20 19:02:00.460209
956	63	319	2017-11-20 19:02:00.465572	2017-11-20 19:02:00.465572
957	63	320	2017-11-20 19:02:00.470812	2017-11-20 19:02:00.470812
958	63	321	2017-11-20 19:02:00.476711	2017-11-20 19:02:00.476711
959	63	322	2017-11-20 19:02:00.482568	2017-11-20 19:02:00.482568
960	63	323	2017-11-20 19:02:00.488968	2017-11-20 19:02:00.488968
961	63	324	2017-11-20 19:02:00.496176	2017-11-20 19:02:00.496176
962	63	325	2017-11-20 19:02:00.502145	2017-11-20 19:02:00.502145
963	63	326	2017-11-20 19:02:00.508126	2017-11-20 19:02:00.508126
964	63	327	2017-11-20 19:02:00.513872	2017-11-20 19:02:00.513872
965	63	328	2017-11-20 19:02:00.519592	2017-11-20 19:02:00.519592
966	63	329	2017-11-20 19:02:00.525604	2017-11-20 19:02:00.525604
967	63	330	2017-11-20 19:02:00.531355	2017-11-20 19:02:00.531355
968	63	331	2017-11-20 19:02:00.537047	2017-11-20 19:02:00.537047
969	63	332	2017-11-20 19:02:00.542521	2017-11-20 19:02:00.542521
970	63	333	2017-11-20 19:02:00.547528	2017-11-20 19:02:00.547528
971	63	334	2017-11-20 19:02:00.553916	2017-11-20 19:02:00.553916
972	63	335	2017-11-20 19:02:00.559197	2017-11-20 19:02:00.559197
973	63	336	2017-11-20 19:02:00.563852	2017-11-20 19:02:00.563852
974	63	337	2017-11-20 19:02:00.569229	2017-11-20 19:02:00.569229
975	63	338	2017-11-20 19:02:00.575568	2017-11-20 19:02:00.575568
976	63	339	2017-11-20 19:02:00.581028	2017-11-20 19:02:00.581028
977	63	340	2017-11-20 19:02:00.586111	2017-11-20 19:02:00.586111
978	63	341	2017-11-20 19:02:00.590216	2017-11-20 19:02:00.590216
979	63	342	2017-11-20 19:02:00.594504	2017-11-20 19:02:00.594504
980	63	343	2017-11-20 19:02:00.598475	2017-11-20 19:02:00.598475
981	63	344	2017-11-20 19:02:00.602583	2017-11-20 19:02:00.602583
982	63	345	2017-11-20 19:02:00.607062	2017-11-20 19:02:00.607062
983	63	346	2017-11-20 19:02:00.615264	2017-11-20 19:02:00.615264
984	63	347	2017-11-20 19:02:00.619597	2017-11-20 19:02:00.619597
985	63	348	2017-11-20 19:02:00.623671	2017-11-20 19:02:00.623671
986	63	349	2017-11-20 19:02:00.627746	2017-11-20 19:02:00.627746
987	63	350	2017-11-20 19:02:00.631779	2017-11-20 19:02:00.631779
988	63	351	2017-11-20 19:02:00.635701	2017-11-20 19:02:00.635701
989	63	352	2017-11-20 19:02:00.639971	2017-11-20 19:02:00.639971
990	63	353	2017-11-20 19:02:00.644174	2017-11-20 19:02:00.644174
991	64	312	2017-11-20 19:02:10.981582	2017-11-20 19:02:10.981582
992	64	313	2017-11-20 19:02:10.985408	2017-11-20 19:02:10.985408
993	64	314	2017-11-20 19:02:10.988911	2017-11-20 19:02:10.988911
994	64	315	2017-11-20 19:02:10.992473	2017-11-20 19:02:10.992473
995	64	316	2017-11-20 19:02:10.996192	2017-11-20 19:02:10.996192
996	64	317	2017-11-20 19:02:10.999974	2017-11-20 19:02:10.999974
997	64	318	2017-11-20 19:02:11.014909	2017-11-20 19:02:11.014909
998	64	319	2017-11-20 19:02:11.019443	2017-11-20 19:02:11.019443
999	64	320	2017-11-20 19:02:11.023504	2017-11-20 19:02:11.023504
1000	64	321	2017-11-20 19:02:11.027305	2017-11-20 19:02:11.027305
1001	64	322	2017-11-20 19:02:11.030915	2017-11-20 19:02:11.030915
1002	64	323	2017-11-20 19:02:11.034631	2017-11-20 19:02:11.034631
1003	64	324	2017-11-20 19:02:11.038484	2017-11-20 19:02:11.038484
1004	64	325	2017-11-20 19:02:11.042691	2017-11-20 19:02:11.042691
1005	64	326	2017-11-20 19:02:11.046689	2017-11-20 19:02:11.046689
1006	64	327	2017-11-20 19:02:11.05068	2017-11-20 19:02:11.05068
1007	64	328	2017-11-20 19:02:11.054874	2017-11-20 19:02:11.054874
1008	64	329	2017-11-20 19:02:11.058995	2017-11-20 19:02:11.058995
1009	64	330	2017-11-20 19:02:11.063043	2017-11-20 19:02:11.063043
1010	64	331	2017-11-20 19:02:11.067235	2017-11-20 19:02:11.067235
1011	64	332	2017-11-20 19:02:11.071058	2017-11-20 19:02:11.071058
1012	64	333	2017-11-20 19:02:11.075191	2017-11-20 19:02:11.075191
1013	64	334	2017-11-20 19:02:11.079605	2017-11-20 19:02:11.079605
1014	64	335	2017-11-20 19:02:11.083886	2017-11-20 19:02:11.083886
1015	64	336	2017-11-20 19:02:11.088255	2017-11-20 19:02:11.088255
1016	64	337	2017-11-20 19:02:11.092715	2017-11-20 19:02:11.092715
1017	64	338	2017-11-20 19:02:11.09704	2017-11-20 19:02:11.09704
1018	64	339	2017-11-20 19:02:11.102798	2017-11-20 19:02:11.102798
1019	64	340	2017-11-20 19:02:11.110376	2017-11-20 19:02:11.110376
1020	64	341	2017-11-20 19:02:11.119399	2017-11-20 19:02:11.119399
1021	64	342	2017-11-20 19:02:11.125125	2017-11-20 19:02:11.125125
1022	64	343	2017-11-20 19:02:11.131018	2017-11-20 19:02:11.131018
1023	64	344	2017-11-20 19:02:11.136395	2017-11-20 19:02:11.136395
1024	64	345	2017-11-20 19:02:11.142883	2017-11-20 19:02:11.142883
1025	64	346	2017-11-20 19:02:11.148893	2017-11-20 19:02:11.148893
1026	64	347	2017-11-20 19:02:11.154255	2017-11-20 19:02:11.154255
1027	64	348	2017-11-20 19:02:11.159604	2017-11-20 19:02:11.159604
1028	64	349	2017-11-20 19:02:11.164878	2017-11-20 19:02:11.164878
1029	64	350	2017-11-20 19:02:11.170146	2017-11-20 19:02:11.170146
1030	64	351	2017-11-20 19:02:11.176087	2017-11-20 19:02:11.176087
1031	64	352	2017-11-20 19:02:11.181413	2017-11-20 19:02:11.181413
1032	64	353	2017-11-20 19:02:11.186425	2017-11-20 19:02:11.186425
1033	64	354	2017-11-20 19:02:11.192261	2017-11-20 19:02:11.192261
1034	64	355	2017-11-20 19:02:11.197742	2017-11-20 19:02:11.197742
1035	64	356	2017-11-20 19:02:11.203006	2017-11-20 19:02:11.203006
1036	64	357	2017-11-20 19:02:11.208634	2017-11-20 19:02:11.208634
1037	64	358	2017-11-20 19:02:11.214323	2017-11-20 19:02:11.214323
1038	65	312	2017-11-20 19:02:18.222738	2017-11-20 19:02:18.222738
1039	65	313	2017-11-20 19:02:18.228582	2017-11-20 19:02:18.228582
1040	65	314	2017-11-20 19:02:18.23446	2017-11-20 19:02:18.23446
1041	65	315	2017-11-20 19:02:18.239042	2017-11-20 19:02:18.239042
1042	65	316	2017-11-20 19:02:18.244335	2017-11-20 19:02:18.244335
1043	65	317	2017-11-20 19:02:18.249351	2017-11-20 19:02:18.249351
1044	65	318	2017-11-20 19:02:18.25432	2017-11-20 19:02:18.25432
1045	65	319	2017-11-20 19:02:18.259792	2017-11-20 19:02:18.259792
1046	65	320	2017-11-20 19:02:18.26388	2017-11-20 19:02:18.26388
1047	65	321	2017-11-20 19:02:18.26799	2017-11-20 19:02:18.26799
1048	65	322	2017-11-20 19:02:18.272037	2017-11-20 19:02:18.272037
1049	65	323	2017-11-20 19:02:18.276266	2017-11-20 19:02:18.276266
1050	65	324	2017-11-20 19:02:18.280809	2017-11-20 19:02:18.280809
1051	65	325	2017-11-20 19:02:18.284834	2017-11-20 19:02:18.284834
1052	65	326	2017-11-20 19:02:18.288816	2017-11-20 19:02:18.288816
1053	65	327	2017-11-20 19:02:18.293135	2017-11-20 19:02:18.293135
1054	65	328	2017-11-20 19:02:18.297115	2017-11-20 19:02:18.297115
1055	65	329	2017-11-20 19:02:18.300763	2017-11-20 19:02:18.300763
1056	65	330	2017-11-20 19:02:18.304293	2017-11-20 19:02:18.304293
1057	65	331	2017-11-20 19:02:18.307978	2017-11-20 19:02:18.307978
1058	65	332	2017-11-20 19:02:18.311855	2017-11-20 19:02:18.311855
1059	65	333	2017-11-20 19:02:18.315841	2017-11-20 19:02:18.315841
1060	65	334	2017-11-20 19:02:18.319656	2017-11-20 19:02:18.319656
1061	65	335	2017-11-20 19:02:18.326115	2017-11-20 19:02:18.326115
1062	65	336	2017-11-20 19:02:18.331585	2017-11-20 19:02:18.331585
1063	65	337	2017-11-20 19:02:18.336903	2017-11-20 19:02:18.336903
1064	65	338	2017-11-20 19:02:18.342811	2017-11-20 19:02:18.342811
1065	65	339	2017-11-20 19:02:18.348677	2017-11-20 19:02:18.348677
1066	65	340	2017-11-20 19:02:18.354417	2017-11-20 19:02:18.354417
1067	65	341	2017-11-20 19:02:18.360231	2017-11-20 19:02:18.360231
1068	65	342	2017-11-20 19:02:18.366717	2017-11-20 19:02:18.366717
1069	65	343	2017-11-20 19:02:18.372396	2017-11-20 19:02:18.372396
1070	65	344	2017-11-20 19:02:18.377774	2017-11-20 19:02:18.377774
1071	65	345	2017-11-20 19:02:18.38299	2017-11-20 19:02:18.38299
1072	65	346	2017-11-20 19:02:18.388834	2017-11-20 19:02:18.388834
1073	65	347	2017-11-20 19:02:18.395103	2017-11-20 19:02:18.395103
1074	65	348	2017-11-20 19:02:18.401066	2017-11-20 19:02:18.401066
1075	65	349	2017-11-20 19:02:18.406122	2017-11-20 19:02:18.406122
1076	65	350	2017-11-20 19:02:18.411388	2017-11-20 19:02:18.411388
1077	65	351	2017-11-20 19:02:18.418966	2017-11-20 19:02:18.418966
1078	65	352	2017-11-20 19:02:18.424436	2017-11-20 19:02:18.424436
1079	65	353	2017-11-20 19:02:18.42972	2017-11-20 19:02:18.42972
1080	65	354	2017-11-20 19:02:18.434897	2017-11-20 19:02:18.434897
1081	65	355	2017-11-20 19:02:18.440027	2017-11-20 19:02:18.440027
1082	65	356	2017-11-20 19:02:18.445228	2017-11-20 19:02:18.445228
1083	65	357	2017-11-20 19:02:18.450567	2017-11-20 19:02:18.450567
1084	65	358	2017-11-20 19:02:18.455802	2017-11-20 19:02:18.455802
1085	65	359	2017-11-20 19:02:18.461164	2017-11-20 19:02:18.461164
1086	65	360	2017-11-20 19:02:18.465365	2017-11-20 19:02:18.465365
1087	65	361	2017-11-20 19:02:18.469586	2017-11-20 19:02:18.469586
1088	65	362	2017-11-20 19:02:18.473873	2017-11-20 19:02:18.473873
1089	65	363	2017-11-20 19:02:18.4784	2017-11-20 19:02:18.4784
1090	65	364	2017-11-20 19:02:18.482899	2017-11-20 19:02:18.482899
1091	65	365	2017-11-20 19:02:18.487323	2017-11-20 19:02:18.487323
1092	65	366	2017-11-20 19:02:18.492026	2017-11-20 19:02:18.492026
1093	65	367	2017-11-20 19:02:18.49636	2017-11-20 19:02:18.49636
1094	65	368	2017-11-20 19:02:18.500848	2017-11-20 19:02:18.500848
1095	65	369	2017-11-20 19:02:18.505115	2017-11-20 19:02:18.505115
1096	65	370	2017-11-20 19:02:18.509119	2017-11-20 19:02:18.509119
1097	66	371	2017-11-20 19:10:04.527509	2017-11-20 19:10:04.527509
1098	66	372	2017-11-20 19:10:04.551608	2017-11-20 19:10:04.551608
1099	66	373	2017-11-20 19:10:04.556612	2017-11-20 19:10:04.556612
1100	66	374	2017-11-20 19:10:04.561306	2017-11-20 19:10:04.561306
1101	66	375	2017-11-20 19:10:04.565743	2017-11-20 19:10:04.565743
1102	67	371	2017-11-20 19:10:10.238554	2017-11-20 19:10:10.238554
1103	67	372	2017-11-20 19:10:10.244313	2017-11-20 19:10:10.244313
1104	67	373	2017-11-20 19:10:10.250058	2017-11-20 19:10:10.250058
1105	67	374	2017-11-20 19:10:10.255825	2017-11-20 19:10:10.255825
1106	67	375	2017-11-20 19:10:10.261828	2017-11-20 19:10:10.261828
1107	67	376	2017-11-20 19:10:10.267678	2017-11-20 19:10:10.267678
1108	71	377	2017-11-20 19:16:39.160638	2017-11-20 19:16:39.160638
1109	71	378	2017-11-20 19:16:39.167247	2017-11-20 19:16:39.167247
1110	71	379	2017-11-20 19:16:39.173262	2017-11-20 19:16:39.173262
1111	71	380	2017-11-20 19:16:39.179718	2017-11-20 19:16:39.179718
1112	71	381	2017-11-20 19:16:39.186356	2017-11-20 19:16:39.186356
1113	71	382	2017-11-20 19:16:39.192715	2017-11-20 19:16:39.192715
1114	71	383	2017-11-20 19:16:39.198863	2017-11-20 19:16:39.198863
1115	71	384	2017-11-20 19:16:39.204997	2017-11-20 19:16:39.204997
1116	71	385	2017-11-20 19:16:39.211435	2017-11-20 19:16:39.211435
1117	71	386	2017-11-20 19:16:39.216751	2017-11-20 19:16:39.216751
1118	71	387	2017-11-20 19:16:39.222841	2017-11-20 19:16:39.222841
1119	71	388	2017-11-20 19:16:39.228638	2017-11-20 19:16:39.228638
1120	71	389	2017-11-20 19:16:39.234568	2017-11-20 19:16:39.234568
1121	71	390	2017-11-20 19:16:39.240007	2017-11-20 19:16:39.240007
1122	71	391	2017-11-20 19:16:39.245918	2017-11-20 19:16:39.245918
1123	71	392	2017-11-20 19:16:39.251982	2017-11-20 19:16:39.251982
1124	71	393	2017-11-20 19:16:39.258283	2017-11-20 19:16:39.258283
1125	71	394	2017-11-20 19:16:39.264521	2017-11-20 19:16:39.264521
1126	71	395	2017-11-20 19:16:39.271209	2017-11-20 19:16:39.271209
1127	71	396	2017-11-20 19:16:39.275199	2017-11-20 19:16:39.275199
1128	71	397	2017-11-20 19:16:39.27915	2017-11-20 19:16:39.27915
1129	71	398	2017-11-20 19:16:39.283358	2017-11-20 19:16:39.283358
1130	71	399	2017-11-20 19:16:39.287736	2017-11-20 19:16:39.287736
1131	71	400	2017-11-20 19:16:39.292219	2017-11-20 19:16:39.292219
1132	71	401	2017-11-20 19:16:39.303423	2017-11-20 19:16:39.303423
1133	71	402	2017-11-20 19:16:39.307594	2017-11-20 19:16:39.307594
1134	72	377	2017-11-20 19:16:45.168348	2017-11-20 19:16:45.168348
1135	72	378	2017-11-20 19:16:45.17335	2017-11-20 19:16:45.17335
1136	72	379	2017-11-20 19:16:45.179215	2017-11-20 19:16:45.179215
1137	72	380	2017-11-20 19:16:45.184828	2017-11-20 19:16:45.184828
1138	72	381	2017-11-20 19:16:45.190056	2017-11-20 19:16:45.190056
1139	72	382	2017-11-20 19:16:45.197546	2017-11-20 19:16:45.197546
1140	72	383	2017-11-20 19:16:45.204531	2017-11-20 19:16:45.204531
1141	72	384	2017-11-20 19:16:45.210892	2017-11-20 19:16:45.210892
1142	72	385	2017-11-20 19:16:45.216529	2017-11-20 19:16:45.216529
1143	72	386	2017-11-20 19:16:45.223086	2017-11-20 19:16:45.223086
1144	72	387	2017-11-20 19:16:45.227223	2017-11-20 19:16:45.227223
1145	72	388	2017-11-20 19:16:45.231282	2017-11-20 19:16:45.231282
1146	72	389	2017-11-20 19:16:45.235492	2017-11-20 19:16:45.235492
1147	72	390	2017-11-20 19:16:45.23964	2017-11-20 19:16:45.23964
1148	72	391	2017-11-20 19:16:45.244088	2017-11-20 19:16:45.244088
1149	72	392	2017-11-20 19:16:45.248032	2017-11-20 19:16:45.248032
1150	72	393	2017-11-20 19:16:45.252643	2017-11-20 19:16:45.252643
1151	72	394	2017-11-20 19:16:45.257189	2017-11-20 19:16:45.257189
1152	72	395	2017-11-20 19:16:45.261658	2017-11-20 19:16:45.261658
1153	72	396	2017-11-20 19:16:45.265988	2017-11-20 19:16:45.265988
1154	72	397	2017-11-20 19:16:45.270178	2017-11-20 19:16:45.270178
1155	72	398	2017-11-20 19:16:45.274883	2017-11-20 19:16:45.274883
1156	72	399	2017-11-20 19:16:45.279652	2017-11-20 19:16:45.279652
1157	72	400	2017-11-20 19:16:45.284988	2017-11-20 19:16:45.284988
1158	72	401	2017-11-20 19:16:45.289237	2017-11-20 19:16:45.289237
1159	72	402	2017-11-20 19:16:45.293554	2017-11-20 19:16:45.293554
1160	72	403	2017-11-20 19:16:45.297614	2017-11-20 19:16:45.297614
1161	73	377	2017-11-20 19:16:51.045214	2017-11-20 19:16:51.045214
1162	73	378	2017-11-20 19:16:51.051666	2017-11-20 19:16:51.051666
1163	73	379	2017-11-20 19:16:51.057823	2017-11-20 19:16:51.057823
1164	73	380	2017-11-20 19:16:51.06371	2017-11-20 19:16:51.06371
1165	73	381	2017-11-20 19:16:51.069186	2017-11-20 19:16:51.069186
1166	73	382	2017-11-20 19:16:51.074635	2017-11-20 19:16:51.074635
1167	73	383	2017-11-20 19:16:51.080272	2017-11-20 19:16:51.080272
1168	73	384	2017-11-20 19:16:51.085492	2017-11-20 19:16:51.085492
1169	73	385	2017-11-20 19:16:51.090897	2017-11-20 19:16:51.090897
1170	73	386	2017-11-20 19:16:51.09618	2017-11-20 19:16:51.09618
1171	73	387	2017-11-20 19:16:51.101393	2017-11-20 19:16:51.101393
1172	73	388	2017-11-20 19:16:51.106581	2017-11-20 19:16:51.106581
1173	73	389	2017-11-20 19:16:51.111564	2017-11-20 19:16:51.111564
1174	73	390	2017-11-20 19:16:51.116758	2017-11-20 19:16:51.116758
1175	73	391	2017-11-20 19:16:51.122182	2017-11-20 19:16:51.122182
1176	73	392	2017-11-20 19:16:51.127605	2017-11-20 19:16:51.127605
1177	73	393	2017-11-20 19:16:51.132915	2017-11-20 19:16:51.132915
1178	73	394	2017-11-20 19:16:51.138373	2017-11-20 19:16:51.138373
1179	73	395	2017-11-20 19:16:51.142613	2017-11-20 19:16:51.142613
1180	73	396	2017-11-20 19:16:51.146901	2017-11-20 19:16:51.146901
1181	73	397	2017-11-20 19:16:51.151967	2017-11-20 19:16:51.151967
1182	73	398	2017-11-20 19:16:51.157343	2017-11-20 19:16:51.157343
1183	73	399	2017-11-20 19:16:51.162696	2017-11-20 19:16:51.162696
1184	73	400	2017-11-20 19:16:51.167301	2017-11-20 19:16:51.167301
1185	73	401	2017-11-20 19:16:51.171659	2017-11-20 19:16:51.171659
1186	73	402	2017-11-20 19:16:51.175685	2017-11-20 19:16:51.175685
1187	73	403	2017-11-20 19:16:51.179606	2017-11-20 19:16:51.179606
1188	73	404	2017-11-20 19:16:51.18369	2017-11-20 19:16:51.18369
1189	73	405	2017-11-20 19:16:51.187901	2017-11-20 19:16:51.187901
1190	73	406	2017-11-20 19:16:51.192387	2017-11-20 19:16:51.192387
1191	73	407	2017-11-20 19:16:51.196973	2017-11-20 19:16:51.196973
1192	73	408	2017-11-20 19:16:51.204053	2017-11-20 19:16:51.204053
1193	74	377	2017-11-20 19:16:56.932474	2017-11-20 19:16:56.932474
1194	74	378	2017-11-20 19:16:56.937559	2017-11-20 19:16:56.937559
1195	74	379	2017-11-20 19:16:56.942793	2017-11-20 19:16:56.942793
1196	74	380	2017-11-20 19:16:56.947916	2017-11-20 19:16:56.947916
1197	74	381	2017-11-20 19:16:56.953263	2017-11-20 19:16:56.953263
1198	74	382	2017-11-20 19:16:56.958581	2017-11-20 19:16:56.958581
1199	74	383	2017-11-20 19:16:56.963948	2017-11-20 19:16:56.963948
1200	74	384	2017-11-20 19:16:56.969875	2017-11-20 19:16:56.969875
1201	74	385	2017-11-20 19:16:56.976243	2017-11-20 19:16:56.976243
1202	74	386	2017-11-20 19:16:56.982104	2017-11-20 19:16:56.982104
1203	74	387	2017-11-20 19:16:56.987469	2017-11-20 19:16:56.987469
1204	74	388	2017-11-20 19:16:56.992979	2017-11-20 19:16:56.992979
1205	74	389	2017-11-20 19:16:56.998921	2017-11-20 19:16:56.998921
1206	74	390	2017-11-20 19:16:57.004733	2017-11-20 19:16:57.004733
1207	74	391	2017-11-20 19:16:57.009985	2017-11-20 19:16:57.009985
1208	74	392	2017-11-20 19:16:57.015245	2017-11-20 19:16:57.015245
1209	74	393	2017-11-20 19:16:57.020329	2017-11-20 19:16:57.020329
1210	74	394	2017-11-20 19:16:57.026326	2017-11-20 19:16:57.026326
1211	74	395	2017-11-20 19:16:57.032333	2017-11-20 19:16:57.032333
1212	74	396	2017-11-20 19:16:57.037611	2017-11-20 19:16:57.037611
1213	74	397	2017-11-20 19:16:57.043628	2017-11-20 19:16:57.043628
1214	74	398	2017-11-20 19:16:57.049458	2017-11-20 19:16:57.049458
1215	74	399	2017-11-20 19:16:57.054768	2017-11-20 19:16:57.054768
1216	74	400	2017-11-20 19:16:57.05933	2017-11-20 19:16:57.05933
1217	74	401	2017-11-20 19:16:57.064398	2017-11-20 19:16:57.064398
1218	74	402	2017-11-20 19:16:57.06907	2017-11-20 19:16:57.06907
1219	74	403	2017-11-20 19:16:57.075969	2017-11-20 19:16:57.075969
1220	74	404	2017-11-20 19:16:57.080999	2017-11-20 19:16:57.080999
1221	74	405	2017-11-20 19:16:57.086176	2017-11-20 19:16:57.086176
1222	74	406	2017-11-20 19:16:57.090381	2017-11-20 19:16:57.090381
1223	74	407	2017-11-20 19:16:57.094411	2017-11-20 19:16:57.094411
1224	74	408	2017-11-20 19:16:57.098414	2017-11-20 19:16:57.098414
1225	74	409	2017-11-20 19:16:57.102302	2017-11-20 19:16:57.102302
1226	74	410	2017-11-20 19:16:57.106591	2017-11-20 19:16:57.106591
1227	74	411	2017-11-20 19:16:57.110986	2017-11-20 19:16:57.110986
1228	74	412	2017-11-20 19:16:57.115147	2017-11-20 19:16:57.115147
1229	74	413	2017-11-20 19:16:57.120492	2017-11-20 19:16:57.120492
1230	74	414	2017-11-20 19:16:57.125077	2017-11-20 19:16:57.125077
1231	74	415	2017-11-20 19:16:57.129319	2017-11-20 19:16:57.129319
1232	74	416	2017-11-20 19:16:57.133198	2017-11-20 19:16:57.133198
1233	74	417	2017-11-20 19:16:57.137728	2017-11-20 19:16:57.137728
1234	74	418	2017-11-20 19:16:57.141676	2017-11-20 19:16:57.141676
1235	74	419	2017-11-20 19:16:57.146512	2017-11-20 19:16:57.146512
1236	74	420	2017-11-20 19:16:57.150588	2017-11-20 19:16:57.150588
1237	74	421	2017-11-20 19:16:57.155278	2017-11-20 19:16:57.155278
1238	74	422	2017-11-20 19:16:57.161819	2017-11-20 19:16:57.161819
1239	74	423	2017-11-20 19:16:57.166737	2017-11-20 19:16:57.166737
1240	74	424	2017-11-20 19:16:57.171201	2017-11-20 19:16:57.171201
1241	74	425	2017-11-20 19:16:57.175538	2017-11-20 19:16:57.175538
1242	75	377	2017-11-20 19:17:02.990734	2017-11-20 19:17:02.990734
1243	75	378	2017-11-20 19:17:02.995735	2017-11-20 19:17:02.995735
1244	75	379	2017-11-20 19:17:03.001136	2017-11-20 19:17:03.001136
1245	75	380	2017-11-20 19:17:03.00649	2017-11-20 19:17:03.00649
1246	75	381	2017-11-20 19:17:03.01138	2017-11-20 19:17:03.01138
1247	75	382	2017-11-20 19:17:03.016177	2017-11-20 19:17:03.016177
1248	75	383	2017-11-20 19:17:03.021349	2017-11-20 19:17:03.021349
1249	75	384	2017-11-20 19:17:03.026019	2017-11-20 19:17:03.026019
1250	75	385	2017-11-20 19:17:03.031657	2017-11-20 19:17:03.031657
1251	75	386	2017-11-20 19:17:03.036757	2017-11-20 19:17:03.036757
1252	75	387	2017-11-20 19:17:03.041873	2017-11-20 19:17:03.041873
1253	75	388	2017-11-20 19:17:03.046931	2017-11-20 19:17:03.046931
1254	75	389	2017-11-20 19:17:03.052363	2017-11-20 19:17:03.052363
1255	75	390	2017-11-20 19:17:03.063919	2017-11-20 19:17:03.063919
1256	75	391	2017-11-20 19:17:03.06952	2017-11-20 19:17:03.06952
1257	75	392	2017-11-20 19:17:03.075582	2017-11-20 19:17:03.075582
1258	75	393	2017-11-20 19:17:03.082287	2017-11-20 19:17:03.082287
1259	75	394	2017-11-20 19:17:03.088841	2017-11-20 19:17:03.088841
1260	75	395	2017-11-20 19:17:03.094981	2017-11-20 19:17:03.094981
1261	75	396	2017-11-20 19:17:03.100337	2017-11-20 19:17:03.100337
1262	75	397	2017-11-20 19:17:03.105452	2017-11-20 19:17:03.105452
1263	75	398	2017-11-20 19:17:03.110448	2017-11-20 19:17:03.110448
1264	75	399	2017-11-20 19:17:03.11557	2017-11-20 19:17:03.11557
1265	75	400	2017-11-20 19:17:03.121275	2017-11-20 19:17:03.121275
1266	75	401	2017-11-20 19:17:03.126501	2017-11-20 19:17:03.126501
1267	75	402	2017-11-20 19:17:03.131712	2017-11-20 19:17:03.131712
1268	75	403	2017-11-20 19:17:03.137	2017-11-20 19:17:03.137
1269	75	404	2017-11-20 19:17:03.141961	2017-11-20 19:17:03.141961
1270	75	405	2017-11-20 19:17:03.147091	2017-11-20 19:17:03.147091
1271	75	406	2017-11-20 19:17:03.151275	2017-11-20 19:17:03.151275
1272	75	407	2017-11-20 19:17:03.156829	2017-11-20 19:17:03.156829
1273	75	408	2017-11-20 19:17:03.162753	2017-11-20 19:17:03.162753
1274	75	409	2017-11-20 19:17:03.167245	2017-11-20 19:17:03.167245
1275	75	410	2017-11-20 19:17:03.171631	2017-11-20 19:17:03.171631
1276	75	411	2017-11-20 19:17:03.175725	2017-11-20 19:17:03.175725
1277	75	412	2017-11-20 19:17:03.179866	2017-11-20 19:17:03.179866
1278	75	413	2017-11-20 19:17:03.183849	2017-11-20 19:17:03.183849
1279	75	414	2017-11-20 19:17:03.188057	2017-11-20 19:17:03.188057
1280	75	415	2017-11-20 19:17:03.191912	2017-11-20 19:17:03.191912
1281	75	416	2017-11-20 19:17:03.195926	2017-11-20 19:17:03.195926
1282	75	417	2017-11-20 19:17:03.199724	2017-11-20 19:17:03.199724
1283	75	418	2017-11-20 19:17:03.204214	2017-11-20 19:17:03.204214
1284	75	419	2017-11-20 19:17:03.208619	2017-11-20 19:17:03.208619
1285	75	420	2017-11-20 19:17:03.212882	2017-11-20 19:17:03.212882
1286	75	421	2017-11-20 19:17:03.216859	2017-11-20 19:17:03.216859
1287	75	422	2017-11-20 19:17:03.221288	2017-11-20 19:17:03.221288
1288	75	423	2017-11-20 19:17:03.226385	2017-11-20 19:17:03.226385
1289	75	424	2017-11-20 19:17:03.23187	2017-11-20 19:17:03.23187
1290	75	425	2017-11-20 19:17:03.237257	2017-11-20 19:17:03.237257
1291	75	426	2017-11-20 19:17:03.242206	2017-11-20 19:17:03.242206
1292	75	427	2017-11-20 19:17:03.246442	2017-11-20 19:17:03.246442
1293	75	428	2017-11-20 19:17:03.250062	2017-11-20 19:17:03.250062
1294	75	429	2017-11-20 19:17:03.254106	2017-11-20 19:17:03.254106
1295	75	430	2017-11-20 19:17:03.257505	2017-11-20 19:17:03.257505
1296	75	431	2017-11-20 19:17:03.261316	2017-11-20 19:17:03.261316
1297	75	432	2017-11-20 19:17:03.26509	2017-11-20 19:17:03.26509
1298	75	433	2017-11-20 19:17:03.269534	2017-11-20 19:17:03.269534
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bandmembers_id_seq', 1298, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: gdev
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
25	Kyuss	\N	2017-06-12 15:23:56.757865	2017-06-12 15:23:56.757865	4
26	Monster Magnet	\N	2017-06-12 15:24:08.688664	2017-06-12 15:24:08.688664	4
27	Acid King	\N	2017-06-12 15:38:32.43529	2017-06-12 15:38:32.43529	4
28	Metallica	\N	2017-06-12 23:23:07.595399	2017-06-12 23:23:07.595399	3
29	Fu Manchu	\N	2017-06-12 23:30:17.288959	2017-06-12 23:30:17.288959	4
31	The Doors	American psychedelic rock/blues rock band formed in July, 1965 in Los Angeles, CA, United States and disbanded in 1973.\r\n\r\nInducted into Rock And Roll Hall of Fame in 1993 (Performer).\r\n	2017-11-20 18:16:43.357931	2017-11-20 18:16:43.357931	1
32	Eagles	Founded in 1971 by [a=Glenn Frey] (guitar), [a=Bernie Leadon] (banjo, mandolin, electric guitar, acoustic guitar), [a=Randy Meisner] (bass) and [a=Don Henley] (drums).\r\n\r\n[a=Don Henley]: drums, percussion, vocals\r\n[a=Timothy B. Schmit]: bass, vocals\r\n[a=Joe Walsh]: guitars, organ, vocals\r\n\r\nFormer members: [a=Bernie Leadon], [a=Randy Meisner], [a=Don Felder], [a=Glenn Frey]\r\n\r\nInducted into the Rock And Roll Hall of Fame in 1998 (Performer)	2017-11-20 18:16:58.086856	2017-11-20 18:16:58.086856	1
33	Lynyrd Skynyrd	Lynyrd Skynyrd (pronounced /ˌlɛnərd ˈskɪnərd/ len-ərd-skin-ərd) is an American rock band best known for popularizing the Southern hard rock genre during the 1970s. Originally formed in 1964 as the "Noble Five" in Jacksonville, Florida, the band rose to worldwide recognition on the basis of its driving live performances and signature tunes "Sweet Home Alabama," and "Free Bird." At the peak of their success, three members died in an airplane crash in 1977, putting an abrupt end to the band's most popular incarnation.\r\nSurviving members re-formed in 1987 for a reunion tour with lead singer Ronnie Van Zant's younger brother Johnny as frontman. A version of the band continues to tour and record, with only Gary Rossington of its original members remaining as of 2012. Lynyrd Skynyrd was inducted into the Rock and Roll Hall of Fame on March 13, 2006.\r\n	2017-11-20 18:17:13.935293	2017-11-20 18:17:13.935293	1
34	Genesis	Formed in 1967, Genesis are among the top 30 highest-selling recording artists of all time. \r\n\r\nTheir early work is characterized by complex song structures, elaborate instrumentation and the theatrical antics of founder member and vocalist [a=Peter Gabriel], who left the band in 1975. Unable to find a suitable replacement, it was drummer Phil Collins who assumed vocal duties. This change, as well as the departure of guitarist [a=Steve Hackett], two years later, saw the remaining three members (Phil Collins, Tony Banks and Mike Rutherford) move into more accessible pop-based music. This change in style resulted in a huge growth in Genesis' popularity throughout the 1980s and early 1990s.\r\n\r\nIn 1996 Collins left to concentrate on his solo work and other projects, leaving erstwhile bandmates Mike Rutherford and Tony Banks to forge ahead with new recruit; [a=Stiltskin] vocalist Ray Wilson. This line-up lasted for one album only (1997's "Calling All Stations") and Genesis soon found itself on hiatus after the poor performance and critical reaction of the new album.\r\n\r\nIn 2006 - after years of speculation - Phil Collins, Tony Banks and Mike Rutherford reformed Genesis for the successful "Turn It On Again" tour. A reunion involving ex-members Peter Gabriel and Steve Hackett remains much talked-about and unrealised.\r\n\r\nInducted into the Rock & Roll Hall Of Fame 2010 (performer)\r\n\r\nMembers:\r\n[a=Peter Gabriel] (1967-1975)\r\n[a=Mike Rutherford] \r\n[a=Tony Banks] \r\n[a=Anthony Phillips] (1967-1970)\r\n[a=Chris Stewart (7)] (1967-1968)\r\n[a=John Silver (2)] (1968-1969)\r\n[a=John Mayhew] (1969-1970)\r\n[a=Steve Hackett] (1971-1977)\r\n[a=Phil Collins] (1970-1995, 2006-present)\r\n[a=Ray Wilson] (1996-1998)\r\n\r\nLive Members:\r\n[a=Bill Bruford] (1976)\r\n[a=Chester Thompson] (1977-1995, 2006-present)\r\n[a=Daryl Stuermer] (1978-1995, 2006-present)\r\n[a=Nir Z] (1996-1998)\r\n	2017-11-20 18:17:29.706473	2017-11-20 18:17:29.706473	1
35	U2	Dubliners U2 started in their hometown in 1976. They began their legacy rooting their music in the political turmoil that was all around them.\r\n\r\nAfter having Steve Lillywhite produce their first three albums, U2 looked for a more commercial sound. They hired Daniel Lanois and Brian Eno to produce "The Unforgettable Fire" and "The Joshua Tree" albums, which both put them onto the charts all over the world.\r\n\r\nAfter the 80s ended U2 re-invented themselves once again. Incorporating elements of electronics into their rock construct, U2 created a new sound with "Achtung Baby". Bono and the band used their notoriety more than ever expressing their opinions on social matters on a global scale.\r\n\r\nInducted into Rock And Roll Hall of Fame in 2005 (Performer).\r\n\r\nMembers:\r\nPaul David Hewson (aka Bono)\r\nDavid Howell Evans (aka The Edge)\r\nAdam Charles Clayton\r\nLawrence Joseph Mullen Jr.	2017-11-20 18:17:53.737197	2017-11-20 18:17:53.737197	1
36	Metallica	Thrash Metal (Heavy Metal) band from Los Angeles, California (USA).\r\n\r\nMetallica formed in 1981 by vocalist/guitarist James Hetfield and drummer Lars Ulrich.  The duo first met through an ad in a Los Angeles-based music newspaper.  At the time, Ulrich had little musical experience and no band but managed to secure a slot on an upcoming compilation record called “Metal Massacre”.   Metallica’s contribution, “Hit The Lights”, featured Hetfield, Ulrich and lead guitarist Lloyd Grant.  Afterwards, Ron McGovney became the band's bassist and Dave Mustaine joined the band as lead guitarist.  This line-up would re-record "Hit The Lights" for subsequent re-pressings of "Metal Massacre" and would also issue several demos.  In 1983, McGovney quit the group and was replaced by Cliff Burton, which also saw the band relocate to San Francisco.  Metallica then traveled to New York after signing a deal with [l=Megaforce Records].  However, once in New York, the band fired Mustaine.  It would mark the beginning of a long feud between Mustaine and Metallica, mostly fueled by remarks Mustaine would make to the press.  Mustaine was replaced by Kirk Hammett of [a=Exodus (6)].\r\n\r\nMetallica's debut LP, "Kill 'Em All", was released in 1983.  It was followed in 1984 by "Ride The Lightning".  This led to a major label deal with [l=Elektra].  In 1986, the band released "Master Of Puppets", which is considered by many to be one of the greatest heavy metal records of all time.  In September of that year, while on tour in Sweden, the band was involved in a bus accident which took the life of Cliff Burton.  Eventually, Jason Newsted (of [a=Flotsam And Jetsam]) was hired as the band's new bassist and he made his debut on 1987's "Garage Days Re-Revisited", an EP of cover tunes.  \r\n\r\nIn 1990, Metallica hooked up with producer [a=Bob Rock] for a self-titled release that would become better known as "The Black Album", due to its cover art. Released in 1991, the black album would become one of the best-selling rock albums of all time, selling over 16 million copies in the US alone.\r\n\r\nIn 1996, the band experimented with Rock music style Alternative Rock, this could be heard on the album "Load".  The following year, "Reload" appeared which had the similiar formula as ''Load''. The albums continued the band’s trend of more accessible music.  In 1999, the group released an album and accompanying film called "S&M", which featured Metallica performing their songs with the San Francisco Symphony Orchestra.\r\n\r\nIn 2001, as the band was preparing to begin work on a new album, Newsted quit the group, citing personal and musical reasons.  Work on the new album was further complicated when Hetfield entered rehab for alcohol abuse.  The album, called "St. Anger", was eventually completed in 2003 with producer Bob Rock handling the bass.  Upon its release, "St. Anger" drew mostly negative reviews.  Following the recording, Robert Trujillo, formerly of [a=Suicidal Tendencies], was hired as bassist.  The making of the album was captured in the documentary “Some Kind Of Monster”.\r\n\r\nIn 2008, "Death Magnetic", produced by [a=Rick Rubin], would surface and was hailed by many as Metallica's return to thrash metal.  The following year, Metallica was inducted into Rock And Roll Hall of Fame.  Former bassist Jason Newsted was present and Cliff Burton's father appeared on Cliff's behalf.  Dave Mustaine, who was not inducted, was invited to the ceremony by the band but declined to attend.  In 2011, Metallica collaborated with [a=Lou Reed] on the album, “Lulu”, which was largely panned by critics and ignored by consumers.    \r\n	2017-11-20 18:22:26.800174	2017-11-20 18:22:26.800174	8
37	Iron Maiden	Founded in Leyton in London's East End in 1975, Iron Maiden released their first album in 1980 as a five-piece with [a=Paul Di'Anno] on vocals. [a=Bruce Dickinson] would replace him in 1981. With several line-up changes [a=Steve Harris] would remain the only original member never to have had a hiatus. \r\n\r\nWhen [a=Bruce Dickinson] quit in 1994 and was replaced by [a=Wolfsbane]'s [a=Blaze Bayley], the band lost a lot of their fanbase. They recorded two albums with Blaze before [a=Bruce Dickinson] and [a=Adrian Smith (2)] returned to the fold for 2000's "Brave New World", and 2003's "Dance of Death", making them a six-piece. As of 1999 the line-up hasn't changed\r\n\r\nBand Members:\r\n\r\n[b]Vocals[/b]\r\n[a=Paul Mario Day] (1975-1976)\r\nDennis Wilcock (1976-1977)\r\n[a=Paul Di'Anno] (1978-1981)\r\n[a=Blaze Bayley] (1994-1998)\r\n[a=Bruce Dickinson] (1981-1993 and 1999-present)\r\n\r\n[b]Drums[/b]\r\nBarry "[a=Thunderstick]" Purkis (1977)\r\n[a=Doug Sampson] (1977-1979)\r\n[a=Clive Burr] (1980-1982)\r\n[a=Nicko McBrain] (1982-present)\r\n\r\n[b]Guitar[/b]\r\n[a=Dave Murray (2)] (1976-present)\r\n[a=Dennis Stratton] (1979-1980)\r\n[a=Adrian Smith (2)] (1980-1990 and 1999-present)\r\n[a=Janick Gers] (1990-present)\r\n\r\n[b]Bass[/b]\r\n[a=Steve Harris] (1975-present)\r\n\r\n[b]Keyboards[/b] \r\n[a=Michael Kenney] (1986-present) (Live performances only, not a full member)	2017-11-20 18:22:55.350597	2017-11-20 18:22:55.350597	8
38	Black Sabbath	Considered by many to be the first heavy metal band, Black Sabbath was formed in 1968 by [a=Tony Iommi], [a=Ozzy Osbourne], [a=Geezer Butler] and [a=Bill Ward].  The band's original name was the Polka Tulk Blues Band (later shortened to Polka Tulk) and later Earth before becoming Black Sabbath.  The original line-up lasted until 1979, after which Osbourne was fired and replaced by [a=Ronnie James Dio]. The line-up changes would continue, with no line-up remaining intact for consecutive studio releases. Throughout the changes, only Tony Iommi and keyboardist [a=Geoff Nicholls], who also joined the band in 1979, would remain with Black Sabbath, although Nicholls would not always be credited as a full member. In 1997, Iommi, Butler, Ward, and Osbourne reunited, touring and releasing a live album in 1998, although a long-rumored studio release did not appear (the group attempted to record a new album in 2001 with producer [a=Rick Rubin] but the sessions were scrapped). After that, the group periodically reunited to tour with Ozzy's "Ozzfest" tour. In 2004, longtime keyboardist Geoff Nicholls was replaced by [a=Adam Wakeman] for an Ozzfest tour. No reason was given for the replacement. In 2006, the original line-up was inducted into the Rock 'n' Roll Hall Of Fame. \r\n\r\nIn 2007, Tony Iommi, Geezer Butler, Ronnie James Dio, and drummer [a=Vinny Appice] (who were featured on 1981's "Mob Rules" and 1992's "Dehumanizer") announced that they would tour together as [a=Heaven & Hell (2)] (with Iommi, who owns the Black Sabbath name, deciding to keep the Black Sabbath name solely for the original line-up in light of their Rock 'n' Roll HOF induction) to support a Dio-era greatest hits release, which also featured 3 new Dio/Iommi compositions. A brand new live album was released under the Heaven & Hell name that same year, followed by a studio album in 2009. \r\n\r\nIn 2009, Osbourne sued Iommi over control of the Black Sabbath name.  The lawsuit was settled the following year.  In late 2011, it was announced that the original line-up would be recording and touring.  Shortly, afterward, Bill Ward dropped out, stating he had been given a contract that was "unsignable".  The three remaining members opted to continue without him.  In 2013, the band released "13", their first studio album with Osbourne in 34 years.  The band played their final live show in Birmingham, UK, on February 4, 2017.  Although the band has announced that full-scale touring is done, Tony Iommi has stated that the door is still open for future music and possible live appearances. \r\n\r\nLine-Ups:\r\nGuitar:\r\nTony Iommi - 1968-2017\r\n\r\nVocals:\r\nOzzy Osbourne - 1968-1977, 1978-1979, 1997-2017\r\nDave Walker - 1977-1978 (rehearsals and a TV appearance only)\r\nRonnie James Dio - 1979-1982, 1991-1992\r\nIan Gillan - 1983-1984\r\nGlenn Hughes - 1985-1986\r\nRay Gillen - 1986-1987 (live only)\r\nTony Martin - 1987-1991, 1993-1996\r\n\r\nBass:\r\nGeezer Butler - 1968-1984, 1991-1994, 1997-2017\r\nCraig Gruber - 1979 (rehearsals only while Butler contemplated leaving the band, the extent of his participation has been disputed)\r\nGordon Copley -1985 (rehearsals and one studio track only)\r\nDave "The Beast" Spitz - 1985-1986, 1987 (live appearances only in 1987)\r\nBob Daisley - 1987 (studio only)\r\nJo Bert - 1987 (live only)\r\nLaurence Cottle - 1988 (studio only)\r\nNeil Murray - 1989-1992, 1995-1996\r\n\r\nDrums:\r\nBill Ward - 1968-1980, 1983 (studio only in 1983), 1994 (live appearances), 1997-2011\r\nVinny Appice - 1981-1982, 1991-1992, 1998 (live only in 1998, filling in for a sick Bill Ward)\r\nBev Bevan - 1983-1984, 1987 (live only)\r\nEric Singer - 1985-1987\r\nTerry Chimes - 1987-1988 (live only)\r\nCozy Powell - 1988-1991, 1994-1995\r\nBobby Rondinelli - 1993-1994, 1995 (live appearances only in 1995)\r\nMike Bordin - 1997 (live only, not a full member)\r\nBrad Wilk - 2013 (studio only, not a full member)\r\nTommy Clufetos - 2012-2017 (live only, not a full member)\r\n\r\nKeyboards:\r\nRick Wakeman - 1973 (studio only, not a full member)\r\nJezz Woodruffe - ?-1977 (not a full member)\r\nDon Airey - 1978 (not a full member)\r\nGeoff Nicholls - 1979-2004\r\nAdam Wakeman - 2004-2017 (live only, not a full member)\r\n	2017-11-20 18:23:10.500724	2017-11-20 18:23:10.500724	8
39	Megadeth	Formed: 1983 in Los Angeles, California. Disbanded: 2002. Reformed: 2004.\r\n\r\nAmerican Thrash Metal band formed by guitarist/vocalist Dave Mustaine and bass guitarist David Ellefson following the formers ejection from [a=Metallica].\r\n\r\nDespite countless line-up changes, Megadeth is partly responsible for the popularization of Thrash Metal in the late 1980s. The band was also notorious for its substance abuse, a contributing factor to their continuous revolving door of band members. The group nonetheless found sobriety and a stable line up with 1990's [r=2017460], a trend which continued until 1998 with the departure of drummer Nick Menza. \r\n\r\nDave Mustaine disbanded Megadeth in 2002 due to a nerve injury he had suffered on his left arm. Following a year of physical therapy Mustaine began work on what was to be his first solo album, however contractual obligations forced [r=379626] to be released under the Megadeth name, following which, Mustaine decided to reform the band.\r\n	2017-11-20 18:23:28.550924	2017-11-20 18:23:28.550924	8
64	Clutch (3)	Clutch is an American Rock band that got its start in the early 1990's in the Maryland-Washington, DC area.\r\n\r\nMembers include Neil Fallon (vocals), Tim Sult (lead guitar), Dan Maines (bass), and Jean Paul Gaster (drums).	2017-11-20 19:02:10.935569	2017-11-20 19:02:10.935569	4
40	Judas Priest	Judas Priest is a pioneering British Heavy Metal band and was a forerunner in the ‘New Wave of British Heavy Metal’ movement, laying the groundwork for the speed and thrash metal of the ’80s and ’90s with numerous classic albums.\r\n\r\nThe band was formed in Birmingham, England in 1969 by guitarist John Perry (who died shortly after and was replaced by Earnest Chataway), bassist Bruno Stapenhill, drummer John Partridge, and singer [a=Alan Atkins], who created a band name from Bob Dylan's song '[i][r=3881740][/i]'. In 1970, guitarist Kenneth [a=K. K. Downing] and bassist [a=Ian Hill (2)] joined, replacing Chataway and Stapenhill. Later, in 1972, [a=Rob Halford] and drummer [a=John Hinch] joined to replace Atkins and Partridge, respectively. A second guitarist, [a=Glenn Tipton], was also added to the line-up in 1974 as compensation for its record company’s (Gull Records) suggestion to add a horn section to the first album, Rocka Rolla.\r\n\r\nThe band featuring Halford, Downing, Tipton and Hill would go on to record 14 albums from 1974 through to 1990. Priest went through a considerable amount of drummers between its formation and 1980 when [a=Trapeze] drummer [a=Dave Holland] joined and stayed until 1988’s Ram It Down. In early 1990 [a=Racer X] drummer [a=Scott Travis] joined the band and recording began on its Painkiller album. In mid 1990 the band was taken to court over the attempted suicide of two young boys in Reno, allegedly driven by subliminal messages on its Stained Class album. The case was eventually thrown out of court and in September 1990, Painkiller was released.\r\n\r\nHalford left the group in 1993 to pursue a solo career but the band was determined to find a suitable replacement vocalist. Tim "Ripper" Owens, an Ohioan tribute band singer was chosen after a lengthy auditioning process and the band recorded 4 albums (2 studio, 2 live) with Owens.\r\n\r\nIn 2003, Judas Priest’s 1990 line-up was restored when Rob Halford returned to the group after rekindling the relationship during work on Judas Priest’s 4-CD career retrospective “Metalogy.” In 2004 the band played Ozzfest and released a CD of new studio material entitled Angel of Retribution and an accompanying live DVD in 2005, enjoying a successful world tour that year. This was followed by the 2CD concept album Nostradamus in 2008 and the release of its fifth live album in 2009.\r\n	2017-11-20 18:23:43.430951	2017-11-20 18:23:43.430951	8
41	Green Day	Green Day is a pop punk/alternative rock band from East Bay, California that formed in 1987. They were originally called Sweet Children, but changed their name before their first release.\r\n\r\nCurrent lineup \r\nlead vocals, guitars : [a=Billie Joe Armstrong]\r\nbass guitar, backing vocals : Mike Dirnt ([a=Michael Pritchard])\r\ndrums, percussion : Tré Cool ([a=Frank E. Wright] III)\r\nguitars, backing vocals :Jason White ([a=Jason White (3)])\r\n\r\nFormer member:\r\nDrums: [a=John Kiffmeyer] alias [a=Al Sobrante] until 1990.	2017-11-20 18:38:51.529279	2017-11-20 18:38:51.529279	22
42	Ramones	American punk rock band formed in 1974 and disbanded in 1996.\r\n\r\nHailing from Forest Hills - a neighborhood of Queens, New York City (USA) - the original line-up consisted of singer [a=Joey Ramone] (Jeffrey Hyman, born May 19th, 1951, died April 15th, 2001), guitarist [a=Johnny Ramone] (John Cummings, born October 8th, 1948, died September 15th, 2004), bassist [a=Dee Dee Ramone] (Douglas Colvin, born September 18th, 1952, died June 5th, 2002) and drummer [a=Tommy Ramone] (Tom Erdelyi, born January 29, 1952, died July 11th, 2014). \r\n\r\nAfter Tommy left the band in 1978 he was replaced by [a=Marky Ramone] (Marc Bell). He then left the band in 1983 and was then replaced by [a=Richie Ramone] (Richard Beau). In 1987, he then left the band and Marky came back to take his place. In 1989, Dee Dee left and was replaced by [a=C.J. Ramone] (Christopher John Ward).\r\n\r\nIn 2001, Joey Ramone passed away, a victim of Lymphoma. The following year, Dee Dee died in Los Angeles on June 5th, 2002. Johnny Ramone died in his sleep in Los Angeles on September 15th, 2004. Tommy died 10 years later, on July 11th, 2014, making him the last original member of the Ramones to die.\r\n\r\nInducted into Rock And Roll Hall of Fame in 2002 (Performer).	2017-11-20 18:39:09.120661	2017-11-20 18:39:09.120661	22
43	Dead Kennedys	Legendary punk band hailing from San Francisco, formed in 1978 & fronted by the even more legendary [a=Jello Biafra] (Eric Boucher). They split up in the mid-80s, and there has been animosity between Jello and the rest of the band since the late '90s, with a recent court case awarding all the rights to all the songs to the rest of the band.	2017-11-20 18:39:30.572625	2017-11-20 18:39:30.572625	22
44	The Clash	Influential British punk group from west and south London, active between 1976 and 1985. Adding catchy sloganistic socio-political lyrics to their brand of garage rock 'n' roll, the band soon explored wider musical horizons than most of their contemporaries, incorporating reggae, dub, rockabilly, hip hop and funk influences into their music and a whole lot more. \r\nThe US saw the 2nd album "Give 'Em Enough Rope" relased before the first to coincide with the band's first transatlantic tour in early 1979 (and like in Japan and in Canada) the 1st LP "The Clash" was soon repackaged with an updated track list and the addition of a free 7" "Groovy Times" / "Gates Of The West" which wasn't released separately. A year later they were receiving worlwide acclaim with their classic double album "London Calling".\r\nInducted into Rock And Roll Hall of Fame in 2003 (Performer), their classic line-up comprised [a=Joe Strummer] (vocals / guitar, b. John Graham Mellor August 21, 1952 Ankara, Turkey d. Dec 22, 2002 Broomfield, Somerset, England), Paul Simonon (bass, b.December 15, 1955), Mick Jones (guitar, b. June 26, 1955) and Nicky "Topper" Headon (drums, b.May 30, 1955).\r\n	2017-11-20 18:39:46.174072	2017-11-20 18:39:46.174072	22
45	Misfits	The Misfits are an American horror-themed punk rock band from Lodi, New Jersey. Formed in early 1977, they took the band name from Marilyn Monroe's last film and in fact, thanked the cast of the movie on the back of their first record. The founding members were: Glenn Danzig on vocals and electric piano, Jerry Caiafa (Jerry Only) on bass, and Manny on drums. Their first release on their own label, Blank Records, didn't reflect the characteristic anger and rebellion of most "punk" records, but instead a more brooding and sinister, yet romantic side lingering beneath.  Following the single, Danzig and Only recruited a new drummer and added a guitar player and pursued the horror-based punk rock direction that they are known for.  Danzig and Only presided over several line up changes, eventually culminating with Jerry's younger brother, Paul (aka Doyle) becoming the band's permanent guitarist.\r\n\r\nThe original Misfits broke up in October 1983, having released several 7" singles and 12" records, all of which were DIY limited-edition and most of which were hand-assembled by the band, that have long been considered prime collectors' items.  The bulk of the band's material was released on Glenn's Plan 9 label.  The band's popularity grew exponentially following their split and their material and tapes of their live shows were heavily bootlegged.\r\n\r\nFollowing the Misfits' dissolution, Danzig formed a new band called Samhain while Jerry Only and Doyle, heavily in debt to their father over band expenses, stepped away from music to work full time jobs at their father's company.  Between 1986 and 1988, Glenn continued to issue unreleased and out of print Misfits material.  Some of the songs on these collections featured guitar and bass tracks re-recorded by Glenn while others were all new recordings of old songs performed by Glenn and his Samhain bandmate Eerie Von.  These collections were released by Plan 9 records.  Jerry Only eventually contacted Danzig about royalties from these releases which resulted in a lawsuit between the two.  In 1995, an out of court settlement was reached that gave Only the rights to the Misfits name while Glenn maintained control of the publishing for the band's old material and the Plan 9 label was terminated. \r\n\r\nJerry Only and Doyle reformed The Misfits in 1995, recruiting Michale Graves on vocals and Dr. Chud on drums. The new incarnation of the Misfits released two full-length albums, "American Psycho" and "Famous Monsters" as well as a collection of rare and unreleased "resurrected" Misfits tracks, until Michale Graves and Dr. Chud left the band on October 25, 2000 at a performance at the House of Blues in Orlando.  Doyle went on "indefinite hiatus" from the band, later stating he was frustrated with decisions that his brother had made regarding the band.  In 2004, Doyle reconnected with Glenn Danzig and has periodically made live appearances with Glenn to perform Misfits tunes.  Meanwhile, Jerry Only took over the vocalist spot in the Misfits while recruiting former Black Flag vocalist Dez Cadena to play guitar and Marky Ramone for the drums.  Ramone eventually left and was replaced by former Misfits and Black Flag drummer Robo, who was later replaced by Eric "Chupacabra" Arce.  In 2001, Only and associate John Cafiero set up Misfits Records to release new material by the band.  After releasing an album of cover tunes in 2003, the Only-fronted line up released it's first album of original tunes in 2011.	2017-11-20 18:40:06.433893	2017-11-20 18:40:06.433893	22
46	Wu-Tang Clan	The Wu-Tang Clan is a rap group that formed in Staten Island, New York in 1992. It originally consisted of 9 members: [a=RZA], [a=GZA], [a=Ol' Dirty Bastard], [a=Inspectah Deck], [a=U-God], [a=Raekwon], [a=Ghostface Killah], [a=Method Man], and [a=Masta Killa]. [a=Cappadonna] was later inducted as a 10th member.	2017-11-20 18:43:49.043624	2017-11-20 18:43:49.043624	2
47	N.W.A.	U.S. American group, seminal purveyors of the gangsta rap sub-genre. N.W.A. stands for "Niggaz Wit Attitudes." They were active from 1986 to 1991 and shortly in 1999/2000.\r\n\r\nN.W.A released [m=40320] in 1987 on Macola Records, which was later included on the compilation [m=139509]. The group was still in its developing stages, and only credited on four of the eleven tracks, notably the uncharacteristic electro-hop record "Panic Zone," "8-Ball," and "Dopeman," which marked the first collaboration of [a76220], DJ [a12330],  [a50513], and [a13732]. Hispanic rapper [a663863] co-wrote "Panic Zone," which was originally called "Hispanic Zone," but the title was later changed when Dr. Dre advised Krazy-Dee that the word "hispanic" would hinder sales. Also included was [a76073]'s solo track "Boyz-n-the Hood."\r\n\r\nIn 1988, rapper [a100748] joined N.W.A. and later that year, the group released their debut album [m=26117]. Though not a success at first, "Straight Outta Compton" helped pave the way for the emerging gangsta rap scene in the 1980s, and reached number 37 in the Billboard Top 200 in May 1989, while it reached number 9 on Billboard's Top Soul LPs. The album managed to sell over three million copies without any airplay, and spawned three singles, two of them charting successfully: "Straight Outta Compton," "Gangsta Gangsta" and "Express Yourself".\r\n\r\nIce Cube left in December 1989 over royalty disputes -- having written almost half of the lyrics on "Straight Outta Compton" himself, he felt he was not getting a fair share of the money and profits. He wasted little time putting together his solo debut, 1990's [m=97462], but he avoided mentioning his former label mates. Instead of breaking up, N.W.A. decided to continue without Ice Cube, releasing the EP [m=26111], which went platinum. Their 1991 follow-up album [m=26113] (also referred to as "Niggaz4Life") was the first hip-hop full-length album to reach number one on the Billboard 200. Shortly after the release of "Efil4zaggin," N.W.A. disbanded. All members continued making music since then, with Dr. Dre going solo and Eazy-E running Ruthless Records and releasing more music until he died of AIDS in 1995.	2017-11-20 18:44:06.722323	2017-11-20 18:44:06.722323	2
48	Run-DMC	Run-D.M.C.: \r\n\r\n[a=Joseph Simmons] aka [a=Run]\r\n[a=Darryl McDaniels] aka [a=DMC (2)]\r\n[a=Jason Mizell] aka [a=Jam Master Jay]  R.I.P. (January 21, 1965 – October 30, 2002)\r\n\r\nInducted into the Rock and Roll Hall of Fame in 2009 (Performer). \r\n	2017-11-20 18:44:27.116395	2017-11-20 18:44:27.116395	2
49	A Tribe Called Quest	This US male rap outfit originally comprised [a=Q-Tip] (b. Jonathan Davis ―later changed to Kamaal Ibn John Fareed, in the mid-1990's, on conversion to Islam― 10 April 1970, New York, USA), DJ [a=Ali Shaheed Muhammad] (b. 11 August 1970, Brooklyn, New York City, USA), [a=Jarobi] and [a=Phife Dawg] (b. Malik Taylor, 20 November 1970, Brooklyn, New York City, USA; d. 22 March 2016, USA). They formed at school in Manhattan, New York, where they started out as part of the Native Tongues Posse, with [a=Queen Latifah] and the [a=Jungle Brothers], and were given their name by [a=Afrika Baby Bambaataa] of the Jungle Brothers. \r\n\r\nFollowing their August 1989 debut, "Description Of A Fool", they had a hit with "Bonita Applebum" a year later, which was apparently based on a real person from their school. \r\nTheir biggest success came the following year with the laid-back "Can I Kick It?", typical of their refined jazz/hip-hop cross-match. A UK Top 20 single, it was later used extensively in television advertisements. Q-Tip also appeared on Deee-Lite's August 1990 hit, "Groove Is In The Heart". \r\n\r\nAs members of the Native Tongues Posse they were promoters of the Afrocentricity movement, which set out to make US Africans aware of their heritage, a theme emphasized in the group's music. \r\n\r\nWhile their debut, "People's Instinctive Travels And The Paths Of Rhythm", was more eclectic, and even self-consciously jokey, "The Low-End Theory" (recorded as a trio following the departure of Jarobi) saw them return to their roots with a more bracing, harder funk sound. \r\n\r\nThey were helped considerably by jazz bass player [a=Ron Carter] (who had worked with [a=Miles Davis] and [a=John Coltrane]), whose contribution rather dominated proceedings. Tracks such as "The Infamous Date Rape" stoked controversy, while samples from [a=Lou Reed], [a=Stevie Wonder] and [a=Earth, Wind & Fire] were used in a frugal and intelligent manner. By "Midnight Marauders" there were allusions to the rise of gangsta rap, although they maintained the optimism predominant on their debut. Q-Tip appeared in the 1993 movie "Poetic Justice" opposite [a=Janet Jackson], and helped to produce [a=Tony! Toni! Toné!] (whose Raphael Wiggins made an appearance on "Midnight Marauders"), [a=Nas], [a=Shyheim] and labelmate [a=Shaquille O'Neal]. \r\n\r\nThey were rewarded with the Group Of The Year category at the inaugural Source Magazine Hip Hop Award Show in 1994, before being pulled off the stage by the arrival of 2Pac and his Thug Life crew, attempting to steal some publicity. Two years elapsed before "Beats, Rhymes And Life" debuted at number 1 on the Billboard album chart. Their lyrics on this album were highly evolved, addressing issues with greater philosophy than the crude banter of their past recordings. Q-Tip's conversion to the Islamic faith in the mid-1990's may have had some bearing on this style. \r\n\r\n"The Love Movement", which debuted at US number 3 in October 1998, was another mature, stylish collection of material that lacked the spark of their earlier work.  ATCQ released "We Got It From Here... Thank You 4 Your Service" on November 4, 2016, nearly 18 years after their last album.  In the midst of record verses for the album as well as verses for his solo album, Phife Dawg passed away on March 22, 2016. During its first month of release, the album was greeted with both critical acclaim and fan support.\r\n	2017-11-20 18:44:48.549473	2017-11-20 18:44:48.549473	2
50	Public Enemy	Formed 1986, Long Island (or as PE call it, 'Strong Island'), New York. \r\nMembers: Chuck D (MC, 1986–present); Flavor Flav (MC, 1986–present); Terminator X (DJ, 1986–1998); DJ Lord (DJ,1999–present); Professor Griff ('Minister of Information' and occasional MC, 1986–1990 and 1998–present); Security Of The First World (S1W) (associate non-music group, 1986–present).\r\n\r\nInducted into Rock And Roll Hall of Fame in 2013 (Performer).\r\n	2017-11-20 18:45:07.508451	2017-11-20 18:45:07.508451	2
51	The Carter Family	American traditional folk music group, formed in 1927. Their music was hugely influential for bluegrass, country, folk, and rock musicians. The original group split up when A.P. Carter and Sara Carter left in 1944, but Maybelle Carter and her daughters continued performing as [a1353326]. In the 1960's, [a1353326] reclaimed the name The Carter Family.\r\n\r\nMembership (as [a307357], 1927-1944, ~1960 to 1996; as [a1353326], 1944-~1960):\r\nA.P. Carter – 1927-1944\r\nMaybelle Carter – 1927-1978\r\nSara Carter – 1927-1944\r\nJanette Carter – 1939-1940\r\nJoe Carter – 1939-1940\r\nHelen Carter – 1939-1940, 1944-1996\r\nJune Carter – 1939-1940, 1944-1969, 1971-1996\r\nAnita Carter – 1939-1940, 1944-1996\r\nRobbie Harden – 1969-1971	2017-11-20 18:54:46.392878	2017-11-20 18:54:46.392878	11
52	Bill Monroe & His Blue Grass Boys		2017-11-20 18:55:09.47287	2017-11-20 18:55:09.47287	11
53	Flatt & Scruggs		2017-11-20 18:55:16.804701	2017-11-20 18:55:16.804701	11
54	Alabama	Alabama is an American country, Southern rock and bluegrass band formed in Fort Payne, Alabama in 1969.	2017-11-20 18:55:23.916659	2017-11-20 18:55:23.916659	11
55	The Louvin Brothers	Please only use this profile for credits with the word "Brothers", "Bros." etc. Individual credits for Charlie and Ira should be linked to their respective profiles.\r\n\r\nAn American country vocal/harmony duet, consisting of brothers Ira and Charlie Loudermilk. Their professional career began after winning a talent contest by singing "There's a Hole in the Bottom of the Sea." Brief stints on Apollo, Decca, and MGM led to them being signed by Capitol Records. At first their recordings were strictly gospel, but they switched to country with the 1955 release of "When I Stop Dreaming." Their career continued until 1963 when they broke up due to Ira's volatile temper. Charlie began a successful solo career in 1964. Ira was killed in a car wreck in Jefferson City, Missouri on June 20, 1965.  Songs he had recorded for a solo album were released posthumously.\r\n\r\nThe Louvin Brothers were inducted into the Alabama Music Hall of Fame in 1991 and the Country Music Hall of Fame in 2001.\r\n	2017-11-20 18:55:30.416131	2017-11-20 18:55:30.416131	11
56	ABBA	[a149038] (born April 5th, 1950): vocals\r\n[a268733] (born April 25th, 1945): guitars, vocals\r\n[a69873] (born December 16th, 1946): keyboards, vocals\r\n[a688940] (born November 15th, 1945): vocals\r\n\r\nInternationally successful Swedish pop group, active from 1972 until 1983. The most commercially successful artists of the 1970s, their biggest hits include Dancing Queen, Fernando, Waterloo, Chiquitita, Mamma Mia, and Take A Chance On Me. Sales figures for the group are widely varying, with the official estimate at 370 million records.\r\n\r\nTheir music has seen a resurgence in interest in part due to the release of their multi-platinum greatest hits album "ABBA Gold" in 1992 and a general revival in interest in disco and '70s music around the same time. Their music gained even greater visibility with the jukebox musical "Mamma Mia!" based on their hits, which opened in 1999 and is still running in venues around the world.\r\n\r\nABBA were inducted into the Rock & Roll Hall of Fame in 2010 in the category of performer.\r\n	2017-11-20 18:58:50.140119	2017-11-20 18:58:50.140119	17
57	Bee Gees	A singing trio of brothers — [a151481], [a179142], and [a290019]. They were born on the Isle Of Man to English parents, lived in Chorlton-cum-Hardy, Manchester, England, UK and during their childhood years moved to Brisbane, Australia, where they began their musical careers. Their worldwide success came when they returned to the UK and signed with producer [a272144]. \r\n\r\nThe multiple award-winning group was successful for most of its forty years of recording music, but it had two distinct periods of exceptional success: as a harmonic 'soft rock' act in the late 1960s and early 1970s, and as the foremost stars of the disco music era in the late 1970s. \r\n\r\nNo matter the style, the Bee Gees sang three-part tight harmonies that were instantly recognizable; as brothers, their voices blended perfectly, in the same way that The Everly Brothers and Beach Boys did. Barry sang lead on many songs, in an R&B falsetto introduced in the disco years; Robin provided the clear vibrato lead that was a hallmark of their pre-disco music; Maurice sang high and low harmonies throughout their career. The three brothers co-wrote most of their hits, and they said that they felt like they became 'one person' when they were writing. \r\n\r\nIn 1994 [a746270] were inducted into the Songwriters Hall of Fame, in 1997 the Band was inducted into Rock And Roll Hall of Fame (Performer).\r\n\r\nThey were all given CBE's (Commander of the Order of the British Empire) in the 2001-2002 New Year's Honours List. The group's name was retired by the remaining brothers after Maurice died in January 2003.\r\n\r\nHowever, as time passed, they decided to perform occasionally under the Bee Gees banner until brother Robin Gibb died in May 2012.\r\n	2017-11-20 18:58:55.935057	2017-11-20 18:58:55.935057	17
58	The Monkees	American pop group. Formed on September 12, 1966. \r\nMembers: Davy Jones (vocals, guitar), Mike Nesmith (vocals, guitar), Peter Tork (vocals, guitar), Micky Dolenz (vocals, drums)\r\nDavy Jones passed away 2012-02-29 due to a heart attack.\r\n	2017-11-20 18:59:03.907961	2017-11-20 18:59:03.907961	17
59	The Beach Boys	Formed 1961, Hawthorne, CA.\r\nInducted into Rock And Roll Hall of Fame in 1988 (Performer).\r\nCurrent Line Up-Mike Love, Al Jardine, Brian Wilson, David Marks	2017-11-20 18:59:10.191793	2017-11-20 18:59:10.191793	17
60	Fleetwood Mac	Founded in London in July 1967 (by ex [url=http://www.discogs.com/artist/John+Mayall+%26+The+Bluesbreakers]Bluesbreakers[/url] members, Peter Green and Mick Fleetwood), [url=http://www.discogs.com/artist/Fleetwood+Mac?filter_anv=1&anv=Peter+Green%27s+Fleetwood+Mac]Peter Green's Fleetwood Mac[/url] instantly became a major force in the UK blues scene, along with their eponymous first album. Following "Mr. Wonderful" & "Then Play On" the driving force of Peter Green had deteriorated as he lapsed into a personal crisis by 1970. The group reorganized, under the leadership of Fleetwood, and slowly took on a new direction - away from the blues and into the mainstream of international popularity, known simply as [b]Fleetwood Mac[/b].\r\n\r\nMember/Dates:\r\nPeter Green (guitar, vocals, 1967-70), Mick Fleetwood (drums, 1967-1995, 1997-present), John McVie (bass, 1967-1995, 1997-present), Jeremy Spencer (guitar, vocals, 1967-71), Bob Brunning (bass, 1967), Danny Kirwan (guitar, 1968-72), Christine McVie (vocals, piano, accordion, 1970-1995, 1997-1998, 2014-present), Bob Welch (guitar, vocals, 1971-74), Bob Weston (guitar, 1973-74), Dave Walker (guitar, vocals, 1973), Lindsey Buckingham (guitar, vocals, piano, 1975-87, 1993, 1997-present), Stevie Nicks (vocals, 1974–1991, 1993, 1997-present), Billy Burnette (guitar, vocals, 1990-94), Rick Vito (guitar, 1990-91), Dave Mason, (guitar, vocals, 1993-94), Bekka Bramlett (vocals, 1993-94).\r\n\r\nInducted into Rock And Roll Hall of Fame in 1998 (Performer)	2017-11-20 18:59:18.748612	2017-11-20 18:59:18.748612	17
61	Kyuss	Stoner Rock band formed in 1988 as 'Katzenjammer'. They changed their name to 'Sons of Kyuss' in 1989 and released a self-titled EP in the following year. In 1991 the band shortened its name to 'Kyuss'.\r\nThey released 4 full-length albums (1991-1995).\r\nDisbanded in 1996 and reunited in 2010 as 'Kyuss Lives!'.\r\n\r\n1988: Formed as 'Katzenjammer' by Joshua Homme (Lead Guitar), Nick Oliveri (Rhythm Guitar), Chris Cockrell (Bass), Brant Bjork (Drums) and John Garcia (Vocals).\r\n1989-1991: Nick Oliveri leaves 'Katzenjammer' and the band changes their name to 'Sons of Kyuss'. Together, they recorded a self-titled EP.\r\n1991-1992: Chris Cockrell leaves 'Sons of Kyuss' and Nick Oliveri returned as a bassist. The band eventually changes their name to 'Kyuss' and records two albums. Nick Oliveri then left again and was replaced by Scott Reeder from [a=The Obsessed].\r\n1992-1994: Brant Bjork leaves and later joins [a=Fu Manchu] in 1996. Alfredo Hernandez joins the band. \r\n1994-1996: The band breaks up. John Garcia forms [a=Slo Burn]. Joshua Homme forms [a=Gamma Ray (2)].\r\n1996: John Garcia and Scott Reeder formed [a=Unida].\r\n1997: Nick Oliveri forms the [a=Mondo Generator].\r\n1998-1999: Joshua Homme, Nick Oliveri and Alfredo Hernandez form [a=Queens Of The Stone Age].\r\nNov 2010: Kyuss confirmed that they reunited and will tour in the spring of 2011 under the name 'Kyuss Lives!'.\r\n	2017-11-20 19:01:44.127593	2017-11-20 19:01:44.127593	4
62	Fu Manchu	Californian stoner-rock band.\r\n\r\nFormed in 1987 as hardcore band [a=Virulence].  They changed their name to Fu Manchu in 1990 and started turning more towards stoner-rock.\r\n	2017-11-20 19:01:52.694322	2017-11-20 19:01:52.694322	4
63	Queens Of The Stone Age	Alternative Rock/Stoner band formed in 1997 in Palm Desert, California, United States.	2017-11-20 19:02:00.33458	2017-11-20 19:02:00.33458	4
65	Monster Magnet	American rock band formed in 1989 in Red Bank, NJ, United States.\r\n\r\nMembers:\r\n[a=Dave Wyndorf] (vocals, guitar, keyboards)\r\n[a=Garrett Sweeny] (guitar, 2010-present)\r\n[a=Phil Caivano] (guitar, 1998-05, 2008-present)\r\n[a=Bob Pantella] (drums, 2004-present)\r\n[a=Chris Kosnik] (bass, 2014-present)\r\n\r\nPast members:\r\n[a=Tim Cronin] (vocals, 1989-93)\r\n[a=John McBain] (guitar, 1989-92)\r\n[a=Joe Calandra] (bass, 1989-03)\r\n[a=Jon Kleiman] (drums, 1989-03)\r\n[a=Ed Mundell] (guitar, 1992-2010)\r\n[a=Jim Baglino] (bass, 2003-13)\r\n[a=Michael Wildwood] (drums, 2003-04)	2017-11-20 19:02:18.137042	2017-11-20 19:02:18.137042	4
66	Anaal Nathrakh	Anaal Nathrakh was created for one purpose - to be the soundtrack for armageddon, the audial essence of evil, hatred and violence, the true spirit of necro taken to its musical extremes... \r\n\r\nIn the beginning of 1999, Anaal Nathrakh recorded their first demo, "Anaal Nathrakh". Later the same year in September, another demo, "Total Fucking Necro", was produced. They made a deal with Leviaphonic Records and both demos were released on a disc titled "Total Fucking Necro - Double Demo Assault". The release was a hit in the underground. Never before had they heard such raw, brutal music before. Even the legendary Mayhem praised them after they had heard Anaal Nathrakh's cover of "De Mysteriis Dom Sathanas". \r\n\r\nThe band's debut CD, "The Codex Necro", which was released in 2001, was voted best newcomer of 2001 and best album of the year in the magazine Terrorizer. Anaal Nathrakh's latest album, "When Fire Rains Down From the Sky, Mankind Will Reap As It Has Sown", followed in 2003. The EP featured the legendary Attila Csihar (Mayhem, Aborym, Tormentor) and Seth Teitan 131 (Aborym).\r\n	2017-11-20 19:10:04.432558	2017-11-20 19:10:04.432558	10
67	The Algorithm		2017-11-20 19:10:10.210183	2017-11-20 19:10:10.210183	10
69	Master Boot Record	Avantgarde electronic project from Rome, Italy.	2017-11-20 19:12:31.634986	2017-11-20 19:12:31.634986	10
71	John Mayall & The Bluesbreakers	Group named after the successful 1966 'Blues Breakers' album by [a=John Mayall] with [a=Eric Clapton].\r\n\r\nThe Bluesbreakers' line-ups, along with the interpolating members of [a=Blues Incorporated], had a profound influence on the early British 'Electric Blues' scene, eventually spilling into the mainstream of progressive fusions and popular 'Rock'.\r\n\r\nEarlier members joined/formed some iconic groups, or gained successful solo careers. Like [a=Eric Clapton] and [a=Jack Bruce], later members of [a=Cream (2)].\r\n[a=Peter Green (2)], [a=John McVie] and [a=Mick Fleetwood], who formed Peter Green's Fleetwood Mac - which later evolved without Green into [a=Fleetwood Mac]. [a=Mick Taylor] later member of [a=Rolling Stones]. [a=Colosseum], [a=Free], [a=Don "Sugarcane" Harris], [a=Harvey Mandel], [a=Larry Taylor], [a=Aynsley Dunbar], [a=Johnny Almond], [a=Jon Mark]... the list could scroll until next week\r\n	2017-11-20 19:16:39.001289	2017-11-20 19:16:39.001289	16
72	Cream (7)	Sleeve design company from Amsterdam, The Netherlands\r\nAlso known as The Cream Group	2017-11-20 19:16:45.138397	2017-11-20 19:16:45.138397	16
73	ZZ Top	ZZ Top is an American rock band formed in 1969 in Houston, Texas. The band consists of guitarist and lead vocalist Billy Gibbons, bassist and co-lead vocalist Dusty Hill, and drummer Frank Beard. The band and its members went through several reconfigurations throughout 1969, achieving their current form when Hill replaced bassist Billy Etheridge in February 1970, shortly before the band was signed to London Records. Etheridge's departure issued primarily from his unwillingness to be bound by a recording contract.\r\n\r\nSince the release of the band's debut album in January 1971, ZZ Top has become known for its strong blues roots and humorous lyrical motifs, relying heavily on double entendres and innuendo. ZZ Top's musical style has changed over the years, beginning with blues-inspired rock on their early albums, then incorporating New Wave, punk rock and dance-rock, with heavy use of synthesizers.\r\n\r\nZZ Top was inducted into the Rock and Roll Hall of Fame in 2004. As a group, ZZ Top possesses 11 gold records and 7 platinum (13 multi-platinum) records; their 1983 album, Eliminator, remains the group's most commercially successful record, selling over 10 million units. ZZ Top also ranks 80th in U.S. album sales, with 25 million units.\r\n\r\n	2017-11-20 19:16:51.001337	2017-11-20 19:16:51.001337	16
74	The Allman Brothers Band	American rock/blues band once based in Macon, Georgia.\r\nYears active:  1969–1976, 1978–1982, 1989–2014.\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer).	2017-11-20 19:16:56.834124	2017-11-20 19:16:56.834124	16
75	The Who	Formed in 1964, Hammersmith, London, United Kingdom \r\nMembers:\r\nPete Townshend (guitar, vocals)\r\nRoger Daltrey (vocals, tambourine, harmonica)\r\nJohn Entwistle (bass, vocals, 1964-2002)\r\nKeith Moon (drums, vocals, 1964-78)\r\nKenney Jones (drums, 1978-88)\r\nJohn "Rabbit" Bundrick (keyboards, 1979-present)\r\nSimon Phillips (drums, 1989)\r\nZak Starkey (drums, 1996-present) \r\n \r\nInducted into Rock And Roll Hall of Fame in 1990 (Performer). \r\n	2017-11-20 19:17:02.947476	2017-11-20 19:17:02.947476	16
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('bands_id_seq', 75, true);


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
56	2017-11-20 18:16:54.53715	2017-11-20 18:16:54.53715	173f8cda8412c09ac4c0464bd6f89895edf4d5a7	image/jpeg	172657	2017-11-20 18:16:54.330432	Album	11
57	2017-11-20 18:17:10.178353	2017-11-20 18:17:10.178353	f325ace82507a339c3e0f7783e2a6300d1aa8f76	image/jpeg	93471	2017-11-20 18:17:09.974571	Album	12
58	2017-11-20 18:17:26.135297	2017-11-20 18:17:26.135297	1e533d55913422d045b285422c016c3674264fa5	image/jpeg	202229	2017-11-20 18:17:25.924696	Album	13
59	2017-11-20 18:17:49.925031	2017-11-20 18:17:49.925031	c2bd8108af955eae09b53e14fa6250e4c7f4061f	image/jpeg	119311	2017-11-20 18:17:49.747655	Album	14
60	2017-11-20 18:18:07.550861	2017-11-20 18:18:07.550861	0737936f39dc7479ac65f68f52311680eaaeead0	image/jpeg	58147	2017-11-20 18:18:07.354643	Album	15
61	2017-11-20 18:22:51.027121	2017-11-20 18:22:51.027121	47da19a3aa94d5f95e32dd79ad7cc7257eea0533	image/jpeg	91980	2017-11-20 18:22:50.830859	Album	16
62	2017-11-20 18:23:07.054398	2017-11-20 18:23:07.054398	395ad6fbf859f13d1ad536dda1834d4a0ba64fc9	image/jpeg	217765	2017-11-20 18:23:06.842044	Album	17
63	2017-11-20 18:23:25.075537	2017-11-20 18:23:25.075537	f6a80cb4e8ae15d8358d8d7657ebfac8c3f7c1fc	image/jpeg	109544	2017-11-20 18:23:24.875068	Album	18
64	2017-11-20 18:23:39.935116	2017-11-20 18:23:39.935116	331ee10a3b70c1cde36b8795e58956698090954a	image/jpeg	140149	2017-11-20 18:23:39.732383	Album	19
65	2017-11-20 18:23:54.772632	2017-11-20 18:23:54.772632	e532c350221f015f4e6a878a1cbce7bf535c3ecc	image/jpeg	157398	2017-11-20 18:23:54.560321	Album	20
66	2017-11-20 18:39:05.652682	2017-11-20 18:39:05.652682	f8aebe68df82729ac2d4c63fd2749ceaa316cff3	image/jpeg	106244	2017-11-20 18:39:05.454081	Album	21
67	2017-11-20 18:39:27.039612	2017-11-20 18:39:27.039612	f7f7c84e381e47ecf9a182b617c579e6299e51c7	image/jpeg	102958	2017-11-20 18:39:26.848982	Album	22
68	2017-11-20 18:39:42.619727	2017-11-20 18:39:42.619727	4324921f652fced5b56dbbba5b26555be5b90248	image/jpeg	267467	2017-11-20 18:39:42.388355	Album	23
69	2017-11-20 18:40:02.001824	2017-11-20 18:40:02.001824	76a3761203a3b60b2800460539e2733f4a2337df	image/jpeg	109381	2017-11-20 18:40:01.807049	Album	24
70	2017-11-20 18:40:19.024736	2017-11-20 18:40:19.024736	4d3a2f8afbe2069798a023242f0dc53d39021b0b	image/jpeg	248457	2017-11-20 18:40:18.79403	Album	25
71	2017-11-20 18:44:03.1348	2017-11-20 18:44:03.1348	e6882b5183a35fa5c0b0ad931f32504a9ad4c97c	image/jpeg	252721	2017-11-20 18:44:02.895097	Album	26
72	2017-11-20 18:44:23.53632	2017-11-20 18:44:23.53632	acb4710b6372d3652f3fa4454a3fbb2db61084aa	image/jpeg	157290	2017-11-20 18:44:23.331672	Album	27
73	2017-11-20 18:44:44.77706	2017-11-20 18:44:44.77706	c8d3ad8d852ef1a233ad64d467c8fd0c39a0e74c	image/jpeg	78231	2017-11-20 18:44:44.579374	Album	28
74	2017-11-20 18:45:02.469091	2017-11-20 18:45:02.469091	5a609c7f19aeda2908311276e35557eed15d0e26	image/jpeg	187184	2017-11-20 18:45:02.250873	Album	29
75	2017-11-20 18:45:19.953964	2017-11-20 18:45:19.953964	ff09a837dee51d9c8b46888fac88d31f4cae3025	image/jpeg	57259	2017-11-20 18:45:19.772842	Album	30
76	2017-11-20 18:54:49.663637	2017-11-20 18:54:49.663637	36a6a1995e450dd70692dd2ea280e3ac1dcf2139	image/jpeg	153415	2017-11-20 18:54:49.447381	Album	31
77	2017-11-20 18:55:13.005892	2017-11-20 18:55:13.005892	2475df651566d8e2934c7a27dff920ab06315361	image/jpeg	101669	2017-11-20 18:55:12.800957	Album	32
78	2017-11-20 18:55:20.35394	2017-11-20 18:55:20.35394	782157bf29d1e173bf915816cfeb5a9b4b73dde3	image/jpeg	224480	2017-11-20 18:55:20.140861	Album	33
79	2017-11-20 18:55:26.762274	2017-11-20 18:55:26.762274	e4c7835e697bb93179a09b36b6a74d7601fbc921	image/jpeg	168477	2017-11-20 18:55:26.552657	Album	34
80	2017-11-20 18:55:33.158276	2017-11-20 18:55:33.158276	7ad83b963b345c041b8e0f99fdbce21fbd87db18	image/jpeg	87428	2017-11-20 18:55:32.975456	Album	35
81	2017-11-20 18:58:52.378901	2017-11-20 18:58:52.378901	ed072730188f91b5d9cf222a57c27645eae25676	image/jpeg	118758	2017-11-20 18:58:52.157516	Album	36
82	2017-11-20 18:59:00.451234	2017-11-20 18:59:00.451234	09fb9e6ff6399ec18e77f41d9885b23f76c68d2a	image/jpeg	75475	2017-11-20 18:59:00.237244	Album	37
83	2017-11-20 18:59:06.620163	2017-11-20 18:59:06.620163	85e092afb64767022ac604f8647ae44344484490	image/jpeg	183521	2017-11-20 18:59:06.380464	Album	38
84	2017-11-20 18:59:14.051608	2017-11-20 18:59:14.051608	f7e4c398406a489e2ab3db067a6faa1163a364e1	image/jpeg	182198	2017-11-20 18:59:13.836994	Album	39
85	2017-11-20 18:59:21.001891	2017-11-20 18:59:21.001891	6745f6af5d57f2ee14cb320ce1edf9fda05c08e2	image/jpeg	137629	2017-11-20 18:59:20.780898	Album	40
86	2017-11-20 19:01:48.530308	2017-11-20 19:01:48.530308	4206e07ec6be8cab82b5e79cd3002a7418bf9824	image/jpeg	108534	2017-11-20 19:01:48.339696	Album	41
87	2017-11-20 19:01:55.957178	2017-11-20 19:01:55.957178	a36d93908bf8471650a15d5d3ec7473c44c893c7	image/jpeg	110728	2017-11-20 19:01:55.754444	Album	42
88	2017-11-20 19:02:05.622838	2017-11-20 19:02:05.622838	e7405427a9b99100110c3fbe356d60bb82e1d440	image/jpeg	131949	2017-11-20 19:02:05.433751	Album	43
89	2017-11-20 19:02:14.448771	2017-11-20 19:02:14.448771	b6a112fab7c8ad7d82eb0c49e0409078716ba28d	image/jpeg	127715	2017-11-20 19:02:14.255904	Album	44
90	2017-11-20 19:02:20.746204	2017-11-20 19:02:20.746204	a708f7b36600a210431b3f8d79bfc9c9cd771270	image/jpeg	222011	2017-11-20 19:02:20.525475	Album	45
91	2017-11-20 19:10:06.752988	2017-11-20 19:10:06.752988	c6975ebca4de67cc7b378264a8e4321f8b7ff294	image/jpeg	98061	2017-11-20 19:10:06.559548	Album	46
92	2017-11-20 19:10:12.730074	2017-11-20 19:10:12.730074	f3d3b42903872682d5bd99dae2d677c6b194e8ef	image/jpeg	58316	2017-11-20 19:10:12.524411	Album	47
93	2017-11-20 19:16:41.65141	2017-11-20 19:16:41.65141	bb1d4f4b4de8ed8abba4d25e8fc5cae22a79ceb5	image/jpeg	129444	2017-11-20 19:16:41.431335	Album	48
94	2017-11-20 19:16:47.237184	2017-11-20 19:16:47.237184	933fba0a286498d7934c642922e05b3d8e7a118b	image/jpeg	85209	2017-11-20 19:16:47.044167	Album	49
95	2017-11-20 19:16:53.33235	2017-11-20 19:16:53.33235	f4f148cdaad3f606dc6d484e47caca469a73958f	image/jpeg	272099	2017-11-20 19:16:53.125113	Album	50
96	2017-11-20 19:16:59.293292	2017-11-20 19:16:59.293292	ffd47237d7465f3a6679051ab4abc6c734c27cdd	image/jpeg	140830	2017-11-20 19:16:59.101254	Album	51
97	2017-11-20 19:17:05.706495	2017-11-20 19:17:05.706495	dc99860a79efb6b03d22f4c52bba4e1663fa4833	image/jpeg	115943	2017-11-20 19:17:05.491399	Album	52
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('photos_id_seq', 97, true);


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
36	Strange Days - Remastered	\N	2017-11-20 18:16:54.575574	2017-11-20 18:16:54.575574	1
37	You're Lost Little Girl - Remastered	\N	2017-11-20 18:16:54.581185	2017-11-20 18:16:54.581185	1
38	Love Me Two Times - Remastered	\N	2017-11-20 18:16:54.586081	2017-11-20 18:16:54.586081	1
39	Unhappy Girl - Remastered	\N	2017-11-20 18:16:54.590819	2017-11-20 18:16:54.590819	1
40	Horse Latitudes - Remastered	\N	2017-11-20 18:16:54.595684	2017-11-20 18:16:54.595684	1
41	Moonlight Drive - Remastered	\N	2017-11-20 18:16:54.600346	2017-11-20 18:16:54.600346	1
42	People Are Strange - Remastered	\N	2017-11-20 18:16:54.604893	2017-11-20 18:16:54.604893	1
43	My Eyes Have Seen You - Remastered	\N	2017-11-20 18:16:54.609383	2017-11-20 18:16:54.609383	1
44	I Can't See Your Face In My Mind - Remastered	\N	2017-11-20 18:16:54.613934	2017-11-20 18:16:54.613934	1
45	When The Music's Over - Remastered	\N	2017-11-20 18:16:54.618479	2017-11-20 18:16:54.618479	1
46	Strange Days - Mono [Remastered]	\N	2017-11-20 18:16:54.623145	2017-11-20 18:16:54.623145	1
47	You're Lost Little Girl - Mono [Remastered]	\N	2017-11-20 18:16:54.627771	2017-11-20 18:16:54.627771	1
48	Love Me Two Times - Mono [Remastered]	\N	2017-11-20 18:16:54.632472	2017-11-20 18:16:54.632472	1
49	Unhappy Girl - Mono [Remastered]	\N	2017-11-20 18:16:54.637256	2017-11-20 18:16:54.637256	1
50	Horse Latitudes - Mono [Remastered]	\N	2017-11-20 18:16:54.642105	2017-11-20 18:16:54.642105	1
51	Moonlight Drive - Mono [Remastered]	\N	2017-11-20 18:16:54.646705	2017-11-20 18:16:54.646705	1
52	People Are Strange - Mono [Remastered]	\N	2017-11-20 18:16:54.651568	2017-11-20 18:16:54.651568	1
53	My Eyes Have Seen You - Mono [Remastered]	\N	2017-11-20 18:16:54.656268	2017-11-20 18:16:54.656268	1
54	I Can't See Your Face In My Mind - Mono [Remastered]	\N	2017-11-20 18:16:54.660902	2017-11-20 18:16:54.660902	1
55	When The Music's Over - Mono [Remastered]	\N	2017-11-20 18:16:54.66455	2017-11-20 18:16:54.66455	1
56	No More Walks In The Wood	\N	2017-11-20 18:17:10.196304	2017-11-20 18:17:10.196304	1
57	How Long	\N	2017-11-20 18:17:10.199979	2017-11-20 18:17:10.199979	1
58	Busy Being Fabulous	\N	2017-11-20 18:17:10.204276	2017-11-20 18:17:10.204276	1
59	What Do I Do With My Heart	\N	2017-11-20 18:17:10.210552	2017-11-20 18:17:10.210552	1
60	Guilty Of The Crime	\N	2017-11-20 18:17:10.216673	2017-11-20 18:17:10.216673	1
61	I Don't Want To Hear Any More	\N	2017-11-20 18:17:10.222497	2017-11-20 18:17:10.222497	1
62	Waiting In The Weeds	\N	2017-11-20 18:17:10.227804	2017-11-20 18:17:10.227804	1
63	No More Cloudy Days	\N	2017-11-20 18:17:10.232082	2017-11-20 18:17:10.232082	1
64	Fast Company	\N	2017-11-20 18:17:10.236399	2017-11-20 18:17:10.236399	1
65	Do Something	\N	2017-11-20 18:17:10.240592	2017-11-20 18:17:10.240592	1
66	You Are Not Alone	\N	2017-11-20 18:17:10.244906	2017-11-20 18:17:10.244906	1
67	Long Road Out Of Eden	\N	2017-11-20 18:17:10.249153	2017-11-20 18:17:10.249153	1
68	I Dreamed There Was No War	\N	2017-11-20 18:17:10.253409	2017-11-20 18:17:10.253409	1
69	Somebody	\N	2017-11-20 18:17:10.257603	2017-11-20 18:17:10.257603	1
70	Frail Grasp On The Big Picture	\N	2017-11-20 18:17:10.261935	2017-11-20 18:17:10.261935	1
71	Last Good Time In Town	\N	2017-11-20 18:17:10.266229	2017-11-20 18:17:10.266229	1
72	I Love To Watch A Woman Dance	\N	2017-11-20 18:17:10.270827	2017-11-20 18:17:10.270827	1
73	Business As Usual	\N	2017-11-20 18:17:10.275166	2017-11-20 18:17:10.275166	1
74	Center Of The Universe	\N	2017-11-20 18:17:10.279483	2017-11-20 18:17:10.279483	1
75	It's Your World Now	\N	2017-11-20 18:17:10.28379	2017-11-20 18:17:10.28379	1
76	Hole In The World - Bonus Track	\N	2017-11-20 18:17:10.287869	2017-11-20 18:17:10.287869	1
77	Whiskey Rock-A-Roller (feat. Randy Houser) - Live	\N	2017-11-20 18:17:26.151371	2017-11-20 18:17:26.151371	1
78	You Got That Right (feat. Jimmy Hall & Robert Randolph) - Live	\N	2017-11-20 18:17:26.154858	2017-11-20 18:17:26.154858	1
79	Saturday Night Special (feat. Aaron Lewis) - Live	\N	2017-11-20 18:17:26.158628	2017-11-20 18:17:26.158628	1
80	Workin' For MCA (feat. Blackberry Smoke) - Live	\N	2017-11-20 18:17:26.161953	2017-11-20 18:17:26.161953	1
81	Don't Ask Me No Questions (feat. O.A.R.) - Live	\N	2017-11-20 18:17:26.164943	2017-11-20 18:17:26.164943	1
82	Gimme Back My Bullets (feat. Cheap Trick) - Live	\N	2017-11-20 18:17:26.168049	2017-11-20 18:17:26.168049	1
83	The Ballad of Curtis Loew (feat. moe. & John Hiatt) - Live	\N	2017-11-20 18:17:26.171219	2017-11-20 18:17:26.171219	1
84	Simple Man (feat. Gov't Mule) - Live	\N	2017-11-20 18:17:26.174469	2017-11-20 18:17:26.174469	1
85	That Smell (feat. Warren Haynes) - Live	\N	2017-11-20 18:17:26.17773	2017-11-20 18:17:26.17773	1
86	Four Walls Of Raiford (feat. Jamey Johnson) - Live	\N	2017-11-20 18:17:26.181452	2017-11-20 18:17:26.181452	1
87	I Know A Little (feat. Jason Isbell) - Live	\N	2017-11-20 18:17:26.184889	2017-11-20 18:17:26.184889	1
88	Call Me The Breeze (feat. Peter Frampton) - Live	\N	2017-11-20 18:17:26.188257	2017-11-20 18:17:26.188257	1
89	What's Your Name (feat. Trace Adkins) - Live	\N	2017-11-20 18:17:26.191733	2017-11-20 18:17:26.191733	1
90	Down South Jukin' (feat. Charlie Daniels & Donnie Van Zant) - Live	\N	2017-11-20 18:17:26.195852	2017-11-20 18:17:26.195852	1
91	Gimme Three Steps (feat. Alabama) - Live	\N	2017-11-20 18:17:26.200124	2017-11-20 18:17:26.200124	1
92	Tuesday's Gone (feat. Gregg Allman) - Live	\N	2017-11-20 18:17:26.204998	2017-11-20 18:17:26.204998	1
93	Travelin' Man - Live	\N	2017-11-20 18:17:26.209387	2017-11-20 18:17:26.209387	1
94	Free Bird - Live	\N	2017-11-20 18:17:26.214577	2017-11-20 18:17:26.214577	1
95	Sweet Home Alabama - Live	\N	2017-11-20 18:17:26.220303	2017-11-20 18:17:26.220303	1
96	Dukes Intro - Live In Manchester	\N	2017-11-20 18:17:49.942838	2017-11-20 18:17:49.942838	1
97	Turn It On Again - Live In Amsterdam	\N	2017-11-20 18:17:49.947119	2017-11-20 18:17:49.947119	1
98	No Son Of Mine - Live In Amsterdam	\N	2017-11-20 18:17:49.950024	2017-11-20 18:17:49.950024	1
99	Land Of Confusion - Live In Helsinki	\N	2017-11-20 18:17:49.952748	2017-11-20 18:17:49.952748	1
100	In The Cage - Includes excerpts from Cinema Show and Dukes Travels Live In Manchester	\N	2017-11-20 18:17:49.955611	2017-11-20 18:17:49.955611	1
101	Afterglow - Live In Manchester	\N	2017-11-20 18:17:49.958432	2017-11-20 18:17:49.958432	1
102	Hold On My Heart - Live In Hannover	\N	2017-11-20 18:17:49.961301	2017-11-20 18:17:49.961301	1
103	Home By The Sea - Live In Dusseldorf & Rome	\N	2017-11-20 18:17:49.963881	2017-11-20 18:17:49.963881	1
104	Follow You Follow Me - Live In Paris	\N	2017-11-20 18:17:49.966799	2017-11-20 18:17:49.966799	1
105	Firth Of Fifth - Excerpt Live In Manchester	\N	2017-11-20 18:17:49.969385	2017-11-20 18:17:49.969385	1
106	I Know What I Like (In Your Wardrobe) - Live In Manchester	\N	2017-11-20 18:17:49.973005	2017-11-20 18:17:49.973005	1
107	Mama - Live In Frankfurt	\N	2017-11-20 18:17:49.976779	2017-11-20 18:17:49.976779	1
108	Ripples - Live In Prague	\N	2017-11-20 18:17:49.980373	2017-11-20 18:17:49.980373	1
109	Throwing It All Away - Live In Paris	\N	2017-11-20 18:17:49.984136	2017-11-20 18:17:49.984136	1
110	Domino - Live In Rome	\N	2017-11-20 18:17:49.987959	2017-11-20 18:17:49.987959	1
111	Conversations With 2 Stools - Live In Munich	\N	2017-11-20 18:17:49.992104	2017-11-20 18:17:49.992104	1
112	Los Endos - Live At Twickenham	\N	2017-11-20 18:17:49.996004	2017-11-20 18:17:49.996004	1
113	Tonight, Tonight, Tonight - Excerpt Live In Rome	\N	2017-11-20 18:17:50.000524	2017-11-20 18:17:50.000524	1
114	Invisible Touch - Live In Rome	\N	2017-11-20 18:17:50.004368	2017-11-20 18:17:50.004368	1
115	I Can't Dance - Live In Munich	\N	2017-11-20 18:17:50.008395	2017-11-20 18:17:50.008395	1
116	Carpet Crawlers - Live In Manchester	\N	2017-11-20 18:17:50.013256	2017-11-20 18:17:50.013256	1
117	The Miracle (Of Joey Ramone)	\N	2017-11-20 18:18:07.566573	2017-11-20 18:18:07.566573	1
118	Every Breaking Wave	\N	2017-11-20 18:18:07.569595	2017-11-20 18:18:07.569595	1
119	California (There Is No End To Love)	\N	2017-11-20 18:18:07.572014	2017-11-20 18:18:07.572014	1
120	Song For Someone	\N	2017-11-20 18:18:07.57446	2017-11-20 18:18:07.57446	1
121	Iris (Hold Me Close)	\N	2017-11-20 18:18:07.57739	2017-11-20 18:18:07.57739	1
122	Volcano	\N	2017-11-20 18:18:07.581086	2017-11-20 18:18:07.581086	1
123	Raised By Wolves	\N	2017-11-20 18:18:07.584794	2017-11-20 18:18:07.584794	1
124	Cedarwood Road	\N	2017-11-20 18:18:07.588242	2017-11-20 18:18:07.588242	1
125	Sleep Like A Baby Tonight	\N	2017-11-20 18:18:07.591469	2017-11-20 18:18:07.591469	1
126	This Is Where You Can Reach Me Now	\N	2017-11-20 18:18:07.59394	2017-11-20 18:18:07.59394	1
127	The Troubles	\N	2017-11-20 18:18:07.596425	2017-11-20 18:18:07.596425	1
128	Hardwired	\N	2017-11-20 18:22:51.074649	2017-11-20 18:22:51.074649	8
129	Atlas, Rise!	\N	2017-11-20 18:22:51.079112	2017-11-20 18:22:51.079112	8
130	Now That We’re Dead	\N	2017-11-20 18:22:51.082826	2017-11-20 18:22:51.082826	8
131	Moth Into Flame	\N	2017-11-20 18:22:51.086741	2017-11-20 18:22:51.086741	8
132	Dream No More	\N	2017-11-20 18:22:51.090955	2017-11-20 18:22:51.090955	8
133	Halo On Fire	\N	2017-11-20 18:22:51.095421	2017-11-20 18:22:51.095421	8
134	Confusion	\N	2017-11-20 18:22:51.100121	2017-11-20 18:22:51.100121	8
135	ManUNkind	\N	2017-11-20 18:22:51.104513	2017-11-20 18:22:51.104513	8
136	Here Comes Revenge	\N	2017-11-20 18:22:51.108904	2017-11-20 18:22:51.108904	8
137	Am I Savage?	\N	2017-11-20 18:22:51.113283	2017-11-20 18:22:51.113283	8
138	Murder One	\N	2017-11-20 18:22:51.1177	2017-11-20 18:22:51.1177	8
139	Spit Out The Bone	\N	2017-11-20 18:22:51.122104	2017-11-20 18:22:51.122104	8
140	If Eternity Should Fail - Live at Qudos Bank Arena, Sydney, Australia - Friday 6th May 2016	\N	2017-11-20 18:23:07.072418	2017-11-20 18:23:07.072418	8
141	Speed of Light - Live at Grand Arena, GrandWest, Cape Town, South Africa - Wednesday 18th May 2016	\N	2017-11-20 18:23:07.075414	2017-11-20 18:23:07.075414	8
142	Wrathchild - Live at 3 Arena, Dublin, Ireland - Saturday 6th May 2017	\N	2017-11-20 18:23:07.077998	2017-11-20 18:23:07.077998	8
143	Children of the Damned - Live at Bell Center, Montreal, Canada - Friday 1st April 2016	\N	2017-11-20 18:23:07.080622	2017-11-20 18:23:07.080622	8
144	Death or Glory - Live at Wroclaw Stadium, Wroclaw, Poland - Sunday 3rd July 2016	\N	2017-11-20 18:23:07.083275	2017-11-20 18:23:07.083275	8
145	The Red and the Black - Live at Ryogoku Kokugikan, Tokyo, Japan - Thursday 21st April 2016	\N	2017-11-20 18:23:07.087256	2017-11-20 18:23:07.087256	8
146	The Trooper - Live at Estadio Jorge Magico Gonzalez, San Salvador, El Salvador - Sunday 6th March 2016	\N	2017-11-20 18:23:07.091733	2017-11-20 18:23:07.091733	8
147	Powerslave - Live at Plaza Dell'Unita D'Italia, Trieste, Italy - Tuesday 26th July 2016	\N	2017-11-20 18:23:07.096194	2017-11-20 18:23:07.096194	8
148	The Great Unknown - Live at MRA Arena, Newcastle, England - Sunday 14th May 2017	\N	2017-11-20 18:23:07.100771	2017-11-20 18:23:07.100771	8
149	The Book of Souls - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-20 18:23:07.105386	2017-11-20 18:23:07.105386	8
150	Fear of the Dark - Live at Arena Castelao, Fortaleza, Brazil - Thursday 24th March 2016	\N	2017-11-20 18:23:07.109933	2017-11-20 18:23:07.109933	8
151	Iron Maiden - Live at Estadio Velez Sarsfield, Buenos Aires, Argentina - Tuesday 15th March 2016	\N	2017-11-20 18:23:07.114316	2017-11-20 18:23:07.114316	8
152	The Number of the Beast - Live at Open Air Festival, Wacken, Germany - Thursday 4th August 2016	\N	2017-11-20 18:23:07.118036	2017-11-20 18:23:07.118036	8
153	Blood Brothers - Live at Download Festival, Donington, England - Sunday 12th June 2016	\N	2017-11-20 18:23:07.122882	2017-11-20 18:23:07.122882	8
154	Wasted Years - Live at HSBC Arena, Rio De Janeiro, Brazil - Thursday 17th March 2016	\N	2017-11-20 18:23:07.127192	2017-11-20 18:23:07.127192	8
155	Black Sabbath - Live	\N	2017-11-20 18:23:25.094253	2017-11-20 18:23:25.094253	8
156	Fairies Wear Boots - Live	\N	2017-11-20 18:23:25.097887	2017-11-20 18:23:25.097887	8
157	Under The Sun / Every Day Comes And Goes - Live	\N	2017-11-20 18:23:25.101281	2017-11-20 18:23:25.101281	8
158	After Forever - Live	\N	2017-11-20 18:23:25.104552	2017-11-20 18:23:25.104552	8
159	Into The Void - Live	\N	2017-11-20 18:23:25.107519	2017-11-20 18:23:25.107519	8
160	Snowblind - Live	\N	2017-11-20 18:23:25.111233	2017-11-20 18:23:25.111233	8
161	Band Introductions - Live	\N	2017-11-20 18:23:25.114383	2017-11-20 18:23:25.114383	8
162	War Pigs - Live	\N	2017-11-20 18:23:25.117491	2017-11-20 18:23:25.117491	8
163	Behind The Wall Of Sleep - Live	\N	2017-11-20 18:23:25.120711	2017-11-20 18:23:25.120711	8
164	Bassically / N.I.B. - Live	\N	2017-11-20 18:23:25.123465	2017-11-20 18:23:25.123465	8
165	Hand Of Doom - Live	\N	2017-11-20 18:23:25.126072	2017-11-20 18:23:25.126072	8
166	Supernaut / Sabbath Bloody Sabbath / Megalomania - Live	\N	2017-11-20 18:23:25.128981	2017-11-20 18:23:25.128981	8
167	Rat Salad / Drum Solo - Live	\N	2017-11-20 18:23:25.132605	2017-11-20 18:23:25.132605	8
168	Iron Man - Live	\N	2017-11-20 18:23:25.136185	2017-11-20 18:23:25.136185	8
169	Dirty Women - Live	\N	2017-11-20 18:23:25.139787	2017-11-20 18:23:25.139787	8
170	Children Of The Grave - Live	\N	2017-11-20 18:23:25.142922	2017-11-20 18:23:25.142922	8
171	Paranoid - Live	\N	2017-11-20 18:23:25.145487	2017-11-20 18:23:25.145487	8
172	The Threat Is Real	\N	2017-11-20 18:23:39.957889	2017-11-20 18:23:39.957889	8
173	Dystopia	\N	2017-11-20 18:23:39.960584	2017-11-20 18:23:39.960584	8
174	Fatal Illusion	\N	2017-11-20 18:23:39.963159	2017-11-20 18:23:39.963159	8
175	Death From Within	\N	2017-11-20 18:23:39.966293	2017-11-20 18:23:39.966293	8
176	Bullet To The Brain	\N	2017-11-20 18:23:39.969406	2017-11-20 18:23:39.969406	8
177	Post American World	\N	2017-11-20 18:23:39.972155	2017-11-20 18:23:39.972155	8
178	Poisonous Shadows	\N	2017-11-20 18:23:39.974794	2017-11-20 18:23:39.974794	8
179	Look Who's Talking	\N	2017-11-20 18:23:39.977503	2017-11-20 18:23:39.977503	8
180	Conquer Or Die	\N	2017-11-20 18:23:39.980117	2017-11-20 18:23:39.980117	8
181	Lying In State	\N	2017-11-20 18:23:39.983089	2017-11-20 18:23:39.983089	8
182	The Emperor	\N	2017-11-20 18:23:39.986491	2017-11-20 18:23:39.986491	8
183	Last Dying Wish	\N	2017-11-20 18:23:39.989446	2017-11-20 18:23:39.989446	8
184	Foreign Policy	\N	2017-11-20 18:23:39.992175	2017-11-20 18:23:39.992175	8
185	Me Hate You	\N	2017-11-20 18:23:39.994875	2017-11-20 18:23:39.994875	8
186	The Threat Is Real - Live Detroit, MI	\N	2017-11-20 18:23:39.99779	2017-11-20 18:23:39.99779	8
187	Poisonous Shadows - Live Detroit, MI	\N	2017-11-20 18:23:40.000503	2017-11-20 18:23:40.000503	8
188	Dystopia - Live Detroit, MI	\N	2017-11-20 18:23:40.004756	2017-11-20 18:23:40.004756	8
189	Turbo Lover - Remastered	\N	2017-11-20 18:23:54.800581	2017-11-20 18:23:54.800581	8
190	Locked In - Remastered	\N	2017-11-20 18:23:54.805648	2017-11-20 18:23:54.805648	8
191	Private Property - Remastered	\N	2017-11-20 18:23:54.809518	2017-11-20 18:23:54.809518	8
192	Parental Guidance - Remastered	\N	2017-11-20 18:23:54.813607	2017-11-20 18:23:54.813607	8
193	Rock You All Around the World - Remastered	\N	2017-11-20 18:23:54.817773	2017-11-20 18:23:54.817773	8
194	Out in the Cold - Remastered	\N	2017-11-20 18:23:54.821989	2017-11-20 18:23:54.821989	8
195	Wild Nights, Hot & Crazy Days - Remastered	\N	2017-11-20 18:23:54.826236	2017-11-20 18:23:54.826236	8
196	Hot for Love - Remastered	\N	2017-11-20 18:23:54.831338	2017-11-20 18:23:54.831338	8
197	Reckless - Remastered	\N	2017-11-20 18:23:54.83585	2017-11-20 18:23:54.83585	8
198	Out in the Cold - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.840257	2017-11-20 18:23:54.840257	8
199	Locked In - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.844448	2017-11-20 18:23:54.844448	8
200	Heading Out to the Highway - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.848501	2017-11-20 18:23:54.848501	8
201	Metal Gods - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.852626	2017-11-20 18:23:54.852626	8
202	Breaking the Law - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.856621	2017-11-20 18:23:54.856621	8
203	Love Bites - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.860536	2017-11-20 18:23:54.860536	8
204	Some Heads Are Gonna Roll - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.864388	2017-11-20 18:23:54.864388	8
205	The Sentinel - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.868261	2017-11-20 18:23:54.868261	8
206	Private Property - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.872135	2017-11-20 18:23:54.872135	8
207	Desert Plains - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.876506	2017-11-20 18:23:54.876506	8
208	Rock You All Around the World - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.880818	2017-11-20 18:23:54.880818	8
209	The Hellion - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.884826	2017-11-20 18:23:54.884826	8
210	Electric Eye - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.888742	2017-11-20 18:23:54.888742	8
211	Turbo Lover - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.893124	2017-11-20 18:23:54.893124	8
212	Freewheel Burning - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.896294	2017-11-20 18:23:54.896294	8
213	Victim of Changes - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.899533	2017-11-20 18:23:54.899533	8
214	The Green Manalishi (With The Two Pronged Crown) - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.902822	2017-11-20 18:23:54.902822	8
215	Living After Midnight - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.905777	2017-11-20 18:23:54.905777	8
216	You've Got Another Thing Coming - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.908715	2017-11-20 18:23:54.908715	8
217	Hell Bent for Leather - Recorded at Kemper Arena in Kansas City	\N	2017-11-20 18:23:54.91165	2017-11-20 18:23:54.91165	8
218	Somewhere Now	\N	2017-11-20 18:39:05.702138	2017-11-20 18:39:05.702138	22
219	Bang Bang	\N	2017-11-20 18:39:05.708817	2017-11-20 18:39:05.708817	22
220	Revolution Radio	\N	2017-11-20 18:39:05.71372	2017-11-20 18:39:05.71372	22
221	Say Goodbye	\N	2017-11-20 18:39:05.717913	2017-11-20 18:39:05.717913	22
222	Outlaws	\N	2017-11-20 18:39:05.722123	2017-11-20 18:39:05.722123	22
223	Bouncing Off the Wall	\N	2017-11-20 18:39:05.72539	2017-11-20 18:39:05.72539	22
224	Still Breathing	\N	2017-11-20 18:39:05.729045	2017-11-20 18:39:05.729045	22
225	Youngblood	\N	2017-11-20 18:39:05.732355	2017-11-20 18:39:05.732355	22
226	Too Dumb to Die	\N	2017-11-20 18:39:05.73566	2017-11-20 18:39:05.73566	22
227	Troubled Times	\N	2017-11-20 18:39:05.739082	2017-11-20 18:39:05.739082	22
228	Forever Now	\N	2017-11-20 18:39:05.741937	2017-11-20 18:39:05.741937	22
229	Ordinary World	\N	2017-11-20 18:39:05.744743	2017-11-20 18:39:05.744743	22
230	I Don't Want To Grow Up	\N	2017-11-20 18:39:27.053241	2017-11-20 18:39:27.053241	22
231	Makin Monsters For My Friends	\N	2017-11-20 18:39:27.055912	2017-11-20 18:39:27.055912	22
232	It's Not For Me To Know	\N	2017-11-20 18:39:27.058337	2017-11-20 18:39:27.058337	22
233	The Crusher	\N	2017-11-20 18:39:27.060637	2017-11-20 18:39:27.060637	22
234	Life's A Gas	\N	2017-11-20 18:39:27.062844	2017-11-20 18:39:27.062844	22
235	Take The Pain Away	\N	2017-11-20 18:39:27.065801	2017-11-20 18:39:27.065801	22
236	I Love You	\N	2017-11-20 18:39:27.068774	2017-11-20 18:39:27.068774	22
237	Cretin Family	\N	2017-11-20 18:39:27.071562	2017-11-20 18:39:27.071562	22
238	Have A Nice Day	\N	2017-11-20 18:39:27.074965	2017-11-20 18:39:27.074965	22
239	Scattergun	\N	2017-11-20 18:39:27.078294	2017-11-20 18:39:27.078294	22
240	Got A Lot To Say	\N	2017-11-20 18:39:27.081287	2017-11-20 18:39:27.081287	22
241	She Talks To Rainbows	\N	2017-11-20 18:39:27.084041	2017-11-20 18:39:27.084041	22
242	Born To Die In Berlin	\N	2017-11-20 18:39:27.086965	2017-11-20 18:39:27.086965	22
243	I Believe In Miracles	\N	2017-11-20 18:39:27.089972	2017-11-20 18:39:27.089972	22
244	Zero Zero UFO	\N	2017-11-20 18:39:27.093009	2017-11-20 18:39:27.093009	22
245	Don't Bust My Chops	\N	2017-11-20 18:39:27.096029	2017-11-20 18:39:27.096029	22
246	Punishment Fits The Crime	\N	2017-11-20 18:39:27.09944	2017-11-20 18:39:27.09944	22
247	All Screwed Up	\N	2017-11-20 18:39:27.102934	2017-11-20 18:39:27.102934	22
248	Palisades Park	\N	2017-11-20 18:39:27.106377	2017-11-20 18:39:27.106377	22
249	Pet Semetary	\N	2017-11-20 18:39:27.109488	2017-11-20 18:39:27.109488	22
250	Learn To Listen	\N	2017-11-20 18:39:27.112232	2017-11-20 18:39:27.112232	22
251	Can't Get You Outta My Mind	\N	2017-11-20 18:39:27.115269	2017-11-20 18:39:27.115269	22
252	Ignorance Is Bliss	\N	2017-11-20 18:39:27.118026	2017-11-20 18:39:27.118026	22
253	Come Back Baby	\N	2017-11-20 18:39:27.12154	2017-11-20 18:39:27.12154	22
254	Merry Christmas (I Don't Want To Fight Tonight)	\N	2017-11-20 18:39:27.124939	2017-11-20 18:39:27.124939	22
255	California Über Alles	\N	2017-11-20 18:39:42.635724	2017-11-20 18:39:42.635724	22
256	Police Truck	\N	2017-11-20 18:39:42.639353	2017-11-20 18:39:42.639353	22
257	Kill The Poor	\N	2017-11-20 18:39:42.642154	2017-11-20 18:39:42.642154	22
258	Holiday In Cambodia	\N	2017-11-20 18:39:42.645041	2017-11-20 18:39:42.645041	22
259	Nazi Punks Fuck Off	\N	2017-11-20 18:39:42.647939	2017-11-20 18:39:42.647939	22
260	Too Drunk To Fuck	\N	2017-11-20 18:39:42.650517	2017-11-20 18:39:42.650517	22
261	Viva Las Vegas	\N	2017-11-20 18:39:42.654009	2017-11-20 18:39:42.654009	22
262	Moon Over Marin	\N	2017-11-20 18:39:42.658671	2017-11-20 18:39:42.658671	22
263	Halloween	\N	2017-11-20 18:39:42.663345	2017-11-20 18:39:42.663345	22
264	MTV Get Off The Air	\N	2017-11-20 18:39:42.665873	2017-11-20 18:39:42.665873	22
265	Soup Is Good Food (Live)	\N	2017-11-20 18:39:42.668665	2017-11-20 18:39:42.668665	22
266	Jock-O-Rama (Live)	\N	2017-11-20 18:39:42.671432	2017-11-20 18:39:42.671432	22
267	Kosmo Vinyl Introduction - Live at Shea Stadium	\N	2017-11-20 18:40:02.015755	2017-11-20 18:40:02.015755	22
268	London Calling - Live at Shea Stadium	\N	2017-11-20 18:40:02.019401	2017-11-20 18:40:02.019401	22
269	Police on my Back - Live at Shea Stadium	\N	2017-11-20 18:40:02.02225	2017-11-20 18:40:02.02225	22
270	The Guns of Brixton - Live at Shea Stadium	\N	2017-11-20 18:40:02.025182	2017-11-20 18:40:02.025182	22
271	Tommy Gun - Live at Shea Stadium	\N	2017-11-20 18:40:02.028681	2017-11-20 18:40:02.028681	22
272	The Magnificent Seven - Live at Shea Stadium	\N	2017-11-20 18:40:02.032039	2017-11-20 18:40:02.032039	22
273	Armagideon Time - Live at Shea Stadium	\N	2017-11-20 18:40:02.035544	2017-11-20 18:40:02.035544	22
274	Magnificent Seven (Return) - Live at Shea Stadium	\N	2017-11-20 18:40:02.039452	2017-11-20 18:40:02.039452	22
275	Rock the Casbah - Live at Shea Stadium	\N	2017-11-20 18:40:02.043275	2017-11-20 18:40:02.043275	22
276	Train in Vain - Live at Shea Stadium	\N	2017-11-20 18:40:02.046787	2017-11-20 18:40:02.046787	22
277	Career Opportunities - Live at Shea Stadium	\N	2017-11-20 18:40:02.050611	2017-11-20 18:40:02.050611	22
278	Spanish Bombs - Live at Shea Stadium	\N	2017-11-20 18:40:02.054462	2017-11-20 18:40:02.054462	22
279	Clampdown - Live at Shea Stadium	\N	2017-11-20 18:40:02.058405	2017-11-20 18:40:02.058405	22
280	English Civil War - Live at Shea Stadium	\N	2017-11-20 18:40:02.062765	2017-11-20 18:40:02.062765	22
281	Should I Stay or Should I Go - Live at Shea Stadium	\N	2017-11-20 18:40:02.067147	2017-11-20 18:40:02.067147	22
282	I Fought the Law - Live at Shea Stadium	\N	2017-11-20 18:40:02.071867	2017-11-20 18:40:02.071867	22
283	The Devil's Rain	\N	2017-11-20 18:40:19.048038	2017-11-20 18:40:19.048038	22
284	Vivid Red	\N	2017-11-20 18:40:19.052105	2017-11-20 18:40:19.052105	22
285	Land of the Dead	\N	2017-11-20 18:40:19.056184	2017-11-20 18:40:19.056184	22
286	Curse of the Mummy's Hand	\N	2017-11-20 18:40:19.059965	2017-11-20 18:40:19.059965	22
287	Cold Day In Hell	\N	2017-11-20 18:40:19.063815	2017-11-20 18:40:19.063815	22
288	Dark Shadows	\N	2017-11-20 18:40:19.067838	2017-11-20 18:40:19.067838	22
289	Death Ray	\N	2017-11-20 18:40:19.072233	2017-11-20 18:40:19.072233	22
290	Shining	\N	2017-11-20 18:40:19.076967	2017-11-20 18:40:19.076967	22
291	American Psycho	\N	2017-11-20 18:40:19.08023	2017-11-20 18:40:19.08023	22
292	Dig Up Her Bones	\N	2017-11-20 18:40:19.083377	2017-11-20 18:40:19.083377	22
293	Scream!	\N	2017-11-20 18:40:19.08617	2017-11-20 18:40:19.08617	22
294	Helena	\N	2017-11-20 18:40:19.088703	2017-11-20 18:40:19.088703	22
295	Science Fiction/Double Feature	\N	2017-11-20 18:40:19.09153	2017-11-20 18:40:19.09153	22
296	Saturday Night	\N	2017-11-20 18:40:19.094369	2017-11-20 18:40:19.094369	22
297	Wu-Tang The Saga Continues Intro (feat. RZA)	\N	2017-11-20 18:44:03.16451	2017-11-20 18:44:03.16451	2
298	Lesson Learn'd (feat. Inspectah Deck and Redman)	\N	2017-11-20 18:44:03.167555	2017-11-20 18:44:03.167555	2
299	Fast and Furious (feat. Hue Hef and Raekwon)	\N	2017-11-20 18:44:03.170159	2017-11-20 18:44:03.170159	2
300	Famous Fighters (Skit)	\N	2017-11-20 18:44:03.172954	2017-11-20 18:44:03.172954	2
301	If Time Is Money (Fly Navigation) [feat. Method Man]	\N	2017-11-20 18:44:03.175818	2017-11-20 18:44:03.175818	2
302	Frozen (feat. Method Man, Killa Priest and Chris Rivers)	\N	2017-11-20 18:44:03.178646	2017-11-20 18:44:03.178646	2
303	Berto and the Fiend (Skit) [feat. Ghostface Killa]	\N	2017-11-20 18:44:03.181999	2017-11-20 18:44:03.181999	2
304	Pearl Harbor (feat. Ghostface Killah, Method Man, RZA and Sean Price)	\N	2017-11-20 18:44:03.184638	2017-11-20 18:44:03.184638	2
305	People Say (feat. Redman)	\N	2017-11-20 18:44:03.187255	2017-11-20 18:44:03.187255	2
306	Family (Skit)	\N	2017-11-20 18:44:03.190457	2017-11-20 18:44:03.190457	2
307	Why Why Why (feat. RZA and Swnkah)	\N	2017-11-20 18:44:03.1933	2017-11-20 18:44:03.1933	2
308	G'd up (feat. Method Man, R-Mean and Mzee Jones)	\N	2017-11-20 18:44:03.19609	2017-11-20 18:44:03.19609	2
309	If What You Say Is True (feat. Streetlife)	\N	2017-11-20 18:44:03.198754	2017-11-20 18:44:03.198754	2
310	Saga (Skit) [feat. RZA	\N	2017-11-20 18:44:03.201638	2017-11-20 18:44:03.201638	2
311	Hood Go Bang! (feat. Redman and Method Man)	\N	2017-11-20 18:44:03.204205	2017-11-20 18:44:03.204205	2
312	My Only One (feat. Ghostface Killah, RZA, Cappadonna, and Steven Latorre)	\N	2017-11-20 18:44:03.207248	2017-11-20 18:44:03.207248	2
313	Message	\N	2017-11-20 18:44:03.210452	2017-11-20 18:44:03.210452	2
314	The Saga Continues Outro (feat. RZA)	\N	2017-11-20 18:44:03.213673	2017-11-20 18:44:03.213673	2
315	Prelude	\N	2017-11-20 18:44:23.562971	2017-11-20 18:44:23.562971	2
316	Real Niggaz Don't Die	\N	2017-11-20 18:44:23.566066	2017-11-20 18:44:23.566066	2
317	Niggaz 4 Life	\N	2017-11-20 18:44:23.568778	2017-11-20 18:44:23.568778	2
318	Protest - Interlude	\N	2017-11-20 18:44:23.571419	2017-11-20 18:44:23.571419	2
319	Appetite For Destruction	\N	2017-11-20 18:44:23.574362	2017-11-20 18:44:23.574362	2
320	Don't Drink That Wine - Interlude	\N	2017-11-20 18:44:23.57719	2017-11-20 18:44:23.57719	2
321	Alwayz Into Somethin'	\N	2017-11-20 18:44:23.580287	2017-11-20 18:44:23.580287	2
322	Message To B.A. - Interlude	\N	2017-11-20 18:44:23.585956	2017-11-20 18:44:23.585956	2
323	Real Niggaz	\N	2017-11-20 18:44:23.588892	2017-11-20 18:44:23.588892	2
324	To Kill A Hooker - Interlude	\N	2017-11-20 18:44:23.591566	2017-11-20 18:44:23.591566	2
325	One Less Bitch	\N	2017-11-20 18:44:23.594479	2017-11-20 18:44:23.594479	2
326	Findum, Fuckum And Flee	\N	2017-11-20 18:44:23.597314	2017-11-20 18:44:23.597314	2
327	Automobile	\N	2017-11-20 18:44:23.599903	2017-11-20 18:44:23.599903	2
328	She Swallowed It	\N	2017-11-20 18:44:23.602485	2017-11-20 18:44:23.602485	2
329	I'd Rather Fuck You	\N	2017-11-20 18:44:23.605071	2017-11-20 18:44:23.605071	2
330	Approach To Danger	\N	2017-11-20 18:44:23.607733	2017-11-20 18:44:23.607733	2
331	1-900-2-COMPTON - Interlude	\N	2017-11-20 18:44:23.610333	2017-11-20 18:44:23.610333	2
332	The Dayz Of Wayback	\N	2017-11-20 18:44:23.612977	2017-11-20 18:44:23.612977	2
333	Intro	\N	2017-11-20 18:44:44.811457	2017-11-20 18:44:44.811457	2
334	It's Like That	\N	2017-11-20 18:44:44.814693	2017-11-20 18:44:44.814693	2
335	It's Tricky	\N	2017-11-20 18:44:44.817504	2017-11-20 18:44:44.817504	2
336	Medley - Rock Box / Sucker MC's / Freestyle / Here We Go / Beats To The Rhyme	\N	2017-11-20 18:44:44.820708	2017-11-20 18:44:44.820708	2
337	King Of Rock	\N	2017-11-20 18:44:44.824208	2017-11-20 18:44:44.824208	2
338	Interlude	\N	2017-11-20 18:44:44.827121	2017-11-20 18:44:44.827121	2
339	Mary Mary	\N	2017-11-20 18:44:44.831337	2017-11-20 18:44:44.831337	2
340	Walk This Way	\N	2017-11-20 18:44:44.834393	2017-11-20 18:44:44.834393	2
341	School Of Old	\N	2017-11-20 18:44:44.837383	2017-11-20 18:44:44.837383	2
342	It's Over	\N	2017-11-20 18:44:44.84063	2017-11-20 18:44:44.84063	2
343	Run's Freestyle	\N	2017-11-20 18:44:44.84331	2017-11-20 18:44:44.84331	2
344	Peter Piper	\N	2017-11-20 18:44:44.846063	2017-11-20 18:44:44.846063	2
345	Down With The King	\N	2017-11-20 18:44:44.849317	2017-11-20 18:44:44.849317	2
346	The Space Program	\N	2017-11-20 18:45:02.488468	2017-11-20 18:45:02.488468	2
347	We The People....	\N	2017-11-20 18:45:02.490972	2017-11-20 18:45:02.490972	2
348	Whateva Will Be	\N	2017-11-20 18:45:02.493545	2017-11-20 18:45:02.493545	2
349	Solid Wall of Sound	\N	2017-11-20 18:45:02.495868	2017-11-20 18:45:02.495868	2
350	Dis Generation	\N	2017-11-20 18:45:02.49857	2017-11-20 18:45:02.49857	2
351	Kids...	\N	2017-11-20 18:45:02.501537	2017-11-20 18:45:02.501537	2
352	Melatonin	\N	2017-11-20 18:45:02.505605	2017-11-20 18:45:02.505605	2
353	Enough!!	\N	2017-11-20 18:45:02.509681	2017-11-20 18:45:02.509681	2
354	Mobius	\N	2017-11-20 18:45:02.513655	2017-11-20 18:45:02.513655	2
355	Black Spasmodic	\N	2017-11-20 18:45:02.517621	2017-11-20 18:45:02.517621	2
356	The Killing Season	\N	2017-11-20 18:45:02.521596	2017-11-20 18:45:02.521596	2
357	Lost Somebody	\N	2017-11-20 18:45:02.525621	2017-11-20 18:45:02.525621	2
358	Movin Backwards	\N	2017-11-20 18:45:02.529615	2017-11-20 18:45:02.529615	2
359	Conrad Tokyo	\N	2017-11-20 18:45:02.53333	2017-11-20 18:45:02.53333	2
360	Ego	\N	2017-11-20 18:45:02.537116	2017-11-20 18:45:02.537116	2
361	The Donald	\N	2017-11-20 18:45:02.541121	2017-11-20 18:45:02.541121	2
362	Intro - Live	\N	2017-11-20 18:45:19.975109	2017-11-20 18:45:19.975109	2
363	Lost At Birth - Live	\N	2017-11-20 18:45:19.977784	2017-11-20 18:45:19.977784	2
364	Miuzi Weighs A Ton - Live	\N	2017-11-20 18:45:19.980598	2017-11-20 18:45:19.980598	2
365	Get Up Stand Up - Live	\N	2017-11-20 18:45:19.98365	2017-11-20 18:45:19.98365	2
366	Rebel Without A Pause - Live	\N	2017-11-20 18:45:19.986449	2017-11-20 18:45:19.986449	2
367	911 Is A Joke - Live	\N	2017-11-20 18:45:19.989087	2017-11-20 18:45:19.989087	2
368	Welcome To The Terrordome - Live	\N	2017-11-20 18:45:19.991763	2017-11-20 18:45:19.991763	2
369	Hoovermusic - Live	\N	2017-11-20 18:45:19.994358	2017-11-20 18:45:19.994358	2
370	Black Steel In The Hour / Do You Wanna Go Our Way - Live	\N	2017-11-20 18:45:19.997256	2017-11-20 18:45:19.997256	2
371	Show 'Em Whatcha Got - Live	\N	2017-11-20 18:45:20.000815	2017-11-20 18:45:20.000815	2
372	Bring The Noise - Live	\N	2017-11-20 18:45:20.003081	2017-11-20 18:45:20.003081	2
373	Don't Believe The Hype - Live	\N	2017-11-20 18:45:20.005531	2017-11-20 18:45:20.005531	2
374	Can't Truss It - Live	\N	2017-11-20 18:45:20.007722	2017-11-20 18:45:20.007722	2
375	He Got Game - Live	\N	2017-11-20 18:45:20.010265	2017-11-20 18:45:20.010265	2
376	Night Of The Living Baseheads - Live	\N	2017-11-20 18:45:20.01284	2017-11-20 18:45:20.01284	2
377	I Shall Not Be Moved - Live	\N	2017-11-20 18:45:20.01534	2017-11-20 18:45:20.01534	2
378	Fight The Power (Soul Power - Who Stole This Soul) - Live	\N	2017-11-20 18:45:20.017786	2017-11-20 18:45:20.017786	2
379	Can't Do Nuttin' For Ya Man - Live	\N	2017-11-20 18:45:20.020212	2017-11-20 18:45:20.020212	2
380	31 Flavors - Live	\N	2017-11-20 18:45:20.02264	2017-11-20 18:45:20.02264	2
381	Shut 'Em Down - Live	\N	2017-11-20 18:45:20.025659	2017-11-20 18:45:20.025659	2
382	Harder Than You Think - Live	\N	2017-11-20 18:45:20.028575	2017-11-20 18:45:20.028575	2
383	Lonesome Valley	\N	2017-11-20 18:54:49.704068	2017-11-20 18:54:49.704068	11
384	The Poor Orphan Child	\N	2017-11-20 18:54:49.708293	2017-11-20 18:54:49.708293	11
385	Bury Me Under the Weeping Willow	\N	2017-11-20 18:54:49.711711	2017-11-20 18:54:49.711711	11
386	The Wandering Boy	\N	2017-11-20 18:54:49.715339	2017-11-20 18:54:49.715339	11
387	Wildwood Flower	\N	2017-11-20 18:54:49.718833	2017-11-20 18:54:49.718833	11
388	The Foggy Mountain Top	\N	2017-11-20 18:54:49.721655	2017-11-20 18:54:49.721655	11
389	The Cannon-Ball	\N	2017-11-20 18:54:49.724381	2017-11-20 18:54:49.724381	11
390	Worried Man Blues	\N	2017-11-20 18:54:49.727208	2017-11-20 18:54:49.727208	11
391	Engine One-Forty-Three	\N	2017-11-20 18:54:49.729957	2017-11-20 18:54:49.729957	11
392	Keep On the Sunny Side	\N	2017-11-20 18:54:49.732627	2017-11-20 18:54:49.732627	11
393	Sweet Fern	\N	2017-11-20 18:54:49.735261	2017-11-20 18:54:49.735261	11
394	John Hardy Was a Desperate Little Man	\N	2017-11-20 18:54:49.737919	2017-11-20 18:54:49.737919	11
395	Anchored in Love	\N	2017-11-20 18:54:49.742077	2017-11-20 18:54:49.742077	11
396	I Will Never Marry	\N	2017-11-20 18:54:49.745311	2017-11-20 18:54:49.745311	11
397	When the World's On Fire	\N	2017-11-20 18:54:49.747749	2017-11-20 18:54:49.747749	11
398	Blue Moon Of Kentucky	\N	2017-11-20 18:55:13.035087	2017-11-20 18:55:13.035087	11
399	Cheyenne	\N	2017-11-20 18:55:13.038915	2017-11-20 18:55:13.038915	11
400	Footprints in the Snow	\N	2017-11-20 18:55:13.041968	2017-11-20 18:55:13.041968	11
401	Raw Hide	\N	2017-11-20 18:55:13.044385	2017-11-20 18:55:13.044385	11
402	Little Cabin On The Hill	\N	2017-11-20 18:55:13.04687	2017-11-20 18:55:13.04687	11
403	Mule Skinner Blues	\N	2017-11-20 18:55:13.049686	2017-11-20 18:55:13.049686	11
404	Wait a Little Longer Please Jesus	\N	2017-11-20 18:55:13.052755	2017-11-20 18:55:13.052755	11
405	Alabama Waltz	\N	2017-11-20 18:55:13.055836	2017-11-20 18:55:13.055836	11
406	In The Pines	\N	2017-11-20 18:55:13.058716	2017-11-20 18:55:13.058716	11
407	Panhandle Country	\N	2017-11-20 18:55:13.061605	2017-11-20 18:55:13.061605	11
408	Im Working on a Building	\N	2017-11-20 18:55:13.064867	2017-11-20 18:55:13.064867	11
409	When the Cactus Is in Bloom	\N	2017-11-20 18:55:13.068259	2017-11-20 18:55:13.068259	11
410	Blue Moon of Kentucky - Alternate Version	\N	2017-11-20 18:55:13.071564	2017-11-20 18:55:13.071564	11
411	Brakemans Blues	\N	2017-11-20 18:55:13.076415	2017-11-20 18:55:13.076415	11
412	I Hope You Have Learned	\N	2017-11-20 18:55:13.080734	2017-11-20 18:55:13.080734	11
413	My Little Georgia Rose	\N	2017-11-20 18:55:13.084657	2017-11-20 18:55:13.084657	11
414	New Mule Skinner Blues	\N	2017-11-20 18:55:13.088638	2017-11-20 18:55:13.088638	11
415	Molly and Tenbrooks	\N	2017-11-20 18:55:13.09285	2017-11-20 18:55:13.09285	11
416	On And On	\N	2017-11-20 18:55:13.097526	2017-11-20 18:55:13.097526	11
417	Kentucky Waltz	\N	2017-11-20 18:55:13.102287	2017-11-20 18:55:13.102287	11
418	Pike County Breakdown	\N	2017-11-20 18:55:13.10768	2017-11-20 18:55:13.10768	11
419	Roanoke	\N	2017-11-20 18:55:13.113592	2017-11-20 18:55:13.113592	11
420	Rocky Road Blues	\N	2017-11-20 18:55:13.119279	2017-11-20 18:55:13.119279	11
421	Uncle Pen	\N	2017-11-20 18:55:13.123239	2017-11-20 18:55:13.123239	11
422	Im Blue Im Lonesome	\N	2017-11-20 18:55:13.127096	2017-11-20 18:55:13.127096	11
423	Get up John	\N	2017-11-20 18:55:13.131033	2017-11-20 18:55:13.131033	11
424	Memories of Mother and Dad	\N	2017-11-20 18:55:13.135571	2017-11-20 18:55:13.135571	11
425	Foggy Mountain Chimes	\N	2017-11-20 18:55:20.380243	2017-11-20 18:55:20.380243	11
426	It Won't Be Long	\N	2017-11-20 18:55:20.383198	2017-11-20 18:55:20.383198	11
427	Shuckin' the Corn	\N	2017-11-20 18:55:20.386018	2017-11-20 18:55:20.386018	11
428	Blue Ridge Cabin Home	\N	2017-11-20 18:55:20.388776	2017-11-20 18:55:20.388776	11
429	On My Mind	\N	2017-11-20 18:55:20.39144	2017-11-20 18:55:20.39144	11
430	Dear Old Dixie	\N	2017-11-20 18:55:20.393978	2017-11-20 18:55:20.393978	11
431	Reunion in Heaven	\N	2017-11-20 18:55:20.396591	2017-11-20 18:55:20.396591	11
432	Some Old Day	\N	2017-11-20 18:55:20.399186	2017-11-20 18:55:20.399186	11
433	Jimmie Brown & The Newsboy	\N	2017-11-20 18:55:20.401662	2017-11-20 18:55:20.401662	11
434	Pray for the Boys	\N	2017-11-20 18:55:20.40432	2017-11-20 18:55:20.40432	11
435	Earl's Breakdown	\N	2017-11-20 18:55:20.406839	2017-11-20 18:55:20.406839	11
436	Your Love Is Like a Flower	\N	2017-11-20 18:55:20.410526	2017-11-20 18:55:20.410526	11
437	Randy Lynn Rag	\N	2017-11-20 18:55:20.414506	2017-11-20 18:55:20.414506	11
438	Foggy Mountain Special	\N	2017-11-20 18:55:20.418411	2017-11-20 18:55:20.418411	11
439	Flint Hill Special	\N	2017-11-20 18:55:20.422602	2017-11-20 18:55:20.422602	11
440	Ain't Santa Cool	\N	2017-11-20 18:55:26.789117	2017-11-20 18:55:26.789117	11
441	Go Tell It On The Mountain	\N	2017-11-20 18:55:26.792175	2017-11-20 18:55:26.792175	11
442	Silent Night	\N	2017-11-20 18:55:26.794915	2017-11-20 18:55:26.794915	11
443	Why Can't Christmas Day Last All Year Long	\N	2017-11-20 18:55:26.797601	2017-11-20 18:55:26.797601	11
444	Away In A Manger	\N	2017-11-20 18:55:26.801428	2017-11-20 18:55:26.801428	11
445	Christmas Joy	\N	2017-11-20 18:55:26.805894	2017-11-20 18:55:26.805894	11
446	First Christmas Without Daddy	\N	2017-11-20 18:55:26.809685	2017-11-20 18:55:26.809685	11
447	Winter Wonderland	\N	2017-11-20 18:55:26.813786	2017-11-20 18:55:26.813786	11
448	Greatest Gift	\N	2017-11-20 18:55:26.817628	2017-11-20 18:55:26.817628	11
449	Jingle Bells	\N	2017-11-20 18:55:26.821692	2017-11-20 18:55:26.821692	11
450	Remember Me	\N	2017-11-20 18:55:26.82558	2017-11-20 18:55:26.82558	11
451	(I Wanna) Rock N Roll Guitar	\N	2017-11-20 18:55:26.829335	2017-11-20 18:55:26.829335	11
452	Christmas In Dixie	\N	2017-11-20 18:55:26.833143	2017-11-20 18:55:26.833143	11
453	Sure Could Use Some Christmas Around Here	\N	2017-11-20 18:55:26.836824	2017-11-20 18:55:26.836824	11
454	Auld Lang Syne	\N	2017-11-20 18:55:26.841632	2017-11-20 18:55:26.841632	11
455	The Friendly Beasts	\N	2017-11-20 18:55:33.182758	2017-11-20 18:55:33.182758	11
456	Silent Night	\N	2017-11-20 18:55:33.187397	2017-11-20 18:55:33.187397	11
457	Hark! the Herald Angels Sing	\N	2017-11-20 18:55:33.191526	2017-11-20 18:55:33.191526	11
458	Good Christian Men, Rejoice	\N	2017-11-20 18:55:33.195619	2017-11-20 18:55:33.195619	11
459	Deck the Halls	\N	2017-11-20 18:55:33.199941	2017-11-20 18:55:33.199941	11
460	While Shepherds Watched Their Flocks	\N	2017-11-20 18:55:33.20413	2017-11-20 18:55:33.20413	11
461	Away in a Manger	\N	2017-11-20 18:55:33.208384	2017-11-20 18:55:33.208384	11
462	O Little Town of Bethlehem	\N	2017-11-20 18:55:33.212075	2017-11-20 18:55:33.212075	11
463	Joy to the World	\N	2017-11-20 18:55:33.216146	2017-11-20 18:55:33.216146	11
464	It Came Upon a Midnight Clear	\N	2017-11-20 18:55:33.219974	2017-11-20 18:55:33.219974	11
465	O Come All Ye Faithful	\N	2017-11-20 18:55:33.223682	2017-11-20 18:55:33.223682	11
466	The First Noel	\N	2017-11-20 18:55:33.227567	2017-11-20 18:55:33.227567	11
467	Gammal fäbodpsalm - Live	\N	2017-11-20 18:58:52.418627	2017-11-20 18:58:52.418627	17
468	Voulez-Vous - Live	\N	2017-11-20 18:58:52.423481	2017-11-20 18:58:52.423481	17
469	If It Wasn't For The Nights - Live	\N	2017-11-20 18:58:52.427318	2017-11-20 18:58:52.427318	17
470	As Good As New - Live	\N	2017-11-20 18:58:52.431056	2017-11-20 18:58:52.431056	17
471	Knowing Me, Knowing You - Live	\N	2017-11-20 18:58:52.435432	2017-11-20 18:58:52.435432	17
472	Rock Me - Live	\N	2017-11-20 18:58:52.439946	2017-11-20 18:58:52.439946	17
473	Chiquitita - Live	\N	2017-11-20 18:58:52.444512	2017-11-20 18:58:52.444512	17
474	Money, Money, Money - Live	\N	2017-11-20 18:58:52.448914	2017-11-20 18:58:52.448914	17
475	I Have A Dream - Live	\N	2017-11-20 18:58:52.453297	2017-11-20 18:58:52.453297	17
476	Gimme! Gimme! Gimme! (A Man After Midnight) - Live	\N	2017-11-20 18:58:52.457783	2017-11-20 18:58:52.457783	17
477	S.O.S. - Live	\N	2017-11-20 18:58:52.462094	2017-11-20 18:58:52.462094	17
478	Fernando - Live	\N	2017-11-20 18:58:52.466007	2017-11-20 18:58:52.466007	17
479	The Name Of The Game - Live	\N	2017-11-20 18:58:52.469835	2017-11-20 18:58:52.469835	17
480	Eagle - Live	\N	2017-11-20 18:58:52.473791	2017-11-20 18:58:52.473791	17
481	Thank You For The Music - Live	\N	2017-11-20 18:58:52.477935	2017-11-20 18:58:52.477935	17
482	Why Did It Have To Be Me? - Live	\N	2017-11-20 18:58:52.482572	2017-11-20 18:58:52.482572	17
483	Intermezzo No.1 - Live	\N	2017-11-20 18:58:52.487328	2017-11-20 18:58:52.487328	17
484	I'm Still Alive - Live	\N	2017-11-20 18:58:52.492251	2017-11-20 18:58:52.492251	17
485	Summer Night City - Live	\N	2017-11-20 18:58:52.497074	2017-11-20 18:58:52.497074	17
486	Take A Chance On Me - Live	\N	2017-11-20 18:58:52.501984	2017-11-20 18:58:52.501984	17
487	Does Your Mother Know - Live	\N	2017-11-20 18:58:52.50646	2017-11-20 18:58:52.50646	17
488	Hole In Your Soul - Live	\N	2017-11-20 18:58:52.511026	2017-11-20 18:58:52.511026	17
489	The Way Old Friends Do - Live	\N	2017-11-20 18:58:52.515648	2017-11-20 18:58:52.515648	17
490	Dancing Queen - Live	\N	2017-11-20 18:58:52.519075	2017-11-20 18:58:52.519075	17
491	Waterloo - Live	\N	2017-11-20 18:58:52.522506	2017-11-20 18:58:52.522506	17
492	This Is Where I Came In	\N	2017-11-20 18:59:00.484939	2017-11-20 18:59:00.484939	17
493	She Keeps On Coming	\N	2017-11-20 18:59:00.48891	2017-11-20 18:59:00.48891	17
494	Sacred Trust	\N	2017-11-20 18:59:00.493147	2017-11-20 18:59:00.493147	17
495	Wedding Day	\N	2017-11-20 18:59:00.49727	2017-11-20 18:59:00.49727	17
496	Man In The Middle	\N	2017-11-20 18:59:00.501058	2017-11-20 18:59:00.501058	17
497	Déjà Vu	\N	2017-11-20 18:59:00.504813	2017-11-20 18:59:00.504813	17
498	Technicolor Dreams	\N	2017-11-20 18:59:00.508769	2017-11-20 18:59:00.508769	17
499	Walking On Air	\N	2017-11-20 18:59:00.512993	2017-11-20 18:59:00.512993	17
500	Loose Talk Costs Lives	\N	2017-11-20 18:59:00.51772	2017-11-20 18:59:00.51772	17
501	Embrace	\N	2017-11-20 18:59:00.522181	2017-11-20 18:59:00.522181	17
502	The Extra Mile	\N	2017-11-20 18:59:00.526672	2017-11-20 18:59:00.526672	17
503	Voice In The Wilderness	\N	2017-11-20 18:59:00.530803	2017-11-20 18:59:00.530803	17
504	I'm a Believer - 2006 Remastered Original Stereo Version	\N	2017-11-20 18:59:06.651125	2017-11-20 18:59:06.651125	17
505	Valleri	\N	2017-11-20 18:59:06.65582	2017-11-20 18:59:06.65582	17
506	You Just May Be The One - TV Version	\N	2017-11-20 18:59:06.660366	2017-11-20 18:59:06.660366	17
507	That Was Then, This Is Now	\N	2017-11-20 18:59:06.664507	2017-11-20 18:59:06.664507	17
508	(I'm Not Your) Steppin' Stone	\N	2017-11-20 18:59:06.66851	2017-11-20 18:59:06.66851	17
509	Pleasant Valley Sunday	\N	2017-11-20 18:59:06.672204	2017-11-20 18:59:06.672204	17
510	Daydream Believer	\N	2017-11-20 18:59:06.676133	2017-11-20 18:59:06.676133	17
511	Last Train To Clarksville	\N	2017-11-20 18:59:06.679986	2017-11-20 18:59:06.679986	17
512	She Makes Me Laugh	\N	2017-11-20 18:59:06.683878	2017-11-20 18:59:06.683878	17
513	A Little Bit Me, A Little Bit You - Stereo Remix	\N	2017-11-20 18:59:06.687737	2017-11-20 18:59:06.687737	17
514	Porpoise Song (Theme from "Head")	\N	2017-11-20 18:59:06.693153	2017-11-20 18:59:06.693153	17
515	Heart And Soul	\N	2017-11-20 18:59:06.69936	2017-11-20 18:59:06.69936	17
516	Words	\N	2017-11-20 18:59:06.703759	2017-11-20 18:59:06.703759	17
517	Goin' Down (45 Version)	\N	2017-11-20 18:59:06.708126	2017-11-20 18:59:06.708126	17
518	Wild Honey - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.080771	2017-11-20 18:59:14.080771	17
519	Aren't You Glad - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.084844	2017-11-20 18:59:14.084844	17
520	I Was Made To Love Her - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.088752	2017-11-20 18:59:14.088752	17
521	Country Air - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.092612	2017-11-20 18:59:14.092612	17
522	A Thing Or Two - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.096931	2017-11-20 18:59:14.096931	17
523	Darlin' - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.100109	2017-11-20 18:59:14.100109	17
524	I'd Love Just Once To See You - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.103009	2017-11-20 18:59:14.103009	17
525	Here Comes The Night - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.105614	2017-11-20 18:59:14.105614	17
526	Let The Wind Blow - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.108006	2017-11-20 18:59:14.108006	17
527	How She Boogalooed It - Stereo Mix / Remastered 2017	\N	2017-11-20 18:59:14.110447	2017-11-20 18:59:14.110447	17
528	Mama Says	\N	2017-11-20 18:59:14.113193	2017-11-20 18:59:14.113193	17
529	Lonely Days - Alternate Version	\N	2017-11-20 18:59:14.115673	2017-11-20 18:59:14.115673	17
530	Cool, Cool, Water - Alternate Version	\N	2017-11-20 18:59:14.118198	2017-11-20 18:59:14.118198	17
531	Time To Get Alone - Alternate Version	\N	2017-11-20 18:59:14.120808	2017-11-20 18:59:14.120808	17
532	Can't Wait Too Long - Alternate Version	\N	2017-11-20 18:59:14.123254	2017-11-20 18:59:14.123254	17
533	I'd Love Just Once To See You - Alternate Version	\N	2017-11-20 18:59:14.1259	2017-11-20 18:59:14.1259	17
534	I Was Made To Love Her - Vocal Insert Session	\N	2017-11-20 18:59:14.128349	2017-11-20 18:59:14.128349	17
535	I Was Made To Love Her - Long Version	\N	2017-11-20 18:59:14.131925	2017-11-20 18:59:14.131925	17
536	Hide Go Seek - Backing Track Master Take - Instrumental	\N	2017-11-20 18:59:14.135027	2017-11-20 18:59:14.135027	17
537	Honey Get Home - Backing Track Master Take - Instrumental	\N	2017-11-20 18:59:14.138065	2017-11-20 18:59:14.138065	17
538	Wild Honey - Session Highlights Instrumental	\N	2017-11-20 18:59:14.141171	2017-11-20 18:59:14.141171	17
539	Aren't You Glad - Session Highlights Instrumental	\N	2017-11-20 18:59:14.143992	2017-11-20 18:59:14.143992	17
540	A Thing Or Two - Track And Backing Vocals	\N	2017-11-20 18:59:14.146939	2017-11-20 18:59:14.146939	17
541	Darlin' - Session Highlights Instrumental	\N	2017-11-20 18:59:14.149733	2017-11-20 18:59:14.149733	17
542	Let The Wind Blow - Session Highlights Instrumental	\N	2017-11-20 18:59:14.152819	2017-11-20 18:59:14.152819	17
543	Wild Honey - Live In Detroit / 11/17/67	\N	2017-11-20 18:59:14.155679	2017-11-20 18:59:14.155679	17
544	Country Air - Live In Detroit / 1967	\N	2017-11-20 18:59:14.158463	2017-11-20 18:59:14.158463	17
545	Darlin' - Live In Pittsburgh / 1967	\N	2017-11-20 18:59:14.161082	2017-11-20 18:59:14.161082	17
546	How She Boogalooed It - Live In Detroit / 11/17/67	\N	2017-11-20 18:59:14.163858	2017-11-20 18:59:14.163858	17
547	Aren't You Glad - Live / 1970	\N	2017-11-20 18:59:14.166561	2017-11-20 18:59:14.166561	17
548	Mama Says - Session Highlights	\N	2017-11-20 18:59:14.169377	2017-11-20 18:59:14.169377	17
549	Heroes And Villains - Single Version Backing Track	\N	2017-11-20 18:59:14.172081	2017-11-20 18:59:14.172081	17
550	Vegetables - Long Version	\N	2017-11-20 18:59:14.175918	2017-11-20 18:59:14.175918	17
551	Fall Breaks And Back To Winter - Alternate Mix	\N	2017-11-20 18:59:14.179243	2017-11-20 18:59:14.179243	17
552	Wind Chimes - Alternate Tag Section	\N	2017-11-20 18:59:14.182072	2017-11-20 18:59:14.182072	17
553	Wonderful - Backing Track / Instrumental	\N	2017-11-20 18:59:14.185159	2017-11-20 18:59:14.185159	17
554	With Me Tonight - Alternate Version With Session Intro	\N	2017-11-20 18:59:14.188092	2017-11-20 18:59:14.188092	17
555	Little Pad - Backing Track / Instrumental	\N	2017-11-20 18:59:14.192702	2017-11-20 18:59:14.192702	17
556	All Day All Night (Whistle In) - Alternate Version 1	\N	2017-11-20 18:59:14.196866	2017-11-20 18:59:14.196866	17
557	All Day All Night (Whistle In) - Alternate Version 2	\N	2017-11-20 18:59:14.20088	2017-11-20 18:59:14.20088	17
558	Untitled (Redwood) - Instrumental	\N	2017-11-20 18:59:14.205328	2017-11-20 18:59:14.205328	17
559	Fred Vail Intro - Live / 1967	\N	2017-11-20 18:59:14.209163	2017-11-20 18:59:14.209163	17
560	The Letter - Alternate Mono Mix - Live / 1967	\N	2017-11-20 18:59:14.213265	2017-11-20 18:59:14.213265	17
561	You're So Good To Me - Live / 1967	\N	2017-11-20 18:59:14.217574	2017-11-20 18:59:14.217574	17
562	Help Me, Rhonda - Mono Mix / Live / 1967	\N	2017-11-20 18:59:14.222191	2017-11-20 18:59:14.222191	17
563	California Girls - Mono Mix / Live / 1967	\N	2017-11-20 18:59:14.226228	2017-11-20 18:59:14.226228	17
564	Surfer Girl - Mono Mix / Live / 1967	\N	2017-11-20 18:59:14.230246	2017-11-20 18:59:14.230246	17
565	Sloop John B - Live / 1967	\N	2017-11-20 18:59:14.234418	2017-11-20 18:59:14.234418	17
566	With A Little Help From My Friends - Mono Mix / Live / 1967	\N	2017-11-20 18:59:14.238623	2017-11-20 18:59:14.238623	17
567	Their Hearts Were Full Of Spring - Mono Mix / Live / 1967	\N	2017-11-20 18:59:14.243369	2017-11-20 18:59:14.243369	17
568	Big Love - Remastered	\N	2017-11-20 18:59:21.036013	2017-11-20 18:59:21.036013	17
569	Seven Wonders - Remastered	\N	2017-11-20 18:59:21.043035	2017-11-20 18:59:21.043035	17
570	Everywhere - Remastered	\N	2017-11-20 18:59:21.048266	2017-11-20 18:59:21.048266	17
571	Caroline - Remastered	\N	2017-11-20 18:59:21.051841	2017-11-20 18:59:21.051841	17
572	Tango in the Night - Remastered	\N	2017-11-20 18:59:21.054593	2017-11-20 18:59:21.054593	17
573	Mystified - Remastered	\N	2017-11-20 18:59:21.057486	2017-11-20 18:59:21.057486	17
574	Little Lies - Remastered	\N	2017-11-20 18:59:21.059892	2017-11-20 18:59:21.059892	17
575	Family Man - Remastered	\N	2017-11-20 18:59:21.062278	2017-11-20 18:59:21.062278	17
576	Welcome To The Room... Sara - Remastered	\N	2017-11-20 18:59:21.064661	2017-11-20 18:59:21.064661	17
577	Isn't It Midnight - Remastered	\N	2017-11-20 18:59:21.067357	2017-11-20 18:59:21.067357	17
578	When I See You Again - Remastered	\N	2017-11-20 18:59:21.070058	2017-11-20 18:59:21.070058	17
579	You And I, Pt. II - Remastered	\N	2017-11-20 18:59:21.072702	2017-11-20 18:59:21.072702	17
580	Down Endless Street - Remastered	\N	2017-11-20 18:59:21.075496	2017-11-20 18:59:21.075496	17
581	Special Kind of Love (Demo)	\N	2017-11-20 18:59:21.07827	2017-11-20 18:59:21.07827	17
582	Seven Wonders (Early Version)	\N	2017-11-20 18:59:21.080939	2017-11-20 18:59:21.080939	17
583	Tango in the Night (Demo)	\N	2017-11-20 18:59:21.083565	2017-11-20 18:59:21.083565	17
584	Mystified (Alternate Version)	\N	2017-11-20 18:59:21.085924	2017-11-20 18:59:21.085924	17
585	Book of Miracles (Instrumental)	\N	2017-11-20 18:59:21.088518	2017-11-20 18:59:21.088518	17
586	Where We Belong (Demo)	\N	2017-11-20 18:59:21.091309	2017-11-20 18:59:21.091309	17
587	Ricky - Remastered	\N	2017-11-20 18:59:21.093935	2017-11-20 18:59:21.093935	17
588	Juliet (Run-Through)	\N	2017-11-20 18:59:21.096953	2017-11-20 18:59:21.096953	17
589	Isn't It Midnight (Alternate Mix)	\N	2017-11-20 18:59:21.100207	2017-11-20 18:59:21.100207	17
590	Ooh My Love (Demo)	\N	2017-11-20 18:59:21.103691	2017-11-20 18:59:21.103691	17
591	Mystified (Instrumental Demo)	\N	2017-11-20 18:59:21.107312	2017-11-20 18:59:21.107312	17
592	You And I, Part II (Full Version)	\N	2017-11-20 18:59:21.110908	2017-11-20 18:59:21.110908	17
593	Big Love (Extended Remix) - Remastered	\N	2017-11-20 18:59:21.113743	2017-11-20 18:59:21.113743	17
594	Big Love (House On The Hill Dub) - Remastered	\N	2017-11-20 18:59:21.116387	2017-11-20 18:59:21.116387	17
595	Big Love (Piano Dub) - Remastered	\N	2017-11-20 18:59:21.119	2017-11-20 18:59:21.119	17
596	Big Love (Remix/Edit) - Remastered	\N	2017-11-20 18:59:21.121897	2017-11-20 18:59:21.121897	17
597	Seven Wonders (Extended Version) - Remastered	\N	2017-11-20 18:59:21.124742	2017-11-20 18:59:21.124742	17
598	Seven Wonders (Dub) - Remastered	\N	2017-11-20 18:59:21.127753	2017-11-20 18:59:21.127753	17
599	Little Lies (Extended Version) - Remastered	\N	2017-11-20 18:59:21.131292	2017-11-20 18:59:21.131292	17
600	Little Lies (Dub) - Remastered	\N	2017-11-20 18:59:21.135573	2017-11-20 18:59:21.135573	17
601	Family Man (Extended Vocal Remix) - Remastered	\N	2017-11-20 18:59:21.13793	2017-11-20 18:59:21.13793	17
602	Family Man (I'm a Jazz Man Dub) - Remastered	\N	2017-11-20 18:59:21.140309	2017-11-20 18:59:21.140309	17
603	Family Man (Extended Guitar Version) - Remastered	\N	2017-11-20 18:59:21.144405	2017-11-20 18:59:21.144405	17
604	Family Man (Bonus Beats) - Remastered	\N	2017-11-20 18:59:21.148609	2017-11-20 18:59:21.148609	17
605	Everywhere (12" Version) - Remastered	\N	2017-11-20 18:59:21.153251	2017-11-20 18:59:21.153251	17
606	Everywhere (Dub) - Remastered	\N	2017-11-20 18:59:21.158086	2017-11-20 18:59:21.158086	17
607	Hurricane	\N	2017-11-20 19:01:48.563034	2017-11-20 19:01:48.563034	4
608	One Inch Man	\N	2017-11-20 19:01:48.567426	2017-11-20 19:01:48.567426	4
609	Thee Ol' Boozeroony	\N	2017-11-20 19:01:48.57096	2017-11-20 19:01:48.57096	4
610	Gloria Lewis	\N	2017-11-20 19:01:48.574681	2017-11-20 19:01:48.574681	4
611	Phototropic	\N	2017-11-20 19:01:48.578166	2017-11-20 19:01:48.578166	4
612	El Rodeo	\N	2017-11-20 19:01:48.581943	2017-11-20 19:01:48.581943	4
613	Jumbo Blimp Jumbo	\N	2017-11-20 19:01:48.585669	2017-11-20 19:01:48.585669	4
614	Tangy Zizzle	\N	2017-11-20 19:01:48.589651	2017-11-20 19:01:48.589651	4
615	Size Queen	\N	2017-11-20 19:01:48.593993	2017-11-20 19:01:48.593993	4
616	Catamaran	\N	2017-11-20 19:01:48.598078	2017-11-20 19:01:48.598078	4
617	Spaceship Landing	\N	2017-11-20 19:01:48.602126	2017-11-20 19:01:48.602126	4
618	Separate Kingdom	\N	2017-11-20 19:01:55.977287	2017-11-20 19:01:55.977287	4
619	Hang On	\N	2017-11-20 19:01:55.98129	2017-11-20 19:01:55.98129	4
620	Foot Down and Low	\N	2017-11-20 19:01:55.985364	2017-11-20 19:01:55.985364	4
621	Ampn'	\N	2017-11-20 19:01:55.989363	2017-11-20 19:01:55.989363	4
622	Go for It	\N	2017-11-20 19:01:55.994098	2017-11-20 19:01:55.994098	4
623	Planet of the Ape Hangers	\N	2017-11-20 19:01:55.99856	2017-11-20 19:01:55.99856	4
624	Bultaco	\N	2017-11-20 19:01:56.002594	2017-11-20 19:01:56.002594	4
625	The Answer Lies	\N	2017-11-20 19:01:56.006664	2017-11-20 19:01:56.006664	4
626	Wiz Kid	\N	2017-11-20 19:01:56.009775	2017-11-20 19:01:56.009775	4
627	Feet Don't Fail Me	\N	2017-11-20 19:02:05.643858	2017-11-20 19:02:05.643858	4
628	The Way You Used to Do	\N	2017-11-20 19:02:05.647379	2017-11-20 19:02:05.647379	4
629	Domesticated Animals	\N	2017-11-20 19:02:05.651033	2017-11-20 19:02:05.651033	4
630	Fortress	\N	2017-11-20 19:02:05.654095	2017-11-20 19:02:05.654095	4
631	Head Like a Haunted House	\N	2017-11-20 19:02:05.656581	2017-11-20 19:02:05.656581	4
632	Un-Reborn Again	\N	2017-11-20 19:02:05.659104	2017-11-20 19:02:05.659104	4
633	Hideaway	\N	2017-11-20 19:02:05.661574	2017-11-20 19:02:05.661574	4
634	The Evil Has Landed	\N	2017-11-20 19:02:05.663966	2017-11-20 19:02:05.663966	4
635	Villains of Circumstance	\N	2017-11-20 19:02:05.666327	2017-11-20 19:02:05.666327	4
636	You Can't Stop Progress - Live	\N	2017-11-20 19:02:14.478465	2017-11-20 19:02:14.478465	4
637	Power Player - Live	\N	2017-11-20 19:02:14.482648	2017-11-20 19:02:14.482648	4
638	The Dragonfly - Live	\N	2017-11-20 19:02:14.486663	2017-11-20 19:02:14.486663	4
639	Child of the City - Live	\N	2017-11-20 19:02:14.492144	2017-11-20 19:02:14.492144	4
640	The Devil & Me - Live	\N	2017-11-20 19:02:14.497583	2017-11-20 19:02:14.497583	4
641	Texan Book of the Dead - Live	\N	2017-11-20 19:02:14.502152	2017-11-20 19:02:14.502152	4
642	Animal Farm - Live	\N	2017-11-20 19:02:14.506655	2017-11-20 19:02:14.506655	4
643	The Mob Goes Wild - Live	\N	2017-11-20 19:02:14.511078	2017-11-20 19:02:14.511078	4
644	Cypress Grove - Live	\N	2017-11-20 19:02:14.515968	2017-11-20 19:02:14.515968	4
645	The Incomparable Mr. Flannery - Live	\N	2017-11-20 19:02:14.520863	2017-11-20 19:02:14.520863	4
646	I Have the Body of John Wilkes Booth - Live	\N	2017-11-20 19:02:14.525493	2017-11-20 19:02:14.525493	4
647	The Elephant Riders - Live	\N	2017-11-20 19:02:14.530016	2017-11-20 19:02:14.530016	4
648	Ship of Gold - Live	\N	2017-11-20 19:02:14.534306	2017-11-20 19:02:14.534306	4
649	The Yeti - Live	\N	2017-11-20 19:02:14.538658	2017-11-20 19:02:14.538658	4
650	Promoter (Of Earthbound Causes) - Live	\N	2017-11-20 19:02:14.542903	2017-11-20 19:02:14.542903	4
651	10001110101 - Live	\N	2017-11-20 19:02:14.547093	2017-11-20 19:02:14.547093	4
652	Mr. Shiny Cadillackness - Live	\N	2017-11-20 19:02:14.551275	2017-11-20 19:02:14.551275	4
653	Electric Worry - Live	\N	2017-11-20 19:02:14.555739	2017-11-20 19:02:14.555739	4
654	One Eyed Dollar - Live	\N	2017-11-20 19:02:14.560392	2017-11-20 19:02:14.560392	4
655	She Digs That Hole	\N	2017-11-20 19:02:20.768834	2017-11-20 19:02:20.768834	4
656	Watch Me Fade	\N	2017-11-20 19:02:20.771715	2017-11-20 19:02:20.771715	4
657	Mastermind '69	\N	2017-11-20 19:02:20.774346	2017-11-20 19:02:20.774346	4
658	Cobras And Fire (Hallucination Bomb)	\N	2017-11-20 19:02:20.777549	2017-11-20 19:02:20.777549	4
659	Gods, Punks And The Everlasting Twilight	\N	2017-11-20 19:02:20.780702	2017-11-20 19:02:20.780702	4
660	The Titan	\N	2017-11-20 19:02:20.784181	2017-11-20 19:02:20.784181	4
661	When The Planes Fall From The Sky - Sitar And Psych Version	\N	2017-11-20 19:02:20.787914	2017-11-20 19:02:20.787914	4
662	Ball Of Confusion	\N	2017-11-20 19:02:20.790725	2017-11-20 19:02:20.790725	4
663	Time Machine - Instrumental	\N	2017-11-20 19:02:20.794694	2017-11-20 19:02:20.794694	4
664	I Live Behind The Paradise Machine: Evil Joe Barresi's Magnet Mash, Vol. 1	\N	2017-11-20 19:02:20.798516	2017-11-20 19:02:20.798516	4
665	The Nameless Dread	\N	2017-11-20 19:10:06.786822	2017-11-20 19:10:06.786822	10
666	Depravity Favours the Bold	\N	2017-11-20 19:10:06.794043	2017-11-20 19:10:06.794043	10
667	Hold Your Children Close and Pray for Oblivion	\N	2017-11-20 19:10:06.798785	2017-11-20 19:10:06.798785	10
668	We Will Fucking Kill You	\N	2017-11-20 19:10:06.803013	2017-11-20 19:10:06.803013	10
669	...So We Can Die Happy	\N	2017-11-20 19:10:06.807643	2017-11-20 19:10:06.807643	10
670	In Flagrante Delicto	\N	2017-11-20 19:10:06.812664	2017-11-20 19:10:06.812664	10
671	And You Will Beg for Our Secrets	\N	2017-11-20 19:10:06.8175	2017-11-20 19:10:06.8175	10
672	Extravaganza!	\N	2017-11-20 19:10:06.822163	2017-11-20 19:10:06.822163	10
673	On Being a Slave	\N	2017-11-20 19:10:06.826595	2017-11-20 19:10:06.826595	10
674	The Great Spectator	\N	2017-11-20 19:10:06.831439	2017-11-20 19:10:06.831439	10
675	Of Horror, And the Black Shawls	\N	2017-11-20 19:10:06.836138	2017-11-20 19:10:06.836138	10
676	Powerslave (Bonus Track)	\N	2017-11-20 19:10:06.840832	2017-11-20 19:10:06.840832	10
677	Man at C&A (Bonus Track)	\N	2017-11-20 19:10:06.846174	2017-11-20 19:10:06.846174	10
678	boot	\N	2017-11-20 19:10:12.755998	2017-11-20 19:10:12.755998	10
679	floating point	\N	2017-11-20 19:10:12.76049	2017-11-20 19:10:12.76049	10
680	pointers	\N	2017-11-20 19:10:12.764036	2017-11-20 19:10:12.764036	10
681	brute force	\N	2017-11-20 19:10:12.767416	2017-11-20 19:10:12.767416	10
682	userspace	\N	2017-11-20 19:10:12.770775	2017-11-20 19:10:12.770775	10
683	shellcode	\N	2017-11-20 19:10:12.773801	2017-11-20 19:10:12.773801	10
684	hex	\N	2017-11-20 19:10:12.777133	2017-11-20 19:10:12.777133	10
685	deadlock	\N	2017-11-20 19:10:12.780936	2017-11-20 19:10:12.780936	10
686	rootkit	\N	2017-11-20 19:10:12.784184	2017-11-20 19:10:12.784184	10
687	trojans (hard mode)	\N	2017-11-20 19:10:12.787616	2017-11-20 19:10:12.787616	10
688	Somebody's actiong like a child	\N	2017-11-20 19:16:41.699308	2017-11-20 19:16:41.699308	16
689	Wild about you	\N	2017-11-20 19:16:41.703641	2017-11-20 19:16:41.703641	16
690	The Bear	\N	2017-11-20 19:16:41.70721	2017-11-20 19:16:41.70721	16
691	Riding on the L & N	\N	2017-11-20 19:16:41.710273	2017-11-20 19:16:41.710273	16
692	Oh pretty woman	\N	2017-11-20 19:16:41.712897	2017-11-20 19:16:41.712897	16
693	Rolling with the Blues	\N	2017-11-20 19:16:41.715862	2017-11-20 19:16:41.715862	16
694	Room to move	\N	2017-11-20 19:16:41.719344	2017-11-20 19:16:41.719344	16
695	I ain't got you	\N	2017-11-20 19:16:41.722626	2017-11-20 19:16:41.722626	16
696	N.S.U.	\N	2017-11-20 19:16:47.260795	2017-11-20 19:16:47.260795	16
697	I Feel Free - Mono Version	\N	2017-11-20 19:16:47.264916	2017-11-20 19:16:47.264916	16
698	I'm So Glad - Stereo Mix	\N	2017-11-20 19:16:47.268687	2017-11-20 19:16:47.268687	16
699	Sunshine Of Your Love	\N	2017-11-20 19:16:47.272614	2017-11-20 19:16:47.272614	16
700	We're Going Wrong	\N	2017-11-20 19:16:47.277114	2017-11-20 19:16:47.277114	16
701	White Room	\N	2017-11-20 19:16:47.281667	2017-11-20 19:16:47.281667	16
702	Deserted Cities Of The Heart	\N	2017-11-20 19:16:47.285975	2017-11-20 19:16:47.285975	16
703	Doing That Scrapyard Thing	\N	2017-11-20 19:16:47.29044	2017-11-20 19:16:47.29044	16
704	Never Tell Your Mother She's Out Of Tune	\N	2017-11-20 19:16:47.29485	2017-11-20 19:16:47.29485	16
705	Rope Ladder To The Moon	\N	2017-11-20 19:16:47.299316	2017-11-20 19:16:47.299316	16
706	Theme For An Imaginary Western	\N	2017-11-20 19:16:47.303605	2017-11-20 19:16:47.303605	16
707	Weird Of Hermiston	\N	2017-11-20 19:16:47.308236	2017-11-20 19:16:47.308236	16
708	Folk Song	\N	2017-11-20 19:16:47.311113	2017-11-20 19:16:47.311113	16
709	Can You Follow	\N	2017-11-20 19:16:47.314492	2017-11-20 19:16:47.314492	16
710	Morning Story	\N	2017-11-20 19:16:47.318185	2017-11-20 19:16:47.318185	16
711	You Burned The Tables On Me	\N	2017-11-20 19:16:47.321626	2017-11-20 19:16:47.321626	16
712	Pieces Of Mind	\N	2017-11-20 19:16:47.324769	2017-11-20 19:16:47.324769	16
713	Running Through Our Hands	\N	2017-11-20 19:16:47.328267	2017-11-20 19:16:47.328267	16
714	Keep It Down	\N	2017-11-20 19:16:47.331635	2017-11-20 19:16:47.331635	16
715	Something To Live For	\N	2017-11-20 19:16:47.334911	2017-11-20 19:16:47.334911	16
716	Without A Word	\N	2017-11-20 19:16:47.338634	2017-11-20 19:16:47.338634	16
717	How's Tricks	\N	2017-11-20 19:16:47.341861	2017-11-20 19:16:47.341861	16
718	Childsong	\N	2017-11-20 19:16:47.345031	2017-11-20 19:16:47.345031	16
719	The Best Is Still To Come	\N	2017-11-20 19:16:47.356329	2017-11-20 19:16:47.356329	16
720	She's Moving On	\N	2017-11-20 19:16:47.35945	2017-11-20 19:16:47.35945	16
721	Jet Set Jewel	\N	2017-11-20 19:16:47.362152	2017-11-20 19:16:47.362152	16
722	Ships In The Night	\N	2017-11-20 19:16:47.365516	2017-11-20 19:16:47.365516	16
723	City Of Gold - Remastered 2002	\N	2017-11-20 19:16:47.369069	2017-11-20 19:16:47.369069	16
724	Waiting In The Wings - Remastered 2002	\N	2017-11-20 19:16:47.372252	2017-11-20 19:16:47.372252	16
725	Out Into The Fields	\N	2017-11-20 19:16:47.375452	2017-11-20 19:16:47.375452	16
726	The Night That Once Was Mine	\N	2017-11-20 19:16:47.378722	2017-11-20 19:16:47.378722	16
727	Candlelight	\N	2017-11-20 19:16:47.382108	2017-11-20 19:16:47.382108	16
728	Fields Of Forever	\N	2017-11-20 19:16:47.385146	2017-11-20 19:16:47.385146	16
729	Reach For The Night	\N	2017-11-20 19:16:47.387847	2017-11-20 19:16:47.387847	16
730	Don’t Look Now	\N	2017-11-20 19:16:47.390699	2017-11-20 19:16:47.390699	16
731	Got Me Under Pressure - Live from New York	\N	2017-11-20 19:16:53.370019	2017-11-20 19:16:53.370019	16
732	Beer Drinkers & Hell Raisers - Live from Las Vegas	\N	2017-11-20 19:16:53.373998	2017-11-20 19:16:53.373998	16
733	Cheap Sunglasses - Live from Paris	\N	2017-11-20 19:16:53.377858	2017-11-20 19:16:53.377858	16
734	Waitin For The Bus - Live from Nashville	\N	2017-11-20 19:16:53.382414	2017-11-20 19:16:53.382414	16
735	Jesus Just Left Chicago - Live from Nashville	\N	2017-11-20 19:16:53.38678	2017-11-20 19:16:53.38678	16
736	Legs - Live from Sao Paolo	\N	2017-11-20 19:16:53.390829	2017-11-20 19:16:53.390829	16
737	Sharp Dressed Man - Live from Los Angeles	\N	2017-11-20 19:16:53.394836	2017-11-20 19:16:53.394836	16
738	Rough Boy (feat. Jeff Beck) - Live from London	\N	2017-11-20 19:16:53.398961	2017-11-20 19:16:53.398961	16
739	Pincushion - Live from Berlin	\N	2017-11-20 19:16:53.403125	2017-11-20 19:16:53.403125	16
740	La Grange - Live from Dallas	\N	2017-11-20 19:16:53.407081	2017-11-20 19:16:53.407081	16
741	I'm Bad, I'm Nationwide - Live from Vancouver	\N	2017-11-20 19:16:53.411355	2017-11-20 19:16:53.411355	16
742	Tube Snake Boogie - Live from Rome	\N	2017-11-20 19:16:53.415572	2017-11-20 19:16:53.415572	16
743	Gimme All Your Lovin - Live from Houston	\N	2017-11-20 19:16:53.419923	2017-11-20 19:16:53.419923	16
744	Tush - Live from Chicago	\N	2017-11-20 19:16:53.423952	2017-11-20 19:16:53.423952	16
745	Sixteen Tons (feat. Jeff Beck) - Live from London	\N	2017-11-20 19:16:53.428113	2017-11-20 19:16:53.428113	16
746	Pegasus	\N	2017-11-20 19:16:59.316238	2017-11-20 19:16:59.316238	16
747	Can't Take It With You	\N	2017-11-20 19:16:59.320825	2017-11-20 19:16:59.320825	16
748	Crazy Love	\N	2017-11-20 19:16:59.325119	2017-11-20 19:16:59.325119	16
749	Win, Lose Or Draw	\N	2017-11-20 19:16:59.327768	2017-11-20 19:16:59.327768	16
750	Can't Lose What You Never Had - Live	\N	2017-11-20 19:16:59.332846	2017-11-20 19:16:59.332846	16
751	Jessica - Unedited Version	\N	2017-11-20 19:16:59.33571	2017-11-20 19:16:59.33571	16
752	Southbound	\N	2017-11-20 19:16:59.338401	2017-11-20 19:16:59.338401	16
753	Ramblin' Man	\N	2017-11-20 19:16:59.341088	2017-11-20 19:16:59.341088	16
754	Wasted Words	\N	2017-11-20 19:16:59.343832	2017-11-20 19:16:59.343832	16
755	Little Martha	\N	2017-11-20 19:16:59.346355	2017-11-20 19:16:59.346355	16
756	Blue Sky	\N	2017-11-20 19:16:59.349349	2017-11-20 19:16:59.349349	16
757	Stand Back	\N	2017-11-20 19:16:59.352141	2017-11-20 19:16:59.352141	16
758	Melissa	\N	2017-11-20 19:16:59.355024	2017-11-20 19:16:59.355024	16
759	Ain't Wastin Time No More	\N	2017-11-20 19:16:59.357938	2017-11-20 19:16:59.357938	16
760	One Way Out - Live At The Fillmore East/1971	\N	2017-11-20 19:16:59.361418	2017-11-20 19:16:59.361418	16
761	Hot 'Lanta - Live At The Fillmore East/1971	\N	2017-11-20 19:16:59.364	2017-11-20 19:16:59.364	16
762	Statesboro Blues - Live At The Fillmore East/1971	\N	2017-11-20 19:16:59.366777	2017-11-20 19:16:59.366777	16
763	Hoochie Coochie Man	\N	2017-11-20 19:16:59.369473	2017-11-20 19:16:59.369473	16
764	Don't Keep Me Wonderin'	\N	2017-11-20 19:16:59.372146	2017-11-20 19:16:59.372146	16
765	Midnight Rider	\N	2017-11-20 19:16:59.374682	2017-11-20 19:16:59.374682	16
766	Revival	\N	2017-11-20 19:16:59.377499	2017-11-20 19:16:59.377499	16
767	Whipping Post	\N	2017-11-20 19:16:59.380168	2017-11-20 19:16:59.380168	16
768	Black Hearted Woman	\N	2017-11-20 19:16:59.382987	2017-11-20 19:16:59.382987	16
769	Don't Want You No More	\N	2017-11-20 19:16:59.386056	2017-11-20 19:16:59.386056	16
770	It's Not My Cross To Bear	\N	2017-11-20 19:16:59.389109	2017-11-20 19:16:59.389109	16
771	Dreams	\N	2017-11-20 19:16:59.392495	2017-11-20 19:16:59.392495	16
772	Trouble No More - Live At The Fillmore East/1971	\N	2017-11-20 19:16:59.395478	2017-11-20 19:16:59.395478	16
773	Come And Go Blues - Live At Watkins Glen/1973	\N	2017-11-20 19:16:59.398934	2017-11-20 19:16:59.398934	16
774	Zoot Suit	\N	2017-11-20 19:17:05.734539	2017-11-20 19:17:05.734539	16
775	I'm The Face	\N	2017-11-20 19:17:05.738427	2017-11-20 19:17:05.738427	16
776	I Can't Explain - Mono Version	\N	2017-11-20 19:17:05.742384	2017-11-20 19:17:05.742384	16
777	Bald Headed Woman - Mono Version	\N	2017-11-20 19:17:05.746314	2017-11-20 19:17:05.746314	16
778	Anyway, Anyhow, Anywhere - Mono Version	\N	2017-11-20 19:17:05.750229	2017-11-20 19:17:05.750229	16
779	Daddy Rolling Stone - Mono Version	\N	2017-11-20 19:17:05.754483	2017-11-20 19:17:05.754483	16
780	My Generation - Mono Version	\N	2017-11-20 19:17:05.758961	2017-11-20 19:17:05.758961	16
781	Shout And Shimmy	\N	2017-11-20 19:17:05.763645	2017-11-20 19:17:05.763645	16
782	Circles - Revised Mono Version	\N	2017-11-20 19:17:05.768259	2017-11-20 19:17:05.768259	16
783	Instant Party Mixture - Mono Version	\N	2017-11-20 19:17:05.773009	2017-11-20 19:17:05.773009	16
784	A Legal Matter - Mono Version	\N	2017-11-20 19:17:05.777389	2017-11-20 19:17:05.777389	16
785	The Kids Are Alright - Mono Version	\N	2017-11-20 19:17:05.781864	2017-11-20 19:17:05.781864	16
786	The Ox - Mono Version	\N	2017-11-20 19:17:05.786064	2017-11-20 19:17:05.786064	16
787	La-La-La-Lies - Mono Version	\N	2017-11-20 19:17:05.790249	2017-11-20 19:17:05.790249	16
788	The Good's Gone - Mono Version	\N	2017-11-20 19:17:05.794836	2017-11-20 19:17:05.794836	16
789	Substitute - Single Version	\N	2017-11-20 19:17:05.799653	2017-11-20 19:17:05.799653	16
790	Circles - Revised Second Mono Version	\N	2017-11-20 19:17:05.803068	2017-11-20 19:17:05.803068	16
791	Waltz For A Pig	\N	2017-11-20 19:17:05.806552	2017-11-20 19:17:05.806552	16
792	I'm A Boy - Mono Version	\N	2017-11-20 19:17:05.81002	2017-11-20 19:17:05.81002	16
793	In The City - Mono Version	\N	2017-11-20 19:17:05.813179	2017-11-20 19:17:05.813179	16
794	Disguises - Mono Version	\N	2017-11-20 19:17:05.816215	2017-11-20 19:17:05.816215	16
795	Batman - Mono Version	\N	2017-11-20 19:17:05.819215	2017-11-20 19:17:05.819215	16
796	Bucket T - Mono Version	\N	2017-11-20 19:17:05.822345	2017-11-20 19:17:05.822345	16
797	Barbara Ann - Mono Version	\N	2017-11-20 19:17:05.825446	2017-11-20 19:17:05.825446	16
798	Happy Jack - Single Version	\N	2017-11-20 19:17:05.828003	2017-11-20 19:17:05.828003	16
799	I've Been Away - Mono Version	\N	2017-11-20 19:17:05.83085	2017-11-20 19:17:05.83085	16
800	Pictures Of Lily	\N	2017-11-20 19:17:05.834075	2017-11-20 19:17:05.834075	16
801	Doctor, Doctor - Mono Version	\N	2017-11-20 19:17:05.837096	2017-11-20 19:17:05.837096	16
802	The Last Time	\N	2017-11-20 19:17:05.839975	2017-11-20 19:17:05.839975	16
803	Under My Thumb	\N	2017-11-20 19:17:05.842786	2017-11-20 19:17:05.842786	16
804	I Can See For Miles - Mono Version	\N	2017-11-20 19:17:05.845632	2017-11-20 19:17:05.845632	16
805	Someone's Coming	\N	2017-11-20 19:17:05.848319	2017-11-20 19:17:05.848319	16
806	Dogs	\N	2017-11-20 19:17:05.851122	2017-11-20 19:17:05.851122	16
807	Call Me Lightning	\N	2017-11-20 19:17:05.853908	2017-11-20 19:17:05.853908	16
808	Magic Bus - Edit Mono Version	\N	2017-11-20 19:17:05.856512	2017-11-20 19:17:05.856512	16
809	Dr Jekyll & Mr Hyde	\N	2017-11-20 19:17:05.85937	2017-11-20 19:17:05.85937	16
810	Pinball Wizard	\N	2017-11-20 19:17:05.86215	2017-11-20 19:17:05.86215	16
811	Dogs Part Two	\N	2017-11-20 19:17:05.865003	2017-11-20 19:17:05.865003	16
812	The Seeker - Edit	\N	2017-11-20 19:17:05.867843	2017-11-20 19:17:05.867843	16
813	Here For More	\N	2017-11-20 19:17:05.870903	2017-11-20 19:17:05.870903	16
814	Summertime Blues - Live At Leeds	\N	2017-11-20 19:17:05.873998	2017-11-20 19:17:05.873998	16
815	Heaven And Hell - Mono Version	\N	2017-11-20 19:17:05.876953	2017-11-20 19:17:05.876953	16
816	See Me, Feel Me - Single Version	\N	2017-11-20 19:17:05.879833	2017-11-20 19:17:05.879833	16
817	Overture	\N	2017-11-20 19:17:05.882737	2017-11-20 19:17:05.882737	16
818	Christmas - Edit	\N	2017-11-20 19:17:05.886314	2017-11-20 19:17:05.886314	16
819	I'm Free	\N	2017-11-20 19:17:05.889905	2017-11-20 19:17:05.889905	16
820	Won't Get Fooled Again - Single Version	\N	2017-11-20 19:17:05.893227	2017-11-20 19:17:05.893227	16
821	Don't Know Myself	\N	2017-11-20 19:17:05.896414	2017-11-20 19:17:05.896414	16
822	Let's See Action	\N	2017-11-20 19:17:05.900931	2017-11-20 19:17:05.900931	16
823	When I Was A Boy	\N	2017-11-20 19:17:05.905297	2017-11-20 19:17:05.905297	16
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('songs_id_seq', 823, true);


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
44	11	36	2017-11-20 18:16:54.69339	2017-11-20 18:16:54.69339
45	11	37	2017-11-20 18:16:54.699394	2017-11-20 18:16:54.699394
46	11	38	2017-11-20 18:16:54.703907	2017-11-20 18:16:54.703907
47	11	39	2017-11-20 18:16:54.708155	2017-11-20 18:16:54.708155
48	11	40	2017-11-20 18:16:54.712566	2017-11-20 18:16:54.712566
49	11	41	2017-11-20 18:16:54.717113	2017-11-20 18:16:54.717113
50	11	42	2017-11-20 18:16:54.721498	2017-11-20 18:16:54.721498
51	11	43	2017-11-20 18:16:54.726044	2017-11-20 18:16:54.726044
52	11	44	2017-11-20 18:16:54.730497	2017-11-20 18:16:54.730497
53	11	45	2017-11-20 18:16:54.734834	2017-11-20 18:16:54.734834
54	11	46	2017-11-20 18:16:54.739014	2017-11-20 18:16:54.739014
55	11	47	2017-11-20 18:16:54.743213	2017-11-20 18:16:54.743213
56	11	48	2017-11-20 18:16:54.747802	2017-11-20 18:16:54.747802
57	11	49	2017-11-20 18:16:54.752261	2017-11-20 18:16:54.752261
58	11	50	2017-11-20 18:16:54.756958	2017-11-20 18:16:54.756958
59	11	51	2017-11-20 18:16:54.76202	2017-11-20 18:16:54.76202
60	11	52	2017-11-20 18:16:54.767072	2017-11-20 18:16:54.767072
61	11	53	2017-11-20 18:16:54.772108	2017-11-20 18:16:54.772108
62	11	54	2017-11-20 18:16:54.777463	2017-11-20 18:16:54.777463
63	11	55	2017-11-20 18:16:54.782319	2017-11-20 18:16:54.782319
64	12	56	2017-11-20 18:17:10.293863	2017-11-20 18:17:10.293863
65	12	57	2017-11-20 18:17:10.299376	2017-11-20 18:17:10.299376
66	12	58	2017-11-20 18:17:10.304935	2017-11-20 18:17:10.304935
67	12	59	2017-11-20 18:17:10.310651	2017-11-20 18:17:10.310651
68	12	60	2017-11-20 18:17:10.317247	2017-11-20 18:17:10.317247
69	12	61	2017-11-20 18:17:10.324062	2017-11-20 18:17:10.324062
70	12	62	2017-11-20 18:17:10.331328	2017-11-20 18:17:10.331328
71	12	63	2017-11-20 18:17:10.337662	2017-11-20 18:17:10.337662
72	12	64	2017-11-20 18:17:10.344652	2017-11-20 18:17:10.344652
73	12	65	2017-11-20 18:17:10.351942	2017-11-20 18:17:10.351942
74	12	66	2017-11-20 18:17:10.357768	2017-11-20 18:17:10.357768
75	12	67	2017-11-20 18:17:10.363828	2017-11-20 18:17:10.363828
76	12	68	2017-11-20 18:17:10.369556	2017-11-20 18:17:10.369556
77	12	69	2017-11-20 18:17:10.37493	2017-11-20 18:17:10.37493
78	12	70	2017-11-20 18:17:10.383451	2017-11-20 18:17:10.383451
79	12	71	2017-11-20 18:17:10.388431	2017-11-20 18:17:10.388431
80	12	72	2017-11-20 18:17:10.394964	2017-11-20 18:17:10.394964
81	12	73	2017-11-20 18:17:10.401954	2017-11-20 18:17:10.401954
82	12	74	2017-11-20 18:17:10.407782	2017-11-20 18:17:10.407782
83	12	75	2017-11-20 18:17:10.41601	2017-11-20 18:17:10.41601
84	12	76	2017-11-20 18:17:10.425487	2017-11-20 18:17:10.425487
85	13	77	2017-11-20 18:17:26.228516	2017-11-20 18:17:26.228516
86	13	78	2017-11-20 18:17:26.235366	2017-11-20 18:17:26.235366
87	13	79	2017-11-20 18:17:26.243385	2017-11-20 18:17:26.243385
88	13	80	2017-11-20 18:17:26.250072	2017-11-20 18:17:26.250072
89	13	81	2017-11-20 18:17:26.255744	2017-11-20 18:17:26.255744
90	13	82	2017-11-20 18:17:26.262194	2017-11-20 18:17:26.262194
91	13	83	2017-11-20 18:17:26.268959	2017-11-20 18:17:26.268959
92	13	84	2017-11-20 18:17:26.27537	2017-11-20 18:17:26.27537
93	13	85	2017-11-20 18:17:26.284426	2017-11-20 18:17:26.284426
94	13	86	2017-11-20 18:17:26.291795	2017-11-20 18:17:26.291795
95	13	87	2017-11-20 18:17:26.298474	2017-11-20 18:17:26.298474
96	13	88	2017-11-20 18:17:26.305379	2017-11-20 18:17:26.305379
97	13	89	2017-11-20 18:17:26.312017	2017-11-20 18:17:26.312017
98	13	90	2017-11-20 18:17:26.318697	2017-11-20 18:17:26.318697
99	13	91	2017-11-20 18:17:26.32557	2017-11-20 18:17:26.32557
100	13	92	2017-11-20 18:17:26.331084	2017-11-20 18:17:26.331084
101	13	93	2017-11-20 18:17:26.338	2017-11-20 18:17:26.338
102	13	94	2017-11-20 18:17:26.344277	2017-11-20 18:17:26.344277
103	13	95	2017-11-20 18:17:26.349808	2017-11-20 18:17:26.349808
104	14	96	2017-11-20 18:17:50.022026	2017-11-20 18:17:50.022026
105	14	97	2017-11-20 18:17:50.027959	2017-11-20 18:17:50.027959
106	14	98	2017-11-20 18:17:50.033593	2017-11-20 18:17:50.033593
107	14	99	2017-11-20 18:17:50.038769	2017-11-20 18:17:50.038769
108	14	100	2017-11-20 18:17:50.043966	2017-11-20 18:17:50.043966
109	14	101	2017-11-20 18:17:50.049164	2017-11-20 18:17:50.049164
110	14	102	2017-11-20 18:17:50.054376	2017-11-20 18:17:50.054376
111	14	103	2017-11-20 18:17:50.059853	2017-11-20 18:17:50.059853
112	14	104	2017-11-20 18:17:50.065524	2017-11-20 18:17:50.065524
113	14	105	2017-11-20 18:17:50.071578	2017-11-20 18:17:50.071578
114	14	106	2017-11-20 18:17:50.077226	2017-11-20 18:17:50.077226
115	14	107	2017-11-20 18:17:50.082975	2017-11-20 18:17:50.082975
116	14	108	2017-11-20 18:17:50.089097	2017-11-20 18:17:50.089097
117	14	109	2017-11-20 18:17:50.095334	2017-11-20 18:17:50.095334
118	14	110	2017-11-20 18:17:50.101502	2017-11-20 18:17:50.101502
119	14	111	2017-11-20 18:17:50.10801	2017-11-20 18:17:50.10801
120	14	112	2017-11-20 18:17:50.113386	2017-11-20 18:17:50.113386
121	14	113	2017-11-20 18:17:50.117961	2017-11-20 18:17:50.117961
122	14	114	2017-11-20 18:17:50.123714	2017-11-20 18:17:50.123714
123	14	115	2017-11-20 18:17:50.128872	2017-11-20 18:17:50.128872
124	14	116	2017-11-20 18:17:50.133566	2017-11-20 18:17:50.133566
125	15	117	2017-11-20 18:18:07.600965	2017-11-20 18:18:07.600965
126	15	118	2017-11-20 18:18:07.605174	2017-11-20 18:18:07.605174
127	15	119	2017-11-20 18:18:07.609212	2017-11-20 18:18:07.609212
128	15	120	2017-11-20 18:18:07.613176	2017-11-20 18:18:07.613176
129	15	121	2017-11-20 18:18:07.617235	2017-11-20 18:18:07.617235
130	15	122	2017-11-20 18:18:07.621186	2017-11-20 18:18:07.621186
131	15	123	2017-11-20 18:18:07.625411	2017-11-20 18:18:07.625411
132	15	124	2017-11-20 18:18:07.629593	2017-11-20 18:18:07.629593
133	15	125	2017-11-20 18:18:07.633692	2017-11-20 18:18:07.633692
134	15	126	2017-11-20 18:18:07.637717	2017-11-20 18:18:07.637717
135	15	127	2017-11-20 18:18:07.642002	2017-11-20 18:18:07.642002
136	16	128	2017-11-20 18:22:51.148097	2017-11-20 18:22:51.148097
137	16	129	2017-11-20 18:22:51.154669	2017-11-20 18:22:51.154669
138	16	130	2017-11-20 18:22:51.160518	2017-11-20 18:22:51.160518
139	16	131	2017-11-20 18:22:51.167752	2017-11-20 18:22:51.167752
140	16	132	2017-11-20 18:22:51.173603	2017-11-20 18:22:51.173603
141	16	133	2017-11-20 18:22:51.178897	2017-11-20 18:22:51.178897
142	16	134	2017-11-20 18:22:51.184426	2017-11-20 18:22:51.184426
143	16	135	2017-11-20 18:22:51.19074	2017-11-20 18:22:51.19074
144	16	136	2017-11-20 18:22:51.197371	2017-11-20 18:22:51.197371
145	16	137	2017-11-20 18:22:51.20508	2017-11-20 18:22:51.20508
146	16	138	2017-11-20 18:22:51.21196	2017-11-20 18:22:51.21196
147	16	139	2017-11-20 18:22:51.217388	2017-11-20 18:22:51.217388
148	17	140	2017-11-20 18:23:07.134726	2017-11-20 18:23:07.134726
149	17	141	2017-11-20 18:23:07.141795	2017-11-20 18:23:07.141795
150	17	142	2017-11-20 18:23:07.148263	2017-11-20 18:23:07.148263
151	17	143	2017-11-20 18:23:07.153876	2017-11-20 18:23:07.153876
152	17	144	2017-11-20 18:23:07.159647	2017-11-20 18:23:07.159647
153	17	145	2017-11-20 18:23:07.165609	2017-11-20 18:23:07.165609
154	17	146	2017-11-20 18:23:07.171279	2017-11-20 18:23:07.171279
155	17	147	2017-11-20 18:23:07.176762	2017-11-20 18:23:07.176762
156	17	148	2017-11-20 18:23:07.18246	2017-11-20 18:23:07.18246
157	17	149	2017-11-20 18:23:07.18821	2017-11-20 18:23:07.18821
158	17	150	2017-11-20 18:23:07.193859	2017-11-20 18:23:07.193859
159	17	151	2017-11-20 18:23:07.199506	2017-11-20 18:23:07.199506
160	17	152	2017-11-20 18:23:07.20574	2017-11-20 18:23:07.20574
161	17	153	2017-11-20 18:23:07.212596	2017-11-20 18:23:07.212596
162	17	154	2017-11-20 18:23:07.219576	2017-11-20 18:23:07.219576
163	18	155	2017-11-20 18:23:25.150536	2017-11-20 18:23:25.150536
164	18	156	2017-11-20 18:23:25.15538	2017-11-20 18:23:25.15538
165	18	157	2017-11-20 18:23:25.161046	2017-11-20 18:23:25.161046
166	18	158	2017-11-20 18:23:25.167129	2017-11-20 18:23:25.167129
167	18	159	2017-11-20 18:23:25.172776	2017-11-20 18:23:25.172776
168	18	160	2017-11-20 18:23:25.178599	2017-11-20 18:23:25.178599
169	18	161	2017-11-20 18:23:25.184129	2017-11-20 18:23:25.184129
170	18	162	2017-11-20 18:23:25.189763	2017-11-20 18:23:25.189763
171	18	163	2017-11-20 18:23:25.197339	2017-11-20 18:23:25.197339
172	18	164	2017-11-20 18:23:25.206294	2017-11-20 18:23:25.206294
173	18	165	2017-11-20 18:23:25.212845	2017-11-20 18:23:25.212845
174	18	166	2017-11-20 18:23:25.219038	2017-11-20 18:23:25.219038
175	18	167	2017-11-20 18:23:25.228269	2017-11-20 18:23:25.228269
176	18	168	2017-11-20 18:23:25.235013	2017-11-20 18:23:25.235013
177	18	169	2017-11-20 18:23:25.241013	2017-11-20 18:23:25.241013
178	18	170	2017-11-20 18:23:25.246789	2017-11-20 18:23:25.246789
179	18	171	2017-11-20 18:23:25.253183	2017-11-20 18:23:25.253183
180	19	172	2017-11-20 18:23:40.01107	2017-11-20 18:23:40.01107
181	19	173	2017-11-20 18:23:40.017008	2017-11-20 18:23:40.017008
182	19	174	2017-11-20 18:23:40.022573	2017-11-20 18:23:40.022573
183	19	175	2017-11-20 18:23:40.028379	2017-11-20 18:23:40.028379
184	19	176	2017-11-20 18:23:40.034672	2017-11-20 18:23:40.034672
185	19	177	2017-11-20 18:23:40.04077	2017-11-20 18:23:40.04077
186	19	178	2017-11-20 18:23:40.046386	2017-11-20 18:23:40.046386
187	19	179	2017-11-20 18:23:40.053211	2017-11-20 18:23:40.053211
188	19	180	2017-11-20 18:23:40.059977	2017-11-20 18:23:40.059977
189	19	181	2017-11-20 18:23:40.065726	2017-11-20 18:23:40.065726
190	19	182	2017-11-20 18:23:40.071628	2017-11-20 18:23:40.071628
191	19	183	2017-11-20 18:23:40.078482	2017-11-20 18:23:40.078482
192	19	184	2017-11-20 18:23:40.084644	2017-11-20 18:23:40.084644
193	19	185	2017-11-20 18:23:40.090641	2017-11-20 18:23:40.090641
194	19	186	2017-11-20 18:23:40.096175	2017-11-20 18:23:40.096175
195	19	187	2017-11-20 18:23:40.10152	2017-11-20 18:23:40.10152
196	19	188	2017-11-20 18:23:40.107168	2017-11-20 18:23:40.107168
197	20	189	2017-11-20 18:23:54.917266	2017-11-20 18:23:54.917266
198	20	190	2017-11-20 18:23:54.922874	2017-11-20 18:23:54.922874
199	20	191	2017-11-20 18:23:54.928222	2017-11-20 18:23:54.928222
200	20	192	2017-11-20 18:23:54.932214	2017-11-20 18:23:54.932214
201	20	193	2017-11-20 18:23:54.937542	2017-11-20 18:23:54.937542
202	20	194	2017-11-20 18:23:54.942853	2017-11-20 18:23:54.942853
203	20	195	2017-11-20 18:23:54.948975	2017-11-20 18:23:54.948975
204	20	196	2017-11-20 18:23:54.955093	2017-11-20 18:23:54.955093
205	20	197	2017-11-20 18:23:54.959481	2017-11-20 18:23:54.959481
206	20	198	2017-11-20 18:23:54.963944	2017-11-20 18:23:54.963944
207	20	199	2017-11-20 18:23:54.969514	2017-11-20 18:23:54.969514
208	20	200	2017-11-20 18:23:54.975365	2017-11-20 18:23:54.975365
209	20	201	2017-11-20 18:23:54.979844	2017-11-20 18:23:54.979844
210	20	202	2017-11-20 18:23:54.98427	2017-11-20 18:23:54.98427
211	20	203	2017-11-20 18:23:54.988738	2017-11-20 18:23:54.988738
212	20	204	2017-11-20 18:23:54.993394	2017-11-20 18:23:54.993394
213	20	205	2017-11-20 18:23:54.997706	2017-11-20 18:23:54.997706
214	20	206	2017-11-20 18:23:55.002304	2017-11-20 18:23:55.002304
215	20	207	2017-11-20 18:23:55.007613	2017-11-20 18:23:55.007613
216	20	208	2017-11-20 18:23:55.012152	2017-11-20 18:23:55.012152
217	20	209	2017-11-20 18:23:55.01978	2017-11-20 18:23:55.01978
218	20	210	2017-11-20 18:23:55.026256	2017-11-20 18:23:55.026256
219	20	211	2017-11-20 18:23:55.033534	2017-11-20 18:23:55.033534
220	20	212	2017-11-20 18:23:55.040139	2017-11-20 18:23:55.040139
221	20	213	2017-11-20 18:23:55.045978	2017-11-20 18:23:55.045978
222	20	214	2017-11-20 18:23:55.051916	2017-11-20 18:23:55.051916
223	20	215	2017-11-20 18:23:55.057942	2017-11-20 18:23:55.057942
224	20	216	2017-11-20 18:23:55.064165	2017-11-20 18:23:55.064165
225	20	217	2017-11-20 18:23:55.070509	2017-11-20 18:23:55.070509
226	21	218	2017-11-20 18:39:05.769226	2017-11-20 18:39:05.769226
227	21	219	2017-11-20 18:39:05.774148	2017-11-20 18:39:05.774148
228	21	220	2017-11-20 18:39:05.778559	2017-11-20 18:39:05.778559
229	21	221	2017-11-20 18:39:05.783089	2017-11-20 18:39:05.783089
230	21	222	2017-11-20 18:39:05.788178	2017-11-20 18:39:05.788178
231	21	223	2017-11-20 18:39:05.793033	2017-11-20 18:39:05.793033
232	21	224	2017-11-20 18:39:05.798534	2017-11-20 18:39:05.798534
233	21	225	2017-11-20 18:39:05.803274	2017-11-20 18:39:05.803274
234	21	226	2017-11-20 18:39:05.808538	2017-11-20 18:39:05.808538
235	21	227	2017-11-20 18:39:05.813231	2017-11-20 18:39:05.813231
236	21	228	2017-11-20 18:39:05.817966	2017-11-20 18:39:05.817966
237	21	229	2017-11-20 18:39:05.822827	2017-11-20 18:39:05.822827
238	22	230	2017-11-20 18:39:27.131049	2017-11-20 18:39:27.131049
239	22	231	2017-11-20 18:39:27.136392	2017-11-20 18:39:27.136392
240	22	232	2017-11-20 18:39:27.14138	2017-11-20 18:39:27.14138
241	22	233	2017-11-20 18:39:27.1461	2017-11-20 18:39:27.1461
242	22	234	2017-11-20 18:39:27.150898	2017-11-20 18:39:27.150898
243	22	235	2017-11-20 18:39:27.155432	2017-11-20 18:39:27.155432
244	22	236	2017-11-20 18:39:27.159948	2017-11-20 18:39:27.159948
245	22	237	2017-11-20 18:39:27.165114	2017-11-20 18:39:27.165114
246	22	238	2017-11-20 18:39:27.170746	2017-11-20 18:39:27.170746
247	22	239	2017-11-20 18:39:27.176566	2017-11-20 18:39:27.176566
248	22	240	2017-11-20 18:39:27.182203	2017-11-20 18:39:27.182203
249	22	241	2017-11-20 18:39:27.187629	2017-11-20 18:39:27.187629
250	22	242	2017-11-20 18:39:27.193051	2017-11-20 18:39:27.193051
251	22	243	2017-11-20 18:39:27.198518	2017-11-20 18:39:27.198518
252	22	244	2017-11-20 18:39:27.204186	2017-11-20 18:39:27.204186
253	22	245	2017-11-20 18:39:27.209731	2017-11-20 18:39:27.209731
254	22	246	2017-11-20 18:39:27.215413	2017-11-20 18:39:27.215413
255	22	247	2017-11-20 18:39:27.221562	2017-11-20 18:39:27.221562
256	22	248	2017-11-20 18:39:27.228279	2017-11-20 18:39:27.228279
257	22	249	2017-11-20 18:39:27.235095	2017-11-20 18:39:27.235095
258	22	250	2017-11-20 18:39:27.241226	2017-11-20 18:39:27.241226
259	22	251	2017-11-20 18:39:27.246666	2017-11-20 18:39:27.246666
260	22	252	2017-11-20 18:39:27.252241	2017-11-20 18:39:27.252241
261	22	253	2017-11-20 18:39:27.257828	2017-11-20 18:39:27.257828
262	22	254	2017-11-20 18:39:27.263406	2017-11-20 18:39:27.263406
263	23	255	2017-11-20 18:39:42.676062	2017-11-20 18:39:42.676062
264	23	256	2017-11-20 18:39:42.682209	2017-11-20 18:39:42.682209
265	23	257	2017-11-20 18:39:42.688468	2017-11-20 18:39:42.688468
266	23	258	2017-11-20 18:39:42.69414	2017-11-20 18:39:42.69414
267	23	259	2017-11-20 18:39:42.699619	2017-11-20 18:39:42.699619
268	23	260	2017-11-20 18:39:42.704621	2017-11-20 18:39:42.704621
269	23	261	2017-11-20 18:39:42.709762	2017-11-20 18:39:42.709762
270	23	262	2017-11-20 18:39:42.714971	2017-11-20 18:39:42.714971
271	23	263	2017-11-20 18:39:42.720143	2017-11-20 18:39:42.720143
272	23	264	2017-11-20 18:39:42.724975	2017-11-20 18:39:42.724975
273	23	265	2017-11-20 18:39:42.73121	2017-11-20 18:39:42.73121
274	23	266	2017-11-20 18:39:42.736511	2017-11-20 18:39:42.736511
275	24	267	2017-11-20 18:40:02.077242	2017-11-20 18:40:02.077242
276	24	268	2017-11-20 18:40:02.082292	2017-11-20 18:40:02.082292
277	24	269	2017-11-20 18:40:02.088107	2017-11-20 18:40:02.088107
278	24	270	2017-11-20 18:40:02.094349	2017-11-20 18:40:02.094349
279	24	271	2017-11-20 18:40:02.100974	2017-11-20 18:40:02.100974
280	24	272	2017-11-20 18:40:02.107748	2017-11-20 18:40:02.107748
281	24	273	2017-11-20 18:40:02.113356	2017-11-20 18:40:02.113356
282	24	274	2017-11-20 18:40:02.119346	2017-11-20 18:40:02.119346
283	24	275	2017-11-20 18:40:02.12492	2017-11-20 18:40:02.12492
284	24	276	2017-11-20 18:40:02.130577	2017-11-20 18:40:02.130577
285	24	277	2017-11-20 18:40:02.136169	2017-11-20 18:40:02.136169
286	24	278	2017-11-20 18:40:02.141709	2017-11-20 18:40:02.141709
287	24	279	2017-11-20 18:40:02.147222	2017-11-20 18:40:02.147222
288	24	280	2017-11-20 18:40:02.153484	2017-11-20 18:40:02.153484
289	24	281	2017-11-20 18:40:02.16014	2017-11-20 18:40:02.16014
290	24	282	2017-11-20 18:40:02.165677	2017-11-20 18:40:02.165677
291	25	283	2017-11-20 18:40:19.099071	2017-11-20 18:40:19.099071
292	25	284	2017-11-20 18:40:19.103321	2017-11-20 18:40:19.103321
293	25	285	2017-11-20 18:40:19.107628	2017-11-20 18:40:19.107628
294	25	286	2017-11-20 18:40:19.111657	2017-11-20 18:40:19.111657
295	25	287	2017-11-20 18:40:19.115805	2017-11-20 18:40:19.115805
296	25	288	2017-11-20 18:40:19.120006	2017-11-20 18:40:19.120006
297	25	289	2017-11-20 18:40:19.124133	2017-11-20 18:40:19.124133
298	25	290	2017-11-20 18:40:19.128548	2017-11-20 18:40:19.128548
299	25	291	2017-11-20 18:40:19.13269	2017-11-20 18:40:19.13269
300	25	292	2017-11-20 18:40:19.136812	2017-11-20 18:40:19.136812
301	25	293	2017-11-20 18:40:19.141238	2017-11-20 18:40:19.141238
302	25	294	2017-11-20 18:40:19.145811	2017-11-20 18:40:19.145811
303	25	295	2017-11-20 18:40:19.15024	2017-11-20 18:40:19.15024
304	25	296	2017-11-20 18:40:19.154909	2017-11-20 18:40:19.154909
305	26	297	2017-11-20 18:44:03.241203	2017-11-20 18:44:03.241203
306	26	298	2017-11-20 18:44:03.252761	2017-11-20 18:44:03.252761
307	26	299	2017-11-20 18:44:03.260989	2017-11-20 18:44:03.260989
308	26	300	2017-11-20 18:44:03.266686	2017-11-20 18:44:03.266686
309	26	301	2017-11-20 18:44:03.272362	2017-11-20 18:44:03.272362
310	26	302	2017-11-20 18:44:03.277694	2017-11-20 18:44:03.277694
311	26	303	2017-11-20 18:44:03.283758	2017-11-20 18:44:03.283758
312	26	304	2017-11-20 18:44:03.289393	2017-11-20 18:44:03.289393
313	26	305	2017-11-20 18:44:03.295081	2017-11-20 18:44:03.295081
314	26	306	2017-11-20 18:44:03.300995	2017-11-20 18:44:03.300995
315	26	307	2017-11-20 18:44:03.307062	2017-11-20 18:44:03.307062
316	26	308	2017-11-20 18:44:03.3131	2017-11-20 18:44:03.3131
317	26	309	2017-11-20 18:44:03.319041	2017-11-20 18:44:03.319041
318	26	310	2017-11-20 18:44:03.325024	2017-11-20 18:44:03.325024
319	26	311	2017-11-20 18:44:03.330527	2017-11-20 18:44:03.330527
320	26	312	2017-11-20 18:44:03.335909	2017-11-20 18:44:03.335909
321	26	313	2017-11-20 18:44:03.342364	2017-11-20 18:44:03.342364
322	26	314	2017-11-20 18:44:03.348804	2017-11-20 18:44:03.348804
323	27	315	2017-11-20 18:44:23.617785	2017-11-20 18:44:23.617785
324	27	316	2017-11-20 18:44:23.622294	2017-11-20 18:44:23.622294
325	27	317	2017-11-20 18:44:23.626977	2017-11-20 18:44:23.626977
326	27	318	2017-11-20 18:44:23.63181	2017-11-20 18:44:23.63181
327	27	319	2017-11-20 18:44:23.638419	2017-11-20 18:44:23.638419
328	27	320	2017-11-20 18:44:23.644829	2017-11-20 18:44:23.644829
329	27	321	2017-11-20 18:44:23.650026	2017-11-20 18:44:23.650026
330	27	322	2017-11-20 18:44:23.655555	2017-11-20 18:44:23.655555
331	27	323	2017-11-20 18:44:23.661213	2017-11-20 18:44:23.661213
332	27	324	2017-11-20 18:44:23.666897	2017-11-20 18:44:23.666897
333	27	325	2017-11-20 18:44:23.672894	2017-11-20 18:44:23.672894
334	27	326	2017-11-20 18:44:23.678753	2017-11-20 18:44:23.678753
335	27	327	2017-11-20 18:44:23.684297	2017-11-20 18:44:23.684297
336	27	328	2017-11-20 18:44:23.690124	2017-11-20 18:44:23.690124
337	27	329	2017-11-20 18:44:23.696345	2017-11-20 18:44:23.696345
338	27	330	2017-11-20 18:44:23.703438	2017-11-20 18:44:23.703438
339	27	331	2017-11-20 18:44:23.710592	2017-11-20 18:44:23.710592
340	27	332	2017-11-20 18:44:23.716821	2017-11-20 18:44:23.716821
341	28	333	2017-11-20 18:44:44.855652	2017-11-20 18:44:44.855652
342	28	334	2017-11-20 18:44:44.861275	2017-11-20 18:44:44.861275
343	28	335	2017-11-20 18:44:44.865925	2017-11-20 18:44:44.865925
344	28	336	2017-11-20 18:44:44.870509	2017-11-20 18:44:44.870509
345	28	337	2017-11-20 18:44:44.874979	2017-11-20 18:44:44.874979
346	28	338	2017-11-20 18:44:44.87931	2017-11-20 18:44:44.87931
347	28	339	2017-11-20 18:44:44.883729	2017-11-20 18:44:44.883729
348	28	340	2017-11-20 18:44:44.888176	2017-11-20 18:44:44.888176
349	28	341	2017-11-20 18:44:44.892938	2017-11-20 18:44:44.892938
350	28	342	2017-11-20 18:44:44.897548	2017-11-20 18:44:44.897548
351	28	343	2017-11-20 18:44:44.902554	2017-11-20 18:44:44.902554
352	28	344	2017-11-20 18:44:44.90891	2017-11-20 18:44:44.90891
353	28	345	2017-11-20 18:44:44.9147	2017-11-20 18:44:44.9147
354	29	346	2017-11-20 18:45:02.546808	2017-11-20 18:45:02.546808
355	29	347	2017-11-20 18:45:02.552219	2017-11-20 18:45:02.552219
356	29	348	2017-11-20 18:45:02.557105	2017-11-20 18:45:02.557105
357	29	349	2017-11-20 18:45:02.561896	2017-11-20 18:45:02.561896
358	29	350	2017-11-20 18:45:02.566697	2017-11-20 18:45:02.566697
359	29	351	2017-11-20 18:45:02.571647	2017-11-20 18:45:02.571647
360	29	352	2017-11-20 18:45:02.578411	2017-11-20 18:45:02.578411
361	29	353	2017-11-20 18:45:02.584717	2017-11-20 18:45:02.584717
362	29	354	2017-11-20 18:45:02.590593	2017-11-20 18:45:02.590593
363	29	355	2017-11-20 18:45:02.596167	2017-11-20 18:45:02.596167
364	29	356	2017-11-20 18:45:02.602439	2017-11-20 18:45:02.602439
365	29	357	2017-11-20 18:45:02.609047	2017-11-20 18:45:02.609047
366	29	358	2017-11-20 18:45:02.615627	2017-11-20 18:45:02.615627
367	29	359	2017-11-20 18:45:02.621433	2017-11-20 18:45:02.621433
368	29	360	2017-11-20 18:45:02.626952	2017-11-20 18:45:02.626952
369	29	361	2017-11-20 18:45:02.632684	2017-11-20 18:45:02.632684
370	30	362	2017-11-20 18:45:20.033508	2017-11-20 18:45:20.033508
371	30	363	2017-11-20 18:45:20.037853	2017-11-20 18:45:20.037853
372	30	364	2017-11-20 18:45:20.04325	2017-11-20 18:45:20.04325
373	30	365	2017-11-20 18:45:20.048969	2017-11-20 18:45:20.048969
374	30	366	2017-11-20 18:45:20.054237	2017-11-20 18:45:20.054237
375	30	367	2017-11-20 18:45:20.059991	2017-11-20 18:45:20.059991
376	30	368	2017-11-20 18:45:20.065389	2017-11-20 18:45:20.065389
377	30	369	2017-11-20 18:45:20.071564	2017-11-20 18:45:20.071564
378	30	370	2017-11-20 18:45:20.07753	2017-11-20 18:45:20.07753
379	30	371	2017-11-20 18:45:20.083989	2017-11-20 18:45:20.083989
380	30	372	2017-11-20 18:45:20.090085	2017-11-20 18:45:20.090085
381	30	373	2017-11-20 18:45:20.09597	2017-11-20 18:45:20.09597
382	30	374	2017-11-20 18:45:20.10246	2017-11-20 18:45:20.10246
383	30	375	2017-11-20 18:45:20.111581	2017-11-20 18:45:20.111581
384	30	376	2017-11-20 18:45:20.120277	2017-11-20 18:45:20.120277
385	30	377	2017-11-20 18:45:20.126826	2017-11-20 18:45:20.126826
386	30	378	2017-11-20 18:45:20.133705	2017-11-20 18:45:20.133705
387	30	379	2017-11-20 18:45:20.140389	2017-11-20 18:45:20.140389
388	30	380	2017-11-20 18:45:20.146189	2017-11-20 18:45:20.146189
389	30	381	2017-11-20 18:45:20.153011	2017-11-20 18:45:20.153011
390	30	382	2017-11-20 18:45:20.160134	2017-11-20 18:45:20.160134
391	31	383	2017-11-20 18:54:49.767615	2017-11-20 18:54:49.767615
392	31	384	2017-11-20 18:54:49.772122	2017-11-20 18:54:49.772122
393	31	385	2017-11-20 18:54:49.776015	2017-11-20 18:54:49.776015
394	31	386	2017-11-20 18:54:49.780179	2017-11-20 18:54:49.780179
395	31	387	2017-11-20 18:54:49.785539	2017-11-20 18:54:49.785539
396	31	388	2017-11-20 18:54:49.790583	2017-11-20 18:54:49.790583
397	31	389	2017-11-20 18:54:49.79578	2017-11-20 18:54:49.79578
398	31	390	2017-11-20 18:54:49.801101	2017-11-20 18:54:49.801101
399	31	391	2017-11-20 18:54:49.806638	2017-11-20 18:54:49.806638
400	31	392	2017-11-20 18:54:49.812406	2017-11-20 18:54:49.812406
401	31	393	2017-11-20 18:54:49.818239	2017-11-20 18:54:49.818239
402	31	394	2017-11-20 18:54:49.823723	2017-11-20 18:54:49.823723
403	31	395	2017-11-20 18:54:49.829254	2017-11-20 18:54:49.829254
404	31	396	2017-11-20 18:54:49.834729	2017-11-20 18:54:49.834729
405	31	397	2017-11-20 18:54:49.840831	2017-11-20 18:54:49.840831
406	32	398	2017-11-20 18:55:13.143344	2017-11-20 18:55:13.143344
407	32	399	2017-11-20 18:55:13.149543	2017-11-20 18:55:13.149543
408	32	400	2017-11-20 18:55:13.155264	2017-11-20 18:55:13.155264
409	32	401	2017-11-20 18:55:13.161219	2017-11-20 18:55:13.161219
410	32	402	2017-11-20 18:55:13.167295	2017-11-20 18:55:13.167295
411	32	403	2017-11-20 18:55:13.177795	2017-11-20 18:55:13.177795
412	32	404	2017-11-20 18:55:13.185878	2017-11-20 18:55:13.185878
413	32	405	2017-11-20 18:55:13.191803	2017-11-20 18:55:13.191803
414	32	406	2017-11-20 18:55:13.19766	2017-11-20 18:55:13.19766
415	32	407	2017-11-20 18:55:13.203729	2017-11-20 18:55:13.203729
416	32	408	2017-11-20 18:55:13.209979	2017-11-20 18:55:13.209979
417	32	409	2017-11-20 18:55:13.215948	2017-11-20 18:55:13.215948
418	32	410	2017-11-20 18:55:13.221804	2017-11-20 18:55:13.221804
419	32	411	2017-11-20 18:55:13.227626	2017-11-20 18:55:13.227626
420	32	412	2017-11-20 18:55:13.233849	2017-11-20 18:55:13.233849
421	32	413	2017-11-20 18:55:13.240376	2017-11-20 18:55:13.240376
422	32	414	2017-11-20 18:55:13.246134	2017-11-20 18:55:13.246134
423	32	415	2017-11-20 18:55:13.251742	2017-11-20 18:55:13.251742
424	32	416	2017-11-20 18:55:13.256911	2017-11-20 18:55:13.256911
425	32	417	2017-11-20 18:55:13.276954	2017-11-20 18:55:13.276954
426	32	418	2017-11-20 18:55:13.282435	2017-11-20 18:55:13.282435
427	32	419	2017-11-20 18:55:13.286889	2017-11-20 18:55:13.286889
428	32	420	2017-11-20 18:55:13.292494	2017-11-20 18:55:13.292494
429	32	421	2017-11-20 18:55:13.298424	2017-11-20 18:55:13.298424
430	32	422	2017-11-20 18:55:13.304078	2017-11-20 18:55:13.304078
431	32	423	2017-11-20 18:55:13.308578	2017-11-20 18:55:13.308578
432	32	424	2017-11-20 18:55:13.312698	2017-11-20 18:55:13.312698
433	33	425	2017-11-20 18:55:20.429832	2017-11-20 18:55:20.429832
434	33	426	2017-11-20 18:55:20.436891	2017-11-20 18:55:20.436891
435	33	427	2017-11-20 18:55:20.443574	2017-11-20 18:55:20.443574
436	33	428	2017-11-20 18:55:20.44939	2017-11-20 18:55:20.44939
437	33	429	2017-11-20 18:55:20.455156	2017-11-20 18:55:20.455156
438	33	430	2017-11-20 18:55:20.460855	2017-11-20 18:55:20.460855
439	33	431	2017-11-20 18:55:20.466623	2017-11-20 18:55:20.466623
440	33	432	2017-11-20 18:55:20.47245	2017-11-20 18:55:20.47245
441	33	433	2017-11-20 18:55:20.477928	2017-11-20 18:55:20.477928
442	33	434	2017-11-20 18:55:20.483609	2017-11-20 18:55:20.483609
443	33	435	2017-11-20 18:55:20.489672	2017-11-20 18:55:20.489672
444	33	436	2017-11-20 18:55:20.495306	2017-11-20 18:55:20.495306
445	33	437	2017-11-20 18:55:20.500753	2017-11-20 18:55:20.500753
446	33	438	2017-11-20 18:55:20.506137	2017-11-20 18:55:20.506137
447	33	439	2017-11-20 18:55:20.511891	2017-11-20 18:55:20.511891
448	34	440	2017-11-20 18:55:26.850085	2017-11-20 18:55:26.850085
449	34	441	2017-11-20 18:55:26.855911	2017-11-20 18:55:26.855911
450	34	442	2017-11-20 18:55:26.862142	2017-11-20 18:55:26.862142
451	34	443	2017-11-20 18:55:26.868869	2017-11-20 18:55:26.868869
452	34	444	2017-11-20 18:55:26.875198	2017-11-20 18:55:26.875198
453	34	445	2017-11-20 18:55:26.88154	2017-11-20 18:55:26.88154
454	34	446	2017-11-20 18:55:26.888274	2017-11-20 18:55:26.888274
455	34	447	2017-11-20 18:55:26.894655	2017-11-20 18:55:26.894655
456	34	448	2017-11-20 18:55:26.901185	2017-11-20 18:55:26.901185
457	34	449	2017-11-20 18:55:26.907355	2017-11-20 18:55:26.907355
458	34	450	2017-11-20 18:55:26.912412	2017-11-20 18:55:26.912412
459	34	451	2017-11-20 18:55:26.917609	2017-11-20 18:55:26.917609
460	34	452	2017-11-20 18:55:26.922866	2017-11-20 18:55:26.922866
461	34	453	2017-11-20 18:55:26.928415	2017-11-20 18:55:26.928415
462	34	454	2017-11-20 18:55:26.933613	2017-11-20 18:55:26.933613
463	35	455	2017-11-20 18:55:33.23441	2017-11-20 18:55:33.23441
464	35	456	2017-11-20 18:55:33.2412	2017-11-20 18:55:33.2412
465	35	457	2017-11-20 18:55:33.247857	2017-11-20 18:55:33.247857
466	35	458	2017-11-20 18:55:33.253929	2017-11-20 18:55:33.253929
467	35	459	2017-11-20 18:55:33.260068	2017-11-20 18:55:33.260068
468	35	460	2017-11-20 18:55:33.265903	2017-11-20 18:55:33.265903
469	35	461	2017-11-20 18:55:33.272645	2017-11-20 18:55:33.272645
470	35	462	2017-11-20 18:55:33.282238	2017-11-20 18:55:33.282238
471	35	463	2017-11-20 18:55:33.291607	2017-11-20 18:55:33.291607
472	35	464	2017-11-20 18:55:33.296717	2017-11-20 18:55:33.296717
473	35	465	2017-11-20 18:55:33.301644	2017-11-20 18:55:33.301644
474	35	466	2017-11-20 18:55:33.30688	2017-11-20 18:55:33.30688
475	36	467	2017-11-20 18:58:52.549119	2017-11-20 18:58:52.549119
476	36	468	2017-11-20 18:58:52.553496	2017-11-20 18:58:52.553496
477	36	469	2017-11-20 18:58:52.557595	2017-11-20 18:58:52.557595
478	36	470	2017-11-20 18:58:52.561423	2017-11-20 18:58:52.561423
479	36	471	2017-11-20 18:58:52.565767	2017-11-20 18:58:52.565767
480	36	472	2017-11-20 18:58:52.569655	2017-11-20 18:58:52.569655
481	36	473	2017-11-20 18:58:52.573942	2017-11-20 18:58:52.573942
482	36	474	2017-11-20 18:58:52.578873	2017-11-20 18:58:52.578873
483	36	475	2017-11-20 18:58:52.583127	2017-11-20 18:58:52.583127
484	36	476	2017-11-20 18:58:52.587991	2017-11-20 18:58:52.587991
485	36	477	2017-11-20 18:58:52.593525	2017-11-20 18:58:52.593525
486	36	478	2017-11-20 18:58:52.599711	2017-11-20 18:58:52.599711
487	36	479	2017-11-20 18:58:52.604279	2017-11-20 18:58:52.604279
488	36	480	2017-11-20 18:58:52.608611	2017-11-20 18:58:52.608611
489	36	481	2017-11-20 18:58:52.613083	2017-11-20 18:58:52.613083
490	36	482	2017-11-20 18:58:52.618004	2017-11-20 18:58:52.618004
491	36	483	2017-11-20 18:58:52.622572	2017-11-20 18:58:52.622572
492	36	484	2017-11-20 18:58:52.627477	2017-11-20 18:58:52.627477
493	36	485	2017-11-20 18:58:52.632581	2017-11-20 18:58:52.632581
494	36	486	2017-11-20 18:58:52.637112	2017-11-20 18:58:52.637112
495	36	487	2017-11-20 18:58:52.641706	2017-11-20 18:58:52.641706
496	36	488	2017-11-20 18:58:52.646465	2017-11-20 18:58:52.646465
497	36	489	2017-11-20 18:58:52.651487	2017-11-20 18:58:52.651487
498	36	490	2017-11-20 18:58:52.656585	2017-11-20 18:58:52.656585
499	36	491	2017-11-20 18:58:52.661461	2017-11-20 18:58:52.661461
500	37	492	2017-11-20 18:59:00.538174	2017-11-20 18:59:00.538174
501	37	493	2017-11-20 18:59:00.545162	2017-11-20 18:59:00.545162
502	37	494	2017-11-20 18:59:00.5667	2017-11-20 18:59:00.5667
503	37	495	2017-11-20 18:59:00.571689	2017-11-20 18:59:00.571689
504	37	496	2017-11-20 18:59:00.577037	2017-11-20 18:59:00.577037
505	37	497	2017-11-20 18:59:00.582401	2017-11-20 18:59:00.582401
506	37	498	2017-11-20 18:59:00.588015	2017-11-20 18:59:00.588015
507	37	499	2017-11-20 18:59:00.596571	2017-11-20 18:59:00.596571
508	37	500	2017-11-20 18:59:00.604338	2017-11-20 18:59:00.604338
509	37	501	2017-11-20 18:59:00.60942	2017-11-20 18:59:00.60942
510	37	502	2017-11-20 18:59:00.616473	2017-11-20 18:59:00.616473
511	37	503	2017-11-20 18:59:00.621859	2017-11-20 18:59:00.621859
512	38	504	2017-11-20 18:59:06.715381	2017-11-20 18:59:06.715381
513	38	505	2017-11-20 18:59:06.720911	2017-11-20 18:59:06.720911
514	38	506	2017-11-20 18:59:06.726856	2017-11-20 18:59:06.726856
515	38	507	2017-11-20 18:59:06.732498	2017-11-20 18:59:06.732498
516	38	508	2017-11-20 18:59:06.737782	2017-11-20 18:59:06.737782
517	38	509	2017-11-20 18:59:06.746379	2017-11-20 18:59:06.746379
518	38	510	2017-11-20 18:59:06.753901	2017-11-20 18:59:06.753901
519	38	511	2017-11-20 18:59:06.759615	2017-11-20 18:59:06.759615
520	38	512	2017-11-20 18:59:06.766265	2017-11-20 18:59:06.766265
521	38	513	2017-11-20 18:59:06.772662	2017-11-20 18:59:06.772662
522	38	514	2017-11-20 18:59:06.778462	2017-11-20 18:59:06.778462
523	38	515	2017-11-20 18:59:06.784166	2017-11-20 18:59:06.784166
524	38	516	2017-11-20 18:59:06.789847	2017-11-20 18:59:06.789847
525	38	517	2017-11-20 18:59:06.794472	2017-11-20 18:59:06.794472
526	39	518	2017-11-20 18:59:14.250681	2017-11-20 18:59:14.250681
527	39	519	2017-11-20 18:59:14.257509	2017-11-20 18:59:14.257509
528	39	520	2017-11-20 18:59:14.264074	2017-11-20 18:59:14.264074
529	39	521	2017-11-20 18:59:14.269804	2017-11-20 18:59:14.269804
530	39	522	2017-11-20 18:59:14.275398	2017-11-20 18:59:14.275398
531	39	523	2017-11-20 18:59:14.2809	2017-11-20 18:59:14.2809
532	39	524	2017-11-20 18:59:14.286434	2017-11-20 18:59:14.286434
533	39	525	2017-11-20 18:59:14.291851	2017-11-20 18:59:14.291851
534	39	526	2017-11-20 18:59:14.298142	2017-11-20 18:59:14.298142
535	39	527	2017-11-20 18:59:14.304916	2017-11-20 18:59:14.304916
536	39	528	2017-11-20 18:59:14.311921	2017-11-20 18:59:14.311921
537	39	529	2017-11-20 18:59:14.318575	2017-11-20 18:59:14.318575
538	39	530	2017-11-20 18:59:14.325268	2017-11-20 18:59:14.325268
539	39	531	2017-11-20 18:59:14.331988	2017-11-20 18:59:14.331988
540	39	532	2017-11-20 18:59:14.337597	2017-11-20 18:59:14.337597
541	39	533	2017-11-20 18:59:14.34305	2017-11-20 18:59:14.34305
542	39	534	2017-11-20 18:59:14.348446	2017-11-20 18:59:14.348446
543	39	535	2017-11-20 18:59:14.354177	2017-11-20 18:59:14.354177
544	39	536	2017-11-20 18:59:14.362426	2017-11-20 18:59:14.362426
545	39	537	2017-11-20 18:59:14.367033	2017-11-20 18:59:14.367033
546	39	538	2017-11-20 18:59:14.371432	2017-11-20 18:59:14.371432
547	39	539	2017-11-20 18:59:14.375925	2017-11-20 18:59:14.375925
548	39	540	2017-11-20 18:59:14.38043	2017-11-20 18:59:14.38043
549	39	541	2017-11-20 18:59:14.38479	2017-11-20 18:59:14.38479
550	39	542	2017-11-20 18:59:14.38917	2017-11-20 18:59:14.38917
551	39	543	2017-11-20 18:59:14.393819	2017-11-20 18:59:14.393819
552	39	544	2017-11-20 18:59:14.398408	2017-11-20 18:59:14.398408
553	39	545	2017-11-20 18:59:14.403563	2017-11-20 18:59:14.403563
554	39	546	2017-11-20 18:59:14.408223	2017-11-20 18:59:14.408223
555	39	547	2017-11-20 18:59:14.412831	2017-11-20 18:59:14.412831
556	39	548	2017-11-20 18:59:14.417427	2017-11-20 18:59:14.417427
557	39	549	2017-11-20 18:59:14.422394	2017-11-20 18:59:14.422394
558	39	550	2017-11-20 18:59:14.426822	2017-11-20 18:59:14.426822
559	39	551	2017-11-20 18:59:14.431273	2017-11-20 18:59:14.431273
560	39	552	2017-11-20 18:59:14.43576	2017-11-20 18:59:14.43576
561	39	553	2017-11-20 18:59:14.440618	2017-11-20 18:59:14.440618
562	39	554	2017-11-20 18:59:14.445181	2017-11-20 18:59:14.445181
563	39	555	2017-11-20 18:59:14.449774	2017-11-20 18:59:14.449774
564	39	556	2017-11-20 18:59:14.454233	2017-11-20 18:59:14.454233
565	39	557	2017-11-20 18:59:14.458838	2017-11-20 18:59:14.458838
566	39	558	2017-11-20 18:59:14.46336	2017-11-20 18:59:14.46336
567	39	559	2017-11-20 18:59:14.467986	2017-11-20 18:59:14.467986
568	39	560	2017-11-20 18:59:14.472522	2017-11-20 18:59:14.472522
569	39	561	2017-11-20 18:59:14.477006	2017-11-20 18:59:14.477006
570	39	562	2017-11-20 18:59:14.481857	2017-11-20 18:59:14.481857
571	39	563	2017-11-20 18:59:14.486847	2017-11-20 18:59:14.486847
572	39	564	2017-11-20 18:59:14.491306	2017-11-20 18:59:14.491306
573	39	565	2017-11-20 18:59:14.495422	2017-11-20 18:59:14.495422
574	39	566	2017-11-20 18:59:14.499532	2017-11-20 18:59:14.499532
575	39	567	2017-11-20 18:59:14.503746	2017-11-20 18:59:14.503746
576	40	568	2017-11-20 18:59:21.16601	2017-11-20 18:59:21.16601
577	40	569	2017-11-20 18:59:21.174869	2017-11-20 18:59:21.174869
578	40	570	2017-11-20 18:59:21.180845	2017-11-20 18:59:21.180845
579	40	571	2017-11-20 18:59:21.186153	2017-11-20 18:59:21.186153
580	40	572	2017-11-20 18:59:21.191315	2017-11-20 18:59:21.191315
581	40	573	2017-11-20 18:59:21.197837	2017-11-20 18:59:21.197837
582	40	574	2017-11-20 18:59:21.204875	2017-11-20 18:59:21.204875
583	40	575	2017-11-20 18:59:21.21186	2017-11-20 18:59:21.21186
584	40	576	2017-11-20 18:59:21.21755	2017-11-20 18:59:21.21755
585	40	577	2017-11-20 18:59:21.223891	2017-11-20 18:59:21.223891
586	40	578	2017-11-20 18:59:21.229463	2017-11-20 18:59:21.229463
587	40	579	2017-11-20 18:59:21.23537	2017-11-20 18:59:21.23537
588	40	580	2017-11-20 18:59:21.241012	2017-11-20 18:59:21.241012
589	40	581	2017-11-20 18:59:21.246479	2017-11-20 18:59:21.246479
590	40	582	2017-11-20 18:59:21.251966	2017-11-20 18:59:21.251966
591	40	583	2017-11-20 18:59:21.258173	2017-11-20 18:59:21.258173
592	40	584	2017-11-20 18:59:21.264979	2017-11-20 18:59:21.264979
593	40	585	2017-11-20 18:59:21.271948	2017-11-20 18:59:21.271948
594	40	586	2017-11-20 18:59:21.27865	2017-11-20 18:59:21.27865
595	40	587	2017-11-20 18:59:21.285999	2017-11-20 18:59:21.285999
596	40	588	2017-11-20 18:59:21.292528	2017-11-20 18:59:21.292528
597	40	589	2017-11-20 18:59:21.298101	2017-11-20 18:59:21.298101
598	40	590	2017-11-20 18:59:21.303878	2017-11-20 18:59:21.303878
599	40	591	2017-11-20 18:59:21.309518	2017-11-20 18:59:21.309518
600	40	592	2017-11-20 18:59:21.315512	2017-11-20 18:59:21.315512
601	40	593	2017-11-20 18:59:21.321084	2017-11-20 18:59:21.321084
602	40	594	2017-11-20 18:59:21.326849	2017-11-20 18:59:21.326849
603	40	595	2017-11-20 18:59:21.335111	2017-11-20 18:59:21.335111
604	40	596	2017-11-20 18:59:21.341096	2017-11-20 18:59:21.341096
605	40	597	2017-11-20 18:59:21.346116	2017-11-20 18:59:21.346116
606	40	598	2017-11-20 18:59:21.351709	2017-11-20 18:59:21.351709
607	40	599	2017-11-20 18:59:21.357321	2017-11-20 18:59:21.357321
608	40	600	2017-11-20 18:59:21.363027	2017-11-20 18:59:21.363027
609	40	601	2017-11-20 18:59:21.367789	2017-11-20 18:59:21.367789
610	40	602	2017-11-20 18:59:21.372256	2017-11-20 18:59:21.372256
611	40	603	2017-11-20 18:59:21.37696	2017-11-20 18:59:21.37696
612	40	604	2017-11-20 18:59:21.381341	2017-11-20 18:59:21.381341
613	40	605	2017-11-20 18:59:21.385841	2017-11-20 18:59:21.385841
614	40	606	2017-11-20 18:59:21.390459	2017-11-20 18:59:21.390459
615	41	607	2017-11-20 19:01:48.623352	2017-11-20 19:01:48.623352
616	41	608	2017-11-20 19:01:48.63094	2017-11-20 19:01:48.63094
617	41	609	2017-11-20 19:01:48.637397	2017-11-20 19:01:48.637397
618	41	610	2017-11-20 19:01:48.645095	2017-11-20 19:01:48.645095
619	41	611	2017-11-20 19:01:48.65172	2017-11-20 19:01:48.65172
620	41	612	2017-11-20 19:01:48.657656	2017-11-20 19:01:48.657656
621	41	613	2017-11-20 19:01:48.664435	2017-11-20 19:01:48.664435
622	41	614	2017-11-20 19:01:48.670105	2017-11-20 19:01:48.670105
623	41	615	2017-11-20 19:01:48.675832	2017-11-20 19:01:48.675832
624	41	616	2017-11-20 19:01:48.681574	2017-11-20 19:01:48.681574
625	41	617	2017-11-20 19:01:48.687257	2017-11-20 19:01:48.687257
626	42	618	2017-11-20 19:01:56.014645	2017-11-20 19:01:56.014645
627	42	619	2017-11-20 19:01:56.020105	2017-11-20 19:01:56.020105
628	42	620	2017-11-20 19:01:56.025347	2017-11-20 19:01:56.025347
629	42	621	2017-11-20 19:01:56.030189	2017-11-20 19:01:56.030189
630	42	622	2017-11-20 19:01:56.034733	2017-11-20 19:01:56.034733
631	42	623	2017-11-20 19:01:56.039388	2017-11-20 19:01:56.039388
632	42	624	2017-11-20 19:01:56.044071	2017-11-20 19:01:56.044071
633	42	625	2017-11-20 19:01:56.048866	2017-11-20 19:01:56.048866
634	42	626	2017-11-20 19:01:56.053713	2017-11-20 19:01:56.053713
635	43	627	2017-11-20 19:02:05.671729	2017-11-20 19:02:05.671729
636	43	628	2017-11-20 19:02:05.677109	2017-11-20 19:02:05.677109
637	43	629	2017-11-20 19:02:05.681752	2017-11-20 19:02:05.681752
638	43	630	2017-11-20 19:02:05.686395	2017-11-20 19:02:05.686395
639	43	631	2017-11-20 19:02:05.690787	2017-11-20 19:02:05.690787
640	43	632	2017-11-20 19:02:05.69512	2017-11-20 19:02:05.69512
641	43	633	2017-11-20 19:02:05.698693	2017-11-20 19:02:05.698693
642	43	634	2017-11-20 19:02:05.702852	2017-11-20 19:02:05.702852
643	43	635	2017-11-20 19:02:05.706637	2017-11-20 19:02:05.706637
644	44	636	2017-11-20 19:02:14.567469	2017-11-20 19:02:14.567469
645	44	637	2017-11-20 19:02:14.574489	2017-11-20 19:02:14.574489
646	44	638	2017-11-20 19:02:14.581686	2017-11-20 19:02:14.581686
647	44	639	2017-11-20 19:02:14.58931	2017-11-20 19:02:14.58931
648	44	640	2017-11-20 19:02:14.594091	2017-11-20 19:02:14.594091
649	44	641	2017-11-20 19:02:14.598191	2017-11-20 19:02:14.598191
650	44	642	2017-11-20 19:02:14.602296	2017-11-20 19:02:14.602296
651	44	643	2017-11-20 19:02:14.60736	2017-11-20 19:02:14.60736
652	44	644	2017-11-20 19:02:14.611859	2017-11-20 19:02:14.611859
653	44	645	2017-11-20 19:02:14.616225	2017-11-20 19:02:14.616225
654	44	646	2017-11-20 19:02:14.620539	2017-11-20 19:02:14.620539
655	44	647	2017-11-20 19:02:14.624904	2017-11-20 19:02:14.624904
656	44	648	2017-11-20 19:02:14.629327	2017-11-20 19:02:14.629327
657	44	649	2017-11-20 19:02:14.63363	2017-11-20 19:02:14.63363
658	44	650	2017-11-20 19:02:14.638491	2017-11-20 19:02:14.638491
659	44	651	2017-11-20 19:02:14.642972	2017-11-20 19:02:14.642972
660	44	652	2017-11-20 19:02:14.647884	2017-11-20 19:02:14.647884
661	44	653	2017-11-20 19:02:14.652453	2017-11-20 19:02:14.652453
662	44	654	2017-11-20 19:02:14.656972	2017-11-20 19:02:14.656972
663	45	655	2017-11-20 19:02:20.804581	2017-11-20 19:02:20.804581
664	45	656	2017-11-20 19:02:20.810201	2017-11-20 19:02:20.810201
665	45	657	2017-11-20 19:02:20.816095	2017-11-20 19:02:20.816095
666	45	658	2017-11-20 19:02:20.821715	2017-11-20 19:02:20.821715
667	45	659	2017-11-20 19:02:20.827652	2017-11-20 19:02:20.827652
668	45	660	2017-11-20 19:02:20.833496	2017-11-20 19:02:20.833496
669	45	661	2017-11-20 19:02:20.838997	2017-11-20 19:02:20.838997
670	45	662	2017-11-20 19:02:20.844607	2017-11-20 19:02:20.844607
671	45	663	2017-11-20 19:02:20.849947	2017-11-20 19:02:20.849947
672	45	664	2017-11-20 19:02:20.855336	2017-11-20 19:02:20.855336
673	46	665	2017-11-20 19:10:06.872432	2017-11-20 19:10:06.872432
674	46	666	2017-11-20 19:10:06.878262	2017-11-20 19:10:06.878262
675	46	667	2017-11-20 19:10:06.883421	2017-11-20 19:10:06.883421
676	46	668	2017-11-20 19:10:06.888839	2017-11-20 19:10:06.888839
677	46	669	2017-11-20 19:10:06.894162	2017-11-20 19:10:06.894162
678	46	670	2017-11-20 19:10:06.899618	2017-11-20 19:10:06.899618
679	46	671	2017-11-20 19:10:06.905756	2017-11-20 19:10:06.905756
680	46	672	2017-11-20 19:10:06.912555	2017-11-20 19:10:06.912555
681	46	673	2017-11-20 19:10:06.919647	2017-11-20 19:10:06.919647
682	46	674	2017-11-20 19:10:06.925846	2017-11-20 19:10:06.925846
683	46	675	2017-11-20 19:10:06.93162	2017-11-20 19:10:06.93162
684	46	676	2017-11-20 19:10:06.937308	2017-11-20 19:10:06.937308
685	46	677	2017-11-20 19:10:06.944247	2017-11-20 19:10:06.944247
686	47	678	2017-11-20 19:10:12.79309	2017-11-20 19:10:12.79309
687	47	679	2017-11-20 19:10:12.797992	2017-11-20 19:10:12.797992
688	47	680	2017-11-20 19:10:12.802856	2017-11-20 19:10:12.802856
689	47	681	2017-11-20 19:10:12.80775	2017-11-20 19:10:12.80775
690	47	682	2017-11-20 19:10:12.812774	2017-11-20 19:10:12.812774
691	47	683	2017-11-20 19:10:12.8176	2017-11-20 19:10:12.8176
692	47	684	2017-11-20 19:10:12.822603	2017-11-20 19:10:12.822603
693	47	685	2017-11-20 19:10:12.827091	2017-11-20 19:10:12.827091
694	47	686	2017-11-20 19:10:12.831638	2017-11-20 19:10:12.831638
695	47	687	2017-11-20 19:10:12.836539	2017-11-20 19:10:12.836539
696	48	688	2017-11-20 19:16:41.743485	2017-11-20 19:16:41.743485
697	48	689	2017-11-20 19:16:41.748261	2017-11-20 19:16:41.748261
698	48	690	2017-11-20 19:16:41.753025	2017-11-20 19:16:41.753025
699	48	691	2017-11-20 19:16:41.757817	2017-11-20 19:16:41.757817
700	48	692	2017-11-20 19:16:41.762526	2017-11-20 19:16:41.762526
701	48	693	2017-11-20 19:16:41.766918	2017-11-20 19:16:41.766918
702	48	694	2017-11-20 19:16:41.771416	2017-11-20 19:16:41.771416
703	48	695	2017-11-20 19:16:41.775717	2017-11-20 19:16:41.775717
704	49	696	2017-11-20 19:16:47.395882	2017-11-20 19:16:47.395882
705	49	697	2017-11-20 19:16:47.400604	2017-11-20 19:16:47.400604
706	49	698	2017-11-20 19:16:47.405239	2017-11-20 19:16:47.405239
707	49	699	2017-11-20 19:16:47.40971	2017-11-20 19:16:47.40971
708	49	700	2017-11-20 19:16:47.414213	2017-11-20 19:16:47.414213
709	49	701	2017-11-20 19:16:47.418826	2017-11-20 19:16:47.418826
710	49	702	2017-11-20 19:16:47.423857	2017-11-20 19:16:47.423857
711	49	703	2017-11-20 19:16:47.428301	2017-11-20 19:16:47.428301
712	49	704	2017-11-20 19:16:47.432613	2017-11-20 19:16:47.432613
713	49	705	2017-11-20 19:16:47.438392	2017-11-20 19:16:47.438392
714	49	706	2017-11-20 19:16:47.444196	2017-11-20 19:16:47.444196
715	49	707	2017-11-20 19:16:47.450001	2017-11-20 19:16:47.450001
716	49	708	2017-11-20 19:16:47.455405	2017-11-20 19:16:47.455405
717	49	709	2017-11-20 19:16:47.460906	2017-11-20 19:16:47.460906
718	49	710	2017-11-20 19:16:47.467034	2017-11-20 19:16:47.467034
719	49	711	2017-11-20 19:16:47.473613	2017-11-20 19:16:47.473613
720	49	712	2017-11-20 19:16:47.480373	2017-11-20 19:16:47.480373
721	49	713	2017-11-20 19:16:47.487313	2017-11-20 19:16:47.487313
722	49	714	2017-11-20 19:16:47.493275	2017-11-20 19:16:47.493275
723	49	715	2017-11-20 19:16:47.499865	2017-11-20 19:16:47.499865
724	49	716	2017-11-20 19:16:47.507707	2017-11-20 19:16:47.507707
725	49	717	2017-11-20 19:16:47.513737	2017-11-20 19:16:47.513737
726	49	718	2017-11-20 19:16:47.519887	2017-11-20 19:16:47.519887
727	49	719	2017-11-20 19:16:47.525688	2017-11-20 19:16:47.525688
728	49	720	2017-11-20 19:16:47.531977	2017-11-20 19:16:47.531977
729	49	721	2017-11-20 19:16:47.53791	2017-11-20 19:16:47.53791
730	49	722	2017-11-20 19:16:47.543526	2017-11-20 19:16:47.543526
731	49	723	2017-11-20 19:16:47.548728	2017-11-20 19:16:47.548728
732	49	724	2017-11-20 19:16:47.554254	2017-11-20 19:16:47.554254
733	49	725	2017-11-20 19:16:47.559573	2017-11-20 19:16:47.559573
734	49	726	2017-11-20 19:16:47.564886	2017-11-20 19:16:47.564886
735	49	727	2017-11-20 19:16:47.570707	2017-11-20 19:16:47.570707
736	49	728	2017-11-20 19:16:47.576263	2017-11-20 19:16:47.576263
737	49	729	2017-11-20 19:16:47.581647	2017-11-20 19:16:47.581647
738	49	730	2017-11-20 19:16:47.586051	2017-11-20 19:16:47.586051
739	50	731	2017-11-20 19:16:53.435148	2017-11-20 19:16:53.435148
740	50	732	2017-11-20 19:16:53.441163	2017-11-20 19:16:53.441163
741	50	733	2017-11-20 19:16:53.446886	2017-11-20 19:16:53.446886
742	50	734	2017-11-20 19:16:53.45299	2017-11-20 19:16:53.45299
743	50	735	2017-11-20 19:16:53.458859	2017-11-20 19:16:53.458859
744	50	736	2017-11-20 19:16:53.465546	2017-11-20 19:16:53.465546
745	50	737	2017-11-20 19:16:53.47131	2017-11-20 19:16:53.47131
746	50	738	2017-11-20 19:16:53.477412	2017-11-20 19:16:53.477412
747	50	739	2017-11-20 19:16:53.48327	2017-11-20 19:16:53.48327
748	50	740	2017-11-20 19:16:53.489074	2017-11-20 19:16:53.489074
749	50	741	2017-11-20 19:16:53.495322	2017-11-20 19:16:53.495322
750	50	742	2017-11-20 19:16:53.501653	2017-11-20 19:16:53.501653
751	50	743	2017-11-20 19:16:53.507473	2017-11-20 19:16:53.507473
752	50	744	2017-11-20 19:16:53.513662	2017-11-20 19:16:53.513662
753	50	745	2017-11-20 19:16:53.519714	2017-11-20 19:16:53.519714
754	51	746	2017-11-20 19:16:59.405345	2017-11-20 19:16:59.405345
755	51	747	2017-11-20 19:16:59.410074	2017-11-20 19:16:59.410074
756	51	748	2017-11-20 19:16:59.416133	2017-11-20 19:16:59.416133
757	51	749	2017-11-20 19:16:59.421824	2017-11-20 19:16:59.421824
758	51	750	2017-11-20 19:16:59.428241	2017-11-20 19:16:59.428241
759	51	751	2017-11-20 19:16:59.435252	2017-11-20 19:16:59.435252
760	51	752	2017-11-20 19:16:59.441508	2017-11-20 19:16:59.441508
761	51	753	2017-11-20 19:16:59.44648	2017-11-20 19:16:59.44648
762	51	754	2017-11-20 19:16:59.453592	2017-11-20 19:16:59.453592
763	51	755	2017-11-20 19:16:59.460873	2017-11-20 19:16:59.460873
764	51	756	2017-11-20 19:16:59.467561	2017-11-20 19:16:59.467561
765	51	757	2017-11-20 19:16:59.474428	2017-11-20 19:16:59.474428
766	51	758	2017-11-20 19:16:59.480593	2017-11-20 19:16:59.480593
767	51	759	2017-11-20 19:16:59.48595	2017-11-20 19:16:59.48595
768	51	760	2017-11-20 19:16:59.492515	2017-11-20 19:16:59.492515
769	51	761	2017-11-20 19:16:59.498162	2017-11-20 19:16:59.498162
770	51	762	2017-11-20 19:16:59.503824	2017-11-20 19:16:59.503824
771	51	763	2017-11-20 19:16:59.51166	2017-11-20 19:16:59.51166
772	51	764	2017-11-20 19:16:59.516629	2017-11-20 19:16:59.516629
773	51	765	2017-11-20 19:16:59.52158	2017-11-20 19:16:59.52158
774	51	766	2017-11-20 19:16:59.526331	2017-11-20 19:16:59.526331
775	51	767	2017-11-20 19:16:59.531701	2017-11-20 19:16:59.531701
776	51	768	2017-11-20 19:16:59.537957	2017-11-20 19:16:59.537957
777	51	769	2017-11-20 19:16:59.545073	2017-11-20 19:16:59.545073
778	51	770	2017-11-20 19:16:59.551656	2017-11-20 19:16:59.551656
779	51	771	2017-11-20 19:16:59.55658	2017-11-20 19:16:59.55658
780	51	772	2017-11-20 19:16:59.562733	2017-11-20 19:16:59.562733
781	51	773	2017-11-20 19:16:59.569381	2017-11-20 19:16:59.569381
782	52	774	2017-11-20 19:17:05.912525	2017-11-20 19:17:05.912525
783	52	775	2017-11-20 19:17:05.91912	2017-11-20 19:17:05.91912
784	52	776	2017-11-20 19:17:05.924361	2017-11-20 19:17:05.924361
785	52	777	2017-11-20 19:17:05.929706	2017-11-20 19:17:05.929706
786	52	778	2017-11-20 19:17:05.934927	2017-11-20 19:17:05.934927
787	52	779	2017-11-20 19:17:05.940379	2017-11-20 19:17:05.940379
788	52	780	2017-11-20 19:17:05.945762	2017-11-20 19:17:05.945762
789	52	781	2017-11-20 19:17:05.951121	2017-11-20 19:17:05.951121
790	52	782	2017-11-20 19:17:05.957366	2017-11-20 19:17:05.957366
791	52	783	2017-11-20 19:17:05.963947	2017-11-20 19:17:05.963947
792	52	784	2017-11-20 19:17:05.970416	2017-11-20 19:17:05.970416
793	52	785	2017-11-20 19:17:05.976518	2017-11-20 19:17:05.976518
794	52	786	2017-11-20 19:17:05.981738	2017-11-20 19:17:05.981738
795	52	787	2017-11-20 19:17:05.987015	2017-11-20 19:17:05.987015
796	52	788	2017-11-20 19:17:05.99295	2017-11-20 19:17:05.99295
797	52	789	2017-11-20 19:17:05.999481	2017-11-20 19:17:05.999481
798	52	790	2017-11-20 19:17:06.0059	2017-11-20 19:17:06.0059
799	52	791	2017-11-20 19:17:06.011453	2017-11-20 19:17:06.011453
800	52	792	2017-11-20 19:17:06.016971	2017-11-20 19:17:06.016971
801	52	793	2017-11-20 19:17:06.02265	2017-11-20 19:17:06.02265
802	52	794	2017-11-20 19:17:06.029425	2017-11-20 19:17:06.029425
803	52	795	2017-11-20 19:17:06.035033	2017-11-20 19:17:06.035033
804	52	796	2017-11-20 19:17:06.040278	2017-11-20 19:17:06.040278
805	52	797	2017-11-20 19:17:06.044384	2017-11-20 19:17:06.044384
806	52	798	2017-11-20 19:17:06.048227	2017-11-20 19:17:06.048227
807	52	799	2017-11-20 19:17:06.052269	2017-11-20 19:17:06.052269
808	52	800	2017-11-20 19:17:06.056327	2017-11-20 19:17:06.056327
809	52	801	2017-11-20 19:17:06.060582	2017-11-20 19:17:06.060582
810	52	802	2017-11-20 19:17:06.064705	2017-11-20 19:17:06.064705
811	52	803	2017-11-20 19:17:06.068839	2017-11-20 19:17:06.068839
812	52	804	2017-11-20 19:17:06.072903	2017-11-20 19:17:06.072903
813	52	805	2017-11-20 19:17:06.080072	2017-11-20 19:17:06.080072
814	52	806	2017-11-20 19:17:06.08796	2017-11-20 19:17:06.08796
815	52	807	2017-11-20 19:17:06.091909	2017-11-20 19:17:06.091909
816	52	808	2017-11-20 19:17:06.097472	2017-11-20 19:17:06.097472
817	52	809	2017-11-20 19:17:06.104003	2017-11-20 19:17:06.104003
818	52	810	2017-11-20 19:17:06.109506	2017-11-20 19:17:06.109506
819	52	811	2017-11-20 19:17:06.114853	2017-11-20 19:17:06.114853
820	52	812	2017-11-20 19:17:06.11928	2017-11-20 19:17:06.11928
821	52	813	2017-11-20 19:17:06.123307	2017-11-20 19:17:06.123307
822	52	814	2017-11-20 19:17:06.127933	2017-11-20 19:17:06.127933
823	52	815	2017-11-20 19:17:06.140205	2017-11-20 19:17:06.140205
824	52	816	2017-11-20 19:17:06.144496	2017-11-20 19:17:06.144496
825	52	817	2017-11-20 19:17:06.150324	2017-11-20 19:17:06.150324
826	52	818	2017-11-20 19:17:06.156522	2017-11-20 19:17:06.156522
827	52	819	2017-11-20 19:17:06.161618	2017-11-20 19:17:06.161618
828	52	820	2017-11-20 19:17:06.166118	2017-11-20 19:17:06.166118
829	52	821	2017-11-20 19:17:06.170138	2017-11-20 19:17:06.170138
830	52	822	2017-11-20 19:17:06.174025	2017-11-20 19:17:06.174025
831	52	823	2017-11-20 19:17:06.178034	2017-11-20 19:17:06.178034
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gdev
--

SELECT pg_catalog.setval('tracks_id_seq', 831, true);


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

