#!/bin/bash

# Interromper o script se algum comando falhar
set -e

echo "=========================================="
echo "🐘 Instalando e Configurando o PostgreSQL..."
echo "=========================================="

# 1. Atualizar e instalar o Postgres e componentes
echo "🔄 Instalandos pacotes do Postgres..."
sudo apt update
sudo apt install -y postgresql postgresql-contrib

# 2. Garantir que o cluster padrão do Postgres está criado e ativo
# (Isso resolve o problema de o serviço não iniciar em ambientes limpos/Live)
echo "⚙️  Configurando cluster de banco de dados..."
if ! pg_lsclusters | grep -q "main"; then
    sudo pg_createcluster 16 main --start || true
fi

# 3. Iniciar e habilitar o serviço no sistema
echo "🚀 Inicializando o serviço do PostgreSQL..."
sudo systemctl start postgresql
sudo systemctl enable postgresql

# 4. Aguardar 3 segundos para garantir que o banco subiu totalmente antes dos comandos
sleep 3

echo "🔑 Configurando usuário e criando os bancos de dados..."
# Alterar a senha do usuário padrão 'postgres'
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD '003334743LA032';"

# Criar os bancos de dados do seu projeto (Gestão de Patrimônio)
sudo -u postgres psql -c "CREATE DATABASE gestao_patrimonio;" || echo "Banco gestao_patrimonio já existe ou falhou."
sudo -u postgres psql -c "CREATE DATABASE gestao_patrimonio_historico;" || echo "Banco gestao_patrimonio_historico já existe ou falhou."

echo "=========================================="
echo "✅ PostgreSQL configurado com sucesso!"
echo "=========================================="

