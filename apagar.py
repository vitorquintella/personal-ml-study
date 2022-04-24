def valida_palavra():
    """
    Função que pede o nome de um objeto para o usuário.
    Verifica se a entrada é um texto.
    Verifica se a quantidade de letras da palavra inserida possui entre 4 e 8 letras.
    Se atender aos requisitos, imprime "Palavra válida" e retorna a palavra.
    Caso contrário, imprime "Palavra inválida" e pede novamente o nome do objeto.
    Retorna a palavra valida inserida pelo usuário.
    """
    palavra = input("Digite o nome do objeto: ")
    tamanho_valido = len(palavra) >= 4 and len(palavra) <= 8
    eh_texto = palavra.isalpha()
    while not (tamanho_valido and eh_texto):
        print("Palavra inválida")
        palavra = input("Digite o nome do objeto: ")
        tamanho_valido = len(palavra) >= 4 and len(palavra) <= 8
        eh_texto = palavra.isalpha()
    print("Palavra válida")
    return palavra


def estiliza_palavra():
    """
    Função que através da funcao valida_palavra pede ao usuário o nome de um objeto.
    A função performa as seguintes substituições:
    - Toda letra 'a' ou 'A' é substituída por '4'
    - Toda letra 'i' ou 'I' é substituída por '1'
    - Toda letra 'e' ou 'E' é substituída por '3'
    Após isso a função imprime a palavra com as substituições feitas.
    Retorna a palavra estilizada.
    """
    palavra = valida_palavra()
    palavra = palavra.replace('a', '4')
    palavra = palavra.replace('A', '4')
    palavra = palavra.replace('i', '1')
    palavra = palavra.replace('I', '1')
    palavra = palavra.replace('e', '3')
    palavra = palavra.replace('E', '3')
    print(palavra)
    return palavra


def fatorial_recursivo(n):
    """
    Função que calcula o fatorial de um número n.
    Recebe um número inteiro n e retorna o fatorial de n.
    Apenas trabalha com números não menores que 1000.
    Caso n seja menor que 0, imprime "Numeros negativos não são aceitos" e retorna None.
    Caso n seja maior que 1000, a função imprime "Número muito grande" e retorna None.

    Obs.: Devido às limitações do python (a priori) a função só pode ser utilizada para n até 1000.
    É possível alterar o limite da quantidade recursões pela função 'sys.setrecursionlimit(n)'.
    Porém, isto só deve ser feito se for extremamente necessário.
    Considerei que não é o este exercício não é um caso extremamente necessário.
    """
    if n < 0:
        print("Números negativos não são aceitos")
        return None
    elif n > 1000:
        print("Número muito grande")
        return None
    elif n == 0:
        return 1
    else:
        return n * fatorial_recursivo(n-1)


def tratar_lista_numeros(lista_numeros):
    """
    A função recebe uma lista de números como parâmetros.
    Descarta-se todos os números não positivos.
    Depois, remove os números repetidos.
    Depois, calcula a média dos números restantes.
    Depois, o resultado é impresso na tela.
    Retorna o resultado da média.
    """
    lista = [x for x in lista_numeros if x > 0]
    lista = list(set(lista))
    media = sum(lista) / len(lista)
    print(media)
    return media


def soma_caracteres_condicionado(string):
    """
    Função que recebe uma string e retorna a soma dos caracteres segundo regra específica.
    A string é transformada em lista de palavras.
    Palavras começadas por 'p' são removidas.
    Palavras terminadas por 's' são removidas.
    Os caracteres das palavras restantes são somados.
    Imprime a soma dos caracteres.
    Retorna a soma dos caracteres.
    """
    lista = string.split(',')
    lista = [x for x in lista if x[0] != 'p']
    lista = [x for x in lista if x[-1] != 's']
    soma = 0
    for palavra in lista:
        soma += len(palavra)
    print(f'Soma de caracteres segunda a regra é {soma}.')
    return soma

