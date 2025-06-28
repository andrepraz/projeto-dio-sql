INSERT INTO clientes (nome, sobrenome, cpf, conta, endereco) VALUES
	('João', 'Silva', '12345678901', NULL, 'Rua A, 123'),
	('Maria', 'Oliveira', '23456789012', 'PF', 'Rua B, 456'),
	('Carlos', 'Santos', '34567890123', 'PJ', 'Rua C, 789'),
	('Ana', 'Costa', '45678901234', 'PJ', 'Rua D, 101'),
	('Lucas', 'Almeida', '56789012345', NULL, 'Rua E, 202');

INSERT INTO produtos (nome_produto, categoria, avaliacao, tamanho) VALUES
	('Smartphone', 'Eletrônico', 4.5, 'M'),
	('Chocolate', 'Alimentos', 5.0, NULL),
	('Bicicleta', 'Brinquedo', 4.0, 'G'),
	('Televisão', 'Eletrônico', 4.8, 'G'),
	('Biscoitos', 'Alimentos', 4.2, NULL);

INSERT INTO pagamentos (metodo) VALUES
	('Cartão'),
	('Dinheiro');

INSERT INTO pedidos (status_pedido, descricao, frete, id_cliente, id_pagamento) VALUES
	('Em andamento', 'Pedido de smartphone', 5.0, 1, 1),
	('Entregue', 'Pedido de chocolate', 5.0, 2, 2),
	('Atrasado', 'Pedido de bicicleta', 5.0, 3, 1),
	('Cancelado', 'Pedido de televisão', 5.0, 4, 2),
	('Em andamento', 'Pedido de biscoitos', 5.0, 5, 1),
	('Entregue', 'Pedido de smartphone', 5.0, 1, 2),
	('Atrasado', 'Pedido de televisão', 5.0, 2, 1),
	('Cancelado', 'Pedido de bicicleta', 5.0, 3, 2),
	('Em andamento', 'Pedido de chocolate', 5.0, 4, 1),
	('Entregue', 'Pedido de biscoitos', 5.0, 5, 2);

INSERT INTO estoques (localidade, quantidade) VALUES
	('Armazém Central', 100),
	('Filial A', 50),
	('Filial B', 75),
	('Filial C', 30),
	('Filial D', 20);

INSERT INTO vendedores (razao_social, localidade) VALUES
	('Vendedor A', 'São Paulo'),
	('Vendedor B', 'Rio de Janeiro');

INSERT INTO fornecedores (razao_social, localidade, cnpj, contato) VALUES
	('Fornecedor A', 'Belo Horizonte', '12345678000195', '31987654321'),
	('Fornecedor B', 'Curitiba', '98765432000100', '41987654321');
    
INSERT INTO produtos_estoques VALUES
	(1, 1, 10),
	(2, 1, 5),
    (3, 1, 10),
	(2, 2, 5);
    
INSERT INTO produtos_pedidos VALUES
	(1, 1, 10),
	(2, 2, 5),
    (3, 3, 10),
    (4, 4, 10),
	(5, 5, 5),
    (1, 6, 10),
	(2, 7, 5),
    (3, 8, 10),
    (4, 9, 10),
	(5, 10, 5);
    
INSERT INTO produtos_fornecedores VALUES
	(1, 1, 10),
	(2, 2, 5),
    (3, 1, 10),
	(4, 2, 5),
    (5, 1, 10);
    
INSERT INTO produtos_vendedores VALUES
	(1, 1, 10),
	(2, 2, 5),
    (3, 1, 10),
	(4, 2, 5),
    (5, 1, 10);