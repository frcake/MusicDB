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
-- Name: friendships; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE friendships (
    id bigint NOT NULL,
    user_id integer,
    friend_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE friendships OWNER TO frcake;

--
-- Name: friendships_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE friendships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friendships_id_seq OWNER TO frcake;

--
-- Name: friendships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE friendships_id_seq OWNED BY friendships.id;


--
-- Name: mailboxer_conversation_opt_outs; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_conversation_opt_outs (
    id integer NOT NULL,
    unsubscriber_type character varying,
    unsubscriber_id integer,
    conversation_id integer
);


ALTER TABLE mailboxer_conversation_opt_outs OWNER TO frcake;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_conversation_opt_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_conversation_opt_outs_id_seq OWNER TO frcake;

--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_conversation_opt_outs_id_seq OWNED BY mailboxer_conversation_opt_outs.id;


--
-- Name: mailboxer_conversations; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_conversations (
    id integer NOT NULL,
    subject character varying DEFAULT ''::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE mailboxer_conversations OWNER TO frcake;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_conversations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_conversations_id_seq OWNER TO frcake;

--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_conversations_id_seq OWNED BY mailboxer_conversations.id;


--
-- Name: mailboxer_notifications; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_notifications (
    id integer NOT NULL,
    type character varying,
    body text,
    subject character varying DEFAULT ''::character varying,
    sender_type character varying,
    sender_id integer,
    conversation_id integer,
    draft boolean DEFAULT false,
    notification_code character varying,
    notified_object_type character varying,
    notified_object_id integer,
    attachment character varying,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    global boolean DEFAULT false,
    expires timestamp without time zone
);


ALTER TABLE mailboxer_notifications OWNER TO frcake;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_notifications_id_seq OWNER TO frcake;

--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_notifications_id_seq OWNED BY mailboxer_notifications.id;


--
-- Name: mailboxer_receipts; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE mailboxer_receipts (
    id integer NOT NULL,
    receiver_type character varying,
    receiver_id integer,
    notification_id integer NOT NULL,
    is_read boolean DEFAULT false,
    trashed boolean DEFAULT false,
    deleted boolean DEFAULT false,
    mailbox_type character varying(25),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_delivered boolean DEFAULT false,
    delivery_method character varying,
    message_id character varying
);


ALTER TABLE mailboxer_receipts OWNER TO frcake;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE mailboxer_receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mailboxer_receipts_id_seq OWNER TO frcake;

--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE mailboxer_receipts_id_seq OWNED BY mailboxer_receipts.id;


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
-- Name: record_libraries; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE record_libraries (
    id bigint NOT NULL,
    user_id bigint,
    album_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE record_libraries OWNER TO frcake;

--
-- Name: record_libraries_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE record_libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE record_libraries_id_seq OWNER TO frcake;

--
-- Name: record_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE record_libraries_id_seq OWNED BY record_libraries.id;


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
-- Name: user_vectors; Type: TABLE; Schema: public; Owner: frcake
--

CREATE TABLE user_vectors (
    id bigint NOT NULL,
    user_id bigint,
    dimensions character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    metal integer DEFAULT 0,
    country integer DEFAULT 0,
    classical integer DEFAULT 0,
    jazz integer DEFAULT 0,
    reggae integer DEFAULT 0,
    blues integer DEFAULT 0,
    pop integer DEFAULT 0,
    instrumental integer DEFAULT 0,
    vocal integer DEFAULT 0,
    electronica integer DEFAULT 0,
    techno integer DEFAULT 0,
    punk integer DEFAULT 0,
    drum_n_bass integer DEFAULT 0,
    indie integer DEFAULT 0,
    alternative integer DEFAULT 0,
    dubstep integer DEFAULT 0,
    rock integer DEFAULT 0,
    hip_hop integer DEFAULT 0,
    dance integer DEFAULT 0,
    rnb integer DEFAULT 0
);


ALTER TABLE user_vectors OWNER TO frcake;

--
-- Name: user_vectors_id_seq; Type: SEQUENCE; Schema: public; Owner: frcake
--

CREATE SEQUENCE user_vectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_vectors_id_seq OWNER TO frcake;

--
-- Name: user_vectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: frcake
--

ALTER SEQUENCE user_vectors_id_seq OWNED BY user_vectors.id;


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

ALTER TABLE ONLY friendships ALTER COLUMN id SET DEFAULT nextval('friendships_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversation_opt_outs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversations ALTER COLUMN id SET DEFAULT nextval('mailboxer_conversations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications ALTER COLUMN id SET DEFAULT nextval('mailboxer_notifications_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts ALTER COLUMN id SET DEFAULT nextval('mailboxer_receipts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos ALTER COLUMN id SET DEFAULT nextval('photos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY record_libraries ALTER COLUMN id SET DEFAULT nextval('record_libraries_id_seq'::regclass);


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

ALTER TABLE ONLY user_vectors ALTER COLUMN id SET DEFAULT nextval('user_vectors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: frcake
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
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('albums_id_seq', 83, true);


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
21	\N		2017-11-23 18:54:14.407298	2017-11-25 23:34:38.089064	14	Beloyd Taylor
22	\N	Saxophone Player	2017-11-23 18:54:14.411239	2017-11-25 23:35:35.089399	14	Chester Washington
23	\N		2017-11-23 18:54:14.415494	2017-11-25 23:37:18.085234	14	David Whitworth
24	\N	Soul - funk songwriter	2017-11-23 18:54:14.420264	2017-11-25 23:37:25.084128	14	Don Whitehead
26	\N	Mastering Engineer at [l269983].\r\nPreviously worked at [url=http://www.discogs.com/label/120735-masterpiece]Masterpiece[/url].	2017-11-23 18:54:14.429934	2017-11-25 23:39:17.083573	14	Greg Moore
28	\N	Bassist	2017-11-23 18:54:14.436392	2017-11-25 23:39:31.091925	14	John Paris
33	\N		2017-11-23 18:54:14.449745	2017-11-25 23:40:05.08632	14	Michael Beal
34	\N	Guitarist	2017-11-23 18:54:14.452464	2017-11-25 23:40:11.088248	14	Morris O'Connor
35	\N	American composer, producer, multi-instrumentalist	2017-11-23 18:54:14.455093	2017-11-25 23:40:18.085738	14	Morris Pleasure
36	\N		2017-11-23 18:54:14.457653	2017-11-25 23:40:25.117751	14	Myron McKinley
38	\N		2017-11-23 18:54:14.463664	2017-11-25 23:40:39.086575	14	Philip Doron Bailey
39	\N	Soul - funk drummer - songwriter - producer\r\nPlease, do not confuse with [a=Mystique (10)] and [a=Impressions] lead singer, [b][a=Ralph Johnson (4)][/b]	2017-11-23 18:54:14.466458	2017-11-25 23:40:46.081103	14	Ralph Johnson
42	\N	Born: October 3rd, 1950, Houston, Texas (USA) \r\nSaxophonist, younger brother of [a=Hubert Laws]. His sisters [a=Eloise Laws] & [a=Debra Laws] also have successful careers as vocalists in the music industry.	2017-11-23 18:54:14.474931	2017-11-25 23:41:07.11723	14	Ronnie Laws
43	\N	Soul - funk guitarist - singer	2017-11-23 18:54:14.477842	2017-11-25 23:41:14.087964	14	Sheldon Reynolds
44	\N	Female vocalist.	2017-11-23 18:54:14.481089	2017-11-25 23:41:21.087945	14	Sherry Scott
47	\N	American soul singer. Born in Coffeyville, Kansas on September 25, 1940. Died in in Battle Creek, Michigan from cancer on October 13, 1993.	2017-11-23 18:54:14.489417	2017-11-25 23:41:41.087032	14	Wade Flemons
49	\N	Percussionist.	2017-11-23 18:54:14.494634	2017-11-25 23:41:56.103323	14	Yackov Ben Israel
52	\N	Harvey Mason (born February 22, 1947, Atlantic City, New Jersey, USA) is an American soul, jazz and disco drummer, songwriter and producer. Father of musician and producer [a=Harvey Mason Jr.].\r\n	2017-11-23 18:54:26.361354	2017-11-25 23:42:17.096713	14	Harvey Mason
57	\N	Recording artist, producer, and engineer. \r\n\r\nSon of [a=Jean-Paul Maunick] (of [a=Incognito] fame). \r\n	2017-11-23 18:54:37.358517	2017-11-25 23:42:52.094125	14	Daniel Maunick
58	\N	Session trumpeter from London (UK) who is working for Vinylizor Productions.	2017-11-23 18:54:37.362616	2017-11-25 23:42:59.084628	14	Dominic Glover
59	\N	Keyboardist - songwriter - producer	2017-11-23 18:54:37.36672	2017-11-25 23:43:06.099088	14	Dominic Oakenfull
61	\N	Italian drummer, based in London	2017-11-23 18:54:37.37566	2017-11-25 23:43:20.081006	14	Francesco Mendolia
62	\N	Bass player.	2017-11-23 18:54:37.380489	2017-11-25 23:43:27.081175	14	Francis Hylton
63	\N	Acoustic/folk/jazz guitarist from Portugal	2017-11-23 18:54:37.385282	2017-11-25 23:43:34.095344	14	Francisco Sales
64	\N		2017-11-23 18:54:37.389315	2017-11-25 23:43:41.081938	14	Gee Bello
67	\N	British Cellist and bandleader of Celloman.	2017-11-23 18:54:37.398429	2017-11-25 23:44:02.085185	14	Ivan Hussey
68	\N	British saxophonist	2017-11-23 18:54:37.401294	2017-11-25 23:44:10.092191	14	Jamie Anderson (2)
70	\N	Percussionist, born and raised in Macao, China, now based in London	2017-11-23 18:54:37.407248	2017-11-25 23:44:24.075692	14	João Caetano (3)
72	\N		2017-11-23 18:54:37.41291	2017-11-25 23:44:38.079844	14	Joy Malcolm
73	\N		2017-11-23 18:54:37.41584	2017-11-25 23:44:45.078894	14	Joy Rose
74	\N	British bassist	2017-11-23 18:54:37.419046	2017-11-25 23:44:52.089302	14	Julian Crampton
75	\N		2017-11-23 18:54:37.422313	2017-11-25 23:44:59.089259	14	Katie Leone
76	\N		2017-11-23 18:54:37.425562	2017-11-25 23:45:06.083114	14	Kelli Sae
78	\N		2017-11-23 18:54:37.431133	2017-11-25 23:45:23.085385	14	Linda Muriel
79	\N		2017-11-23 18:54:37.433502	2017-11-25 23:45:30.087873	14	Mark Anthoni
80	\N	British jazz-funk keyboardist, musical director of Incognito London	2017-11-23 18:54:37.436123	2017-11-25 23:45:37.103807	14	Matt Cooper
82	\N	Born: August 17, 1966, Baltimore, Maryland.	2017-11-23 18:54:37.441712	2017-11-25 23:45:51.08265	14	Maysa Leak
83	\N	British singer and songwriter	2017-11-23 18:54:37.445478	2017-11-25 23:45:58.092024	14	Mo Brandis
86	\N	Saxophonist	2017-11-23 18:54:37.454564	2017-11-25 23:46:19.071158	14	Patrick Clahar
89	\N	British flutist.	2017-11-23 18:54:37.464342	2017-11-25 23:46:40.090393	14	Paul Greenwood
90	\N	British Drummer, Bassist, Musical Director and Producer. Recording and touring with [a=Incognito], [a=Level 42], [a=Raiyn] and PB Underground	2017-11-23 18:54:37.466952	2017-11-25 23:46:46.162826	14	Pete Biggin
91	\N	Peter Hinds, keyboard player, sometimes credited as Peter 'Stepper' Hinds.	2017-11-23 18:54:37.469528	2017-11-25 23:46:53.084432	14	Peter Hinds
93	\N	Saxophone player, son of [a1215297]\r\n\r\nOnce described as one of the London jazz scene’s best-kept secrets, Ray Carless is a tenor soprano saxophonist who has been creating groovy, melodic music with the great and the good for four decades.\r\nHe was part of the original ‘Brit funk’ movement and a founding member of London’s best jazz funk outfit Incognito. He has also played with most of the other bands on the Brit Funk scene such as Hi-Tension, Central Line, Linx and Light of The World.\r\nRay scored a chart hit with his single Tarantula Walk before moving on to become a founding member of the Jazz Warriors, the all black Big Band that launched the careers of many such as Courtney Pine (OBE), Gary Crosby (MBE) of Jazz Jamaica, Roland Sutherland, Jason Yarde, Steve Williamson, Cleveland Watkiss, Julian Joseph and Orphy Robinson.\r\nHe has made creative contributions to and worked with local and International artists like Elvin Jones, Hugh Masakela, Billy Ocean, Loose Ends, ABC, Five Star, Tippa Irie, Will Downing, Jocelyn Brown, Skatalites, Big Youth, Bob Andy, Luciano, the late and greats John Holt, Alton Ellis, Gregory Isaacs, Jean Adebambo, Louisa Marks, and most recently Grammy smasher Adele.\r\nRay has also worked with artists including Black Roots, Beris Hammond, The Heptones, Aswad, Black Slate, Beggar & Co, Jazz Jamaica, The Skatallites, Delroy Pinnock, Lloyd Brown, Michael Gordon, Patrick Augustus’ Elements Band, Cleveland Watkiss, Janet Kay, Caroll Thompson, Beverley Skeet, Alan Weekes, Ska Cubano, The Heliocentrics, Mica Paris, Jennifer Phillips, Immani, Janet Kay, Chris Tummings & Victor Romero Evans, Heather Haywood, Joy Rose, Ava Golding, The Engine Room Collective, Rico Rodriguez, Skatallites trombonist Vin Gordon, Shireen Francis, Siemy Di, vibesman Orphy Robinson and Afrikan Revolution.\r\nRay was invited to join Cymande and has become an integral band member. He recently summed up his move from pure Jazz to multi-genre music: “These days I need lots of variety in my music and I know that I will always retain my strong jazzy flavour. I love my jazz but I’m happiest when I’m able to express myself utilizing the various African Caribbean flavours that I’ve grown up with.”\r\n\r\nPerformed with the [a=Redskins] as part of the Redskins Brass.\r\n	2017-11-23 18:54:37.47526	2017-11-25 23:47:07.075192	14	Ray Carless
95	\N		2017-11-23 18:54:37.481344	2017-11-25 23:47:21.079662	14	Richard Bull
96	\N	British drummer from London.	2017-11-23 18:54:37.485188	2017-11-25 23:47:28.083783	14	Richard Spaven
97	\N	Trumpeter.	2017-11-23 18:54:37.488956	2017-11-25 23:47:35.083734	14	Sid Gauld
99	\N	Danish / Nigerian percussionist, born in Copenhagen, Denmark.	2017-11-23 18:54:37.496508	2017-11-25 23:47:49.095377	14	Thomas Dyani
100	\N	Born April 28, 1973 // British R&B singer and lead vocalist of the band Incognito.	2017-11-23 18:54:37.500267	2017-11-25 23:47:56.087807	14	Tony Momrelle
102	\N	British trombonist.	2017-11-23 18:54:37.509401	2017-11-25 23:48:10.0795	14	Trevor Mires
103	\N	Soul and funk singer from London.	2017-11-23 18:54:37.513499	2017-11-25 23:48:17.074041	14	Vanessa Haynes
106	\N		2017-11-23 18:54:49.362359	2017-11-25 23:48:38.093743	14	Dane Alderson
107	\N	Bassist, son of bass legend [a=Jaco Pastorius].	2017-11-23 18:54:49.366367	2017-11-25 23:48:45.075976	14	Felix Pastorius
109	\N	Saxophonist.	2017-11-23 18:54:49.374968	2017-11-25 23:49:00.085935	14	Marc Russo
110	\N	US jazz drummer.	2017-11-23 18:54:49.379326	2017-11-25 23:49:07.086147	14	Marcus Baylor
112	\N	Jazz pianist, born in 1952, San Jose, California.\r\n	2017-11-23 18:54:49.388563	2017-11-25 23:49:21.085178	14	Russell Ferrante
113	\N	Drummer.	2017-11-23 18:54:49.393581	2017-11-25 23:49:28.076271	14	William Kennedy
114	\N	Ex-Bass/Vocals with Pieces Of A Dream (1975-2001).	2017-11-23 18:55:00.360044	2017-11-25 23:49:36.078361	14	Cedric A. Napoleon
117	\N		2017-11-23 18:55:00.371211	2017-11-25 23:49:57.09746	14	Norwood
118	\N	Lead singer with [a=Pieces Of A Dream] since 2001. Released her first solo album, "Seasons" in 2005.	2017-11-23 18:55:00.375154	2017-11-25 23:50:04.079562	14	Tracy Hamlin
121	\N	James Alan Hetfield (born August 3, 1963 in Downey, Los Angeles County, California) is the lead vocalist, rhythm guitarist, co-founder and main songwriter in the American heavy metal band [a=Metallica].	2017-11-23 18:55:29.388975	2017-11-25 23:50:25.076852	8	James Hetfield
518	\N	American rock musician, multi-instrumentalist, singer, and songwriter. \r\n\r\nHe was born 14 January 1969 in Warren, Ohio, USA.\r\n\r\nDave also runs his own record label called [l=Roswell Records].	2017-11-23 19:25:15.520316	2017-11-26 00:37:23.091912	25	Dave Grohl
127	\N	American bassist most notable for being [a=Metallica]'s first bass player. Born 2 November 1962 in Los Angeles, California.	2017-11-23 18:55:29.416566	2017-11-25 23:51:33.085589	8	Ron McGovney
129	\N	English drummer, born 7 December 1954 in England, UK.	2017-11-23 18:55:40.434143	2017-11-25 23:51:47.092194	8	Barry Graham (2)
131	\N		2017-11-23 18:55:40.440295	2017-11-25 23:52:01.084659	8	Bob Sawyer (3)
135	\N	English guitarist and vocalist, born 9 October 1952 in Canning Town, East London, England, UK.	2017-11-23 18:55:40.451215	2017-11-25 23:52:29.084526	8	Dennis Stratton
136	\N		2017-11-23 18:55:40.454541	2017-11-25 23:52:36.081217	8	Dennis Willcock
138	\N	British guitarist, born 27th January 1957, in Hartlepool, England.	2017-11-23 18:55:40.46064	2017-11-25 23:52:50.094687	8	Janick Gers
139	\N	English drummer born 5 June 1954 in Hackney, London, England, UK.	2017-11-23 18:55:40.463926	2017-11-25 23:52:57.098684	8	Nicko McBrain
140	\N		2017-11-23 18:55:40.467729	2017-11-25 23:53:04.097319	8	Paul Cairns (2)
142	\N	British vocalist, video producer and designer, born in Whitechapel, London on April 19 1956.	2017-11-23 18:55:40.473523	2017-11-25 23:53:18.081384	8	Paul Mario Day
143	\N		2017-11-23 18:55:40.47594	2017-11-25 23:53:25.078423	8	Paul Todd (4)
144	\N		2017-11-23 18:55:40.47857	2017-11-25 23:53:32.080862	8	Ron "Rebel" Matthews
146	\N		2017-11-23 18:55:40.486858	2017-11-25 23:53:47.08623	8	Terry Rance
147	\N		2017-11-23 18:55:40.490878	2017-11-25 23:53:54.08576	8	Terry Wapram
149	\N	This is Tony Parsons the novelist and music writer. For Tony Parsons the Iron Maiden guitarist use Tony Parsons (3)	2017-11-23 18:55:40.499145	2017-11-25 23:54:10.096377	8	Tony Parsons (3)
151	\N	English drummer, born 25 November 1944 in Sparkhill, Birmingham, England.	2017-11-23 18:55:52.357971	2017-11-25 23:54:24.083452	8	Bev Bevan
153	\N	Australian bassist and songwriter, born February 13, 1950 in Sydney, Australia.	2017-11-23 18:55:52.364674	2017-11-25 23:54:38.117016	8	Bob Daisley
156	\N	Craig Gruber (born June 15, 1951, Cortland, New York, USA – died May 5, 2015, Florida, USA) was an American rock bassist, perhaps best known as the original bassist in [a245648].	2017-11-23 18:55:52.373918	2017-11-25 23:54:59.085839	8	Craig Gruber
161	\N	Bassist for [a=Black Sabbath]. Better known as Terry "Geezer" Butler.\r\n\r\nBorn: July 17, 1949 in Aston, Birmingham, England.\r\n	2017-11-23 18:55:52.39435	2017-11-25 23:55:34.104757	8	Geezer Butler
163	\N	Keyboardist.	2017-11-23 18:55:52.401916	2017-11-25 23:55:48.078228	8	Gerald Woodruffe
164	\N	British rock bass player, singer and composer (b. 1951).	2017-11-23 18:55:52.405927	2017-11-25 23:55:55.096994	8	Glenn Hughes
165	\N	American bassist	2017-11-23 18:55:52.409935	2017-11-25 23:56:02.079033	8	Gordon Copley
166	\N	Born: August 19, 1945, London, England\r\n\r\nVocalist for [a=Deep Purple].\r\n	2017-11-23 18:55:52.413595	2017-11-25 23:56:09.111514	8	Ian Gillan
167	\N		2017-11-23 18:55:52.417282	2017-11-25 23:56:16.214322	8	Jeff Fenholt
171	\N	Born on May 12, 1959 in New York and was raised in Cliffside Park, NJ \r\nDied on December 1, 1993 in New Jersey of AIDS related complications\r\n	2017-11-23 18:55:52.432917	2017-11-25 23:56:44.073206	8	Ray Gillen
174	\N	Lead guitarist for [a=Black Sabbath].\r\n\r\nBorn: February 19, 1948, in Birmingham, England.	2017-11-23 18:55:52.444949	2017-11-25 23:57:05.107641	8	Tony Iommi
175	\N	Drummer, born September 13, 1957 in Brooklyn, New York; brother of [a=Carmine Appice].	2017-11-23 18:55:52.449255	2017-11-25 23:57:12.105412	8	Vinny Appice
177	\N	American drummer for the metal band [a=Lamb Of God], born on November 23, 1972. Brother of [a=Willie Adler].	2017-11-23 18:56:04.369211	2017-11-25 23:57:26.079647	8	Chris Adler
179	\N	American guitarist, born 1 December 1957 in Dunkirk, New York, USA.	2017-11-23 18:56:04.376144	2017-11-25 23:57:41.087062	8	Chris Poland
183	\N		2017-11-23 18:56:04.388671	2017-11-25 23:58:09.073507	8	Dijon Carruthers
185	\N	Gar Samuelson, original Megadeth drummer, born in Dunkirk, New York in 1958 died at his home in Orange City, FL on Wed, July 14, 1999. Cause of death was undiagnosed complications to the liver.	2017-11-23 18:56:04.395203	2017-11-25 23:58:22.084866	8	Gar Samuelson
187	\N	American guitarist and vocalist, born 26 February 1965 in Concord, California, USA.	2017-11-23 18:56:04.401124	2017-11-25 23:58:36.080959	8	Greg Handevidt
188	\N	Born: January 13, 1959 in Brooklyn, New York	2017-11-23 18:56:04.404116	2017-11-25 23:58:43.084329	8	James LoMenzo
190	\N	American guitarist.	2017-11-23 18:56:04.410341	2017-11-25 23:58:57.081949	8	Jay Reynolds (2)
192	\N	American heavy metal drummer, born 16 March 1963 in Bethlehem, Pennsylvania, USA.	2017-11-23 18:56:04.417065	2017-11-25 23:59:11.086162	8	Jimmy DeGrasso
194	\N		2017-11-23 18:56:04.423382	2017-11-25 23:59:25.084479	8	Kiko Loureiro
195	\N	US-American drummer. 	2017-11-23 18:56:04.426769	2017-11-25 23:59:32.088725	8	Lee Rauch
196	\N	Marty Friedman has sold over 10 million albums with the multi-platinum band Megadeth. He has also a dedicated following for his own solo albums which stylistically range from orchestral soundtrack style music to furious aggressive rock, with the common thread being Marty`s unique and tasty sense of melody. His latest album is called `Music For Speeding` and it marks his solo debut with the heavy hitting major label Universal Japan as well as Steve Vai`s Favored Nations label in the US. Marty has toured the world several times over very successfully withMegadeth. Along with touring, he is in high demand to do music/guitar seminars and clinics all over the U.S., Asia, Europe and South America, which he has done hundreds to date. Marty is also a regular columnist for Guitar World magazine, Young Guitar magazine (Japan) and Burrn Magazine in which he writes a column in Japanese, a reader favorite. Marty has designed his own signature model guitar with Jackson Guitars (the KE-1) that has been selling consistently since it was put on the market. He has just begun an endorsement relationship with Ibanez. His new 'Marty Friedman model' guitar will make its world debut in Oct '05 at the Tokyo Music Show. Along with doing his solo performances around the world, Marty is currently touring and recording with Japanese mega-star Aikawa Nanase.\r\n\r\nBefore joining Megadeth in Feb.1990, Marty was in a band called Cacophony, which released 2 albums (among their indie label's highest selling) and toured the U.S. and Japan. This band highlighted the potent guitar playing of Marty and fellow guitarist Jason Becker (who was to join David Lee Roth's band and record an album with him in 1990). Marty has received extremely high acclaim and many awards around the world for his unmistakably `Marty-esque` way of playing the guitar.\r\n\r\nMarty is from Washington D.C. originally but has lived in many places including Hawaii, Germany and California, giving him an odd and interesting approach to making his music. He currently resides in Tokyo\r\n	2017-11-23 18:56:04.430067	2017-11-25 23:59:39.0794	8	Marty Friedman
198	\N	Born May 5, 1966, in Montreal, Quebec.\r\n\r\nBrother of [a=Glen Drover].	2017-11-23 18:56:04.436734	2017-11-25 23:59:53.087154	8	Shawn Drover
202	\N	Born: October 25, 1948.\r\nOne of two lead guitarists in the British heavy metal band Judas Priest.\n	2017-11-23 18:56:16.366376	2017-11-26 00:00:29.118355	8	Glenn Tipton
205	\N	One of two lead guitarists in the British heavy metal band Judas Priest.  A founding member in 1970, he left the band in 2011.	2017-11-23 18:56:16.376126	2017-11-26 00:00:50.097168	8	K. K. Downing
207	\N	English guitarist, born 1 January 1980 in London, England, UK.	2017-11-23 18:56:16.381481	2017-11-26 00:01:04.08881	8	Richie Faulkner
210	\N	Drummer whose style marked a turning point in heavy metal group Judas Priest's style upon his arrival in 1989. He has been with them ever since while remaining a member of Racer X and also providing drumming duties for Rob Halford's solo project Fight.	2017-11-23 18:56:16.391459	2017-11-26 00:01:25.083594	8	Scott Travis
212	\N	Engineer	2017-11-23 18:56:53.389971	2017-11-26 00:01:39.078769	1	John Baldwin
214	\N	English musician, singer and songwriter, born 20 August 1948 in West Bromwich, Staffordshire, England.	2017-11-23 18:56:53.398795	2017-11-26 00:01:52.100503	1	Robert Plant
218	\N	British drummer; the original drummer for [a82730]. \r\n\r\nBorn November 24, 1941 in Madras, India.\r\n	2017-11-23 18:57:06.364603	2017-11-26 00:02:20.077189	1	Pete Best
222	\N	British drummer. \r\nBorn January 27, 1944 in Birmingham, United Kingdom. \r\nFounding member of [a=Pink Floyd] in 1965, he is the only group member to have performed on each and every of their albums. \r\n\r\n[i]Note: Not to be confused with the much younger American session drummer and percussionist Nick Mason.[/i]\n	2017-11-23 18:57:17.365615	2017-11-26 00:02:48.087648	1	Nick Mason
226	\N	Barry Mitchell  was the bassist of [a=Queen] before [a=John Deacon] came in.	2017-11-23 18:57:28.362897	2017-11-26 00:03:16.085182	1	Barry Mitchell
227	\N	Best known as lead guitar player for the rock group [a=Queen].\r\nBorn 19 July 1947 in Hampton, Middlesex, UK.\r\n	2017-11-23 18:57:28.36765	2017-11-26 00:03:23.105968	1	Brian May
234	\N	English singer and songwriter, born 5 October 1947 in Dunston, Gateshead, England, UK.	2017-11-23 18:57:39.362251	2017-11-26 00:04:12.084548	1	Brian Johnson
236	\N	English bassist, born 14 December 1949 in Romford, Essex, England, UK. Played with AC/DC for nearly 40 years up to his retirement in 2016.	2017-11-23 18:57:39.367797	2017-11-26 00:04:26.084265	1	Cliff Williams
237	\N	Australian drummer, born 16 November 1946.	2017-11-23 18:57:39.371045	2017-11-26 00:04:33.082209	1	Colin Burgess
241	\N	Born 2nd March, 1956 in Melbourne, Australia.	2017-11-23 18:57:39.384262	2017-11-26 00:05:01.076893	1	Mark Evans (3)
242	\N	Australian drummer. He was a member of [a84752] from April 1974 to January 1975.	2017-11-23 18:57:39.387095	2017-11-26 00:05:08.076174	1	Peter Clack
244	\N	Australian bassist. He was a member of [a84752] from April 1974 to January 1975.	2017-11-23 18:57:39.392406	2017-11-26 00:05:23.083944	1	Rob Bailey (5)
354	\N		2017-11-23 19:00:13.397001	2017-11-26 00:18:21.078344	22	Jamie Miller
248	\N	English saxophonist, born 21 April 1942 in London, England, UK. Son of [a=Jimmy Skidmore].	2017-11-23 18:58:10.369374	2017-11-26 00:05:51.088005	16	Alan Skidmore
249	\N	British drummer, band leader. Born: January 10, 1946, Liverpool, England. Also known as “The Hawk”.	2017-11-23 18:58:10.372568	2017-11-26 00:05:58.078763	16	Aynsley Dunbar
250	\N	Bassist, on primarily jazz and soul releases.	2017-11-23 18:58:10.375527	2017-11-26 00:06:05.081742	16	Bobby Haynes
252	\N	Saxophonist and keyboardist.	2017-11-23 18:58:10.381055	2017-11-26 00:06:20.08351	16	Chris Mercer
257	\N	Hank Van Sickle (born December 31, 1961, Pittsburgh, Pennsylvania, USA) is an American bassist.	2017-11-23 18:58:10.396515	2017-11-26 00:06:55.078711	16	Hank Van Sickle
258	\N	Scottish Guitarist. Born 4 June 1953, died 1979. Brother of drummer [a=Jack McCulloch].	2017-11-23 18:58:10.39907	2017-11-26 00:07:03.078922	16	Jimmy McCulloch
259	\N	Joe Yuele (born January the 26th 1951, Haverhill, Massachusetts, USA) is an American drummer.	2017-11-23 18:58:10.401842	2017-11-26 00:07:10.087052	16	Joe Yuele
264	\N	English bassist, founding member of [a=The Aynsley Dunbar Retaliation], but was soon replaced. He subsequnently joined [a=John Mayall & The Bluesbreakers].\r\nIn the 80s he played with [a=Mainsqueeze]\r\n	2017-11-23 18:58:10.417212	2017-11-26 00:07:46.081026	16	Keith Tillman
266	\N	English musician, born 17 January 1949 in Welwyn Garden City, Hertfordshire, England, UK.\r\n	2017-11-23 18:58:10.423103	2017-11-26 00:08:00.09571	16	Mick Taylor
268	\N	Ray Warleigh (born 28 September 1938 in Sydney, NSW, Australia - died 21 September 2015) was an UK-based (since 1960) alto saxophonist and flutist.	2017-11-23 18:58:10.43106	2017-11-26 00:08:14.084848	16	Ray Warleigh
269	\N		2017-11-23 18:58:10.434797	2017-11-26 00:08:22.074884	16	Rick Cortes
270	\N		2017-11-23 18:58:10.43859	2017-11-26 00:08:29.077027	16	Rip Kant
273	\N	Walter Trout (born March 6, 1951, Ocean City, New Jersey, USA) is an American blues guitarist, singer and songwriter.	2017-11-23 18:58:10.450538	2017-11-26 00:08:49.084136	16	Walter Trout
275	\N	Guitarist and singer for [a=ZZ Top].\r\n\r\nBorn: December 16, 1949, Houston, Texas.\r\n	2017-11-23 18:58:33.353911	2017-11-26 00:09:03.093477	16	Billy Gibbons
278	\N	Born: June 11, 1949, Frankston, Texas\r\n\r\nDrummer for [a=ZZ Top].\r\n	2017-11-23 18:58:33.367034	2017-11-26 00:09:24.082974	16	Frank Beard
279	\N	Keyboardist. He was in the original lineup of ZZ Top.\r\nDied February 2004.	2017-11-23 18:58:33.370422	2017-11-26 00:09:31.07745	16	Lanier Greig
283	\N	Keyboardist, most commonly known for his work with [a=The Allman Brothers Band] and [a=The Rolling Stones].\r\n\r\nBorn: April 28, 1952.\n	2017-11-23 18:58:44.374476	2017-11-26 00:09:59.08249	16	Chuck Leavell
285	\N		2017-11-23 18:58:44.38132	2017-11-26 00:10:14.081569	16	David "Frankie" Toler
286	\N	American guitarist. Nephew of [a=Butch Trucks].\r\n\r\nb. June 8, 1979 (Jacksonville, FL, USA)\n	2017-11-23 18:58:44.38452	2017-11-26 00:10:20.078647	16	Derek Trucks
290	\N	American drummer and percussionist, he was a founding member of The Allman Brothers Band and later the Sea Level.\r\n\r\nBorn: July 8, 1944 in Ocean Springs, Mississippi, USA.	2017-11-23 18:58:44.401293	2017-11-26 00:10:49.089078	16	Jai Johanny Johanson
293	\N	Puerto Rican American percussionist, born 1963 or 1964 in Bronx, NY, USA.	2017-11-23 18:58:44.413018	2017-11-26 00:11:10.083019	16	Marc Quinones
294	\N	American bassist, also a drummer, bass clarinetist, pianist and banjo player	2017-11-23 18:58:44.417678	2017-11-26 00:11:17.085695	16	Oteil Burbridge
295	\N	American keyboardist	2017-11-23 18:58:44.421976	2017-11-26 00:11:25.085362	16	Reese Wynans
297	\N		2017-11-23 18:58:56.347694	2017-11-26 00:11:40.08633	16	John "Rabbit" Bundrick
300	\N	British rock drummer (b. 16 Sep 1948). Sometimes credited as 'Kenney Jones'.\r\n\r\nPlease note: Kenny Jones the producer/ engineer is [a=Kenny Jones (3)]\r\n	2017-11-23 18:58:56.358496	2017-11-26 00:12:02.0964	16	Kenny Jones
304	\N	English drummer, son of [a=Richard Starkey] AKA [a=Ringo Starr]. Born 13th September 1965, in London, UK.	2017-11-23 18:58:56.370567	2017-11-26 00:12:30.077505	16	Zak Starkey
306	\N	American drummer, born 9 December 1972, Frankfurt am Main, Germany.	2017-11-23 18:59:27.384322	2017-11-26 00:12:44.077506	22	Frank E. Wright
307	\N	US-American guitarist.\r\n\r\nHe was born 11 November 1973 in Little Rock, Arkansas, USA.\r\n	2017-11-23 18:59:27.388246	2017-11-26 00:12:51.092292	22	Jason White (3)
308	\N		2017-11-23 18:59:27.391929	2017-11-26 00:12:58.084623	22	John Kiffmeyer
310	\N		2017-11-23 18:59:39.35531	2017-11-26 00:13:12.076765	22	Brandon Cruz
311	\N	Drummer.	2017-11-23 18:59:39.360247	2017-11-26 00:13:19.079596	22	Bruce Slesinger
312	\N		2017-11-23 18:59:39.364427	2017-11-26 00:13:25.081839	22	Carlos Cadona
313	\N		2017-11-23 18:59:39.368429	2017-11-26 00:13:32.080039	22	D.H. Peligro
314	\N		2017-11-23 18:59:39.372206	2017-11-26 00:13:39.092556	22	Eric Boucher
315	\N		2017-11-23 18:59:39.376523	2017-11-26 00:13:46.090342	22	Geoffrey Lyall
316	\N		2017-11-23 18:59:39.381357	2017-11-26 00:13:52.08156	22	Ray Pepperell
320	\N	English songwriter and multi-instrumentalist, born 18 July 1957 in London, England.	2017-11-23 18:59:50.359824	2017-11-26 00:14:20.080156	22	Keith Levene
322	\N		2017-11-23 18:59:50.365315	2017-11-26 00:14:34.077401	22	Nick Sheppard
323	\N	English musician and artist, born 15 December 1955 in Thornton Heath, South London, England.	2017-11-23 18:59:50.368659	2017-11-26 00:14:41.072529	22	Paul Simonon
324	\N		2017-11-23 18:59:50.371771	2017-11-26 00:14:48.078085	22	Pete Howard
326	\N	British drummer, born May 30, 1955 in Bromley, Kent, England.	2017-11-23 18:59:50.37761	2017-11-26 00:15:02.081817	22	Topper Headon
327	\N		2017-11-23 18:59:50.38069	2017-11-26 00:15:09.075574	22	Vince White
331	\N	Born April 4, 1964 in Lodi, New Jersey.	2017-11-23 19:00:01.380598	2017-11-26 00:15:39.084009	22	David Calabrese
332	\N	Born June 2, 1961 in Newark, New Jersey. Son of jazz producer [a=Ozzie Cadena].	2017-11-23 19:00:01.38434	2017-11-26 00:15:46.081702	22	Dez Cadena
333	\N		2017-11-23 19:00:01.387973	2017-11-26 00:15:53.074176	22	Eric "Goat" Arce
334	\N	Guitarist in the Misfits first lineup. Left the Misfits in November 1978 and went on to play guitar in the band "Active Ingredients"\r\n\r\nBorn August 17, 1957\r\n	2017-11-23 19:00:01.39244	2017-11-26 00:16:00.076705	22	Frank LiCata
670	\N	American french horn, saxophone, keyboard player and singer, mostly known for his work with [a=Frank Zappa]. He was born June 1948 in Philadelphia, Pennsylvania.\r\n\r\nHe must not be confused with philly sound producer [a=Bobby Martin], even if both have played together in the early 1970s.\r\n	2017-11-23 19:40:46.422045	2017-11-26 00:55:11.074325	18	Bobby Martin (2)
338	\N	American drummer, born January 5, 1954.	2017-11-23 19:00:01.407789	2017-11-26 00:16:28.075645	22	Jim Catania
340	\N	Grammy winning mixing engineer\r\nKnown to have worked at;\r\n[l283415]	2017-11-23 19:00:01.41705	2017-11-26 00:16:42.085431	22	Manny
341	\N	Born July 15, 1956, in Brooklyn, New York.	2017-11-23 19:00:01.42112	2017-11-26 00:16:49.078355	22	Marc Bell
344	\N	American vocalist, born October 16, 1966.	2017-11-23 19:00:01.43417	2017-11-26 00:17:11.084173	22	Myke Hideous
345	\N		2017-11-23 19:00:01.438655	2017-11-26 00:17:18.083537	22	Paul Caiafa
347	\N	Born: December 23, 1966\r\n\r\nBobby Schayer was the drummer for the seminal punk rock group Bad Religion from 1991 to 2001.\n	2017-11-23 19:00:13.369093	2017-11-26 00:17:32.080463	22	Bobby Schayer
351	\N		2017-11-23 19:00:13.386591	2017-11-26 00:18:00.074687	22	Davy Goldman
352	\N	American punk rock musician, college professor, and author born November 6, 1964 in Racine, Wisconsin.\r\nGreg Graffin is the singer and founder of the punk rock band Bad Religion.	2017-11-23 19:00:13.38977	2017-11-26 00:18:06.086831	22	Greg Graffin
357	\N	Punk rock drummer best known as a founding member of the Circle Jerks.  He is the brother of Wasted Youth guitarist [a=Chett Lehrer].	2017-11-23 19:00:13.407256	2017-11-26 00:18:43.083796	22	Keith Lehrer
358	\N		2017-11-23 19:00:13.411282	2017-11-26 00:18:49.076142	22	Mike Dimkich
359	\N		2017-11-23 19:00:13.414915	2017-11-26 00:18:56.083639	22	Paul Dedona
361	\N		2017-11-23 19:00:13.420019	2017-11-26 00:19:09.074592	22	Tim Gallegos
363	\N	American Singer. Born: 13th March 1933\r\nDied: 29th July 1999\r\nSister of [a=June Carter] and [a=Helen Carter (2)].	2017-11-23 19:00:31.377953	2017-11-26 00:19:22.078766	11	Anita Carter
365	\N	American Folk and Country singer and guitarist. Daughter of [a597639] and [a628155].	2017-11-23 19:00:31.383075	2017-11-26 00:19:36.087888	11	Janette Carter
368	\N	American country music musician, singer, and songwriter, born 21 July 1898, died 8 January 1979.	2017-11-23 19:00:31.393089	2017-11-26 00:19:57.08049	11	Sara Carter (2)
370	\N	US double bass player (bluegrass)	2017-11-23 19:00:42.350654	2017-11-26 00:20:11.085826	11	Bessie Lee Mauldin
371	\N	American bluegrass musician, born July 25, 1950.	2017-11-23 19:00:42.353361	2017-11-26 00:20:18.088878	11	Bill Holden (4)
374	\N	American bluegrass musician, member of the Atlanta Country & Bluegrass Music Hall Of Fame.	2017-11-23 19:00:42.363292	2017-11-26 00:20:38.088011	11	Curtis Blackwell
375	\N	American bluegrass musician and singer, plays banjo, mandolin, dobro, bass and guitar. Son of [a2341731].	2017-11-23 19:00:42.367112	2017-11-26 00:20:45.082677	11	Dana Cupp, Jr.
378	\N	Born: April 22, 1928 in Temperance Hall, DeKalb County, Tennessee\r\nDied: December 15, 2015 in Lebanon, Tennessee	2017-11-23 19:00:42.378215	2017-11-26 00:21:08.084214	11	Jimmy Maynard (2)
381	\N	Born August 27,1949 in Fort Payne, Alabama.	2017-11-23 19:00:53.439893	2017-11-26 00:21:29.081816	11	Jeff Cook (2)
382	\N	Born May 11,1955 in Springfield, Massachusetts.	2017-11-23 19:00:53.444828	2017-11-26 00:21:36.088705	11	Mark Herndon
383	\N	Born December 13, 1949 in Fort Payne, Alabama.	2017-11-23 19:00:53.449177	2017-11-26 00:21:42.084137	11	Randy Owen
387	\N	Guitarist, Vocalist & Songwriter	2017-11-23 19:01:16.364058	2017-11-26 00:22:10.093578	11	Barry Barnes
388	\N		2017-11-23 19:01:16.367638	2017-11-26 00:22:16.172739	11	Bruce Ray Brown
390	\N	American rock and country rock bassist, from March 1975 he was part of The Charlie Daniels Band.\r\n\r\nBorn: 1949 in Hope, Tuscaloosa, Alabama, USA.	2017-11-23 19:01:16.374925	2017-11-26 00:22:30.073998	11	Charlie Hayward
391	\N		2017-11-23 19:01:16.378857	2017-11-26 00:22:37.076392	11	Chris Wormer
392	\N		2017-11-23 19:01:16.382769	2017-11-26 00:22:44.081675	11	Don Murray (3)
393	\N	Credited with Drums & Percussion	2017-11-23 19:01:16.386911	2017-11-26 00:22:51.075994	11	Fred Edwards
394	\N	Drums and Percussion	2017-11-23 19:01:16.39062	2017-11-26 00:22:58.077746	11	Gary Allen
397	\N		2017-11-23 19:01:16.403781	2017-11-26 00:23:19.083517	11	Mark Fitzgerald
398	\N		2017-11-23 19:01:16.408153	2017-11-26 00:23:25.091797	11	Pat McDonald
400	\N	Tom Crain used to be the guitar player of [a=The Charlie Daniels Band].	2017-11-23 19:01:16.416088	2017-11-26 00:23:39.078239	11	Tom Crain
401	\N	Born 1 April 1971 in Hempstead, Long Island. \r\nPart of the famous duo [a139643] and member of the [a=Wu-Tang Clan].\r\n	2017-11-23 19:03:17.380611	2017-11-26 00:23:46.082375	2	Clifford Smith (2)
404	\N		2017-11-23 19:03:17.392636	2017-11-26 00:24:07.081723	2	Elgin Turner
406	\N	Born: July 06, 1970 in Bronx, United States.	2017-11-23 19:03:17.400897	2017-11-26 00:24:21.082332	2	Jason Hunter (2)
407	\N	Lamont Jody Hawkins AKA [a=U-God] is a member of the [a=Wu-Tang Clan].	2017-11-23 19:03:17.405006	2017-11-26 00:24:28.074185	2	Lamont Hawkins
408	\N		2017-11-23 19:03:17.409195	2017-11-26 00:24:35.090005	2	Robert Diggs
413	\N		2017-11-23 19:03:29.374292	2017-11-26 00:25:10.094942	2	Lorenzo Patterson
414	\N		2017-11-23 19:03:29.378304	2017-11-26 00:25:17.079721	2	Mik Lezan
415	\N		2017-11-23 19:03:29.382432	2017-11-26 00:25:24.079766	2	O'Shea Jackson
416	\N	Born: May 31, 1964, Hollis, New York	2017-11-23 19:03:41.352319	2017-11-26 00:25:31.091579	2	Darryl McDaniels
418	\N		2017-11-23 19:03:41.360277	2017-11-26 00:25:45.088497	2	Joseph Simmons
420	\N		2017-11-23 19:03:52.352656	2017-11-26 00:25:59.155094	2	Jarobi White
422	\N	American rapper, born 20 November 1970, died 22 March 2016 in Queens, New York, USA.	2017-11-23 19:03:52.361151	2017-11-26 00:26:13.079747	2	Malik Taylor
424	\N		2017-11-23 19:04:04.359135	2017-11-26 00:26:27.093875	2	Carlton Ridenhour
426	\N		2017-11-23 19:04:04.368732	2017-11-26 00:26:41.071853	2	Khari Wynn
427	\N		2017-11-23 19:04:04.373427	2017-11-26 00:26:47.073665	2	Lisa Williamson (3)
428	\N		2017-11-23 19:04:04.378271	2017-11-26 00:26:53.083813	2	Lord Aswod
429	\N		2017-11-23 19:04:04.383132	2017-11-26 00:26:59.086196	2	Mike Faulkner
430	\N		2017-11-23 19:04:04.387598	2017-11-26 00:27:05.07426	2	Norman Rogers
431	\N	An American hip hop artist and songwriter.	2017-11-23 19:04:04.39196	2017-11-26 00:27:13.08557	2	Richard Griffin
432	\N		2017-11-23 19:04:04.396527	2017-11-26 00:27:20.073877	2	William Jonathan Drayton
434	\N	Swedish singer, and songwriter who is well known as one of the lead singers of Swedish pop group [a69866]. \r\nBorn on November 15, 1945 in Ballangen, Norway. \r\nFor more Anni-Frid Lyngstad releases, see the [a=Frida] page.\r\n\r\n[b]Anni-Frid Lyngstad[/b] started her music career in 1958 as a jazz singer. In the 1960s, she married jazz musician Ragnar Fredriksson and had two children, [a325133] and Ann Lise-Lotte Fredriksson. The couple separated after a few years. During Dagen-H in 1967, she won EMI's talent competition, "New Faces" and first appeared on Swedish television, as she sang "En ledig dag", which was her first single released by His Master's Voice, a week after Dagen-H. [b]Lyngstad[/b] was a struggling singer prior to the formation of ABBA due to her fourth placement in Melodifestivalen 1969, with a song "Härlig är vår jord". Nonetheless, [b]Lyngstad[/b] recorded singles for EMI consistently, which led her to appear on Swedish television and cabarets, despite that neither of the other songs, charted or only a few songs were circulated in the Swedish radio or sales charts, until she met future bandmate and husband [a69873] the same year, who would later propelled her to sing other genres beyond her jazz songs, with her first No. 1 hit in the Swedish radio charts, "Min egen stad", released in 1971 as the B-side to "En gång är ingen gång".\r\n\r\nA year later, in 1972, [b]Lyngstad[/b] was signed to [l40813] and recorded her first single for the label "Man vill ju leva lite dessemellan", which was her second No. 1 hit in Svensktoppen; ABBA would be formed that same year. During ABBA's recording session of "Waterloo" and their early success after winning the Eurovision Song Contest of 1974, the production of her first solo album for Polar, "Frida Ensam" commenced and took one and a quarter year to finish the recording of the album. "Frida Ensam" was released in November 1975 in Scandinavia. Her single, Fernando (later recorded in English by ABBA), and the album reached to the top 10 in Svensktoppen. \r\n\r\nDuring ABBA's middle to final years, [b]Lyngstad[/b] married Andersson in 1978, and later divorced him in 1981, due to multiple disputes. This led her to collaborate with Genesis drummer and singer [a101028] with her famous album, "Something's Going On", in 1982. With her single, "I Know There's Something Going On", the single reached to the top fives in most of Europe's weekly charts, while in some countries such as the United Kingdom, and the United States, it reached lower than the top fives, depending on the quantity of the record chart list, most notably No. 13 on Billboard's Hot 100. "Something's Going On", as an album, reached to one of the top 40 in Europe's country-varied weekly charts, while in the United States, it reached No. 41 in Billboard's 200. Other singles from "Something's Going On" followed, but did not match the success as her lead single did.\r\n\r\nIn 1984, [b]Lyngstad[/b] released her album "Shine", produced by [a50809]. Unlike her previous album, it was a moderate success in Europe, reaching the Top 10, and Top 20 on some countries such as Sweden, Norway, Belgium, and the Netherlands, but not in particular countries, especially the United Kingdom, which reached No. 67. The album, "Shine", also debuted her songwriting such as "Don't Do It", "I Don't Wanna Be Alone" (unreleased, exists only as a bootleg), and "That's Tough" (non-album track), and spawned singles, "Shine/That's Tough", "Come To Me (I Am Woman)/Slowly", "Heart of the Country/Slowly", and "Twist in the Dark/Come To Me (I Am Woman)". She withdrew from music business for a while, as a solo singer after "Shine" was released.\r\n\r\nA few years later, starting in 1991, [b]Lyngstad[/b] became an environmentalist, appearing on fairs and galas, and formed a short lived supergroup, "Artister för Miljö", to raise awareness of the environment. Five years later, she marked her music comeback with her album "Djupa andetag". The album featured her singles, "Även en blomma", "Ögonen", and "Alla mina bästa år", as well as her self-composed album track, "Kvinnor som springer". [b]Lyngstad[/b] became a princess through her marriage to Prince Heinrich Ruzzo Reuss (of Plauen) in 1992. The marriage lasted until Reuss died of lymphoma in 1999. \r\n\r\nSince 1987, [b]Lyngstad[/b] has appeared as a guest singer, most notably with Swedish duo [a51226], Deep Purple keyboardist [a262410], and [a2553309].\r\n[b]Lyngstad[/b] was inducted into the Rock and Roll Hall of Fame as a member of ABBA in 2010.\r\n\r\n	2017-11-23 19:05:12.37767	2017-11-26 00:27:34.079739	17	Anni-Frid Lyngstad
435	\N	Born on December 16, 1946 in Stockholm, Sweden. \r\n\r\nOne of the two main songwriters and producers in ABBA. If you are making an addition where he is credited together with Björn Ulvaeus please credit as [a=Björn Ulvaeus & Benny Andersson] (unless they are credited together with someone else, in which case separate credits should be used).\r\n\r\nSee also his studios [l287408] and [l304436].	2017-11-23 19:05:12.380347	2017-11-26 00:27:41.082731	17	Benny Andersson
437	\N	Guitarist	2017-11-23 19:05:25.352791	2017-11-26 00:27:55.075266	17	Alan Kendall
454	\N	Carl Wilson (born December 21, 1946, Hawthorne, California, USA – died February 6, 1998, Los Angeles, California, USA) was an American rock and roll singer and guitarist, best known as a founding member, lead guitarist and sometime lead vocalist of [a70829]. He was inducted into the Rock and Roll Hall of Fame in 1988. He was the youngest brother of fellow band members [url=https://www.discogs.com/artist/189718-Brian-Wilson]Brian[/url] and [url=https://www.discogs.com/artist/391245-Dennis-Wilson-2]Dennis[/url], and cousin of [a372789]. Son of [a363017] and [a3239364]. Uncle of [a434651] and [a413862].\r\n\r\nLike most members of The Beach Boys, Carl was a multi-instrumentalist, playing lead, rhythm, bass, and acoustic guitars, keyboards, and occasionally drums onstage.\r\n\r\nAfter his elder brother Brian's retirement from the stage in 1965, Carl became the de facto leader of the band onstage, and shortly after became the band's in-studio leader, producing the bulk of the 1967-1973 albums "Smiley Smile, Friends", "20/20", "Wild Honey", "Surf's Up", [a2415580] - "So Tough", and "Holland".\r\n\r\nCarl's leadership role in the band diminished somewhat in the late 1970's, both due to Brian's brief re-emergence as the band's producer and Carl's own substance abuse problems. He nonetheless remained a prominent and recognizable voice in the band, taking lead vocals on many songs and serving as "mixdown producer" on the Brian-produced "Love You" album. By the time of recording of 1979's "L.A. (Light Album)", Carl again found himself filling the vocal and songwriting gap left by a retreating Brian Wilson.\r\n\r\nAs a lead vocalist Carl was the last member of the group to be assigned lead vocals to sing.  His first turn at the solo mic was on 1964's "Pom-Pom Playgirl", from "Shut Down Vol. 2".  Over the years he has been considered one of the greatest singers in pop/rock, deftly handling ballads such as "God Only Knows", pop gems like "I Can Hear Music", and rock and rollers including "Darlin'" and "Keeping The Summer Alive".  On tour, particularly in the late 1960's and 1970's, his extraordinary voice often replaced that of his brother Brian's on songs originally sung by the latter, including "Don't Worry Baby", "Surfer Girl", and "Let The Wind Blow".\r\n\r\nCarl was not the most controversial member of the band.  To his credit, his quiet, private life endured only two ripples: first, in the late 1960's, he emerged victorious from a fight with the US government over his Conscientious Objector status regarding the Vietnam draft (he and the band agreed to play a number of free benefit concerts in lieu of Carl being drafted); second, in the late 1970's he appeared on a television simulcast concert in Australia with The Beach Boys while inebriated (he later explained it away as a reaction to flu medicine).  \r\n\r\nBy the early 1980's The Beach Boys were in disarray. Frustrated with the band's sluggishness to record new material and reluctance to rehearse for live shows, Carl Wilson took a leave of absence in 1981, rather than remain as part of what he saw increasingly becoming a nostalgia act. Thence, he released a 1981 solo album, "Carl Wilson", to little critical notice, with songs co-written with [a360015] - particularly the extraordinary "Heaven" and the radio hit "Hurry Love". He recorded a second solo album, 1983's "Youngblood", in a similar vein, but by the time it was released he had already rejoined The Beach Boys. Although "Youngblood" did not chart, a single, the [url=https://www.discogs.com/artist/987261-John-Joseph-Hall]John Hall[/url] and [a604946] penned "What You Do To Me," did, and it took on new meaning after the death of brother Dennis in December 1983. Youngblood also featured a cover of [a260458]'s "Rockin' All Over The World", which he performed on tour with The Beach Boys in the 1980's.\r\n\r\nDuring his brother Brian's mental health struggles and in-and-out participation in the band in the 1980's, particularly after the death of brother Dennis, Carl was closely involved in the legal and moral support of Brian, and was a key player in supporting Brian's second wife Melinda in the ousting of controversial psychologist [a1057138] from Brian's affairs.\r\n\r\nCarl was diagnosed with brain and lung cancer in early 1997. Despite his illness and chemotherapy treatments, he continued to perform after diagnosis. Carl played through The Beach Boys' entire summer tour ending in the fall of 1997. Carl Wilson lost his battle with cancer on February 6, 1998, just two months after the death of his mother, Audree. He was survived by his brother Brian, wife Gina (daughter of [a10533]) and two sons Justyn and Jonah from his first marriage to Annie Hinsche (sister of [a299166] member, [a311944], who was a mainstay of the Beach Boys' support band on tour).\r\n\r\nA handful of additional recordings of Wilson have been released as the album "Like a Brother", by "supergroup" [url=https://www.discogs.com/artist/274822-Gerry-Beckley]Beckley[/url]-[url=https://www.discogs.com/artist/529946-Robert-Lamm]Lamm[/url]-Wilson, comprising Carl Wilson, Gerry Beckley of [a249829] and Robert Lamm of [a114483].\r\n\r\n[a=Carl Wilson (2)] Jazz organist\r\n[a=Carl Wilson (3)] Technician from New Zealand\r\n[a=Carl Wilson (4)] Carl "Flat Top" Wilson - Bassist from the shellac era.\r\n[a=Carl Wilson (5)] Credited for liner notes\r\n[a=Carl Wilson (7)] Photographer\r\n	2017-11-23 19:05:49.373054	2017-11-26 00:29:55.083777	17	Carl Wilson
455	\N	Born: August 22, 1948	2017-11-23 19:05:49.377304	2017-11-26 00:30:02.081309	17	David Marks
458	\N	South African multi-instrumentalist of Malay descent, who has performed as both a drummer, and a guitarist. He was born September 5, 1952.	2017-11-23 19:05:49.390139	2017-11-26 00:30:23.082499	17	Ricky Fataar
459	\N	Born: February 28, 1957, Athens, Georgia.\r\n\r\nVocalist for [a=The B-52's].\r\n	2017-11-23 19:06:01.348696	2017-11-26 00:30:30.083616	17	Cindy Wilson
460	\N	American singer, songwriter and musician, born 1 July 1951 in Newark, New Jersey, USA.	2017-11-23 19:06:01.351878	2017-11-26 00:30:37.089854	17	Fred Schneider
462	\N	Born: October 26, 1953, Athens, Georgia	2017-11-23 19:06:01.357807	2017-11-26 00:30:51.079329	17	Keith Strickland
463	\N		2017-11-23 19:06:01.360908	2017-11-26 00:30:58.091452	17	Pat Irwin
442	\N		2017-11-23 19:05:25.370827	2017-11-26 00:28:30.072812	17	Geoff Bridgford
447	\N	American singer/songwriter, musician, actor, producer, novelist, bussinessman, philantropist and owner of [l=The Pacific Arts Corp., Inc.], also known as Michael Blessing, Nez, Woolhat, Papa Nez. He was born on December 30, 1942 in Houston, Texas.	2017-11-23 19:05:37.353612	2017-11-26 00:29:05.071499	17	Michael Nesmith
449	\N		2017-11-23 19:05:37.359674	2017-11-26 00:29:20.07025	17	Peter Tork
451	\N	South African singer and guitarist, born 7 July 1951 in Durban, South Africa.	2017-11-23 19:05:49.359817	2017-11-26 00:29:34.076888	17	Blondie Chaplin
467	\N	Real name of [a=Toots Hibbert].	2017-11-23 19:16:21.39375	2017-11-26 00:31:27.082179	15	Frederick Hibbert
468	\N	Harold's older brother [a330925]	2017-11-23 19:16:21.398148	2017-11-26 00:31:34.07839	15	Harold Butler
469	\N	Vocalist in Toots & The Maytals	2017-11-23 19:16:21.402965	2017-11-26 00:31:42.071631	15	Henry "Raleigh" Gordon
470	\N	Vocalist in Toots & The Maytals.	2017-11-23 19:16:21.407724	2017-11-26 00:31:49.078946	15	Nathaniel "Jerry" Matthias
471	\N	Reggae drummer	2017-11-23 19:16:21.412343	2017-11-26 00:31:56.165131	15	Paul Douglas
472	\N		2017-11-23 19:16:33.362064	2017-11-26 00:32:04.081456	15	Alphonso Martin
474	\N		2017-11-23 19:16:33.371253	2017-11-26 00:32:17.071868	15	Carlton Bryan
475	\N	Born: June 15, 1956	2017-11-23 19:16:33.375265	2017-11-26 00:32:24.074898	15	David Hinds
476	\N	British musician (keyboardist) and composer.	2017-11-23 19:16:33.37963	2017-11-26 00:32:31.074193	15	Errol Reid (2)
478	\N		2017-11-23 19:16:33.388523	2017-11-26 00:32:45.070369	15	Ronnie McQueen
479	\N		2017-11-23 19:16:33.393131	2017-11-26 00:32:52.080172	15	Selwyn Brown
480	\N		2017-11-23 19:16:33.397815	2017-11-26 00:32:59.076647	15	Steve Nesbitt
482	\N		2017-11-23 19:16:45.372848	2017-11-26 00:33:13.092887	15	Ian Winter
483	\N	Born: January 6, 1986, Sheffield, Yorkshire, England	2017-11-23 19:22:15.390132	2017-11-26 00:33:20.084985	24	Alex Turner
486	\N	English musician and DJ, born 7 May 1986 in Sheffield, England, best known as the drummer for indie rock band [a391170]. He is seen as the band's "quietly amiable diplomat."	2017-11-23 19:22:15.400519	2017-11-26 00:33:41.078878	24	Matt Helders
489	\N	Brazilian-American drummer, born 2 June 1980 in Rio de Janeiro, Brazil.	2017-11-23 19:22:25.368121	2017-11-26 00:34:02.080522	24	Fabrizio Moretti
490	\N	Born: August 23, 1978, New York City	2017-11-23 19:22:25.372906	2017-11-26 00:34:09.077883	24	Julian Casablancas
491	\N	American guitarist, born 16 January 1981 in New York City, New York, USA.	2017-11-23 19:22:25.377451	2017-11-26 00:34:16.079147	24	Nick Valensi
494	\N	English musician, songwriter and guitarist, born 15 April 1968 in Oxford, UK.	2017-11-23 19:22:36.377566	2017-11-26 00:34:37.078423	24	Ed O'Brien
496	\N	British songwriter and drummer, born 23 May 1967 in Abingdon, Oxfordshire, UK	2017-11-23 19:22:36.386087	2017-11-26 00:34:51.11546	24	Phil Selway
498	\N	Born June 21, 1981. Is the vocalist and keyboardist in the American synth rock band [a220651] .	2017-11-23 19:22:47.361536	2017-11-26 00:35:05.079571	24	Brandon Flowers
501	\N	Born February 15, 1976. Drummer for the indie rock/synth-pop/new wave band [a=The Killers].	2017-11-23 19:22:47.374718	2017-11-26 00:35:26.084362	24	Ronnie Vannucci
502	\N		2017-11-23 19:22:58.379001	2017-11-26 00:35:33.080931	24	Brendan Reed
503	\N		2017-11-23 19:22:58.383073	2017-11-26 00:35:40.095371	24	Dane Mills
505	\N	Canadian drummer.\r\n\r\nHe was born 6 June 1978 in Ottawa, Ontario, Canada.\r\n	2017-11-23 19:22:58.390246	2017-11-26 00:35:53.083022	24	Jeremy Gara
506	\N		2017-11-23 19:22:58.392945	2017-11-26 00:36:00.080549	24	Myles Broscoe
508	\N	Canadian musician.\r\n\r\nHe was born 4 October 1977 in Canada. \r\n	2017-11-23 19:22:58.39872	2017-11-26 00:36:13.074342	24	Richard Reed Parry
510	\N	Canadian bassist, guitarist and keyboardist	2017-11-23 19:22:58.403869	2017-11-26 00:36:27.076519	24	Timothy Kingsbury
513	\N	First [a=Nirvana] drummer who was subsequently replaced by [a=Chad Channing]. Later on, he played in Attica who released one album in 2005.	2017-11-23 19:25:15.49894	2017-11-26 00:36:48.077957	25	Aaron Burckhard
514	\N	Drummer, with Nirvana from 1988 to 1990.  Born 31 January 1967.	2017-11-23 19:25:15.503275	2017-11-26 00:36:55.069995	25	Chad Channing
515	\N		2017-11-23 19:25:15.5074	2017-11-26 00:37:02.076642	25	Dale Crover
519	\N		2017-11-23 19:25:15.525482	2017-11-26 00:37:30.144543	25	Georg Ruthenberg
520	\N	American born October 16, 1967.	2017-11-23 19:25:15.530048	2017-11-26 00:37:37.081044	25	Jason Everman
523	\N	Cellist and composer from Seattle. Accomplished in a wide variety of styles, including classical, world music, rock, folk and free improvisation.	2017-11-23 19:25:15.543586	2017-11-26 00:37:58.077095	25	Lori Goldston
524	\N	American cellist, singer-songwriter and performing artist, born 25 March 1966.	2017-11-23 19:25:15.548772	2017-11-26 00:38:05.073506	25	Melora Creager
528	\N	Dave Farrell (born February 8, 1977, Plymouth, Massachusetts, USA) is an American bassist and vocalist. 	2017-11-23 19:25:27.364781	2017-11-26 00:38:34.071791	25	Dave Farrell
531	\N	Born: January 20, 1979, Calabasas, California\r\nDrummer for [a=Linkin Park].\r\n	2017-11-23 19:25:27.372513	2017-11-26 00:38:55.081478	25	Rob Bourdon
532	\N	English bassist, keyboardist and composer, born 26 June 1969 in Oxford, UK. Brother of [a=Jonny Greenwood].	2017-11-23 19:25:38.368846	2017-11-26 00:39:02.070566	25	Colin Greenwood
533	\N	English musician, songwriter and guitarist, born 15 April 1968 in Oxford, UK.	2017-11-23 19:25:38.372774	2017-11-26 00:39:09.070795	25	Ed O'Brien
535	\N	British songwriter and drummer, born 23 May 1967 in Abingdon, Oxfordshire, UK	2017-11-23 19:25:38.380103	2017-11-26 00:39:23.061278	25	Phil Selway
537	\N		2017-11-23 19:25:49.380019	2017-11-26 00:39:38.084348	25	Chris Martin
539	\N	Born 11 September 1977 in Islington, London. English musician and multi-instrumentalist, best known as the lead guitarist of the band Coldplay.	2017-11-23 19:25:49.385473	2017-11-26 00:39:52.232304	25	Jon Buckland
542	\N	American guitarist, singer, songwriter, poet and author, born 13 February 1967 in Los Angeles, California, USA.	2017-11-23 19:26:00.473336	2017-11-26 00:40:13.072361	25	Arik Marshall
545	\N	American guitarist, born 7 June 1967 in Santa Monica, California, USA. He was married to [a=Carmen Electra] (divorced).	2017-11-23 19:26:00.487737	2017-11-26 00:40:34.070856	25	Dave Navarro
571	\N	\N	2017-11-23 19:29:35.385017	2017-11-23 19:29:35.385017	12	Beloyd Taylor
572	\N	\N	2017-11-23 19:29:35.388302	2017-11-23 19:29:35.388302	12	Chester Washington
573	\N	\N	2017-11-23 19:29:35.392315	2017-11-23 19:29:35.392315	12	David Whitworth
574	\N	\N	2017-11-23 19:29:35.395757	2017-11-23 19:29:35.395757	12	Don Whitehead
576	\N	\N	2017-11-23 19:29:35.404861	2017-11-23 19:29:35.404861	12	Greg Moore
578	\N	\N	2017-11-23 19:29:35.413481	2017-11-23 19:29:35.413481	12	John Paris
583	\N	\N	2017-11-23 19:29:35.436782	2017-11-23 19:29:35.436782	12	Michael Beal
584	\N	\N	2017-11-23 19:29:35.441883	2017-11-23 19:29:35.441883	12	Morris O'Connor
585	\N	\N	2017-11-23 19:29:35.446565	2017-11-23 19:29:35.446565	12	Morris Pleasure
586	\N	\N	2017-11-23 19:29:35.451306	2017-11-23 19:29:35.451306	12	Myron McKinley
588	\N	\N	2017-11-23 19:29:35.459109	2017-11-23 19:29:35.459109	12	Philip Doron Bailey
589	\N	\N	2017-11-23 19:29:35.463236	2017-11-23 19:29:35.463236	12	Ralph Johnson
592	\N	\N	2017-11-23 19:29:35.474471	2017-11-23 19:29:35.474471	12	Ronnie Laws
593	\N	\N	2017-11-23 19:29:35.478142	2017-11-23 19:29:35.478142	12	Sheldon Reynolds
594	\N	\N	2017-11-23 19:29:35.481838	2017-11-23 19:29:35.481838	12	Sherry Scott
597	\N	\N	2017-11-23 19:29:35.495507	2017-11-23 19:29:35.495507	12	Wade Flemons
599	\N	\N	2017-11-23 19:29:35.512418	2017-11-23 19:29:35.512418	12	Yackov Ben Israel
635	\N	\N	2017-11-23 19:33:02.433649	2017-11-23 19:33:02.433649	5	Paul Simonon
550	\N	US multi-instrumentalist and music producer from Los Angeles, born October 3, 1979.	2017-11-23 19:26:00.507788	2017-11-26 00:41:10.073003	25	Josh Klinghoffer
552	\N		2017-11-23 19:29:13.407726	2017-11-26 00:41:24.071854	12	Barbara Martin
553	\N	December 15, 1939	2017-11-23 19:29:13.412401	2017-11-26 00:41:30.090038	12	Cindy Birdsong
556	\N	[b]Soul - disco singer[/b]\r\n\r\nBorn on 26.11.1944 in Belzoni, Mississippi\r\nBased in Chicago\r\nLeader of the 70's-period [a=The Supremes]\r\nHer late 70's disco solo effort was produced by [a=Bobby Martin].\r\n	2017-11-23 19:29:13.424572	2017-11-26 00:41:54.078336	12	Jean Terrell
557	\N	Born :   Philadelphia, PA, United States \r\nSometimes credited as Linda Lawrence\r\n	2017-11-23 19:29:13.429041	2017-11-26 00:42:01.071749	12	Lynda Laurence
561	\N	Born September 13, 1949	2017-11-23 19:29:13.447399	2017-11-26 00:42:29.081925	12	Susaye Greene
562	\N	Born: May 4, 1951, Gary, Indiana\r\n\r\nFather of [a=Dealz].\r\n\r\nTallest of the Jackson Five.\r\n	2017-11-23 19:29:25.365772	2017-11-26 00:42:36.068037	12	Jackie Jackson
567	\N	Born: October 15, 1953, Gary, Indiana \r\n\r\nFather of recording artists\r\n[a=3T]\r\n	2017-11-23 19:29:25.386242	2017-11-26 00:43:15.078892	12	Tito Jackson
568	\N	Soul/funk guitarist, songwriter, producer and music arranger.\r\nBorn on 02.02.1948 in New Orleans, Louisiana, USA.\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 19:29:35.375297	2017-11-26 00:43:22.067606	12	Al McKay
569	\N	Trombone player.	2017-11-23 19:29:35.379083	2017-11-26 00:43:29.075555	12	Alexander Thomas
570	\N	Saxophonist, born 11 October 1950. Member of Earth, Wind & Fire from 1973 to 1993.	2017-11-23 19:29:35.382383	2017-11-26 00:43:35.067818	12	Andrew Woolfolk
580	\N	Keyboardist, songwriter, producer, music arranger and one of the founding members of the music group [a=Earth, Wind & Fire]. Born 19 June 1953.\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 19:29:35.422568	2017-11-26 00:44:42.066703	12	Larry Dunn
595	\N	[b]Drummer[/b]\r\n\r\nBorn 23.12.1962 in Atlanta, Georgia, U.S.A.\r\nHe has worked as session musician with [a=Steely Dan], [a=Bruce Hornsby], [a=Stanley Clarke], [a=David Sanborn], [a=Bette Midler], [a=Al Jarreau], [a=Paula Abdul], [a=Lee Ritenour] etc.\r\n	2017-11-23 19:29:35.48636	2017-11-26 00:46:26.079847	12	Sonny Emory
598	\N	Keyboardist - Producer - Composer\r\n\r\nHusband of [a=Wanda Vaughn]\n	2017-11-23 19:29:35.508334	2017-11-26 00:46:47.06764	12	Wayne Vaughn
602	\N	Drummer.	2017-11-23 19:29:47.382571	2017-11-26 00:47:15.076111	12	George Moreland
603	\N	Musician (Bassist) and songwriter with the Isley Brothers.\r\n\r\nBorn 18 August 1953 in Cincinnati, Ohio, USA.\r\nDied 6 June 2010 in Chicago, Illinois, USA.\r\n\r\nWas the youngest member of the Isley Brothers.\r\n	2017-11-23 19:29:47.387111	2017-11-26 00:47:21.078823	12	Marvin Isley
606	\N	American rhythm & blues vocalist and songwriter, member of the Isley Brothers.\r\nBorn April 1, 1939, in Cincinnati, Ohio.	2017-11-23 19:29:47.400188	2017-11-26 00:47:42.083376	12	Rudolph Isley
613	\N	Born: September 28, 1939, Thomasville, Georgia\r\nDied: October 26, 1975, Flagler County, Florida\r\n\r\nFormer singer for [a=The Temptations] who was replaced by David Ruffin in 1964.\r\n	2017-11-23 19:29:58.391229	2017-11-26 00:48:32.078735	12	Elbridge Bryant
614	\N	[b]Soul - funk singer - songwriter[/b]\r\n\r\nBorn on 21.09.1945, in Jackson, Mississippi. \r\nAfter serving in the Vietnam War with the Marines, Cameron joined Motown act The [a=Spinners] as lead singer. He sang both lead parts on their first big hit, 1970's "It's a Shame", co-written and produced by [a=Stevie Wonder], and remained with Motown as a solo artist when The [a=Spinners] left Motown in 1971. Although Cameron was not a major-seller for the label, he did have a hit with "It's So Hard to Say Goodbye to Yesterday", the theme song of the 1975 film Cooley High, which was later covered by [a=Boyz II Men].\r\n\r\nCameron left Motown after the 1970s, and toured as an independent artist. He recorded a critically-acclaimed album for Malaco Records in 1983 and his career was revived in 1989 by recordings for British record companies Ardent (owned at the time by Paul Mooney) and Motorcity (owned by Ian Levine). He returned to The [a=Spinners] from 2000 to 2002, and also recorded another solo album.\r\n\r\nHe replaced Barrington "Bo" Henderson in 2003 as one of the lead singers of [url=http://www.discogs.com/artist/Temptations%2C+The]The Temptations[/url]. He was one of the voices on their album, "Reflections". Cameron sang lead on the album track "How Sweet It Is (To Be Loved By You)" which was nominated for a Grammy in 2007. Cameron left [url=http://www.discogs.com/artist/Temptations%2C+The]The Temptations[/url] in June 2007 to focus on his group, The G.C. Cameron Review.\r\n\r\nOn Saturday May 17, 2008 Cameron made a special guest appearance at a benefit concert for Hold on to Education Foundation Inc. in South Jersey. [1] He received proclamations from New Jersey State Senator Diane Allen; and Mayor Jacqueline Jennings, with Councilman Eddie Campbell, Jr. of Willingboro NJ. Cherry Hill High School West A Cappella vocal group Men of Note paid tribute to Cameron in honor of his contribution to American Popular Music and his dedication to youth education. In late 2008, he appeared on the PBS special, "Love Train: The Sound of Philadelphia," singing The [a=Spinners]' hit: The Rubberband Man. \r\n	2017-11-23 19:29:58.395899	2017-11-26 00:48:39.07261	12	G.C. Cameron
615	\N	Soul singer\r\n\r\nBorn on 11.06.1947 in Washington, DC\r\nHe had a long and illustrious career as the first tenor and lead singer [a=The Temptations] from 1975 to 1983.\r\n	2017-11-23 19:29:58.400378	2017-11-26 00:48:46.084759	12	Glenn Leonard
616	\N		2017-11-23 19:29:58.404359	2017-11-26 00:48:53.081065	12	Louis Price
618	\N	Born October 30, 1941 in Texarkana, Texas.	2017-11-23 19:29:58.412381	2017-11-26 00:49:07.075134	12	Otis Williams
621	\N	Soul - disco songwriter- singer - producer\r\n\r\nBorn on 08.02.1948 in Monroe, NC.\r\n	2017-11-23 19:29:58.423243	2017-11-26 00:49:28.082306	12	Ron Tyson
622	\N	US american R&B and soul singer	2017-11-23 19:29:58.426481	2017-11-26 00:49:35.086176	12	Terry Weeks (2)
623	\N	R&B, Soul singer	2017-11-23 19:29:58.429582	2017-11-26 00:49:41.081717	12	Theo Peoples
625	\N	Cass Browne (born 27 September 1971) was a member of the band The Psychotics who became the [a=Senseless Things] in 1986. 	2017-11-23 19:33:02.400757	2017-11-26 00:49:56.077768	5	Cass Browne
627	\N	American hip hop producer, born 9 September 1967 in San Francisco, California, USA.	2017-11-23 19:33:02.408495	2017-11-26 00:50:10.074947	5	Dan Nakamura
633	\N	Morgan Daniel Nicholls (born 18 March 1971) is an English musician.	2017-11-23 19:33:02.425941	2017-11-26 00:50:52.076812	5	Morgan Nicholls
634	\N	Voice actor for fictional singer [a470634].	2017-11-23 19:33:02.429754	2017-11-26 00:50:59.072452	5	Nelson De Freitas
636	\N	English actor and comedian.\r\nVoice actor for fictional bassist [a3268930].	2017-11-23 19:33:02.436545	2017-11-26 00:51:13.077182	5	Phil Cornwell
638	\N		2017-11-23 19:33:02.442156	2017-11-26 00:51:27.070878	5	Seye Adelekan
639	\N	British Guitarist and Producer born on May 16, 1971.	2017-11-23 19:33:02.445028	2017-11-26 00:51:34.073822	5	Simon Katz
640	\N	British guitarist and session musician, born 9 July 1972 in Lancashire, England, UK.	2017-11-23 19:33:02.44778	2017-11-26 00:51:41.088535	5	Simon Tong
641	\N		2017-11-23 19:33:02.450318	2017-11-26 00:51:49.074236	5	Stephen Sedgwick
642	\N		2017-11-23 19:33:02.453282	2017-11-26 00:51:55.09407	5	Teren Delvon Jones
645	\N	English musician, keyboardist, guitarist and singer, born 27 January 1961 in Whalley Range, Manchester, England. She is married to [a=Stephen Morris].	2017-11-23 19:33:14.36915	2017-11-26 00:52:16.093747	5	Gillian Gilbert
648	\N	British drummer, born 28 October 1957 in Macclesfield, Cheshire, UK. He is married to [a=Gillian Gilbert].	2017-11-23 19:33:14.37864	2017-11-26 00:52:37.082706	5	Stephen Morris
651	\N		2017-11-23 19:33:25.382183	2017-11-26 00:52:58.078421	5	Keith Palmer
665	\N	\N	2017-11-23 19:40:46.408419	2017-11-23 19:40:46.408419	18	Aynsley Dunbar
656	\N	English musician, born 9 June 1970 in Herne Hill, South London, England.	2017-11-23 19:33:48.369032	2017-11-26 00:53:33.076513	5	Ed Simons
657	\N	English musician, born 11 January 1971 in Kingston upon Thames, London, England.	2017-11-23 19:33:48.374174	2017-11-26 00:53:40.07241	5	Tom Rowlands
658	\N	American drummer and percussionist.	2017-11-23 19:40:46.389113	2017-11-26 00:53:47.073156	18	Alan Estes
662	\N	American jazz saxophonist, born 7  June 1928 in Los Angeles, USA.	2017-11-23 19:40:46.399764	2017-11-26 00:54:15.078379	18	Anthony Ortega
664	\N	Musician that has worked with Frank Zappa, Giorgio Moroder, and others, and has provided music for films, produced albums, and released solo albums. He works from his own studio in L.A.	2017-11-23 19:40:46.405615	2017-11-26 00:54:29.082683	18	Arthur Barrow
667	\N	Billy Mundi (born 25th September, 1942, in San Francisco/CA) is an American drummer.	2017-11-23 19:40:46.413954	2017-11-26 00:54:50.081966	18	Billy Mundi
669	\N	American drummer - percussionist.\r\n\r\nFather of [a=Anthony Zimmitti].\n	2017-11-23 19:40:46.419279	2017-11-26 00:55:04.069484	18	Bob Zimmitti
672	\N	American reeds and flute player, born 2. May 1933 in Cleveland, Ohio, brother of [a290335]. Most noted for his work with [a92623].	2017-11-23 19:40:46.428008	2017-11-26 00:55:25.076326	18	Bunk Gardner
675	\N		2017-11-23 19:40:46.437488	2017-11-26 00:55:46.071679	18	Chunky (3)
678	\N	American keyboardist and composer.\r\nBorn September 21, 1932 in Flint, MI\r\nStarted carrier playing piano with Herbie Mann.\r\nFounding member of The Mothers Of Invention.\r\nCurrently touring with The Grande Mothers	2017-11-23 19:40:46.446931	2017-11-26 00:56:07.081093	18	Don Preston
680	\N	Woodwind player (mostly oboe, English horn, but also saxophone and sarrusophone).	2017-11-23 19:40:46.452811	2017-11-26 00:56:21.072425	18	Earl Dumler
683	\N	Ernie Tack was with the NBC Orchestra on the Tonight Show for 20 years.  He has been one of the most sought-after bass-trombonists in Hollywood for decades, having worked with Neil Diamond and Ray Coniff, among many others.	2017-11-23 19:40:46.462438	2017-11-26 00:56:43.077507	18	Ernie Tack
685	\N	American composer, lyricist, songwriter, guitarist, vocalist, bandleader, conductor, producer, filmmaker. \r\nBorn 21 December 1940 in Baltimore, Maryland, USA. \r\nDied 4 December 1993 in Los Angeles, California, USA. \r\n\r\n[b]Frank Vincent Zappa[/b] was of Italian origins, his grandfather having arrived in America from Partinico, Sicily. [b] Frank Zappa[/b] grew to be one of the most accomplished composers of the rock era, his music combining an understanding and appreciation for such contemporary classical figures as [b][a=Igor Stravinsky][/b], [b][a=Karlheinz Stockhausen][/b] and [b][a=Edgard Varèse][/b]. These influences, coupled with an affection for late '50s doo-wop, rock & roll and skillful guitar-heavy rock, dominated pop in the '70s. However, [b]Zappa[/b] was also a keen satirist, whose reserves of scorn and parody seemed bottomless and whose wicked sense of humor and absurdity continued to delight his numerous fans - even when his lyrics crossed the broadest bounds of taste.\r\n\r\n[b]Zappa[/b] was also a prolific record-maker in his time, astutely producing massive amounts of music on his own labels of [b][l=Bizarre Records], [l=Straight][/b] & [b][l=Barking Pumpkin Records][/b] and through distribution deals with [b][l=Rykodisc][/b] and [b][l=Rhino Entertainment Company][/b]. This after long unhappy associations with industry giants like [b][l=Warner Bros. Records][/b] and the now-defunct [b][l=MGM][/b]. In the '80s, [b]Zappa[/b] then gained the rights to his old albums and began to reissue them, first on his own and then through [b][l=Rykodisc][/b]. Throughout his recording career Zappa stayed consistently at the forefront of technology, investing in equipment, home-studio facilities and vault storage that would enable the fullest control over production of his works.\r\n\r\nIn 1988 his official autobiography emerged and he embarked on a world tour. Sadly, that was the end of his live performing when, in late 1991, it was confirmed that [b]Zappa[/b] was seriously ill with cancer. Nevertheless, his schedule of album releases continued to be rapid. The [l301432] continues to this day with his wife [a498325] (aka [a2117913]) as the figurehead of the ZFT until her death in 2015. The [l301432] produced numerous posthumous releases and remasters of the back catalog. The children inherited the ZFT and remain in the industry,  [a237886] the force behind [url=http://www.discogs.com/artist/2843814-Dweezil-Zappa-Plays-Zappa] "[i]Zappa Plays Zappa[/i]" [/url] as well as an accomplished guitarist in his own right; [a296279], [a1635870] and the more reserved [a296276].\r\n\r\nInducted into Rock And Roll Hall of Fame in 1995 (Performer). \r\n	2017-11-23 19:40:46.470508	2017-11-26 00:56:57.100133	18	Frank Zappa
689	\N	Born: June 22, 1947, Bronx, New York\r\n\r\nAmerican vocalist, member of The Turtles and the 'Eddie' of vocal parody & harmony duo [a296019], who performed solo and with Frank Zappa bands.\r\n	2017-11-23 19:40:46.486948	2017-11-26 00:57:26.078859	18	Howard Kaylan
692	\N	American producer, songwriter and musician.\r\nBorn in Chicago, 1945.\r\nProduced albums for artists such as [a114483], [a168907], [a395463] and [a263532]	2017-11-23 19:40:46.498689	2017-11-26 00:57:47.082657	18	James William Guercio
694	\N	French jazz violinist and composer born 29 September 1942 in Avranches, France.\r\n\r\n	2017-11-23 19:40:46.50623	2017-11-26 00:58:01.07859	18	Jean-Luc Ponty
695	\N		2017-11-23 19:40:46.510507	2017-11-26 00:58:08.073808	18	Jeff Simmons
698	\N	Born: 1st February 1938, El Paso, Texas, USA.\r\nDied: 1st November 2008, Traunstein, Germany. \r\n\r\nAmerican drummer and vocalist. Best known for his work with [a=Frank Zappa] and original drummer in the first line-up of '[url=http://www.discogs.com/artist/286086-Mothers-The]The Mothers[/url]', with his introductory line "Hi, boys and girls - I’m Jimmy Carl Black, and I’m the Indian of the group”. Also referred to by [a=Don Van Vliet] as "Indian Ink" during their musical association. Black co-founded several groups and featured on many recordings after departing Zappa's band - with whom he made the first 8 albums. However, JCB appeared on some Zappa works thereafter, such as the vocalist on "Harder Than Your Husband" - a number on which he can also be seen performing with FZ (in Albuquerque) on friend John Cline's vid-clip on YouTube (To which FZ agreed).\r\n\r\nJCB met his wife Moni ([a3133949]) at a gig (whilst drumming with the Farrell/Black Blues Band) in Traunstein, Germany when he was 58. He spoke no German and she spoke no English, although the fact she had been a devoted Mothers fan for 25 years obviously helped communications and they married 11 months later. Soulmates until he passed away, Moni regularly accompanied him to Zappanale events. Black had almost completed a book of his life story when he died and it was finally published in the Fall of 2013, entitled "For Mother's Sake - The Memoirs And Recollections Of Jimmy Carl Black 1938-2008".\r\n\r\nBlack was first a member of The Soul Giants with [a=Roy Estrada] and [a=Ray Collins], who were joined by Zappa, whose concepts subsequently morphed the band into a Mothers line-up. After his long association with FZ, Black formed [a=Geronimo Black] with [a=Bunk Gardner] in 1970 (Geronimo Black also being the name of his 3rd son). He then co-founded [url=http://www.discogs.com/artist/1663374-Grandmothers-The]The Grandmothers[/url] with Gardner, [a=Don Preston] and Collins in 1980. He also formed his own label '[l95759]', performed with [url=http://www.discogs.com/artist/1155497-Muffin-Men-The]The Muffin Men[/url] and  and has collaborated with a diverse number of artists, including: [a=Arthur Brown], [a=Mannish Boys], [a=Ant-Bee], [a=Eugene Chadbourne] (Jack & Jim Show), [a=Sandro Olivia] (Black Olive), [a=Zjakki Willems], [url=http://www.discogs.com/artist/3705791-X-tra-Combo-The]The X-tra Combo[/url], [a=Ener Bladezipper], [a=Ella Guru] and the artist who also worked on "The Jimmy Carl Black Story", [a=Jon Larsen].	2017-11-23 19:40:46.522817	2017-11-26 00:58:29.072077	18	Jimmy Carl Black
699	\N	American woodwind player.	2017-11-23 19:40:46.527308	2017-11-26 00:58:36.071804	18	Joanne Caldwell McNabb
700	\N	American saxophonist and flutist.	2017-11-23 19:40:46.53138	2017-11-26 00:58:43.068847	18	Joel Peskin
702	\N	American session musician and songwriter, played saxophone, clarinet and flute. Among other he was involved in various [a=Frank Zappa] recordings.\r\n----\r\nJohnny Rotella was born in Jersey City and grew up in North Bergen, New Jersey where he began his music career in his teens, playing clarinet and saxophone with many bands.\r\nDuring World War II, he was with the 389th ASF Band stationed at Ft. Monmouth, New Jersey. While in the service he looked forward to his visits to New York City where he studied with the finest teachers including Simeon Bellison on clarinet, Joe Allard on saxophone and Victor Goldring on flute.\r\nAfter serving in the Army, Johnny joined Raymond Scott’s band in New York and later, the bands of Benny Goodman and Tommy Dorsey. On a trip to California with Benny Goodman, he decided to make Hollywood his new home, and began working as a studio woodwind player.\r\nJohnny played in the reed section with Jerry Gray (arranger for Artie Shaw and chief arranger for The Glenn Miller Orchestra) on “Club 15”, a daily radio show on CBS featuring Bob Crosby, the Andrews Sisters, the Modernaires and Jo Stafford, and on all of Jerry Gray’s albums. Over the years he recorded with a wide range of artists, from Neil Diamond to Frank Zappa, was featured on the twin altos with the Billy Vaughn Orchestra and played on many sessions with Jimmie Haskell, Earle Hagen and Buddy Baker. He was a band regular on the “Sonny and Cher Comedy Hour” and played on many other television shows, including Andy Williams and Frank Sinatra. In addition to studio work, Johnny enjoyed playing in the orchestra for Broadway shows and other theatre productions in Los Angeles.\r\nA songwriter since his high school days, Johnny became a member of ASCAP in 1954. Always looking to improve his knowledge of music, he studied The Schillinger System of Musical Composition with Franklyn Marks, a longtime Walt Disney composer. He collaborated with such well-known lyricists as Johnny Mercer, Sammy Cahn, Ray Gilbert, Sidney Clare, Abbey Lincoln, Franz Steininger and Jerry Gladstone. Many of those collaborations are featured on his “Nothing But The Best” compilation CDs.\r\n	2017-11-23 19:40:46.541145	2017-11-26 00:58:57.086381	18	John Rotella
704	\N	American saxophonist, arranged and composer (died 7 May 2007). He was in [a=Frank Zappa]'s band during the 1988 world tour.	2017-11-23 19:40:46.550698	2017-11-26 00:59:11.075749	18	Kurt McGettrick
706	\N	Malcolm McNab is a trumpeter and player of other brass instruments, and a Los Angeles-based session musician.	2017-11-23 19:40:46.559783	2017-11-26 00:59:25.07405	18	Malcolm McNab
711	\N	American vocalist, saxophonist and keyboard-player. \r\n\r\nNapoleon Murphy Brock has performed with artists such as Frank Zappa, George Duke and Dee Dee Bridgewater. \r\n	2017-11-23 19:40:46.583634	2017-11-26 01:00:00.081397	18	Napoleon M. Brock
714	\N	American drummer and teacher from Los Angeles, California. He was born 1944 in Berkeley, California.	2017-11-23 19:40:46.598402	2017-11-26 01:00:22.071549	18	Ralph Humphrey
716	\N	American guitarist and vocalist, appears on various [a=Frank Zappa] productions.	2017-11-23 19:40:46.605213	2017-11-26 01:00:36.075355	18	Robert 'Frog' Camarena
720	\N	Trumpet/flugelhorn player.	2017-11-23 19:40:46.617215	2017-11-26 01:01:03.079039	18	Sal Marquez
723	\N	American bassist, born June 10, 1951 in Salt Lake City, Utah, USA. \r\n\r\nHe is the son of jazz educator, musician and composer [a=William Fowler (3)] and [a=Beatrice Fowler], brother of trumpeter [a=Walt Fowler], saxophonist [a=Steve Fowler], trombonist [a2636463] and bassist [a=Ed Fowler]. \r\n	2017-11-23 19:40:46.626104	2017-11-26 01:01:24.074243	18	Tom Fowler
725	\N	American guitarist, also played piano and did vocals on [a=Frank Zappa] productions.	2017-11-23 19:40:46.631318	2017-11-26 01:01:38.086203	18	Tony Duran
728	\N	Vocalist, keyboardist and songwriter.  Wife of [a37731]	2017-11-23 19:40:58.381675	2017-11-26 01:02:00.086965	18	Gayle Moran
730	\N	French jazz violinist and composer born 29 September 1942 in Avranches, France.\r\n\r\n	2017-11-23 19:40:58.390701	2017-11-26 01:02:14.068549	18	Jean-Luc Ponty
731	\N	Goodman (born March 16th, 1943, in Chicago) is an American violinist and guitarist.	2017-11-23 19:40:58.395304	2017-11-26 01:02:21.069976	18	Jerry Goodman
732	\N	British guitarist - songwriter (Not to be confused with the pop songwriter [b][a=John McLaughlin (2)][/b])\r\n* 4. January 1942 in Kirk Sandall in Yorkshire, England\r\nA household name since the early '70s, John McLaughlin was a fusion guitarist when he led the Mahavishnu Orchestra. He started on guitar when he was 11 and was initially inspired by blues and swing players. John McLaughlin worked with David Bowie, Alexis Korner, Graham Bond, Ginger Baker, and others in the 1960s and played free jazz with Gunter Hampel for six months. His first album was a classic (1969's Extrapolation) and was followed by an obscurity for the Dawns label with John Surman, a quintet set with Larry Young (Devotion), and My Goals Beyond in 1970 which was half acoustic solos and half jams involving Indian musicians.\r\nIn 1969, John McLaughlin moved to New York to play with Tony Williams' Lifetime and he appeared on two classic Miles Davis records: In a Silent Way and Bitches Brew. In 1971, John McLaughlin formed the [a=Mahavishnu Orchestra], a very powerful group often thought of as rock but having the sophisticated improvisations of jazz. After three influential albums (The Inner Mounting Flame, Birds of Fire, and Between Nothingness and Eternity), the group disbanded in 1973. John McLaughlin, who recorded a powerful spiritual album with Carlos Santana that was influenced by John Coltrane, put together a new Mahavishnu Orchestra in 1974 that, despite the inclusion of [a=Jean-Luc Ponty], failed to catch on and broke up by 1975. John McLaughlin then surprised the music world by radically shifting directions, switching to acoustic guitar and playing Indian music with his group Shakti. They made a strong impact on the world music scene (which was in its infancy) during their three years. John McLaughlin then went back and forth between electric and acoustic guitars; leading the One Truth Band; playing in trios with Al DiMeola and Paco De Lucia; popping up on some mid-'80s Miles Davis records; forming a short-lived third version of the Mahavishnu Orchestra (with saxophonist Bill Evans); recording an introspective tribute to pianist Bill Evans; and, in 1993, touring with a rollicking jazz trio featuring Joey DeFrancesco and drummer Dennis Chambers. Throughout his productive career John McLaughlin has recorded as a leader for Marmalade, Dawns, Douglas International, \t[l=CBS], [l=Warner Brothers], and Verve.	2017-11-23 19:40:58.399857	2017-11-26 01:02:28.081604	18	John McLaughlin
733	\N	Bassist.	2017-11-23 19:40:58.404519	2017-11-26 01:02:35.092124	18	Jonas Hellborg
735	\N	Bassist.	2017-11-23 19:40:58.413605	2017-11-26 01:02:49.06969	18	Ralphe Armstrong
736	\N	b. February 5, 1941 - Dublin, Ireland\r\n\r\nJazz bassist, also credited for photography.\r\n	2017-11-23 19:40:58.4183	2017-11-26 01:02:56.085217	18	Rick Laird
738	\N		2017-11-23 19:41:08.385254	2017-11-26 01:03:11.073441	18	Bernhard Beibl
739	\N		2017-11-23 19:41:08.38979	2017-11-26 01:03:18.078972	18	Charlie Prince
744	\N		2017-11-23 19:41:08.406128	2017-11-26 01:03:53.080763	18	Eliot Cromwell
745	\N	German drummer. 	2017-11-23 19:41:08.409113	2017-11-26 01:03:59.062432	18	Emil Hachfeld
746	\N	Austrian electric fusion / jazz rock guitarist, born 15 April 1967.	2017-11-23 19:41:08.412366	2017-11-26 01:04:07.081829	18	Gerald Gradwohl
748	\N	Austrian singer, dancer and percussionist, born in 1970.	2017-11-23 19:41:08.417933	2017-11-26 01:04:21.073334	18	Iris Camaa
749	\N	Jerome Froese, born November 24, 1970 in Schoeneberg, West Berlin, is son to [a=Edgar Froese].	2017-11-23 19:41:08.4208	2017-11-26 01:04:28.086058	18	Jerome Froese
751	\N		2017-11-23 19:41:08.426835	2017-11-26 01:04:42.076276	18	Karsten Dorinth
754	\N	German bass player, he was found dead from serious head injuries on July 11th 1983 in a park in Berlin.	2017-11-23 19:41:08.435737	2017-11-26 01:05:04.079906	18	Kurt Herkenberg
755	\N		2017-11-23 19:41:08.438276	2017-11-26 01:05:11.076942	18	Lanse Hapshash
756	\N	Austrian composer, arranger and musician (flute, saxophone, keyboards), born 4 September 1968 in Vienna, Austria.	2017-11-23 19:41:08.440905	2017-11-26 01:05:17.079249	18	Linda Spa
814	\N	\N	2017-11-23 19:44:34.376511	2017-11-23 19:44:34.376511	20	Gillian Gilbert
817	\N	\N	2017-11-23 19:44:34.389516	2017-11-23 19:44:34.389516	20	Stephen Morris
18	\N		2017-11-23 18:54:14.394085	2017-11-25 23:31:17.56058	14	Al McKay
19	\N	Trombone player.	2017-11-23 18:54:14.398694	2017-11-25 23:32:24.073352	14	Alexander Thomas
20	\N	Saxophonist, born 11 October 1950. Member of Earth, Wind & Fire from 1973 to 1993.	2017-11-23 18:54:14.402849	2017-11-25 23:34:02.081429	14	Andrew Woolfolk
25	\N	Soul funk drummer\r\n\r\n[b]Note: Please do not confuse with the session soul vocalist [a=Fred White (2)][/b]\r\nBorn on 13.01.1955 in Chicago, Illinois, U.S.\r\nBrother of [a=Earth, Wind & Fire]'s [a=Maurice White] & [a=Verdine White]. \r\nHe was enlisted as a second drummer for [a=Earth, Wind & Fire] in 1973 and left the group in the 80's.\r\n	2017-11-23 18:54:14.424628	2017-11-25 23:39:10.08526	14	Fred White
27	\N	US-American soul, funk & disco singer. Born on 30th December 1948, Los Angeles, California, U.S.A.\r\nDied on 2nd May 2014, Los Angeles, California, U.S.A.	2017-11-23 18:54:14.433405	2017-11-25 23:39:24.090882	14	Jessica Cleaves
29	\N	Born on August 3, 1951 in Louisville (Kentucky), Leo Johnny Graham began playing the guitar professionally at the age of 16.  He played for fun at dances and social events for several years before considering it as a professional job. While at college, Johnny majored in music and developed his compositional skills to benefit his chief goal of writing. In 1973, Johnny Graham joined the legendary group Earth, Wind and Fire where he performed for more than ten years, as the group's lead guitarist. One of Johnny's most memorable solo's can be heard on the infamous smash hit single entitled "Love's Holiday". Throughout his music career he has performed with the notable likes of Lalo Schifrin, Splendor, and The Temptations. In later years he joined Al McKay's L.A. All-Stars with former Earth, Wind & Fire band members Freddie White and Andrew Woolfolk. Presently, Johnny lives in Japan where he has performed with several groups including Soul Sauce. During his leisure time Johnny loves to race cars and boats.	2017-11-23 18:54:14.439139	2017-11-25 23:39:37.08804	14	Johnny Graham
30	\N	Keyboardist, songwriter, producer, music arranger and one of the founding members of the music group [a=Earth, Wind & Fire]. Born 19 June 1953.\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 18:54:14.441805	2017-11-25 23:39:44.080183	14	Larry Dunn
31	\N	Trumpeter and a founding member of Earth, Wind & Fire. He has also arranged and conducted sessions for such as Marvin Gaye, New Birth and Sylvester and played big-band jazz with Cab Calloway, Gerald Wilson and Louis Bellson orchestras. He started his solo career in 1980 with an album "Our Music Is Your Music" on his own Esoteric label and released many other albums too throughout the 80's and 90's.	2017-11-23 18:54:14.444556	2017-11-25 23:39:51.07799	14	Leslie Drayton
760	\N		2017-11-23 19:41:08.4577	2017-11-26 01:05:45.082447	18	Ralf Wadephul
761	\N	A native of Britain, Steve Jolliffe has been an active keyboardist, flutist and saxophonist for over 35 years. His career started in 1967, when he met Rick Davies and formed a group called The Joint, which, after Steve left, evolved into Supertramp. Jolliffe's interest in classical music led him to the "Berlin High School for Music" in 1969. He was the first student accepted there who didn't have the ability to read music. And while at the school, he met Edgar Froese, and together with Klaus Schulze toured Germany as one of the earliest incarnations of Tangerine Dream. \r\n\r\nThat stint lasted nearly a year, and then Steve left Tangerine Dream and returned to England. There he joined a blues/rock band called Steamhammer, and toured Europe with them for the next several years. In 1973 Jolliffe left that group and scored several films, including the award-winning documentary Tattoo. \r\n\r\nSteve rejoined Tangerine Dream in 1978 and with Froese, Chris Franke and Klaus Krüger, recorded the album Cyclone. To this day, Cyclone remains a controversial album amongst TD aficionados, mostly due to Steve's vocals and lyrics. The quartet toured Europe that year and played to crowds of up to 100,000. Shortly afterward, Jolliffe left TD for the second time and went back to England to pursue a solo career. \r\n\r\nHe recorded several albums in the 1980s. Two of them, Journeys out of the Body and Beyond the Dream, are available through Horizon Music. Journeys, a 1982 release, featured a collaboration with the late guitarist Tony Duhig, formerly of Jade Warrior. Two years later, Steve issued Beyond the Dream, which once again featured lyrics and vocals. He also collaborated with Klaus Schulze on a Wahnfried album called Miditation. Jolliffe spent the rest of the decade recording library discs, which are meant to be used in films at will and not intended to be sold to the general public. \r\n\r\nIn 1990 Steve moved to America and released the album Escape the following year. During this time Jolliffe partnered with Horizon Music to distribute many of his CD's and, after releasing Warrior in 1992, became Horizon's first signee. He moved back to England in 1994 and released Alien, which was less electronic than previous efforts and featured extensive use of flute and saxophone. Then Steve explored a new musical direction with the ambient/trance CD Zanzi. He took this title from a French game of chance, and the disc was chosen by the nationally syndicated radio program Musical Starstreams as one of its Top Ten albums of 1996. Jolliffe also found the time to work with Eat Static members Merv Pepler and Joie Hinton (formerly of Ozric Tentacles) on their album Science of the Gods. After that, he released Omni, a logical follow-up to Zanzi. \r\n\r\n1999 saw Steve release a CD called Deep Down Far. Like much of his varied work, this disc draws on elements of traditional electronic, ambient and classical music structures. The opening track has been used in advertisements on the Discovery Channel in England. A year later, Jolliffe put out a compilation CD called Invitation, which features music from each of the aforementioned albums. \r\n\r\nSteve Jolliffe still lives in England and continues to collaborate occasionally with Pepler and Hinton.\r\n	2017-11-23 19:41:08.461945	2017-11-26 01:05:52.075405	18	Steve Jolliffe
762	\N		2017-11-23 19:41:08.466938	2017-11-26 01:05:59.074548	18	Steve Schroyder
763	\N		2017-11-23 19:41:08.471177	2017-11-26 01:06:06.079166	18	Thorsten Quaeschning
765	\N		2017-11-23 19:41:08.478839	2017-11-26 01:06:20.070987	18	Volker Hombach
769	\N	Born 1940 in London. Percussionist since the 1950s. Joined [a1290833] in 1961.\r\nSince the mid 1970s arranger, conductor and record producer, composer for film and TV.	2017-11-23 19:41:20.386861	2017-11-26 01:06:48.077573	18	Brian Bennett
770	\N		2017-11-23 19:41:20.390996	2017-11-26 01:06:55.075099	18	Brian Locking
771	\N	English guitarist, singer, songwriter and producer, born 2 November 1941 in Bognor Regis, Sussex.	2017-11-23 19:41:20.398126	2017-11-26 01:07:02.084676	18	Bruce Welch
772	\N	Note: For the piano/keyboard player and library composer use [a468461]	2017-11-23 19:41:20.402343	2017-11-26 01:07:09.076101	18	Cliff Hall (2)
774	\N	Born : Jul 6, 1939 in London, England\r\nDied: March 19, 2011 of cancer.\r\n	2017-11-23 19:41:20.410869	2017-11-26 01:07:22.08108	18	Jet Harris
777	\N		2017-11-23 19:41:20.425615	2017-11-26 01:07:43.078067	18	Mark Griffiths
778	\N	English drummer, author and record producer, born 2 March 1943 in Hampstead, England, UK, died 28 November 2005 in London, England, UK..	2017-11-23 19:41:20.429682	2017-11-26 01:07:50.075355	18	Tony Meehan
780	\N	Born on the 31st of january 1939 in London.	2017-11-23 19:41:32.376511	2017-11-26 01:08:05.073813	18	Brian Gregg
781	\N		2017-11-23 19:41:32.380725	2017-11-26 01:08:12.069107	18	Bryan Irwin
783	\N		2017-11-23 19:41:32.388368	2017-11-26 01:08:25.075654	18	Dave Watts (3)
784	\N	Guitarist, born October 8, 1940.\r\nFather of [a=Matthew Bellamy].	2017-11-23 19:41:32.392465	2017-11-26 01:08:31.073476	18	George Bellamy
786	\N		2017-11-23 19:41:32.400367	2017-11-26 01:08:45.072657	18	Norman Hale
787	\N		2017-11-23 19:41:32.404896	2017-11-26 01:08:51.087436	18	Peter Holder
788	\N		2017-11-23 19:41:32.409525	2017-11-26 01:08:58.069579	18	Ray Randall
789	\N		2017-11-23 19:41:32.414466	2017-11-26 01:09:04.069453	18	Robb Huxley
792	\N	[b]Engineer[/b]\r\n\r\nHas worked at [l342815]. \r\n	2017-11-23 19:41:32.429585	2017-11-26 01:09:26.076733	18	Stuart Taylor
793	\N	Born 24th December 1944, Newcastle upon Tyne, North East England, UK	2017-11-23 19:41:32.434261	2017-11-26 01:09:33.080977	18	Tab Martin
795	\N	Born: July 8, 1961, Basildon, Essex, England\r\n\r\nKeyboardist for [a=Depeche Mode].\r\n	2017-11-23 19:44:11.41932	2017-11-26 01:09:46.082831	20	Andrew Fletcher
798	\N	Born: July 3, 1960, Woodford, London, England	2017-11-23 19:44:11.433711	2017-11-26 01:10:07.092993	20	Vince Clarke
799	\N	German studio drummer.	2017-11-23 19:44:22.371487	2017-11-26 01:10:14.074979	20	Andreas Hohmann
802	\N	Portuguese sound and remastering engineer. In 1991 was a member of [a4654]	2017-11-23 19:44:22.380541	2017-11-26 01:10:35.076891	20	Fernando Abrantes
804	\N		2017-11-23 19:44:22.387898	2017-11-26 01:10:50.081443	20	Fritz Hilpert
805	\N	German musician, born 26 December 1953.	2017-11-23 19:44:22.39086	2017-11-26 01:10:57.077865	20	Henning Schmitz
806	\N	Guitarist.	2017-11-23 19:44:22.393497	2017-11-26 01:11:04.082846	20	Houschäng Nejadépour
807	\N	German musician, producer and DJ. He was born 31 May 1952 in Berchtesgaden, Germany. During 1975-90 [l519800] was a member of [a4654].	2017-11-23 19:44:22.396258	2017-11-26 01:11:11.073956	20	Karl Bartos
811	\N	Founding member of [a4654], born 20 August 1946 in Krefeld, Germany.	2017-11-23 19:44:22.410771	2017-11-26 01:11:39.073666	20	Ralf Hütter
813	\N	British musician, songwriter and producer.\r\nb. January 4, 1956.\r\nSumner was his mother's maiden name and is the surname on his birth cert, he was adopted by his step father John Dickin.\r\n	2017-11-23 19:44:34.372299	2017-11-26 01:11:53.063582	20	Bernard Sumner
818	\N	Franco-English musician, bassist, producer and songwriter, born 15 May 1972 in Chevreuse, France.	2017-11-23 19:44:34.393553	2017-11-26 01:12:28.065954	20	Tom Chapman (2)
819	\N	Producer, Composer, Programmer, Bassist, Keyboardist.	2017-11-23 19:44:45.373736	2017-11-26 01:12:35.068522	20	Alex Swift
822	\N	British electronic musician, singer, songwriter, born January 21, 1965 in Bristol, Great Britain.\r\n	2017-11-23 19:44:45.38677	2017-11-26 01:12:57.079876	20	Robert Del Naja
32	\N	Known to his friends as "Reese" Maurice White was an American R&B and funk singer (born on December 19, 1941 in Memphis, Tennessee, died on February 3rd, 2016 in Los Angeles). A childhood friend of [a=Booker T. Jones] he was bitten by the music bug early and after finishing high school moved to Chicago where he worked as a session musician, usually playing drums, on many [l=Chess] sessions of the early 60s.\r\n\r\nHe spent the mid to late 60s working with [a=Ramsey Lewis] and then formed [a=Earth, Wind & Fire] in 1969 with local Chicago singers, but relocated the band to Los Angeles in 1970 where they found success. He is the brother of [a=Fred White] and [a=Verdine White].\r\n\r\nSadly, suffered from the illness known as Parkinson´s since the mid 90´s.\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 18:54:14.447163	2017-11-25 23:39:58.089481	14	Maurice White
37	\N	Singer and songwriter, born 8 May 1951 in Denver, Colorado.\r\n\r\nOne of the leaders of Earth, Wind & Fire since 1971. Also active as a solo artist since 1982, recording gospel and R&B as well as pop hits like 1984's "Easy Lover", a duet with [a=Phil Collins].\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\n	2017-11-23 18:54:14.460259	2017-11-25 23:40:32.091905	14	Philip Bailey
40	\N	[b]Singer - songwriter - producer - drummer[/b]\r\n\r\nBorn on 07.10.1962 in Sacramento, California, U.S.A.\r\nDied on 15.04.2009\r\nBrother of guitarist [a=Michael Brookins]\r\nAlso played keyboards, lead guitar, bass guitar and several horns. \r\nToured with [a=Earth, Wind & Fire] (as musical director), [a=Philip Bailey], [a=George Duke], and was a session musician for many artists, including [a=Stanley Clarke], [a=Nancy Wilson] and [a=Whispers].\r\n	2017-11-23 18:54:14.468919	2017-11-25 23:40:53.093975	14	Robert Brookins
41	\N	Latin funk - jazz funk - soul guitarist - songwriter\r\nb. May 30, 1951 - d. February 29, 2012\r\nHas recorded as a not consistent full member of [a=Earth, Wind & Fire], in different periods of time.\r\nHas also played as session man for [a=The Crusaders], [a=The Jackson 5], [a=Lamont Dozier], [a=Ramsey Lewis], [a=Randy Crawford], [a=George Duke], [a=Wayne Henderson] and [a=Hubert Laws].\r\n	2017-11-23 18:54:14.471769	2017-11-25 23:41:00.087486	14	Roland Bautista
45	\N	[b]Drummer[/b]\r\n\r\nBorn 23.12.1962 in Atlanta, Georgia, U.S.A.\r\nHe has worked as session musician with [a=Steely Dan], [a=Bruce Hornsby], [a=Stanley Clarke], [a=David Sanborn], [a=Bette Midler], [a=Al Jarreau], [a=Paula Abdul], [a=Lee Ritenour] etc.\r\n	2017-11-23 18:54:14.483962	2017-11-25 23:41:27.082909	14	Sonny Emory
46	\N	American bassist and songwriter, younger brother of [a=Maurice White].\r\nBorn: 25 July 1951 (Chicago, Illinois, USA)\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 18:54:14.486669	2017-11-25 23:41:34.163826	14	Verdine White
48	\N	Keyboardist - Producer - Composer\r\n\r\nHusband of [a=Wanda Vaughn]\n	2017-11-23 18:54:14.492056	2017-11-25 23:41:48.087796	14	Wayne Vaughn
50	\N	Keyboardist, Singer, Songwriter, Producer and Music Arranger.\r\nb. 25th December, 1939 in Marshall, Missouri, U.S.A. \r\n	2017-11-23 18:54:26.353464	2017-11-25 23:42:03.07791	14	Bob James
51	\N	Chuck Loeb (born July 12, 1955 in Suffern, New York, USA - died July 31, 2017) was an American jazz guitarist, composer and producer. Married to singer [a=Carmen Cuesta], and father of [a=Lizzy Loeb] and [a=Christina Loeb].	2017-11-23 18:54:26.357578	2017-11-25 23:42:10.086737	14	Chuck Loeb
53	\N	American jazz guitarist with a long career stretching back to the 60s, born 2 March 1948 in Torrance, California, USA\r\n\r\n	2017-11-23 18:54:26.365471	2017-11-25 23:42:24.092331	14	Larry Carlton
54	\N	Guitarist and composer, born 11 January 1952 in Los Angeles, California.\r\nWith over 30 charting "contemporary jazz" hits since 1976, Ritenour has been busy, contributing to over 3000 sessions. At the age of 16, while providing guitar at his first session with [a=The Mamas & The Papas], he was nicknamed "Captain Fingers" due to his dexterity.\r\n	2017-11-23 18:54:26.369358	2017-11-25 23:42:31.092177	14	Lee Ritenour
55	\N	American soul and jazz bassist,  born 8 December 1955 in Philadelphia, raised in San Diego. \r\nIn his long career he has recorded with a wide variety of artists including [a=Anita Baker], [a=Michael Jackson], [a=Quincy Jones] and [a=Elton John].\r\n	2017-11-23 18:54:26.373383	2017-11-25 23:42:38.084837	14	Nathan East
56	\N	Saxophonist as well as player of other instruments of the woodwind family.\r\n\r\nHe and [a=Ralph Lamb] (together known as [url=http://www.discogs.com/artist/Easy+Access+Orchestra%2C+The]The Easy Access Orchestra[/url]) form the horn section of [url=http://www.discogs.com/artist/Herbaliser+Band%2C+The]The Herbaliser Band[/url].\r\n\r\nAndy Ross has worked with [url=http://www.discogs.com/artist/Herbaliser%2C+The]The Herbaliser[/url], [a=Roots Manuva] and [a=Just Jack].\r\n	2017-11-23 18:54:37.35435	2017-11-25 23:42:45.076526	14	Andy Ross (2)
60	\N	Plays Trombone, Euphonium & Piano. Well respected performer, composer, producer and teacher best known for his exceptional Trombone playing. Tutor at London Centre Of Contemporary Music.\r\nTouring, recording and performing credits include Tina Turner, Annie Lennox, Chaka Khan, Joe Cocker, Ray Charles, Paul Young, George Michael and Lauryn Hill.\r\nT.V, Radio and Film performances are extensive, including reputable performances on Top of the pops, The Tube and Radio One.\r\nSometimes credited as 'Fayaz Virgi'\r\n	2017-11-23 18:54:37.370726	2017-11-25 23:43:13.079282	14	Fayyaz Virji
65	\N		2017-11-23 18:54:37.392378	2017-11-25 23:43:48.096794	14	Graham Harvey
66	\N	British singer. She reached second place in the Eurovision Song Contest in 1998 with the song 'Where Are You'.	2017-11-23 18:54:37.395654	2017-11-25 23:43:55.097156	14	Imaani
69	\N	Son of [a4579181] and Armande Mallet. B. 19/02/1957 in Maurice.	2017-11-23 18:54:37.404309	2017-11-25 23:44:17.102092	14	Jean-Paul Maunick
71	\N	Born on November 25, 1950, North Carolina, U.S.A. She has been a versatile vocalist to this day, singing on many R&B, Disco, Pop, and House productions.\r\n\r\nHer aunt [a=Barbara Roy] inspired Jocelyn to spread her musical wings. She began her career in the 1970s as a studio singer for many groups and artists like [a=Musique], [a=Inner Life], [a=Bad Girls], [a=The Salsoul Orchestra], [a=Disco Tex & His Sex-O-Lettes], [a=Van McCoy], [a=Dazzle], [a=Revanche], [a=Cerrone], [a=Chic] and [a=Change].\r\n\r\nIn 1984, she started her solo career gaining great success with the single "Somebody Else's Guy," which reached #2 on the Billboard R&B Singles chart (#75 on the Hot 100). In 1985-87 she worked with [a=Culture Club] and toured with them. In 1990, some of her records started to be sampled by House and Rap producers. Among them: [a=Snap!] (who sampled her vocals from "Love's Gonna Get You"). Since then, her contribution to the world of dance music has been well recognized, working with countless artists of the genre, such as [a=Todd Terry], [a=Martha Wash], [a=Kym Mazelle], [a=Jamestown], [a=Cassius], [a=Right Said Fred], [a=DJ BoBo] and many, many others.\r\n\r\nContact e-mail address: jocelynbrownmusic [at] gmail [dot] com	2017-11-23 18:54:37.410021	2017-11-25 23:44:31.097375	14	Jocelyn Brown
77	\N	Trumpet player who performed with the [a=Redskins] as part of the Redskins Brass. Previous member of UK group Incognito.	2017-11-23 18:54:37.428675	2017-11-25 23:45:13.088164	14	Kevin Robinson (4)
145	\N	English musician and songwriter, born 12 March 1956 in Leytonstone, London, England, UK. Bass player and founding member of English heavy metal band [a=Iron Maiden].	2017-11-23 18:55:40.482562	2017-11-25 23:53:40.087397	8	Steve Harris
148	\N	British keyboardist, guitarist, songwriter, radio presenter and music promoter, born  11 October 1958 in Bristol, England.\r\n	2017-11-23 18:55:40.49481	2017-11-25 23:54:02.088574	8	Tony Hustings-Moore
81	\N	Born April 16, 1971 in Burnage, Greater Manchester, UK.  \r\n\r\nActor and musician (piano, vibes, drums and percussion).  Studied percussion at [l305416].  Worked as a session musician, and toured with [a763] and [a1396].  Has also performed live with [a17212], [a51262], [a8029] and [a14906].  Subsequently focussed on a successful acting career, notably in the BBC series Hotel Babylon, and also provides voiceovers for commercials and documentaries.\r\n\r\nHis father, Maxton Beesley, Sr., was a professional jazz drummer.  His mother was a jazz singer who performed under the stage name Chris Marlowe.\r\n	2017-11-23 18:54:37.438805	2017-11-25 23:45:44.085065	14	Max Beesley
84	\N	London based British trombone player.	2017-11-23 18:54:37.448738	2017-11-25 23:46:05.094151	14	Nichol Thomson
85	\N	Not to be confused with actress and glamour model [a=Pamela Anderson Lee], this Pamela or P.Y. Anderson is a vocalist who worked with D*Note. Her sister is [a=Jhelisa] and cousin is [a=Carleen Anderson].	2017-11-23 18:54:37.451416	2017-11-25 23:46:12.086112	14	Pamela Anderson
87	\N	10 Nov 1962 - 11 Jan 2007 R.I.P.\r\nBass player and founder member of Incognito, Paul "Tubbs" Williams has worked with a multitude of talent including George Michael, M People and Rosie Gaines. \r\n	2017-11-23 18:54:37.458016	2017-11-25 23:46:26.087508	14	Paul "Tubbs" Williams
88	\N	Timothy John Booth (born 4 February 1960) is an English singer, dancer, and actor best known as the lead singer from the band [a=James].\r\n\r\nBooth was born in Bradford, West Yorkshire, England and attended Shrewsbury School. Whilst a student at Manchester University studying drama, Booth encountered [a=Jim Glennie], [a=Paul Gilbertson] and [a=Gavan Whelan] in 1981 in the cellar bar of the University's student union. Impressed by Booth's distinctive dancing style, Gilbertson invited Booth to join their band as a dancer. Booth accepted the offer, and was soon promoted to lead singer and lyricist of [a=James]. \r\n\r\nAfter a struggle for success and recognition throughout the 1980s, James finally achieved commercial success in the early 1990s with the rise of the Manchester music scene, and their single "Sit Down" reaching number 2 in the UK Singles Chart.\r\n\r\nDuring 1995, Booth took a break from James and recorded an album with film composer Angelo Badalamenti, entitled [a=Booth and the Bad Angel]. He then returned to James to complete the recording of the album Whiplash, and stayed with the band until 2001 when he announced his departure to concentrate on other projects. \r\n\r\n2007 marked the return of James, with new tunes and extensive touring through 2008.\n	2017-11-23 18:54:37.461378	2017-11-25 23:46:33.084629	14	Paul Booth (2)
92	\N	One of the UK's finest funk bass players who came to the fore in the early 80's on boogie and jazz-funk tracks by Congress and Cargo. \r\n\r\n(Not related to Linda Taylor even though they both have Gonzales connections).\r\n	2017-11-23 18:54:37.472314	2017-11-25 23:47:00.081167	14	Randy Hope-Taylor
125	\N	Lloyd Grant is a Jamaica-born guitar player best known for playing lead guitar on the original version of "Hit The Lights", the very first song ever released by Metallica.  The song first appeared on the "Metal Massacre" compilation on Metal Blade Records.  At the time, Metallica was still in it's formative stages and Lloyd never played a live gig with the band.  Later pressings of the compilation replaced the version with Lloyd with a version the band recorded with [a=Dave Mustaine], who had become the band's lead guitarist once they had become a fully functional and performing live act.\r\n\r\nLloyd later played in a metal band called Defcon in the 1980's.\r\n\r\nLloyd made his first live appearance with Metallica in December 2011 as part of the band's 30th Anniversary celebration.\r\n	2017-11-23 18:55:29.405905	2017-11-25 23:51:19.084305	8	Lloyd Grant
193	\N	American musician, born June 3, 1964 in Los Angeles, California, USA. Guitarist and lyricist for [a=Slayer].\r\n	2017-11-23 18:56:04.420036	2017-11-25 23:59:18.086245	8	Kerry King
487	\N	Born: July 5, 1985 (Sheffield, England)\r\nBassist of Arctic Monkeys since 2006	2017-11-23 19:22:15.403427	2017-11-26 00:33:48.089774	24	Nick O'Malley (2)
94	\N	Guyanese-born Richard Bailey started his drumming career in Trinidad at the age of nine, sitting in on percussion, drums and even bass guitar with his elder brother Robert's ( [a255401], keyboard -OSIBISA) group, the top band in Trinidad and Tobago at that time. He also accompanied Robert, who played Hammond organ, to perform TV/Live concerts as a duo.\r\n\r\nAt twelve years old Richard's family moved to London where Richard went to school, sitting in on occasional gigs in his spare time, but while at school Richard also excelled in athletics, becoming Southern England school champ at 100 metres. His father, Emmanuel McDonald Bailey had held the world record for the 100 yards and won an Olympic Bronze for England.\r\nEven so, Richard decided to leave school at fifteen to play drums, leaving behind athletics.\r\n\r\nBy the time he was sixteen he was recording and touring the UK and USA with Johnny Nash and the great Bob Marley. By eighteen he had recorded Jeff Beck's biggest selling album “Blow By Blow” (1975, Epic/Sony Japan) to critical acclaim and appeared on the film soundtrack “Tommy” alongside Pete Townsend, Phil Chen and Roger Daltrey.\r\nThe next decade saw many recordings and tours varying in style from Rock to Reggae to Jazz to Pop and Latin including two world tours with Billy Ocean and Basia.\r\n\r\nRichard occupied the drumseat with the the excellent British acid jazz/rock/soul fusion collective “INCOGNITO” for the past 15 years.\r\nMore recently he has been an integral part of Steve Winwood's two important return-to-form recordings, 2003's About Time (Wincraft) and last year's Nine Lives (Columbia).\r\n	2017-11-23 18:54:37.478475	2017-11-25 23:47:14.08083	14	Richard Bailey
98	\N	One of UK's finest bass players. He was in [a=Jamiroquai] from 1993 - 1998. Writer and musician in [a=Incognito] as of 2016.	2017-11-23 18:54:37.492739	2017-11-25 23:47:42.08381	14	Stuart Zender
101	\N	Guitarist and producer born in London, UK. He also plays piano, flute and saxophone.\r\nHe has worked with artists such as Courtney Pine, Jason Rebello, Freddy Hubbard, Lonnie Liston Smith, Lenny White, Omar, Gary Barlow, Simply Red, US3, Cleveland Watkiss, Pee Wee Ellis, Ronnie Laws, Nelson Rangell, Maysa Leak, Matt Bianco and Karen Ramirez. As well as releasing solo material he has featured in the line up of numerous groups.\r\n	2017-11-23 18:54:37.50407	2017-11-25 23:48:03.083356	14	Tony Remy
104	\N	London-based singer.	2017-11-23 18:54:37.517747	2017-11-25 23:48:24.084737	14	Vula Malinga
105	\N	American jazz saxophonist, composer and bandleader, born 27 january 1953.\r\n	2017-11-23 18:54:49.35772	2017-11-25 23:48:31.084067	14	Bob Mintzer
108	\N	b. December 31, 1951 - Bronx, New York City\r\n\r\nJimmy Haslip is a bassist, keyboardist, producer and composer. He's also worked as an arranger, programmer and mixer.\r\n	2017-11-23 18:54:49.370312	2017-11-25 23:48:53.080488	14	Jimmy Haslip
111	\N	Born in 1954.\r\nDied December 23, 2013, of a brain hemorrhage.\r\nUS drummer and founding member of [a=Yellowjackets] from 1977 to 1986, born and raised in Detroit, Michigan, has worked with numerous acts such as [a=Roy Ayers], [a=Robben Ford], [a=Lionel Richie] and [a=Steely Dan] to name a few. Also credited with songwriting, arranging and production work.\r\n	2017-11-23 18:54:49.383837	2017-11-25 23:49:14.078441	14	Ricky Lawson
115	\N	Started at the age of 8 studying drums and turned pro at the age of 12 playing with his father's group at times.  Attended Ada Lewis Middle School in Philadelphia where he met Cedric Napolean and James Lloyd who later became Pieces of a Dream.\r\nTrained in Latin and African percussion and does background vocals. Recorded with Grover Washington, Jr. and Regina Belle.\n	2017-11-23 18:55:00.363177	2017-11-25 23:49:43.081564	14	Curtis Harmon
116	\N	Born in Philadelphia, PA on August 30, 1964. \r\nStarted playing piano at the age six. A graduate of Philadelphia's High School of Performing Arts.\r\nKeyboardist, composer, arranger and co-founder of Pieces of a Dream.\r\nNow based in Cleveland, OH.\r\n	2017-11-23 18:55:00.3673	2017-11-25 23:49:50.169572	14	James K. Lloyd
119	\N	Born on the 19th of February in 1962. Former bass player of [a=Metallica]. On the 27th of September in 1986, he died in a tour bus accident in Sweden.	2017-11-23 18:55:29.38037	2017-11-25 23:50:11.085205	8	Cliff Burton
150	\N	Born: April 19, 1957 in Birmingham\r\nTony Martin is best known as the former singer of [a=Black Sabbath], appearing on 5 studio albums between 1987 and 1995. He is second only to [a=Ozzy Osbourne] for most studio releases by a Black Sabbath singer. 	2017-11-23 18:55:52.353924	2017-11-25 23:54:17.08976	8	Anthony Philip Harford
211	\N	English musician, songwriter and record producer, born 9 January 1944 in Heston, Middlesex, England, United Kingdom. Father of [a=Scarlet Page].	2017-11-23 18:56:53.383356	2017-11-26 00:01:32.110125	1	Jimmy Page
120	\N	Metal guitarist.\r\n\r\nBorn September 13th, 1961, in La Mesa, California.\r\n\r\nFormer [a=Metallica] member, he was fired from the band in 1983 because of drug and alcohol problems that often resulted in violence against other band members. He would suffer from heroin addiction until 1995 when he was finally able to quit the drugs completely.\r\n\r\nMustaine formed [a=Megadeth] in 1984 with bassist [a=David Ellefson], fellow guitarist [a=Kerry King], and drummer Lee Rash. The band has gone through several lineup changes, but Mustaine has always remained as bandleader.\r\n\r\nIn 2002, Megadeth disbanded as a result of nerve damage (radial neuropathy) to Mustaine's left arm. He has since recovered feeling in his arm, and the band has reformed and begun to record and tour again.\r\n\r\nDave married Pam Casselberry in 1991, and they had two children together (a son, [url=http://www.discogs.com/artist/Justis+Mustaine]Justis David Mustaine[/url], born in 1992, and a daughter, Electra Nicole, born in 1998). He filed for divorce in 2006.\r\n	2017-11-23 18:55:29.384759	2017-11-25 23:50:18.076236	8	Dave Mustaine
122	\N	American bassist, born March 4, 1963 in Battle Creek, Michigan, USA. He is known for his work with [a=Metallica], [a=Voïvod] and [a=Flotsam And Jetsam]. He joined Metallica in 1986 after the untimely death of [a=Cliff Burton]. Newsted remained a member until 2001. After he left Metallica, he continued with his project [a=Echobrain], he played with [a=Ozzy Osbourne], and he joined Canadian metal band Voïvod. Newsted uses the pseudonym Jasonic as both his alias in Voïvod and the name of his music publishing company. He is also the founder of the [l=Chophouse Records] studio and label based in California.	2017-11-23 18:55:29.393302	2017-11-25 23:50:32.09253	8	Jason Newsted
123	\N	Kirk Lee Hammett (born 18. November 1962 in El Sobrante, California) is the lead guitarist in [a=Metallica]. He founded the band [a=Exodus (6)] in 1981 and played with them until joining Metallica in 1983.\r\n	2017-11-23 18:55:29.39727	2017-11-25 23:50:39.091998	8	Kirk Hammett
124	\N	Lars Ulrich (born December 26, 1963 in Gentofte, Denmark) is a Danish-American drummer, and one of the founding members of American heavy metal band [a=Metallica].	2017-11-23 18:55:29.401333	2017-11-25 23:51:12.08154	8	Lars Ulrich
159	\N	Keyboardist, born June 21, 1950, Sunderland, UK.\r\nHe has been recording with a lot of Hard Rock and Heavy Metal projects since 1974,including names like Ozzy Osbourne, Cozy Powell, Gary Moore, Rainbow and Thin Lizzy.\r\nAlso worked in "commercial" projects and solo albums.\r\nHe is the brother of guitarist [a=Keith Airey].	2017-11-23 18:55:52.385329	2017-11-25 23:55:20.086776	8	Don Airey
197	\N	Nick Menza was an American drummer and the son of [a=Don Menza].\r\n\r\nBorn: 23 July, 1964 in Munich, Germany\r\nDied: 21 May, 2016 in Los Angeles, California, USA	2017-11-23 18:56:04.433545	2017-11-25 23:59:46.081844	8	Nick Menza
199	\N	English heavy metal vocalist, born 11 October 1947 in Stone Cross, West Bromwich, Birmingham, England, UK.	2017-11-23 18:56:16.355121	2017-11-26 00:00:00.087772	8	Alan Atkins
126	\N	Robert Trujillo, born on October 23, 1964 is a bassist, who has played in Suicidal Tendencies, Infectious Grooves, Cyco Miko, Black Label Society and with Ozzy Osbourne before joining Metallica in 2003.\r\n\r\nHe grew up in Venice, California and was a standout among other local musicians. He played in a few local bands before joining Suicidal Tendencies in 1989, replacing the band's second bassist Bob Heathcote. His work with Suicidal Tendencies is considered to be outstanding, and he is responsible for adding in funk influences to the band seen prominently on albums Lights...Camera...Revolution! and especially on Art Of Rebellion. He eventually turned bandmate Mike Muir on to funk music, and the two formed Infectious Grooves to play more funk oriented music.\r\n\r\nAlthough at times Trujillo has been known to use a pick, he prefers to use his fingers, like the late Metallica bassist Cliff Burton, but unlike Trujillo's predecessor Jason Newsted (who used a pick almost exclusively).\r\n\r\nRobert Trujillo became Metallica's current bassist on February 24, 2003 after auditioning for Metallica and fitting right in with fellow band members James Hetfield, Lars Ulrich, and Kirk Hammett. The members of Metallica offered him $1 million up front, as an advance on the percentage he would earn by being in the band. The audition and hiring appear in the film Some Kind of Monster.\r\n	2017-11-23 18:55:29.410566	2017-11-25 23:51:26.087342	8	Robert Trujillo
128	\N	British guitarist & songwriter, born 27th of February 1957 in Hackney, UK.	2017-11-23 18:55:40.430542	2017-11-25 23:51:40.089404	8	Adrian Smith (2)
130	\N	Since 2012 [a277359] is a solo artist.\r\n\r\nAll the releases between 2007 and 2011 should have as artist [a3503656] all releases from 2012 until now should have as artist [a277359]\r\n\r\n(Info from the "Albums Of My Life" photobook that was released with [r4991531])	2017-11-23 18:55:40.437534	2017-11-25 23:51:54.080122	8	Blaze Bayley
132	\N	British vocalist & songwriter, born August 07, 1958 in Worksop, Nottinghamshire, United Kingdom. \r\nAside from his musical career Dickinson is also active as commercial airplane pilot, screenwriter, fencer, entrepreneur, broadcaster, author, director and actor. \r\nFather of singer [a=Austin Dickinson], cousin of [a270664]'s singer [a348998].\r\nOwner of [l=Duellist Holdings Ltd.]\r\n	2017-11-23 18:55:40.44291	2017-11-25 23:52:08.098071	8	Bruce Dickinson
133	\N	British drummer, born March 8, 1957 in East Ham, London, England, UK, died March 12, 2013 in London, England, UK. Member of [a=Iron Maiden] from 1978 to 1983, of [a=Trust (2)] in 1983 and after that in [a=Stratus (5)], [a=Gogmagog], [a=Desperado (7)] and [a=Elixir (3)].	2017-11-23 18:55:40.445454	2017-11-25 23:52:15.085975	8	Clive Burr
134	\N	English guitarist and songwriter born 23rd of December in 1956 in Edmonton, London, United Kingdom. \r\n\r\nAfter his parents settled down he met Adrian Smith and the two played a lot together. He formed his first band, Stone Free, with Adrian and Dave McCloughlin but the band only did one gig. While still at school Dave and Adrian also formed a band called Evil Ways, which was later renamed to Urchin, though Dave left the band to join a proper band. \r\n\r\nHe frequently answered ads in Melody Maker and got in various bands three of which were Electric Gas, The Secret and an East End band called Warlock. With The Secret he recorded a single called Café De Dance which came out in about 1975. In Warlock he met Dennis Wilcock, who would later get him to audition for Iron Maiden. \r\n\r\nHe joined Iron Maiden for the first time in late 1976 but was fired from the band after a few months due to a rift between him and Dennis Wilcock. He went on to rejoin Urchin and recorded a single She’s A Roller with the band. About six months after being fired from Maiden Steve Harris, who now had only himself and Doug Sampson in Maiden, asked Dave to rejoin the band. It was an easy choice for Dave and he has stayed in Maiden ever since making him the only other person along with Harris to appear on all Iron Maiden releases. \r\n	2017-11-23 18:55:40.448103	2017-11-25 23:52:22.090997	8	Dave Murray (2)
137	\N	British drummer, born 30 June 1957 in Hackney, East London, England, United Kingdom.\r\nMost famous for being in Iron Maiden and playing drums on the famous Soundhouse Tapes.\r\n\r\nAfter leaving Iron Maiden he founded Airforce in 1989. He left Airforce a few years later to return again in 2016.	2017-11-23 18:55:40.457355	2017-11-25 23:52:43.077905	8	Doug Sampson
141	\N	Born 17 May 1958, in Chingford, London.\r\nFirst known as singer on the early Iron Maiden releases, he continued his career with several bands as Battlezone, Dianno and Killers.\r\n	2017-11-23 18:55:40.470646	2017-11-25 23:53:11.084056	8	Paul Di'Anno
276	\N		2017-11-23 18:58:33.358487	2017-11-26 00:09:11.086515	16	Dan Mitchell (3)
152	\N	Born William Thomas Ward, May 5, 1948, in Aston, Birmingham, England.\r\n\r\nBill Ward is the original drummer and a founding member of [a=Black Sabbath].  Prior to Black Sabbath, Ward and Sabbath guitarist [a=Tony Iommi] had worked together in a local rock band called Mythology.  Ward remained Black Sabbath's drummer until mid 1980, when long standing drug and alcohol problems, exacerbated by the then recent deaths of both of his parents, forced him to leave the band mid-tour.  He was replaced by [a=Vinny Appice].  A sober Ward rejoined Black Sabbath in 1983, when the band recorded "Born Again" with singer [a=Ian Gillan], but he left the band after the recording when his substance abuse problems started to resurface.  Sober again, Bill rejoined Black Sabbath in 1984 when the group hired vocalist Dave Donato, but this line up last only a few photo sessions before Donato was fired.  After that, Ward and bassist [a=Geezer Butler] left the band.  Ward would vow publically not to rejoin Black Sabbath again until original vocalist [a=Ozzy Osbourne] returned, although he did fill in for a few shows in 1994 when [a=Tony Martin] sang for the band.  In the late 1990's, the original Black Sabbath finally reunited to tour but any new studio recordings have yet to appear and, at this time, seem unlikely to happen.  In 1997, it was anounced that [a=Ronnie James Dio], Tony Iommi, Geezer Butler, and Bill Ward would be reuniting under the moniker of [a=Heaven & Hell (2)] but Ward stated that he would not be participating shortly after the initial announcement was made.\r\n\r\nBesides being a drummer, Bill is also a singer and a songwriter.  He released his first solo album in 1990 and his second in 1997.  A third album, titled "Beyond Aston', is said to be complete but has yet to be released.\r\n	2017-11-23 18:55:52.361387	2017-11-25 23:54:31.101912	8	Bill Ward
154	\N	American drummer, born July 27, 1955 in Brooklyn, New York, USA.	2017-11-23 18:55:52.367489	2017-11-25 23:54:45.095877	8	Bobby Rondinelli
155	\N	British rock drummer, born December 29, 1947 (Cirencester) and died April 5, 1998, following a car crash in bad weather on the M4 motorway, in southern England.\r\n\r\n\r\n	2017-11-23 18:55:52.370377	2017-11-25 23:54:52.082961	8	Cozy Powell
157	\N	Heavy metal bass player who did stints in several bands during the 1980s, most notably Black Sabbath.  He was also an early member of White Lion, leaving the band before they recorded their first album.  Today, he practices law in Florida, although he does still play music locally.\r\n\r\nDave is also the brother of former [a=Anthrax] guitarist [a=Dan Spitz].\r\n	2017-11-23 18:55:52.376918	2017-11-25 23:55:06.090222	8	Dave Spitz
158	\N	Singer and guitarist for a number of bands; notably [a=Savoy Brown] and [a=Fleetwood Mac], (born 25 January 1945, in Walsall, Staffordshire, England).	2017-11-23 18:55:52.381059	2017-11-25 23:55:13.099704	8	Dave Walker (6)
191	\N	American guitarist, born 31 March 1962 in Ann Arbor, Michigan, USA.	2017-11-23 18:56:04.414251	2017-11-25 23:59:04.086589	8	Jeff Young (3)
160	\N	Eric Singer (born Eric Doyle Mensinger; May 12, 1958) is an American hard rock and heavy metal drummer, best known as a member of KISS, portraying "The Catman" originally played by Peter Criss. He has also performed with artists such as Black Sabbath, Alice Cooper, Lita Ford, Badlands, and Gary Moore as well as his own band ESP. So Far in his career, Singer has appeared on over 75 albums and 11 EPs.	2017-11-23 18:55:52.389611	2017-11-25 23:55:27.083415	8	Eric Singer
162	\N	Geoff Nicholls (born 28 February 1948, Birmingham, England – died 28 January 2017) was a British musician and keyboardist. He was the long time keyboard player for [a144998], although he is actually a guitarist by trade.  He played with the band from 1979 through 2004 and was a frequent co-writer for Black Sabbath but was not always credited as a full member of the band and often performed off-stage at the band's concerts.  Was a member of [a1040012] prior to joining Black Sabbath.  After parting ways with Black Sabbath he continued to work with one-time Sabbath vocalist [a314726].	2017-11-23 18:55:52.398119	2017-11-25 23:55:41.082758	8	Geoff Nicholls
168	\N	Rock bassist and songwriter.\r\n\r\nHe was a member of bands [a=Dragons (5)] (1975-76), [a=Troggs] (1977-79), [a=Sector 27] (1980-84), [a=Dafne And The Tenderspots] (about a year), and later joined [a=Black Sabbath] (85-86) to tour their European 'Eternal Idol' Tour.\r\n	2017-11-23 18:55:52.421155	2017-11-25 23:56:23.093067	8	Jo Burt
169	\N	Bass player, but started up playing drums.\r\nBorn on 27th August 1950 in Edinburgh, Scotland. During his career, he has worked with Whitesnake, Badlands, Vow Wow, Black Sabbath, Rondinelli, Bernie Marsden, Cozy Powell and Graham Bonnet, Gogmagog (together with Paul Di'Anno - lead vocals, Pete Willis - guitar, Clive Burr - drums and Janick Gers - guitar) amongst others.\r\n 	2017-11-23 18:55:52.424925	2017-11-25 23:56:30.090386	8	Neil Murray
170	\N	British Multi-platinum recording artist, a Rock & Roll Hall of Fame inductee and a three-time Grammy® winning singer and songwriter, who has sold more than 120 million albums worldwide, best known as the lead singer of rock band [a=Black Sabbath] and his solo band as well. \r\n\r\nBorn: 3 December 1948 in Aston, Birmingham, West Midlands, England, UK. \r\n\r\nHusband to [a=Sharon Osbourne], he has five biological and two adopted children, son-in-law of music businessman [a=Don Arden], and brother-in-law of [a=David Arden (3)]. With Sharon, he is father to [a=Kelly Osbourne], [a=Jack Osbourne (2)], and [a=Aimee Osbourne]. 	2017-11-23 18:55:52.428763	2017-11-25 23:56:37.09183	8	Ozzy Osbourne
172	\N	Ronald James Padavona (July 10, 1942 – May 16, 2010), better known as Ronnie James Dio, was an American rock and heavy metal vocalist and songwriter. He performed with, among others, Elf, Rainbow, Black Sabbath, Heaven & Hell, and his own band Dio. Other musical projects include the collective fundraiser Hear 'n Aid. He was widely hailed as one of the most powerful singers in heavy metal, renowned for his consistently powerful voice. His idol was Mario Lanza. He is credited with popularizing the "metal horns" hand gesture in metal culture. Before his death, he was collaborating on a project with former Black Sabbath bandmates Tony Iommi, Geezer Butler, and Vinny Appice, under the moniker Heaven & Hell, whose only studio album, The Devil You Know, was released on April 28, 2009.[4] Dio died of stomach cancer on May 16, 2010. One of the last songs he recorded was titled "Metal Will Never Die". Ronnie James Dio has sold over 47 million copies of albums with all of the bands he has worked in.	2017-11-23 18:55:52.43667	2017-11-25 23:56:51.100364	8	Ronald Padavona
173	\N	English musician and chiropractor, born 5 July 1956 in Stepney, London, England, UK. Original drummer with [a=The Clash] and the man they turned to throughout their career when [a=Topper Headon] fell foul of the law. \r\n\r\nAs well as his regular turns with The Clash, Chimes was a busy session drummer for many punk and post punk stars, including [a=Billy Idol] and [a=Johnny Thunders] and even put in time at the [a=Black Sabbath] kit. \r\n\r\nNow a practitioner of alternative medicine with a string of clinics called Chimes Chiropractic. \r\n	2017-11-23 18:55:52.440948	2017-11-25 23:56:58.087273	8	Terry Chimes
176	\N	American guitarist, born 26 September 1962 in New York, NY, USA.	2017-11-23 18:56:04.365038	2017-11-25 23:57:19.087056	8	Al Pitrelli
178	\N	Born: March 6, 1970 in Lakewood, Colorado, USA.	2017-11-23 18:56:04.372928	2017-11-25 23:57:33.081769	8	Chris Broderick
180	\N	American drummer, born 13 June 1965 in Livonia, Michigan, USA.	2017-11-23 18:56:04.379436	2017-11-25 23:57:48.085707	8	Chuck Behler
181	\N	Metal guitarist.\r\n\r\nBorn September 13th, 1961, in La Mesa, California.\r\n\r\nFormer [a=Metallica] member, he was fired from the band in 1983 because of drug and alcohol problems that often resulted in violence against other band members. He would suffer from heroin addiction until 1995 when he was finally able to quit the drugs completely.\r\n\r\nMustaine formed [a=Megadeth] in 1984 with bassist [a=David Ellefson], fellow guitarist [a=Kerry King], and drummer Lee Rash. The band has gone through several lineup changes, but Mustaine has always remained as bandleader.\r\n\r\nIn 2002, Megadeth disbanded as a result of nerve damage (radial neuropathy) to Mustaine's left arm. He has since recovered feeling in his arm, and the band has reformed and begun to record and tour again.\r\n\r\nDave married Pam Casselberry in 1991, and they had two children together (a son, [url=http://www.discogs.com/artist/Justis+Mustaine]Justis David Mustaine[/url], born in 1992, and a daughter, Electra Nicole, born in 1998). He filed for divorce in 2006.\r\n	2017-11-23 18:56:04.382595	2017-11-25 23:57:55.078293	8	Dave Mustaine
182	\N	Born: November 12, 1964 in Jackson, Minnesota.\r\n\r\nDavid Ellefson is best known as the original bass player for Megadeth, a band he helped found with guitarist/frontman [a=Dave Mustaine] in 1983 following Mustaine's dismissal from [a=Metallica].  Ellefson, known as "Junior" within the band, remained the only player to perform with Mustaine and Megadeth throughout the band's initial run from 1983 through 2002.  When Mustaine resurrected the Megadeth name in 2004, Ellefson was not included.  An unsuccessful lawsuit brought by Ellefson against Mustaine over Megadeth rights and royalties only served to heighten tensions between the former band mates.  Although Mustaine would announce that the two had eventually settled their personal differences, he did not foresee Ellefson ever rejoining the band, and Megadeth released 3 studio albums with different bassists.  In the meantime, Ellefson performed with the groups F5 and Hail and went to work for Peavy Amplifiers.  It then came as something of a shock when, in early 2010, it was announced that Ellefson had rejoined Megadeth.\r\n	2017-11-23 18:56:04.385308	2017-11-25 23:58:02.079958	8	David Ellefson
184	\N	Belgian metal drummer. Co-founder of Scarve, Verbeuren is a full-time member of Soilwork since 2005. He plays drums and guitar in his grindcore band Bent Sea.\r\nVerbeuren has recorded and/or performed with Devin Townsend, Fredrik Thordendal, Satyricon, Aborted, Jeff Loomis, Warrel Dane, Naglfar, Powermad, The Project Hate MCMXCIX, Phaze I, Sybreed, Yyrkoon, Phazm, Colosso, Malevolence, Sublime Cadaveric Decomposition, Lyzanxia and many more.	2017-11-23 18:56:04.392248	2017-11-25 23:58:15.08928	8	Dirk Verbeuren
186	\N	Born May 25, 1969, Ottawa, Ontario, Canada.\r\n\r\nMetal guitarist, currently based in Toronto, Canada.\n	2017-11-23 18:56:04.398072	2017-11-25 23:58:29.081987	8	Glen Drover
189	\N	Born on April 3, 1970 in Jacksonville, Florida\r\n\r\nMember of [a=Iced Earth] 1996 - 2000 & 2001 - 2004 & [a=Megadeth] 2004 - February 10, 2006\r\nAlso played in Brutal Assault, Invader, Delta 9, Mad Axe	2017-11-23 18:56:04.406948	2017-11-25 23:58:50.083371	8	James McDonough
200	\N	English writer primarily known for his work in comic books (born 18 November 1953).  He has also shown a major interest in magick and the occult and has worked with a number of musicians to release his particular philosophies in musical form. \r\n\r\n[a=Alan Moore (2)] former [a=Judas Priest] drummer\r\n[a=Alan Moore (3)] Arranger, singer, keyboardist from Nashville, TN.\r\n[a=Alan Moore (4)] Horn player, associated with [a=Savoy Brown]\r\n[a=Alan Moore (5)] Engineer at [l=Cereus Recording] in Phoenix, AZ. \r\n[a=Alan Moore (7)] Alan G. Moore appears as pianist on [l=Recorded Anthology Of American Music, Inc.] releases\r\n[a=Alan Moore (8)] Write liner notes for [l=Maya Recordings] jazz releases\r\n\r\n	2017-11-23 18:56:16.359159	2017-11-26 00:00:15.075007	8	Alan Moore (2)
201	\N	Jazz double bassist (born 1 October 1946 in Wolverhampton, England).\r\n\r\nFor the heavy metal drummer, see [a=Dave Holland (2)].\r\nFor the pianist, see [a=David Holland (3)].\r\n	2017-11-23 18:56:16.362799	2017-11-26 00:00:22.080578	8	Dave Holland (2)
203	\N	English bass guitarist for the British heavy metal band [a=Judas Priest], born 20 January 1951 in Yew Tree Estate, West Bromwich, England, UK..\r\n	2017-11-23 18:56:16.369168	2017-11-26 00:00:36.080519	8	Ian Hill (2)
204	\N	English drummer. \r\n\r\nBorn July 19, 1947 in Lichfield, Staffordshire, England, UK. Played drums on [a=Judas Priest]'s first album "Rocka Rolla", as well as the tour that followed. Hinch played in several Birmingham rock bands, including The Pinch, The Generation and The Bakerloo Blues Line, later [a=Bakerloo]. With vocalist [a=Rob Halford] he played in the band Hiroshima from 1972 to 1973. 	2017-11-23 18:56:16.372824	2017-11-26 00:00:43.075049	8	John Hinch
206	\N	Northern Irish session drummer who is normally associated with rock, or heavy metal acts, and is widely considered as a 'technical' drummer. Though largely linked with Judas Priest, he's actually been active since the early 1970s, and his associations since that time have included:  [a188393] (1974), [a123906] (1974, and 1989), Fancy (1974-76), Judas Priest (1977-79), Axis Point (1978), [a77224] (1980), [a1416667] (1981), [a443966] (1981-82), Tytan (1982–83), and [a175813] (1988). He is still active, and can be seen appearing in either The Shakers, Broken Bones or [a4388856] (earlier with current Judas Priest guitarist Richie Faulkner), who are London-based cover bands, and original folk rockers Kindred Spirit.\r\n\r\nBorn: 5th April 1948, in Portadown, County Armagh, Northern Ireland	2017-11-23 18:56:16.378973	2017-11-26 00:00:57.080091	8	Les Binks
208	\N	Talented vocalist who started out with various bands in the early '90s. When longtime [a=Judas Priest] vocalist [a=Rob Halford] left the band in 1992, a lengthy application/auditioning process began to find a suitable replacement. Live video footage of Owens' Priest tribute band "British Steel" was sent to drummer [a=Scott Travis] and made enough of an impression for the band to fly him in to audition. After less than 2 songs he got the job, and officially joined the band in February of 1996.\r\n\r\nHe recorded 2 studio albums, 2 live albums and a live DVD with Priest before amicably departing for Halford's return in 2003. Since then he has joined and recorded a full-length with [a=Iced Earth], and started his own band, [a=Beyond Fear], whose self-titled debut album was released in 2006. He was kicked out of Iced Earth in late 2007.\r\n\r\nTim's "Ripper" nickname was given to him by guitarist [a=Glenn Tipton] after his strong performance of the song during the auditioning process.\r\nHis rise to fame was largely used as the basis for the 2001 film "Rock Star".\r\n	2017-11-23 18:56:16.38407	2017-11-26 00:01:11.100162	8	Ripper Owens
209	\N	English heavy metal/hard rock singer-songwriter. Was member of Abraxas, Athens Wood, Lord Lucifer, Thark. With drummer [a=John Hinch] he joined the band Hiroshima from 1972 to 1973. \r\n\r\nBorn August 25, 1951 in Birmingham. 	2017-11-23 18:56:16.387797	2017-11-26 00:01:18.088187	8	Rob Halford
213	\N	Born May 31st 1948. He was the drummer of [b][a=Led Zeppelin][/b] from when the band started in 1968. Bonham died on the 25th of September 1980 after an alcohol overdose. Led Zeppelin quit a couple of months after this occasion, realizing that they couldn't live up to the expectations without Bonham. His younger sister [b][a=Deborah Bonham][/b] is an English rock and blues vocalist.	2017-11-23 18:56:53.39406	2017-11-26 00:01:45.098344	1	John Bonham
215	\N	British rock guitarist, singer-songwriter and film producer (born February 25 1943 in Liverpool - died November 29, 2001 in Los Angeles). He is best known as lead guitarist of [a82730]. \r\nInducted into Rock And Roll Hall of Fame in 2004 (Performer).\r\n	2017-11-23 18:57:06.35402	2017-11-26 00:01:59.128728	1	George Harrison
216	\N	Songwriter, rock singer and guitar player, best known for his work with The Beatles during the 1960s and 1970s. Inducted into Songwriters Hall of Fame in 1987. Inducted into Rock And Roll Hall Of Fame in 1994 (Performer).\r\n\r\nBorn: 9 October 1940 in Liverpool, Lancashire, UK. \r\nDied: 8 December 1980 in NYC, NY, USA.\r\n	2017-11-23 18:57:06.358129	2017-11-26 00:02:06.107593	1	John Lennon
217	\N	Paul McCartney (18 June 1942 in Liverpool, England) is a British singer, composer/songwriter, and multi-instrumentalist most famous for being a member of The Beatles. He is also a published poet, painter, philanthropist, and multi-media executive/producer.\r\n\r\nSir Paul has been recognised by every music and entertainment association, including Guinness Book, as the most successful and popular composer/songwriter/entertainer in the history of popular music.	2017-11-23 18:57:06.361305	2017-11-26 00:02:13.09333	1	Paul McCartney
219	\N	British musician, singer, songwriter, and occasional actor. Better known as Ringo Starr. \r\n\r\nBorn: 7 July 1940 in Liverpool, England, UK. \r\n\r\nBest known as being drummer of [a82730]. \r\n[B]Please don't use Richard Starkey as PAN for [A=Ringo Starr]! Ringo Starr is no ANV, but an alias of Richard Starkey![/B]\r\n	2017-11-23 18:57:06.367769	2017-11-26 00:02:27.096722	1	Richard Starkey
220	\N	British bassist; the original bassist for [a82730]. He was engaged to German Beatles photographer Astrid Kirchherr at the time of his early death at age 21. \r\n\r\nBorn June 23, 1940 in  Edinburgh; died April 10, 1962 in Hamburg.\r\n	2017-11-23 18:57:06.37076	2017-11-26 00:02:34.078159	1	Stuart Sutcliffe
221	\N	David Gilmour was born on 6th March 1946 in Cambridge, the second child of Douglas Gilmour, a senior lecturer in Zoology at the University and Sylvia, a teacher.  Best known as guitarist, vocalist and writer with [a=Pink Floyd], he is also renowned for solo work and collaborations with other artists including [a=Kate Bush], [a=Paul McCartney], and [a=Pete Townshend].	2017-11-23 18:57:17.361623	2017-11-26 00:02:41.097633	1	David Gilmour
223	\N	British musician and founding member of [a=Pink Floyd], born July 28, 1943 in Hatch End, Middlesex, England, died September 15, 2008 in London, England.	2017-11-23 18:57:17.369197	2017-11-26 00:02:55.105544	1	Richard Wright
224	\N	English musician, singer-songwriter and composer, born 6 September 1943 in Great Bookham, Cambridge, England, United Kingdom.\r\n\r\nFather to [a2389356] & [a2389355].	2017-11-23 18:57:17.372588	2017-11-26 00:03:02.098813	1	Roger Waters
238	\N	British guitarist and keyboard player with the Irish rock band, [a=U2], born 8 August 1961 in East London, England, UK of Welsh parents. He moved to Dublin in his youth. In 2002 he married [a=Morleigh Steinberg].	2017-11-23 18:57:39.374496	2017-11-26 00:04:40.085286	1	Dave Evans
260	\N	John Mayall, OBE (born 29 November 1933, Macclesfield, Cheshire, England) is an English blues singer, guitarist, organist and songwriter, whose musical career spans over fifty years.	2017-11-23 18:58:10.404807	2017-11-26 00:07:17.090782	16	John Mayall
225	\N	British guitarist, singer, songwriter, composer, and painter. \r\n\r\nBorn: 6 January 1946 in Cambridge, Cambridgeshire, England, UK. \r\nDied: 7 July 2006 in Cambridge, Cambridgeshire, England, UK (aged 60). \r\n\r\nA key figure in the development of London's underground music scene during the late 1960s and –despite his rather brief period of activity– a continuing influence on popular (and unpopular) music onward into the 21st century. Unfortunately, soon after achieving success with [a=Pink Floyd], he began to suffer from mental problems, possibly complicated by drug use, from which he never fully recovered. \r\n\r\nHaving become increasingly unpredictable in person and unreliable as performer, he was pushed out of the band in 1968. He continued with a brief solo career, releasing eclectic albums The Madcap Laughs and Barrett, before leaving the music industry and spending the rest of his life living in relative seclusion. \r\n\r\nBarrett had an infamous "reunion" with Pink Floyd in 1975, when he showed up at the mixing session for Shine On You Crazy Diamond, ironically a song written in tribute to him. His appearance - Overweight and shaven haired - shocked and saddened his former bandmates.\r\n\r\nBarrett died in 2006, following complications with diabetes.\r\n	2017-11-23 18:57:17.37625	2017-11-26 00:03:09.089913	1	Syd Barrett
228	\N	Best known as lead singer of popular British rock group [a=Queen]. Born 5 September 1946 in Stone Town, Zanzibar, died 24 November 1991 in Kensington, London, UK. \r\n\r\nBorn as Farrokh Pluto Bulsara to Parsi parents Bomi and Jer Bulsara, he attended St. Peter's boarding school near Bombay and formed his first school band ("The Hectics") where he played piano.\r\nAt age 17 the Bulsara family fled to England during the Zanzibar revolution and Freddie (as he began calling himself) took up studies in art design. He also formed a band called "Ibex" (later renamed to "Wreckage") but they failed to take off. Soon after he joined another band called "Sour Milk Sea" but it also disbanded. \r\n\r\nIn 1970 he met [a=Brian May] and [a=Roger Taylor] who at the time were going under the name [url=http://www.discogs.com/artist/Smile+(6)]Smile[/url]. Quickly taking full charge, he changed the name to "[a=Queen]", and with his art design education designed the band's logo. It was also around this time that he changed his name to Frederick Mercury by deed poll.\r\n\r\nAs flamboyant a performer he was on stage, Mr. Mercury was equally adept at songwriting; it was his "Bohemian Rhapsody" that propelled the band to superstardom.\r\n\r\nBetween the late 1970's and early 1980's, Freddie took a break from the band to pursue a solo career, spending much time in Munich and New York. In 1987 he was diagnosed with HIV. Despite his illness he still recorded with Queen to finish one last album ("[r=889990]") and his last recorded song, "Mother Love" (which was to appear on the posthumous "[r=1383329]" album). As the disease took hold, public appearances and subsequent videos revealed a very thin Freddie -- yet he insisted on keeping his illness a secret. \r\n\r\nOn 24 November 1991, he died in his Kensington home, one day after announcing his illness, aged 45.\r\n	2017-11-23 18:57:28.372113	2017-11-26 00:03:30.102744	1	Freddie Mercury
229	\N	Born: 19 August 1951 in Oadby, Leicester, UK. \r\n\r\nBest known as the bassist for British rock band [a=Queen], and often referred to as the 'quiet' member of the group due to his lower public profile and more business-like role in the group. \r\n	2017-11-23 18:57:28.376507	2017-11-26 00:03:37.093778	1	John Deacon
230	\N	Best known as the drummer, backing vocalist, and occasional lead vocalist for British rock band [a=Queen].\r\nBorn 26 July 1949 in Dersingham (near Kings Lynn), Norfolk, UK. \r\n	2017-11-23 18:57:28.379292	2017-11-26 00:03:44.084023	1	Roger Taylor
231	\N	Scottish-born Australian guitarist and songwriter, born March 31, 1955 in Glasgow, Scotland, UK. Brother of [a=George Young], [url=http://www.discogs.com/artist/Alexander+Young+%282%29] Alexander Young[/url] and [a=Malcolm Young], Uncle to [url=http://www.discogs.com/artist/Steve+Young+%287%29]Steve Young[/url].\r\nBest known as the co-founder, lead guitarist, songwriter and sole constant member of the Australian hard rock band AC/DC.	2017-11-23 18:57:39.350833	2017-11-26 00:03:51.10283	1	Angus Young
277	\N	Bassist and singer for [a=ZZ Top]. Brother of guitarist [a=Rocky Hill].\r\n\r\nBorn: May 19, 1949, Dallas, Texas.\r\n	2017-11-23 18:58:33.362771	2017-11-26 00:09:17.088792	16	Dusty Hill
280	\N	Former bass player of The Allman Brothers Band and Gov't Mule.  Born on October 3, 1955, died on August 26, 2000.	2017-11-23 18:58:44.363772	2017-11-26 00:09:37.087281	16	Allen Woody
232	\N	Born: February 6th 1962, Lafayette, Indiana.  His birth name was William Bruce Rose, Jr.  He was later adopted by his stepfather and his last name was changed to Bailey.  In 1986, he legally changed his name to W. Axl Rose.\r\nIn the early 1980s, Axl moved to Los Angeles, CA, were he fronted hard rock bands like [a4103352], [a=L.A. Guns] and [a=Hollywood Rose] before forming [a=Guns N' Roses] in 1985 with L.A. Guns guitarist [a=Tracii Guns].  Axl has remained the only constant member of the band throughout its history and is the owner of the Guns N' Roses name.\r\nHe became the touring vocalist for [a84752] in 2016.	2017-11-23 18:57:39.355397	2017-11-26 00:03:58.090929	1	Axl Rose
233	\N	Ronald Belford "Bon" Scott (9 July 1946 – 19 February 1980) was an Australian rock musician, best known for being the lead singer and lyricist of Australian hard rock band AC/DC from 1974 until his death in 1980. He was born in Kirriemuir, Scotland, and emigrated to Melbourne, Australia with his family in 1952 at the age of six.\r\n\r\nScott formed his first band, The Spektors, in 1964 and became the band's drummer and occasional lead vocalist. He performed in several other bands including The Valentines and Fraternity before replacing Dave Evans as the lead singer of AC/DC in 1974.\r\n\r\nAC/DC's popularity grew throughout the 1970s, initially in Australia, and then internationally. Their 1979 album Highway to Hell reached the top twenty in the United States, and the band seemed on the verge of a commercial breakthrough. However, on 19 February 1980, Scott died after a night of partying in London. AC/DC briefly considered disbanding, but the group quickly recruited vocalist Brian Johnson of the British glam rock band Geordie. AC/DC's subsequent album, Back in Black, was released only five months later, and was a tribute to Scott. It went on to become the second best-selling album in history.\r\n\r\nBon was justifiably named the greatest rock frontman of all time in Classic Rock No.68.\r\n\r\nAuthor Clinton wrote a biography of Bon Scott with the title  'Highway To Hell: The Life & Times Of AC/DC Legend Bon Scott'.\r\n	2017-11-23 18:57:39.359075	2017-11-26 00:04:05.097759	1	Bon Scott
235	\N	Drummer with [a=Uriah Heep], [a=Manfred Mann's Earth Band] and AC/DC, amongst several others. Born 30-10-1946 in Pontypridd, Wales, his first claim to fame was playing with The Squires, the [a=Tom Jones] backing group (1963-1969). By 1972, he had moved on to Manfred Mann's Earth Band and played with them until 1978, when he shortly joined with former Earth Band members to form the Band Terra Nova. But this band did not have a lot of success and dissolved quickly. His next real group was with Jimmy Page and Paul Rodgers in the Firm. That band wanted him so badly that they waited several months for him to finish a previous commitment with David Gilmour. After the demise of the Firm, Slade hooked up with AC/DC for quite a while. He then became the drummer for the prog rock group Asia for two albums. Most recently he is the drummer for british power rock group Damage Control.	2017-11-23 18:57:39.364989	2017-11-26 00:04:19.083757	1	Chris Slade
239	\N	Larry Van Kriedt (born in the United States c.1954) was the first bassist with rock band [a=AC/DC]. He was recruited at the time of the group's formation in 1973, joining [a=Malcolm Young] (Rhythm Guitar), [a=Angus Young] (Lead Guitar), [a=Dave Evans] (Lead Vocals) and [a=Colin Burgess] (Drums). Van Kriedt also played occasional saxophone.\r\n\r\nVan Kriedt has played many different styles of music and has been involved with making many albums both as an artist and as a producer, and to this day he owns and operates his own recording studio. Bands Van Kriedt was a member of include: The Eighty Eights, Non Stop Dancers, Def Fx, Afram, The LPs, and The Larry Van Kriedt Quartet. He has written and recorded songs that have been successful in Australia, Japan, New Zealand, the U.S. and Europe, and has worked in North Africa and toured all over the world.\r\n\r\nFrom 1997 to 1999 he lived in Morocco, working there as a musician with his band Afram doing radio, television and concerts such as the first Gnawa Festival in Essaouira in 1998, and raising money for the charity, B.A.Y.T.I. After leaving Morocco he travelled the world busking, that is, playing jazz on the street from London to Provence to Sydney. This was when he started making backing tracks of jazz standards.\r\n\r\nIn 2002 Van Kriedt pioneered the first online downloadable jazz playalong backing track e-business, Jazzbacks.com.\r\n\r\nIn 2007 he is found working with Paul Agbakoba in The LPs.\r\n	2017-11-23 18:57:39.377871	2017-11-26 00:04:47.082866	1	Larry Van Kriedt
240	\N	Scottish-born, Australian guitarist and songwriter. Young was a founding member of [a=AC/DC], but retired from the band in 2014 due to ongoing health issues caused by the onset of dementia. \r\n\r\nHe is the brother of [a=Angus Young], [a=George Young] and [a=Alexander Young (2)] as well as the uncle of [a=Steve Young (7)].\r\n\r\n[b]Born:[/b] 6th January 1953, in Glasgow, Scotland.\r\n[b]Died:[/b] 18th November 2017, in Sydney, Australia. (aged 64)	2017-11-23 18:57:39.381339	2017-11-26 00:04:54.086813	1	Malcolm Young
243	\N	Australian drummer, born 19 May 1954 in Melbourne, Australia. Best known for his membership in Australian hard rock band AC/DC from 1975 through 1983, and again from 1994 to 2015.	2017-11-23 18:57:39.389878	2017-11-26 00:05:15.084479	1	Phil Rudd
245	\N	British drummer, born 19 June 1963 in Manchester, England, UK.\r\nBest known for his work with [a=AC/DC] and [a=Ronnie James Dio].	2017-11-23 18:57:39.394969	2017-11-26 00:05:30.086871	1	Simon Wright (4)
246	\N	Steve Young is the nephew of [url=http://www.discogs.com/artist/Angus+Young]Angus[/url] and [a273543], the son of their brother [url=http://www.discogs.com/artist/Alexander+Young+%282%29]Alex[/url] and was born 11 December 1956. As a member of the Young family, Stevie took an interest in music, and especially in guitar, at a very young age, following his uncles' example. He joined up with his first band, Stabbers, at the end of the 1970s.\r\n\r\nIn 1980 Stevie put together a very promising band called 'Starfighters'. The band, made up of English musicians only, offered a music highly inspired by [a84752]. The Starfighters recorded two albums, 'Starfighters' in 1981 and 'In Flight Movie' the next year. Stevie's first live experience with [a84752] happened in 1981 while the Starfighters were chosen as opening act for the Back In Black world tour, just after the release of their first album.\r\n\r\nBut the Starfighters split up and no one heard of Stevie until May 1988. At that time [a84752] had just ended the Blow Up Your Video European tour and were getting ready to start the American leg of the world tour. However [url=http://www.discogs.com/artist/Malcolm+Young]Malcolm[/url] decided not to join the band for the US tour in order to take a rest and get rid of his alcohol dependency. The band called up Stevie, [url=http://www.discogs.com/artist/Malcolm+Young]Malcolm[/url]'s musical and physical double, to play the rhythm guitar for the American concerts. Stevie joined with the band in Boston for a series of rehearsals and took [url=http://www.discogs.com/artist/Malcolm+Young]Malcolm[/url]'s place on stage in Portland on May 3, 1988.\r\n\r\nIn the beginning of 1989 Stevie came back to England and put together a new band called 'Little Big Horn'. The band recorded a demo tape coproduced by [a273543] himself but had to split up during the Winter of 1993 after unsuccessful attempts to sign a deal with a proper record company.\r\n\r\nAfterwards Stevie built up yet another band, Up Rising, that split as well. Since that time Stevie has disappeared from the musical scene.\r\n	2017-11-23 18:57:39.398	2017-11-26 00:05:37.085152	1	Steve Young (7)
281	\N	American bassist and a founding member of The Allman Brothers Band, born April 4, 1948. He died on November 11, 1972 in Macon, USA after a motorcycle crash.\r\n\r\nNote: His son, Berry Duane Oakley (aka [a1518009]) is also a bass guitarist who has performed with groups such as Bloodline, OKB and [a=Blue Floyd].\r\n	2017-11-23 18:58:44.367065	2017-11-26 00:09:44.199676	16	Berry Oakley
369	\N	American bluegrass fiddler who invented the 8-string fiddle. He was born May 8, 1928 in Sparta, Tennessee and died March 13, 2001 in Nashville, Tennessee.	2017-11-23 19:00:42.346823	2017-11-26 00:20:04.153826	11	Benny Martin
247	\N	Tony Currenti is best known for being the drummer on AC/DC's first album, High Voltage (1975). Two tracks from that first album appeared on the international release of High Voltage (1976) and three on '74 Jailbreak (1984). Tony also recorded the single "High Voltage" in the studio with AC/DC, with Phil Rudd appearing in the film clip. The song appeared on TNT (1975) and the international release of High Voltage (1976). Tony's other drumming projects include Stevie Wright (songs off Hard Road and Black Eyed Bruiser), John Paul Young (Yesterday's Hero, I Hate The Music), Ray Burgess (Love Fever) and his own band Jackie Christian & Flight (Love, The Last Time I Go To Baltimore and more). Tony retired from drumming in the late 1970s and stopped playing music but made his long-awaited comeback in 2014. 	2017-11-23 18:57:39.401662	2017-11-26 00:05:44.079273	1	Tony Currenti
251	\N	Buddy Whittington (born December 28, 1956, Fort Worth, Texas, USA) is an American guitarist.	2017-11-23 18:58:10.378251	2017-11-26 00:06:12.78241	16	Buddy Whittington
253	\N	Coco Montoya (born October 2, 1951, Santa Monica, California, USA) is an American blues guitarist and drummer. In the 1970's, he played drums in [a=Albert Collins] band where he was taught guitar techniques by Collins. Montoya plays guitar left-handed. He joined a 1980's version of [a=John Mayall & The Bluesbreakers]. He has also released many albums under his own name.\r\n	2017-11-23 18:58:10.384353	2017-11-26 00:06:27.080232	16	Coco Montoya
254	\N	Rock drummer, born May 9th 1938, Bournemouth, Dorset, UK. He played with "Zoot Money's Big Roll Band" in the first 60's, later becomina session drummer on many releases including Bob Dylan, John Lee Hooker, Sonny Boy Williamson, Memphis Slim, Solomon Burke, John Mayall's Bluesbreakers, Marc Bolan and T.Rex, Mick Taylor, Donovan... On "Focus" from 1974 to 1975.	2017-11-23 18:58:10.387827	2017-11-26 00:06:34.087201	16	Colin Allen
255	\N	Born: September 26, 1934, in Ludlow, Shropshire, England\r\nDied: December 17, 2004 in Hampstead, London, England\r\nEnglish saxophonist and composer, played a major role in bringing British Blues and Jazz to the forefront of the world music scene. He was part of one of the important, yet unfortunately over-looked bands, such as [a1082937], which also included [a106909] and [a219243]. Dick had a long career being part of other legendary bands such as [a425700], [a299538], [a97325], [a55127] and many other solo projects. As a performer, Dick was one of the finest showmen of the era, able to play two horns at once and keeping the audience glued to him at all times. He had an amazing charisma both on stage and off. [l132604]/[l389270] released [r3588606] in 2001, which was nominated for a WC Handy Award.\r\n	2017-11-23 18:58:10.390799	2017-11-26 00:06:41.090378	16	Dick Heckstall-Smith
256	\N	Prolific English blues-rock guitarist, singer and composer affectionately known as "Slow Hand". Born 30 March, 1945 in Ripley, Surrey, England, UK. \r\nHis holding company is [l267110]. \r\nReceived the Order of the British Empire (CBE-Commander).\r\nInducted into Rock And Roll Hall of Fame in 2000 (Performer)\r\nInducted into Songwriters Hall of Fame in 2001	2017-11-23 18:58:10.393708	2017-11-26 00:06:48.083094	16	Eric Clapton
261	\N	John McVie (born 26 November 1945, Ealing, London, England) is an English bass guitarist, best known as a member of the rock bands [a299538] and [a47333]. He was married to fellow Fleetwood Mac member [a205020] (née [a304393]) from 1968 until their divorce in 1976. \r\n\r\nJohn McVie whose surname was merged with that of [a273841] to form the name of the band, was inducted into the Rock and Roll Hall of Fame in 1998 as a member of Fleetwood Mac.	2017-11-23 18:58:10.408212	2017-11-26 00:07:24.088871	16	John McVie
262	\N	British drummer, record producer, recording engineer, and music publisher, who has been actively working in the music industry since the mid-1960s. \r\n\r\nBorn: 21st June 1944 in Woolwich, London, England.\r\n\r\nInitially began his career as a session drummer, but quickly moved on and joined [url=http://www.discogs.com/artist/Graham+Bond+Organization%2C+The]The Graham Bond Organisation[/url] in 1966, with whom he stayed until 1968, when he briefly joined [a299538], before forming his own act, [a97325], with [a249817], and [a268714]. They recorded 3 studio albums, but were disbanded in November 1971.\r\n\r\nIn 1972, he formed [url=http://www.discogs.com/artist/Tempest+%286%29]Tempest[/url], who released 2 albums before matters came to a close in 1974. Along with [a208220], and [a321792], he formed [a320822] in 1975 and like the original Colosseum, they too released 3 albums, before they were instrumental in the success of the [a84839] album, [url=http://www.discogs.com/Andrew-Lloyd-Webber-Variations/release/1971920]'Variations'[/url]; which reached number 2 in the UK Album Charts in 1978. Later that year Gary Moore left to rejoin Thin Lizzy, and Colosseum II went the way of Hiseman's previous bands. He spent the next sixteen years on various projects with his wife, and saxophonist, [a=Barbara Thompson], whom he had married in 1967, including live appearances, and score writing for film and television. His largest body of work, however, has been the fourteen albums that he recorded with the [url=http://www.discogs.com/artist/United+Jazz%2BRock+Ensemble%2C+The] The United Jazz And Rock Ensemble[/url] between 1977 and 2002.\r\n\r\nColosseum were reformed in 1994 for a reunion gig, and have toured several times since. On the death of  Dick Heckstall-Smith in 2004, Barbara Thompson, who had been in the various line-ups of Colosseum, joined as a permanent member replacing him on saxophone.\r\n\r\nHiseman's biography, by Martyn Hanson, was released in October 2010 entitled 'Playing The Band'.\r\n\r\nJohn and Barbara have two children.	2017-11-23 18:58:10.411636	2017-11-26 00:07:31.081665	16	Jon Hiseman
263	\N	Keef Hartley (born 8 April 1944, Preston, Lancashire, England - died 26 November 2011, Fulwood, Preston, Lancashire, England) was an English drummer and percussionist who played with some of the greatest British blues rock musicians. He replaced [a=Ringo Starr] as drummer for [a=Rory Storm & The Hurricanes]. His own band [a305976] was the first British band to play at the [l506397]. He retired from the music industry in the mid-1970's.	2017-11-23 18:58:10.414423	2017-11-26 00:07:39.077725	16	Keef Hartley
265	\N	Larry Taylor, also known by his nickname the [a4993498] (born June 26, 1942, New York City, New York, USA) is an American bass guitarist and occasional lead guitarist. He is perhaps best known for his work as a member of [a269094] from 1967 until the present. Before joining Canned Heat he had been a session bassist for [a132927] and [a229194]. He left Canned Heat in May, 1970, to join [a299538]. From 2009-2013, he toured extensively with some of the original members of Canned Heat. More recently, Taylor has become a leading exponent and practitioner of the acoustic upright bass in the contemporary blues scene. He is the younger brother of [a475343], long-time drummer for The Ventures	2017-11-23 18:58:10.420253	2017-11-26 00:07:53.076898	16	Larry Taylor
267	\N	Born: 29th October 1946 in London, England.\r\nInfluential UK blues guitarist and founder of Peter Green's Fleetwood Mac (left the band in 1970, whence it became fully-fledged as [a47333]) and The Splinter Group (left in 2003).  Released one single with  [a397501] in 1967 without John Mayall. \r\n	2017-11-23 18:58:10.426956	2017-11-26 00:08:07.086884	16	Peter Green (2)
271	\N	Tom Canning (born January 24, 1948 Rochester, New York, USA) is an American keyboardist and composer.	2017-11-23 18:58:10.442372	2017-11-26 00:08:35.075962	16	Tom Canning
272	\N	Tony Reeves (born 18 April 1943, New Eltham, London, England) is an English bass guitarist/contrabassist. In the 1960's, he was assistant to [a134700] at [l11716] before leaving to become a freelance producer for [l3072] and [l1610] and creative director of the [l175395]. In the 1970's, he was the bassist for the bands [a97325] and [a466089].	2017-11-23 18:58:10.446286	2017-11-26 00:08:42.077953	16	Tony Reeves
274	\N	Art Director & Designer and Founder of [l973904]	2017-11-23 18:58:22.355812	2017-11-26 00:08:56.083739	16	David Larkham
282	\N	American drummer who is one of the founding members of [url=http://www.discogs.com/artist/Allman+Brothers+Band%2C+The]The Allman Brothers Band[/url]. One of Trucks' first bands was local Jacksonville band The Vikings, who made one 7-inch record in 1964. Another early band was [url=http://www.discogs.com/artist/31st+Of+February%2C+The]The 31st of February[/url] which formed and broke up in 1968. He was born May 11, 1947 in Jacksonville, Florida, USA; he committed suicide January 24, 2017, aged 69.\r\n\r\nOwner: [l=Flying Frog Records]	2017-11-23 18:58:44.37035	2017-11-26 00:09:51.07805	16	Butch Trucks
284	\N	American southern rock guitarist and singer / songwriter, born September 23, 1948 in Connersville, Indiana and died February 25, 2013 in Sarasota, Florida.	2017-11-23 18:58:44.378039	2017-11-26 00:10:07.096524	16	Dan Toler
287	\N	Forrest Richard "Dickey" Betts (born December 12, 1943) is an American guitarist, singer, songwriter, and composer best known as a founding member of The Allman Brothers Band. He was inducted with the band into the Rock and Roll Hall of Fame in 1995 and also won with the band a best rock performance Grammy Award for his instrumental "Jessica" in 1996.\r\n\r\nDickey Betts was ranked #58 on Rolling Stone's 100 Greatest Guitarists of All Time list in 2003, and #61 on the list published in 2011.	2017-11-23 18:58:44.387885	2017-11-26 00:10:27.092481	16	Dickey Betts
288	\N	Born: November 20, 1946, Nashville, Tennessee\r\nDied: October 29, 1971, Macon, Georgia\r\n\r\nGuitarist with The Allman Brothers Band who died in a motorcycle crash.\r\n	2017-11-23 18:58:44.391142	2017-11-26 00:10:34.09056	16	Duane Allman
289	\N	Born: December 8, 1947, Nashville, Tennessee; Died: May 27th, 2017, Savannah, Georgia\r\nBrother to Duane Allman.  The two brothers played in a band, The Escorts and Allman Joys, \r\nand after moving to California, and landed a contract with Liberty Records, they renamed the band to The Hour Glass.\r\nAfter two Psychedelic releases, which Duane didn't like, they split up, and Duane moved back to the south.\r\nLiberty Records wanted Gregg to go solo, and Hour Glass disbanded.  \r\nGregg became tired of that arrangement, and joined his brother in his new formed group, \r\nwhen they needed a singer. This was the beginning of The Allman Brothers Band.\r\nOnce married to actress and singer [a17961], 1975 to 1979.\r\nGregg Allman died on May 27, 2017, due to complications from liver cancer..He was 69 years old.	2017-11-23 18:58:44.396322	2017-11-26 00:10:42.099164	16	Gregg Allman
291	\N	American southern rock- rhythm and blues musician, singer and songwriter, born June 11, 1954 in Wilmington, Delaware.\r\n\r\nFor the composer of contemporary concert music and popular music please use [a1344191]. 	2017-11-23 18:58:44.404969	2017-11-26 00:10:56.091068	16	Johnny Neel
292	\N	American bass player, replaced in November 1972, Berry Oakley (who died in a motorcycle accident) in the group of The Allman Brothers Band until 1976, after he was among the founders of the ' 'Sea Level'', died of cancer. \r\nBorn: January 14, 1949 in Gulfport, Mississippi.\r\nDied : January 21, 1983.	2017-11-23 18:58:44.408801	2017-11-26 00:11:03.075349	16	Lamar Williams
296	\N	American guitarist and singer songwriter, born April 6, 1960.	2017-11-23 18:58:44.426751	2017-11-26 00:11:33.086261	16	Warren Haynes
298	\N	English musician, songwriter, singer, and film and record producer born October 9, 1944 in London and died June 27, 2002 in Las Vegas, Nevada.\r\nOwner of [a=Jason (37)]	2017-11-23 18:58:56.351418	2017-11-26 00:11:48.092754	16	John Entwistle
299	\N	English musician, born August 23, 1946 in Wembley, London, England, UK, died in his sleep from an overdose of the prescription drug, Heminevrin, September 7, 1978 in London, England, UK, Best known as drummer for [a=The Who].	2017-11-23 18:58:56.355158	2017-11-26 00:11:55.124183	16	Keith Moon
301	\N	British singer, guitarist, songwriter and author, born 19 May 1945 in Chiswick, London, England, UK. Son of [a=Cliff Townshend] and brother of [a=Simon Townshend]. Owner of [a=Towser].\r\n	2017-11-23 18:58:56.362295	2017-11-26 00:12:09.088977	16	Pete Townshend
302	\N	British vocalist, and actor who is best known as the founder, and lead singer of [a=The Who]. He began his parallel solo work in the early-1970s, and has acted in a large number of roles in film, theatre, and on television.\r\n\r\nBorn: 1st March 1944, in Hammersmith, London, England.	2017-11-23 18:58:56.365134	2017-11-26 00:12:16.082898	16	Roger Daltrey
303	\N	British guitarist, singer, songwriter and producer, born 10 October 1960 in Chiswick, London, England, UK. He is the Son of Jazz musician [a=Cliff Townshend] and the brother of [a=The Who]'s guitarist [a=Pete Townshend].	2017-11-23 18:58:56.367846	2017-11-26 00:12:23.076972	16	Simon Townshend
305	\N	American singer, songwriter and guitarist, born 17 February 1972 in Oakland, California, USA. He is married to [a=Adrienne Armstrong], and is the father of [a=Joey Armstrong] and Jakob Armstrong a.k.a. [a=Boo (12)].	2017-11-23 18:59:27.380044	2017-11-26 00:12:37.085118	22	Billie Joe Armstrong
309	\N	American bassist, born on 4 May 1972 in Rodeo, California, USA.	2017-11-23 18:59:27.395599	2017-11-26 00:13:05.079112	22	Michael Pritchard
317	\N	aka Ron Greer / Skippy, [b]Rock[/b] artist, member of [a781538] and [a239092]	2017-11-23 18:59:39.385969	2017-11-26 00:13:59.078523	22	Skip (27)
318	\N	American drummer, current drummer for [a=Against All Will], and is the former drummer for [a239092] and [a99356].	2017-11-23 18:59:39.390753	2017-11-26 00:14:06.077318	22	Steve "Boomstick" Wilson
319	\N	Real name of Joe Strummer.\r\n\r\nBorn: Ankara, Turkey August 21 1952.\r\nDied: Broomfield, Somerset, England December 20 2002 (congenital heart failure).\r\nSongwriter, vocalist, guitarist and co-founder of The 101'ers and The Clash. He later formed The Mescaleros. \r\n	2017-11-23 18:59:50.356491	2017-11-26 00:14:13.092134	22	John Mellor
321	\N	Mick Jones was born on June 26, 1955.\r\nHe was a member of The Clash (Lead Guitar, Vocals) and wrote the music for their songs.\r\nLater he was the lead singer of Big Audio Dynamite & Big Audio Dynamite II.\r\nMick also produced most of the Libertines-releases.\r\n\r\nHe shouldn't be confused with [a=Mick Jones (2)] from Foreigner.\r\n	2017-11-23 18:59:50.362606	2017-11-26 00:14:27.082817	22	Mick Jones
325	\N	English musician and chiropractor, born 5 July 1956 in Stepney, London, England, UK. Original drummer with [a=The Clash] and the man they turned to throughout their career when [a=Topper Headon] fell foul of the law. \r\n\r\nAs well as his regular turns with The Clash, Chimes was a busy session drummer for many punk and post punk stars, including [a=Billy Idol] and [a=Johnny Thunders] and even put in time at the [a=Black Sabbath] kit. \r\n\r\nNow a practitioner of alternative medicine with a string of clinics called Chimes Chiropractic. \r\n	2017-11-23 18:59:50.374752	2017-11-26 00:14:55.070972	22	Terry Chimes
328	\N	Arthur McGuckin, nicknamed "The Goog" by the band, joined The [a=Misfits] as the drummer in April 1980 and remained until April 1982 (making him the longest running drummer of the bands original era) when he left after an argument with [a=Glenn Danzig].\r\nAfter leaving The [a=Misfits], Arthur formed [a=Antidote (10)], a New York band that later opened for The Misfits.\r\n	2017-11-23 19:00:01.370223	2017-11-26 00:15:16.081294	22	Arthur Googy
329	\N	Played guitar for the Misfits - November 1978 to October 1980. Steele went on to form "The Undead", immediately after leaving the Misfits. He has also played bass or guitar for the bands "Times Square", "Mourning Noise", "Sloppy Seconds", "The Migraines", and "The Graveyard School".	2017-11-23 19:00:01.373921	2017-11-26 00:15:23.071211	22	Bobby Steele
367	\N	"Mother Maybelle" Carter (b. May 10, 1909 near Nickelsville, Virginia, USA - d. October 23, 1978 in Nashville, Tennessee, USA) was an American country musician.	2017-11-23 19:00:31.389316	2017-11-26 00:19:50.08945	11	Maybelle Carter
330	\N	American drummer (born 2-11-1963 in Brooklyn, New York, U.S.A., died 1-12-2010). He started his career playing for Genocide and Verbal Abuse. Later, as Brian Damage, he joined [a252732] but only played in half a show in a Halloween gig in 1983. After his short period with Misfits, the drummer played for a number of New York City bands. He then moved to Los Angeles and played or recorded with Wink, Low Pop Suicide, Sylvain Sylvain, Susanna Hoffs, and The Fuzztones.	2017-11-23 19:00:01.37733	2017-11-26 00:15:31.081045	22	Brian Keats
335	\N	American singer, songwriter and musician, born 23 June 1955 in Lodi, New Jersey, USA.	2017-11-23 19:00:01.395814	2017-11-26 00:16:07.080547	22	Glenn Anzalone
336	\N	American bassist, born April 21, 1959 in Lodi, New Jersey, USA. Father of guitarist [a=Jerry Caiafa II]. 	2017-11-23 19:00:01.39889	2017-11-26 00:16:14.077696	22	Jerry Caiafa
337	\N	Son of [a=Jerry Caiafa] aka [a=Jerry Only] and guitarist for the Misfits.	2017-11-23 19:00:01.403166	2017-11-26 00:16:21.075965	22	Jerry Caiafa II
339	\N	Drummer for the Misfits - November 1978 to December 1979. Later played drums for "The Whorelords", "Human Buffet", "The Mary Tyler Whores", and "The Undead" (2000-2002).	2017-11-23 19:00:01.412634	2017-11-26 00:16:35.080677	22	Joey Image
342	\N	Guitarist for a variety of Nu/Progressive Metal bands including his own self entitled band.	2017-11-23 19:00:01.42542	2017-11-26 00:16:56.089771	22	Marc Rizzo
343	\N	Michael Emanuel (b. March 21, 1975), better known by his stage name Michale Graves, is an American singer and songwriter. He is known for his work with the reformed Misfits (from 1995 to 1998 and again from late 1998 until late 2000).	2017-11-23 19:00:01.430014	2017-11-26 00:17:04.082401	22	Michale Graves
346	\N	Born Roberto Valverde in Cali, Colombia, in 1955, he was given the nickname "Robo" by his bandmates in Black Flag for his robotic drumming style.\r\n\r\nFrom 1978 to 1981, Robo was the drummer for US punk band [a=Black Flag], performing on the EPs 'Jealous Again', 'Six Pack', and their first full-length album 'Damaged'.  His tenure in Black Flag ended when, upon completing a tour of England, it was discovered that Robo's visa was expired and he was deported from the UK to Colombia.\r\n\r\nRobo joined The [a=Misfits] during the summer of 1982. Robo's drumming is featured on the 'Earth A.D./Wolfs Blood' LP and the 'Die, Die My Darling' 12". He left The Misfits in August 1983 because he couldn't tolerate working with [a=Glenn Danzig] any longer. \r\n\r\nAfter leaving The Misfits, it was said that he spent some time in New Jersey, working with the Caiafa brothers ([a=Jerry Only] and [a=Doyle (3)]) for their father.  After a while he fell off the radar and there was some word that he may have returned to his native Colombia.\r\n\r\nRobo re-appeared in 2001 when he joined the Misfits for their 25th anniversary tour and returned to the band again in 2005. He also played with Black Flag at their 2003 cat benefit reunion show.\r\n\r\nIn 2010, Robo was removed from the Misfits after problems with his Colombian passport made touring problematic for the band.\r\n	2017-11-23 19:00:01.443193	2017-11-26 00:17:25.07922	22	Robo (3)
348	\N	Brett Gurewitz (born May 12, 1962) is a guitarist and songwriter in Bad Religion. He is also the owner of the record label [l=Epitaph].\r\n\r\nGurewitz owns Westbeach Recorders and has engineered several Bad Religion records using he pseudonym "The Legendary Starbolt".\r\n\r\nBrett co-founded Bad Religion in 1980, along with [a=Greg Graffin]. [a=Jay Bentley], and [a=Jay Ziskrout].  He founded Epitaph Records in 1981.  He quit Bad Religion in 1983 following the release of the "Into The Unknown" LP and spent several years mired in a drug addiction.  During that time, he worked for Chameleon Records.  In 1985, using the psuedonym "Billy Pilgrim", he recorded and released a 5 song E.P. under the moniker "The Seeing Eye Gods", collaborating with a friend who was allegedly his cocaine dealer.  In 1987, after getting sober, Brett rejoined Bad Religion and remained with the band until 1994, when he left again.  Officially, he left to concentrate on Epitaph after the success of the [a=Offspring], but it was later revealed that the real reason had to do with personal tension within the group and a blow-out fight with Jay Bentley was the final straw.  In 1996, Brett launched the Daredevils, who released a 7" called "Hate You", whose title track was said to be aimed at Bentley.  That group was sidetracked when Brett relapsed into drug abuse.  Brett eventually landed in jail on a drug possession charge before getting sober again.  In 2001, he rejoined Bad Religion.  However, his participation is limited to writing and studio work, as his focus is still on running Epitaph.  He makes occassional live appearances when the band performs in Los Angeles. \r\n	2017-11-23 19:00:13.374329	2017-11-26 00:17:39.080088	22	Brett Gurewitz
349	\N	Guitarist/bassist for a host of seminal punk rock bands including Minor Threat, Government Issue, The Meatmen, Dag Nasty & then more recently, Bad Religion. He was also in a short lived hard rock band called Pavement after the breakup of Dag Nasty.\r\n\r\nMost of the groups he was in eventually disbanded. However, he left the Meatmen to form Dag Nasty in 1985.\r\n	2017-11-23 19:00:13.378953	2017-11-26 00:17:46.071434	22	Brian Baker
350	\N	Born February 15, 1977\r\n\r\nDrummer and younger brother of drummer [a=Chad Wackerman] (ex [a=Frank Zappa]) and drummer [a=John Wackerman].\r\n\r\nMember of newly-developed (2008) [a=James Shaffer] band/project "Fear And The Nervous System".\r\n	2017-11-23 19:00:13.382835	2017-11-26 00:17:53.168388	22	Brooks Wackerman
353	\N	Greg Hetson is a guitarist in two veteran punk rock bands, Bad Religion and The Circle Jerks.	2017-11-23 19:00:13.393634	2017-11-26 00:18:13.085039	22	Greg Hetson
355	\N	Jay Bentley (born June 6, 1964) is the bassist and co-founding member of the legendary punk rock group Bad Religion.\r\n\r\nIn 1983, just prior to exiting Bad Religion, Jay joined Wasted Youth.  After he quit BR, he briefly joined T.S.O.L., but exited when original bassist Mike Roche rejoined the group.  After his stint with T.S.O.L., he joined T.S.O.L. frontman Jack Grisham's new band, Cathedral Of Tears, but again, his tenure was brief and he left Wasted Youth shortly thereafter, too.  He returned to Bad Religion in 1986 and has remained with the band ever since.\n	2017-11-23 19:00:13.400336	2017-11-26 00:18:28.100824	22	Jay Bentley
356	\N	Original drummer and founding member of Bad Religion.  He performed on their first 7" but quit the band in the middle of the recording of their first LP (he appears on about half the songs).  He later worked for Arista Records and Epitaph Europe. He currently is the founder and CEO of Dympol, an online discount music service.	2017-11-23 19:00:13.403613	2017-11-26 00:18:36.072894	22	Jay Ziskrout
360	\N	Born: June 11, 1964\r\n\r\nHe played drums in the now-legendary punk rock group Bad Religion in 1981-1982 and again from 1984 to 1991.\r\n	2017-11-23 19:00:13.417627	2017-11-26 00:19:02.077628	22	Pete Finestone
362	\N	December 15, 1891 in Maces Springs, Virginia - November 7, 1960 in Maces Springs.\r\n\r\nFounding member of [a=The Carter Family]. \r\nEx-husband of [a=Sara Carter (2)].\r\nBrother-in-law of [a=Maybelle Carter].\r\nUncle of [a=Helen Carter (2)], [a=Anita Carter] and [a=June Carter].	2017-11-23 19:00:31.374857	2017-11-26 00:19:15.08497	11	A. P. Carter
364	\N	Daughter of [a628154] and sister of [a=Anita Carter] and [a=June Carter]. Born September 19, 1927. Died June 2, 1988.	2017-11-23 19:00:31.380584	2017-11-26 00:19:29.083921	11	Helen Carter (2)
366	\N	June Carter was an American Country singer and songwriter. She also was a member of the famous Carter Family. In 1968 June married Johnny Cash.\r\n\r\nBorn June 23rd, 1929, in Maces Spring, Virginia - died May 15th, 2003, in Nashville, Tennessee.\r\n\r\nShe died from complications following heart valve surgery on May 15th, 2003.\r\n	2017-11-23 19:00:31.385974	2017-11-26 00:19:43.081238	11	June Carter Cash
372	\N	Bill Monroe (born September 13, 1911, Rosine, Kentucky, USA - died September 9, 1996, Springfield, Tennessee, USA) was an American mandolinist who pioneered bluegrass music (which takes its name from his band, the "Blue Grass Boys") and often referred to as "the father of bluegrass." Monroe's performing career spanned 60 years as a singer, instrumentalist, composer and bandleader. He was inducted into the Country Music Hall of Fame, the Nashville Songwriters Hall of Fame, and the Rock and Roll Hall of Fame (as an "early influence").	2017-11-23 19:00:42.355782	2017-11-26 00:20:24.085394	11	Bill Monroe
373	\N	American bluegrass fiddler, multi-instrumentalist and composer, born June 6, 1931 in Baisden, West Virginia and died November 19, 2004 in Jasper, Alabama. He is the brother of [a1560959] and his cousin is [a1776164].	2017-11-23 19:00:42.359427	2017-11-26 00:20:31.082995	11	Charlie Cline
376	\N	Don Reno, father of [a=Don Wayne Reno], was a bluegrass and country musician best known as a banjo player in partnership with [a=Red Smiley] and later [a=Bill Harrell]. \r\nHe was born February 21, 1927 in Spartanburg, South Carolina and died October 16, 1984 in Lynchburg, Virginia.\r\n	2017-11-23 19:00:42.37062	2017-11-26 00:20:52.099331	11	Don Reno
377	\N	Born: 6th December 1936 Norton, Virginia, USA\r\nDied: 1st December 2009\r\nBluegrass musician (bass & guitar) and voaclist.	2017-11-23 19:00:42.374263	2017-11-26 00:20:59.078009	11	Jack Cooke
379	\N	American bluegrass singer and guitarist born May 23, 1925 in Crimora, Virginia, USA.	2017-11-23 19:00:42.381946	2017-11-26 00:21:15.081921	11	Mac Wiseman
380	\N	American bluegrass musician and composer born July 4, 1942 Boston, Massachusetts. Rowan plays guitar and mandolin, yodels and sings.	2017-11-23 19:00:42.386242	2017-11-26 00:21:22.082979	11	Peter Rowan
384	\N	Born January 22, 1952 in Fort Payne, Alabama.	2017-11-23 19:00:53.453854	2017-11-26 00:21:49.081413	11	Teddy Gentry
385	\N	An American country music singer, guitarist and songwriter, born July 7, 1927 in Henagar, Alabama.  Died Jan. 26, 2011 at his home in Wartrace, Tenn. following a brief battle with pancreatic cancer.  Louvin was a member of the Country Music Hall of Fame, and was the oldest living member of the Grand Ole Opry, having been made a member in 1955.\r\n\r\n\r\n	2017-11-23 19:01:05.35937	2017-11-26 00:21:56.089028	11	Charlie Louvin
386	\N	An American country music singer, mandolin player and songwriter, born April 21, 1924 in Section, Alabama; died June 20, 1965 in Jefferson City, Missouri.\r\n\r\nBrother of [a=Charlie Louvin], cousin of [a=John D. Loudermilk].\n	2017-11-23 19:01:05.362923	2017-11-26 00:22:03.093802	11	Ira Louvin
450	\N	A founding Beach Boy, the only original member of the band who was not related by blood to the Wilson brothers (Brian, Carl, and Dennis) and their cousin, Mike Love.\r\n\r\nBorn: September 3, 1942, Lima, Ohio.\r\n	2017-11-23 19:05:49.354706	2017-11-26 00:29:27.095949	17	Alan Jardine
389	\N	Charlie Daniels was Born 28 October 1936 in Wilmington, North Carolina, USA. Daniels, who wrote "Carolina (I Love You)" about his youth, was the son of a lumberjack and was raised with a love of bluegrass music. He borrowed a guitar when he was 15 years old and immediately learned to play basic tunes. He then acquired skills on mandolin and fiddle, but had to modify his playing when he lost the tip of his ring finger in an accident in 1955. He formed a bluegrass band, ''The Misty Mountain Boys'', but the group changed its name to ''The Jaguars'' following the single ''Jaguar'', which they recorded in 1959 (produced by [a=Bob Johnston]). Daniels said, "for nine years we played every honky-tonk dive and low-life joint between Raleigh and Texas". This enabled him to master a variety of musical styles, but his only national success came in 1964 when he wrote an [a=Elvis Presley] B-side "It Hurts Me", a tender ballad that remains one of his best compositions.\r\n\r\nIn 1967, Daniels followed Bob Johnston his suggestion to accept regular session work in Nashville. He played electric bass on [a=Bob Dylan]'s Nashville Skyline and later appeared on his albums Self Portrait and New Morning. He also worked with [a=Marty Robbins], [a=Hank Williams Jr.] (on Family Tradition) and [a=Ringo Starr] (on Beaucoups Of Blues), and took Lester Flatt his place alongside Earl Scruggs. He produced albums by [a=The Youngbloods] and by [a=Jerry Corbitt]. The latter, in turn, produced one by Daniels, both of which were released in the USA by [l=Capitol Records].\r\n	2017-11-23 19:01:16.37086	2017-11-26 00:22:23.091233	11	Charlie Daniels
395	\N		2017-11-23 19:01:16.394649	2017-11-26 00:23:05.078296	11	Jack Gavin
396	\N	Drummer. Member of the [b]Charlie Daniels Band[/b] from 1978 until 1983.	2017-11-23 19:01:16.399299	2017-11-26 00:23:12.084579	11	James W. Marshall
399	\N	American keyboardist, was a longtime member of The Charlie Daniels Band.\r\nBorn: January 8, 1944 in Webster, Worcester County, Massachusetts, USA.\r\nDied: October 12, 2011 in Nashville, Tennessee, USA. (Car accident)	2017-11-23 19:01:16.412184	2017-11-26 00:23:32.152543	11	Taz DiGregorio
402	\N		2017-11-23 19:03:17.384943	2017-11-26 00:23:53.079255	2	Corey Woods
403	\N	Dennis Coles AKA [a=Ghostface Killah], May 9, 1970, is a rapper and member of the hip hop collective [a=Wu-Tang Clan]. He also frequently goes by the alias of [a=Tony Starks], taken from the secret identity of Marvel Comics super hero Iron Man, Tony Stark.	2017-11-23 19:03:17.388764	2017-11-26 00:24:00.080968	2	Dennis Coles
405	\N	Gary Grice was born on August 22, 1966 in Brooklyn, New-York. He is an African-American rapper, member of hip-hop supergroup [a=Wu-Tang Clan].	2017-11-23 19:03:17.396627	2017-11-26 00:24:14.085394	2	Gary Grice
409	\N	Russel Jones  (born November 15, 1968, Brooklyn, New York, USA – died November 13, 2004, New York City, New York, USA) better known under his stage name [a39015], was an American rapper and producer. He was one of the founding members of the [a11213]. He grew up in the neighborhood of Fort Green as a welfare child and died in a Manhattan recording studio, after complaining about chest pains. It was believed that he was having a seizure.\r\n	2017-11-23 19:03:17.412398	2017-11-26 00:24:42.070865	2	Russel Jones
410	\N	Andre Young, also known by his stage name [a50513] (born February 18, 1965, Compton, California, USA) is an American record producer, rapper and entrepreneur. He is the founder and current CEO of [l2310] and Beats Electronics. Dr. Dre was previously the co-owner of, and an artist on [l19737]. He has produced albums for and overseen the careers of many rappers, including [a132084], [a38661], [a14753], [a79578], [a209748], and [a1778977]. He is credited as a key figure in the popularization of West Coast G-funk, a style of rap music characterized as synthesizer-based with slow, heavy beats. In 2014, Dr. Dre was ranked as the second richest figure in the American hip hop scene by Forbes with a net worth of $550 million.	2017-11-23 19:03:29.359528	2017-11-26 00:24:49.081975	2	Andre Young
411	\N	Compton-based DJ and hip-hop producer for the various groups including the [a=World Class Wreckin' Cru] and [a=N.W.A.] where he also was a member.  Today he currently works on filming and producing adult films.	2017-11-23 19:03:29.364329	2017-11-26 00:24:56.082912	2	Antoine Carraby
412	\N	Born and raised in Compton, California, Eric Wright has become an icon in hip-hop popularizing the genre of gangsta rap.  Wright was a hip-hop entrepreuner, founder of the sucessful independent label [l=Ruthless Records], co-founder of the group [a=N.W.A.], and multi-platinum selling solo artist, while publicisizing the gritty and grim realities of African American adolescents in neighborhoods of greater Los Angeles.  In 1995 Eric Wright shocked the world when he died of a complication of AIDS, however his legacy is still present today.	2017-11-23 19:03:29.369489	2017-11-26 00:25:03.090921	2	Eric Wright
688	\N	American rock-blues musician (guitarist).\r\n\r\nBorn : December 25, 1944 in Tacoma Park, Maryland.\r\nDied : October 21, 1997 in Paris, France.\r\n\r\nHenry was a member founder of the band of rock-blues "Canned Heat".	2017-11-23 19:40:46.482821	2017-11-26 00:57:19.078125	18	Henry Vestine
417	\N	Jason Mizell (born January 21, 1965, Brooklyn, New York, USA – died October 30, 2002, Queens, New York, USA) was an American musician and DJ known as [a23045]. At the age of 3 years he started playing trumpet and played bass, guitar, and drums in various bands prior to discovering turntables. He moved to Hollis, Queens in 1975 with his family where he soon discovered the turntables and started DJ-ing at the age of 13.\r\n\r\nIn 1982, he hooked up with [a177456] and [a623939] of [a219213] just after they graduated from high school and agreed to DJ for them because he wanted to be part of the band. On Run-D.M.C's album Raising Hell, Mizell played keyboards, bass, and live drums in addition to his turntable work \r\n\r\nOn October 30, 2002, at 7:30 pm Mizell was shot and killed in a Merrick Boulevard recording studio in Jamaica, Queens.	2017-11-23 19:03:41.356518	2017-11-26 00:25:38.085092	2	Jason Mizell
419	\N	Ali Shaheed Muhammad was born and raised in Bedford Stuyvesant, Brooklyn. At an early age Ali became fascinated with music. His earliest memory of this fascination was toting around a yellow Mickey Mouse transistor radio he received as a gift. "I brought that with me everywhere; I was comforted by the sounds that came from that little box," he says. Other memories lead to house parties his mother would throw where his Uncle Mike would deejay. It was at one of these parties that the then eight-year-old Ali took control of the mixer and turntables and began his life long musical journey. Ali went from local neighborhood deejay to a world-renowned producer and musician, forming not one but two popular bands.\r\n\r\nThe first group, A Tribe Called Quest, was where "Mr. Muhammad" partnered up with band mates Q-Tip and Phife. The hip-hop trio recorded five albums. The three stand incontestable as hip-hop classics. Their innovation changed the sound of hip-hop and R & B with jazzy, melodic beats. Tribe exited the world via the same stage as The Beatles and The Police, but their influence still lives with artists like D’Angelo, Common, Erykah Badu, Jill Scott, The Roots and Musiq.\r\n\r\nAfter Tribe, Ali co-founded a new super trio named Lucy Pearl. Here with band members Dawn Robinson and Raphael Saadiq, he was able to explore more of his music abilities. Lucy Pearl fused funk, rock, R & B and hip-hop bringing a new energy and sound which remains to be duplicated.\r\n\r\nAli is also a 4-time Grammy nominee -- twice with A Tribe Called Quest, once for works with D’Angelo and once for Lucy Pearl. With plenty of production credits, no Grammy wins and two defunct groups, what is left for the DJ with plenty more music in his soul?\r\n	2017-11-23 19:03:52.348167	2017-11-26 00:25:52.096586	2	Ali Shaheed Muhammad
421	\N	Kamaal Ibn John Fareed (born April 10, 1970), better known by his stage name Q-Tip, is an American hip hop artist, producer, singer, and actor from Queens, New York City, part of the critically acclaimed group A Tribe Called Quest.\r\n\r\nQ-Tip was born Jonathan Davis on April 10, 1970 in Queens, New York. His father was from Montserrat, a British territory in the eastern Caribbean. His mother is an African-American woman from Alabama. He attended Murry Bergtraum High School in Manhattan, New York. He converted to Islam in the mid-1990s, and changed his name to Kamaal Ibn John Fareed. The Q in Q-Tip's stage name stands for Queens, the borough of New York City from which he hails. In an interview with Martha Stewart he revealed that he got his nickname Q-tip during his childhood because he was skinny and had big hair.\r\n\r\nQ-Tip is a resident of Englewood Cliffs, New Jersey. He is the cousin of both Consequence and Dres from the hip hop group Black Sheep.\r\n	2017-11-23 19:03:52.357055	2017-11-26 00:26:06.093823	2	Kamaal Fareed
423	\N	Record producer, bassist, and member of the hip-hop group Public Enemy.\r\n\r\nHardgroove’s musical repertoire spans the genres of hip-hop, soul, rhythm and blues, rock, and reggae.  Although he’s done productions that include the extraordinary talents of Chuck D (Public Enemy), Steven Tyler & Joe Perry (Aerosmith), Burning Spear (Grammy winner “Reggae Album Of The Year 2009), Marc Anthony, Supertramp and The Fine Arts Militia, his most cherished work is the production of two of China’s premier punk rock bands Demerit and Brain Failure in 2007 and 2008.  Brian serves as Artist in Residence with the Santa Fe University of Art and Design.	2017-11-23 19:04:04.353788	2017-11-26 00:26:20.084406	2	Brian Hardgroove
425	\N	Producer/DJ for Kings of Pressure and Public Enemy. Former member of the Bomb Squad. \r\n\r\nJohnny was once in a b-boy crew with Busta Rhymes in Long Island. The crew's main rivals featured Charlie Brown.\r\n\r\nCharlie and Johnny formed a group called The Bum Rush Two just prior to Johnny joining the Kings of Pressure project that was being put together by Chuck D and Hank Shocklee. From there their career went in different directions with Johnny becoming 2nd DJ for Public Enemy and Charlie Brown forming Leaders of the New School with Busta Rhymes.\r\n\r\nJohnny is currently producing and DJing with [a=Son Of Bazerk] and [a=No Self Control And The Band]. The group put out a new album in 2010 after an 18-year hiatus, and is readying another release for 2011.\r\n	2017-11-23 19:04:04.363975	2017-11-26 00:26:34.078349	2	Johnny Juice Rosado
433	\N	Born on April 5th 1950, Jönköping, Sweden. Agnetha released her first single in 1967, followed by various hit singles and four albums as a solo artist in the period before joining [a=ABBA]. In 1969, she got engaged to [a=Dieter Zimmermann], but the engagement was broken off after only a few months. In 1971, Agnetha married [a=Björn Ulvaeus]. From their marriage came daughter [a=Linda Ulvaeus], born in 1973, and son [a=Christian Ulvaeus], born in 1977. The couple separated in 1978.\r\n\r\nAgnetha became one of the four members of the group [a=ABBA] in 1972, one of the two female lead singers. During her time with ABBA, she released another album, a compilation album and a few singles as solo artist. She also released a Christmas album with her daughter Linda in this period. \r\n\r\nIn 1982, she resumed her solo career full time, releasing another string of successful singles and four more albums in the 1980's, one of which she recorded with her son Christian in 1987. 1988 saw the last single release until 1998, and her next album was only to follow in 2004. \r\n\r\nAfter another 9 years of musical silence, Agnetha released her new single, When You Really Loved Someone, in March 2013. Her recent solo album, titled A was released in May of the same year.\r\n\r\n\r\n\r\n	2017-11-23 19:05:12.373959	2017-11-26 00:27:27.080275	17	Agnetha Fältskog
436	\N	Born: April 25, 1945, Gothenburg, Sweden\r\n\r\nOne of the two main songwriters and producers in [a=ABBA]. If you are making an addition where he is credited together with Benny Andersson please credit as [a=Björn Ulvaeus & Benny Andersson] (unless they are credited together with someone else, in which case separate credits should be used).\r\n	2017-11-23 19:05:12.382744	2017-11-26 00:27:48.089406	17	Björn Ulvaeus
438	\N	British guitarist, vocalist and songwriter for the [a=Bee Gees], born September 1, 1946 in Douglas, Isle of Man. Brother of [a=Robin Gibb], [a=Maurice Gibb] and [a=Andy Gibb].	2017-11-23 19:05:25.356541	2017-11-26 00:28:02.081386	17	Barry Gibb
439	\N	British keyboards player (b. March 11th, 1947, Cardiff, Wales).\r\n\r\nA founder member of "Amen Corner" and its successor "Fair Weather", Weaver replaced Rick Wakeman in "Strawbs" when the latter left to join "Yes". He left "Strawbs" in 1973, and toured with "Mott the Hoople" in the US tour. Queen were their support act. He also appeared with the "Streetwalkers" and session work followed, including "Pet Shop Boys" or "Bee Gees" (including "Saturday Night Fever").\n	2017-11-23 19:05:25.360266	2017-11-26 00:28:09.077503	17	Blue Weaver
440	\N	Colin Petersen (born 24 March 1946, Kingaroy, Queensland, Australia) is an Australian drummer, record producer and former child actor. \r\n\r\nWhen he was nine years old he starred in the film [i]Smiley[/i] (1956), and went on to act in several more British films. When he returned to Australia, he attended the Humpybong State School at the same time that [url=https://www.discogs.com/artist/151481-Barry-Gibb]Barry[/url], [url=https://www.discogs.com/artist/179142-Robin-Gibb]Robin[/url], and [a290019] were there. On leaving school he played with several bands including [a2847453].\r\n\r\nPetersen moved to the UK in 1967 and was recruited as the drummer for the [a97664]. He was fired in 1969, and in 1970 formed the band [a1371912], which broke up in the same year. He returned to Australia in 1974 and became a painter and on occasion did some production work.	2017-11-23 19:05:25.36393	2017-11-26 00:28:16.07447	17	Colin Petersen
441	\N	Drummer	2017-11-23 19:05:25.367096	2017-11-26 00:28:23.069381	17	Dennis Bryon
443	\N	Maurice Gibb, CBE (born December 22, 1949, Douglas, Isle of Man, UK – died January 21, 2003, Miami Beach, Florida, USA) was a British singer, songwriter, multi-instrumentalist, and record producer who achieved fame as a member of the group the [a97664]. Twin brother of [a179142] and brother of [a151481] and [a213331]. He died from a cardiac arrest due to complications of a blocked intestine.\r\n	2017-11-23 19:05:25.375009	2017-11-26 00:28:37.099664	17	Maurice Gibb
444	\N	British singer and songwriter, born 22 December 1949 in Douglas, Isle of Man and died 20 May 2012 in London, England, UK. Twin brother of [a=Maurice Gibb] and brother of [a=Barry Gibb] and [a=Andy Gibb].\r\nCBE - Commander of the Most Excellent Order of the British Empire.\r\n	2017-11-23 19:05:25.379605	2017-11-26 00:28:44.16266	17	Robin Gibb
445	\N	Vince Melouney (born 18 August 1945, Sydney, New South Wales, Australia) was a founding member and lead guitarist of [a2197906], which was later renamed to [a1240447], from 1963 to 1965. He was the lead guitarist on the first three [a97664] albums; "Bee Gees' 1st", "Horizontal", and "Idea".	2017-11-23 19:05:25.384092	2017-11-26 00:28:51.074651	17	Vince Melouney
446	\N	British singer, songwriter, and actor. \r\n\r\nBorn: 30 December 1945 in Leamington Street, Manchester, England, UK.  \r\nDied: 29 February 2012 in Indiantown, Florida, USA (aged 66). \r\n\r\nEnglish rock singer-songwriter and actor best known as a member of [url=http://www.discogs.com/artist/Monkees,+The]The Monkees[/url], during the mid to late-1960s. \r\n\r\nLater known for his theatre and film acting work. \r\n\r\nDied whilst asleep in his Florida home of a heart attack. \r\n	2017-11-23 19:05:37.349074	2017-11-26 00:28:58.155873	17	Davy Jones
448	\N	Born: March 8, 1945, Los Angeles, California	2017-11-23 19:05:37.356728	2017-11-26 00:29:12.075266	17	Micky Dolenz
452	\N	American songwriter, producer, arranger and musician, co-founder and leader of [a=The Beach Boys]. Born 20 June 1942 in Inglewood, California, USA. From late 1964 to 1979, Wilson was married to [url=https://www.discogs.com/artist/1009337-Marilyn-Rovell-Wilson]Marilyn Rovell[/url], with whom he had daughters [url=https://www.discogs.com/artist/434651-Carnie-Wilson]Carnie[/url] and [url=https://www.discogs.com/artist/413862-Wendy-Wilson]Wendy[/url] who became members of both [a=The Wilsons] and [a=Wilson Phillips]. Son of [a363017] and [a3239364]. Brother of [a391245] and [a260571] and cousin of [a372789].\r\n	2017-11-23 19:05:49.364667	2017-11-26 00:29:41.098261	17	Brian Wilson
453	\N	Vocalist, keyboardist, guitarist, bassist, drummer, composer and producer from Beverly Hills (CA, USA), born the 24th of June 1944 in Chicago (IL, USA).\r\nHis first band was Sleepwalkers together with [a=Kim Fowley] and [a=Sandy Nelson]. He got fame in the West Coast area of the USA and did several studio appearences. He played bass on [a=Teddy Bears] hit single "To Know Him Is To Love Him" and drummed in [a=Ritchie Valens]' live band. Then he formed the band [a=The Surf Stompers]. Late 1964 he joined The Beach Boys and had great success with the band. In 1972 he left the band and recorded a solo album. In 1979 he returned to The Beach Boys and produced, toured and collaborated with the band ever since.\r\n	2017-11-23 19:05:49.369047	2017-11-26 00:29:48.081297	17	Bruce Johnston
456	\N	Dennis Wilson (born December 4, 1944, Inglewood, California, USA – died December 28, 1983, Marina del Rey, California, USA) was an American musician, singer, and songwriter who co-founded [a70829] along with his brothers [url=https://www.discogs.com/artist/189718-Brian-Wilson]Brian[/url], [url=https://www.discogs.com/artist/260571-Carl-Wilson]Carl[/url] and cousin [a372789]. Son of [a363017] and [a3239364]. Uncle of [a434651] and [a413862].\r\n\r\nDennis served mainly on drums and backing vocals for The Beach Boys from the bands formation in 1961, until his death in 1983. While he was allowed few lead vocals in the 1960's, his prominence as a singer-songwriter increased into the 1970's. He was also known for his brief association in the late 1960's with aspiring songwriter [a58562], who was later convicted of murder conspiracy. In 1971, Dennis starred in the road movie [i]Two-Lane Blacktop[/i]. \r\n\r\nDennis drowned at Marina Del Rey, Los Angeles, after drinking all day and then diving in the afternoon, to recover items he had thrown overboard at the marina from his yacht three years prior.\r\n\r\nHe was married [a=Karen Lamm-Wilson] twice — first in 1976 and again in 1978.	2017-11-23 19:05:49.381845	2017-11-26 00:30:09.085247	17	Dennis Wilson (2)
457	\N	Mike Love (born March 15, 1941, Los Angeles, California, USA) is an American singer, songwriter, musician, and activist who co-founded [a70829] with his cousins [url=https://www.discogs.com/artist/189718-Brian-Wilson]Brian[/url], [url=https://www.discogs.com/artist/391245-Dennis-Wilson-2]Dennis[/url] and [a260571]. Nephew of [a363017] and [a3239364].\r\n\r\nIn 1998, following the death of cousin Carl Wilson, Love and longtime Beach Boy [a100702] were given an exclusive license to tour under the name "The Beach Boys". The other surviving Beach Boys, Brian Wilson and [a311925], embarked on solo endeavors. 	2017-11-23 19:05:49.386175	2017-11-26 00:30:16.086677	17	Mike Love
461	\N	Born: April 27, 1948, Weehawken, New Jersey\r\n\r\nVocalist for the [a=The B-52's].\r\n	2017-11-23 19:06:01.35489	2017-11-26 00:30:44.088298	17	Kate Pierson
464	\N	Born: March 19, 1953, Athens, Georgia\r\nDied: October 12, 1985, New York City, New York\r\n\r\nOriginal member of [a=The B-52's] and older brother of [a=Cindy Wilson]. Died in 1985 of AIDS-related diseases.\r\n	2017-11-23 19:06:01.365135	2017-11-26 00:31:05.092748	17	Ricky Wilson (3)
465	\N	English bass player and singer from a small town in the West Midlands. Daughter of 2 music teachers, she played tympani and double bass in school until she discovered the electric bass guitar. [a=Robert Fripp] discovered her when she was working at Polydor Records and asked her to join [a=The League Of Gentlemen (2)].\r\n\r\nSara went on to work with [a=Robyn Hitchcock] and [a=Gang of Four] in England, and later moved to the United States. In 1996 and 1997 she toured with [a=Ani DiFranco] and played with many other artists, including [a=The B-52's], [a=Indigo Girls], [a=Joan Osborne], [a=Ryuichi Sakamoto], [a=Fiona Apple], and the [a=Thompson Twins].\r\n\r\nShe released her solo debut, on Righteous Babe Records, in 2000.	2017-11-23 19:06:01.368888	2017-11-26 00:31:13.071956	17	Sara Lee
466	\N	American session guitarist, born 1955 in Hartford, CT, USA,  who's played and recorded with all the greats, including [a=The Roots Radics], [a=Sly & Robbie] and [a=Bob Marley & The Wailers]. He's toured extensively with [a=Dennis Brown], [a=Gregory Isaacs], [a=Yellowman] and is now a member of [a=Toots & The Maytals].\r\n\r\nAway from reggae, he's also played with soul acts such as [a=Percy Sledge], [a=LaVern Baker] and even [a=Coati Mundi] and [a=Ron Wood]\r\n\r\nIn 2003, he  he received an award from the Jamaica Federation of Musicians for outstanding contributions to the Jamaican music industry.\r\n	2017-11-23 19:16:21.388849	2017-11-26 00:31:20.080613	15	Andy Bassford
473	\N	Jamaican ska singer. Lead singer of the Mellow Larks.\r\nDo not confuse with [a=Steel Pulse]'s [a=Basil Gabbidon (2)].	2017-11-23 19:16:33.366966	2017-11-26 00:32:11.070292	15	Basil Gabbidon (2)
477	\N	Mykaell S. Riley began his career as a performer with pioneering Reggae outfit Steel Pulse before moving on to found the Reggae Philharmonic Orchestra. He has been a professional writer/producer/arranger for the last fifteen years, producing music for TV and film and over thirty albums. He has worked for artists such as Soul II Soul, Courtney Pine, Baba Maal, and a host of others.\r\nA Senior Lecturer in Music Production at the University of Westminster, Mykaell is also Senior Trustee for the Black Music Education Trust, a new initiative borne out of the need to document the history of black music.\r\n	2017-11-23 19:16:33.38385	2017-11-26 00:32:38.088651	15	Mykaell Riley
481	\N	Jamaican reggae bass player.\r\nBorn :  November 22, 1946 in Kingston, Jamaica.\r\n\r\nWith his brother, drummer [a=Carlton Barrett] (1950-1987), was part of [a=Lee Perry]'s [url=http://www.discogs.com/artist/64735-Upsetters-The]The Upsetters[/url] before joining [a=Bob Marley] in the group [url=http://www.discogs.com/artist/52145-Wailers-The]The Wailers[/url] (that would become [a=Bob Marley & the Wailers]). Also played on various other Jamaican reggae sessions.\r\nNicknamed "Family Man" (or "Fams") because he's the father of 40 kids. Sons include [url=http://www.discogs.com/artist/1800230-F-Barrett]Floyd Barrett[/url], [url=http://www.discogs.com/artist/4374513-K-Barrett-2]Kevin Barrett[/url], and [a=Aston Barrett Jr.].\r\n	2017-11-23 19:16:45.363765	2017-11-26 00:33:06.089157	15	Aston "Family Man" Barrett
484	\N	Andy Nicholson is an English musician, DJ and producer, best known as the original bass guitarist of the Sheffield band [a=Arctic Monkeys], which he left in 2006. In 2008 he founded [a=Mongrel (3)] with [a=Jon McClure] of [a=Reverend And The Makers]. In 2009 he became the Drummer for ex-[a=Milburn] (band) frontman [a=Joe Carnall]'s band [a=The Book Club], but left later that year to join [a=Reverend And The Makers]. He is currently producing and performing in hip-hop group [a=Clubs & Spades] with [a=Matic Mouth] from Reverend Soundsystem and is half of the production/performing duo [a=Sticky Blood (2)].	2017-11-23 19:22:15.393849	2017-11-26 00:33:27.083561	24	Andy Nicholson (2)
485	\N	Jamie Robert Cook (born 8 July 1985) is the guitarist of the British indie rock band Arctic Monkeys.\r\nOriginally a next door neighbour of fellow band member; frontman Alex Turner. He is the son of an engineer.\r\n\r\n	2017-11-23 19:22:15.397147	2017-11-26 00:33:34.091252	24	Jamie Cook
488	\N	Albert Louis Hammond, Jr. (born April 9, 1980) is an American musician and member of the indie rock band The Strokes, in which he primarily plays guitar, but also plays keyboards live. He is also a solo musician. His father, [a=Albert Hammond], whose career was primarily in the 1960s and 1970s, had even greater success on the singles charts as a songwriter and occasional singer. Hammond, Jr. released his debut album Yours To Keep in 2006 and followed up with ¿Cómo Te Llama? in 2008. The Beach Boys, Buddy Holly, Frank Black, Guided By Voices, John Lennon, Matthew Sweet and The Velvet Underground are often cited as his major influences.	2017-11-23 19:22:25.362693	2017-11-26 00:33:55.081378	24	Albert Hammond Jr.
492	\N	Bassist.\r\n\r\nBorn November 13, 1978, New York City, NY	2017-11-23 19:22:25.381637	2017-11-26 00:34:23.071754	24	Nikolai Fraiture
493	\N	English bassist, keyboardist and composer, born 26 June 1969 in Oxford, UK. Brother of [a=Jonny Greenwood].	2017-11-23 19:22:36.37303	2017-11-26 00:34:30.08069	24	Colin Greenwood
495	\N	British lead guitarist, keyboardist, programmer and composer, born 5 November 1971 in Oxford, UK. Brother of [a=Colin Greenwood].	2017-11-23 19:22:36.381812	2017-11-26 00:34:44.076547	24	Jonny Greenwood
497	\N	English musician, singer and songwriter, born 7 October 1968 in Wellingborough, Northamptonshire, England, UK.	2017-11-23 19:22:36.390103	2017-11-26 00:34:58.086778	24	Thom Yorke
499	\N	Guitarist for the indie rock/synth-pop/new wave band [a=The Killers]. Born March 28, 1976.	2017-11-23 19:22:47.366536	2017-11-26 00:35:12.071544	24	Dave Keuning
500	\N	Born on June 28, 1977. Bassist for the indie rock/synth-pop/new wave band [a=The Killers].\r\n\r\nMark is a fan of The Beatles, The Who, Pearl Jam, and The Mars Volta. His favorite writer is Henry Miller. He is of German decent, and both an Australian and US citizen.\r\n	2017-11-23 19:22:47.370718	2017-11-26 00:35:19.082017	24	Mark Stoermer
504	\N	Producer, recording and mixing engineer, actor and drummer from Montreal, Quebec, Canada. He started recording in 1993 and is specialized in the punk, indie and avant-experimental scenes.\r\n\r\nBetween 1996 and 2000 he ran a studio called [l309926] in Montreal, and later started the [l278346] Studio, also in Montreal, with [a=Efrim Menuck] and [a=Thierry Amar].\r\n\r\nHe was also the drummer of [a=Arcade Fire], but left the band after their first album to concentrate on his production work.\n	2017-11-23 19:22:58.386675	2017-11-26 00:35:46.084423	24	Howard Bilerman
507	\N	Canadian multi-instrumentalist musician and singer.\r\n\r\nShe was born 19 August 1976 in Canada.\r\n\r\nMarried to [a=Win Butler].\r\n\r\n	2017-11-23 19:22:58.395919	2017-11-26 00:36:06.078095	24	Régine Chassagne
509	\N	Canadian violinist.\r\n\r\nShe was born 27 August 1979 on Vancouver Island, British Columbia, Canada. \r\n	2017-11-23 19:22:58.401252	2017-11-26 00:36:20.077691	24	Sarah Neufeld
511	\N	American musician, born 6 October 1982 in Texas, USA. Brother of [a=Win Butler].	2017-11-23 19:22:58.406574	2017-11-26 00:36:34.075698	24	William Butler
512	\N	American singer and songwriter, born 14 April 1980 in California, and raised in Texas, USA. He has lived in Montreal, Canada since 2000. Married to [a=Régine Chassagne] and brother of [a=William Butler].\r\n\r\nAliases: DJ Windows 98	2017-11-23 19:22:58.40978	2017-11-26 00:36:41.08047	24	Win Butler
516	\N	Born August 18, 1967, is the drummer for Mudhoney.	2017-11-23 19:25:15.511021	2017-11-26 00:37:09.079795	25	Dan Peters
517	\N	British singer, songwriter, and bass player who was musically active from the early-1960s to his death in 2017.\r\n\r\nAt 14 he was in his first band 'The Warriors'. They split-up in 1967 in Frankfurt, and Foster joined a band called 'The Big Sound', touring Scandinavia. Returning to London in '68 he formed 'Sleepy' with Rod Hill. In 1969, Foster teamed up once again with Jon Anderson (also ex-Warriors) who was then with '[a=Yes]' and together they wrote 'Sweet Dreams', and 'Yours Is No Disgrace'. In 1970, he formed his next band 'Accrington Stanley', before going on to form '[url=https://www.discogs.com/artist/1162882-Badger-5]Badger[/url]' with Tony Kaye, in 1972. They only recorded one album, 'One Live Badger'.\r\n\r\n[b]Born:[/b] 6th September 1946, in Liverpool, Lancashire, England.\r\n[b]Died:[/b] 2nd November 2017, in Scotland	2017-11-23 19:25:15.515191	2017-11-26 00:37:16.07145	25	Dave Foster (14)
521	\N	American rock musician born May 16, 1965 in Compton, California. He is best known as the bassist for Nirvana. In addition to Nirvana, Krist has played for Sweet 75, Eyes Adrift, and Flipper. Apart from his musical endeavors, Novoselic has been active politically, including the creation of the political action committee JAMPAC. His first name is pronounced both "Chris" or "Krist"\r\n\r\n	2017-11-23 19:25:15.534513	2017-11-26 00:37:44.079622	25	Krist Novoselic
522	\N	American musician, born 20 February 1967 in Aberdeen, Washington, USA, died 5 April 1994 in Seattle, Washington, USA. He is best known as the lead singer, guitarist and songwriter of [a=Nirvana]. From 24 February 1992 until his death, he was married to [a=Courtney Love] with whom he has a daughter, [a=Frances Cobain].	2017-11-23 19:25:15.538708	2017-11-26 00:37:51.076821	25	Kurt Cobain
525	\N	Born Georg Ruthenberg in Los Angeles, CA, on August 5, 1959, Smear ran away from home at the age of 13 to join a Jesus commune. Smear then attended an academic program for youths who were ostracized by public education. One of his classmates was vocalist Darby Crash, with whom he formed  [a=Germs] in the late '70s. Also including Lorna Doom (bass) and Don Bolles (drums), the Germs became one of the most influential punk groups to emerge from L.A.'s underground scene. However, Crash died from a heroin overdose in 1980, abruptly ending the Germs' incendiary existence. Smear released his first solo album, Ruthensmear, on [l=SST Records] in 1987; he recorded the follow-up, So You Fell in Love With a Musician, in 1992. A year later, Smear was asked by the [a=Red Hot Chili Peppers] to replace guitarist [a=John Frusciante]; however, he turned them down. Instead, Smear toured as a member of [a=Nirvana], establishing a close friendship with frontman [a=Kurt Cobain] and his wife [a=Courtney Love]. Smear briefly joined former Nirvana drummer [a=Dave Grohl]'s band [a=Foo Fighters], playing on the group's 1997 album The Colour and the Shape. He quit in 1997 only to re-join in 2011 after years as a touring member. Smear may not be as familiar as his former bandmates, but he is a punk icon. [a=Sonic Youth] paid homage to him in the chorus of "Screaming Skull"; in addition, Grohl idolized him as a teen. Balancing his musical contributions with acting, Smear can be seen in the videos for [a=Prince]'s "Raspberry Beret" and [a=No Doubt]'s "Don't Speak." Moreover, he was often featured on MTV's House of Style.	2017-11-23 19:25:15.553523	2017-11-26 00:38:13.081336	25	Pat Smear
526	\N	Born: December 1, 1977, Agoura, California, USA. An American guitarist, best known as the lead guitarist and one of the founding members of the Grammy Award winning rock band [a=Linkin Park]. He is also the A&R Representative for [l=Machine Shop Recordings].\r\n\r\nBrad Delson attended Agoura High School with childhood friend and Linkin Park band mate [a=Mike Shinoda]. He played in various bands throughout his high school career, the most notable being Relative Degree, in which he met and teamed up with drummer [a=Rob Bourdon].	2017-11-23 19:25:27.358875	2017-11-26 00:38:20.072379	25	Brad Delson
527	\N	Born: March 20, 1976, Phoenix, Arizona, USA.\r\nDied: July 20, 2017, Palos Verdes Estates, Los Angeles, USA.\r\nChester Bennington was an American singer and songwriter, perhaps best known as the frontman for the rock band [a40029]. He was also the lead singer for [a1600809] and fronted [a87642] from 2013 to 2015.	2017-11-23 19:25:27.361933	2017-11-26 00:38:27.084358	25	Chester Bennington
529	\N	Joseph Hahn, also known as Joe Hahn, and also known by his stage name Mr. Hahn (born March 15, 1977, Dallas, Texas, USA) is an American turntablist and director best known as the DJ and sampler for the American rock band [a=Linkin Park]. Hahn is a second generation Korean American.\r\n\r\nHahn began deejaying in high school, and he studied illustration at the Art Center College of Design in Pasadena, California. In college, he met [a=Mike Shinoda], and joined his band Xero, which later became known as [a=Linkin Park].\r\n\r\nHahn was called Chairman Hahn on the back cover of Linkin Park's Remix album Reanimation next to the songs "With You" and "Cure For The Itch". Hahn has directed several of Linkin Park's music videos, such as those for "Numb", "From the Inside", "What I've Done", "Somewhere I Belong", "Pts.OF.Athrty", "New Divide", "Bleed it Out" and "Iridescent".\r\nHe has also directed videos for [a=Story of the Year], [a=Xzibit], and [a=Alkaline Trio].\r\n\r\nOutside of his work in music, Hahn provided special effects work on The X-Files and the miniseries Frank Herbert's Dune.\r\n\r\nHahn directed the trailer for the video game Medal of Honor, featuring Linkin Park's single "The Catalyst".\r\n\r\nHahn became the first Korean American to receive a Grammy when the band won the 2002 award for Best Hard Rock Performance.	2017-11-23 19:25:27.367416	2017-11-26 00:38:41.064569	25	Joseph Hahn
530	\N	Mike is an American musician, record producer, and artist. He is best known as the rapper, principal songwriter, keyboardist, rhythm guitarist and one of the two vocalists of the rock band [a=Linkin Park]. Shinoda is also noted as a solo rapper in his side-project former [a=Fort Minor]. He also provides artwork, production, and mixing for both projects. Shinoda's voice is baritone.	2017-11-23 19:25:27.369854	2017-11-26 00:38:48.081818	25	Mike Shinoda
534	\N	British lead guitarist, keyboardist, programmer and composer, born 5 November 1971 in Oxford, UK. Brother of [a=Colin Greenwood].	2017-11-23 19:25:38.376483	2017-11-26 00:39:16.06384	25	Jonny Greenwood
536	\N	English musician, singer and songwriter, born 7 October 1968 in Wellingborough, Northamptonshire, England, UK.	2017-11-23 19:25:38.383593	2017-11-26 00:39:30.068703	25	Thom Yorke
538	\N	Born 12 April 1978, in Kirkcaldy, Scotland. Scottish musician, multi-instrumentalist and producer, best known as the bassist for the groups Coldplay and Apparatjik. Berryman is left-handed but plays the bass right-handed.	2017-11-23 19:25:49.382633	2017-11-26 00:39:45.07336	25	Guy Berryman
540	\N	Born on July 31, 1978 in Southampton, Hampshire, England. Drummer for the band Coldplay.	2017-11-23 19:25:49.389059	2017-11-26 00:39:59.087031	25	Will Champion
541	\N	Anthony Kiedis (November 1, 1962, Grand Rapids) is an American singer-songwriter who is best known as the vocalist of the Red Hot Chili Peppers. Kiedis along with Flea, Hillel Slovak, and Jack Irons played their first gig together in 1983 as  "Tony Flow and the Miraculously Majestic Masters of Mayhem", before progressing as a band and changing their name to the Red Hot Chili Peppers. 	2017-11-23 19:26:00.468121	2017-11-26 00:40:06.079043	25	Anthony Kiedis
543	\N	Chadwick Gaylord Smith (October 25 1961, Saint Paul in Minnesota) is the drummer in the Red Hot Chili Peppers. He joined the band after Jack Irons quit because of the distress and chaos over former guitarist Hillel Slovak's death.	2017-11-23 19:26:00.477861	2017-11-26 00:40:20.091126	25	Chad Smith
544	\N	Cliff Martinez (born February 5, 1954 in Bronx, New York, raised in Columbus, Ohio) is an American film score composer (who works often with director Steven Soderbergh & Nicolas Winding Refn) and former drummer for Captain Beefheart, The Dickies, The Weirdos and the Red Hot Chili Peppers (1984-1986).	2017-11-23 19:26:00.482786	2017-11-26 00:40:27.072824	25	Cliff Martinez
546	\N	Israeli-American musician, born 13 April 1962 in Haifa, Israel and died due to a heroin overdose 25 June 1988 in Hollywood, Los Angeles, California, USA. He and his family moved to Calfornia when he was 5 years old. He was the original guitarist for [a=Red Hot Chili Peppers].	2017-11-23 19:26:00.49225	2017-11-26 00:40:41.077917	25	Hillel Slovak
547	\N	American musician, born 18 July 1962 in Los Angeles, California, USA. Father of [a4894536].	2017-11-23 19:26:00.496353	2017-11-26 00:40:48.980704	25	Jack Irons
548	\N	American studio guitarist, born 18 January 1956 in Miami, Florida, USA. He was a replacement guitarist of the [a=Red Hot Chili Peppers] when [a=Hillel Slovak] quit to pursue his other band What Is This?. He has worked with artists such as Bob Dylan, Barry Goldberg, George Clinton, Charlie Sexton, Adam Knowles, Peter Case, John Hiatt, Gerry Goffin, and Tonio K.	2017-11-23 19:26:00.500139	2017-11-26 00:40:56.075206	25	Jack Sherman
549	\N	John Anthony Frusciante (New York, March 5 1970) artist/musician and former guitarist for the alternative rock group "Red Hot Chili Peppers".	2017-11-23 19:26:00.503862	2017-11-26 00:41:03.188266	25	John Frusciante
551	\N	Australia-born American bassist.\r\n\r\nBorn: October 16, 1962 in Burwood, Melbourne, Australia.\r\n\r\nMichael Balzary, aka [a=Flea], is the bass player of the [a92476]. He is also the father of [a=Clara Balzary].\r\n	2017-11-23 19:26:00.511758	2017-11-26 00:41:17.084343	25	Michael Balzary
554	\N	Born March 26, 1944, Detroit, Michigan, USA.\r\nAmerican vocalist, producer, and occasional actress. Working within groups early on in her musical career, she is equally known as an artist in her own right, and has released music in many genres; R&B, soul, disco, and jazz. Initial success came as lead singer of [a17966]. \r\n\r\nSister to Motown songwriter [a=Arthur Ross]. \r\n\r\n\r\n	2017-11-23 19:29:13.416515	2017-11-26 00:41:40.087473	12	Diana Ross
555	\N	American vocalist best known as one of the founding members of The Supremes, and its predecessor The Primettes, being in the former group through the first seven years of the group's 18-year history. \r\n\r\nShe then attempted a brief solo career on and off over the next decade, though after little success, decided to concentrate on her family life, before her sudden untimely death of coronary thrombosis. \r\n\r\nBorn June 30, 1943, Detroit; died February 22, 1976, Detroit (aged 32). \r\n	2017-11-23 19:29:13.420367	2017-11-26 00:41:47.080214	12	Florence Ballard
558	\N	American vocalist best known as one of the founding members of The Supremes, and its predecessor The Primettes, being in the former group throughout its 18-year history. \r\n\r\nBorn March 6, 1944, Detroit.\r\n	2017-11-23 19:29:13.433585	2017-11-26 00:42:08.081695	12	Mary Wilson
559	\N	Dutch Jazz guitarist, arranger and composer.\r\nHe was born 18 September 1953 in Amersfoort, Netherlands.\r\n\r\nHe moved to Vienna in 1977, played in ORF-Big Band 1977-82 and many Austrian jazz outfits later on. He also worked over a year as musical director for The Supremes and Gloria Gaynor. \r\nLater founded his own jazz label [l=Jive Music].\r\n\r\n	2017-11-23 19:29:13.437921	2017-11-26 00:42:15.083604	12	Rens Nieuwland
560	\N	Born on November 14, 1944 in Detroit, Michigan, USA\r\n\r\nThe younger sister of singer/actress [a=Freda Payne], Scherrie Payne was the co-lead singer of The Supremes from 1973 to 1977. Because of her powerful voice and petite stature of only five-foot-one, she is sometimes referred to as "the little lady with the big voice."\r\n	2017-11-23 19:29:13.442595	2017-11-26 00:42:22.083524	12	Scherrie Payne
590	\N	[b]Singer - songwriter - producer - drummer[/b]\r\n\r\nBorn on 07.10.1962 in Sacramento, California, U.S.A.\r\nDied on 15.04.2009\r\nBrother of guitarist [a=Michael Brookins]\r\nAlso played keyboards, lead guitar, bass guitar and several horns. \r\nToured with [a=Earth, Wind & Fire] (as musical director), [a=Philip Bailey], [a=George Duke], and was a session musician for many artists, including [a=Stanley Clarke], [a=Nancy Wilson] and [a=Whispers].\r\n	2017-11-23 19:29:35.467057	2017-11-26 00:45:52.072247	12	Robert Brookins
563	\N	Born: 11 December 1954 in Gary, Indiana, USA. \r\nHe is also known as Muhammad Abdul Aziz since his conversion to Islam during the 1980s. \r\n\r\nJermaine was a member of the original Jackson 5. In 1976 when they changed labels from [l=Motown] to [l=Epic]) via [l=Philadelphia International Records], and were forced to rename the band The Jacksons. Jermaine, who was married to Hazel Gordy, daughter of the Jackson 5's Motown manager [a=Berry Gordy], left the Jacksons to start a solo career. \r\n\r\nHe was replaced by Randy Jackson in The Jacksons. He had some success as a solo artist and officially rejoined The Jacksons in 1984, alongside his solo career, making it a sextet of Jackson brothers until their final split in 1990. \r\n\r\nHe currently lives in Dubai and often resides in Bahrain. \r\n	2017-11-23 19:29:25.370668	2017-11-26 00:42:43.078876	12	Jermaine Jackson
564	\N	American entertainer, singer and dancer, born 12 March 1957 in Gary, Indiana, USA. Son of [a=Joe Jackson (5)], brother of [a=Rebbie Jackson], [a=Jackie Jackson], [a=Tito Jackson], [a=Jermaine Jackson], [a=La Toya Jackson], [a=Michael Jackson], [a=Randy Jackson] and [a=Janet Jackson].	2017-11-23 19:29:25.37529	2017-11-26 00:42:53.077508	12	Marlon Jackson
565	\N	American singer, dancer, entertainer, songwriter, producer and recording artist.\r\n\r\nBorn: 29 August 1958 in Gary, Indiana, USA. \r\nDied: 25 June 2009 in Ronald Reagan UCLA Medical Center, Los Angeles, California, USA (aged 50). \r\n\r\nKnown affectionately as the "King Of Pop", Jackson was an singer, dancer, musician, music producer, writer, entertainer, singer-songwriter, choreographer, record producer, recording artist, poet, arranger, businessman, philanthropist, actor, voice artist, and comedian. \r\n \r\nJackson began his career as the youngest member of [a=The Jackson 5] and started his solo recording career in 1971. Brother of recording artists [a=Jackie Jackson], [a=Janet Jackson], [a=Jermaine Jackson], [a=La Toya Jackson], [a=Marlon Jackson], [a=Randy Jackson], [a=Rebbie Jackson] & [a=Tito Jackson], as well as uncle of [a=3T].\r\n\r\nInducted into Rock And Roll Hall of Fame in 2001 (as performer).\r\n\r\nOn June 25, 2009, Michael Jackson died of acute propofol and benzodiazepine intoxication at his home on North Carolwood Drive in the Holmby Hills neighborhood of Los Angeles, CA. His personal physician, Conrad Murray, said he had found Jackson in his room, not breathing and with a barely detectable pulse, and that he administered CPR on Jackson to no avail. After a call was placed to 9-1-1 at 12:21 p.m., Jackson was treated by paramedics at the scene and was later pronounced dead at the Ronald Reagan UCLA Medical Center.	2017-11-23 19:29:25.379569	2017-11-26 00:43:00.092296	12	Michael Jackson
566	\N	Not related to, or to be confused with Jacksons and Jackson 5 member (and Michael Jackson's brother) - see [a239453].\r\nThis Randy Jackson, born June 23, 1956 Baton Rouge, Louisiana, USA, is a grammy-winning Producer, who started out learning bass from age 13. He has played and toured as session bassist with numerous high-profile pop artists, including Journey, Madonna, Elton John, Whitney Houston, Destiny's Child, *NSYNC, Mariah Carey, Céline Dion and more. He was vice president of A&R at Columbia Records for eight years, followed by four years as senior vice president of A&R at MCA Records. He is one of the judges on the TV reality show [i]American Idol[/i].\r\n	2017-11-23 19:29:25.383316	2017-11-26 00:43:08.07819	12	Randy Jackson
575	\N	Soul funk drummer\r\n\r\n[b]Note: Please do not confuse with the session soul vocalist [a=Fred White (2)][/b]\r\nBorn on 13.01.1955 in Chicago, Illinois, U.S.\r\nBrother of [a=Earth, Wind & Fire]'s [a=Maurice White] & [a=Verdine White]. \r\nHe was enlisted as a second drummer for [a=Earth, Wind & Fire] in 1973 and left the group in the 80's.\r\n	2017-11-23 19:29:35.400138	2017-11-26 00:44:08.069996	12	Fred White
577	\N	US-American soul, funk & disco singer. Born on 30th December 1948, Los Angeles, California, U.S.A.\r\nDied on 2nd May 2014, Los Angeles, California, U.S.A.	2017-11-23 19:29:35.409102	2017-11-26 00:44:22.070977	12	Jessica Cleaves
612	\N	American singer and songwriter, best known by the stage name Eddie Kendricks.\r\nKnown for his distinctive falsetto singing style, Kendricks co-founded the Motown vocal group [a28332].\r\nAs a solo artist, Kendricks recorded several hits of his own during the 1970s, including the number-one single [m=148270].\r\nHe also founded the [l=E. J. K. Records] label.\r\n\r\nBorn : 17th December 1939, Union Springs, Alabama, U.S.A.\r\nDied : 5th October 1992, Alabama, U.S.A.	2017-11-23 19:29:58.3868	2017-11-26 00:48:25.072622	12	Eddie Kendricks
617	\N	Soul singer songwriter\r\n\r\nBorn on 12.10.1942 in Montgomery, Alabama\r\nDied on 23.02.1995. He was suffering from rheumatoid arthritis, and diabetes.\r\n	2017-11-23 19:29:58.408096	2017-11-26 00:49:00.07114	12	Melvin Franklin
579	\N	Born on August 3, 1951 in Louisville (Kentucky), Leo Johnny Graham began playing the guitar professionally at the age of 16.  He played for fun at dances and social events for several years before considering it as a professional job. While at college, Johnny majored in music and developed his compositional skills to benefit his chief goal of writing. In 1973, Johnny Graham joined the legendary group Earth, Wind and Fire where he performed for more than ten years, as the group's lead guitarist. One of Johnny's most memorable solo's can be heard on the infamous smash hit single entitled "Love's Holiday". Throughout his music career he has performed with the notable likes of Lalo Schifrin, Splendor, and The Temptations. In later years he joined Al McKay's L.A. All-Stars with former Earth, Wind & Fire band members Freddie White and Andrew Woolfolk. Presently, Johnny lives in Japan where he has performed with several groups including Soul Sauce. During his leisure time Johnny loves to race cars and boats.	2017-11-23 19:29:35.417947	2017-11-26 00:44:35.075124	12	Johnny Graham
581	\N	Trumpeter and a founding member of Earth, Wind & Fire. He has also arranged and conducted sessions for such as Marvin Gaye, New Birth and Sylvester and played big-band jazz with Cab Calloway, Gerald Wilson and Louis Bellson orchestras. He started his solo career in 1980 with an album "Our Music Is Your Music" on his own Esoteric label and released many other albums too throughout the 80's and 90's.	2017-11-23 19:29:35.426985	2017-11-26 00:44:49.06998	12	Leslie Drayton
582	\N	Known to his friends as "Reese" Maurice White was an American R&B and funk singer (born on December 19, 1941 in Memphis, Tennessee, died on February 3rd, 2016 in Los Angeles). A childhood friend of [a=Booker T. Jones] he was bitten by the music bug early and after finishing high school moved to Chicago where he worked as a session musician, usually playing drums, on many [l=Chess] sessions of the early 60s.\r\n\r\nHe spent the mid to late 60s working with [a=Ramsey Lewis] and then formed [a=Earth, Wind & Fire] in 1969 with local Chicago singers, but relocated the band to Los Angeles in 1970 where they found success. He is the brother of [a=Fred White] and [a=Verdine White].\r\n\r\nSadly, suffered from the illness known as Parkinson´s since the mid 90´s.\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 19:29:35.431479	2017-11-26 00:44:56.067943	12	Maurice White
587	\N	Singer and songwriter, born 8 May 1951 in Denver, Colorado.\r\n\r\nOne of the leaders of Earth, Wind & Fire since 1971. Also active as a solo artist since 1982, recording gospel and R&B as well as pop hits like 1984's "Easy Lover", a duet with [a=Phil Collins].\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\n	2017-11-23 19:29:35.455362	2017-11-26 00:45:31.078137	12	Philip Bailey
629	\N	Born 12 May 1987 is an English guitarist and songwriter. He has played lead guitar with Gorillaz, Damon Albarn and collaborated with Africa Express, Brian Eno, Massive Attack and Nick Zinner.\r\n\r\n	2017-11-23 19:33:02.415642	2017-11-26 00:50:24.073107	5	Jeff Wootton
591	\N	Latin funk - jazz funk - soul guitarist - songwriter\r\nb. May 30, 1951 - d. February 29, 2012\r\nHas recorded as a not consistent full member of [a=Earth, Wind & Fire], in different periods of time.\r\nHas also played as session man for [a=The Crusaders], [a=The Jackson 5], [a=Lamont Dozier], [a=Ramsey Lewis], [a=Randy Crawford], [a=George Duke], [a=Wayne Henderson] and [a=Hubert Laws].\r\n	2017-11-23 19:29:35.470857	2017-11-26 00:45:59.063627	12	Roland Bautista
596	\N	American bassist and songwriter, younger brother of [a=Maurice White].\r\nBorn: 25 July 1951 (Chicago, Illinois, USA)\r\n\r\nInducted into Songwriters Hall of Fame in 2010.\r\n	2017-11-23 19:29:35.491017	2017-11-26 00:46:33.071603	12	Verdine White
600	\N	Soul singer - songwriter - producer - moog expert  - label owner\r\n\r\nBorn on 30.12.1951, Cincinnati, Ohio.\r\nHusband of attorney and writer [a=Margie Jasper]\r\nOwns [l=Gold City].\r\nPiano player who grew up on the same Cincinnati block as The Isley Brothers, and went on to perform and record with them.\r\n	2017-11-23 19:29:47.372715	2017-11-26 00:47:01.081834	12	Chris Jasper
601	\N	American rhythm and blues singer, songwriter and multinstrumentalist player.\r\n\r\nBorn : March 07, 1952 in Cincinnati, Ohio.\r\n\r\nErnie Isley is the guitarist in soul band "The Isley Brothers".	2017-11-23 19:29:47.377662	2017-11-26 00:47:08.081974	12	Ernie Isley
604	\N	American rhythm and blues singer and songwriter. One of the original three members of the Isley Brothers. \r\nBorn December 25, 1937, in Cincinnati, Ohio. \r\nDied March 31, 1986, in Alpine, New Jersey, of a heart attack.\r\nHe was also sometimes credited as “Kelly”, especially during the 1970s.	2017-11-23 19:29:47.39144	2017-11-26 00:47:28.079152	12	O'Kelly Isley
605	\N	American vocalist, lead singer of the Isley Brothers. \r\nBorn May 21, 1941, Cincinnati, Ohio\r\n\r\n	2017-11-23 19:29:47.395752	2017-11-26 00:47:35.08213	12	Ronald Isley
607	\N	American R&B singer, songwriter, keyboardist and occasional actor.\r\n\r\nBorn on 12.10.1951 \r\nDied on 30.05.2010 in Southern California, of leukemia.\r\nHe was known for singing with [a=The Temptations] beginning in 1984 and also worked with [a=Aretha Franklin] and [a=Bill Pinkney]. \r\nHe sang lead on the 1984 [a=The Temptations] single "Treat Her Like a Lady", which was a #2 hit on the U.S. R&B charts. His last [a=The Temptations] album was 1995's "For Lovers Only". \r\nHe was battling leukemia for nearly eighteen months.\r\n	2017-11-23 19:29:58.365447	2017-11-26 00:47:49.079595	12	Ali-Ollie Woodson
608	\N	Soul singer\r\n\r\nBo's professional career began in the eighties, with an R&B group, [a=The Dramatics]. Later Bo joined Lakeside. He was featured on several albums, notably [a=Lakeside]'s greatest hits "Power" and "Party Patrol" which featured a ballad single entitled "Bullseye." On a project with [a=Phil Perry] "One Heart, One Love" Bo's song entitled "I'm Sorry" was featured. In 1998 he joined the [a=Temptations] and debut on the album "Phoenix Rising" which went double platinum and featured him on lead vocals. The follow up album "Ear-Resistible" earned a Grammy and proved to be rewarding. The album "Awesome" garners one of Bo's compositions entitled "My Baby."\r\n	2017-11-23 19:29:58.370625	2017-11-26 00:47:57.07593	12	Barrington Henderson
609	\N	Soul - disco singer\r\n\r\nBorn on July 17, 1950, Baltimore, Maryland.\r\nDied on February 18, 2013, Baltimore, Maryland.\r\nChanged his name into Damon Harris when joining the [a=The Temptations], because the group already had an Otis.	2017-11-23 19:29:58.375064	2017-11-26 00:48:04.068778	12	Damon Harris
610	\N	b. 01/18/1941 in Whynot, Mississippi, U.S.A.\r\nd. 06/01/1991 in Philadelphia, Pennsylvania, U.S.A.\r\n\r\nGruff-voiced soul singer signed to [l=Motown], scored hits as lead singer of [a=The Temptations] and solo, in the 1960s and 1970s.\r\nBrother of fellow Motown singer [a=Jimmy Ruffin].	2017-11-23 19:29:58.379196	2017-11-26 00:48:11.071	12	David Ruffin
611	\N	Soul singer\r\n\r\nBorn on 03.02,1943 in Birmingham, Alabama, U.S.A.\r\nMarried to [a=Ruth Pointer] of the [a=Pointer Sisters]. Father of [a=Issa Pointer].\r\nMost noted for being one of [l=Motown] act [a=The Temptations]' lead singers.\r\nHis biggest hit is his duet with [a=Siedah Garrett], "Don't Look Any Further". He has duetted as well with [a=Thelma Houston] for "Why Do People Fall In Love".\r\n	2017-11-23 19:29:58.382842	2017-11-26 00:48:18.070905	12	Dennis Edwards
619	\N	American singer born 2 July 1939 in Birmingham, Alabama, USA and died by suicide 17 August 1973 in Detroit, Michigan, USA.	2017-11-23 19:29:58.416597	2017-11-26 00:49:14.073277	12	Paul Williams (4)
620	\N	Soul singer, most notable as a member of Motown vocal group The Temptations from 1971 to 1993.\r\n\r\nb. October 5, 1942 in Detroit, Michigan.\r\nd. February 27, 2013 in Las Vegas, Nevada.\r\n\r\nIn 1955, Richard, his cousin along with best friend, [a=Melvin Franklin] (later to become The Temptations' legendary bass singer) was invited to join a vocal group: [a=Otis Williams] and [a=The Distants]. This led to recording with the [a=The Monitors], which were signed to [l=Motown], with which he did many outstanding lead vocals. He also coached a 3-girl group, which consisted of [a=Florence Ballard], [a=Mary Wilson] and [a=Diana Ross]. Under his guidance, he helped the girl group and many other musical groups prepare themselves for recording contracts with [l=Motown] - known as Hitsville, USA. Years later, the world came to know Florence, Mary and Diane as the famous [a=The Supremes]. This valuable experience formed the foundation of his vocal coaching, and skilled choreography. He is also knowledgeable of the music industry from the inside, and he held a most coveted position in [l=Motown]'s Quality Control Department, which was responsible for which talent was being considered for the company, and which recordings were selected for record release, and radio air play, this was just a few of his responsibilities in the department.	2017-11-23 19:29:58.41984	2017-11-26 00:49:21.077123	12	Richard Street
624	\N	Born July 29, 1977, better known by his stage name Danger Mouse, is an American musician, songwriter and producer.	2017-11-23 19:33:02.39622	2017-11-26 00:49:48.072916	5	Brian Burton
626	\N	British vocalist and musician born 23 March 1968 in Whitechapel, London.  The family moved to Leytonstone, London not long after he was born and then to Colchester, Essex.\r\n\r\nBest known as a founding member and vocalist in British rock band [a=Blur] in the mid-1990s. \r\n\r\nLater formed [a=Gorillaz] in 1998 as a side-project with old housemate [a=Jamie Hewlett], and would provide the singing vocals for fictitious lead singer [a470634].  Damon also used this alias outside of Gorillaz on a handful of occasions (see credits).   \r\n\r\nIncredibly prolific, respected and busy musician releasing and collaborating with artists from all over the world since 2000. \r\n\r\nWas once engaged to [a=Justine Frischmann], Blur's album "[url=http://www.discogs.com/Blur-13/master/34446]13[/url]" is supposedly written about their breakup. \r\n\r\nOnce acted in a British gangster film called "Face", alongside actors [a=Ray Winstone] and Robert Carlyle, also voiced [a=George Harrison]'s character "Bull" in a radio play "Up Against It" by Joe Orton. 	2017-11-23 19:33:02.404406	2017-11-26 00:50:03.078729	5	Damon Albarn
628	\N	British comic book artist, illustrator, designer and writer, born 3 April 1968 in Horsham, Sussex, England, UK. He is married to [a=Emma De Caunes].\r\n\r\nHe is known for being the co-creator of the comic Tank Girl in [l=Deadline Magazine] and co-creator of the virtual band [a=Gorillaz] when he lived with [a=Damon Albarn] after his break-up with [a=Justine Frischmann].  He also did the animation stings in the UK for the coverage of the Beijing olympics on the BBC.	2017-11-23 19:33:02.413069	2017-11-26 00:50:17.073779	5	Jamie Hewlett
630	\N	Mick Jones was born on June 26, 1955.\r\nHe was a member of The Clash (Lead Guitar, Vocals) and wrote the music for their songs.\r\nLater he was the lead singer of Big Audio Dynamite & Big Audio Dynamite II.\r\nMick also produced most of the Libertines-releases.\r\n\r\nHe shouldn't be confused with [a=Mick Jones (2)] from Foreigner.\r\n	2017-11-23 19:33:02.418169	2017-11-26 00:50:31.069686	5	Mick Jones
631	\N	Miho Hatori is a singer/musician/artist/an experimental multi-genre music producer, DJ, primarily known as the vocalist of the legendary NYC group Cibo Matto. New Optimism is her other project. She has contributed on the first Gorillaz album, as well as songs with the Beastie Boys.  Miho is originally from Tokyo, but has been working and living NYC for too many years. \r\n	2017-11-23 19:33:02.420738	2017-11-26 00:50:38.086685	5	Miho Hatori
632	\N	British saxophonist, keyboardist, composer, arranger and conductor. \r\nGraduated from the Leeds College of Music in 1988. He has worked with artists such as [a7551], [a6378], [a8029], [a1396], [a754757] and [a298810]. Smith has also scored several TV productions, done session work as an arranger and conductor, and is currently a member of [a1692059].\r\n\r\n[b][i]Not to be confused with US American saxophonist [a383872] who is also usually credited as “Mike Smith”.[/i][/b]	2017-11-23 19:33:02.423085	2017-11-26 00:50:45.076591	5	Mike Smith (3)
637	\N	Son of [a=Remi Kabaka].\r\nLondon-based Remi Kabaka Jr. provided the voice of [a=Russel Hobbs] in the virtual band [a=Gorillaz] and is a producer in the [a=Damon Albarn]-led [a=DRC Music] and [a=Africa Express] collective and plays percussion in [a=Bobby Womack]'s Bravest Band, also, he's the founder of the GSS (Gorillaz Sound System) DJ project.	2017-11-23 19:33:02.439385	2017-11-26 00:51:20.081602	5	Remi Kabaka Jr.
643	\N	Soul-singer and lead-vocalist for various backing choirs for high profile artists including [a=Billy Ocean], [a=Blur] and [a=Gorillaz].	2017-11-23 19:33:02.456374	2017-11-26 00:52:02.067907	5	Wayne Hernandez
644	\N	British musician, songwriter and producer.\r\nb. January 4, 1956.\r\nSumner was his mother's maiden name and is the surname on his birth cert, he was adopted by his step father John Dickin.\r\n	2017-11-23 19:33:14.364925	2017-11-26 00:52:09.083383	5	Bernard Sumner
646	\N	Born: February 13, 1956, Salford, Greater Manchester, England\r\n\r\nBassist for [a=Joy Division] and [a=New Order].\r\n	2017-11-23 19:33:14.37291	2017-11-26 00:52:23.081872	5	Peter Hook
647	\N	British guitarist, born 7 December 1974 in Macclesfield, Cheshire, England.\r\n[b]Not to be confused with[/b] the Scottish musician & producer [a=Phil Cunningham (2)].	2017-11-23 19:33:14.376246	2017-11-26 00:52:30.074719	5	Phil Cunningham
649	\N	Franco-English musician, bassist, producer and songwriter, born 15 May 1972 in Chevreuse, France.	2017-11-23 19:33:14.381126	2017-11-26 00:52:44.078367	5	Tom Chapman (2)
663	\N	Born September 10th, 1944 in Athens, Ohio, USA\r\nAmerican drummer\r\n\r\nArt Tripp grew up in Pittsburgh before becoming a percussionist for the [a=Cincinnati Symphony Orchestra] in 1962. He played and recorded with [a=Frank Zappa] and [a286086] from 1968 until the end of 1969, before joining [a816783] for four years. On the [a=Captain Beefheart] album "Spotlight Kid" he appeared on the credits under both aliases of [a=Ed Marimba] & [a=Ted Cactus]. He was once also a member of the group [a=Mallard]. Art Tripp eventually gave up music and became a chiropractor. 	2017-11-23 19:40:46.402588	2017-11-26 00:54:22.085187	18	Art Tripp
666	\N	born: 1 May 1927 in Los Angeles, California (USA)\r\ndied: 1 May 1996 in Malibu, California (USA)\r\n\r\nAmerican jazz trombonist and arranger who worked in the  bands of Georgie Auld, Buddy Rich, Benny Goodman, Charlie Ventura and Teddy Powell, among others. He toured Europe and Japan alongside Frank Sinatra in 1974. Byers had extensive credits arranging and conducting for film, and won the Drama Desk Award for Outstanding Orchestrations for "City of Angels."\r\n	2017-11-23 19:40:46.411189	2017-11-26 00:54:43.080199	18	Billy Byers
668	\N	Musician (keyboards, trumpet, vocals) who worked for [a=Frank Zappa] from September to December 1980. Married with [a=Thana Harris].\r\n\r\nDon't confuse him with [a=Bob Harris (5)] who played keyboards with [a=Frank Zappa] from May until August 1971.\r\n(And who was married to & played with [a=Judee Sill] who wrote a track "Lady-O" for [a=Turtles])\r\n	2017-11-23 19:40:46.416729	2017-11-26 00:54:57.06415	18	Bob Harris (5)
650	\N	Dancer and occasional singer in The Prodigy.\r\n\r\nIn the late 1980s Flint met DJ Liam Howlett in a rave club and expressed his appreciation of Howlett's taste in music. After receiving a mixtape from Howlett, Flint came back with great enthusiasm, insisting that Howlett should be playing his tracks up on stage, and that Flint, along with friend Leeroy Thornhill, would dance to them.\r\nOriginally Flint was the band's dancer, but in 1996 he featured as the vocalist on the hit single "Firestarter". The accompanying video showcased Flint's new punk look. This trend continued with the next Prodigy single "Breathe", on which Flint performed the backing vocals, whilst Maxim performed lead. The 1997 album The Fat of the Land featured Flint's vocal contributions to several tracks, namely "Breathe", "Serial Thrilla", "Fuel My Fire" and "Firestarter". In 2002 the single "Baby's Got a Temper" was released. On the next Prodigy album, Always Outnumbered, Never Outgunned (2004), Flint did not perform any vocals, although he did appear on the "Hotride – El Batori Mix," on the "Hotride" single. The latest Prodigy album, Invaders Must Die, was released on 23 February 2009 and features vocals by Flint on multiple tracks, including; Take Me to the Hospital, Run with the Wolves and Colours. Flint released a single titled "War" with dubstep artist Caspa in 2012.\r\n\r\nFlint is a keen motorcyclist. He rode the 1500 miles from Britain to Southern Spain to attend the 2007 Spanish motorcycle Grand Prix, and also races in club competitions. He now has his own motorcycle team, 'Team Traction Control' which he races in the 2011 Hottrax Endurance events. Flint is also a supporter of London football team West Ham United.	2017-11-23 19:33:25.377835	2017-11-26 00:52:51.06742	5	Keith Flint
652	\N	DJ, producer, former dancer of the The Prodigy.\r\n\r\nBorn 8 October 1968, Barking, Greater London. British electronic music artist and formerly a rave dancer and live keyboardist of the British rave act The Prodigy. He has produced solo work under the names Longman and Flightcrank. He was born in Barking but raised in Rayne near Braintree in Essex, and grew up as a football and James Brown fan. Thornhill joined The Prodigy along with Keith Flint after they met Liam Howlett at a local rave club. Both were dancers for the band's live show.\r\n\r\nIn 2000 Thornhill left the band and went on to make various EPs under the guises of Longman and Flightcrank, however these projects never saw any substantial success. He now DJs at large venues and is still in touch with The Prodigy. During The Prodigy's 'Their Law' tour Thornhill was the DJ support act at several venues. He also works as a regular DJ. He also remixed tracks for other artists, such as the Italian Subsonica's Nuvole Rapide.\r\n\r\nThornhill is currently working with Hyper and appears on their live shows. He appeared at the V Festival in 2007 in Chelmsford, Essex.\r\n\r\nHis latest project is the creation of Nu skool breaks record label Electric Tastebuds.[1] He has recently signed breakbeat act The Wrongstar Society to the label.\r\n\r\nIn October 2008, a music video was created for "Everything U Need", a track by Thornhill's Smash Hi-Fi project. The video was Directed by Philip Carrer and Bleeding Apple.	2017-11-23 19:33:25.386167	2017-11-26 00:53:05.079948	5	Leeroy Thornhill
653	\N	Composer, producer, leader of the band The Prodigy.\r\n\r\nBorn August 21, 1971 in Braintree, Essex. He was first influenced by hip hop music and culture when he began to attend school at Alec Hunter Humanities College in Braintree. He learned breakdancing alongside his crew called The Pure City Breakers, and DJed in his first band Cut 2 Kill. After a fight at a gig of the band, Liam left Cut 2 Kill and started to write his own music.\r\nHe became connected to rave music and he reportedly went to his first rave in 1989.\r\n\r\nOn weekends, he went to all the raves and when the clubs closed down in the early morning those ravers went on to party on the beach while Liam played a compilation of the latest rave tracks out of a van. One day, Keith Flint approached him and asked whether Liam could do some mixes for him. When Liam had done the mixes he would pass it to Keith. One night, when Keith and Leeroy Thornhill were returning from a rave, they flipped Liam’s tape onto side B (which was titled "the prodigy" in reference to the Moog synthesizer used) to find some of Liam's own tracks on it and got completely hooked. They decided to approach Liam and ask him if he wanted to play on stage with Keith and Leeroy dancing at the front of the stage. Liam agreed, and The Prodigy was born.\r\n\r\nIn 1998, Liam was offered the chance to do a mix for Mary Anne Hobbs' radio show. He dug out some of his old favourite tracks again and this prompted him to release an edited (due to some copyright issues) version of the mix in February, 1999. It was the first material which was recorded in his new home studio "The Dirtchamber", so accordingly the album was to be called Prodigy presents Dirtchamber Sessions Volume 1.\r\n\r\nIn the end of January 2006, a compilation album titled Back to Mine: Liam Prodigy was released. It was a collection of Howlett's favourite tunes, including an exclusive Prodigy track called "Wake the Fuck Up", which is often performed as an intro in The Prodigy's live concerts.\r\n\r\nHowlett was a co-producer on the track "Immunize" from Australian drum and bass act Pendulum's third album Immersion, which was released in 2010.\r\n\r\nHusband of [a389490].\r\n	2017-11-23 19:33:25.390081	2017-11-26 00:53:12.081909	5	Liam Howlett
654	\N	Born: 4 October 1959 in Blackpool, Lancashire, UK. \r\n\r\n'The other one' in the Pet Shop Boys. Largely responsible for the production aspect of the duo. \r\nIf you are making an addition where he is credited together with Neil Tennant please credit as [a730719].\n	2017-11-23 19:33:37.374137	2017-11-26 00:53:19.084451	5	Chris Lowe
655	\N	Born: 10 July 1954 in Brunton Park, North Shields (near Newcastle-upon-Tyne), Northumberland, UK. \r\n\r\nFrontman for the pop duo Pet Shop Boys. Largely responsible therefore for the vocals on most tracks for the duo.\r\nIf you are making an addition where he is credited together with Chris Lowe please credit as [a730719].\r\n	2017-11-23 19:33:37.379079	2017-11-26 00:53:26.07817	5	Neil Tennant
659	\N	Alex Dmochowski is an American bass player, as [a=Erroneous] he appears on [a=Frank Zappa] productions.	2017-11-23 19:40:46.392258	2017-11-26 00:53:54.077021	18	Alex Dmochowski
660	\N	Alice Stuart blazed the trail for women in Rock and Roll as one of the only females in the country to write her own music, front a male band, and play lead guitar on national and international circuits during the 1970s.\r\nAlready in 1964 she recorded her first album "All The Good Times" with popular folk songs for Arhoolie Records. \r\nIn the early seventies she recorded two albums for Fantasy Records "Full Time Woman (1970) and "Believing" (1972), the latter as Alice Stuart & Snake.\r\nAfter a long hiatus devoted to raising her family, Alice resumed her recording career in 1996.\r\n	2017-11-23 19:40:46.394721	2017-11-26 00:54:01.07335	18	Alice Stuart
661	\N	Dec 7, 1948 - Jan 31, 2012\r\n\r\nAndre Lewis began his musical career in the 70's. He formed a band with [a=Lester Abrams] before embarking on many collaborations with important figures of Rock & Roll such as [a=Buddy Miles], [a=Frank Zappa] (he played keyboards for The Mothers Of Invention after [a=George Duke] left), [a=Grant Green], [a=Who], [a=LaBelle], [a=Johnny Guitar Watson], [a=Rufus], [a=White Chocolate (2)], and [a=Earth, Wind & Fire].\r\nHe founded the group [a=Maxayn] (named after his then wife [a=Maxayn Lewis]) in 1972. When the experience ended, he created [a=Mandré], while producing other artists for [l=Motown] Records.\r\nAs a tester of Roland products, he was one of the first musicians to record with the infamous Roland TR-808. He was a pioneer in the use of synthesizers on records and worked with the now famous Roger Linn on developing the first digital drum machines.\r\nIn 1988, Lewis decided to base himself in Germany with wife [a=Maxayn Lewis]. He had a daughter, Riva, and began to be involved in the European musical scene.\r\nAfter a divorce, he returned to United States and devoted himself to gospel music, which he plays every sunday at the local church. \r\n	2017-11-23 19:40:46.397279	2017-11-26 00:54:08.073755	18	Andre Lewis
671	\N	American trombone player, composer and arranger, born July 10, 1947 in Salt Lake City, Utah. He notably played trombone on many Frank Zappa records. In 2007 he received the Film & TV Music Awards for Best Score Conductor and Best Orchestrator.\r\n\r\nHe is the son of jazz educator, musician and composer [a=William Fowler (3)]  and [a=Beatrice Fowler] , brother of multi-instrumentalist [a=Walt Fowler] , saxophonist [a=Steve Fowler] , and bassists [a=Tom Fowler]  and [a=Ed Fowler] . 	2017-11-23 19:40:46.42495	2017-11-26 00:55:18.076412	18	Bruce Fowler (3)
673	\N	US Jazz, jazz fusion and rock drummer (born March 25, 1960 in Long Beach, California). Best known for his work as a drummer and percussionist in [a=Frank Zappa]'s band from 1981 to 1988. However, he has worked as a band member, session musician, sideman, and bandleader of his own jazz trio. He has also recorded albums and toured with artists such as [a254012], [a221183], [a95878], [a283804], [a257414], [a285083], [a237886] and [a875404].	2017-11-23 19:40:46.431159	2017-11-26 00:55:32.084455	18	Chad Wackerman
674	\N	[b]Drummer and percussionist[/b] born in Baltimore (MD, USA). \r\n[b]For the Tower of Power keyboard player, please use [a=Chester Thompson (2)].[/b]\r\n\r\nThompson has toured and recorded since the 1970s with a number of different artists including [a=Weather Report], [a=Frank Zappa], [a=The Mothers], [a=Genesis], [a=Phil Collins] and [a=Ron Kenoly] among many others. While still busy recording and performing, he also gives drum lessons at Belmont University (Nashville, TN, USA), along with doing clinics and directing a jazz ensemble. He has lived in Los Angeles (CA, USA) and London (UK), but now is living in Nashville (TN, USA).	2017-11-23 19:40:46.434457	2017-11-26 00:55:39.071914	18	Chester Thompson
676	\N	Slide guitarist, born in Pennsylvania in the 1940es.\r\nIn the mid 1950's his family moved to Lancaster where he befriended his neighbour [a=Frank Zappa].\r\nHe became the guitarist with [a=The Mothers] on the 1975 Bongo Fury tour. There he met [a=Captain Beefheart] who asked him to join [a=Magic Band] for the European and US tour of 1975. He stayed until 1977.\r\nHe worked with [a=Frank Zappa] again in the fall of 1978.\r\n	2017-11-23 19:40:46.44059	2017-11-26 00:55:53.071562	18	Denny Walley
677	\N	Born: 19th June 1938, Pasadena, California, USA.\r\nDied: 30th November 1999, Los Angeles, California, USA.\r\n\r\nAmerican musician and jazz blues-fusion violinist. Noted for his work with Johnny Otis, Frank Zappa and in The Mothers and John Mayall (U.S.A. Union).\r\n\r\nHarris died after a lengthy battle with pulmonary disease.\r\n	2017-11-23 19:40:46.443752	2017-11-26 00:56:00.088645	18	Don "Sugarcane" Harris
794	\N	Alan Charles Wilder was born on June 1st 1959 in Hammersmith, West London, England. An electronic musician, composer, arranger and record producer. Alan is best known as a former member of [a=Depeche Mode]. He is also the founder of an electronic music project named [a=Recoil]. [a=Recoil] started as a side project to [a=Depeche Mode], but when he left the latter in 1995, it evolved into Wilder's primary project. Wilder has also provided production and remixing services to the bands [a=Nitzer Ebb], and [a=Curve]. \r\n\r\nOn June 1st 1995, Alan made the difficult but inevitable decision to leave [a=Depeche Mode] and announced his departure.	2017-11-23 19:44:11.414537	2017-11-26 01:09:39.075235	20	Alan Wilder
796	\N	Born: May 9, 1962, Epping, England	2017-11-23 19:44:11.423623	2017-11-26 01:09:53.086026	20	Dave Gahan
679	\N	Born: 15th January 1941, Glendale, California, USA.\r\nFirst recorded appearance: "A Low Forceps Delivery", featuring Don Glen Vliet, at Glendale Research Hospital 16:25 hours on 15/01/41.\r\n\r\nDied: 17th December 2010, of complications from multiple sclerosis.\r\n\r\nDon Van Vliet, aka [a=Captain Beefheart], vocalist, harp-player, saxophonist, flautist, songwriter, lyricist, poet & painter. Frontman of The Magic Band and artist with a dozen official albums and more besides. An often perverse career path, interwoven with Frank Zappa, followed by 'retirement' in 1982 when he went to live in seclusion with his wife [url=http://www.discogs.com/artist/Jan+Van+Vliet]Jan[/url] and paint full-time. He subsequently released some poetic works, which accompanied his art portfolios & exhibitions.\r\n\r\nHis career in music & art featured in the BBC documentary "The Artist Formerly Known As Captain Beefheart", with narration by [a64672] & vignettes by [a513410], [a55080], [a530617], [a196010] & other past members of [url=http://www.discogs.com/artist/Magic+Band%2C+The]The Magic Band[/url] \r\n\r\n(In late April 1966 Vliet enrolled for 3 months with the American Federation Of Television And Radio Artists, using the pen-name of Don Van Vliet with a hand-scrawled caveat of "Captain Beefheart" added to the document - see images).\r\nVliet's compositions & tracks have also featured in the following films: "Abba Zaba" in [i]Something In The Air[/i] (2012); "Clear Spot" in [i]How To Be[/i] (2008) and [i]Things We Lost In The Fire[/i] (2007); "Her Eyes Are A Blue Million Miles" in [i]The Big Lebowski[/i] (1998) and vocals on Nitzsche's "Hard Workin' Man" in [i]A Civil Action[/i] (1998) and [i]Blue Collar[/i] (1978); "Electricity" in [i]Entourage[/i] (TV show, Season 5).\r\n	2017-11-23 19:40:46.449895	2017-11-26 00:56:14.083427	18	Don Van Vliet
681	\N	American percussionist, composer, sound designer and educator. \r\nHis relation with [a=Frank Zappa]  started when he recorded some percussion in the studio for his record "Zappa in New York" in 1977. After that he collaborated on further albums and tours. After Zappa's death he continued with other Zappa members in the band "Band From Utopia", solo releases and "Repercussion Unit".\r\n	2017-11-23 19:40:46.45559	2017-11-26 00:56:28.072767	18	Ed Mann
682	\N	Elliot Ingber played lead guitar with The Mothers around 1965 - 1966, but left shortly thereafter to form the Fraternity Of Man with Richie Hayward and Martin Kibbee. In the mid-seventies, Elliot Ingber played for a while with Captain Beefheart.\r\nBefore the Mothers, Elliot Ingber had played with the Moondogs and with the Gamblers.\r\n	2017-11-23 19:40:46.458452	2017-11-26 00:56:36.072868	18	Elliot Ingber
684	\N	American saxophonist and composer,  born 23 October 1945 in Norfolk, Virginia, USA.\r\n	2017-11-23 19:40:46.466642	2017-11-26 00:56:50.082332	18	Ernie Watts
686	\N	Sax Player, Flautist\r\n\r\nFred Jackson was born in 1929, a Flautist and saxophonist, he only released one album and played on a handful of sessions for Blue Note before disappearing from the jazz scene in the mid-'60s. He deserved a better fate. Although he wasn't a wildly original tenor saxophonist, he was a solid journeyman who found a successful common ground between hard bop and earthy soul-jazz on his jazz sessions. His R&B-inflected style worked well on uptempo ravers and slow blues alike, and he had a nice, robust tone. Despite his attributes, he quietly faded away from jazz in the mid-'60s, after his lone album Hootin' 'N Tootin' failed to sell.\r\n\r\nToward the end of the '50s, he gained his experience playing with such popular artists as Paul Williams, Lil’ Green, Paul Gayton, Chuck Willis and also Lionel Hampton. He later was invited to join the supporting band for R&B vocalist Lloyd Price and frequently toured with Price.\r\n\r\nJackson made his recording debut in 1961, playing on a B.B. King session. Shortly afterward, he cut his first jazz record, appearing in organist Baby Face Willette's band on the album Face to Face. Impressed by his performance on the record, Blue Note offered the saxophonist a chance to lead his own session and he accepted. Along with his bandmates -- guitarist Willie Jones, organist Earl Vandyke and drummer Wilbert Hogan -- into the studio on February 2, 1965 to record the album that became Hootin' 'N Tootin'. Two months later, he went back to Van Gelder Studios with his supporting trio and bassist Sam Jones to record his second album. That session was never released, either because Hootin' 'N Tootin' sold poorly or because, as Alfred Lion's notes claimed, that the record was too short for release. The sessions finally appeared in 1998, when they were added as bonus tracks to the CD reissue of Hootin' 'N Tootin'.\r\n	2017-11-23 19:40:46.474612	2017-11-26 00:57:05.063831	18	Fred Jackson
687	\N	Soul - jazz - disco - producer - keyboards player - composer.\r\n\r\nBorn on 12.01.1946 in San Rafael, CA, U.S.A. Died on 5th of August, 2013.\r\nCousin of [a=Dianne Reeves]\r\nHe has a long, extensive solo discography as well as collaborations with [a=Jean-Luc Ponty], [a=Frank Zappa], [a=Stanley Clarke], [a=Billy Cobham], [a=Cannonball Adderley], [a=Deniece Williams], [a=Jeffrey Osborne], [a=George Clinton], [a=Anita Baker], [a=Regina Belle], [a=Rachelle Ferrell], [a=Marilyn Scott] etc.\r\n \r\n	2017-11-23 19:40:46.478519	2017-11-26 00:57:12.088295	18	George Duke
690	\N	American woodwind and keyboards player, born May 22, 1939, New York City.\r\n\r\nFamous for playing with [a=The Mothers] and then with [a=Frank Zappa].\r\nHusband of [a=Ruth Underwood].\r\nAfter his career with Frank Zappa, he pursued a career as a session keyboardist, working for [a=Quincy Jones], [a=Barbra Streisand], [a=Barry Manilow] among others.\r\n	2017-11-23 19:40:46.490958	2017-11-26 00:57:33.08315	18	Ian Underwood
691	\N	Singer and guitarist who was a regular sideman for [a=Frank Zappa], first joining Zappa's band for the 1978 tour. He didn't tour with Zappa in 1981 and 1982, but returned for Zappa's final two tours in 1984 and 1988.\r\nAmong others, he is featured in Joe's Garage, Tinsel Town Rebellion, You Are What You Is and is the title character and narrator in Zappa's off-Broadway-styled conceptual musical Thing-Fish.\r\n	2017-11-23 19:40:46.494942	2017-11-26 00:57:40.084278	18	Ike Willis
693	\N	Janet Ferguson was part of the 2401 Laurel Canyon Boulevard 'Log Cabin Commune' scene in the mid 1960's and later, when Zappa took residency of The Cabin on returning from New York in 1968. The photo [taken Oct 1969 outside the Log Cabin] shows her on the left, with 'groupie' Lucy Offerall of the [a802828], aka Miss Lucy [see "Permanent Damage" album].\r\n\r\nBorn Janet Neville-Ferguson, she married [a601033], who was a 'roadie' and technician on Zappa albums such as "200 Motels", "Over-Nite Sensation" & "[r866004]". Ferguson also features on the latter album, providing vocals. \r\n(Offerall & Ferguson feature in the Zappa film "200 Motels", on which Paul Hof was a technician. Paul Hof's head is one of the 2-headed 'roadie' on the cover of "Over-Nite Sensation", the other head is that of [a1264808], brother of Zappa's wife Gail).\r\nJanet Ferguson also provided vocals on "Burnt Weeny Sandwich" & "Waka/Jawaka" by Zappa and has also been referred to within album credits/write-ups as Janet "Gabby Furggy" Ferguson. An oblique reference is also made to her in the star 'Henna Brillo' in the 'Universe' illustration by Cal Schenkel on the cover of "One Size Fits All".\r\n\r\nShe has also provided vocals on solo albums by [a12803].\n	2017-11-23 19:40:46.502626	2017-11-26 00:57:54.084399	18	Janet Ferguson
797	\N	English songwriter, lyricist, singer, guitarist and keyboardist.\r\nBorn: July 23, 1961 in Dagenham, Essex/East London (England).\r\nFather of [a=Viva Gore]	2017-11-23 19:44:11.428232	2017-11-26 01:10:00.109294	20	Martin L. Gore
800	\N	German drummer, actor and performance artist.\r\n\r\nHe was born 2 February 1939 in Berlin, Germany and died 31 December 2009 in Düsseldorf, Germany.\n	2017-11-23 19:44:22.374513	2017-11-26 01:10:21.066217	20	Charly Weiss
696	\N	Born: 4th October 1947, Denton, Texas, USA.\r\n\r\nAmerican bassist, most known for his work in [a168907]. His early career began in "The Bohemians" with [a71872], with whom he played on Buckley's solo album.\r\n\r\nFielder worked for a period in "Mastin & Brewer" (Later to become [a262456]), before working in Zappa's "MOI" band on rhythm guitar alongside bassist Roy Estrada for the "Absolutely Free" album. "Mastin & Brewer" ex manager, [a289130], then managed [a58696] so, when bassist [a420696] left due to passport problems, Fielder was called in by Mowhawk. (Another Zappa connection is Mohawk, aka [a774575], married ex Zappa musician [a893328] - aka Essra Mohawk - aka 'Uncle Meat')\r\n\r\nPalmer later returned to the band and Fielder then became a member of Blood, Sweat & Tears, thanks to an earlier friendship struck with [a255185] during the latter's time in [a252489]. Fielder played on six of the band's albums and cites their appearance at Woodstock as one of the highlights of his career. In 1977 he joined the line-up of [a123159]'s band.\n	2017-11-23 19:40:46.514372	2017-11-26 00:58:15.080493	18	Jim Fielder
697	\N	American bass guitarist and singer for several 1960s rock bands, born March 14, 1943, Santa Monica, California.\r\nIn 1973 Pons left the music industry to become the film and video director for the New York Jets football club until his retirement in 2000.\r\nHe now lives in Jacksonville, Florida, where he does game day video for the Jacksonville Jaguars, and plays upright bass in a bluegrass gospel band called Deep Creek.\n	2017-11-23 19:40:46.518559	2017-11-26 00:58:22.0882	18	Jim Pons
701	\N	American drummer & percussionist.\r\n\r\nBorn October 31, 1939 - Hawaii,\r\ndied January 5, 2004 - West Hills, California.\r\n\r\nA prominent and prolific session drummer, John Guerin co-founded the group, LA Express, in 1973. During his long career, he played with numerous artists, including the Byrds, Quincy Jones, Joni Mitchell (Court and Spark), and Frank Zappa (Hot Rats).\r\n	2017-11-23 19:40:46.535523	2017-11-26 00:58:50.151823	18	John Guerin
703	\N	Trombonist who worked with Bill Perkins, Larry Bunker, Mel Lewis, Jack Nimitz, Al Porcino, Stan Kenton Frank Rosolino, Joe Mondragon, Bud Shank, Bill Holman, Ray Triscari, Conte Candoli, Alvin Stoller, Buddy Childers, Lew McCreary, Gene Cipriano, Israel Baker, Andy Martin, Lennie Niehaus and Lee Katzman. among others.	2017-11-23 19:40:46.546032	2017-11-26 00:59:04.081442	18	Kenny Shroyer
705	\N	Born: 13th April 1945\r\nDied: 29th June 1979.\r\n\r\nAmerican guitarist & singer. Founder of Little Feat, featured with the GTO's and a member of Frank Zappa's early line-ups.\r\n\r\nPerformed in 'The Factory', an early band that released "Lightning-Rod Man" album, produced by Zappa. \r\n	2017-11-23 19:40:46.555247	2017-11-26 00:59:18.073266	18	Lowell George
707	\N	American vocalist, member of The Turtles and the 'Flo' (or 'The Phlorescent Leech') of vocal parody & harmony duo [a296019], who performed solo and with Frank Zappa bands.	2017-11-23 19:40:46.564706	2017-11-26 00:59:32.088963	18	Mark Volman
708	\N	American winds player: flute, bass flute, clarinet, piccolo, saxophone and trumpet.	2017-11-23 19:40:46.570056	2017-11-26 00:59:39.077623	18	Mike Altschul
709	\N	[b]Born:[/b] 28 September 1967, New York City, N.Y., USA\r\n\r\nWriter, songwriter, vocalist and actress. First-born child of Gail and [a=Frank Zappa] and married to musician [a=Paul Doucette] in June 2002. The couple have a daughter, [url=http://www.discogs.com/artist/3782788-Mathilda-Plum-Doucette-Zappa]Mathilda Plum Doucette[/url], born 21 December 2004 (the same day as Frank Zappa's birth) .\r\n\r\nAuthor of the book [i]America, The Beautiful[/i] (ISBN 0-7432-1383-1).\r\nNovember 29, 2012 he received the honorary citizenship by the Mayor of Partinico, Palermo, Italy\r\n\r\n	2017-11-23 19:40:46.574771	2017-11-26 00:59:46.071875	18	Moon Zappa
710	\N	Born: 8th May 1942, Arkansas City, Kansas, USA.\r\n\r\nAmerican saxophonist & vocalist, mostly associated with the bands of Frank Zappa.\r\n\r\nSherwood gained his nickname 'Motorhead' as a teenager in gigging bands on the 'car club' circuit, tinkering with cars and custom-painting them. He met [a92623] in 1956 through high-school, where he attended with Bobby Zappa in Antelope Valley, California.\r\n\r\nHe became a member of The Blackouts and was later part of the retinue around 'Studio Z' which had gathered as a result of [a573052]'s PAL work. Sherwood subsequently became a roadie for Zappa bands and was blessed with the pseudonym 'Larry Fanoga' on the [m35641] album, on which he was part of the chorus in The Abnuceals Emuukha Electric Orchestra.\r\n\r\nSherwood performed in early Zappa line-ups and on various FZ albums, including "Civilization Phaze III" - a revisit to the themes found in "Lumpy Gravy". He was also a member of [a1336323] and then worked on projects with [a214846] and [a1312260]. He was also a member of [a1663374].\n	2017-11-23 19:40:46.579109	2017-11-26 00:59:53.089612	18	Motorhead Sherwood
727	\N	Born 1953, is an American jazz drummer who has performed as part of the Pat Metheny Group and Mahavishnu Orchestra along with numerous other jazz ensembles. Has also worked with Sting, David Byrne, Herbie Hancock and Chick Corea to name a few and has appeared on over 300 CDs. \r\nCurrently works as assistant professor of jazz studies at the University of North Florida for several weeks each year.\r\nSometimes credited as Dan Gottlieb & Daniel R Gottlieb.\r\n	2017-11-23 19:40:58.376908	2017-11-26 01:01:53.07566	18	Danny Gottlieb
791	\N	Roy Phillips (born 5 May 1943) is a British musician. He was a member of The Soundtracks (a backing group of The Dowlands), The Saints, The Peddlers and various other bands. He now lives in New Zealand.	2017-11-23 19:41:32.424644	2017-11-26 01:09:19.069813	18	Roy Phillips
712	\N	Norma Jean Bell is the name and driving force behind the mysterious and sought after Detroit based Pandamonium label. A long term player on the US house scene, Norma has built a reputation throughout the music industry as a Detroit legend and is ranked firmly alongside revered producers such as Carl Craig, Mike Banks, Moodymann, Theo Parrish et al. Having worked very closely with long time friend Kenny Dixon Jnr, Norma is one of a number of women finally bursting out of the 'house diva' box and coming into their own as respected producers. A saxophonist, singer and producer, Norma Jean Bell was once a member of Frank Zappa's touring band, but in the '90s reincarnated herself in the dance world. Bell's breakthrough solo LP 'Come Into My Room' was released in 2001 garnering kudos for its simmering house and Bell's own fluent saxophone work. She also showed the breadth of her experience, with nods to jazz legend John Coltrane, funk, disco and pop.	2017-11-23 19:40:46.588	2017-11-26 01:00:07.073218	18	Norma Jean Bell
713	\N	American vocalist and songwriter, born 7 March 1946 in The Bronx, New York, USA. He was married to [a=Faye Dunaway] from 1974 to 1979,\r\n\r\nFor keyboard credits (esp. with Frank Zappa/Mothers Of Invention), soft rock production, arrangement and orchestral work, please consider [a660953] before adding here.\r\n	2017-11-23 19:40:46.59359	2017-11-26 01:00:15.084545	18	Peter Wolf (3)
715	\N	Ray Collins (November 19, 1936 - December 24, 2012) was an American musician.\r\n\r\nCollins grew up in Pomona, California singing in his school choir, the son of a local police officer. He quit high school to get married.\r\n\r\nHe started his musical career singing falsetto backup vocals for various 'doo-wop' groups in the Los Angeles area in the late 1950s and early 1960s, including Little Julian Herrera and the Tigers. In 1964, Collins, drummer Jimmy Carl Black bassist Roy Estrada saxophonist Dave Coronado and guitarist Ray Hunt formed The Soul Giants. Upon Hunt's departure, he was replaced by Frank Zappa on guitar. Under Zappa's leadership, the Soul Giants turned into the Mothers of Invention. Ray was the lead vocalist on the Mothers early albums, including Freak Out!, Absolutely Free and Cruising with Ruben & the Jets. He contributed to other Zappa projects through the mid-1970s.\r\n\r\nCollins resided in Claremont, California, until his death on December 24, 2012. He was 76 years old.	2017-11-23 19:40:46.601955	2017-11-26 01:00:29.079754	18	Ray Collins
717	\N	American electric bassist, born 17th April 1943, Santa Ana, California, USA. He started his career in the Los Angeles circuit in the 1960s, member of 'Roy Estrada & The Rocketeers' and 'The Viscounts' which later changed name to 'The Soul Giants'. He left the band in 1969 to form [a=Little Feat] with [a=Lowell George]. \r\n\r\nIn the early 1970s, he joined [a=Captain Beefheart And His Magic Band], toured with [a=Frank Zappa] on the "Zoot Allures" tour in 1976 and worked on a number of his works. In 2002 he joined 'The Grandmothers' tribute band, with [a=Don Preston] and [a=Napoleon M. Brock].\r\n\r\n	2017-11-23 19:40:46.608793	2017-11-26 01:00:42.075529	18	Roy Estrada
718	\N	Ruben Ladron de Guevara, a.k.a. Rubén Funkahuátl Guevara, is a singer, songwriter, producer, writer, poet, performance artist, and impresario.  He made his mark in music with his 1970s band Ruben & The Jets (their debut album was produced by Frank Zappa), and with his 1980s band Con Safos.\r\n\r\nIn the early 1980s, and again in the mid-1990s, he ran Zyanya Records, a subsidiary of Rhino Records. \r\n\r\nHe has composed a rock gospel cantata, created art videos and performance art pieces, provided music composition and coordination for movies and television, and put together shows featuring music and dance.\n	2017-11-23 19:40:46.611688	2017-11-26 01:00:49.083484	18	Ruben Ladron De Guevara
719	\N	American percussionist, born 23rd May 1946. Noted for her work with [a=Frank Zappa].\r\n\r\nUnderwood was professionally trained at Ithaca College and Juilliard. Her career was mostly dedicated to Frank Zappa's band from 1969 to 1982. She married fellow Zappa musician [a=Ian Underwood] in May 1969.\r\n	2017-11-23 19:40:46.614454	2017-11-26 01:00:56.07605	18	Ruth Underwood
721	\N	American songwriter and guitarist (May 2, 1943 - September 9, 2009, San Pablo, California, USA).\r\n\r\nAs a student at Valley State College in Los Angeles, Mann began to perform folk music at hootenannies and clubs like [l=The Ash Grove, Los Angeles] and [l=The Troubadour]. He became accquainted with a number of musicians in the folk music scene, including [a=Hoyt Axton], [a=Judy Henske], [a=Gail Garnett], Jimmy Rubin, and [a=Terry Wadsworth]. He also began accompanying [a=Janis Joplin] on guitar and they performed at open mics around the Los Angeles area. Mann was also a fixture on the 1960s San Francisco rock scene, playing with [a=Jefferson Airplane], [a=Frank Zappa], and members of [a=Grateful Dead]. \r\n\r\nAround 1967 Mann suffered a mental breakdown and went into partial retirement. In 2003 Mann moved to Berkeley, California where he began to perform again with the help of friends [a=Will Scarlett] and [a=Janet Smith]. Mann continued to play locally in Berkeley until shortly before his death in 2009.	2017-11-23 19:40:46.619966	2017-11-26 01:01:10.061579	18	Steve Mann (7)
722	\N	"[b]Suzy Creamcheese[/b]" is an archetypal name that has grown into the Frank Zappa music culture, first coined on the back cover of Zappa's "Freak Out!" album in the speech bubble "[b]Suzy Creamcheese[/b], What's Got Into You?". Her 'groupie' letter, sent from her hometown of Salt Lake City, Utah, is also 'lovingly' included on the cover.\r\n\r\nThe role of [b]Suzy Creamcheese[/b] was played by Jeannie Vassoir on "Freak Out!".\r\n\r\nThe role of [b]Suzy Creamcheese[/b] was played by Pamela Zarubica on the later Zappa releases "We're Only In It For The Money" and "Uncle Meat". Zarubica introduced Gail Sloatman to Frank Zappa in 1966. She is also the "Pam" mentioned in John Mayall's recording "2401". A song about a 'day in the life' of activities Mayall witnessed during a stay in Zappa's Log Cabin address at 2401 Laurel Canyon Blvd. Zarubica lived at 8404 Kirkwood Drive, Laurel Canyon.\r\n\r\nThe role of [b]Suzy Creamcheese[/b] was played by Lisa Cohen on "Absolutely Free". She is the daughter of Zappa's manager at the time, Herb Cohen. \r\n\r\nIn the UK, during the "Summer of Love", visiting L.A. resident Susan Ziegler (daughter of the owner of Los Angeles venues in which the M.O.I. performed) was often mistakenly cited by the music press as "Suzy Creamcheese".\r\n\r\nA boutique called "Suzy Creamcheese" existed in Las Vegas in the 1970s, also referred to in the film "Casino" [Scorsese].\r\n\r\n[b]Suzy Creamcheese[/b] dialog from "The Return Of The Son Of Monster Magnet" was used by the San Jose band Teddy And His Patches on their 1967 Chance label release "[b]Suzy Creamcheese[/b]". \n	2017-11-23 19:40:46.622951	2017-11-26 01:01:17.082351	18	Suzy Creamcheese
724	\N	American keyboardist and synth-player. Born: 26 October 1951, Westbury, Connecticut, U.S.A. \r\n\r\nMariano embarked on his career with piano lessons at age eight, followed by getting his act together as a church organist and on the club circuit before joining [a=Frank Zappa]’s band in 1977. He departed the band in 1982 and then collaborated with [a=Steve Vai], [url=http://www.discogs.com/artist/Band+From+Utopia%2C+The]The Band From Utopia[/url] and other alumni associated with Frank Zappa. In 1994 he also toured and worked with [url=http://www.discogs.com/artist/Mona+Lisa+Overdrive+%282%29]Mona Lisa Overdrive[/url].	2017-11-23 19:40:46.628804	2017-11-26 01:01:31.086161	18	Tommy Mariano
726	\N	Panamanian American jazz drummer, composer and bandleader, born May 16, 1944 in Panama. Swiss resident since the 1980s, he lives in Schüpfen, canton Bern.\r\n\r\nBrother of [a379167].	2017-11-23 19:40:58.371927	2017-11-26 01:01:46.077478	18	Billy Cobham
729	\N	Czech-American pianist, keyboardist, composer and bandleader.\r\nBorn April 17, 1948 in Prague, former Czechoslovakia.\r\n\r\nBest known for his soundtrack work, notably on the television series "Miami Vice".\r\nSon of Czech jazz multi-instrumentalist and composer [a=Jan Hammer (2)] and jazz vocalist [a=Vlasta Průchová]. U.S. resident since 1968.	2017-11-23 19:40:58.3863	2017-11-26 01:02:07.147235	18	Jan Hammer
734	\N	American producer, drummer, songwriter, singer, programmer. \r\n\r\nBorn: 23 April 1952 in Kalamazoo, Michigan, USA. \r\n\r\nWalden was given the name Narada by guru [a=Sri Chinmoy] in the early 1970s. His musical career spans three decades, in which he has been awarded several gold, platinum and multi-platinum awards. \r\n\r\nStarting his career when he replaced [a=Billy Cobham] in [a=John McLaughlin]'s [a=Mahavishnu Orchestra], he continued it as a drummer in [a=Tommy Bolin Band]. \r\n\r\nBesides his solo career, that started around 1976, he has produced and written hits for a wide array of artists, such as [a=Whitney Houston], [a=Aretha Franklin], [a=Sister Sledge], [a=Diana Ross], [a=Mariah Carey], [a=Al Jarreau], [a=Stacy Lattisaw], [a=Pointer Sisters], [a=Phyllis Hyman], et al. \r\n\r\nHe also owned recording studio, [l=Tarpan Studios], and was label owner of [l=Tarpan Records]. Some of his works are published by his own [l=Gratitude Sky Music] publishing entity. \r\n\r\nHe is brother in law to [a=Wanda Walden], ex-husband to [a=Lisa Walden], and husband of [a=Katie Mersereau]. \r\n	2017-11-23 19:40:58.409034	2017-11-26 01:02:42.073754	18	Narada Michael Walden
737	\N	American jazz pianist, composer, TV and film music producer, born July 10, 1954 in Malden, Massachusetts. He plays also organ and trombone.	2017-11-23 19:40:58.424182	2017-11-26 01:03:03.078263	18	Stu Goldberg
740	\N	German drummer, actor and performance artist.\r\n\r\nHe was born 2 February 1939 in Berlin, Germany and died 31 December 2009 in Düsseldorf, Germany.\n	2017-11-23 19:41:08.39373	2017-11-26 01:03:24.07195	18	Charly Weiss
741	\N	Born in Berlin, Germany, Christopher Franke studied classical music and composition at the Berlin Conservatory. Besides developing a love for classical music, Franke also experimented in eclectic music with the electronic/new age band Tangerine Dream between 1970 and 1987. Tangerine Dream enjoyed a very successful run, releasing over 36 albums and several motion picture soundtrack recordings.\r\n\r\nAfter leaving Tangerine Dream in 1987 to explore new creative concepts and directions, Franke founded the Berlin Symphonic Orchestra in an effort to combine his signature "musical expressions" with an equal balance of orchestral, ethnic and electronic music. During this period, Franke released his first solo album, Pacific Coast Highway, followed by The London Concert in 1992. In 1994 he released Enchanting Nature, the positive response to that album paved the way for his biggest-selling solo effort to date, The Celestine Prophecy - A Musical Voyage which is considered by many to be one of the most creative new age albums ever produced. This was followed by a unique collaboration, Transformation Of Mind, which paired several poetic readings by Deepak Chopra, along with nine delicate compositions by Franke.\r\n\r\nWhile being recognized as a major force in new age music, Franke has also garnered a tremendous amount of attention for several film and television scores including Babylon 5 and Tarzan And The Lost City.\n	2017-11-23 19:41:08.397382	2017-11-26 01:03:32.088935	18	Christopher Franke
742	\N	Conrad Schnitzler (1937 - 4th August 2011) was an institution in the German electronic music scene for thirty years. He studied with Joseph Beuys in the mid 1960’s, and in the late sixties joined the then fledgling German rock band Tangerine Dream. He added a bizarre, conceptual approach to Tangerine Dream that catapulted the band to legendary status, documented on the bands first album “Electronic Meditation”. Schnitzler left after that first album, forming with his friends Moebius and Roedelius the band Kluster. Kluster recorded and released three albums before Schnitzler again left, this time to pursue his own work under his own name. Kluster continued with just Roedelius and Moebius under the name Cluster. Since the demise of Kluster, Schnitzler released hundreds of albums, cassettes, and CDs, both on his own, and on various labels around the world. Schnitzler passed away in 2011, victim of stomach cancer. His last work was made just 4 days before his passing.\r\nFather of [a105276].	2017-11-23 19:41:08.400237	2017-11-26 01:03:39.082463	18	Conrad Schnitzler
743	\N	German artist and electronic music pioneer (born 6 June 1944, Tilsit, East Prussia (now Sovetsk, Kaliningrad Oblast, Russia) - died 20 January 2015, Vienna, Austria).\r\nHe began his musical career in 1965 with a short-lived rock group known as The Ones. After the group's disbandment in 1967, Froese then co-founded [a=Tangerine Dream] within the same year. After decades, and a myriad of compositions, Froese remained the only original member of the band. He was married to [a=Monique Froese] from 1970 until her death in 2000; he later married [a=Bianca Acquaye].	2017-11-23 19:41:08.403322	2017-11-26 01:03:46.076233	18	Edgar Froese
747	\N	Hoshiko Yamane (born 1981 in Osaka, Japan) is a violinist, composer and electronic musician currently based in Berlin. She graduated from Aich Prafecture University of Art and Music with the Master of Fine Arts for the violin in her native Japan and also earned a diploma in violin from the University of Music and Theater in Rostock in Germany..  Yamane has been a member of [a=Tangerine Dream] since 2011.  She also leads a music and contemporary dance project called Tansik.  They released their debut album, DIscord, in 2016.	2017-11-23 19:41:08.415164	2017-11-26 01:04:14.080458	18	Hoshiko Yamane
750	\N	Johannes Schmölling, or Schmoelling, was born in Lohne, Germany in 1950.  Schmölling obtained a degree in sound engineering in 1978.  He then began a musical career with a band known as Tangerine Dream from 1979-1985.\r\nSince 1986 he works successfully as an solo artist and composer for theatre and TV.\r\nIn 2011 he joined forces with [A=Jerome Froese] and [a2459113] to form [a2459112], a new three-members band in the tradition of [A=Tangerine Dream].\n	2017-11-23 19:41:08.423882	2017-11-26 01:04:35.080144	18	Johannes Schmölling
752	\N	Berlin drummer and multi-instrumentalist who first gained world attention as Klaus Krieger, playing drums in the late 1970's incarnation of Tangerine Dream. He was also involved in the local new-wave (NDW) underground, recorded two experimental LP's on Klaus Schulze's IC label, and also toured playing drums with Iggy Pop and others in Germany.	2017-11-23 19:41:08.429878	2017-11-26 01:04:48.178214	18	Klaus Krüger
776	\N	British songwriter and bassist, born 16 June 1942 in Birmingham, England, UK and died 26 November 1973 in Radlett, Hertfordshire, England, UK, when he was electrocuted by his guitar.\r\n	2017-11-23 19:41:20.420773	2017-11-26 01:07:36.071431	18	John Rostill
779	\N	Born: 2nd February 1940, Chelsea, London, UK.\r\nDied: 16th August 2000.\r\n\r\nCaddy was a UK guitarist, session artist and prolific arranger/producer of covers of popular hit songs and melodies, primarily with [l=Avenue Recordings].\r\n\r\nHe began his career as a founder member of the "Tornados", serious challengers to the Shadows as most popular British instrumentalists of the 1960s and best remembered for the million-selling "Telstar" single of 1962. The band scored three more instrumental entries with  "Globetrotter", "Robot" and "Ice Cream Man" in 1963's domestic Top 10, before the advent of Merseybeat and its emphasis on vocals rendered their style passé. \r\n\r\nUnlike the other band members Caddy was classically trained, serving as head chorister and leader of the school orchestra at Emanuel School, Battersea, a treble in Westminster Abbey choir and studying violin the Royal Academy of Music. His break came when he joined the "Five Nutters" skiffle group, who were omnipresent at their own KKK Club in Willesden. After a transitional period as "Bats Heath and the Vampires", they went professional as "Johnny Kidd And The Pirates" in 1958. One of the few UK 'homegrown rock 'n' rollers' regarded with awe, the band's TV debut was on ITV's "Disc Break" in 1959 with "Please Don't Touch". Much of its charm emanated from Caddy's galvanising riffs although, because Caddy was riven with self-doubt about his abilities, another guitarist picked the staccato lead on the band's climactic "Shakin' All Over". Whilst the single knocked Cliff Richard from the top spot in August 1960, it netted Caddy only a standard session fee of 15 guineas. Within a year "Johnny Kidd & The Pirates" were becalmed outside the Top 50 and Caddy, along with fellow Pirates, abandoned ship to retain their stage costumes as the "Cabin Boys" behind Tommy Steele's brother, Colin Hicks, a huge attraction in Italy. \r\n\r\nCaddy flew home from Italy after Hicks proved a difficult employer, landing on his feet after responding to a 'Melody Maker' advert with pal Clem Cattini as a mainstay of the Tornados, along Heinz Burt, George Bellamy and Roger LaVern. The band was originally assembled to back Ken Charles, Pamela Blue, John Leyton, Mike Berry and other protégés at the console of boffin Joe Meek in his RPM Studio in London's Holloway Road. Following a miss with "Popeye Twist", written by Caddy and drummer Cattini, the ethereal "Telstar" was taped as a routine backing track - albeit with a poignant "second subject" plucked by Caddy - hours before a show with Billy Fury in Great Yarmouth. Meek had transformed it overnight into the quintessential 1960s instrumental. Although later dismissing Meek's RPM sound as "unadulterated lift music", Caddy remained a Tornado throughout their period of greatest celebrity as respected sidemen, hit parade contenders and patron saints of myriad combos created in the same image - notably the "Volcanos" with "Polaris". The band's decline began with the departure of their 'teen factor' bassist Heinz Burt, shortly before the comparative flop of "Dragonfly" in 1963.  Caddy then departed after the release of 1964's "Away From It All", an album containing four of his compositions.\r\n\r\nAlthough well-placed to become a star in his own right Caddy preferred a 'back seat'. As Clem Cattini suggested: "He never achieved his potential because he didn't believe in himself." Caddy took a job as house arranger and producer for Avenue Records, a budget label specialising in covers of current hits where he performed as the [a400202]. He next moved to a similar post in Canada and emerged back in England in 1975. Caddy was involved in a remake of "Telstar" by a reconstituted "Tornados", but chose not to return to the public stage - although he was persuaded to pitch in occasionally when attending 'RPM Appreciation Society' evenings. It was at one such event in Lewisham in 1991 that Caddy gave his last public performance, playing the timeless "Telstar". \r\n	2017-11-23 19:41:32.372223	2017-11-26 01:07:57.085172	18	Alan Caddy
782	\N	Prolific UK session drummer, member of the Tornados. He drummed on 45 UK #1's, including hits by Johnny Kidd and The Pirates, The Tornados, T-Rex and Hot Chocolate. \r\nHe was originally considered by Jimmy Page for the drummer in Led Zeppelin.	2017-11-23 19:41:32.384445	2017-11-26 01:08:18.073665	18	Clem Cattini
785	\N	Born : 24th July, 1942 in Germany, grew up in Southampton, Hampshire, England.\r\nDied : 7th April, 2000 in England\n	2017-11-23 19:41:32.396356	2017-11-26 01:08:38.091745	18	Heinz
790	\N	British musician (born on Kidderminster, November, 11, 1937 -  † on Worcestershire, June, 15, 2013). He was the keyboardist and the organist of the sixties British band [a=The Tornados].	2017-11-23 19:41:32.419767	2017-11-26 01:09:11.074494	18	Roger LaVern
753	\N	Born August 4th 1947, Schulze initially made his mark as a drummer, first with the group Psy Free, later with Tangerine Dream (he played on their first album "Electronic Meditation" before he quit) and Ash Ra Tempel (with Manuel Göttsching). In 1971 Schulze started a solo career as an electronic musician and released a couple of heavily experimental albums, "Irrlicht" and "Cyborg". 1974's "Blackdance" was the first release where he used a "real" synthesizer, and later in the 70's he would record albums such as "Moondawn", "Mirage" and "X" and embark on several tours, documented across a number of live albums. \r\n\r\nIn 1978 he set up the label IC (Innovative Communications), and the following year he also launched the pseudonym/project Richard Wahnfried. In the 1980's Schulze continued his hectic release schedule as well as recording several soundtracks and rebuilding his studio (he "went digital" in 1986), and whereas IC was shut down in 1983, the label Inteam was established the following year. \r\n\r\nIn the 1990's Schulze recorded several electronic interpretations of works by classical composers (most notably Wagner) as well as collaborating with opera singers and other classical music performers on his own albums. He also started collaborating with German ambient/techno artist Pete Namlook in the series "The Dark Side Of The Moog" on the latter's Fax label, and steered the Wahnfried project into a more modern techno- and trance-inspired direction.	2017-11-23 19:41:08.432891	2017-11-26 01:04:57.076683	18	Klaus Schulze
757	\N	Apart from a few solo albums Michael is far better known for his film-music and for some fans also by the music for the popular [b]Baldur's Gate[/b] PC games series.\r\nOwns his own production company [l=Metamusic Productions].\n	2017-11-23 19:41:08.444328	2017-11-26 01:05:24.07407	18	Michael Hoenig
758	\N	Paul Haslinger (b. 11 December 1962) is an Austrian-born composer and musician currently based in Los Angeles, California.\r\n\r\nAfter studying classical music in Vienna, Austria, Haslinger joined the German electronic music group, [a=Tangerine Dream] in 1986. During the following 5 years he recorded a total of 15 albums with the group, participated in 4 international tours and collaborated on a number of soundtracks, including Miracle Mile, Near Dark, and Shy People. The soundtrack album for the Miramar release Canyon Dreams, earned Haslinger his first Grammy nomination in 1991. Haslinger decided to leave the group and move to Los Angeles in 1992.\r\n\r\nIn 1998, he was asked to join the team around film composer [a=Graeme Revell], working as a programmer and arranger for projects such as Chinese Box, The Negotiator, The Siege, Pitch Black, Blow and Lara Croft: Tomb Raider. It was during this time that Haslinger decided to redirect his creative effort towards film scoring specifically and music-to-picture applications in general.\r\n	2017-11-23 19:41:08.44786	2017-11-26 01:05:31.074621	18	Paul Haslinger
759	\N	Peter Baumann (born January 29, 1953 in Berlin) is a German musician, he was a member of [a=Tangerine Dream] from 1971 to 1977, he toured with the band worldwide and recorded multiple Gold records. He has also had his own solo career. He owned [l=Paragon Studios (2)] in West Berlin. From 1984 to 1996 he ran his label [l10447], specializing in instrumental music. Since 2009 he is head of the Baumann Institute, "dedicated to exploring the nature of awareness and its relationship to human health and well-being.” As of June 2015 Peter Baumann officially rejoined Tangerine Dream after working on sketches for Quantum Key and Quantum Gate with the late [a=Edgar Froese].  He left the band again in December, 2015.	2017-11-23 19:41:08.452845	2017-11-26 01:05:38.066949	18	Peter Baumann
764	\N	German producer of ethereal electronic music which calls to mind such diverse influences as Chapterhouse, My Bloody Valentine and LFO. After much unsigned work under some aliases, the CCO label saw fit to release his debut mini-album, "Far Away Trains Passing By". The album became a critical hit and gained more and more listeners through the next couple years as it seeped into the far East and America. Due to strong word-of-mouth and a devoted following, his follow-up album, "A Strangely Isolated Place", was an even bigger hit. He has also started branching out with collaborations and remixes with Longview, Mojave 3, I'm Not A Gun, Justin Robertson, The Zephyrs, and more.	2017-11-23 19:41:08.47491	2017-11-26 01:06:13.085957	18	Ulrich Schnauss
766	\N	Swiss guitarist, born February 16th, 1969 in Rijeka, Yugoslavia, grown up in Berne, Switzerland. He studied guitar at the Los Angeles "Guitar Institute of Technology" and then became guest musician for [a10343]. After his return to Switzerland he was active musician, playing with [a369368].\r\nHe was also active as songwriter for [a7694].	2017-11-23 19:41:08.482831	2017-11-26 01:06:26.076469	18	Zlatko Perica
767	\N	British pianist, composer and producer. \r\nBorn 27 March 1937 in Leeds, West Yorkshire, U.K.\r\nFather of dance vocalist [a=Kirsty Hawkshaw].\r\nHe is known for composing themes for movies and TV programs.\r\nHe has extensive session work for artists such as [a=Olivia Newton John], [a=David Bowie], [a=Cliff Richard], and others.\r\nHe was a key-musician in the disco scene with his group [a=Love De-Luxe], his work with [a=Alec R. Costandinos]'s [a=Love & Kisses], [a=Donna Summer] and [a=Madeline Bell].\r\nPublishing companies.\r\n[l=Alan Hawkshaw Publishing]\r\n[l=Alan Hawkshaw Music Ltd.]\r\n	2017-11-23 19:41:20.377698	2017-11-26 01:06:34.078934	18	Alan Hawkshaw
768	\N	Alan Tarney (born 19 November 1945, Northside, Workington, Cumberland, England) is an English songwriter, record producer, vocalist, guitarist, bass guitarist and keyboardist.\r\n\r\nHis family migrated to Australia and he spent his teenage years in Adelaide, Australia, where he met his songwriting and musical partner [a388101]. The two played together in the band [a2377813] (1967–1968). When the group disbanded, Tarney and Spencer moved to London, England and met up with former band member [a297365]. The trio formed the Kevin Peek Trio (1968–69). In 1969, [a192110] moved to England and the four musicians formed the short lived band [a2809421]. Alan went on to play bass guitar with [a170356] from 1973 to 1977 both in the studio and live, covering four major albums "Rockin With Curly Leads", "Specs Appeal", Live At Paris Olympia" and "Tasty" with [a=John Farrar]. He formed [a1714010] with Trevor Spencer in 1976.\r\n\r\nIn 1979, Alan wrote and arranged the [a125101] hit "We Don't Talk Anymore". This led to him becoming Richard's record producer of his next two albums, "I'm No Hero" (1980) and "Wired for Sound" (1981). Alan went on to bigger success as a producer in the mid-1980s when he worked with Norwegian band [a=A-ha].\r\n	2017-11-23 19:41:20.382518	2017-11-26 01:06:41.081831	18	Alan Tarney
773	\N	English guitarist born 28 October 1941, in Newcastle-Upon-Tyne, UK. \r\n\r\nLead guitarist for band [a=The Shadows]. He was also the owner of the first imported Fender Stratocaster guitar in the UK, which was bought for him by friend and colleague [a=Cliff Richard]. \r\n\r\nThe Shadows primarily performed instrumentals, and was formed as a backing band for singer [a=Cliff Richard]. \r\n\r\nMarvin is famous for having a distinctive guitar sound and appearance, primarily using a clean sound with very high reverb and vibrato, which primarily gives a dreamy effect to the sound. \r\n\r\nIncidently, in cockney rhyming slang, Hank Marvin's name is one of the ways often used as to signify hunger: "I'm Hank Marvin" = "I'm starvin'" (with or without the obligatory expletive!). 	2017-11-23 19:41:20.406619	2017-11-26 01:07:15.081875	18	Hank Marvin
775	\N	Australian-born music producer, songwriter, arranger, singer and guitarist, born 8 November 1945 in Melbourne, Victoria, Australia.	2017-11-23 19:41:20.415654	2017-11-26 01:07:29.077143	18	John Farrar
801	\N	Fritz Müller is one of the most innovative musicians of the German Rock scene. Born 1945 as Eberhard Kranemann in Germany, he studied classical double bass at the Dortmund Conservatory, playing Bach/Mozart/Telemann-orchestra music and with Jazz bands. Then he went to Düsseldorf to study painting at the Arts Academy. Besides experimenting with colours and painting abstract pictures, he experimented with sounds, at first on cello, clarinet, tenorsaxophone, electric guitar, hawaii guitar, later with electronic instruments. In 1967, with other art students he founded the experimental music group [a=Pissoff]. Critical about the social development in Germany and the conservative rollback round about, the band demolished the established rules of music. In their concerts they played free improvised music for three hours non-stop, everyone playing as loud as possible - without harmony, avoiding correct pitch, defined structures and norms - and people liked it. \r\nPure freedom. Chaos. Acoustic terror. [a=Joseph Beuys], professor at the Düsseldorf Art Academy, was so enthusiastic that he initiated a performance with Pissoff in Düsseldorf´s famous Creamcheese Club, Frank Zappa's favourite club in Germany.\r\nAt this time [a=Florian Schneider] heard the sound of the group and joined the band, becoming a friend of Eberhard Kranemann.  After four years of collaboration he began to work with [a=Klaus Dinger] and [a=Michael Rother] in the band [a=Neu!]. Later on he invented for himself the stage personality Fritz Müller, working as a solo artist in concerts and recording at the [a=Conny Plank] studio in Wolperath. He formed the FRITZ MUELLER BAND, did concert tours, more studio work, radio and television appearances...\r\n\r\nEberhard Kranemann / FRITZ MUELLER is still working as artist and musician - doing avantgarde concert / art exhibitions / performances\r\n	2017-11-23 19:44:22.377276	2017-11-26 01:10:28.083705	20	Eberhard Kranemann
803	\N	German electronic musician and vocalist.\r\nBorn : April 07, 1947 in Dusseldorf, Germany.\r\n\r\nFlorian was a member (and founder) of “Kraftwerk” with Ralf Hütter.\r\nPrevious played in groups : “Pissoff” (1967-’68) and "Organisation” (1968-’69).\r\n	2017-11-23 19:44:22.384558	2017-11-26 01:10:43.0837	20	Florian Schneider
808	\N	German musician and songwriter, born 24 March 1946 in Scherfede, Germany, died 21 March 2008. Brother of [a=Thomas Dinger], son of [a=Heinz Dinger] and [a=Renate Dinger].	2017-11-23 19:44:22.398861	2017-11-26 01:11:18.097612	20	Klaus Dinger
809	\N	German musician and music teacher, born 7 April 1948 in Stuttgart, Germany. \r\nDuring 1974 he was member of Kraftwerk.\n	2017-11-23 19:44:22.402892	2017-11-26 01:11:25.148031	20	Klaus Röder
810	\N	Born in 1950 in Hamburg, Germany.  Rother was in the group Spirit of Sound with [a=Wolfgang Riechmann] and [a=Wolfgang Flür] until 1970.  For a very short time he played with [a=Kraftwerk], though it was in between their first two albums and he is not featured on any of their official releases.  When he left Kraftwerk, he took with him [a=Klaus Dinger] and together they became [a=Neu!].  Simultanously to that band, Rother collaborated with [a=Hans-Joachim Roedelius] and [a=Dieter Moebius] of [a=Cluster] in a new project called [a=Harmonia].  In 1976 he decided to go solo, though he still toured with Moebius until 2014.	2017-11-23 19:44:22.40686	2017-11-26 01:11:32.078077	20	Michael Rother
812	\N	German drummer and musician.\r\n\r\nHe was born 17 July 1947 in Frankfurt am Main, Germany.\r\nDuring his school years, in Düsseldorf, he founded in 1966 his first amateur\r\nGroup "The Beathovens".\r\nIt will follow the "Spirits Of Sound" with Michael Rother and Wolfgang Riechmann.\r\n\r\n	2017-11-23 19:44:22.414685	2017-11-26 01:11:46.080374	20	Wolfgang Flür
815	\N	Born: February 13, 1956, Salford, Greater Manchester, England\r\n\r\nBassist for [a=Joy Division] and [a=New Order].\r\n	2017-11-23 19:44:34.380567	2017-11-26 01:12:07.066195	20	Peter Hook
816	\N	British guitarist, born 7 December 1974 in Macclesfield, Cheshire, England.\r\n[b]Not to be confused with[/b] the Scottish musician & producer [a=Phil Cunningham (2)].	2017-11-23 19:44:34.385065	2017-11-26 01:12:14.071545	20	Phil Cunningham
820	\N	British electronic musician, born November 10, 1967 in Bristol, Great Britain.	2017-11-23 19:44:45.378332	2017-11-26 01:12:42.6929	20	Andrew Vowles
821	\N	British electronic musician, born December 18, 1959 in Bristol, Great Britain.	2017-11-23 19:44:45.382708	2017-11-26 01:12:50.082688	20	Grant Marshall
823	\N	Guy-Manuel de Homem-Christo was born on February 8, 1974 in Paris, France. In 1992 he recorded together with his schoolmates [a=Thomas Bangalter] and [a=Laurent Brancowitz] (Part of [a=Phoenix]) his first two songs under the name [a=Darlin'], which were released on the compilation "[r=306155]" on [l=Duophonic]. The song Darlin' was denominated as "a bunch of daft punk" by a reviewer in the UK music magazine Melody Maker. Guy-Manuel de Homem-Cristo and Thomas Bangalter took over the expression "[a=Daft Punk]" as their next band name. In 1993 their first single "The New Wave" was released on [l=Soma Quality Recordings]. In 1997 he created together with his friend [a=Eric Chedeville] the label [l=Crydamoure], where they released their music under the name [a=Le Knight Club] and supported other french newcomers.\r\nGuy Manuel is the brother of [a=Paul De Homem-Christo] AKA [a=Play Paul].\r\n\r\nInstrument: Guitar, synthesizer, keyboards, drums, drum machine, programming.\r\n\r\nDiscography\r\n\r\nLe Knight Club:\r\n"Santa Claus / Holiday on Ice" (1997)\r\n"Intergalaktic Disko" (1997)\r\n"Troobadoor / Mirage" (1998)\r\n"Boogie Shell" (1999)\r\n"Hysteria" (1999)\r\n"Gator / Chérie D'Amour" (2001)\r\n"Doggystyle / Rhumba" (2002)\r\n"Nymphae Song / Rhumba" (2002)\r\n"Soul Bells" (2002)\r\n\r\nCrydajam:\r\n"If You Give Me The Love I Want" / "Playground" / "Loaded" (2002)\r\n\r\nThe Eternals Vs. Deelat:\r\n"Wet Indiez (Shake That Bourrelet Remix)" (2000)\r\n\r\nAlbums produced:\r\n\r\nWaves (2000)\r\nWaves II (2003)\r\nSexuality by Sébastien Tellier (2008)\r\nOutRun by Kavinsky (2013)	2017-11-23 19:44:56.365085	2017-11-26 01:13:04.077195	20	Guy-Manuel de Homem-Christo
824	\N	Born in 1975. Part of the duo [a=Daft Punk], producer and writer. Son of [a=Daniel Bangalter] AKA [a=Daniel Vangarde], who composed [r=187160] for [a=Ottawan].\r\nAfter the experience of [a=Darlin'] and before the [a=Daft Punk] phenomena, Thomas Bangalter released the two famous EP's 'Trax On Da Rocks', a composite of various samples set to funky House and Techno beats.\r\n\r\nHe released 'Music Sounds Better With You' on his own label [l=Roulé] as part of [a=Stardust] as well as his remix for "Rock Shock" by [a=Roy Davis Jr.].\r\n\r\nIn 1998, his track 'Gym Tonic' was the center of a 'scandal' as [a=Bob Sinclar] included it on his album "Paradise" without the consent of Bangalter. This resulted in a law suit intended by guru fitness and actress Jane Fonda whose voice was illegally sampled on the record.\r\n\r\nA very 'anonymous' person, Bangalter nontheless gave a few interviews in and out of the [a=Daft Punk] phenomena. Although a lot of people credit him for the invention of 'filtered house', he cited [a=Carl Craig] AKA [a=Paperclip People] ("Throw") and [a=Kenny "Dope" Gonzalez] as precursors of the style.\r\nIt must also be noted that outside [a=Daft Punk], Bangalter stopped his DJing career due to ear problems. \r\n\r\nBangalter is married to French actress [a=Elodie Bouchez] with whom he has two sons: Tara-Jay (born 2002) and Roxan (born 2008).\r\n	2017-11-23 19:44:56.368748	2017-11-26 01:13:11.085889	20	Thomas Bangalter
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('artists_id_seq', 824, true);


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
894	104	22	2017-11-27 17:23:08.068241	2017-11-27 17:23:08.068241
895	104	24	2017-11-27 17:23:08.192359	2017-11-27 17:23:08.192359
896	104	28	2017-11-27 17:23:08.281013	2017-11-27 17:23:08.281013
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bandmembers_id_seq', 896, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: frcake
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
104	this is a band	\N	2017-11-27 17:23:07.995302	2017-11-27 17:23:07.995302	1
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bands_id_seq', 104, true);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY categories (id, name, parent_id, lft, rgt, depth, children_count) FROM stdin;
7	Experimental	6	11	12	2	0
8	Metal	\N	15	20	0	0
9	Death_Metal	8	16	19	1	0
10	Electronic_Death_Metal	9	17	18	2	0
11	Country	\N	21	22	0	0
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
23	Drum_n_Bass	\N	45	46	0	0
24	Indie	\N	47	48	0	0
25	Alternative	\N	49	50	0	0
26	Dubstep	\N	51	52	0	0
1	Rock	\N	1	6	0	0
2	Hip_Hop	\N	7	8	0	0
3	Hard_Rock	1	2	5	1	0
4	Stoner_Rock	3	3	4	2	0
5	Dance	\N	9	14	0	0
6	IDM	5	10	13	1	0
12	rnb	\N	23	24	0	0
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('categories_id_seq', 26, true);


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: frcake
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
15	205	132	2017-11-24 18:28:01.836184	2017-11-24 18:28:01.836184
16	205	6	2017-11-24 18:28:03.885375	2017-11-24 18:28:03.885375
17	205	5	2017-11-24 18:28:05.599746	2017-11-24 18:28:05.599746
18	205	15	2017-11-24 18:28:07.760005	2017-11-24 18:28:07.760005
19	205	20	2017-11-24 18:28:09.633408	2017-11-24 18:28:09.633408
20	205	17	2017-11-24 18:28:11.735528	2017-11-24 18:28:11.735528
21	1	205	2017-11-25 21:21:00.368923	2017-11-25 21:21:00.368923
22	206	44	2017-11-27 17:10:13.646376	2017-11-27 17:10:13.646376
23	206	5	2017-11-27 17:10:16.819567	2017-11-27 17:10:16.819567
\.


--
-- Name: friendships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('friendships_id_seq', 23, true);


--
-- Data for Name: mailboxer_conversation_opt_outs; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_conversation_opt_outs (id, unsubscriber_type, unsubscriber_id, conversation_id) FROM stdin;
\.


--
-- Name: mailboxer_conversation_opt_outs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_conversation_opt_outs_id_seq', 1, false);


--
-- Data for Name: mailboxer_conversations; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_conversations (id, subject, created_at, updated_at) FROM stdin;
1	rgfverg	2017-11-24 20:07:33.12001	2017-11-24 20:07:33.12001
2	test	2017-11-24 20:13:05.011151	2017-11-24 20:13:05.011151
3	vsd	2017-11-24 20:14:22.947058	2017-11-24 20:14:22.947058
4	sdvsdvsdvsdv	2017-11-24 20:14:57.559258	2017-11-24 20:14:57.559258
5	sdfbverfdb	2017-11-24 20:16:09.323716	2017-11-24 20:16:09.323716
6	test	2017-11-24 20:20:52.810806	2017-11-24 20:20:52.810806
7	dcsc	2017-11-24 20:27:04.381489	2017-11-24 20:27:04.381489
8	dcsdcscdfbdfbdfb	2017-11-24 20:49:15.55376	2017-11-24 20:49:15.55376
9	wefwe	2017-11-24 20:53:56.031249	2017-11-24 20:54:00.162952
10	sdcsdc	2017-11-24 20:54:49.136501	2017-11-24 20:54:49.136501
11	Hello	2017-11-26 14:47:44.585284	2017-11-26 14:47:44.585284
12	okokokokoko	2017-11-26 14:53:03.499608	2017-11-26 14:53:03.499608
13	sdsdsdsd	2017-11-26 14:58:03.426117	2017-11-26 14:58:03.426117
14	asgasgasgas	2017-11-26 15:02:12.735994	2017-11-26 15:02:12.735994
15	sgaasgasgasg	2017-11-26 15:04:45.194243	2017-11-26 15:04:45.194243
16	sgaasgasgasg	2017-11-26 15:08:39.435272	2017-11-26 15:08:39.435272
17	askdhalshdlaskhd	2017-11-26 15:09:35.216003	2017-11-26 15:09:35.216003
18	subject for admin	2017-11-26 15:48:23.497554	2017-11-26 15:48:23.497554
19	asdasdasdas	2017-11-26 16:00:16.071152	2017-11-26 16:00:16.071152
20	this is a subject	2017-11-27 15:18:37.817874	2017-11-27 15:18:37.817874
21	this is a subject	2017-11-27 17:11:15.65413	2017-11-27 17:11:15.65413
\.


--
-- Name: mailboxer_conversations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_conversations_id_seq', 21, true);


--
-- Data for Name: mailboxer_notifications; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_notifications (id, type, body, subject, sender_type, sender_id, conversation_id, draft, notification_code, notified_object_type, notified_object_id, attachment, updated_at, created_at, global, expires) FROM stdin;
1	Mailboxer::Message	<p>ergergerger</p>	rgfverg	User	205	1	f	\N	\N	\N	\N	2017-11-24 20:07:33.12001	2017-11-24 20:07:33.12001	f	\N
2	Mailboxer::Message	<p>testetst</p>	test	User	205	2	f	\N	\N	\N	\N	2017-11-24 20:13:05.011151	2017-11-24 20:13:05.011151	f	\N
3	Mailboxer::Message	<p>sdvsdv</p>	vsd	User	205	3	f	\N	\N	\N	\N	2017-11-24 20:14:22.947058	2017-11-24 20:14:22.947058	f	\N
4	Mailboxer::Message	<p>sdvsdvsdvsdvs</p>	sdvsdvsdvsdv	User	205	4	f	\N	\N	\N	\N	2017-11-24 20:14:57.559258	2017-11-24 20:14:57.559258	f	\N
5	Mailboxer::Message	<p>dfbdfbdfbd</p>	sdfbverfdb	User	205	5	f	\N	\N	\N	\N	2017-11-24 20:16:09.323716	2017-11-24 20:16:09.323716	f	\N
6	Mailboxer::Message	<p>test</p>	test	User	205	6	f	\N	\N	\N	\N	2017-11-24 20:20:52.810806	2017-11-24 20:20:52.810806	f	\N
7	Mailboxer::Message	<p>sdcsdc</p>	dcsc	User	205	7	f	\N	\N	\N	\N	2017-11-24 20:27:04.381489	2017-11-24 20:27:04.381489	f	\N
8	Mailboxer::Message	<p>fbdfbdfb</p>	dcsdcscdfbdfbdfb	User	205	8	f	\N	\N	\N	\N	2017-11-24 20:49:15.55376	2017-11-24 20:49:15.55376	f	\N
9	Mailboxer::Message	<p>fwefwefwefwefwe</p>	wefwe	User	205	9	f	\N	\N	\N	\N	2017-11-24 20:53:56.031249	2017-11-24 20:53:56.031249	f	\N
10	Mailboxer::Message	<p>sdcsdcs</p>	wefwe	User	205	9	f	\N	\N	\N	\N	2017-11-24 20:54:00.155153	2017-11-24 20:54:00.155153	f	\N
11	Mailboxer::Message	<p>dcscsdcsdcscsdc</p>	sdcsdc	User	205	10	f	\N	\N	\N	\N	2017-11-24 20:54:49.136501	2017-11-24 20:54:49.136501	f	\N
12	Mailboxer::Message	Hello mr admin\r\nthis is a test message :) \r\nThanks	Hello	User	12	11	f	\N	\N	\N	\N	2017-11-26 14:47:44.585284	2017-11-26 14:47:44.585284	f	\N
13	Mailboxer::Message	okokokokokokokokokokok	okokokokoko	User	2	12	f	\N	\N	\N	\N	2017-11-26 14:53:03.499608	2017-11-26 14:53:03.499608	f	\N
14	Mailboxer::Message	dsdsdsd	sdsdsdsd	User	12	13	f	\N	\N	\N	\N	2017-11-26 14:58:03.426117	2017-11-26 14:58:03.426117	f	\N
15	Mailboxer::Message	asgasgasgasg	asgasgasgas	User	12	14	f	\N	\N	\N	\N	2017-11-26 15:02:12.735994	2017-11-26 15:02:12.735994	f	\N
16	Mailboxer::Message	asgasgasgasgagasgasga	sgaasgasgasg	User	12	15	f	\N	\N	\N	\N	2017-11-26 15:04:45.194243	2017-11-26 15:04:45.194243	f	\N
17	Mailboxer::Message	asgasgasgasgagasgasga	sgaasgasgasg	User	12	16	f	\N	\N	\N	\N	2017-11-26 15:08:39.435272	2017-11-26 15:08:39.435272	f	\N
18	Mailboxer::Message	aqlskkdhalskfhalskh	askdhalshdlaskhd	User	12	17	f	\N	\N	\N	\N	2017-11-26 15:09:35.216003	2017-11-26 15:09:35.216003	f	\N
19	Mailboxer::Message	admin	subject for admin	User	12	18	f	\N	\N	\N	\N	2017-11-26 15:48:23.497554	2017-11-26 15:48:23.497554	f	\N
20	Mailboxer::Message	asdasdasd	asdasdasdas	User	12	19	f	\N	\N	\N	\N	2017-11-26 16:00:16.071152	2017-11-26 16:00:16.071152	f	\N
21	Mailboxer::Message	ok ok ok	this is a subject	User	12	20	f	\N	\N	\N	\N	2017-11-27 15:18:37.817874	2017-11-27 15:18:37.817874	f	\N
22	Mailboxer::Message	subject	this is a subject	User	206	21	f	\N	\N	\N	\N	2017-11-27 17:11:15.65413	2017-11-27 17:11:15.65413	f	\N
\.


--
-- Name: mailboxer_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_notifications_id_seq', 22, true);


--
-- Data for Name: mailboxer_receipts; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY mailboxer_receipts (id, receiver_type, receiver_id, notification_id, is_read, trashed, deleted, mailbox_type, created_at, updated_at, is_delivered, delivery_method, message_id) FROM stdin;
1	User	205	1	t	f	f	sentbox	2017-11-24 20:07:33.237654	2017-11-24 20:07:33.237654	f	\N	\N
2	User	205	2	t	f	f	sentbox	2017-11-24 20:13:05.131488	2017-11-24 20:13:05.131488	f	\N	\N
3	User	205	3	t	f	f	sentbox	2017-11-24 20:14:23.061221	2017-11-24 20:14:23.061221	f	\N	\N
4	User	205	4	t	f	f	sentbox	2017-11-24 20:14:57.669915	2017-11-24 20:14:57.669915	f	\N	\N
5	User	205	5	t	f	f	sentbox	2017-11-24 20:16:09.430332	2017-11-24 20:16:09.430332	f	\N	\N
6	User	205	6	t	f	f	sentbox	2017-11-24 20:20:52.897844	2017-11-24 20:20:52.897844	f	\N	\N
7	User	205	7	t	f	f	sentbox	2017-11-24 20:27:04.500217	2017-11-24 20:27:04.500217	f	\N	\N
8	User	205	8	t	f	f	sentbox	2017-11-24 20:49:15.670344	2017-11-24 20:49:15.670344	f	\N	\N
9	User	205	9	t	f	f	sentbox	2017-11-24 20:53:56.151431	2017-11-24 20:53:56.151431	f	\N	\N
10	User	205	10	t	f	f	sentbox	2017-11-24 20:54:00.157249	2017-11-24 20:54:00.157249	f	\N	\N
11	User	205	11	t	f	f	sentbox	2017-11-24 20:54:49.143579	2017-11-24 20:54:49.143579	f	\N	\N
12	User	12	12	t	f	f	sentbox	2017-11-26 14:47:44.661859	2017-11-26 14:47:44.661859	f	\N	\N
13	User	2	13	t	f	f	sentbox	2017-11-26 14:53:03.512422	2017-11-26 14:53:03.512422	f	\N	\N
14	User	12	14	t	f	f	sentbox	2017-11-26 14:58:03.539334	2017-11-26 14:58:03.539334	f	\N	\N
15	User	12	15	t	f	f	sentbox	2017-11-26 15:02:12.746825	2017-11-26 15:02:12.746825	f	\N	\N
16	User	2	16	f	f	f	inbox	2017-11-26 15:04:45.207619	2017-11-26 15:04:45.207619	f	\N	\N
17	User	12	16	t	f	f	sentbox	2017-11-26 15:04:45.209965	2017-11-26 15:04:45.209965	f	\N	\N
18	User	2	17	f	f	f	inbox	2017-11-26 15:08:39.518428	2017-11-26 15:08:39.518428	f	\N	\N
19	User	12	17	t	f	f	sentbox	2017-11-26 15:08:39.520956	2017-11-26 15:08:39.520956	f	\N	\N
20	User	2	18	f	f	f	inbox	2017-11-26 15:09:35.228458	2017-11-26 15:09:35.228458	f	\N	\N
21	User	12	18	t	f	f	sentbox	2017-11-26 15:09:35.230812	2017-11-26 15:09:35.230812	f	\N	\N
22	User	2	19	f	f	f	inbox	2017-11-26 15:48:23.610023	2017-11-26 15:48:23.610023	f	\N	\N
23	User	12	19	t	f	f	sentbox	2017-11-26 15:48:23.615219	2017-11-26 15:48:23.615219	f	\N	\N
24	User	2	20	f	f	f	inbox	2017-11-26 16:00:16.096548	2017-11-26 16:00:16.096548	f	\N	\N
25	User	12	20	t	f	f	sentbox	2017-11-26 16:00:16.098543	2017-11-26 16:00:16.098543	f	\N	\N
26	User	205	21	f	f	f	inbox	2017-11-27 15:18:37.949076	2017-11-27 15:18:37.949076	f	\N	\N
27	User	12	21	t	f	f	sentbox	2017-11-27 15:18:37.954154	2017-11-27 15:18:37.954154	f	\N	\N
28	User	205	22	f	f	f	inbox	2017-11-27 17:11:15.731819	2017-11-27 17:11:15.731819	f	\N	\N
29	User	206	22	t	t	t	sentbox	2017-11-27 17:11:15.736103	2017-11-27 17:11:15.736103	f	\N	\N
\.


--
-- Name: mailboxer_receipts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('mailboxer_receipts_id_seq', 29, true);


--
-- Data for Name: photos; Type: TABLE DATA; Schema: public; Owner: frcake
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
126	2017-11-25 23:37:18.905433	2017-11-25 23:37:18.905433	A-291800-1378625170-8333.jpeg.jpg	image/jpeg	52349	2017-11-25 23:37:18.668436	Artist	23
127	2017-11-25 23:39:10.831101	2017-11-25 23:39:10.831101	A-299677-1328553264.jpeg.jpg	image/jpeg	16194	2017-11-25 23:39:10.670098	Artist	25
128	2017-11-25 23:39:17.788998	2017-11-25 23:39:17.788998	A-682522-1382200699-8177.jpeg.jpg	image/jpeg	36199	2017-11-25 23:39:17.595748	Artist	26
129	2017-11-25 23:39:24.674902	2017-11-25 23:39:24.674902	A-76869-1311676407.jpeg.jpg	image/jpeg	9760	2017-11-25 23:39:24.529527	Artist	27
130	2017-11-25 23:39:37.869142	2017-11-25 23:39:37.869142	A-441372-1332020695.jpeg.jpg	image/jpeg	62498	2017-11-25 23:39:37.675615	Artist	29
131	2017-11-25 23:39:44.818722	2017-11-25 23:39:44.818722	A-98902-1133732433.jpeg.jpg	image/jpeg	29904	2017-11-25 23:39:44.640733	Artist	30
132	2017-11-25 23:39:51.880092	2017-11-25 23:39:51.880092	A-361777-1258620922.jpeg.jpg	image/jpeg	31006	2017-11-25 23:39:51.738585	Artist	31
133	2017-11-25 23:39:58.546839	2017-11-25 23:39:58.546839	A-195567-1107961445.jpg.jpg	image/jpeg	11572	2017-11-25 23:39:58.416019	Artist	32
134	2017-11-25 23:40:11.765162	2017-11-25 23:40:11.765162	A-205399-1360883227-7001.jpeg.jpg	image/jpeg	31105	2017-11-25 23:40:11.592091	Artist	34
135	2017-11-25 23:40:18.82871	2017-11-25 23:40:18.82871	A-676691-1412098288-1285.jpeg.jpg	image/jpeg	19283	2017-11-25 23:40:18.680363	Artist	35
136	2017-11-25 23:40:25.799763	2017-11-25 23:40:25.799763	A-267984-1378625647-2201.jpeg.jpg	image/jpeg	40873	2017-11-25 23:40:25.634518	Artist	36
137	2017-11-25 23:40:32.485606	2017-11-25 23:40:32.485606	A-157277-1328691972.jpeg.jpg	image/jpeg	9934	2017-11-25 23:40:32.362101	Artist	37
138	2017-11-25 23:40:39.895053	2017-11-25 23:40:39.895053	A-3487682-1382115473-9874.jpeg.jpg	image/jpeg	45049	2017-11-25 23:40:39.67523	Artist	38
139	2017-11-25 23:40:46.727533	2017-11-25 23:40:46.727533	A-399209-1307454981.jpeg.jpg	image/jpeg	21775	2017-11-25 23:40:46.566196	Artist	39
140	2017-11-25 23:40:53.888357	2017-11-25 23:40:53.888357	A-149049-1231846688.jpeg.jpg	image/jpeg	67575	2017-11-25 23:40:53.668494	Artist	40
141	2017-11-25 23:41:00.874614	2017-11-25 23:41:00.874614	A-276520-1318882404.jpeg.jpg	image/jpeg	29834	2017-11-25 23:41:00.723592	Artist	41
142	2017-11-25 23:41:07.504967	2017-11-25 23:41:07.504967	A-97916-1114033540.jpg.jpg	image/jpeg	9156	2017-11-25 23:41:07.386582	Artist	42
143	2017-11-25 23:41:14.481622	2017-11-25 23:41:14.481622	A-512044-1157552858.jpeg.jpg	image/jpeg	9391	2017-11-25 23:41:14.365306	Artist	43
144	2017-11-25 23:41:27.608924	2017-11-25 23:41:27.608924	A-407631-1146741557.jpeg.jpg	image/jpeg	41429	2017-11-25 23:41:27.440279	Artist	45
145	2017-11-25 23:41:34.646476	2017-11-25 23:41:34.646476	A-98903-1107961439.jpg.jpg	image/jpeg	15932	2017-11-25 23:41:34.503984	Artist	46
146	2017-11-25 23:41:41.779859	2017-11-25 23:41:41.779859	A-386307-1360682810-6131.jpeg.jpg	image/jpeg	30240	2017-11-25 23:41:41.594759	Artist	47
147	2017-11-25 23:41:49.293309	2017-11-25 23:41:49.293309	A-263425-1282410921.jpeg.jpg	image/jpeg	23747	2017-11-25 23:41:49.138204	Artist	48
148	2017-11-25 23:41:56.80102	2017-11-25 23:41:56.80102	A-752561-1331910847.jpeg.jpg	image/jpeg	22577	2017-11-25 23:41:56.646811	Artist	49
149	2017-11-25 23:42:03.556587	2017-11-25 23:42:03.556587	A-48397-1184185803.jpeg.jpg	image/jpeg	15926	2017-11-25 23:42:03.413273	Artist	50
150	2017-11-25 23:42:11.031147	2017-11-25 23:42:11.031147	A-298951-1157553026.jpeg.jpg	image/jpeg	64655	2017-11-25 23:42:10.781018	Artist	51
151	2017-11-25 23:42:17.84426	2017-11-25 23:42:17.84426	A-64652-1452436941-9571.jpeg.jpg	image/jpeg	122020	2017-11-25 23:42:17.556377	Artist	52
152	2017-11-25 23:42:24.753228	2017-11-25 23:42:24.753228	A-258119-1460025387-4426.jpeg.jpg	image/jpeg	89745	2017-11-25 23:42:24.514271	Artist	53
153	2017-11-25 23:42:31.746757	2017-11-25 23:42:31.746757	A-37735-1487625077-4239.jpeg.jpg	image/jpeg	85477	2017-11-25 23:42:31.511763	Artist	54
154	2017-11-25 23:42:38.793273	2017-11-25 23:42:38.793273	A-215920-1398171200-6512.jpeg.jpg	image/jpeg	25239	2017-11-25 23:42:38.654519	Artist	55
155	2017-11-25 23:42:45.809507	2017-11-25 23:42:45.809507	A-197740-1269389199.jpeg.jpg	image/jpeg	19599	2017-11-25 23:42:45.623065	Artist	56
156	2017-11-25 23:42:52.872105	2017-11-25 23:42:52.872105	A-29217-1440372781-1721.jpeg.jpg	image/jpeg	60561	2017-11-25 23:42:52.666855	Artist	57
157	2017-11-25 23:42:59.657219	2017-11-25 23:42:59.657219	A-301577-1269390457.jpeg.jpg	image/jpeg	10151	2017-11-25 23:42:59.510858	Artist	58
158	2017-11-25 23:43:06.663341	2017-11-25 23:43:06.663341	A-624905-1458800664-2947.jpeg.jpg	image/jpeg	11054	2017-11-25 23:43:06.532174	Artist	59
159	2017-11-25 23:43:13.713884	2017-11-25 23:43:13.713884	A-358514-1158409885.jpeg.jpg	image/jpeg	56255	2017-11-25 23:43:13.477851	Artist	60
160	2017-11-25 23:43:20.811787	2017-11-25 23:43:20.811787	A-1162459-1442329871-6146.jpeg.jpg	image/jpeg	44619	2017-11-25 23:43:20.629241	Artist	61
161	2017-11-25 23:43:27.953027	2017-11-25 23:43:27.953027	A-393222-1467196873-3374.jpeg.jpg	image/jpeg	59985	2017-11-25 23:43:27.747512	Artist	62
162	2017-11-25 23:43:35.036287	2017-11-25 23:43:35.036287	A-5120143-1467196109-6381.jpeg.jpg	image/jpeg	69511	2017-11-25 23:43:34.799393	Artist	63
163	2017-11-25 23:43:42.021479	2017-11-25 23:43:42.021479	A-151868-1410215372-7125.jpeg.jpg	image/jpeg	58509	2017-11-25 23:43:41.73729	Artist	64
164	2017-11-25 23:43:48.590409	2017-11-25 23:43:48.590409	A-317201-1223035924.jpeg.jpg	image/jpeg	28922	2017-11-25 23:43:48.437187	Artist	65
165	2017-11-25 23:43:55.502353	2017-11-25 23:43:55.502353	A-59554-1113748913.jpg.jpg	image/jpeg	11983	2017-11-25 23:43:55.375842	Artist	66
166	2017-11-25 23:44:02.846396	2017-11-25 23:44:02.846396	A-350015-1392203404-5007.jpeg.jpg	image/jpeg	39827	2017-11-25 23:44:02.666237	Artist	67
167	2017-11-25 23:44:10.942429	2017-11-25 23:44:10.942429	A-928459-1312313350.jpeg.jpg	image/jpeg	63676	2017-11-25 23:44:10.770953	Artist	68
168	2017-11-25 23:44:17.739233	2017-11-25 23:44:17.739233	A-45609-1155515770.jpeg.jpg	image/jpeg	38059	2017-11-25 23:44:17.514504	Artist	69
169	2017-11-25 23:44:24.725762	2017-11-25 23:44:24.725762	A-4612609-1442327867-1595.jpeg.jpg	image/jpeg	39130	2017-11-25 23:44:24.578033	Artist	70
170	2017-11-25 23:44:31.772968	2017-11-25 23:44:31.772968	A-2264-1475616095-7928.jpeg.jpg	image/jpeg	101259	2017-11-25 23:44:31.540513	Artist	71
171	2017-11-25 23:44:38.92629	2017-11-25 23:44:38.92629	A-70129-1360719318-3237.jpeg.jpg	image/jpeg	72165	2017-11-25 23:44:38.707216	Artist	72
172	2017-11-25 23:44:45.773346	2017-11-25 23:44:45.773346	A-38006-1361374942-1383.jpeg.jpg	image/jpeg	42781	2017-11-25 23:44:45.620125	Artist	73
173	2017-11-25 23:44:52.572681	2017-11-25 23:44:52.572681	A-238189-1414911678-4529.jpeg.jpg	image/jpeg	29724	2017-11-25 23:44:52.426874	Artist	74
174	2017-11-25 23:44:59.708901	2017-11-25 23:44:59.708901	A-2125242-1436898391-1749.jpeg.jpg	image/jpeg	15409	2017-11-25 23:44:59.568283	Artist	75
175	2017-11-25 23:45:06.575092	2017-11-25 23:45:06.575092	A-29345-001.jpg.jpg	image/jpeg	21972	2017-11-25 23:45:06.419884	Artist	76
176	2017-11-25 23:45:14.024	2017-11-25 23:45:14.024	A-360636-1223034126.jpeg.jpg	image/jpeg	32946	2017-11-25 23:45:13.835888	Artist	77
177	2017-11-25 23:45:23.64734	2017-11-25 23:45:23.64734	A-56360-1331572055.gif.jpg	image/jpeg	13235	2017-11-25 23:45:23.525684	Artist	78
178	2017-11-25 23:45:30.581791	2017-11-25 23:45:30.581791	A-42016-1223033411.jpeg.jpg	image/jpeg	20054	2017-11-25 23:45:30.427071	Artist	79
179	2017-11-25 23:45:37.838972	2017-11-25 23:45:37.838972	A-115515-1174263878.jpeg.jpg	image/jpeg	61157	2017-11-25 23:45:37.664554	Artist	80
180	2017-11-25 23:45:44.732162	2017-11-25 23:45:44.732162	A-266673-1283394585.jpeg.jpg	image/jpeg	15812	2017-11-25 23:45:44.56862	Artist	81
181	2017-11-25 23:45:51.696705	2017-11-25 23:45:51.696705	A-64833-001.jpg.jpg	image/jpeg	14431	2017-11-25 23:45:51.579117	Artist	82
182	2017-11-25 23:45:58.71993	2017-11-25 23:45:58.71993	A-1793603-1449579201-3622.jpeg.jpg	image/jpeg	49995	2017-11-25 23:45:58.525398	Artist	83
183	2017-11-25 23:46:05.849733	2017-11-25 23:46:05.849733	A-426121-1429827899-6055.jpeg.jpg	image/jpeg	54546	2017-11-25 23:46:05.674883	Artist	84
184	2017-11-25 23:46:12.574348	2017-11-25 23:46:12.574348	A-126446-1278303066.jpeg.jpg	image/jpeg	15526	2017-11-25 23:46:12.42298	Artist	85
185	2017-11-25 23:46:19.794599	2017-11-25 23:46:19.794599	A-570563-1223027451.jpeg.jpg	image/jpeg	25031	2017-11-25 23:46:19.622609	Artist	86
186	2017-11-25 23:46:26.552298	2017-11-25 23:46:26.552298	A-71241-1255888305.jpeg.jpg	image/jpeg	15227	2017-11-25 23:46:26.43234	Artist	87
187	2017-11-25 23:46:33.549962	2017-11-25 23:46:33.549962	A-274926-1135185707.gif.jpg	image/jpeg	16535	2017-11-25 23:46:33.430851	Artist	88
188	2017-11-25 23:46:46.715024	2017-11-25 23:46:46.715024	A-1033472-1440868981-6686.jpeg.jpg	image/jpeg	11374	2017-11-25 23:46:46.589616	Artist	90
189	2017-11-25 23:46:53.679182	2017-11-25 23:46:53.679182	A-89921-1255888362.jpeg.jpg	image/jpeg	14137	2017-11-25 23:46:53.557242	Artist	91
190	2017-11-25 23:47:00.865517	2017-11-25 23:47:00.865517	A-305424-1223033627.jpeg.jpg	image/jpeg	25774	2017-11-25 23:47:00.691374	Artist	92
191	2017-11-25 23:47:07.597035	2017-11-25 23:47:07.597035	A-56747-1477128681-3471.jpeg.jpg	image/jpeg	35600	2017-11-25 23:47:07.424807	Artist	93
192	2017-11-25 23:47:14.896438	2017-11-25 23:47:14.896438	A-349436-1278445934.jpeg.jpg	image/jpeg	48564	2017-11-25 23:47:14.712861	Artist	94
193	2017-11-25 23:47:21.711525	2017-11-25 23:47:21.711525	A-126444-1391786427-1980.jpeg.jpg	image/jpeg	17206	2017-11-25 23:47:21.562521	Artist	95
194	2017-11-25 23:47:28.656893	2017-11-25 23:47:28.656893	A-358848-1379500580-8722.jpeg.jpg	image/jpeg	4085	2017-11-25 23:47:28.541912	Artist	96
195	2017-11-25 23:47:35.809397	2017-11-25 23:47:35.809397	A-256073-1417593276-6056.jpeg.jpg	image/jpeg	28056	2017-11-25 23:47:35.661126	Artist	97
196	2017-11-25 23:47:42.595849	2017-11-25 23:47:42.595849	A-55734-1284909696.jpeg.jpg	image/jpeg	22948	2017-11-25 23:47:42.424987	Artist	98
197	2017-11-25 23:47:49.830815	2017-11-25 23:47:49.830815	A-190449-1223034617.jpeg.jpg	image/jpeg	21876	2017-11-25 23:47:49.699934	Artist	99
198	2017-11-25 23:47:56.769375	2017-11-25 23:47:56.769375	A-21988-1174556551.jpeg.jpg	image/jpeg	37477	2017-11-25 23:47:56.626104	Artist	100
199	2017-11-25 23:48:03.487239	2017-11-25 23:48:03.487239	A-95091-1187260994.jpeg.jpg	image/jpeg	8106	2017-11-25 23:48:03.372943	Artist	101
200	2017-11-25 23:48:10.779472	2017-11-25 23:48:10.779472	A-260630-1152309425.jpeg.jpg	image/jpeg	9471	2017-11-25 23:48:10.650501	Artist	102
201	2017-11-25 23:48:17.767383	2017-11-25 23:48:17.767383	A-832444-1467197003-3747.jpeg.jpg	image/jpeg	101402	2017-11-25 23:48:17.531415	Artist	103
202	2017-11-25 23:48:24.814094	2017-11-25 23:48:24.814094	A-293100-1462367132-5080.jpeg.jpg	image/jpeg	18201	2017-11-25 23:48:24.671756	Artist	104
203	2017-11-25 23:48:31.557531	2017-11-25 23:48:31.557531	A-200704-1115123602.jpg.jpg	image/jpeg	17766	2017-11-25 23:48:31.437284	Artist	105
204	2017-11-25 23:48:45.684965	2017-11-25 23:48:45.684965	A-3711522-1393628248-4737.jpeg.jpg	image/jpeg	14368	2017-11-25 23:48:45.576941	Artist	107
205	2017-11-25 23:48:53.830002	2017-11-25 23:48:53.830002	A-394295-1183244451.jpeg.jpg	image/jpeg	24681	2017-11-25 23:48:53.67358	Artist	108
206	2017-11-25 23:49:00.716849	2017-11-25 23:49:00.716849	A-313879-1122585424.jpg.jpg	image/jpeg	21734	2017-11-25 23:49:00.558841	Artist	109
207	2017-11-25 23:49:08.023955	2017-11-25 23:49:08.023955	A-341232-1126018314.jpeg.jpg	image/jpeg	46689	2017-11-25 23:49:07.825601	Artist	110
208	2017-11-25 23:49:14.929926	2017-11-25 23:49:14.929926	A-252118-1124311224.jpg.jpg	image/jpeg	53635	2017-11-25 23:49:14.741641	Artist	111
209	2017-11-25 23:49:21.647075	2017-11-25 23:49:21.647075	A-360623-1194901544.jpeg.jpg	image/jpeg	12123	2017-11-25 23:49:21.520798	Artist	112
210	2017-11-25 23:49:28.905899	2017-11-25 23:49:28.905899	A-330646-1122584388.jpg.jpg	image/jpeg	49240	2017-11-25 23:49:28.715653	Artist	113
211	2017-11-25 23:49:36.824094	2017-11-25 23:49:36.824094	A-495503-1478079218-5450.jpeg.jpg	image/jpeg	49711	2017-11-25 23:49:36.641518	Artist	114
212	2017-11-25 23:49:43.720324	2017-11-25 23:49:43.720324	A-33453-1229130068.jpeg.jpg	image/jpeg	24410	2017-11-25 23:49:43.576185	Artist	115
213	2017-11-25 23:49:50.77813	2017-11-25 23:49:50.77813	A-349596-1145399527.jpeg.jpg	image/jpeg	16356	2017-11-25 23:49:50.656242	Artist	116
214	2017-11-25 23:49:57.999683	2017-11-25 23:49:57.999683	A-520910-1249560250.jpeg.jpg	image/jpeg	84385	2017-11-25 23:49:57.783664	Artist	117
215	2017-11-25 23:50:04.743102	2017-11-25 23:50:04.743102	A-44797-1145403012.jpeg.jpg	image/jpeg	21636	2017-11-25 23:50:04.612743	Artist	118
216	2017-11-25 23:50:11.662788	2017-11-25 23:50:11.662788	A-364982-1147236422.jpeg.jpg	image/jpeg	52746	2017-11-25 23:50:11.489102	Artist	119
217	2017-11-25 23:50:18.729645	2017-11-25 23:50:18.729645	A-251808-1142354544.jpeg.jpg	image/jpeg	68117	2017-11-25 23:50:18.520382	Artist	120
218	2017-11-25 23:50:25.710217	2017-11-25 23:50:25.710217	A-251874-1233102826.jpeg.jpg	image/jpeg	85366	2017-11-25 23:50:25.515043	Artist	121
219	2017-11-25 23:50:32.658868	2017-11-25 23:50:32.658868	A-390503-1357070736-2534.jpeg.jpg	image/jpeg	45428	2017-11-25 23:50:32.484104	Artist	122
220	2017-11-25 23:50:39.744495	2017-11-25 23:50:39.744495	A-18836-1104656726.jpg.jpg	image/jpeg	24210	2017-11-25 23:50:39.585212	Artist	123
221	2017-11-25 23:50:46.640746	2017-11-25 23:50:46.640746	A-479665-1203567589.jpeg.jpg	image/jpeg	8403	2017-11-25 23:50:46.517538	Artist	21
222	2017-11-25 23:50:59.6832	2017-11-25 23:50:59.6832	A-291800-1378625170-8333.jpeg.jpg	image/jpeg	52349	2017-11-25 23:50:59.476628	Artist	23
223	2017-11-25 23:51:12.56598	2017-11-25 23:51:12.56598	A-251550-1104656434.jpg.jpg	image/jpeg	24542	2017-11-25 23:51:12.42713	Artist	124
224	2017-11-25 23:51:19.489284	2017-11-25 23:51:19.489284	A-648330-1281966330.jpeg.jpg	image/jpeg	8857	2017-11-25 23:51:19.373385	Artist	125
225	2017-11-25 23:51:26.778412	2017-11-25 23:51:26.778412	A-490079-1147362673.jpeg.jpg	image/jpeg	41856	2017-11-25 23:51:26.600899	Artist	126
226	2017-11-25 23:51:33.754265	2017-11-25 23:51:33.754265	A-509874-1487751019-9213.jpeg.jpg	image/jpeg	99667	2017-11-25 23:51:33.538824	Artist	127
227	2017-11-25 23:51:40.753908	2017-11-25 23:51:40.753908	A-381678-1326489526.jpeg.jpg	image/jpeg	27582	2017-11-25 23:51:40.595349	Artist	128
228	2017-11-25 23:51:47.828768	2017-11-25 23:51:47.828768	A-2932368-1363260870-7701.jpeg.jpg	image/jpeg	30020	2017-11-25 23:51:47.68666	Artist	129
229	2017-11-25 23:51:54.564305	2017-11-25 23:51:54.564305	A-277359-1438885431-5497.jpeg.jpg	image/jpeg	17963	2017-11-25 23:51:54.408092	Artist	130
230	2017-11-25 23:52:01.940138	2017-11-25 23:52:01.940138	A-3442362-1458167779-5553.jpeg.jpg	image/jpeg	57698	2017-11-25 23:52:01.729082	Artist	131
231	2017-11-25 23:52:08.582534	2017-11-25 23:52:08.582534	A-260980-1233057152.jpeg.jpg	image/jpeg	25866	2017-11-25 23:52:08.439444	Artist	132
232	2017-11-25 23:52:15.607153	2017-11-25 23:52:15.607153	A-397978-1233101983.jpeg.jpg	image/jpeg	40008	2017-11-25 23:52:15.456805	Artist	133
233	2017-11-25 23:52:22.764025	2017-11-25 23:52:22.764025	A-289776-1137022542.jpeg.jpg	image/jpeg	65707	2017-11-25 23:52:22.538199	Artist	134
234	2017-11-25 23:52:29.576502	2017-11-25 23:52:29.576502	A-502260-1284510759.jpeg.jpg	image/jpeg	29560	2017-11-25 23:52:29.423	Artist	135
235	2017-11-25 23:52:36.532159	2017-11-25 23:52:36.532159	A-4137524-1418019426-7220.jpeg.jpg	image/jpeg	15228	2017-11-25 23:52:36.410677	Artist	136
236	2017-11-25 23:52:43.779508	2017-11-25 23:52:43.779508	A-1647949-1277057109.jpeg.jpg	image/jpeg	38073	2017-11-25 23:52:43.607244	Artist	137
237	2017-11-25 23:52:50.682276	2017-11-25 23:52:50.682276	A-260982-1233100931.jpeg.jpg	image/jpeg	42945	2017-11-25 23:52:50.507381	Artist	138
238	2017-11-25 23:52:57.556698	2017-11-25 23:52:57.556698	A-260848-1109701780.jpg.jpg	image/jpeg	13529	2017-11-25 23:52:57.437415	Artist	139
239	2017-11-25 23:53:04.985579	2017-11-25 23:53:04.985579	A-3161943-1443607603-2006.jpeg.jpg	image/jpeg	78602	2017-11-25 23:53:04.775025	Artist	140
240	2017-11-25 23:53:11.739765	2017-11-25 23:53:11.739765	A-397979-1427376618-2146.jpeg.jpg	image/jpeg	92024	2017-11-25 23:53:11.51486	Artist	141
241	2017-11-25 23:53:18.598796	2017-11-25 23:53:18.598796	A-1032720-1276707506.jpeg.jpg	image/jpeg	36583	2017-11-25 23:53:18.440376	Artist	142
242	2017-11-25 23:53:26.057823	2017-11-25 23:53:26.057823	A-3974765-1430723765-3895.jpeg.jpg	image/jpeg	79485	2017-11-25 23:53:25.838395	Artist	143
243	2017-11-25 23:53:32.943397	2017-11-25 23:53:32.943397	A-1961662-1285861853.jpeg.jpg	image/jpeg	68769	2017-11-25 23:53:32.750277	Artist	144
244	2017-11-25 23:53:40.648267	2017-11-25 23:53:40.648267	A-254418-1233100145.jpeg.jpg	image/jpeg	49244	2017-11-25 23:53:40.480692	Artist	145
245	2017-11-25 23:53:47.766434	2017-11-25 23:53:47.766434	A-4388508-1430723717-1169.jpeg.jpg	image/jpeg	17854	2017-11-25 23:53:47.636134	Artist	146
246	2017-11-25 23:53:55.025245	2017-11-25 23:53:55.025245	A-3650780-1418019251-7099.jpeg.jpg	image/jpeg	81290	2017-11-25 23:53:54.826059	Artist	147
247	2017-11-25 23:54:03.128641	2017-11-25 23:54:03.128641	A-2432721-1365750334-5867.jpeg.jpg	image/jpeg	41173	2017-11-25 23:54:02.866005	Artist	148
248	2017-11-25 23:54:10.836926	2017-11-25 23:54:10.836926	A-691941-1456717937-5915.jpeg.jpg	image/jpeg	26039	2017-11-25 23:54:10.674192	Artist	149
249	2017-11-25 23:54:17.90293	2017-11-25 23:54:17.90293	A-5974162-1504208302-6775.jpeg.jpg	image/jpeg	29967	2017-11-25 23:54:17.738637	Artist	150
250	2017-11-25 23:54:24.82722	2017-11-25 23:54:24.82722	A-448986-1150639114.jpeg.jpg	image/jpeg	25843	2017-11-25 23:54:24.677801	Artist	151
251	2017-11-25 23:54:31.631114	2017-11-25 23:54:31.631114	A-255017-1106050584.jpg.jpg	image/jpeg	41604	2017-11-25 23:54:31.46273	Artist	152
252	2017-11-25 23:54:38.740398	2017-11-25 23:54:38.740398	A-270158-1133501086.jpeg.jpg	image/jpeg	16084	2017-11-25 23:54:38.614283	Artist	153
253	2017-11-25 23:54:45.757653	2017-11-25 23:54:45.757653	A-428900-1144922224.jpeg.jpg	image/jpeg	27680	2017-11-25 23:54:45.606091	Artist	154
254	2017-11-25 23:54:52.732947	2017-11-25 23:54:52.732947	A-253219-1355950363-4666.jpeg.jpg	image/jpeg	60550	2017-11-25 23:54:52.502656	Artist	155
255	2017-11-25 23:54:59.934962	2017-11-25 23:54:59.934962	A-502029-1477912881-8402.jpeg.jpg	image/jpeg	40555	2017-11-25 23:54:59.764779	Artist	156
256	2017-11-25 23:55:06.612077	2017-11-25 23:55:06.612077	A-649022-1391350444-1641.jpeg.jpg	image/jpeg	26353	2017-11-25 23:55:06.430418	Artist	157
257	2017-11-25 23:55:13.761758	2017-11-25 23:55:13.761758	A-1585234-1437986032-7132.jpeg.jpg	image/jpeg	24966	2017-11-25 23:55:13.625059	Artist	158
258	2017-11-25 23:55:20.809648	2017-11-25 23:55:20.809648	A-321792-1132527817.jpeg.jpg	image/jpeg	47606	2017-11-25 23:55:20.64606	Artist	159
259	2017-11-25 23:55:27.969932	2017-11-25 23:55:27.969932	A-277590-1385767995-6165.jpeg.jpg	image/jpeg	187944	2017-11-25 23:55:27.726344	Artist	160
260	2017-11-25 23:55:34.591208	2017-11-25 23:55:34.591208	A-300663-1124802044.jpg.jpg	image/jpeg	24458	2017-11-25 23:55:34.436567	Artist	161
261	2017-11-25 23:55:41.712951	2017-11-25 23:55:41.712951	A-427408-1499711404-8739.jpeg.jpg	image/jpeg	67793	2017-11-25 23:55:41.500754	Artist	162
262	2017-11-25 23:55:48.843254	2017-11-25 23:55:48.843254	A-882233-1437986697-6454.jpeg.jpg	image/jpeg	49813	2017-11-25 23:55:48.70167	Artist	163
263	2017-11-25 23:55:55.693085	2017-11-25 23:55:55.693085	A-267270-1128180615.jpeg.jpg	image/jpeg	44822	2017-11-25 23:55:55.519419	Artist	164
264	2017-11-25 23:56:02.615655	2017-11-25 23:56:02.615655	A-610653-1437986820-9381.jpeg.jpg	image/jpeg	11303	2017-11-25 23:56:02.503098	Artist	165
265	2017-11-25 23:56:09.609546	2017-11-25 23:56:09.609546	A-349634-1258920712.jpeg.jpg	image/jpeg	30099	2017-11-25 23:56:09.470171	Artist	166
266	2017-11-25 23:56:16.926885	2017-11-25 23:56:16.926885	A-1459732-1290446626.jpeg.jpg	image/jpeg	80306	2017-11-25 23:56:16.645664	Artist	167
267	2017-11-25 23:56:23.880195	2017-11-25 23:56:23.880195	A-277038-1330192967.jpeg.jpg	image/jpeg	39744	2017-11-25 23:56:23.682823	Artist	168
268	2017-11-25 23:56:30.796381	2017-11-25 23:56:30.796381	A-253211-1124802753.jpg.jpg	image/jpeg	14528	2017-11-25 23:56:30.658744	Artist	169
269	2017-11-25 23:56:37.713517	2017-11-25 23:56:37.713517	A-59770-1472174107-2417.jpeg.jpg	image/jpeg	61541	2017-11-25 23:56:37.522948	Artist	170
270	2017-11-25 23:56:44.893145	2017-11-25 23:56:44.893145	A-459280-1160572016.jpeg.jpg	image/jpeg	46413	2017-11-25 23:56:44.738248	Artist	171
271	2017-11-25 23:56:51.724139	2017-11-25 23:56:51.724139	A-312416-1198686158.jpeg.jpg	image/jpeg	25173	2017-11-25 23:56:51.590943	Artist	172
272	2017-11-25 23:56:58.934615	2017-11-25 23:56:58.934615	A-289850-1462829346-8826.jpeg.jpg	image/jpeg	222188	2017-11-25 23:56:58.612154	Artist	173
273	2017-11-25 23:57:05.850893	2017-11-25 23:57:05.850893	A-253791-1436277318-1194.jpeg.jpg	image/jpeg	134780	2017-11-25 23:57:05.581959	Artist	174
274	2017-11-25 23:57:12.735973	2017-11-25 23:57:12.735973	A-531831-1456324507-9815.jpeg.jpg	image/jpeg	66299	2017-11-25 23:57:12.525705	Artist	175
275	2017-11-25 23:57:20.084477	2017-11-25 23:57:20.084477	A-271505-1487806576-6219.jpeg.jpg	image/jpeg	85853	2017-11-25 23:57:19.82054	Artist	176
276	2017-11-25 23:57:26.639113	2017-11-25 23:57:26.639113	A-679095-1196036320.jpeg.jpg	image/jpeg	42415	2017-11-25 23:57:26.480689	Artist	177
277	2017-11-25 23:57:34.158559	2017-11-25 23:57:34.158559	A-892658-1487806964-9614.jpeg.jpg	image/jpeg	104436	2017-11-25 23:57:33.909319	Artist	178
278	2017-11-25 23:57:41.71274	2017-11-25 23:57:41.71274	A-410707-1427585157-2276.jpeg.jpg	image/jpeg	22243	2017-11-25 23:57:41.588689	Artist	179
279	2017-11-25 23:57:48.695093	2017-11-25 23:57:48.695093	A-410952-1399018561-9016.jpeg.jpg	image/jpeg	15440	2017-11-25 23:57:48.572253	Artist	180
280	2017-11-25 23:57:55.720881	2017-11-25 23:57:55.720881	A-251808-1142354544.jpeg.jpg	image/jpeg	68117	2017-11-25 23:57:55.492092	Artist	181
281	2017-11-25 23:58:02.767671	2017-11-25 23:58:02.767671	A-374278-1133838688.jpeg.jpg	image/jpeg	33265	2017-11-25 23:58:02.601712	Artist	182
282	2017-11-25 23:58:15.58653	2017-11-25 23:58:15.58653	A-722149-1270138380.jpeg.jpg	image/jpeg	29091	2017-11-25 23:58:15.442379	Artist	184
283	2017-11-25 23:58:22.866936	2017-11-25 23:58:22.866936	A-410706-1487807654-6464.jpeg.jpg	image/jpeg	122815	2017-11-25 23:58:22.543054	Artist	185
284	2017-11-25 23:58:29.90578	2017-11-25 23:58:29.90578	A-352849-1487807897-1919.jpeg.jpg	image/jpeg	51945	2017-11-25 23:58:29.727744	Artist	186
285	2017-11-25 23:58:36.76337	2017-11-25 23:58:36.76337	A-1584605-1297594062.jpeg.jpg	image/jpeg	37040	2017-11-25 23:58:36.599199	Artist	187
286	2017-11-25 23:58:43.766659	2017-11-25 23:58:43.766659	A-299762-1151989654.jpeg.jpg	image/jpeg	36409	2017-11-25 23:58:43.619088	Artist	188
287	2017-11-25 23:58:50.927816	2017-11-25 23:58:50.927816	A-450337-1173566237.jpeg.jpg	image/jpeg	122641	2017-11-25 23:58:50.70076	Artist	189
288	2017-11-25 23:58:57.981546	2017-11-25 23:58:57.981546	A-407059-1417292636-1740.jpeg.jpg	image/jpeg	71141	2017-11-25 23:58:57.759605	Artist	190
289	2017-11-25 23:59:04.995203	2017-11-25 23:59:04.995203	A-410394-1487896106-2267.jpeg.jpg	image/jpeg	39523	2017-11-25 23:59:04.814662	Artist	191
290	2017-11-25 23:59:11.71238	2017-11-25 23:59:11.71238	A-410710-1133838126.jpeg.jpg	image/jpeg	27710	2017-11-25 23:59:11.578876	Artist	192
291	2017-11-25 23:59:18.587963	2017-11-25 23:59:18.587963	A-251588-1435148396-1281.jpeg.jpg	image/jpeg	19496	2017-11-25 23:59:18.450672	Artist	193
292	2017-11-25 23:59:25.620765	2017-11-25 23:59:25.620765	A-1257415-1401685629-5686.jpeg.jpg	image/jpeg	5332	2017-11-25 23:59:25.51475	Artist	194
293	2017-11-25 23:59:32.669755	2017-11-25 23:59:32.669755	A-3052783-1487895727-4717.jpeg.jpg	image/jpeg	46167	2017-11-25 23:59:32.48453	Artist	195
294	2017-11-25 23:59:39.904747	2017-11-25 23:59:39.904747	A-277594-1421784652-5183.jpeg.jpg	image/jpeg	75486	2017-11-25 23:59:39.680835	Artist	196
295	2017-11-25 23:59:46.560799	2017-11-25 23:59:46.560799	A-410708-1133837750.jpeg.jpg	image/jpeg	25152	2017-11-25 23:59:46.429816	Artist	197
296	2017-11-25 23:59:53.898258	2017-11-25 23:59:53.898258	A-768786-1487895341-7075.jpeg.jpg	image/jpeg	94764	2017-11-25 23:59:53.688414	Artist	198
297	2017-11-26 00:00:00.474007	2017-11-26 00:00:00.474007	A-706516-1191774194.jpeg.jpg	image/jpeg	6389	2017-11-26 00:00:00.357664	Artist	199
298	2017-11-26 00:00:15.716732	2017-11-26 00:00:15.716732	A-209723-1112813706.jpg.jpg	image/jpeg	14744	2017-11-26 00:00:15.576239	Artist	200
299	2017-11-26 00:00:22.633934	2017-11-26 00:00:22.633934	A-84214-1108227227.jpg.jpg	image/jpeg	5437	2017-11-26 00:00:22.527341	Artist	201
300	2017-11-26 00:00:29.818185	2017-11-26 00:00:29.818185	A-268332-1446757016-7876.jpeg.jpg	image/jpeg	122130	2017-11-26 00:00:29.580037	Artist	202
301	2017-11-26 00:00:36.726505	2017-11-26 00:00:36.726505	A-396289-1148287520.jpeg.jpg	image/jpeg	80113	2017-11-26 00:00:36.515971	Artist	203
302	2017-11-26 00:00:43.458413	2017-11-26 00:00:43.458413	A-571249-1349938870-5346.jpeg.jpg	image/jpeg	8197	2017-11-26 00:00:43.35131	Artist	204
303	2017-11-26 00:00:50.899223	2017-11-26 00:00:50.899223	A-268328-1446766135-2973.jpeg.jpg	image/jpeg	82236	2017-11-26 00:00:50.69729	Artist	205
304	2017-11-26 00:00:57.700892	2017-11-26 00:00:57.700892	A-480798-1399582553-2954.jpeg.jpg	image/jpeg	83218	2017-11-26 00:00:57.507816	Artist	206
305	2017-11-26 00:01:04.67294	2017-11-26 00:01:04.67294	A-1968957-1446768081-4023.jpeg.jpg	image/jpeg	51903	2017-11-26 00:01:04.483589	Artist	207
306	2017-11-26 00:01:11.703762	2017-11-26 00:01:11.703762	A-523097-1446925596-6606.jpeg.jpg	image/jpeg	45346	2017-11-26 00:01:11.516341	Artist	208
307	2017-11-26 00:01:18.574853	2017-11-26 00:01:18.574853	A-260687-1147640690.jpeg.jpg	image/jpeg	18446	2017-11-26 00:01:18.432049	Artist	209
308	2017-11-26 00:01:25.935488	2017-11-26 00:01:25.935488	A-369969-1446837324-1314.jpeg.jpg	image/jpeg	126374	2017-11-26 00:01:25.702617	Artist	210
309	2017-11-26 00:01:32.591327	2017-11-26 00:01:32.591327	A-180585-1398550727-7700.jpeg.jpg	image/jpeg	22835	2017-11-26 00:01:32.449724	Artist	211
310	2017-11-26 00:01:45.724234	2017-11-26 00:01:45.724234	A-457468-1240587493.jpeg.jpg	image/jpeg	20211	2017-11-26 00:01:45.581996	Artist	213
311	2017-11-26 00:01:52.622696	2017-11-26 00:01:52.622696	A-180586-1106276373.jpg.jpg	image/jpeg	29382	2017-11-26 00:01:52.463625	Artist	214
312	2017-11-26 00:01:59.858501	2017-11-26 00:01:59.858501	A-243955-1398172390-7597.jpeg.jpg	image/jpeg	99056	2017-11-26 00:01:59.587869	Artist	215
313	2017-11-26 00:02:06.721394	2017-11-26 00:02:06.721394	A-46481-1504039258-4474.jpeg.jpg	image/jpeg	74544	2017-11-26 00:02:06.526229	Artist	216
314	2017-11-26 00:02:13.734834	2017-11-26 00:02:13.734834	A-35301-1319382601.jpeg.jpg	image/jpeg	59839	2017-11-26 00:02:13.514268	Artist	217
315	2017-11-26 00:02:20.464602	2017-11-26 00:02:20.464602	A-337031-1419703775-3656.jpeg.jpg	image/jpeg	7777	2017-11-26 00:02:20.342205	Artist	218
316	2017-11-26 00:02:27.823268	2017-11-26 00:02:27.823268	A-298525-1222451398.jpeg.jpg	image/jpeg	140999	2017-11-26 00:02:27.567692	Artist	219
317	2017-11-26 00:02:34.549714	2017-11-26 00:02:34.549714	A-459513-1188155998.jpeg.jpg	image/jpeg	16720	2017-11-26 00:02:34.428844	Artist	220
318	2017-11-26 00:02:41.702199	2017-11-26 00:02:41.702199	A-110863-1451308577-2780.jpeg.jpg	image/jpeg	74318	2017-11-26 00:02:41.512461	Artist	221
319	2017-11-26 00:02:49.048546	2017-11-26 00:02:49.048546	A-246097-1345122087-7320.jpeg.jpg	image/jpeg	68657	2017-11-26 00:02:48.83795	Artist	222
320	2017-11-26 00:02:55.761671	2017-11-26 00:02:55.761671	A-110861-1345121273-9059.jpeg.jpg	image/jpeg	69274	2017-11-26 00:02:55.526135	Artist	223
321	2017-11-26 00:03:02.860965	2017-11-26 00:03:02.860965	A-110862-1345124161-4797.jpeg.jpg	image/jpeg	122515	2017-11-26 00:03:02.587947	Artist	224
322	2017-11-26 00:03:09.848234	2017-11-26 00:03:09.848234	A-178489-1373374392-9838.jpeg.jpg	image/jpeg	158036	2017-11-26 00:03:09.574766	Artist	225
323	2017-11-26 00:03:16.684333	2017-11-26 00:03:16.684333	A-2845807-1362400951-9645.jpeg.jpg	image/jpeg	53057	2017-11-26 00:03:16.481021	Artist	226
324	2017-11-26 00:03:23.7396	2017-11-26 00:03:23.7396	A-253217-1453728236-1990.jpeg.jpg	image/jpeg	73413	2017-11-26 00:03:23.514778	Artist	227
325	2017-11-26 00:03:30.789069	2017-11-26 00:03:30.789069	A-79949-1486060997-2610.jpeg.jpg	image/jpeg	80371	2017-11-26 00:03:30.52781	Artist	228
326	2017-11-26 00:03:37.676881	2017-11-26 00:03:37.676881	A-268365-1353259946-7350.jpeg.jpg	image/jpeg	37598	2017-11-26 00:03:37.46212	Artist	229
327	2017-11-26 00:03:44.595903	2017-11-26 00:03:44.595903	A-208268-1311886821.jpeg.jpg	image/jpeg	40427	2017-11-26 00:03:44.435015	Artist	230
328	2017-11-26 00:03:51.830995	2017-11-26 00:03:51.830995	A-273544-1443424766-5322.jpeg.jpg	image/jpeg	99517	2017-11-26 00:03:51.575871	Artist	231
329	2017-11-26 00:03:58.687942	2017-11-26 00:03:58.687942	A-329360-1428258954-5153.jpeg.jpg	image/jpeg	43567	2017-11-26 00:03:58.480802	Artist	232
330	2017-11-26 00:04:05.675611	2017-11-26 00:04:05.675611	A-460050-1160046028.jpeg.jpg	image/jpeg	39846	2017-11-26 00:04:05.495364	Artist	233
331	2017-11-26 00:04:12.545398	2017-11-26 00:04:12.545398	A-402566-1182164882.jpeg.jpg	image/jpeg	15267	2017-11-26 00:04:12.410424	Artist	234
332	2017-11-26 00:04:19.939842	2017-11-26 00:04:19.939842	A-333018-1449861042-3720.jpeg.jpg	image/jpeg	75369	2017-11-26 00:04:19.673076	Artist	235
333	2017-11-26 00:04:26.636511	2017-11-26 00:04:26.636511	A-402564-1182165437.jpeg.jpg	image/jpeg	40696	2017-11-26 00:04:26.445515	Artist	236
334	2017-11-26 00:04:33.496788	2017-11-26 00:04:33.496788	A-707363-1440316114-6801.jpeg.jpg	image/jpeg	12043	2017-11-26 00:04:33.369295	Artist	237
335	2017-11-26 00:04:40.74216	2017-11-26 00:04:40.74216	A-501438-1494152490-7314.jpeg.jpg	image/jpeg	31369	2017-11-26 00:04:40.607774	Artist	238
336	2017-11-26 00:04:47.495161	2017-11-26 00:04:47.495161	A-1025123-1222035744.jpeg.jpg	image/jpeg	13203	2017-11-26 00:04:47.356221	Artist	239
337	2017-11-26 00:04:54.680426	2017-11-26 00:04:54.680426	A-273543-1143902129.jpeg.jpg	image/jpeg	61138	2017-11-26 00:04:54.492021	Artist	240
338	2017-11-26 00:05:01.517901	2017-11-26 00:05:01.517901	A-522400-1210178097.jpeg.jpg	image/jpeg	13605	2017-11-26 00:05:01.408494	Artist	241
339	2017-11-26 00:05:08.591511	2017-11-26 00:05:08.591511	A-3879385-1440316323-4133.jpeg.jpg	image/jpeg	23966	2017-11-26 00:05:08.426494	Artist	242
340	2017-11-26 00:05:15.631012	2017-11-26 00:05:15.631012	A-402565-1182165288.jpeg.jpg	image/jpeg	30689	2017-11-26 00:05:15.476887	Artist	243
341	2017-11-26 00:05:23.563671	2017-11-26 00:05:23.563671	A-3879386-1440316521-3688.jpeg.jpg	image/jpeg	13763	2017-11-26 00:05:23.412914	Artist	244
342	2017-11-26 00:05:30.568184	2017-11-26 00:05:30.568184	A-707195-1210178148.jpeg.jpg	image/jpeg	16292	2017-11-26 00:05:30.419962	Artist	245
343	2017-11-26 00:05:37.53089	2017-11-26 00:05:37.53089	A-1137399-1348091379-6948.jpeg.jpg	image/jpeg	13863	2017-11-26 00:05:37.418751	Artist	246
344	2017-11-26 00:05:45.006723	2017-11-26 00:05:45.006723	A-2047853-1465889460-1396.jpeg.jpg	image/jpeg	118724	2017-11-26 00:05:44.739672	Artist	247
345	2017-11-26 00:05:51.742412	2017-11-26 00:05:51.742412	A-253702-1428410902-5494.jpeg.jpg	image/jpeg	68487	2017-11-26 00:05:51.510669	Artist	248
346	2017-11-26 00:05:58.598394	2017-11-26 00:05:58.598394	A-256141-1343488095-1792.jpeg.jpg	image/jpeg	37251	2017-11-26 00:05:58.447466	Artist	249
347	2017-11-26 00:06:05.776148	2017-11-26 00:06:05.776148	A-346661-1439040044-1041.jpeg.jpg	image/jpeg	24418	2017-11-26 00:06:05.619908	Artist	250
348	2017-11-26 00:06:13.59352	2017-11-26 00:06:13.59352	A-916825-1208277237.jpeg.jpg	image/jpeg	38099	2017-11-26 00:06:13.413217	Artist	251
349	2017-11-26 00:06:20.728981	2017-11-26 00:06:20.728981	A-261931-1336307304.jpeg.jpg	image/jpeg	13566	2017-11-26 00:06:20.587509	Artist	252
350	2017-11-26 00:06:27.621431	2017-11-26 00:06:27.621431	A-437467-1367679967-7312.jpeg.jpg	image/jpeg	7002	2017-11-26 00:06:27.498223	Artist	253
351	2017-11-26 00:06:34.638026	2017-11-26 00:06:34.638026	A-516215-1258999240.jpeg.jpg	image/jpeg	12442	2017-11-26 00:06:34.517666	Artist	254
352	2017-11-26 00:06:41.618043	2017-11-26 00:06:41.618043	A-249817-1361262405-7549.jpeg.jpg	image/jpeg	36799	2017-11-26 00:06:41.444118	Artist	255
353	2017-11-26 00:06:48.712592	2017-11-26 00:06:48.712592	A-17827-1403015323-4525.jpeg.jpg	image/jpeg	41932	2017-11-26 00:06:48.536515	Artist	256
354	2017-11-26 00:06:56.152016	2017-11-26 00:06:56.152016	A-892993-1492506637-7086.jpeg.jpg	image/jpeg	151563	2017-11-26 00:06:55.882022	Artist	257
355	2017-11-26 00:07:03.575704	2017-11-26 00:07:03.575704	A-351748-1276700749.jpeg.jpg	image/jpeg	20673	2017-11-26 00:07:03.422532	Artist	258
356	2017-11-26 00:07:10.65176	2017-11-26 00:07:10.65176	A-437469-1439040266-2224.jpeg.jpg	image/jpeg	12280	2017-11-26 00:07:10.511645	Artist	259
357	2017-11-26 00:07:17.83175	2017-11-26 00:07:17.83175	A-291340-1457260076-9817.jpeg.jpg	image/jpeg	140207	2017-11-26 00:07:17.57102	Artist	260
358	2017-11-26 00:07:24.686061	2017-11-26 00:07:24.686061	A-273840-1488198080-3231.jpeg.jpg	image/jpeg	43455	2017-11-26 00:07:24.501629	Artist	261
359	2017-11-26 00:07:32.157299	2017-11-26 00:07:32.157299	A-297269-1359698118-3934.jpeg.jpg	image/jpeg	107164	2017-11-26 00:07:31.869797	Artist	262
360	2017-11-26 00:07:39.500487	2017-11-26 00:07:39.500487	A-343087-1438273686-1478.jpeg.jpg	image/jpeg	10127	2017-11-26 00:07:39.362762	Artist	263
361	2017-11-26 00:07:46.633168	2017-11-26 00:07:46.633168	A-1852453-1439040458-6646.jpeg.jpg	image/jpeg	6017	2017-11-26 00:07:46.516928	Artist	264
362	2017-11-26 00:07:53.922611	2017-11-26 00:07:53.922611	A-236654-1438272338-9366.jpeg.jpg	image/jpeg	56884	2017-11-26 00:07:53.642609	Artist	265
363	2017-11-26 00:08:00.714836	2017-11-26 00:08:00.714836	A-300117-1438274165-7600.jpeg.jpg	image/jpeg	76410	2017-11-26 00:08:00.513781	Artist	266
364	2017-11-26 00:08:07.560695	2017-11-26 00:08:07.560695	A-76045-1252670892.jpeg.jpg	image/jpeg	18973	2017-11-26 00:08:07.430226	Artist	267
365	2017-11-26 00:08:15.292622	2017-11-26 00:08:15.292622	A-285394-1299236581.jpeg.jpg	image/jpeg	266242	2017-11-26 00:08:14.942987	Artist	268
366	2017-11-26 00:08:22.704891	2017-11-26 00:08:22.704891	A-916823-1439040797-4736.jpeg.jpg	image/jpeg	6237	2017-11-26 00:08:22.597677	Artist	269
367	2017-11-26 00:08:35.758231	2017-11-26 00:08:35.758231	A-310403-1334683845.gif.jpg	image/jpeg	13663	2017-11-26 00:08:35.632422	Artist	271
368	2017-11-26 00:08:42.497082	2017-11-26 00:08:42.497082	A-268714-1163161036.jpeg.jpg	image/jpeg	7794	2017-11-26 00:08:42.366692	Artist	272
369	2017-11-26 00:08:49.932114	2017-11-26 00:08:49.932114	A-437470-1445959756-9922.jpeg.jpg	image/jpeg	53081	2017-11-26 00:08:49.738081	Artist	273
370	2017-11-26 00:08:56.757209	2017-11-26 00:08:56.757209	A-1402363-1422789798-8764.jpeg.jpg	image/jpeg	29553	2017-11-26 00:08:56.573108	Artist	274
371	2017-11-26 00:09:03.837412	2017-11-26 00:09:03.837412	A-383191-1483850098-1642.jpeg.jpg	image/jpeg	133978	2017-11-26 00:09:03.571842	Artist	275
372	2017-11-26 00:09:17.81399	2017-11-26 00:09:17.81399	A-450417-1142843981.jpeg.jpg	image/jpeg	40313	2017-11-26 00:09:17.626586	Artist	277
373	2017-11-26 00:09:24.618956	2017-11-26 00:09:24.618956	A-450418-1142844303.jpeg.jpg	image/jpeg	37243	2017-11-26 00:09:24.446794	Artist	278
374	2017-11-26 00:09:37.97736	2017-11-26 00:09:37.97736	A-686410-1420548674-8513.jpeg.jpg	image/jpeg	32054	2017-11-26 00:09:37.826764	Artist	280
375	2017-11-26 00:09:45.023053	2017-11-26 00:09:45.023053	A-620342-1210203097.jpeg.jpg	image/jpeg	54989	2017-11-26 00:09:44.801126	Artist	281
376	2017-11-26 00:09:52.26304	2017-11-26 00:09:52.26304	A-486744-1268177943.jpeg.jpg	image/jpeg	78287	2017-11-26 00:09:52.047825	Artist	282
377	2017-11-26 00:10:00.107969	2017-11-26 00:10:00.107969	A-299429-1184870549.jpeg.jpg	image/jpeg	224560	2017-11-26 00:09:59.814346	Artist	283
378	2017-11-26 00:10:07.687532	2017-11-26 00:10:07.687532	A-486746-1196710656.jpeg.jpg	image/jpeg	13362	2017-11-26 00:10:07.553326	Artist	284
379	2017-11-26 00:10:21.051054	2017-11-26 00:10:21.051054	A-636052-1437729850-7111.jpeg.jpg	image/jpeg	87881	2017-11-26 00:10:20.827427	Artist	286
380	2017-11-26 00:10:27.745156	2017-11-26 00:10:27.745156	A-299766-1395764809-3405.jpeg.jpg	image/jpeg	85429	2017-11-26 00:10:27.521095	Artist	287
381	2017-11-26 00:10:34.566405	2017-11-26 00:10:34.566405	A-255370-1148554784.jpeg.jpg	image/jpeg	17039	2017-11-26 00:10:34.420707	Artist	288
382	2017-11-26 00:10:42.71972	2017-11-26 00:10:42.71972	A-486745-1507469849-7069.jpeg.jpg	image/jpeg	49308	2017-11-26 00:10:42.515031	Artist	289
383	2017-11-26 00:10:49.657123	2017-11-26 00:10:49.657123	A-675606-1185727562.jpeg.jpg	image/jpeg	46182	2017-11-26 00:10:49.492052	Artist	290
384	2017-11-26 00:10:57.105178	2017-11-26 00:10:57.105178	A-794453-1475520348-6112.jpeg.jpg	image/jpeg	120854	2017-11-26 00:10:56.832629	Artist	291
385	2017-11-26 00:11:04.039396	2017-11-26 00:11:04.039396	A-497519-1437730059-9746.jpeg.jpg	image/jpeg	97202	2017-11-26 00:11:03.79876	Artist	292
386	2017-11-26 00:11:10.764062	2017-11-26 00:11:10.764062	A-369170-1148290563.jpeg.jpg	image/jpeg	28002	2017-11-26 00:11:10.594865	Artist	293
387	2017-11-26 00:11:17.95778	2017-11-26 00:11:17.95778	A-1173465-1508625248-3755.jpeg.jpg	image/jpeg	66505	2017-11-26 00:11:17.741209	Artist	294
388	2017-11-26 00:11:25.817887	2017-11-26 00:11:25.817887	A-328685-1454791293-2045.jpeg.jpg	image/jpeg	20774	2017-11-26 00:11:25.648071	Artist	295
389	2017-11-26 00:11:33.873101	2017-11-26 00:11:33.873101	A-167361-1239488305.jpeg.jpg	image/jpeg	54044	2017-11-26 00:11:33.649707	Artist	296
390	2017-11-26 00:11:41.13904	2017-11-26 00:11:41.13904	A-324402-1414589512-6494.jpeg.jpg	image/jpeg	98607	2017-11-26 00:11:40.906033	Artist	297
391	2017-11-26 00:11:48.599151	2017-11-26 00:11:48.599151	A-259770-1122300657.gif.jpg	image/jpeg	17034	2017-11-26 00:11:48.450202	Artist	298
392	2017-11-26 00:11:55.664355	2017-11-26 00:11:55.664355	A-259772-1123603746.jpg.jpg	image/jpeg	37905	2017-11-26 00:11:55.484451	Artist	299
393	2017-11-26 00:12:02.568415	2017-11-26 00:12:02.568415	A-176121-1152547001.jpeg.jpg	image/jpeg	14077	2017-11-26 00:12:02.426763	Artist	300
394	2017-11-26 00:12:09.618106	2017-11-26 00:12:09.618106	A-256053-1300023758.jpeg.jpg	image/jpeg	33134	2017-11-26 00:12:09.435873	Artist	301
395	2017-11-26 00:12:16.751091	2017-11-26 00:12:16.751091	A-266348-1119009037.jpg.jpg	image/jpeg	74288	2017-11-26 00:12:16.513007	Artist	302
396	2017-11-26 00:12:23.630084	2017-11-26 00:12:23.630084	A-266350-1330341319.jpeg.jpg	image/jpeg	9088	2017-11-26 00:12:23.506578	Artist	303
397	2017-11-26 00:12:30.731499	2017-11-26 00:12:30.731499	A-296352-1196133623.jpeg.jpg	image/jpeg	29704	2017-11-26 00:12:30.576744	Artist	304
398	2017-11-26 00:12:37.990686	2017-11-26 00:12:37.990686	A-411847-1389669026-1500.jpeg.jpg	image/jpeg	115444	2017-11-26 00:12:37.71844	Artist	305
399	2017-11-26 00:12:44.874841	2017-11-26 00:12:44.874841	A-745670-1196040205.jpeg.jpg	image/jpeg	35813	2017-11-26 00:12:44.705934	Artist	306
400	2017-11-26 00:12:51.742148	2017-11-26 00:12:51.742148	A-401507-1268905022.jpeg.jpg	image/jpeg	24154	2017-11-26 00:12:51.580956	Artist	307
401	2017-11-26 00:12:58.632405	2017-11-26 00:12:58.632405	A-1340186-1405616079-4288.jpeg.jpg	image/jpeg	12900	2017-11-26 00:12:58.527387	Artist	308
402	2017-11-26 00:13:05.827215	2017-11-26 00:13:05.827215	A-745674-1197066003.jpeg.jpg	image/jpeg	48236	2017-11-26 00:13:05.628296	Artist	309
403	2017-11-26 00:13:12.715237	2017-11-26 00:13:12.715237	A-306365-1340540595-8792.jpeg.jpg	image/jpeg	24031	2017-11-26 00:13:12.58209	Artist	310
404	2017-11-26 00:13:25.72061	2017-11-26 00:13:25.72061	A-866104-1299699572.jpeg.jpg	image/jpeg	10630	2017-11-26 00:13:25.582457	Artist	312
405	2017-11-26 00:13:32.697872	2017-11-26 00:13:32.697872	A-279082-1193159765.jpeg.jpg	image/jpeg	14755	2017-11-26 00:13:32.557394	Artist	313
406	2017-11-26 00:13:39.719592	2017-11-26 00:13:39.719592	A-492507-1198776449.jpeg.jpg	image/jpeg	15630	2017-11-26 00:13:39.583909	Artist	314
407	2017-11-26 00:13:52.55442	2017-11-26 00:13:52.55442	A-453957-1193159823.jpeg.jpg	image/jpeg	20860	2017-11-26 00:13:52.429236	Artist	316
408	2017-11-26 00:14:06.702184	2017-11-26 00:14:06.702184	A-3199601-1363444177-4434.jpeg.jpg	image/jpeg	42049	2017-11-26 00:14:06.481839	Artist	318
409	2017-11-26 00:14:13.736692	2017-11-26 00:14:13.736692	A-782160-1196386896.jpeg.jpg	image/jpeg	16167	2017-11-26 00:14:13.604919	Artist	319
410	2017-11-26 00:14:20.486654	2017-11-26 00:14:20.486654	A-121607-1318624126.jpeg.jpg	image/jpeg	8461	2017-11-26 00:14:20.354877	Artist	320
411	2017-11-26 00:14:27.755107	2017-11-26 00:14:27.755107	A-151145-1129941044.jpeg.jpg	image/jpeg	26644	2017-11-26 00:14:27.578105	Artist	321
412	2017-11-26 00:14:34.681532	2017-11-26 00:14:34.681532	A-728114-1438151476-5750.jpeg.jpg	image/jpeg	23595	2017-11-26 00:14:34.558939	Artist	322
413	2017-11-26 00:14:41.825034	2017-11-26 00:14:41.825034	A-254555-1130191629.jpeg.jpg	image/jpeg	63684	2017-11-26 00:14:41.638324	Artist	323
414	2017-11-26 00:14:48.813198	2017-11-26 00:14:48.813198	A-524363-1438151635-4863.jpeg.jpg	image/jpeg	38895	2017-11-26 00:14:48.604281	Artist	324
415	2017-11-26 00:14:55.890554	2017-11-26 00:14:55.890554	A-289850-1462829346-8826.jpeg.jpg	image/jpeg	222188	2017-11-26 00:14:55.58387	Artist	325
416	2017-11-26 00:15:02.756191	2017-11-26 00:15:02.756191	A-254552-1129823802.jpeg.jpg	image/jpeg	27864	2017-11-26 00:15:02.590545	Artist	326
417	2017-11-26 00:15:09.836791	2017-11-26 00:15:09.836791	A-728113-1438151736-9739.jpeg.jpg	image/jpeg	62617	2017-11-26 00:15:09.652374	Artist	327
418	2017-11-26 00:15:16.633533	2017-11-26 00:15:16.633533	A-276907-1171257263.jpeg.jpg	image/jpeg	10254	2017-11-26 00:15:16.524078	Artist	328
419	2017-11-26 00:15:23.816824	2017-11-26 00:15:23.816824	A-294047-1189122575.jpeg.jpg	image/jpeg	34696	2017-11-26 00:15:23.679931	Artist	329
420	2017-11-26 00:15:31.774068	2017-11-26 00:15:31.774068	A-425440-1438456900-5062.png.jpg	image/jpeg	97467	2017-11-26 00:15:31.523926	Artist	330
421	2017-11-26 00:15:39.603836	2017-11-26 00:15:39.603836	A-3252925-1487884796-1654.jpeg.jpg	image/jpeg	40167	2017-11-26 00:15:39.437021	Artist	331
422	2017-11-26 00:15:46.797265	2017-11-26 00:15:46.797265	A-386115-1156953628.gif.jpg	image/jpeg	31366	2017-11-26 00:15:46.651254	Artist	332
423	2017-11-26 00:15:53.671054	2017-11-26 00:15:53.671054	A-926237-1409886064-8155.jpeg.jpg	image/jpeg	9478	2017-11-26 00:15:53.530096	Artist	333
424	2017-11-26 00:16:00.84001	2017-11-26 00:16:00.84001	A-2867745-1405775894-3098.jpeg.jpg	image/jpeg	49910	2017-11-26 00:16:00.658935	Artist	334
425	2017-11-26 00:16:07.708769	2017-11-26 00:16:07.708769	A-1685601-1271622332.jpeg.jpg	image/jpeg	79708	2017-11-26 00:16:07.506474	Artist	335
426	2017-11-26 00:16:14.593761	2017-11-26 00:16:14.593761	A-2795023-1403203778-3831.jpeg.jpg	image/jpeg	24488	2017-11-26 00:16:14.428139	Artist	336
427	2017-11-26 00:16:21.636728	2017-11-26 00:16:21.636728	A-1650302-1435448916-9787.jpeg.jpg	image/jpeg	27014	2017-11-26 00:16:21.453001	Artist	337
428	2017-11-26 00:16:28.703672	2017-11-26 00:16:28.703672	A-2867744-1487894411-8984.jpeg.jpg	image/jpeg	17233	2017-11-26 00:16:28.560741	Artist	338
429	2017-11-26 00:16:35.720449	2017-11-26 00:16:35.720449	A-436088-1241422175.jpeg.jpg	image/jpeg	83104	2017-11-26 00:16:35.502391	Artist	339
430	2017-11-26 00:16:42.639811	2017-11-26 00:16:42.639811	A-67636-1111078564.jpg.jpg	image/jpeg	8286	2017-11-26 00:16:42.522575	Artist	340
431	2017-11-26 00:16:49.781096	2017-11-26 00:16:49.781096	A-455523-1429194730-4538.jpeg.jpg	image/jpeg	107575	2017-11-26 00:16:49.550965	Artist	341
432	2017-11-26 00:16:57.296234	2017-11-26 00:16:57.296234	A-610118-1272210626.jpeg.jpg	image/jpeg	81817	2017-11-26 00:16:57.041916	Artist	342
433	2017-11-26 00:17:04.613792	2017-11-26 00:17:04.613792	A-529919-1204384197.jpeg.jpg	image/jpeg	29205	2017-11-26 00:17:04.444077	Artist	343
434	2017-11-26 00:17:11.958087	2017-11-26 00:17:11.958087	A-930497-1204385127.jpeg.jpg	image/jpeg	49070	2017-11-26 00:17:11.734885	Artist	344
435	2017-11-26 00:17:18.645904	2017-11-26 00:17:18.645904	A-3252926-1403203917-4235.jpeg.jpg	image/jpeg	32751	2017-11-26 00:17:18.445753	Artist	345
436	2017-11-26 00:17:25.728462	2017-11-26 00:17:25.728462	A-275803-1146265772.jpeg.jpg	image/jpeg	20411	2017-11-26 00:17:25.59068	Artist	346
437	2017-11-26 00:17:32.715979	2017-11-26 00:17:32.715979	A-533047-1190563317.jpeg.jpg	image/jpeg	7897	2017-11-26 00:17:32.584348	Artist	347
438	2017-11-26 00:17:39.867592	2017-11-26 00:17:39.867592	A-255657-1115056411.jpg.jpg	image/jpeg	28428	2017-11-26 00:17:39.692444	Artist	348
439	2017-11-26 00:17:46.58285	2017-11-26 00:17:46.58285	A-289257-1140183878.jpeg.jpg	image/jpeg	31408	2017-11-26 00:17:46.421478	Artist	349
440	2017-11-26 00:17:53.942943	2017-11-26 00:17:53.942943	A-503867-1154759803.jpeg.jpg	image/jpeg	49342	2017-11-26 00:17:53.785658	Artist	350
441	2017-11-26 00:18:06.712351	2017-11-26 00:18:06.712351	A-270756-1150365211.jpeg.jpg	image/jpeg	71025	2017-11-26 00:18:06.509918	Artist	352
442	2017-11-26 00:18:13.638667	2017-11-26 00:18:13.638667	A-344782-1190561279.jpeg.jpg	image/jpeg	43314	2017-11-26 00:18:13.468285	Artist	353
443	2017-11-26 00:18:21.895089	2017-11-26 00:18:21.895089	A-710054-1502351607-9448.jpeg.jpg	image/jpeg	72556	2017-11-26 00:18:21.667026	Artist	354
444	2017-11-26 00:18:28.923614	2017-11-26 00:18:28.923614	A-489395-1150690995.jpeg.jpg	image/jpeg	83744	2017-11-26 00:18:28.677031	Artist	355
445	2017-11-26 00:18:36.508659	2017-11-26 00:18:36.508659	A-741109-1210619102.jpeg.jpg	image/jpeg	4134	2017-11-26 00:18:36.380205	Artist	356
446	2017-11-26 00:18:49.752014	2017-11-26 00:18:49.752014	A-1293498-1371317745-2516.jpeg.jpg	image/jpeg	35743	2017-11-26 00:18:49.588877	Artist	358
447	2017-11-26 00:19:02.498355	2017-11-26 00:19:02.498355	A-489396-1168709649.jpeg.jpg	image/jpeg	10965	2017-11-26 00:19:02.363361	Artist	360
448	2017-11-26 00:19:15.866305	2017-11-26 00:19:15.866305	A-628155-1391087300-1743.jpeg.jpg	image/jpeg	35294	2017-11-26 00:19:15.675238	Artist	362
449	2017-11-26 00:19:22.67598	2017-11-26 00:19:22.67598	A-274745-1500652021-8243.jpeg.jpg	image/jpeg	10855	2017-11-26 00:19:22.508028	Artist	363
450	2017-11-26 00:19:29.88356	2017-11-26 00:19:29.88356	A-628153-1399642467-9501.jpeg.jpg	image/jpeg	33712	2017-11-26 00:19:29.679087	Artist	364
451	2017-11-26 00:19:36.741659	2017-11-26 00:19:36.741659	A-1798355-1500654345-4699.jpeg.jpg	image/jpeg	16101	2017-11-26 00:19:36.592187	Artist	365
452	2017-11-26 00:19:43.589543	2017-11-26 00:19:43.589543	A-274754-1282936162.jpeg.jpg	image/jpeg	29314	2017-11-26 00:19:43.437821	Artist	366
453	2017-11-26 00:19:50.670298	2017-11-26 00:19:50.670298	A-628154-1374438499-2369.jpeg.jpg	image/jpeg	8386	2017-11-26 00:19:50.517758	Artist	367
454	2017-11-26 00:19:57.953097	2017-11-26 00:19:57.953097	A-597639-1500658896-4705.jpeg.jpg	image/jpeg	59511	2017-11-26 00:19:57.736894	Artist	368
455	2017-11-26 00:20:04.938689	2017-11-26 00:20:04.938689	A-953866-1325696723.jpeg.jpg	image/jpeg	48358	2017-11-26 00:20:04.737451	Artist	369
456	2017-11-26 00:20:11.836294	2017-11-26 00:20:11.836294	A-1777562-1499877723-8364.jpeg.jpg	image/jpeg	30310	2017-11-26 00:20:11.668223	Artist	370
457	2017-11-26 00:20:24.961137	2017-11-26 00:20:24.961137	A-450691-1334929273.jpeg.jpg	image/jpeg	65655	2017-11-26 00:20:24.755674	Artist	372
458	2017-11-26 00:20:31.739066	2017-11-26 00:20:31.739066	A-1355802-1367796395-3255.jpeg.jpg	image/jpeg	10526	2017-11-26 00:20:31.599355	Artist	373
459	2017-11-26 00:20:39.018726	2017-11-26 00:20:39.018726	A-2341996-1345728853-3359.jpeg.jpg	image/jpeg	61512	2017-11-26 00:20:38.7388	Artist	374
460	2017-11-26 00:20:45.934312	2017-11-26 00:20:45.934312	A-2551239-1331750759.jpeg.jpg	image/jpeg	50429	2017-11-26 00:20:45.698129	Artist	375
461	2017-11-26 00:20:52.948239	2017-11-26 00:20:52.948239	A-1130403-1250005699.jpeg.jpg	image/jpeg	64182	2017-11-26 00:20:52.750779	Artist	376
462	2017-11-26 00:21:01.116318	2017-11-26 00:21:01.116318	A-1560955-1334928363.jpeg.jpg	image/jpeg	57044	2017-11-26 00:21:00.911217	Artist	377
463	2017-11-26 00:21:08.749673	2017-11-26 00:21:08.749673	A-3802932-1450818538-5785.jpeg.jpg	image/jpeg	9529	2017-11-26 00:21:08.623271	Artist	378
464	2017-11-26 00:21:15.928476	2017-11-26 00:21:15.928476	A-565801-1233608280.jpeg.jpg	image/jpeg	20195	2017-11-26 00:21:15.787605	Artist	379
465	2017-11-26 00:21:22.800192	2017-11-26 00:21:22.800192	A-499276-1220634275.jpeg.jpg	image/jpeg	37034	2017-11-26 00:21:22.584942	Artist	380
466	2017-11-26 00:21:29.967326	2017-11-26 00:21:29.967326	A-660268-1176521388.jpeg.jpg	image/jpeg	51752	2017-11-26 00:21:29.772675	Artist	381
467	2017-11-26 00:21:42.962208	2017-11-26 00:21:42.962208	A-660271-1176520515.jpeg.jpg	image/jpeg	46915	2017-11-26 00:21:42.770111	Artist	383
468	2017-11-26 00:21:49.619795	2017-11-26 00:21:49.619795	A-660266-1176520861.jpeg.jpg	image/jpeg	37179	2017-11-26 00:21:49.440084	Artist	384
469	2017-11-26 00:21:56.838539	2017-11-26 00:21:56.838539	A-2050546-1292532084.jpeg.jpg	image/jpeg	13524	2017-11-26 00:21:56.69018	Artist	385
470	2017-11-26 00:22:03.799988	2017-11-26 00:22:03.799988	A-919075-1396510827-1034.jpeg.jpg	image/jpeg	14436	2017-11-26 00:22:03.67561	Artist	386
471	2017-11-26 00:22:17.015474	2017-11-26 00:22:17.015474	A-503220-1154256388.jpeg.jpg	image/jpeg	54306	2017-11-26 00:22:16.840896	Artist	388
472	2017-11-26 00:22:23.863463	2017-11-26 00:22:23.863463	A-435498-1151394726.jpeg.jpg	image/jpeg	62062	2017-11-26 00:22:23.669517	Artist	389
473	2017-11-26 00:22:30.939696	2017-11-26 00:22:30.939696	A-501571-1154256054.jpeg.jpg	image/jpeg	48506	2017-11-26 00:22:30.734657	Artist	390
474	2017-11-26 00:22:37.809297	2017-11-26 00:22:37.809297	A-546645-1166350341.jpeg.jpg	image/jpeg	54554	2017-11-26 00:22:37.634469	Artist	391
475	2017-11-26 00:22:44.863789	2017-11-26 00:22:44.863789	A-634317-1414826888-3577.jpeg.jpg	image/jpeg	45265	2017-11-26 00:22:44.712479	Artist	392
476	2017-11-26 00:22:51.802713	2017-11-26 00:22:51.802713	A-550142-1414826775-8577.jpeg.jpg	image/jpeg	31826	2017-11-26 00:22:51.636555	Artist	393
477	2017-11-26 00:22:58.642404	2017-11-26 00:22:58.642404	A-675863-1210202652.jpeg.jpg	image/jpeg	10691	2017-11-26 00:22:58.514312	Artist	394
478	2017-11-26 00:23:05.915073	2017-11-26 00:23:05.915073	A-501575-1210205793.jpeg.jpg	image/jpeg	64205	2017-11-26 00:23:05.675752	Artist	395
479	2017-11-26 00:23:12.901437	2017-11-26 00:23:12.901437	A-676284-1415393984-6388.jpeg.jpg	image/jpeg	48744	2017-11-26 00:23:12.747585	Artist	396
480	2017-11-26 00:23:25.881474	2017-11-26 00:23:25.881474	A-651766-1166350134.jpeg.jpg	image/jpeg	36529	2017-11-26 00:23:25.700911	Artist	398
481	2017-11-26 00:23:32.858728	2017-11-26 00:23:32.858728	A-501576-1154256239.jpeg.jpg	image/jpeg	41186	2017-11-26 00:23:32.665837	Artist	399
482	2017-11-26 00:23:39.734943	2017-11-26 00:23:39.734943	A-550143-1163691664.jpeg.jpg	image/jpeg	15541	2017-11-26 00:23:39.57954	Artist	400
483	2017-11-26 00:23:46.813576	2017-11-26 00:23:46.813576	A-579789-1227280626.jpeg.jpg	image/jpeg	26700	2017-11-26 00:23:46.641276	Artist	401
484	2017-11-26 00:23:53.767077	2017-11-26 00:23:53.767077	A-606577-1450775603-4098.jpeg.jpg	image/jpeg	29659	2017-11-26 00:23:53.564727	Artist	402
485	2017-11-26 00:24:00.884435	2017-11-26 00:24:00.884435	A-606576-1396827074-9674.jpeg.jpg	image/jpeg	52734	2017-11-26 00:24:00.64437	Artist	403
486	2017-11-26 00:24:07.860347	2017-11-26 00:24:07.860347	A-647278-1256336365.jpeg.jpg	image/jpeg	61790	2017-11-26 00:24:07.664909	Artist	404
487	2017-11-26 00:24:15.006871	2017-11-26 00:24:15.006871	A-606584-1509869515-3067.jpeg.jpg	image/jpeg	70277	2017-11-26 00:24:14.78829	Artist	405
488	2017-11-26 00:24:21.75754	2017-11-26 00:24:21.75754	A-615392-1256336316.jpeg.jpg	image/jpeg	37900	2017-11-26 00:24:21.596729	Artist	406
489	2017-11-26 00:24:28.809362	2017-11-26 00:24:28.809362	A-606583-1256336265.jpeg.jpg	image/jpeg	57973	2017-11-26 00:24:28.62226	Artist	407
490	2017-11-26 00:24:35.812009	2017-11-26 00:24:35.812009	A-565287-1198824993.jpeg.jpg	image/jpeg	49342	2017-11-26 00:24:35.649618	Artist	408
491	2017-11-26 00:24:42.709144	2017-11-26 00:24:42.709144	A-647287-1198818785.jpeg.jpg	image/jpeg	20331	2017-11-26 00:24:42.568313	Artist	409
492	2017-11-26 00:24:49.916938	2017-11-26 00:24:49.916938	A-251429-1383386473-5269.jpeg.jpg	image/jpeg	44291	2017-11-26 00:24:49.730618	Artist	410
493	2017-11-26 00:24:56.810539	2017-11-26 00:24:56.810539	A-3084438-1447070652-1482.jpeg.jpg	image/jpeg	37315	2017-11-26 00:24:56.666204	Artist	411
494	2017-11-26 00:25:03.657906	2017-11-26 00:25:03.657906	A-687118-1165270152.jpeg.jpg	image/jpeg	13095	2017-11-26 00:25:03.525463	Artist	412
495	2017-11-26 00:25:10.828551	2017-11-26 00:25:10.828551	A-794576-1197952334.jpeg.jpg	image/jpeg	14104	2017-11-26 00:25:10.670865	Artist	413
496	2017-11-26 00:25:17.705232	2017-11-26 00:25:17.705232	A-661045-1197952041.jpeg.jpg	image/jpeg	56895	2017-11-26 00:25:17.47775	Artist	414
497	2017-11-26 00:25:24.715562	2017-11-26 00:25:24.715562	A-640080-1197952253.jpeg.jpg	image/jpeg	18187	2017-11-26 00:25:24.570805	Artist	415
498	2017-11-26 00:25:31.687208	2017-11-26 00:25:31.687208	A-623939-1202837769.jpeg.jpg	image/jpeg	36015	2017-11-26 00:25:31.506003	Artist	416
499	2017-11-26 00:25:38.621519	2017-11-26 00:25:38.621519	A-114929-1080763242.jpg.jpg	image/jpeg	8952	2017-11-26 00:25:38.50337	Artist	417
500	2017-11-26 00:25:45.813255	2017-11-26 00:25:45.813255	A-177456-1164527141.jpeg.jpg	image/jpeg	33253	2017-11-26 00:25:45.618593	Artist	418
501	2017-11-26 00:25:52.710269	2017-11-26 00:25:52.710269	A-10378-1093609391.jpg.jpg	image/jpeg	14872	2017-11-26 00:25:52.585901	Artist	419
502	2017-11-26 00:26:06.825903	2017-11-26 00:26:06.825903	A-702075-1258307151.jpeg.jpg	image/jpeg	28198	2017-11-26 00:26:06.661961	Artist	421
503	2017-11-26 00:26:13.708132	2017-11-26 00:26:13.708132	A-680834-1429121159-5481.jpeg.jpg	image/jpeg	14199	2017-11-26 00:26:13.580379	Artist	422
504	2017-11-26 00:26:20.714327	2017-11-26 00:26:20.714327	A-330546-1351102062-2791.jpeg.jpg	image/jpeg	24531	2017-11-26 00:26:20.582346	Artist	423
505	2017-11-26 00:26:27.729837	2017-11-26 00:26:27.729837	A-308726-1198555162.jpeg.jpg	image/jpeg	14847	2017-11-26 00:26:27.573229	Artist	424
506	2017-11-26 00:26:34.592156	2017-11-26 00:26:34.592156	A-111673-1105977527.jpg.jpg	image/jpeg	3114	2017-11-26 00:26:34.498299	Artist	425
507	2017-11-26 00:27:05.613021	2017-11-26 00:27:05.613021	A-242618-1202358066.jpeg.jpg	image/jpeg	5417	2017-11-26 00:27:05.512057	Artist	430
508	2017-11-26 00:27:13.769686	2017-11-26 00:27:13.769686	A-173746-1202357947.jpeg.jpg	image/jpeg	26404	2017-11-26 00:27:13.611716	Artist	431
509	2017-11-26 00:27:21.006636	2017-11-26 00:27:21.006636	A-718213-1227183297.jpeg.jpg	image/jpeg	44040	2017-11-26 00:27:20.831948	Artist	432
510	2017-11-26 00:27:27.723475	2017-11-26 00:27:27.723475	A-149038-1496324658-1271.jpeg.jpg	image/jpeg	66273	2017-11-26 00:27:27.491771	Artist	433
511	2017-11-26 00:27:34.844124	2017-11-26 00:27:34.844124	A-688940-1493579949-4430.jpeg.jpg	image/jpeg	164489	2017-11-26 00:27:34.568421	Artist	434
512	2017-11-26 00:27:41.702914	2017-11-26 00:27:41.702914	A-69873-1270307861.jpeg.jpg	image/jpeg	76965	2017-11-26 00:27:41.494185	Artist	435
513	2017-11-26 00:27:48.709888	2017-11-26 00:27:48.709888	A-268733-1232989420.jpeg.jpg	image/jpeg	55594	2017-11-26 00:27:48.512081	Artist	436
514	2017-11-26 00:27:55.710163	2017-11-26 00:27:55.710163	A-441354-1170963461.jpeg.jpg	image/jpeg	14936	2017-11-26 00:27:55.567418	Artist	437
515	2017-11-26 00:28:02.611313	2017-11-26 00:28:02.611313	A-151481-1298184308.jpeg.jpg	image/jpeg	36560	2017-11-26 00:28:02.439884	Artist	438
516	2017-11-26 00:28:09.747553	2017-11-26 00:28:09.747553	A-176446-1170964118.jpeg.jpg	image/jpeg	26475	2017-11-26 00:28:09.585935	Artist	439
517	2017-11-26 00:28:16.723906	2017-11-26 00:28:16.723906	A-684052-1498989611-9402.jpeg.jpg	image/jpeg	13068	2017-11-26 00:28:16.563757	Artist	440
518	2017-11-26 00:28:23.539339	2017-11-26 00:28:23.539339	A-388698-1170963801.jpeg.jpg	image/jpeg	13935	2017-11-26 00:28:23.427187	Artist	441
519	2017-11-26 00:28:30.772607	2017-11-26 00:28:30.772607	A-1119268-1260211896.jpeg.jpg	image/jpeg	18003	2017-11-26 00:28:30.641787	Artist	442
520	2017-11-26 00:28:37.897624	2017-11-26 00:28:37.897624	A-290019-1298184731.jpeg.jpg	image/jpeg	46019	2017-11-26 00:28:37.679992	Artist	443
521	2017-11-26 00:28:44.718061	2017-11-26 00:28:44.718061	A-179142-1298183306.jpeg.jpg	image/jpeg	51937	2017-11-26 00:28:44.553149	Artist	444
522	2017-11-26 00:28:51.712744	2017-11-26 00:28:51.712744	A-684051-1293604722.jpeg.jpg	image/jpeg	13694	2017-11-26 00:28:51.576802	Artist	445
523	2017-11-26 00:28:58.680578	2017-11-26 00:28:58.680578	A-429918-1151393936.jpeg.jpg	image/jpeg	32382	2017-11-26 00:28:58.507163	Artist	446
524	2017-11-26 00:29:05.578641	2017-11-26 00:29:05.578641	A-327733-1270569249.jpeg.jpg	image/jpeg	35232	2017-11-26 00:29:05.419794	Artist	447
525	2017-11-26 00:29:13.182441	2017-11-26 00:29:13.182441	A-667214-1472561559-9252.jpeg.jpg	image/jpeg	153747	2017-11-26 00:29:12.886736	Artist	448
526	2017-11-26 00:29:20.782546	2017-11-26 00:29:20.782546	A-667216-1248807177.jpeg.jpg	image/jpeg	34635	2017-11-26 00:29:20.616607	Artist	449
527	2017-11-26 00:29:27.868502	2017-11-26 00:29:27.868502	A-311925-1156853012.jpeg.jpg	image/jpeg	25625	2017-11-26 00:29:27.730927	Artist	450
528	2017-11-26 00:29:34.657466	2017-11-26 00:29:34.657466	A-293913-1156853274.jpeg.jpg	image/jpeg	11610	2017-11-26 00:29:34.510876	Artist	451
529	2017-11-26 00:29:41.677275	2017-11-26 00:29:41.677275	A-189718-1504440726-9867.jpeg.jpg	image/jpeg	58665	2017-11-26 00:29:41.507093	Artist	452
530	2017-11-26 00:29:48.731813	2017-11-26 00:29:48.731813	A-100702-1156853335.jpeg.jpg	image/jpeg	16724	2017-11-26 00:29:48.598107	Artist	453
531	2017-11-26 00:29:55.67667	2017-11-26 00:29:55.67667	A-260571-1359400229-3931.jpeg.jpg	image/jpeg	12926	2017-11-26 00:29:55.547236	Artist	454
532	2017-11-26 00:30:02.934969	2017-11-26 00:30:02.934969	A-1178098-1293498567.jpeg.jpg	image/jpeg	99153	2017-11-26 00:30:02.697925	Artist	455
533	2017-11-26 00:30:09.675893	2017-11-26 00:30:09.675893	A-391245-1143239864.jpeg.jpg	image/jpeg	46945	2017-11-26 00:30:09.491137	Artist	456
534	2017-11-26 00:30:16.776407	2017-11-26 00:30:16.776407	A-372789-1299106564.jpeg.jpg	image/jpeg	65176	2017-11-26 00:30:16.537159	Artist	457
535	2017-11-26 00:30:23.623611	2017-11-26 00:30:23.623611	A-219999-1146344519.jpeg.jpg	image/jpeg	37857	2017-11-26 00:30:23.450911	Artist	458
536	2017-11-26 00:30:30.847534	2017-11-26 00:30:30.847534	A-303164-1487357607-6889.jpeg.jpg	image/jpeg	161332	2017-11-26 00:30:30.561054	Artist	459
537	2017-11-26 00:30:37.763862	2017-11-26 00:30:37.763862	A-252043-1148551136.jpeg.jpg	image/jpeg	14726	2017-11-26 00:30:37.622247	Artist	460
538	2017-11-26 00:30:44.694126	2017-11-26 00:30:44.694126	A-261770-1424375013-6002.jpeg.jpg	image/jpeg	70809	2017-11-26 00:30:44.509872	Artist	461
539	2017-11-26 00:30:51.585356	2017-11-26 00:30:51.585356	A-422785-1148239008.jpeg.jpg	image/jpeg	28786	2017-11-26 00:30:51.434182	Artist	462
540	2017-11-26 00:30:58.799605	2017-11-26 00:30:58.799605	A-273196-1127283489.jpeg.jpg	image/jpeg	18956	2017-11-26 00:30:58.670677	Artist	463
541	2017-11-26 00:31:05.58644	2017-11-26 00:31:05.58644	A-492775-1149246929.jpeg.jpg	image/jpeg	13827	2017-11-26 00:31:05.439524	Artist	464
542	2017-11-26 00:31:13.563189	2017-11-26 00:31:13.563189	A-218952-1133137457.jpeg.jpg	image/jpeg	15409	2017-11-26 00:31:13.416027	Artist	465
543	2017-11-26 00:31:20.887128	2017-11-26 00:31:20.887128	A-367313-1425771167-6957.jpeg.jpg	image/jpeg	38277	2017-11-26 00:31:20.755625	Artist	466
544	2017-11-26 00:31:27.827128	2017-11-26 00:31:27.827128	A-614895-1387787664-8179.jpeg.jpg	image/jpeg	44172	2017-11-26 00:31:27.629472	Artist	467
545	2017-11-26 00:31:35.32033	2017-11-26 00:31:35.32033	A-390930-1468234564-9616.jpeg.jpg	image/jpeg	185052	2017-11-26 00:31:35.054054	Artist	468
546	2017-11-26 00:31:42.928986	2017-11-26 00:31:42.928986	A-1186546-1291404393.jpeg.jpg	image/jpeg	86426	2017-11-26 00:31:42.685031	Artist	469
547	2017-11-26 00:31:50.028899	2017-11-26 00:31:50.028899	A-1509081-1291404510.jpeg.jpg	image/jpeg	80152	2017-11-26 00:31:49.784935	Artist	470
548	2017-11-26 00:31:57.306218	2017-11-26 00:31:57.306218	A-502680-1481384042-9223.jpeg.jpg	image/jpeg	158011	2017-11-26 00:31:56.990165	Artist	471
549	2017-11-26 00:32:04.64913	2017-11-26 00:32:04.64913	A-449726-1426429512-4025.jpeg.jpg	image/jpeg	12548	2017-11-26 00:32:04.522151	Artist	472
550	2017-11-26 00:32:17.791949	2017-11-26 00:32:17.791949	A-449730-1465003864-2346.jpeg.jpg	image/jpeg	48520	2017-11-26 00:32:17.620609	Artist	474
551	2017-11-26 00:32:24.768802	2017-11-26 00:32:24.768802	A-297928-1140788043.jpeg.jpg	image/jpeg	34747	2017-11-26 00:32:24.597378	Artist	475
552	2017-11-26 00:32:32.022169	2017-11-26 00:32:32.022169	A-434444-1362989950-1477.jpeg.jpg	image/jpeg	146124	2017-11-26 00:32:31.709772	Artist	476
553	2017-11-26 00:32:38.729987	2017-11-26 00:32:38.729987	A-47280-1444510401-9837.png.jpg	image/jpeg	21172	2017-11-26 00:32:38.59308	Artist	477
554	2017-11-26 00:32:45.753631	2017-11-26 00:32:45.753631	A-460794-1426429384-8526.jpeg.jpg	image/jpeg	19288	2017-11-26 00:32:45.61235	Artist	478
555	2017-11-26 00:32:52.989898	2017-11-26 00:32:52.989898	A-449727-1437659514-3831.jpeg.jpg	image/jpeg	65280	2017-11-26 00:32:52.76958	Artist	479
556	2017-11-26 00:32:59.75192	2017-11-26 00:32:59.75192	A-630085-1426429124-7325.jpeg.jpg	image/jpeg	40855	2017-11-26 00:32:59.592797	Artist	480
557	2017-11-26 00:33:06.503939	2017-11-26 00:33:06.503939	A-318558-1124375014.jpg.jpg	image/jpeg	12492	2017-11-26 00:33:06.373564	Artist	481
558	2017-11-26 00:33:13.956388	2017-11-26 00:33:13.956388	A-434343-1324138521.jpeg.jpg	image/jpeg	59174	2017-11-26 00:33:13.746563	Artist	482
559	2017-11-26 00:33:20.572229	2017-11-26 00:33:20.572229	A-408091-1199899971.jpeg.jpg	image/jpeg	19820	2017-11-26 00:33:20.417422	Artist	483
560	2017-11-26 00:33:27.74849	2017-11-26 00:33:27.74849	A-408092-1360596399-6664.jpeg.jpg	image/jpeg	30430	2017-11-26 00:33:27.598287	Artist	484
561	2017-11-26 00:33:34.802071	2017-11-26 00:33:34.802071	A-408090-1199899540.jpeg.jpg	image/jpeg	31564	2017-11-26 00:33:34.641832	Artist	485
562	2017-11-26 00:33:41.904346	2017-11-26 00:33:41.904346	A-408089-1199899650.jpeg.jpg	image/jpeg	42130	2017-11-26 00:33:41.725372	Artist	486
563	2017-11-26 00:33:48.745936	2017-11-26 00:33:48.745936	A-3282345-1415392089-2843.jpeg.jpg	image/jpeg	19242	2017-11-26 00:33:48.587572	Artist	487
564	2017-11-26 00:33:55.829746	2017-11-26 00:33:55.829746	A-430104-1327031772.jpeg.jpg	image/jpeg	57809	2017-11-26 00:33:55.627097	Artist	488
565	2017-11-26 00:34:02.657867	2017-11-26 00:34:02.657867	A-430108-1227526909.jpeg.jpg	image/jpeg	12112	2017-11-26 00:34:02.520078	Artist	489
566	2017-11-26 00:34:09.727142	2017-11-26 00:34:09.727142	A-430106-1270083860.jpeg.jpg	image/jpeg	78161	2017-11-26 00:34:09.522717	Artist	490
567	2017-11-26 00:34:16.965989	2017-11-26 00:34:16.965989	A-430107-1160077662.jpeg.jpg	image/jpeg	73250	2017-11-26 00:34:16.776352	Artist	491
568	2017-11-26 00:34:24.014961	2017-11-26 00:34:24.014961	A-430105-1160077803.jpeg.jpg	image/jpeg	33198	2017-11-26 00:34:23.871528	Artist	492
569	2017-11-26 00:34:30.552929	2017-11-26 00:34:30.552929	A-365785-1142872703.jpeg.jpg	image/jpeg	17193	2017-11-26 00:34:30.417075	Artist	493
570	2017-11-26 00:34:37.670553	2017-11-26 00:34:37.670553	A-365794-1142873018.jpeg.jpg	image/jpeg	47832	2017-11-26 00:34:37.483648	Artist	494
571	2017-11-26 00:34:44.645689	2017-11-26 00:34:44.645689	A-152377-1124793820.jpg.jpg	image/jpeg	16398	2017-11-26 00:34:44.458091	Artist	495
572	2017-11-26 00:34:51.705683	2017-11-26 00:34:51.705683	A-365781-1503129773-5427.jpeg.jpg	image/jpeg	53884	2017-11-26 00:34:51.512303	Artist	496
573	2017-11-26 00:34:58.631946	2017-11-26 00:34:58.631946	A-4854-1499993390-7523.jpeg.jpg	image/jpeg	30850	2017-11-26 00:34:58.450481	Artist	497
574	2017-11-26 00:35:05.859518	2017-11-26 00:35:05.859518	A-281050-1431533076-3314.jpeg.jpg	image/jpeg	68537	2017-11-26 00:35:05.652817	Artist	498
575	2017-11-26 00:35:12.652417	2017-11-26 00:35:12.652417	A-427835-1157151874.jpeg.jpg	image/jpeg	42667	2017-11-26 00:35:12.476545	Artist	499
576	2017-11-26 00:35:19.815259	2017-11-26 00:35:19.815259	A-427836-1157152113.jpeg.jpg	image/jpeg	51851	2017-11-26 00:35:19.636358	Artist	500
577	2017-11-26 00:35:26.925554	2017-11-26 00:35:26.925554	A-427830-1157152212.jpeg.jpg	image/jpeg	50272	2017-11-26 00:35:26.75967	Artist	501
578	2017-11-26 00:35:33.698237	2017-11-26 00:35:33.698237	A-317592-1266237412.jpeg.jpg	image/jpeg	13650	2017-11-26 00:35:33.571165	Artist	502
579	2017-11-26 00:35:46.710826	2017-11-26 00:35:46.710826	A-284434-1111576474.jpg.jpg	image/jpeg	12581	2017-11-26 00:35:46.586278	Artist	504
580	2017-11-26 00:35:53.947105	2017-11-26 00:35:53.947105	A-187292-1502210576-9546.jpeg.jpg	image/jpeg	56057	2017-11-26 00:35:53.75417	Artist	505
581	2017-11-26 00:36:06.673578	2017-11-26 00:36:06.673578	A-389273-1151079774.jpeg.jpg	image/jpeg	41353	2017-11-26 00:36:06.461784	Artist	507
582	2017-11-26 00:36:13.912511	2017-11-26 00:36:13.912511	A-284431-1152656724.jpeg.jpg	image/jpeg	69311	2017-11-26 00:36:13.729462	Artist	508
583	2017-11-26 00:36:20.974683	2017-11-26 00:36:20.974683	A-284429-1462487539-4362.jpeg.jpg	image/jpeg	44621	2017-11-26 00:36:20.800125	Artist	509
584	2017-11-26 00:36:27.742863	2017-11-26 00:36:27.742863	A-418744-1266236598.jpeg.jpg	image/jpeg	7820	2017-11-26 00:36:27.61874	Artist	510
585	2017-11-26 00:36:34.627007	2017-11-26 00:36:34.627007	A-418171-1266236442.jpeg.jpg	image/jpeg	9503	2017-11-26 00:36:34.49869	Artist	511
586	2017-11-26 00:36:41.946962	2017-11-26 00:36:41.946962	A-418170-1160649379.jpeg.jpg	image/jpeg	63668	2017-11-26 00:36:41.73767	Artist	512
587	2017-11-26 00:36:48.853135	2017-11-26 00:36:48.853135	A-455772-1509905734-9689.jpeg.jpg	image/jpeg	51451	2017-11-26 00:36:48.644135	Artist	513
588	2017-11-26 00:36:55.559165	2017-11-26 00:36:55.559165	A-251654-1487810684-5896.jpeg.jpg	image/jpeg	26835	2017-11-26 00:36:55.433361	Artist	514
589	2017-11-26 00:37:02.648166	2017-11-26 00:37:02.648166	A-261337-1378122628-8495.jpeg.jpg	image/jpeg	46579	2017-11-26 00:37:02.464369	Artist	515
590	2017-11-26 00:37:09.802031	2017-11-26 00:37:09.802031	A-252301-1237741945.jpeg.jpg	image/jpeg	104354	2017-11-26 00:37:09.539285	Artist	516
591	2017-11-26 00:37:16.720093	2017-11-26 00:37:16.720093	A-660880-1245484302.jpeg.jpg	image/jpeg	27292	2017-11-26 00:37:16.57458	Artist	517
592	2017-11-26 00:37:23.641929	2017-11-26 00:37:23.641929	A-203017-1105778356.jpg.jpg	image/jpeg	29876	2017-11-26 00:37:23.456729	Artist	518
593	2017-11-26 00:37:30.764618	2017-11-26 00:37:30.764618	A-975603-1314609294.jpeg.jpg	image/jpeg	59487	2017-11-26 00:37:30.54574	Artist	519
594	2017-11-26 00:37:37.727715	2017-11-26 00:37:37.727715	A-441072-1200545413.jpeg.jpg	image/jpeg	15758	2017-11-26 00:37:37.571702	Artist	520
595	2017-11-26 00:37:44.918113	2017-11-26 00:37:44.918113	A-281754-1502593417-5524.jpeg.jpg	image/jpeg	179777	2017-11-26 00:37:44.585744	Artist	521
596	2017-11-26 00:37:51.590833	2017-11-26 00:37:51.590833	A-275118-1496375861-1562.jpeg.jpg	image/jpeg	23311	2017-11-26 00:37:51.419926	Artist	522
597	2017-11-26 00:37:58.759612	2017-11-26 00:37:58.759612	A-285783-1209096055.jpeg.jpg	image/jpeg	32768	2017-11-26 00:37:58.602528	Artist	523
598	2017-11-26 00:38:05.912265	2017-11-26 00:38:05.912265	A-279165-1306787320.jpeg.jpg	image/jpeg	60547	2017-11-26 00:38:05.733154	Artist	524
599	2017-11-26 00:38:13.62297	2017-11-26 00:38:13.62297	A-251655-1117028486.jpg.jpg	image/jpeg	32950	2017-11-26 00:38:13.441425	Artist	525
600	2017-11-26 00:38:20.630282	2017-11-26 00:38:20.630282	A-462077-1218485760.jpeg.jpg	image/jpeg	9202	2017-11-26 00:38:20.493466	Artist	526
601	2017-11-26 00:38:27.612092	2017-11-26 00:38:27.612092	A-241527-1441568754-1129.jpeg.jpg	image/jpeg	21889	2017-11-26 00:38:27.448762	Artist	527
602	2017-11-26 00:38:34.938543	2017-11-26 00:38:34.938543	A-714876-1174266476.jpeg.jpg	image/jpeg	113797	2017-11-26 00:38:34.683429	Artist	528
603	2017-11-26 00:38:41.751473	2017-11-26 00:38:41.751473	A-517956-1372337190-2686.jpeg.jpg	image/jpeg	30944	2017-11-26 00:38:41.567146	Artist	529
604	2017-11-26 00:38:48.645975	2017-11-26 00:38:48.645975	A-86301-1465153743-2955.jpeg.jpg	image/jpeg	42492	2017-11-26 00:38:48.478381	Artist	530
605	2017-11-26 00:38:55.680055	2017-11-26 00:38:55.680055	A-517955-1216334516.jpeg.jpg	image/jpeg	12980	2017-11-26 00:38:55.524459	Artist	531
606	2017-11-26 00:39:02.573577	2017-11-26 00:39:02.573577	A-365785-1142872703.jpeg.jpg	image/jpeg	17193	2017-11-26 00:39:02.432698	Artist	532
607	2017-11-26 00:39:09.602631	2017-11-26 00:39:09.602631	A-365794-1142873018.jpeg.jpg	image/jpeg	47832	2017-11-26 00:39:09.435102	Artist	533
608	2017-11-26 00:39:16.591904	2017-11-26 00:39:16.591904	A-152377-1124793820.jpg.jpg	image/jpeg	16398	2017-11-26 00:39:16.38326	Artist	534
609	2017-11-26 00:39:23.666015	2017-11-26 00:39:23.666015	A-365781-1503129773-5427.jpeg.jpg	image/jpeg	53884	2017-11-26 00:39:23.441483	Artist	535
610	2017-11-26 00:39:30.62532	2017-11-26 00:39:30.62532	A-4854-1499993390-7523.jpeg.jpg	image/jpeg	30850	2017-11-26 00:39:30.425115	Artist	536
611	2017-11-26 00:39:38.564756	2017-11-26 00:39:38.564756	A-608750-1194392739.jpeg.jpg	image/jpeg	19397	2017-11-26 00:39:38.420196	Artist	537
612	2017-11-26 00:39:45.556246	2017-11-26 00:39:45.556246	A-530745-1215747491.jpeg.jpg	image/jpeg	22713	2017-11-26 00:39:45.413264	Artist	538
613	2017-11-26 00:39:52.947072	2017-11-26 00:39:52.947072	A-530747-1264200490.jpeg.jpg	image/jpeg	39201	2017-11-26 00:39:52.759952	Artist	539
614	2017-11-26 00:39:59.679118	2017-11-26 00:39:59.679118	A-530746-1264200522.jpeg.jpg	image/jpeg	50827	2017-11-26 00:39:59.499025	Artist	540
615	2017-11-26 00:40:06.934634	2017-11-26 00:40:06.934634	A-136870-1473645287-4552.jpeg.jpg	image/jpeg	44634	2017-11-26 00:40:06.767679	Artist	541
616	2017-11-26 00:40:13.690119	2017-11-26 00:40:13.690119	A-333941-1304039945.jpeg.jpg	image/jpeg	18622	2017-11-26 00:40:13.561674	Artist	542
617	2017-11-26 00:40:20.720073	2017-11-26 00:40:20.720073	A-225315-1124208089.jpg.jpg	image/jpeg	19338	2017-11-26 00:40:20.587492	Artist	543
618	2017-11-26 00:40:27.579739	2017-11-26 00:40:27.579739	A-130861-1456149392-2799.jpeg.jpg	image/jpeg	19280	2017-11-26 00:40:27.419751	Artist	544
619	2017-11-26 00:40:34.563594	2017-11-26 00:40:34.563594	A-56838-1105866080.jpg.jpg	image/jpeg	19894	2017-11-26 00:40:34.429076	Artist	545
620	2017-11-26 00:40:41.533673	2017-11-26 00:40:41.533673	A-513652-1202779724.jpeg.jpg	image/jpeg	17764	2017-11-26 00:40:41.407681	Artist	546
621	2017-11-26 00:40:49.602819	2017-11-26 00:40:49.602819	A-365506-1146846587.jpeg.jpg	image/jpeg	64604	2017-11-26 00:40:49.405175	Artist	547
622	2017-11-26 00:40:56.717883	2017-11-26 00:40:56.717883	A-326962-1315330985.jpeg.jpg	image/jpeg	20432	2017-11-26 00:40:56.578019	Artist	548
623	2017-11-26 00:41:03.753693	2017-11-26 00:41:03.753693	A-79827-1439303028-7825.jpeg.jpg	image/jpeg	35956	2017-11-26 00:41:03.557739	Artist	549
624	2017-11-26 00:41:10.57019	2017-11-26 00:41:10.57019	A-354590-1131403545.jpeg.jpg	image/jpeg	23458	2017-11-26 00:41:10.416265	Artist	550
625	2017-11-26 00:41:17.63883	2017-11-26 00:41:17.63883	A-700584-1194187579.jpeg.jpg	image/jpeg	11487	2017-11-26 00:41:17.514398	Artist	551
626	2017-11-26 00:41:30.763814	2017-11-26 00:41:30.763814	A-762429-1234843051.jpeg.jpg	image/jpeg	19284	2017-11-26 00:41:30.598636	Artist	553
627	2017-11-26 00:41:40.782871	2017-11-26 00:41:40.782871	A-47742-1450445078-2070.jpeg.jpg	image/jpeg	89423	2017-11-26 00:41:40.514621	Artist	554
628	2017-11-26 00:41:47.941446	2017-11-26 00:41:47.941446	A-414643-1137057063.jpeg.jpg	image/jpeg	68777	2017-11-26 00:41:47.6625	Artist	555
629	2017-11-26 00:41:54.701217	2017-11-26 00:41:54.701217	A-763718-1318856664.jpeg.jpg	image/jpeg	61106	2017-11-26 00:41:54.490138	Artist	556
630	2017-11-26 00:42:01.825082	2017-11-26 00:42:01.825082	A-349117-1264243167.jpeg.jpg	image/jpeg	31217	2017-11-26 00:42:01.670446	Artist	557
631	2017-11-26 00:42:08.743166	2017-11-26 00:42:08.743166	A-385189-1264240542.jpeg.jpg	image/jpeg	28280	2017-11-26 00:42:08.566043	Artist	558
632	2017-11-26 00:42:15.842773	2017-11-26 00:42:15.842773	A-561166-1266800929.jpeg.jpg	image/jpeg	34448	2017-11-26 00:42:15.674155	Artist	559
633	2017-11-26 00:42:22.66976	2017-11-26 00:42:22.66976	A-16798-1104171479.jpg.jpg	image/jpeg	41953	2017-11-26 00:42:22.478632	Artist	560
634	2017-11-26 00:42:29.859006	2017-11-26 00:42:29.859006	A-312730-1264237275.jpeg.jpg	image/jpeg	27423	2017-11-26 00:42:29.673037	Artist	561
635	2017-11-26 00:42:36.82977	2017-11-26 00:42:36.82977	A-18948-1502467570-8196.jpeg.jpg	image/jpeg	138436	2017-11-26 00:42:36.552144	Artist	562
636	2017-11-26 00:42:44.091941	2017-11-26 00:42:44.091941	A-17971-1484591190-6271.jpeg.jpg	image/jpeg	122987	2017-11-26 00:42:43.837229	Artist	563
637	2017-11-26 00:42:53.580078	2017-11-26 00:42:53.580078	A-284531-1172435907.jpeg.jpg	image/jpeg	29626	2017-11-26 00:42:53.425614	Artist	564
638	2017-11-26 00:43:00.750862	2017-11-26 00:43:00.750862	A-15885-1406060448-9391.jpeg.jpg	image/jpeg	77604	2017-11-26 00:43:00.520961	Artist	565
639	2017-11-26 00:43:08.652191	2017-11-26 00:43:08.652191	A-449016-1139603827.jpeg.jpg	image/jpeg	49004	2017-11-26 00:43:08.482201	Artist	566
640	2017-11-26 00:43:15.7187	2017-11-26 00:43:15.7187	A-175556-1194746731.jpeg.jpg	image/jpeg	87669	2017-11-26 00:43:15.535055	Artist	567
641	2017-11-26 00:43:22.709418	2017-11-26 00:43:22.709418	A-310689-1189849413.jpeg.jpg	image/jpeg	97362	2017-11-26 00:43:22.507581	Artist	568
642	2017-11-26 00:43:35.656637	2017-11-26 00:43:35.656637	A-576991-1196113972.jpeg.jpg	image/jpeg	51589	2017-11-26 00:43:35.466596	Artist	570
643	2017-11-26 00:43:42.52327	2017-11-26 00:43:42.52327	A-479665-1203567589.jpeg.jpg	image/jpeg	8403	2017-11-26 00:43:42.401505	Artist	21
644	2017-11-26 00:43:55.696706	2017-11-26 00:43:55.696706	A-291800-1378625170-8333.jpeg.jpg	image/jpeg	52349	2017-11-26 00:43:55.49114	Artist	23
645	2017-11-26 00:44:08.573619	2017-11-26 00:44:08.573619	A-299677-1328553264.jpeg.jpg	image/jpeg	16194	2017-11-26 00:44:08.408838	Artist	575
646	2017-11-26 00:44:15.617249	2017-11-26 00:44:15.617249	A-682522-1382200699-8177.jpeg.jpg	image/jpeg	36199	2017-11-26 00:44:15.438073	Artist	26
647	2017-11-26 00:44:22.508781	2017-11-26 00:44:22.508781	A-76869-1311676407.jpeg.jpg	image/jpeg	9760	2017-11-26 00:44:22.347592	Artist	577
648	2017-11-26 00:44:35.680763	2017-11-26 00:44:35.680763	A-441372-1332020695.jpeg.jpg	image/jpeg	62498	2017-11-26 00:44:35.480939	Artist	579
649	2017-11-26 00:44:42.593621	2017-11-26 00:44:42.593621	A-98902-1133732433.jpeg.jpg	image/jpeg	29904	2017-11-26 00:44:42.425305	Artist	580
650	2017-11-26 00:44:49.580729	2017-11-26 00:44:49.580729	A-361777-1258620922.jpeg.jpg	image/jpeg	31006	2017-11-26 00:44:49.429508	Artist	581
651	2017-11-26 00:44:56.472586	2017-11-26 00:44:56.472586	A-195567-1107961445.jpg.jpg	image/jpeg	11572	2017-11-26 00:44:56.342163	Artist	582
652	2017-11-26 00:45:10.581519	2017-11-26 00:45:10.581519	A-205399-1360883227-7001.jpeg.jpg	image/jpeg	31105	2017-11-26 00:45:10.423188	Artist	34
653	2017-11-26 00:45:17.572412	2017-11-26 00:45:17.572412	A-676691-1412098288-1285.jpeg.jpg	image/jpeg	19283	2017-11-26 00:45:17.428218	Artist	35
654	2017-11-26 00:45:24.592224	2017-11-26 00:45:24.592224	A-267984-1378625647-2201.jpeg.jpg	image/jpeg	40873	2017-11-26 00:45:24.424638	Artist	36
655	2017-11-26 00:45:31.488016	2017-11-26 00:45:31.488016	A-157277-1328691972.jpeg.jpg	image/jpeg	9934	2017-11-26 00:45:31.361301	Artist	587
656	2017-11-26 00:45:38.687745	2017-11-26 00:45:38.687745	A-3487682-1382115473-9874.jpeg.jpg	image/jpeg	45049	2017-11-26 00:45:38.448984	Artist	38
657	2017-11-26 00:45:45.567902	2017-11-26 00:45:45.567902	A-399209-1307454981.jpeg.jpg	image/jpeg	21775	2017-11-26 00:45:45.411193	Artist	39
658	2017-11-26 00:45:52.73192	2017-11-26 00:45:52.73192	A-149049-1231846688.jpeg.jpg	image/jpeg	67575	2017-11-26 00:45:52.532269	Artist	590
659	2017-11-26 00:45:59.561176	2017-11-26 00:45:59.561176	A-276520-1318882404.jpeg.jpg	image/jpeg	29834	2017-11-26 00:45:59.409804	Artist	591
660	2017-11-26 00:46:06.455915	2017-11-26 00:46:06.455915	A-97916-1114033540.jpg.jpg	image/jpeg	9156	2017-11-26 00:46:06.331931	Artist	42
661	2017-11-26 00:46:13.478619	2017-11-26 00:46:13.478619	A-512044-1157552858.jpeg.jpg	image/jpeg	9391	2017-11-26 00:46:13.358996	Artist	43
662	2017-11-26 00:46:26.643185	2017-11-26 00:46:26.643185	A-407631-1146741557.jpeg.jpg	image/jpeg	41429	2017-11-26 00:46:26.471687	Artist	595
663	2017-11-26 00:46:33.559521	2017-11-26 00:46:33.559521	A-98903-1107961439.jpg.jpg	image/jpeg	15932	2017-11-26 00:46:33.416524	Artist	596
664	2017-11-26 00:46:40.595708	2017-11-26 00:46:40.595708	A-386307-1360682810-6131.jpeg.jpg	image/jpeg	30240	2017-11-26 00:46:40.410109	Artist	47
665	2017-11-26 00:46:47.574259	2017-11-26 00:46:47.574259	A-263425-1282410921.jpeg.jpg	image/jpeg	23747	2017-11-26 00:46:47.421453	Artist	598
666	2017-11-26 00:46:54.565881	2017-11-26 00:46:54.565881	A-752561-1331910847.jpeg.jpg	image/jpeg	22577	2017-11-26 00:46:54.411624	Artist	49
667	2017-11-26 00:47:01.91075	2017-11-26 00:47:01.91075	A-348865-1192115055.jpeg.jpg	image/jpeg	60635	2017-11-26 00:47:01.709938	Artist	600
668	2017-11-26 00:47:08.722977	2017-11-26 00:47:08.722977	A-218691-1193590172.jpeg.jpg	image/jpeg	14706	2017-11-26 00:47:08.585417	Artist	601
669	2017-11-26 00:47:21.684603	2017-11-26 00:47:21.684603	A-348866-1212547195.jpeg.jpg	image/jpeg	17129	2017-11-26 00:47:21.569501	Artist	603
670	2017-11-26 00:47:28.564793	2017-11-26 00:47:28.564793	A-398349-1365603386-1442.png.jpg	image/jpeg	15048	2017-11-26 00:47:28.424907	Artist	604
671	2017-11-26 00:47:35.580763	2017-11-26 00:47:35.580763	A-144910-1097143684.jpg.jpg	image/jpeg	23786	2017-11-26 00:47:35.419733	Artist	605
672	2017-11-26 00:47:42.769157	2017-11-26 00:47:42.769157	A-398348-1365604327-7794.jpeg.jpg	image/jpeg	31947	2017-11-26 00:47:42.611428	Artist	606
673	2017-11-26 00:47:50.508929	2017-11-26 00:47:50.508929	A-831677-1275453968.jpeg.jpg	image/jpeg	53885	2017-11-26 00:47:50.288229	Artist	607
674	2017-11-26 00:47:57.964844	2017-11-26 00:47:57.964844	A-1175791-1274991638.jpeg.jpg	image/jpeg	62951	2017-11-26 00:47:57.710489	Artist	608
675	2017-11-26 00:48:04.716727	2017-11-26 00:48:04.716727	A-17956-1337894039-2734.jpeg.jpg	image/jpeg	20932	2017-11-26 00:48:04.571327	Artist	609
676	2017-11-26 00:48:11.536633	2017-11-26 00:48:11.536633	A-86101-1126528437.jpeg.jpg	image/jpeg	17773	2017-11-26 00:48:11.409554	Artist	610
677	2017-11-26 00:48:18.898112	2017-11-26 00:48:18.898112	A-94079-1395064940-9590.jpeg.jpg	image/jpeg	30069	2017-11-26 00:48:18.74102	Artist	611
678	2017-11-26 00:48:25.459135	2017-11-26 00:48:25.459135	A-29810-001.jpg.jpg	image/jpeg	6308	2017-11-26 00:48:25.346929	Artist	612
679	2017-11-26 00:48:32.645929	2017-11-26 00:48:32.645929	A-687451-1216348546.jpeg.jpg	image/jpeg	7192	2017-11-26 00:48:32.520669	Artist	613
680	2017-11-26 00:48:39.936974	2017-11-26 00:48:39.936974	A-393163-1310114317.jpeg.jpg	image/jpeg	47184	2017-11-26 00:48:39.737869	Artist	614
681	2017-11-26 00:48:46.909046	2017-11-26 00:48:46.909046	A-1824112-1330154107.jpeg.jpg	image/jpeg	42125	2017-11-26 00:48:46.749747	Artist	615
682	2017-11-26 00:48:53.713611	2017-11-26 00:48:53.713611	A-889756-1327334823.jpeg.jpg	image/jpeg	18116	2017-11-26 00:48:53.566196	Artist	616
683	2017-11-26 00:49:00.952128	2017-11-26 00:49:00.952128	A-387774-1330153523.jpeg.jpg	image/jpeg	26524	2017-11-26 00:49:00.757159	Artist	617
684	2017-11-26 00:49:07.728515	2017-11-26 00:49:07.728515	A-387773-1137057579.jpeg.jpg	image/jpeg	24900	2017-11-26 00:49:07.584092	Artist	618
685	2017-11-26 00:49:14.612585	2017-11-26 00:49:14.612585	A-387772-1232748179.jpeg.jpg	image/jpeg	10006	2017-11-26 00:49:14.498934	Artist	619
686	2017-11-26 00:49:21.861849	2017-11-26 00:49:21.861849	A-387771-1473708746-6331.jpeg.jpg	image/jpeg	36473	2017-11-26 00:49:21.646795	Artist	620
687	2017-11-26 00:49:28.723584	2017-11-26 00:49:28.723584	A-199520-1137057443.jpeg.jpg	image/jpeg	15248	2017-11-26 00:49:28.564377	Artist	621
688	2017-11-26 00:49:41.886768	2017-11-26 00:49:41.886768	A-3447650-1465977576-2421.png.jpg	image/jpeg	76277	2017-11-26 00:49:41.691677	Artist	623
689	2017-11-26 00:49:48.713859	2017-11-26 00:49:48.713859	A-650228-1297784087.jpeg.jpg	image/jpeg	83183	2017-11-26 00:49:48.486856	Artist	624
690	2017-11-26 00:49:56.779144	2017-11-26 00:49:56.779144	A-368377-1439647593-8072.jpeg.jpg	image/jpeg	34779	2017-11-26 00:49:56.596589	Artist	625
691	2017-11-26 00:50:03.604377	2017-11-26 00:50:03.604377	A-3882-1218277268.jpeg.jpg	image/jpeg	29327	2017-11-26 00:50:03.44664	Artist	626
692	2017-11-26 00:50:10.574505	2017-11-26 00:50:10.574505	A-499393-1446580792-2541.jpeg.jpg	image/jpeg	25754	2017-11-26 00:50:10.416545	Artist	627
693	2017-11-26 00:50:17.544636	2017-11-26 00:50:17.544636	A-409163-1335292159.jpeg.jpg	image/jpeg	14454	2017-11-26 00:50:17.413156	Artist	628
694	2017-11-26 00:50:24.918527	2017-11-26 00:50:24.918527	A-3334580-1454199941-3478.jpeg.jpg	image/jpeg	46028	2017-11-26 00:50:24.726492	Artist	629
695	2017-11-26 00:50:31.575884	2017-11-26 00:50:31.575884	A-151145-1129941044.jpeg.jpg	image/jpeg	26644	2017-11-26 00:50:31.404316	Artist	630
696	2017-11-26 00:50:38.695513	2017-11-26 00:50:38.695513	A-31713-1231288375.gif.jpg	image/jpeg	15549	2017-11-26 00:50:38.562618	Artist	631
697	2017-11-26 00:50:45.567907	2017-11-26 00:50:45.567907	A-343742-1281371854.jpeg.jpg	image/jpeg	23866	2017-11-26 00:50:45.421798	Artist	632
698	2017-11-26 00:50:52.736468	2017-11-26 00:50:52.736468	A-278801-1356002090-9005.jpeg.jpg	image/jpeg	16440	2017-11-26 00:50:52.568954	Artist	633
699	2017-11-26 00:50:59.985476	2017-11-26 00:50:59.985476	A-2140737-1492113370-2588.jpeg.jpg	image/jpeg	110091	2017-11-26 00:50:59.730308	Artist	634
700	2017-11-26 00:51:06.69306	2017-11-26 00:51:06.69306	A-254555-1130191629.jpeg.jpg	image/jpeg	63684	2017-11-26 00:51:06.488591	Artist	323
701	2017-11-26 00:51:13.723846	2017-11-26 00:51:13.723846	A-745195-1367280186-1815.jpeg.jpg	image/jpeg	16410	2017-11-26 00:51:13.566675	Artist	636
702	2017-11-26 00:51:21.067609	2017-11-26 00:51:21.067609	A-5543751-1486116457-7247.jpeg.jpg	image/jpeg	143598	2017-11-26 00:51:20.733829	Artist	637
703	2017-11-26 00:51:27.916111	2017-11-26 00:51:27.916111	A-1184519-1497615638-5033.jpeg.jpg	image/jpeg	91207	2017-11-26 00:51:27.696604	Artist	638
704	2017-11-26 00:51:34.793729	2017-11-26 00:51:34.793729	A-470636-1455478331-3187.jpeg.jpg	image/jpeg	73630	2017-11-26 00:51:34.536125	Artist	639
705	2017-11-26 00:51:41.793858	2017-11-26 00:51:41.793858	A-317702-1177076160.jpeg.jpg	image/jpeg	13447	2017-11-26 00:51:41.651132	Artist	640
706	2017-11-26 00:51:55.950859	2017-11-26 00:51:55.950859	A-819292-1504480025-9304.jpeg.jpg	image/jpeg	71767	2017-11-26 00:51:55.697165	Artist	642
707	2017-11-26 00:52:02.676732	2017-11-26 00:52:02.676732	A-118928-1151511490.gif.jpg	image/jpeg	14230	2017-11-26 00:52:02.560265	Artist	643
708	2017-11-26 00:52:09.572908	2017-11-26 00:52:09.572908	A-33928-1081433421.jpg.jpg	image/jpeg	20256	2017-11-26 00:52:09.424491	Artist	644
709	2017-11-26 00:52:16.617966	2017-11-26 00:52:16.617966	A-156003-1150888388.jpeg.jpg	image/jpeg	38690	2017-11-26 00:52:16.453807	Artist	645
710	2017-11-26 00:52:23.603893	2017-11-26 00:52:23.603893	A-120532-1193252033.jpeg.jpg	image/jpeg	32228	2017-11-26 00:52:23.451545	Artist	646
711	2017-11-26 00:52:30.562742	2017-11-26 00:52:30.562742	A-419909-1200527653.jpeg.jpg	image/jpeg	24926	2017-11-26 00:52:30.414379	Artist	647
712	2017-11-26 00:52:37.685066	2017-11-26 00:52:37.685066	A-33927-1318775920.jpeg.jpg	image/jpeg	64996	2017-11-26 00:52:37.489783	Artist	648
713	2017-11-26 00:52:44.829787	2017-11-26 00:52:44.829787	A-719377-1511018782-7792.jpeg.jpg	image/jpeg	123100	2017-11-26 00:52:44.537425	Artist	649
714	2017-11-26 00:52:51.626694	2017-11-26 00:52:51.626694	A-118654-1302178996.jpeg.jpg	image/jpeg	36622	2017-11-26 00:52:51.445888	Artist	650
715	2017-11-26 00:52:58.827893	2017-11-26 00:52:58.827893	A-625137-1172405371.jpeg.jpg	image/jpeg	97953	2017-11-26 00:52:58.521675	Artist	651
716	2017-11-26 00:53:05.529716	2017-11-26 00:53:05.529716	A-160004-1216506536.jpeg.jpg	image/jpeg	14295	2017-11-26 00:53:05.405947	Artist	652
717	2017-11-26 00:53:12.675762	2017-11-26 00:53:12.675762	A-34027-1358096430-1419.jpeg.jpg	image/jpeg	45172	2017-11-26 00:53:12.483597	Artist	653
718	2017-11-26 00:53:19.710243	2017-11-26 00:53:19.710243	A-64532-1236990915.jpeg.jpg	image/jpeg	16322	2017-11-26 00:53:19.575781	Artist	654
719	2017-11-26 00:53:26.769999	2017-11-26 00:53:26.769999	A-62963-1441148504-5944.bmp.jpg	image/jpeg	33169	2017-11-26 00:53:26.583086	Artist	655
720	2017-11-26 00:53:33.6571	2017-11-26 00:53:33.6571	A-428784-1198195935.jpeg.jpg	image/jpeg	11964	2017-11-26 00:53:33.519056	Artist	656
721	2017-11-26 00:53:40.665833	2017-11-26 00:53:40.665833	A-88375-001.jpg.jpg	image/jpeg	52125	2017-11-26 00:53:40.490467	Artist	657
722	2017-11-26 00:53:47.718299	2017-11-26 00:53:47.718299	A-271422-1127133920.jpeg.jpg	image/jpeg	14991	2017-11-26 00:53:47.601068	Artist	658
723	2017-11-26 00:53:54.618018	2017-11-26 00:53:54.618018	A-641140-1284997506.jpeg.jpg	image/jpeg	31523	2017-11-26 00:53:54.467221	Artist	659
724	2017-11-26 00:54:01.829489	2017-11-26 00:54:01.829489	A-525146-1464363442-3725.jpeg.jpg	image/jpeg	39419	2017-11-26 00:54:01.668229	Artist	660
725	2017-11-26 00:54:08.51376	2017-11-26 00:54:08.51376	A-257650-1203021096.jpeg.jpg	image/jpeg	12823	2017-11-26 00:54:08.379629	Artist	661
726	2017-11-26 00:54:15.5869	2017-11-26 00:54:15.5869	A-281329-1343485786-9729.jpeg.jpg	image/jpeg	39912	2017-11-26 00:54:15.446712	Artist	662
727	2017-11-26 00:54:22.486791	2017-11-26 00:54:22.486791	A-256280-1194275179.jpeg.jpg	image/jpeg	6478	2017-11-26 00:54:22.358589	Artist	663
728	2017-11-26 00:54:29.590496	2017-11-26 00:54:29.590496	A-260500-1140653136.jpeg.jpg	image/jpeg	28235	2017-11-26 00:54:29.427048	Artist	664
729	2017-11-26 00:54:36.562141	2017-11-26 00:54:36.562141	A-256141-1343488095-1792.jpeg.jpg	image/jpeg	37251	2017-11-26 00:54:36.420773	Artist	249
730	2017-11-26 00:54:43.810731	2017-11-26 00:54:43.810731	A-281335-1300109238.jpeg.jpg	image/jpeg	16234	2017-11-26 00:54:43.682822	Artist	666
731	2017-11-26 00:54:50.789836	2017-11-26 00:54:50.789836	A-341129-1275326982.jpeg.jpg	image/jpeg	22731	2017-11-26 00:54:50.612969	Artist	667
732	2017-11-26 00:54:57.537062	2017-11-26 00:54:57.537062	A-256174-1292647207.jpeg.jpg	image/jpeg	13862	2017-11-26 00:54:57.393755	Artist	668
733	2017-11-26 00:55:04.640533	2017-11-26 00:55:04.640533	A-411892-1330771323.jpeg.jpg	image/jpeg	13407	2017-11-26 00:55:04.504644	Artist	669
734	2017-11-26 00:55:11.699523	2017-11-26 00:55:11.699523	A-347284-1490527837-2993.jpeg.jpg	image/jpeg	56208	2017-11-26 00:55:11.485761	Artist	670
735	2017-11-26 00:55:18.885488	2017-11-26 00:55:18.885488	A-2636463-1463122339-5357.jpeg.jpg	image/jpeg	77516	2017-11-26 00:55:18.655359	Artist	671
736	2017-11-26 00:55:25.827132	2017-11-26 00:55:25.827132	A-290331-1142845998.jpeg.jpg	image/jpeg	23441	2017-11-26 00:55:25.678801	Artist	672
737	2017-11-26 00:55:32.764981	2017-11-26 00:55:32.764981	A-290330-1112262139.jpg.jpg	image/jpeg	32612	2017-11-26 00:55:32.587224	Artist	673
738	2017-11-26 00:55:39.676057	2017-11-26 00:55:39.676057	A-252591-1124180478.jpg.jpg	image/jpeg	48413	2017-11-26 00:55:39.476998	Artist	674
739	2017-11-26 00:55:46.774707	2017-11-26 00:55:46.774707	A-710871-1343488312-4282.jpeg.jpg	image/jpeg	40440	2017-11-26 00:55:46.618665	Artist	675
740	2017-11-26 00:55:53.869105	2017-11-26 00:55:53.869105	A-296274-1147696267.jpeg.jpg	image/jpeg	72834	2017-11-26 00:55:53.649577	Artist	676
741	2017-11-26 00:56:00.918069	2017-11-26 00:56:00.918069	A-253205-1489672812-9171.jpeg.jpg	image/jpeg	59776	2017-11-26 00:56:00.709483	Artist	677
742	2017-11-26 00:56:07.747068	2017-11-26 00:56:07.747068	A-214846-1343487750-5676.jpeg.jpg	image/jpeg	36932	2017-11-26 00:56:07.596333	Artist	678
743	2017-11-26 00:56:14.800799	2017-11-26 00:56:14.800799	A-256283-1382275249-2562.jpeg.jpg	image/jpeg	151252	2017-11-26 00:56:14.555867	Artist	679
744	2017-11-26 00:56:21.949037	2017-11-26 00:56:21.949037	A-301166-1343484949-8853.jpeg.jpg	image/jpeg	43106	2017-11-26 00:56:21.786952	Artist	680
745	2017-11-26 00:56:29.138732	2017-11-26 00:56:29.138732	A-283804-1140652001.jpeg.jpg	image/jpeg	114048	2017-11-26 00:56:28.835571	Artist	681
746	2017-11-26 00:56:36.792747	2017-11-26 00:56:36.792747	A-290328-1145972822.jpeg.jpg	image/jpeg	32405	2017-11-26 00:56:36.587999	Artist	682
747	2017-11-26 00:56:43.726442	2017-11-26 00:56:43.726442	A-356438-1202755323.jpeg.jpg	image/jpeg	8663	2017-11-26 00:56:43.578103	Artist	683
748	2017-11-26 00:56:50.834413	2017-11-26 00:56:50.834413	A-252993-1412956974-1738.jpeg.jpg	image/jpeg	127491	2017-11-26 00:56:50.56518	Artist	684
749	2017-11-26 00:56:57.618079	2017-11-26 00:56:57.618079	A-92623-1415032275-6008.jpeg.jpg	image/jpeg	27400	2017-11-26 00:56:57.45427	Artist	685
750	2017-11-26 00:57:05.852053	2017-11-26 00:57:05.852053	A-29983-1343487165-6851.jpeg.jpg	image/jpeg	44075	2017-11-26 00:57:05.698367	Artist	686
751	2017-11-26 00:57:12.72753	2017-11-26 00:57:12.72753	A-12803-1316588096.jpeg.jpg	image/jpeg	46514	2017-11-26 00:57:12.526562	Artist	687
752	2017-11-26 00:57:19.66083	2017-11-26 00:57:19.66083	A-664810-1375542798-7158.jpeg.jpg	image/jpeg	13045	2017-11-26 00:57:19.523998	Artist	688
753	2017-11-26 00:57:26.849053	2017-11-26 00:57:26.849053	A-271690-1494694666-8303.jpeg.jpg	image/jpeg	63472	2017-11-26 00:57:26.657189	Artist	689
754	2017-11-26 00:57:33.709608	2017-11-26 00:57:33.709608	A-253203-1142846469.jpeg.jpg	image/jpeg	18367	2017-11-26 00:57:33.58438	Artist	690
755	2017-11-26 00:57:40.923522	2017-11-26 00:57:40.923522	A-173609-1125063004.jpg.jpg	image/jpeg	48730	2017-11-26 00:57:40.728177	Artist	691
756	2017-11-26 00:57:47.700606	2017-11-26 00:57:47.700606	A-272811-1390763691-1293.jpeg.jpg	image/jpeg	17675	2017-11-26 00:57:47.569691	Artist	692
757	2017-11-26 00:57:54.890959	2017-11-26 00:57:54.890959	A-322841-1343484540-3860.jpeg.jpg	image/jpeg	39868	2017-11-26 00:57:54.738404	Artist	693
758	2017-11-26 00:58:01.745363	2017-11-26 00:58:01.745363	A-220594-1209266589.jpeg.jpg	image/jpeg	86620	2017-11-26 00:58:01.517314	Artist	694
759	2017-11-26 00:58:08.741608	2017-11-26 00:58:08.741608	A-322844-1470795937-3414.jpeg.jpg	image/jpeg	28243	2017-11-26 00:58:08.574719	Artist	695
760	2017-11-26 00:58:15.791001	2017-11-26 00:58:15.791001	A-533295-1227820743.jpeg.jpg	image/jpeg	8063	2017-11-26 00:58:15.657645	Artist	696
761	2017-11-26 00:58:22.709812	2017-11-26 00:58:22.709812	A-334365-1194277668.jpeg.jpg	image/jpeg	18573	2017-11-26 00:58:22.57718	Artist	697
762	2017-11-26 00:58:29.579051	2017-11-26 00:58:29.579051	A-290334-1190071380.jpeg.jpg	image/jpeg	24449	2017-11-26 00:58:29.408888	Artist	698
763	2017-11-26 00:58:36.781769	2017-11-26 00:58:36.781769	A-574503-1343486786-9078.jpeg.jpg	image/jpeg	36421	2017-11-26 00:58:36.622798	Artist	699
764	2017-11-26 00:58:43.714348	2017-11-26 00:58:43.714348	A-222746-1343488484-4302.jpeg.jpg	image/jpeg	36025	2017-11-26 00:58:43.570619	Artist	700
765	2017-11-26 00:58:50.743194	2017-11-26 00:58:50.743194	A-253201-1146831241.jpeg.jpg	image/jpeg	43177	2017-11-26 00:58:50.544828	Artist	701
766	2017-11-26 00:58:57.824461	2017-11-26 00:58:57.824461	A-565349-1235861548.jpeg.jpg	image/jpeg	14431	2017-11-26 00:58:57.668297	Artist	702
767	2017-11-26 00:59:04.97891	2017-11-26 00:59:04.97891	A-252999-1343487484-9280.jpeg.jpg	image/jpeg	44184	2017-11-26 00:59:04.811578	Artist	703
768	2017-11-26 00:59:11.854895	2017-11-26 00:59:11.854895	A-350882-1289245270.jpeg.jpg	image/jpeg	30334	2017-11-26 00:59:11.691892	Artist	704
769	2017-11-26 00:59:18.771684	2017-11-26 00:59:18.771684	A-282895-1365918155-4992.jpeg.jpg	image/jpeg	88216	2017-11-26 00:59:18.504137	Artist	705
770	2017-11-26 00:59:25.817883	2017-11-26 00:59:25.817883	A-731585-1343487330-3777.jpeg.jpg	image/jpeg	41491	2017-11-26 00:59:25.656294	Artist	706
771	2017-11-26 00:59:32.931191	2017-11-26 00:59:32.931191	A-271688-1494694730-7782.jpeg.jpg	image/jpeg	88327	2017-11-26 00:59:32.696382	Artist	707
772	2017-11-26 00:59:39.702677	2017-11-26 00:59:39.702677	A-322847-1284830160.jpeg.jpg	image/jpeg	15719	2017-11-26 00:59:39.57116	Artist	708
773	2017-11-26 00:59:46.568881	2017-11-26 00:59:46.568881	A-296279-1136330013.jpeg.jpg	image/jpeg	20299	2017-11-26 00:59:46.407484	Artist	709
774	2017-11-26 00:59:53.72474	2017-11-26 00:59:53.72474	A-296275-1194278418.jpeg.jpg	image/jpeg	18381	2017-11-26 00:59:53.590413	Artist	710
775	2017-11-26 01:00:00.66673	2017-11-26 01:00:00.66673	A-283800-1140711334.jpeg.jpg	image/jpeg	9076	2017-11-26 01:00:00.528631	Artist	711
776	2017-11-26 01:00:07.484125	2017-11-26 01:00:07.484125	A-782-001.jpg.jpg	image/jpeg	11788	2017-11-26 01:00:07.350554	Artist	712
777	2017-11-26 01:00:15.643771	2017-11-26 01:00:15.643771	A-132067-1111950333.jpeg.jpg	image/jpeg	7365	2017-11-26 01:00:15.516408	Artist	713
778	2017-11-26 01:00:22.722864	2017-11-26 01:00:22.722864	A-351353-1417997623-3747.jpeg.jpg	image/jpeg	24633	2017-11-26 01:00:22.574202	Artist	714
779	2017-11-26 01:00:29.698931	2017-11-26 01:00:29.698931	A-290332-1142847259.jpeg.jpg	image/jpeg	19230	2017-11-26 01:00:29.566887	Artist	715
780	2017-11-26 01:00:42.838893	2017-11-26 01:00:42.838893	A-257654-1142847541.jpeg.jpg	image/jpeg	57676	2017-11-26 01:00:42.632693	Artist	717
781	2017-11-26 01:00:49.66717	2017-11-26 01:00:49.66717	A-1277301-1284997260.jpeg.jpg	image/jpeg	9427	2017-11-26 01:00:49.522774	Artist	718
782	2017-11-26 01:00:56.606	2017-11-26 01:00:56.606	A-257647-1145973365.jpeg.jpg	image/jpeg	9813	2017-11-26 01:00:56.501696	Artist	719
783	2017-11-26 01:01:03.713893	2017-11-26 01:01:03.713893	A-322845-1323275224.jpeg.jpg	image/jpeg	18355	2017-11-26 01:01:03.569286	Artist	720
784	2017-11-26 01:01:11.069705	2017-11-26 01:01:11.069705	A-1691868-1384220691-2276.jpeg.jpg	image/jpeg	118991	2017-11-26 01:01:10.82246	Artist	721
785	2017-11-26 01:01:17.70989	2017-11-26 01:01:17.70989	A-341130-1268509332.jpeg.jpg	image/jpeg	82290	2017-11-26 01:01:17.50172	Artist	722
786	2017-11-26 01:01:24.914162	2017-11-26 01:01:24.914162	A-347510-1324646542.jpeg.jpg	image/jpeg	67263	2017-11-26 01:01:24.727739	Artist	723
787	2017-11-26 01:01:31.810384	2017-11-26 01:01:31.810384	A-2530965-1358633974-5512.jpeg.jpg	image/jpeg	44821	2017-11-26 01:01:31.643457	Artist	724
788	2017-11-26 01:01:38.760541	2017-11-26 01:01:38.760541	A-322843-1343487845-9135.jpeg.jpg	image/jpeg	40784	2017-11-26 01:01:38.596226	Artist	725
789	2017-11-26 01:01:46.648635	2017-11-26 01:01:46.648635	A-35199-1148829988.jpeg.jpg	image/jpeg	45289	2017-11-26 01:01:46.475647	Artist	726
790	2017-11-26 01:01:53.857637	2017-11-26 01:01:53.857637	A-280191-1162141790.jpeg.jpg	image/jpeg	39310	2017-11-26 01:01:53.682616	Artist	727
791	2017-11-26 01:02:00.653573	2017-11-26 01:02:00.653573	A-253240-1429987916-9900.jpeg.jpg	image/jpeg	25209	2017-11-26 01:02:00.440203	Artist	728
792	2017-11-26 01:02:07.778634	2017-11-26 01:02:07.778634	A-21073-1118619489.jpg.jpg	image/jpeg	51418	2017-11-26 01:02:07.611891	Artist	729
793	2017-11-26 01:02:14.698005	2017-11-26 01:02:14.698005	A-220594-1209266589.jpeg.jpg	image/jpeg	86620	2017-11-26 01:02:14.496152	Artist	730
794	2017-11-26 01:02:21.481546	2017-11-26 01:02:21.481546	A-252397-1190716935.jpeg.jpg	image/jpeg	13355	2017-11-26 01:02:21.351677	Artist	731
795	2017-11-26 01:02:28.52374	2017-11-26 01:02:28.52374	A-136179-1108227452.jpg.jpg	image/jpeg	9065	2017-11-26 01:02:28.356373	Artist	732
796	2017-11-26 01:02:36.078916	2017-11-26 01:02:36.078916	A-33737-002.jpg.jpg	image/jpeg	73495	2017-11-26 01:02:35.852235	Artist	733
797	2017-11-26 01:02:42.632812	2017-11-26 01:02:42.632812	A-111855-1106178901.jpg.jpg	image/jpeg	8823	2017-11-26 01:02:42.510178	Artist	734
798	2017-11-26 01:02:49.920705	2017-11-26 01:02:49.920705	A-253242-1140351629.jpeg.jpg	image/jpeg	88390	2017-11-26 01:02:49.669884	Artist	735
799	2017-11-26 01:02:56.664379	2017-11-26 01:02:56.664379	A-252398-1117727242.jpg.jpg	image/jpeg	11854	2017-11-26 01:02:56.526471	Artist	736
800	2017-11-26 01:03:03.818051	2017-11-26 01:03:03.818051	A-260958-1309353749.jpeg.jpg	image/jpeg	22086	2017-11-26 01:03:03.635893	Artist	737
801	2017-11-26 01:03:11.904846	2017-11-26 01:03:11.904846	A-846556-1436635680-6285.jpeg.jpg	image/jpeg	70300	2017-11-26 01:03:11.702154	Artist	738
802	2017-11-26 01:03:25.331943	2017-11-26 01:03:25.331943	A-1694157-1357926646-2825.jpeg.jpg	image/jpeg	30550	2017-11-26 01:03:25.170222	Artist	740
803	2017-11-26 01:03:32.633134	2017-11-26 01:03:32.633134	A-34347-1133639785.jpeg.jpg	image/jpeg	40720	2017-11-26 01:03:32.443472	Artist	741
804	2017-11-26 01:03:39.729082	2017-11-26 01:03:39.729082	A-17135-1499366717-8343.jpeg.jpg	image/jpeg	60227	2017-11-26 01:03:39.518046	Artist	742
805	2017-11-26 01:03:46.58216	2017-11-26 01:03:46.58216	A-10361-1102373272.jpg.jpg	image/jpeg	28554	2017-11-26 01:03:46.41738	Artist	743
806	2017-11-26 01:03:59.736597	2017-11-26 01:03:59.736597	A-456719-1438047257-7289.jpeg.jpg	image/jpeg	76670	2017-11-26 01:03:59.504413	Artist	745
807	2017-11-26 01:04:07.738268	2017-11-26 01:04:07.738268	A-456718-1457028621-5122.jpeg.jpg	image/jpeg	25047	2017-11-26 01:04:07.592914	Artist	746
808	2017-11-26 01:04:14.684869	2017-11-26 01:04:14.684869	A-2373930-1420315090-4707.jpeg.jpg	image/jpeg	54173	2017-11-26 01:04:14.481642	Artist	747
809	2017-11-26 01:04:21.711061	2017-11-26 01:04:21.711061	A-537229-1164944070.jpeg.jpg	image/jpeg	17925	2017-11-26 01:04:21.562372	Artist	748
810	2017-11-26 01:04:28.762823	2017-11-26 01:04:28.762823	A-447638-1376296430-8743.jpeg.jpg	image/jpeg	85662	2017-11-26 01:04:28.506519	Artist	749
811	2017-11-26 01:04:35.970699	2017-11-26 01:04:35.970699	A-148867-1447077891-2143.jpeg.jpg	image/jpeg	112882	2017-11-26 01:04:35.714916	Artist	750
812	2017-11-26 01:04:49.144872	2017-11-26 01:04:49.144872	A-224403-1192658097.jpeg.jpg	image/jpeg	35669	2017-11-26 01:04:48.984721	Artist	752
813	2017-11-26 01:04:57.630682	2017-11-26 01:04:57.630682	A-10360-1324890457.png.jpg	image/jpeg	38020	2017-11-26 01:04:57.433117	Artist	753
814	2017-11-26 01:05:04.623414	2017-11-26 01:05:04.623414	A-488392-1278507456.gif.jpg	image/jpeg	7652	2017-11-26 01:05:04.518457	Artist	754
815	2017-11-26 01:05:17.70499	2017-11-26 01:05:17.70499	A-472503-1278508051.jpeg.jpg	image/jpeg	67013	2017-11-26 01:05:17.502235	Artist	756
816	2017-11-26 01:05:25.071437	2017-11-26 01:05:25.071437	A-95871-1146653398.jpeg.jpg	image/jpeg	101388	2017-11-26 01:05:24.855767	Artist	757
817	2017-11-26 01:05:31.591505	2017-11-26 01:05:31.591505	A-129359-1143318383.jpeg.jpg	image/jpeg	40072	2017-11-26 01:05:31.44364	Artist	758
818	2017-11-26 01:05:38.704208	2017-11-26 01:05:38.704208	A-54855-1459018793-2460.jpeg.jpg	image/jpeg	56122	2017-11-26 01:05:38.461375	Artist	759
819	2017-11-26 01:05:45.486496	2017-11-26 01:05:45.486496	A-513953-1148901691.jpeg.jpg	image/jpeg	9845	2017-11-26 01:05:45.351365	Artist	760
820	2017-11-26 01:05:52.522657	2017-11-26 01:05:52.522657	A-129451-1148901764.jpeg.jpg	image/jpeg	13840	2017-11-26 01:05:52.412586	Artist	761
821	2017-11-26 01:05:59.841299	2017-11-26 01:05:59.841299	A-432985-1142255655.jpeg.jpg	image/jpeg	65761	2017-11-26 01:05:59.65079	Artist	762
822	2017-11-26 01:06:06.678831	2017-11-26 01:06:06.678831	A-513954-1384105660-2140.jpeg.jpg	image/jpeg	70727	2017-11-26 01:06:06.491698	Artist	763
823	2017-11-26 01:06:13.682305	2017-11-26 01:06:13.682305	A-22152-1482932638-3360.jpeg.jpg	image/jpeg	57002	2017-11-26 01:06:13.497603	Artist	764
824	2017-11-26 01:06:26.633989	2017-11-26 01:06:26.633989	A-472502-1201044301.jpeg.jpg	image/jpeg	12778	2017-11-26 01:06:26.521627	Artist	766
825	2017-11-26 01:06:34.661107	2017-11-26 01:06:34.661107	A-48275-1320658704.jpeg.jpg	image/jpeg	41798	2017-11-26 01:06:34.45264	Artist	767
826	2017-11-26 01:06:41.600839	2017-11-26 01:06:41.600839	A-122232-1229434747.png.jpg	image/jpeg	19990	2017-11-26 01:06:41.432443	Artist	768
827	2017-11-26 01:06:48.646282	2017-11-26 01:06:48.646282	A-108870-1146662843.jpeg.jpg	image/jpeg	37465	2017-11-26 01:06:48.439471	Artist	769
828	2017-11-26 01:06:55.643608	2017-11-26 01:06:55.643608	A-898199-1400321721-2552.png.jpg	image/jpeg	45063	2017-11-26 01:06:55.470899	Artist	770
829	2017-11-26 01:07:02.562176	2017-11-26 01:07:02.562176	A-364862-1437675239-7773.jpeg.jpg	image/jpeg	22429	2017-11-26 01:07:02.418217	Artist	771
830	2017-11-26 01:07:15.787649	2017-11-26 01:07:15.787649	A-82605-1168949908.jpeg.jpg	image/jpeg	38404	2017-11-26 01:07:15.60457	Artist	773
831	2017-11-26 01:07:22.586137	2017-11-26 01:07:22.586137	A-257510-1273257202.jpeg.jpg	image/jpeg	35472	2017-11-26 01:07:22.437986	Artist	774
832	2017-11-26 01:07:29.680233	2017-11-26 01:07:29.680233	A-271353-1143142538.jpeg.jpg	image/jpeg	62949	2017-11-26 01:07:29.48159	Artist	775
833	2017-11-26 01:07:36.831577	2017-11-26 01:07:36.831577	A-655618-1467038305-7616.jpeg.jpg	image/jpeg	25802	2017-11-26 01:07:36.65966	Artist	776
834	2017-11-26 01:07:43.697442	2017-11-26 01:07:43.697442	A-497347-1260710865.jpeg.jpg	image/jpeg	17113	2017-11-26 01:07:43.579757	Artist	777
835	2017-11-26 01:07:50.56705	2017-11-26 01:07:50.56705	A-257512-1439457600-3833.jpeg.jpg	image/jpeg	30911	2017-11-26 01:07:50.415709	Artist	778
836	2017-11-26 01:07:58.211205	2017-11-26 01:07:58.211205	A-400203-1250006231.jpeg.jpg	image/jpeg	17851	2017-11-26 01:07:58.081692	Artist	779
837	2017-11-26 01:08:05.819458	2017-11-26 01:08:05.819458	A-1314661-1230079488.jpeg.jpg	image/jpeg	30108	2017-11-26 01:08:05.684484	Artist	780
838	2017-11-26 01:08:18.662563	2017-11-26 01:08:18.662563	A-345025-1347513916-5408.jpeg.jpg	image/jpeg	53750	2017-11-26 01:08:18.478518	Artist	782
839	2017-11-26 01:08:31.689523	2017-11-26 01:08:31.689523	A-767455-1230078510.jpeg.jpg	image/jpeg	15560	2017-11-26 01:08:31.572439	Artist	784
840	2017-11-26 01:08:38.587816	2017-11-26 01:08:38.587816	A-304835-1350751359-1704.jpeg.jpg	image/jpeg	23383	2017-11-26 01:08:38.431062	Artist	785
841	2017-11-26 01:08:51.63911	2017-11-26 01:08:51.63911	A-1171551-1398124580-8095.jpeg.jpg	image/jpeg	10227	2017-11-26 01:08:51.520078	Artist	787
842	2017-11-26 01:09:04.929126	2017-11-26 01:09:04.929126	A-751893-1495168941-9741.jpeg.jpg	image/jpeg	75688	2017-11-26 01:09:04.718355	Artist	789
843	2017-11-26 01:09:12.136559	2017-11-26 01:09:12.136559	A-1005695-1398123406-6846.jpeg.jpg	image/jpeg	47711	2017-11-26 01:09:11.975234	Artist	790
844	2017-11-26 01:09:20.010897	2017-11-26 01:09:20.010897	A-646807-1491463113-5453.jpeg.jpg	image/jpeg	66296	2017-11-26 01:09:19.780106	Artist	791
845	2017-11-26 01:09:39.609652	2017-11-26 01:09:39.609652	A-25411-1318590568.jpeg.jpg	image/jpeg	16731	2017-11-26 01:09:39.40898	Artist	794
846	2017-11-26 01:09:46.716509	2017-11-26 01:09:46.716509	A-132774-1318839499.jpeg.jpg	image/jpeg	43453	2017-11-26 01:09:46.512197	Artist	795
847	2017-11-26 01:09:53.722406	2017-11-26 01:09:53.722406	A-27158-1445856863-4697.jpeg.jpg	image/jpeg	42982	2017-11-26 01:09:53.511324	Artist	796
848	2017-11-26 01:10:00.887459	2017-11-26 01:10:00.887459	A-26847-1489926570-3132.jpeg.jpg	image/jpeg	145543	2017-11-26 01:10:00.590791	Artist	797
849	2017-11-26 01:10:07.621327	2017-11-26 01:10:07.621327	A-37365-1223829217.jpeg.jpg	image/jpeg	33464	2017-11-26 01:10:07.45462	Artist	798
850	2017-11-26 01:10:14.673607	2017-11-26 01:10:14.673607	A-462399-1297050693.jpeg.jpg	image/jpeg	47504	2017-11-26 01:10:14.478305	Artist	799
851	2017-11-26 01:10:21.602634	2017-11-26 01:10:21.602634	A-1694157-1357926646-2825.jpeg.jpg	image/jpeg	30550	2017-11-26 01:10:21.441086	Artist	800
852	2017-11-26 01:10:28.710002	2017-11-26 01:10:28.710002	A-541898-1264014981.jpeg.jpg	image/jpeg	85850	2017-11-26 01:10:28.498925	Artist	801
853	2017-11-26 01:10:35.850398	2017-11-26 01:10:35.850398	A-1209436-1392982079-5746.jpeg.jpg	image/jpeg	61952	2017-11-26 01:10:35.639261	Artist	802
854	2017-11-26 01:10:43.762833	2017-11-26 01:10:43.762833	A-373381-1264182719.jpeg.jpg	image/jpeg	67905	2017-11-26 01:10:43.510654	Artist	803
855	2017-11-26 01:10:50.732655	2017-11-26 01:10:50.732655	A-393567-1196260644.gif.jpg	image/jpeg	14193	2017-11-26 01:10:50.60569	Artist	804
856	2017-11-26 01:10:57.564487	2017-11-26 01:10:57.564487	A-408566-1150888711.jpeg.jpg	image/jpeg	30131	2017-11-26 01:10:57.424978	Artist	805
857	2017-11-26 01:11:04.495801	2017-11-26 01:11:04.495801	A-633901-1502021542-2695.jpeg.jpg	image/jpeg	13032	2017-11-26 01:11:04.367501	Artist	806
858	2017-11-26 01:11:11.704157	2017-11-26 01:11:11.704157	A-22862-1319622151.jpeg.jpg	image/jpeg	27258	2017-11-26 01:11:11.466613	Artist	807
859	2017-11-26 01:11:18.516746	2017-11-26 01:11:18.516746	A-388633-1196260562.jpeg.jpg	image/jpeg	13122	2017-11-26 01:11:18.370393	Artist	808
860	2017-11-26 01:11:25.921695	2017-11-26 01:11:25.921695	A-220621-1488205404-8037.jpeg.jpg	image/jpeg	53463	2017-11-26 01:11:25.726474	Artist	809
861	2017-11-26 01:11:32.864779	2017-11-26 01:11:32.864779	A-37955-1342809288-9375.jpeg.jpg	image/jpeg	57910	2017-11-26 01:11:32.664934	Artist	810
862	2017-11-26 01:11:39.656714	2017-11-26 01:11:39.656714	A-92412-1319622010.jpeg.jpg	image/jpeg	25573	2017-11-26 01:11:39.431432	Artist	811
863	2017-11-26 01:11:46.683789	2017-11-26 01:11:46.683789	A-364272-1319622112.jpeg.jpg	image/jpeg	25817	2017-11-26 01:11:46.454951	Artist	812
864	2017-11-26 01:11:53.572845	2017-11-26 01:11:53.572845	A-33928-1081433421.jpg.jpg	image/jpeg	20256	2017-11-26 01:11:53.421586	Artist	813
865	2017-11-26 01:12:00.558091	2017-11-26 01:12:00.558091	A-156003-1150888388.jpeg.jpg	image/jpeg	38690	2017-11-26 01:12:00.405044	Artist	645
866	2017-11-26 01:12:07.574547	2017-11-26 01:12:07.574547	A-120532-1193252033.jpeg.jpg	image/jpeg	32228	2017-11-26 01:12:07.412096	Artist	815
867	2017-11-26 01:12:14.579215	2017-11-26 01:12:14.579215	A-419909-1200527653.jpeg.jpg	image/jpeg	24926	2017-11-26 01:12:14.416725	Artist	816
868	2017-11-26 01:12:21.663536	2017-11-26 01:12:21.663536	A-33927-1318775920.jpeg.jpg	image/jpeg	64996	2017-11-26 01:12:21.47679	Artist	648
869	2017-11-26 01:12:28.882305	2017-11-26 01:12:28.882305	A-719377-1511018782-7792.jpeg.jpg	image/jpeg	123100	2017-11-26 01:12:28.565523	Artist	818
870	2017-11-26 01:12:35.649028	2017-11-26 01:12:35.649028	A-118345-1504218353-3728.jpeg.jpg	image/jpeg	40399	2017-11-26 01:12:35.427899	Artist	819
871	2017-11-26 01:12:43.407285	2017-11-26 01:12:43.407285	A-636544-1394997201-5239.jpeg.jpg	image/jpeg	40443	2017-11-26 01:12:43.206442	Artist	820
872	2017-11-26 01:12:50.756346	2017-11-26 01:12:50.756346	A-457994-1183726444.jpeg.jpg	image/jpeg	18300	2017-11-26 01:12:50.616539	Artist	821
873	2017-11-26 01:12:57.511036	2017-11-26 01:12:57.511036	A-151718-1147288141.jpeg.jpg	image/jpeg	9502	2017-11-26 01:12:57.376328	Artist	822
874	2017-11-26 01:13:04.757769	2017-11-26 01:13:04.757769	A-424278-1508607066-9239.jpeg.jpg	image/jpeg	125311	2017-11-26 01:13:04.537166	Artist	823
875	2017-11-26 01:13:11.824181	2017-11-26 01:13:11.824181	A-3775-1436865982-8335.jpeg.jpg	image/jpeg	145391	2017-11-26 01:13:11.561488	Artist	824
876	2017-11-26 01:13:18.72676	2017-11-26 01:13:18.72676	A-310689-1189849413.jpeg.jpg	image/jpeg	97362	2017-11-26 01:13:18.508812	Artist	568
877	2017-11-26 01:13:31.664592	2017-11-26 01:13:31.664592	A-576991-1196113972.jpeg.jpg	image/jpeg	51589	2017-11-26 01:13:31.46716	Artist	570
879	2017-11-27 17:23:08.460598	2017-11-27 17:23:08.460598	Monster_Magnet_-_Spine_of_God.jpg	image/jpeg	297773	2017-11-27 17:23:08.301744	Band	104
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('photos_id_seq', 879, true);


--
-- Data for Name: record_libraries; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY record_libraries (id, user_id, album_id, created_at, updated_at) FROM stdin;
22	205	11	2017-11-25 21:46:22.683328	2017-11-25 21:46:22.683328
23	206	76	2017-11-27 17:09:55.049669	2017-11-27 17:09:55.049669
\.


--
-- Name: record_libraries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('record_libraries_id_seq', 23, true);


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
20171113175455
20171113182649
20171113182715
20171113200115
20171124173354
20171124173355
20171124173356
20171124173357
20171128165422
20171128180952
\.


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: frcake
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
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('songs_id_seq', 1354, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: frcake
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
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('tracks_id_seq', 1362, true);


--
-- Data for Name: user_vectors; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY user_vectors (id, user_id, dimensions, created_at, updated_at, metal, country, classical, jazz, reggae, blues, pop, instrumental, vocal, electronica, techno, punk, drum_n_bass, indie, alternative, dubstep, rock, hip_hop, dance, rnb) FROM stdin;
7	7	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.088723	2017-11-28 18:07:33.132195	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
13	14	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.108994	2017-11-28 18:07:33.163069	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
18	19	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.125797	2017-11-28 18:07:33.184801	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
24	25	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.146393	2017-11-28 18:07:33.211077	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
30	31	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.166579	2017-11-28 18:07:33.237421	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
35	36	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.183139	2017-11-28 18:07:33.259607	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
41	42	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.202024	2017-11-28 18:07:33.286127	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
46	49	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.218869	2017-11-28 18:07:33.308049	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
52	55	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.239491	2017-11-28 18:07:33.33411	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
58	61	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.259377	2017-11-28 18:07:33.35972	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
63	66	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.276368	2017-11-28 18:07:33.38533	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
69	72	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.296159	2017-11-28 18:07:33.410456	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
75	78	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.316136	2017-11-28 18:07:33.43543	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
80	83	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.333134	2017-11-28 18:07:33.456533	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
86	89	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.352857	2017-11-28 18:07:33.481686	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
92	95	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.381793	2017-11-28 18:07:33.506834	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
97	100	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.397538	2017-11-28 18:07:33.527824	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
103	106	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.417269	2017-11-28 18:07:33.55298	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
109	112	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.435672	2017-11-28 18:07:33.577966	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
114	117	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.451413	2017-11-28 18:07:33.598773	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
120	123	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.471095	2017-11-28 18:07:33.623961	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
125	128	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.488739	2017-11-28 18:07:33.647536	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
131	134	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.511081	2017-11-28 18:07:33.678247	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
11	11	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.101708	2017-11-28 18:07:33.153972	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
1	44	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.066578	2017-11-28 18:07:33.092081	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
2	45	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.071038	2017-11-28 18:07:33.102748	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
3	3	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.074825	2017-11-28 18:07:33.109496	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
4	4	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.078295	2017-11-28 18:07:33.114267	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
5	5	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.081648	2017-11-28 18:07:33.118703	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
6	6	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.084904	2017-11-28 18:07:33.122931	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
8	8	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.09192	2017-11-28 18:07:33.139878	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
9	9	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.095243	2017-11-28 18:07:33.144922	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
10	10	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.098438	2017-11-28 18:07:33.149483	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
12	13	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.105202	2017-11-28 18:07:33.158263	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
14	15	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.112268	2017-11-28 18:07:33.1674	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
140	143	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.541051	2017-11-28 18:07:33.724567	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
146	149	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.560439	2017-11-28 18:07:33.755062	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
151	154	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.576407	2017-11-28 18:07:33.780349	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
157	160	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.596061	2017-11-28 18:07:33.811326	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
163	166	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.615046	2017-11-28 18:07:33.839496	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
168	171	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.630109	2017-11-28 18:07:33.864224	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
174	177	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.648511	2017-11-28 18:07:33.890993	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
180	183	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.668448	2017-11-28 18:07:33.917191	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
185	188	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.685197	2017-11-28 18:07:33.939501	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
191	194	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.705305	2017-11-28 18:07:33.965964	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
196	199	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.722023	2017-11-28 18:07:33.988569	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
202	205	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.740584	2017-11-28 18:07:34.014612	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
15	16	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.115977	2017-11-28 18:07:33.171796	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
16	17	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.119251	2017-11-28 18:07:33.176099	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
17	18	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.122721	2017-11-28 18:07:33.180567	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
19	20	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.129146	2017-11-28 18:07:33.189201	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
20	21	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.132397	2017-11-28 18:07:33.193443	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
21	22	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.135854	2017-11-28 18:07:33.197961	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
22	23	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.139363	2017-11-28 18:07:33.202409	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
23	24	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.142607	2017-11-28 18:07:33.206934	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
25	26	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.149763	2017-11-28 18:07:33.215794	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
26	27	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.153153	2017-11-28 18:07:33.219939	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
27	28	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.156542	2017-11-28 18:07:33.224416	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
28	29	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.159767	2017-11-28 18:07:33.228603	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
29	30	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.163071	2017-11-28 18:07:33.23322	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
31	32	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.170158	2017-11-28 18:07:33.241987	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
32	33	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.173634	2017-11-28 18:07:33.246323	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
33	34	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.176817	2017-11-28 18:07:33.250704	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
34	35	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.179988	2017-11-28 18:07:33.255115	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
36	37	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.186445	2017-11-28 18:07:33.263919	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
37	38	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.18968	2017-11-28 18:07:33.268753	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
38	39	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.192681	2017-11-28 18:07:33.273064	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
39	40	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.195774	2017-11-28 18:07:33.277381	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
40	41	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.198845	2017-11-28 18:07:33.281937	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
42	43	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.205599	2017-11-28 18:07:33.290602	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
43	46	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.208946	2017-11-28 18:07:33.294851	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
44	47	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.212338	2017-11-28 18:07:33.299384	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
45	48	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.215616	2017-11-28 18:07:33.303681	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
47	50	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.222812	2017-11-28 18:07:33.312508	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
48	51	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.226161	2017-11-28 18:07:33.316861	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
49	52	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.229429	2017-11-28 18:07:33.32135	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
50	53	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.232607	2017-11-28 18:07:33.325408	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
51	54	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.235834	2017-11-28 18:07:33.329924	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
53	56	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.24289	2017-11-28 18:07:33.33845	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
54	57	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.246152	2017-11-28 18:07:33.342715	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
55	58	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.249368	2017-11-28 18:07:33.347012	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
56	59	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.252725	2017-11-28 18:07:33.351308	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
57	60	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.256014	2017-11-28 18:07:33.355399	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
59	62	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.262638	2017-11-28 18:07:33.36505	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
60	63	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.2659	2017-11-28 18:07:33.372051	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
61	64	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.269188	2017-11-28 18:07:33.376804	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
62	65	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.272675	2017-11-28 18:07:33.381187	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
64	67	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.279797	2017-11-28 18:07:33.389429	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
65	68	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.283061	2017-11-28 18:07:33.393758	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
66	69	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.286508	2017-11-28 18:07:33.397753	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
67	70	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.289782	2017-11-28 18:07:33.401945	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
68	71	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.292969	2017-11-28 18:07:33.406048	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
70	73	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.299368	2017-11-28 18:07:33.414659	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
71	74	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.302662	2017-11-28 18:07:33.418631	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
72	75	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.30617	2017-11-28 18:07:33.422736	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
73	76	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.309592	2017-11-28 18:07:33.426776	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
74	77	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.312898	2017-11-28 18:07:33.430946	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
76	79	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.319391	2017-11-28 18:07:33.439502	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
77	80	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.323245	2017-11-28 18:07:33.444019	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
78	81	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.326614	2017-11-28 18:07:33.448122	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
79	82	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.329929	2017-11-28 18:07:33.452494	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
81	84	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.336378	2017-11-28 18:07:33.460456	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
82	85	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.339743	2017-11-28 18:07:33.464985	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
83	86	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.342921	2017-11-28 18:07:33.469056	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
84	87	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.346135	2017-11-28 18:07:33.473453	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
85	88	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.349444	2017-11-28 18:07:33.477575	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
87	90	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.36527	2017-11-28 18:07:33.486096	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
88	91	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.368596	2017-11-28 18:07:33.490053	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
89	92	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.372037	2017-11-28 18:07:33.494442	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
90	93	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.375403	2017-11-28 18:07:33.49862	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
91	94	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.378664	2017-11-28 18:07:33.502494	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
93	96	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.385062	2017-11-28 18:07:33.510829	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
94	97	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.388442	2017-11-28 18:07:33.515433	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
95	98	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.391523	2017-11-28 18:07:33.519526	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
96	99	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.39449	2017-11-28 18:07:33.523393	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
98	101	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.400963	2017-11-28 18:07:33.531919	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
99	102	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.404268	2017-11-28 18:07:33.536239	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
100	103	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.407648	2017-11-28 18:07:33.54045	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
101	104	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.410978	2017-11-28 18:07:33.544362	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
102	105	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.414143	2017-11-28 18:07:33.548884	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
104	107	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.420536	2017-11-28 18:07:33.556817	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
105	108	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.423668	2017-11-28 18:07:33.561226	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
106	109	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.426608	2017-11-28 18:07:33.565298	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
107	110	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.429683	2017-11-28 18:07:33.569696	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
108	111	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.43266	2017-11-28 18:07:33.573844	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
110	113	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.438944	2017-11-28 18:07:33.582333	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
111	114	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.442308	2017-11-28 18:07:33.58626	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
112	115	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.445348	2017-11-28 18:07:33.590539	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
113	116	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.448339	2017-11-28 18:07:33.594628	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
115	118	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.454643	2017-11-28 18:07:33.603256	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
116	119	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.457722	2017-11-28 18:07:33.607231	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
117	120	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.460823	2017-11-28 18:07:33.611417	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
118	121	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.464194	2017-11-28 18:07:33.615593	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
119	122	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.467621	2017-11-28 18:07:33.619706	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
121	124	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.474883	2017-11-28 18:07:33.627869	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
122	125	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.478312	2017-11-28 18:07:33.631997	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
123	126	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.481763	2017-11-28 18:07:33.639285	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
124	127	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.485208	2017-11-28 18:07:33.643554	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
126	129	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.491809	2017-11-28 18:07:33.6525	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
127	130	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.495127	2017-11-28 18:07:33.65773	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
128	131	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.498189	2017-11-28 18:07:33.663054	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
129	132	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.501249	2017-11-28 18:07:33.668188	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
130	133	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.506227	2017-11-28 18:07:33.673376	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
132	135	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.514364	2017-11-28 18:07:33.683559	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
133	136	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.517566	2017-11-28 18:07:33.688595	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
134	137	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.521008	2017-11-28 18:07:33.693472	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
135	138	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.524205	2017-11-28 18:07:33.698906	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
136	139	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.52742	2017-11-28 18:07:33.703955	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
137	140	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.530519	2017-11-28 18:07:33.708966	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
138	141	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.534194	2017-11-28 18:07:33.714121	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
139	142	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.537784	2017-11-28 18:07:33.719116	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
141	144	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.544155	2017-11-28 18:07:33.729775	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
142	145	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.547352	2017-11-28 18:07:33.734652	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
143	146	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.550493	2017-11-28 18:07:33.739801	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
144	147	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.554048	2017-11-28 18:07:33.745011	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
145	148	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.557371	2017-11-28 18:07:33.749894	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
147	150	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.563447	2017-11-28 18:07:33.760147	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
148	151	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.566522	2017-11-28 18:07:33.765067	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
149	152	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.569824	2017-11-28 18:07:33.770324	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
150	153	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.573192	2017-11-28 18:07:33.775366	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
152	155	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.57974	2017-11-28 18:07:33.785709	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
153	156	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.582968	2017-11-28 18:07:33.790776	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
154	157	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.586366	2017-11-28 18:07:33.795673	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
155	158	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.589682	2017-11-28 18:07:33.801251	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
156	159	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.59286	2017-11-28 18:07:33.806178	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
158	161	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.599255	2017-11-28 18:07:33.816687	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
159	162	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.602506	2017-11-28 18:07:33.821475	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
160	163	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.605827	2017-11-28 18:07:33.825868	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
161	164	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.608905	2017-11-28 18:07:33.830214	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
162	165	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.611963	2017-11-28 18:07:33.834878	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
164	167	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.618008	2017-11-28 18:07:33.846714	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
165	168	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.621309	2017-11-28 18:07:33.850827	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
166	169	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.62424	2017-11-28 18:07:33.855563	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
167	170	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.627201	2017-11-28 18:07:33.859846	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
169	172	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.633112	2017-11-28 18:07:33.868408	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
170	173	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.636302	2017-11-28 18:07:33.873271	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
171	174	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.639552	2017-11-28 18:07:33.877486	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
172	175	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.642519	2017-11-28 18:07:33.88217	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
173	176	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.645529	2017-11-28 18:07:33.886527	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
175	178	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.651545	2017-11-28 18:07:33.895416	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
176	179	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.654958	2017-11-28 18:07:33.899665	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
177	180	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.658325	2017-11-28 18:07:33.904193	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
178	181	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.66172	2017-11-28 18:07:33.908304	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
179	182	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.665173	2017-11-28 18:07:33.913037	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
181	184	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.672059	2017-11-28 18:07:33.921644	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
182	185	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.675535	2017-11-28 18:07:33.926112	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
183	186	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.678775	2017-11-28 18:07:33.930728	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
184	187	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.681956	2017-11-28 18:07:33.93493	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
186	189	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.688697	2017-11-28 18:07:33.943832	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
187	190	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.691969	2017-11-28 18:07:33.948455	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
188	191	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.695236	2017-11-28 18:07:33.952886	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
189	192	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.698428	2017-11-28 18:07:33.956943	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
190	193	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.701665	2017-11-28 18:07:33.961604	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
192	195	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.708678	2017-11-28 18:07:33.970692	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
193	196	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.712046	2017-11-28 18:07:33.974934	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
194	197	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.715231	2017-11-28 18:07:33.979523	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
195	198	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.7184	2017-11-28 18:07:33.983976	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
197	200	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.72544	2017-11-28 18:07:33.992839	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
198	201	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.728437	2017-11-28 18:07:33.997338	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
199	202	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.731431	2017-11-28 18:07:34.001646	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
200	203	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.734343	2017-11-28 18:07:34.006001	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
201	204	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.737576	2017-11-28 18:07:34.010445	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
204	2	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.746438	2017-11-28 18:07:34.019242	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
205	12	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.749316	2017-11-28 18:07:34.023415	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
206	206	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.752299	2017-11-28 18:07:34.028031	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
203	1	{:Metal=>0, :Country=>0, :Classical=>0, :Jazz=>0, :Reggae=>0, :Blues=>0, :Pop=>0, :Instrumental=>0, :Vocal=>0, :Electronica=>0, :Techno=>0, :Punk=>0, :Drum_n_Bass=>0, :Indie=>0, :Alternative=>0, :Dubstep=>0, :Rock=>0, :Hip_Hop=>0, :Dance=>0, :rnb=>0}	2017-11-28 17:08:33.74355	2017-11-28 18:07:34.032458	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0
\.


--
-- Name: user_vectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('user_vectors_id_seq', 206, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: frcake
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
205	George	crisolivasavatage@hotmail.com	t	2017-11-23 20:35:53.694662	2017-11-25 21:21:16.766498	$2a$10$JxV4k/YS9YWXqfnjQDZG5.djh2paaa58J9gkZ9j/yK8hHS78NoX/a		$2a$10$MovMN2nFF23InejYSyT7.O4YBVyv17cEvTLtR6EjmufVvrbCfjpiS	ZXOg7QCpEsf0uuBu8aobxw
1	Michael	asdf@asdf.com	f	2017-05-25 19:18:20.707833	2017-11-25 21:21:06.99119	$2a$10$koix9tl65HE2GG9FbWCLFuF7Lqbjf7k83HOD8smXRncemx2sXz25m		\N	WJUUIPOyicgeT9dRdWixZw
2	gogo	mpdevcake@gmail.com	t	2017-11-13 18:17:31.928553	2017-11-26 15:08:24.394207	$2a$10$aaydhkl0hQiYjScrftilj.LqKHGybH/lqSEz9NOcWgAxwsQ4mZ29u		\N	6Yt2Va1RGEHLxwM0Nq32Ug
12	Sharon	sharon@example.org	f	2017-11-13 18:45:47.088529	2017-11-27 17:03:24.648596	$2a$10$YexLISZD6p0D7kCLn5.L0e8pON0rJePgpwEoVeYjkaT6D6Uz0hzra		\N	R5ksNLPhfHKAAg9csQ2sGQ
206	user1	frk115@hotmail.com	t	2017-11-27 17:05:42.090056	2017-11-27 17:14:10.262703	$2a$10$mbHbwiizI4zpmh7f5RHEPuJ19isz/.3OBdnirELdCIMkU.doyUUR.		$2a$10$SQcad2VxKe1dltEDYdMXw.b91gQt05g9GpEEyIibLZKF/3G162.KS	-WL92SVZKRFp31dctCZfLQ
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('users_id_seq', 206, true);


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
-- Name: friendships_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY friendships
    ADD CONSTRAINT friendships_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversation_opt_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mailboxer_conversation_opt_outs_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_conversations_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversations
    ADD CONSTRAINT mailboxer_conversations_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT mailboxer_notifications_pkey PRIMARY KEY (id);


--
-- Name: mailboxer_receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT mailboxer_receipts_pkey PRIMARY KEY (id);


--
-- Name: photos_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: record_libraries_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT record_libraries_pkey PRIMARY KEY (id);


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
-- Name: user_vectors_pkey; Type: CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY user_vectors
    ADD CONSTRAINT user_vectors_pkey PRIMARY KEY (id);


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
-- Name: index_mailboxer_conversation_opt_outs_on_conversation_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_conversation_id ON mailboxer_conversation_opt_outs USING btree (conversation_id);


--
-- Name: index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type ON mailboxer_conversation_opt_outs USING btree (unsubscriber_id, unsubscriber_type);


--
-- Name: index_mailboxer_notifications_on_conversation_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_conversation_id ON mailboxer_notifications USING btree (conversation_id);


--
-- Name: index_mailboxer_notifications_on_notified_object_id_and_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_notified_object_id_and_type ON mailboxer_notifications USING btree (notified_object_id, notified_object_type);


--
-- Name: index_mailboxer_notifications_on_sender_id_and_sender_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_sender_id_and_sender_type ON mailboxer_notifications USING btree (sender_id, sender_type);


--
-- Name: index_mailboxer_notifications_on_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_notifications_on_type ON mailboxer_notifications USING btree (type);


--
-- Name: index_mailboxer_receipts_on_notification_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_receipts_on_notification_id ON mailboxer_receipts USING btree (notification_id);


--
-- Name: index_mailboxer_receipts_on_receiver_id_and_receiver_type; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_mailboxer_receipts_on_receiver_id_and_receiver_type ON mailboxer_receipts USING btree (receiver_id, receiver_type);


--
-- Name: index_photos_on_imageable_type_and_imageable_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_photos_on_imageable_type_and_imageable_id ON photos USING btree (imageable_type, imageable_id);


--
-- Name: index_record_libraries_on_album_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_record_libraries_on_album_id ON record_libraries USING btree (album_id);


--
-- Name: index_record_libraries_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_record_libraries_on_user_id ON record_libraries USING btree (user_id);


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
-- Name: index_user_vectors_on_user_id; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX index_user_vectors_on_user_id ON user_vectors USING btree (user_id);


--
-- Name: mailboxer_notifications_notified_object; Type: INDEX; Schema: public; Owner: frcake
--

CREATE INDEX mailboxer_notifications_notified_object ON mailboxer_notifications USING btree (notified_object_type, notified_object_id);


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
-- Name: fk_rails_a306062978; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT fk_rails_a306062978 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c41d359035; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY user_vectors
    ADD CONSTRAINT fk_rails_c41d359035 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_rails_c68ac6eb00; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY songs
    ADD CONSTRAINT fk_rails_c68ac6eb00 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: fk_rails_c90b8138d4; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY record_libraries
    ADD CONSTRAINT fk_rails_c90b8138d4 FOREIGN KEY (album_id) REFERENCES albums(id);


--
-- Name: fk_rails_dd448a2456; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY albums
    ADD CONSTRAINT fk_rails_dd448a2456 FOREIGN KEY (band_id) REFERENCES bands(id);


--
-- Name: mb_opt_outs_on_conversations_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_conversation_opt_outs
    ADD CONSTRAINT mb_opt_outs_on_conversations_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: notifications_on_conversation_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_notifications
    ADD CONSTRAINT notifications_on_conversation_id FOREIGN KEY (conversation_id) REFERENCES mailboxer_conversations(id);


--
-- Name: receipts_on_notification_id; Type: FK CONSTRAINT; Schema: public; Owner: frcake
--

ALTER TABLE ONLY mailboxer_receipts
    ADD CONSTRAINT receipts_on_notification_id FOREIGN KEY (notification_id) REFERENCES mailboxer_notifications(id);


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

