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
    }
  }
});
