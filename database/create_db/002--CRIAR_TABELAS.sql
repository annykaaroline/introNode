use bd_tcc_etim_122_g6;


create table usuarios(
usu_cod int primary key auto_increment not null,
usu_nome varchar (40) not null,
usu_telefone varchar (15) not null, -- 14996166687
usu_senha varchar (40) not null,
usu_login varchar (60) not null -- email
);

create table enderecos(
ende_cod int auto_increment  not null, 
ende_logradouro varchar(60) not null, 
ende_numero varchar(10) not null, 
ende_complemento varchar (30) null, 
ende_bairro varchar (30) not null, 
ende_cep char(8) not null, 
ende_cidade varchar(30) not null, -- região de tupã
ende_estado char (2) not null, 
ende_principal bit not null, 
usu_cod int not null, 
primary key (ende_cod)
);

create table compras(
comp_cod int auto_increment not null, 
comp_dt datetime, 
comp_pg varchar (40) not null, -- tipo de pagamento (Pix, cartão, débito, crédito, dinheiro) 
ende_cod int not null, 
comp_desconto decimal (8,2), 
comp_acrescimo decimal (8,2), 
primary key (comp_cod)
);

create table carrinho(
usu_cod  int not null, 
prod_cod  int not null, 
car_qtd int not null, 
primary key (usu_cod, prod_cod) 
);

create table produtos(
prod_cod int auto_increment not null,
prod_nome varchar (100) not null,
prod_valor decimal (8,2) ,
prod_descricao varchar(120) not null,
prod_unidade varchar (10), -- Kg, un, g...
primary key (prod_cod)
);

create table imagens(
img_cod int auto_increment not null, 
img_descricao varchar (50) not null, 
img_imagem varchar (255) not null, -- img.png
img_principal bit not null, 
prod_cod int not null, 
primary key (img_cod) 
);

create table compra_produtos(
comp_cod int not null, 
prod_cod int not null, 
cppd_qtd decimal (5,2), 
cppd_observacoes varchar (100) null, 
primary key (comp_cod, prod_cod) 
); 

create table favoritos(
usu_cod int not null,
prod_cod int not null,
primary key (usu_cod, prod_cod) 
);


