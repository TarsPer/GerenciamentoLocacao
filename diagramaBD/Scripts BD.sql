CREATE TABLE PESSOA_LOGIN(
ID INT PRIMARY KEY auto_increment,
NOME VARCHAR(50) NOT NULL,
EMAIL VARCHAR(50) NOT NULL,
GENERO VARCHAR(20),
CELULAR VARCHAR(11),
USUARIO VARCHAR(30),
SENHA VARCHAR(20),
ADMINISTRADOR CHAR
);

CREATE TABLE ALUGA(
FOREIGN KEY (ID_PESSOA) REFERENCES PESSOA_LOGIN(ID),
FOREIGN KEY (ID_LOCAVEL) REFERENCES LOCAVEIS(ID)
);

CREATE TABLE LOCAVEIS(
ID INT PRIMARY KEY auto_increment,
TIPO VARCHAR(30) NOT NULL,
DESCRICAO VARCHAR(50)
);

CREATE TABLE CONFIRMA(
FOREIGN KEY (ID_LOCAVEL) REFERENCES LOCAVEIS(ID),
FOREIGN KEY (ID_RESERVA) REFERENCES RESERVA(ID_RESERVA)
);

CREATE TABLE RESERVA(
ID_RESERVA INT PRIMARY KEY auto_increment,
DT_INICIO DATE,
DT_FIM DATE,
USUARIO VARCHAR(30),
ID_LOCAVEL INT
);



--TRIGGER--

DELIMITER //
CREATE TRIGGER after_update_tabela_reserva
AFTER UPDATE ON RESERVA FOR EACH ROW
BEGIN

    INSERT INTO CONFIRMA (ID_LOCAVEL, ID_RESERVA)
    VALUES (NEW.ID_RESERVA, NEW.ID_LOCAVEL);
END;
//
DELIMITER;
