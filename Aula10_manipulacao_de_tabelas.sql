-- CRIAÇÃO E DELEÇÃO DE TABELAS

-- Crie tabela custumer_age com o id e idade dos clientes
create table temp_tables.customers_age as
select customer_id, (current_date-birth_date)/365 as idade from sales.customers

--ou
select customer_id, (current_date-birth_date)/365 as idade 
into temp_tables.customers_age2
from sales.customers
--visualizando as tabelas
select * from temp_tables.customers_age


--CRIE UMA TABELA DO ZERO COM A TRADUÇÃO DO STATUS PROFISSIONAL DOS CLIENTES

--select distinct professional_status
--from sales.customers

create table temp_tables.profissoes (
	professional_status varchar,
	status_profissional varchar
)

insert into temp_tables.profissoes
(professional_status, status_profissional)

values
('freelancer', 'freelancer'),
('retired', 'aposentado'),
('clt','clt'),
('other','outro')
select * from temp_tables.profissoes


--Deleção de tabela
drop table temp_tables.profissoes

--------------------------------------------------------------------------------

--Inserir linhas
--insira estagiario e desempregado na tabela temp_tables.profissoes
select * from temp_tables.profissoes

insert into temp_tables.profissoes
(professional_status, status_profissional)

values ('unemployed', 'desempregado'),
('trainee','estagiario')

--ATUALIZAR LINHAS - CORRIJA TRAINEE PARA INTERN
UPDATE temp_tables.profissoes
SET professional_status ='intern'
where status_profissional ='estagiario'

--DELETAR - DELETE AS LINHAS ESTAGIARIO E DESEMPREGADO
DELETE FROM temp_tables.profissoes
where status_profissional ='estagiario' OR status_profissional ='desempregado'

---------------------------------------------------------------------

--INSERIR COLUNAS 

alter table sales.customers
add customer_age int



UPDATE sales.customers
SET customer_age = (current_date-birth_date)/365
where true


--ALTERAR TIPO DA COLUNA
-- DE INT PARA VARCHAR

alter table sales.customers
alter column customer_age type varchar

--ALTERAR NOME DA CLUNA
alter table sales.customers
rename column customer_age to age

select * from sales.customers

--DELETAR COLUNA AGE
alter table sales.customers
DROP column age 
