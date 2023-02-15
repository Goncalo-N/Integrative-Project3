--------------------------------------------------
------------------- US216 ------------------------
--------------------------------------------------
--------------------------------------------------
--------------- drop de tabelas--------------------
--------------------------------------------------
DROP TABLE Parcela_agricola_DW CASCADE CONSTRAINTS;
DROP TABLE Cliente_DW CASCADE CONSTRAINTS;
DROP TABLE Cultura_DW CASCADE CONSTRAINTS;
DROP TABLE Tipo_de_cultura_DW CASCADE CONSTRAINTS;
DROP TABLE Hub_DW CASCADE CONSTRAINTS;
DROP TABLE Tipo_de_hub_DW CASCADE CONSTRAINTS;
DROP TABLE Produto_DW CASCADE CONSTRAINTS;
DROP TABLE Colheita_DW CASCADE CONSTRAINTS;
DROP TABLE Vendas CASCADE CONSTRAINTS;
--------------------------------------------------
--------------- criação de tabelas------------------
--------------------------------------------------
--------------------------------------------------
--------------parcela agricola----------------
--------------------------------------------------
CREATE TABLE Parcela_agricola_DW 
(
  id_parcela_agricola number(10), 
  PRIMARY KEY (id_parcela_agricola)
);
--------------------------------------------------
--------------- Cliente_DW ------------------------
-------------------------------------------------- 
CREATE TABLE Cliente_DW 
(
  id_cliente number(10) , 
  PRIMARY KEY (id_cliente)
);
--------------------------------------------------
--------------- Cultura_DW -----------------------
--------------------------------------------------
CREATE TABLE Cultura_DW 
(
  id_cultura      number(10) GENERATED AS IDENTITY, 
  id_tipo_de_cultura number(10) NOT NULL, 
  PRIMARY KEY (id_cultura)
);
--------------------------------------------------
--------------- tipo de cultura DW ------------------
-------------------------------------------------- 
CREATE TABLE Tipo_de_cultura_DW 
(
  id_tipo_de_cultura number(10) GENERATED AS IDENTITY, 
  descricao     varchar2(15) NOT NULL, 
  PRIMARY KEY (id_tipo_de_cultura)
);
--------------------------------------------------
--------------- Hub DW ---------------------------
--------------------------------------------------
CREATE TABLE Hub_DW 
(
  id_hub      number(10) GENERATED AS IDENTITY, 
  id_tipo_de_hub number(10) NOT NULL, 
  PRIMARY KEY (id_hub)
);
--------------------------------------------------
--------------- TIPO DE HUB DW-----------------------
--------------------------------------------------
CREATE TABLE Tipo_de_hub_DW 
(
  id_tipo_de_hub number(10) GENERATED AS IDENTITY, 
  descricao varchar2(15) NOT NULL, 
  PRIMARY KEY (id_tipo_de_hub)
);
--------------------------------------------------
--------------- Produto_DW -----------------------
--------------------------------------------------
CREATE TABLE Produto_DW
(
    id_produto         NUMBER GENERATED ALWAYS AS IDENTITY,
    descricao varchar2(30) NOT NULL,
    preco_por_unidade float(10)    NOT NULL,
    id_cultura  number(10) NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY (id_produto),
    CONSTRAINT ck_product_price_positive CHECK (preco_por_unidade > 0)
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
--------------- VENDAS ----------------------------
--------------------------------------------------
CREATE TABLE Vendas 
(
  id_Produto_DW number(10) NOT NULL, 
  id_Cliente_DW  number(10) NOT NULL, 
  id_hub   number(10),
  quantidade   number(10),
  data_de_venda      date      NOT NULL
);
--------------------------------------------------
--------------- ALL ALTER TABLE-------------------
--------------------------------------------------


ALTER TABLE Hub_DW ADD CONSTRAINT FKHub232396 
FOREIGN KEY (id_tipo_de_hub) REFERENCES Tipo_de_hub_DW (id_tipo_de_hub);

ALTER TABLE Colheita_DW ADD CONSTRAINT FKColheita482594 
FOREIGN KEY (id_Parcela_Agricola_DW) REFERENCES Parcela_agricola_DW (id_Parcela_Agricola);

ALTER TABLE Colheita_DW ADD CONSTRAINT FKColheita427815 
FOREIGN KEY (id_produto_dw) REFERENCES Produto_DW (id_produto);

ALTER TABLE Vendas ADD CONSTRAINT FKVendas278586 
FOREIGN KEY (id_cliente_DW) REFERENCES Cliente_DW (id_cliente);

ALTER TABLE Vendas ADD CONSTRAINT FKVendas410264 
FOREIGN KEY (id_produto_DW) REFERENCES Produto_DW (id_produto);

ALTER TABLE Produto_DW ADD CONSTRAINT FKProduto1983 
FOREIGN KEY (id_cultura) REFERENCES Cultura_DW (id_cultura);

ALTER TABLE Cultura_DW ADD CONSTRAINT FKCultura65867 
FOREIGN KEY (id_Tipo_de_Cultura) REFERENCES Tipo_de_cultura_DW (id_Tipo_de_Cultura);
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
-- Inserts para tipo de hub---------------------------
--------------------------------------------------
INSERT INTO Tipo_de_hub_DW(descricao)
VALUES ('Produtor');
INSERT INTO Tipo_de_hub_DW(descricao)
VALUES ('Companhia');
--------------------------------------------------
-- Inserts para HUB -------------------------------
--------------------------------------------------
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (1);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (1);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (1);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (1);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (1);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (2);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (2);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (2);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (2);
INSERT INTO Hub_DW(id_tipo_de_hub)
VALUES (2);
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
INSERT INTO Produto_DW(descricao , preco_por_unidade,id_cultura)
VALUES('Banana',0.99,1);
INSERT INTO Produto_DW(descricao , preco_por_unidade,id_cultura)
VALUES('Noz',4.75,2);
INSERT INTO Produto_DW(descricao , preco_por_unidade,id_cultura)
VALUES('Banana',1.20,3);
INSERT INTO Produto_DW(descricao , preco_por_unidade,id_cultura)
VALUES('Noz',5.30,4);
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
-- Valores de vendas ----------------------------------
--------------------------------------------------
--------------------------------------------------
------------------- 2015 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223445667,30,1,date'2015-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223445667,50,7,date'2015-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223665667,32,6,date'2015-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223665667,50,8,date'2015-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223412367,30,9,date'2015-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223412367,50,2,date'2015-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223445456,45,4,date'2015-04-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223445456,66,3,date'2015-04-25');
--------------------------------------------------
------------------- 2016 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223445667,36,3,date'2016-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223445667,60,9,date'2016-03-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223665667,45,2,date'2016-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223665667,55,7,date'2016-03-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223412367,45,8,date'2016-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223412367,78,9,date'2016-04-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223445456,89,6,date'2016-04-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223445456,80,1,date'2016-04-25');
--------------------------------------------------
------------------- 2017 -------------------------
--------------------------------------------------
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223445667,36,6,date'2017-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223445667,60,9,date'2017-05-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223665667,45,4,date'2017-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223665667,55,1,date'2017-05-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(1,223412367,45,7,date'2017-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(2,223412367,78,2,date'2017-06-30');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(3,223445456,89,3,date'2017-06-25');
INSERT INTO Vendas(id_produto_dw,id_cliente_dw, quantidade,id_hub, data_de_venda)
VALUES(4,223445456,80,3,date'2017-06-25');
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
--- a) Analisar a evolução das vendas mensais por tipo de cultura e hub? -------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
-- Progressão de vendas mensais ordenadas pelo tipo de cultura e hub -----------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT 
    EXTRACT(year FROM data_de_venda) AS year,
    EXTRACT(month FROM data_de_venda) AS month,
    SUM(vd.quantidade* pr.preco_por_unidade) AS valor_total,
    pr.descricao AS nome_de_produto,
    cult.descricao AS tipo_de_cultura,
    hubt.descricao AS tipo_de_hub,
    vd.id_produto_dw
FROM
	vendas vd, Tipo_de_cultura_dw cult, cultura_dw cul, produto_dw pr , hub_dw hb, Tipo_de_hub_dw hubt
WHERE vd.id_produto_dw = pr.id_produto
AND vd.id_hub = hb.id_hub
AND hubt.id_tipo_de_hub = hb.id_tipo_de_hub
AND cul.id_cultura = pr.id_cultura
AND cult.id_tipo_de_cultura = cul.id_tipo_de_cultura
AND vd.id_produto_dw = pr.id_produto
GROUP BY EXTRACT(year FROM data_de_venda),EXTRACT(month FROM data_de_venda),vd.ID_PRODUTO_DW,pr.descricao, cult.descricao,hubt.descricao
ORDER BY tipo_de_hub, tipo_de_cultura,EXTRACT(year FROM data_de_venda) ASC,EXTRACT(month FROM data_de_venda) ASC, vd.ID_PRODUTO_DW;
--------------------------------------------------
------------------- US216 ------------------------
--------------------------------------------------