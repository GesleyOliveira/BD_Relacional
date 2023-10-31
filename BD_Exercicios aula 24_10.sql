create database BD_Exercicios;

--CRIAÇÃO DAS TABELAS

CREATE TABLE CLIENTES
(
	COD_CLIENTE NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	RG VARCHAR(9) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	ENDERECO VARCHAR(50) NULL,
	BAIRRO VARCHAR(30) NULL,
	CIDADE VARCHAR(30) NULL, 
	ESTADO CHAR(2) NOT NULL,
	TELEFONE VARCHAR(15) NULL,
	EMAIL VARCHAR(30) NULL,
	DATANASCIMENTO DATETIME NULL,
	sexo char(1)
)

CREATE TABLE CATEGORIA
(
	COD_CATEGORIA NUMERIC(10,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	NOME_CATEGORIA VARCHAR(20) NOT NULL,
)

CREATE TABLE FILME
(
	COD_FILME NUMERIC(18,0) IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FILME VARCHAR(30) NOT NULL,
	COD_CATEGORIA NUMERIC(10,0) NOT NULL,
	DIRETOR VARCHAR(50) NOT NULL,
	VALOR_LOCACAO FLOAT NOT NULL,
	RESERVADA CHAR(1) NOT NULL
)

CREATE TABLE LOCACOES
(
	COD_LOCACAO NUMERIC(18,0) IDENTITY(1,1) NOT NULL,
	COD_CLIENTE NUMERIC(18,0) NOT NULL,
	COD_FILME NUMERIC(18,0) NOT NULL,
	DATA_RETIRADA DATETIME NOT NULL,
	DATA_DEVOLUCAO DATETIME NULL,
	CONSTRAINT PK_LOCACAO_CLIENTE PRIMARY KEY(COD_LOCACAO, COD_CLIENTE, COD_FILME)
)

--CRIAÇÃO DOS RELACIONAMENTOS 
--LOCACAO - CLIENTES
ALTER TABLE LOCACOES WITH CHECK ADD CONSTRAINT FK_LOCACOES_CLIENTE FOREIGN KEY (COD_CLIENTE)
REFERENCES CLIENTES(COD_CLIENTE)


ALTER TABLE LOCACOES CHECK CONSTRAINT FK_LOCACOES_CLIENTE 



-- LOCACOES - FILME
ALTER TABLE LOCACOES WITH CHECK ADD CONSTRAINT FK_LOCACOES_FILME FOREIGN KEY (COD_FILME)
REFERENCES FILME(COD_FILME)


ALTER TABLE LOCACOES CHECK CONSTRAINT FK_LOCACOES_FILME 


--FILME - CATEGORIA
ALTER TABLE FILME WITH CHECK ADD CONSTRAINT FK_CATEGORIA_FILME FOREIGN KEY (COD_CATEGORIA)
REFERENCES CATEGORIA(COD_CATEGORIA)


ALTER TABLE FILME CHECK CONSTRAINT FK_CATEGORIA_FILME


-- INSERÇÕES NAS TABELAS
--categoria
INSERT INTO CATEGORIA VALUES ('Ação')
INSERT INTO CATEGORIA VALUES ('Romance')
INSERT INTO CATEGORIA VALUES ('Aventura')
INSERT INTO CATEGORIA VALUES ('Ficção')
INSERT INTO CATEGORIA VALUES ('Drama')
INSERT INTO CATEGORIA VALUES ('Terror')
INSERT INTO CATEGORIA VALUES ('Desenho')
INSERT INTO CATEGORIA VALUES ('Policial')
INSERT INTO CATEGORIA VALUES ('Comédia')

--clientes
INSERT INTO CLIENTES VALUES ('321346530', 'Edson Martin Feitosa', 'Rua Orlando Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'edson.feitosa@ig.com.br', '1982-11-02 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('421346111', 'Rafael Fernando de Moraes Moreno', 'Rua Francisco de Souza, 123', 'Jd. Nova Esperança', 'São Roque', 'SP', '32274567', 'rafael@terra.com.br', '1985-04-01 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('324857670', 'João da Silva', 'Rua Mario Quintana, 13', 'Av. Bartolomeu', 'Sorocaba', 'SP', '32134098', 'joao@uol.com.br', '1992-12-05 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('112345553', 'Maria Chiquinha', 'Rua Padre Luiz, 55', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '23336684', 'maria@ig.com.br', '1982-10-11 00:00:00.000', 'F')
INSERT INTO CLIENTES VALUES ('945848768', 'Rafael Nunes Sales', 'Rua Orlando Alvarenga, 4', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32124609', 'rafael.sales@terra.com.br', '1985-04-01 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('676548499', 'Daniela Martin Feitosa', 'Rua Guilherme Oliveria, 1', 'Jd. Vera das Acássicas', 'Votorantim', 'SP', '32132109', 'daniela.martin@gmail.com', '1986-12-10 00:00:00.000', 'F')
INSERT INTO CLIENTES VALUES ('321349999', 'Renata Cristina', 'Rua Orlando Alvarenga, 1', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32125809', 'renata@gmail', '1970-09-01 00:00:00.000', 'F')
INSERT INTO CLIENTES VALUES ('335466531', 'Joaquim Ferreira de Souza Junior', 'Rua Outubro Vermelho, 65', 'Jd. Santa Rosália', 'Votorantim', 'SP', '11125809', 'joaquim_junior@ig.com.br', '1980-04-08 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('112233445', 'Ladislau Ferreira', 'Rua Orlando Alvarenga, 12345', 'Jd. Vera Cruz', 'Sorocaba', 'SP', '32144409', 'ladislau@terra.com.br', '1988-01-03 00:00:00.000', 'M')
INSERT INTO CLIENTES VALUES ('222222222', 'Vanessa Oliveira', 'Rua das Flores, 1', 'Jd. do Sol', 'Votorantim', 'SP', '32122222', 'vanessa@ig.com.br', '1998-08-08 00:00:00.000', 'F')

--filmes
INSERT INTO FILME VALUES ('300', 1, 'Richard Donner', 3.5, 'n')
INSERT INTO FILME VALUES ('Máquina Mortífera', 1, 'Richard Donner', 3.6, 'n')
INSERT INTO FILME VALUES ('A Mexicana', 2, 'Burr Steers', 2, 's')
INSERT INTO FILME VALUES ('A Verdade Nua e Crua', 2, 'Robert Luketic', 4, 'n')
INSERT INTO FILME VALUES ('A vida é bela', 2, 'Roberto Benigni', 3.5, 's')
INSERT INTO FILME VALUES ('Austrália', 3, 'Baz Luhrmann', 4, 's')
INSERT INTO FILME VALUES ('Ultimato Bourn', 3, 'Paul Greengrass', 3.5, 'n')
INSERT INTO FILME VALUES ('Constantine', 4, 'Francis Lawrence', 2.5, 's')
INSERT INTO FILME VALUES ('Os Irmãos Grimm', 4, 'Terry Gilliam', 3.5, 'n')
INSERT INTO FILME VALUES ('Os Doze Macacos', 4, 'Terry Gilliam', 2.5, 'n')
INSERT INTO FILME VALUES ('Amadeus', 5, 'Milos Forman', 10, 'n')
INSERT INTO FILME VALUES ('As Torres Gêmeas', 5, 'Oliver Stone', 2.5, 's')
INSERT INTO FILME VALUES ('Platoon', 1, 'Oliver Stone', 5.5, 's')
INSERT INTO FILME VALUES ('O Advogado do Diabo', 6, 'Taylor Hackford', 1.5, 's')
INSERT INTO FILME VALUES ('Beowulf', 7, 'Robert Zemeckis', 1, 'n')
INSERT INTO FILME VALUES ('Bolt o super cão', 7, 'Byron Howard', 1.5, 's')
INSERT INTO FILME VALUES ('Apertem o cinto o piloto sumiu', 9, 'Jim Abrahams', 3.6, 's')
INSERT INTO FILME VALUES ('Doze é demais', 9, 'Shawn Levy', 9.2, 's')
INSERT INTO FILME VALUES ('Uma noite no museu', 9, 'Shawn Levy', 2.5, 'n')

select * from filme
--Locações
INSERT INTO LOCACOES VALUES (1,1, '2010-03-10 19:05:43.887', '2010-03-10 00:00:00.000')
INSERT INTO LOCACOES VALUES (1,6, '2010-03-10 19:05:43.887', '2010-03-03 00:00:00.000')
INSERT INTO LOCACOES VALUES (1,8, '2010-03-10 19:05:43.887', '2010-03-03 00:00:00.000')
INSERT INTO LOCACOES VALUES (1,2, '2010-03-12 00:00:00.000', '2010-03-07 00:00:00.000')
INSERT INTO LOCACOES VALUES (1,13, '2010-03-12 00:00:00.000', '2010-03-07 00:00:00.000')
INSERT INTO LOCACOES VALUES (2,5, '2010-03-10 19:05:43.887', '2010-03-01 00:00:00.000')
INSERT INTO LOCACOES VALUES (3,3, '2010-03-08 19:05:43.887', '2010-03-10 00:00:00.000')
INSERT INTO LOCACOES VALUES (3,19, '2010-03-08 19:05:43.887', '2010-03-10 00:00:00.000')
INSERT INTO LOCACOES VALUES (4,17, '2010-03-01 19:05:43.887', '2010-03-03 00:00:00.000')
INSERT INTO LOCACOES VALUES (5,5, '2010-03-03 19:05:43.887', '2010-03-05 00:00:00.000')
INSERT INTO LOCACOES VALUES (6,7, '2010-03-03 19:05:43.887', '2010-03-04 00:00:00.000')
INSERT INTO LOCACOES VALUES (6,9, '2010-03-03 19:05:43.887', '2010-03-04 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,16, '2010-03-03 19:05:43.887', '2010-03-05 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,1, '2010-03-03 19:05:43.887', '2010-03-05 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,5, '2010-03-04 19:05:43.887', '2010-03-06 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,8, '2010-03-04 19:05:43.887', '2010-03-06 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,11, '2010-03-04 19:05:43.887', '2010-03-06 00:00:00.000')
INSERT INTO LOCACOES VALUES (7,12, '2010-03-05 19:05:43.887', '2010-03-07 00:00:00.000')
INSERT INTO LOCACOES VALUES (8,9, '2010-03-10 19:05:43.887', '2010-03-01 00:00:00.000')
INSERT INTO LOCACOES VALUES (9,3, '2010-03-11 19:05:43.887', '2010-03-02 00:00:00.000')
INSERT INTO LOCACOES VALUES (9,6, '2010-03-11 19:05:43.887', '2010-03-02 00:00:00.000')
INSERT INTO LOCACOES VALUES (10,10, '2010-02-10 19:05:43.887', '2010-02-01 00:00:00.000')

/*1. Selecione todos os clientes da locadora.*/
select * from CLIENTES;
/*2. Selecione todos os filmes da locadora.*/
select * from FILME order by VALOR_LOCACAO;
/*3. Mostre todas as categorias que a locadora possui cadastrada.*/
select * from CATEGORIA;
/*4. Mostre todos os clientes do sexo masculino que moram na cidade de Sorocaba.*/
select *
from CLIENTES
where sexo = 'M' and CIDADE = 'Sorocaba';
/*5. Mostre o nome e o telefone de todos os clientes da locadora ordenando a consulta por ordem alfabética.*/
select NOME, TELEFONE 
from CLIENTES
order by NOME;
/*6. Mostre a quantidade de clientes mulheres cadastradas no sistema.*/
select count(*) from CLIENTES
where sexo = 'F';
/*7. Mostre as categorias de filmes que a locadora possui mostrando o nome da categoria em ordem alfabética.*/
select NOME_CATEGORIA from CATEGORIA
order by NOME_CATEGORIA
/*8. Mostre todos os filmes cadastrados do Diretor “Shawn Levy” que não possuem reserva.*/
select FILME from FILME
where DIRETOR = 'Shawn Levy' and RESERVADA = 'n';
/*9. Mostre todos os filmes cujo valor seja superior a 5 reais e que estão reservados.*/
select FILME from FILME
where VALOR_LOCACAO > 5 and RESERVADA = 's';
/*10. Mostre todos os diretores cadastrados no sistema sem repetição de nomes.*/
select distinct DIRETOR from FILME;
/*11. Mostre a quantidade de filmes reservados.*/
select count(*) from FILME
where RESERVADA = 's';
/*12. Mostre o maior valor de Locação cadastrado.*/
SELECT max(VALOR_LOCACAO) 
FROM FILME;
/*13. Mostre todos os filmes cuja categoria seja Ação.*/
Select FILME from FILME, CATEGORIA
where NOME_CATEGORIA = 'Ação'
/*14. Mostre todos os filmes cuja categoria seja Romance ou Aventura que já estão reservados e seu valor de locação seja menor que 5 reais.*/
select FILME from FILME, CATEGORIA
where (NOME_CATEGORIA = 'Romance' or NOME_CATEGORIA = 'Aventura') and (RESERVADA = 's' and VALOR_LOCACAO < 5)
/*15. Mostre todos os filmes alugados pelo cliente Renata Cristina.*/
Select Nome, FILME
from LOCACOES l
inner join CLIENTES c on nome = 'Renata Cristina' and c.COD_CLIENTE = l.COD_CLIENTE
inner join filme f on f.COD_FILME = l.COD_FILME /*inner join junta duas tabelas diferentes*/
/*16. Mostre todos os clientes que já alugaram mais do que 3 filmes.*/
select NOME
from LOCACOES l
inner join CLIENTES c on l.COD_CLIENTE = c.COD_CLIENTE
group by NOME
having COUNT(*) > 3
/*17. Mostre quanto foi gasto pelo cliente Renata Cristina.*/
Select nome, sum(VALOR_LOCACAO)
from LOCACOES
inner join FILME on FILME.COD_FILME = LOCACOES.COD_FILME
inner join CLIENTES on CLIENTES.NOME = 'Renata Cristina' and LOCACOES.COD_CLIENTE = CLIENTES.COD_CLIENTE
group by NOME
/*18. Mostre a média de valor de locação da locadora.*/
Select round(AVG(VALOR_LOCACAO),3)
from FILME
/*19. Mostre o menor valor de locação da locadora.*/
Select min(VALOR_LOCACAO)
from FILME

/*20. Mostre a quantidade de filme que a locadora possui por categoria.*/

Select NOME_CATEGORIA, COUNT(*)
from CATEGORIA, FILME
where FILME.COD_CATEGORIA = CATEGORIA.COD_CATEGORIA
group by CATEGORIA.NOME_CATEGORIA

use BD_Exercicios


