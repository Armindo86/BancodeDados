/*Exercicio 11
	Listar os alunos matriculado em algum curso
 */
 use myescola;
 select pessoa.*, curso.nome, datamatricula
 from pessoa, matricula, curso
 where pessoa.idpessoa = matricula.idpessoa
 and curso.idcurso = matricula.idcurso;