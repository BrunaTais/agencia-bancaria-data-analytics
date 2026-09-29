# Miniguia — SQL e Análise de Dados Bancários

Este miniguia reúne os principais comandos SQL utilizados no projeto **Banco Aurora**, com foco em consultas, filtros, relacionamentos entre tabelas e análise de dados bancários.

---

## 1. SELECT

Utilizado para definir **quais informações serão exibidas** no resultado da consulta.

```sql
SELECT nome, cidade
FROM clientes;
```

Também é possível utilizar `*` para selecionar todas as colunas:

```sql
SELECT *
FROM clientes;
```

**Ideia principal:**
`SELECT` responde à pergunta: **"O que eu quero visualizar?"**

---

## 2. FROM

Define **de qual tabela os dados serão consultados**.

```sql
SELECT nome, cidade
FROM clientes;
```

Nesse exemplo:

* `SELECT` → informações que quero visualizar;
* `FROM` → tabela de onde essas informações vêm.

**Ideia principal:**
`FROM` responde à pergunta: **"De onde vêm os dados?"**

---

## 3. WHERE

Utilizado para **filtrar registros** de acordo com uma condição.

```sql
SELECT *
FROM contas
WHERE saldo > 1000;
```

Exemplo com texto:

```sql
SELECT *
FROM clientes
WHERE cidade = 'Curitiba';
```

**Ideia principal:**
`WHERE` responde à pergunta: **"Quais registros atendem à condição?"**

> Importante: `WHERE` filtra **linhas/registros antes do agrupamento**.

---

## 4. JOIN

Utilizado para **relacionar informações de duas ou mais tabelas**.

Exemplo: relacionar clientes e suas contas.

```sql
SELECT
    c.nome,
    ct.numero_conta,
    ct.saldo
FROM clientes c
JOIN contas ct
    ON c.cpf = ct.cpf_cliente;
```

Nesse exemplo:

* `c` é um apelido (`alias`) para `clientes`;
* `ct` é um apelido para `contas`;
* `ON` define **como as tabelas estão relacionadas**.

A relação ocorre por:

```text
clientes.cpf
     ↓
contas.cpf_cliente
```

**Ideia principal:**
`JOIN` responde à pergunta: **"Como juntar informações que estão em tabelas diferentes?"**

---

## 5. GROUP BY

Utilizado para **agrupar registros que possuem uma característica em comum**, geralmente junto com funções de agregação.

Exemplo: contar quantas contas cada cliente possui.

```sql
SELECT
    c.nome,
    COUNT(ct.numero_conta) AS quantidade_contas
FROM clientes c
JOIN contas ct
    ON c.cpf = ct.cpf_cliente
GROUP BY c.nome;
```

**Ideia principal:**
`GROUP BY` responde à pergunta: **"Por qual informação quero agrupar os dados?"**

Exemplos:

* agrupar por cliente;
* agrupar por cidade;
* agrupar por tipo de conta;
* agrupar por tipo de transação.

---

## 6. Funções de agregação

As funções de agregação permitem **calcular indicadores a partir de vários registros**.

### COUNT

Conta registros.

```sql
SELECT COUNT(*) AS total_clientes
FROM clientes;
```

### SUM

Calcula a soma dos valores.

```sql
SELECT SUM(saldo) AS saldo_total
FROM contas;
```

### AVG

Calcula a média.

```sql
SELECT AVG(saldo) AS saldo_medio
FROM contas;
```

### MAX

Retorna o maior valor.

```sql
SELECT MAX(saldo) AS maior_saldo
FROM contas;
```

### MIN

Retorna o menor valor.

```sql
SELECT MIN(saldo) AS menor_saldo
FROM contas;
```

**Ideia principal:**
As funções de agregação ajudam a transformar dados em **indicadores**.

---

## 7. HAVING

Utilizado para **filtrar resultados depois que os dados foram agrupados**.

Exemplo: encontrar clientes que possuem mais de uma conta.

```sql
SELECT
    c.nome,
    COUNT(ct.numero_conta) AS quantidade_contas
FROM clientes c
JOIN contas ct
    ON c.cpf = ct.cpf_cliente
GROUP BY c.nome
HAVING COUNT(ct.numero_conta) > 1;
```

### WHERE × HAVING

Essa é uma diferença importante:

```text
WHERE
↓
filtra registros/linhas

GROUP BY
↓
agrupa os registros

HAVING
↓
filtra os grupos
```

