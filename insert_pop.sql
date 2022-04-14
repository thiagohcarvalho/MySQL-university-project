USE projeto;

INSERT INTO secretaria (nome) VALUES ("Vlademir Santos");
INSERT INTO secretaria (nome) VALUES ("Matheus Henrique");
INSERT INTO secretaria (nome) VALUES ("Julia Ferraz");

INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("986.150.263-78","Otávio Augusto","866 Martha Ellen Drive",1);
INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("362.210.182-26","Marco Aurélio","1533 Rockford Road",1);
INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("598.284.313-00","Tales de Mileto", "319 Camden Street",2);
INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("468.127.738-08","Ivan IV Vasilyevich","1576 Andy Street",2);
INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("594.606.369-34","William Marshal","2150 Stout Street",3);
INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES ("870.955.617-61","Hendrick van Brederode","4657 Hickory Ridge Drive",3);

INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("PA001","Planetary Astronomy",30, 60,1,"870.955.617-61");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("BE002","Bioethics",35, 60,1,"594.606.369-34");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("ML003","Mirage Line Ups",20, 60,2,"468.127.738-08");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("CT004","Critical Thinking and Reasoning",45, 60,2,"598.284.313-00");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("ES005","Embedded Systems Design",40, 60,2,"362.210.182-26");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("PC006","Peoples and Cultures of the World",30, 60,3,"986.150.263-78");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("MW007","Magic, Witchcraft and Religion",20, 60,3,"598.284.313-00");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("HP008","Historic Preservation",40, 60,3,"870.955.617-61");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("IA009","Introduction to the Arts",60, 60,1,"598.284.313-00");
INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES ("SH010","Sociology of Happiness",30, 60,2,"362.210.182-26");

INSERT INTO curso(codigo, qtde_vagas, nome) VALUES ("PH01",60,"Philosophy");
INSERT INTO curso(codigo, qtde_vagas, nome) VALUES ("CS02",60,"Computer Science");
INSERT INTO curso(codigo, qtde_vagas, nome) VALUES ("AS03",60,"Astronomy");

INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("PH01","PA001");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("PH01","BE002");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("PH01","ML003");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("CS02","CT004");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("CS02","ES005");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("CS02","PC006");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("AS03","MW007");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("AS03","HP008");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("AS03","IA009");
INSERT INTO atribuida(codigo_curso, id_cadeira) VALUES ("AS03","SH010");

INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000001,"2810 Woodbridge Lane","Deorwine Stuarts","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000002,"3921 Camden Street","Melinda Alvine","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000003,"2533 Sunrise Road","Wybert Stroude","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000004,"298 Hall Street","Landyn Harrise","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000005,"1870 Camden Street","Linley Welche","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000006,"955 Hiney Road","Holly Rakese","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000007,"722 Rockford Road","Irvette Hoggarde","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000008,"4036 Hickory Ridge Drive","Goldie Wilkinsone","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000009,"4508 Sunrise Road","Cooper Longe","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000010,"3477 Hiney Road","Piper Bentone","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000011,"2988 Mesa Drive","Dunstan Heade","AS03");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000012,"2300 Sunrise Road","Braeden Blackbournee","AS03");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000013,"2654 Martha Ellen Drive","Cordell Hardene","AS03");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000014,"4134 Camden Street","Udele Reids","AS03");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000015,"3519 Hickory Ridge Drive","Harlan Wilkersone","AS03");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000016,"3995 Sheila Lane","Cenric Beverlye","PH01");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000017,"225 Better Street","Wilona Fairburne","CS02");
INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(000018,"536 Nicholas Street","Wylie Dextere","AS03");

INSERT INTO telefones_aluno(matricula, telefone) VALUES (000001,"(530) 513-9083");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000002,"(530) 360-5874");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000003,"(530) 375-0071");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000004,"(530) 123-0205");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000005,"(530) 685-6560");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000006,"(530) 947-6599");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000007,"(530) 958-7495");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000008,"(530) 865-8213");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000009,"(202) 874-1123");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000010,"(202) 657-7888");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000011,"(957) 755-9071");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000012,"(210) 768-9554");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000013,"(330) 677-3232");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000014,"(957) 499-3462");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000015,"(330) 500-1157");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000016,"(330) 533-7968");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000017,"(504) 598-1542");
INSERT INTO telefones_aluno(matricula, telefone) VALUES (000018,"(957) 777-1346");

INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000001,"PA001");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000001,"BE002");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000001,"ML003");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000002,"PA001");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000002,"ML003");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000003,"PA001");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000004,"PA001");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000005,"BE002");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000005,"ML003");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000006,"CT004");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000007,"CT004");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000007,"ES005");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000007,"PC006");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000008,"PC006");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000009,"ES005");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000009,"CT004");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000010,"ES005");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000011,"MW007");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000012,"MW007");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000012,"HP008");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000012,"IA009");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000012,"SH010");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000013,"SH010");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000014,"IA009");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000014,"HP008");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000015,"MW007");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000015,"SH010");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000015,"IA009");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000016,"BE002");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000016,"PA001");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000016,"ML003");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000017,"ES005");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000017,"PC006");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000018,"HP008");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000018,"IA009");
INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(000018,"SH010");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000001",7,000001,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000002",8,000001,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000001",9,000001,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000002",8,000001,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000003",7,000001,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ML00000001",7,000001,"468.127.738-08","ML003");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000003",8,000002,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000004",8,000002,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ML00000002",7,000002,"468.127.738-08","ML003");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000005",8,000003,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000006",8,000003,"870.955.617-61","PA001");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000007",9,000004,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000008",10,000004,"870.955.617-61","PA001");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000004",4,000005,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000005",8,000005,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000006",6,000005,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ML00000003",7,000005,"468.127.738-08","ML003");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("CT00000001",7,000006,"598.284.313-00","CT004");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("CT00000002",8,000007,"598.284.313-00","CT004");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ES00000001",7,000007,"362.210.182-26","ES005");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PC00000001",3,000007,"986.150.263-78","PC006");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PC00000002",5,000008,"986.150.263-78","PC006");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ES00000002",9,000009,"362.210.182-26","ES005");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("CT00000003",6,000009,"598.284.313-00","CT004");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ES00000003",10,000010,"362.210.182-26","ES005");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("MW00000001",9,000011,"598.284.313-00","MW007");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("MW00000002",9,000012,"598.284.313-00","MW007");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("HP00000001",4,000012,"870.955.617-61","HP008");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("IA00000001",7,000012,"598.284.313-00","IA009");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("SH00000001",9,000012,"362.210.182-26","SH010");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("SH00000002",9,000013,"362.210.182-26","SH010");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("HP00000002",10,000014,"870.955.617-61","HP008");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("IA00000002",8,000014,"598.284.313-00","IA009");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("MW00000003",5,000015,"598.284.313-00","MW007");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("IA00000003",8,000015,"598.284.313-00","IA009");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("SH00000003",8,000015,"362.210.182-26","SH010");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000009",8,000016,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PA00000010",7,000016,"870.955.617-61","PA001");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000007",2,000016,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000008",10,000016,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("BE00000009",9,000016,"594.606.369-34","BE002");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ML00000004",7,000016,"468.127.738-08","ML003");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("ES00000004",9,000017,"362.210.182-26","ES005");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("PC00000003",7,000017,"986.150.263-78","PC006");

INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("HP00000003",9,000018,"870.955.617-61","HP008");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("IA00000004",5,000018,"598.284.313-00","IA009");
INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES ("SH00000004",6,000018,"362.210.182-26","SH010");

INSERT INTO telefones_prof (cpf, telefone) VALUES ("986.150.263-78","(223) 888-1355");
INSERT INTO telefones_prof (cpf, telefone) VALUES ("362.210.182-26","(406) 945-1456");
INSERT INTO telefones_prof (cpf, telefone) VALUES ("598.284.313-00","(557) 803-7894");
INSERT INTO telefones_prof (cpf, telefone) VALUES ("468.127.738-08","(610) 701-8844");
INSERT INTO telefones_prof (cpf, telefone) VALUES ("594.606.369-34","(223) 900-9898");
INSERT INTO telefones_prof (cpf, telefone) VALUES ("870.955.617-61","(889) 860-1421");
