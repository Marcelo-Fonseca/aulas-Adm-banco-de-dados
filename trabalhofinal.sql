DROP DATABASE trabalho_Final;
CREATE Database trabalho_final;

use trabalho_final;

/*---------------------------------tabela-Empresa---------ok-----------------------------------------------*/

 CREATE TABLE empresas
 (
    empresa_id INT PRIMARY KEY AUTO_INCREMENT ,
    empresa_nome VARCHAR(45)
    
);

INSERT INTO 
    empresas
    (
       empresa_nome
    )
    VALUES
   
        ('Garoto'),
        ('Aurora'),
        ('Ouro fino'),
        ('Cabloco')
   ; 

/*-----------------------------------Tabela-Produtos----------------------ok--------------------------------*/

 CREATE TABLE produtos
 (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_descricao VARCHAR(45) NOT NULL,
    produto_preco_compra FLOAT,
    produto_preco_venda FLOAT,
    produto_estoque INT,
    produto_empresa_id INT NOT NULL,
    FOREIGN KEY (produto_empresa_id)
        REFERENCES empresas (empresa_id)
);   

INSERT INTO produtos
    (
    produto_descricao, 
    produto_preco_compra, 
    produto_preco_venda, 
    produto_estoque, 
    produto_empresa_id
    )
    VALUES 
        ('Caixa de chocolate Gatoro 250g','5.00','9.99',5,'1'),
        ('Chocolate Baton ao leite caixa 30x16 16g','11,50','26,95',5,'1'),

        ('Linguiça churrasco 5kg','50.00','73,00',8,'2'),
        ('Pernil suino 1kg','8.00','19.90',8,'2'),
        ('Salsicha Aurora 400g','16.55','25.90',8,'2'), 
        
        ('Cafe Cabloco 500g','7.90','17,50',6,'3'),
	  ('Galão de agua mineral 20L','9,90','21,90',4,'4'),
	  ('Copo de agua  200ml','1.90','3.99',4,'4')


   ;

/*--------------------------------Tabela de Estado-------------ok---------------------------------------------*/

CREATE TABLE estados
 (
    estado_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    estado_nome VARCHAR(45)
    
);

INSERT INTO estados
    (
    estado_nome
    )
    VALUES 
        ('Paraná'),
        ('Santa Catarina'),
        ('São Paulo'),
        ('Rio de Janeiro')
   ;

/*------------------------------------Tabela de cidades----------------ok--------------------------------------*/
CREATE TABLE cidades
    (
        cidade_id INT NOT NULL AUTO_INCREMENT UNIQUE,
        cidade_nome VARCHAR(20),
        cidade_estado_id INT NOT NULL,
        FOREIGN KEY (cidade_Estado_id)
        REFERENCES estados (estado_id)
    );

INSERT INTO cidades
    (
        cidade_nome,
        cidade_estado_id
    )
    VALUES 

	  ('Curitiba', 1),
        ('Quatro Barras',1),
        ('Pinhais', 1),
        ('colombo', 1),
        ('sao jose dos pinhais', 1),
        ('Ponta Grossa', 1),
        ('Florianopolis', 2),
        ('Chapeco', 2),
        ('Sao Paulo ', 3),
        ('Taboao da Serra', 3),
	  ('Angra dos Reis', 4)
                    
        
   ;

/*--------------------------------Tabela de Cargos-------------------ok---------------------------------------*/

CREATE TABLE cargos
 (
    cargo_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    cargo_descricao VARCHAR(45) NOT NULL
);

INSERT INTO cargos
    (
        cargo_descricao
    )
    VALUES 
        ('Estoquista'),
        ('Secretário'),
        ('Vendedor')        
   ;

/*-------------------------------Tabela-Clientes------------------------ok-------------------------------*/   

CREATE TABLE clientes
 (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    cliente_nome VARCHAR(45) NOT NULL,
    cliente_cpf_cnpj VARCHAR(14) NOT NULL UNIQUE,
    cliente_telefone VARCHAR(13),
    cliente_endereco VARCHAR(45) NOT NULL,
    cliente_numero INT NOT NULL,
    cliente_cidade_id INT,
    FOREIGN KEY (cliente_cidade_id)
        REFERENCES cidades (cidade_id)
   
 );

