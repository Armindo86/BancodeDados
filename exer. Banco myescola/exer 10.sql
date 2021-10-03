/* Exer 10
	Listar anos com mais de 26 anos e seus telefones
*/
use myescola;
select pessoa. *, sexo, estcivil, (datediff(now(), datanasc)div 365) as idade  /* Função que calcula numero de dias de vivencia de uma pessoa e divide por 365 dias*/
from pessoa, sexo, estcivil
where pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and (sexo = 'feminino'
and (datediff(now(), datanasc) div 365 ) > 18 /*Verificação de idade maior que 18 anos */
and estcivil = 'solteiro');

/*Contar quantos alunas são solteira */

select count(*) as 'alunas, maiores de idade e solteira'
from pessoa, sexo, estcivil
where pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and (sexo = 'feminino'
and (datediff(now(), datanasc) div 365 ) > 18 /*Verificação de idade maior que 18 anos */
and estcivil = 'solteiro');
