echo "=========================================="
echo "🚀 Instalando Clientes e Ferramentas GraphQL..."
echo "=========================================="

# Instalar graphqurl e altair-graphql-cli via NPM global
npm install -g graphqurl altair-graphql-cli

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if command -v gq &> /dev/null; then
    echo "✅ graphqurl (gq) instalado com sucesso!"
    echo "📌 Executável:" $(which gq)
else
    echo "⚠️ Falha ao instalar graphqurl."
fi

if command -v altair-cli &> /dev/null || command -v altair &> /dev/null; then
    echo "✅ Altair GraphQL CLI instalado com sucesso!"
else
    echo "ℹ️ Altair CLI instalado via pacote global."
fi

echo "=========================================="
