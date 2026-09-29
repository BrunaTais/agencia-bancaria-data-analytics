-- Banco Aurora
-- Inserção dos dados fictícios para análise

-- Clientes
INSERT INTO clientes (cpf, nome, cidade)
VALUES
('12345678900', 'Ana Souza', 'Curitiba'),
('98765432100', 'Carlos Oliveira', 'Bituruna'),
('45678912300', 'Mariana Santos', 'Guarapuava'),
('32165498700', 'João Almeida', 'Pato Branco'),
('78912345600', 'Fernanda Costa', 'Curitiba');

-- Contas
INSERT INTO contas (numero_conta, cpf_cliente, tipo_conta, saldo)
VALUES
(1001, '12345678900', 'Corrente', 1500.00),
(1002, '12345678900', 'Poupança', 5000.00),
(1003, '98765432100', 'Corrente', 850.00),
(1004, '45678912300', 'Corrente', 12500.00),
(1005, '32165498700', 'Corrente', 3200.00),
(1006, '78912345600', 'Poupança', 7800.00);

-- Transações
INSERT INTO transacoes
(numero_conta, tipo_transacao, valor, data_transacao)
VALUES
(1001, 'PIX',      500.00,  '2026-09-01'),
(1001, 'DEPOSITO', 1000.00, '2026-09-03'),
(1001, 'SAQUE',    200.00,  '2026-09-05'),
(1001, 'PIX',      350.00,  '2026-09-10'),

(1002, 'DEPOSITO', 2000.00, '2026-09-02'),
(1002, 'PIX',      800.00,   '2026-09-04'),
(1002, 'PIX',      450.00,   '2026-09-08'),

(1003, 'PIX',      150.00,  '2026-09-03'),
(1003, 'SAQUE',    100.00,  '2026-09-06'),

(1004, 'DEPOSITO', 5000.00, '2026-09-01'),
(1004, 'PIX',      1200.00, '2026-09-05'),
(1004, 'PIX',      900.00,  '2026-09-12'),

(1005, 'PIX',      300.00,  '2026-09-07'),
(1005, 'SAQUE',    250.00,  '2026-09-09'),

(1006, 'DEPOSITO', 1500.00, '2026-09-02');

