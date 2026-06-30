#!/bin/bash

# ==============================================================================
# Script: install-vscode.sh
# Descrição: Instala o VS Code na RAM e configura para rodar sem Sandbox no Live USB
# Uso recomendado: source install-vscode.sh
# ==============================================================================

# Validação de escopo: Avisa se não for executado com 'source' ou '.'
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    echo "⚠️  ATENÇÃO: Para o alias funcionar no terminal atual, executa o script usando:"
    echo "   source $0"
    echo "   (ou: . $0)"
    echo "----------------------------------------------------------------------"
fi

# 1. Instalação do VS Code (Se já estiver instalado, o APT ignora rapidamente)
echo "📥 Garantindo que o VS Code está instalado na RAM..."
sudo apt update
sudo apt install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
sudo apt update
sudo apt install -y code

echo "🔧 Configurando VS Code sem Sandbox no Kubuntu..."

# 2. Modifica o atalho gráfico do menu iniciar (.desktop)
mkdir -p ~/.local/share/applications
if [ -f /usr/share/applications/code.desktop ]; then
    cp /usr/share/applications/code.desktop ~/.local/share/applications/
    # Injeta a flag --no-sandbox na linha de execução do atalho
    sed -i 's/Exec=\/usr\/share\/code\/code/Exec=\/usr\/share\/code\/code --no-sandbox/g' ~/.local/share/applications/code.desktop
    chmod +x ~/.local/share/applications/code.desktop
    echo "✅ Atalho gráfico do menu iniciar atualizado com --no-sandbox!"
else
    echo "⚠️  Aviso: Atalho gráfico /usr/share/applications/code.desktop não encontrado."
fi

# 3. Cria o alias permanente para o terminal no ~/.bashrc
if ! grep -q "alias code=" ~/.bashrc; then
    echo "alias code='code --no-sandbox'" >> ~/.bashrc
    echo "✅ Alias 'code' adicionado com sucesso ao ~/.bashrc!"
else
    echo "ℹ️  O alias 'code' já existia no ~/.bashrc (ignorado para evitar duplicados)."
fi

# 4. Atualiza o ambiente do terminal atual
source ~/.bashrc
echo "🚀 Setup concluído! Já podes usar o comando 'code' neste terminal para abrir os teus projetos."
