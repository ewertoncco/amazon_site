--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Debian 14.8-1.pgdg120+1)
-- Dumped by pg_dump version 14.8 (Debian 14.8-1.pgdg120+1)

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
-- Name: associados; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.associados (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    codigo_usuario integer,
    ativo boolean DEFAULT true,
    criado_por integer
);


ALTER TABLE public.associados OWNER TO amazon;

--
-- Name: associados_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.associados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.associados_id_seq OWNER TO amazon;

--
-- Name: associados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.associados_id_seq OWNED BY public.associados.id;


--
-- Name: parcelamento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.parcelamento (
    id integer NOT NULL,
    numero_parcelas integer NOT NULL,
    taxa_juros numeric(5,2) NOT NULL,
    ativo boolean DEFAULT true,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao timestamp without time zone
);


ALTER TABLE public.parcelamento OWNER TO amazon;

--
-- Name: configuracao_parcelas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.configuracao_parcelas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuracao_parcelas_id_seq OWNER TO amazon;

--
-- Name: configuracao_parcelas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.configuracao_parcelas_id_seq OWNED BY public.parcelamento.id;


--
-- Name: evento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.evento (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    usuario_id integer,
    evento_status integer,
    evento_nome text NOT NULL,
    evento_resumo text,
    evento_descricao text,
    evento_local text,
    evento_banner_principal text,
    evento_banner_secundario text,
    tem_mapa boolean DEFAULT false,
    mapa_imagem text,
    evento_data_hora timestamp with time zone,
    evento_destaque boolean DEFAULT false,
    pode_alterar_ingresso boolean DEFAULT false,
    pode_devolver_ingresso boolean DEFAULT false,
    aceita_pix boolean DEFAULT false,
    aceita_cartao boolean DEFAULT false,
    qtide_parcelas_cartao integer,
    mostrar_sobre_evento boolean DEFAULT true,
    slug_evento text,
    mostrar_whatsapp boolean DEFAULT false,
    numero_whatsapp text,
    bar_online boolean DEFAULT false,
    tem_cupom boolean DEFAULT false,
    codigo_cupom text,
    valor integer
);


ALTER TABLE public.evento OWNER TO amazon;

--
-- Name: evento_checklist; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.evento_checklist (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    usuario_id integer,
    titulo text NOT NULL,
    data_prazo_conclusao timestamp with time zone,
    finalizada boolean DEFAULT false,
    finalizada_por integer,
    data_finalizacao timestamp with time zone,
    evento_id integer
);


ALTER TABLE public.evento_checklist OWNER TO amazon;

--
-- Name: evento_checklist_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.evento_checklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_checklist_id_seq OWNER TO amazon;

--
-- Name: evento_checklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.evento_checklist_id_seq OWNED BY public.evento_checklist.id;


--
-- Name: evento_despesas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.evento_despesas (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    usuario_id integer,
    tipo_despesa integer,
    titulo text,
    descricao text,
    codigo_evento integer,
    valor integer,
    paga boolean DEFAULT false,
    data_pagamento timestamp with time zone
);


ALTER TABLE public.evento_despesas OWNER TO amazon;

--
-- Name: evento_despesas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.evento_despesas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_despesas_id_seq OWNER TO amazon;

--
-- Name: evento_despesas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.evento_despesas_id_seq OWNED BY public.evento_despesas.id;


--
-- Name: evento_produtos; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.evento_produtos (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    usuario_id integer,
    evento_id integer,
    produto_nome text NOT NULL,
    qtide_cadastrada integer,
    inicio_vendas timestamp with time zone,
    final_vendas timestamp with time zone,
    valor integer,
    ordem_lista integer,
    ativo boolean DEFAULT true,
    is_mesa boolean DEFAULT false,
    qtide_mesa integer,
    cortesia boolean DEFAULT false
);


ALTER TABLE public.evento_produtos OWNER TO amazon;

--
-- Name: evento_produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.evento_produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evento_produtos_id_seq OWNER TO amazon;

--
-- Name: evento_produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.evento_produtos_id_seq OWNED BY public.evento_produtos.id;


--
-- Name: eventos_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.eventos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eventos_id_seq OWNER TO amazon;

--
-- Name: eventos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.eventos_id_seq OWNED BY public.evento.id;


--
-- Name: forma_pagamento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.forma_pagamento (
    id integer NOT NULL,
    forma_pagamento text NOT NULL
);


