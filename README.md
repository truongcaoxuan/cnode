## Install docker
```
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker `whoami`
```

## Build telegrambot images
```
sudo apt install -y golang-go
go get github.com/inCaller/prometheus_bot

git clone https://github.com/inCaller/prometheus_bot.git
cd prometheus_bot
docker build --force-rm -t vnpip/telegrambot .
```

## Install docker-compose
```
sudo apt install -y docker-compose
```

## Run docker compose up
```
docker-compose up -d
docker-compose --env-file .env.core up -d
docker-compose --env-file .env.relay up -d
```

### Other docker compose command
```
docker-compose down
docker rm -f $(docker ps -a -q)
docker volume rm $(docker volume ls -q)
```
