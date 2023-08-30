create table Cliente(

Cod_Cli int constraint Pk_Cliente primary key not null, /*Pk_CLiente é o nome da chave que foi dado*/

Nome_Cli varchar(40) not null,

End_Cli varchar(30) not null,

Bai_Cli varchar(20) not null,

Cid_Cli varchar(20) not null,

Uf_Cli char(3) not null,

Tel_Cli varchar(15) null,

);

 

create table NotaFiscal(

Num_Nota int constraint PK_NotaFiscal primary key not null,

Cod_Cli int not null,

Serie_Nota varchar (10) not null,

Emissao_Nota smalldatetime null,

Vtot_Nota smallMoney not null,

constraint FK_Cliente foreign key(Cod_Cli) references Cliente(Cod_Cli)

);

 

 

create table Cidade(

codcidade varchar(2) not null,

nome_cidade varchar(40)

);

 

create table Empregado(

Nrmatricula_empregado int,

Nome_emprego varchar(50),

data_emissao_empregado datetime,

salario float

);

 

create table estado(

cod_estado varchar(2) not null,

nome_estado varchar(3)

);

 

alter table cidade add primary key(codcidade);

alter table cidade add cod_estado char(2) not null, teste varchar(1) null;

alter table cidade drop column teste;

alter table cidade alter column cod_estado varchar(2);

alter table cidade drop constraint PK__Cidade__9ED2CA96EE41A2A5;

Alter table cidade
Add constraint pk_codcidade primary key (codcidade);

Alter table estado
Add primary key (cdestado);

Alter table cidade
Add foreign key (cdestado) references estado (cdestado);

insert into estado values ('SP','SÃO PAULO');

insert into Cidade values (1,'Votorantim','SP');

insert into estado values ('PR','Não Cadastrado');

insert into estado values ('RJ','Rio de Janeiro');

insert into estado values ('MG','Minas Gerais');

insert into estado values ('SC','Santa Catarina');

insert into estado values ('NN','Não Cadastrado');

insert into cidade (Codcidade, Nomecidade, cdestado)
values('3','Curitiba','PR'); 

insert into cidade (Codcidade, Nomecidade, cdestado)
values('4','Maringá','PR');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('2','Sorocaba','SP');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('5', 'Arraial do Cabo','RJ');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('6', 'Angra dos Reis','RJ');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('7', 'Belo Horizonte','MG');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('8', 'Poços de Caldas','MG');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('9', 'Florianópolis','SC');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('10', 'Blumenau','SC');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('11', 'Campinas', 'SP');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('12', 'Itu', 'NN');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('13', 'Itapira', 'NN');

insert into estado values ('GE','Gesley');

insert into cidade (Codcidade, Nomecidade, cdestado)
values ('55', 'Gesley', 'GE');

Update cidade set Codcidade='13' where codcidade='55';

Update Cidade Set cdestado='SP' where cdestado='NN';

Delete from cidade where Nomecidade='Itapira';

Update estado Set Nomeestado='Paraná' where cdestado='PR';

Update estado Set Nomeestado='São Paulo' where cdestado='SP';

select*

from Cidade;

drop table Cliente;

drop table Cidade;

drop table NotaFiscal;

select*

from estado;


/*delete from cidade where cod_estado like '1'*/

