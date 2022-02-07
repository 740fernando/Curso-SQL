-- Controle de acesso - se comunicam direto com servidor sql

-- obs criar um usuario, n�o garante os acessos.

-- cria usu�rio no servidor

-- Cria usu�rio, permitindo o acesso apenas de um ip especifico
-- create user 'fernando'@'200.200.190.190' identified by '1234';

-- % = Qualquer ip
-- Cria usu�rio, sem restri��o de acesso por local.
-- create user 'fernando'@'%' identified by '1234';


-- Cria usu�rio, permitindo o acesso apenas do ip local
	create user 'fernando'@'localhost' identified by '1234';

-- Permitindo acesso a todas estruturas existentes no banco de dados curso_sql, se o user se conectar no localhost
	grant all on curso_sql.* to 'fernando'@'localhost';
	

-- � p�ssivel atribuir para o mesmo usu�rio diferentes permiss�es, tendo em vista, a sua localidade que � referenciada logo ap�s o @ entre ' '
	CREATE USER 'fernando'@'%' identified BY 'viagem';

--  Foi atribu�do uma permiss�o de "consulta" E insert apenas na tabela 'funcionarios' para o usu�rio "fernando" quando estiver fora do ip local
	GRANT SELECT ON curso_sql.* TO 'fernando'@'%';
	
	GRANT INSERT ON curso_sql.funcionarios to 'fernando'@'%';
	
	/* grant insert on curso_sql.* to 'fernando'@'%';*/

-- revoke - Remove um acesso de um usuario. 
	revoke insert on curso_sql.funcionarios  from  'fernando'@'%';
	revoke select on curso_sql.* from 'fernando'@'%';

-- Se antes foi dado um acesso de consulta all (.*), o comando revoke n�o ir� funcionar se tentar retirar uma acesso espec�fico, 
	/*revoke select on curso_sql.salarios from 'fernando'@'%'; 	 */
	 
	grant select on curso_sql.funcionarios to 'fernando'@'%';
	grant select on curso_sql.veiculos to 'fernando'@'%';

	revoke select on curso_sql.funcionarios from 'fernando'@'%';
	revoke select on curso_sql.veiculos from 'fernando'@'%';

	revoke all on curso_sql.* from 'fernando'@'localhost';

-- Comando para excluir o usu�rio
	 DROP USER 'fernando'@'%';
	 DROP USER 'fernando'@'localhost';
	
-- Mostra os usu�rios existentes
	select user from mysql.user;

-- Mostra os privil�gios de usu�rio
	show grants for 'fernando'@'localhost';
	show grants for 'fernando'@'%';

	