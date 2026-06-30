sudo apt update
sudo apt install redis-server -y

sudo systemctl start redis-server

redis-cli ping
