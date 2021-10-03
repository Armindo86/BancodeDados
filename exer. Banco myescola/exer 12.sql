/*Exercicio 12
	Listar os alunos matriculado em algum curso e ordenar por curso
 */
 use myescola;
 select pessoa.*, curso.nome, datamatricula
 from pessoa, matricula, curso
 where pessoa.idpessoa = matricula.idpessoa
 and curso.idcurso = matricula.idcurso
 order by curso.nome;