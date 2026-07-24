echo "=========================================="
echo "🚀 Atualizando Node.js e NPM para as versões mais recentes..."
echo "=========================================="

# 1. Configurar o repositório oficial da NodeSource para o Node.js 22.x
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -

# 2. Instalar o Node.js v22 e NPM
sudo apt-get install -y nodejs

# 3. Atualizar o NPM para a versão global mais recente
sudo npm install -g npm@latest

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

echo "📌 Versão do Node.js:" $(node -v)
echo "📌 Versão do NPM:" $(npm -v)

echo "=========================================="
echo "✅ Node.js e NPM 100% atualizados!"
echo "=========================================="
