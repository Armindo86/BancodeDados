//* Listar todos os nomes com respectivos telefones, sexo e estado civil. Ex. 8 */
use myescola;
select pessoa.*, telefone, sexo, estcivil 
from pessoa,telefone, sexo, estcivil
where pessoa.idpessoa = telefone.idpessoa
and pessoa.idsexo=sexo.idsexo
and pessoa.idestcivil = estcivil.idestcivil;