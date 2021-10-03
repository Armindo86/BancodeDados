
use mymundo;
select nome, date_format(datanasc, '%d/ %m/ %y') as 'data de aniversario'
from pessoa, amizade
where pessoa.idpessoa = amizade.sou_amigo
and eu='1'
order by datanasc asc;