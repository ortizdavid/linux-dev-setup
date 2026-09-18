echo "=========================================="
echo "🚀 Instalando a versão mais recente do .NET SDK..."
echo "=========================================="

# 1. Baixar o script de instalação oficial da Microsoft
curl -sSL https://dot.net/v1/dotnet-install.sh -o dotnet-install.sh
chmod +x dotnet-install.sh

# 2. Instalar o SDK mais recente do canal atual/estável
./dotnet-install.sh --version latest --channel Latest

# 3. Limpar o script baixado
rm dotnet-install.sh

# 4. Configurar as variáveis de ambiente no .bashrc
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools

if ! grep -q 'DOTNET_ROOT' ~/.bashrc; then
    echo '' >> ~/.bashrc
    echo '# --- .NET Configuration ---' >> ~/.bashrc
    echo 'export DOTNET_ROOT=$HOME/.dotnet' >> ~/.bashrc
    echo 'export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools' >> ~/.bashrc
fi

echo "=========================================="
echo "🔐 Configurando Certificados HTTPS de Dev..."
echo "=========================================="

# 5. Gerar e confiar nos certificados de desenvolvimento
$HOME/.dotnet/dotnet dev-certs https --clean
$HOME/.dotnet/dotnet dev-certs https --trust

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if $HOME/.dotnet/dotnet --version &> /dev/null; then
    echo "✅ .NET instalado com sucesso!"
    echo "📌 Versão do SDK:" $($HOME/.dotnet/dotnet --version)
    echo ""
    echo "📌 Runtimes instalados:"
    $HOME/.dotnet/dotnet --list-runtimes
    echo ""
    echo "📌 Estado do Certificado HTTPS:"
    $HOME/.dotnet/dotnet dev-certs https --check
else
    echo "⚠️ Falha ao verificar a instalação do .NET."
fi

echo "=========================================="
