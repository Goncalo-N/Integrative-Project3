DECLARE
nome_da_tabela Varchar2(30);
 numero_de_linhas integer(10);
 erro_na_tabela EXCEPTION;
    BEGIN

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Quinta -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Quinta
VALUES (1);
INSERT INTO Quinta
VALUES (2);
INSERT INTO Quinta
VALUES (3);

Select count(*) INTO numero_de_linhas from Quinta;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Quinta: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Quinta';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cultura ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Cultura
VALUES (1,'temporaria');
INSERT INTO Tipo_de_Cultura
VALUES (2,'permanente');

Select count(*) INTO numero_de_linhas from Tipo_de_Cultura;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Cultura: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Cultura';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fator_de_Producao ------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Fator_de_Producao
VALUES (1,'fertilizante');
INSERT INTO Tipo_de_Fator_de_Producao
VALUES (2,'adubo');
INSERT INTO Tipo_de_Fator_de_Producao
VALUES (3,'corretivo');
INSERT INTO Tipo_de_Fator_de_Producao
VALUES (4,'produto fitofarmaco');

Select count(*) INTO numero_de_linhas from Tipo_de_Fator_de_Producao;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Fator_de_Producao: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Fator_de_Producao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Edificio ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Edificio
VALUES (1,'estabulo');
INSERT INTO Tipo_de_Edificio
VALUES (2,'garagem');
INSERT INTO Tipo_de_Edificio
VALUES (3,'armazem');
INSERT INTO Tipo_de_Edificio
VALUES (4,'sistema de rega');

Select count(*) INTO numero_de_linhas from Tipo_de_Edificio;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Edificio: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Edificio';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Rega -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Rega
VALUES (1,'gravidade');
INSERT INTO Tipo_de_Rega
VALUES (2,'bombeada');

Select count(*) INTO numero_de_linhas from Tipo_de_Rega;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Rega: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Rega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sistema_de_Rega --------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Sistema_de_Rega
VALUES (1,'aspersao');
INSERT INTO Tipo_de_Sistema_de_Rega
VALUES (2,'gotejamento');
INSERT INTO Tipo_de_Sistema_de_Rega
VALUES (3,'pulverizacao');

Select count(*) INTO numero_de_linhas from Tipo_de_Sistema_de_Rega;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Sistema_de_Rega: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Sistema_de_Rega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Operacao ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Operacao
VALUES (1,'fertilizacao');
INSERT INTO Tipo_de_Operacao
VALUES (2,'sensor');
INSERT INTO Tipo_de_Operacao
VALUES (3,'colheita');
INSERT INTO Tipo_de_Operacao
VALUES (4,'rega');

Select count(*) INTO numero_de_linhas from Tipo_de_Operacao;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Operacao: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Operacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Fertilizacao -----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Fertilizacao
VALUES (1,'foliar');
INSERT INTO Tipo_de_Fertilizacao
VALUES (2,'fertirrega');
INSERT INTO Tipo_de_Fertilizacao
VALUES (3,'aplicacao direta ao solo');

Select count(*) INTO numero_de_linhas from Tipo_de_Fertilizacao;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Fertilizacao: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Fertilizacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Formulacao -----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Formulacao
VALUES (1,'liquido');
INSERT INTO Tipo_de_Formulacao
VALUES (2,'granulado');
INSERT INTO Tipo_de_Formulacao
VALUES (3,'po');

Select count(*) INTO numero_de_linhas from Tipo_de_Formulacao;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Formulacao: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Formulacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Produto ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Produto
VALUES (1,'consumivel');
INSERT INTO Tipo_de_Produto
VALUES (2,'fator de producao');

Select count(*) INTO numero_de_linhas from Tipo_de_Produto;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Produto: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Produto';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estado_da_Encomenda ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Estado_da_Encomenda
VALUES (1,'pago');
INSERT INTO Estado_da_Encomenda
VALUES (2,'entregue');
INSERT INTO Estado_da_Encomenda
VALUES (3,'registado');

Select count(*) INTO numero_de_linhas from Estado_da_Encomenda;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Estado_da_Encomenda: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Estado_da_Encomenda';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Cliente ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Cliente
VALUES (1,'empresa');
INSERT INTO Tipo_de_Cliente
VALUES (2,'particular');

Select count(*) INTO numero_de_linhas from Tipo_de_Cliente;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Cliente: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Cliente';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Utilizador -------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Utilizador
VALUES (1,'cliente');
INSERT INTO Tipo_de_Utilizador
VALUES (2,'condutor');
INSERT INTO Tipo_de_Utilizador
VALUES (3,'gestor agricola');
INSERT INTO Tipo_de_Utilizador
VALUES (4,'gestor de distribuicao');

