/*creiar base*/
CREATE DATABASE IF NOT EXISTS update3;

USE update3;



/*---------------------------------------------------------------*/
/*MEU NOME VALOR*/
UPDATE 
   update3
SET 
/*O QUE É PARA ATUALIZAR*/
    temperatura = 29.1
WHERE 
    nome_cidade = 'Governador Valadares';

SELECT * FROM tempo_cidade WHERE nome_cidade = 'governador Valadare';  

UPDATE
tempo_cidade
SET
tempo = 'Chuva'
WHERE
tempo = 'Sol';

SELECT * FROM tempo_cidade;