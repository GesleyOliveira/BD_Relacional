select num_pedido, cod_produto, quantidade
from item_pedido
where quantidade = 45

CREATE TABLE Setor (
    COD_SETOR INT PRIMARY KEY,
    NOME_SETOR VARCHAR(30)
);

CREATE TABLE Funcionario (
    NRMATRICULA INT PRIMARY KEY,
    PRIMEIRO_NOME VARCHAR(20),
    ULTIMO_NOME VARCHAR(50),
    EMAIL VARCHAR(200),
    TELEFONE VARCHAR(20),
    DATA_ADMISSAO DATETIME,
    SALARIO FLOAT,
    COD_SETOR INT,
    FOREIGN KEY (COD_SETOR) REFERENCES Setor(COD_SETOR)
);

INSERT INTO Setor (COD_SETOR, NOME_SETOR)
VALUES
(1, 'Vendas'),
(2, 'Recursos Humanos'),
(3, 'TI'),
(4, 'Marketing'),
(5, 'Contabilidade');

INSERT INTO Funcionario (NRMATRICULA, PRIMEIRO_NOME, ULTIMO_NOME, EMAIL, TELEFONE, DATA_ADMISSAO, SALARIO, COD_SETOR)
VALUES
(1, 'João', 'Silva', 'joao@email.com', '32456785', '15-01-2023', 5000.00, 3),
(2, 'Gesley', 'Oliveira', 'geeh.oliveira@hotmail.com', '998171903', '2018-01-01', 4000.00, 3)
(3, 'Pedro', 'Oliveira', 'pedro@email.com', '555-1234', '2023-03-10', 4800.00, 1),
(4, 'Ana', 'Gomes', 'ana@email.com', '777-8888', '2022-09-05', 6000.00, 3),
(5, 'Luiz', 'Ferreira', 'luiz@email.com', '333-9999', '2022-08-12', 5200.00, 4),
(6, 'Marta', 'Ribeiro', 'marta@email.com', '111-2222', '2022-25-07', 4700.00, 2),
(7, 'Carlos', 'Rodrigues', 'carlos@email.com', '222-1111', '2023-28-02', 5300.00, 1),
(8, 'Isabela', 'Pereira', 'isabela@email.com', '999-8888', '2022-12-10', 5900.00, 5);

select * from Funcionario;

SELECT DISTINCT COD_SETOR FROM Funcionario;

SELECT ULTIMO_NOME + ', ' + CAST(COD_SETOR AS VARCHAR) AS 'Empregado e Setor'
FROM Funcionario;

