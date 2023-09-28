Create table PESSOA
(
	id_pessoa integer primary key,
	nome varchar(20),
	cpf varchar(14)
);

Create table PESSOA_FISICA
(	
	id_pessoa integer primary key,
	nome varchar(20),
	cpf varchar(14)
);

Insert into PESSOA values 
(
	1, 'PEDRO CABRAL', '12345678991'
);

Insert into PESSOA_FISICA Select id_pessoa, nome, cpf from PESSOA;


Select * from PESSOA_FISICA;

Select * from PESSOA;