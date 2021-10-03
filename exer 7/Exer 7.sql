
/*
	Retorna os nomes, telefone, sexo e estadocivil dos dependentes do Marco.
*/
use mymundo;
select nome, telefone, sexo, estcivil
from pessoa, telefone, sexo, estcivil
where pessoa.idpessoa = telefone.idpessoa
and pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and dependente_de = '1';
