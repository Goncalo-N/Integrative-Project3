-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TODOS OS DROPS DAS TABELAS -----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

DROP SEQUENCE SEQ_PISTA_DE_AUDITORIA;

DROP TABLE QUINTA CASCADE CONSTRAINTS;

DROP TABLE PARCELA_AGRICOLA CASCADE CONSTRAINTS;

DROP TABLE CULTURA CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_CULTURA CASCADE CONSTRAINTS;

DROP TABLE EDIFICIO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_EDIFICIO CASCADE CONSTRAINTS;

DROP TABLE SISTEMA_DE_REGA CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_REGA CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_SISTEMA_DE_REGA CASCADE CONSTRAINTS;

DROP TABLE REGA CASCADE CONSTRAINTS;

DROP TABLE PLANO_DE_REGA CASCADE CONSTRAINTS;

DROP TABLE OPERACAO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_OPERACAO CASCADE CONSTRAINTS;

DROP TABLE CADERNO_DE_CAMPO CASCADE CONSTRAINTS;

DROP TABLE COLHEITA CASCADE CONSTRAINTS;

DROP TABLE FERTILIZACAO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_FERTILIZACAO CASCADE CONSTRAINTS;

DROP TABLE FERTILIZACAO_FATOR_DE_PRODUCAO CASCADE CONSTRAINTS;

DROP TABLE FATOR_DE_PRODUCAO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_FATOR_DE_PRODUCAO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_FORMULACAO CASCADE CONSTRAINTS;

DROP TABLE FICHA_TECNICA CASCADE CONSTRAINTS;

DROP TABLE ELEMENTO_SUBSTANCIA CASCADE CONSTRAINTS;

DROP TABLE PRODUTO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_PRODUTO CASCADE CONSTRAINTS;

DROP TABLE ENCOMENDA_PRODUTO CASCADE CONSTRAINTS;

DROP TABLE ENCOMENDA CASCADE CONSTRAINTS;

DROP TABLE ESTADO_DA_ENCOMENDA CASCADE CONSTRAINTS;

DROP TABLE ENTREGA CASCADE CONSTRAINTS;

DROP TABLE CONDUTOR CASCADE CONSTRAINTS;

DROP TABLE GESTOR_AGRICOLA CASCADE CONSTRAINTS;

DROP TABLE HUB CASCADE CONSTRAINTS;

DROP TABLE CLIENTE CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_CLIENTE CASCADE CONSTRAINTS;

DROP TABLE UTILIZADOR CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_UTILIZADOR CASCADE CONSTRAINTS;

DROP TABLE ESTACAO_METEOROLOGICA CASCADE CONSTRAINTS;

DROP TABLE SENSOR CASCADE CONSTRAINTS;

DROP TABLE SENSOR_OPERACAO CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_SENSOR CASCADE CONSTRAINTS;

DROP TABLE HUB CASCADE CONSTRAINTS;

DROP TABLE INPUT_HUB CASCADE CONSTRAINTS;

DROP TABLE TIPO_DE_ALTERACAO CASCADE CONSTRAINTS;

