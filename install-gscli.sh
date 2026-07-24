echo "=========================================="
echo "☁️  Instalando Google Cloud CLI & Storage..."
echo "=========================================="

# 1. Adicionar o repositório oficial da Google Cloud
sudo apt-get update -y
sudo apt-get install -y apt-transport-https ca-certificates gnupg curl

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# 2. Instalar gcloud, gsutil e componentes de storage
sudo apt-get update -y
sudo apt-get install -y google-cloud-cli

echo "=========================================="
echo "🧪 Validando instalação..."
echo "=========================================="

gcloud --version | head -n 2

echo "=========================================="
echo "✅ Google Cloud CLI instalado com sucesso!"
echo "=========================================="
