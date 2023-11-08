CREATE DATABASE SUBCONSULTA;
go
use SUBCONSULTA;

-- Criação das tabelas
CREATE TABLE Categoria (
    CategoriaID INT PRIMARY KEY,
    NomeCategoria NVARCHAR(50)
);

CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY,
    NomeProduto NVARCHAR(50),
    CategoriaID INT,
	Preco decimal(10,2),
    FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
);

CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    DataPedido DATE,
    ProdutoID INT,
    FOREIGN KEY (ProdutoID) REFERENCES Produto(ProdutoID)
);

-- Inserção de dados nas tabelas
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (1, 'Eletrônicos'),
    (2, 'Roupas'),
    (3, 'Alimentos');

INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (1, 'Smartphone', 1, 4000),
    (2, 'Camiseta', 2, 50);


INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (1, '2023-01-15', 1),
    (2, '2023-02-20', 2);
  
-- Tabela Categoria
INSERT INTO Categoria (CategoriaID, NomeCategoria)
VALUES
    (4, 'Móveis'),
    (5, 'Livros'),
    (6, 'Jogos'),
    (7, 'Cosméticos'),
    (8, 'Informatica'),
    (9, 'Esportes'),
    (10, 'Brinquedos');

-- Tabela Produto
INSERT INTO Produto (ProdutoID, NomeProduto, CategoriaID, Preco)
VALUES
    (3, 'Sofá', 4, 2000),
    (4, 'Livro de Romance', 5, 40),
    (5, 'Xbox', 6, 2500),
    (6, 'Perfume', 7, 80),
    (7, 'Laptop', 8, 7000),
    (8, 'Bola de Futebol', 9, 20),
    (9, 'Quebra-Cabeça', 10, 120),
    (10, 'Chapéu', 2, 200);

-- Tabela Pedido
INSERT INTO Pedido (PedidoID, DataPedido, ProdutoID)
VALUES
    (3, '2023-03-10', 5),
    (4, '2023-04-05', 2),
    (5, '2023-05-12', 7),
    (6, '2023-06-25', 1),
    (7, '2023-07-03', 10),
    (8, '2023-08-18', 3),
    (9, '2023-09-09', 8),
    (10, '2023-10-22', 4);


/*Exemplo 1*/
SELECT NomeProduto FROM Produto
WHERE Preco > ALL (SELECT Preco FROM Produto Where NomeProduto = 'Chapéu');

/*Exemplo 2*/
SELECT NomeProduto
FROM Produto
WHERE Preco > ALL (SELECT Preco FROM Produto
	WHERE CategoriaID = (SELECT CategoriaID FROM Categoria
		WHERE NomeCategoria = 'Eletrônicos'));

/*Exemplo 3*/
SELECT NomeProduto
FROM Produto
WHERE Preco < ANY (SELECT Preco FROM Produto WHERE CategoriaID = 1);

/*Exemplo 4*/
SELECT NomeProduto
FROM Produto
WHERE Preco < SOME (SELECT Preco FROM Produto WHERE CategoriaID = 1);/*Exemplo 5*/SELECT NomeProduto
FROM Produto
WHERE EXISTS (SELECT * FROM Pedido
WHERE Pedido.ProdutoID = Produto.ProdutoID);/*Exemplo 6*/SELECT NomeProduto
FROM Produto
WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido WHERE PedidoID IN (1, 3));

/*1. Listar os nomes dos produtos que pertencem à categoria 'Eletrônicos':*/
SELECT NomeProduto
FROM Produto
WHERE CategoriaID = (SELECT CategoriaID FROM Categoria
WHERE NomeCategoria = 'Eletrônicos');

/*2. Listar os nomes dos produtos comprados em pedidos realizados em janeiro de 2023:*/
SELECT NomeProduto
FROM Produto
WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido
WHERE YEAR(DataPedido) = 2023 AND MONTH(DataPedido) = 1);

/*3. Listar os nomes das categorias que possuem produtos com preços acima de
100 reais:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 100);/*4. Listar os nomes de produtos que ainda não foram pedidos*/
SELECT NomeProduto
FROM Produto
WHERE ProdutoID NOT IN (SELECT ProdutoID FROM Pedido);

