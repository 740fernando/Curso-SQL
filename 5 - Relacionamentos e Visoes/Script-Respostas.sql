use softblue;
-- Exercício 1
-- Utilizando o banco de dados criado nos módulos anteriores, realize as seguintes uniões de tabelas:
	select * from curso;
	select * from pedido;

-- Exiba uma lista com os títulos dos cursos da Softblue e o tipo de curso ao lado;
	select c.curso,t.tipo from curso c
	inner join tipo t on c.tipo_codigo =t.codigo ;
	
-- Exiba uma lista com os títulos dos cursos da Softblue, tipo do curso, nome do instrutor responsável pelo mesmo e telefone;
	select c.curso,t.tipo,i.instrutor, i.telefone from curso c
	inner join tipo t on c.tipo_codigo =t.codigo
	inner join instrutor i ON c.instrutor_codigo = i.codigo ;

-- Exiba uma lista com o código e data e hora dos pedidos e os códigos dos cursos de cada pedido;
	select p.codigo, p.datahora, pd.curso_codigo from pedido p 
	inner join pedido_detalhe pd ON p.codigo = pd.pedido_codigo; 

-- Exiba uma lista com o código e data e hora dos pedidos e os títulos dos cursos de cada pedido;
	select p.codigo,p.datahora,c.curso from pedido p
	inner join pedido_detalhe pd on pd.pedido_codigo = p.codigo 
	inner join curso c on pd.curso_codigo = c.codigo 
	
-- Exiba uma lista com o código e data e hora dos pedidos, nome do aluno e os títulos dos cursos de cada pedido;
	select p.codigo,p.datahora, a.aluno , c.curso from pedido_detalhe pd
	inner join pedido p on pd.pedido_codigo =p.codigo 
	inner join aluno a on p.aluno_codigo = a.codigo 
	inner join curso c on pd.curso_codigo = c.codigo;
	
-- Exercício 2

-- Utilizando o banco de dados criado nos módulos anteriores, realize as seguintes instruções:
	
-- Crie uma visão que traga o título e preço somente dos cursos de programação da Softblue;
   create view vw_curso_preco_programacao as select c.curso, c.valor from curso c where c.tipo_codigo = 2 ;
	
  	select * from vw_curso_preco_programacao vcpp ;
  
-- Crie uma visão que traga os títulos dos cursos, tipo do curso e nome do instrutor;
   create view vw_titulo_tipo_instrutor as select c.curso, t.tipo, i.instrutor
   from curso c 
   inner join tipo t ON c.tipo_codigo = t.codigo 
   inner join instrutor i ON c.instrutor_codigo = i.codigo ;
   
   select * from vw_titulo_tipo_instrutor ;
   
-- Crie uma visão que exiba os pedidos realizados, informando o nome do aluno, data e código do pedido;
    create view vw_aluno_data_pedido as select a.aluno, p.datahora , p.codigo from pedido p 
    inner join aluno a on p.aluno_codigo = a.codigo ;
    
    select * from vw_aluno_data_pedido vadp ;