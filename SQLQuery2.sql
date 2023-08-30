/* Atividade 1*/

CREATE TABLE Livros (
	livro_id int constraint Pk_livros PRIMARY KEY not null, /*Pk_livros é o nome da chave que foi dado*/
	titulo varchar(200) not null, /* constraint serve para nomear o nome da chave */
	autor varchar(100) not null,
	ano_publicado int not null,
	genero varchar(50) not null,
);


CREATE TABLE Emprestimos (
	emprestimo_id int not null,
	data_emprestimo date not null,
	data_devolucao date not null,
	status varchar(20) not null,
	livro_id int not null,
	constraint FK_livros FOREIGN KEY(livro_id) REFERENCES livros(livro_id)
);

/*
select * from emprestimos
drop table livros - excluir tabela
drop table Emprestimos
*/

/* Atividade 2*/

CREATE TABLE Estados (
	estado_id int constraint Pk_Estados PRIMARY KEY not null, /*Pk_Estados é o nome da chave que foi dado ao invés de automática*/
	nome varchar(100) not null, /* constraint serve para nomear o nome da chave */
	sigla varchar(2) not null,
	regiao varchar(50) not null,
	populacao int not null,
);	

CREATE TABLE Cidades (
	cidade_id int constraint Pk_Cidades PRIMARY KEY not null, /*Pk_Cidades é o nome da chave que foi dado*/
	nome varchar(100) not null, /* constraint serve para nomear o nome da chave */
	estado_id int not null,
	populacao int not null,
	area_km2 decimal(10,2) not null,
	constraint FK_Estados FOREIGN KEY(estado_id) REFERENCES Estados(estado_id)
);

/* Atividade 3*/

CREATE TABLE Diretores (
	diretor_id int constraint Pk_Diretores PRIMARY KEY not null, /*Pk_Diretores é o nome da chave que foi dado ao invés de automática*/
	nome varchar(100) not null, /* constraint serve para nomear o nome da chave */
	data_nascimento date not null,
	email varchar(150) not null,
	telefone varchar(20) not null,
);	

CREATE TABLE Departamentos (
	departamento_id int constraint Pk_Departamentos PRIMARY KEY not null, /*Pk_Departamentos é o nome da chave que foi dado*/
	nome varchar(200) not null, /* constraint serve para nomear o nome da chave */
	localizacao varchar(150) not null,
	descricao text not null,
	diretor_id int not null,
	constraint FK_Diretores FOREIGN KEY(diretor_id) REFERENCES Diretores(diretor_id)
);

/* Atividade 4*/

CREATE TABLE Jogadores (
	time_id int constraint Pk_Jogadores PRIMARY KEY not null, /*Pk_Diretores é o nome da chave que foi dado ao invés de automática*/
	nome varchar(200) not null, /* constraint serve para nomear o nome da chave */
	cidade varchar(100) not null,
	fundacao date not null,
	tecnico varchar(150) not null,
);	

CREATE TABLE Times (
	jogador_id int constraint Pk_Times PRIMARY KEY not null, /*Pk_Departamentos é o nome da chave que foi dado*/
	nome varchar(100) not null, /* constraint serve para nomear o nome da chave */
	posicao varchar(50) not null,
	idade int not null,
	time_id int not null,
	constraint FK_Jogadores FOREIGN KEY(time_id) REFERENCES Jogadores(time_id)
);

/* Atividade 5*/

CREATE TABLE Autores (
	autor_id int constraint Pk_Autores PRIMARY KEY not null, /*Pk_Diretores é o nome da chave que foi dado ao invés de automática*/
	nome varchar(100) not null, /* constraint serve para nomear o nome da chave */
	data_nasc date not null,
	nacionalidade varchar(50) not null,
	genero varchar(50) not null,
);	

ALTER TABLE Livros drop column autor; /* Serve para dropar a coluna da tabela */
ALTER TABLE Livros Add autor_id int not null; /* Serve para adicionar uma coluna da tabela */
ALTER TABLE Livros Add FOREIGN KEY(autor_id) REFERENCES Autores(autor_id); /* Serve para adicionar uma chave estrangeira na tabela */


/*  Atividade 2: adicionar 10 registros em cada uam das tabelas */
/* Primeiro autor, depois registro, depois empréstimo para seguir a sequencia dos dados */

/*insert into Livros values (1, 'Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 1997, 'Fantasia') */
insert into Autores values (1, 'J. K. Rowling', '1965-07-31', 'Reino Unido', 'Fantasia');
insert into Autores values (2, 'Stephen King', '1947-09-21', 'EUA', 'Terror');
insert into Autores values (3, 'J. R. R. Tolkien', '1892-01-03', 'África do Sul', 'Fantasia');
insert into Autores values (4, 'William Shakespeare', '1564-04-01', 'Reino Unido', 'Poesia');
insert into Autores values (5, 'Carlos Drummond de Andrade', '1902-10-31', 'Brasileiro', 'Poesia');
insert into Autores values (6, 'George R. R. Martin', '1948-09-20', 'EUA', 'Ficção Científica');
insert into Autores values (7, 'Philip Pullman', '1946-10-19', 'Reino Unido', 'Fantasia');
insert into Autores (autor_id, nome, data_nasc, nacionalidade, genero) values (8, 'Ursula K. Le Guin', '1929-10-21', 'EUA', 'Fantasia');
insert into Autores (autor_id, nome, data_nasc, nacionalidade, genero) values (9, 'Michael Moorcock', '1939-12-18', 'Reino Unido', 'Ficção Científica');
insert into Autores (autor_id, nome, data_nasc, nacionalidade, genero) values (10, 'Clark Ashton Smith', '1893-01-13', 'EUA', 'Poesia');