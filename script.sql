-- 1.4.2 Exibir o percentual de estudantes de cada sexo
CREATE OR REPLACE PROCEDURE sp_percentage_by_gender
LANGUAGE plpgsql
AS $$
BEGIN
    RAISE NOTICE 'Percentual de estudantes por sexo:';
    PERFORM
        RAISE NOTICE 'Masculino: %', (COUNT(*) FILTER (WHERE GENDER = 'M') * 100.0 / COUNT(*));
    PERFORM
        RAISE NOTICE 'Feminino: %', (COUNT(*) FILTER (WHERE GENDER = 'F') * 100.0 / COUNT(*));
END;
$$;


-- 1.4 Escrever os stored procedures
-- 1.4.1 Exibir o número de estudantes maiores de idade
-- CREATE OR REPLACE PROCEDURE sp_students_over_age
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
--     v_count INT;
-- BEGIN
--     SELECT COUNT(*) INTO v_count FROM student_performance WHERE AGE >= 18;
--     RAISE NOTICE 'Número de estudantes maiores de idade: %', v_count;
-- END;
-- $$;


-- 1.3 Copiando os dados do arquivo .csv para a tabela
-- COPY Students (AGE, GENDER, SALARY, PREP_EXAM, NOTES, GRADE) FROM 'C:\Users\aluno\Documents\MariaEduarda\pdbi\projeto' DELIMITER ',' CSV HEADER;

-- PROJETO
-- 1.2 Criar uma tabela apropriada
-- CREATE TABLE student_performance (
--     AGE INT,
--     GENDER VARCHAR(10),
--     SALARY NUMERIC,
--     PREP_EXAM VARCHAR(50),
--     NOTES VARCHAR(100),
--     GRADE NUMERIC
-- );
