-- funções agregadas: count(), sum(), min(), max(), avg()

-- contar todas as linhas da tabela
select count(*)
from sales.funnel

-- contar toos os pagamentos da tabela sales.funnel
select *
from sales.funnel
limit 10
--pecebemos que a coluna de data de pagamento tem nulos, por isso usamos:
select count(paid_date)
from sales.funnel

--qual o veiculo mais caro da tabela products
select max(price)
from sales.products

select *
from sales.products
where price = (select max(price) from sales.products)

-- GROUP BY
-- Numero de clientes da tabela Customers por estado
select state, count(*)
from sales.customers
group by state

-- Numero de clientes da tabela Customers por estado e status
select state, professional_status, count(*) as qtd_clientes
from sales.customers
group by state, professional_status


--HAVING
--filtrar linhas de seleção por uma coluna agrupada
 --ex: numero de clientes por estado filtrando apenas os estados acima de 100 clientes
select state, count(*) as qtd_clientes
from sales.customers
group by state
having count(*)>100



