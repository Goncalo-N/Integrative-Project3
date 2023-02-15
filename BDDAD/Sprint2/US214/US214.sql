--------------------------------------------------
--------------- ALL DROP TABLE--------------------
--------------------------------------------------
DROP TABLE Parcela_Agricola_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Cliente_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Cultura_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Tipo_de_Cultura_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Produto_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Colheita_DW CASCADE CONSTRAINTS PURGE;
DROP TABLE Vendas CASCADE CONSTRAINTS PURGE;

--------------------------------------------------
--------------- ALL CREATE TABLE------------------
--------------------------------------------------

--------------------------------------------------
--------------- Parcela Agricola-----------------
--------------------------------------------------
CREATE TABLE Parcela_Agricola_DW
(
  id_parcela_agricola number(2) NOT NULL, 
  PRIMARY KEY (id_parcela_agricola)
);
--------------------------------------------------
--------------- Cliente_DW ------------------------
--------------------------------------------------  
CREATE TABLE Cliente_DW 
(
  id_cliente number(9) NOT NULL, 
  PRIMARY KEY (id_cliente)
);
--------------------------------------------------
--------------- Cultura_DW -----------------------
--------------------------------------------------
CREATE TABLE Cultura_DW 
(
  id_cultura             number(10) GENERATED AS IDENTITY, 
  id_Tipo_de_Cultura number(10) NOT NULL, 
  PRIMARY KEY (id_cultura)
);
--------------------------------------------------
--------------- Tipo_de_Cultura_DW ------------------
--------------------------------------------------  
CREATE TABLE Tipo_de_Cultura_DW
(
    id_tipo_de_cultura          NUMBER GENERATED ALWAYS AS IDENTITY,
    descricao varchar2(10) NOT NULL,
    CONSTRAINT pk_culture_type PRIMARY KEY (id_tipo_de_cultura)
);

--------------------------------------------------
--------------- Produto_DW -----------------------
--------------------------------------------------
CREATE TABLE Produto_DW
(
    id_produto          NUMBER GENERATED ALWAYS AS IDENTITY,
    descricao_do_produto varchar2(30) NOT NULL UNIQUE,
    preco_por_unidade  float(10)    NOT NULL,
    id_cultura  number(10) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id_produto),
    CONSTRAINT ck_product_preco_positivo CHECK (preco_por_unidade> 0)
);
--------------------------------------------------
--------------- PRODUCAO -----------------------
--------------------------------------------------
CREATE TABLE Colheita_DW
(
  id_Produto_DW           number(10) NOT NULL, 
  id_Parcela_Agricola_DW number(10) NOT NULL,
  quantidade		number(10),
  data_de_colheita         date      NOT NULL
);
--------------------------------------------------
--------------- Vendas----------------------------
--------------------------------------------------
CREATE TABLE Vendas 
(
  id_Produto_DW number(10) NOT NULL, 
  id_Cliente_DW  number(10) NOT NULL, 
  quantidade   number(10),
  data_de_venda      date      NOT NULL
);
--------------------------------------------------
--------------- Alteração de tabelas-------------------
--------------------------------------------------

ALTER TABLE Colheita_DW ADD CONSTRAINT fk_Producao_Parcela_Agricola_DW 
FOREIGN KEY (id_Parcela_Agricola_DW) REFERENCES Parcela_Agricola_DW (id_parcela_agricola);

ALTER TABLE Colheita_DW ADD CONSTRAINT fk_Colheita_Produto_DW 
FOREIGN KEY (id_Produto_DW) REFERENCES Produto_DW (id_produto);

ALTER TABLE Vendas ADD CONSTRAINT fk_vendas_Cliente_DW 
FOREIGN KEY (id_Cliente_DW) REFERENCES Cliente_DW (id_cliente);

ALTER TABLE Vendas ADD CONSTRAINT fk_vendas_Produto_DW 
FOREIGN KEY (id_Produto_DW) REFERENCES Produto_DW (id_produto);

ALTER TABLE Produto_DW ADD CONSTRAINT fk_Produto_Cultura_DW 
FOREIGN KEY (id_Cultura) REFERENCES Cultura_DW (id_cultura);

