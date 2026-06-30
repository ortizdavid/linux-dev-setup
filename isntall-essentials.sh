# 1. Atualizar as listas do gerenciador de pacotes
sudo apt update

# 2. Instalar ferramentas de visualização e monitoramento essenciais
sudo apt install -y tree htop git curl wget

# 3. Instalar os "substitutos modernos" (Ferramentas que todo desenvolvedor usa hoje)
sudo apt install -y ncdu tldr fzf jq

# 3. Instalar o ecossistema essencial para compilação (C/C++, Make)
sudo apt install -y build-essential gcc g++ make

# 4. Instalar bibliotecas de cabeçalho comuns e ferramentas de extração
sudo apt install -y libssl-dev zlib1g-dev pkg-config unzip tar
