create database biblioteca_revisao;
use biblioteca_revisao;

create table categoria (
	id_categoria INT PRIMARY KEY auto_increment,
    nome varchar(80) not null unique
);

create table responsavel (
	id_responsavel INT PRIMARY KEY auto_increment,
    nome varchar(120) not null,
    email varchar(120) unique
);

create table livro (
	id_livro INT PRIMARY KEY auto_increment,
    titulo varchar(150) not null,
    unidade_medida varchar(20) not null default 'unidade',
    quantidade_estoque int not null default 0,
    valor_unitario decimal (10,2) not null,
    limite_minimo int not null default 0,
    limite_maximo int not null default 100,
    id_categoria int not null, 
    foreign key (id_categoria) references categoria(id_categoria)
);

create table movimentacao (
	id_movimentacao INT PRIMARY KEY auto_increment,
    id_livro int not null,
    id_responsavel int not null,
    tipo ENUM('ENTADA', 'SAIDA') not null,
    quantidade int not null,
    data_movimentacao datetime not null,
    observacao varchar(200),
    foreign key (id_livro) references livro(id_livro),
    foreign key (id_responsavel) references responsavel(id_responsavel)
);

insert into categoria (nome) values 
('programacao'), ('banco de dados'), ('redes');

insert into responsavel (nome, email) values
('Ana Souza', 'ana@senaiescola.com'),
('Bruno Lima', 'bruno@senaiescola.com'),
('Carla Rocha', 'carla@senaiescola.com');

insert into livro 
(titulo, unidade_medida, quantidade_estoque, valor_unitario, limite_minimo, limite_maximo, id_categoria) values
('Lógica de Programacao','unidade', 20, 85.00, 0, 100, 1),
('Modelagem de Dados','unidade', 15, 120.00, 0, 100, 2),
('Redesde Computadores','unidade', 8, 95.00, 0, 100, 3),
('SQL Essencial','unidade', 30, 75.00, 0, 100, 2);

insert into movimentacao
(id_livro, id_responsavel, tipo, quantidade, data_movimentacao, observacao) values
(1, 1, 'entrada', 10, '2026-09-01 08:30:00', 'Compra Inicial'),
(3, 3, 'saida', 2, '2026-09-05 14:00:00', 'Uso em sala'),
(4, 1, 'saida', 6, '2026-09-10 10:30:00', 'Empréstimo Laboratório'),
(1, 2, 'saida', 4, '2026-09-12 11:20:00', 'Projeto Integrador');