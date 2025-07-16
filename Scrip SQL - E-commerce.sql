-- criação do banco de dados para o cenário de e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criando tabela pessoa
-- person é uma generalização, que guarda as informações que esperaríamos encontrar sobre qualquer pessoa
-- também possuí o atributo 'typePerson' que específica o tipo de pessoa 
-- uma person só pode ser ou pessoa física ou pessoa jurídica
create table person(
	idPerson int auto_increment primary key,
    firstName varchar(10) not null,
    middleInitial char(3),
    lastName varchar(20) not null,
    address varchar(90) not null,
    personType enum('Física','Jurídica') not null
);

-- criar tabela pessoa jurídica
-- legal_person é uma especialização de person, que guarda as informações que esperamos encontrar sobre uma pessoa jurídica
-- ele se relaciona diretamente com person, ao utilizar o 'idPerson' como sua própria chave primária
create table legal_person(
	idPerson int primary key,
    cnpj varchar(14) not null,
    constraint fk_information_legal_person foreign key (idPerson) references person(idPerson) ON DELETE CASCADE,
    constraint unique_cnpj_legal_person unique (cnpj)
);

-- criar tabela pessoa física
-- natural_person é uma especialização de person, que guarda as informações que esperamos encontrar sobre uma pessoa física
-- ele se relaciona diretamente com person, ao utilizar o 'idPerson' como sua própria chave primária
create table natural_person(
	idPerson int primary key,
    cpf varchar(11) not null,
    constraint fk_information_natural_person foreign key (idPerson) references person(idPerson) ON DELETE CASCADE,
    constraint unique_cpf_natural_person unique (cpf)
);


-- criar tabela cliente
-- está diretamente relacionado com person, pois para um cliente existir, 
-- ele precisa ser uma pessoa, seja ela jurídica ou física
create table clients(
	idClient int auto_increment primary key,
    idPerson int not null,
    constraint fk_client_person foreign key (idPerson) references person(idPerson) ON DELETE CASCADE,
    CONSTRAINT unique_client_person UNIQUE(idPerson)
);

-- criar tabela produto
-- size = dimensão do produto
create table product(
	idProduct int auto_increment primary key,
    nameProduct varchar(45) not null,
    categoryProduct enum('Eletrônicos','Roupas','Brinquedos','Alimentos','Calçados','Móveis') not null,
    descriptionProduct varchar (255),
    productValue decimal(10,2) not null,
    avaliation decimal(2,1) default 0,
    size varchar(10) 
);

-- criar tabela pedido
-- para um pedido existir é preciso que haja um cliente	por trás do pedido
create table orders(
	idOrder int auto_increment primary key,
	idOrderClient int not null,
    orderStatus enum('Cancelado','Confirmado','Em andamento') default 'Em andamento',
    dateOrder date,
    descriptionOrder varchar(255),
    sendValue decimal(10,2) default 10,
    constraint order_client foreign key(idOrderClient) references clients(idClient)
);

-- criar tabela entrega
-- delivery é uma tabela que para existir, é necessário que haja um pedido
-- não foi possível por meio do sql, mas a ideia é que ao criar um pedido, automaticamente seja gerada uma entrega
create table delivery(
	idDelivery int auto_increment primary key,
    idOrder int not null unique,
    deliveryStatus enum('Em andamento','Entregue') default 'Em andamento',
    currentDeliveryLocation varchar(90) not null,
    trackingCodeDelivery varchar(13) not null,
    finalDestination varchar (255)not null, 
    constraint fk_order_delivery foreign key(idOrder) references orders(idOrder) ON DELETE CASCADE
);

-- criar tabela de relação produto pedido
-- product_order representa a relação entre produto e pedido, onde um tipo de produto pode estar em 1 
-- ou mais pedidos, e o pedido pode ter 1 ou mais produtos, em diversas quantidades
create table product_order(
	idProduct int not null,
    idOrder int not null,
    quantityProductOrder int default 0,
    primary key (idProduct, idOrder),
    constraint fk_product foreign key(idProduct) references product(idProduct),
	constraint fk_order foreign key(idOrder) references orders(idOrder)
);


-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    nameSupplier varchar(100) not null,
    supplierCompanyName varchar(60) not null,
    cnpj varchar(14) not null,
    contact char (11) not null,
    constraint unique_supplier unique(cnpj)
);

