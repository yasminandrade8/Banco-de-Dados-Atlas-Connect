DROP VIEW IF EXISTS vwDetalhesMentorias;
DROP VIEW IF EXISTS vwConsultorsParaAprovar;

CREATE VIEW vwDetalhesMentorias AS
SELECT 
	m.idMentoria,
    u.nomeUsuario AS Candidato,
    c.nomeConsultor AS Consultor,
    m.dataAgendamento,
    m.duracao AS Duração,
    m.status
FROM Mentoria m
INNER JOIN Usuario u ON m.idUsuario = u.idUsuario
INNER JOIN Consultor c ON m.idConsultor = c.idConsultor;

CREATE VIEW vwConsultorsParaAprovar AS
SELECT 
	c.idConsultor,
    c.nomeConsultor,
    c.email,
    d.tipoDocumento,
    d.urlArquivo
FROM Consultor c
INNER JOIN DocumentoConsultor d ON c.idConsultor = d.idConsultor
WHERE c.status = 'Pendente';
    