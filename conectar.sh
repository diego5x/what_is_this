#!/bin/bash
# Mobax Linux
# Autor: Diego Castro
show_help() {
    echo "Uso:"
    echo "  $0 --help"
    echo "  $0 usuario servidor"
    echo ""
    echo "Descrição:"
    echo "  Abre uma interface gráfica (YAD) para conectar via SSH."
    echo "  A conexão será aberta no Alacritty."
    echo ""
    echo "Exemplo:"
    echo "  $0 suporte 10.100.1.74"
    exit 0
}

if [[ "$1" == "--help" ]]; then
    show_help
fi

if [ $# -eq 2 ]; then
    USER="$1"
    SERVER="$2"
else
    FORM=$(yad --form \
        --title="Mobax Linux" \
	--image="/home/suporte/Imagens/logo-wn.svg" \
        --field="Usuário" \
        --field="Servidor" \
        --center \
        --width=300 \
        --button="Conectar:0" \
        --button="Cancelar:1")

    [ $? -ne 0 ] && exit 1

    USER=$(echo "$FORM" | cut -d'|' -f1)
    SERVER=$(echo "$FORM" | cut -d'|' -f2)
fi

if [[ -z "$USER" || -z "$SERVER" ]]; then
    yad --error --text="Usuário ou servidor não podem estar vazios!"
    exit 1
fi

alacritty -e ssh \
    -o HostKeyAlgorithms=+ssh-rsa \
    -o PubkeyAcceptedAlgorithms=+ssh-rsa \
    "$USER@$SERVER"
