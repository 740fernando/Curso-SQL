-- Programe o c�digo SQL necess�rio para gerar a estrutura do banco de dados criado
-- no m�dulo Normaliza��o de Dados (Formas Normais).
-- 
-- Observa��o: N�o � necess�rio criar o c�digo que popula as tabelas, pois este � o 
-- tema do pr�ximo m�dulo.

-- Cria o banco de dados e acessa o mesmo
create database softblue default charset=latin1;
use softblue;


-- Cria a tabela TIPO
create table tipo
(
	codigo int unsigned not null auto_increment,
	tipo varchar(50) not null,
	primary key(codigo)
);

-- Cria a tabela INSTRUTOR
create table instrutor
(
	codigo int unsigned not null auto_increment,
	instrutor varchar(64)not null,
	telefone VARCHAR(9) NULL,
	primary key(codigo)
);

-- Cria a tabela CURSO
create table curso
(
	codigo integer unsigned not null auto_increment, 			-- C�digo interno (PK)
	curso varchar(64) not null,						 			-- T�tulo com at� 64 caracteres
	tipo_codigo integer unsigned not null,			 			-- C�digo do tipo de curso (id�ntico a PK em CURSO) 
	instrutor_codigo integer unsigned not null,		 			-- C�digo do instrutor (id�ntico a PK em INSTRUTOR)
	valor double not null,							 			-- Valor do curso	
	primary key(codigo),							 			-- Define o campo CODIGO como PK (Primary Key)	
	index fk_curso_tipo(tipo_codigo),						    -- Define o campo TIPO como um �ndice	
	index fk_curso_instrutor(instrutor_codigo),		 			-- Define o campo INSTRUTOR como um �ndice	
	foreign key(tipo_codigo) references tipo(codigo),			-- Cria o relacionamento (FK) com a tabela TIPO
	foreign key(instrutor_codigo) references instrutor(codigo)  -- Cria o relacionamento (FK) com a tabela INSTRUTOR
);

-- Cria a tabela ALUNO
create table aluno
(
	codigo int unsigned not null auto_increment, -- C�digo interno (PK)
	nome varchar(64) not null,					 -- Nome com at� 64 caracteres
	endereco varchar(230) not null,				 -- Endere�o com at� 230 caracteres	
	email varchar(128) not null,				 -- E-mail com at� 128 caracteres
	primary key(codigo)						     -- Define o campo CODIGO como PK (Primary Key)		
);

-- Cria a tabela PEDIDO
create table pedido
(
	codigo int unsigned not null auto_increment,         -- C�digo interno (PK)
	aluno_codigo int unsigned not null,					 -- C�digo do aluno (id�ntico a PK em ALUNO)					
	datahora DATETIME not null,						     -- Armazena data e hora em uma �nica coluna
	primary key(codigo),								 -- Define o campo CODIGO como PK (Primary Key)
	index fk_pedido_aluno(aluno_codigo),				 -- Define o campo ALUNO como um �ndice
	foreign key(aluno_codigo) references aluno(codigo)   -- Cria o relacionamento (FK) com a tabela ALUNO
);

-- Cria a tabela PEDIDO_DETALHE
create table pedido_detalhe
(
	pedido_codigo int unsigned not null,          						 -- C�digo do pedido (id�ntico a PK em PEDIDO)
	curso_codigo int unsigned not null,           			             -- C�digo do curso (id�ntico a PK em CURSO)
	valor double not null,						  			             -- Valor do curso
	index fk_pedido_detalhe_pedido(pedido_codigo),			             -- Define o campo PEDIDO como um �ndice
	index fk_pedido_detalhe_curso(curso_codigo),  					     -- Define o campo CURSO como um �ndice
	primary key(pedido_codigo,curso_codigo),							 -- Define a chave prim�ria composta	
	foreign key(pedido_codigo) references pedido(codigo),   			 -- Cria o relacionamento (FK) com a tabela PEDIDO
	foreign key(curso_codigo) references curso(codigo)     				 -- Cria o relacionamento (FK) com a tabela CURSO
);

-- Exerc�cio 2

-- Inclua a coluna DATA_NASCIMENTO na tabela ALUNO do tipo string, de tamanho 10 caracteres;
	alter table aluno add DATA_NASCIMENTO varchar(10);

-- Altere a coluna DATA_NASCIMENTO para NASCIMENTO e seu tipo de dado para DATE;
	alter table aluno change column DATA_NASCIMENTO NASCIMENTO DATE NULL;

-- Altere a coluna NOME para Aluno na tabela ALuno;
	alter table aluno change column nome aluno varchar(64) not null;

-- Crie um novo �ndice na tabela ALUNO, para o campo ALUNO;
	alter table aluno add index index_aluno(aluno);

-- Inclua o campo EMAIL na tabela INSTRUTOR, com tamanho de 100 caracteres;
	alter table instrutor add column email varchar(100) ;

-- Crie um novo �ndice na tabela CURSO, para o campo instrutor_codigo;
	alter table curso add index index_instrutor(instrutor_codigo);


-- Remova o campo EMAIL da tabela INSTRUTOR;
	alter table instrutor drop email;