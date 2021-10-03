use mymundo;
select nome, sexo 
from pessoa, sexo
where pessoa.idsexo = sexo.idsexo
and sexo ='feminino'
and dependente_de = '1';