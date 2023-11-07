--CRIAR UM DASH DE VENDAS COM OS PRINCIPAIS INDICADORES DE DESEMPENHO E COM OS PRINCIPAIS
--DRIVERS DOS RESULTADOS DO MÊS
--GRAFICO RECEITA X TICKET MEDIO
-- LEADS (POTENCIAIS CONSUMIDORES)
-- TOP 5 MARCAS MAIS VENDIDAS, TOP 5 LONJAS QUE MAIS VENDERAM

--RECEITA, LEADS, CONVERSÃO, TICKET MEDIO MES A ES
--mês	leads (#)	vendas (#)	receita (k, R$)	conversão (%)	ticket médio (k, R$)
with leads as(
	select date_trunc('month', visit_page_date)::date as visit_page_month,
	COUNT (*) as visit_page_count
	from sales.funnel 
	GROUP BY visit_page_month
	ORDER BY visit_page_month
),



    payments as (
	select date_trunc('month', fun.paid_date)::date as paid_month,
	COUNT(fun.paid_date) as paid_count,
	sum(pro.price * (1+fun.discount)) as receita -- esta na tabela products
	from sales.funnel as fun left join sales.products as pro
		on fun.product_id = pro.product_id
		where fun.paid_date is not null
	GROUP BY paid_month
	ORDER BY paid_month
	)

select leads.visit_page_month as "mês",
	   leads.visit_page_count as "leads (#)",
	   payments.paid_count as "vendas (#)",
	   (payments.receita/1000) as "receita (k, R$)",
	   (payments.paid_count::float/leads.visit_page_count::float) as "conversão (%)",
	   (payments.receita/payments.paid_count/1000) as "ticket médio (k, R$)"
from leads left join payments
	on leads.visit_page_month = paid_month