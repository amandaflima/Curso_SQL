-- Operadores aritmédicos

-- + - * / ^ % 
-- || (adição de strings) 


-- crie uma coluna com a idade do cliente da tabela sales.customers
select  email, birth_date, (current_date - birth_date)/365 as idade
from sales.customers

-- 10 clientes mais novos
select  email, birth_date, (current_date - birth_date)/365 as idade
from sales.customers
order by idade


-- Operadores de comparação com true or false

-- = < > <= >= <>

-- Operadores logicos

-- and 
--or 
--not 
--between 
--in (lista)
--like (matchs imperfeitos)
-- ex: primeiros nomes distintos da tabela custumers que começa com ANA
select distinct first_name
from sales.customers
where first_name like 'ANA%' --depois de ana pode ter qualquer sequencia de caracteres

--ilike - igual o anterior mas ignora maiusculas e minusculas
select distinct first_name
from sales.customers
where first_name ilike 'ANa%' 
--is null




