#!/bin/bash

echo "=========================================="
echo "📦 A descarregar as MongoDB Database Tools..."
echo "=========================================="

# 1. Descarregar o pacote oficial das ferramentas
curl -O https://fastdl.mongodb.org/tools/db/mongodb-database-tools-ubuntu2204-x86_64-100.9.4.tgz

echo "=========================================="
echo "📂 A extrair e a instalar os binários..."
echo "=========================================="

# 2. Extrair e copiar para o path global do sistema
tar -zxvf mongodb-database-tools-ubuntu2204-x86_64-100.9.4.tgz
sudo cp mongodb-database-tools-ubuntu2204-x86_64-100.9.4/bin/* /usr/local/bin/

# 3. Limpar ficheiros temporários
rm -rf mongodb-database-tools-*

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if mongoimport --version &> /dev/null; then
    echo "✅ MongoDB Database Tools instaladas com sucesso!"
    echo "📌 Versão:" $(mongoimport --version | head -n 1)
else
    echo "⚠️ Falha na instalação das MongoDB Database Tools."
fi
