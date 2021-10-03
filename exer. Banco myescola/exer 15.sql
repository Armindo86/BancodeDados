/*Exercicio 12
	Calcular a media 
 */
 use myescola;
 select avg(nota) as 'Media de banco de dados 2019/1'
 from pessoa, boletim, disciplina
 where pessoa.idpessoa = boletim.idpessoa
 and disciplina.iddisciplina =boletim.iddisciplina
 and (disciplina.iddisciplina = 'Banco de dados' and ano_semestre='2019');