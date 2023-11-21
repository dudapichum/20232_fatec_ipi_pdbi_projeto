-- 1.5.3 Devolver o percentual de alunos que se preparam pelo menos um pouco para os "midterm exams" e que são aprovados (grade > 0)
CREATE OR REPLACE FUNCTION fn_students_prep_exam()
RETURNS NUMERIC
AS $$
DECLARE
    v_total_prep_exam INT;
    v_approved_prep_exam INT;
BEGIN
    SELECT COUNT(*) INTO v_total_prep_exam FROM student_performance WHERE PREP_EXAM IS NOT NULL;
    SELECT COUNT(*) INTO v_approved_prep_exam FROM student_performance WHERE PREP_EXAM IS NOT NULL AND GRADE > 0;

    IF v_total_prep_exam > 0 THEN
        RETURN (v_approved_prep_exam * 100.0 / v_total_prep_exam);
    ELSE
        RETURN 0;
    END IF;
END;
$$
LANGUAGE plpgsql;



--1.5.2 Responder se pelo menos 70% dos estudantes que fazem anotações durante as aulas são aprovados (grade > 0)
-- CREATE OR REPLACE FUNCTION fn_students_with_notes()
-- RETURNS BOOLEAN
-- AS $$
-- DECLARE
--     v_total_with_notes INT;
--     v_approved_with_notes INT;
--     v_percentage NUMERIC;
-- BEGIN
--     SELECT COUNT(*) INTO v_total_with_notes FROM student_performance WHERE NOTES IS NOT NULL;
--     SELECT COUNT(*) INTO v_approved_with_notes FROM student_performance WHERE NOTES IS NOT NULL AND GRADE > 0;
    
--     v_percentage := (v_approved_with_notes * 100.0 / v_total_with_notes);
    
--     RETURN v_percentage >= 70;
-- END;
-- $$
-- LANGUAGE plpgsql;


-- 1.5 Escrever as functions
-- 1.5.1 Responder se todos os estudantes de renda acima de 410 são aprovados (grade > 0)
-- CREATE OR REPLACE FUNCTION fn_students_above_salary()
-- RETURNS BOOLEAN
-- AS $$
-- BEGIN
--     RETURN NOT EXISTS (
--         SELECT 1 FROM student_performance WHERE SALARY > 410 AND GRADE <= 0
--     );
-- END;
-- $$
-- LANGUAGE plpgsql;


-- 1.4.3 Receber um sexo como parâmetro em modo IN e utilizar oito parâmetros em modo OUT para dizer qual o percentual de cada nota obtida por estudantes daquele sexo.
-- CREATE OR REPLACE PROCEDURE sp_percentage_notes_by_gender(
--     IN p_gender VARCHAR(10),
--     OUT p_note_0_1 NUMERIC,
--     OUT p_note_1_2 NUMERIC,
--     --... outros parâmetros OUT para notas
--     OUT p_note_9_10 NUMERIC
-- ) LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     SELECT
--         (COUNT(*) FILTER (WHERE GENDER = p_gender AND GRADE BETWEEN 0 AND 1) * 100.0 / COUNT(*)),
--         --... calcula outros percentuais de notas
--         (COUNT(*) FILTER (WHERE GENDER = p_gender AND GRADE BETWEEN 9 AND 10) * 100.0 / COUNT(*))
--     INTO
--         p_note_0_1,
--         --... atribuição para outros parâmetros OUT
--         p_note_9_10
--     FROM student_performance;
-- END;
-- $$;


-- 1.4.2 Exibir o percentual de estudantes de cada sexo
-- CREATE OR REPLACE PROCEDURE sp_percentage_by_gender
-- LANGUAGE plpgsql
-- AS $$
-- BEGIN
--     RAISE NOTICE 'Percentual de estudantes por sexo:';
--     PERFORM
--         RAISE NOTICE 'Masculino: %', (COUNT(*) FILTER (WHERE GENDER = 'M') * 100.0 / COUNT(*));
--     PERFORM
--         RAISE NOTICE 'Feminino: %', (COUNT(*) FILTER (WHERE GENDER = 'F') * 100.0 / COUNT(*));
-- END;
-- $$;


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
