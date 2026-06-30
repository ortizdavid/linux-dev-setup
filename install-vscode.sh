#!/bin/bash
echo "🔧 Configurando VS Code sem Sandbox no Kubuntu..."

# Modifica o atalho gráfico do menu iniciar
mkdir -p ~/.local/share/applications
if [ -f /usr/share/applications/code.desktop ]; then
    cp /usr/share/applications/code.desktop ~/.local/share/applications/
    sed -i 's/Exec=\/usr\/share\/code\/code/Exec=\/usr\/share\/code\/code --no-sandbox/g' ~/.local/share/applications/code.desktop
    chmod +x ~/.local/share/applications/code.desktop
    echo "✅ Atalho gráfico atualizado!"
else
    echo "⚠️ VS Code .deb não encontrado em /usr/share/applications/. Instala o VS Code primeiro."
fi

# Cria o alias para o terminal (evita duplicar linhas se correr o script duas vezes)
if ! grep -q "alias code=" ~/.bashrc; then
    echo "alias code='code --no-sandbox'" >> ~/.bashrc
    echo "✅ Alias 'code' adicionado ao ~/.bashrc!"
fi

# Atualiza a sessão atual do terminal
source ~/.bashrc
