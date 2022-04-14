import mysql.connector
import time
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  database='projeto',
  password="Senha"
)


cursor = mydb.cursor()




objetivo = ""
while True:
    print("O que você deseja fazer?\n")
    objetivo = input("1-Pesquisar, 2-Inserir, 3-Remover \n")
    if (objetivo == "1"):
        objetivo1Escolha = input("1-Pesquisar notas do Aluno\n2-Buscar cadeiras de um Curso\n3-Pesquisar telefone professor\n"
        "4-Pesquisar média da turma em uma cadeira \n5-Pesquisar a quantidade de vagas do curso"
        "\n6-Todas cadeiras ministradas por um professor \n7-Pesquisar secretário que contratou qualquer professor \n")

        if (objetivo1Escolha == "1"):
            informacao = input("Digite a matrícula: ")
            cursor.callproc('buscar_notas', args = (int(informacao),))
            for result in cursor.stored_results():
                print(result.fetchall())

        elif (objetivo1Escolha == "2"):
            informacao = input("Digite o código do curso: ")
            cursor.callproc('buscar_cadeiras', args = (informacao,))
            for result in cursor.stored_results():
                print(result.fetchall())

        elif (objetivo1Escolha == "3"):
            informacao = input("Digite o CPF do professor: ")
            busca_telefone = "SELECT busca_telefone(%s)"
            result = cursor.execute(busca_telefone, (informacao,))
            print(cursor.fetchall())

        elif (objetivo1Escolha == "4"):
            informacao = input("Digite o ID da cadeira: ")
            media_turma = "SELECT media_turma(%s)"
            result = cursor.execute(media_turma, (informacao,))
            print(cursor.fetchone())

        elif (objetivo1Escolha == "5"):
            informacao = input("Digite o código do curso: ")
            qt_vagas = "SELECT qt_vagas(%s)"
            result = cursor.execute(qt_vagas, (informacao,))
            print(cursor.fetchone())

        elif (objetivo1Escolha == "6"):
            informacao = input("Digite o cpf do professor: ")
            cursor.callproc('cadeiras_professor', args = (informacao,))
            for result in cursor.stored_results():
                print(result.fetchall())

        elif (objetivo1Escolha == "7"):
            informacao = input("Digite o cpf do professor: ")
            cursor.callproc('busca_secretaria', args = (informacao,))
            for result in cursor.stored_results():
                print(result.fetchall())

    elif (objetivo == "2"):
        escolha = input("1 - Inserir Aluno\n"
                        "2 - Inserir Nota\n"
                        "3 - Inscrever um aluno numa cadeira\n"
                        "4 - Contratar um novo professor\n"
                        "5 - Inserir cadeira\n")

        if (escolha == "1"):
            matricula = input("Digite a matrícula do aluno: ")
            endereco = input("Digite o endereço do aluno: ")
            nome_aluno = input("Digite o nome do aluno: ")
            codigo_curso = input("Digite o código do curso: ")
            inserirAluno = "INSERT INTO aluno (matricula, endereco, nome, codigo_curso) VALUES(%s, %s, %s, %s)"
            valuesAluno = (matricula, endereco, nome_aluno, codigo_curso)
            cursor.execute(inserirAluno, valuesAluno)
            mydb.commit()
            print(cursor.rowcount, "Aluno inserido")

        elif (escolha == "2"):
            id_prova = input("Digite o id_prova: ")
            nota = input("Digite a nota da prova: ")
            matricula_aluno = input("Digite a matrícula do aluno: ")
            cpf_professor = input("Digite o cpf do professor: ")
            id_cadeira = input("Digite o id da cadeira: ")
            inserirNota = "INSERT INTO prova (id_prova, nota_aluno, matricula_aluno, cpf_professor, id_cadeira) VALUES(%s, %s, %s, %s, %s)"
            valuesNota = (id_prova, nota, matricula_aluno, cpf_professor, id_cadeira)
            cursor.execute(inserirNota, valuesNota)
            mydb.commit()
            print(cursor.rowcount, "Nota inserida")

        elif (escolha == "3"):
            matricula_aluno = input("Digite a matrícula do aluno: ")
            id_cadeira = input("Digite o id da cadeira: ")
            inscreverAluno = "INSERT INTO inscreve_se (matricula_aluno, id_cadeira) VALUES(%s, %s)"
            valuesInscricao = (matricula_aluno, id_cadeira)
            cursor.execute(inscreverAluno, valuesInscricao)
            mydb.commit()
            print(cursor.rowcount, "Aluno inscrito")

        elif (escolha == "4"):
            cpf_professor = input("Digite o cpf do professor: ")
            nome_professor = input("Digite o nome do professor: ")
            endereco_prof = input("Digite o endereço do professor: ")
            id_secretaria = input("Digite o id da secretaria: ")
            contProfessor = "INSERT INTO professor (cpf, nome, endereco, id_secretaria) VALUES(%s, %s, %s, %s)"
            valuesProfessor = (cpf_professor, nome_professor, endereco_prof, id_secretaria)
            cursor.execute(contProfessor, valuesProfessor)
            mydb.commit()
            print(cursor.rowcount, "Professor contratado")

        elif (escolha == "5"):
            id_cadeira = input("Digite o id da cadeira: ")
            nome_cadeira = input("Digite o nome da cadeira: ")
            qtde_vagas = input("Digite a quantidade de vagas: ")
            carga_horaria = input("Digite a carga horária: ")
            id_secretaria = input("Digite o id da secretaria: ")
            cpf_professor = input("Digite o cpf do professor: ")
            if (cpf_professor == ""):
                inserirCadeira = "INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria) VALUES(%s, %s, %s, %s, %s)"
                valuesCadeira = (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria)
            else:
                inserirCadeira = "INSERT INTO cadeira (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor) VALUES(%s, %s, %s, %s, %s, %s)"
                valuesCadeira = (id_cadeira, nome_cadeira, qtde_vagas, carga_horaria, id_secretaria, cpf_professor)
            
            cursor.execute(inserirCadeira, valuesCadeira)
            mydb.commit()
            print(cursor.rowcount, "Cadeira adicionada")
            


    elif (objetivo == "3"):
        cpf_professor = input("Digite o cpf do professor: ")
        cursor.callproc("demitir_professor", args = (cpf_professor,))
        for result in cursor.stored_results():
                print(result.fetchall())

        print(cursor.rowcount, "Professor demitido com sucesso!")
        mydb.commit()
    time.sleep(1.5)
