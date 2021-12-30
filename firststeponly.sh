#!/bin/bash
# Install pureftpd automatically
# copy .env.template to .env and change .env
source .env
ufw allow from ${FTP_ALLOWED_IP} to any port ${FTP_PORT}
ufw allow from ${FTP_ALLOWED_IP} to any port 30000:30009 proto tcp
docker-compose up -d

sleep 10
mkdir -p ./data/${FTP_USER}/project{1,2}
chmod 777 ./data/${FTP_USER}/project{1,2}

docker exec -it pure-ftpd  /bin/bash -c "( echo ${FTP_USER_PASSWORD} ; echo ${FTP_USER_PASSWORD} ) | pure-pw useradd ${FTP_USER} -u ftpuser -d /home/${FTP_USER} -m"
docker exec -it pure-ftpd pure-pw mkdb
docker-compose ps
docker-compose logs
