
use mymundo;
select nome, sexo, (min(datediff(now(), datanasc) div 365)) as 'Mais novo'
from pessoa, amizade, sexo
where pessoa.idpessoa = amizade.sou_amigo
and pessoa.idsexo = sexo.idsexo
and eu= '1';
