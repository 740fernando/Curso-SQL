use softblue;

-- Exerc�cio 1
-- 
-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes instru��es:

-- Selecione os nomes de todos os alunos que j� fizeram alguma matr�cula na Softblue, sem repeti��o;

	select distinct(a.aluno) from pedido p inner join aluno a ON p.aluno_codigo =a.codigo;

-- Exiba o nome do aluno mais antigo da Softblue;
	
	select distinct(a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora asc limit 1;	

-- Exiba o nome do aluno mais recente da Softblue;

 	select distinct (a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora desc limit 1;

-- Exiba o nome do terceiro aluno mais antigo da Softblue;
  
	select distinct (a.aluno),p.datahora from pedido p inner join aluno a on p.aluno_codigo =a.codigo order by datahora asc limit 1 offset 2;
  
-- Exiba a quantidade de cursos que j� foram vendidos pela Softblue;
  	
	SELECT COUNT(*) FROM PEDIDO_DETALHE;

  	select c.curso, count(pd.curso_codigo) as Qtd from curso c inner join pedido_detalhe pd ON c.codigo =pd.curso_codigo group by c.curso ;
  
-- Exiba o valor total j� arrecadado pelos cursos vendidos pela Softblue;
  
	select sum(pd.valor) from pedido_detalhe pd ;

-- Exiba o valor m�dio cobrado por curso para o pedido cujo CODIGO � 2;

	select avg(pd.valor) from pedido_detalhe pd  where pd.pedido_codigo = 2 ;

-- Exiba o valor do curso mais caro da Softblue;
	
	select max(c.valor) from curso c
	
-- Exiba nome e o valor do curso mais caro da Softblue

	select c.curso, c.valor from curso c where valor in(select max(c2.valor) from curso c2) ;

-- Exiba o valor do curso mais barato da Softblue;

	select min(c.valor) from curso c ;
	
-- Exiba o valor total de cada pedido realizado na Softblue;

	select pd.pedido_codigo, sum(pd.valor) from pedido_detalhe pd group by pd.pedido_codigo ;

-- Exiba os nomes dos instrutores da Softblue e a quantidade de cursos que cada um tem sob sua responsabilidade;
	
	select i.instrutor, count(*) as 'Qtd de curso' from instrutor i inner join curso c ON c.instrutor_codigo = i.codigo group by i.instrutor ;


-- Exiba o n�mero do pedido, nome do aluno e valor para todos os pedidos realizados na Softblue cujo valor total sejam maiores que 500;

	select pd.pedido_codigo, a.aluno, sum(pd.valor)  
		from pedido_detalhe pd 
		inner join pedido p on pd.pedido_codigo = p.codigo
		inner join aluno a on a.codigo =p.aluno_codigo
		group by pd.pedido_codigo
		having sum(pd.valor)>500;
	
-- Exiba o n�mero do pedido, nome do aluno e quantos cursos foram comprados no pedido para todos os pedidos realizados na Softblue que compraram dois ou mais cursos;

	select pd.pedido_codigo, a.aluno, count(*) 
		from pedido_detalhe pd 
		inner join pedido p on pd.pedido_codigo =p.codigo 
		inner join aluno a 	on p.aluno_codigo = a.codigo 
		group by pd.pedido_codigo
		having count(*)>=2 ;
		
-- Exiba o nome e endere�o de todos os alunos que morem em Avenidas (Av.);
	
	select a.aluno, a.endereco from aluno a where a.endereco like 'Av.%'  ;

-- Exiba os nomes dos cursos de Java da Softblue;

	select c.curso from curso c where curso like '%java%'; 
	

-- Exerc�cio 2

-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes instru��es:

-- Utilizando subquery, exiba uma lista com os nomes dos cursos disponibilizados pela Softblue informando para cada curso qual o seu menor valor de venda j� praticado;
		
	select curso, (select min(valor) from pedido_detalhe pd where pd.curso_codigo = c.codigo)as menor_valor from curso c ;

-- Utilizando subquery e o par�metro IN, exiba os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programa��o';

	select c.curso from curso c where c.tipo_codigo in(select t.codigo from tipo t where tipo like '%Programa��o');
	
    SELECT c.curso FROM curso c WHERE c.tipo_codigo IN (SELECT t.codigo FROM TIPO t WHERE TIPO = 'Programa��o');
	
-- Utilizando subquery e o par�metro EXISTS, exiba novamente os nomes dos cursos disponibilizados pela Softblue cujo tipo de curso seja 'Programa��o';
   
    select c.curso from curso c where exists (select t.tipo from tipo t where c.tipo_codigo =t.codigo and t.tipo='Programa��o');
   
-- Exiba uma lista com os nomes dos instrutores da Softblue e ao lado o total acumulado das vendas referente aos cursos pelo qual o instrutor � respons�vel;
   
   select i.instrutor, (select sum(pd.valor) from pedido_detalhe pd inner join curso c on pd.curso_codigo = c.codigo where c.instrutor_codigo = i.codigo) as 'Total Vendas' from instrutor i ;
   
-- Crie uma vis�o que exiba os nomes dos alunos e quanto cada um j� comprou em cursos;
  create view vw_alunos_compra 
 	as select a.aluno,
 	(
 		select sum(pd.valor) 
 		from pedido_detalhe pd 
 		inner join pedido p 
 		on pd.pedido_codigo = p.codigo 
 		and p.aluno_codigo=a.codigo
 	)
 	as total_de_compras 
 	from aluno a  ;
 
  select * from vw_alunos_compra vac ;
  