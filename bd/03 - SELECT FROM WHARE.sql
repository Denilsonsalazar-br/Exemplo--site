-- LISTA DE EXERCICIOS DE CONSULTA SQL --
-- EXERCICIO 01 --
-- CONSULTAR NOME DO CURSO, TURMA, ANO E PERIODO DA TURMA --
-- "DISTINCT" ELIMINA LINHAS DUPLICADAS ---
SELECT DISTINCT 
curso.nome,
turma.descricao,
turma.ano,
turma.periodo

FROM curso, turma -- inner join turma on curso.co_curso = turma.co_curso; --
WHERE curso.co_curso = turma.co_curso; -- FAZENDO A LIGAÇÃO ENTRE AS TABELAS --

-- --------------------------------------------------------------------------------- --

-- EXERCICIO 02 --
-- SABER QUAIS ALUNOS ESTUDAM EM QUAIS TURMAS --
-- ACRESCENTAR RENOMEAÇÃO DE OBJETOS PARA SIMPLIFICAR --
-- "DISTINCT" ELIMINA LINHAS DUPLICADAS --
SELECT DISTINCT 
turma.descricao		AS 'TURMA',
aluno.co_aluno		AS 'MATRICULA',
aluno.nome			AS 'ALUNO'

FROM turma, aluno, aluno_turma

WHERE turma.co_turma = aluno_turma.co_turma -- FAZENDO ASSOCIAÇÃO DAS TABELAS TURMA COM ALUNO_TURMA --
AND aluno.co_aluno  = aluno_turma.co_aluno; -- FAZENDO ASSOCIAÇÃO DAS TABELAS ALUNO COM ALUNO_TURMA --

-- --------------------------------------------------------------------------------- --

-- CLÁUSULA WHERE --
SELECT * FROM aluno WHERE aluno.sg_sexo = 'M' AND aluno.co_estadocivil LIKE 'C';
-- RESULTADO DE QUAIS ALUNOS SÃO DO SEXO MASCULINO E QUE SÃO CASADOS --

SELECT aluno.nome FROM aluno WHERE aluno.nome LIKE '_M%';
-- O "LIKE" FUNCIONA COMO UM FILTRO DE PESQUISA --
-- % (PERCENTUAL) PARA QUAISQUER CARACTERES
-- _ (UNDERLINE) PARA UM CARACTER QUALQUER 

SELECT * FROM aluno WHERE aluno.nome LIKE '___ONIA%';
-- RETORNA OS NOMES QUE POSSUIE 3 CARACTRES ANTES DO "ONIA" -- 

-- --------------------------------------------------------------------------------- --

-- EXERCICIO 03 --
-- QUERO SABER QUANTAS FALTAS CADA ALUNO TEM EM SUAS DISCIPLINAS --
SELECT 
aluno.nome						AS 'NOME DO ALUNO', -- O "AS" É PARA ADICIONAR UM TITULO DA TABELA, TEMPORÁRIO --
disciplina.no_disciplina		AS 'DISCIPLINA',
count(frequencia.frequencia)	AS 'Nº FALTAS'

FROM aluno, aluno_turma, disciplina, frequencia WHERE frequencia.frequencia LIKE 'N'
AND aluno.co_aluno = aluno_turma.co_aluno       -- ASSOCIAÇÃO DA TABELA ALUNO COM ALUNO_TURMA "ATRAVÉS DA CHAVE CO_ALUNO" --
AND aluno_turma.co_aluno = frequencia.co_aluno  -- ASSOCIAÇÃO DA TABELA ALUNO_TURMA COM FREQUENCIA "COM CHAVE DUPLA - CO_ALUNO" -- 
AND aluno_turma.co_turma = frequencia.co_turma  -- ASSOCIAÇÃO DA TABELA ALUNO_TURMA COM FREQUENCIA "COM CHAVE DUPLA - CO_TURMA" -- 
AND frequencia.co_disciplina = disciplina.co_disciplina -- ASSOCIAÇÃO DA TEBELA FREQUENCIA COM DISCIPLINA " ATRAVÉS DA CHAVE CO_DISCIPLINA" --

GROUP BY aluno.nome, disciplina.no_disciplina
ORDER BY 1 ASC;

-- --------------------------------------------------------------------------------- --

-- EXERCICIO 04 --
-- ================== --
SELECT DISTINCT 
professor.nome					AS 'NOME DO PROFESSOR',
disciplina.no_disciplina		AS 'DISCIPLINA',
turma.descricao					AS 'TURMA'

FROM professor, turma, disciplina, prof_turm_disc 
WHERE professor.co_professor = prof_turm_disc.co_professor 
AND   turma.co_turma = prof_turm_disc.co_turma
AND	  disciplina.co_disciplina = prof_turm_disc.co_disciplina
ORDER BY 1;

-- --------------------------------------------------------------------------------- --