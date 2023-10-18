use FBD

SELECT DATENAME (YY, GETDATE())
SELECT DATENAME (MONTH, GETDATE())

select DATEPART (MM, GETDATE())
select DATEPART (MONTH, GETDATE())

select month(getdate())

select YEAR(getdate())

select DATEDIFF (yy, getdate(), getdate()+365)
select DATEDIFF (dd, getdate(), '17-10-2025')

select DATEDIFF (dd, '27-03-1994', '17-10-2023')

select dateadd(yy, 1, getdate())
select datename(month,(dateadd(month,3,getdate())))

select ISDATE('27-02-2023');
select ISDATE('31-04-2023');

select convert(char,getdate(),103) /*converte a data do sistema, para o formato de data dd-mm-aaaa*/
select convert(char,getdate(),113) /*converte a data do sistema, para o formato de data dd-mm-aaaa hh:mm:ss:mil*/

select round(123.3467, 3);
select round(123.3467, 2);
select round(123.3467, 1);
select round(123.5467, 1);
select round(123.3467, 0);
select round(123.3467, -1);
select round(123.3467, -2);
select round(123.3467, -3);

select floor(123.45);

select power(4,2); /*Potência*/
select power(2,2);

Select ASCII('A'), ASCII('AMANDA')

Select Char(65), char(66)

Select CHARINDEX('Mundo','Ola Mundo Bonito');
Select CHARINDEX('Mundo','Ola Mundo Bonito', 3);
Select CHARINDEX('Mundo','Ola Mundo Bonito', 6);

Select Replace('abcdefghicde','cde','xxx');
Select Replace(PRIMEIRO_NOME,'A','X') FROM Funcionario;

Select STUFF('abcdef', 2, 3, '_ijklmn_');

Select LEFT('abcdefgh',5);
Select RIGHT('abcdefgh',5);

Select REPLICATE('ABC',3);
Select REPLICATE('ABCDEFGHIJ',300);

Select len('ABCD')
Select len('ABCD  ')

SELECT REVERSE('ABCD')

Select lower('AbCD')
Select Lower(PRIMEIRO_NOME) FROM Funcionario;

Select UPPER('AbCD')
Select UPPER(PRIMEIRO_NOME) FROM Funcionario;

Select '_' + LTRIM(' AbCD ') + '_'