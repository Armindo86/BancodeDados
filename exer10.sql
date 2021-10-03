use mymundo;
select count(*) as 'amigos'
from pessoa, amizade
where pessoa.idpessoa = amizade.eu;

