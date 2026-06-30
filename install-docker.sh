#!/bin/bash

# 1. Atualizar a lista de pacotes e instalar dependências básicas
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

# 2. Criar o diretório para as chaves de segurança, se não existir
sudo install -m 0755 -d /etc/apt/keyrings

# 3. Baixar a chave GPG oficial do Docker e salvar usando o dearmor
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg 2> /dev/null

# 4. Adicionar o repositório oficial do Docker às fontes do sistema
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 5. Atualizar a lista de pacotes com o novo repositório incluso
sudo apt-get update

# 6. Instalar o Docker e seus plugins essenciais (incluindo o Docker Compose)
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 7. Verificar se o Docker foi instalado e está rodando
sudo systemctl status docker --no-pager