INSERT INTO clientes
    (
        
        cliente_nome,
        cliente_cpf_cnpj,
        cliente_telefone,
        cliente_endereco,
        cliente_numero,
        cliente_cidade_id
    )
    VALUES 
        ('Marcelo Douglas', 12345678911 ,'41-999999999' ,  'Rua sei la' , 001 , 1 ),
        ('Roberta da Silva' , 11987654321 , '41-75062131' , 'Rua to sabendo ', 2323 , 2),
        ('Mercadinho gulinda' , 12123123000101 , '41-77777-7777' , 'rua teste', 92, 3),
        ('Supermecado Santa Helena' , 14121648500012 , '41-93333-2222' , 'jocoob mac' , 1245, 1)                
   ;

/*--------------------------Tabela de usuarios------------------------------ok----------------------------------*/   

CREATE TABLE usuarios
 (

    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(45) NOT NULL,
    usuario_cpf VARCHAR(11) NOT NULL UNIQUE,
    usuario_endereco VARCHAR(45) NOT NULL,
    usuario_numero INT NOT NULL,
    usuario_cidade_id INT,
    usuario_cargo_id INT,
    FOREIGN KEY (usuario_cidade_id)
        REFERENCES cidades (cidade_id),
    FOREIGN KEY (usuario_cargo_id)
        REFERENCES cargos (cargo_id)      
 );

INSERT INTO usuarios
    (
        usuario_nome,
        usuario_cpf,
        usuario_endereco,
        usuario_numero,
        usuario_cidade_id,
        usuario_cargo_id
    )
    VALUES 
        ('Roberto Carlos', 12345675911 , 'Rua tamu junto' , 03 , 1 ,3),
        ('Josefina da silva' , 25878963157 , 'Rua Airton Senna', 99 , 1,3),
        ('Marcos Roberto' , 3521487744 , 'Rua Joao Tabaco', 44, 2,1),
        ('Maria Aparecida' , 52135879411 , 'Rua To fazendo ' , 22, 3,2),                
        ('Madalena de Souza' , 63524178941 , 'Rua Nao lembro' , 155,3,1) 
   ;

/*----------------------Tabela de Vendas Usuario-----------------------ok---------------------------------------------*/   
 
 CREATE TABLE vendas_usuario
    (  
        venda_usuario_id INT AUTO_INCREMENT,
        venda_usuario_produto_id INT NOT NULL,
        venda_usuario_qtde INT NOT NULL,
        venda_usuario_valor_venda FLOAT NOT NULL,
        venda_usuario_valor_total FLOAT NOT NULL,
       venda_valor_cargo ENUM('1','2','3') DEFAULT NULL,
        FOREIGN KEY (venda_usuario_id)
            REFERENCES usuarios (usuario_id),
         FOREIGN KEY (venda_usuario_produto_id)
            REFERENCES produtos (produto_id)
    );

INSERT INTO vendas_usuario
    (
        venda_usuario_id,
        venda_usuario_produto_id,
        venda_usuario_qtde,
        venda_usuario_valor_venda,
        venda_usuario_valor_total,
        venda_valor_cargo
    )
    VALUES
        (1, 1 , 1 ,9.99 , 9.99 , 1),
        (2, 2 , 1 , 26.00 , 26.00 , 2),
        (2, 3 , 2 ,73.00 , 146.00 , 2),
        (3, 6 , 2 , 17.00 , 34.00 ,3),
        (3, 7, 1 , 21.00 , 21.00 , 3),
        (3, 4 , 2 , 19.90 ,39.80 , 3)
        
    ;
        
/*------------------tabela vendas_cliente-------------------ok-------------------------------------------------*/   
 CREATE TABLE vendas_clientes
    (  
        venda_cliente_id INT AUTO_INCREMENT UNIQUE,
        venda_cliente_cliente_id INT,
        venda_cliente_produto_id INT NOT NULL,
        venda_cliente_qtde INT NOT NULL,
        venda_cliente_valor_venda FLOAT NOT NULL,
        venda_cliente_valor_total FLOAT NOT NULL,
         FOREIGN KEY (venda_cliente_produto_id)
            REFERENCES produtos (produto_id)
    );

