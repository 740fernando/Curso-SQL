-- Manipulando dados no MySQL

use curso_sql;

drop table curso;

drop table tipo;

drop table instrutor;

drop table pedido;

drop table aluno;

create table salarios
(
	faixa varchar(45) not null,
	inicio double not null,
	fim double not null,
	primary key(faixa)
);


-- DML


-- insert funcionarios
insert into funcionarios(id,nome,salario,departamento) values (1,'Fernando',10000,'TI');

insert into funcionarios (id,nome,salario,departamento) values (2,'Lauren',15000,'Jurídico');

insert into funcionarios (nome,salario,departamento) values('Christoffer',14000,'TikToker');

insert into funcionarios (nome,salario,departamento) values('Lela',5000,'Diretoria');

insert into funcionarios (nome,salario,departamento) values('Gabriel',30000,'Desenvolvimento de jogos');

insert into funcionarios (nome,salario,departamento) values ('Frida',100000,'Animal');

-- insert veiculos
insert into veiculos (funcionario_id,veiculo,placa) values(1,'CARRO','SB-001');

insert into veiculos (funcionario_id,veiculo,placa) values(1,'Carro','SB-002');

-- insert salarios

insert into salarios (faixa,inicio,fim) values ('Analista Jr', 1000, 2000);
insert into salarios (faixa,inicio,fim) values ('Analista Pleno', 2000, 4000);


-- ATUALIZA TODOS REGISTROS DA TABELA funcionarios
update funcionarios set salario = salario * 1.1

-- ATUALIZA O REGISTRO por ID = ? 
update funcionarios set salario = salario * 1.1 where id=1;

update veiculos  set funcionario_id = 5 where id=2;

-- ARRENDODA O RESULTADO DA MULTIPLICAÇÃO E CONFIGURA QUANTAS CASAS DECIMAIS SERÃO EXIBIDAS
update funcionarios set salario = round(salario * 1.1, 2) ;



-- DELETA REGISTRO POR ID
delete from  funcionarios  where ID=4;



rollback;
-- --------------------------------------------------------------------------------------------------------

-- DQL


select * from funcionarios f ;
select * from veiculos v ;
select * from salarios s ;

select nome,salario from funcionarios f where f.salario >30000;

select nome as 'Funcionario',salario from funcionarios f where f.salario >30000;

select * from funcionarios where salario > 2000;
select * from funcionarios where nome = 'Lauren';
select * from funcionarios where id= 3;
select * from funcionarios f where salario  > 20000;

-- uni dois select  eliminando registros duplicados
select * from funcionarios f  where f.nome='Lauren'
union 
select * from funcionarios f  where f.nome='Lauren';

-- uni dois select, trazendo registros duplicados
select * from funcionarios f  where f.nome='Lauren'
union all 
select * from funcionarios f  where f.nome='Lauren';
-- --------------------------------------------------------------------------------------------------------

-- Liberar a atualização de tabela sem precisar colocar where
set SQL_SAFE_UPDATES=0;
