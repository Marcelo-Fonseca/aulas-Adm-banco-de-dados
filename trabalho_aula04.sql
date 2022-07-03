

/*Trabalho 02*/
/*Crie uma tabela que contem os seguintes dados:

Nome ta tabela: bebidas Seguintes colunas: id_bebida, tipo, marca, data de insercao (sempre com a data do dia)

Faça a inserção de três bebidas a seu gosto (ex. vodka, conhaque, cachaça)

Adicione a seguinte coluna depois da "marca": cor por default tem que ser transparente. Remova a coluna marca*/

CREATE DATABASE IF NOT EXISTS trabalho_aula04;


USE trabalho_aula04;

DROP TABLE IF EXISTS bebidas;

CREATE TABLE IF NOT EXISTS bebidas
(
    id_bebida SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    marca VARCHAR(20),
    data_insercao DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO
bebidas
(
    tipo,
    marca
)
VALUES
(
    'cerveja',
    'Brahma'
),
(
    'vodka',
    'Smirnoff'
),
(
    'Refrigerante',
    'Coca cola'
);

SELECT * FROM bebidas;

SELECT 'Alter table insert column' AS 'PRINT DADO';

ALTER TABLE
    bebidas
ADD COLUMN cor VARCHAR(20) NOT NULL DEFAULT 'transparente' AFTER marca;

DESCRIBE bebidas;

SELECT * FROM bebidas;