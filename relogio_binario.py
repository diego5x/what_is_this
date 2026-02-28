import time
import os

def limpar_tela():
    os.system('cls' if os.name == 'nt' else 'clear')

def bin_digit(digito):
    return [int(b) for b in format(digito, '04b')]

def desenhar_relogio():
    try:
        while True:
            limpar_tela()
            hora = time.localtime()
            h, m = hora.tm_hour, hora.tm_min
            d1, d2 = h // 10, h % 10  
            d3, d4 = m // 10, m % 10

            col1 = bin_digit(d1)  
            col2 = bin_digit(d2)  
            col3 = bin_digit(d3) 
            col4 = bin_digit(d4)  

            print(f"Hora: {h:02d}:{m:02d}")
            for i in range(4):
                linha = ""
                for col in [col1, col2, col3, col4]:
                    if col[i]:
                        linha += "\033[35m●\033[0m "
                    else:
                        linha += "○ "
                print(linha)
            time.sleep(1)
    except KeyboardInterrupt:
        pass

if __name__ == "__main__":
    desenhar_relogio()