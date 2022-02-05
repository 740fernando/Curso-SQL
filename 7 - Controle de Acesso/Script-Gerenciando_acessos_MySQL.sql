-- Controle de acesso - se comunicam direto com servidor sql

-- obs criar um usuario, n�o d� acesso automat.

-- cria usu�rio no servidor

-- Cria usu�rio, permitindo o acesso apenas de um ip especifico
-- create user 'fernando'@'200.200.190.190' identified by '1234';


-- Cria usu�rio, sem restri��o de acesso por local.
-- create user 'fernando'@'%' identified by '1234';


-- Cria usu�rio, permitindo o acesso apenas do ip local
	create user 'fernando'@'local' identified by '1234';

-- Permitindo acesso a todas estruturas existentes no banco de dados curso_sql, se o user se conectar no localhost
	grant all on curso_sql.* to 'fernando'@'localhost';
