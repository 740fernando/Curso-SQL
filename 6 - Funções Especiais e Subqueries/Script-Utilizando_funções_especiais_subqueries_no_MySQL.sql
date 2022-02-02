-- dml

insert into funcionarios values (7,'Isabela',2662,'Jur�dico');
insert into funcionarios (nome,salario,departamento) values ('F�bio',1500,'TI');


-- --------------------------------- FUNCOES DE AGREGA��O ------------------------------------------------------------------------------

-- Contagem de registros existentes na TABELA funcion�rios

select COUNT(*) from funcionarios;

-- Contagem de registros existentes na TABELA funcion�rios que recebem mais que 2000 de s�lario

select count(*) from funcionarios f where salario >2000;

-- Contagem de registros existentes na TABELA funcion�rios que recebem mais que 1600 de s�lario e trabalham no setor juridico


select count(*) from funcionarios  where salario > 1600 and departamento = 'Jur�dico';
select * from funcionarios  where salario > 1600 and departamento = 'Jur�dico';

-- Soma dos sal�rios da empresa

select SUM(f.salario) from funcionarios f ;

-- Soma dos sal�rios da empresa, somente do departamento de T.I

select sum(f.salario) from funcionarios f where f.departamento = 'TI';

-- M�dia dos sal�rios da empresa

select AVG(f.salario) from funcionarios f ;

-- M�dia dos sal�rios da empresa, somente do departamento de TI

select avg(f.salario) from funcionarios f  where f.departamento = 'TI';

-- Sal�rio m�ximo da empresa

select max(f.salario) from funcionarios f;

-- Sal�rio m�ximo da empresa, somente do departamento de ti

select max(f.salario) from funcionarios f where f.departamento = 'TI';

-- Sal�rio m�n da empresa

select min(f.salario) from funcionarios f;

-- Sal�rio m�n da empresa, somente do departamento de ti

select min(f.salario) from funcionarios f where departamento = 'TI';

-- Listar departamentos da empresa

select departamento from funcionarios f ; -- traz o departamento repetido

select distinct (departamento) from funcionarios  ; -- traz resultados sem repeti��o


-- ordena��o de registros ascendente por nome

select * from funcionarios order by nome ;

-- ordena��o de registros descendente por nome

select * from funcionarios order by nome desc;

-- ordena��o de registros ascendente por salario

select * from funcionarios order by salario ;

-- ordena��o de registros desc por salario

select * from funcionarios order by salario desc;

-- ordenar por departamento

select * from funcionarios order by departamento ;

-- ordenar por departamento desc e salario asc

select * from funcionarios order by departamento desc, salario asc;

-- Limita apenas a 2 registros

select * from funcionarios limit 2 ;

-- Pula o primeiro registro

select * from funcionarios limit 2 offset 1;
select * from funcionarios limit 1,2; -- forma abreviada, colocar o numero de registro que voc� quer pular antes da quantidade de registros limitados


-- -- --------------------------------- FUNCOES DE AGRUPAMENTO ------------------------------------------------------------------------------

-- M�dia salarial de cada departamento

select AVG(salario) from funcionarios; -- errado, pois vai fazer a m�dia de toda a empresa

select AVG(salario) from funcionarios where departamento = 'TI'; -- errado, pois vai fazer a m�dia de apenas um departamento

select DEPARTAMENTO,AVG(SALARIO) from funcionarios group by departamento ; -- correto, pois ir� fazer a m�dia por departamento

-- M�dia salarial dos departamentos acima de 2000

select departamento,avg(salario) from funcionarios group by departamento having avg(salario) > 2000;

-- Quantidade de funcion�rios da empresa categorizado por departamento

select departamento, count(*) from funcionarios group by departamento ;


-- --------------------------------- SUBQUERIES ------------------------------------------------------------------------------

-- Mostra os nomes dos funcion�rios, dos departamentos, na qual a m�dia salaria � acima de 2000

-- 1 forma

select departamento, avg(salario) from funcionarios group by departamento ;
select nome from funcionarios where departamento = 'Animal' or departamento = 'Jur�dico';

-- 2 forma - fazendo em uma unica expressao sql

select nome from funcionarios 
where departamento in
	( 
		select departamento from funcionarios group by departamento having avg(salario)>2000
	);

-- forma errada
select nome from funcionarios group by departamento having avg(salario) > 2000; -- exibir� apenas dois resultados(o correto seria 3), porque ao listar os registros - ser� baseados na funcao de agrupamento utilizada, no caso 'group by'.
