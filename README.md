# 🛠️ Projeto Lógico de Banco de Dados - Oficina

Este repositório contém o **projeto lógico de banco de dados** para o contexto de uma oficina mecânica, modelado em MySQL.

O objetivo é representar as entidades, relacionamentos e regras de negócio de uma oficina, permitindo consultas operacionais e analíticas.

---

## 📊 Contexto do Projeto
O esquema lógico foi projetado para atender operações comuns de uma oficina, incluindo:

- **Clientes** que possuem **veículos**.  
- **Serviços** que podem ser realizados em vários veículos, com acompanhamento por funcionários.  
- **Funcionários** que podem ser mecânicos ou administrativos.  
- **Ordens de serviço** com múltiplos serviços e funcionários responsáveis.  
- **Pagamentos** associados às ordens de serviço.  
- **Peças** usadas nos serviços, com controle de estoque.

---

## 🗂️ Estrutura do Repositório
| Arquivo | Descrição |
|---------|-----------|
| [`sql/schema.sql`](sql/schema.sql) | Script de criação do banco e tabelas (DDL). |
| [`sql/data.sql`](sql/data.sql) | Inserts de dados de teste. |
| [`sql/queries.sql`](sql/queries.sql) | Consultas SQL para validação e análise. |

---

## 🏛️ Modelo Lógico Resumido
Principais entidades e relacionamentos:

- **Cliente**(`id_cliente` PK, nome, telefone, email)  
- **Veículo**(`id_veiculo` PK, placa, modelo, ano, id_cliente FK)  
- **Funcionario**(`id_funcionario` PK, nome, cargo, telefone)  
- **Servico**(`id_servico` PK, descricao, valor, tempo_estimado)  
- **OrdemServico**(`id_ordem` PK, id_cliente FK, id_veiculo FK, id_funcionario_responsavel FK, data_abertura, status, valor_total)  
- **ServicoVeiculo**(`id_ordem` + `id_servico` PK/FK)  
- **Pagamento**(`id_pagamento` PK, id_ordem FK, tipo, valor, data_pagamento)  
- **Peca**(`id_peca` PK, nome, custo, estoque)  
- **ServicoPeca**(`id_servico` + `id_peca` PK/FK)  

---

## 🔧 Como Executar
1. **Clone** este repositório ou faça download do `.zip`.
2. Em seu cliente MySQL (Workbench, DBeaver ou CLI):
   ```sql
   SOURCE sql/schema.sql;
   SOURCE sql/data.sql;
