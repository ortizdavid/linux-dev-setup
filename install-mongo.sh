#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "🍃 Instalando o MongoDB Server (Community)..."
echo "=========================================="

# 1. Atualizar o sistema e instalar dependências necessárias
echo "🔄 Atualizando repositórios e instalando gnupg/curl..."
sudo apt update
sudo apt install -y gnupg curl

# 2. Importar a chave GPG oficial da MongoDB
echo "🔑 Importando chave GPG oficial..."
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
  sudo gpg --o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor --yes

# 3. Adicionar o repositório oficial da MongoDB (Alinhado para Ubuntu Noble/24.04)
echo "📁 Adicionando repositório oficial no APT..."
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.0 multiverse" | \
  sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list

# 4. Atualizar o APT e instalar o MongoDB Server completo e o Shell (mongosh)
echo "📦 Instalando MongoDB Server e ferramentas..."
sudo apt update
sudo apt install -y mongodb-org

# 5. Inicializar e ativar o serviço do MongoDB (mongod)
echo "🚀 Inicializando o serviço mongod..."
sudo systemctl daemon-reload
sudo systemctl start mongod
sudo systemctl enable mongod

# 6. Aguardar 2 segundos para estabilização e verificar o estado
sleep 2
echo "=========================================="

if systemctl is-active --quiet mongod; then
    echo "✅ MongoDB Server instalado e rodando perfeitamente!"
    echo "💡 Para entrar no Shell do Mongo, use o comando: mongosh"
    echo "=========================================="
else
    echo "⚠️ O MongoDB foi instalado, mas o serviço falhou ao iniciar."
    echo "=========================================="
    exit 1
fi
