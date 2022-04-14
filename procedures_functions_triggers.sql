USE projeto;

-- Demitir um professor

CREATE PROCEDURE demitir_professor (IN cpf_prof VARCHAR(14))
BEGIN
IF EXISTS(SELECT * FROM professor WHERE professor.cpf = cpf_prof) THEN
	DELETE FROM telefones_prof WHERE telefones_prof.cpf = cpf_prof;
	UPDATE cadeira SET cadeira.cpf_professor = NULL WHERE cadeira.cpf_professor = cpf_prof;
	UPDATE prova SET prova.cpf_professor = NULL WHERE prova.cpf_professor = cpf_prof;
	DELETE FROM professor WHERE professor.cpf = cpf_prof;
ELSE
	SIGNAL SQLSTATE '45000' SET message_text = 'Esse professor não é contratado';
END IF;
END;

-- 1 - Buscar pelas notas de cada aluno

CREATE PROCEDURE buscar_notas (IN matricula_aluno INT UNSIGNED)
BEGIN
SELECT p.nota_aluno, p.id_prova FROM prova AS p
INNER JOIN aluno as a ON p.matricula_aluno = a.matricula
WHERE a.matricula = matricula_aluno
ORDER BY p.nota_aluno;
END;

-- 2 - Buscar a quantidade de vagas sobrando de um curso

CREATE FUNCTION qt_vagas(codigo_curso_query VARCHAR(4))
RETURNS INT NOT DETERMINISTIC
RETURN (
SELECT (c.qtde_vagas - COUNT(a.matricula)) FROM curso AS c
INNER JOIN aluno AS a ON a.codigo_curso = c.codigo
WHERE c.codigo = codigo_curso_query
);

-- 5 - Buscar média da turma na cadeira x

CREATE FUNCTION media_turma(id_cadeira_query VARCHAR(5))
RETURNS DECIMAL(15,2) NOT DETERMINISTIC
RETURN (
SELECT AVG(p.nota_aluno) FROM prova AS p
INNER JOIN cadeira AS c ON c.id_cadeira = p.id_cadeira
WHERE c.id_cadeira = id_cadeira_query
);

-- buscar todas as cadeiras de um curso

CREATE PROCEDURE buscar_cadeiras(IN codigo_curso_query VARCHAR(4))
BEGIN
SELECT c.nome_cadeira FROM cadeira AS c
INNER JOIN atribuida AS a ON c.id_cadeira = a.id_cadeira
WHERE a.codigo_curso = codigo_curso_query;
END;

-- buscar todas as cadeiras ministradas por um professor

CREATE PROCEDURE cadeiras_professor(IN cpf_prof VARCHAR(14))
BEGIN
SELECT c.nome_cadeira, c.id_cadeira FROM cadeira AS c
WHERE c.cpf_professor = cpf_prof;
END;

-- buscar telefone do professor

CREATE FUNCTION busca_telefone(cpf_prof VARCHAR(14))
RETURNS VARCHAR(30) NOT DETERMINISTIC
RETURN (SELECT tp.telefone FROM telefones_prof AS tp WHERE tp.cpf = cpf_prof);

-- buscar profs contratados pela secretaria

CREATE PROCEDURE busca_secretaria(IN cpf_prof VARCHAR(14))
BEGIN
SELECT s.nome, s.id FROM secretaria AS s
INNER JOIN professor AS p ON s.id = p.id_secretaria
WHERE p.cpf = cpf_prof;
END;

-- antes de matricula um novo aluno em um curso, checar se ha vagas suficiente

DELIMITER $$

CREATE TRIGGER checar_qt_vagas
BEFORE INSERT ON aluno
FOR EACH ROW
BEGIN
SELECT (c.qtde_vagas - COUNT(a.matricula)) INTO @qt_vagas FROM curso AS c
INNER JOIN aluno AS a ON a.codigo_curso = c.codigo
WHERE c.codigo = NEW.codigo_curso;
	IF (@qt_vagas < 1) THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Não há mais vagas no curso';
	END IF;
END$$

DELIMITER ;

-- quando inserir a nota de um aluno, checar se o aluno esta realmente inscrito na cadeira

DELIMITER $$

CREATE TRIGGER checar_insercao_nota
BEFORE INSERT ON prova
FOR EACH ROW
BEGIN
IF NOT EXISTS(SELECT i_s.matricula_aluno FROM inscreve_se AS i_s WHERE i_s.id_cadeira = NEW.id_cadeira AND i_s.matricula_aluno = NEW.matricula_aluno) THEN
	SIGNAL SQLSTATE '45000' SET message_text = 'Este aluno não está inscrito na cadeira';
END IF;
END$$

DELIMITER ;

-- quando um aluno se inscrever na cadeira, garantir que ele esta no curso e que não esta ja inscrito nesta cadeira

DELIMITER $$

CREATE TRIGGER checar_inscricao_aluno
BEFORE INSERT ON inscreve_se
FOR EACH ROW
BEGIN
	SELECT atr.codigo_curso INTO @codigo_curso_cadeira FROM atribuida AS atr
    WHERE atr.id_cadeira = NEW.id_cadeira;
    SELECT a.codigo_curso INTO @codigo_curso_aluno FROM aluno AS a
    WHERE a.matricula = NEW.matricula_aluno;
    IF @codigo_curso_aluno <> @codigo_curso_cadeira THEN
		SIGNAL SQLSTATE '45000' SET message_text = 'Você não pode se inscrever nessa cadeira, procure outras na opcçao "buscar cadeiras"';
	ELSEIF @codigo_curso_aluno = @codigo_curso_cadeira THEN
		IF EXISTS(SELECT i_s.matricula_aluno FROM inscreve_se AS i_s WHERE i_s.matricula_aluno = NEW.matricula_aluno AND i_s.id_cadeira = NEW.id_cadeira) THEN
			SIGNAL SQLSTATE '45000' SET message_text = 'Você já está inscrito nessa cadeira';
		END IF;
    END IF;
END$$

DELIMITER ;

-- impedir a contratacao se nao houver cadeiras sem professor

DELIMITER $$

CREATE TRIGGER impedir_insercao_prof
BEFORE INSERT ON professor
FOR EACH ROW
BEGIN
IF NOT EXISTS(SELECT c.cpf_professor FROM cadeira AS c WHERE c.cpf_professor IS NULL) THEN
	SIGNAL SQLSTATE '45000' SET message_text = 'Não foi possível a contratação do professor pois não existem cadeiras sem professor';
END IF;
END$$

DELIMITER ;