ALTER TABLE public.forma_pagamento OWNER TO amazon;

--
-- Name: forma_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.forma_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forma_pagamento_id_seq OWNER TO amazon;

--
-- Name: forma_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.forma_pagamento_id_seq OWNED BY public.forma_pagamento.id;


--
-- Name: genero; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.genero (
    id integer NOT NULL,
    genero text
);


ALTER TABLE public.genero OWNER TO amazon;

--
-- Name: noticias; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.noticias (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    titulo text NOT NULL,
    conteudo text NOT NULL,
    status_publicacao integer,
    criado_por integer
);


ALTER TABLE public.noticias OWNER TO amazon;

--
-- Name: noticias_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.noticias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.noticias_id_seq OWNER TO amazon;

--
-- Name: noticias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.noticias_id_seq OWNED BY public.noticias.id;


--
-- Name: notificacoes; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.notificacoes (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    titulo text,
    conteudo text,
    imagem_url text,
    usuario_id integer
);


ALTER TABLE public.notificacoes OWNER TO amazon;

--
-- Name: notificacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.notificacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificacoes_id_seq OWNER TO amazon;

--
-- Name: notificacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.notificacoes_id_seq OWNED BY public.notificacoes.id;


--
-- Name: organizador; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.organizador (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    organizador_razao_social text,
    organizador_cnpj text,
    organizador_email text,
    organizador_senha_email text,
    contato_nome text,
    contato_telefone text,
    contato_email text,
    organizador_dominio text,
    organizador_cidade text,
    organizador_estado text,
    nome_fantasia text,
    logo_url text
);


ALTER TABLE public.organizador OWNER TO amazon;

--
-- Name: organizador_financeiro; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.organizador_financeiro (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    organizador_banco text NOT NULL,
    organizador_agencia integer NOT NULL,
    organizador_agencia_digito integer,
    organizador_conta integer NOT NULL,
    organizador_conta_digito integer,
    juros_parcelamento integer,
    sandbox boolean DEFAULT true,
    token_sandbox text,
    id_receiver integer,
    taxa_pix integer,
    porcentagem_repasse_pix integer,
    taxa_credito integer,
    porcentagem_repasse_credito integer,
    taxa_bar integer,
    porcentagem_repasse_bar integer
);


ALTER TABLE public.organizador_financeiro OWNER TO amazon;

--
-- Name: organizador_financeiro_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.organizador_financeiro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizador_financeiro_id_seq OWNER TO amazon;

--
-- Name: organizador_financeiro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.organizador_financeiro_id_seq OWNED BY public.organizador_financeiro.id;


--
-- Name: organizador_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.organizador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizador_id_seq OWNER TO amazon;

--
-- Name: organizador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.organizador_id_seq OWNED BY public.organizador.id;


--
-- Name: status_pagamento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.status_pagamento (
    id integer NOT NULL,
    status_pagamento text NOT NULL
);


ALTER TABLE public.status_pagamento OWNER TO amazon;

--
-- Name: status_pagamento_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.status_pagamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_pagamento_id_seq OWNER TO amazon;

--
-- Name: status_pagamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.status_pagamento_id_seq OWNED BY public.status_pagamento.id;


--
-- Name: status_publicacao; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.status_publicacao (
    id integer NOT NULL,
    status_publicacao text NOT NULL
);


ALTER TABLE public.status_publicacao OWNER TO amazon;

--
-- Name: status_publicacao_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.status_publicacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_publicacao_id_seq OWNER TO amazon;

--
-- Name: status_publicacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.status_publicacao_id_seq OWNED BY public.status_publicacao.id;


--
-- Name: tipo_transacao; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.tipo_transacao (
    id integer NOT NULL,
    tipo_transacao text NOT NULL
);


ALTER TABLE public.tipo_transacao OWNER TO amazon;

--
-- Name: tipo_transacao_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.tipo_transacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_transacao_id_seq OWNER TO amazon;

--
-- Name: tipo_transacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.tipo_transacao_id_seq OWNED BY public.tipo_transacao.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    senha text NOT NULL,
    usuario_email text NOT NULL,
    usuario_nome text NOT NULL,
    usuario_apelido text,
    usuario_telefone text,
    usuario_cpf text,
    ativo boolean DEFAULT true,
    end_rua text,
    end_numero text,
    end_bairro text,
    end_cidade text,
    end_estado text,
    end_cep text,
    notificacoes_email boolean DEFAULT true,
    notificacoes_push boolean DEFAULT true,
    notificacoes_whats boolean DEFAULT true,
    fcm_token text,
    foto text,
    data_nascimento text,
    permissao integer,
    atualizar_senha boolean,
    genero integer
);


