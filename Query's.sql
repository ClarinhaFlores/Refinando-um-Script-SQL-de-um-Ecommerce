use ecommerce;
-- mostra o nome da companhia dos fornecedores cadatrados e seu telefone de contato
select supplierCompanyName as nome_companhia, contact as contato from supplier;

-- mostra 'nome' produto, 'valor' produto, 'avaliação' produto e categoria 'categoria'
select nameProduct as nome_produto, productValue as valor_produto, 
avaliation as avaliação_produto, categoryProduct as categoria 
from product ;

-- soma a quantidade de clientes
select count(*) as Quant_Cliente from clients;

-- soma a quantidade de vendedores
select count(*) as Quant_Vendedores from third_seller;

-- mostra o 'nome' do vendedor, seu 'id' eo produto que ele está vendendo
select p.firstName as nome_vendedor, ts.idThirdSeller as id_vendedor, prod.nameProduct as nome_produto 
from product_seller ps
inner join third_seller ts on ps.idThirdSeller = ts.idThirdSeller
inner join person p on ts.idPerson = p.idPerson
inner join product prod on ps.idProduct = prod.idProduct;

-- mostra o 'nome do cliente', o 'id' da ordem e o 'status' da ordem
select concat(firstName,' ', lastName) as Client, idOrder, orderStatus 
from orders o 
join clients c on c.idClient = idOrderClient
join person p on c.idPerson = p.idPerson;

-- quantas ordens foram realizados por cliente
select c.idClient, firstName, count(*) as Number_of_orders from orders o
inner join clients c on c.idClient = idOrderClient
join person p on c.idPerson = p.idPerson
group by idClient;

-- mostra o número de produtos diferentes comprados pelo cliente
select c.idClient, firstName, count(*) as Produtos_Diferentes_por_Order from orders o
inner join clients c on c.idClient = idOrderClient
join person p on c.idPerson = p.idPerson
inner join product_order prod on prod.idOrder = o.idOrder
group by idClient;

-- mostra a quantidade de produtos diferentes por categorias (não relacionado com a quantidade de cada produto)
select categoryProduct as categoria, count(distinct nameProduct) as quantidade_produtos
from product group by categoryProduct;

select * from orders;
-- mostra quais produtos são da categoria 'Alimentos'
select nameProduct as Nome_Produto from product where categoryProduct = 'Alimentos';

-- mostra o nome das pessoas e seu tipo de pessoa
select concat(firstName, ' ', lastName) as nome_pessoa, personType as tipo_pessoa
from person;

-- mostra o nome dos clientes e seu tipo de pessoa
select concat(p.firstName, ' ', p.lastName) as nome_pessoa, p.personType as tipo_pessoa
from clients c join person p ON c.idPerson = p.idPerson;

-- mostra o nome dos vendedores e seu tipo de pessoa
select concat(p.firstName, ' ', p.lastName) as nome_pessoa, p.personType as tipo_pessoa
from third_seller ts join person p ON ts.idPerson = p.idPerson;

