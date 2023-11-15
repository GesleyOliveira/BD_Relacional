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

/* Exemplo 1: Usando DECLARE e SET Neste exemplo, vamos declarar uma variável chamada @MinPreco para armazenar o preço
mínimo de produtos em uma categoria específica. A variável será definida usando o comando
SET e depois usada em uma consulta.*/

DECLARE @MinPreco DECIMAL(10, 2); -- Declaração da variável
SET @MinPreco = 50; -- Definição do valor da variável
-- Consulta usando a variável
SELECT NomeProduto, Preco
FROM Produto
WHERE Preco >= @MinPreco;

/* Exemplo 2: Usando DECLARE e SELECT Vamos declarar uma variável chamada 
@TotalPedidos para armazenar o número total de pedidos em nossa tabela de pedidos. 
A variável será definida usando o comando SELECT com uma consulta que calcula o total de pedidos.*/

DECLARE @TotalPedidos INT; -- Declaração da variável
-- Definição do valor da variável usando SELECT
SELECT @TotalPedidos = COUNT(*)
FROM Pedido;
-- Exibindo o valor da variável
PRINT 'O total de pedidos é: ' + CAST(@TotalPedidos AS NVARCHAR(10));

/*Exemplo 3: Usando DECLARE e SET para calcular média
Neste exemplo, vamos declarar uma variável chamada @MediaPreco para calcular a média de
preços de produtos em uma categoria específica e, em seguida, usá-la em uma consulta.*/

DECLARE @MediaPreco DECIMAL(10, 2); -- Declaração da variável
SET @MediaPreco = (
SELECT AVG(Preco)
FROM Produto
WHERE CategoriaID = 1
);
-- Exibindo o valor da variável
PRINT 'A média de preço na categoria de Eletrônicos é: ' + CAST(@MediaPreco AS
NVARCHAR(10));

/*Exemplo 4: Usando DECLARE e SELECT para obter o nome do produto mais
caro
Neste exemplo, vamos declarar uma variável chamada @ProdutoMaisCaro para armazenar o
nome do produto mais caro na tabela de produtos.*/

DECLARE @ProdutoMaisCaro NVARCHAR(50); -- Declaração da variável
-- Definição do valor da variável usando SELECT
SELECT TOP 1 @ProdutoMaisCaro = NomeProduto
FROM Produto
ORDER BY Preco DESC;
-- Exibindo o valor da variável
PRINT 'O produto mais caro é: ' + @ProdutoMaisCaro;

