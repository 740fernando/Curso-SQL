use curso_sql;

-- DDL

create table CPFS
(
	id int unsigned not null,
	cpf varchar(14) not null,
	primary key(id),
	constraint fk_cpf foreign key(id) references funcionarios(id)
);

create table clientes
(
	id int unsigned not null auto_increment,
	nome varchar(45) not null,
	quem_indicou int unsigned,
	primary key (id),
	constraint fk_quem_indicou foreign key(quem_indicou) references clientes(id)
);

-- DQL
select * from funcionarios f ;
select * from veiculos v ;
select * from cpfs c ;
select * from clientes c ;
-- DML
update funcionarios set salario = 1863.4 where id =1;
update funcionarios set salario = 3025 where id =2;
update funcionarios set salario = 2057 where id =3;
update funcionarios set salario = 2662 where id =5;
update funcionarios set salario = 1500 where id =6;
update funcionarios set salario = 1500 where id =3;

insert into veiculos (funcionario_id,veiculo,placa) values (null,"Moto","SB-003");

insert into cpfs (id,cpf) values (1,'59397682024');
insert into cpfs (id,cpf) values (2,'67650776000');
insert into cpfs (id,cpf) values (3,'02585097080');
insert into cpfs (id,cpf) values (5,'88893565021');
insert into cpfs (id,cpf) values (6,'05276634092');

insert into clientes (id,nome, quem_indicou) values (1,'André', null);
insert into clientes (id,nome, quem_indicou) values (2,'Samuel',1);
insert into clientes (id,nome, quem_indicou) values (3,'Carlos',2);
insert into clientes (id,nome, quem_indicou) values (4,'Rafael',1);

-- left join - Relacionamento de todos os registros da tabela do lado esquerdo
select * from funcionarios f left join veiculos v on v.funcionario_id= f.id;

-- right join - Relacionamento de todos os registros da tabela do lado dierito
select * from funcionarios f right join veiculos v on v.funcionario_id =f.id;

-- full join - Relacionamento de todos os registros de ambas as tabelas obs: mysql nao possui o full join É utilizado o left e o right juntos para poder substituir o comando FULL
select * from funcionarios f left join veiculos v on v.funcionario_id= f.id
UNION
select * from funcionarios f right join veiculos v on v.funcionario_id =f.id;

-- equi join - Relacionamento de forma tradicional
select * from funcionarios  inner join cpfs on funcionarios.id = cpfs.id ;
-- equi join - outra forma
select * from funcionarios inner join cpfs c using(id);

-- self join - Relacionamento de uma tabela feita com ela mesma
select a.nome as Cliente ,b.nome  as "Quem indicou"  
from clientes a join clientes b on a.quem_indicou  = b.id ; 


-- relacionamento triplo

select * from funcionarios f 
inner join veiculos v on v.funcionario_id =f.id 
inner join cpfs c  on c.id =f.id ;

-- visão são consultas que ficarão armazenadas no bd caracteristicas- não armazena dados e nem ocupa espaço, porque é uma consulta realizada em tempo de execução, de acordo com sql que vc informou quando ela invocada 
-- criar visão que traz os funcionarios que ganha acima de 1700

create view funcionarios_a as select * from funcionarios f where f.salario >=1700;

select * from funcionarios_a fa ;


-- EXCLUI A VIEW
drop view funcionarios_a ;

