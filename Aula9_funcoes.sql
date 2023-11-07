-- FUNÇÕES

--CRIE UMA FUNÇÃO CHAMADA DATEDIFF PARA CALCULAR A DIFERENÇA ENTRE 2 DATAS

SELECT (current_date - '2018-06-01')
SELECT (current_date - '2018-06-01')/7 as semanas
SELECT (current_date - '2018-06-01')/30 as meses
SELECT (current_date - '2018-06-01')/365 as anos

--criando a funcao
create function datediff(unidade varchar,inicio date,fim date)
returns integer
language sql

as

$$
	select 
		case 
			when unidade in ('d', 'days','day') then (inicio-fim)
			when unidade in ('w', 'week','weeks') then (inicio-fim)/7
			when unidade in ('m', 'month','months') then (inicio-fim)/30
			when unidade in ('y', 'year','years') then (inicio-fim)/365
		end as diferenca
$$

 select datediff('weeks', '2018-06-01',current_date)
 
 --deletando a funcao
 drop function datediff