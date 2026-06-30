#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "🔴 Instalando e Configurando o Redis..."
echo "=========================================="

# 1. Atualizar e instalar o Redis Server
echo "🔄 Instalando o pacote do Redis..."
sudo apt update
sudo apt install -y redis-server

# 2. Iniciar e habilitar o serviço para iniciar com o sistema
echo "🚀 Inicializando o serviço do Redis..."
sudo systemctl start redis-server
sudo systemctl enable redis-server

# 3. Aguardar 1 segundo para o serviço estabilizar
sleep 1

# 4. Testar a conectividade automaticamente com o redis-cli
echo "🧪 Testando conexão com o Redis..."
RESPONSE=$(redis-cli ping)

if [ "$RESPONSE" = "PONG" ]; then
    echo "=========================================="
    echo "✅ Redis instalado e respondendo com: $RESPONSE!"
    echo "=========================================="
else
    echo "=========================================="
    echo "⚠️  O Redis foi instalado, mas não respondeu ao PING esperado."
    echo "=========================================="
    exit 1
fi
