-- Select: selecionar colunas de tabelas -----------------------------------------

--Selecionar emails dos clientes
select email
from sales.customers

--Selecionar emails e nomes  dos clientes
select first_name, last_name, email
from sales.customers

--Selecionar todas as colunas
select *
from sales.customers



-- Distinct: remove duplicatas, mostrando apenas linhas distintas ------------------------------

--Selecionar marcas de carros sem distinct
select brand
from sales.products

--Selecionar marcas de carros com distinct
select distinct brand
from sales.products

--Selecionar marcas e anos de modelos de carros com distinct
select distinct brand, model_year
from sales.products



-- Where: filtra linhas da tabela de acordo com uma condição  ------------------------

-- Liste emails de clientes que moram em santa catarina
select email, state
from sales.customers
where state = 'SC' --usar aspas simples

-- Liste emails de clientes que moram em santa catarina ou sao paulo
select email, state
from sales.customers
where state = 'SC' or state ='SP' --usar aspas simples

-- Liste emails de clientes que moram em santa catarina ou sao paulo com mais de 30 anos
select email, state, birth_date
from sales.customers
where (state = 'SC' or state ='SP') and birth_date < '1993-10-02'

--ouu
select email, state, birth_date
from sales.customers
where (state = 'SC' or state ='SP') and birth_date < '19931002'

 


-- Order By: ordena a seleção  ------------------------

-- Liste produtos da tabela products na ordem crescente com base no preço
select *
from sales.products
order by price --ordenar em ordem crescente

--ordenar em ordem decrescente
select *
from sales.products
order by price desc


-- Limit: limitar o numero de linhas que vai aparecer  ------------------------

-- Liste os 10 produtos mais caros da tabela products
select *
from sales.products
order by price desc --ordenar em ordem crescente
limit 10



