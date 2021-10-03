
use mymundo;
select nome, (max(datediff(now(), datanasc) div 365)) as 'Mais velho'
from pessoa, amizade, sexo
where pessoa.idpessoa = amizade.sou_amigo
and pessoa.idsexo = sexo.idsexo
and sexo = 'masculino'
and eu= '1';

