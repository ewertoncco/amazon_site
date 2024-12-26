dmx.config({
  "adm_evento": {
    "query": [
      {
        "type": "text",
        "name": "id_evento"
      }
    ],
    "repeat1": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "produto_nome"
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
          "name": "ordem_lista"
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
          "type": "boolean",
          "name": "cortesia"
        },
        {
          "type": "boolean",
          "name": "cupom_ativo"
        },
        {
          "type": "text",
          "name": "codigo_cupom"
        },
        {
          "type": "number",
          "name": "valor_desconto"
        }
      ],
      "outputType": "array"
    },
    "data_detail_produto": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "produto_nome"
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
          "name": "ordem_lista"
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
          "type": "boolean",
          "name": "cortesia"
        },
        {
          "type": "boolean",
          "name": "cupom_ativo"
        },
        {
          "type": "text",
          "name": "codigo_cupom"
        },
        {
          "type": "number",
          "name": "valor_desconto"
        }
      ],
      "outputType": "array"
    },
    "data_detail_evento": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        },
        {
          "name": "produtos",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "evento_id"
            },
            {
              "type": "text",
              "name": "produto_nome"
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
              "name": "ordem_lista"
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
              "type": "boolean",
              "name": "cortesia"
            },
            {
              "type": "boolean",
              "name": "cupom_ativo"
            },
            {
              "type": "text",
              "name": "codigo_cupom"
            },
            {
              "type": "number",
              "name": "valor_desconto"
            }
          ]
        },
        {
          "name": "despesas",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "tipo_despesa"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "text",
              "name": "descricao"
            },
            {
              "type": "number",
              "name": "codigo_evento"
            },
            {
              "type": "number",
              "name": "valor"
            },
            {
              "type": "boolean",
              "name": "paga"
            },
            {
              "type": "datetime",
              "name": "data_pagamento"
            }
          ]
        },
        {
          "name": "checklist",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "datetime",
              "name": "data_prazo_conclusao"
            },
            {
              "type": "boolean",
              "name": "finalizada"
            },
            {
              "type": "number",
              "name": "finalizada_por"
            },
            {
              "type": "datetime",
              "name": "data_finalizacao"
            },
            {
              "type": "number",
              "name": "evento_id"
            }
          ]
        }
      ],
      "outputType": "object"
    },
    "input_evento_id": {
      "meta": null,
      "outputType": "number"
    }
  },
  "eventos": {
    "eventos": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        }
      ],
      "outputType": "array"
    },
    "listar_eventos": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        }
      ],
      "outputType": "array"
    },
    "repeat1": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        }
      ],
      "outputType": "array"
    }
  },
  "teste": {
    "formRepeat1": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
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
          "type": "number",
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
          "type": "datetime",
          "name": "data_nascimento"
        },
        {
          "type": "number",
          "name": "permissao"
        }
      ],
      "outputType": "array"
    }
  },
  "comeco": {
    "lista_eventos": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        },
        {
          "name": "produtos",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "evento_id"
            },
            {
              "type": "text",
              "name": "produto_nome"
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
              "name": "ordem_lista"
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
              "type": "boolean",
              "name": "cortesia"
            },
            {
              "type": "boolean",
              "name": "cupom_ativo"
            },
            {
              "type": "text",
              "name": "codigo_cupom"
            },
            {
              "type": "number",
              "name": "valor_desconto"
            }
          ]
        },
        {
          "name": "despesas",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "tipo_despesa"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "text",
              "name": "descricao"
            },
            {
              "type": "number",
              "name": "codigo_evento"
            },
            {
              "type": "number",
              "name": "valor"
            },
            {
              "type": "boolean",
              "name": "paga"
            },
            {
              "type": "datetime",
              "name": "data_pagamento"
            }
          ]
        },
        {
          "name": "checklist",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "datetime",
              "name": "data_prazo_conclusao"
            },
            {
              "type": "boolean",
              "name": "finalizada"
            },
            {
              "type": "number",
              "name": "finalizada_por"
            },
            {
              "type": "datetime",
              "name": "data_finalizacao"
            },
            {
              "type": "number",
              "name": "evento_id"
            }
          ]
        }
      ],
      "outputType": "array"
    },
    "repeat1": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_status"
        },
        {
          "type": "text",
          "name": "evento_nome"
        },
        {
          "type": "text",
          "name": "evento_resumo"
        },
        {
          "type": "text",
          "name": "evento_descricao"
        },
        {
          "type": "text",
          "name": "evento_local"
        },
        {
          "type": "text",
          "name": "evento_banner_principal"
        },
        {
          "type": "text",
          "name": "evento_banner_secundario"
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
          "type": "datetime",
          "name": "evento_data_hora"
        },
        {
          "type": "boolean",
          "name": "evento_destaque"
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
          "name": "qtide_parcelas_cartao"
        },
        {
          "type": "boolean",
          "name": "mostrar_sobre_evento"
        },
        {
          "type": "text",
          "name": "slug_evento"
        },
        {
          "type": "boolean",
          "name": "mostrar_whatsapp"
        },
        {
          "type": "text",
          "name": "numero_whatsapp"
        },
        {
          "type": "boolean",
          "name": "bar_online"
        },
        {
          "name": "produtos",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "evento_id"
            },
            {
              "type": "text",
              "name": "produto_nome"
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
              "name": "ordem_lista"
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
              "type": "boolean",
              "name": "cortesia"
            },
            {
              "type": "boolean",
              "name": "cupom_ativo"
            },
            {
              "type": "text",
              "name": "codigo_cupom"
            },
            {
              "type": "number",
              "name": "valor_desconto"
            }
          ]
        },
        {
          "name": "despesas",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "number",
              "name": "tipo_despesa"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "text",
              "name": "descricao"
            },
            {
              "type": "number",
              "name": "codigo_evento"
            },
            {
              "type": "number",
              "name": "valor"
            },
            {
              "type": "boolean",
              "name": "paga"
            },
            {
              "type": "datetime",
              "name": "data_pagamento"
            }
          ]
        },
        {
          "name": "checklist",
          "type": "array",
          "sub": [
            {
              "type": "number",
              "name": "id"
            },
            {
              "type": "datetime",
              "name": "data_criacao"
            },
            {
              "type": "number",
              "name": "usuario_id"
            },
            {
              "type": "text",
              "name": "titulo"
            },
            {
              "type": "datetime",
              "name": "data_prazo_conclusao"
            },
            {
              "type": "boolean",
              "name": "finalizada"
            },
            {
              "type": "number",
              "name": "finalizada_por"
            },
            {
              "type": "datetime",
              "name": "data_finalizacao"
            },
            {
              "type": "number",
              "name": "evento_id"
            }
          ]
        }
      ],
      "outputType": "array"
    },
    "informacoes": {
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
  "index": {
    "repeat1": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
        {
          "type": "datetime",
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "usuario_id"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "text",
          "name": "produto_nome"
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
          "name": "ordem_lista"
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
          "type": "boolean",
          "name": "cortesia"
        },
        {
          "type": "boolean",
          "name": "cupom_ativo"
        },
        {
          "type": "text",
          "name": "codigo_cupom"
        },
        {
          "type": "number",
          "name": "valor_desconto"
        }
      ],
      "outputType": "array"
    },
    "query": [
      {
        "type": "text",
        "name": "id_evento"
      }
    ],
    "datastore_carrinho": [
      {
        "type": "text",
        "name": "item_id"
      },
      {
        "type": "text",
        "name": "participante_nome"
      },
      {
        "type": "text",
        "name": "participante_cpf"
      },
      {
        "type": "text",
        "name": "participante_telefone"
      },
      {
        "type": "text",
        "name": "participante_email"
      },
      {
        "type": "number",
        "name": "item_valor"
      },
      {
        "type": "text",
        "name": "item_nome"
      }
    ],
    "carrinho": {
      "meta": [
        {
          "name": "$id",
          "type": "number"
        },
        {
          "type": "text",
          "name": "item_id"
        },
        {
          "type": "text",
          "name": "participante_nome"
        },
        {
          "type": "text",
          "name": "participante_cpf"
        },
        {
          "type": "text",
          "name": "participante_telefone"
        },
        {
          "type": "text",
          "name": "participante_email"
        },
        {
          "type": "number",
          "name": "item_valor"
        },
        {
          "type": "text",
          "name": "item_nome"
        }
      ],
      "outputType": "array"
    },
    "arrsubtotal": {
      "meta": null,
      "outputType": "object"
    },
    "arrprodutos_id": {
      "meta": null,
      "outputType": "object"
    },
    "arrcarrinho": {
      "meta": [
        {
          "type": "text",
          "name": "nome"
        },
        {
          "type": "number",
          "name": "qtide"
        },
        {
          "type": "number",
          "name": "valor"
        }
      ],
      "outputType": "key_array"
    },
    "arrprodutoid": {
      "meta": null,
      "outputType": "object"
    },
    "localStorage": [
      {
        "type": "object",
        "name": "carrinho",
        "sub": [
          {
            "type": "key_array",
            "name": "itens",
            "sub": [
              {
                "type": "text",
                "name": "nome"
              },
              {
                "type": "number",
                "name": "qtide"
              },
              {
                "type": "number",
                "name": "valor"
              }
            ]
          }
        ]
      },
      {
        "type": "object",
        "name": "subtotal"
      },
      {
        "type": "object",
        "name": "produtoid"
      }
    ]
  },
  "cadastro": {
    "cep": {
      "meta": [
        {
          "sub": [
            {
              "type": "object",
              "name": "data",
              "sub": [
                {
                  "type": "text",
                  "name": "cep"
                },
                {
                  "type": "text",
                  "name": "logradouro"
                },
                {
                  "type": "text",
                  "name": "complemento"
                },
                {
                  "type": "text",
                  "name": "unidade"
                },
                {
                  "type": "text",
                  "name": "bairro"
                },
                {
                  "type": "text",
                  "name": "localidade"
                },
                {
                  "type": "text",
                  "name": "uf"
                },
                {
                  "type": "text",
                  "name": "estado"
                },
                {
                  "type": "text",
                  "name": "regiao"
                },
                {
                  "type": "text",
                  "name": "ibge"
                },
                {
                  "type": "text",
                  "name": "gia"
                },
                {
                  "type": "text",
                  "name": "ddd"
                },
                {
                  "type": "text",
                  "name": "siafi"
                }
              ]
            },
            {
              "type": "object",
              "name": "headers",
              "sub": [
                {
                  "type": "text",
                  "name": "access-control-allow-credentials"
                },
                {
                  "type": "text",
                  "name": "access-control-allow-headers"
                },
                {
                  "type": "text",
                  "name": "access-control-allow-methods"
                },
                {
                  "type": "text",
                  "name": "access-control-allow-origin"
                },
                {
                  "type": "text",
                  "name": "access-control-max-age"
                },
                {
                  "type": "text",
                  "name": "cache-control"
                },
                {
                  "type": "text",
                  "name": "connection"
                },
                {
                  "type": "text",
                  "name": "content-type"
                },
                {
                  "type": "text",
                  "name": "date"
                },
                {
                  "type": "text",
                  "name": "expires"
                },
                {
                  "type": "text",
                  "name": "pragma"
                },
                {
                  "type": "text",
                  "name": "server"
                },
                {
                  "type": "text",
                  "name": "transfer-encoding"
                }
              ]
            }
          ],
          "name": "via_cep",
          "type": "object"
        }
      ],
      "local": [
        {
          "name": "via_cep",
          "type": "object",
          "metaData": {
            "apiUrl": {
              "meta": null,
              "outputType": "text"
            }
          }
        }
      ]
    }
  },
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
      }
    ],
    "itens_carrinho": {
      "meta": [
        {
          "name": "$id",
          "type": "number"
        },
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
          "name": "participante_nome"
        },
        {
          "type": "text",
          "name": "participante_email"
        },
        {
          "type": "text",
          "name": "participante_cpf"
        },
        {
          "type": "text",
          "name": "participante_telefone"
        }
      ],
      "outputType": "array"
    },
    "info": {
      "meta": [
        {
          "type": "number",
          "name": "id"
        },
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
        },
        {
          "type": "number",
          "name": "usuario_id"
        }
      ],
      "outputType": "object"
    }
  }
});
