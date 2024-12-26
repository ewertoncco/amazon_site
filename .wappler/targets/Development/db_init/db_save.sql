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
-- Name: carrinho; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.carrinho (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    evento_id integer,
    usuario_id integer,
    tipo_transacao integer,
    status_pagamento integer
);


ALTER TABLE public.carrinho OWNER TO amazon;

--
-- Name: carrinho_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.carrinho_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrinho_id_seq OWNER TO amazon;

--
-- Name: carrinho_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.carrinho_id_seq OWNED BY public.carrinho.id;


--
-- Name: carrinho_itens_vendidos; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.carrinho_itens_vendidos (
    id integer NOT NULL,
    produto_id integer,
    carrinho_id integer,
    item_resgatado boolean DEFAULT false,
    data_horario_resgate timestamp with time zone,
    id_transacao integer,
    pdf text,
    trocou_nome boolean DEFAULT false,
    nome_anterior text,
    cpf_anterior text,
    data_troca timestamp with time zone,
    participante_nome text,
    participante_telefone text,
    participante_cpf text,
    participante_email text
);


ALTER TABLE public.carrinho_itens_vendidos OWNER TO amazon;

--
-- Name: carrinho_itens_vendidos_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.carrinho_itens_vendidos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrinho_itens_vendidos_id_seq OWNER TO amazon;

--
-- Name: carrinho_itens_vendidos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.carrinho_itens_vendidos_id_seq OWNED BY public.carrinho_itens_vendidos.id;


--
-- Name: carrinho_transacoes; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.carrinho_transacoes (
    id integer NOT NULL,
    data_criacao timestamp with time zone DEFAULT now(),
    carrinho_id integer,
    evento_id integer,
    status_pagamento_id integer,
    forma_pagamento_id integer,
    valor_total_compra integer,
    valor_liquido_organizador integer,
    pag_key text,
    pag_qrcode text,
    pag_json json,
    has_error boolean DEFAULT false,
    error_description text,
    error_code text,
    data_update timestamp with time zone,
    pag_id_transaction integer,
    pag_message text,
    pag_description text,
    receita_liquida integer,
    pediu_reembolso boolean DEFAULT false,
    data_vencimento timestamp with time zone,
    desconto boolean DEFAULT false,
    valor_desconto integer
);


ALTER TABLE public.carrinho_transacoes OWNER TO amazon;

--
-- Name: carrinho_transacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.carrinho_transacoes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carrinho_transacoes_id_seq OWNER TO amazon;

--
-- Name: carrinho_transacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.carrinho_transacoes_id_seq OWNED BY public.carrinho_transacoes.id;


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
    cortesia boolean DEFAULT false,
    cupom_ativo boolean DEFAULT false,
    codigo_cupom text,
    valor_desconto integer
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
-- Name: eventos; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.eventos (
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
    bar_online boolean DEFAULT false
);


ALTER TABLE public.eventos OWNER TO amazon;

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

ALTER SEQUENCE public.eventos_id_seq OWNED BY public.eventos.id;


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
-- Name: usuarios_compras; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.usuarios_compras (
    id integer,
    usuario_id integer,
    transacoes_id integer
);


ALTER TABLE public.usuarios_compras OWNER TO amazon;

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
-- Name: carrinho id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho ALTER COLUMN id SET DEFAULT nextval('public.carrinho_id_seq'::regclass);


--
-- Name: carrinho_itens_vendidos id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_itens_vendidos ALTER COLUMN id SET DEFAULT nextval('public.carrinho_itens_vendidos_id_seq'::regclass);


--
-- Name: carrinho_transacoes id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_transacoes ALTER COLUMN id SET DEFAULT nextval('public.carrinho_transacoes_id_seq'::regclass);


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
-- Name: eventos id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);


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
-- Data for Name: carrinho; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.carrinho (id, data_criacao, evento_id, usuario_id, tipo_transacao, status_pagamento) FROM stdin;
1	2024-11-30 18:17:26+00	\N	\N	\N	\N
2	2024-12-16 07:43:55+00	\N	\N	\N	\N
3	2024-12-16 08:07:53+00	\N	\N	\N	\N
4	2024-12-16 08:10:10+00	\N	\N	\N	\N
5	2024-12-16 08:10:51+00	\N	\N	\N	\N
6	2024-12-16 08:10:56+00	\N	\N	\N	\N
7	2024-12-16 08:10:56+00	\N	\N	\N	\N
8	2024-12-16 08:10:56+00	\N	\N	\N	\N
9	2024-12-16 08:10:57+00	\N	\N	\N	\N
10	2024-12-16 14:49:33+00	\N	\N	\N	\N
\.


