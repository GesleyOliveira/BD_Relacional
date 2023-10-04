Select Funcionario.PRIMEIRO_NOME, Funcionario.SALARIO,
Setor.NOME_SETOR
from Funcionario, Setor
Where Funcionario.COD_SETOR = SETOR.COD_SETOR

SELECT * FROM FUNCIONARIO;

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Inner join Setor s on f.cod_setor = s.cod_setor

Select c.nome_cliente, p.num_pedido
from cliente c
Inner join pedido p on c.cod_cliente = p.cod_cliente

Select c.nome_cliente, p.num_pedido
from cliente c
Left outer join pedido p on c.cod_cliente = p.cod_cliente

Select c.nome_cliente, p.num_pedido
from cliente c
Left outer join pedido p on c.cod_cliente = p.cod_cliente
Where P.cod_cliente is null

Insert into Setor (COD_SETOR, NOME_SETOR) values (6, 'Producao');
Insert into Setor (COD_SETOR, NOME_SETOR) values (7, 'Compras');
Insert into Setor (COD_SETOR, NOME_SETOR) values (8, 'Logistica');

alter table Setor identity values (
	

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Right outer join Setor s on f.cod_setor = s.cod_setor

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Right outer join Setor s on f.cod_setor = s.cod_setor
Where f.Cod_setor is null

select * from Setor;

Select c.nome_cliente, p.num_pedido
from cliente c
Full outer join pedido p on c.cod_cliente = p.cod_cliente

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Full outer join Setor s on f.cod_setor = s.cod_setor

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
full outer join Setor s on f.cod_setor = s.cod_setor
Where f.Cod_setor is null or s.Cod_setor is nullSelect c.nome_cliente, p.num_pedido
from cliente c
Full outer join pedido p on c.cod_cliente = p.cod_cliente
Where c.Cod_cliente is null or p.cod_cliente is null

Select f.primeiro_nome, f.salario, s.nome_setor
from Funcionario f
Cross join Setor s
Order by f.primeiro_nomeSelect c.nome_cliente, p.num_pedido
from cliente c
Cross join pedido p
Order by c.Nome_cliente

use FBD

Select min(salario_fixo) as 'MENOR SALARIO', max(salario_fixo)
from vendedor;

Select sum (quantidade)
from item_pedido
where cod_produto = 3

select AVG(salario_fixo) as media_salario
from vendedor;

select count(*) from vendedor
where salario_fixo > 2500.00

Select num_pedido, total_produtos = count(*)
from item_pedido
group by num_pedido

select num_pedido, total_produtos = count(*)
from item_pedido
where quantidade > 5
group by num_pedido
having count(*) > 1 

select * from produto

update produto
set Valor_unitario = 4.00
Where descricao = 'alface'

update produto
set Valor_unitario = Valor_unitario * 1.025
where Valor_unitario < 
	(select AVG(valor_unitario)
	from produto
	where Unidade = 'KG')

delete from vendedor
	where faixa_comissao is null