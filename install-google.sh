#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "☁️  Instalando a Google Cloud CLI (gcloud/gsutil)..."
echo "=========================================="

# 1. Atualizar e instalar dependências essenciais de transporte seguro
echo "🔄 Atualizando o gerenciador de pacotes..."
sudo apt update
sudo apt install -y apt-transport-https ca-certificates curl gnupg

# 2. Importar a chave pública oficial da Google Cloud
echo "🔑 Importando chave GPG da Google Cloud..."
curl https://packages.cloud.google.com/apt/doc/pubkey.gpg | \
  sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg --yes

# 3. Adicionar o repositório oficial da Google Cloud CLI no APT
echo "📁 Adicionando repositório oficial no APT..."
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
  sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list

# 4. Atualizar o índice e instalar o pacote gcloud CLI
echo "📦 Instalando o pacote google-cloud-cli..."
sudo apt update
sudo apt install -y google-cloud-cli

echo "=========================================="
echo "✅ Google Cloud CLI instalada com sucesso!"
echo "=========================================="
echo "💡 Para iniciar a configuração e fazer login na sua conta, rode:"
echo "   gcloud init"
echo "=========================================="
