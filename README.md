dns geo restorations of specific various web services.

*🎗️ Hint : this service should be only available to a specefic geo or specefic ip addresses to prevent attacks and etc problem*

<br>
<br>

## Installation 

### Pull & run the pre build image
```bash

docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer rezdns:latest
```

### Build
```bash
# Build the docker image, so you could use the docker image and its context in the future easily
docker build . -t rezdns:latest
```

### Run
```bash
# Now run the mentioned docker in the previous step
docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer rezdns:latest
```

### Usage
```bash
# Changing the main DNS configuration file and add the public IP address of the container to the `resolve.conf` file.
echo "" > /etc/resolv.conf && echo "nameserver Public_IP_Of_Container" >> /etc/resolv.conf
```

### Verify 
```bash
# To be sure that everything works correctly, use the following command on your local system.
run curl api.myip.com on your local system
```
*It should return your public ip of container*

<br>

### Restart
If you saw your public IP address in previous step, it’s time to restart everything in order to make sure.
```bash
# To restart the container after changing the config files
./restart.sh
```
`restart.sh` is a bash script file that stops and starts the container in the background, actually if you add some new domains to `dnsmasq.custom` file you need to run the `restart.sh` too.

<br>

### IrAccess 
 I strongly recommend that this service be only available at specific Geo or IP addresses to prevent attacks and other problems.
 
to restrict the service to Iran ip address run the `iraccess.sh`. (Recommended for IR)

```bash
./iraccess.sh
```

<br>
