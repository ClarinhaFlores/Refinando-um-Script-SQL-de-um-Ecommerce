INSERT INTO person (idPerson, firstName, middleInitial, lastName, address, personType) VALUES
(1, 'Milena', 'G', 'da Paz', 'Favela de Ribeiro, 24\nSanta Cruz\n21275-119 Viana Grande / RO', 'Física'),
(2, 'Luiza', 'Y', 'Viana', 'Vale Daniel Sales, 104\nMinas Brasil\n19808-803 Ribeiro / MA', 'Física'),
(3, 'Augusto', 'S', 'Cardoso', 'Estação das Neves, 540\nConcórdia\n95445-148 Pereira da Praia / AP', 'Física'),
(4, 'Rocha', '', '- ME', 'Largo Sophie Souza\nSanta Helena\n51437756 da Rosa / MT', 'Jurídica'),
(5, 'Barros', '', 'S.A.', 'Pátio Cardoso, 772\nBernadete\n19677-520 Caldeira de Nunes / TO', 'Jurídica'),
(6,'Ana', 'S', 'Monteiro', 'Av. Cunha, 1900\nRio de Janeiro\n12460000 Basilia / RJ','Jurídica'),
(10, 'João', 'A', 'Silva', 'Rua das Flores, 123', 'Física'),
(11, 'Maria', 'B', 'Souza', 'Av. Central, 456', 'Física'),
(12, 'Carlos', 'C', 'Pereira', 'Travessa dos Lírios, 789', 'Jurídica');
select * from person;

INSERT INTO natural_person (idPerson, cpf) VALUES
(1, '92685073159'),
(2, '43671528044'),
(3, '39708426113'),
(10, '15694787321'),
(11, '26499310224');
select * from natural_person;
update natural_person set idPerson = 11 where cpf = '26499310224';


INSERT INTO legal_person (idPerson, cnpj) VALUES
(4, '63921540000128'),
(5, '76458210000190'),
(6, '16478932014569'),
(12, '12135456489879');
select * from legal_person;

INSERT INTO clients (idClient, idPerson) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 6),
(5, 10),
(6, 11),
(7, 12);
select * from clients;

INSERT INTO product (nameProduct, categoryProduct, descriptionProduct, productValue, avaliation, size) VALUES
('Smartphone Galaxy S21', 'Eletrônicos', 'Smartphone com tela de 6.2", 128 GB de armazenamento, câmera tripla 64 MP.',  3499.90, 4.5, 'Único'),
('Camiseta Básica Algodão', 'Roupas', 'Camiseta masculina 100% algodão, gola careca, disponível em várias cores.',  49.90, 4.1, 'M'),
('Carrinho de Bebê Passeio', 'Brinquedos', 'Carrinho leve para passeio, com capota retrátil e cinto de segurança 5 pontos.',  599.00, 4.7, 'Único'),
('Arroz Tipo 1 5 kg', 'Alimentos', 'Pacote de arroz branco tipo 1, embalagem econômica de 5 kg.',  24.90, 4.3, ''),
('Tênis Esportivo Masculino', 'Calçados', 'Tênis de corrida com amortecimento em gel e solado antiderrapante.',  199.90, 4.0, '42'),
('Sofá de 3 Lugares', 'Móveis', 'Sofá estofado em tecido suede, cor cinza, com pés de madeira maciça.',  1299.00, 4.2, '200×85×90'),
('Mesa de Escritório', 'Móveis', 'Mesa em MDF amadeirado, com tampo de 120×60 cm e suporte metálico.',  449.50, 3.9, '120×60'),
('Vestido Feminino Floral', 'Roupas', 'Vestido midi estampado, tecido leve, alças finas e forro interno.',  129.90, 4.4, 'P'),
('Conjunto de Panelas 5 peças', 'Alimentos', 'Conjunto de panelas antiaderentes com tampas de vidro, cabos ergonômicos.',  259.90, 4.8, '');
select * from product;

INSERT INTO orders (idOrder, idOrderClient, orderStatus, dateOrder, descriptionOrder, sendValue) VALUES
(1, 1, 'Cancelado', '2025-07-01', 'Pedido 1 - Cancelado devido a problema no pagamento.', 21.38),
(2, 2, 'Em andamento', '2025-07-06', 'Pedido 2 - Em processamento para envio.', 12.75),
(3, 3, 'Cancelado', '2025-06-24', 'Pedido 3 - Cancelado por falta de estoque.', 27.89),
(4, 4, 'Confirmado', '2025-05-03', 'Pedido 4 - Enviado e entregue com sucesso', 15.00),
(11, 5, 'Confirmado', '2025-07-01', 'Pedido de teste 1', 15.00),
(12, 5, 'Cancelado',  '2025-07-05', 'Pedido de teste 2', 10.00),
(13, 5, 'Em andamento','2025-07-10', 'Pedido de teste 3', 20.00),
(14, 6, 'Confirmado', '2025-07-02', 'Pedido de teste 4', 12.00),
(15, 6, 'Confirmado', '2025-07-08', 'Pedido de teste 5', 12.00),
(16, 7, 'Cancelado',  '2025-07-03', 'Pedido de teste 6', 8.00);
SELECT * FROM orders;