ALTER TABLE public.usuarios OWNER TO amazon;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO amazon;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: usuarios_notificacoes_lidas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.usuarios_notificacoes_lidas (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    usuario_id integer,
    notificacao_id integer
);


ALTER TABLE public.usuarios_notificacoes_lidas OWNER TO amazon;

--
-- Name: usuarios_notificacoes_lidas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.usuarios_notificacoes_lidas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_notificacoes_lidas_id_seq OWNER TO amazon;

--
-- Name: usuarios_notificacoes_lidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.usuarios_notificacoes_lidas_id_seq OWNED BY public.usuarios_notificacoes_lidas.id;


--
-- Name: vendas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    data_criacao timestamp without time zone DEFAULT now() NOT NULL,
    data_update timestamp without time zone DEFAULT now(),
    evento_id integer NOT NULL,
    usuarios_id integer NOT NULL,
    evento_produtos_id integer NOT NULL,
    status_pagamento_id integer NOT NULL,
    forma_pagamento_id integer NOT NULL,
    valor_original integer NOT NULL,
    valor_final integer NOT NULL,
    cupom_codigo text DEFAULT 0,
    desconto_aplicado numeric,
    pag_key text,
    pag_qrcode text,
    pag_json json,
    has_error boolean DEFAULT false,
    error_description text,
    nome_participante text NOT NULL,
    cpf_participante text NOT NULL,
    email_participante text,
    telefone_participante text,
    data_resgate timestamp without time zone,
    trocou_nome boolean DEFAULT false,
    nome_anterior text,
    cpf_anterior text,
    qtide_parcelas integer DEFAULT 1 NOT NULL,
    description text,
    id_transaction integer,
    qrcode text
);


ALTER TABLE public.vendas OWNER TO amazon;

--
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vendas_id_seq OWNER TO amazon;

--
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- Name: wappler_migrations; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.wappler_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.wappler_migrations OWNER TO amazon;

--
-- Name: wappler_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.wappler_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wappler_migrations_id_seq OWNER TO amazon;

--
-- Name: wappler_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.wappler_migrations_id_seq OWNED BY public.wappler_migrations.id;


--
-- Name: wappler_migrations_lock; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.wappler_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.wappler_migrations_lock OWNER TO amazon;

--
-- Name: wappler_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.wappler_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wappler_migrations_lock_index_seq OWNER TO amazon;

--
-- Name: wappler_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.wappler_migrations_lock_index_seq OWNED BY public.wappler_migrations_lock.index;


--
-- Name: associados id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.associados ALTER COLUMN id SET DEFAULT nextval('public.associados_id_seq'::regclass);


--
-- Name: evento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);


--
-- Name: evento_checklist id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist ALTER COLUMN id SET DEFAULT nextval('public.evento_checklist_id_seq'::regclass);


--
-- Name: evento_despesas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_despesas ALTER COLUMN id SET DEFAULT nextval('public.evento_despesas_id_seq'::regclass);


--
-- Name: evento_produtos id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos ALTER COLUMN id SET DEFAULT nextval('public.evento_produtos_id_seq'::regclass);


--
-- Name: forma_pagamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.forma_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_pagamento_id_seq'::regclass);


--
-- Name: noticias id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);


--
-- Name: notificacoes id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes ALTER COLUMN id SET DEFAULT nextval('public.notificacoes_id_seq'::regclass);


--
-- Name: organizador id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador ALTER COLUMN id SET DEFAULT nextval('public.organizador_id_seq'::regclass);


--
-- Name: organizador_financeiro id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_financeiro ALTER COLUMN id SET DEFAULT nextval('public.organizador_financeiro_id_seq'::regclass);


--
-- Name: parcelamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.parcelamento ALTER COLUMN id SET DEFAULT nextval('public.configuracao_parcelas_id_seq'::regclass);


--
-- Name: status_pagamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_pagamento ALTER COLUMN id SET DEFAULT nextval('public.status_pagamento_id_seq'::regclass);


--
-- Name: status_publicacao id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_publicacao ALTER COLUMN id SET DEFAULT nextval('public.status_publicacao_id_seq'::regclass);


