use subconsulta;

-- Exemplo 1 - Trigger --

CREATE TRIGGER trg_PreventCategoriaDeletion
ON Categoria
INSTEAD OF DELETE
AS
BEGIN
IF EXISTS (SELECT 1 FROM Produto WHERE Produto.CategoriaID IN (SELECT
DELETED.CategoriaID FROM DELETED))
BEGIN
RAISERROR ('Não é possível excluir categorias associadas a produtos.', 16, 1)
ROLLBACK TRANSACTION
END
ELSE
DELETE FROM Categoria WHERE Categoria.CategoriaID IN (SELECT
DELETED.CategoriaID FROM DELETED)
END

SELECT * FROM Categoria

delete from Categoria where CategoriaID = 2;

INSERT INTO Categoria (CategoriaID, NomeCategoria) VALUES (13, 'Games');

Delete from Categoria where CategoriaID = 13;

-- Exemplo 2 - Trigger --

CREATE TABLE LogPreco (
ProdutoID INT,
NovoPreco decimal(10,2),
DataAlteracao DATE );

CREATE TRIGGER trg_LogPrecoAlterado
ON Produto
AFTER UPDATE
AS
BEGIN
INSERT INTO LogPreco (ProdutoID, NovoPreco, DataAlteracao)
SELECT ProdutoID, Preco, GETDATE()
FROM inserted
END

UPDATE Produto set Preco = 4100 where Produtoid = 1Select * from LogPreco-- Exemplo 3 - Trigger --
CREATE TRIGGER trg_LimitePreco
ON Produto
INSTEAD OF INSERT
AS
BEGIN
IF EXISTS (SELECT 1 FROM inserted WHERE Preco > 10000)
BEGIN
RAISERROR ('O preço do produto não pode exceder $10.000.', 16, 1)
ROLLBACK TRANSACTION
END
ELSE
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
SELECT ProdutoID, NomeProduto, CategoriaID, Preco
FROM inserted
END

Insert Into Produto Values (14,'Ultrabook', 8, 15800) 

-- Exemplo 1 - Procedures --

CREATE PROC consulta_produto
AS
SELECT * FROM produto
WHERE nomeproduto like '%a%'

EXEC consulta_produto;

-- Exemplo 1: Procedure para inserir um novo produto: Cria uma Procedure para adicionar um novo produto à tabela de Produtos. --
CREATE PROCEDURE InserirNovoProduto
@IDProd INT,
@Nome NVARCHAR(50),
@CategoriaID INT,
@Preco DECIMAL(10,2)
AS
BEGIN
INSERT INTO Produto (Produtoid, NomeProduto, CategoriaID, Preco)
VALUES (@IDProd, @Nome, @CategoriaID, @Preco)
END

-- Na execução:

EXEC InserirNovoProduto 14, 'SmartWatch', 1, 2200;

SELECT * FROM Produto;

delete from Produto where ProdutoID = 14

-- Exemplo 2: Procedure para atualizar o preço de um produto: Cria uma Procedure para atualizar o preço de um produto.

CREATE PROCEDURE AtualizarPrecoProduto
@ProdutoID INT,
@NovoPreco DECIMAL(10,2)
AS
BEGIN
UPDATE Produto
SET Preco = @NovoPreco
WHERE ProdutoID = @ProdutoID
END

-- Na execução:

-- EXEC AtualizarPrecoProduto 14, 2500 ou
EXEC AtualizarPrecoProduto @ProdutoID = 14, @NovoPreco = 2500

--Para consultar: 

SELECT * FROM Produto

-- Exemplo 3: Procedure para listar produtos por categoria: Cria uma Procedure para retornar todos os produtos de uma determinada categoria.

CREATE PROCEDURE ListarProdutosPorCategoria
@Categoria NVARCHAR(50)
AS
BEGIN
SELECT ProdutoID, NomeProduto, Preco
FROM Produto
WHERE CategoriaID = (SELECT CategoriaID FROM Categoria
WHERE NomeCategoria = @Categoria)
END

-- Na execução:

EXEC ListarProdutosPorCategoria 'Roupas';

-- Exemplo 3: Procedure para calcular o valor total do pedido: Cria uma Procedure para calcular e retornar o valor total de um pedido. -- 

CREATE PROCEDURE CalcularValorTotalPedido
@PedidoID INT
AS
BEGIN
SELECT ValorTotal = SUM(Preco)
FROM Produto
WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido
WHERE PedidoID = @PedidoID)
END

-- Na execução:

EXEC CalcularValorTotalPedido @PedidoId = 8 
--ou 
--EXEC CalcularValorTotalPedido 8