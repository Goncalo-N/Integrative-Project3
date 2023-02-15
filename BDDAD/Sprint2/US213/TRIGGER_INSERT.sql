-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Trigger que é executado quando uma operação de escrita do tipo INSERT é realizada
CREATE OR REPLACE TRIGGER 
ADICIONAR_INSERT_AUDITORIA
AFTER INSERT ON OPERACAO
FOR EACH ROW
DECLARE
    ID_OPERACAO                             OPERACAO.ID_OPERACAO%TYPE;
    DATA_PLANEADA                           OPERACAO.DATA_PLANEADA%TYPE;
    ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO     OPERACAO.ID_CADERNO_DE_CAMPOCADERNO_DE_CAMPO%TYPE;
    ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO     OPERACAO.ID_TIPO_DE_OPERACAOTIPO_DE_OPERACAO%TYPE;
    ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_O   OPERACAO.ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_O%TYPE;
    UTILIZ                                  PISTA_DE_AUDITORIA.UTILIZADOR%TYPE := USER();
    DATA_H                                  PISTA_DE_AUDITORIA.DATA_HORA%TYPE := SYSDATE();
    TIPO_DE_ALTER                           PISTA_DE_AUDITORIA.ID_TIPO_DE_ALTERACAOTIPO_DE_ALTERACAO%TYPE := 2;
    EX_ERRO EXCEPTION;
BEGIN
    --Se o id da operação da alteração for válido então executa
    IF (:NEW.ID_OPERACAO > 0) THEN

        INSERT INTO PISTA_DE_AUDITORIA VALUES (
        SEQ_PISTA_DE_AUDITORIA.NEXTVAL,
        UTILIZ,
        DATA_H,
        :NEW.ID_OPERACAO,
        :NEW.ID_PARCELA_AGRICOLAPARCELA_AGRICOLA_O,
        TIPO_DE_ALTER
        );

    END IF;
    
    EXCEPTION
        WHEN EX_ERRO THEN
            RAISE_APPLICATION_ERROR(-20006,'O ID DA OPERAÇÃO TEM QUE SER > 0');
END ADICIONAR_ALTERACAO_AUDITORIA;
