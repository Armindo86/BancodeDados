/* Exer 9
	Listar anos com mais de 26 anos e seus telefones
*/
use myescola;
select pessoa. *, telefone, (datediff(now(), datanasc)div 365) as idade  /* Função que calcula numero de dias de vivencia de uma pessoa e divide por 365 dias*/
from pessoa, telefone
where pessoa.idpessoa = telefone.idpessoa
and (datediff(now(), datanasc)) div 365 > 26; /*Verificação de idade maior que 26 anos */