--
-- Name: tipo_transacao id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.tipo_transacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_transacao_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: usuarios_notificacoes_lidas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_notificacoes_lidas ALTER COLUMN id SET DEFAULT nextval('public.usuarios_notificacoes_lidas_id_seq'::regclass);


--
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Name: wappler_migrations id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.wappler_migrations ALTER COLUMN id SET DEFAULT nextval('public.wappler_migrations_id_seq'::regclass);


--
-- Name: wappler_migrations_lock index; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.wappler_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.wappler_migrations_lock_index_seq'::regclass);


--
-- Data for Name: associados; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.associados (id, data_criacao, codigo_usuario, ativo, criado_por) FROM stdin;
\.


--
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.evento (id, data_criacao, usuario_id, evento_status, evento_nome, evento_resumo, evento_descricao, evento_local, evento_banner_principal, evento_banner_secundario, tem_mapa, mapa_imagem, evento_data_hora, evento_destaque, pode_alterar_ingresso, pode_devolver_ingresso, aceita_pix, aceita_cartao, qtide_parcelas_cartao, mostrar_sobre_evento, slug_evento, mostrar_whatsapp, numero_whatsapp, bar_online, tem_cupom, codigo_cupom, valor) FROM stdin;
11	2024-12-01 22:01:06+00	9	1	Corrida de Rua Chapecó+	🏃‍♂️🌟 Prepare-se para a Corrida de Rua Chapecó+! 🌟🏃‍♀️	Venha viver a emoção das ruas de Chapecó com percursos incríveis de 5K e 10K! 🏅 Seja você iniciante ou corredor experiente, este é o evento perfeito para desafiar seus limites, se divertir e conquistar novas metas. 💪✨ A energia estará lá em cada passada, com muita vibração e apoio! 🎶👏\r\n\r\n🗓️ Data: [Insira a data do evento]\r\n📍 Local: [Insira o local do evento]\r\n\r\nNão perca essa oportunidade de celebrar a saúde, o esporte e a superação. Inscreva-se agora e garanta sua vaga! 🖊️🎉 Convide seus amigos e venha fazer parte dessa festa esportiva! 🤩👟 #ChapecóMais #CorridaDeRua	Getúlio Vargas, Chapecó SC	/assets/uploads/banners_eventos/8a82b8f2-d8f0-426f-9bc7-b9e4898e90bf.png	\N	f	\N	2025-01-31 16:00:00+00	t	t	t	t	t	3	t	\N	f		\N	f	\N	\N
13	2024-12-15 17:27:46+00	9	1	Réveillon dos Desejos 2025	Uma celebração inesquecível, repleta de magia e boas energias para a chegada do novo ano.	O Réveillon dos Desejos 2025 promete ser uma celebração inesquecível, repleta de magia e boas energias para a chegada do novo ano. Realizado na Amazônia, o evento combina uma atmosfera tropical única com uma programação envolvente, perfeita para quem busca experiências memoráveis. A fusão entre cultura local, música e natureza faz deste evento uma opção ideal para celebrar o início de 2025 em grande estilo.\r\n\r\nCom uma ambientação cuidadosamente planejada, o Réveillon dos Desejos oferece uma conexão única com a natureza exuberante da Amazônia, destacando cenários deslumbrantes e momentos de celebração. O público pode esperar uma noite de performances musicais, gastronomia diferenciada e experiências sensoriais que exaltam os desejos de renovação e alegria para o ano que se inicia.	Amazon Club	/assets/uploads/banners_eventos/6d943723-53cb-467e-83d7-3a1c06e8e03d.jpg	\N	f	\N	2024-12-31 19:00:00+00	f	t	t	t	t	5	t	\N	t	(49) 99959-0901	\N	f	\N	\N
\.


--
-- Data for Name: evento_checklist; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.evento_checklist (id, data_criacao, usuario_id, titulo, data_prazo_conclusao, finalizada, finalizada_por, data_finalizacao, evento_id) FROM stdin;
\.


--
-- Data for Name: evento_despesas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.evento_despesas (id, data_criacao, usuario_id, tipo_despesa, titulo, descricao, codigo_evento, valor, paga, data_pagamento) FROM stdin;
\.


