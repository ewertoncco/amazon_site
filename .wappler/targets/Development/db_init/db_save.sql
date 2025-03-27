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
-- Name: carrinho; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.carrinho (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT now(),
    atualizado_em timestamp without time zone,
    evento_id integer NOT NULL,
    usuario_id integer NOT NULL,
    status_pagamento_id integer NOT NULL,
    transacao_id integer,
    resposta_pagamento text,
    taxa numeric,
    erro boolean,
    qtide_parcelas integer,
    pix_key text,
    pix_qrcode text,
    json text,
    forma_pagamento integer,
    cupom text
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
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
    valor_cupom numeric,
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
    atualizado_em timestamp without time zone,
    criado_por integer,
    evento_id integer,
    nome text NOT NULL,
    qtide_cadastrada integer NOT NULL,
    inicio_vendas timestamp with time zone,
    final_vendas timestamp with time zone,
    valor numeric NOT NULL,
    ordem integer,
    ativo boolean DEFAULT true,
    is_mesa boolean DEFAULT false,
    qtide_mesa integer,
    tipo_item integer,
    valor_desconto numeric
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
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
    criado_em timestamp without time zone DEFAULT now(),
    nome text NOT NULL,
    logo text,
    pertence_usuario integer NOT NULL
);


ALTER TABLE public.organizador OWNER TO amazon;

