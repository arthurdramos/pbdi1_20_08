DO $$ 

DECLARE
  -- TESTAR
  -- 22102022: valida 
  -- 29022020: valida 2020 foi bissexto 
  -- 29012021: invalida, 2021 não foi bissexto 
  -- 31062023: invalida, junho não tem 31

  data INT := 31062021;
  dia INT;
  mes int;
  ano int; 
  data_valida BOOL := TRUE;
BEGIN 
  dia := data / 1000000;
  mes := data % 1000000 / 10000;
  ano := data % 10000; 
  RAISE NOTICE '%', dia;
  IF ano >= 1 THEN
    CASE 
      WHEN mes > 12 OR mes < 1 OR dia < 1 OR dia > 31 THEN
        data := FALSE;
      ELSE
        IF ((mes = 4 OR mes = 6 OR mes = 9 OR mes = 11) and dia > 30) THEN
          data_valida := FALSE; 
        ELSE
          IF mes = 2 THEN
            CASE 
              WHEN ((ano % 4 = 0 AND ano % 100 <> 0) OR ano % 400 = 0) THEN 
                IF data > 29 THEN 
                  data_valida := FALSE;
                END IF;
              ELSE 
                IF data > 28 THEN 
                  data_valida := FALSE; 
                END IF;
            END CASE;
        END IF; 

    END CASE;
  ELSE
    data_valida := FALSE; 
  END IF;
  
  CASE 
    WHEN data_Valida THEN 
      RAISE NOTICE '% é uma data válida', data;
    ELSE 
      RAISE NOTICE '% é uma data válida', data; 
  END CASE;

END;
$$
























-- DO $$ 
-- DECLARE 
--   a int := valor_aleatorio_entre(0,20);
--   b int := valor_aleatorio_entre(0,20);
--   c int := valor_aleatorio_entre(0,20);
--   delta numeric(10,2);
--   raizUm numeric(10,2);
--   raizDois numeric(10,2);
-- BEGIN 
--   RAISE NOTICE '%x% + %x + % = 0', a, U&'\00B2', b, c;
--   IF a = 0 then 
--     RAISE NOTICE 'Não é uma equação de segundo grau.';
--   else 
--     delta := (b ^ 2) - (4 * a * c);
--     RAISE NOTICE 'Delta: %', delta;
--     IF delta < 0 THEN 
--       RAISE NOTICE 'Nenhuma raiz';
--     ELSEIF delta = 0 THEN
--       raizUm := (-b + |/delta) / (2 * a);
--       RAISE NOTICE 'Uma raiz: %', raizUm;
--     ELSE 
--       raizUm := (-b + |/delta) / (2 * a);
--       raizDois := (-b + |/delta) / (2 * a);
--       RAISE NOTICE 'Duas raizes: % e %' raizUm, raizDois;
--     END IF;
--   end if;
-- END 
-- $$