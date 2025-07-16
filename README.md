# Desafio_SQL_E-commerce

O seguinte modelo lógico de banco de dados, encontrado no arquivo "Script SQL - E-commerce.sql", demonstra um squema de uma loja e-commerce. 
Nesse modelo temos como base as entidades: "Product(produto)", "Supplier (fornecedor)", "Stock (estoque)", "Thrid_Seller (terceiro-vendedor)", "Orders (pedidos)" e "Clients (clientes)".
As relações base são: 
- "product" pode ter 1 ou mais fornecedores, e o "supplier" pode fornecer 1 ou mais produtos, gerando a tabela-relação "product_supplier (fornecedor_produto)"; 
- "product" pode ter 1 ou mais terceiro-vendedores, e o "third_seller" pode vender 1 ou mais produtos, gerando a tabela-relação "product-seller (vendedor_produto)";
- "product" pode ser guardado em 1 ou mais estoques, e o "stock" pode guardar 1 ou mais produtos, gerando a tabela "product_stock (estoque_produto)";
- "product" pode estar em 1 ou mais pedidos, e o "order" pode ter 1 ou mais produtos, gerando a tabela "product_order (produto_pedido)";
- "pedido" pode ter apenas 1 cliente, porém o "cliente" pode ter 1 ou mais pedidos;

Para o desafio, foi proposta a implementação de:
Cliente PJ e PF – Uma conta pode ser PJ ou PF, mas não pode ter as duas informações;
Pagamento – Pode ter cadastrado mais de uma forma de pagamento;
Entrega – Possui status e código de rastreio;

Para resolver foram adicionadas as seguintes entidades: "Person (pessoa)", "Natural_Person (pessoa física)", "Legal_Person (pessoa_jurídica)", "Payment (pagamento)", "Card (cartao)", "Card_Type (tipo_cartão)", "Card_Info (Info_Cartão)", "Bank_Slip (boleto)" e "Delivery (entrega)"

Resultando nas seguintes relações:
- "person" é uma generalização com informações base para "legal_person" e "natural_person", que para existirem precisam de uma "person";
- "client" pode ser, ou, uma "legal_person" ou uma "natural_person", nunca os dois, portanto para isso ocorrer, um "client" precisa ser uma "person", que terá seu id associado a apenas um dos dois;
- "payment" é uma generalização para "bank_slip" e "card";
- "payment" possuí a variável 'typePayment (tipoPagamento)' que permite ao cliente escolher pagar, por boleta ou com cartão;
- "bank_slip" é uma especialização de 'payment', sendo um 'typePayment';
- "card" é uma especialização de 'payment', sendo um 'typePayment', para ele existir é preciso o "card_info" e o "card_type";
- "card_info" é uma tabela que guarda as informações de um cartão, pra ela existir, é preciso estar relacionada a um cliente 
- "card_type" é uma tabela que guarda informações do tipo de cartão, podendo ser 'débito' ou 'crédito'
- "orders" só pode ter 1 entrega, já um "delivery" só pode entregar 1 pedido;

Para testar o banco de dados foram geradas informações a partir da inteligência artificial 'ChatGPT', os comandos de INSERT se encontra no arquivo "Insert's.sql".
Utilizando dos dados insertado, foram realizadas algumas quary's, que se encontram no arquivo "Query's.sql". Através das quary's foi possível responder algumas perguntas.
- Quais são as empresas que atuam como fornecedores, e qual seu número de contato?
- Quais são os produtos, seu valor, sua avaliação e sua categoria?
- Quantos clientes estão cadastrados?
- Quantos vendedores estão cadastrados?
- Quais produtos os vendedores estão vendendo?
- Quais clientes possuem um pedido, e qual o status desse pedido?
- Quantos pedidos foram realizados por cliente?
- Quantos produtos diferentes foram comprados por cliente? (sem relação com a quantidade de cada produto)
- Quantos produtos doferentes existem por categoria?
- Quais são os produtos da categoria 'Aliemntos'?
- Quais os nomes das pessoas cadastradas, e qual seu tipo de pessoa?
- Quais os nomes dos clientes, e qual seu tipo de pessoa?
- Quais os nomes dos vendedores, e qul seu tipo de pessoa?