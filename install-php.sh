#!/usr/bin/env bash

# Interromper imediatamente caso ocorra algum erro
set -e

echo "=========================================="
echo "🚀 Iniciando a instalação do ambiente PHP..."
echo "=========================================="

# 1. Atualizar o sistema e adicionar repositórios necessários
echo "------------------------------------------"
echo "📦 Atualizando os pacotes do sistema..."
echo "------------------------------------------"
sudo apt update && sudo apt upgrade -y
sudo apt install -y software-properties-common curl gnupg lsb-release

# 2. Adicionar o repositório PPA do PHP (Ondřej Surý) para ter versões recentes e estáveis
echo "------------------------------------------"
echo "🌐 Adicionando repositório PHP oficial..."
echo "------------------------------------------"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update

# 3. Instalar o PHP e as extensões essenciais para os nossos projetos
# (Inclui extensões para manipulação de dados, segurança, JWT/cifra, mbstring, XML, cURL, etc.)
echo "------------------------------------------"
echo "⚙️ Instalando o PHP e extensões necessárias..."
echo "------------------------------------------"
sudo apt install -y \
    php-cli \
    php-common \
    php-fpm \
    php-mysql \
    php-mbstring \
    php-xml \
    php-curl \
    php-zip \
    php-gd \
    php-intl \
    php-bcmath \
    php-soap \
    php-imagick \
    php-readline

sudo apt install -y php-opcache

echo "✅ PHP instalado com sucesso! Versão atual:"
php -v

# 4. Instalar o Composer (Gerenciador de dependências do PHP)
echo "------------------------------------------"
echo "🎵 A instalar o Composer..."
echo "------------------------------------------"
if [ ! -f /usr/local/bin/composer ]; then
    cd ~
    curl -sS https://getcomposer.org/installer -o composer-setup.php
    HASH="$(curl -sS https://composer.github.io/installer.sig)"
    php -r "if (hash_file('sha384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
    rm -f composer-setup.php
    echo "✅ Composer instalado com sucesso!"
else
    echo "ℹ️ O Composer já se encontra instalado."
fi

composer --version

# 5. Validação final do ambiente
echo "=========================================="
echo "🎉 Instalação concluída com sucesso!"
echo "=========================================="
echo "Estão prontas as ferramentas de desenvolvimento PHP."
