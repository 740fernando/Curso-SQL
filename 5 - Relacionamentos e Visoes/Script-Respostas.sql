use softblue;
-- Exerc�cio 1
-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes uni�es de tabelas:
	select * from curso;
	select * from pedido;

-- Exiba uma lista com os t�tulos dos cursos da Softblue e o tipo de curso ao lado;
	select c.curso,t.tipo from curso c
	inner join tipo t on c.tipo_codigo =t.codigo ;
	
-- Exiba uma lista com os t�tulos dos cursos da Softblue, tipo do curso, nome do instrutor respons�vel pelo mesmo e telefone;
	select c.curso,t.tipo,i.instrutor, i.telefone from curso c
	inner join tipo t on c.tipo_codigo =t.codigo
	inner join instrutor i ON c.instrutor_codigo = i.codigo ;

-- Exiba uma lista com o c�digo e data e hora dos pedidos e os c�digos dos cursos de cada pedido;
	select p.codigo, p.datahora, pd.curso_codigo from pedido p 
	inner join pedido_detalhe pd ON p.codigo = pd.pedido_codigo; 

-- Exiba uma lista com o c�digo e data e hora dos pedidos e os t�tulos dos cursos de cada pedido;
	select p.codigo,p.datahora,c.curso from pedido p
	inner join pedido_detalhe pd on pd.pedido_codigo = p.codigo 
	inner join curso c on pd.curso_codigo = c.codigo 
	
-- Exiba uma lista com o c�digo e data e hora dos pedidos, nome do aluno e os t�tulos dos cursos de cada pedido;
	select p.codigo,p.datahora, a.aluno , c.curso from pedido_detalhe pd
	inner join pedido p on pd.pedido_codigo =p.codigo 
	inner join aluno a on p.aluno_codigo = a.codigo 
	inner join curso c on pd.curso_codigo = c.codigo;
	
-- Exerc�cio 2

-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes instru��es:
	
-- Crie uma vis�o que traga o t�tulo e pre�o somente dos cursos de programa��o da Softblue;
   create view vw_curso_preco_programacao as select c.curso, c.valor from curso c where c.tipo_codigo = 2 ;
	
  	select * from vw_curso_preco_programacao vcpp ;
  
-- Crie uma vis�o que traga os t�tulos dos cursos, tipo do curso e nome do instrutor;
   create view vw_titulo_tipo_instrutor as select c.curso, t.tipo, i.instrutor
   from curso c 
   inner join tipo t ON c.tipo_codigo = t.codigo 
   inner join instrutor i ON c.instrutor_codigo = i.codigo ;
   
   select * from vw_titulo_tipo_instrutor ;
   
-- Crie uma vis�o que exiba os pedidos realizados, informando o nome do aluno, data e c�digo do pedido;
    create view vw_aluno_data_pedido as select a.aluno, p.datahora , p.codigo from pedido p 
    inner join aluno a on p.aluno_codigo = a.codigo ;
    
    select * from vw_aluno_data_pedido vadp ;