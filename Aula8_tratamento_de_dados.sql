--TRATAMENTO DE DADOS

--converter unidades -  operador :: e CAST --------------------------------

--Converter texto em data
select '2021-10-01'::date - '2021-02-01'::date
select cast('2021-10-01' as date) - cast('2021-02-01' as date)

--Converter texto em numero
select '100'::numeric - '10'::numeric

--Converter numero em texto
select replace(112122::text,'1','A')



-- tratamento geral de dados: case when, coalesce() ---------------------------------------

--calcule o numero de clientes que ganham abaixo de 5k, entre 5k e 10k,
--entre 10k e 15k e acima de 15k
with faixa_de_renda as (
	select customer_ID, income,
			case
				when income < 5000 then '0-5000' 
				when income between 5000 and 10000 then '5000-10000' 
				when income between 10000 and 15000 then '10000-15000'
				else '15000+'
			end as faixa_renda
	from sales.customers
)

select faixa_renda, count(*)
from faixa_de_renda
group by faixa_renda


-- tratamento de nulos com coalesce
-- cria uma coluna chamada população_ajustada na tabela temp_tables.regions e preencha com os dados
--da coluna population, se o campo estiver nulo preencha com a media
select *,
	case
		when population is not null then population
		else (select avg(population) from  temp_tables.regions)
	end as populacao_ajustada 
from temp_tables.regions
--opcao 2 
--coalesce avalia seus parâmetros em ordem e retorna o primeiro que não seja NULL
select *,
	coalesce(population, (select avg(population) from  temp_tables.regions)) as população_ajustada
from temp_tables.regions



-- TRATAMENTO DE TEXTO: LOWER(), UPPER(), TRIM(), REPLACE() ----------------------------------

select upper('São Paulo') = 'SÃO PAULO'

select lower('São Paulo') = 'são paulo'

select trim('SÃO PAULO    ') = 'SÃO PAULO'

select 'SAO PAULO' = replace('SÃO PAULO','Ã','A')
select REPLACE('SAO PAULO', 'SAO', 'SÃO') = 'SÃO PAULO'


--TRATAMENTO DE DATAS ------------------------------------------------------------------------
-- interval, date_trunc, extract, datediff

--INTERVAL -  CALCULE A DATA DE HJ MAIS 10 UNIDADES
select (current_date + interval '10 weeks')::date
select (current_date + interval '10 days')
select (current_date + interval '10 months')::date
select (current_date + interval '10 hours')

-- DATE_TRUNC - CALCULE QUANTAS VISITAS OCORRERAM POR MES NO SITE DA EMPRESA

select count(*), 
-- sobre o que quero contar, o que quero contar
		date_trunc('month', visit_page_date)::date as visit_page_month
from sales.funnel
group by visit_page_month
order by visit_page_month desc

--EXTRACT - CALCULE QUAL O DIA DA SEMANA QUE MAIS RECEBE VISITAS NO SITE
--extract('unidade que quero extrair' from 'data')
select extract ('dow' from visit_page_date) as dia_da_semana,
count(*)
from sales.funnel
group by dia_da_semana
order by dia_da_semana


--CALCULE A DIFERENÇA ENTRE HJ E '2018-06-01', EM DIAS,SEMANAS, MESES E ANOS

SELECT (current_date - '2018-06-01')
SELECT (current_date - '2018-06-01')/7 as semanas
SELECT (current_date - '2018-06-01')/30 as meses
SELECT (current_date - '2018-06-01')/365 as anos
 -- opção 2: essa opção abaixo não funciona pq nao existe essa função, precisaremos cria-la
 select datediff('weeks', '2018-06-01',current_date))