**Regra prática:**

* `WHERE` → filtro antes do agrupamento;
* `HAVING` → filtro depois do agrupamento.

---

## 8. ORDER BY

Utilizado para **ordenar os resultados**.

### ASC

Ordem crescente.

```sql
SELECT numero_conta, saldo
FROM contas
ORDER BY saldo ASC;
```

### DESC

Ordem decrescente.

```sql
SELECT numero_conta, saldo
FROM contas
ORDER BY saldo DESC;
```

Exemplo de aplicação no Banco Aurora:

```sql
SELECT
    numero_conta,
    tipo_conta,
    saldo
FROM contas
WHERE saldo > 1000
ORDER BY saldo DESC;
```

**Ideia principal:**
`ORDER BY` responde à pergunta: **"Como quero organizar o resultado?"**

---

## 9. AS — Apelidos (Aliases)

`AS` pode ser utilizado para dar um nome mais claro a uma coluna ou tabela.

Exemplo:

```sql
SELECT
    nome AS cliente,
    cidade AS localidade
FROM clientes;
```

Também pode ser utilizado com funções:

```sql
SELECT
    COUNT(*) AS total_clientes
FROM clientes;
```

E com tabelas:

```sql
FROM clientes AS c
JOIN contas AS ct
    ON c.cpf = ct.cpf_cliente;
```

**Ideia principal:**
`AS` ajuda a deixar a consulta e o resultado mais claros.

---

# 10. Fluxo de raciocínio para resolver uma consulta

Antes de escrever o SQL, transformar a pergunta de negócio em etapas.

```text
Pergunta de negócio
        ↓
Quais informações preciso?
        ↓
Quais tabelas possuem essas informações?
        ↓
Existe relacionamento entre as tabelas?
        ↓
Preciso utilizar JOIN?
        ↓
Preciso filtrar registros?
        ↓
Preciso agrupar os dados?
        ↓
Preciso calcular indicadores?
        ↓
Preciso filtrar grupos?
        ↓
Como quero ordenar o resultado?
        ↓
Resultado da consulta
```

---

# 11. Estrutura básica de uma consulta

Uma consulta pode seguir esta estrutura:

```sql
SELECT
    colunas
FROM tabela
JOIN outra_tabela
    ON relacionamento
WHERE condição
GROUP BY colunas
HAVING condição_do_grupo
ORDER BY coluna DESC;
```

Nem todas as consultas precisam utilizar todos esses comandos.

---

# 12. Ordem prática para construir uma consulta

Para facilitar o raciocínio, posso pensar na consulta nesta sequência:

1. **SELECT** → o que quero mostrar?
2. **FROM** → de onde vêm os dados?
3. **JOIN** → preciso relacionar tabelas?
4. **WHERE** → preciso filtrar registros?
5. **GROUP BY** → preciso agrupar?
6. **Funções de agregação** → preciso calcular indicadores?
7. **HAVING** → preciso filtrar os grupos?
8. **ORDER BY** → como quero ordenar?

---

# 13. Exemplo completo — Banco Aurora

### Pergunta de negócio

**Quais clientes possuem mais de uma conta?**

### Raciocínio

* Preciso do nome do cliente → tabela `clientes`;
* Preciso identificar as contas → tabela `contas`;
* As tabelas precisam ser relacionadas → `JOIN`;
* Preciso contar as contas → `COUNT`;
* Preciso agrupar por cliente → `GROUP BY`;
* Quero somente clientes com mais de uma conta → `HAVING`.

### Consulta

```sql
SELECT
    c.nome,
    COUNT(ct.numero_conta) AS quantidade_contas
FROM clientes c
JOIN contas ct
    ON c.cpf = ct.cpf_cliente
GROUP BY c.nome
HAVING COUNT(ct.numero_conta) > 1;
```

### Resultado esperado

A consulta identifica os clientes que possuem **mais de uma conta**, transformando registros das tabelas em uma informação útil para análise.

---

# 14. Regra de ouro

Antes de pensar no código, pense na **pergunta de negócio**.

```text
Pergunta
   ↓
Dados necessários
   ↓
Tabelas
   ↓
Relacionamentos
   ↓
Filtros
   ↓
Agrupamentos
   ↓
Indicadores
   ↓
Resultado
```

**SQL não é apenas escrever comandos. É transformar uma pergunta sobre o negócio em uma consulta que produza uma informação útil.**