--
-- Name: organizador_dados; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.organizador_dados (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT now(),
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
-- Name: parcelamento; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.parcelamento (
    id integer NOT NULL,
    juros integer NOT NULL,
    qtide integer NOT NULL,
    parcelamento text NOT NULL
);


ALTER TABLE public.parcelamento OWNER TO amazon;

--
-- Name: parcelamento_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.parcelamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parcelamento_id_seq OWNER TO amazon;

--
-- Name: parcelamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.parcelamento_id_seq OWNED BY public.parcelamento.id;


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
    criado_em timestamp without time zone DEFAULT now(),
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
    senha_atualizada boolean DEFAULT false,
    uuid uuid DEFAULT gen_random_uuid()
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
    criado_em timestamp without time zone DEFAULT now(),
    modificado_em timestamp without time zone,
    item_id integer,
    categoria_id integer,
    participante_nome text,
    participante_telefone text,
    participante_cpf text,
    participante_email text,
    check_in boolean DEFAULT false,
    hora_check_in timestamp without time zone,
    trocou_nome boolean DEFAULT false,
    data_troca date,
    carrinho integer NOT NULL,
    qrcode text,
    valor_original numeric,
    valor_final numeric,
    desconto numeric
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
-- Name: view_eventos_adm; Type: VIEW; Schema: public; Owner: amazon
--

CREATE VIEW public.view_eventos_adm AS
SELECT
    NULL::integer AS id,
    NULL::integer AS organizador_id,
    NULL::timestamp without time zone AS criado_em,
    NULL::integer AS usuario_id,
    NULL::integer AS status_id,
    NULL::text AS titulo,
    NULL::text AS sub_titulo,
    NULL::boolean AS mostrar_descricao,
    NULL::text AS descricao,
    NULL::timestamp without time zone AS data_hora,
    NULL::text AS local,
    NULL::text AS banner,
    NULL::boolean AS tem_mapa,
    NULL::text AS mapa_imagem,
    NULL::boolean AS destaque,
    NULL::boolean AS pode_alterar_ingresso,
    NULL::boolean AS pode_devolver_ingresso,
    NULL::boolean AS aceita_pix,
    NULL::boolean AS aceita_cartao,
    NULL::integer AS parcelas_cartao,
    NULL::text AS slug,
    NULL::boolean AS tem_whatsapp,
    NULL::text AS numero_whatsapp,
    NULL::boolean AS tem_cupom,
    NULL::text AS codigo_cupom,
    NULL::numeric AS valor_cupom,
    NULL::uuid AS uuid,
    NULL::boolean AS divulgacao,
    NULL::integer AS segundos_destaque,
    NULL::numeric AS quantidade_vendas,
    NULL::numeric AS total_vendas;


ALTER TABLE public.view_eventos_adm OWNER TO amazon;

--
-- Name: carrinho id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho ALTER COLUMN id SET DEFAULT nextval('public.carrinho_id_seq'::regclass);


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
-- Name: parcelamento id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.parcelamento ALTER COLUMN id SET DEFAULT nextval('public.parcelamento_id_seq'::regclass);


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
-- Data for Name: carrinho; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.carrinho (id, criado_em, atualizado_em, evento_id, usuario_id, status_pagamento_id, transacao_id, resposta_pagamento, taxa, erro, qtide_parcelas, pix_key, pix_qrcode, json, forma_pagamento, cupom) FROM stdin;
23	2025-03-25 13:15:09.041449	2025-03-25 10:15:16	1	1	3	110341535	Autorizado	\N	f	1	\N	\N	{"IdTransaction":110341535,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"PaymentDate":"2025-03-25T10:15:23.787","IncluedDate":"2025-03-25T10:15:22.01","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":12.9,"NetValue":0,"Reference":"","Tid":"0325101523102","AuthorizationCode":"184616","Splits":[{"IdTransactionSplitter":110341545,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":9,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":110341546,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	\N
22	2025-03-25 13:08:42.300604	2025-03-25 10:08:50	1	1	3	110339746	Autorizado	\N	f	1	\N	\N	{"IdTransaction":110339746,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"PaymentDate":"2025-03-25T10:08:56.827","IncluedDate":"2025-03-25T10:08:54.653","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":12.9,"NetValue":0,"Reference":"","Tid":"0325100856054","AuthorizationCode":"449489","Splits":[{"IdTransactionSplitter":110339754,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":9,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":110339755,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	\N
31	2025-03-25 13:58:17.28432	2025-03-25 10:58:24	1	1	3	110350744	Autorizado	\N	f	1	\N	\N	{"IdTransaction":110350744,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":300,"PaymentDate":"2025-03-25T10:58:31.627","IncluedDate":"2025-03-25T10:58:29.85","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":25.8,"NetValue":0,"Reference":"","Tid":"0325105830945","AuthorizationCode":"138599","Splits":[{"IdTransactionSplitter":110350748,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":18,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":110350749,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	\N
41	2025-03-25 18:07:53.466465	2025-03-25 15:07:57	1	1	3	110391875	Pendente	\N	f	\N	00020101021226850014br.gov.bcb.pix2563qrcodepix.bb.com.br/pix/v2/3f82bceb-114f-4306-a2a3-ef433bb513c55204000053039865406150.005802BR5908SAFE2PAY6012PORTO ALEGRE62070503***63042AE4	https://images.safe2pay.com.br/pix/0ea0a4eccc034ba5b33fad32264a11a9.png	{"IdTransaction":110391875,"TransactionStatus":{"Id":1,"Code":"1","Name":"Pendente"},"PaymentMethod":{"Id":6,"Code":"6","Name":"Pix Recebimento","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"IncluedDate":"2025-03-25T15:08:04.97","InstallmentQuantity":0,"SecretKey":"649419BB2C3E418F8CCCF9C308B3531849DFAB827B534E2BB02C2A655A7D95A0","Reference":"Festival de Rock 2025","IdMultiPaymentCharge":0}	1	\N
42	2025-03-25 18:08:54.805737	2025-03-25 15:08:58	1	1	3	110392107	Pendente	\N	f	\N	00020101021226850014br.gov.bcb.pix2563qrcodepix.bb.com.br/pix/v2/c2bd6777-628c-475b-afe8-e88599fc77815204000053039865406150.005802BR5908SAFE2PAY6012PORTO ALEGRE62070503***63042D9E	https://images.safe2pay.com.br/pix/bf206bcd90c3499896f819bdff7996f0.png	{"IdTransaction":110392107,"TransactionStatus":{"Id":1,"Code":"1","Name":"Pendente"},"PaymentMethod":{"Id":6,"Code":"6","Name":"Pix Recebimento","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"IncluedDate":"2025-03-25T15:09:06.187","InstallmentQuantity":0,"SecretKey":"649419BB2C3E418F8CCCF9C308B3531849DFAB827B534E2BB02C2A655A7D95A0","Reference":"Festival de Rock 2025","IdMultiPaymentCharge":0}	1	\N
29	2025-03-25 13:44:47.89378	2025-03-25 10:44:54	1	1	3	110348139	Autorizado	\N	f	1	\N	\N	{"IdTransaction":110348139,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"PaymentDate":"2025-03-25T10:45:02.327","IncluedDate":"2025-03-25T10:45:00.74","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":12.9,"NetValue":0,"Reference":"","Tid":"0325104501600","AuthorizationCode":"704383","Splits":[{"IdTransactionSplitter":110348142,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":9,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":110348143,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	\N
30	2025-03-25 13:51:41.202574	2025-03-25 10:51:48	1	1	3	110349537	Autorizado	\N	f	1	\N	\N	{"IdTransaction":110349537,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025","Vendor":"Eventos Top Ltda","Amount":150,"PaymentDate":"2025-03-25T10:51:56.527","IncluedDate":"2025-03-25T10:51:53.7","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":12.9,"NetValue":0,"Reference":"","Tid":"0325105154759","AuthorizationCode":"661477","Splits":[{"IdTransactionSplitter":110349543,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":9,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":110349544,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	\N
\.


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
1	1	2025-03-22 12:00:00	1	2	Festival de Rock 2025 🎸	O maior evento de rock do ano	t	Preparem-se para o maior evento de rock do ano! 🤘 No dia 15 de Junho de 2025, a Arena Rock SP vai tremer com os maiores hits e bandas épicas! 🎤✨ Portões abertos às 18:00 – garanta seu ingresso e venha fazer história! 🎟️💥 #FestivalDeRock2025 #LoudAndProud 🚀	2025-06-15 18:00:00	Arena Rock SP	/assets/uploads/banners_eventos/1.png	t	mapa_rock.jpg	f	f	t	t	t	3	festival-rock-2025	t	11987654321	t	ROCK10	10	a857e1da-98c5-45aa-90bf-6d38de82eca6	f	8000
2	1	2025-03-22 13:00:00	1	1	Feira de Tecnologia 2025	Inovações e tendências	t	Descubra as últimas inovações e tendências que vão revolucionar o futuro! No dia 20 de Julho de 2025, o Centro de Convenções SP se transformará no epicentro da tecnologia, reunindo as mentes mais brilhantes e as soluções mais avançadas. Das 09:00 em diante, você poderá explorar inteligência artificial, robótica, realidade virtual e muito mais! 💡🤖. Não perca a chance de conectar-se com especialistas, participar de workshops exclusivos e experimentar as tecnologias que vão moldar o amanhã. 📱✨ Seja você um profissional, estudante ou entusiasta, a Feira de Tecnologia 2025 é o lugar para se inspirar e transformar ideias em realidade! #FeiraTech2025 #O FuturoComeçaAqui 🚀🔧	2025-07-20 09:00:00	Centro de Convenções SP	/assets/uploads/banners_eventos/2.png	f	\N	t	t	f	t	f	1	feira-tecnologia-2025	f	\N	f	\N	5	4c48347f-7298-4fe8-a790-f380e72e3fc0	f	5000
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

COPY public.organizador (id, criado_em, nome, logo, pertence_usuario) FROM stdin;
1	2025-03-22 11:00:00	Eventos Top Ltda	logo_eventos_top.png	1
\.


--
-- Data for Name: organizador_dados; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.organizador_dados (id, criado_em, organizador_id, razao_social, cnpj, token, id_receiver, cashback, tem_cashback, contato_telefone, contato_email, cidade, estado, taxa_juros) FROM stdin;
1	2025-03-22 11:30:00	1	Eventos Top Ltda	12.345.678/0001-99	DFEFC6EAF4F74EFDB91015FC749D8545	1001	5	t	11912345678	contato@eventostop.com	São Paulo	SP	2.50
\.


--
-- Data for Name: parcelamento; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.parcelamento (id, juros, qtide, parcelamento) FROM stdin;
1	1	1	1x
2	4	2	2x
3	8	3	3x
4	12	4	4x
5	16	5	5x
6	20	6	6x
7	24	7	7x
8	28	8	8x
9	32	9	9x
10	36	10	10x
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

COPY public.usuarios (id, criado_em, senha, usuario_email, usuario_nome, usuario_apelido, usuario_telefone, usuario_cpf, ativo, end_rua, end_numero, end_bairro, end_cidade, end_estado, end_cep, notificacoes_email, notificacoes_push, notificacoes_whats, fcm_token, foto, data_nascimento, permissao, genero_id, senha_atualizada, uuid) FROM stdin;
1	2025-03-22 10:00:00	596f5f69fe62b657f1e0c3d39c56f5dec18977e760f019324eb0b68a0f45802e	ewerton.cco@gmail.com	Ewerton Luiz Oliveira	Ewerton	11987654321	026.796.019-04	t	Rua das Flores	123	Jardim Primavera	São Paulo	SP	01234-567	t	t	t	fcm_token_12345	assets\\uploads\\usuarios\\ewerton.jpg	1990-05-15	1	1	f	b17d9180-b45c-4546-911a-3f5954cf76ab
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.vendas (id, criado_em, modificado_em, item_id, categoria_id, participante_nome, participante_telefone, participante_cpf, participante_email, check_in, hora_check_in, trocou_nome, data_troca, carrinho, qrcode, valor_original, valor_final, desconto) FROM stdin;
39	2025-03-25 13:44:47.924897	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	29	78f0c0fe-67cb-4e21-b3b5-42efdc7040b6	150	150	\N
40	2025-03-25 13:51:41.231933	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	30	0db126b5-a56c-4e9e-9daf-8646c5438815	175	150	\N
51	2025-03-25 18:08:54.835491	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	42	4c7c893d-c0c0-4639-b286-d70083e8c912	370	355	\N
32	2025-03-25 13:08:42.332138	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	2025-03-25 16:19:24	f	\N	22	cbd1f7fd-c29a-4749-9f8e-ebd82dfd234f	270	250	\N
33	2025-03-25 13:15:09.066337	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	t	2025-03-25 16:19:27	f	\N	23	ec9b5abf-4ff3-4b4d-a817-7cfa1ed91a22	270	250	\N
50	2025-03-25 18:07:53.496061	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	t	2025-03-25 16:19:29	f	\N	41	685e9402-961a-4e78-b282-5daa17f79826	150	150	\N
41	2025-03-25 13:58:17.310187	\N	2	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	30	c15d0bcd-b041-4187-9c55-0e3d4d11701c	150	100	\N
\.


--
-- Name: carrinho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.carrinho_id_seq', 43, true);


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
-- Name: parcelamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.parcelamento_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.vendas_id_seq', 52, true);


--
-- Name: carrinho carrinho_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_pkey PRIMARY KEY (id);


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
-- Name: parcelamento parcelamento_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.parcelamento
    ADD CONSTRAINT parcelamento_pkey PRIMARY KEY (id);


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
-- Name: view_eventos_adm _RETURN; Type: RULE; Schema: public; Owner: amazon
--

CREATE OR REPLACE VIEW public.view_eventos_adm AS
 SELECT e.id,
    e.organizador_id,
    e.criado_em,
    e.usuario_id,
    e.status_id,
    e.titulo,
    e.sub_titulo,
    e.mostrar_descricao,
    e.descricao,
    e.data_hora,
    e.local,
    e.banner,
    e.tem_mapa,
    e.mapa_imagem,
    e.destaque,
    e.pode_alterar_ingresso,
    e.pode_devolver_ingresso,
    e.aceita_pix,
    e.aceita_cartao,
    e.parcelas_cartao,
    e.slug,
    e.tem_whatsapp,
    e.numero_whatsapp,
    e.tem_cupom,
    e.codigo_cupom,
    e.valor_cupom,
    e.uuid,
    e.divulgacao,
    e.segundos_destaque,
    COALESCE(sum(vendas_info.vendas_count), (0)::numeric) AS quantidade_vendas,
    COALESCE(sum(vendas_info.total_vendas), (0)::numeric) AS total_vendas
   FROM (public.eventos e
     LEFT JOIN ( SELECT c.evento_id,
            count(v.id) AS vendas_count,
            sum(v.valor_final) AS total_vendas
           FROM (public.carrinho c
             JOIN public.vendas v ON ((v.carrinho = c.id)))
          WHERE (c.status_pagamento_id = 3)
          GROUP BY c.evento_id) vendas_info ON ((e.id = vendas_info.evento_id)))
  GROUP BY e.id;


--
-- Name: carrinho FK_carrinho_forma_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT "FK_carrinho_forma_pagamento" FOREIGN KEY (forma_pagamento) REFERENCES public.forma_pagamento(id);


--
-- Name: carrinho FK_carrinho_status_pagamento; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT "FK_carrinho_status_pagamento" FOREIGN KEY (status_pagamento_id) REFERENCES public.status_pagamento(id);


--
-- Name: organizador FK_organizador_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.organizador
    ADD CONSTRAINT "FK_organizador_usuarios" FOREIGN KEY (pertence_usuario) REFERENCES public.usuarios(id) ON UPDATE SET DEFAULT ON DELETE SET DEFAULT;


--
-- Name: vendas FK_vendas_carrinho; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT "FK_vendas_carrinho" FOREIGN KEY (carrinho) REFERENCES public.carrinho(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: carrinho carrinho_evento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_evento_id_fkey FOREIGN KEY (evento_id) REFERENCES public.eventos(id) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- Name: carrinho carrinho_status_pagamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_status_pagamento_id_fkey FOREIGN KEY (status_pagamento_id) REFERENCES public.status_pagamento(id);


--
-- Name: carrinho carrinho_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.carrinho
    ADD CONSTRAINT carrinho_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


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
-- Name: vendas vendas_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.eventos_itens(id);


--
-- PostgreSQL database dump complete
--

