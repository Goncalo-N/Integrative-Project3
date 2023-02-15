SELECT * FROM Parcela_Agricola;
SELECT * FROM Cultura;
SELECT * FROM tipo_de_cultura;
SELECT * FROM ficha_tecnica;

--------------------------------US 206-------------------------------------
--Create da Parcela Agricola
INSERT INTO cultura VALUES(11,1,1,1);

--Update da parcela - alterar cultura e tipo da cultura

UPDATE Cultura SET id_tipo_de_culturaTipo_de_cultura  =X
WHERE id_tipo_de_culturaTipo_de_cultura  =Y AND id_parcela_agricolaParcela_agricola_Cult = Z;

UPDATE Cultura SET id_cultura =Y
WHERE id_cultura =X AND id_parcela_agricolaParcela_agricola_Cult= Z;

UPDATE Parcela_Agricola SET designacao ='Y'
WHERE designacao ='X';

UPDATE Parcela_Agricola SET area =Y
WHERE area =X;

--Listar parcelas ordenadas alfabeticamente
SELECT *
FROM  parcela_agricola pa
ORDER BY pa.designacao ASC ;

--Listar parcelas por ordem ascendente e descendente de tamanho

SELECT *
FROM  parcela_agricola pa
ORDER BY pa.area ASC ;

SELECT *
FROM  parcela_agricola pa
ORDER BY pa.area DESC ;

--Listar parcelas por cultura e tipo de cultura

SELECT tipo_de_cultura.descricao_tipo_de_cultura, ca.id_tipo_de_culturaTipo_de_cultura, COUNT(parcela_agricola.id_parcela_agricola) AS Quantidade_de_parcelas
FROM  Cultura ca
INNER JOIN parcela_agricola ON  parcela_agricola.id_parcela_agricola= ca.id_parcela_agricolaParcela_agricola_Cult 
INNER JOIN tipo_de_cultura ON tipo_de_cultura.id_tipo_de_cultura = ca.id_tipo_de_culturaTipo_de_cultura
GROUP BY id_tipo_de_culturaTipo_de_cultura ,descricao_tipo_de_cultura;

SELECT *
FROM  Cultura ca
ORDER BY ca.id_cultura ;

SELECT *
FROM  Cultura ca
ORDER BY ca.id_tipo_de_culturaTipo_de_cultura;

--------------------------------US 208--------------------------------------

--Obter fatores de produção e tipos em ordem ascendente
SELECT DISTINCT tfp.descricao_do_tipo_de_fator_de_producao AS tipo_de_fator_de_producao, fp.nome_comercial AS nome_comercial
FROM  ficha_tecnica ft, fator_de_producao fp, tipo_de_fator_de_producao tfp
WHERE  tfp.id_tipo_de_fator_de_producao=fp.id_tipo_de_formulacaoTipo_de_Formulacao  
ORDER BY tfp.descricao_do_tipo_de_fator_de_producao ASC ;

--Obter especificações tecnicas e tipos de fatores de produção
SELECT DISTINCT fp.nome_comercial , tfp.descricao_do_tipo_de_fator_de_producao,ft.id_ficha_tecnica, ft.percentagem, es.nome AS Elemento_Substancia
FROM  ficha_tecnica ft, fator_de_producao fp, elemento_substancia es, tipo_de_fator_de_producao tfp
WHERE es.id_ficha_tecnicaFicha_tecnica=ft.id_Ficha_tecnica  AND tfp.id_tipo_de_fator_de_producao =fp.id_tipo_de_formulacaoTipo_de_Formulacao  
ORDER BY fp.nome_comercial ASC ;

--Obter uma ficha tecnica de um fator de produção(alterar o id=X para id= id_que_queremos)
SELECT DISTINCT fp.nome_comercial , tfp.descricao_do_tipo_de_fator_de_producao,ft.id_ficha_tecnica, ft.percentagem, es.nome AS Elemento_Substancia
FROM  ficha_tecnica ft, fator_de_producao fp, elemento_substancia es, Tipo_de_fator_de_producao tfp
WHERE es.id_ficha_tecnicaFicha_tecnica=ft.id_Ficha_tecnica AND tfp.id_tipo_de_fator_de_producao =fp.id_tipo_de_formulacaoTipo_de_Formulacao AND fp.id_tipo_de_formulacaoTipo_de_Formulacao=2
ORDER BY fp.nome_comercial ASC ;

--para um dado fator de produção e elemento/substancia, alterar o elemento/substancia
DECLARE
id_prod number(10);
    BEGIN
Select id_ficha_tecnica INTO id_prod from ficha_tecnica
WHERE ID_PRODUTOPRODUTO_FT = 1;


UPDATE elemento_substancia
SET elemento_substancia.nome = 'Azoto organicoo'
WHERE id_ficha_tecnicaFicha_tecnica = id_prod AND nome = 'Azoto organico';

END;

--Para um determinado Growth factor e sabendo a sustancia troca a percentagem
DECLARE
id_ft number(10);
    BEGIN
Select id_ficha_tecnicaficha_tecnica INTO id_ft from elemento_substancia
WHERE nome = 'Azoto organico';

UPDATE ficha_tecnica
SET percentagem= 10
WHERE id_ficha_tecnica = id_ft AND id_produtoProduto_ft = 1;

END;


--Eliminar uma ficha tecninca sabendo o id da ficha tecnica
DELETE FROM ficha_tecnica
WHERE  id_ficha_tecnica = 1;

--sabendo os valores necessarios, inserimos uma nova ficha tecnica
INSERT INTO ficha_tecnica VALUES(1,'C:\Users\Gonçalo Nogueira\Downloads\Subaru-BRZ-STi-vocer-MAIN.jpg',12,1,1);

