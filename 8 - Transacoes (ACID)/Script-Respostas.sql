use softblue;


-- Exercício 1
-- Baseado na tabela, construa uma transação que atualiza o valor aplicado em cada conta bancária 
-- baseado no índice de correção percentual de 3%, garantindo que a instrução de UPDATE seja realizada 
-- na tabela toda, com as propriedades ACID.

create table CONTA_BANCARIA
(
	codigo integer unsigned not null auto_increment, -- Codigo interno(pk)
	titular varchar(32) not null, -- Nome do titular da conta
	saldo double not null, -- Representa o saldo da conta
	primary key(codigo) -- Define o campo CODIGO como PK(Primary Key)
);

insert into conta_bancaria values (1,'André',213);
insert into conta_bancaria values (2,'Diogo',489);
insert into conta_bancaria values (3,'Rafael',568);
insert into conta_bancaria values (4,'Carlos',712);
insert into conta_bancaria values (5,'Peter',-38);

select * from conta_bancaria ;


update conta_bancaria set saldo = 213 where codigo = 1;
update conta_bancaria set saldo = 489 where codigo = 2;
update conta_bancaria set saldo = 568 where codigo = 3;
update conta_bancaria set saldo = 712 where codigo = 4;
update conta_bancaria set saldo = -38 where codigo = 5;

start transaction;
update conta_bancaria set saldo = saldo*1.03 where saldo>0;
commit;