Select count(*) INTO numero_de_linhas from Tipo_de_Utilizador;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Utilizador: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Utilizador';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Utilizador ---------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Utilizador
VALUES (1,'Joao Pereira',1);
INSERT INTO Utilizador
VALUES (2,'Goncalo Freitas',2);
INSERT INTO Utilizador
VALUES (3,'Ana Amorim',3);
INSERT INTO Utilizador
VALUES (4,'Tiago Costa',4);

Select count(*) INTO numero_de_linhas from Utilizador;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Utilizador: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Utilizador';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Condutor -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Condutor
VALUES (2);

Select count(*) INTO numero_de_linhas from Condutor;
    IF(numero_de_linhas=1) THEN
      DBMS_OUTPUT.PUT_LINE('Condutor: ' || numero_de_linhas ||'/1');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Condutor';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Gestor_Agricola ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Gestor_Agricola
VALUES (3);

Select count(*) INTO numero_de_linhas from Gestor_Agricola;
    IF(numero_de_linhas=1) THEN
      DBMS_OUTPUT.PUT_LINE('Gestor_Agricola: ' || numero_de_linhas ||'/1');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Gestor_Agricola';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cliente ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Cliente
VALUES (123456789,'Guilherme Pereira','abc@gmail.com','Rua das Couves',1,2);

Select count(*) INTO numero_de_linhas from Cliente;
    IF(numero_de_linhas=1) THEN
      DBMS_OUTPUT.PUT_LINE('Cliente: ' || numero_de_linhas ||'/1');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Cliente';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Estacao_Meteorologica ----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Estacao_Meteorologica
VALUES (1,1);
INSERT INTO Estacao_Meteorologica
VALUES (2,2);
INSERT INTO Estacao_Meteorologica
VALUES (3,3);

Select count(*) INTO numero_de_linhas from Estacao_Meteorologica;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Estacao_Meteorologica: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Estacao_Meteorologica';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tipo_de_Sensor -----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Tipo_de_Sensor
VALUES (1,'HS');
INSERT INTO Tipo_de_Sensor
VALUES (2,'PL');
INSERT INTO Tipo_de_Sensor
VALUES (3,'TS');
INSERT INTO Tipo_de_Sensor
VALUES (4,'VV');
INSERT INTO Tipo_de_Sensor
VALUES (5,'TA');
INSERT INTO Tipo_de_Sensor
VALUES (6,'HA');
INSERT INTO Tipo_de_Sensor
VALUES (7,'PA');

Select count(*) INTO numero_de_linhas from Tipo_de_Sensor;
    IF(numero_de_linhas=7) THEN
      DBMS_OUTPUT.PUT_LINE('Tipo_de_Sensor: ' || numero_de_linhas ||'/7');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Tipo_de_Sensor';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor -------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Sensor
VALUES (1,'ABDSA',1,1);
INSERT INTO Sensor
VALUES (2,'DSGFS',1,7);

INSERT INTO Sensor
VALUES (3,'SDARS',2,3);
INSERT INTO Sensor
VALUES (4,'SDFFG',2,4);

INSERT INTO Sensor
VALUES (5,'EREGG',3,5);
INSERT INTO Sensor
VALUES (6,'IUIJA',3,1);

Select count(*) INTO numero_de_linhas from Sensor;
    IF(numero_de_linhas=6) THEN
      DBMS_OUTPUT.PUT_LINE('Sensor: ' || numero_de_linhas ||'/6');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Sensor';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Parcela_Agricola ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Parcela_Agricola
VALUES (1, 'A', 20, 1, 3);
INSERT INTO Parcela_Agricola
VALUES (2, 'B', 30, 1, 3);
INSERT INTO Parcela_Agricola
VALUES (3, 'C', 15, 1, 3);

INSERT INTO Parcela_Agricola
VALUES (4, 'D', 60, 2, 3);
INSERT INTO Parcela_Agricola
VALUES (5, 'E', 45, 2, 3);
INSERT INTO Parcela_Agricola
VALUES (6, 'F', 25, 2, 3);

INSERT INTO Parcela_Agricola
VALUES (7, 'G', 10, 3, 3);
INSERT INTO Parcela_Agricola
VALUES (8, 'H', 100, 3, 3);
INSERT INTO Parcela_Agricola
VALUES (9, 'I', 80, 3, 3);

Select count(*) INTO numero_de_linhas from Parcela_Agricola;
    IF(numero_de_linhas=9) THEN
      DBMS_OUTPUT.PUT_LINE('Parcela_Agricola: ' || numero_de_linhas ||'/9');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Parcela_Agricola';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Produto ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Produto
VALUES (1,'Couve',2,1);
INSERT INTO Produto
VALUES (2,'Guanito',5,2);
INSERT INTO Produto
VALUES (3,'Batata',15,1);

