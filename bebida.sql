-- Active: 1656617184079@@127.0.0.1@3306@bebida
/*Crie uma tabela que contem os seguintes dados:

Nome ta tabela: bebidas, com as seguintes colunas: id_bebida, tipo, marca, data de insercao (sempre com a data do dia)

Faça a inserção de três bebidas a seu gosto (ex. vodka, conhaque, cachaça)

Adicione a seguinte coluna depois da "marca": cor por default tem que ser transparente. Remova a coluna marca*/

/*Criar database bebidas */
DROP IF EXISTS bebida;
CREATE DATABASE IF NOT EXISTS bebida; CHARACTER set utf8 COLLATE utf8_general_ci;
USE bebida;

SELECT 'CRIAR TABELA BEBIDAS SE NÃO EXISTIR 'AS 'PRINT DADO';
/*criar tabela bebidas*/
CREATE TABLE IF NOT EXISTS bebidas; (
    id_bebida SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT;
    tipo VARCHAR(255),
    marca VARCHAR(255),
    data_entrada DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT 'ESTRUTURA DA TABELA ' AS 'PRINT DADO';
DESCRIBE bebidas;

SELECT 'incluir bebidas na tabela bebidas'AS 'PRINT DADO';

INSERT INTO 
    bebidas (
        tipo,
        marca,
        data_entrada
    )
    VALUES
    (
        'VODKA',
        'SMIRNOFF'
    ),
    (
        'CUNHAQUE',
        'DREHER'
    ),
    (
        'CACHAÇA',
        '51'

    );

    SELECT * FROM bebidas;

 SELECT 'INSERIR COLUNAS ' AS ' PRINT DADO';

    ALTER TABLE
        bebidas
    ADD COLUMN  cor VARCHAR(25) AFTER marca;

    SELECT TABLE bebidas;
    ALTER TABLE  bebidas;

    SELECT * from bebidas;
    


/*verificar que esta acontecendo esta dando erro na liha 28 e 49*/


   


