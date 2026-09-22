#!/bin/bash

echo "=========================================="
echo "🍃 Instalando Clientes de Bancos NoSQL..."
echo "=========================================="

sudo apt-get update -y
sudo apt-get install -y gnupg curl

# 1. Adicionar repositório oficial da MongoDB para o mongosh
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor --yes

UBUNTU_CODENAME=$(lsb_release -cs)
echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

sudo apt-get update -y

# 2. Instalar mongosh (MongoDB Shell) e redis-tools (redis-cli)
sudo apt-get install -y mongodb-mongosh redis-tools

echo "=========================================="
echo "🧪 Validando instalação dos clientes NoSQL..."
echo "=========================================="

if command -v mongosh &> /dev/null; then
    echo "✅ MongoDB Shell (mongosh):" $(mongosh --version)
else
    echo "⚠️ Falha ao instalar mongosh."
fi

if command -v redis-cli &> /dev/null; then
    echo "✅ Redis CLI (redis-cli):" $(redis-cli --version)
else
    echo "⚠️ Falha ao instalar redis-cli."
fi

echo "=========================================="
