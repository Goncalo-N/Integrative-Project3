-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT
    *
FROM
    PISTA_DE_AUDITORIA
ORDER BY
    DATA_HORA;

SELECT
    *
FROM
    OPERACAO;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
UPDATE OPERACAO
SET
    DATA_PLANEADA = DATE '2022-12-25'
WHERE
    ID_OPERACAO = 1;

UPDATE OPERACAO
SET
    ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO = 2
WHERE
    ID_OPERACAO = 4;

--(ID_OPERACAO, DATA_PLANEADA, ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO, ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO, ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_O)
INSERT INTO OPERACAO VALUES (
    5,
    DATE '2022-10-23',
    1,
    1,
    1
);

DELETE FROM OPERACAO
WHERE
    ID_OPERACAO = 1;

DELETE FROM OPERACAO
WHERE
    ID_OPERACAO = 4;