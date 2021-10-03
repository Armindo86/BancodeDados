use mymundo;
select nome
from pessoa, amizade
where pessoa.idpessoa = amizade.sou_amigo
and eu= '1';

