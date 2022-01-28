

-- Cria o banco
create database curso_sql;

-- seleciona o banco de dados
use curso_sql;

-- DDL(DATA DEFINITION LANGUAGE )- Cria a tabela
create table funcionarios
(
	id int unsigned not null auto_increment,
	nome varchar(45) not null,
	salario double not null default '0',
	departamento varchar(45),
	primary key (id)
);

create table veiculos
(
	id int unsigned not null auto_increment,
	funcionario_id int unsigned default null,
	veiculo varchar(45) not null default '',
	placa varchar(10) not null default '',
	primary key (id),
	constraint fk_veiculos_funcionarios foreign key (funcionario_id) references funcionarios(id)
);

create table salarios
(
	faixa varchar(45) not null,
	inicio double not null,
	fim double not null,
	primary key(faixa)
);

-- DDL(DATA DEFINITION LANGUAGE )- altera o nome do campo e o tipo

alter table funcionarios change column nome nome_func varchar(45) not null;

alter table funcionarios change column nome_func nome varchar(45) not null;

-- DDL(DATA DEFINITION LANGUAGE )- Deleta uma tabela

drop table salarios ;

-- Cria indices - são os campos que iremos trabalhar com frequencia, para melhorar o processamento. 

create index departamentos on funcionarios (departamento); --  O campo departamento virá um indice, por esse motivo, ele está otimizado no sql para trabalhar de uma forma muito mais rapida com agrupamento ou ordenamento de registros

create index nomes on funcionarios (nome(6)); -- Considera apenas os 6 primeiros caracteres do campo como inidice


-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string, de tamanho 10 caracteres;
	alter table aluno insert into DATA_NASCIMENTO varchar(10);

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string, de tamanho 10 caracteres;
