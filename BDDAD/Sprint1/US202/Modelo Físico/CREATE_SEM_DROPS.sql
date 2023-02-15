-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TODOS OS CREATES DAS TABELAS ---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quinta -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Quinta
(
  id_quinta     number(3) NOT NULL,
  CONSTRAINT pk_id_quinta PRIMARY KEY (id_quinta),
  CONSTRAINT ck_id_quinta_positivo CHECK (id_quinta > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Parcela_Agricola ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Parcela_Agricola
(
  id_parcela_agricola                       number(3)    NOT NULL,
  designacao                                varchar2(20) NOT NULL,
  area                                      float(3)     NOT NULL,
  id_quintaQuinta_PA                        number(3)    NOT NULL,
  id_gestor_agricolaGestor_agricola         number(3)    NOT NULL,
  CONSTRAINT pk_id_parcela_agricola PRIMARY KEY (id_parcela_agricola),
  CONSTRAINT ck_id_parcela_agricola_positivo CHECK (id_parcela_agricola > 0),
  CONSTRAINT ck_designacao CHECK (REGEXP_LIKE(designacao, '^[a-zA-Z ]*$')),
  CONSTRAINT ck_area_positivo CHECK (area > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cultura ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Cultura
(
  id_cultura                                    number(3) NOT NULL,
  id_parcela_agricolaParcela_agricola_Cult      number(3) NOT NULL,
  id_tipo_de_culturaTipo_de_cultura             number(3) NOT NULL,
  id_produtoProduto                             number(3) NOT NULL,
  CONSTRAINT pk_id_cultura PRIMARY KEY (id_cultura),
  CONSTRAINT ck_id_cultura CHECK (id_cultura > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cultura ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Cultura
(
  id_tipo_de_cultura            number(3)    NOT NULL,
  descricao_tipo_de_cultura     varchar2(10) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_cultura PRIMARY KEY (id_tipo_de_cultura),
  CONSTRAINT ck_id_tipo_de_cultura_positivo CHECK (id_tipo_de_cultura > 0),
  CONSTRAINT ck_descricao_tipo_de_cultura CHECK (REGEXP_LIKE(descricao_tipo_de_cultura, '^permanente|temporaria$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Edificio -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Edificio
(
  id_edificio                               number(10) NOT NULL,
  id_quintaQuinta_E                         number(3)  NOT NULL,
  id_tipo_de_edificioTipo_de_Edificio       number(1)  NOT NULL,
  CONSTRAINT pk_id_edificio PRIMARY KEY (id_edificio),
  CONSTRAINT ck_id_edificio_positivo CHECK (id_edificio > 0)
  ); 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Edificio ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Edificio
(
  id_tipo_de_edificio               number(1)    NOT NULL,
  descricao_do_tipo_de_edificio     varchar2(15) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_edificio PRIMARY KEY (id_tipo_de_edificio),
  CONSTRAINT ck_id_tipo_de_edificio_positivo CHECK (id_tipo_de_edificio > 0),
  CONSTRAINT ck_descricao_do_tipo_de_edificio CHECK (REGEXP_LIKE(descricao_do_tipo_de_edificio, '^estabulo|garagem|armazem|sistema de rega$'))
  );  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistema_de_Rega ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Sistema_de_Rega
(
  id_edificioEdificio_SR                                   number(3) NOT NULL,
  id_tipo_de_regaTipo_de_Rega                              number(1) NOT NULL,
  id_tipo_de_sistema_de_regaTipo_de_Sistema_de_Rega        number(1) NOT NULL,
  CONSTRAINT pk_id_edificioEdificio_SR PRIMARY KEY (id_edificioEdificio_SR)
  );  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Rega -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Rega
(
  id_tipo_de_rega               number(1)   NOT NULL,
  descricao_do_tipo_de_rega     varchar2(9) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_rega PRIMARY KEY (id_tipo_de_rega),
  CONSTRAINT ck_id_tipo_de_rega_positivo CHECK (id_tipo_de_rega > 0),
  CONSTRAINT ck_descricao_do_tipo_de_rega CHECK (REGEXP_LIKE(descricao_do_tipo_de_rega, '^gravidade|bombeada$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sistema_de_Rega --------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Sistema_de_Rega
(
  id_tipo_de_sistema_de_rega               number(1)    NOT NULL,
  descricao_do_tipo_de_sistema_de_rega     varchar2(12) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_sistema_de_rega PRIMARY KEY (id_tipo_de_sistema_de_rega),
  CONSTRAINT ck_id_tipo_de_sistema_de_rega_positivo CHECK (id_tipo_de_sistema_de_rega > 0),
  CONSTRAINT ck_descricao_do_tipo_de_sistema_de_rega CHECK (REGEXP_LIKE(descricao_do_tipo_de_sistema_de_rega, '^aspersao|gotejamento|pulverizacao$'))
  );  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rega ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Rega
(
  id_rega                                       number(10) NOT NULL,
  quantidade_de_rega                            float(10)  NOT NULL,
  tempo_de_rega                                 number(2)  NOT NULL,
  frequencia_de_rega                            number(10) NOT NULL,
  id_plano_de_regaPlano_de_Rega                 number(10) NOT NULL,
  id_edificioSistema_de_Rega_R                  number(3)  NOT NULL,
  CONSTRAINT pk_id_rega PRIMARY KEY (id_rega),
  CONSTRAINT ck_id_rega_positivo CHECK (id_rega > 0),
  CONSTRAINT ck_quantidade_de_rega_positivo CHECK (quantidade_de_rega > 0),
  CONSTRAINT ck_tempo_de_rega_positivo CHECK (tempo_de_rega > 0),
  CONSTRAINT ck_frequencia_de_rega_positivo CHECK (frequencia_de_rega > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plano_de_Rega ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Plano_de_Rega
(
  id_plano_de_rega                              number(10) NOT NULL,
  id_parcela_agricolaParcela_Agricola_PR        number(3)  NOT NULL,
  CONSTRAINT pk_id_plano_de_rega PRIMARY KEY (id_plano_de_rega),
  CONSTRAINT ck_id_plano_de_rega_positivo CHECK (id_plano_de_rega > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Operacao -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Operacao
(
  id_operacao                               number(10) NOT NULL,
  data_planeada                             date       NOT NULL,
  id_regaRega                               number(10) NOT NULL,
  id_caderno_de_campoCaderno_de_Campo       number(10) NOT NULL,
  id_tipo_de_operacaoTipo_de_Operacao       number(1)  NOT NULL,
  CONSTRAINT pk_id_operacao PRIMARY KEY (id_operacao),
  CONSTRAINT ck_id_operacao_positivo CHECK (id_operacao > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Operacao ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Operacao
(
  id_tipo_de_operacao               number(1)    NOT NULL,
  descricao_do_tipo_de_operacao     varchar2(13) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_operacao PRIMARY KEY (id_tipo_de_operacao),
  CONSTRAINT ck_id_tipo_de_operacao_positivo CHECK (id_tipo_de_operacao > 0),
  CONSTRAINT ck_descricao_do_tipo_de_operacao CHECK (REGEXP_LIKE(descricao_do_tipo_de_operacao, '^fertilizacao|sensor|colheita|rega$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Caderno_de_Campo ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Caderno_de_Campo
(
  id_caderno_de_Campo     number(10) NOT NULL,
  CONSTRAINT pk_id_caderno_de_Campo PRIMARY KEY (id_caderno_de_Campo),
  CONSTRAINT ck_id_caderno_de_Campo_positivo CHECK (id_caderno_de_Campo > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Colheita -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Colheita
(
  id_colheita                                   number(10) NOT NULL,
  quantidade_da_colheita                        float(10)  NOT NULL,
  id_operacaoOperacao_C                         number(10) NOT NULL,
  id_parcela_agricolaParcela_agricola_Colhe     number(3)  NOT NULL,
  CONSTRAINT pk_id_colheita PRIMARY KEY (id_colheita),
  CONSTRAINT ck_id_colheita_positivo CHECK (id_colheita > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Fertilizacao
(
  id_fertilizacao                                   number(10) NOT NULL,
  id_operacaoOperacao_F                             number(10) NOT NULL,
  id_edificioSistema_de_Rega_F                      number(3)  NOT NULL,
  id_tipo_de_fertilizacaoTipo_de_Fertilizacao       number(1)  NOT NULL,
  CONSTRAINT pk_id_fertilizacao PRIMARY KEY (id_fertilizacao),
  CONSTRAINT ck_id_fertilizacao_positivo CHECK (id_fertilizacao > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fertilizacao -----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Fertilizacao
(
  id_tipo_de_fertilizacao               number(1)    NOT NULL,
  descricao_do_tipo_de_fertilizacao     varchar2(24) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_fertilizacao PRIMARY KEY (id_tipo_de_fertilizacao),
  CONSTRAINT ck_id_tipo_de_fertilizacao_positivo CHECK (id_tipo_de_fertilizacao > 0),
  CONSTRAINT ck_descricao_do_tipo_de_fertilizacao CHECK (REGEXP_LIKE(descricao_do_tipo_de_fertilizacao, '^foliar|fertirrega|aplicacao direta ao solo$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao_Fator_de_Producao -------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Fertilizacao_Fator_de_Producao
(
  id_fertilizacaoFertilizacao               number(10) NOT NULL,
  id_produtoFator_de_Producao               number(3)  NOT NULL,
  quantidade_de_fator_de_producao           float(10)  NOT NULL,
  CONSTRAINT pk_id_fertilizacaoFertilizacao_id_produtoFator_de_Producao PRIMARY KEY (id_fertilizacaoFertilizacao, id_produtoFator_de_Producao),
  CONSTRAINT ck_quantidade_de_fator_de_producao_positivo CHECK (quantidade_de_fator_de_producao > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fator_de_Producao --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Fator_de_Producao
(
  id_produtoProduto_FP                                      number(3)    NOT NULL,
  nome_comercial                                            varchar2(20) NOT NULL,
  id_tipo_de_formulacaoTipo_de_Formulacao                   number(1)    NOT NULL,
  id_tipo_de_fator_de_producaoTipo_de_Fator_de_Producao     number(1)    NOT NULL,
  CONSTRAINT pk_id_produtoProduto_FP PRIMARY KEY (id_produtoProduto_FP),
  CONSTRAINT ck_nome_comercial CHECK (REGEXP_LIKE(nome_comercial, '^[a-zA-Z ]*$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fator_de_Producao ------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Fator_de_Producao
(
  id_tipo_de_fator_de_producao               number(1)    NOT NULL,
  descricao_do_tipo_de_fator_de_producao     varchar2(21) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_fator_de_producao PRIMARY KEY (id_tipo_de_fator_de_producao),
  CONSTRAINT ck_id_tipo_de_fator_de_producao_positivo CHECK (id_tipo_de_fator_de_producao > 0),
  CONSTRAINT ck_descricao_do_tipo_de_fator_de_producao CHECK (REGEXP_LIKE(descricao_do_tipo_de_fator_de_producao, '^fertilizante|adubo|corretivo|produto fitofarmaco$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Formulacao -------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Formulacao
(
  id_tipo_de_formulacao               number(1)   NOT NULL,
  descricao_do_tipo_de_formulacao     varchar2(9) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_formulacao PRIMARY KEY (id_tipo_de_formulacao),
  CONSTRAINT ck_id_tipo_de_formulacao_positivo CHECK (id_tipo_de_formulacao > 0),
  CONSTRAINT ck_descricao_do_tipo_de_formulacao CHECK (REGEXP_LIKE(descricao_do_tipo_de_formulacao, '^liquido|granulado|po$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ficha_Tecnica ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Ficha_Tecnica
(
  id_ficha_tecnica                              number(3)    NOT NULL,
  imagem                                        varchar2(50) NOT NULL,
  percentagem                                   float(10)    NOT NULL,
  id_produtoProduto_FT                          number(3)    NOT NULL,
  CONSTRAINT pk_id_ficha_tecnica PRIMARY KEY (id_ficha_tecnica),
  CONSTRAINT ck_id_ficha_tecnica_positivo CHECK (id_ficha_tecnica > 0),
  CONSTRAINT ck_imagem CHECK (REGEXP_LIKE(imagem, '^[a-zA-Z /.-]*$')),
  CONSTRAINT ck_percentagem_positivo CHECK (percentagem > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elemento_Substancia ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Elemento_Substancia
(
  id_elemento_substancia          number(3)    NOT NULL,
  nome                            varchar2(20) NOT NULL,
  id_ficha_tecnicaFicha_Tecnica   number(3)    NOT NULL,
  CONSTRAINT pk_id_elemento_substancia PRIMARY KEY (id_elemento_substancia),
  CONSTRAINT ck_id_elemento_substancia_positivo CHECK (id_elemento_substancia > 0),
  CONSTRAINT ck_nome CHECK (REGEXP_LIKE(nome, '^[a-zA-Z ]*$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Produto ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Produto
(
  id_produto                            number(3)    NOT NULL,
  descricao_do_produto                  varchar2(11) NOT NULL,
  preco_por_unidade                     float(10)    NOT NULL,
  id_tipo_de_produtoTipo_de_Produto     number(1)    NOT NULL,
  CONSTRAINT pk_id_produto PRIMARY KEY (id_produto),
  CONSTRAINT ck_id_produto_positivo CHECK (id_produto > 0),
  CONSTRAINT ck_descricao_do_produto CHECK (REGEXP_LIKE(descricao_do_produto, '^[a-zA-Z ]*$')),
  CONSTRAINT ck_preco_por_unidade_positivo CHECK (preco_por_unidade > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Produto ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Produto
(
  id_tipo_de_produto               number(1)    NOT NULL,
  descricao_do_tipo_de_produto     varchar2(17) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_produto PRIMARY KEY (id_tipo_de_produto),
  CONSTRAINT ck_id_tipo_de_produto_positivo CHECK (id_tipo_de_produto > 0),
  CONSTRAINT ck_descricao_do_tipo_de_produto CHECK (REGEXP_LIKE(descricao_do_tipo_de_produto, '^consumivel|fator de producao$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda_Produto --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Encomenda_Produto
(
  id_encomendaEncomenda_EP              number(10) NOT NULL,
  id_produtoProduto_EP                     number(3)  NOT NULL,
  quantidade_da_encomenda_produto       number(10) NOT NULL,
  CONSTRAINT pk_id_encomendaEncomenda_EP_id_produtoProduto PRIMARY KEY (id_encomendaEncomenda_EP, id_produtoProduto_EP),
  CONSTRAINT ck_quantidade_da_encomenda_produto_positivo CHECK (quantidade_da_encomenda_produto > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda ----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Encomenda
(
  id_encomenda                                  number(10) NOT NULL,
  data_da_encomenda                             date       NOT NULL,
  valor                                         float(10)  NOT NULL,
  id_estado_da_encomendaEstado_da_Encomenda     number(1)  NOT NULL,
  id_edificioEdificio                           number(3)  NOT NULL,
  nifCliente                                    number(9)  NOT NULL,
  CONSTRAINT pk_id_encomenda PRIMARY KEY (id_encomenda),
  CONSTRAINT ck_id_encomenda_positivo CHECK (id_encomenda > 0),
  CONSTRAINT ck_valor_positivo CHECK (valor > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estado_da_Encomenda ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Estado_da_Encomenda
(
  id_estado_da_encomenda               number(1)    NOT NULL,
  descricao_do_estado_da_encomenda     varchar2(20) NOT NULL UNIQUE,
  CONSTRAINT pk_id_estado_da_encomenda PRIMARY KEY (id_estado_da_encomenda),
  CONSTRAINT ck_id_estado_da_encomenda_positivo CHECK (id_estado_da_encomenda > 0),
  CONSTRAINT ck_descricao_do_estado_da_encomenda CHECK (REGEXP_LIKE(descricao_do_estado_da_encomenda, '^pago|entregue|registado$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Entrega ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Entrega
(
  id_entrega                    number(10) NOT NULL,
  data_da_entrega               date       NOT NULL,
  id_encomendaEncomenda_E       number(10) NOT NULL,
  id_condutorUtilizador         number(3)  NOT NULL,
  CONSTRAINT pk_id_entrega PRIMARY KEY (id_entrega),
  CONSTRAINT ck_id_entrega_positivo CHECK (id_entrega > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Condutor -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Condutor
(
  id_condutorUtilizador       number(3) NOT NULL,
  CONSTRAINT pk_id_condutorUtilizador PRIMARY KEY (id_condutorUtilizador)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gestor_Agricola ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Gestor_Agricola
(
  id_gestor_agricolaUtilizador       number(3) NOT NULL,
  CONSTRAINT pk_id_gestor_agricolaUtilizador PRIMARY KEY (id_gestor_agricolaUtilizador)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Hub ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Hub
(
  id_hubEdificio       number(3) NOT NULL,
  CONSTRAINT pk_id_hubEdificio PRIMARY KEY (id_hubEdificio)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cliente ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Cliente
(
  nif                                   number(9)    NOT NULL,
  nome                                  varchar2(30) NOT NULL,
  email                                 varchar2(30) NOT NULL UNIQUE,
  morada                                varchar2(20) NOT NULL,
  id_clienteUtilizador                  number(3)    NOT NULL,
  id_tipo_de_clienteTipo_de_Cliente     number(1)    NOT NULL,
  CONSTRAINT pk_nif PRIMARY KEY (nif),
  CONSTRAINT ck_nif CHECK (REGEXP_LIKE(nif, '^\d{9}$')),
  CONSTRAINT ck_nome_cliente CHECK (REGEXP_LIKE(nome, '^[a-zA-Z ]*$')),
  CONSTRAINT ck_email CHECK (REGEXP_LIKE(email, '^[A-Za-z]+[A-Za-z0-9.]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')),
  CONSTRAINT ck_morada CHECK (REGEXP_LIKE(morada, '^[a-zA-Z ]*$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cliente ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Cliente
(
  id_tipo_de_cliente               number(1)    NOT NULL,
  descricao_do_tipo_de_cliente     varchar2(10) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_cliente PRIMARY KEY (id_tipo_de_cliente),
  CONSTRAINT ck_id_tipo_de_cliente_positivo CHECK (id_tipo_de_cliente > 0),
  CONSTRAINT ck_descricao_do_tipo_de_cliente CHECK (REGEXP_LIKE(descricao_do_tipo_de_cliente, '^empresa|particular$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Utilizador ---------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Utilizador
(
  id_utilizador                             number(3)    NOT NULL,
  nome_do_utilizador                        varchar2(20) NOT NULL,
  id_tipo_de_utilizadorTipo_de_Utilizador      number(1)    NOT NULL,
  CONSTRAINT pk_id_utilizador PRIMARY KEY (id_utilizador),
  CONSTRAINT ck_id_utilizador_positivo CHECK (id_utilizador > 0),
  CONSTRAINT ck_nome_do_utilizador CHECK (REGEXP_LIKE(nome_do_utilizador, '^[a-zA-Z ]*$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Utilizador -------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Utilizador
(
  id_tipo_de_utilizador               number(1)    NOT NULL,
  descricao_do_tipo_de_utilizador     varchar2(22) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_utilizador PRIMARY KEY (id_tipo_de_utilizador),
  CONSTRAINT ck_id_tipo_de_utilizador_positivo CHECK (id_tipo_de_utilizador > 0),
  CONSTRAINT ck_descricao_do_tipo_de_utilizador CHECK (REGEXP_LIKE(descricao_do_tipo_de_utilizador, '^cliente|condutor|gestor agricola|gestor de distribuicao$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estacao_Meteorologica ----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Estacao_Meteorologica
(
  id_estacao_meteorologica      number(3) NOT NULL,
  id_quintaQuinta_EM            number(3) NOT NULL,
  CONSTRAINT pk_id_estacao_meteorologica PRIMARY KEY (id_estacao_meteorologica),
  CONSTRAINT ck_id_estacao_meteorologica_positivo CHECK (id_estacao_meteorologica > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Sensor
(
  valor_de_referencia                               number(10) NOT NULL,
  identificador_do_sensor                           varchar(5) NOT NULL,
  id_estacao_meteorologicaEstacao_Meteorologica     number(3)  NOT NULL,
  id_tipo_de_sensorTipo_de_sensor                   number(3)  NOT NULL,
  CONSTRAINT pk_valor_de_referencia PRIMARY KEY (valor_de_referencia),
  CONSTRAINT ck_valor_de_referencia_positivo CHECK (valor_de_referencia > 0),
  CONSTRAINT ck_identificador_do_sensor CHECK (REGEXP_LIKE(identificador_do_sensor, '^[a-zA-Z ]*$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor_Operacao ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Sensor_Operacao
(
  valor_de_referenciaSensor      number(10) NOT NULL,
  id_operacaoOperacao_S          number(10) NOT NULL,
  valor_lido                     number(3)  NOT NULL,
  instante_de_leitura            date    NOT NULL,
  CONSTRAINT pk_valor_de_referenciaSensor_id_operacaoOperacao_S PRIMARY KEY (valor_de_referenciaSensor, id_operacaoOperacao_S),
  CONSTRAINT ck_valor_lido_positivo CHECK (valor_lido > 0)
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sensor -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Tipo_de_Sensor
(
  id_tipo_de_sensor                 number(3)   NOT NULL,
  descricao_do_tipo_de_sensor       varchar2(2) NOT NULL UNIQUE,
  CONSTRAINT pk_id_tipo_de_sensor PRIMARY KEY (id_tipo_de_sensor),
  CONSTRAINT ck_id_tipo_de_sensor_positivo CHECK (id_tipo_de_sensor > 0),
  CONSTRAINT ck_descricao_do_tipo_de_sensor CHECK (REGEXP_LIKE(descricao_do_tipo_de_sensor, '^HS|PL|TS|VV|TA|HA|PA$'))
  );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- TODAS AS CHAVES ESTRANGEIRAS ---------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE Parcela_Agricola
ADD CONSTRAINT fk_id_quintaQuinta_PA FOREIGN KEY (id_quintaQuinta_PA) REFERENCES Quinta (id_quinta);

ALTER TABLE Parcela_Agricola
ADD CONSTRAINT fk_id_gestor_agricolaGestor_agricola FOREIGN KEY (id_gestor_agricolaGestor_agricola) REFERENCES Gestor_agricola (id_gestor_agricolaUtilizador);

ALTER TABLE Cultura
ADD CONSTRAINT fk_id_parcela_agricolaParcela_agricola_Cult FOREIGN KEY (id_parcela_agricolaParcela_agricola_Cult) REFERENCES Parcela_agricola (id_parcela_agricola);

ALTER TABLE Cultura
ADD CONSTRAINT fk_id_tipo_de_culturaTipo_de_cultura FOREIGN KEY (id_tipo_de_culturaTipo_de_cultura) REFERENCES Tipo_de_cultura (id_tipo_de_cultura);

ALTER TABLE Cultura
ADD CONSTRAINT fk_id_produtoProduto_C FOREIGN KEY (id_produtoProduto) REFERENCES Produto (id_produto);

ALTER TABLE Edificio
ADD CONSTRAINT fk_id_quintaQuinta_E FOREIGN KEY (id_quintaQuinta_E) REFERENCES Quinta (id_quinta);

ALTER TABLE Edificio
ADD CONSTRAINT fk_id_tipo_de_edificioTipo_de_Edificio FOREIGN KEY (id_tipo_de_edificioTipo_de_Edificio) REFERENCES Tipo_de_Edificio (id_tipo_de_edificio);

ALTER TABLE Sistema_de_Rega
ADD CONSTRAINT fk_id_edificioEdificio_SR FOREIGN KEY (id_edificioEdificio_SR) REFERENCES Edificio (id_edificio);

ALTER TABLE Sistema_de_Rega
ADD CONSTRAINT fk_id_tipo_de_regaTipo_de_Rega FOREIGN KEY (id_tipo_de_regaTipo_de_Rega) REFERENCES Tipo_de_Rega (id_tipo_de_rega);

ALTER TABLE Sistema_de_Rega
ADD CONSTRAINT fk_id_tipo_de_sistema_de_regaTipo_de_Sistema_de_Rega FOREIGN KEY (id_tipo_de_sistema_de_regaTipo_de_Sistema_de_Rega) REFERENCES Tipo_de_Sistema_de_Rega (id_tipo_de_sistema_de_rega);

ALTER TABLE Plano_de_Rega
ADD CONSTRAINT fk_id_parcela_agricolaParcela_Agricola_PR FOREIGN KEY (id_parcela_agricolaParcela_Agricola_PR) REFERENCES Parcela_Agricola (id_parcela_agricola);

ALTER TABLE Rega
ADD CONSTRAINT fk_id_edificioSistema_de_Rega_R FOREIGN KEY (id_edificioSistema_de_Rega_R) REFERENCES Sistema_de_Rega (id_edificioEdificio_SR);

ALTER TABLE Rega
ADD CONSTRAINT fk_id_plano_de_RegaPlano_de_Rega FOREIGN KEY (id_plano_de_RegaPlano_de_Rega) REFERENCES Plano_de_Rega (id_plano_de_Rega);

ALTER TABLE Operacao
ADD CONSTRAINT fk_id_regaRega FOREIGN KEY (id_regaRega) REFERENCES Rega (id_rega);

ALTER TABLE Operacao
ADD CONSTRAINT fk_id_caderno_de_campoCaderno_de_Campo FOREIGN KEY (id_caderno_de_campoCaderno_de_Campo) REFERENCES Caderno_de_Campo (id_caderno_de_campo);

ALTER TABLE Operacao
ADD CONSTRAINT fk_id_tipo_de_operacaoTipo_de_Operacao FOREIGN KEY (id_tipo_de_operacaoTipo_de_Operacao) REFERENCES Tipo_de_Operacao (id_tipo_de_operacao);

ALTER TABLE Colheita
ADD CONSTRAINT fk_id_operacaoOperacao_C FOREIGN KEY (id_operacaoOperacao_C) REFERENCES Operacao (id_operacao);

ALTER TABLE Colheita
ADD CONSTRAINT fk_id_parcela_agricolaParcela_agricola_Colhe FOREIGN KEY (id_parcela_agricolaParcela_agricola_Colhe) REFERENCES Parcela_agricola (id_parcela_agricola);

ALTER TABLE Fertilizacao
ADD CONSTRAINT fk_id_operacaoOperacao_F FOREIGN KEY (id_operacaoOperacao_F) REFERENCES Operacao (id_operacao);

ALTER TABLE Fertilizacao
ADD CONSTRAINT fk_id_edificioSistema_de_Rega_F FOREIGN KEY (id_edificioSistema_de_Rega_F) REFERENCES Sistema_de_Rega (id_edificioEdificio_SR);

ALTER TABLE Fertilizacao
ADD CONSTRAINT fk_id_tipo_de_fertilizacaoTipo_de_Fertilizacao FOREIGN KEY (id_tipo_de_fertilizacaoTipo_de_Fertilizacao) REFERENCES Tipo_de_Fertilizacao (id_tipo_de_fertilizacao);

ALTER TABLE Fertilizacao_Fator_de_Producao
ADD CONSTRAINT fk_id_fertilizacaoFertilizacao FOREIGN KEY (id_fertilizacaoFertilizacao) REFERENCES Fertilizacao (id_fertilizacao);

ALTER TABLE Fertilizacao_Fator_de_Producao
ADD CONSTRAINT fk_id_produtoFator_de_Producao FOREIGN KEY (id_produtoFator_de_Producao) REFERENCES Fator_de_Producao (id_produtoProduto_FP);

ALTER TABLE Fator_de_Producao
ADD CONSTRAINT fk_id_produtoProduto_FP FOREIGN KEY (id_produtoProduto_FP) REFERENCES Produto (id_produto);

ALTER TABLE Fator_de_Producao
ADD CONSTRAINT fk_id_tipo_de_formulacaoTipo_de_Formulacao FOREIGN KEY (id_tipo_de_formulacaoTipo_de_Formulacao) REFERENCES Tipo_de_Formulacao (id_tipo_de_formulacao);

ALTER TABLE Fator_de_Producao
ADD CONSTRAINT fk_id_tipo_de_fator_de_producaoTipo_de_Fator_de_Producao FOREIGN KEY (id_tipo_de_fator_de_producaoTipo_de_Fator_de_Producao) REFERENCES Tipo_de_Fator_de_Producao (id_tipo_de_fator_de_producao);

ALTER TABLE Ficha_Tecnica
ADD CONSTRAINT fk_id_produtoProduto_FT FOREIGN KEY (id_produtoProduto_FT) REFERENCES Fator_de_Producao (id_produtoProduto_FP);

ALTER TABLE Elemento_Substancia
ADD CONSTRAINT fk_id_ficha_tecnicaFicha_Tecnica FOREIGN KEY (id_ficha_tecnicaFicha_Tecnica) REFERENCES Ficha_Tecnica (id_ficha_tecnica);

ALTER TABLE Produto
ADD CONSTRAINT fk_id_tipo_de_produtoTipo_de_Produto FOREIGN KEY (id_tipo_de_produtoTipo_de_Produto) REFERENCES Tipo_de_Produto (id_tipo_de_produto);

ALTER TABLE Encomenda_Produto
ADD CONSTRAINT fk_id_encomendaEncomenda_EP FOREIGN KEY (id_encomendaEncomenda_EP) REFERENCES Encomenda (id_encomenda);

ALTER TABLE Encomenda_Produto
ADD CONSTRAINT fk_id_produtoProduto_EP FOREIGN KEY (id_produtoProduto_EP) REFERENCES Produto (id_produto);

ALTER TABLE Encomenda
ADD CONSTRAINT fk_id_estado_da_encomendaEstado_da_Encomenda FOREIGN KEY (id_estado_da_encomendaEstado_da_Encomenda) REFERENCES Estado_da_Encomenda (id_estado_da_encomenda);

ALTER TABLE Encomenda
ADD CONSTRAINT fk_id_edificioEdificio FOREIGN KEY (id_edificioEdificio) REFERENCES Edificio (id_edificio);

ALTER TABLE Encomenda
ADD CONSTRAINT fk_nifCliente FOREIGN KEY (nifCliente) REFERENCES Cliente (nif);

ALTER TABLE Entrega
ADD CONSTRAINT fk_id_encomendaEncomenda_E FOREIGN KEY (id_encomendaEncomenda_E) REFERENCES Encomenda (id_encomenda);

ALTER TABLE Entrega
ADD CONSTRAINT fk_id_condutorUtilizador FOREIGN KEY (id_condutorUtilizador) REFERENCES Condutor (id_condutorUtilizador);

ALTER TABLE Condutor
ADD CONSTRAINT fk_id_condutorUtilizador_C FOREIGN KEY (id_condutorUtilizador) REFERENCES Utilizador (id_utilizador);

ALTER TABLE Gestor_Agricola
ADD CONSTRAINT fk_id_gestor_agricolaUtilizador FOREIGN KEY (id_gestor_agricolaUtilizador) REFERENCES Utilizador (id_utilizador);

ALTER TABLE Hub
ADD CONSTRAINT fk_id_hubEdificio FOREIGN KEY (id_hubEdificio) REFERENCES Edificio (id_edificio);

ALTER TABLE Cliente
ADD CONSTRAINT fk_id_clienteUtilizador FOREIGN KEY (id_clienteUtilizador) REFERENCES Utilizador (id_utilizador);

ALTER TABLE Cliente
ADD CONSTRAINT fk_id_tipo_de_clienteTipo_de_Cliente FOREIGN KEY (id_tipo_de_clienteTipo_de_Cliente) REFERENCES Tipo_de_Cliente (id_tipo_de_cliente);

ALTER TABLE Utilizador
ADD CONSTRAINT fk_id_tipo_de_utilizadorTipo_de_Utilizador FOREIGN KEY (id_tipo_de_utilizadorTipo_de_Utilizador) REFERENCES Tipo_de_Utilizador (id_tipo_de_utilizador);

ALTER TABLE Estacao_Meteorologica
ADD CONSTRAINT fk_id_quintaQuinta_EM FOREIGN KEY (id_quintaQuinta_EM) REFERENCES Quinta (id_quinta);

ALTER TABLE Sensor
ADD CONSTRAINT fk_id_estacao_meteorologicaEstacao_Meteorologica FOREIGN KEY (id_estacao_meteorologicaEstacao_Meteorologica) REFERENCES Estacao_Meteorologica (id_estacao_meteorologica);

ALTER TABLE Sensor
ADD CONSTRAINT fk_id_tipo_de_sensorTipo_de_sensor FOREIGN KEY (id_tipo_de_sensorTipo_de_sensor) REFERENCES Tipo_de_sensor (id_tipo_de_sensor);

ALTER TABLE Sensor_Operacao
ADD CONSTRAINT fk_valor_de_referenciaSensor FOREIGN KEY (valor_de_referenciaSensor) REFERENCES Sensor (valor_de_referencia);

ALTER TABLE Sensor_Operacao
ADD CONSTRAINT fk_id_operacaoOperacao_S FOREIGN KEY (id_operacaoOperacao_S) REFERENCES Operacao (id_operacao);