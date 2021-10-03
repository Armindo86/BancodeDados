
/* retornar menor idade das dependentes e seus respectivos nomes*/
use mymundo;
select nome, (datediff(now(), datanasc) div 365) as 'idade'
from pessoa, sexo
where pessoa.idsexo = sexo.idsexo
	and sexo = 'feminino'
	and dependente_de = '1'
order by idade asc
limit 1;
