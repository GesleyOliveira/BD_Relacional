CREATE view ProdutosCaros AS
Select NomeProduto, Preco
From Produto
Where Preco > 1000;

Select * from ProdutosCaros

CREATE VIEW ProdutosMaisCarosPorCategoria 
AS 
SELECT Categoria.NomeCategoria, Produto.NomeProduto, Produto.Preco 
FROM Categoria INNER JOIN Produto ON Categoria.CategoriaID = Produto.CategoriaID
WHERE Produto.Preco = ( SELECT MAX(Preco) FROM Produto AS P
WHERE P.CategoriaID = Categoria.CategoriaID);

GO

SELECT * FROM ProdutosMaisCarosPorCategoria;

Drop view ProdutosMaisCarosPorCategoria 

/* Exemplo 1: Usando DECLARE e SET Neste exemplo, vamos declarar uma vari�vel chamada @MinPreco para armazenar o pre�o
m�nimo de produtos em uma categoria espec�fica. A vari�vel ser� definida usando o comando
SET e depois usada em uma consulta.*/

DECLARE @MinPreco DECIMAL(10, 2); -- Declara��o da vari�vel
SET @MinPreco = 50; -- Defini��o do valor da vari�vel
-- Consulta usando a vari�vel
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco >= @MinPreco;

/* Exemplo 2: Usando DECLARE e SELECT Vamos declarar uma vari�vel chamada 
@TotalPedidos para armazenar o n�mero total de pedidos em nossa tabela de pedidos. 
A vari�vel ser� definida usando o comando SELECT com uma consulta que calcula o total de pedidos.*/

DECLARE @TotalPedidos INT; -- Declara��o da vari�vel
-- Defini��o do valor da vari�vel usando SELECT
SELECT @TotalPedidos = COUNT(*)
FROM Pedido;
-- Exibindo o valor da vari�vel
PRINT 'O total de pedidos �: ' + CAST(@TotalPedidos AS NVARCHAR(10));

/*Exemplo 3: Usando DECLARE e SET para calcular m�dia
Neste exemplo, vamos declarar uma vari�vel chamada @MediaPreco para calcular a m�dia de
pre�os de produtos em uma categoria espec�fica e, em seguida, us�-la em uma consulta.*/

DECLARE @MediaPreco DECIMAL(10, 2); -- Declara��o da vari�vel
SET @MediaPreco = (
SELECT AVG(Preco)
FROM Produto
WHERE CategoriaID = 1
);
-- Exibindo o valor da vari�vel
PRINT 'A m�dia de pre�o na categoria de Eletr�nicos �: ' + CAST(@MediaPreco AS
NVARCHAR(10));

/*Exemplo 4: Usando DECLARE e SELECT para obter o nome do produto mais
caro
Neste exemplo, vamos declarar uma vari�vel chamada @ProdutoMaisCaro para armazenar o
nome do produto mais caro na tabela de produtos.*/

DECLARE @ProdutoMaisCaro NVARCHAR(50); -- Declara��o da vari�vel
-- Defini��o do valor da vari�vel usando SELECT
SELECT TOP 1 @ProdutoMaisCaro = NomeProduto
FROM Produto
ORDER BY Preco DESC;
-- Exibindo o valor da vari�vel
PRINT 'O produto mais caro �: ' + @ProdutoMaisCaro;

