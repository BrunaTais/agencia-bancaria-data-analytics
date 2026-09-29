-- Banco Aurora
-- Consultas para análise de dados bancários

-- 1. Clientes que possuem mais de uma conta
SELECT
c.nome,
c.cpf,
COUNT(ct.numero_conta) AS quantidade_contas
FROM clientes c
JOIN contas ct
ON c.cpf = ct.cpf_cliente
GROUP BY c.nome, c.cpf
HAVING COUNT(ct.numero_conta) > 1;

-- 2. Contas com saldo superior a R$ 1.000
-- Ordenadas do maior para o menor saldo
SELECT
numero_conta,
tipo_conta,
saldo
FROM contas
WHERE saldo > 1000
ORDER BY saldo DESC;

-- 3. Clientes, suas contas e respectivos saldos
SELECT
c.nome,
ct.numero_conta,
ct.saldo
FROM clientes c
JOIN contas ct
ON c.cpf = ct.cpf_cliente;