Select count(*) INTO numero_de_linhas from Produto;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Produto: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Produto';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cultura ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Cultura
VALUES (1,1,1,2);
INSERT INTO Cultura
VALUES (2,1,2,2);

INSERT INTO Cultura
VALUES (3,2,1,2);

INSERT INTO Cultura
VALUES (4,3,2,2);

INSERT INTO Cultura
VALUES (5,4,2,2);

INSERT INTO Cultura
VALUES (6,5,2,2);

INSERT INTO Cultura
VALUES (7,6,2,2);

INSERT INTO Cultura
VALUES (8,7,2,2);

INSERT INTO Cultura
VALUES (9,8,1,2);

INSERT INTO Cultura
VALUES (10,9,1,2);

Select count(*) INTO numero_de_linhas from Cultura;
    IF(numero_de_linhas=10) THEN
      DBMS_OUTPUT.PUT_LINE('Cultura: ' || numero_de_linhas ||'/10');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Cultura';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Edificio -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Edificio
VALUES (1,1,1);
INSERT INTO Edificio
VALUES (2,1,2);
INSERT INTO Edificio
VALUES (3,1,3);
INSERT INTO Edificio
VALUES (4,1,4);

INSERT INTO Edificio
VALUES (5,2,1);
INSERT INTO Edificio
VALUES (6,2,2);
INSERT INTO Edificio
VALUES (7,2,3);
INSERT INTO Edificio
VALUES (8,2,4);

INSERT INTO Edificio
VALUES (9,3,1);
INSERT INTO Edificio
VALUES (10,3,2);
INSERT INTO Edificio
VALUES (11,3,3);
INSERT INTO Edificio
VALUES (12,3,4);

Select count(*) INTO numero_de_linhas from Edificio;
    IF(numero_de_linhas=12) THEN
      DBMS_OUTPUT.PUT_LINE('Edificio: ' || numero_de_linhas ||'/12');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Edificio';
        RAISE erro_na_tabela;
    END IF;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sistema_de_Rega ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Sistema_de_Rega
VALUES (4,1,1);
INSERT INTO Sistema_de_Rega
VALUES (8,2,2);
INSERT INTO Sistema_de_Rega
VALUES (12,2,3);

Select count(*) INTO numero_de_linhas from Sistema_de_Rega;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Sistema_de_Rega: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Sistema_de_Rega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Plano_de_Rega ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Plano_de_Rega
VALUES (1,1);
INSERT INTO Plano_de_Rega
VALUES (2,1);

INSERT INTO Plano_de_Rega
VALUES (3,2);

INSERT INTO Plano_de_Rega
VALUES (4,3);

INSERT INTO Plano_de_Rega
VALUES (5,4);
INSERT INTO Plano_de_Rega
VALUES (6,4);

INSERT INTO Plano_de_Rega
VALUES (7,5);

INSERT INTO Plano_de_Rega
VALUES (8,6);

INSERT INTO Plano_de_Rega
VALUES (9,7);

INSERT INTO Plano_de_Rega
VALUES (10,8);

INSERT INTO Plano_de_Rega
VALUES (11,9);

Select count(*) INTO numero_de_linhas from Plano_de_Rega;
    IF(numero_de_linhas=11) THEN
      DBMS_OUTPUT.PUT_LINE('Plano_de_Rega: ' || numero_de_linhas ||'/11');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Plano_de_Rega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Rega ---------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Rega
VALUES (1,20,20,3,1,4);
INSERT INTO Rega
VALUES (2,50,60,5,1,8);
INSERT INTO Rega
VALUES (3,10,15,2,2,12);
INSERT INTO Rega
VALUES (4,5,10,1,2,8);

Select count(*) INTO numero_de_linhas from Rega;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Rega: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Rega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Caderno_de_Campo ---------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Caderno_de_Campo
VALUES (1);
INSERT INTO Caderno_de_Campo
VALUES (2);

Select count(*) INTO numero_de_linhas from Caderno_de_Campo;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Caderno_de_Campo: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Caderno_de_Campo';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Operacao -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Operacao
VALUES (1,date '2022-10-23',1,1,1);
INSERT INTO Operacao
VALUES (2,date '2022-11-02',2,1,2);
INSERT INTO Operacao
VALUES (3,date '2022-12-17',3,1,3);
INSERT INTO Operacao
VALUES (4,date '2023-12-26',4,2,4);

Select count(*) INTO numero_de_linhas from Operacao;
    IF(numero_de_linhas=4) THEN
      DBMS_OUTPUT.PUT_LINE('Operacao: ' || numero_de_linhas ||'/4');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Operacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Colheita -----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Colheita
VALUES (1,20,3,1);

Select count(*) INTO numero_de_linhas from Colheita;
    IF(numero_de_linhas=1) THEN
      DBMS_OUTPUT.PUT_LINE('Colheita: ' || numero_de_linhas ||'/1');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Colheita';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao -------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Fertilizacao
