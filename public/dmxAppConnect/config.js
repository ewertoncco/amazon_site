dmx.config({
  "homepage": {
    "datastore_carrinho": [
      {
        "type": "number",
        "name": "item_valor"
      },
      {
        "type": "text",
        "name": "item_nome"
      },
      {
        "type": "text",
        "name": "item_id"
      },
      {
        "type": "text",
        "name": "nome"
      },
      {
        "type": "text",
        "name": "email"
      },
      {
        "type": "text",
        "name": "telefone"
      },
      {
        "type": "text",
        "name": "cpf"
      },
      {
        "type": "boolean",
        "name": "mesa"
      },
      {
        "type": "text",
        "name": "cupom"
      }
    ],
    "sessionStorage": [
      {
        "type": "text",
        "name": "evento"
      },
      {
        "type": "boolean",
        "name": "pagamento"
      },
      {
        "type": "number",
        "name": "status_pagamento"
      },
      {
        "type": "text",
        "name": "venda"
      },
      {
        "type": "text",
        "name": "transacao_id"
      },
      {
        "type": "text",
        "name": "mensagem"
      }
    ]
  },
  "index": {
    "itens_venda": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "text",
          "name": "nome"
        },
        {
          "type": "number",
          "name": "qtide_cadastrada"
        },
        {
          "type": "datetime",
          "name": "inicio_vendas"
        },
        {
          "type": "datetime",
          "name": "final_vendas"
        },
        {
          "type": "number",
          "name": "valor"
        },
        {
          "type": "number",
          "name": "ordem"
        },
        {
          "type": "boolean",
          "name": "ativo"
        },
        {
          "type": "boolean",
          "name": "is_mesa"
        },
        {
          "type": "number",
          "name": "qtide_mesa"
        },
        {
          "type": "number",
          "name": "tipo_item"
        }
      ],
      "outputType": "array"
    },
    "pageflow_cupom": {
      "meta": {},
      "local": [
        {
          "name": "sc_cupom",
          "type": "object",
          "metaData": {
            "_get_inp_fld_1codigo_cupom": {
              "meta": null,
              "outputType": "text"
            }
          }
        },
        {
          "type": "text",
          "metaData": {}
        }
      ]
    },
    "sessionStorage": [
      {
        "type": "number",
        "name": "valor_total"
      }
    ],
    "input_qtide_parcelas": {
      "meta": null,
      "outputType": "number"
    },
    "eventos_destaque": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "number",
          "name": "status_id"
        },
        {
          "type": "text",
          "name": "titulo"
        },
        {
          "type": "text",
          "name": "sub_titulo"
        },
        {
          "type": "boolean",
          "name": "mostrar_descricao"
        },
        {
          "type": "text",
          "name": "descricao"
        },
        {
          "type": "datetime",
          "name": "data_hora"
        },
        {
          "type": "text",
          "name": "local"
        },
        {
          "type": "text",
          "name": "banner"
        },
        {
          "type": "boolean",
          "name": "tem_mapa"
        },
        {
          "type": "text",
          "name": "mapa_imagem"
        },
        {
          "type": "boolean",
          "name": "destaque"
        },
        {
          "type": "boolean",
          "name": "aceita_pix"
        },
        {
          "type": "boolean",
          "name": "aceita_cartao"
        },
        {
          "type": "text",
          "name": "slug"
        },
        {
          "type": "boolean",
          "name": "divulgacao"
        },
        {
          "type": "number",
          "name": "segundos_destaque"
        }
      ],
      "outputType": "array"
    },
    "todos_eventos": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "number",
          "name": "status_id"
        },
        {
          "type": "text",
          "name": "titulo"
        },
        {
          "type": "text",
          "name": "sub_titulo"
        },
        {
          "type": "boolean",
          "name": "mostrar_descricao"
        },
        {
          "type": "text",
          "name": "descricao"
        },
        {
          "type": "datetime",
          "name": "data_hora"
        },
        {
          "type": "text",
          "name": "local"
        },
        {
          "type": "text",
          "name": "banner"
        },
        {
          "type": "boolean",
          "name": "tem_mapa"
        },
        {
          "type": "text",
          "name": "mapa_imagem"
        },
        {
          "type": "boolean",
          "name": "destaque"
        },
        {
          "type": "boolean",
          "name": "aceita_pix"
        },
        {
          "type": "boolean",
          "name": "aceita_cartao"
        },
        {
          "type": "text",
          "name": "slug"
        },
        {
          "type": "boolean",
          "name": "divulgacao"
        },
        {
          "type": "number",
          "name": "segundos_destaque"
        }
      ],
      "outputType": "array"
    }
  },
  "home": {
    "ultimas_vendas": {
      "meta": [
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "text",
          "name": "nome_participante"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "produto_nome"
        },
        {
          "type": "number",
          "name": "forma_pagamento_id"
        }
      ],
      "outputType": "array"
    }
  },
  "comeco": {
    "repeat1": {
      "meta": [
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "text",
          "name": "titulo"
        },
        {
          "type": "text",
          "name": "conteudo"
        },
        {
          "type": "text",
          "name": "imagem_url"
        }
      ],
      "outputType": "array"
    }
  },
  "compras": {
    "compras": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "criado_em"
        },
        {
          "type": "number",
          "name": "transacao_id"
        },
        {
          "type": "number",
          "name": "valor_final"
        },
        {
          "name": "vendas",
          "type": "array",
          "sub": [
            {
              "type": "text",
              "name": "participante_nome"
            },
            {
              "type": "text",
              "name": "participante_telefone"
            },
            {
              "type": "text",
              "name": "participante_cpf"
            },
            {
              "type": "text",
              "name": "participante_email"
            },
            {
              "type": "boolean",
              "name": "check_in"
            },
            {
              "type": "datetime",
              "name": "hora_check_in"
            },
            {
              "type": "text",
              "name": "qrcode"
            }
          ]
        }
      ],
      "outputType": "array"
    },
    "itens_carrinho": {
      "meta": [
        {
          "type": "text",
          "name": "participante_nome"
        },
        {
          "type": "text",
          "name": "participante_telefone"
        },
        {
          "type": "text",
          "name": "participante_cpf"
        },
        {
          "type": "text",
          "name": "participante_email"
        },
        {
          "type": "boolean",
          "name": "check_in"
        },
        {
          "type": "datetime",
          "name": "hora_check_in"
        },
        {
          "type": "text",
          "name": "qrcode"
        }
      ],
      "outputType": "array"
    }
  },
  "adm_eventos": {
    "lista_eventos": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "number",
          "name": "organizador_id"
        },
        {
          "type": "datetime",
          "name": "criado_em"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "status_id"
        },
        {
          "type": "text",
          "name": "titulo"
        },
        {
          "type": "text",
          "name": "sub_titulo"
        },
        {
          "type": "boolean",
          "name": "mostrar_descricao"
        },
        {
          "type": "text",
          "name": "descricao"
        },
        {
          "type": "datetime",
          "name": "data_hora"
        },
        {
          "type": "text",
          "name": "local"
        },
        {
          "type": "text",
          "name": "banner"
        },
        {
          "type": "boolean",
          "name": "tem_mapa"
        },
        {
          "type": "text",
          "name": "mapa_imagem"
        },
        {
          "type": "boolean",
          "name": "destaque"
        },
        {
          "type": "boolean",
          "name": "pode_alterar_ingresso"
        },
        {
          "type": "boolean",
          "name": "pode_devolver_ingresso"
        },
        {
          "type": "boolean",
          "name": "aceita_pix"
        },
        {
          "type": "boolean",
          "name": "aceita_cartao"
        },
        {
          "type": "number",
          "name": "parcelas_cartao"
        },
        {
          "type": "text",
          "name": "slug"
        },
        {
          "type": "boolean",
          "name": "tem_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "tem_cupom"
        },
        {
          "type": "text",
          "name": "codigo_cupom"
        },
        {
          "type": "number",
          "name": "valor_cupom"
        },
        {
          "type": "text",
          "name": "uuid"
        },
        {
          "type": "boolean",
          "name": "divulgacao"
        },
        {
          "type": "number",
          "name": "segundos_destaque"
        },
        {
          "type": "number",
          "name": "quantidade_vendas"
        },
        {
          "type": "number",
          "name": "total_vendas"
        }
      ],
      "outputType": "array"
    }
  }
});