ALTER TABLE Cultura_DW ADD CONSTRAINT fk_Cultura_DW_Cultura_DW_Type_DW 
FOREIGN KEY (id_Tipo_de_Cultura) REFERENCES Tipo_de_Cultura_DW (id_tipo_de_cultura);
--------------------------------------------------
--------------- Inserts--------------------------
--------------------------------------------------
--------------------------------------------------
-- INSERTS para Tipo_de_Cultura-----------------------
--------------------------------------------------
INSERT INTO Tipo_de_Cultura_DW(descricao)
VALUES ('Temporaria');
INSERT INTO Tipo_de_Cultura_DW(descricao)
VALUES ('Permanente');
--------------------------------------------------
-- INSERTS para Cultura----------------------------
--------------------------------------------------
INSERT INTO Cultura_DW(id_tipo_de_cultura)
VALUES(1);
INSERT INTO Cultura_DW(id_tipo_de_cultura)
VALUES(1);
INSERT INTO Cultura_DW(id_tipo_de_cultura)
VALUES(2);
INSERT INTO Cultura_DW(id_tipo_de_cultura)
VALUES(2);
--------------------------------------------------
-- INSERTS para Produto----------------------------
--------------------------------------------------
INSERT INTO Produto_DW(descricao_do_produto , preco_por_unidade ,id_cultura)
VALUES('Banana',0.99,1);
INSERT INTO Produto_DW(descricao_do_produto , preco_por_unidade ,id_cultura)
VALUES('Noz',4.75,2);
INSERT INTO Produto_DW(descricao_do_produto , preco_por_unidade ,id_cultura)
VALUES('Fertilizante',2.64,3);
INSERT INTO Produto_DW(descricao_do_produto , preco_por_unidade ,id_cultura)
VALUES('Adobe',2.94,4);
--------------------------------------------------
-- INSERTS para Cliente-----------------------------
--------------------------------------------------
INSERT INTO cliente_dw(id_cliente)
VALUES (223445667);
INSERT INTO cliente_dw(id_cliente)
VALUES (223665667);
INSERT INTO cliente_dw(id_cliente)
VALUES (223412367);
INSERT INTO cliente_dw(id_cliente)
VALUES (223445456);
--------------------------------------------------
-- INSERTS para Parcela_Agricola------------------
--------------------------------------------------
INSERT INTO Parcela_Agricola_DW(id_parcela_agricola)
VALUES(1);
INSERT INTO Parcela_Agricola_DW(id_parcela_agricola)
VALUES(2);
INSERT INTO Parcela_Agricola_DW(id_parcela_agricola)
VALUES(3);
INSERT INTO Parcela_Agricola_DW(id_parcela_agricola)
VALUES(4);
INSERT INTO Parcela_Agricola_DW(id_parcela_agricola)
VALUES(5);
--------------------------------------------------
-- INSERTS PARA QUERIES---------------------
--------------------------------------------------
--------------------------------------------------
-- valores de colheira -----------------------------
------------------------------------------------
--  Parcela 1----Produto 1----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,35,date'2015-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,20,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,35,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,48,date'2016-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,50,date'2016-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,27,date'2017-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,27,date'2017-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,25,date'2018-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,25,date'2018-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,22,date'2019-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,22,date'2019-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,19,date'2020-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,19,date'2020-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,17,date'2021-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,17,date'2021-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,14,date'2022-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,1,14,date'2022-03-30');
--------------------------------------------------
-- Parcela 1----Produto 2----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,35,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,20,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,35,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,48,date'2016-06-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,48,date'2016-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,50,date'2016-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,27,date'2017-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,27,date'2017-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,55,date'2017-07-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,74,date'2018-08-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,25,date'2018-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,25,date'2018-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,88,date'2019-08-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,22,date'2019-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,22,date'2019-09-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,89,date'2020-05-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,19,date'2020-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,19,date'2020-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,97,date'2021-03-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,17,date'2021-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,17,date'2021-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,1,122,date'2022-04-02');
--------------------------------------------------
--  Parcela 1----Produto 2-----------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,30,date'2015-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,35,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,20,date'2015-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,35,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,48,date'2016-05-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,55,date'2017-06-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,32,date'2018-07-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,33,date'2019-07-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,45,date'2020-04-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,50,date'2021-02-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,1,54,date'2022-03-02');
--------------------------------------------------
--  Parcela 1----Produto 4------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,32,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,50,date'2016-04-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,57,date'2017-05-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,35,date'2018-06-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,36,date'2019-06-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,47,date'2020-03-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,52,date'2021-01-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,1,56,date'2022-02-02');
--------------------------------------------------
-- Parcela 2---Produto 1--------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,55,date'2015-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,67,date'2016-08-21');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,38,date'2017-08-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,35,date'2018-09-22');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,30,date'2019-09-29');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,25,date'2020-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,23,date'2021-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,2,20,date'2022-05-30');
--------------------------------------------------
-- Parcela 2----Produto 2-------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,50,date'2015-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,55,date'2016-07-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,78,date'2017-08-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,80,date'2018-09-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,100,date'2019-09-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,105,date'2020-06-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,155,date'2021-04-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,2,178,date'2022-05-02');
--------------------------------------------------
-- Parcela 2---Produto 3--------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,35,date'2015-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,55,date'2016-05-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,64,date'2017-06-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,40,date'2018-07-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,35,date'2019-07-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,50,date'2020-04-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,65,date'2021-02-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,2,70,date'2022-03-02');
--------------------------------------------------
-- Parcela 2----Produto 4-------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,33,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,55,date'2016-04-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,65,date'2017-05-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,45,date'2018-06-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,40,date'2019-06-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,52,date'2020-03-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,45,date'2021-01-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,2,78,date'2022-02-02');
--------------------------------------------------
-- Parcela 3----Produto 1-------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,35,date'2015-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,48,date'2016-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,27,date'2017-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,25,date'2018-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,22,date'2019-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,19,date'2020-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,17,date'2021-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,3,14,date'2022-04-30');
--------------------------------------------------
-- Parcela 3----Produto 2-------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,35,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,48,date'2016-06-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,55,date'2017-07-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,74,date'2018-08-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,88,date'2019-08-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,89,date'2020-05-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,97,date'2021-03-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,3,122,date'2022-04-02');
--------------------------------------------------
-- Parcela 3----Produto 3----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,30,date'2015-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,48,date'2016-05-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,55,date'2017-06-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,32,date'2018-07-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,33,date'2019-07-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,45,date'2020-04-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,50,date'2021-02-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,3,54,date'2022-03-02');
--------------------------------------------------
-- Parcela 3----Produto 4-------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,32,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,50,date'2016-04-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,57,date'2017-05-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,35,date'2018-06-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,36,date'2019-06-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,47,date'2020-03-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,52,date'2021-01-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,3,56,date'2022-02-02');
--------------------------------------------------
-- Parcela 4----Produto 1----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,30,date'2015-06-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,43,date'2016-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,22,date'2017-07-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,20,date'2018-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,17,date'2019-08-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,14,date'2020-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,12,date'2021-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(1,4,9,date'2022-04-30');
--------------------------------------------------
-- Parcela 4----Produto 2----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,30,date'2015-05-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,42,date'2016-06-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,50,date'2017-07-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,69,date'2018-08-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,83,date'2019-08-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,84,date'2020-05-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,92,date'2021-03-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(2,4,12,date'2022-04-02');
--------------------------------------------------
-- Parcela 4----Produto 3----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,25,date'2015-04-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,30,date'2016-05-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,25,date'2017-06-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,24,date'2018-07-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,30,date'2019-07-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,37,date'2020-04-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,42,date'2021-02-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(3,4,49,date'2022-03-02');
--------------------------------------------------
-- Parcela 4----Produto 4----------------------------
--------------------------------------------------
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,30,date'2015-03-30');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,20,date'2016-04-23');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,10,date'2017-05-12');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,5,date'2018-06-15');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,2,date'2019-06-17');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,2,date'2020-03-28');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,1,date'2021-01-10');
INSERT INTO Colheita_DW(id_produto_dw,id_parcela_agricola_dw,quantidade,data_de_colheita)
VALUES(4,4,0,date'2022-02-02');
--------------------------------------------------
-- Valores de Vendas ----------------------------------
--------------------------------------------------
--------------------------------------------------
------------------- 2015 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,30,date'2015-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,50,date'2015-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,32,date'2015-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223665667,50,date'2015-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,30,date'2015-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,50,date'2015-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,45,date'2015-04-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,66,date'2015-04-25');
--------------------------------------------------
------------------- 2016 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,36,date'2016-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,60,date'2016-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,45,date'2016-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223665667,55,date'2016-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,45,date'2016-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,78,date'2016-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,89,date'2016-04-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,80,date'2016-04-25');
--------------------------------------------------
------------------- 2017 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,36,date'2017-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,60,date'2017-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,45,date'2017-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223665667,55,date'2017-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,45,date'2017-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,78,date'2017-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,89,date'2017-06-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,80,date'2017-06-25');
--------------------------------------------------
------------------- 2018 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,36,date'2018-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,60,date'2018-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,45,date'2018-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223665667,55,date'2018-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,45,date'2018-06-30');
--------------------------------------------------
------------------- 2019 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,20,date'2019-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,50,date'2019-05-30');
--------------------------------------------------
------------------- 2020 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223445667,10,date'2020-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,30,date'2020-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,20,date'2020-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223665667,10,date'2020-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,15,date'2020-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,20,date'2020-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,30,date'2020-06-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,45,date'2020-06-25');
--------------------------------------------------
------------------- 2021 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,30,date'2021-09-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,20,date'2021-07-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,15,date'2021-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,20,date'2021-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,30,date'2021-07-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,45,date'2021-07-25');
--------------------------------------------------
------------------- 2022 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223445667,2,date'2022-09-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223665667,3,date'2022-07-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(1,223412367,5,date'2022-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(2,223412367,2,date'2022-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(3,223445456,1,date'2022-07-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade, data_de_venda)
VALUES(4,223445456,2,date'2022-07-25');
--------------------------------------------------
--------------- QUERIES --------------------------
--------------------------------------------------
-- lista de produtos com informação persistente ---
--------------------------------------------------
SELECT DISTINCT 
pr.id_produto AS id_de_produto, 
pr.descricao_do_produto AS nome_de_produto,
ct.descricao AS tipo_de_cultura, 
pr.preco_por_unidade
FROM PRODUTO_DW pr, Tipo_de_Cultura_DW ct, Cultura_DW cul
WHERE ct.id_tipo_de_cultura = cul.id_tipo_de_cultura 
AND pr.id_cultura = cul.id_cultura
ORDER BY id_de_produto;
--------------------------------------------------
--------- listagem de parcelas agricolas --------------
--------------------------------------------------
SELECT * FROM Parcela_Agricola_DW;
--------------------------------------------------
--------- lista de soma de vendas anuais ----------
--------------------------------------------------
SELECT 
EXTRACT(year FROM data_de_venda) AS year,
SUM(vd.quantidade * pr.preco_por_unidade) AS valor_total
FROM
vendas vd,
produto_dw pr
WHERE pr.id_produto = vd.id_produto_dw
AND vd.id_produto_dw = pr.id_produto
GROUP BY  EXTRACT(year FROM data_de_venda)
ORDER BY EXTRACT(year FROM data_de_venda);

------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
--- a) Qual é a evolução da produção de uma determinada cultura num determinado setor ao longo dos últimos cinco anos?
 ---------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE crescimentoultimoscinco(parcela_agricola_id colheita_dw.id_parcela_agricola_dw%TYPE,
                                                                   produto_id colheita_dw.id_produto_dw%TYPE)
 AS
CURSOR ultimoscinco IS SELECT DISTINCT
    EXTRACT(year FROM data_de_colheita) AS year,
    SUM(cl.quantidade) AS total_colheita,
	cl.id_parcela_agricola_dw,
	pr.descricao_do_produto AS nome_de_produto,
    cult.descricao AS tipo_de_cultura,
    cl.id_produto_dw
FROM
    colheita_dw cl, Tipo_de_cultura_dw cult, cultura_dw cul, produto_dw pr   
WHERE cl.id_produto_dw = pr.id_produto
AND EXTRACT(year FROM cl.data_de_colheita) >= EXTRACT(YEAR FROM sysdate) -5
AND cul.id_cultura = pr.id_cultura
AND cult.id_tipo_de_cultura = cul.id_tipo_de_cultura
AND cl.id_parcela_agricola_dw = parcela_agricola_id
AND cl.id_produto_dw = produto_id
GROUP BY EXTRACT(year FROM data_de_colheita), cl.ID_parcela_agricola_dw,cl.ID_produto_dw,pr.descricao_do_produto, cult.descricao 
ORDER BY EXTRACT(year FROM data_de_colheita) ASC, cl.ID_parcela_agricola_dw,cl.ID_produto_dw;

c_row ultimoscinco%rowtype;

  begin
  OPEN ultimoscinco;
  DBMS_OUTPUT.PUT_LINE('evolucao ultimos cinco anos' ||'Id da parcela'|| parcela_agricola_id|| '             ID = '|| produto_id);
  loop
    FETCH ultimoscinco into c_row;
    EXIT WHEN ultimoscinco%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE( 'Ano: ' || c_row.year || '     |Total Colheita: '|| c_row.total_colheita || '     |Nome de Produto:  '|| c_row.nome_de_produto || '     |Tipo de cultura: '|| c_row.tipo_de_cultura);
  end loop;
  CLOSE ultimoscinco;
    END crescimentoultimoscinco;
/

----------------------------------------------------
--chama funcao para testar a visao do crescimento----
--------------------------------------------------
call crescimentoultimoscinco (1,1);
call crescimentoultimoscinco (2,1);
call crescimentoultimoscinco (1,3);
call crescimentoultimoscinco (1,4);
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
--- b) Comparar as vendas de um ano com outro? -------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE comparar_dois_anos(ano1 number, ano2 number)
 AS
