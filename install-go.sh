#!/bin/bash
echo "🐹 Instalando Go (Golang)..."

# Se já baixaste o tar.gz ontem e ele ficou na raiz da pen ou algures, podes usar.
# Caso contrário, este script baixa e instala a versão estável automaticamente.
if [ ! -f "go1.26.1.linux-amd64.tar.gz" ]; then
    echo "📥 Baixando Go v1.26.1..."
    curl -OL https://golang.org/dl/go1.26.1.linux-amd64.tar.gz
fi

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.26.1.linux-amd64.tar.gz

# Configura as variáveis de ambiente no .bashrc se não existirem
if ! grep -q "/usr/local/go/bin" ~/.bashrc; then
    echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
    echo 'export PATH=$PATH:$(go env GOPATH)/bin' >> ~/.bashrc
fi

source ~/.bashrc
echo "✅ Go instalado!"
go version
