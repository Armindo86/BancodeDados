select count(*) as 'Mulheres, Homens, reprovaçoes'
from pessoa, sexo, disciplina
where pessoa.idsexo = sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil
and (sexo = 'feminino'
and (datediff(now(), datanasc) div 365 ) > 18 /*Verificação de idade maior que 18 anos */
and sexo = 'masculino');
