# Easy install of pure-ftpd with docker-compose
-----------------------------------------
fresh start of docker pureftpd:
-----------------------------------------

1.    cd /data  or other dir where you store your data
2.    git clone https://github.com/StephanTie/pure-ftpd.git
3.    cp .env.template .env
4.    Change in the file .env user and password and allowed ip adress from client
5.    sudo ./firststeponly.sh
6.    Check with ftp client
