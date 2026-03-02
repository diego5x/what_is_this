#!/bin/sh
# ----------------------------------------------------------------------------
# Autor: Diego
# Data: 2026/03/02
# Mostra o fabricante do equipamento utilizando o endereço MAC.
#
# Uso: ./macvendor.sh <MAC Address>
# Ex.: ./macvendor.sh 88:5A:92:C7:41:40
#      ./macvendor.sh 88-5A-92-C7-41-40
# ----------------------------------------------------------------------------

mac="$1"

if [ -z "$mac" ]; then
    echo "Uso: $0 <MAC Address>"
    exit 1
fi

# Validação de MAC (formato básico)
echo "$mac" | grep -Eq '^([0-9A-Fa-f]{2}[:-]?){5}[0-9A-Fa-f]{2}$'
if [ $? -ne 0 ]; then
    echo "MAC inválido."
    exit 1
fi

mac=$(echo "$mac" | tr -d ':-')

url="https://api.macvendors.com/$mac"

response=$(curl -s --connect-timeout 5 "$url")

response=$(echo "$response" | tr -d '\r')

if [ -z "$response" ]; then
    echo "Erro na consulta."
    exit 1
fi

echo "$response" | grep -qi "not found"
if [ $? -eq 0 ]; then
    echo "MAC não encontrado."
    exit 1
fi

echo "Fabricante: $response"
