/* 1 */
SELECT PRIMEIRO_NOME, ULTIMO_NOME, SALARIO
FROM Funcionario
WHERE Salario > 2500.00;

/* 2 */
SELECT PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR 
FROM Funcionario
Where NRMATRICULA = 7;

/* 3 */
SELECT PRIMEIRO_NOME, ULTIMO_NOME, SALARIO 
FROM Funcionario
Where Salario <= 1500 OR Salario >= 3000;

/* 4 */
SELECT PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR, DATA_ADMISSAO
FROM Funcionario
Where DATA_ADMISSAO >= 2009 
Order by DATA_ADMISSAO;

/* 5 */
SELECT PRIMEIRO_NOME, ULTIMO_NOME, COD_SETOR
FROM Funcionario
Where COD_SETOR = 3 OR COD_SETOR = 2
Order by COD_SETOR;

/* 6 */
SELECT PRIMEIRO_NOME
FROM Funcionario
where SUBSTRING(PRIMEIRO_NOME, 2, 1) = 'a'
/* 6 */
SELECT PRIMEIRO_NOME
FROM Funcionario
where PRIMEIRO_NOME like '_a%'

/* 7 */
SELECT PRIMEIRO_NOME
FROM Funcionario
where PRIMEIRO_NOME like '%a%' OR PRIMEIRO_NOME like '%e%'

/* 8 */
SELECT *
FROM Funcionario
where COD_SETOR = 2
Order by PRIMEIRO_NOME

/* 9 */
SELECT *
FROM Funcionario
where COD_SETOR IN (2, 5);

/* 10 */
SELECT *
FROM Funcionario
where SALARIO > 2300 AND COD_SETOR = 3

Select * from Funcionario
Select * from Setor

SELECT PRIMEIRO_NOME + ' ' + ULTIMO_NOME + ', ' + CAST(COD_SETOR AS VARCHAR) AS 'Empregado e Setor'
FROM Funcionario;

Select GETDATE();

Select DATEADD(day, 3, getdate());
Select DATEADD(MINUTE, 85, getdate());

Select DATENAME(MONTH, GETDATE());

Select CONVERT(char, getdate(), 103);

Select DATENAME(Month, (Dateadd(Month, 3, getdate())));

