CREATE TABLE A(
a_id int PRIMARY KEY auto_increment,
a_name VARCHAR(20) not NULL
);
INSERT into a(a_name) VALUES('A1'),('A2'),('A3'),('A4');

SELECT * from a;


CREATE TABLE B(
b_id int PRIMARY KEY auto_increment,
b_name VARCHAR(20) not NULL,
a_id int not null
);
INSERT into b(b_name,a_id)
VALUES('B1',1),('B2',1),('B3',2),('B4',6);

SELECT * FROM b;

SELECT a.a_id ,a.a_name , b.b_id , b.b_name,b.a_id
FROM a LEFT JOIN b on a.a_id = b . a_id

SELECT a.a_id ,a.a_name , b.b_id , b.b_name,b.a_id
FROM a right JOIN b on a.a_id = b . a_id;

SELECT a.a_id ,a.a_name , b.b_id , b.b_name,b.a_id
FROM b LEFT JOIN a on a.a_id = b . a_id;

select * from emp limit 3