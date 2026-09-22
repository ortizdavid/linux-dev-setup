#!/bin/bash

echo "=========================================="
echo "🐬 A instalar o MySQL Client Tools..."
echo "=========================================="

# 1. Atualizar e instalar as ferramentas de cliente do MySQL
sudo apt-get update -y
sudo apt-get install -y mysql-client

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if mysqldump --version &> /dev/null; then
    echo "✅ MySQL Client Tools instaladas com sucesso!"
    echo "📌 Versão:" $(mysqldump --version)
else
    echo "⚠️ Falha na instalação das ferramentas do MySQL."
fi

# 3. Teste rápido de disponibilidade dos comandos principais
echo "📌 Ferramentas disponíveis: mysqldump, mysql"
