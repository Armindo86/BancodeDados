
use mymundo;
select nome, telefone
from pessoa, amizade, telefone
where pessoa.idpessoa = amizade.sou_amigo
and pessoa.idpessoa = telefone.idpessoa
and eu= '1';
