use curso_sql;

-- Transacoes


-- Mostra os mecanismos de armazenamento que o MYSQL OFERECE
show engines;

create table contas_bancarias
(
	id int unsigned not null auto_increment,
	titular varchar(45)not null,
	saldo double not null,
	primary key (id)
) engine = InnoDB; -- Quando for criado a tabela, o mysql utilizar� o mecanimos de armazenamento InnoDB - fornece suporte a transacoes.

insert into contas_bancarias (titular,saldo) values ('Fernando', 1000);
insert into contas_bancarias (titular,saldo) values ('Lauren',2000);


select * from contas_bancarias;

-- Realizar uma transferencia de 100 reais da conta do Fernando para a conta da Lauren

-- Ao executar, o my sql pega a tabela que est� envolvida na opera��o durante a  transacao, congela essa tabela, para que s� vc utilize a tebela
-- caso um outro usu�rio tente realizar uma outra transa��o, a transa��o dele, ir� ficar em stand by, esperando vc finalizar, para que n�o haja
-- dados inconsistentes durante sua transa��o, lembrando que sua transa��o pode ser finalizada mediante a um rollback ou commit
start transaction;
update contas_bancarias set saldo = saldo - 100 where id =1;
update contas_bancarias set saldo = saldo + 100  where id =2;
commit;
rollback;