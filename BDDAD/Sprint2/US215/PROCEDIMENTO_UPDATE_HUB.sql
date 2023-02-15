------------------PROCEDURE TO INSERT INTO HUB FROM INPUT_HUB ----------------------
CREATE OR REPLACE PROCEDURE GET_SPLIT_WORD AS
  CURSOR L_WORDS IS
    SELECT
      INPUT_STRING
    FROM
      INPUT_HUB;
  CURSOR CHECK_ID IS
    SELECT
      LOC_ID
    FROM
      HUB;
  CHECK_ID_ROW HUB.LOC_ID%TYPE;
  CHECK_ROW    VARCHAR2(25);
  L_LOC_ID     HUB.LOC_ID%TYPE;
  L_LAT        HUB.LAT%TYPE;
  L_LNG        HUB.LNG%TYPE;
  L_HUB_TYPE   HUB.TIPO_DE_HUB%TYPE;
  TEMP         INTEGER(10) := 0;
  TYPE T_STRING IS
    TABLE OF VARCHAR2 (25) INDEX BY BINARY_INTEGER;
  T_STR_ARRAY  T_STRING;
BEGIN  
  OPEN L_WORDS;
  LOOP
    FETCH L_WORDS INTO CHECK_ROW;
    EXIT WHEN L_WORDS%NOTFOUND;
    BEGIN
      FOR I IN 1 .. 4 LOOP
        T_STR_ARRAY (I) := GETSTRING(CHECK_ROW, I, TRUE, ';');
      END LOOP;
      IF T_STR_ARRAY(4) NOT LIKE 'C%' THEN
        IF CHECK_ID%ISOPEN THEN
          CLOSE CHECK_ID;
        END IF;
        
        OPEN CHECK_ID;
        LOOP
          FETCH CHECK_ID INTO CHECK_ID_ROW;
          EXIT WHEN CHECK_ID%NOTFOUND;
        
          IF T_STR_ARRAY(1) != CHECK_ID_ROW THEN
            TEMP := 1;
          END IF;
        END LOOP;
        
        IF CHECK_ID%ROWCOUNT != 0 THEN
            IF TEMP = 0 THEN
                UPDATE HUB A
                SET
                  A.LAT = TO_NUMBER(
                    T_STR_ARRAY(2),
                    '9999.99999999'
                  ),
                  A.LNG = TO_NUMBER(
                    T_STR_ARRAY(3),
                    '9999.99999999'
                  ),
                  A.TIPO_DE_HUB = T_STR_ARRAY(
                    4
                  )
                WHERE
                  L_LOC_ID = T_STR_ARRAY(
                    1
                  );
            END IF;
            IF TEMP = 1 THEN
                L_LOC_ID := T_STR_ARRAY(1);
                L_LAT := TO_NUMBER(T_STR_ARRAY(2), '9999.99999999');
                L_LNG := TO_NUMBER(T_STR_ARRAY(3), '9999.99999999');
                L_HUB_TYPE := T_STR_ARRAY(4);

                INSERT INTO HUB(
                  LOC_ID,
                  LAT,
                  LNG,
                  TIPO_DE_HUB
                ) VALUES(
                  L_LOC_ID,
                  L_LAT,
                  L_LNG,
                  L_HUB_TYPE
                );
            END IF;
        END IF;
        IF CHECK_ID%ROWCOUNT = 0 THEN
            L_LOC_ID := T_STR_ARRAY(1);
            L_LAT := TO_NUMBER(T_STR_ARRAY(2), '9999.99999999');
            L_LNG := TO_NUMBER(T_STR_ARRAY(3), '9999.99999999');
            L_HUB_TYPE := T_STR_ARRAY(4);
              
            INSERT INTO HUB(
              LOC_ID,
              LAT,
              LNG,
              TIPO_DE_HUB
            ) VALUES(
              L_LOC_ID,
              L_LAT,
              L_LNG,
              L_HUB_TYPE
            );
        END IF;
      END IF;
    END;
  END LOOP;
  CLOSE L_WORDS;
  CLOSE CHECK_ID;
END GET_SPLIT_WORD;

CALL GET_SPLIT_WORD();

SELECT * FROM HUB;