CREATE PROCEDURE curso_sql.limpa_pedidos()
begin
	set SQL_SAFE_UPDATES = 0 ; -- LIBERA update SEM where 
	delete from pedidos p where pago = 'Não'; -- Dentro da stored procedure é possivel deixar inumeras operacoes
END