-- ===================================
-- SCHEMA: Oficina
-- ===================================
CREATE DATABASE IF NOT EXISTS Oficina
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;
USE Oficina;

-- ========================
-- CLIENTE
-- ========================
CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome       VARCHAR(100) NOT NULL,
    telefone   VARCHAR(20),
    email      VARCHAR(100) UNIQUE
);

-- ========================
-- VEICULO
-- ========================
CREATE TABLE Veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa      CHAR(7) NOT NULL UNIQUE,
    modelo     VARCHAR(50) NOT NULL,
    ano        YEAR,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
        ON DELETE CASCADE
);

-- ========================
-- FUNCIONARIO
-- ========================
CREATE TABLE Funcionario (
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome           VARCHAR(100) NOT NULL,
    cargo          ENUM('Mecanico','Administrativo') NOT NULL,
    telefone       VARCHAR(20)
);

-- ========================
-- SERVICO
-- ========================
CREATE TABLE Servico (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao  VARCHAR(150) NOT NULL,
    valor      DECIMAL(10,2) NOT NULL,
    tempo_estimado INT  -- em minutos
);

-- ========================
-- ORDEM DE SERVICO
-- ========================
CREATE TABLE OrdemServico (
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_funcionario_responsavel INT NOT NULL,
    data_abertura DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Aberta','Em Andamento','Finalizada','Cancelada') DEFAULT 'Aberta',
    valor_total DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id_veiculo),
    FOREIGN KEY (id_funcionario_responsavel) REFERENCES Funcionario(id_funcionario)
);

-- ========================
-- SERVICO x ORDEM (N:N)
-- ========================
CREATE TABLE ServicoVeiculo (
    id_ordem INT NOT NULL,
    id_servico INT NOT NULL,
    PRIMARY KEY (id_ordem, id_servico),
    FOREIGN KEY (id_ordem) REFERENCES OrdemServico(id_ordem) ON DELETE CASCADE,
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico)
);

-- ========================
-- PAGAMENTO
-- ========================
CREATE TABLE Pagamento (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_ordem     INT NOT NULL,
    tipo         ENUM('Dinheiro','CartaoCredito','CartaoDebito','Pix','Boleto'),
    valor        DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_ordem) REFERENCES OrdemServico(id_ordem) ON DELETE CASCADE
);

-- ========================
-- PECA
-- ========================
CREATE TABLE Peca (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL,
    custo   DECIMAL(10,2),
    estoque INT DEFAULT 0
);

-- ========================
-- SERVICO x PECA (N:N)
-- ========================
CREATE TABLE ServicoPeca (
    id_servico INT NOT NULL,
    id_peca    INT NOT NULL,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (id_servico, id_peca),
    FOREIGN KEY (id_servico) REFERENCES Servico(id_servico) ON DELETE CASCADE,
    FOREIGN KEY (id_peca) REFERENCES Peca(id_peca) ON DELETE CASCADE
);
