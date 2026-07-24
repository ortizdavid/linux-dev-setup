echo "=========================================="
echo "🌐 Instalando e Configurando o Nginx..."
echo "=========================================="

# 1. Atualizar e instalar Nginx
sudo apt-get update -y
sudo apt-get install -y nginx

# 2. Iniciar o serviço do Nginx
sudo service nginx start

echo "=========================================="
echo "🧪 Validando a instalação..."
echo "=========================================="

if nginx -v &> /dev/null; then
    echo "✅ Nginx instalado com sucesso!"
    echo "📌 Versão:" $(nginx -v 2>&1)
else
    echo "⚠️ Falha na instalação do Nginx."
fi

# 3. Testar se a página padrão do Nginx responde na porta 80
curl -I http://localhost:80 | head -n 1
