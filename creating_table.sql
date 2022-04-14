CREATE DATABASE projeto;

USE projeto;

CREATE TABLE secretaria (
	id int unsigned not null auto_increment,
    nome varchar(50) not null,
    PRIMARY KEY (id)
);

CREATE TABLE professor (
	cpf varchar(14),
    nome varchar(50) not null,
    endereco varchar(200) not null,
    id_secretaria int unsigned not null,
    PRIMARY KEY (cpf),
    CONSTRAINT fk_id_secretaria_prof foreign key (id_secretaria) references secretaria (id)
);

CREATE TABLE cadeira (
	id_cadeira varchar(5) not null,
    nome_cadeira varchar(50) not null,
    qtde_vagas int unsigned not null,
    carga_horaria int unsigned not null,
    id_secretaria int unsigned not null,
    cpf_professor varchar(14),
    PRIMARY KEY (id_cadeira),
    CONSTRAINT fk_id_secretaria foreign key (id_secretaria) references secretaria (id),
    CONSTRAINT fk_cpf_professor foreign key (cpf_professor) references professor (cpf)
);

CREATE TABLE curso (
	codigo varchar(4) not null,
    nome varchar(30) not null,
    qtde_vagas int unsigned not null,
    PRIMARY KEY (codigo)
);

CREATE TABLE atribuida (
	codigo_curso varchar(4) not null,
    id_cadeira varchar(5) not null,
    CONSTRAINT fk_codigo_curso_atribuida foreign key (codigo_curso) references curso (codigo),
    CONSTRAINT fk_id_cadeira foreign key (id_cadeira) references cadeira (id_cadeira)
);

CREATE TABLE aluno (
	matricula int unsigned not null,
    endereco varchar(200) not null,
    nome varchar(50) not null,
    codigo_curso varchar(4) not null,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_codigo_curso_aluno foreign key (codigo_curso) references curso (codigo)
);

CREATE TABLE telefones_aluno (
	matricula int unsigned not null,
    telefone varchar(30) not null,
    PRIMARY KEY (matricula),
    CONSTRAINT fk_matricula_aluno foreign key (matricula) references aluno (matricula)
);

CREATE TABLE inscreve_se (
	matricula_aluno int unsigned not null,
    id_cadeira varchar(5) not null,
    CONSTRAINT fk_matricula_aluno_inscreve foreign key (matricula_aluno) references aluno (matricula),
    CONSTRAINT fk_id_cadeira_inscreve foreign key (id_cadeira) references cadeira (id_cadeira)
);

CREATE TABLE prova (
	id_prova varchar(10) not null,
    nota_aluno int unsigned,
    matricula_aluno int unsigned not null,
    cpf_professor varchar(14),
    id_cadeira varchar(5) not null,
    PRIMARY KEY (id_prova),
    CONSTRAINT fk_matricula_aluno_prova foreign key (matricula_aluno) references aluno (matricula),
    CONSTRAINT fk_cpf_professor_prova foreign key (cpf_professor) references professor (cpf),
    CONSTRAINT fk_id_cadeira_prova foreign key (id_cadeira) references cadeira (id_cadeira)
);

CREATE TABLE telefones_prof (
	cpf varchar(14),
    telefone varchar(30) not null,
    PRIMARY KEY (cpf),
    CONSTRAINT fk_cpf_prof foreign key (cpf) references professor (cpf)
);
