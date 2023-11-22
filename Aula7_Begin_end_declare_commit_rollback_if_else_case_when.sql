use SUBCONSULTA;


-- Exemplo 1 - Commit --

BEGIN TRANSACTION;
-- Aumenta os pre�os de todos os produtos em 10%
UPDATE Produto
SET Preco = Preco * 1.1;
-- Confirma a transa��o
COMMIT;

-- Exemplo 2 --

BEGIN TRANSACTION;
-- Insere novas categorias
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES (11, 'Decora��o'),
(12, 'Autom�veis');
-- Insere novos produtos nas novas categorias
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES (11, 'Vaso Decorativo', 11, 30),
(12, 'Pneu de Carro', 12, 100);
-- Confirma a transa��o
COMMIT;

-- Exemplo 1 - Rollback --

BEGIN TRANSACTION;
-- Inserindo dados incorretos
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES (11, 'Produto Errado', 100, 9999);
-- Detectou um erro, ent�o desfaz as opera��es
ROLLBACK;

-- Exemplo 2 - Rollback --

BEGIN TRANSACTION;
-- Atualiza��o com erro
UPDATE Produto SET CategoriaID = 100 WHERE ProdutoID = 3;
-- Detectou um erro, ent�o desfaz as opera��es
ROLLBACK;

-- Exemplo 3 - Rollback e Commit --

BEGIN TRANSACTION;
-- Atualiza��o com erro
UPDATE Produto SET CategoriaID = 100 WHERE ProdutoID = 3;
IF @@ERROR = 0
COMMIT
ELSE
ROLLBACK; -- Detectou um erro, ent�o desfaz as opera��es
PRINT 'Atualiza��o na Tabela Produto foi Cancelada';

--  Exemplo 1: Categoriza��o de Pre�os de Produtos - USO DO CASE, WHEN, ELSE END --

SELECT NomeProduto, Preco,
CASE
WHEN Preco < 100 THEN 'Barato'
WHEN Preco >= 100 AND Preco < 1000 THEN 'M�dio'
ELSE 'Caro'
END AS CategoriaPreco
FROM Produto;

-- Exemplo 2: Definir Desconto com Base na Categoria --

SELECT NomeProduto, CategoriaID, Preco,
CASE CategoriaID
WHEN 1 THEN Preco * 0.9 -- Categoria Eletr�nicos (10% de desconto)
WHEN 2 THEN Preco * 0.95 -- Categoria Roupas (5% de desconto)
ELSE Preco
END AS PrecoComDesconto
FROM Produto;

-- Exemplo 3: Convers�o de Valores de Categoria --
-- Voc� pode usar o CASE para converter valores de categoria em nomes mais leg�veis.
SELECT ProdutoID, CategoriaID,
CASE CategoriaID
WHEN 1 THEN 'Eletr�nicos'
WHEN 2 THEN 'Roupas'
WHEN 3 THEN 'Alimentos'
ELSE 'Desconhecida'
END AS NomeCategoria
FROM Produto;

-- Exemplo 4: Classifica��o Condicional de Pedidos --
-- Voc� pode usar o CASE para classificar pedidos com base na data de pedido.
SELECT PedidoID, DataPedido,
CASE
WHEN DataPedido < '2023-06-01' THEN 'Antigo'
ELSE 'Novo'
END AS StatusPedido
FROM Pedido;

-- Exemplo 1: Inser��o de Dados Condicional --

/*Voc� pode usar o comando IF para inserir novos registros em uma tabela com base
em uma condi��o. Neste exemplo inserimos um novo produto apenas se a
categoria desejada for igual a 1.*/

DECLARE @CategoriaDesejada INT = 1; -- Categoria desejada
IF @CategoriaDesejada = 1
BEGIN
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES (13, 'Tablet', @CategoriaDesejada, 1500);
END

-- Exemplo 2: Exibi��o de Resultados Condicional

/*Voc� pode usar o comando IF para exibir resultados condicionalmente com base em uma
condi��o. Neste exemplo exibimos os resultados somente se a vari�vel @ExibirResultados
for igual a 1.*/

DECLARE @ExibirResultados INT = 1; -- 1 para exibir resultados, 0 para n�o exibir
IF @ExibirResultados = 1
BEGIN
SELECT ProdutoID, NomeProduto, CategoriaID, Preco
FROM Produto;
END

-- Exemplo 3: Exibi��o de Categorias com ELSE

/*Neste exemplo, exibiremos o nome da categoria se existir ou uma mensagem padr�o se a
categoria n�o for encontrada.*/

DECLARE @CategoriaID INT = 1; -- Categoria desejada
DECLARE @NomeCategoria NVARCHAR(50);
IF EXISTS (SELECT * FROM Categoria WHERE CategoriaID = @CategoriaID)
BEGIN
SELECT @NomeCategoria = NomeCategoria FROM Categoria WHERE
CategoriaID = @CategoriaID;
PRINT 'Nome da Categoria: ' + @NomeCategoria;
END
ELSE
BEGIN
PRINT 'Categoria n�o encontrada.';
END

-- Exemplo 1: Suponha que voc� deseje incrementar o valor de um campo em cada linha de uma tabela.
DECLARE @Counter INT
SET @Counter = 1
WHILE @Counter <= 10
BEGIN
UPDATE Produto
SET Preco = Preco + 100
WHERE ProdutoID = @Counter
SET @Counter = @Counter + 1
END

-- Exemplo 2: Atualiza��o condicional em um loop, verificando condi��es em uma tabela.

DECLARE @Contador INT
SET @Contador = 1
WHILE @Contador <= (SELECT COUNT(*) FROM Produto)
BEGIN
DECLARE @PrecoAtual DECIMAL(10, 2)
SELECT @PrecoAtual = Preco FROM Produto WHERE ProdutoID = @Contador --Seleciona o pre�o do Produto
IF @PrecoAtual > 1000 --Caso o valor do produto seja maior do 1000
BEGIN
UPDATE Produto
SET Preco = Preco * 1.1 --Aumenta em 10%
WHERE ProdutoID = @Contador
END
SET @Contador = @Contador + 1
END

-- Exemplo 3: Utiliza��o do loop para processar registros em uma tabela baseada em uma condi��o.
DECLARE @PedidoDate DATE
SET @PedidoDate = '2023-01-01'
WHILE @PedidoDate <= '2023-10-31'
BEGIN
SELECT * FROM Pedido WHERE DataPedido = @PedidoDate
SET @PedidoDate = DATEADD(DAY, 1, @PedidoDate)
END