DROP TABLE PISTA_DE_AUDITORIA CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TODOS OS CREATES DAS TABELAS ---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quinta -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE QUINTA (
  ID_QUINTA NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_QUINTA PRIMARY KEY (ID_QUINTA),
  CONSTRAINT CK_ID_QUINTA_POSITIVO CHECK (ID_QUINTA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Parcela_Agricola ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PARCELA_AGRICOLA (
  ID_PARCELA_AGRICOLA NUMBER(3) NOT NULL,
  DESIGNACAO VARCHAR2(20) NOT NULL,
  AREA FLOAT(3) NOT NULL,
  ID_QUINTAQUINTA_PA NUMBER(3) NOT NULL,
  ID_GESTOR_AGRICOLAGESTOR_AGRICOLA NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_PARCELA_AGRICOLA PRIMARY KEY (ID_PARCELA_AGRICOLA),
  CONSTRAINT CK_ID_PARCELA_AGRICOLA_POSITIVO CHECK (ID_PARCELA_AGRICOLA > 0),
  CONSTRAINT CK_DESIGNACAO CHECK (REGEXP_LIKE(DESIGNACAO, '^[a-zA-Z ]*$')),
  CONSTRAINT CK_AREA_POSITIVO CHECK (AREA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cultura ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CULTURA (
  ID_CULTURA NUMBER(3) NOT NULL,
  ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_CULT NUMBER(3) NOT NULL,
  ID_TIPO_DE_CULTURATIPO_DE_CULTURA NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_CULTURA PRIMARY KEY (ID_CULTURA),
  CONSTRAINT CK_ID_CULTURA CHECK (ID_CULTURA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cultura ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_CULTURA (
  ID_TIPO_DE_CULTURA NUMBER(3) NOT NULL,
  DESCRICAO_TIPO_DE_CULTURA VARCHAR2(10) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_CULTURA PRIMARY KEY (ID_TIPO_DE_CULTURA),
  CONSTRAINT CK_ID_TIPO_DE_CULTURA_POSITIVO CHECK (ID_TIPO_DE_CULTURA > 0),
  CONSTRAINT CK_DESCRICAO_TIPO_DE_CULTURA CHECK (REGEXP_LIKE(DESCRICAO_TIPO_DE_CULTURA, '^permanente|temporaria$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Edificio -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE EDIFICIO (
  ID_EDIFICIO NUMBER(10) NOT NULL,
  ID_QUINTAQUINTA_E NUMBER(3) NOT NULL,
  ID_TIPO_DE_EDIFICIOTIPO_DE_EDIFICIO NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_EDIFICIO PRIMARY KEY (ID_EDIFICIO),
  CONSTRAINT CK_ID_EDIFICIO_POSITIVO CHECK (ID_EDIFICIO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Edificio ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_EDIFICIO (
  ID_TIPO_DE_EDIFICIO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_EDIFICIO VARCHAR2(15) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_EDIFICIO PRIMARY KEY (ID_TIPO_DE_EDIFICIO),
  CONSTRAINT CK_ID_TIPO_DE_EDIFICIO_POSITIVO CHECK (ID_TIPO_DE_EDIFICIO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_EDIFICIO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_EDIFICIO, '^estabulo|garagem|armazem|sistema de rega$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistema_de_Rega ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SISTEMA_DE_REGA (
  ID_EDIFICIOEDIFICIO_SR NUMBER(3) NOT NULL,
  ID_TIPO_DE_REGATIPO_DE_REGA NUMBER(1) NOT NULL,
  ID_TIPO_DE_SISTEMA_DE_REGATIPO_DE_SISTEMA_DE_REGA NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_EDIFICIOEDIFICIO_SR PRIMARY KEY (ID_EDIFICIOEDIFICIO_SR)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Rega -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_REGA (
  ID_TIPO_DE_REGA NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_REGA VARCHAR2(9) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_REGA PRIMARY KEY (ID_TIPO_DE_REGA),
  CONSTRAINT CK_ID_TIPO_DE_REGA_POSITIVO CHECK (ID_TIPO_DE_REGA > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_REGA CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_REGA, '^gravidade|bombeada$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sistema_de_Rega --------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_SISTEMA_DE_REGA (
  ID_TIPO_DE_SISTEMA_DE_REGA NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_SISTEMA_DE_REGA VARCHAR2(12) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_SISTEMA_DE_REGA PRIMARY KEY (ID_TIPO_DE_SISTEMA_DE_REGA),
  CONSTRAINT CK_ID_TIPO_DE_SISTEMA_DE_REGA_POSITIVO CHECK (ID_TIPO_DE_SISTEMA_DE_REGA > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_SISTEMA_DE_REGA CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_SISTEMA_DE_REGA, '^aspersao|gotejamento|pulverizacao$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rega ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE REGA (
  ID_REGA NUMBER(10) NOT NULL,
  QUANTIDADE_DE_REGA FLOAT(10) NOT NULL,
  TEMPO_DE_REGA NUMBER(2) NOT NULL,
  FREQUENCIA_DE_REGA NUMBER(10) NOT NULL,
  ID_PLANO_DE_REGAPLANO_DE_REGA NUMBER(10) NOT NULL,
  ID_EDIFICIOSISTEMA_DE_REGA_R NUMBER(3) NOT NULL,
  ID_OPERACAOOPERACAO_R NUMBER(10) NOT NULL,
  CONSTRAINT PK_ID_REGA PRIMARY KEY (ID_REGA),
  CONSTRAINT CK_ID_REGA_POSITIVO CHECK (ID_REGA > 0),
  CONSTRAINT CK_QUANTIDADE_DE_REGA_POSITIVO CHECK (QUANTIDADE_DE_REGA > 0),
  CONSTRAINT CK_TEMPO_DE_REGA_POSITIVO CHECK (TEMPO_DE_REGA > 0),
  CONSTRAINT CK_FREQUENCIA_DE_REGA_POSITIVO CHECK (FREQUENCIA_DE_REGA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plano_de_Rega ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PLANO_DE_REGA (
  ID_PLANO_DE_REGA NUMBER(10) NOT NULL,
  ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PR NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_PLANO_DE_REGA PRIMARY KEY (ID_PLANO_DE_REGA),
  CONSTRAINT CK_ID_PLANO_DE_REGA_POSITIVO CHECK (ID_PLANO_DE_REGA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Operacao -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE OPERACAO (
  ID_OPERACAO NUMBER(10) NOT NULL,
  DATA_PLANEADA DATE NOT NULL,
  ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO NUMBER(10) NOT NULL,
  ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_OPERACAO PRIMARY KEY (ID_OPERACAO),
  CONSTRAINT CK_ID_OPERACAO_POSITIVO CHECK (ID_OPERACAO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Operacao ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_OPERACAO (
  ID_TIPO_DE_OPERACAO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_OPERACAO VARCHAR2(13) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_OPERACAO PRIMARY KEY (ID_TIPO_DE_OPERACAO),
  CONSTRAINT CK_ID_TIPO_DE_OPERACAO_POSITIVO CHECK (ID_TIPO_DE_OPERACAO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_OPERACAO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_OPERACAO, '^fertilizacao|sensor|colheita|rega$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Caderno_de_Campo ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CADERNO_DE_CAMPO (
  ID_CADERNO_DE_CAMPO NUMBER(10) NOT NULL,
  CONSTRAINT PK_ID_CADERNO_DE_CAMPO PRIMARY KEY (ID_CADERNO_DE_CAMPO),
  CONSTRAINT CK_ID_CADERNO_DE_CAMPO_POSITIVO CHECK (ID_CADERNO_DE_CAMPO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Colheita -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE COLHEITA (
  ID_COLHEITA NUMBER(10) NOT NULL,
  QUANTIDADE_DA_COLHEITA FLOAT(10) NOT NULL,
  DATA_DA_COLHEITA DATE NOT NULL,
  ID_OPERACAOOPERACAO_C NUMBER(10) NOT NULL,
  ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_COLHE NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_COLHEITA PRIMARY KEY (ID_COLHEITA),
  CONSTRAINT CK_ID_COLHEITA_POSITIVO CHECK (ID_COLHEITA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE FERTILIZACAO (
  ID_FERTILIZACAO NUMBER(10) NOT NULL,
  ID_OPERACAOOPERACAO_F NUMBER(10) NOT NULL,
  ID_EDIFICIOSISTEMA_DE_REGA_F NUMBER(3) NOT NULL,
  ID_TIPO_DE_FERTILIZACAOTIPO_DE_FERTILIZACAO NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_FERTILIZACAO PRIMARY KEY (ID_FERTILIZACAO),
  CONSTRAINT CK_ID_FERTILIZACAO_POSITIVO CHECK (ID_FERTILIZACAO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fertilizacao -----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_FERTILIZACAO (
  ID_TIPO_DE_FERTILIZACAO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_FERTILIZACAO VARCHAR2(24) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_FERTILIZACAO PRIMARY KEY (ID_TIPO_DE_FERTILIZACAO),
  CONSTRAINT CK_ID_TIPO_DE_FERTILIZACAO_POSITIVO CHECK (ID_TIPO_DE_FERTILIZACAO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_FERTILIZACAO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_FERTILIZACAO, '^foliar|fertirrega|aplicacao direta ao solo$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao_Fator_de_Producao -------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE FERTILIZACAO_FATOR_DE_PRODUCAO (
  ID_FERTILIZACAOFERTILIZACAO NUMBER(10) NOT NULL,
  ID_PRODUTOFATOR_DE_PRODUCAO NUMBER(3) NOT NULL,
  QUANTIDADE_DE_FATOR_DE_PRODUCAO FLOAT(10) NOT NULL,
  CONSTRAINT PK_ID_FERTILIZACAOFERTILIZACAO_ID_PRODUTOFATOR_DE_PRODUCAO PRIMARY KEY (ID_FERTILIZACAOFERTILIZACAO, ID_PRODUTOFATOR_DE_PRODUCAO),
  CONSTRAINT CK_QUANTIDADE_DE_FATOR_DE_PRODUCAO_POSITIVO CHECK (QUANTIDADE_DE_FATOR_DE_PRODUCAO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fator_de_Producao --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE FATOR_DE_PRODUCAO (
  ID_PRODUTOPRODUTO_FP NUMBER(3) NOT NULL,
  NOME_COMERCIAL VARCHAR2(20) NOT NULL,
  ID_TIPO_DE_FORMULACAOTIPO_DE_FORMULACAO NUMBER(1) NOT NULL,
  ID_TIPO_DE_FATOR_DE_PRODUCAOTIPO_DE_FATOR_DE_PRODUCAO NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_PRODUTOPRODUTO_FP PRIMARY KEY (ID_PRODUTOPRODUTO_FP),
  CONSTRAINT CK_NOME_COMERCIAL CHECK (REGEXP_LIKE(NOME_COMERCIAL, '^[a-zA-Z ]*$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fator_de_Producao ------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_FATOR_DE_PRODUCAO (
  ID_TIPO_DE_FATOR_DE_PRODUCAO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_FATOR_DE_PRODUCAO VARCHAR2(21) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_FATOR_DE_PRODUCAO PRIMARY KEY (ID_TIPO_DE_FATOR_DE_PRODUCAO),
  CONSTRAINT CK_ID_TIPO_DE_FATOR_DE_PRODUCAO_POSITIVO CHECK (ID_TIPO_DE_FATOR_DE_PRODUCAO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_FATOR_DE_PRODUCAO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_FATOR_DE_PRODUCAO, '^fertilizante|adubo|corretivo|produto fitofarmaco$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Formulacao -------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_FORMULACAO (
  ID_TIPO_DE_FORMULACAO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_FORMULACAO VARCHAR2(9) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_FORMULACAO PRIMARY KEY (ID_TIPO_DE_FORMULACAO),
  CONSTRAINT CK_ID_TIPO_DE_FORMULACAO_POSITIVO CHECK (ID_TIPO_DE_FORMULACAO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_FORMULACAO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_FORMULACAO, '^liquido|granulado|po$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ficha_Tecnica ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE FICHA_TECNICA (
  ID_FICHA_TECNICA NUMBER(3) NOT NULL,
  IMAGEM VARCHAR2(100) NOT NULL,
  PERCENTAGEM FLOAT(10) NOT NULL,
  ID_PRODUTOPRODUTO_FT NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_FICHA_TECNICA PRIMARY KEY (ID_FICHA_TECNICA),
  CONSTRAINT CK_ID_FICHA_TECNICA_POSITIVO CHECK (ID_FICHA_TECNICA > 0),
  CONSTRAINT CK_IMAGEM CHECK (REGEXP_LIKE(IMAGEM, '^[a-zA-Z /.-]*$')),
  CONSTRAINT CK_PERCENTAGEM_POSITIVO CHECK (PERCENTAGEM > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elemento_Substancia ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ELEMENTO_SUBSTANCIA (
  ID_ELEMENTO_SUBSTANCIA NUMBER(3) NOT NULL,
  NOME VARCHAR2(20) NOT NULL,
  ID_FICHA_TECNICAFICHA_TECNICA NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_ELEMENTO_SUBSTANCIA PRIMARY KEY (ID_ELEMENTO_SUBSTANCIA),
  CONSTRAINT CK_ID_ELEMENTO_SUBSTANCIA_POSITIVO CHECK (ID_ELEMENTO_SUBSTANCIA > 0),
  CONSTRAINT CK_NOME CHECK (REGEXP_LIKE(NOME, '^[a-zA-Z ]*$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Produto ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PRODUTO (
  ID_PRODUTO NUMBER(3) NOT NULL,
  DESCRICAO_DO_PRODUTO VARCHAR2(11) NOT NULL,
  PRECO_POR_UNIDADE FLOAT(10) NOT NULL,
  ID_TIPO_DE_PRODUTOTIPO_DE_PRODUTO NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_PRODUTO PRIMARY KEY (ID_PRODUTO),
  CONSTRAINT CK_ID_PRODUTO_POSITIVO CHECK (ID_PRODUTO > 0),
  CONSTRAINT CK_DESCRICAO_DO_PRODUTO CHECK (REGEXP_LIKE(DESCRICAO_DO_PRODUTO, '^[a-zA-Z ]*$')),
  CONSTRAINT CK_PRECO_POR_UNIDADE_POSITIVO CHECK (PRECO_POR_UNIDADE > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ParcelaAgricola_Produto --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PARCELA_AGRICOLA_PRODUTO (
  ID_PARCELA_AGRICOLA_PAP NUMBER(3) NOT NULL,
  ID_PRODUTOPRODUTO_PAP NUMBER(3) NOT NULL,
  QUANTIDADE NUMBER(10) NOT NULL,
  CONSTRAINT PK_ID_PARCELA_AGRICOLA_PAPID_PRODUTOPRODUTO_PAP PRIMARY KEY (ID_PARCELA_AGRICOLA_PAP, ID_PRODUTOPRODUTO_PAP),
  CONSTRAINT CK_QUANTIDADE_POSITIVO CHECK (QUANTIDADE > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Produto ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_PRODUTO (
  ID_TIPO_DE_PRODUTO NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_PRODUTO VARCHAR2(17) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_PRODUTO PRIMARY KEY (ID_TIPO_DE_PRODUTO),
  CONSTRAINT CK_ID_TIPO_DE_PRODUTO_POSITIVO CHECK (ID_TIPO_DE_PRODUTO > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_PRODUTO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_PRODUTO, '^consumivel|fator de producao$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda_Produto --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ENCOMENDA_PRODUTO (
  ID_ENCOMENDAENCOMENDA_EP NUMBER(10) NOT NULL,
  ID_PRODUTOPRODUTO_EP NUMBER(3) NOT NULL,
  QUANTIDADE_DA_ENCOMENDA_PRODUTO NUMBER(10) NOT NULL,
  CONSTRAINT PK_ID_ENCOMENDAENCOMENDA_EP_ID_PRODUTOPRODUTO PRIMARY KEY (ID_ENCOMENDAENCOMENDA_EP, ID_PRODUTOPRODUTO_EP),
  CONSTRAINT CK_QUANTIDADE_DA_ENCOMENDA_PRODUTO_POSITIVO CHECK (QUANTIDADE_DA_ENCOMENDA_PRODUTO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda ----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ENCOMENDA (
  ID_ENCOMENDA NUMBER(10) NOT NULL,
  DATA_DA_ENCOMENDA DATE NOT NULL,
  VALOR FLOAT(10) NOT NULL,
  ID_ESTADO_DA_ENCOMENDAESTADO_DA_ENCOMENDA NUMBER(1) NOT NULL,
  ID_HUB VARCHAR(25) NOT NULL,
  NIFCLIENTE NUMBER(9) NOT NULL,
  CONSTRAINT PK_ID_ENCOMENDA PRIMARY KEY (ID_ENCOMENDA),
  CONSTRAINT CK_ID_ENCOMENDA_POSITIVO CHECK (ID_ENCOMENDA > 0),
  CONSTRAINT CK_VALOR_POSITIVO CHECK (VALOR > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estado_da_Encomenda ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ESTADO_DA_ENCOMENDA (
  ID_ESTADO_DA_ENCOMENDA NUMBER(1) NOT NULL,
  DESCRICAO_DO_ESTADO_DA_ENCOMENDA VARCHAR2(20) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_ESTADO_DA_ENCOMENDA PRIMARY KEY (ID_ESTADO_DA_ENCOMENDA),
  CONSTRAINT CK_ID_ESTADO_DA_ENCOMENDA_POSITIVO CHECK (ID_ESTADO_DA_ENCOMENDA > 0),
  CONSTRAINT CK_DESCRICAO_DO_ESTADO_DA_ENCOMENDA CHECK (REGEXP_LIKE(DESCRICAO_DO_ESTADO_DA_ENCOMENDA, '^pago|entregue|registado$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Entrega ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ENTREGA (
  ID_ENTREGA NUMBER(10) NOT NULL,
  DATA_DA_ENTREGA DATE NOT NULL,
  ID_ENCOMENDAENCOMENDA_E NUMBER(10) NOT NULL,
  ID_CONDUTORUTILIZADOR NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_ENTREGA PRIMARY KEY (ID_ENTREGA),
  CONSTRAINT CK_ID_ENTREGA_POSITIVO CHECK (ID_ENTREGA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Condutor -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CONDUTOR (
  ID_CONDUTORUTILIZADOR NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_CONDUTORUTILIZADOR PRIMARY KEY (ID_CONDUTORUTILIZADOR)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gestor_Agricola ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE GESTOR_AGRICOLA (
  ID_GESTOR_AGRICOLAUTILIZADOR NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_GESTOR_AGRICOLAUTILIZADOR PRIMARY KEY (ID_GESTOR_AGRICOLAUTILIZADOR)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cliente ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CLIENTE (
  NIF VARCHAR2(9) NOT NULL,
  NOME VARCHAR2(30) NOT NULL,
  EMAIL VARCHAR2(30) NOT NULL UNIQUE,
  MORADA VARCHAR2(20) NOT NULL,
  ID_CLIENTEUTILIZADOR NUMBER(3) NOT NULL,
  ID_TIPO_DE_CLIENTETIPO_DE_CLIENTE NUMBER(1) NOT NULL,
  ID_HUB_DEFAULT VARCHAR(25) NOT NULL,
  CONSTRAINT PK_NIF PRIMARY KEY (NIF),
  CONSTRAINT CK_NOME_CLIENTE CHECK (REGEXP_LIKE(NOME, '^[a-zA-Z ]*$')),
  CONSTRAINT CK_EMAIL CHECK (REGEXP_LIKE(EMAIL, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')),
  CONSTRAINT CK_MORADA CHECK (REGEXP_LIKE(MORADA, '^[a-zA-Z ]*$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cliente ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_CLIENTE (
  ID_TIPO_DE_CLIENTE NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_CLIENTE VARCHAR2(10) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_CLIENTE PRIMARY KEY (ID_TIPO_DE_CLIENTE),
  CONSTRAINT CK_ID_TIPO_DE_CLIENTE_POSITIVO CHECK (ID_TIPO_DE_CLIENTE > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_CLIENTE CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_CLIENTE, '^empresa|particular$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Utilizador ---------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE UTILIZADOR (
  ID_UTILIZADOR NUMBER(3) NOT NULL,
  NOME_DO_UTILIZADOR VARCHAR2(20) NOT NULL,
  ID_TIPO_DE_UTILIZADORTIPO_DE_UTILIZADOR NUMBER(1) NOT NULL,
  CONSTRAINT PK_ID_UTILIZADOR PRIMARY KEY (ID_UTILIZADOR),
  CONSTRAINT CK_ID_UTILIZADOR_POSITIVO CHECK (ID_UTILIZADOR > 0),
  CONSTRAINT CK_NOME_DO_UTILIZADOR CHECK (REGEXP_LIKE(NOME_DO_UTILIZADOR, '^[a-zA-Z ]*$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Utilizador -------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_UTILIZADOR (
  ID_TIPO_DE_UTILIZADOR NUMBER(1) NOT NULL,
  DESCRICAO_DO_TIPO_DE_UTILIZADOR VARCHAR2(22) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_UTILIZADOR PRIMARY KEY (ID_TIPO_DE_UTILIZADOR),
  CONSTRAINT CK_ID_TIPO_DE_UTILIZADOR_POSITIVO CHECK (ID_TIPO_DE_UTILIZADOR > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_UTILIZADOR CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_UTILIZADOR, '^cliente|condutor|gestor agricola|gestor de distribuicao$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estacao_Meteorologica ----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ESTACAO_METEOROLOGICA (
  ID_ESTACAO_METEOROLOGICA NUMBER(3) NOT NULL,
  ID_QUINTAQUINTA_EM NUMBER(3) NOT NULL,
  CONSTRAINT PK_ID_ESTACAO_METEOROLOGICA PRIMARY KEY (ID_ESTACAO_METEOROLOGICA),
  CONSTRAINT CK_ID_ESTACAO_METEOROLOGICA_POSITIVO CHECK (ID_ESTACAO_METEOROLOGICA > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SENSOR (
  VALOR_DE_REFERENCIA NUMBER(10) NOT NULL,
  IDENTIFICADOR_DO_SENSOR VARCHAR(5) NOT NULL,
  ID_ESTACAO_METEOROLOGICAESTACAO_METEOROLOGICA NUMBER(3) NOT NULL,
  ID_TIPO_DE_SENSORTIPO_DE_SENSOR NUMBER(3) NOT NULL,
  CONSTRAINT PK_VALOR_DE_REFERENCIA PRIMARY KEY (VALOR_DE_REFERENCIA),
  CONSTRAINT CK_VALOR_DE_REFERENCIA_POSITIVO CHECK (VALOR_DE_REFERENCIA > 0),
  CONSTRAINT CK_IDENTIFICADOR_DO_SENSOR CHECK (REGEXP_LIKE(IDENTIFICADOR_DO_SENSOR, '^[a-zA-Z ]*$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor_Operacao ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE SENSOR_OPERACAO (
  VALOR_DE_REFERENCIASENSOR NUMBER(10) NOT NULL,
  ID_OPERACAOOPERACAO_S NUMBER(10) NOT NULL,
  VALOR_LIDO NUMBER(3) NOT NULL,
  INSTANTE_DE_LEITURA DATE NOT NULL,
  CONSTRAINT PK_VALOR_DE_REFERENCIASENSOR_ID_OPERACAOOPERACAO_S PRIMARY KEY (VALOR_DE_REFERENCIASENSOR, ID_OPERACAOOPERACAO_S),
  CONSTRAINT CK_VALOR_LIDO_POSITIVO CHECK (VALOR_LIDO > 0)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sensor -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_SENSOR (
  ID_TIPO_DE_SENSOR NUMBER(3) NOT NULL,
  DESCRICAO_DO_TIPO_DE_SENSOR VARCHAR2(2) NOT NULL UNIQUE,
  CONSTRAINT PK_ID_TIPO_DE_SENSOR PRIMARY KEY (ID_TIPO_DE_SENSOR),
  CONSTRAINT CK_ID_TIPO_DE_SENSOR_POSITIVO CHECK (ID_TIPO_DE_SENSOR > 0),
  CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_SENSOR CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_SENSOR, '^HS|PL|TS|VV|TA|HA|PA$'))
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PISTA_DE_AUDITORIA -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PISTA_DE_AUDITORIA (
    ID_PISTA_DE_AUDITORIA NUMBER(3) NOT NULL,
    UTILIZADOR VARCHAR2(15) NOT NULL,
    DATA_HORA TIMESTAMP NOT NULL,
    ID_OPERACAOOPERACAO_PA NUMBER(10) NOT NULL,
    ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PA NUMBER(3) NOT NULL,
    ID_TIPO_DE_ALTERACAOTIPO_DE_ALTERACAO NUMBER(1) NOT NULL,
    CONSTRAINT PK_ID_PISTA_DE_AUDITORIA PRIMARY KEY (ID_PISTA_DE_AUDITORIA),
    CONSTRAINT CK_ID_PISTA_DE_AUDITORIA_POSITIVO CHECK (ID_PISTA_DE_AUDITORIA > 0)
);

CREATE SEQUENCE SEQ_PISTA_DE_AUDITORIA START WITH 1 MINVALUE 1 INCREMENT BY 1 CACHE 100;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TIPO_DE_ALTERACAO -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TIPO_DE_ALTERACAO (
    ID_TIPO_DE_ALTERACAO NUMBER(1) NOT NULL,
    DESCRICAO_DO_TIPO_DE_ALTERACAO VARCHAR2(6) NOT NULL UNIQUE,
    CONSTRAINT PK_ID_TIPO_DE_ALTERACAO PRIMARY KEY (ID_TIPO_DE_ALTERACAO),
    CONSTRAINT CK_ID_TIPO_DE_ALTERACAO_POSITIVO CHECK (ID_TIPO_DE_ALTERACAO > 0),
    CONSTRAINT CK_DESCRICAO_DO_TIPO_DE_ALTERACAO CHECK (REGEXP_LIKE(DESCRICAO_DO_TIPO_DE_ALTERACAO, '^UPDATE|INSERT|DELETE$'))
);

--------------------------------------------------
-- CREATE FOR HUB --------------------------------
--------------------------------------------------
CREATE TABLE HUB (
  LOC_ID VARCHAR2(25) NOT NULL,
  LAT NUMBER(25) NOT NULL,
  LNG NUMBER(25) NOT NULL,
  TIPO_DE_HUB VARCHAR2(25) NOT NULL,
  CONSTRAINT PK_LOC_ID PRIMARY KEY (LOC_ID)
);

--------------------------------------------------
-- CREATE FOR INPUT_HUB --------------------------
--------------------------------------------------
CREATE TABLE INPUT_HUB (
  INPUT_STRING VARCHAR(25)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TODAS AS CHAVES ESTRANGEIRAS ---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE PARCELA_AGRICOLA ADD CONSTRAINT FK_ID_QUINTAQUINTA_PA FOREIGN KEY (ID_QUINTAQUINTA_PA) REFERENCES QUINTA (ID_QUINTA);

ALTER TABLE PARCELA_AGRICOLA ADD CONSTRAINT FK_ID_GESTOR_AGRICOLAGESTOR_AGRICOLA FOREIGN KEY (ID_GESTOR_AGRICOLAGESTOR_AGRICOLA) REFERENCES GESTOR_AGRICOLA (ID_GESTOR_AGRICOLAUTILIZADOR);

ALTER TABLE CULTURA ADD CONSTRAINT FK_ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_CULT FOREIGN KEY (ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_CULT) REFERENCES PARCELA_AGRICOLA (ID_PARCELA_AGRICOLA);

ALTER TABLE CULTURA ADD CONSTRAINT FK_ID_TIPO_DE_CULTURATIPO_DE_CULTURA FOREIGN KEY (ID_TIPO_DE_CULTURATIPO_DE_CULTURA) REFERENCES TIPO_DE_CULTURA (ID_TIPO_DE_CULTURA);

ALTER TABLE EDIFICIO ADD CONSTRAINT FK_ID_QUINTAQUINTA_E FOREIGN KEY (ID_QUINTAQUINTA_E) REFERENCES QUINTA (ID_QUINTA);

ALTER TABLE EDIFICIO ADD CONSTRAINT FK_ID_TIPO_DE_EDIFICIOTIPO_DE_EDIFICIO FOREIGN KEY (ID_TIPO_DE_EDIFICIOTIPO_DE_EDIFICIO) REFERENCES TIPO_DE_EDIFICIO (ID_TIPO_DE_EDIFICIO);

ALTER TABLE SISTEMA_DE_REGA ADD CONSTRAINT FK_ID_EDIFICIOEDIFICIO_SR FOREIGN KEY (ID_EDIFICIOEDIFICIO_SR) REFERENCES EDIFICIO (ID_EDIFICIO);

ALTER TABLE SISTEMA_DE_REGA ADD CONSTRAINT FK_ID_TIPO_DE_REGATIPO_DE_REGA FOREIGN KEY (ID_TIPO_DE_REGATIPO_DE_REGA) REFERENCES TIPO_DE_REGA (ID_TIPO_DE_REGA);

ALTER TABLE SISTEMA_DE_REGA ADD CONSTRAINT FK_ID_TIPO_DE_SISTEMA_DE_REGATIPO_DE_SISTEMA_DE_REGA FOREIGN KEY (ID_TIPO_DE_SISTEMA_DE_REGATIPO_DE_SISTEMA_DE_REGA) REFERENCES TIPO_DE_SISTEMA_DE_REGA (ID_TIPO_DE_SISTEMA_DE_REGA);

ALTER TABLE PLANO_DE_REGA ADD CONSTRAINT FK_ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PR FOREIGN KEY (ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PR) REFERENCES PARCELA_AGRICOLA (ID_PARCELA_AGRICOLA);

ALTER TABLE REGA ADD CONSTRAINT FK_ID_EDIFICIOSISTEMA_DE_REGA_R FOREIGN KEY (ID_EDIFICIOSISTEMA_DE_REGA_R) REFERENCES SISTEMA_DE_REGA (ID_EDIFICIOEDIFICIO_SR);

ALTER TABLE REGA ADD CONSTRAINT FK_ID_PLANO_DE_REGAPLANO_DE_REGA FOREIGN KEY (ID_PLANO_DE_REGAPLANO_DE_REGA) REFERENCES PLANO_DE_REGA (ID_PLANO_DE_REGA);

ALTER TABLE REGA ADD CONSTRAINT FK_ID_OPERACAOOPERACAO_R FOREIGN KEY (ID_OPERACAOOPERACAO_R) REFERENCES OPERACAO (ID_OPERACAO);

ALTER TABLE OPERACAO ADD CONSTRAINT FK_ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO FOREIGN KEY (ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO) REFERENCES CADERNO_DE_CAMPO (ID_CADERNO_DE_CAMPO);

ALTER TABLE OPERACAO ADD CONSTRAINT FK_ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO FOREIGN KEY (ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO) REFERENCES TIPO_DE_OPERACAO (ID_TIPO_DE_OPERACAO);

ALTER TABLE COLHEITA ADD CONSTRAINT FK_ID_OPERACAOOPERACAO_C FOREIGN KEY (ID_OPERACAOOPERACAO_C) REFERENCES OPERACAO (ID_OPERACAO);

ALTER TABLE COLHEITA ADD CONSTRAINT FK_ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_COLHE FOREIGN KEY (ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_COLHE) REFERENCES PARCELA_AGRICOLA (ID_PARCELA_AGRICOLA);

ALTER TABLE FERTILIZACAO ADD CONSTRAINT FK_ID_OPERACAOOPERACAO_F FOREIGN KEY (ID_OPERACAOOPERACAO_F) REFERENCES OPERACAO (ID_OPERACAO);

ALTER TABLE FERTILIZACAO ADD CONSTRAINT FK_ID_EDIFICIOSISTEMA_DE_REGA_F FOREIGN KEY (ID_EDIFICIOSISTEMA_DE_REGA_F) REFERENCES SISTEMA_DE_REGA (ID_EDIFICIOEDIFICIO_SR);

ALTER TABLE FERTILIZACAO ADD CONSTRAINT FK_ID_TIPO_DE_FERTILIZACAOTIPO_DE_FERTILIZACAO FOREIGN KEY (ID_TIPO_DE_FERTILIZACAOTIPO_DE_FERTILIZACAO) REFERENCES TIPO_DE_FERTILIZACAO (ID_TIPO_DE_FERTILIZACAO);

ALTER TABLE FERTILIZACAO_FATOR_DE_PRODUCAO ADD CONSTRAINT FK_ID_FERTILIZACAOFERTILIZACAO FOREIGN KEY (ID_FERTILIZACAOFERTILIZACAO) REFERENCES FERTILIZACAO (ID_FERTILIZACAO);

ALTER TABLE FERTILIZACAO_FATOR_DE_PRODUCAO ADD CONSTRAINT FK_ID_PRODUTOFATOR_DE_PRODUCAO FOREIGN KEY (ID_PRODUTOFATOR_DE_PRODUCAO) REFERENCES FATOR_DE_PRODUCAO (ID_PRODUTOPRODUTO_FP);

ALTER TABLE FATOR_DE_PRODUCAO ADD CONSTRAINT FK_ID_PRODUTOPRODUTO_FP FOREIGN KEY (ID_PRODUTOPRODUTO_FP) REFERENCES PRODUTO (ID_PRODUTO);

ALTER TABLE FATOR_DE_PRODUCAO ADD CONSTRAINT FK_ID_TIPO_DE_FORMULACAOTIPO_DE_FORMULACAO FOREIGN KEY (ID_TIPO_DE_FORMULACAOTIPO_DE_FORMULACAO) REFERENCES TIPO_DE_FORMULACAO (ID_TIPO_DE_FORMULACAO);

ALTER TABLE FATOR_DE_PRODUCAO ADD CONSTRAINT FK_ID_TIPO_DE_FATOR_DE_PRODUCAOTIPO_DE_FATOR_DE_PRODUCAO FOREIGN KEY (ID_TIPO_DE_FATOR_DE_PRODUCAOTIPO_DE_FATOR_DE_PRODUCAO) REFERENCES TIPO_DE_FATOR_DE_PRODUCAO (ID_TIPO_DE_FATOR_DE_PRODUCAO);

ALTER TABLE FICHA_TECNICA ADD CONSTRAINT FK_ID_PRODUTOPRODUTO_FT FOREIGN KEY (ID_PRODUTOPRODUTO_FT) REFERENCES FATOR_DE_PRODUCAO (ID_PRODUTOPRODUTO_FP);

ALTER TABLE ELEMENTO_SUBSTANCIA ADD CONSTRAINT FK_ID_FICHA_TECNICAFICHA_TECNICA FOREIGN KEY (ID_FICHA_TECNICAFICHA_TECNICA) REFERENCES FICHA_TECNICA (ID_FICHA_TECNICA);

ALTER TABLE PRODUTO ADD CONSTRAINT FK_ID_TIPO_DE_PRODUTOTIPO_DE_PRODUTO FOREIGN KEY (ID_TIPO_DE_PRODUTOTIPO_DE_PRODUTO) REFERENCES TIPO_DE_PRODUTO (ID_TIPO_DE_PRODUTO);

ALTER TABLE PARCELA_AGRICOLA_PRODUTO ADD CONSTRAINT FK_ID_PARCELA_AGRICOLA_PAP FOREIGN KEY (ID_PARCELA_AGRICOLA_PAP) REFERENCES PARCELA_AGRICOLA (ID_PARCELA_AGRICOLA);

ALTER TABLE PARCELA_AGRICOLA_PRODUTO ADD CONSTRAINT FK_ID_PRODUTOPRODUTO_PAP FOREIGN KEY (ID_PRODUTOPRODUTO_PAP) REFERENCES PRODUTO (ID_PRODUTO);

ALTER TABLE ENCOMENDA_PRODUTO ADD CONSTRAINT FK_ID_ENCOMENDAENCOMENDA_EP FOREIGN KEY (ID_ENCOMENDAENCOMENDA_EP) REFERENCES ENCOMENDA (ID_ENCOMENDA);

ALTER TABLE ENCOMENDA_PRODUTO ADD CONSTRAINT FK_ID_PRODUTOPRODUTO_EP FOREIGN KEY (ID_PRODUTOPRODUTO_EP) REFERENCES PRODUTO (ID_PRODUTO);

ALTER TABLE ENCOMENDA ADD CONSTRAINT FK_HUB FOREIGN KEY (ID_HUB) REFERENCES HUB (LOC_ID);

ALTER TABLE ENCOMENDA ADD CONSTRAINT FK_ID_ESTADO_DA_ENCOMENDAESTADO_DA_ENCOMENDA FOREIGN KEY (ID_ESTADO_DA_ENCOMENDAESTADO_DA_ENCOMENDA) REFERENCES ESTADO_DA_ENCOMENDA (ID_ESTADO_DA_ENCOMENDA);

ALTER TABLE ENCOMENDA ADD CONSTRAINT FK_NIFCLIENTE FOREIGN KEY (NIFCLIENTE) REFERENCES CLIENTE (NIF);

ALTER TABLE ENTREGA ADD CONSTRAINT FK_ID_ENCOMENDAENCOMENDA_E FOREIGN KEY (ID_ENCOMENDAENCOMENDA_E) REFERENCES ENCOMENDA (ID_ENCOMENDA);

ALTER TABLE ENTREGA ADD CONSTRAINT FK_ID_CONDUTORUTILIZADOR FOREIGN KEY (ID_CONDUTORUTILIZADOR) REFERENCES CONDUTOR (ID_CONDUTORUTILIZADOR);

ALTER TABLE CONDUTOR ADD CONSTRAINT FK_ID_CONDUTORUTILIZADOR_C FOREIGN KEY (ID_CONDUTORUTILIZADOR) REFERENCES UTILIZADOR (ID_UTILIZADOR);

ALTER TABLE GESTOR_AGRICOLA ADD CONSTRAINT FK_ID_GESTOR_AGRICOLAUTILIZADOR FOREIGN KEY (ID_GESTOR_AGRICOLAUTILIZADOR) REFERENCES UTILIZADOR (ID_UTILIZADOR);

ALTER TABLE CLIENTE ADD CONSTRAINT FK_ID_CLIENTEUTILIZADOR FOREIGN KEY (ID_CLIENTEUTILIZADOR) REFERENCES UTILIZADOR (ID_UTILIZADOR);

ALTER TABLE CLIENTE ADD CONSTRAINT FK_ID_TIPO_DE_CLIENTETIPO_DE_CLIENTE FOREIGN KEY (ID_TIPO_DE_CLIENTETIPO_DE_CLIENTE) REFERENCES TIPO_DE_CLIENTE (ID_TIPO_DE_CLIENTE);

ALTER TABLE CLIENTE ADD CONSTRAINT FK_ID_HUB_DEFAULT FOREIGN KEY (ID_HUB_DEFAULT) REFERENCES HUB (LOC_ID);

ALTER TABLE UTILIZADOR ADD CONSTRAINT FK_ID_TIPO_DE_UTILIZADORTIPO_DE_UTILIZADOR FOREIGN KEY (ID_TIPO_DE_UTILIZADORTIPO_DE_UTILIZADOR) REFERENCES TIPO_DE_UTILIZADOR (ID_TIPO_DE_UTILIZADOR);

ALTER TABLE ESTACAO_METEOROLOGICA ADD CONSTRAINT FK_ID_QUINTAQUINTA_EM FOREIGN KEY (ID_QUINTAQUINTA_EM) REFERENCES QUINTA (ID_QUINTA);

ALTER TABLE SENSOR ADD CONSTRAINT FK_ID_ESTACAO_METEOROLOGICAESTACAO_METEOROLOGICA FOREIGN KEY (ID_ESTACAO_METEOROLOGICAESTACAO_METEOROLOGICA) REFERENCES ESTACAO_METEOROLOGICA (ID_ESTACAO_METEOROLOGICA);

ALTER TABLE SENSOR ADD CONSTRAINT FK_ID_TIPO_DE_SENSORTIPO_DE_SENSOR FOREIGN KEY (ID_TIPO_DE_SENSORTIPO_DE_SENSOR) REFERENCES TIPO_DE_SENSOR (ID_TIPO_DE_SENSOR);

ALTER TABLE SENSOR_OPERACAO ADD CONSTRAINT FK_VALOR_DE_REFERENCIASENSOR FOREIGN KEY (VALOR_DE_REFERENCIASENSOR) REFERENCES SENSOR (VALOR_DE_REFERENCIA);

ALTER TABLE SENSOR_OPERACAO ADD CONSTRAINT FK_ID_OPERACAOOPERACAO_S FOREIGN KEY (ID_OPERACAOOPERACAO_S) REFERENCES OPERACAO (ID_OPERACAO);

ALTER TABLE PISTA_DE_AUDITORIA ADD CONSTRAINT FK_ID_OPERACAOOPERACAO_PA FOREIGN KEY (ID_OPERACAOOPERACAO_PA) REFERENCES OPERACAO (ID_OPERACAO);

ALTER TABLE PISTA_DE_AUDITORIA ADD CONSTRAINT FK_ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PA FOREIGN KEY (ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_PA) REFERENCES PARCELA_AGRICOLA (ID_PARCELA_AGRICOLA);

ALTER TABLE PISTA_DE_AUDITORIA ADD CONSTRAINT FK_ID_TIPO_DE_ALTERACAOTIPO_DE_ALTERACAO FOREIGN KEY (ID_TIPO_DE_ALTERACAOTIPO_DE_ALTERACAO) REFERENCES TIPO_DE_ALTERACAO (ID_TIPO_DE_ALTERACAO);