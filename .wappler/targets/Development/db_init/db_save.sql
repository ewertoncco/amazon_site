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
    erro boolean,
    qtide_parcelas integer,
    pix_key text,
    pix_qrcode text,
    json text,
    forma_pagamento integer,
    total_bruto numeric,
    total_taxas_transacao numeric,
    total_plataforma numeric,
    cupom boolean
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
    tipo_item integer
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
-- Name: meus_indicados; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.meus_indicados (
    id integer NOT NULL,
    criado_em timestamp without time zone DEFAULT now(),
    meu_id integer NOT NULL,
    organizador_id integer NOT NULL
);


ALTER TABLE public.meus_indicados OWNER TO amazon;

--
-- Name: meus_indicados_id_seq; Type: SEQUENCE; Schema: public; Owner: amazon
--

CREATE SEQUENCE public.meus_indicados_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meus_indicados_id_seq OWNER TO amazon;

--
-- Name: meus_indicados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: amazon
--

ALTER SEQUENCE public.meus_indicados_id_seq OWNED BY public.meus_indicados.id;


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
    taxa_juros numeric
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
-- Name: sessions; Type: TABLE; Schema: public; Owner: amazon
--

CREATE TABLE public.sessions (
    sid character varying(255) NOT NULL,
    sess json NOT NULL,
    expired timestamp with time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO amazon;

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
-- Name: view_itens; Type: VIEW; Schema: public; Owner: amazon
--

CREATE VIEW public.view_itens AS
 SELECT ei.id,
    ei.evento_id,
    ei.nome,
    ei.qtide_cadastrada,
    ei.inicio_vendas,
    ei.final_vendas,
    ei.valor,
    ei.ordem,
    ei.is_mesa,
    ei.qtide_mesa,
    ei.tipo_item,
        CASE
            WHEN (ei.qtide_cadastrada > 0) THEN COALESCE((((( SELECT count(*) AS count
               FROM (public.vendas v
                 JOIN public.carrinho c ON ((v.carrinho = c.id)))
              WHERE ((v.item_id = ei.id) AND (c.status_pagamento_id = 3))))::double precision / (ei.qtide_cadastrada)::double precision) >= (0.7)::double precision), false)
            ELSE false
        END AS quase_acabando,
    GREATEST(((ei.final_vendas)::date - CURRENT_DATE), 0) AS contagem_regressiva
   FROM public.eventos_itens ei
  WHERE ((ei.ativo = true) AND (COALESCE(( SELECT count(*) AS count
           FROM (public.vendas v
             JOIN public.carrinho c ON ((v.carrinho = c.id)))
          WHERE ((v.item_id = ei.id) AND (c.status_pagamento_id = 3) AND (c.evento_id = ei.evento_id))), (0)::bigint) < ei.qtide_cadastrada));


ALTER TABLE public.view_itens OWNER TO amazon;

--
-- Name: view_itens_evento; Type: VIEW; Schema: public; Owner: amazon
--

CREATE VIEW public.view_itens_evento AS
 SELECT ei.id,
    ei.criado_em,
    ei.atualizado_em,
    ei.criado_por,
    ei.evento_id,
    ei.nome,
    ei.qtide_cadastrada,
    ei.inicio_vendas,
    ei.final_vendas,
    ei.valor,
    ei.ordem,
    ei.ativo,
    ei.is_mesa,
    ei.qtide_mesa,
    ei.tipo_item,
    COALESCE(v.total_vendas, (0)::bigint) AS total_vendas,
        CASE
            WHEN ((v.total_vendas)::numeric >= ((ei.qtide_cadastrada)::numeric * 0.7)) THEN true
            ELSE false
        END AS quase_acabando,
    GREATEST((0)::double precision, date_part('day'::text, (ei.final_vendas - now()))) AS contagem_regressiva
   FROM (public.eventos_itens ei
     LEFT JOIN ( SELECT v_1.item_id,
            count(v_1.id) AS total_vendas
           FROM (public.vendas v_1
             JOIN public.carrinho c ON ((v_1.carrinho = c.id)))
          WHERE (c.status_pagamento_id = 3)
          GROUP BY v_1.item_id) v ON ((ei.id = v.item_id)));


ALTER TABLE public.view_itens_evento OWNER TO amazon;

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
-- Name: meus_indicados id; Type: DEFAULT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.meus_indicados ALTER COLUMN id SET DEFAULT nextval('public.meus_indicados_id_seq'::regclass);


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

COPY public.carrinho (id, criado_em, atualizado_em, evento_id, usuario_id, status_pagamento_id, transacao_id, resposta_pagamento, erro, qtide_parcelas, pix_key, pix_qrcode, json, forma_pagamento, total_bruto, total_taxas_transacao, total_plataforma, cupom) FROM stdin;
125	2025-03-30 14:57:30.938666	2025-03-30 11:57:38	2	1	3	111274531	Autorizado	f	4	\N	\N	\N	3	100	\N	\N	f
124	2025-03-29 16:30:11.654374	2025-03-29 13:30:19	2	1	3	111118564	Autorizado	f	1	\N	\N	\N	2	228	\N	\N	t
129	2025-03-30 15:07:39.712594	2025-03-30 12:07:46	2	1	3	111276176	Autorizado	f	1	\N	\N	\N	2	50	\N	\N	f
126	2025-03-30 14:59:41.255388	2025-03-30 16:59:50	2	1	3	111274863	Autorizado	f	1	\N	\N	{"IdTransaction":111274863,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Feira de Tecnologia 2025","Vendor":"Eventos Top Ltda","Amount":47.5,"PaymentDate":"2025-03-30T11:59:48.24","IncluedDate":"2025-03-30T11:59:46.687","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":4.09,"NetValue":0,"Reference":"Feira de Tecnologia 2025","Tid":"0330115947522","AuthorizationCode":"998038","Splits":[{"IdTransactionSplitter":111274870,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":2.85,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":111274871,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	47.5	4.09	\N	t
127	2025-03-30 15:01:14.360678	2025-03-30 17:01:23	2	1	3	111275145	Autorizado	f	1	\N	\N	{"IdTransaction":111275145,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Feira de Tecnologia 2025","Vendor":"Eventos Top Ltda","Amount":47.5,"PaymentDate":"2025-03-30T12:01:22.54","IncluedDate":"2025-03-30T12:01:20.71","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":4.09,"NetValue":0,"Reference":"Feira de Tecnologia 2025","Tid":"0330120121642","AuthorizationCode":"889027","Splits":[{"IdTransactionSplitter":111275153,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":2.85,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":111275154,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	47.5	4.09	0	t
130	2025-03-30 15:14:59.993245	2025-03-30 12:15:06	2	1	3	111277559	Autorizado	f	1	\N	\N	\N	2	50	4.3	\N	f
131	2025-03-30 15:18:24.966018	2025-03-30 12:18:46	1	1	3	111278167	Autorizado	f	1	\N	\N	{"IdTransaction":111278167,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"PaymentMethod":{"Id":2,"Code":"2","Name":"Cartão de Crédito","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025 🎸","Vendor":"Eventos Top Ltda","Amount":270,"PaymentDate":"2025-03-30T12:18:46.77","IncluedDate":"2025-03-30T12:18:32.723","InstallmentQuantity":1,"SecretKey":"C1BA4CC3BDD14D518E3848025AFA9D2F94EB6F38E8EE4335873C451398146616","TaxValue":23.22,"NetValue":0,"Reference":"Festival de Rock 2025 🎸","Tid":"0330121844414","AuthorizationCode":"742718","Splits":[{"IdTransactionSplitter":111278201,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":16.2,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]},{"IdTransactionSplitter":111278202,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"","Amount":0,"Tax":0,"IsTransferred":false,"ReleaseDate":"0001-01-01T00:00:00"}]}],"IdMultiPaymentCharge":0}	2	270	23.22	\N	t
132	2025-03-30 15:44:28.605652	\N	1	1	1	111281928	\N	f	\N	00020101021226850014br.gov.bcb.pix2563qrcodepix.bb.com.br/pix/v2/7ad71a85-5aef-4140-b578-b4214b82ab8e5204000053039865406150.005802BR5908SAFE2PAY6012PORTO ALEGRE62070503***6304A235	https://images.safe2pay.com.br/pix/9f15fb76b1644ad0827bb84dbd11e288.png	\N	1	\N	\N	\N	\N
133	2025-03-30 15:51:53.46921	\N	1	1	1	111282962	\N	f	\N	00020101021226850014br.gov.bcb.pix2563qrcodepix.bb.com.br/pix/v2/4667ec7a-b5a8-45f0-88be-a4ba2c70d2065204000053039865406150.005802BR5908SAFE2PAY6012PORTO ALEGRE62070503***63045C46	https://images.safe2pay.com.br/pix/b93d18e4a8a74f54b0679605f29bd722.png	\N	1	\N	\N	\N	\N
134	2025-03-30 15:54:13.541594	\N	1	1	1	111283296	\N	f	\N	00020101021226850014br.gov.bcb.pix2563qrcodepix.bb.com.br/pix/v2/1a2d6c92-9793-438f-ac67-9159731ca37052040000530398654045.005802BR5908SAFE2PAY6012PORTO ALEGRE62070503***6304D066	https://images.safe2pay.com.br/pix/b7cad5d85dce4e9f9994f9c0d24645d6.png	\N	1	\N	\N	\N	\N
140	2025-03-30 16:46:08.59018	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
141	2025-03-30 16:47:34.586036	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
142	2025-03-30 16:50:31.075512	\N	1	1	1	\N	\N	f	\N	\N	\N	\N	1	\N	\N	\N	f
143	2025-03-30 16:53:09.417421	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
144	2025-03-30 16:54:46.086711	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
145	2025-03-30 16:56:59.95865	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
146	2025-03-30 16:58:26.943792	\N	1	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
147	2025-03-30 18:42:06.600153	\N	2	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
148	2025-03-30 18:42:19.968535	\N	2	1	1	\N	\N	t	\N	\N	\N	\N	1	\N	\N	\N	\N
149	2025-03-30 18:48:07.558889	2025-03-30 15:48:12	2	1	1	111310398	Pendente	f	\N	\N	\N	{"IdTransaction":111310398,"TransactionStatus":{"Id":1,"Code":"1","Name":"Pendente"},"PaymentMethod":{"Id":6,"Code":"6","Name":"Pix Recebimento","Show":false,"IsEnabled":false},"Application":"Feira de Tecnologia 2025","Vendor":"Eventos Top Ltda","Amount":50,"IncluedDate":"2025-03-30T15:48:10.23","InstallmentQuantity":0,"SecretKey":"66930C0A6CB14784A3E0E538538C19FDB247847AE3A946AA9ADDC15A5E4A3CFC","Reference":"Feira de Tecnologia 2025","IdMultiPaymentCharge":0}	1	50	\N	\N	f
150	2025-03-30 18:49:20.002878	2025-03-30 15:50:30	1	1	3	111310593	Autorizado	f	\N	\N	\N	{"IdTransaction":111310593,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":3.7,"Tax":0.7,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}],"PaymentMethod":{"Id":6,"Code":"6","Name":"Pix Recebimento","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025 🎸","Vendor":"Eventos Top Ltda","Amount":5,"PaymentDate":"2025-03-30T15:50:28","IncluedDate":"2025-03-30T15:49:22.583","InstallmentQuantity":0,"SecretKey":"66930C0A6CB14784A3E0E538538C19FDB247847AE3A946AA9ADDC15A5E4A3CFC","TaxValue":1.15,"NetValue":3.7,"EndToEndId":"E30723871202503301850ISG8MDEY6EP","Reference":"Festival de Rock 2025 🎸","Splits":[{"IdTransactionSplitter":111310595,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":0.45,"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":0.45,"Tax":0,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}]},{"IdTransactionSplitter":111310777,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":0.15,"Tax":0,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}]}],"IdMultiPaymentCharge":0}	1	5	1.15	3.7	f
151	2025-03-30 18:59:46.582345	2025-03-30 16:00:20	1	1	3	111312205	Autorizado	f	\N	\N	\N	{"IdTransaction":111312205,"TransactionStatus":{"Id":3,"Code":"3","Name":"Autorizado"},"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":3.7,"Tax":0.7,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}],"PaymentMethod":{"Id":6,"Code":"6","Name":"Pix Recebimento","Show":false,"IsEnabled":false},"Application":"Festival de Rock 2025 🎸","Vendor":"Eventos Top Ltda","Amount":5,"PaymentDate":"2025-03-30T16:00:16","IncluedDate":"2025-03-30T15:59:49.67","InstallmentQuantity":0,"SecretKey":"66930C0A6CB14784A3E0E538538C19FDB247847AE3A946AA9ADDC15A5E4A3CFC","TaxValue":1.15,"NetValue":3.7,"EndToEndId":"E30723871202503301900AXRKBC88BAP","Reference":"Festival de Rock 2025 🎸","Splits":[{"IdTransactionSplitter":111312206,"IdReceiver":191055,"CodeTaxType":2,"Identity":"19639842000116","Name":"W27 SOLUCOES LTDA","IsPayTax":true,"Amount":0.45,"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":0.45,"Tax":0,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}]},{"IdTransactionSplitter":111312293,"IdReceiver":404810,"CodeTaxType":1,"Identity":"02679601904","Name":"EWERTON LUIZ OLIVEIRA","IsPayTax":false,"Amount":3,"CheckingAccounts":[{"Description":"Ewerton Luiz Oliveira (02679601904)","Amount":0.15,"Tax":0,"IsTransferred":false,"ReleaseDate":"2025-03-31T00:00:00"}]}],"IdMultiPaymentCharge":0}	1	5	1.15	3.7	f
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
7	1	2025-03-30 22:56:34.376636	1	2	Levem o ASU na Oficina	asddas	t	sdfsdf	2025-04-05 19:56:00	asd	/assets/uploads/banners_eventos/93d755fe-d32f-4678-847b-78477cec0f68.png	\N	\N	t	t	\N	t	\N	1	levem-o-asu-na-oficina	\N		\N		\N	fc5e1f61-9f79-4273-aa33-202aa8b0a692	\N	5000
2	1	2025-03-22 13:00:00	1	1	Feira de Tecnologia 2025	Inovações e tendências	t	Descubra as últimas inovações e tendências que vão revolucionar o futuro! No dia 20 de Julho de 2025, o Centro de Convenções SP se transformará no epicentro da tecnologia, reunindo as mentes mais brilhantes e as soluções mais avançadas. Das 09:00 em diante, você poderá explorar inteligência artificial, robótica, realidade virtual e muito mais! 💡🤖. Não perca a chance de conectar-se com especialistas, participar de workshops exclusivos e experimentar as tecnologias que vão moldar o amanhã. 📱✨ Seja você um profissional, estudante ou entusiasta, a Feira de Tecnologia 2025 é o lugar para se inspirar e transformar ideias em realidade! #FeiraTech2025 #O FuturoComeçaAqui 🚀🔧	2025-07-20 09:00:00	Centro de Convenções SP	/assets/uploads/banners_eventos/2.png	f	\N	t	t	f	t	f	1	feira-tecnologia-2025	f	\N	t	FEIRA	5	4c48347f-7298-4fe8-a790-f380e72e3fc0	f	5000
\.


--
-- Data for Name: eventos_despesas; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos_despesas (id, criado_em, usuario_id, tipo_despesa_id, titulo, descricao, evento_id, valor, paga, data_pagamento) FROM stdin;
\.


--
-- Data for Name: eventos_itens; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.eventos_itens (id, criado_em, atualizado_em, criado_por, evento_id, nome, qtide_cadastrada, inicio_vendas, final_vendas, valor, ordem, ativo, is_mesa, qtide_mesa, tipo_item) FROM stdin;
3	2025-03-22 14:10:00	\N	1	1	Mesa Premium	5	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	1000.00	3	t	t	4	2
4	2025-03-22 14:15:00	\N	1	2	Ingresso Básico	5	2025-05-01 12:00:00+00	2025-07-20 02:59:00+00	50.00	1	t	f	\N	1
2	2025-03-22 14:05:00	\N	1	1	Ingresso VIP	5	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	300.00	2	t	f	\N	1
5	2025-03-22 14:20:00	\N	1	2	Ingresso Premium	4	2025-05-01 12:00:00+00	2025-07-20 02:59:00+00	120.00	2	t	f	\N	1
1	2025-03-22 14:00:00	\N	1	1	Ingresso Pista	5	2025-04-01 13:00:00+00	2025-06-15 02:59:00+00	5	1	t	f	\N	1
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
-- Data for Name: meus_indicados; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.meus_indicados (id, criado_em, meu_id, organizador_id) FROM stdin;
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
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: amazon
--

COPY public.sessions (sid, sess, expired) FROM stdin;
vxa2QenMoHAYLacY2rTRA0870FmdJTCd	{"cookie":{"originalMaxAge":86400000,"expires":"2025-03-31T19:04:19.187Z","httpOnly":true,"path":"/"},"authId":1}	2025-03-31 19:18:16.106+00
olscGX2q5-f0cCr2pHvZ-Meo6TvUl0rf	{"cookie":{"originalMaxAge":86400000,"expires":"2025-03-31T20:48:19.763Z","httpOnly":true,"path":"/"},"authId":1}	2025-03-31 22:43:09.711+00
ho8_GJ7_EGjZL7RSEdTf-yc1XOOvVMan	{"cookie":{"originalMaxAge":86400000,"expires":"2025-03-31T14:05:44.048Z","httpOnly":true,"path":"/"},"authId":1}	2025-04-01 00:48:18.154+00
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
150	2025-03-30 16:46:08.619275	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	140	e135f3c0-e534-4029-a8e3-94459a02e3b8	5	5	0
151	2025-03-30 16:47:34.630519	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	141	33b458c7-a115-4c81-9722-55bbbc8e7bed	5	5	0
152	2025-03-30 16:50:31.097852	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	142	2e9ce748-909e-4235-88e0-d71dc8edd2d2	5	5	0
153	2025-03-30 16:53:09.445924	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	143	ca4d27b6-3aac-43fd-a58c-20be73eaab22	5	5	0
134	2025-03-29 16:30:11.688731	\N	5	1	Luana	456	55555	email	f	\N	f	\N	124	3ac7b51a-7cf4-4dcb-8676-78753fe27ad6	120.00	114	6
154	2025-03-30 16:54:46.116004	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	144	ab0501c8-43d5-4d2f-98d1-ef6aeb413117	5	5	0
155	2025-03-30 16:57:00.001449	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	145	d733f2f9-7fb4-46a0-875f-a7c0d2e5137b	5	5	0
133	2025-03-29 16:30:11.675802	\N	5	1	Ewerton Luiz Oliveira	123	123.123.123-04	email	t	2025-03-29 13:46:28	f	\N	124	980b7733-02d4-4b2e-ac56-3ca3d4a55327	120.00	114	6
135	2025-03-30 14:57:30.956571	\N	4	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	125	392fa919-3a93-494f-81da-16bc1e58395c	50.00	50.00	0
136	2025-03-30 14:57:30.971077	\N	4	1	\N	\N	\N	\N	f	\N	f	\N	125	756353bd-0633-4b95-ab45-09f272713342	50.00	50.00	0
137	2025-03-30 14:59:41.272407	\N	4	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	126	c8f2db01-df30-415c-82dd-3f80f9565c6c	50.00	47.5	2.5
138	2025-03-30 15:01:14.378579	\N	4	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	127	5ccc4fbe-6bc7-4270-a96a-83bf7c395066	50.00	47.5	2.5
139	2025-03-30 15:07:39.741623	\N	4	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	129	e0cfc587-5abc-4a33-b569-643f0800455c	50.00	50.00	0
140	2025-03-30 15:15:00.020496	\N	4	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	130	130be902-7e63-41dc-92d0-790c614582be	50.00	50.00	0
141	2025-03-30 15:18:24.985407	\N	2	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	131	5699f185-0823-4da8-b44c-cdbea06c631a	300.00	270	30
142	2025-03-30 15:44:28.634694	\N	1	1	\N	\N	\N	\N	f	\N	f	\N	132	8c79b671-2503-49c9-af30-e6ad26af758d	\N	\N	\N
143	2025-03-30 15:51:53.501231	\N	1	1	\N	\N	\N	\N	f	\N	f	\N	133	90c6d0d1-e3be-416e-8f88-9ce452720480	\N	\N	\N
144	2025-03-30 15:54:13.579999	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	134	76e1d749-7a9c-40aa-a249-c9eb2225fd93	\N	\N	\N
156	2025-03-30 16:58:26.971599	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	146	ed01000e-a690-4e4b-9a7e-f8b8cc60d1d9	5	5	0
157	2025-03-30 18:42:06.638732	\N	4	1	\N	\N	\N	\N	f	\N	f	\N	147	cb85c480-5520-49e4-a460-e42cf801c030	50.00	50.00	0
158	2025-03-30 18:42:19.990208	\N	4	1	\N	\N	\N	\N	f	\N	f	\N	148	007e10af-fdfd-4073-93ee-3684b5e01323	50.00	50.00	0
159	2025-03-30 18:48:07.590091	\N	4	1	\N	\N	\N	\N	f	\N	f	\N	149	91a0a835-0129-4ba6-8e3b-9953eb2a75d0	50.00	50.00	0
160	2025-03-30 18:49:20.015655	\N	1	1	\N	\N	\N	\N	f	\N	f	\N	150	eee50889-1fcb-4508-a881-a732f497ee50	5	5	0
161	2025-03-30 18:59:46.612722	\N	1	1	Ewerton Luiz Oliveira	11987654321	026.796.019-04	ewerton.cco@gmail.com	f	\N	f	\N	151	3e443672-50d3-43bb-ade6-84a9cd8d1725	5	5	0
\.


--
-- Name: carrinho_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.carrinho_id_seq', 151, true);


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

SELECT pg_catalog.setval('public.eventos_id_seq', 7, true);


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
-- Name: meus_indicados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: amazon
--

SELECT pg_catalog.setval('public.meus_indicados_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.vendas_id_seq', 161, true);


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
-- Name: meus_indicados meus_indicados_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.meus_indicados
    ADD CONSTRAINT meus_indicados_pkey PRIMARY KEY (id);


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
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (sid);


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
-- Name: sessions_expired_index; Type: INDEX; Schema: public; Owner: amazon
--

CREATE INDEX sessions_expired_index ON public.sessions USING btree (expired);


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
-- Name: meus_indicados fk_meus_indicados_organizador; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.meus_indicados
    ADD CONSTRAINT fk_meus_indicados_organizador FOREIGN KEY (organizador_id) REFERENCES public.organizador(id) ON DELETE CASCADE;


--
-- Name: meus_indicados fk_meus_indicados_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: amazon
--

ALTER TABLE ONLY public.meus_indicados
    ADD CONSTRAINT fk_meus_indicados_usuarios FOREIGN KEY (meu_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


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

