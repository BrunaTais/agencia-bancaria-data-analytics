# Cicatrizes do processo

## Problema 1 — NotebookLM sem fontes

Inicialmente foi executado um prompt no NotebookLM sem que as fontes tivessem sido adicionadas.

### O que aconteceu

O NotebookLM informou que não havia fontes disponíveis para fundamentar a resposta.

### Correção

Foram adicionadas fontes selecionadas sobre PostgreSQL, Power Query e Power BI antes de executar novamente o prompt.

### Aprendizado

Antes de utilizar o NotebookLM para uma análise baseada em fontes, é necessário verificar se as fontes relevantes foram adicionadas ao notebook.

---

## Problema 2 — Tabela já existente

Durante a criação do banco, o comando CREATE TABLE clientes foi executado novamente.

### Erro

`relation "clientes" already exists`

### Solução

Foi identificado que a tabela já havia sido criada e não era necessário executá-la novamente.

### Aprendizado

O PostgreSQL não permite criar novamente uma tabela com o mesmo nome no mesmo schema sem alterar ou remover a tabela existente.

---

## Problema 3 — Registro duplicado

Ao executar novamente o INSERT dos clientes, ocorreu:

`duplicate key value violates unique constraint`

### Causa

O CPF utilizado como chave primária já estava cadastrado.

### Aprendizado

Uma chave primária deve identificar o registro de forma única e não pode ser duplicada.
