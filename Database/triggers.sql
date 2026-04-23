DROP TRIGGER IF EXISTS trLogNovoUser;
DROP TRIGGER IF EXISTS trLogNovoConsultor;

DELIMITER $$
CREATE TRIGGER trLogNovoUser
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
	INSERT INTO dateLogUser(mensagem, dataAcao)
    VALUES (CONCAT('Novo usuário: ', NEW.nomeUsuario), NOW());
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER trLogNovoConsultor
AFTER INSERT ON Consultor
FOR EACH ROW
BEGIN
	IF NEW.status = 'Aprovado' THEN
		INSERT INTO dateLogConsultor(mensagem, dataAcao)
		VALUES (CONCAT('Novo consultor aprovado: ', NEW.nomeConsultor), NOW());
	END IF;
END $$
DELIMITER ;