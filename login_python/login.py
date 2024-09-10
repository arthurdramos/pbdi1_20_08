import psycopg 

class Usuario:
    def __init__(self, login, senha):
        self.login = login 
        self.senha = senha

def existe(usuario):
    #abrir conexão com o postgresql 
    with psycopg.connect(
        host = 'localhost',
        dbname = '20242_fatec_ipi_pbdi_arthur',
        user = 'postgres',
        password = 'webcheats'
    ) as conexao:
        
    #por meio da conexão, obter uma abstração do tipo cursor 
    with conexao.cursor( 
        cursor.execute( #in-place
            'SELECT * FROM tb_usuario WHERE login=%s AND senha=%s',
            (usuario.login,usuario.senha)
        )

    ) as cursor
    #por meio do cursor, executar um comando SELECT 
        result cursor.fetchone()

        return result != None 

    #usar um metodo do cursor para verificar o resultado produzido pelo SELECT 
    #devolver true or false, conforme o resultado. 

def main():
    login = 'admin'
    senha = 'admin'
    usuario = Usuario(login, senha)
    print("Existe" if existe(usuario else "Não Existe"))

main()