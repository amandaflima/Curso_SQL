-- Unions - colar tabela sobre a outra desde que elas tenham a mesma quantidade de colunas e elas tenham o mesmo tipo de unidade
-- Union all não remove linhas duplicatas
-- Union remove duplicatas

-- exemplos:
select * from sales.products
union all
select * from temp_tables.products_2

