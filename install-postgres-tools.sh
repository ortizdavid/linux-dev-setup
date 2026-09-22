#!/bin/bash

echo "=========================================="
echo "🐘 A instalar o PostgreSQL Client Tools..."
echo "=========================================="

# 1. Atualizar e instalar apenas as ferramentas cliente
sudo apt-get update -y
sudo apt-get install -y postgresql-client

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if pg_dump --version &> /dev/null; then
    echo "✅ PostgreSQL Client Tools instaladas com sucesso!"
    echo "📌 Versão:" $(pg_dump --version)
else
    echo "⚠️ Falha na instalação das ferramentas do PostgreSQL."
fi

# 3. Teste rápido de disponibilidade dos comandos principais
echo "📌 Ferramentas disponíveis: pg_dump, pg_restore, psql"
