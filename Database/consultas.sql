-- Tabelas --
SELECT * FROM Usuario;
SELECT * FROM Consultor;

-- Tabelas de Log --
SELECT * FROM dateLogUser;
SELECT * FROM dateLogConsultor;

-- Views --
SELECT * FROM vwDetalhesMentorias;
SELECT * FROM vwConsultorsParaAprovar;

-- Function --
SELECT nomeConsultor, fnResumoPerformanceConsultor(idConsultor) AS Performance
FROM Consultor;
