/*Exercicio 12
	Listar os alunos matriculado em curso de informatica
 */
 use myescola;
 select pessoa.*, curso.nome, telefone
 from pessoa, matricula, curso, telefone
 where pessoa.idpessoa = matricula.idpessoa
 and curso.idcurso = matricula.idcurso
 and pessoa.idpessoa = telefone.idpessoa
 and curso.nome = 'CT Informatica';