echo "=========================================="
echo "🗄️  Instalando o SQLite3 e Ferramentas..."
echo "=========================================="

# 1. Tentar atualizar o índice do APT
sudo apt update -y

# 2. Instalar o CLI do SQLite3 e as bibliotecas de desenvolvimento
sudo apt install -y sqlite3 libsqlite3-dev

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

# 3. Testar a versão instalada
if command -v sqlite3 &> /dev/null; then
    echo "✅ SQLite3 instalado com sucesso!"
    echo "📌 Versão:" $(sqlite3 --version)
else
    echo "⚠️ Falha ao localizar o SQLite3. Verifique se a conexão de rede está ativa."
fi

echo "=========================================="
