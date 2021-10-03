
use mymundo;
select nome, sexo, estcivil
from pessoa, amizade, sexo, estcivil
where pessoa.idpessoa = amizade.sou_amigo
and pessoa.idsexo = sexo.idsexo
and sexo = 'feminino'
and estcivil = 'solteiro(a)'
and eu='1';