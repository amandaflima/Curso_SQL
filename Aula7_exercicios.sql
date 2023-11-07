select * from sales.customers
-- (Exercício 1) Crie uma coluna calculada com o número de visitas realizadas por cada
-- cliente da tabela sales.customers


with numero_visitas as (
	select customer_id, count(*) as qtd_visitas
	from sales.customers
	group by customer_id
)

select cus.*, qtd_visitas
from sales.customers as cus left join numero_visitas as num
	on cus.customer_id = num.customer_id
