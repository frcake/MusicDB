--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.5
-- psql MusicDB_development < MusicDB.sql
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
\.


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('albums_id_seq', 9, true);


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
\.


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('artists_id_seq', 5, true);


--
-- Data for Name: bandmembers; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY bandmembers (id, band_id, artist_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: bandmembers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bandmembers_id_seq', 74, true);


--
-- Data for Name: bands; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY bands (id, name, description, created_at, updated_at, category_id) FROM stdin;
25	Kyuss	\N	2017-06-12 15:23:56.757865	2017-06-12 15:23:56.757865	4
26	Monster Magnet	\N	2017-06-12 15:24:08.688664	2017-06-12 15:24:08.688664	4
27	Acid King	\N	2017-06-12 15:38:32.43529	2017-06-12 15:38:32.43529	4
\.


--
-- Name: bands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('bands_id_seq', 27, true);


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
\.


--
-- Name: photos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('photos_id_seq', 38, true);


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
6	Black Album	\N	2017-06-12 13:33:34.31224	2017-06-12 13:33:34.31224	\N
\.


--
-- Name: songs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('songs_id_seq', 7, true);


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: frcake
--

COPY tracks (id, album_id, song_id, created_at, updated_at) FROM stdin;
14	8	6	2017-06-12 14:19:11.183836	2017-06-12 14:19:11.183836
15	7	6	2017-06-12 14:19:11.19176	2017-06-12 14:19:11.19176
\.


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: frcake
--

SELECT pg_catalog.setval('tracks_id_seq', 15, true);


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
