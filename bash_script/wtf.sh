#!/bin/bash

usage() {
    echo "Uso: $0 <nome_do_programa>"
    exit 1
}

if [ -z "$1" ]; then
    usage
fi

programa=$1

if ! command -v $programa &> /dev/null; then
    echo "$programa não está instalado no sistema."
    exit 2
fi

echo "Coletando informações sobre o programa: $programa"
echo

echo "Versão do programa:"
$programa --version 2>/dev/null || echo "Não foi possível obter a versão."
echo

echo "Localização do binário:"
which $programa
echo

if pacman -Q $programa &>/dev/null; then
    echo "Informações do pacote (pacman):"
    pacman -Qi $programa
else
    echo "Não foi possível encontrar o pacote $programa."
fi
echo

echo "Status do programa:"
ps aux | grep $programa | grep -v grep || echo "$programa não está em execução."
echo

echo "Informações do sistema:"
uname -a
echo

echo "Informações coletadas com sucesso!"
