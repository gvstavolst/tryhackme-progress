#!/bin/bash
# port_scan.sh — Wrapper simples para nmap
# Uso: ./port_scan.sh <IP>
# Exemplo: ./port_scan.sh 10.10.10.10

if [ -z "$1" ]; then
  echo "Uso: $0 <IP>"
  exit 1
fi

TARGET=$1
OUTPUT="scan_$(echo $TARGET | tr '.' '_')_$(date +%Y%m%d_%H%M%S)"

echo "[*] Iniciando scan em $TARGET ..."
echo "[*] Output: $OUTPUT.txt"
echo ""

# Scan rápido para descobrir portas abertas
nmap -sV -sC -T4 -oN "${OUTPUT}.txt" $TARGET

echo ""
echo "[+] Scan concluído. Resultado salvo em ${OUTPUT}.txt"
