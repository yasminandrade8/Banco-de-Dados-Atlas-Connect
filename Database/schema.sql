CREATE DATABASE AtlasConnect;
USE AtlasConnect;

DROP TABLE IF EXISTS Usuario;
DROP TABLE IF EXISTS Consultor;
DROP TABLE IF EXISTS Mentoria;
DROP TABLE IF EXISTS dateLogUser;
DROP TABLE IF EXISTS dateLogConsultor;
DROP TABLE IF EXISTS DocumentoConsultor;

CREATE TABLE Usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
    nomeUsuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(50) NOT NULL
);
CREATE TABLE Consultor (
	idConsultor INT PRIMARY KEY AUTO_INCREMENT,
    nomeConsultor VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(50) NOT NULL
);
ALTER TABLE Consultor 
ADD COLUMN status ENUM('Pendente', 'Aprovado', 'Bloqueado') 
DEFAULT 'Pendente';

CREATE TABLE Mentoria (
	idMentoria INT PRIMARY KEY AUTO_INCREMENT,
    idUsuario INT,
    idConsultor INT,
    dataAgendamento DATETIME,
    duracao TIME,
    status VARCHAR(50),
		FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
        FOREIGN KEY (idConsultor) REFERENCES Consultor(idConsultor)
);
CREATE TABLE DocumentoConsultor(
	idDoc INT PRIMARY KEY AUTO_INCREMENT,
    idConsultor INT,
    tipoDocumento VARCHAR(50),
    urlArquivo VARCHAR(255),
		FOREIGN KEY (idConsultor) REFERENCES Consultor(idConsultor)
);
CREATE TABLE dateLogUser (
	id INT PRIMARY KEY AUTO_INCREMENT,
    mensagem TEXT,
    dataAcao DATETIME
);
CREATE TABLE dateLogConsultor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    mensagem TEXT,
    dataAcao DATETIME
);

