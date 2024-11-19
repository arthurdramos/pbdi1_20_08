CALL sp_ola_procedures();
CALL  sp_ola_usuario();

CREATE OR REPLACE PROCEDURE sp_ola_usuario(p_nome VARCHAR(200))
LANGUAGE plpgsql
AS $$
BEGIN
RAISE NOTICE
    RAISE NOTICE 'Olá, %', p_nome;
    RAISE NOTICE 'Olá, %', $1;
END;
$$ 

CREATE OR REPLACE PROCEDURE sp_ola_procedures()
LANGUAGE plpgsql
AS $$ 
BEGIN 
    RAISE NOTICE 'Olá, procedures';
END; 
$$

