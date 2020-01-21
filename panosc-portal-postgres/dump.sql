--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

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
-- Name: cloud-provider-kubernetes; Type: SCHEMA; Schema: -; Owner: cloud-provider-kubernetes
--

CREATE SCHEMA "cloud-provider-kubernetes";


ALTER SCHEMA "cloud-provider-kubernetes" OWNER TO "cloud-provider-kubernetes";

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: flavour; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".flavour (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    cpu double precision NOT NULL,
    memory integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".flavour OWNER TO "cloud-provider-kubernetes";

--
-- Name: flavour_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".flavour_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".flavour_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: flavour_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".flavour_id_seq OWNED BY "cloud-provider-kubernetes".flavour.id;


--
-- Name: image; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    repository character varying(250),
    path character varying(250) NOT NULL,
    description character varying(2500),
    command character varying(2500),
    args character varying(2500),
    run_as_uid integer
);


ALTER TABLE "cloud-provider-kubernetes".image OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_env_var (
    id integer NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL,
    image_id integer
);


ALTER TABLE "cloud-provider-kubernetes".image_env_var OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_env_var_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_env_var_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_env_var_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_env_var_id_seq OWNED BY "cloud-provider-kubernetes".image_env_var.id;


--
-- Name: image_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_id_seq OWNED BY "cloud-provider-kubernetes".image.id;


