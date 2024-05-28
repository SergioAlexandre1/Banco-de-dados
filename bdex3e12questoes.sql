#1. Exibir todas as informações da tabela `USUARIOS`.

SELECT * FROM USUARIOS;
#2. Mostrar os nomes, sobrenomes e e-mails de todos os usuários.

DESC USUARIOS;
SELECT concat_ws(' ', NOME_USUARIO, SOBRENOME) AS NOME_COMPLETO, EMAIL
FROM USUARIOS;
#3. Listar os nomes e descrições de todos os grupos.

SELECT NOME_GRUPO, DESCRICAO
FROM GRUPOS;
#4. Exibir os detalhes das postagens: ID da postagem, texto, data e hora, e o nome do usuário que postou.

SELECT POST.ID_POST, POST.TEXTO, POST.DATA_HORA,
concat_ws(' ', USER.NOME_USUARIO, USER.SOBRENOME) AS USUARIO
FROM POSTAGENS POST
JOIN USUARIOS USER
ON POST.USUARIO = USER.ID_USUARIO;
#5. Listar o nome dos usuários e a quantidade de postagens que cada um fez.

SELECT 
concat_ws(' ', USER.NOME_USUARIO, USER.SOBRENOME) AS USUARIO,
COUNT(POST.ID_POST) AS POSTS
FROM POSTAGENS AS POST
RIGHT JOIN USUARIOS AS USER
ON POST.USUARIO = USER.ID_USUARIO
GROUP BY USUARIO;
#6. Mostrar os nomes dos usuários que fizeram comentários em 2024.
SELECT
concat_ws(' ', USER.NOME_USUARIO, USER.SOBRENOME) AS USUARIO,
COUNT(COM.ID_COMENTARIO) AS QTDE_COMENTARIOS
FROM COMENTARIOS AS COM
RIGHT JOIN USUARIOS AS USER
ON COM.USUARIO = USER.ID_USUARIO
WHERE YEAR(COM.DATAHORA) = 2024
GROUP BY USUARIO;
#7. Listar todos os grupos, ordenados pelo nome do grupo de A a Z.
DESC GRUPOS;
SELECT NOME_GRUPO
FROM GRUPOS
ORDER BY NOME_GRUPO;
#8. Mostrar os nomes dos grupos que têm a palavra "Tecnologia" na descrição.
SELECT NOME_GRUPO
FROM GRUPOS
WHERE DESCRICAO LIKE '%TECNOLOGIA';

#9. Exibir os detalhes dos comentários: ID do comentário, texto, data e hora, nome do usuário que comentou e ID da postagem comentada.
DESC COMENTARIOS;
SELECT 
COM.ID_COMENTARIO, COM.TEXTO, COM.DATAHORA, USER.NOME_USUARIO, POST.ID_POST
FROM COMENTARIOS COM
INNER JOIN USUARIOS USER
ON USER.ID_USUARIO = COM.USUARIO
INNER JOIN POSTAGENS POST
ON COM.POST = POST.ID_POST;
#10. Para cada postagem, mostrar o ID da postagem e a quantidade de comentários.
SELECT POST.ID_POST, COUNT(COMM.ID_COMENTARIO) AS QTD_COMENTARIOS
FROM COMENTARIOS COMM
RIGHT JOIN POSTAGENS POST
ON COMM.POST = POST.ID_POST
GROUP BY POST.ID_POST;
#11. Contar quantos seguidores cada usuário possui.
DESC USUARIOS;
SELECT concat_ws(' ', USER.NOME_USUARIO, USER.SOBRENOME) AS USUARIO,
COUNT(SEG.SEGUIDOR)
FROM USUARIOS USER
JOIN SEGUIDORES_USUARIOS SEG
ON USER.ID_USUARIO = SEG.USUARIO
GROUP BY USUARIO;
#12. Listar os nomes dos usuários que pertencem ao grupo "Desenvolvimento".
#13. Mostrar o nome dos usuários e a data e hora da última postagem que eles fizeram.
SELECT CONCAT_WS(' ', USER.NOME_USUARIO, USER.SOBRENOME) AS USUARIO,
max(POST.DATA_HORA) AS ULTIMO_POST
FROM USUARIOS USER
LEFT JOIN POSTAGENS POST
ON USER.ID_USUARIO = POST.USUARIO
GROUP BY USUARIO;
#14. Contar quantas postagens cada usuário fez.
#15. Para cada grupo, exibir o nome do grupo e a quantidade de usuários que pertencem a ele.