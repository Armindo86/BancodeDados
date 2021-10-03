
use mymundo;
select nome, (datediff(now(), datanasc) div 365 ) as 'datanasc'
from pessoa, amizade
where pessoa.idpessoa = amizade.sou_amigo
and (datediff(now(), datanasc) div 365 ) > 30
and eu='1';