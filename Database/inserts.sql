INSERT INTO Usuario(nomeUsuario, email, senha) VALUES
	('Veronica Sanches de Almeida', 'veronica@gmail.com', '56783vS@'),
    ('Jonas Albuquerque dos Santos', 'jonas@hotmail.com', '23091Jj#'),
    ('Gustavo Martins de Andrade', 'gustavo@gmail.com', 'g550298!');
    
INSERT INTO Consultor(nomeConsultor, email, senha, status) VALUES
	('Carla Mendes', 'carla@gmail.com', '8865490Ca@', 'Aprovado'),
    ('André Santos', 'andre@gmail.com', '@ndrE901148', 'Aprovado'),
    ('Yumi Tanaka', 'yumi@gmail.com', 'yumM121990@', 'Pendente');
    
INSERT INTO Mentoria(idUsuario, idConsultor, dataAgendamento, duracao, status) VALUES
	(1, 2, '2026-09-22 14:30:00', '01:00:00', 'Agendado'),
    (2, 2, '2026-09-30 16:40:00', '01:00:00', 'Agendado'),
    (3, 1, '2026-09-19 15:20:00', '01:00:00', 'Agendado');
    
INSERT INTO DocumentoConsultor(idConsultor, tipoDocumento, urlArquivo) VALUES
	(1, 'Diploma', 'https://google.com/MeuIncrivelDiploma.png'),
    (2, 'Certificado', 'https://google.com/CertificadoCompleto2026.png'),
    (3, 'Linkedin', 'https://www.linkedin.com/in/yumm-tanaka-173312379/');
    