VALUES (1,1,4,1);

Select count(*) INTO numero_de_linhas from Fertilizacao;
    IF(numero_de_linhas=1) THEN
      DBMS_OUTPUT.PUT_LINE('Fertilizacao: ' || numero_de_linhas ||'/1');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Fertilizacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fator_de_Producao --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Fator_de_Producao
VALUES (1,'Guanito',1,1);
INSERT INTO Fator_de_Producao
VALUES (2,'Biofertilizante',2,1);
INSERT INTO Fator_de_Producao
VALUES (3,'Adubo mineral',3,2);

Select count(*) INTO numero_de_linhas from Fator_de_Producao;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Fator_de_Producao: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Fator_de_Producao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fertilizacao_Fator_de_Producao -------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Fertilizacao_Fator_de_Producao
VALUES (1,1,10);
INSERT INTO Fertilizacao_Fator_de_Producao
VALUES (1,3,20);

Select count(*) INTO numero_de_linhas from Fertilizacao_Fator_de_Producao;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Fertilizacao_Fator_de_Producao: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Fertilizacao_Fator_de_Producao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ficha_Tecnica ------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Ficha_Tecnica
VALUES (1,'url da imagem',10,1);
INSERT INTO Ficha_Tecnica
VALUES (2,'url da imagem',20,2);

Select count(*) INTO numero_de_linhas from Ficha_Tecnica;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Ficha_Tecnica: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Ficha_Tecnica';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda ----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Encomenda
VALUES (1,date '2022-01-12', 20, 1, 2, 123456789);
INSERT INTO Encomenda
VALUES (2,date '2022-10-05', 50, 2, 6, 123456789);

Select count(*) INTO numero_de_linhas from Encomenda;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Encomenda: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Encomenda';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Encomenda_Produto --------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Encomenda_Produto
VALUES (1,2,50);
INSERT INTO Encomenda_Produto
VALUES (1,1,20);
INSERT INTO Encomenda_Produto
VALUES (2,1,30);

Select count(*) INTO numero_de_linhas from Encomenda_Produto;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Encomenda_Produto: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Encomenda_Produto';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Entrega ------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Entrega
VALUES (1,date '2022-05-24', 1, 2);
INSERT INTO Entrega
VALUES (2,date '2022-11-21', 2, 2);

Select count(*) INTO numero_de_linhas from Entrega;
    IF(numero_de_linhas=2) THEN
      DBMS_OUTPUT.PUT_LINE('Entrega: ' || numero_de_linhas ||'/2');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Entrega';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Hub ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Hub
VALUES (3);
INSERT INTO Hub
VALUES (7);
INSERT INTO Hub
VALUES (11);

Select count(*) INTO numero_de_linhas from Hub;
    IF(numero_de_linhas=3) THEN
      DBMS_OUTPUT.PUT_LINE('Hub: ' || numero_de_linhas ||'/3');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Hub';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Sensor_Operacao ----------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Sensor_Operacao
VALUES (1,1,15,date '2022-09-21');
INSERT INTO Sensor_Operacao
VALUES (2,1,30,date '2022-09-21');
INSERT INTO Sensor_Operacao
VALUES (3,2,90,date '2022-12-11');
INSERT INTO Sensor_Operacao
VALUES (4,2,50,date '2022-12-11');
INSERT INTO Sensor_Operacao
VALUES (1,3,70,date '2022-06-29');
INSERT INTO Sensor_Operacao
VALUES (4,3,75,date '2022-06-29');

Select count(*) INTO numero_de_linhas from Sensor_Operacao;
    IF(numero_de_linhas=6) THEN
      DBMS_OUTPUT.PUT_LINE('Sensor_Operacao: ' || numero_de_linhas ||'/6');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Sensor_Operacao';
        RAISE erro_na_tabela;
    END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Elemento_Substancia ------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO Elemento_Substancia
VALUES (1,'Azoto organico',1);
INSERT INTO Elemento_Substancia
VALUES (2,'Pentoxido de Fosforo',1);
INSERT INTO Elemento_Substancia
VALUES (3,'Oxido de potassio',1);
INSERT INTO Elemento_Substancia
VALUES (4,'Materia Organica',2);
INSERT INTO Elemento_Substancia
VALUES (5,'Acidos Humicos',2);

Select count(*) INTO numero_de_linhas from Elemento_Substancia;
    IF(numero_de_linhas=5) THEN
      DBMS_OUTPUT.PUT_LINE('Elemento_Substancia: ' || numero_de_linhas ||'/5');
      numero_de_linhas:=0;
  ELSE
        nome_da_tabela:='Elemento_Substancia';
        RAISE erro_na_tabela;
    END IF;
END;