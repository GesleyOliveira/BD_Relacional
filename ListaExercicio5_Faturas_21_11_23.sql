drop database bdfatura;
create database bdfatura;
use bdfatura;

create table cliente
(codcliente  int not null
,nome  varchar(50)
,area  varchar(3)
,telefone varchar(30)
,saldo   money);

alter table cliente add constraint pk_cliente primary key (codcliente);

create table fatura
(nrfatura  int not null
,datafatura date
,codcliente int);

alter table fatura add constraint pk_fatura primary key (nrfatura);
alter table fatura add constraint Fk_fatura_cli foreign key(codcliente) references cliente (codcliente);

create table fornecedor
(codforn  int not null
,telefone varchar(20)
,nomeforn varchar(50));

alter table fornecedor add constraint pk_fornecedor primary key (codforn);

create table produto
(codproduto  varchar(10) not null
,descricao varchar(50)
,preco money
,desconto money
,codforn int
,saldo int);

alter table produto add constraint pk_produto primary key (codproduto);
alter table produto add constraint fk_produto_forn foreign key(codforn) references fornecedor (codforn);

create table itens_fatura
(nrfatura int not null
,codproduto varchar(10) not null
,qtde int
,valor money);
alter table itens_fatura add constraint pk_itens_fatura primary key (nrfatura, codproduto);
alter table itens_fatura add constraint fk_itens_produto foreign key(codproduto) references produto (codproduto);
alter table itens_fatura add constraint fk_itens_fatura foreign key(nrfatura) references fatura (nrfatura);

insert into cliente values (10010,'Alfredo Ramas',615,'844-2573',0);
insert into cliente values (10011,'Leona Dune',713,'844-2572',0);
insert into cliente values (10012,'Kathy Smith',615,'844-2571',345.86);
insert into cliente values (10013,'Paul Olowski',615,'844-2570',536.75);
insert into cliente values (10014,'Myron Orlando',615,'844-2574',0);
insert into cliente values (10015,'Amy Brian',713,'844-2575',0);
insert into cliente values (10016,'James Brown',615,'844-2576',221.19);
insert into cliente values (10017,'George Willians',615,'844-2577',768.93);
insert into cliente values (10018,'Anne Farris',713,'844-2578',216.55);
insert into cliente values (10019,'Olete Smith',615,'844-2579',0);

insert into fornecedor values (21225,'223-3200','Bryson');
insert into fornecedor values (21226,'223-3201','SuperLoo');
insert into fornecedor values (21231,'223-3202','DeESupply');
insert into fornecedor values (21344,'223-3203','Gomez Bros');
insert into fornecedor values (22567,'223-3204','Dome Supply');
insert into fornecedor values (23119,'223-3205','Randsets');
insert into fornecedor values (24004,'223-3206','Brackman');
insert into fornecedor values (24288,'223-3207','Ordva');
insert into fornecedor values (25443,'223-3208','BeK');
insert into fornecedor values (25501,'223-3209','Ramal Sypplies');
insert into fornecedor values (25595,'223-3211','Rubicon Systems');

insert into produto values ('11QER/31','Power Painter',109.99,0,25595,100);
insert into produto values ('13-Q2/P2','7.25-in pwr',14.99,0.05,21344,100);
insert into produto values ('14-Q1/L3','9.00-in pwr',17.49,0,21344,100);
insert into produto values ('1546-QQ2','Hrd. cloth 1/4-in 2x50',39.95,0,23119,100);
insert into produto values ('1558-QW1','Hrd. cloth 1/2-in 3x50',43.99,0,23119,100);
insert into produto values ('2232/QTY','BeD jjjj 12-in',109.92,0.05,24288,100);
insert into produto values ('2232/QWE','BeD jjjj 8-in',99.87,0.05,24288,100);
insert into produto values ('2238/QPD','BeD jjjj 1/2 in',38.95,0.05,25595,100);
insert into produto values ('23109-HB','Claw hammer',9.95,0.10,21225,100);
insert into produto values ('23114-AA','Sledger hammer',14.40,0.05,null,100);
insert into produto values ('54778-2T','Rat-tail file',4.99,0,21344,100);
insert into produto values ('89-WRE-Q','Hicut chain saw 16in',256.99,0.05,24288,100);
insert into produto values ('PVC23DRT','PVC pipe 3-5in',5.87,0,null,100);
insert into produto values ('SM-18277','1.25-in metal screw',6.99,0,21225,100);
insert into produto values ('SW-23116','2-5 in screw, 50',8.45,0,21231,100);
insert into produto values ('WR3/TT3','Steel matting',119.95,0.10,25595,100);

