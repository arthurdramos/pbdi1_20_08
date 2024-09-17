import psycopg

class Usuario:
    def __init__(self, login, senha):
        self.login = login
        self.senha = senha

def existe(usuario):
    try:
        with psycopg.connect(
            host='localhost',
            dbname='20242_fatec_ipi_pbdi_arthur',
            user='postgres',
            password='webcheats'
        ) as conexao:
            with conexao.cursor() as cursor:
                cursor.execute(
                    'SELECT * FROM tb_usuario WHERE login=%s AND senha=%s',
                    (usuario.login, usuario.senha)
                )
                result = cursor.fetchone()
                return result is not None
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return False

def cadastro(usuario):
    try:
        with psycopg.connect(
            host='localhost',
            dbname='20242_fatec_ipi_pbdi_arthur',
            user='postgres',
            password='webcheats'
        ) as conexao:
            with conexao.cursor() as cursor:
                cursor.execute(
                    'INSERT INTO tb_usuario (login, senha) VALUES (%s, %s)',
                    (usuario.login, usuario.senha)
                )
                # Confirmar a transação
                conexao.commit()
                print('Usuário cadastrado com sucesso!')
                return True
    except Exception as e:
        print(f"Erro ao conectar ao banco de dados: {e}")
        return False

def menu():
    texto = "0-Fechar\n1-Login\n2-Logoff\n3-Cadastro\nEscolha uma opção: "
    usuario = None 
    while True:
        try:
            op = int(input(texto))
        except ValueError:
            print("Por favor, insira um número válido.")
            continue
        
        if op == 0:
            print('Até mais!')
            break
        elif op == 1:
            login = input('Digite o seu login:\n')
            senha = input('Digite sua senha:\n')
            usuario = Usuario(login, senha)
            print('Usuário OK!' if existe(usuario) else 'Usuário NOK!')
        elif op == 2:
            usuario = None
            print('Logoff realizado com sucesso!')
        elif op == 3:
            login = input('Digite o login para cadastro:\n')
            senha = input('Digite a sua senha para cadastro:\n')
            novo_usuario = Usuario(login, senha)
            cadastro(novo_usuario)
        else:
            print('Opção inválida, tente novamente.')

def main():
    menu()

main()