--
-- Data for Name: evento_produtos; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.evento_produtos (id, data_criacao, usuario_id, evento_id, produto_nome, qtide_cadastrada, inicio_vendas, final_vendas, valor, ordem_lista, ativo, is_mesa, qtide_mesa, cortesia) FROM stdin;
22	2024-12-15 17:37:41+00	9	11	Ingresso Pista (1º Lote)	10	2024-12-15 20:00:00+00	2024-12-16 20:37:00+00	1000	1	t	f	0	f
19	2024-12-13 09:33:14+00	9	\N	Bruno VIP	10	2024-12-13 12:00:00+00	2024-12-21 12:33:00+00	20	1	t	f	0	f
20	2024-12-13 17:57:54+00	9	11	Murilo camarote (2 pessoas)	10	2024-12-13 08:00:00+00	2024-12-21 08:57:00+00	3000	1	t	t	2	f
21	2024-12-13 18:21:18+00	9	11	VIP (Pré-Venda)	10	2024-12-13 18:00:00+00	2024-12-21 18:20:00+00	5000	1	t	f	0	f
\.


--
-- Data for Name: forma_pagamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.forma_pagamento (id, forma_pagamento) FROM stdin;
1	Pix
2	Cartão de Crédito
3	Cartão de Crédito parcelado
4	Cartão de Debito
5	Dinheiro
6	Boleto
7	Cortesia
8	Gratuito
9	Convidado mesa
\.


--
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.genero (id, genero) FROM stdin;
1	Masculino
2	Feminino
3	Outros
4	Não responder
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.noticias (id, data_criacao, titulo, conteudo, status_publicacao, criado_por) FROM stdin;
\.


--
-- Data for Name: notificacoes; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.notificacoes (id, data_criacao, titulo, conteudo, imagem_url, usuario_id) FROM stdin;
9	2024-12-25 22:29:14.784653+00	🎉 Promoção Imperdível!	Aproveite 50% de desconto em ingressos selecionados. Corra, é por tempo limitado!	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfxd2J7OhjoKiwzvLatz2XfBHHnZhj9NzJBw&s	9
10	2024-12-25 22:29:14.785+00	🔔 Última Chance!	Os ingressos para o evento Show das Estrelas estão quase esgotados. Garanta já o seu!	https://d1muf25xaso8hp.cloudfront.net/https://img.criativodahora.com.br/2024/11/criativo-6726b4ae1f437img-2024-11-026726b4ae1f43e.jpg?w=1000&h=&auto=compress&dpr=1&fit=max	9
11	2024-12-25 22:29:14.785472+00	🎁 Você Ganhou um Presente!	Confira seu app para descobrir seu brinde exclusivo no evento deste final de semana!	https://pbs.twimg.com/media/FCo8f0nXIAU8T7d.jpg:large	9
12	2024-12-25 22:29:14.789458+00	📅 Atualização no Seu Evento	O horário do evento Festival de Verão foi atualizado. Acesse para mais detalhes!	https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2ILXibcKKgpp4z6xVDPurEKBBJDmWq2n4Lw&s	9
\.


--
-- Data for Name: organizador; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.organizador (id, data_criacao, organizador_razao_social, organizador_cnpj, organizador_email, organizador_senha_email, contato_nome, contato_telefone, contato_email, organizador_dominio, organizador_cidade, organizador_estado, nome_fantasia, logo_url) FROM stdin;
1	2024-11-26 18:20:57+00	Amazon	\N	\N	\N	\N	\N	\N	\N	\N	\N	Amazon	\N
\.


--
-- Data for Name: organizador_financeiro; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.organizador_financeiro (id, data_criacao, organizador_banco, organizador_agencia, organizador_agencia_digito, organizador_conta, organizador_conta_digito, juros_parcelamento, sandbox, token_sandbox, id_receiver, taxa_pix, porcentagem_repasse_pix, taxa_credito, porcentagem_repasse_credito, taxa_bar, porcentagem_repasse_bar) FROM stdin;
\.


--
-- Data for Name: parcelamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.parcelamento (id, numero_parcelas, taxa_juros, ativo, data_criacao, data_atualizacao) FROM stdin;
2	2	0.08	t	2024-12-25 22:05:05.327166	\N
3	3	0.12	t	2024-12-25 22:10:22.739352	\N
4	4	0.16	t	2024-12-25 22:10:22.73975	\N
6	6	0.24	t	2024-12-25 22:10:22.75687	\N
5	5	0.20	t	2024-12-25 22:10:22.757185	\N
8	8	0.32	t	2024-12-25 22:11:29.810673	\N
7	7	0.28	t	2024-12-25 22:10:22.757022	\N
9	9	0.36	t	2024-12-25 22:11:29.811102	\N
10	10	0.40	t	2024-12-25 22:11:29.811416	\N
1	1	0.00	t	2024-12-25 22:05:05.326925	\N
\.