--
-- Name: image_protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_protocol (
    id integer NOT NULL,
    port integer,
    protocol_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".image_protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_protocol_id_seq OWNED BY "cloud-provider-kubernetes".image_protocol.id;


--
-- Name: image_volume; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".image_volume (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    path character varying(250) NOT NULL,
    read_only boolean NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".image_volume OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_volume_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".image_volume_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".image_volume_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: image_volume_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".image_volume_id_seq OWNED BY "cloud-provider-kubernetes".image_volume.id;


--
-- Name: instance; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    description character varying(2500),
    namespace character varying(250),
    hostname character varying(128),
    node_hostname character varying(128),
    compute_id character varying(50),
    status character varying(50) NOT NULL,
    status_message character varying(2500),
    current_cpu double precision,
    current_memory integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    flavour_id integer NOT NULL,
    image_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_id_seq OWNED BY "cloud-provider-kubernetes".instance.id;


--
-- Name: instance_protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance_protocol (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    port integer NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance_protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_protocol_id_seq OWNED BY "cloud-provider-kubernetes".instance_protocol.id;


--
-- Name: instance_user; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".instance_user (
    id integer NOT NULL,
    account_id integer NOT NULL,
    username character varying(100) NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    gid integer NOT NULL,
    uid integer NOT NULL,
    home_path character varying(250) NOT NULL,
    instance_id integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".instance_user OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_user_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".instance_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".instance_user_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: instance_user_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".instance_user_id_seq OWNED BY "cloud-provider-kubernetes".instance_user.id;


--
-- Name: protocol; Type: TABLE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE TABLE "cloud-provider-kubernetes".protocol (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    default_port integer NOT NULL
);


ALTER TABLE "cloud-provider-kubernetes".protocol OWNER TO "cloud-provider-kubernetes";

--
-- Name: protocol_id_seq; Type: SEQUENCE; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE SEQUENCE "cloud-provider-kubernetes".protocol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "cloud-provider-kubernetes".protocol_id_seq OWNER TO "cloud-provider-kubernetes";

--
-- Name: protocol_id_seq; Type: SEQUENCE OWNED BY; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER SEQUENCE "cloud-provider-kubernetes".protocol_id_seq OWNED BY "cloud-provider-kubernetes".protocol.id;


--
-- Name: flavour id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".flavour ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".flavour_id_seq'::regclass);


--
-- Name: image id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_id_seq'::regclass);


--
-- Name: image_env_var id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_env_var_id_seq'::regclass);


--
-- Name: image_protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_protocol_id_seq'::regclass);


--
-- Name: image_volume id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".image_volume_id_seq'::regclass);


--
-- Name: instance id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_id_seq'::regclass);


--
-- Name: instance_protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_protocol_id_seq'::regclass);


--
-- Name: instance_user id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_user ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".instance_user_id_seq'::regclass);


--
-- Name: protocol id; Type: DEFAULT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".protocol ALTER COLUMN id SET DEFAULT nextval('"cloud-provider-kubernetes".protocol_id_seq'::regclass);


--
-- Data for Name: flavour; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".flavour (id, name, description, cpu, memory) FROM stdin;
1	small	\N	1	1024
2	medium	\N	2	4096
3	large	\N	8	65536
\.


--
-- Name: flavour_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".flavour_id_seq', 3, true);


--
-- Data for Name: image; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".image (id, name, repository, path, description, command, args, run_as_uid) FROM stdin;
1	ubuntu-xrdp	docker.ill.fr	panosc/data-analysis-services/panosc-images/danielguerra/ubuntu-xrdp	Ubuntu with XRDP service			\N
2	jupyter	\N	jupyter/base-notebook	Jupyter base notebook	start.sh	jupyter,notebook,--NotebookApp.token=''	0
\.


--
-- Data for Name: image_env_var; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".image_env_var (id, name, value, image_id) FROM stdin;
\.


--
-- Name: image_env_var_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_env_var_id_seq', 1, false);


--
-- Name: image_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_id_seq', 8, true);


--
-- Data for Name: image_protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".image_protocol (id, port, protocol_id, image_id) FROM stdin;
2	8888	4	2
1	\N	2	1
\.


--
-- Name: image_protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_protocol_id_seq', 8, true);


--
-- Data for Name: image_volume; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".image_volume (id, name, path, read_only, image_id) FROM stdin;
1	jupyter-user-home	/home/jovyan	f	2
\.


--
-- Name: image_volume_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".image_volume_id_seq', 1, true);


--
-- Data for Name: instance; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".instance (id, name, description, namespace, hostname, node_hostname, compute_id, status, status_message, current_cpu, current_memory, created_at, updated_at, deleted, flavour_id, image_id) FROM stdin;
\.


--
-- Name: instance_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_id_seq', 11, true);


--
-- Data for Name: instance_protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".instance_protocol (id, name, port, instance_id) FROM stdin;
\.


--
-- Name: instance_protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_protocol_id_seq', 11, true);


--
-- Data for Name: instance_user; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".instance_user (id, account_id, username, first_name, last_name, gid, uid, home_path, instance_id) FROM stdin;
\.


--
-- Name: instance_user_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".instance_user_id_seq', 11, true);


--
-- Data for Name: protocol; Type: TABLE DATA; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

COPY "cloud-provider-kubernetes".protocol (id, name, default_port) FROM stdin;
1	SSH	22
2	RDP	3389
3	GUACD	4822
4	HTTP	80
5	HTTPS	443
\.


--
-- Name: protocol_id_seq; Type: SEQUENCE SET; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

SELECT pg_catalog.setval('"cloud-provider-kubernetes".protocol_id_seq', 5, true);


--
-- Name: flavour PK_2707819d7402d07eccada91702c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".flavour
    ADD CONSTRAINT "PK_2707819d7402d07eccada91702c" PRIMARY KEY (id);


--
-- Name: image_env_var PK_28a088ed8e1eae08eae69c3006c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var
    ADD CONSTRAINT "PK_28a088ed8e1eae08eae69c3006c" PRIMARY KEY (id);


--
-- Name: protocol PK_44ad5733ecf7f5732524522ab3c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".protocol
    ADD CONSTRAINT "PK_44ad5733ecf7f5732524522ab3c" PRIMARY KEY (id);


--
-- Name: image_protocol PK_62e78960688cea03db46e5ab264; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "PK_62e78960688cea03db46e5ab264" PRIMARY KEY (id);


--
-- Name: instance_protocol PK_7285dea25a9537c1c32f7f88d39; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol
    ADD CONSTRAINT "PK_7285dea25a9537c1c32f7f88d39" PRIMARY KEY (id);


--
-- Name: image_volume PK_814d3959b94a1ae8664566e48d1; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "PK_814d3959b94a1ae8664566e48d1" PRIMARY KEY (id);


--
-- Name: instance PK_8cff4325f4a6c836ad46f419905; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "PK_8cff4325f4a6c836ad46f419905" PRIMARY KEY (id);


--
-- Name: image PK_daa5818049630b57ff41c777a37; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image
    ADD CONSTRAINT "PK_daa5818049630b57ff41c777a37" PRIMARY KEY (id);


--
-- Name: instance_user PK_e3bee34cff2e60bec9d5fb3d99c; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_user
    ADD CONSTRAINT "PK_e3bee34cff2e60bec9d5fb3d99c" PRIMARY KEY (id);


--
-- Name: instance_user REL_8d9e88ceb8fdaf9e606b9f58ea; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_user
    ADD CONSTRAINT "REL_8d9e88ceb8fdaf9e606b9f58ea" UNIQUE (instance_id);


--
-- Name: image_volume UQ_40aaac1a6a02785079044f9180a; Type: CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "UQ_40aaac1a6a02785079044f9180a" UNIQUE (name);


--
-- Name: flavour_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX flavour_name_index ON "cloud-provider-kubernetes".flavour USING btree (name);


--
-- Name: image_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_name_index ON "cloud-provider-kubernetes".image USING btree (name);


--
-- Name: image_path_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_path_index ON "cloud-provider-kubernetes".image USING btree (path);


--
-- Name: image_repository_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX image_repository_index ON "cloud-provider-kubernetes".image USING btree (repository);


--
-- Name: instance_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_name_index ON "cloud-provider-kubernetes".instance USING btree (name);


--
-- Name: instance_protocol_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_protocol_name_index ON "cloud-provider-kubernetes".instance_protocol USING btree (name);


--
-- Name: instance_user_account_id_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_user_account_id_index ON "cloud-provider-kubernetes".instance_user USING btree (account_id);


--
-- Name: instance_user_username_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX instance_user_username_index ON "cloud-provider-kubernetes".instance_user USING btree (username);


--
-- Name: protocol_name_index; Type: INDEX; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

CREATE INDEX protocol_name_index ON "cloud-provider-kubernetes".protocol USING btree (name);


--
-- Name: instance_protocol FK_014509892cee68b2e680a6caf76; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_protocol
    ADD CONSTRAINT "FK_014509892cee68b2e680a6caf76" FOREIGN KEY (instance_id) REFERENCES "cloud-provider-kubernetes".instance(id) ON DELETE CASCADE;


--
-- Name: instance FK_1e3f6ef448cb253b7faf926b869; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "FK_1e3f6ef448cb253b7faf926b869" FOREIGN KEY (flavour_id) REFERENCES "cloud-provider-kubernetes".flavour(id);


--
-- Name: image_volume FK_630ceeaf26a95d57ff43fa137a2; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_volume
    ADD CONSTRAINT "FK_630ceeaf26a95d57ff43fa137a2" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: image_env_var FK_6f08d773921c438982299935027; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_env_var
    ADD CONSTRAINT "FK_6f08d773921c438982299935027" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: instance FK_6f37801185555ca52910a09d070; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance
    ADD CONSTRAINT "FK_6f37801185555ca52910a09d070" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- Name: instance_user FK_8d9e88ceb8fdaf9e606b9f58ea5; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".instance_user
    ADD CONSTRAINT "FK_8d9e88ceb8fdaf9e606b9f58ea5" FOREIGN KEY (instance_id) REFERENCES "cloud-provider-kubernetes".instance(id) ON DELETE CASCADE;


--
-- Name: image_protocol FK_9d519964ecffc311fde1a3ca2d8; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "FK_9d519964ecffc311fde1a3ca2d8" FOREIGN KEY (protocol_id) REFERENCES "cloud-provider-kubernetes".protocol(id);


--
-- Name: image_protocol FK_be13232870f5bf9e712f2f0deb8; Type: FK CONSTRAINT; Schema: cloud-provider-kubernetes; Owner: cloud-provider-kubernetes
--

ALTER TABLE ONLY "cloud-provider-kubernetes".image_protocol
    ADD CONSTRAINT "FK_be13232870f5bf9e712f2f0deb8" FOREIGN KEY (image_id) REFERENCES "cloud-provider-kubernetes".image(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