insert into fatura values (1001,'16-mar-2008',10014);
insert into fatura values (1002,'16-mar-2008',10011);
insert into fatura values (1003,'16-mar-2008',10012);
insert into fatura values (1004,'17-mar-2008',10011);
insert into fatura values (1005,'17-mar-2008',10018);
insert into fatura values (1006,'17-mar-2008',10014);
insert into fatura values (1007,'17-mar-2008',10015);
insert into fatura values (1008,'17-mar-2008',10011);

insert into itens_fatura values (1001,'13-Q2/P2',1,14.99);
insert into itens_fatura values (1001,'23109-HB',1,9.95);
insert into itens_fatura values (1002,'54778-2T',2,4.99);
insert into itens_fatura values (1003,'2238/QPD',1,38.95);
insert into itens_fatura values (1003,'1546-QQ2',1,39.95);
insert into itens_fatura values (1003,'13-Q2/P2',1,14.99);
insert into itens_fatura values (1004,'54778-2T',3,4.99);
insert into itens_fatura values (1004,'23109-HB',2,9.95);
insert into itens_fatura values (1005,'PVC23DRT',12,5.87);
insert into itens_fatura values (1006,'SM-18277',3,6.99);
insert into itens_fatura values (1006,'2232/QTY',1,109.92);
insert into itens_fatura values (1006,'23109-HB',1,9.95);
insert into itens_fatura values (1006,'89-WRE-Q',1,256.99);
insert into itens_fatura values (1007,'13-Q2/P2',2,14.99);
insert into itens_fatura values (1007,'54778-2T',1,4.99);
insert into itens_fatura values (1008,'PVC23DRT',5,5.87);
insert into itens_fatura values (1008,'WR3/TT3',3,119.95);
insert into itens_fatura values (1008,'23109-HB',1,9.95);

--1) Selecione número da fatura, data da fatura, código do cliente e nome do cliente por ordem de nome de cliente.
SELECT F.nrfatura, F.datafatura, F.codcliente, C.nome
FROM FATURA F
JOIN CLIENTE C on F.codcliente = C.codcliente
ORDER BY C.nome

--2) Selecione todos os produtos (código, nome, preço, nome do fornecedor e saldo por ordem de nome do produto).

Select codproduto, descricao, preco, nomeforn, saldo
from produto p 
inner join fornecedor f on p.codforn = f.codforn
order by p.descricao


--3) Selecione número da fatura e seu valor total.

Select f.nrfatura, qtde * valor
from fatura f
inner join itens_fatura i on f.nrfatura = i.nrfatura

--4) Selecione a quantidade de produtos por nome de fornecedor

Select f.nomeforn, count(p.codforn)
from produto p
inner join fornecedor f on f.codforn = p.codforn
GROUP BY f.nomeforn

--5) Selecione a quantidade de itens por número de fatura

Select i.nrfatura, count(i.qtde) as 'Quantidade de itens'
from itens_fatura i
group by i.nrfatura

--6) Selecione o valor total comprado por cada cliente. Exibir nome do cliente e valor

select c.nome, sum(valor) as 'Valor total gasto'
from cliente c
inner join fatura f on c.codcliente = f.codcliente 
inner join itens_fatura i on i.nrfatura = f.nrfatura
group by c.nome

--7) Selecione quantidade de clientes por área.

Select c.area as 'Area', COUNT(c.area) as 'Quantidade de produtos'
from cliente c
group by c.area

--8) Selecione a quantidade de produtos por fornecedor.

select p.codforn, count(p.codforn)
from produto p
inner join fornecedor f on f.codforn = p.codforn
group by p.codforn

--9) Selecione a média dos valores faturados dos produtos.

select AVG(i.valor) as 'Média dos valores faturados dos produtos'
from itens_fatura i
inner join fatura f on f.nrfatura = i.nrfatura
inner join produto p on p.codproduto = i.codproduto

--10) Selecione todas as faturas que tenham mais que 2 itens.

select f.nrfatura
from fatura f
inner join itens_fatura i on i.qtde > 2
group by f.nrfatura

select * from cliente
select * from fatura
select * from fornecedor
select * from itens_fatura
select * from produto