/*5. Listar os nomes dos produtos que foram comprados em algum pedido:*/
SELECT NomeProduto
FROM Produto
WHERE ProdutoID IN (SELECT ProdutoID FROM Pedido);/*6. Listar os nomes das categorias que têm pelo menos 2 produtos:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto GROUP BY
CategoriaID HAVING COUNT(*) >= 2);/*7. Listar os nomes dos produtos que pertencem a categorias cujos nomes começam
com 'E':*/
SELECT NomeProduto
FROM Produto
WHERE CategoriaID IN (SELECT CategoriaID FROM Categoria
WHERE NomeCategoria LIKE 'E%');/*8. Listar os nomes das categorias que têm produtos comprados em pedidos realizados
em 2023:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE ProdutoID IN (SELECT
ProdutoID FROM Pedido WHERE YEAR(DataPedido) = 2023));/*9. Listar os nomes dos produtos cujo preço é o mais alto entre todos os
produtos:*/
SELECT NomeProduto
FROM Produto
WHERE Preco = (SELECT MAX(Preco) FROM Produto);/*10. Listar os nomes dos produtos que não foram comprados em pedidos
realizados em janeiro de 2023:*/
SELECT NomeProduto
FROM Produto
WHERE ProdutoID NOT IN (SELECT ProdutoID FROM Pedido WHERE
YEAR(DataPedido) = 2023 AND MONTH(DataPedido) = 1);/*11. Listar todos os pedidos de produtos da categoria 'Eletrônicos'*/
SELECT p.PedidoID, p.DataPedido
FROM Pedido p
WHERE p.ProdutoID IN (SELECT ProdutoID FROM Produto WHERE CategoriaID = 1);/*12. Listar os nomes dos produtos e suas categorias em pedidos*/
SELECT pr.NomeProduto, c.NomeCategoria
FROM Produto pr
JOIN Categoria c ON pr.CategoriaID = c.CategoriaID
WHERE pr.ProdutoID IN (SELECT ProdutoID FROM Pedido);

/*13. Contar o número de produtos em cada categoria*/
SELECT c.NomeCategoria, (SELECT COUNT(*) FROM Produto
WHERE CategoriaID = c.CategoriaID) AS NumeroProdutos
FROM Categoria c;/*14. Listar os produtos em pedidos feitos em fevereiro de 2023*/
SELECT pr.NomeProduto
FROM Produto pr
WHERE pr.ProdutoID IN (SELECT ProdutoID FROM Pedido WHERE
MONTH(DataPedido) = 2 AND YEAR(DataPedido) = 2023);

/*Exemplo 1: UNION
Suponha que queremos listar todas as categorias que têm produtos com preços acima de 1000 ou
produtos que foram pedidos. Podemos usar UNION para fazer isso:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 1000)
UNION
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT Produto.CategoriaID FROM Produto JOIN Pedido
ON Produto.ProdutoID = Pedido.ProdutoID);

/*Exemplo 2: UNION ALL
Suponha que agora queremos listar todos os nomes de produtos que custam menos de 100 ou
produtos que custam mais de 1000. Podemos usar UNION ALL para fazer isso e incluir todos os
produtos, mesmo que haja produtos duplicados:*/
SELECT NomeProduto
FROM Produto
WHERE Preco < 100
UNION ALL
SELECT NomeProduto
FROM Produto
WHERE Preco > 1000;

/*Exemplo 1: INTERSECT
Suponha que queremos encontrar todas as categorias que têm produtos com preços superiores a 1000 e
que também têm produtos pedidos. Podemos usar INTERSECT para fazer isso:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 1000)
INTERSECT
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT Produto.CategoriaID FROM Produto JOIN Pedido ON
Produto.ProdutoID = Pedido.ProdutoID);

/*Exemplo 2: EXCEPT
Suponha que agora queremos encontrar todas as categorias que têm produtos com preços superiores a
100, mas que não têm produtos pedidos. Podemos usar EXCEPT para fazer isso:*/
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT CategoriaID FROM Produto WHERE Preco > 100)
EXCEPT
SELECT NomeCategoria
FROM Categoria
WHERE CategoriaID IN (SELECT Produto.CategoriaID FROM Produto JOIN Pedido ON
Produto.ProdutoID = Pedido.ProdutoID);

