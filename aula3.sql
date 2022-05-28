
/*creiar base se não existir*/
CREATE DATABASE IF NOT EXISTS aula3;

USE aula3; /*use a banco aula3*/

DROP TABLE tempo_cidade;/*Delete a tabela tempo_cidade*/
/*Criar tabela*/
CREATE TABLE IF NOT EXISTS tempo_cidade (
    id_tempo_cidade SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(100) NOT NULL,
    tempo ENUM('sol','nublado','chuva') NOT NULL DEFAULT 'sol', 
    temperatura FLOAT,
    record_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
/*inserir*/
INSERT INTO tempo_cidade 
    (
        nome_cidade,
        tempo,
        temperatura
    )
VALUES
    (
        'Curitiba',
        'sol',
        11.2
    ),

    (
        'Londrina',
        'sol',
        29.2
    ),

    (
        'Rio de Janeiro',
        'nublado',
        35.2
    ),

    (
        'Salvador',
        'sol',
        36.2
    ),

    (
        'Florianópolis',
        'chuva',
        15.2
    ),

    (
        'Porto Alegre',
        'nublado',
        5.2
    ),

    (
        'Cuiaba',
        'sol',
        30
    ),
    
    (
        'Governador Valadares',
        'sol',
        27.3
    )    
;

SELECT * FROM tempo_cidade;

/*---------------------------------------------------------------*/
/*MEU NOME VALOR*/
UPDATE 
    tempo_cidade
SET 
/*O QUE É PARA ATUALIZAR*/
    temperatura = 29.1
    /*sempre começar pelo where*/
WHERE 
    nome_cidade = 'Governador Valadares';
    tempo = 'nublado';

SELECT * FROM tempo_cidade WHERE nome_cidade = 'Governador Valadares';  

UPDATE
tempo_cidade
SET
tempo = 'Chuva'
WHERE
tempo = 'Sol';

SELECT * FROM tempo_cidade;



