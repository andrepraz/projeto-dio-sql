--  crie queries SQL com as cláusulas abaixo:
-- Quais são os clientes e seus respectivos pedidos?
SELECT concat(c.nome, ' ', c.sobrenome) as nome, p.id_pedido, p.status_pedido
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente;

-- Quais produtos foram vendidos em cada pedido?
SELECT p.nome_produto, pd.id_pedido, pd.quantidade
FROM produtos p
JOIN produtos_pedidos pd ON p.id_produto = pd.id_produto;

-- Quais são os produtos disponíveis em cada estoque?
SELECT p.nome_produto, e.localidade, pe.quantidade
FROM produtos p
JOIN produtos_estoques pe ON p.id_produto = pe.id_produto
JOIN estoques e ON pe.id_estoque = e.id_estoque;

-- Quais vendedores estão associados a quais produtos?
SELECT v.razao_social, p.nome_produto, pv.quantidade
FROM vendedores v
JOIN produtos_vendedores pv ON v.id_vendedor = pv.id_vendedor
JOIN produtos p ON pv.id_produto = p.id_produto;

-- Quais fornecedores fornecem quais produtos?
SELECT f.razao_social, p.nome_produto, pf.quantidade
FROM fornecedores f
JOIN produtos_fornecedores pf ON f.id_fornecedor = pf.id_fornecedor
JOIN produtos p ON pf.id_produto = p.id_produto;

-- Qual é a avaliação média dos produtos vendidos?
SELECT AVG(avaliacao) AS avaliacao_media
FROM produtos;

-- Quais são os produtos de um cliente específico?

SELECT pr.nome_produto, pd.quantidade
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
JOIN produtos_pedidos pd ON p.id_pedido = pd.id_pedido
JOIN produtos pr ON pr.id_produto = pd.id_produto
WHERE c.id_cliente = 1;  -- Substitua pelo ID desejado

-- Quais pedidos foram feitos com pagamento em dinheiro?
SELECT p.id_pedido, c.nome, c.sobrenome
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN pagamentos pg ON p.id_pagamento = pg.id_pagamento
WHERE pg.metodo = 'Dinheiro';

-- Quais produtos estão com baixa quantidade em estoque?
SELECT p.nome_produto, e.localidade, pe.quantidade
FROM produtos p
JOIN produtos_estoques pe ON p.id_produto = pe.id_produto
JOIN estoques e ON pe.id_estoque = e.id_estoque
WHERE pe.quantidade < 10;  -- Ajuste o valor conforme necessário

-- Quais clientes têm pedidos cancelados?
SELECT c.nome, c.sobrenome, p.id_pedido
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
WHERE p.status_pedido = 'Cancelado';

-- Algumas das perguntas que podes fazer para embasar as queries SQL:
-- Quantos pedidos foram feitos por cada cliente?
SELECT c.nome, c.sobrenome, COUNT(p.id_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;

-- Algum vendedor também é fornecedor?
SELECT v.razao_social, f.razao_social
FROM vendedores v
JOIN fornecedores f ON v.razao_social = f.razao_social;

-- Relação de produtos, fornecedores e estoques
SELECT p.nome_produto, f.razao_social AS fornecedor, e.localidade, pe.quantidade AS quantidade_estoque
FROM produtos p
JOIN produtos_fornecedores pf ON p.id_produto = pf.id_produto
JOIN fornecedores f ON pf.id_fornecedor = f.id_fornecedor
JOIN produtos_estoques pe ON p.id_produto = pe.id_produto
JOIN estoques e ON pe.id_estoque = e.id_estoque;

-- Relação de nomes dos fornecedores e nomes dos produtos
SELECT f.razao_social AS fornecedor, p.nome_produto
FROM fornecedores f
JOIN produtos_fornecedores pf ON f.id_fornecedor = pf.id_fornecedor
JOIN produtos p ON pf.id_produto = p.id_produto;