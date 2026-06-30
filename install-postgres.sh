sudo apt update
sudo apt install postgresql postgresql-contrib -y
sudo systemctl start postgresql

# Entrar no terminal do Postgres
sudo -u postgres psql

ALTER USER postgres WITH PASSWORD '003334743LA032';
CREATE DATABASE gestao_patrimonio;
CREATE DATABASE gestao_patrimonio_historico;
\q
