#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "🚀 Iniciando a instalação do ambiente Python..."
echo "=========================================="

# 1. Atualizar o sistema e instalar dependências básicas
echo "🔄 Atualizando listas de pacotes básicas..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg software-properties-common

# 2. Adicionar o repositório oficial para versões recentes do Python
echo "🐍 Adicionando repositório Deadsnakes PPA..."
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt update

# 3. Instalar Python 3.14, Venv e Dev tools
echo "📦 Instalando Python 3.14, módulos de ambiente virtual e desenvolvimento..."
sudo apt install -y python3.14 python3.14-venv python3.14-dev

# 4. Instalar e garantir o PIP oficial para o Python 3.14
echo "🧪 Configurando o PIP para o Python 3.14..."
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.14

# 5. Limpeza de cache de pacotes para manter o sistema limpo
echo "🧹 Limpando cache do gerenciador de pacotes..."
sudo rm -rf /var/lib/apt/lists/*

echo "=========================================="
echo "✅ Instalação concluída com sucesso!"
echo "=========================================="
echo "💡 Para criar um ambiente virtual no seu projeto use:"
echo "   python3.14 -m venv .venv"
echo "   source .venv/bin/activate"
echo "=========================================="
