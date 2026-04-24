DELIMITER $$
CREATE PROCEDURE spAgendarMonitoria(
    IN p_idUsuario INT,
    IN p_idConsultor INT,
    IN p_data DATETIME,
    IN p_duracao TIME
)
BEGIN
    INSERT INTO Mentoria(idUsuario, idConsultor, dataAgendamento, duracao, status)
    VALUES (p_idUsuario, p_idConsultor, p_data, p_duracao, 'Agendado');
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE spRelatorioGeralSistema()
BEGIN
    -- Relatório combinando contagens para o administrador --
    SELECT 
        (SELECT COUNT(*) FROM Usuario) AS TotalCandidatos,
        (SELECT COUNT(*) FROM Consultor WHERE status = 'Aprovado') AS ConsultoresAtivos,
        (SELECT COUNT(*) FROM Mentoria WHERE status = 'Agendado') AS MentoriasPendentes;
END $$
DELIMITER ;
