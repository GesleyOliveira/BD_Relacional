use BD_EXERCICIOS

/*1.Mostre uma lista com o c�digo de cada filme que j� foi alugado e a quantidade de vezes que foi alugado.*/
SELECT COD_FILME, COUNT(*) AS QUANTIDADE_ALUGUEIS
FROM LOCACOES
GROUP BY COD_FILME;


/*2. Mostre o nome e a data de devolu��o de todos os filmes de A��o cujo diretor seja Richard Donner que foram alugados pelo cliente Edson Martin Feitosa.*/
SELECT F.FILME, L.DATA_DEVOLUCAO
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
WHERE C.NOME_CATEGORIA = 'A��o'
  AND F.DIRETOR = 'Richard Donner'
  AND CLI.NOME = 'Edson Martin Feitosa';

/*3. Mostre o nome do filme, seu valor de loca��o, um campo chamado desconto onde deve aparecer o valor de 10% de desconto em cima do valor de loca��o e um campo chamado valor_final que deve possuir valor de loca��o menos os dez por cento de desconto dado.*/
SELECT FILME, VALOR_LOCACAO, 
       0.1 * VALOR_LOCACAO AS DESCONTO,
       VALOR_LOCACAO - (0.1 * VALOR_LOCACAO) AS VALOR_FINAL
FROM FILME;

/*4. Mostre sem repeti��o de registros, todos os filmes alugados por clientes da cidade de Votorantim.*/
SELECT DISTINCT F.FILME
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
WHERE CLI.CIDADE = 'Votorantim';

/*5. Mostre qual filme foi alugado hoje.*/
SELECT F.FILME
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE CONVERT(DATE, L.DATA_RETIRADA) = CONVERT(DATE, GETDATE());

/*6. Mostre quanto � locadora lucrou com as loca��es do filme �A vida � bela�.*/
SELECT SUM(F.VALOR_LOCACAO) AS LUCRO
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE F.FILME = 'A vida � bela';

/*7. Mostre a quantidade de sa�das de filmes para loca��o agrupando a consulta por diretor.*/
SELECT F.DIRETOR, COUNT(*) AS QUANTIDADE_SAIDAS
FROM FILME F
JOIN LOCACOES L ON F.COD_FILME = L.COD_FILME
GROUP BY F.DIRETOR;

/*8. Mostre todas as categorias dos filmes alugados pela cliente Maria Chiquinha.*/
SELECT DISTINCT C.NOME_CATEGORIA
FROM LOCACOES L
JOIN FILME F ON L.COD_FILME = F.COD_FILME
JOIN CATEGORIA C ON F.COD_CATEGORIA = C.COD_CATEGORIA
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
WHERE CLI.NOME = 'Maria Chiquinha';

/*9. Mostre o nome e o telefone de todos os clientes que j� alugaram o filme Constantine.*/
SELECT CLI.NOME, CLI.TELEFONE
FROM LOCACOES L
JOIN CLIENTES CLI ON L.COD_CLIENTE = CLI.COD_CLIENTE
JOIN FILME F ON L.COD_FILME = F.COD_FILME
WHERE F.FILME = 'Constantine';

/*10. Mostre todas as categorias de filmes que n�o possuem filmes cadastrado*/
SELECT NOME_CATEGORIA
FROM CATEGORIA
WHERE COD_CATEGORIA NOT IN (SELECT DISTINCT COD_CATEGORIA FROM FILME);
