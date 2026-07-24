echo "=========================================="
echo "🛠️  Instalando Ferramentas Go (Protobuf, Gateway, Swagger)..."
echo "=========================================="

# 1. Garantir que o protoc (compilador base) está instalado no sistema
sudo apt-get update -y && sudo apt-get install -y protobuf-compiler

# 2. Plugins oficiais do Go para Protobuf e gRPC
echo "📦 Instalando protoc-gen-go e protoc-gen-go-grpc..."
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# 3. gRPC-Gateway e gerador de especificações OpenAPI/Swagger
echo "🌐 Instalando gRPC-Gateway e protoc-gen-openapiv2..."
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest
go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest

# 4. Ferramenta Swaggo para geração/Injeção de Swagger UI
echo "📜 Instalando swag (Swaggo CLI)..."
go install github.com/swaggo/swag/cmd/swag@latest

# 5. Instalando o 'buf' (CLI moderno para Protobufs)
echo "⚡ Instalando Buf CLI..."
BIN="/usr/local/bin" && \
VERSION="1.30.0" && \
curl -sSL "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-Linux-x86_64" -o "${BIN}/buf" && \
chmod +x "${BIN}/buf"

echo "=========================================="
echo "🧪 Validando instalações..."
echo "=========================================="

echo "📌 protoc:" $(protoc --version)
echo "📌 buf:" $(buf --version)
echo "📌 swag:" $(swag --version | head -n 1)

# Garantir que o ~/go/bin está no PATH do terminal
if ! grep -q 'export PATH=$PATH:$HOME/go/bin' ~/.bashrc; then
    echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
    source ~/.bashrc
fi

echo "=========================================="
echo "✅ Todas as ferramentas Go para Protobuf/Swagger estão prontas!"
echo "=========================================="
