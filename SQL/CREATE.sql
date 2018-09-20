CREATE SCHEMA REABFACIL;

CREATE TABLE CLINICA (
	ID_CLINICA INT PRIMARY KEY,
    NOME VARCHAR(50),
    LINK VARCHAR(256)
    );

CREATE TABLE UNIDADE(
	ID_UNIDADE SMALLINT,
    ID_CLINICA INT,
    NOME VARCHAR(256),
    GENERO VARCHAR(2),
    CNPJ VARCHAR(15),
    ESTADO VARCHAR(2),
    CIDADE VARCHAR(50),
    ENDERECO VARCHAR(256),
    CEP VARCHAR(8),
    CONSTRAINT PK_UNIxCLI PRIMARY KEY (ID_UNIDADE, ID_CLINICA),
    CONSTRAINT FK_CLINICA FOREIGN KEY (ID_CLINICA) REFERENCES CLINICA (ID_CLINICA)
	) ENGINE = INNODB;


CREATE TABLE TRATAMENTO (
	ID_TRATAMENTO SMALLINT PRIMARY KEY,
    NOME_TRATAMENTO VARCHAR(50)
	);

CREATE TABLE UNIxTRATAMENTO (
	ID_UNIDADE SMALLINT,
    ID_TRATAMENTO SMALLINT,
    CONSTRAINT PK_UNIxTRAT PRIMARY KEY (ID_UNIDADE, ID_TRATAMENTO),
    CONSTRAINT FK_UNIxTRAT FOREIGN KEY (ID_UNIDADE) REFERENCES UNIDADE (ID_UNIDADE)
    ) ENGINE = INNODB;

CREATE TABLE TELEFONE (
	ID_TELEFONE SMALLINT,
    ID_UNIDADE SMALLINT,
    TELEFONE VARCHAR(11),
    CONSTRAINT PK_TELxUNI PRIMARY KEY (ID_TELEFONE,ID_UNIDADE),
    CONSTRAINT FK_UNIDADE FOREIGN KEY (ID_UNIDADE) REFERENCES UNIDADE (ID_UNIDADE)
    ) ENGINE = INNODB;

CREATE TABLE AVALIACAO (
	ID_AVALIACAO SMALLINT,
    ID_UNIDADE SMALLINT,
    COMENTARIO VARCHAR(256),
    NOTA FLOAT,
    USUARIO BOOLEAN,
    CONSTRAINT PK_AVALxUNI PRIMARY KEY (ID_AVALIACAO, ID_UNIDADE),
    CONSTRAINT FK_UNIDADE_AVAL FOREIGN KEY (ID_UNIDADE) REFERENCES UNIDADE (ID_UNIDADE)
    ) ENGINE = INNODB;

#INSERT CLINICA
INSERT INTO CLINICA VALUES (1, 'The Way','http://www.clinicatheway.com.br/');

#INSERT UNIDADE
INSERT INTO UNIDADE VALUES(1,1,'Osasco','','','SP','Osasco','Rua Eloy Candido Lopes, 137 - Centro','06010130');

#INSERT TRATAMENTO
INSERT INTO TRATAMENTO VALUES (1, 'Alcool');
INSERT INTO TRATAMENTO VALUES (2, 'Drogas');

#INSERT UNIxTRATAMENTO
INSERT INTO UNIxTRATAMENTO VALUES (1,1);
INSERT INTO UNIxTRATAMENTO VALUES (1,2);

#INSERT TELEFONE
INSERT INTO TELEFONE VALUES (1,1,'11984161044');

#INSERT AVALIACAO
INSERT INTO AVALIACAO VALUES (1,1,'Gostei muito, deixei de ser ze droguinha',5,true);
INSERT INTO AVALIACAO VALUES (2,1,'Espaço muito bom, moraria para sempre, ahco que voltarei pras drogas',5,true);
INSERT INTO AVALIACAO VALUES (3,1,'Meu filho voltou mais drogado ainda',2,false);