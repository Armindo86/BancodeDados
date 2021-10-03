
/*
	Retorna lista dos nomes das mulheres solteiras e seus respectivo estado civil.
*/
use mymundo;
select nome, sexo, estcivil
from pessoa, sexo, estcivil
where pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and sexo ='Feminino'
and estcivil = 'solteiro(a)'
and dependente_de = '1';