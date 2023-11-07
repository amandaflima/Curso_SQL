--SUBQUERIES
--TIPOS: no WHERE, WITH, FROM, SELECT


-- Veiculo mais barato na tabela products
select * 
from sales.products 
where price = (select min(price) from sales.products)

--subquery com with - idade média dos clientes por status profissional
with alguma_tabela as (
	select professional_status, (current_date - birth_date)/365 as idade
from sales.customers
)

select professional_status, avg(idade) as idade_media
from alguma_tabela
group by professional_status

--subquery no from - calcule a media de idade dos clientes por status profissional 
select professional_status, avg(idade) as idade_media
from (
	select professional_status, (current_date - birth_date)/365 as idade
	from sales.customers
    ) as alguma_tabela 
group by professional_status

--subquery no select - Na tabela sales.funnel crie uma coluna que informe o n° de visitas 
--acumuladas que a loja recebeu ate o momento
-- essa subquery no select é muito pesada e não é muito usada
select * from sales.funnel

select fun.visit_id, fun.visit_page_date, sto.store_name, 
	   (
		   select count(*)
		   from sales.funnel as fun2
		   where fun2.visit_page_date <= fun.visit_page_date
		   	and fun2.store_id = fun.store_id 
	   ) as visitas_acumuladas
from sales.funnel as fun left join sales.stores as sto
	on fun.store_id = sto.store_id 
order by sto.store_name, fun.visit_page_date


-- EXEMPLOS
-- CALCULE O VOLUME DE VISITAS POR DIA AO SITE SEPARADO POR 1° VISITA E DEMAIS VISITAS
with primeira_visita as (
	select customer_id, min(visit_page_date) as visita_1
	from sales.funnel
	group by customer_id
)

select fun.visit_page_date, 
	   (fun.visit_page_date <> primeira_visita.visita_1) as lead_recorrente, count(*)
from sales.funnel as fun
left join primeira_visita
	on fun.customer_id = primeira_visita.customer_id 
group by fun.visit_page_date, lead_recorrente
order by fun.visit_page_date desc, lead_recorrente