--
-- Data for Name: carrinho_itens_vendidos; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.carrinho_itens_vendidos (id, produto_id, carrinho_id, item_resgatado, data_horario_resgate, id_transacao, pdf, trocou_nome, nome_anterior, cpf_anterior, data_troca, participante_nome, participante_telefone, participante_cpf, participante_email) FROM stdin;
1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: carrinho_transacoes; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.carrinho_transacoes (id, data_criacao, carrinho_id, evento_id, status_pagamento_id, forma_pagamento_id, valor_total_compra, valor_liquido_organizador, pag_key, pag_qrcode, pag_json, has_error, error_description, error_code, data_update, pag_id_transaction, pag_message, pag_description, receita_liquida, pediu_reembolso, data_vencimento, desconto, valor_desconto) FROM stdin;
17	2024-12-16 18:23:17.765524+00	\N	\N	3	\N	\N	\N	\N	\N	\N	f	\N	\N	\N	101231612	Autorizado	\N	\N	f	\N	f	\N
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

COPY public.evento_produtos (id, data_criacao, usuario_id, evento_id, produto_nome, qtide_cadastrada, inicio_vendas, final_vendas, valor, ordem_lista, ativo, is_mesa, qtide_mesa, cortesia, cupom_ativo, codigo_cupom, valor_desconto) FROM stdin;
22	2024-12-15 17:37:41+00	9	11	Ingresso 01	10	2024-12-15 20:00:00+00	2024-12-16 20:37:00+00	1000	1	t	f	0	f	f	\N	\N
19	2024-12-13 09:33:14+00	9	\N	Bruno VIP	50	2024-12-13 12:00:00+00	2024-12-21 12:33:00+00	20	1	t	f	0	f	f	\N	\N
21	2024-12-13 18:21:18+00	9	11	Ewerton	1000	2024-12-13 18:00:00+00	2024-12-21 18:20:00+00	5000	1	t	f	0	f	t	asdasd	100000
20	2024-12-13 17:57:54+00	9	11	Murilo Vip 201	200	2024-12-13 08:00:00+00	2024-12-21 08:57:00+00	3000	1	t	t	2	f	f	\N	\N
\.


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos (id, data_criacao, usuario_id, evento_status, evento_nome, evento_resumo, evento_descricao, evento_local, evento_banner_principal, evento_banner_secundario, tem_mapa, mapa_imagem, evento_data_hora, evento_destaque, pode_alterar_ingresso, pode_devolver_ingresso, aceita_pix, aceita_cartao, qtide_parcelas_cartao, mostrar_sobre_evento, slug_evento, mostrar_whatsapp, numero_whatsapp, bar_online) FROM stdin;
11	2024-12-01 22:01:06+00	9	1	Corrida de Rua Chapecó+	🏃‍♂️🌟 Prepare-se para a Corrida de Rua Chapecó+! 🌟🏃‍♀️	Venha viver a emoção das ruas de Chapecó com percursos incríveis de 5K e 10K! 🏅 Seja você iniciante ou corredor experiente, este é o evento perfeito para desafiar seus limites, se divertir e conquistar novas metas. 💪✨ A energia estará lá em cada passada, com muita vibração e apoio! 🎶👏\r\n\r\n🗓️ Data: [Insira a data do evento]\r\n📍 Local: [Insira o local do evento]\r\n\r\nNão perca essa oportunidade de celebrar a saúde, o esporte e a superação. Inscreva-se agora e garanta sua vaga! 🖊️🎉 Convide seus amigos e venha fazer parte dessa festa esportiva! 🤩👟 #ChapecóMais #CorridaDeRua	Getúlio Vargas, Chapecó SC	/assets/uploads/banners_eventos/8a82b8f2-d8f0-426f-9bc7-b9e4898e90bf.png	\N	f	\N	2025-01-31 16:00:00+00	t	t	t	t	t	2	t	\N	f		\N
13	2024-12-15 17:27:46+00	9	1	Réveillon dos Desejos 2025	Uma celebração inesquecível, repleta de magia e boas energias para a chegada do novo ano.	O Réveillon dos Desejos 2025 promete ser uma celebração inesquecível, repleta de magia e boas energias para a chegada do novo ano. Realizado na Amazônia, o evento combina uma atmosfera tropical única com uma programação envolvente, perfeita para quem busca experiências memoráveis. A fusão entre cultura local, música e natureza faz deste evento uma opção ideal para celebrar o início de 2025 em grande estilo.\r\n\r\nCom uma ambientação cuidadosamente planejada, o Réveillon dos Desejos oferece uma conexão única com a natureza exuberante da Amazônia, destacando cenários deslumbrantes e momentos de celebração. O público pode esperar uma noite de performances musicais, gastronomia diferenciada e experiências sensoriais que exaltam os desejos de renovação e alegria para o ano que se inicia.	Amazon Club	/assets/uploads/banners_eventos/6d943723-53cb-467e-83d7-3a1c06e8e03d.jpg	\N	f	\N	2024-12-31 19:00:00+00	f	t	t	t	t	1	t	\N	t	(49) 99959-0901	\N
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
3	3	12.00	t	2024-12-25 22:10:22.739352	\N
4	4	16.00	t	2024-12-25 22:10:22.73975	\N
5	5	20.00	t	2024-12-25 22:10:22.757185	\N
6	6	24.00	t	2024-12-25 22:10:22.75687	\N
7	7	28.00	t	2024-12-25 22:10:22.757022	\N
8	8	32.00	t	2024-12-25 22:11:29.810673	\N
9	9	36.00	t	2024-12-25 22:11:29.811102	\N
10	10	40.00	t	2024-12-25 22:11:29.811416	\N
1	1	1.00	t	2024-12-25 22:05:05.326925	\N
2	2	8.00	t	2024-12-25 22:05:05.327166	\N
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
-- Data for Name: usuarios_compras; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.usuarios_compras (id, usuario_id, transacoes_id) FROM stdin;
\.


