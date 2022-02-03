use softblue;

-- Exercício 1
-- 
-- Utilizando o banco de dados criado nos módulos anteriores, realize as seguintes instruções:

-- Selecione os nomes de todos os alunos que já fizeram alguma matrícula na Softblue, sem repetição;

	select distinct(a.aluno) from pedido p inner join aluno a where p.aluno_codigo =a.codigo;

-- Exiba o nome do aluno mais antigo da Softblue;
	
	select distinct(a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora asc limit 1;	

-- Exiba o nome do aluno mais recente da Softblue;

 	select distinct (a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora desc limit 1;

-- Exiba o nome do terceiro aluno mais antigo da Softblue;
  
	select distinct (a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora asc limit 1 offset 2;
  
-- Exiba a quantidade de cursos que já foram vendidos pela Softblue;
  	
  	select c.curso, count(pd.curso_codigo) as Qtd from curso c inner join pedido_detalhe pd ON c.codigo =pd.curso_codigo group by c.curso ;
  
-- Exiba o valor total já arrecadado pelos cursos vendidos pela Softblue;
  
	select sum(pd.valor) from pedido_detalhe pd ;

-- Exiba o valor médio cobrado por curso para o pedido cujo CODIGO é 2;

	select sum(pd.valor) from pedido_detalhe pd  where pd.curso_codigo = 2 ;

-- Exiba o valor do curso mais caro da Softblue;
	
	select max(c.valor) from curso c
	
-- Exiba nome e o valor do curso mais caro da Softblue

	select c.curso, c.valor from curso c where valor in(select max(c2.valor) from curso c2) ;

-- Exiba o valor do curso mais barato da Softblue;

	select min(c.valor) from curso c ;
	
-- Exiba o valor total de cada pedido realizado na Softblue;

	select distinct(pd.pedido_codigo), sum(pd.valor) from pedido_detalhe pd group by pd.pedido_codigo ;

-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade;
	
	select i.instrutor, count(c.curso) as 'Qtd de curso' from instrutor i inner join curso c ON c.instrutor_codigo = i.codigo group by i.instrutor ;

-- Exiba o número do pedido, nome do aluno e valor para todos os pedidos realizados na Softblue cujo valor total sejam maiores que 500;

	select distinct (pd.pedido_codigo), a.aluno, sum(pd.valor)  
		from pedido_detalhe pd 
		inner join pedido p on pd.pedido_codigo = p.codigo
		inner join aluno a on a.codigo =p.aluno_codigo
		group by pd.pedido_codigo
		having sum(pd.valor)>500;
	
-- Exiba o número do pedido, nome do aluno e quantos cursos foram comprados no pedido para todos os pedidos realizados na Softblue que compraram dois ou mais cursos;

	select distinct(pd.pedido_codigo), a.aluno, count(pd.curso_codigo) 
		from pedido_detalhe pd 
		inner join pedido p on pd.pedido_codigo =p.codigo 
		inner join aluno a 	on p.aluno_codigo = a.codigo 
		group by pd.pedido_codigo
		having count(pd.pedido_codigo)>=2 ;
		
-- Exiba o nome e endereço de todos os alunos que morem em Avenidas (Av.);
	
	select a.aluno, a.endereco from aluno a where a.endereco like '%Av.%'  ;

-- Exiba os nomes dos cursos de Java da Softblue;

	select c.curso from curso c where curso like '%Java%'; 