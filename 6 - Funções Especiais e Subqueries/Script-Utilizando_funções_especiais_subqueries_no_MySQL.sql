-- dml

insert into funcionarios values (7,'Isabela',2662,'Jurídico');
insert into funcionarios (nome,salario,departamento) values ('Fábio',1500,'TI');


-- --------------------------------- FUNCOES DE AGREGAÇÃO ------------------------------------------------------------------------------

-- Contagem de registros existentes na TABELA funcionários

select COUNT(*) from funcionarios;

-- Contagem de registros existentes na TABELA funcionários que recebem mais que 2000 de sálario

select count(*) from funcionarios f where salario >2000;

-- Contagem de registros existentes na TABELA funcionários que recebem mais que 1600 de sálario e trabalham no setor juridico


select count(*) from funcionarios  where salario > 1600 and departamento = 'Jurídico';
select * from funcionarios  where salario > 1600 and departamento = 'Jurídico';

-- Soma dos salários da empresa

select SUM(f.salario) from funcionarios f ;

-- Soma dos salários da empresa, somente do departamento de T.I

select sum(f.salario) from funcionarios f where f.departamento = 'TI';

-- Média dos salários da empresa

select AVG(f.salario) from funcionarios f ;

-- Média dos salários da empresa, somente do departamento de TI

select avg(f.salario) from funcionarios f  where f.departamento = 'TI';

-- Salário máximo da empresa

select max(f.salario) from funcionarios f;

-- Salário máximo da empresa, somente do departamento de ti

select max(f.salario) from funcionarios f where f.departamento = 'TI';

-- Salário mín da empresa

select min(f.salario) from funcionarios f;

-- Salário mín da empresa, somente do departamento de ti

select min(f.salario) from funcionarios f where departamento = 'TI';

-- Listar departamentos da empresa

select departamento from funcionarios f ; -- traz o departamento repetido

select distinct (departamento) from funcionarios  ; -- traz resultados sem repetição


-- ordenação de registros ascendente por nome

select * from funcionarios order by nome ;

-- ordenação de registros descendente por nome

select * from funcionarios order by nome desc;

-- ordenação de registros ascendente por salario

select * from funcionarios order by salario ;

-- ordenação de registros desc por salario

select * from funcionarios order by salario desc;

-- ordenar por departamento

select * from funcionarios order by departamento ;

-- ordenar por departamento desc e salario asc

select * from funcionarios order by departamento desc, salario asc;

-- Limita apenas a 2 registros

select * from funcionarios limit 2 ;

-- Pula o primeiro registro

select * from funcionarios limit 2 offset 1;
select * from funcionarios limit 1,2; -- forma abreviada, colocar o numero de registro que você quer pular antes da quantidade de registros limitados


-- -- --------------------------------- FUNCOES DE AGRUPAMENTO ------------------------------------------------------------------------------

-- Média salarial de cada departamento

select AVG(salario) from funcionarios; -- errado, pois vai fazer a média de toda a empresa

select AVG(salario) from funcionarios where departamento = 'TI'; -- errado, pois vai fazer a média de apenas um departamento

select DEPARTAMENTO,AVG(SALARIO) from funcionarios group by departamento ; -- correto, pois irá fazer a média por departamento

-- Média salarial dos departamentos acima de 2000

select departamento,avg(salario) from funcionarios group by departamento having avg(salario) > 2000;

-- Quantidade de funcionários da empresa categorizado por departamento

select departamento, count(*) from funcionarios group by departamento ;


-- --------------------------------- SUBQUERIES ------------------------------------------------------------------------------

-- Mostra os nomes dos funcionários, dos departamentos, na qual a média salaria é acima de 2000

-- 1 forma

select departamento, avg(salario) from funcionarios group by departamento ;
select nome from funcionarios where departamento = 'Animal' or departamento = 'Jurídico';

-- 2 forma - fazendo em uma unica expressao sql

select nome from funcionarios 
where departamento in
	( 
		select departamento from funcionarios group by departamento having avg(salario)>2000
	);

-- forma errada
select nome from funcionarios group by departamento having avg(salario) > 2000; -- exibirá apenas dois resultados(o correto seria 3), porque ao listar os registros - será baseados na funcao de agrupamento utilizada, no caso 'group by'.
