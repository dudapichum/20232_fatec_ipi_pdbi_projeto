-- 1.3 Copiando os dados do arquivo .csv para a tabela
COPY Students (AGE, GENDER, SALARY, PREP_EXAM, NOTES, GRADE) FROM 'C:\Users\aluno\Documents\MariaEduarda\pdbi\projeto' DELIMITER ',' CSV HEADER;

-- PROJETO
-- 1.2 Criar uma tabela apropriada
CREATE TABLE student_performance (
    AGE INT,
    GENDER VARCHAR(10),
    SALARY NUMERIC,
    PREP_EXAM VARCHAR(50),
    NOTES VARCHAR(100),
    GRADE NUMERIC
);
