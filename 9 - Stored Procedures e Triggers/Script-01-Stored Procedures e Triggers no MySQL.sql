-- DDL
create table pedidos
(
	id int unsigned not null auto_increment,
	descricao varchar(100) not null,
	valor double not null default '0',
	pago varchar(3) not null default 'Não',
	primary key(id)
);

create table estoque
(
	id int unsigned not null auto_increment,
	descricao varchar(50) not null,
	quantidade int not null,
	primary key(id)
);

-- DML
insert into pedidos(descricao,valor) values ('TV',3000);
insert into pedidos(descricao,valor) values ('Geladeira',1400);
insert into pedidos(descricao,valor) values ('DVD Player',300);

-- DQL
select * from pedidos;
select * from estoque;


-- Stored Procedures
-- Vamos supor, que de tempos em tempos, eu preciso limpar a tabela Pedidos - todos os registros que não foram pagos

call limpa_pedidos ();


-- Triggers

-- Toda vez que sua tabela estoque receber um novo produto, será excluido os registros da tabela pedidos



-- trigger para limpar registros da tabela pedidos sempre que um produto for adicionado na tabela estoque

create trigger gatilho_limpa_pedidos
before insert -- antes que um registro seja incluido nessa tabela, que o gatinho dispare essa ação "insert"
on estoque
for each row
call limpa_pedidos();


-- teste 01

insert into estoque(descricao,quantidade) values ('Fogão', 5);
select * from pedidos;
select * from estoque;

-- teste 02

update pedidos set pago = 'Sim' where id = 8;

-- a trigger só deleta os registros de pedidos que na coluna pago estivar com a informação 'não'
insert into estoque(descricao,quantidade) values ('Forno', 3);



