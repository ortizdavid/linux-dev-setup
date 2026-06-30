#!/bin/bash
echo "🦮 Configurando identidade do Git..."
git config --global user.email "ortizaad1994@gmail.com"
git config --global user.name "Ortiz David"

echo "🔑 Gerando nova chave SSH para o GitHub (pressione Enter se pedir confirmação)..."
# O -f garante que ele salva no caminho padrão sem perguntar, e o -N "" deixa sem senha
ssh-keygen -t ed25519 -C "ortizaad1994@gmail.com" -f ~/.ssh/id_ed25519 -N ""

echo -e "\n🚀 COPIA A CHAVE ABAIXO E ADICIONA NO TEU GITHUB (Settings -> SSH keys):\n"
cat ~/.ssh/id_ed25519.pub
echo -e "\n----------------------------------------------------------------------"
