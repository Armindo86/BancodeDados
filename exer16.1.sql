
use mymundo;
select nome, datanasc
from pessoa, amizade
where pessoa.idpessoa = amizade.sou_amigo
and eu='1'
order by nome;