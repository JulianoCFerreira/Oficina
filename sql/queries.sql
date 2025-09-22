USE Oficina;

-- ====================================
-- 1️⃣ Listar todos os clientes e seus veículos
-- ====================================
SELECT c.nome AS cliente, v.placa, v.modelo, v.ano
FROM Cliente c
JOIN Veiculo v ON c.id_cliente = v.id_cliente
ORDER BY c.nome, v.ano DESC;

-- ====================================
-- 2️⃣ Quantos serviços cada veículo recebeu
-- ====================================
SELECT v.placa, v.modelo, COUNT(sv.id_servico) AS total_servicos
FROM Veiculo v
JOIN OrdemServico os ON v.id_veiculo = os.id_veiculo
JOIN ServicoVeiculo sv ON os.id_ordem = sv.id_ordem
GROUP BY v.id_veiculo
ORDER BY total_servicos DESC;

-- ====================================
-- 3️⃣ Valor total faturado por cada cliente
-- ====================================
SELECT c.nome AS cliente, SUM(os.valor_total) AS faturamento_total
FROM Cliente c
JOIN OrdemServico os ON c.id_cliente = os.id_cliente
GROUP BY c.id_cliente
ORDER BY faturamento_total DESC;

-- ====================================
-- 4️⃣ Funcionários que realizaram mais ordens de serviço
-- ====================================
SELECT f.nome AS funcionario, f.cargo, COUNT(os.id_ordem) AS ordens_realizadas
FROM Funcionario f
JOIN OrdemServico os ON f.id_funcionario = os.id_funcionario_responsavel
GROUP BY f.id_funcionario
HAVING ordens_realizadas > 1
ORDER BY ordens_realizadas DESC;

-- ====================================
-- 5️⃣ Serviços realizados em cada ordem de serviço com valor total calculado
-- ====================================
SELECT os.id_ordem, c.nome AS cliente, v.placa, s.descricao AS servico,
       s.valor + IFNULL(SUM(sp.quantidade * p.custo),0) AS valor_total_servico
FROM OrdemServico os
JOIN Cliente c ON os.id_cliente = c.id_cliente
JOIN Veiculo v ON os.id_veiculo = v.id_veiculo
JOIN ServicoVeiculo sv ON os.id_ordem = sv.id_ordem
JOIN Servico s ON sv.id_servico = s.id_servico
LEFT JOIN ServicoPeca sp ON s.id_servico = sp.id_servico
LEFT JOIN Peca p ON sp.id_peca = p.id_peca
GROUP BY os.id_ordem, s.id_servico
ORDER BY os.id_ordem, valor_total_servico DESC;

-- ====================================
-- 6️⃣ Peças que estão com estoque baixo (menor ou igual a 5)
-- ====================================
SELECT nome AS peca, estoque
FROM Peca
WHERE estoque <= 5
ORDER BY estoque ASC;

-- ====================================
-- 7️⃣ Relação de serviços e peças utilizadas
-- ====================================
SELECT s.descricao AS servico, p.nome AS peca, sp.quantidade
FROM Servico s
JOIN ServicoPeca sp ON s.id_servico = sp.id_servico
JOIN Peca p ON sp.id_peca = p.id_peca
ORDER BY s.descricao, p.nome;

-- ====================================
-- 8️⃣ Pagamentos realizados por tipo e soma por tipo
-- ====================================
SELECT tipo AS metodo_pagamento, COUNT(*) AS total_pagamentos, SUM(valor) AS valor_total
FROM Pagamento
GROUP BY tipo
HAVING valor_total > 100
ORDER BY valor_total DESC;
