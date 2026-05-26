-- DML : DATA MANIPULATION LANGUAGE
/*
	INSERT: INSERIR DADOS
    UPDATE: ATUALIZAR DADOS
	DELETE: EXCLUSÃO DE DADOS
    SELECT:
			- SELEÇÃO SIMPLES
				-> COLUNAS
                -> FILTRO SIMPLES
*/

CREATE DATABASE IF NOT EXISTS BIBLIOTECA; -- CRIAÇÃO DO BANCO

USE BIBLIOTECA; -- COMANDO PARA CONECTAR NO BANCO DE DADOS

CREATE TABLE IF NOT EXISTS CLIENTE
(
	NUMCPF CHAR(11) NOT NULL,
    NOMECLIENTE VARCHAR(100) NOT NULL,
    DATANASCIMENTO DATE NOT NULL,
    STATUSCLIENTE BIT (1) NOT NULL DEFAULT 1,
    PRIMARY KEY(NUMCPF)
);

CREATE TABLE IF NOT EXISTS CATEGORIA_LIVRO
(
	IDCATEGORIA tinyint NOT NULL,
    DESC_CATEGORIA  VARCHAR(50) NOT NULL,
    primary key (IDCATEGORIA)
);

create table IF NOT EXISTS LIVRO
(
	IDLIVRO INT NOT NULL AUTO_INCREMENT,
    DESC_LIVRO VARCHAR(100),
    IDCATEGORIA tinyint NOT NULL,
    PRIMARY KEY (IDLIVRO),
    CONSTRAINT FOREIGN KEY (IDCATEGORIA) REFERENCES CATEGORIA_LIVRO (IDCATEGORIA)
);

-- INSERT = INSERÇÃO DE DADOS
/*
	--> TODO TIPO DE DADO ALFANUMÉRICO, PRECISA ESTAR ENTRE ASPAS SIMPLES 'TEXTO'
    --> Todo tipo de dado que é data precisa estar entre aspas simples 'data'
    --> Para inserção e atualização de dados do tipo data, deve-se considerar o padrão 'AAAA/MM/DD'
    --> Tipos de dados numéricos não precisam estar entre aspas simples
*/
-- codigo padrão para inserção de dados no banco de dados
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345678909', 'Lucas Trado', '2006-01-31' , 1);

-- EXEMPLO DE SELEÇÃO SIMPLES
SELECT * FROM CLIENTE;

/*
	ERROS COMUNS AO REALIZAR INSERTS
		--> Chave primária duplicada (acontece ao tentar inserir uma chave que já existe)
			exemplo: Error code: 1062. Duplicare entry '12345678909' for key 'cliente.PRIMARY'
		--> Tipo de dado incorreto
			exemplo: Error Code: 1292. Incorret date value: 'Professor Legal' for column 'DATANASCIMENTO'
		--> Quantidade de valores inseridos  diferente de campos declarados
			exemplo: Error Code: 1136. Column count doesn't match value count at row 1
		--> Tamanho de dado diferente do tipo de dado declarado.
			exemplo: Error Code: 1406. Data too long for column 'NUMCPF' at row 1
		--> Data Inválida
			exemplo: Error Code: 1292. Incorrect date value: '2001-01-32' for column 'DATANASCIMENTO' at row 1
		--> Campo não nulo inserido como nulo
			exemplo: Error Code: 1048. Column 'STATUSCLIENTE' cannot be null
*/

INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345678908', 'Pedro Augusto', '2007-01-31' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345698907', 'Jair Bolsonaro', '1999-06-27' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12145978909', 'João Xia', '2006-05-19' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12325678901', 'Flavin do Pneu', '2005-05-30' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345578909', 'Maria da Silva', '1998-01-31' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('10345678908', 'Neymar da Silva Santos Júnior', '1992-02-05' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12745678709', 'Cristiano Ronaldo dos Santos Aveiro', '1985-02-05' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345677909', 'Jacinto Leite', '2001-07-20' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('12345638903', 'Raimundo Nonato', '1983-02-28' , 1);
INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES ('11345778902', 'Arthur Morgan', '2007-06-20' , 1);

INSERT INTO CLIENTE (NUMCPF, NOMECLIENTE, DATANASCIMENTO, STATUSCLIENTE) VALUES 
					('12345680908', 'Pedro Bernardo', '2007-01-31' , DEFAULT),
					('92345578908', 'Vinicius', '2007-05-31' , DEFAULT),
                    ('92349678908', 'Lindumar', '2003-01-01' , DEFAULT),
                    ('19345679608', 'Breno Lopez', '2007-01-31' , DEFAULT),
                    ('96245778907', 'Pedra', '2007-01-10' , DEFAULT);
                    
INSERT INTO CATEGORIA_LIVRO (IDCATEGORIA, DESC_CATEGORIA) VALUES
							(1, 'Terror'),
                            (2, 'Suspense'),
                            (3, 'Romance'),
                            (4, 'Erótico'),
                            (5, 'Comédia'),
                            (6, 'Ação'),
                            (7, 'Drama'),
                            (8, 'Aventura'),
                            (9, 'Fantasia'),
                            (10, 'Ficção');

SELECT * FROM CATEGORIA_LIVRO;

-- INSERÇÃO DE DADOS QUE POSSUEM CHAVE ESTRANGEIRA

INSERT INTO LIVRO (DESC_LIVRO, IDCATEGORIA) VALUES
				('Harry Potter e a Pedra Filosofal', 9);

INSERT INTO LIVRO (DESC_LIVRO, IDCATEGORIA) VALUES
				('Os Miseráveis', 7),
                ('O Alquimista', 10),
                ('O Código Da Vinci', 2);