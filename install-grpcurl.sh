echo "=========================================="
echo "🚀 Instalando grpcurl no Codespaces..."
echo "=========================================="

# Método 1: Usando Go (Recomendado se o Go já estiver no PATH)
if command -v go &> /dev/null; then
    echo "📦 Instalando via 'go install'..."
    go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
else
    # Método 2: Download do binário oficial release (Caso precise sem o Go)
    echo "📥 Baixando binário oficial da versão mais recente..."
    GRPCURL_VERSION=$(curl -s https://api.github.com/repos/fullstorydev/grpcurl/releases/latest | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
    curl -sSL "https://github.com/fullstorydev/grpcurl/releases/download/v${GRPCURL_VERSION}/grpcurl_${GRPCURL_VERSION}_linux_x86_64.tar.gz" | tar -xz -C /tmp
    sudo mv /tmp/grpcurl /usr/local/bin/
fi

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if command -v grpcurl &> /dev/null; then
    echo "✅ grpcurl instalado com sucesso!"
    echo "📌 Versão:" $(grpcurl -version)
else
    # Se instalou via Go, garante que $GOPATH/bin está acessível
    if [ -f "$HOME/go/bin/grpcurl" ]; then
        sudo cp "$HOME/go/bin/grpcurl" /usr/local/bin/
        echo "✅ grpcurl copiado para /usr/local/bin com sucesso!"
        echo "📌 Versão:" $(grpcurl -version)
    else
        echo "⚠️ Falha ao localizar o grpcurl."
    fi
fi
