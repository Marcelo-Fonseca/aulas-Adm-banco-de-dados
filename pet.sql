/*Exercício
Crie um Script .sq com os seguintes objetivos

1 Cria uma base de dados chamada "pet" 2 Seleciona a base de dados 3 Crie uma tabela de dados" que possuem as seguintes colunas de chamada:

id_animal -> Inteira, chave primária, auto_increment
tipo -> enum [cachorro, gato]
nome -> varchar
data -> data de insert, sempre ocorre a data de hora que a inserção
4 insere os seguintes dados

1 Loirinho, cachorro 2 Frajola, gato*/

/*criar base*/
CREATE DATABASE IF NOT EXISTS pet;
USE pet;

/*CRIAR TABELA PET*/
CREATE TABLE IF NOT EXISTS animal (


    id_animal SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    date timesTamp,
    tipo enum('cachorro', 'gato')
    
);
/*inserir na tabela*/
INSERT INTO animal 
(
    nome,
    tipo


)
VALUES 
(
    'Loirinho',
    'cachorro'


),
(
    'Frajola', 
    'gato'

)
;
SELECT * FROM animal;

