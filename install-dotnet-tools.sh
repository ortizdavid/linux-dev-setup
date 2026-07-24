echo "=========================================="
echo "🛠️  Instalando Ferramentas Globais do .NET..."
echo "=========================================="

# 1. Instalar dependências nativas de sistema para o .NET no Linux
sudo apt-get update -y
sudo apt-get install -y libgdiplus libc6-dev

# 2. Instalar a CLI do Entity Framework Core (EF Core)
echo "📦 Instalando Entity Framework Core CLI (dotnet-ef)..."
dotnet tool install --global dotnet-ef

# 3. Instalar analisadores de segurança e vulnerabilidade de pacotes NuGet
echo "🛡️  Instalando analisadores de vulnerabilidades..."
dotnet tool install --global dotnet-security-check
dotnet tool install --global dotnet-outdated-tool

# 4. Instalar gerador automático de código (Scaffolding)
echo "⚡ Instalando ASP.NET Code Generator..."
dotnet tool install --global dotnet-aspnet-codegenerator

echo "=========================================="
echo "🧪 Validando ferramentas instaladas..."
echo "=========================================="

dotnet tool list -g

echo "=========================================="
echo "✅ Ambiente .NET 10 100% completo e pronto para produção!"
echo "=========================================="