select * from delivery;

insert into delivery(idDelivery, idOrder, deliveryStatus, currentDeliveryLocation, trackingCodeDelivery, finalDestination) values
	(1, 1, null, 'Armazem', 'a15s6s236dew8', 'Favela de Ribeiro, 24\nSanta Cruz\n21275-119 Viana Grande / RO'),
    (2, 2, null, 'Armazem', '1a54s648897wa', 'Vale Daniel Sales, 104\nMinas Brasil\n19808-803 Ribeiro / MA'),
    (3, 3, null, 'Armazem', '15648asasd1w9', 'Estação das Neves, 540\nConcórdia\n95445-148 Pereira da Praia / AP'),
    (4, 4, 'Entregue', 'Client House', '0s1a6e8f1v14g', 'Av. Cunha, 1900\nRio de Janeiro\n12460000 Basilia / RJ'),
    (5, 11, null, 'Armazem222', '11s4da4w1a3s1', 'Rua das Flores, 123'),
    (6, 12, null, 'Armazem', '22s4da4w6a3s1', 'Rua das Flores, 123'),
    (7, 13, null, 'Armazem', '93s4ap4w1a3sk', 'Rua das Flores, 123'),
    (8, 14, null, 'Armazem', '165ase1ds13as', 'Av. Central, 456' ),
    (9, 15, 'Entregue', 'Client House', '762afp1d4l3a7', 'Av. Central, 456' ),
    (10, 16, null, 'Armazem', '16aefd2f9r4ew', 'Travessa dos Lírios, 789')
 ;

INSERT INTO product_order (idProduct, idOrder, quantityProductOrder) VALUES
(1, 1, 4),
(4, 1, 5),
(5, 2, 4),
(4, 2, 5),
(3, 2, 2),
(5, 3, 5),
(1, 3, 1),
(3, 4, 1),
(5, 4, 1),
(1, 11, 1),
(2, 11, 2),
(3, 12, 1),
(1, 13, 1),
(3, 13, 1),
(2, 14, 3),
(3, 15, 2),
(1, 15, 1),
(2, 16, 1);

select * from product_order;

INSERT INTO supplier (idSupplier, nameSupplier, supplierCompanyName, cnpj, contact) VALUES
(1, 'Isis Correia', 'Cardoso', '92431560000119', '55849200911'),
(2, 'Isabel Oliveira', 'Mendes S/A', '57294368000127', '55119105660'),
(3, 'Dra. Lorena da Mota', 'da Mota S.A.', '96540718000140', '55619447623');
select * from supplier;

INSERT INTO product_supplier (idProduct, idSupplier) VALUES
(4, 1),
(5, 1),
(5, 2),
(1, 2),
(3, 3),
(4, 3),
(5, 3);
select * from product_supplier;

INSERT INTO third_seller (idThirdSeller, idPerson, shopName, contact) VALUES
(1, 4, 'Dias Silveira S.A.', '55319209295'),
(2, 5, 'Peixoto', '55819473562');

INSERT INTO product_seller (idThirdSeller, idProduct, quantityProductSeller) VALUES
(1, 4, 7),
(1, 3, 10),
(1, 5, 4),
(2, 4, 10),
(2, 2, 6),
(2, 3, 9);
select * from product_seller;

INSERT INTO stock (idStock, addressStock) VALUES
(1, 'Avenida de Fogaça, 750, Cruzeiro, 15129615 da Mata do Campo / RO'),
(2, 'Trecho de Pereira, 897, Bonsucesso, 93338-255 Nogueira / RS');
select * from stock;

INSERT INTO product_stock (idProduct, idStock, quantityProductStock) VALUES
(3, 1, 12),
(4, 1, 13),
(2, 1, 14),
(4, 2, 10),
(2, 2, 17),
(5, 2, 11);
select * from product_stock;

INSERT INTO payment (idPayment, valuePayment, dueDatePayment, idClient, typePayment) VALUES
(1, 14590.38, '2025-07-24', 1, 'Boleto'),
(2, 4729.45, '2025-07-20', 2, 'Cartão'),
(3, 5027.59, '2025-07-17', 3, 'Boleto'),
(4, 813.90, '2025-06-03', 4,'Boleto');
select * from payment;

INSERT INTO bank_slip (idPayment, barcode) VALUES
(1, '10862397449960191149502727487060572676673467428'),
(3, '44298451217992321490756123451583110929350687368'),
(4, '12646232365789859562321324489897893213216565898');
select * from bank_slip;

INSERT INTO card_type (idCardType, type) VALUES
(1, 'Crédito'),
(2, 'Débito');
select * from card_type;

INSERT INTO card_info (idCardInfo, idClient, accountNumber, accountAgency) VALUES
(1, 1, '4111111111111111', '1234'),  -- Cartão do cliente 1
(2, 2, '5500000000000004', '5678');  -- Cartão do cliente 2
select * from card_info;

INSERT INTO card (idPayment, idCardInfo, idCardType) VALUES
(2, 2, 1);  -- Pagamento 2 foi feito com o cartão 2 (crédito)
select * from card;