--
-- Data for Name: status_pagamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.status_pagamento (id, status_pagamento) FROM stdin;
1	Pendente
2	Processando
3	Autorizado
4	XXX
5	Em Disputa
6	Devolvido
7	Baixado
8	Recusado
9	Erro
10	Solicitou Reembolso
\.


--
-- Data for Name: status_publicacao; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.status_publicacao (id, status_publicacao) FROM stdin;
1	Publicado
2	Aguardando
3	Finalizado
\.


--
-- Data for Name: tipo_transacao; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.tipo_transacao (id, tipo_transacao) FROM stdin;
1	Ingresso
2	Mensalidade
3	Camiseta
4	Cupom
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.usuarios (id, data_criacao, senha, usuario_email, usuario_nome, usuario_apelido, usuario_telefone, usuario_cpf, ativo, end_rua, end_numero, end_bairro, end_cidade, end_estado, end_cep, notificacoes_email, notificacoes_push, notificacoes_whats, fcm_token, foto, data_nascimento, permissao, atualizar_senha, genero) FROM stdin;
10	2024-12-01 18:29:15+00	$argon2i$v=19$m=65536,t=3,p=4$bnzEjhuWDLLKnE4LHTFo0w$wdJa95INrxwTHQjTlvJNDS7pCzLnl8Z+Pd717r8Sbgw	ewerton.cco1@gmail.com	Ewerton Luiz Oliveira	Ewerton	(49) 9 9959-0901	026.796.019-04	t	Rua Cláudio Stakonski	90	Paraíso	Chapecó	SC	89806-248	t	t	t	\N	/assets/uploads/usuarios/ewerton.jpg	27/04/1979	1	f	1
9	2024-12-01 17:49:26+00	$argon2i$v=19$m=65536,t=3,p=4$32A6/19W0WSZvFmM4/6lFA$ltbwe9QLYMmwyztfaELHklEsvGux4E6neaLsTKuArwQ	ewerton.cco@gmail.com	Ewerton Oliveira	Ewerton	49999590901	02679601904	t	Rua Cláudio Stakonski	90	Paraíso	Chapecó	SC	89806-248	t	t	t	\N	/assets/uploads/usuarios/ewerton.jpg	27/04/1979	2	\N	\N
\.


--
-- Data for Name: usuarios_notificacoes_lidas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.usuarios_notificacoes_lidas (id, data_criacao, usuario_id, notificacao_id) FROM stdin;
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.vendas (id, data_criacao, data_update, evento_id, usuarios_id, evento_produtos_id, status_pagamento_id, forma_pagamento_id, valor_original, valor_final, cupom_codigo, desconto_aplicado, pag_key, pag_qrcode, pag_json, has_error, error_description, nome_participante, cpf_participante, email_participante, telefone_participante, data_resgate, trocou_nome, nome_anterior, cpf_anterior, qtide_parcelas, description, id_transaction, qrcode) FROM stdin;
24	2025-01-02 23:41:19.689237	2025-01-02 23:41:19.689237	11	9	22	3	2	1000	1000	0	0	\N	\N	{"CreditCard":{"Is3DSAuthenticated":false,"CardNumber":"000000******0000","Brand":99,"Installments":1,"ReturnCode":"4","MessageProvider":"Operation Successful"},"IdTransaction":102432186,"Token":"af020c61-01c0-4f73-a9e5-e4ec732e268c","Description":"O seu pagamento foi autorizado pela operadora do cartão de crédito.","Tid":"0102084408380","AuthorizationCode":"689612","Status":3,"Message":"Pagamento Autorizado"}	f	\N	Ewerton Oliveira	02679601904	ewerton.cco@gmail.com	49999590901	\N	f	\N	\N	1	O seu pagamento foi autorizado pela operadora do cartão de crédito.	102432186	0ca6f577-940c-4014-80af-5f4c55c43be7
25	2025-01-02 23:42:13.471148	2025-01-02 23:42:13.471148	11	9	21	3	2	5000	5400	0	0	\N	\N	{"CreditCard":{"Is3DSAuthenticated":false,"CardNumber":"000000******0000","Brand":99,"Installments":1,"ReturnCode":"4","MessageProvider":"Operation Successful"},"IdTransaction":102432336,"Token":"95cddd62-621f-46d0-89d5-2ee28478512e","Description":"O seu pagamento foi autorizado pela operadora do cartão de crédito.","Tid":"0102084501953","AuthorizationCode":"244871","Status":3,"Message":"Pagamento Autorizado"}	f	\N	Luana	02679601904	ewerton.cco@gmail.com	49999590901	\N	f	\N	\N	2	O seu pagamento foi autorizado pela operadora do cartão de crédito.	102432336	23551fe0-e936-4289-a756-6624a4d0a43b
\.


