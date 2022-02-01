-- Exerc�cio 1
-- Crie comandos SQL para inserir os dados apresentados a seguir:
-- 
-- Tabela TIPO:
-- 1, Banco de dados
-- 2, Programação
-- 3, Modelagem de dados
-- 
-- Tabela INSTRUTOR:
-- 1, André Milani, 1111-1111
-- 2, Carlos Tosin, 1212-1212
-- 
-- Tabela CURSO:
-- 1, Java Fundamentos, 2, 2, 270
-- 2, Java Avançado, 2, 2, 330
-- 3, SQL Completo, 1, 1, 170
-- 4, Php Básico, 2, 1, 270
-- 
-- Tabela ALUNO:
-- 1, José, Rua XV de Novembro 72, jose@softblue.com.br
-- 2, Wagner, Av. Paulista, wagner@softblue.com.br
-- 3, Emílio, Rua Lajes 103, ap: 701, emilio@softblue.com.br
-- 4, Cris, Rua Tauney 22, cris@softblue.com.br
-- 5, Regina, Rua Salles 305, regina@softblue.com.br
-- 6, Fernando, Av. Central 30, fernando@softblue.com.br
-- 
-- Tabela PEDIDO:
-- 1, 2, 15/04/2010, 11:23:32
-- 2, 2, 15/04/2010, 14:36:21
-- 3, 3, 16/04/2010, 11:17:45
-- 4, 4, 17/04/2010, 14:27:22
-- 5, 5, 18/04/2010, 11:18:19
-- 6, 6, 19/04/2010, 13:47:35
-- 7, 6, 20/04/2010, 18:13:44
-- 
-- Tabela PEDIDO_DETALHE:
-- 1, 1, 270
-- 1, 2, 330
-- 2, 1, 270
-- 2, 2, 330
-- 2, 3, 170
-- 3, 4, 270
-- 4, 2, 330
-- 4, 4, 270
-- 5, 3, 170
-- 6, 3, 170
-- 7, 4, 270


-- DQL
select * from tipo;
select * from instrutor;
select * from aluno;
select * from CURSO;
select * from pedido_detalhe;
select * from pedido p ;

-- DML

--  TIPO:
insert into tipo (tipo) values ("Banco de Dados");
insert into tipo (tipo) values ("Programação");
insert into tipo (tipo) values ("Modelagem de dados");

--  INSTRUTOR
insert into instrutor (instrutor,telefone) values ('André Milani','1111-1111');
insert into instrutor (instrutor,telefone) values ('André Milani','2222-2222');

-- Curso
insert into curso(codigo,curso,tipo_codigo,instrutor_codigo,valor) values (1,'Java Fundamentos', 2, 2, 270);
insert into curso values (2,'Java Avançado', 2, 2, 330);
insert into curso values (3,'SQL Completo', 1, 1, 170);
insert into curso values (4,'Php Básico', 2, 1, 270);

-- ALUNO
insert into aluno (aluno,endereco,email) values ('José,','Rua XV de Novembro 72','jose@softblue.com.br');
insert into aluno (aluno,endereco,email) values ('Wagner','Av. Paulista','wagner@softblue.com.br');
insert into aluno (aluno,endereco,email) values ('Emílio','Rua Lajes 103, ap: 701','emilio@softblue.com.br');
insert into aluno (aluno,endereco,email) values ('Cris','Rua Tauney 22,','cris@softblue.com.br');
insert into aluno (aluno,endereco,email) values ('Regina','Rua Salles 305','regina@softblue.com.br');
insert into aluno (aluno,endereco,email) values ('Fernando','Av. Central 30','fernando@softblue.com.br');

-- PEDIDO
insert into pedido (codigo,aluno_codigo,datahora) values (1,2,'2010-04-15 11:23:32');
insert into pedido (codigo,aluno_codigo,datahora) values (2,2,'2010-04-15 14:36:21');
insert into pedido (codigo,aluno_codigo,datahora) values (3,3,'2010-04-16 11:17:45');
insert into pedido (codigo,aluno_codigo,datahora) values (4,4,'2010-04-17 14:27:22');
insert into pedido (codigo,aluno_codigo,datahora) values (5,5,'2010-04-18 11:18:19');
insert into pedido (codigo,aluno_codigo,datahora) values (6,6,'2010-04-19 13:47:35');
insert into pedido (codigo,aluno_codigo,datahora) values (7,6,'2010-04-20 18:13:44');

-- PEDIDO_DETALHE
insert into pedido_detalhe (pedido_codigo,curso_codigo,valor) values (1,1,270);
insert into pedido_detalhe values (1,2,330);
insert into pedido_detalhe values (2,1,270);
insert into pedido_detalhe values (2,2,330);
insert into pedido_detalhe values (2,3,170);
insert into pedido_detalhe values (3,4,270);
insert into pedido_detalhe values (4,2,330);
insert into pedido_detalhe values (4,4,270);
insert into pedido_detalhe values (5,3,170);
insert into pedido_detalhe values (6,3,170);
insert into pedido_detalhe values (7,4,270);

-- Exerc�cio 2

-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes instru��es:

-- Exibir todas as informa��es de todos os alunos;
	select * from aluno a ;

-- Exibir somente o t�tulo de cada curso da Softblue;
	select c.curso from curso c ;

-- Exibir somente o t�tulo e valor de cada curso da Softblue cujo pre�o seja maior que 200;
	select c.curso,c.valor from curso c where c.valor > 200;

-- Exibir somente o t�tulo e valor de cada curso da Softblue cujo pre�o seja maior que 200 e menor que 300;
	select c.curso,c.valor from curso c where c.valor  between 200 and 300;

-- Outra solu��o para o exerc�cio seria esta;
	select c.curso,c.valor from curso c where c.valor>200 and c.valor<300;

-- Exibir as informa��es da tabela PEDIDOS para os pedidos realizados entre 15/04/2010 e 18/04/2010;
	select * from pedido p where p.datahora between '2010-04-15' and '2010-04-19';

-- Outra solu��o para o exerc�cio seria esta;
	select * from pedido p where p.datahora > '2010-04-15' and p.datahora < '2010-04-19';

-- Exibir as informa��es da tabela PEDIDOS para os pedidos realizados na data de 15/04/2010;
	select * from pedido p  where date(p.datahora) = '2010-04-15';

-- Exerc�cio 3
-- Utilizando o banco de dados criado nos m�dulos anteriores, realize as seguintes instru��es:
	select * from aluno;
	select * from curso;

-- Altere o endere�o do aluno JOS� para 'Av. Brasil 778';
	update aluno set aluno  = 'Jos�' where codigo = 1;
	update aluno set endereco = 'Av. Brasil 778' where aluno = 'Jos�,';
	
-- Altere o e-mail do aluno CRIS para 'cristiano@softblue.com.br';
	update aluno set email = 'cristiano@softblue.com.br' where codigo = 4;

-- Aumente em 10% o valor dos cursos abaixo de 300;	
	update curso  set valor = valor *1.1 where valor < 300;

-- Altere o nome do curso de Php B�sico para Php Fundamentos;
	update curso set curso = 'Php Fundamentos' where codigo = 4;
