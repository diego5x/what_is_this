Este script é utilizado para coletar informações sobre um programa instalado no sistema. Ele verifica se o programa está instalado, coleta informações sobre sua versão, localização do binário, detalhes do pacote (para sistemas baseados no `pacman`), e o status de execução do programa.

Como Usar

1. **Certifique-se de que o script tenha permissão de execução:**

   ```bash
   chmod +x script.sh
   ```

2. **Execute o script passando o nome do programa como argumento:**

   ```bash
   ./wtf.sh <nome_do_programa>
   ```

   **Exemplo:**

   ```bash
   ./wtf.sh emacs
   ```

   O script irá mostrar:

   * A versão do programa
   * A localização do binário
   * Informações do pacote, caso o programa tenha sido instalado via `pacman`
   * O status de execução (se o programa está ou não rodando)
   * Informações gerais sobre o sistema

Limitações

Atualmente, o script foi desenvolvido para funcionar **somente em distribuições derivadas do Arch Linux** (como o Arch Linux e o Manjaro), pois ele usa o gerenciador de pacotes `pacman` para buscar informações do programa. **Suporte para outras distribuições será implementado em versões futuras**, permitindo que o script seja mais universal e funcione também em sistemas baseados no `apt` (Debian, Ubuntu) e `dnf` (Fedora), entre outros.
