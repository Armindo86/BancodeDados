
/* Usando função min para retornar menor idade das dependentes*/
use mymundo;
select min(datediff(now(), datanasc) div 365) as 'idade'
from pessoa, sexo
where pessoa.idsexo = sexo.idsexo
and sexo = 'feminino'
and dependente_de = '1';