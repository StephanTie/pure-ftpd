## Easy install of hardened pure-ftpd with docker-compose
-----------------------------------------
fresh start of pure-ftpd docker on Linux 
-----------------------------------------
Prerequisites Starting point: 
Ensure versions are equal or higher for: 
- Ubuntu 18.04.4 LTS  with ufw,git,ssh installed  
- docker version 18.09.7 
- docker-compose 1.29.2

## Step 1 - Precautions for automatic iptable changes by docker.

When using docker first of all you do not want starting containers automatically opening ports and change the iptables. Also added standard dns.

edit daemon.json: 
```sh
sudo vi /etc/docker/daemon.json
```
```sh
{ "iptables" : false }

{ "dns": ["8.8.8.8", "8.8.8.4"] }
```
restart docker: 
```sh
sudo systemctl start docker
```
## Step 2 - Starting pure-ftpd container with docker-compose

2.1.    goto /data  or other dir where you store your data and clone repository
```sh
cd /data
git clone https://github.com/StephanTie/pure-ftpd.git
```
2.2 copy template env and cd to pure-ftpd
```sh
cd pure-ftpd
cp .env.template .env
```
2.3. Change in the file .env user and password and allowed ip adress from your client pc
```sh
vi .env
```
```sh
FTP_USER=scriptcase
FTP_ALLOWED_IP=123.456.789.012
```
2.4. Startup
```sh
sudo ./firststeponly.sh
```
## Step 3 check  
3. See if container is running and check the logs
```sh
docker-compose ps
docker-compose logs
```
3.2    Check access with a ftp-client (My favorite is filezilla)
