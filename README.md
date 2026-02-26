# 📚 Desafio de Projeto – Índices e Procedures em Banco de Dados

## 🎯 Objetivo do Projeto

Este projeto foi desenvolvido como parte do módulo da **Formação SQL Database Specialist** da DIO (Digital Innovation One).

O desafio teve como objetivo aplicar conceitos avançados de:

- Modelagem Relacional
- Criação de Índices para otimização de consultas
- Desenvolvimento de Stored Procedures
- Manipulação de dados com estruturas condicionais

Foram utilizados dois cenários distintos:

- 📌 Company (empresa/departamentos)
- 🛒 E-commerce

---

# 🧠 Parte 1 – Criação de Índices

## 🔎 Problema Proposto

Criar índices estratégicos com base em consultas reais, considerando:

- Quais dados são mais acessados
- Quais atributos são relevantes para o contexto
- O impacto do índice na performance do SGBD

---

## 📊 Perguntas Respondidas (Company)

1. Qual o departamento com maior número de pessoas?
2. Quais são os departamentos por cidade?
3. Relação de empregados por departamento.

---

## ⚙ Estratégia de Indexação

Os índices foram criados considerando:

- Colunas utilizadas em `JOIN`
- Colunas utilizadas em `GROUP BY`
- Colunas utilizadas em `ORDER BY`
- Colunas utilizadas em `WHERE`

### 📌 Índices Criados

- Índice em `employee(Dno)`  
  ✔ Otimiza o agrupamento por departamento  
  ✔ Reduz custo de JOIN com departament  

- Índice em `departament(Dnumber)`  
  ✔ Melhora performance de relacionamento  

- Índice em `departament(Dlocation)`  
  ✔ Otimiza ordenação por cidade  

### 🧩 Tipo de Índice Utilizado

Foi utilizado o índice padrão **B-Tree**, pois:

- É eficiente para buscas por igualdade e intervalos
- É o padrão do InnoDB
- Ideal para colunas com alta cardinalidade

---

# 🛠 Parte 2 – Procedures com Estrutura Condicional

## 🎯 Objetivo

Criar procedures que realizem:

- SELECT
- INSERT
- UPDATE
- DELETE

Utilizando:

- Variável de controle (`opcao`)
- Estrutura condicional (`IF / ELSEIF`)
- Parâmetros de entrada

---

## 🏢 Cenário Company

Procedure: `manage_employee`

Permite:

1 → SELECT  
2 → INSERT  
3 → UPDATE  
4 → DELETE  

Manipula registros da tabela `employee`.

---

## 🛒 Cenário E-commerce

Procedure: `manage_product`

Permite:

1 → SELECT  
2 → INSERT  
3 → UPDATE  
4 → DELETE  

Manipula registros da tabela `product`.

---

# 🏗 Estrutura do Projeto

📁 projeto
├── 01_company_index_queries.sql
├── 02_procedures_company_ecommerce.sql
└── README.md


---

# 🚀 Tecnologias Utilizadas

- MySQL
- Engine InnoDB
- Índices B-Tree
- Stored Procedures
- Estruturas Condicionais

---

# 💡 Conclusão

Este projeto reforçou a importância de:

- Criar índices estratégicos, evitando indexação excessiva
- Entender como o SGBD executa consultas
- Encapsular lógica de negócio dentro do banco de dados
- Aplicar boas práticas de modelagem relacional

A implementação demonstra domínio sobre:

- Performance de consultas
- Relacionamentos entre tabelas
- Manipulação de dados via procedures
- Organização e documentação de scripts

---

📌 Projeto desenvolvido para fins educacionais na Formação SQL Database Specialist – DIO.
