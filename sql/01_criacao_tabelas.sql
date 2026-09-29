-- Banco Aurora
-- Criação das tabelas do banco de dados

-- Tabela de clientes
CREATE TABLE clientes (
cpf VARCHAR(11) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
cidade VARCHAR(100)
);

-- Tabela de contas
CREATE TABLE contas (
numero_conta INTEGER PRIMARY KEY,
cpf_cliente VARCHAR(11) NOT NULL,
tipo_conta VARCHAR(20) NOT NULL,
saldo DECIMAL(12,2) DEFAULT 0.00,

```
CONSTRAINT fk_cliente
    FOREIGN KEY (cpf_cliente)
    REFERENCES clientes(cpf)
```

);

-- Tabela de transações
CREATE TABLE transacoes (
id_transacao SERIAL PRIMARY KEY,
numero_conta INTEGER NOT NULL,
tipo_transacao VARCHAR(20) NOT NULL,
valor DECIMAL(12,2) NOT NULL,
data_transacao DATE NOT NULL,

```
CONSTRAINT fk_conta
    FOREIGN KEY (numero_conta)
    REFERENCES contas(numero_conta)
```

);

