CREATE table animales(
  id INTEGER PRIMARY key AUTOINCREMENT,
  tipo varchar(255),
  estado varchar(255)
  );
 
 -- este es un comentario
 Insert into animales (tipo, estado) VALUES ('perro', 'feliz');
 Insert into animales (tipo, estado) VALUES ('gato', 'feliz');
 Insert into animales (tipo, estado) VALUES ('conejo', 'triste');

SELECT * from animales;
SELECT * from animales where id=1;
SELECT * from animales where estado='feliz';
SELECT * from animales where estado='feliz' AND tipo='gato';

ALTER TABLE animales ADD nombre varchar(50);
UPDATE animales SET estado= 'feliz' WHERE id =3;
SELECT * from animales;

DELETE FROM animales WHERE id=3;

CREATE table user (
  id INTEGER not null PRIMARY KEY AUTOINCREMENT,
  name varchar(50) not null,
  edad int not NULL,
  email varchar(100) NOT NULL
  );

INSERT INTO user (name, edad, email) values ('Oscar', 25, 'oscar@gmail.com');
INSERT INTO user (name, edad, email) values ('Layla', 15, 'layla@gmail.com');
INSERT INTO user (name, edad, email) values ('Nicolas', 36, 'nicolas@gmail.com');
INSERT INTO user (name, edad, email) values ('Gaby', 7, 'gaby@gmail.com');

SELECT * from user;
select name, email from user;
SELECT * FROM user LIMIT 1;
SELECT * FROM user WHERE edad > 15;
SELECT * FROM user where edad >=15;
SELECT * FROM user where edad > 20 or email='layla@gmail.com';
SELECT * FROM user where email!='layla@gmail.com';
SELECT * FROM user where edad BETWEEN 15 and 30;
SELECT * FROM user where email like '%gmail%';
SELECT * FROM user where email like 'oscar%';

SELECT * FROM user ORDER BY edad asc;
SELECT * FROM user ORDER BY edad DESC;

SELECT max(edad) as mayor from USER;
SELECT name, min(edad) as menor from USER;

CREATE TABLE products(
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  name varchar(50)not NULL,
  created_by int NOT NULL,
  marca varchar(50) NOT NULL,
  FOREIGN KEY(created_by) REFERENCES user(id)
 );
 
INSERT INTO products(name, created_by, marca)
VALUES
	('ipad',1,'apple'),
    ('iphone',1,'apple'),
    ('watch',2,'apple'),
    ('macbook',1,'apple'),
    ('imac',3,'apple'),
    ('ipad mini', 2, 'apple');

SELECT * from products;

SELECT u.id, u.name, p.name as product from user u LEFT JOIN products p on u.id = p.created_by;
SELECT u.id, u.name, p.name as product from user u RIGHT JOIN products p on u.id = p.created_by;
SELECT u.id, u.name, p.name as product from user u INNER JOIN products p on u.id = p.created_by;

SELECT count(id), marca from products group by marca;

SELECT COUNT(p.id), u.name from products p LEFT join user u 
on u.id=p.created_by group by p.created_by;

SELECT COUNT(p.id), u.name from products p LEFT join user u 
on u.id=p.created_by group by p.created_by
HAVING COUNT(p.id)>=2;

DROP TABLE products;






