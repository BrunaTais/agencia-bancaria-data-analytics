# Miniguia — SQL e Análise de Dados Bancários

## 1. SELECT

Utilizado para definir quais informações serão exibidas.

```sql
SELECT nome, cidade
FROM clientes;

## 2. WHERE

Utilizado para filtrar registros.

SELECT *
FROM contas
WHERE saldo > 1000;

## 3. JOIN

Utilizado para relacionar tabelas.

SELECT c.nome, ct.saldo
FROM clientes c
JOIN contas ct
    ON c.cpf = ct.cpf_cliente;

## 4. GROUP BY

Utilizado para agrupar informações.

## 5. Funções de agregação
COUNT
SUM
AVG
MAX
MIN

## 6. HAVING

Utilizado para filtrar resultados agrupados.

## 7. ORDER BY

Utilizado para ordenar os resultados.

ASC = crescente
DESC = decrescente

## 8. Fluxo de raciocínio

Pergunta de negócio
→ identificar dados necessários
→ identificar tabelas
→ verificar relacionamentos
→ aplicar filtros
→ agrupar quando necessário
→ calcular indicadores
→ ordenar e apresentar resultado.
