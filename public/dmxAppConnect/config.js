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
        "type": "boolean",
        "name": "cupom"
      },
      {
        "type": "number",
        "name": "desconto"
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
      },
      {
        "type": "boolean",
        "name": "tem_cupom"
      },
      {
        "type": "text",
        "name": "codigo_cupom"
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
      "meta": null,
      "outputType": "object"
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
  },
  "evento": {
    "inp_cupom": {
      "meta": null,
      "outputType": "text"
    },
    "inp_desconto2": {
      "meta": null,
      "outputType": "text"
    },
    "inputData1": {
      "meta": null,
      "outputType": "boolean"
    },
    "itens_venda": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "number",
          "name": "evento_id"
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
          "name": "is_mesa"
        },
        {
          "type": "number",
          "name": "qtide_mesa"
        },
        {
          "type": "number",
          "name": "tipo_item"
        },
        {
          "type": "boolean",
          "name": "quase_acabando"
        },
        {
          "type": "number",
          "name": "contagem_regressiva"
        }
      ],
      "outputType": "array"
    },
    "flow1": {
      "meta": {},
      "local": [
        {
          "name": "",
          "type": "boolean",
          "metaData": {
            "condition": {}
          }
        }
      ]
    },
    "query": [
      {
        "type": "text",
        "name": "evento"
      }
    ]
  },
  "evento_adm": {
    "lista_ingressos": {
      "meta": null,
      "outputType": "object"
    },
    "inpt_evento_id": {
      "meta": null,
      "outputType": "number"
    },
    "data_item": {
      "meta": null,
      "outputType": "object"
    },
    "edit_id": {
      "meta": null,
      "outputType": "text"
    }
  },
  "admin": {
    "sessionStorage": [
      {
        "type": "text",
        "name": "item_id"
      }
    ]
  },
  "estorno": {
    "lista-estorno": {
      "meta": [
        {
          "type": "number",
          "name": "organizador_id"
        },
        {
          "type": "text",
          "name": "evento_titulo"
        },
        {
          "type": "text",
          "name": "evento_data_hora"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_uuid"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "carrinho_criado_em"
        },
        {
          "type": "text",
          "name": "status_pagamento"
        },
        {
          "type": "text",
          "name": "forma_pagamento"
        },
        {
          "type": "number",
          "name": "transacao_id"
        },
        {
          "type": "text",
          "name": "categoria"
        },
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
          "type": "text",
          "name": "hora_check_in"
        },
        {
          "type": "number",
          "name": "valor_final"
        },
        {
          "type": "text",
          "name": "qrcode"
        },
        {
          "type": "boolean",
          "name": "trocou_nome"
        },
        {
          "type": "text",
          "name": "evento_item_nome"
        }
      ],
      "outputType": "array"
    }
  },
  "vendas": {
    "lista_transacoes": {
      "meta": [
        {
          "type": "number",
          "name": "organizador_id"
        },
        {
          "type": "text",
          "name": "evento_titulo"
        },
        {
          "type": "text",
          "name": "evento_data_hora"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_uuid"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "carrinho_criado_em"
        },
        {
          "type": "text",
          "name": "status_pagamento"
        },
        {
          "type": "text",
          "name": "forma_pagamento"
        },
        {
          "type": "number",
          "name": "transacao_id"
        },
        {
          "type": "text",
          "name": "categoria"
        },
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
          "type": "text",
          "name": "hora_check_in"
        },
        {
          "type": "number",
          "name": "valor_final"
        },
        {
          "type": "text",
          "name": "qrcode"
        },
        {
          "type": "boolean",
          "name": "trocou_nome"
        },
        {
          "type": "text",
          "name": "evento_item_nome"
        },
        {
          "type": "text",
          "name": "resposta_pagamento"
        },
        {
          "type": "number",
          "name": "total_bruto"
        },
        {
          "type": "number",
          "name": "total_taxas_transacao"
        },
        {
          "type": "number",
          "name": "liquido"
        },
        {
          "type": "boolean",
          "name": "cupom"
        },
        {
          "type": "number",
          "name": "qtide_parcelas"
        }
      ],
      "outputType": "array"
    },
    "filtro": [
      {
        "type": "text",
        "name": "aprovado"
      },
      {
        "type": "array",
        "name": "devolvidos"
      },
      {
        "type": "text",
        "name": "recusados"
      }
    ]
  },
  "usuarios": {
    "lista_usuarios": {
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
          "type": "text",
          "name": "senha"
        },
        {
          "type": "text",
          "name": "usuario_email"
        },
        {
          "type": "text",
          "name": "usuario_nome"
        },
        {
          "type": "text",
          "name": "usuario_apelido"
        },
        {
          "type": "text",
          "name": "usuario_telefone"
        },
        {
          "type": "text",
          "name": "usuario_cpf"
        },
        {
          "type": "boolean",
          "name": "ativo"
        },
        {
          "type": "text",
          "name": "end_rua"
        },
        {
          "type": "text",
          "name": "end_numero"
        },
        {
          "type": "text",
          "name": "end_bairro"
        },
        {
          "type": "text",
          "name": "end_cidade"
        },
        {
          "type": "text",
          "name": "end_estado"
        },
        {
          "type": "text",
          "name": "end_cep"
        },
        {
          "type": "boolean",
          "name": "notificacoes_email"
        },
        {
          "type": "boolean",
          "name": "notificacoes_push"
        },
        {
          "type": "boolean",
          "name": "notificacoes_whats"
        },
        {
          "type": "text",
          "name": "fcm_token"
        },
        {
          "type": "text",
          "name": "foto"
        },
        {
          "type": "date",
          "name": "data_nascimento"
        },
        {
          "type": "number",
          "name": "permissao"
        },
        {
          "type": "number",
          "name": "genero_id"
        },
        {
          "type": "boolean",
          "name": "senha_atualizada"
        },
        {
          "type": "text",
          "name": "uuid"
        }
      ],
      "outputType": "array"
    }
  },
  "cortesias": {
    "lista_cortesias": {
      "meta": [
        {
          "name": "$index",
          "type": "number"
        },
        {
          "name": "$key",
          "type": "text"
        },
        {
          "name": "$value",
          "type": "object"
        },
        {
          "type": "number",
          "name": "organizador_id"
        },
        {
          "type": "text",
          "name": "evento_titulo"
        },
        {
          "type": "text",
          "name": "evento_data_hora"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_uuid"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "carrinho_criado_em"
        },
        {
          "type": "number",
          "name": "status_pagamento_id"
        },
        {
          "type": "text",
          "name": "status_pagamento"
        },
        {
          "type": "text",
          "name": "forma_pagamento"
        },
        {
          "type": "number",
          "name": "transacao_id"
        },
        {
          "type": "text",
          "name": "categoria"
        },
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
          "type": "text",
          "name": "hora_check_in"
        },
        {
          "type": "number",
          "name": "valor_final"
        },
        {
          "type": "text",
          "name": "qrcode"
        },
        {
          "type": "boolean",
          "name": "trocou_nome"
        },
        {
          "type": "text",
          "name": "evento_item_nome"
        },
        {
          "type": "text",
          "name": "resposta_pagamento"
        },
        {
          "type": "number",
          "name": "total_bruto"
        },
        {
          "type": "number",
          "name": "total_taxas_transacao"
        },
        {
          "type": "number",
          "name": "liquido"
        },
        {
          "type": "boolean",
          "name": "cupom"
        },
        {
          "type": "number",
          "name": "qtide_parcelas"
        }
      ],
      "outputType": "array"
    }
  },
  "notificacoes": {
    "lista_notificacoes": {
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
          "type": "text",
          "name": "titulo"
        },
        {
          "type": "text",
          "name": "conteudo"
        },
        {
          "type": "text",
          "name": "imagem"
        },
        {
          "type": "number",
          "name": "criado_por"
        },
        {
          "type": "boolean",
          "name": "interna"
        },
        {
          "type": "boolean",
          "name": "push"
        },
        {
          "type": "boolean",
          "name": "especifico"
        },
        {
          "type": "number",
          "name": "destinatario_id"
        }
      ],
      "outputType": "array"
    },
    "input_email": {
      "meta": null,
      "outputType": "text"
    }
  }
});
