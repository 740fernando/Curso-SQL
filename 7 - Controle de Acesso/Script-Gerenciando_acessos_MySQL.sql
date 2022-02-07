-- Controle de acesso - se comunicam direto com servidor sql

-- obs criar um usuario, não garante os acessos.

-- cria usuário no servidor

-- Cria usuário, permitindo o acesso apenas de um ip especifico
-- create user 'fernando'@'200.200.190.190' identified by '1234';

-- % = Qualquer ip
-- Cria usuário, sem restrição de acesso por local.
-- create user 'fernando'@'%' identified by '1234';


-- Cria usuário, permitindo o acesso apenas do ip local
	create user 'fernando'@'localhost' identified by '1234';

-- Permitindo acesso a todas estruturas existentes no banco de dados curso_sql, se o user se conectar no localhost
	grant all on curso_sql.* to 'fernando'@'localhost';
	

-- É póssivel atribuir para o mesmo usuário diferentes permissões, tendo em vista, a sua localidade que é referenciada logo após o @ entre ' '
	CREATE USER 'fernando'@'%' identified BY 'viagem';

--  Foi atribuído uma permissão de "consulta" E insert apenas na tabela 'funcionarios' para o usuário "fernando" quando estiver fora do ip local
	GRANT SELECT ON curso_sql.* TO 'fernando'@'%';
	
	GRANT INSERT ON curso_sql.funcionarios to 'fernando'@'%';
	
	/* grant insert on curso_sql.* to 'fernando'@'%';*/

-- revoke - Remove um acesso de um usuario. 
	revoke insert on curso_sql.funcionarios  from  'fernando'@'%';
	revoke select on curso_sql.* from 'fernando'@'%';

-- Se antes foi dado um acesso de consulta all (.*), o comando revoke não irá funcionar se tentar retirar uma acesso específico, 
	/*revoke select on curso_sql.salarios from 'fernando'@'%'; 	 */
	 
	grant select on curso_sql.funcionarios to 'fernando'@'%';
	grant select on curso_sql.veiculos to 'fernando'@'%';

	revoke select on curso_sql.funcionarios from 'fernando'@'%';
	revoke select on curso_sql.veiculos from 'fernando'@'%';

	revoke all on curso_sql.* from 'fernando'@'localhost';

-- Comando para excluir o usuário
	 DROP USER 'fernando'@'%';
	 DROP USER 'fernando'@'localhost';
	
-- Mostra os usuários existentes
	select user from mysql.user;

-- Mostra os privilégios de usuário
	show grants for 'fernando'@'localhost';
	show grants for 'fernando'@'%';

	