/*Exercicio 14
	Emitir o boletim da aluna Ana do semestre 2019-1, mostrando as disciplinas, notas e frequência
 */
 use myescola;
 select pessoa.idpessoa, pessoa.nome, ano_semestre, disciplina.disciplina, nota, frequencia
 from pessoa, boletim, disciplina
 where pessoa.idpessoa = boletim.idpessoa
 and disciplina.iddisciplina = boletim.iddisciplina
 and pessoa.nome = 'Ana';
 
