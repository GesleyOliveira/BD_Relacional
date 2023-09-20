Select NRMATRICULA, PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR
from Funcionario
where COD_SETOR = 3

SELECT * FROM Setor;

Select PRIMEIRO_NOME, SALARIO from Funcionario where SALARIO > 1500;

Select PRIMEIRO_NOME, SALARIO from Funcionario where SALARIO between 5200 and 5600;

Select cod_produto, descricao from produto where Valor_unitario between 0.32 and 2.00;

Select PRIMEIRO_NOME, SALARIO, COD_SETOR from Funcionario where PRIMEIRO_NOME like '%k%';

Select cod_produto, descricao, Unidade from produto where Unidade like '%k%';

Select PRIMEIRO_NOME from Funcionario where PRIMEIRO_NOME like '%E_';

Select nome_vendedor from vendedor where faixa_comissao in ('A', 'B');

Select PRIMEIRO_NOME, SALARIO, COD_SETOR from Funcionario where COD_SETOR in (1,2,3);

Select * from cliente where IE is not null;

Select PRIMEIRO_NOME, SALARIO, COD_SETOR from Funcionario where EMAIL is not null;

Select NRMATRICULA, ULTIMO_NOME, SALARIO from Funcionario where SALARIO > 1000 and NRMATRICULA >= 3;

Select * from Funcionario where SALARIO > 2000 or COD_SETOR = 1;

Select nome_vendedor, salario_fixo from vendedor order by nome_vendedor;

Select nome_vendedor, salario_fixo from vendedor order by nome_vendedor desc;

Select * from Funcionario f 