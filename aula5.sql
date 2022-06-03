CREATE DATABASE IF NOT EXISTS aula5;

USE aula5;

DROP TABLE IF NOT EXISTS aula5tbl;
CREATE TABLE IF NOT EXISTS aula5tbl (
    nome           VARCHAR(100),
    eu_sou_notnull VARCHAR(100) NOT NULL
);


SELECT 'NOT NULL' as '';

INSERT aula5tbl
    (nome)
VALUES
    ('meu nome');

SELECT * FROM aula5tbl;



SELECT 'UNIQUE' as '';

ALTER TABLE 
    aula5tbl
ADD COLUMN sou_unique VARCHAR(255) UNIQUE;

DESCRIBE aula5tbl;

SELECT * FROM aula5tbl;

INSERT INTO aula5tbl
    (eu_sou_notnull, sou_unique)
VALUES
    ('only not null', 'sou-unico'),
    ('only not null', 'sou-unico');


        

