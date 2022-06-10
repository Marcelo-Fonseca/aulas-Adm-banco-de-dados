



   /*    select 
    'Condicional logica AND - Restritiva'
    AS '';

    select 
        code,
        name,
        Continent
        LocalName
    from 
        country
     where
        Continent = 'Europe' AND 
        Name = 'Spain';          
*/

/*SELECT 
    'Condicional lógica OR' 
AS 
    '';


SELECT
    Code,
    Name,
    Continent
    LocalName
FROM
    country
WHERE
    Continent = 'Europe' OR 
    Continent = 'North America';*/

   /* SELECT 
        'cONDINIONAMENTO IN'
    AS  
        ''; 

    SELECT 
        Code,
        Name,
        Continent
        localName
    FROM
        country
     WHERE  
        continent IN('Asia','Africa', 'Oceania');*/


/*SELECT 
    'Condicionamento BETWEEN'
AS
    '';
SELECT 
    Population,
    Name,
    Continent
    LocalName

    FROM
        country
    WHERE 
    Population BETWEEn 5651000 AND 7651000;   */         


SELECT 
    'Combinando diferentes condicionais' 
AS 
    '';

select
    Population,    
    Name,
    Continent
    LocalName
FROM
    country
WHERE
    (Continent = 'Africa' OR Continent = 'Europe') AND     
    (Population BETWEEN 51000 AND 7651000) AND
    (Name IN ('Estonia','Gambia','Macedonia'))
;