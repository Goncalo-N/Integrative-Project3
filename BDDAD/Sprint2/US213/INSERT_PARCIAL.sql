-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--(id_quinta)
INSERT INTO QUINTA VALUES (
    1
);

INSERT INTO QUINTA VALUES (
    2
);

INSERT INTO QUINTA VALUES (
    3
);

--(id_parcela_agricola, designacao, area)
INSERT INTO PARCELA_AGRICOLA VALUES (
    1,
    'A',
    20,
    1
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    2,
    'B',
    30,
    1
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    3,
    'C',
    15,
    1
);

--(id_parcela_agricola, designacao, area)
INSERT INTO PARCELA_AGRICOLA VALUES (
    4,
    'D',
    60,
    2
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    5,
    'E',
    45,
    2
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    6,
    'F',
    25,
    2
);

--(id_parcela_agricola, designacao, area)
INSERT INTO PARCELA_AGRICOLA VALUES (
    7,
    'G',
    10,
    3
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    8,
    'H',
    100,
    3
);

INSERT INTO PARCELA_AGRICOLA VALUES (
    9,
    'I',
    80,
    3
);

--(id_caderno_de_Campo)
INSERT INTO CADERNO_DE_CAMPO VALUES (
    1
);

INSERT INTO CADERNO_DE_CAMPO VALUES (
    2
);

--(id_tipo_de_operacao, descricao_do_tipo_de_operacao)
INSERT INTO TIPO_DE_OPERACAO VALUES (
    1,
    'fertilizacao'
);

INSERT INTO TIPO_DE_OPERACAO VALUES (
    2,
    'sensor'
);

INSERT INTO TIPO_DE_OPERACAO VALUES (
    3,
    'colheita'
);

INSERT INTO TIPO_DE_OPERACAO VALUES (
    4,
    'rega'
);

--(ID_OPERACAO, DATA_PLANEADA, ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO, ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO, ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_O)
INSERT INTO OPERACAO VALUES (
    1,
    DATE '2022-10-23',
    1,
    1,
    1
);

INSERT INTO OPERACAO VALUES (
    2,
    DATE '2022-11-02',
    2,
    2,
    2
);

INSERT INTO OPERACAO VALUES (
    3,
    DATE '2022-12-17',
    1,
    3,
    3
);

INSERT INTO OPERACAO VALUES (
    4,
    DATE '2023-12-26',
    2,
    4,
    4
);

INSERT INTO TIPO_DE_ALTERACAO VALUES (
    1,
    'UPDATE'
);

INSERT INTO TIPO_DE_ALTERACAO VALUES (
    2,
    'INSERT'
);

INSERT INTO TIPO_DE_ALTERACAO VALUES (
    3,
    'DELETE'
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------