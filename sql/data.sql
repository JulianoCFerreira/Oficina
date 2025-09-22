USE Oficina;

-- ========================
-- CLIENTES
-- ========================
INSERT INTO Cliente (nome, telefone, email) VALUES
('Carlos Silva', '11987654321', 'carlos.silva@gmail.com'),
('Mariana Oliveira', '21987654321', 'mariana.oliveira@gmail.com'),
('Pedro Santos', '31987654321', 'pedro.santos@gmail.com');

-- ========================
-- VEÍCULOS
-- ========================
INSERT INTO Veiculo (id_cliente, placa, modelo, ano) VALUES
(1, 'ABC1234', 'Gol', 2015),
(1, 'DEF5678', 'Civic', 2018),
(2, 'GHI9012', 'Uno', 2012),
(3, 'JKL3456', 'HB20', 2020);

-- ========================
-- FUNCIONÁRIOS
-- ========================
INSERT INTO Funcionario (nome, cargo, telefone) VALUES
('João Pereira', 'Mecanico', '11911223344'),
('Lucas Almeida', 'Mecanico', '21922334455'),
('Ana Costa', 'Administrativo', '31933445566');

-- ========================
-- SERVIÇOS
-- ========================
INSERT INTO Servico (descricao, valor, tempo_estimado) VALUES
('Troca de óleo', 120.00, 60),
('Alinhamento e balanceamento', 150.00, 90),
('Revisão geral', 300.00, 180),
('Troca de pastilhas de freio', 200.00, 120);

-- ========================
-- PEÇAS
-- ========================
INSERT INTO Peca (nome, custo, estoque) VALUES
('Óleo 5W30', 50.00, 20),
('Filtro de óleo', 30.00, 15),
('Pastilha de freio', 80.00, 10),
('Bateria 60Ah', 250.00, 5);

-- ========================
-- ORDENS DE SERVIÇO
-- ========================
INSERT INTO OrdemServico (id_cliente, id_veiculo, id_funcionario_responsavel, status, valor_total) VALUES
(1, 1, 1, 'Aberta', 200.00),
(1, 2, 2, 'Em Andamento', 300.00),
(2, 3, 1, 'Finalizada', 150.00),
(3, 4, 2, 'Aberta', 350.00);

-- ========================
-- SERVIÇOS POR ORDEM
-- ========================
INSERT INTO ServicoVeiculo (id_ordem, id_servico) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 4),
(4, 2);

-- ========================
-- PEÇAS POR SERVIÇO
-- ========================
INSERT INTO ServicoPeca (id_servico, id_peca, quantidade) VALUES
(1, 1, 1),
(1, 2, 1),
(4, 3, 2),
(3, 4, 1);

-- ========================
-- PAGAMENTOS
-- ========================
INSERT INTO Pagamento (id_ordem, tipo, valor) VALUES
(1, 'Dinheiro', 200.00),
(2, 'CartaoCredito', 300.00),
(3, 'Pix', 150.00),
(4, 'Boleto', 350.00);
