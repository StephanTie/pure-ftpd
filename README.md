# Easy install of pure-ftpd with docker-compose
-----------------------------------------
fresh start of pure-ftpd docker on Linux 
-----------------------------------------
Prerequisites Starting point: Ensure versions are equal or higher for: Ubuntu 18.04.4 LTS  with ufw,git,ssh installed  docker version 18.09.7 docker-compose 1.29.2

**Step 1 - Precautions for automatic iptable changes by docker. **

When using docker first of all you do not want starting containers automatically opening ports and change the iptables. Also added standard dns.

edit daemon.json: sudo vi /etc/docker/daemon.json

{ "iptables" : false }

{ "dns": ["8.8.8.8", "8.8.8.4"] }

restart docker: sudo systemctl start docker

**** Step 2 - Starting pure-ftpd container with docker-compose ** ** This step creates docker network ${NETWORK) which is defined in .env ****

2.1.    cd /data  or other dir where you store your data
2.2.    git clone https://github.com/StephanTie/pure-ftpd.git
2.3.    cp .env.template .env
2.4.    Change in the file .env user and password and allowed ip adress from client
2.5.    sudo ./firststeponly.sh

**** step 3 check **
3.1    docker-compose ps  to see if container is running 
3.2    Check access with ftp client