--
-- Data for Name: usuarios_notificacoes_lidas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.usuarios_notificacoes_lidas (id, data_criacao, usuario_id, notificacao_id) FROM stdin;
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
-- Name: carrinho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.carrinho_id_seq', 10, true);


--
-- Name: carrinho_itens_vendidos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.carrinho_itens_vendidos_id_seq', 10, true);


--
-- Name: carrinho_transacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.carrinho_transacoes_id_seq', 17, true);


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
-- Name: carrinho_itens_vendidos carrinho_itens_vendidos_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_itens_vendidos
    ADD CONSTRAINT carrinho_itens_vendidos_pkey PRIMARY KEY (id);


--
-- Name: carrinho carrinho_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_pkey PRIMARY KEY (id);


--
-- Name: carrinho_transacoes carrinho_transacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_transacoes
    ADD CONSTRAINT carrinho_transacoes_pkey PRIMARY KEY (id);


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
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: eventos eventos_slug_evento_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
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
-- Name: idx_carrinho_evento; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_carrinho_evento ON public.carrinho USING btree (evento_id);


--
-- Name: idx_carrinho_usuario; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_carrinho_usuario ON public.carrinho USING btree (usuario_id);


--
-- Name: idx_eventos_nome; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_eventos_nome ON public.eventos USING btree (evento_nome);


--
-- Name: idx_usuarios_email; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_usuarios_email ON public.usuarios USING btree (usuario_email);


--
-- Name: usuarios_compras FK_usuarios_compras_carrinho_transacoes; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_compras
    ADD CONSTRAINT "FK_usuarios_compras_carrinho_transacoes" FOREIGN KEY (transacoes_id) REFERENCES public.carrinho_transacoes(id);


--
-- Name: usuarios_compras FK_usuarios_compras_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios_compras
    ADD CONSTRAINT "FK_usuarios_compras_usuarios" FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: usuarios FK_usuarios_genero; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT "FK_usuarios_genero" FOREIGN KEY (genero) REFERENCES public.genero(id);


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
-- Name: carrinho carrinho_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


--
-- Name: carrinho_itens_vendidos carrinho_itens_vendidos_carrinho_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_itens_vendidos
    ADD CONSTRAINT carrinho_itens_vendidos_carrinho_id_fkey FOREIGN KEY (carrinho_id) REFERENCES public.carrinho(id);


--
-- Name: carrinho_itens_vendidos carrinho_itens_vendidos_produto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_itens_vendidos
    ADD CONSTRAINT carrinho_itens_vendidos_produto_id_fkey FOREIGN KEY (produto_id) REFERENCES public.evento_produtos(id);


--
-- Name: carrinho carrinho_status_pagamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_status_pagamento_fkey FOREIGN KEY (status_pagamento) REFERENCES public.status_pagamento(id);


--
-- Name: carrinho carrinho_tipo_transacao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_tipo_transacao_fkey FOREIGN KEY (tipo_transacao) REFERENCES public.tipo_transacao(id);


--
-- Name: carrinho_transacoes carrinho_transacoes_carrinho_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_transacoes
    ADD CONSTRAINT carrinho_transacoes_carrinho_id_fkey FOREIGN KEY (carrinho_id) REFERENCES public.carrinho(id);


--
-- Name: carrinho_transacoes carrinho_transacoes_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_transacoes
    ADD CONSTRAINT carrinho_transacoes_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


--
-- Name: carrinho_transacoes carrinho_transacoes_status_pagamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho_transacoes
    ADD CONSTRAINT carrinho_transacoes_status_pagamento_id_fkey FOREIGN KEY (status_pagamento_id) REFERENCES public.status_pagamento(id);


--
-- Name: carrinho carrinho_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: evento_checklist evento_checklist_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


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
    ADD CONSTRAINT evento_despesas_codigo_evento_fkey FOREIGN KEY (codigo_evento) REFERENCES public.eventos(id);


--
-- Name: evento_despesas evento_despesas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_despesas
    ADD CONSTRAINT evento_despesas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: evento_produtos evento_produtos_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos
    ADD CONSTRAINT evento_produtos_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: evento_produtos evento_produtos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_produtos
    ADD CONSTRAINT evento_produtos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: eventos eventos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
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