CURSOR compdois IS SELECT 
EXTRACT(year FROM data_de_venda) AS year,
SUM(vd.quantidade * pr.preco_por_unidade) AS total_value
FROM
vendas vd,
produto_dw pr
WHERE pr.id_produto = vd.id_produto_dw
AND vd.id_produto_dw = pr.id_produto
GROUP BY  EXTRACT(year FROM data_de_venda)
ORDER BY EXTRACT(year FROM data_de_venda);

c_row compdois%rowtype;

  begin
  OPEN compdois;
  DBMS_OUTPUT.PUT_LINE(' comparação de dois anos de colheita em euros');
  loop
    FETCH compdois into c_row;
    EXIT WHEN compdois%NOTFOUND;
    if c_row.year = ano1 THEN
      DBMS_OUTPUT.PUT_LINE( 'Ano: ' || c_row.year || '     |Total de Vendas value: '|| c_row.total_value);
    elsif 
      c_row.year = ano2 THEN
      DBMS_OUTPUT.PUT_LINE( 'Ano: ' || c_row.year || '     |Total de Vendas value: '|| c_row.total_value);
    end if; 
  end loop;
  CLOSE compdois;
    END comparar_dois_anos;
/
--------------------------------------------------------------------
-- Chama funcao para testar a comparação de vendas entre dois anos -
--------------------------------------------------------------------
call comparar_dois_anos(2019,2021);
call comparar_dois_anos(2015,2020);
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
--- c) Analisar a evolução das vendas mensais por tipo de cultura?------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Atraves desta query é possivel ver a progressão de vendas mensais ordenadas por tipo de cultura-------------------------------------------------
--------------------------------------------------
SELECT 
    EXTRACT(year FROM data_de_venda) AS year,
    EXTRACT(month FROM data_de_venda) AS month,
    SUM(vd.quantidade* pr.preco_por_unidade) AS total_value,
    pr.descricao_do_produto AS produto_name,
    cult.descricao AS tipo_de_cultura,
    vd.id_produto_dw
FROM
	vendas vd, Tipo_de_cultura_dw cult, cultura_dw cul, produto_dw pr   
WHERE vd.id_produto_dw = pr.id_produto
AND cul.id_cultura = pr.id_cultura
AND cult.id_tipo_de_cultura = cul.id_tipo_de_cultura
AND vd.id_produto_dw = pr.id_produto
GROUP BY EXTRACT(year FROM data_de_venda),EXTRACT(month FROM data_de_venda),vd.ID_produto_dw,pr.descricao_do_produto, cult.descricao 
ORDER BY tipo_de_cultura, EXTRACT(year FROM data_de_venda) ASC,EXTRACT(month FROM data_de_venda) ASC, vd.ID_produto_dw;
