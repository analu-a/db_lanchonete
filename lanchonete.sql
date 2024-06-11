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

insert into ingredientes(
nome_ingrediente,
quantidade_ingredientes,
marca_ingredientes,
data_validade,
foto_ingrediente 
) values (
"Maionese",
"10",
"Heinz",
"2024-12-09",
"https://covabra.vtexassets.com/arquivos/ids/168371-800-450?v=638107421032730000&width=800&height=450&aspect=true"
);

create table produtos (
idProduto int not null auto_increment primary key,
nomeProduto varchar(20) not null,
descricaoProduto varchar(100) not null,
precoProduto float not null,
fotoProduto varchar(200)
);

insert into produtos (
nomeProduto,
descricaoProduto,
precoProduto,
fotoProduto) values (
"Coxinha",
"Nossa deliciosa e crocante coxinha é de dar água na boca",
"5.00",
"https://panattos.com.br/uploads/produtos/2017/03/coxinha-de-frango-com-requeijao-mini-congelada.jpg"
);

create table categorias (
idCategorias int not null auto_increment primary key,
nomeCategoria varchar(45) not null
);

insert into categorias (
nomeCategoria
) values (
"Bebidas"),
("Sobremesas"),
("salgados"),
("Lanches");

create table pedidos (
idPedidos int not null auto_increment primary key,
horarioPedido time not null,
valorTotal float not null,
formaEntrega varchar(45) not null,
dataPedido date not null,
pagamentoId int not null,
foreign key(pagamentoId) references formaPagamento(idPagamento)
);
alter table pedidos add column statusPedido varchar(20) not null;
insert into pedidos(
horarioPedido,
valorTotal,
formaEntrega,
dataPedido,
statusPedido,
pagamentoId
) values (
"12:30:00",
"50.00",
"Retirada no local",
"2024-06-25",
"Pedido Pendente",
1);
select * from pedidos;

create table promocoes (
idPromocoes int not null auto_increment primary key,
precoPromocao varchar(10) not null,
nomePromocao varchar(60) not null,
fotoPromocional varchar(200)
);

insert into promocoes(
precoPromocao,
nomePromocao,
fotoPromocional
) values (
"20.90",
"Dia das mães mais doce",
"https://i.pinimg.com/originals/11/bd/c0/11bdc064568d64c920880297f9c504c5.jpg"
);

create table endereco (
idEndereco int not null auto_increment primary key,
logradouro varchar(200) not null,
numeroCasa int not null,
bairro varchar(20) not null,
cidade varchar(20) not null,
cep int not null
);

insert into endereco (
logradouro,
numeroCasa,
bairro,
cidade,
cep
) values (
"Rua Maria Luiza de Campos",
"109",
"Parque Jandaia",
"Carapicuíba",
06330-100
);

create table usuario (
idUser int not null auto_increment primary key,
nomeCliente varchar(250) not null,
dataNascimento date not null,
email varchar(60) not null,
senha varchar(8) not null,
enderecoId int,
foreign key(enderecoId) references endereco(idEndereco)
);

insert into usuario (
nomeCliente,
dataNascimento,
email,
senha
) values (
"Ana",
"2006-07-22",
"ana.lu@gmail.com",
"1234"
);

create table funcionarios(
idFuncionarios int not null auto_increment primary key,
nomeFuncionario varchar(250) not null,
senhaFuncionario varchar(8) not null,
emailFuncionario varchar(60) not null
);

insert into funcionarios (
nomeFuncionario,
senhaFuncionario,
emailFuncionario 
) values (
"Claudia",
"3456",
"clau123@gmail.com"
);

create table ingrediente_produto(
idIngrediente_produto int not null auto_increment primary key,
ingredientesId int,
produtosId int,
foreign  key(ingredientesId) references ingredientes(id_ingredientes),
foreign  key(produtosId) references produtos(idProduto)
);

create table produto_pedido(
idProduto_pedido int not null auto_increment primary key,
produtoId int,
pedidosId int,
foreign  key(produtoId) references produtos(idProduto),
foreign  key(pedidosId) references pedidos(idPedidos)
);
create table produto_categoria(
idProduto_categoria int not null auto_increment primary key,
categoriaId int,
idProdutos int,
foreign key(categoriaId) references categorias(idCategorias),
foreign key(idProdutos) references produtos(idProduto)
);

create table formaPagamento(
idPagamento int not null auto_increment primary key,
tipoPagamento varchar(20) not null,
bandeira varchar(45) not null,
statusPagamento varchar(10) not null,
cpf varchar(14) not null,
cupom varchar(45) 
);
insert into formaPagamento (
tipoPagamento,
bandeira,
statusPagamento,
cpf,
cupom
) values (
"Crédito",
"MasterCard",
"Pago",
"361567989869",
"PrimeiraCompra"
);

create table combos(
idCombo int not null auto_increment primary key,
titulo varchar(50) not null,
fotoCombo varchar(200) not null,
precoCombo varchar(8) not null,
descricaoCombo varchar(100) not null
);

insert into combos (
titulo,
fotoCombo,
precoCombo,
descricaoCombo
) values (
"Combo X-bacon",
"https://blog.castellmaq.com.br/wp-content/uploads/2023/01/465_5.jpg",
"30.00",
"Nossa deliciosa batata frita acompanhada de um suculento X-bacon"
);

create table combo_categoria(
idCombo_categoria int not null auto_increment primary key,
categoriasId int not null,
comboId int not null,
foreign key(categoriasId) references categorias(idCategorias),
foreign key(comboId) references combos(idCombo)
);

create table produto_combo(
idProduto_combo int not null auto_increment primary key,
idDosProdutos int not null,
idCombos int not null,
foreign key(idCombos) references combos(idCombo),
foreign key(idDosProdutos) references produtos(idProduto)
);
show tables;



insert into funcionarios(
            nomeFuncionario,
            senhaFuncionario,
            emailFuncionario
        ) values (
           "Hanna",
            "hannaBin",
            "hanna123@gmail.com"
        ) 