--
-- Data for Name: wappler_migrations; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.wappler_migrations (id, name, batch, migration_time) FROM stdin;
\.


--
-- Data for Name: wappler_migrations_lock; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.wappler_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Name: associados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.associados_id_seq', 1, false);


--
-- Name: configuracao_parcelas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.configuracao_parcelas_id_seq', 11, true);


--
-- Name: evento_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.evento_checklist_id_seq', 1, false);


--
-- Name: evento_despesas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.evento_despesas_id_seq', 1, false);


--
-- Name: evento_produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.evento_produtos_id_seq', 23, true);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.eventos_id_seq', 13, true);


--
-- Name: forma_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.forma_pagamento_id_seq', 9, true);


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.noticias_id_seq', 1, false);


--
-- Name: notificacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.notificacoes_id_seq', 12, true);


--
-- Name: organizador_financeiro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.organizador_financeiro_id_seq', 1, false);


--
-- Name: organizador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.organizador_id_seq', 1, true);


--
-- Name: status_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.status_pagamento_id_seq', 10, true);


--
-- Name: status_publicacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.status_publicacao_id_seq', 3, true);


--
-- Name: tipo_transacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.tipo_transacao_id_seq', 4, true);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 10, true);


--
-- Name: usuarios_notificacoes_lidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.usuarios_notificacoes_lidas_id_seq', 1, false);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.vendas_id_seq', 25, true);


--
-- Name: wappler_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.wappler_migrations_id_seq', 1, false);


--
-- Name: wappler_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.wappler_migrations_lock_index_seq', 1, true);


--
-- Name: associados associados_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.associados
    ADD CONSTRAINT associados_pkey PRIMARY KEY (id);


--
-- Name: parcelamento configuracao_parcelas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.parcelamento
    ADD CONSTRAINT configuracao_parcelas_pkey PRIMARY KEY (id);


--
-- Name: evento_checklist evento_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_pkey PRIMARY KEY (id);


--
-- Name: evento_despesas evento_despesas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_despesas
    ADD CONSTRAINT evento_despesas_pkey PRIMARY KEY (id);


--
-- Name: evento_produtos evento_produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos
    ADD CONSTRAINT evento_produtos_pkey PRIMARY KEY (id);


--
-- Name: evento eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: evento eventos_slug_evento_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT eventos_slug_evento_key UNIQUE (slug_evento);


--
-- Name: forma_pagamento forma_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.forma_pagamento
    ADD CONSTRAINT forma_pagamento_pkey PRIMARY KEY (id);


--
-- Name: genero genero_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.genero
    ADD CONSTRAINT genero_pkey PRIMARY KEY (id);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);


--
-- Name: notificacoes notificacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_pkey PRIMARY KEY (id);


--
-- Name: organizador_financeiro organizador_financeiro_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_financeiro
    ADD CONSTRAINT organizador_financeiro_pkey PRIMARY KEY (id);


--
-- Name: organizador organizador_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador
    ADD CONSTRAINT organizador_pkey PRIMARY KEY (id);


--
-- Name: status_pagamento status_pagamento_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_pagamento
    ADD CONSTRAINT status_pagamento_pkey PRIMARY KEY (id);


--
-- Name: status_publicacao status_publicacao_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_publicacao
    ADD CONSTRAINT status_publicacao_pkey PRIMARY KEY (id);


--
-- Name: tipo_transacao tipo_transacao_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.tipo_transacao
    ADD CONSTRAINT tipo_transacao_pkey PRIMARY KEY (id);


--
-- Name: usuarios_notificacoes_lidas usuarios_notificacoes_lidas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_notificacoes_lidas
    ADD CONSTRAINT usuarios_notificacoes_lidas_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios usuarios_usuario_cpf_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_cpf_key UNIQUE (usuario_cpf);


