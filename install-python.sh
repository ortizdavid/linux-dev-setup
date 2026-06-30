#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "🚀 Iniciando a instalação do ambiente..."
echo "=========================================="

# 1. Atualizar o sistema e instalar dependências básicas
echo "🔄 Atualizando listas de pacotes..."
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg software-properties-common

# 2. Configurar o repositório oficial do Docker (com /dev/null)
echo "🐳 Configurando Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 2> /dev/null

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 3. Instalar o Docker e seus plugins
echo "📦 Instalando Docker, Docker Compose e componentes..."
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 4. Instalar Python 3, Pip e Virtualenv
echo "🐍 Instalando Python 3, Pip e Virtualenv..."
sudo apt-get install -y python3 python3-pip python3-venv

# 5. Adicionar o usuário atual ao grupo do Docker (para não precisar de sudo no docker)
echo "👤 Ajustando permissões do Docker para o usuário $USER..."
sudo usermod -aG docker $USER

echo "=========================================="
echo "✅ Instalação concluída com sucesso!"
echo "=========================================="
echo "⚠️  IMPORTANTE: Para que a permissão do Docker funcione sem 'sudo',"
echo "   feche este terminal e abra-o novamente (ou faça logout/login)."
echo "=========================================="
