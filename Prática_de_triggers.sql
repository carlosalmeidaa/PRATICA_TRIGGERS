 create database Jequiti;
 
 -- 1
 
 CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255),
    senha VARCHAR(255),
    avatar VARCHAR(255)
);

CREATE TABLE log (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    descricao TEXT
);


-- 2

DELIMITER $$ 
create trigger usuario_insert after insert
on usuario
for each row
begin 
		insert into log (descricao) values  ( 'registro inserido na tabela usuario' );
END
$$

DELIMITER $$ 
create trigger insert_email after insert
on usuario
for each row
begin
		insert into log (descricao) values (NEW.email );
END
$$


-- 3
DELIMITER $$ 
create trigger usuario_update after update
on usuario
for each row
begin
		insert into log (descricao) values (concat(NEW.email,"-", OLD.email));
END
$$


-- 4
DELIMITER $$ 
create trigger usuario_delete 
before delete on usuario
for each row
begin
		insert into log (descricao) values (OLD.id, OLD.senha, OLD.avatar);
END
$$



