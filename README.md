## 👋 Welcome to icecast 🚀  

icecast README  
  
  
## Install my system scripts  

```shell
 sudo bash -c "$(curl -q -LSsf "https://github.com/systemmgr/installer/raw/main/install.sh")"
 sudo systemmgr --config && sudo systemmgr install scripts  
```
  
## Automatic install/update  
  
```shell
dockermgr update icecast
```
  
## Install and run container
  
```shell
dockerHome="/var/lib/srv/$USER/docker/casjaysdevdocker/icecast/icecast/latest/rootfs"
mkdir -p "/var/lib/srv/$USER/docker/icecast/rootfs"
git clone "https://github.com/dockermgr/icecast" "$HOME/.local/share/CasjaysDev/dockermgr/icecast"
cp -Rfva "$HOME/.local/share/CasjaysDev/dockermgr/icecast/rootfs/." "$dockerHome/"
docker run -d \
--restart always \
--privileged \
--name casjaysdevdocker-icecast-latest \
--hostname icecast \
-e TZ=${TIMEZONE:-America/New_York} \
-v "$dockerHome/data:/data:z" \
-v "$dockerHome/config:/config:z" \
-p 80:80 \
casjaysdevdocker/icecast:latest
```
  
## via docker-compose  
  
```yaml
version: "2"
services:
  ProjectName:
    image: casjaysdevdocker/icecast
    container_name: casjaysdevdocker-icecast
    environment:
      - TZ=America/New_York
      - HOSTNAME=icecast
    volumes:
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/icecast/icecast/latest/rootfs/data:/data:z"
      - "/var/lib/srv/$USER/docker/casjaysdevdocker/icecast/icecast/latest/rootfs/config:/config:z"
    ports:
      - 80:80
    restart: always
```
  
## Get source files  
  
```shell
dockermgr download src casjaysdevdocker/icecast
```
  
OR
  
```shell
git clone "https://github.com/casjaysdevdocker/icecast" "$HOME/Projects/github/casjaysdevdocker/icecast"
```
  
## Build container  
  
```shell
cd "$HOME/Projects/github/casjaysdevdocker/icecast"
buildx 
```
  
## Authors  
  
🤖 casjay: [Github](https://github.com/casjay) 🤖  
⛵ casjaysdevdocker: [Github](https://github.com/casjaysdevdocker) [Docker](https://hub.docker.com/u/casjaysdevdocker) ⛵  
