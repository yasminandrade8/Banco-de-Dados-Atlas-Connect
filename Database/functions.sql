DELIMITER $$
CREATE FUNCTION fnResumoPerformanceConsultor(p_idConsultor INT)
RETURNS VARCHAR(100) DETERMINISTIC
BEGIN
	DECLARE totalMentorias INT;
    DECLARE totalTempo TIME;
    DECLARE resultado VARCHAR(100);
    
    SELECT COUNT(*) INTO totalMentorias
    FROM Mentoria
    WHERE idConsultor = p_idConsultor;
    
    SELECT SEC_TO_TIME(SUM(TIME_TO_SEC(duracao))) INTO totalTempo
    FROM Mentoria
    WHERE idConsultor = p_idConsultor;
    
    SET resultado = CONCAT('Consultor com ', totalMentorias, ' mentorias e ', IFNULL(totalTempo, '00:00:00'), ' horas dedicadas.');
    RETURN resultado;
END $$
DELIMITER ;
    
