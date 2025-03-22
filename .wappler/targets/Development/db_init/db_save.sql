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

--
-- Name: stat_publicacao; Type: TYPE; Schema: public; Owner: amazon
--

CREATE TYPE public.stat_publicacao AS ENUM (
    'rascunho',
    'publicado',
    'arquivado'
);


ALTER TYPE public.stat_publicacao OWNER TO amazon;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categoria_item; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.categoria_item (
    id integer NOT NULL,
    tipo text NOT NULL
);


ALTER TABLE public.categoria_item OWNER TO amazon;

--
-- Name: categoria_item_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.categoria_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_item_id_seq OWNER TO amazon;

--
-- Name: categoria_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.categoria_item_id_seq OWNED BY public.categoria_item.id;


--
-- Name: evento_checklist; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.evento_checklist (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id integer,
    titulo text NOT NULL,
    previsao_conclusao timestamp without time zone,
    finalizada boolean DEFAULT false,
    finalizada_por integer,
    data_finalizacao timestamp without time zone,
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
-- Name: eventos; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.eventos (
    id integer NOT NULL,
    organizador_id integer,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id integer,
    status_id integer,
    titulo text NOT NULL,
    sub_titulo text,
    mostrar_descricao boolean DEFAULT false,
    descricao text,
    data_hora timestamp without time zone NOT NULL,
    local text,
    banner text,
    tem_mapa boolean DEFAULT false,
    mapa_imagem text,
    destaque boolean DEFAULT false,
    pode_alterar_ingresso boolean DEFAULT false,
    pode_devolver_ingresso boolean DEFAULT false,
    aceita_pix boolean DEFAULT false,
    aceita_cartao boolean DEFAULT false,
    parcelas_cartao integer DEFAULT 1,
    slug text,
    tem_whatsapp boolean DEFAULT false,
    numero_whatsapp text,
    tem_cupom boolean DEFAULT false,
    codigo_cupom text,
    valor_cupom numeric(10,2),
    uuid uuid DEFAULT gen_random_uuid(),
    divulgacao boolean,
    segundos_destaque integer
);


ALTER TABLE public.eventos OWNER TO amazon;

--
-- Name: eventos_despesas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.eventos_despesas (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id integer,
    tipo_despesa_id integer,
    titulo text NOT NULL,
    descricao text,
    evento_id integer,
    valor numeric(10,2) NOT NULL,
    paga boolean DEFAULT false,
    data_pagamento timestamp with time zone
);


ALTER TABLE public.eventos_despesas OWNER TO amazon;

--
-- Name: eventos_despesas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.eventos_despesas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eventos_despesas_id_seq OWNER TO amazon;

--
-- Name: eventos_despesas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.eventos_despesas_id_seq OWNED BY public.eventos_despesas.id;


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
-- Name: eventos_itens; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.eventos_itens (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    atualizado_em timestamp without time zone,
    criado_por integer,
    evento_id integer,
    nome text NOT NULL,
    qtide_cadastrada integer NOT NULL,
    inicio_vendas timestamp with time zone,
    final_vendas timestamp with time zone,
    valor numeric(10,2) NOT NULL,
    ordem integer,
    ativo boolean DEFAULT true,
    is_mesa boolean DEFAULT false,
    qtide_mesa integer,
    tipo_item integer,
    valor_desconto numeric(10,2)
);


ALTER TABLE public.eventos_itens OWNER TO amazon;

--
-- Name: eventos_itens_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.eventos_itens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.eventos_itens_id_seq OWNER TO amazon;

--
-- Name: eventos_itens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.eventos_itens_id_seq OWNED BY public.eventos_itens.id;


--
-- Name: forma_pagamento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.forma_pagamento (
    id integer NOT NULL,
    forma text NOT NULL
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
    nome text NOT NULL
);


ALTER TABLE public.genero OWNER TO amazon;

--
-- Name: genero_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.genero_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genero_id_seq OWNER TO amazon;

--
-- Name: genero_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.genero_id_seq OWNED BY public.genero.id;


--
-- Name: logs; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.logs (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id integer,
    ip_address text,
    acao_realizada text,
    tabela text,
    registro_id integer,
    valor_anterior numeric(10,2),
    valor_atual numeric(10,2),
    descricao text
);


ALTER TABLE public.logs OWNER TO amazon;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logs_id_seq OWNER TO amazon;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.logs_id_seq OWNED BY public.logs.id;


--
-- Name: noticias; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.noticias (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    titulo text NOT NULL,
    conteudo text,
    status_publicacao_id integer,
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
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    titulo text NOT NULL,
    conteudo text,
    imagem text,
    criado_por integer,
    interna boolean DEFAULT false,
    push boolean DEFAULT false,
    especifico boolean DEFAULT false,
    destinatario_id integer
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
-- Name: notificacoes_nao_lidas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.notificacoes_nao_lidas (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    usuario_id integer,
    notificacao_id integer
);


ALTER TABLE public.notificacoes_nao_lidas OWNER TO amazon;

--
-- Name: notificacoes_nao_lidas_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.notificacoes_nao_lidas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notificacoes_nao_lidas_id_seq OWNER TO amazon;

--
-- Name: notificacoes_nao_lidas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.notificacoes_nao_lidas_id_seq OWNED BY public.notificacoes_nao_lidas.id;


--
-- Name: organizador; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.organizador (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    nome text NOT NULL,
    logo text
);


ALTER TABLE public.organizador OWNER TO amazon;

--
-- Name: organizador_dados; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.organizador_dados (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    organizador_id integer,
    razao_social text,
    cnpj text,
    token text,
    id_receiver integer,
    cashback integer,
    tem_cashback boolean DEFAULT false,
    contato_telefone text,
    contato_email text,
    cidade text,
    estado text,
    taxa_juros numeric(10,2)
);


ALTER TABLE public.organizador_dados OWNER TO amazon;

--
-- Name: organizador_dados_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.organizador_dados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.organizador_dados_id_seq OWNER TO amazon;

--
-- Name: organizador_dados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.organizador_dados_id_seq OWNED BY public.organizador_dados.id;


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
    status text NOT NULL
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
    status text NOT NULL
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
-- Name: tipo_despesa; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.tipo_despesa (
    id integer NOT NULL,
    despesa text NOT NULL
);


ALTER TABLE public.tipo_despesa OWNER TO amazon;

--
-- Name: tipo_despesa_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.tipo_despesa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_despesa_id_seq OWNER TO amazon;

--
-- Name: tipo_despesa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.tipo_despesa_id_seq OWNED BY public.tipo_despesa.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
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
    data_nascimento date,
    permissao integer,
    genero_id integer,
    senha_atualizada boolean DEFAULT false
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
-- Name: vendas; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    modificado_em timestamp without time zone,
    item_id integer,
    evento_id integer,
    usuario_id integer,
    categoria_id integer,
    forma_pagamento_id integer,
    status_pagamento_id integer,
    valor_original numeric(10,2) NOT NULL,
    desconto_aplicado numeric(10,2),
    valor_final numeric(10,2) NOT NULL,
    cupom_utilizado boolean DEFAULT false,
    cupom_codigo text,
    participante_nome text,
    participante_telefone text,
    participante_cpf text,
    participante_email text,
    pix_key text,
    pix_qrcode text,
    pag_json text,
    erro boolean DEFAULT false,
    mensagem_transacao text,
    qtide_parcelas integer DEFAULT 1,
    transacao_id integer,
    qrcode text,
    check_in boolean DEFAULT false,
    hora_check_in timestamp without time zone,
    trocou_nome boolean DEFAULT false,
    data_troca date
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
-- Name: categoria_item id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.categoria_item ALTER COLUMN id SET DEFAULT nextval('public.categoria_item_id_seq'::regclass);


--
-- Name: evento_checklist id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist ALTER COLUMN id SET DEFAULT nextval('public.evento_checklist_id_seq'::regclass);


--
-- Name: eventos id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos ALTER COLUMN id SET DEFAULT nextval('public.eventos_id_seq'::regclass);


--
-- Name: eventos_despesas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_despesas ALTER COLUMN id SET DEFAULT nextval('public.eventos_despesas_id_seq'::regclass);


--
-- Name: eventos_itens id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_itens ALTER COLUMN id SET DEFAULT nextval('public.eventos_itens_id_seq'::regclass);


--
-- Name: forma_pagamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.forma_pagamento ALTER COLUMN id SET DEFAULT nextval('public.forma_pagamento_id_seq'::regclass);


--
-- Name: genero id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.genero ALTER COLUMN id SET DEFAULT nextval('public.genero_id_seq'::regclass);


--
-- Name: logs id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.logs ALTER COLUMN id SET DEFAULT nextval('public.logs_id_seq'::regclass);


--
-- Name: noticias id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias ALTER COLUMN id SET DEFAULT nextval('public.noticias_id_seq'::regclass);


--
-- Name: notificacoes id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes ALTER COLUMN id SET DEFAULT nextval('public.notificacoes_id_seq'::regclass);


--
-- Name: notificacoes_nao_lidas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes_nao_lidas ALTER COLUMN id SET DEFAULT nextval('public.notificacoes_nao_lidas_id_seq'::regclass);


--
-- Name: organizador id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador ALTER COLUMN id SET DEFAULT nextval('public.organizador_id_seq'::regclass);


--
-- Name: organizador_dados id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_dados ALTER COLUMN id SET DEFAULT nextval('public.organizador_dados_id_seq'::regclass);


--
-- Name: status_pagamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_pagamento ALTER COLUMN id SET DEFAULT nextval('public.status_pagamento_id_seq'::regclass);


--
-- Name: status_publicacao id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.status_publicacao ALTER COLUMN id SET DEFAULT nextval('public.status_publicacao_id_seq'::regclass);


--
-- Name: tipo_despesa id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.tipo_despesa ALTER COLUMN id SET DEFAULT nextval('public.tipo_despesa_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Data for Name: categoria_item; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.categoria_item (id, tipo) FROM stdin;
1	Ingresso
2	Mensalidade
3	Produto
4	Camiseta
5	Chaveiro
\.


--
-- Data for Name: evento_checklist; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.evento_checklist (id, criado_em, usuario_id, titulo, previsao_conclusao, finalizada, finalizada_por, data_finalizacao, evento_id) FROM stdin;
\.


--
-- Data for Name: eventos; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos (id, organizador_id, criado_em, usuario_id, status_id, titulo, sub_titulo, mostrar_descricao, descricao, data_hora, local, banner, tem_mapa, mapa_imagem, destaque, pode_alterar_ingresso, pode_devolver_ingresso, aceita_pix, aceita_cartao, parcelas_cartao, slug, tem_whatsapp, numero_whatsapp, tem_cupom, codigo_cupom, valor_cupom, uuid, divulgacao, segundos_destaque) FROM stdin;
1	1	2025-03-22 12:00:00	1	1	Festival de Rock 2025	O maior evento de rock do ano	t	Um dia inteiro de música e diversão	2025-06-15 18:00:00	Arena Rock SP	banner_festival_rock.jpg	t	mapa_rock.jpg	t	f	t	t	t	3	festival-rock-2025	t	11987654321	t	ROCK10	10.00	a857e1da-98c5-45aa-90bf-6d38de82eca6	f	8000
2	1	2025-03-22 13:00:00	1	1	Feira de Tecnologia 2025	Inovações e tendências	f	\N	2025-07-20 09:00:00	Centro de Convenções SP	banner_feira_tech.jpg	f	\N	f	t	f	t	f	1	feira-tecnologia-2025	f	\N	f	\N	\N	4c48347f-7298-4fe8-a790-f380e72e3fc0	f	5000
\.


--
-- Data for Name: eventos_despesas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos_despesas (id, criado_em, usuario_id, tipo_despesa_id, titulo, descricao, evento_id, valor, paga, data_pagamento) FROM stdin;
\.


--
-- Data for Name: eventos_itens; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos_itens (id, criado_em, atualizado_em, criado_por, evento_id, nome, qtide_cadastrada, inicio_vendas, final_vendas, valor, ordem, ativo, is_mesa, qtide_mesa, tipo_item, valor_desconto) FROM stdin;
1	2025-03-22 14:00:00	\N	1	1	Ingresso Pista	500	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	150.00	1	t	f	\N	1	\N
2	2025-03-22 14:05:00	\N	1	1	Ingresso VIP	200	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	300.00	2	t	f	\N	1	20.00
3	2025-03-22 14:10:00	\N	1	1	Mesa Premium	10	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	1000.00	3	t	t	4	2	\N
4	2025-03-22 14:15:00	\N	1	2	Ingresso Básico	1000	2025-05-01 12:00:00+00	2025-07-20 02:59:00+00	50.00	1	t	f	\N	1	\N
5	2025-03-22 14:20:00	\N	1	2	Ingresso Premium	300	2025-05-01 12:00:00+00	2025-07-20 02:59:00+00	120.00	2	t	f	\N	1	10.00
\.


--
-- Data for Name: forma_pagamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.forma_pagamento (id, forma) FROM stdin;
1	Pix
2	Cartão de Crédito
3	Cartão de Crédito parcelado
4	Cartão de Débito
5	Dinheiro
6	Boleto
7	Cortesia
8	Gratuito
9	Convidado mesa
\.


--
-- Data for Name: genero; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.genero (id, nome) FROM stdin;
1	Masculino
2	Feminino
3	Outro
4	Prefiro não informar
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.logs (id, criado_em, usuario_id, ip_address, acao_realizada, tabela, registro_id, valor_anterior, valor_atual, descricao) FROM stdin;
\.


--
-- Data for Name: noticias; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.noticias (id, criado_em, titulo, conteudo, status_publicacao_id, criado_por) FROM stdin;
\.


--
-- Data for Name: notificacoes; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.notificacoes (id, criado_em, titulo, conteudo, imagem, criado_por, interna, push, especifico, destinatario_id) FROM stdin;
\.


--
-- Data for Name: notificacoes_nao_lidas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.notificacoes_nao_lidas (id, criado_em, usuario_id, notificacao_id) FROM stdin;
\.


--
-- Data for Name: organizador; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.organizador (id, criado_em, nome, logo) FROM stdin;
1	2025-03-22 11:00:00	Eventos Top Ltda	logo_eventos_top.png
\.


--
-- Data for Name: organizador_dados; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.organizador_dados (id, criado_em, organizador_id, razao_social, cnpj, token, id_receiver, cashback, tem_cashback, contato_telefone, contato_email, cidade, estado, taxa_juros) FROM stdin;
1	2025-03-22 11:30:00	1	Eventos Top Ltda	12.345.678/0001-99	token_abc123	1001	5	t	11912345678	contato@eventostop.com	São Paulo	SP	2.50
\.


--
-- Data for Name: status_pagamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.status_pagamento (id, status) FROM stdin;
1	Pendente
2	Processamento
3	Autorizado
4	xxx
5	Em disputa
6	Devolvido
7	Baixado
8	Recusado
9	Erro
10	Solicitou Reembolso
\.


--
-- Data for Name: status_publicacao; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.status_publicacao (id, status) FROM stdin;
1	Rascunho
2	Publicado
3	Cancelado
4	Finalizado
\.


--
-- Data for Name: tipo_despesa; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.tipo_despesa (id, despesa) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.usuarios (id, criado_em, senha, usuario_email, usuario_nome, usuario_apelido, usuario_telefone, usuario_cpf, ativo, end_rua, end_numero, end_bairro, end_cidade, end_estado, end_cep, notificacoes_email, notificacoes_push, notificacoes_whats, fcm_token, foto, data_nascimento, permissao, genero_id, senha_atualizada) FROM stdin;
1	2025-03-22 10:00:00	hashedpassword123	joao.silva@email.com	João Silva	Joãozinho	11987654321	123.456.789-00	t	Rua das Flores	123	Jardim Primavera	São Paulo	SP	01234-567	t	t	t	fcm_token_12345	foto_joao.jpg	1990-05-15	1	1	f
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.vendas (id, criado_em, modificado_em, item_id, evento_id, usuario_id, categoria_id, forma_pagamento_id, status_pagamento_id, valor_original, desconto_aplicado, valor_final, cupom_utilizado, cupom_codigo, participante_nome, participante_telefone, participante_cpf, participante_email, pix_key, pix_qrcode, pag_json, erro, mensagem_transacao, qtide_parcelas, transacao_id, qrcode, check_in, hora_check_in, trocou_nome, data_troca) FROM stdin;
\.


--
-- Name: categoria_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.categoria_item_id_seq', 5, true);


--
-- Name: evento_checklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.evento_checklist_id_seq', 1, false);


--
-- Name: eventos_despesas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.eventos_despesas_id_seq', 1, false);


--
-- Name: eventos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.eventos_id_seq', 2, true);


--
-- Name: eventos_itens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.eventos_itens_id_seq', 5, true);


--
-- Name: forma_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.forma_pagamento_id_seq', 1, false);


--
-- Name: genero_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.genero_id_seq', 4, true);


--
-- Name: logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.logs_id_seq', 1, false);


--
-- Name: noticias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.noticias_id_seq', 1, false);


--
-- Name: notificacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.notificacoes_id_seq', 1, false);


--
-- Name: notificacoes_nao_lidas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.notificacoes_nao_lidas_id_seq', 1, false);


--
-- Name: organizador_dados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.organizador_dados_id_seq', 1, true);


--
-- Name: organizador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.organizador_id_seq', 1, true);


--
-- Name: status_pagamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.status_pagamento_id_seq', 1, false);


--
-- Name: status_publicacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.status_publicacao_id_seq', 4, true);


--
-- Name: tipo_despesa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.tipo_despesa_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 1, true);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.vendas_id_seq', 1, false);


--
-- Name: categoria_item categoria_item_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.categoria_item
    ADD CONSTRAINT categoria_item_pkey PRIMARY KEY (id);


--
-- Name: evento_checklist evento_checklist_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.evento_checklist
    ADD CONSTRAINT evento_checklist_pkey PRIMARY KEY (id);


--
-- Name: eventos_despesas eventos_despesas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_despesas
    ADD CONSTRAINT eventos_despesas_pkey PRIMARY KEY (id);


--
-- Name: eventos_itens eventos_itens_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_itens
    ADD CONSTRAINT eventos_itens_pkey PRIMARY KEY (id);


--
-- Name: eventos eventos_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_pkey PRIMARY KEY (id);


--
-- Name: eventos eventos_slug_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_slug_key UNIQUE (slug);


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
-- Name: logs logs_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_pkey PRIMARY KEY (id);


--
-- Name: noticias noticias_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_pkey PRIMARY KEY (id);


--
-- Name: notificacoes_nao_lidas notificacoes_nao_lidas_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes_nao_lidas
    ADD CONSTRAINT notificacoes_nao_lidas_pkey PRIMARY KEY (id);


--
-- Name: notificacoes notificacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_pkey PRIMARY KEY (id);


--
-- Name: organizador_dados organizador_dados_cnpj_key; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_dados
    ADD CONSTRAINT organizador_dados_cnpj_key UNIQUE (cnpj);


--
-- Name: organizador_dados organizador_dados_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_dados
    ADD CONSTRAINT organizador_dados_pkey PRIMARY KEY (id);


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
-- Name: tipo_despesa tipo_despesa_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.tipo_despesa
    ADD CONSTRAINT tipo_despesa_pkey PRIMARY KEY (id);


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
-- Name: idx_eventos_organizador; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_eventos_organizador ON public.eventos USING btree (organizador_id);


--
-- Name: idx_eventos_status; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_eventos_status ON public.eventos USING btree (status_id);


--
-- Name: idx_usuarios_cpf; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_usuarios_cpf ON public.usuarios USING btree (usuario_cpf);


--
-- Name: idx_usuarios_email; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_usuarios_email ON public.usuarios USING btree (usuario_email);


--
-- Name: idx_vendas_evento; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_vendas_evento ON public.vendas USING btree (evento_id);


--
-- Name: idx_vendas_status; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_vendas_status ON public.vendas USING btree (status_pagamento_id);


--
-- Name: idx_vendas_usuario; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX idx_vendas_usuario ON public.vendas USING btree (usuario_id);


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
-- Name: eventos_despesas eventos_despesas_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_despesas
    ADD CONSTRAINT eventos_despesas_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


--
-- Name: eventos_despesas eventos_despesas_tipo_despesa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_despesas
    ADD CONSTRAINT eventos_despesas_tipo_despesa_id_fkey FOREIGN KEY (tipo_despesa_id) REFERENCES public.tipo_despesa(id);


--
-- Name: eventos_despesas eventos_despesas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_despesas
    ADD CONSTRAINT eventos_despesas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: eventos_itens eventos_itens_criado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_itens
    ADD CONSTRAINT eventos_itens_criado_por_fkey FOREIGN KEY (criado_por) REFERENCES public.usuarios(id);


--
-- Name: eventos_itens eventos_itens_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_itens
    ADD CONSTRAINT eventos_itens_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


--
-- Name: eventos_itens eventos_itens_tipo_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos_itens
    ADD CONSTRAINT eventos_itens_tipo_item_fkey FOREIGN KEY (tipo_item) REFERENCES public.categoria_item(id);


--
-- Name: eventos eventos_organizador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_organizador_id_fkey FOREIGN KEY (organizador_id) REFERENCES public.organizador(id);


--
-- Name: eventos eventos_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.status_publicacao(id);


--
-- Name: eventos eventos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.eventos
    ADD CONSTRAINT eventos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: logs logs_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.logs
    ADD CONSTRAINT logs_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: noticias noticias_criado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_criado_por_fkey FOREIGN KEY (criado_por) REFERENCES public.usuarios(id);


--
-- Name: noticias noticias_status_publicacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.noticias
    ADD CONSTRAINT noticias_status_publicacao_id_fkey FOREIGN KEY (status_publicacao_id) REFERENCES public.status_publicacao(id);


--
-- Name: notificacoes notificacoes_criado_por_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_criado_por_fkey FOREIGN KEY (criado_por) REFERENCES public.usuarios(id);


--
-- Name: notificacoes notificacoes_destinatario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes
    ADD CONSTRAINT notificacoes_destinatario_id_fkey FOREIGN KEY (destinatario_id) REFERENCES public.usuarios(id);


--
-- Name: notificacoes_nao_lidas notificacoes_nao_lidas_notificacao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes_nao_lidas
    ADD CONSTRAINT notificacoes_nao_lidas_notificacao_id_fkey FOREIGN KEY (notificacao_id) REFERENCES public.notificacoes(id);


--
-- Name: notificacoes_nao_lidas notificacoes_nao_lidas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.notificacoes_nao_lidas
    ADD CONSTRAINT notificacoes_nao_lidas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- Name: organizador_dados organizador_dados_organizador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador_dados
    ADD CONSTRAINT organizador_dados_organizador_id_fkey FOREIGN KEY (organizador_id) REFERENCES public.organizador(id);


--
-- Name: usuarios usuarios_genero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_genero_id_fkey FOREIGN KEY (genero_id) REFERENCES public.genero(id);


--
-- Name: vendas vendas_categoria_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES public.categoria_item(id);


--
-- Name: vendas vendas_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id);


--
-- Name: vendas vendas_forma_pagamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_forma_pagamento_id_fkey FOREIGN KEY (forma_pagamento_id) REFERENCES public.forma_pagamento(id);


--
-- Name: vendas vendas_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.eventos_itens(id);


--
-- Name: vendas vendas_status_pagamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_status_pagamento_id_fkey FOREIGN KEY (status_pagamento_id) REFERENCES public.status_pagamento(id);


--
-- Name: vendas vendas_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id);


--
-- PostgreSQL database dump complete
--

