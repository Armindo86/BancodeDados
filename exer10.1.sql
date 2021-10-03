use mymundo;
select count(*) as 'Amigos'
from pessoa, amizade
where pessoa.idpessoa = amizade.eu
and eu= '1';

