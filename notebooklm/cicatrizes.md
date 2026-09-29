# Cicatrizes do Projeto — Aprendizados e Soluções

Este arquivo registra dificuldades, erros e ajustes encontrados durante o desenvolvimento do projeto **Banco Aurora** e durante o uso do NotebookLM.

A proposta é documentar não apenas o resultado final, mas também o processo de aprendizagem.

---

## 1. NotebookLM sem fontes disponíveis

### Situação

Ao criar o notebook no NotebookLM, o primeiro prompt foi executado antes da adição das fontes.

O NotebookLM informou que não havia fontes disponíveis para fundamentar a resposta.

### Problema

O prompt solicitava uma resposta baseada exclusivamente nas fontes fornecidas, mas nenhuma fonte havia sido adicionada naquele momento.

### Solução

Foram adicionadas fontes relacionadas aos temas do projeto, incluindo banco de dados, SQL, Power Query, Power BI, Python, Pandas e contexto do sistema financeiro.

Depois disso, o prompt foi executado novamente.

### Aprendizado

O resultado gerado por uma ferramenta de IA depende diretamente do contexto e das fontes fornecidas. Antes de elaborar um prompt que dependa de referências específicas, é necessário verificar se as fontes estão disponíveis.

---

## 2. Erro ao criar uma tabela que já existia

### Situação

Durante a criação da tabela `clientes`, o comando `CREATE TABLE` foi executado novamente.

O PostgreSQL apresentou a mensagem:

```text
relation "clientes" already exists
```

### Problema

A tabela já havia sido criada anteriormente no banco de dados.

### Solução

Foi verificado que a tabela `clientes` já existia e que os dados estavam disponíveis.

Não foi necessário criar a tabela novamente.

### Aprendizado

Mensagens de erro precisam ser interpretadas antes de tentar executar novamente o comando.

Nesse caso, o erro não significava que a estrutura estava incorreta, mas que o objeto solicitado já existia no banco.

---

## 3. Erro de chave primária ao inserir dados novamente

### Situação

Ao executar novamente o `INSERT` dos clientes, o PostgreSQL apresentou um erro relacionado à chave primária:

```text
duplicate key value violates unique constraint
```

O conflito ocorreu com o CPF:

```text
12345678900
```

### Problema

O registro do cliente já havia sido inserido anteriormente.

Como `cpf` é a chave primária da tabela `clientes`, não é permitido inserir outro registro com o mesmo valor.

### Solução

Foi verificado que os dados já estavam cadastrados corretamente.

Não foi necessário inserir os registros novamente.

### Aprendizado

A chave primária identifica cada registro de forma única e impede duplicidades.

Esse erro também ajudou a compreender, na prática, a importância das restrições de integridade em bancos de dados relacionais.

---

## 4. Organização dos scripts SQL

### Situação

Depois de criar e inserir os dados no PostgreSQL, surgiu a necessidade de organizar os comandos utilizados no projeto para publicação no GitHub.

### Solução

Os comandos foram separados em três arquivos:

```text
sql/
├── 01_criacao_tabelas.sql
├── 02_insercao_dados.sql
└── 03_consultas_analise.sql
```

### Aprendizado

Separar os scripts por finalidade facilita a organização, manutenção e compreensão do projeto.

A estrutura também permite identificar claramente:

* como o banco foi criado;
* como os dados foram inseridos;
* quais análises foram realizadas.

---

## Conclusão

As dificuldades encontradas durante o projeto foram utilizadas como parte do processo de aprendizagem.

A documentação das situações ajudou a compreender melhor conceitos como:

* existência de tabelas;
* chaves primárias;
* integridade dos dados;
* execução de comandos SQL;
* organização de scripts;
* uso de fontes em ferramentas de IA;
* importância de interpretar mensagens de erro.
