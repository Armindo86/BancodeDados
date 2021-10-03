
/*
	Retorna quantidade dos nomes das mulheres solteiras.
*/
use mymundo;
select count(*)
from pessoa, sexo, estcivil
where pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and sexo ='Feminino'
and estcivil = 'solteiro(a)'
and dependente_de = '1';