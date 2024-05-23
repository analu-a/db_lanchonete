create database lanchoneteAAJV;
use lanchoneteAAJV;

create table ingredientes (
id_ingredientes int not null auto_increment primary key,
nome_ingrediente varchar(20) not null,
quantidade_ingredientes int not null,
marca_ingredientes varchar(45) not null,
data_validade date not null,
foto_ingrediente varchar(200) not null
);