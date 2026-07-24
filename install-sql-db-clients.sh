#!/bin/bash

echo "=========================================="
echo "🗄️  Instalando Clientes de Bancos SQL..."
echo "=========================================="

# 1. Atualizar repositórios do sistema
sudo apt-get update -y

# 2. Instalar clientes PostgreSQL, MySQL e SQLite
sudo apt-get install -y \
    postgresql-client \
    default-mysql-client \
    sqlite3

echo "=========================================="
echo "🧪 Validando instalação dos clientes SQL..."
echo "=========================================="

if command -v psql &> /dev/null; then
    echo "✅ PostgreSQL Client (psql):" $(psql --version)
else
    echo "⚠️ Falha ao instalar psql."
fi

if command -v mysql &> /dev/null; then
    echo "✅ MySQL Client (mysql):" $(mysql --version)
else
    echo "⚠️ Falha ao instalar mysql."
fi

if command -v sqlite3 &> /dev/null; then
    echo "✅ SQLite3 CLI:" $(sqlite3 --version)
else
    echo "⚠️ Falha ao instalar sqlite3."
fi

echo "=========================================="


echo "=========================================="
echo "🗄️  Instalando Clientes MSSQL (sqlcmd e bcp)..."
echo "=========================================="

# 1. Adicionar as chaves GPG e repositório oficial da Microsoft para Ubuntu
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-prod.gpg

# Configurar o repositório correto conforme a versão do sistema (Ubuntu 22.04 / 24.04 do Codespaces)
UBUNTU_VERSION=$(lsb_release -rs)
echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/microsoft-prod.gpg] https://packages.microsoft.com/ubuntu/${UBUNTU_VERSION}/prod jammy main" | sudo tee /etc/apt/sources.list.d/msprod.list

# 2. Atualizar o APT e instalar o mssql-tools18 e drivers unixODBC
sudo apt-get update -y
ACCEPT_EULA=Y sudo apt-get install -y mssql-tools18 unixodbc-dev

# 3. Adicionar as ferramentas do MSSQL ao PATH do terminal
if ! grep -q '/opt/mssql-tools18/bin' ~/.bashrc; then
    echo '' >> ~/.bashrc
    echo '# --- MSSQL Tools Configuration ---' >> ~/.bashrc
    echo 'export PATH="$PATH:/opt/mssql-tools18/bin"' >> ~/.bashrc
fi

# Aplicar o PATH imediatamente na sessão atual
export PATH="$PATH:/opt/mssql-tools18/bin"

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if command -v sqlcmd &> /dev/null; then
    echo "✅ sqlcmd (MSSQL CLI) instalado com sucesso!"
    echo "📌 Local do executável:" $(which sqlcmd)
else
    echo "⚠️ Falha ao verificar o sqlcmd no PATH. Tente executar 'source ~/.bashrc'."
fi

echo "=========================================="