-- criar tabela de relação produto fornecedor
-- product_order representa a relação entre produto e fornecedor, onde um tipo de produto pode ter 1 
-- ou mais fornecedores, e o fornecedor pode fornecer 1 ou mais produtos
create table product_supplier(
	idProduct int not null,
    idSupplier int not null,
    primary key(idProduct, idSupplier),
	constraint fk_product_product_supplier FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    constraint fk_supplier_product_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier)
);

-- criar tabela terceiro vendedor
-- third_seller está diretamente relacionada a person, pois para um vendedor existir 
-- é preciso que ele seja uma pessoa, seja ela jurídica ou física
create table third_seller(
	idThirdSeller int auto_increment primary key,
	idPerson int not null,
    shopName varchar(90),
    contact char(11),
    constraint fk_person_third_seller FOREIGN KEY (idPerson) REFERENCES person(idPerson) ON DELETE CASCADE,
    CONSTRAINT unique_seller_person UNIQUE(idPerson)
);

-- criar tabela de relação produto vendedor
-- product_seller representa a relação entre produto e vendedor, onde um tipo de produto pode ser vendido por 1 
-- ou mais vendedores, e o vendedor pode vender 1 ou mais produtos, em diversas quantidades
create table product_seller(
	idThirdSeller int not null,
    idProduct int not null,
    quantityProductSeller int default 0,
    primary key(idThirdSeller, idProduct),
    constraint fk_product_product_seller foreign key(idProduct) references product(idProduct),
	constraint fk_seller_product_seller foreign key(idThirdSeller) references third_seller(idThirdSeller)

);

-- criar tabela estoque
create table stock(
	idStock int auto_increment primary key,
    addressStock varchar(90) not null    
);

-- criar tabela de relação produto estoque
-- product_stock representa a relação entre produto e estoque, onde um tipo de produto pode estar armazenado em 1 
-- ou mais estoques, e o estoque pode guardar 1 ou mais produtos, em diversas quantidades
create table product_stock(
	idProduct int not null,
    idStock int not null,
    quantityProductStock int default 0,
    primary key(idProduct, idStock),
    constraint fk_product_product_stock FOREIGN KEY (idProduct) REFERENCES product(idProduct),
	constraint fk_stock_product_stock FOREIGN KEY (idStock) REFERENCES stock(idStock)
);

-- criar tabela pagamento
-- para um pagamento ser realizado é preciso que haja um cliente e um tipo de pagamento
create table payment(
	idPayment int auto_increment primary key,
    valuePayment decimal(10,2) not null,
    dueDatePayment date,
    idClient int not null,
    typePayment enum('Boleto','Cartão') not null,
    constraint fk_payment_client foreign key (idClient) references clients(idClient)
);

-- criar tabela boleto
-- bank_slip é uma especialização de pagamento, sendo um typePayment
create table bank_slip(
	idPayment int primary key,
    barcode varchar(47) not null,
    constraint fk_bank_slip_payment foreign key (idPayment) references payment(idPayment) ON DELETE CASCADE
);

-- criar tabela informação_cartão
-- é uma tabela que guarda as informações de um cartão, pra existir é preciso estar relacionada a um cliente
create table card_info(
	idCardInfo int auto_increment primary key,
    idClient int not null,
    accountNumber VARCHAR(19) NOT NULL,
    accountAgency VARCHAR(6) NOT NULL,
    CONSTRAINT fk_cardinfo_client FOREIGN KEY (idClient) REFERENCES clients(idClient),
    CONSTRAINT unique_card_per_client UNIQUE (idClient, accountNumber)
);

-- criar tabela tipo_cartão
-- guarda informação do tipo de cartão, podendo ser débito ou crédito
create table card_type (
    idCardType INT AUTO_INCREMENT PRIMARY KEY,
    type ENUM('Crédito', 'Débito') NOT NULL
);

-- criar tabela cartão
-- card é uma especialização de pagamento, sendo um typePayment
-- pra existir precisa da informação do cartão e do tipo do cartão
create table card(
    idPayment int primary key,	
    idCardInfo int not null,
    idCardType int not null,
    CONSTRAINT fk_card_payment FOREIGN KEY (idPayment) REFERENCES payment(idPayment) ON DELETE CASCADE,
    CONSTRAINT fk_card_card_info FOREIGN KEY (idCardInfo) REFERENCES card_info(idCardInfo),
    CONSTRAINT fk_card_cardtype FOREIGN KEY (idCardType) REFERENCES card_type(idCardType)
);

show tables;