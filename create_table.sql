
DROP TABLE person;
CREATE TABLE person
(
    person_id SMALLINT UNSIGNED PRIMARY KEY autoincrement,
    fname VARCHAR(20),
    Idade VARCHAR(20),
    eye_color CHAR(2),
    birth_date DATE,
    street VARCHAR(30),
    city VARCHAR(20),
    state VARCHAR(20),
    country VARCHAR(20),
    postal_code VARCHAR(20),
    
);

DESCRIBE person;