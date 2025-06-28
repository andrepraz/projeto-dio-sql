-- criar banco de dados para o cenário e-commerce
create database ecommerce;
use ecommerce;
create table if not exists clientes (
	id_cliente int not null primary key auto_increment,
	nome varchar(50),
	sobrenome varchar(50),
	cpf char(11),
	conta enum('PJ', 'PF') default 'PF',
	endereco varchar(100),
	constraint cpf_unique unique(cpf)
);

create table if not exists produtos (
	id_produto int not null primary key auto_increment,
	nome_produto varchar(100) not null,
	categoria enum('Eletrônico', 'Alimentos', 'Brinquedo') not null,
	avaliacao float default 0.0,
	tamanho varchar(10),
	constraint nome_produto_unique unique (nome_produto)
);

-- definir modo pagamento, cartao, dinheiro
create table if not exists pagamentos (
	id_pagamento int not null primary key auto_increment,
    metodo enum("Cartão", "Dinheiro") not null
);

create table if not exists pedidos (
	id_pedido int not null primary key auto_increment,
    status_pedido enum('Em andamento','Entregue','Atrasado','Cancelado') default 'Em andamento',
    descricao varchar (255),
    frete float not null default 5.0,
    id_cliente int not null,
    id_pagamento int not null,
    constraint fk_pedidos_clientes foreign key (id_cliente) references clientes (id_cliente),
    constraint fk_pedidos_pagamento foreign key (id_pagamento) references pagamentos (id_pagamento)
);

create table if not exists estoques (
	id_estoque int not null primary key auto_increment,
    localidade varchar (255),
    quantidade int not null default 0
);

create table if not exists vendedores (
	id_vendedor int not null primary key auto_increment,
    razao_social varchar(100) not null unique,
    localidade varchar (255)
);

create table if not exists fornecedores (
	id_fornecedor int not null primary key auto_increment,
    razao_social varchar(100) not null unique,
    localidade varchar (255),
    cnpj varchar(14) unique,
    contato char(11) not null
);

create table if not exists produtos_pedidos (
	id_produto int not null,
    id_pedido int not null,
    quantidade int not null,
    constraint pk_produto_pedido primary key (id_produto, id_pedido),
    constraint fk_produtos_p foreign key (id_produto) references produtos (id_produto),
    constraint fk_pedidos foreign key (id_pedido) references pedidos (id_pedido)
);

create table if not exists produtos_estoques (
	id_produto int not null,
    id_estoque int not null,
    quantidade int not null,
    constraint pk_produto_estoque primary key (id_produto, id_estoque),
    constraint fk_produtos_e foreign key (id_produto) references produtos (id_produto),
    constraint fk_estoques foreign key (id_estoque) references estoques (id_estoque)
);

create table if not exists produtos_vendedores (
	id_produto int not null,
    id_vendedor int not null,
    quantidade int not null,
    constraint pk_produto_vendedor primary key (id_produto, id_vendedor),
    constraint fk_produtos_v foreign key (id_produto) references produtos (id_produto),
    constraint fk_vendedores foreign key (id_vendedor) references vendedores (id_vendedor)
);

create table if not exists produtos_fornecedores (
	id_produto int not null,
    id_fornecedor int not null,
    quantidade int not null,
    constraint pk_produto_fornecedor primary key (id_produto, id_fornecedor),
    constraint fk_produtos_f foreign key (id_produto) references produtos (id_produto),
    constraint fk_fornecedores foreign key (id_fornecedor) references fornecedores (id_fornecedor)
);

