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
      }
    ],
    "sessionStorage": [
      {
        "type": "number",
        "name": "valor_total"
      },
      {
        "type": "number",
        "name": "parcelas"
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
          "name": "data_criacao"
        },
        {
          "type": "number",
          "name": "evento_id"
        },
        {
          "type": "number",
          "name": "valor_final"
        },
        {
          "type": "text",
          "name": "nome_participante"
        },
        {
          "type": "text",
          "name": "cpf_participante"
        },
        {
          "type": "text",
          "name": "email_participante"
        },
        {
          "type": "text",
          "name": "telefone_participante"
        },
        {
          "type": "datetime",
          "name": "data_resgate"
        },
        {
          "type": "text",
          "name": "qrcode"
        }
      ],
      "outputType": "array"
    }
  }
});
