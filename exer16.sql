
use mymundo;
select nome, datanasc
from pessoa, amizade
where pessoa.idpessoa = amizade.sou_amigo
order by nome= 'desc'
and eu='Marco';