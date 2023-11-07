
-- (Exercício 1) Identifique quais as marcas de veículo mais visitada na tabela sales.funnel
select * from sales.funnel limit 10
select * from sales.products limit 10

select count(fun.visit_page_date) as visitas, pro.brand
from sales.funnel as fun left join sales.products as pro
on fun.product_id = pro.product_id
group by pro.brand
order by visitas desc

-- (Exercício 2) Identifique quais as lojas de veículo mais visitadas na tabela sales.funnel
select * from sales.funnel limit 10
select * from sales.stores limit 10

select count(fun.visit_page_date) as visitas, sto.store_name
from sales.funnel as fun left join sales.stores as sto
on fun.store_id = sto.store_id
group by sto.store_name
order by visitas desc

