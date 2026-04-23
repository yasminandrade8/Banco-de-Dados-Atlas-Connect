-- Consultas básicas --
SELECT * FROM Usuario;
SELECT * FROM Consultor;
SELECT * FROM Mentoria;

SELECT * FROM Consultor
WHERE status = 'Aprovado';

SELECT COUNT(*) AS TotalCandidatos FROM Usuario;

SELECT status, COUNT(*) AS 'Total por status'
FROM Mentoria
GROUP BY status;

SELECT 
    m.idMentoria,
    u.nomeUsuario AS Candidato,
    c.nomeConsultor AS Consultor,
    m.dataAgendamento
FROM Mentoria m
INNER JOIN Usuario u ON m.idUsuario = u.idUsuario
INNER JOIN Consultor c ON m.idConsultor = c.idConsultor
ORDER BY m.idMentoria DESC;

-- Tabelas de Log --
SELECT * FROM dateLogUser;
SELECT * FROM dateLogConsultor;

-- Views --
SELECT * FROM vwDetalhesMentorias;
SELECT * FROM vwConsultorsParaAprovar;

-- Function --
SELECT nomeConsultor, fnResumoPerformanceConsultor(idConsultor) AS Performance
FROM Consultor;
