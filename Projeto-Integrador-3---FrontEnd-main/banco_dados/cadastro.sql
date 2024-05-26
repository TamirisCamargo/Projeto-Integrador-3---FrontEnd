DECLARE
  VN_EXISTE NUMBER := 0;
  --
BEGIN
  BEGIN
    EXECUTE IMMEDIATE'
    SELECT COUNT(1)
      --INTO :VN_EXISTE
      FROM ALL_TABLES T
     WHERE UPPER(T.table_name) = ''CADASTRO'''
      INTO VN_EXISTE;
    --
  EXCEPTION
    WHEN OTHERS THEN
      VN_EXISTE := 0;
  END;
  --
  IF VN_EXISTE = 0 THEN
    -- Create table
    EXECUTE IMMEDIATE 'create table CADASTRO
                     (
                       id         number not null,
                       nome       varchar2(30) not null,
                       email      varchar2(20),
                       telefone   varchar2(15),
                       metal      varchar2(10),
                       observacao varchar2(100)
                     )'
                     ;
  END IF;
COMMIT;
--
EXCEPTION
  WHEN OTHERS THEN
    RAISE_APPLICATION_ERROR(-20000, 'Erro ao criar tabela CADASTRO. Erro: ' || SQLERRM);                     
END;
/
