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


se softblue;

-- DQL
select * from tipo;
select * from instrutor;
select * from aluno;
select * from CURSO;
select * from pedido_detalhe;

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
select * from pedido p ;
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