INSERT INTO vendas_clientes
    (  
        venda_cliente_cliente_id,
        venda_cliente_produto_id,
        venda_cliente_qtde,
        venda_cliente_valor_venda,
        venda_cliente_valor_total
    )
    VALUES
        (5, 1, 1 ,9.99 , 9.99),
        (6, 2, 2, 26.00 ,52.00),
        (7, 3, 1 , 21.00 , 21.00),
        (8, 6, 3 , 3.99 , 11.97)
        
    ;








/*------------------------QUERYS-----------------------------------------*/   

/*1 - Query traz o nome do cargo, o nome do usuário, o nome do produto - trazer todos.*/

SELECT
cargos.cargo_descricao,
usuarios.usuario_nome,
produtos.produto_descricao

FROM
cargos

inner JOIN usuarios
on  
usuarios.usuario_cargo_id = cargos.cargo_id


INNER JOIN produtos
ON 
produtos.produto_id = cargos.cargo_id;



/*2 - Query traz o nome do cargo, o nome do usuário, o nome do produto - trazer para o nome de um produto específico.*/

SELECT
cargos.cargo_descricao,
usuarios.usuario_nome,
produtos.produto_descricao

FROM
cargos

inner JOIN usuarios
on  
usuarios.usuario_cargo_id = cargos.cargo_id


INNER JOIN produtos
ON 
produtos.produto_id = 6;




/*3 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consome, o telefone do cliente
 e a quantidade do produto em estoque - trazer todos.*/


    SELECT
    
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    ;


    
  

/*4 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consumo, 
o telefone do cliente e a quantidade do produto em estoque - trazer para o nome de um cliente específico (pelo nome).*/


 SELECT
   
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    AND
    clientes.cliente_nome = 'Marcelo Douglas'

    ;


/*5 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consome, o telefone do 
cliente e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - adicione 2.*/


SELECT
   
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    AND
    clientes.cliente_nome IN ('Marcelo Douglas','Mercadinho gulinda')

    ;

/*-------------------------------------------------------------*/

/*6 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consumo, o telefone do 
cliente e a quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - adicione 2 com limite de 3 registros*/

SELECT
   
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    AND
    clientes.cliente_nome IN ('Marcelo Douglas','Mercadinho gulinda',)
    limit 3
    ;


/*7 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consumo, o telefone do cliente e a quantidade 
do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - adicione 2 com a ordenação orientada pela quantidade
de produtos sendo essa descendente.*/


SELECT
   
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    AND
    clientes.cliente_nome IN ('Marcelo Douglas','Mercadinho gulinda')

    ORDER BY
    vendas_clientes.venda_cliente_qtde
    DESC

    ;


/*8 - Query traz o nome do cliente, a empresa do cliente, o nome do produto que o cliente consumo, o telefone do cliente e a 
quantidade do produto em estoque - trazer para um conjunto de clientes (veja in) pelo nome - adicione 2 com a ordenação 
orientada pelo preço de compra (do maior para o menor).*/


SELECT
   
    clientes.cliente_nome,
    clientes.cliente_telefone,
    produtos.produto_descricao,
    produtos.produto_estoque,
    produtos.produto_preco_compra,     
    empresas.empresa_nome,
    vendas_clientes.venda_cliente_id

    FROM
    clientes, vendas_clientes, produtos, empresas
    

    WHERE    
    clientes.cliente_id = vendas_clientes.venda_cliente_produto_id

    AND
    vendas_clientes.venda_cliente_produto_id = produtos.produto_id
    
    AND
    produtos.produto_empresa_id = empresas.empresa_id

    AND
    clientes.cliente_nome IN ('Marcelo Douglas','Mercadinho gulinda')

    ORDER BY
    vendas_clientes.venda_cliente_valor_total
    DESC

    ;









