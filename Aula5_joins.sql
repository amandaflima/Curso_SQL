-- left join
select * from temp_tables.tabela_1
select * from temp_tables.tabela_2

select t1.cpf, t1.name, t2.state
from temp_tables.tabela_1 as t1 left join temp_tables.tabela_2 as t2
on t1.cpf = t2.cpf

--exemplos
-- qual o status profissional mais frequente dos clientes que compraram automoveis no site
select * from sales.funnel
select * from sales.customers

select t2.professional_status, count(t1.paid_date) as pagamentos
from sales.funnel as t1 left join sales.customers as t2
on t1.customer_id = t2.customer_id
group by t2.professional_status
order by pagamentos desc


--exemplos
-- qual o genero mais frequente dos clientes que compraram automoveis no site
select * from sales.customers
select * from temp_tables.ibge_genders

select t3.gender , count(t1.paid_date) as pagamentos
from sales.funnel as t1 left join sales.customers as t2
on t1.customer_id = t2.customer_id
left join temp_tables.ibge_genders as t3
on lower(t2.first_name) = t3.first_name
group by t3.gender