--
-- Name: usuarios usuarios_usuario_email_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_email_key UNIQUE (usuario_email);


--
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- Name: wappler_migrations_lock wappler_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.wappler_migrations_lock
    ADD CONSTRAINT wappler_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: wappler_migrations wappler_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.wappler_migrations
    ADD CONSTRAINT wappler_migrations_pkey PRIMARY KEY (id);


--
-- Name: idx_cupom_codigo; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_cupom_codigo ON public.vendas USING btree (cupom_codigo);


--
-- Name: idx_data_criacao; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_data_criacao ON public.vendas USING btree (data_criacao);


--
-- Name: idx_data_update; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_data_update ON public.vendas USING btree (data_update);


--
-- Name: idx_eventos_id; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_eventos_id ON public.vendas USING btree (evento_id);


--
-- Name: idx_eventos_nome; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_eventos_nome ON public.evento USING btree (evento_nome);


--
-- Name: idx_status_pagamento; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_status_pagamento ON public.vendas USING btree (status_pagamento_id);


--
-- Name: idx_usuarios_email; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_usuarios_email ON public.usuarios USING btree (usuario_email);


--
-- Name: idx_usuarios_id; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_usuarios_id ON public.vendas USING btree (usuarios_id);


--
-- Name: usuarios FK_usuarios_genero; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "FK_usuarios_genero" FOREIGN KEY (genero) REFERENCES public.genero(id);


--
-- Name: vendas FK_vendas_evento_produtos; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_evento_produtos" FOREIGN KEY (evento_produtos_id) REFERENCES public.evento_produtos(id);


--
-- Name: vendas FK_vendas_eventos; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_eventos" FOREIGN KEY (evento_id) REFERENCES public.evento(id);


--
-- Name: vendas FK_vendas_forma_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_forma_pagamento" FOREIGN KEY (forma_pagamento_id) REFERENCES public.forma_pagamento(id);


--
-- Name: vendas FK_vendas_status_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_status_pagamento" FOREIGN KEY (status_pagamento_id) REFERENCES public.status_pagamento(id);


--
-- Name: vendas FK_vendas_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_usuarios" FOREIGN KEY (usuarios_id) REFERENCES public.usuarios(id);


--
-- Name: associados associados_codigo_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.associados
    ADD CONSTRAINT associados_codigo_usuario_fkey FOREIGN KEY (codigo_usuario) REFERENCES public.usuarios(id);


--
-- Name: associados associados_criado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.associados
    ADD CONSTRAINT associados_criado_por_fkey FOREIGN KEY (criado_por) REFERENCES public.usuarios(id);


--
-- Name: evento_checklist evento_checklist_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.evento(id);


--
-- Name: evento_checklist evento_checklist_finalizada_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_finalizada_por_fkey FOREIGN KEY (finalizada_por) REFERENCES public.usuarios(id);


--
-- Name: evento_checklist evento_checklist_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: evento_despesas evento_despesas_codigo_evento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_despesas
    ADD CONSTRAINT evento_despesas_codigo_evento_fkey FOREIGN KEY (codigo_evento) REFERENCES public.evento(id);


--
-- Name: evento_despesas evento_despesas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_despesas
    ADD CONSTRAINT evento_despesas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: evento_produtos evento_produtos_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos
    ADD CONSTRAINT evento_produtos_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.evento(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: evento_produtos evento_produtos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos
    ADD CONSTRAINT evento_produtos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: evento eventos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento
    ADD CONSTRAINT eventos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: noticias noticias_criado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_criado_por_fkey FOREIGN KEY (criado_por) REFERENCES public.usuarios(id);


--
-- Name: noticias noticias_status_publicacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_status_publicacao_fkey FOREIGN KEY (status_publicacao) REFERENCES public.status_publicacao(id);


--
-- Name: notificacoes notificacoes_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: usuarios_notificacoes_lidas usuarios_notificacoes_lidas_notificacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_notificacoes_lidas
    ADD CONSTRAINT usuarios_notificacoes_lidas_notificacao_id_fkey FOREIGN KEY (notificacao_id) REFERENCES public.notificacoes(id);


--
-- Name: usuarios_notificacoes_lidas usuarios_notificacoes_lidas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_notificacoes_lidas
    ADD CONSTRAINT usuarios_notificacoes_lidas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

