


SELECT 
    address.address_id,
    address.address,
    address.phone,
    city.city,
    city.city_id

FROM
    city
RIGHT JOIN
    address ON address.city_id =  city.city_id
WHERE city.city = 'Curitiba';
    