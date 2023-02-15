--------------------------------------------------
-- CREATES ---------------------------------------
--------------------------------------------------

DROP TABLE HUB CASCADE CONSTRAINTS;

DROP TABLE INPUT_HUB CASCADE CONSTRAINTS;

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

ALTER TABLE CLIENTE ADD CONSTRAINT FK_ID_HUB_DEFAULT FOREIGN KEY (ID_HUB_DEFAULT) REFERENCES HUB (LOC_ID);

ALTER TABLE ENCOMENDA ADD CONSTRAINT FK_HUB FOREIGN KEY (ID_HUB) REFERENCES HUB (LOC_ID);