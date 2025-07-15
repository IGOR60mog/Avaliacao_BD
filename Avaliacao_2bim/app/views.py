from django.shortcuts import render

import pyodbc


def obter_conexao():
    # define os parametros de conexao
    driver   = '{ODBC Driver 17 for SQL Server}'
    servidor = '.\SQLEXPRESS'
    banco    = 'Aulas_BD'
    usuario  = 'sa'
    senha    = 'Senha@123' # poder ser também: "senha", "senha@123", "Senha@123" se for no lab06 "12345"

    # realiza conexao com o BD
    string_conexao = f'Driver={driver};Server={servidor};Database={banco};UID={usuario};PWD={senha}'
    conexao = pyodbc.connect(string_conexao)
    
    # retorna a conexao  
    return conexao


def home(request):
    # define a página HTML (template) que deverá será carregada
    template = 'home.html'
    return render(request, template)

def questao_3a(request):
    # define a página HTML (template) que deverá será carregada
    template = 'questao_3a.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        #cursor realiza comandos SQL e retornam para o código
        cursor = conexao.cursor()

        # define o comando SQL que será executado
        sql = '''
            SELECT  dep.nome as 'departamento',
                    fun.nome, 
                    fun.telefones

            FROM Funcionario fun
            INNER JOIN Departamento dep ON dep.id = fun.departamento_id

            ORDER BY dep.nome, fun.nome
        '''
        sql = 'SELECT * from Funcionario'
        # usa o cursor para executar o SQL
        #excuta uma consulta sql
        cursor.execute(sql)
        # obtem todos os registros retornados
        #fetchall retorna todos os registros de uma tabela
        registros = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, context={'registros': registros})
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})


def questao_3b(request):
    # define a página HTML (template) que deverá será carregada
    template = 'questao_3b.html'
    try:
        # obtem a conexao com o BD
        conexao = obter_conexao()

        # define um cursor para executar comandos SQL
        #cursor realiza comandos SQL e retornam para o código
        cursor = conexao.cursor()

        # define o comando SQL que será executado
        sql = '''
            SELECT  tur.nome as 'Nome da Turma',
                    alu.nome as 'Nome do Aluno',
                    alu.idade

            FROM Aluno alu
            INNER JOIN Turma tur ON tur.id = alu.turma_id

            ORDER BY tur.nome, alu.nome
        '''
        # usa o cursor para executar o SQL
        #excuta uma consulta sql
        cursor.execute(sql)
        # obtem todos os registros retornados
        #fetchall retorna todos os registros de uma tabela
        registros = cursor.fetchall()

        # define a pagina a ser carregada, adicionando os registros das tabelas 
        return render(request, template, context={'registros': registros})
    
    # se ocorreu algunm erro, insere a mensagem para ser exibida no contexto da página 
    except Exception as err:
        return render(request, template, context={'ERRO': err})


