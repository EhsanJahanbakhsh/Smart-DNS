# maj0rdns
A **Smart DNS** for bypassing geo restorations of specific various web services.

*🎗️ Hint : this service should be only available to a specefic geo or specefic ip addresses to prevent attacks and etc problem*

<br>
<br>

## Installation 

### Pull & run the pre build image
```bash
# pull the image and run it
docker pull maj0rmil4d/maj0rdns
docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer maj0rmil4d/maj0rdns
```

### Build
```bash
# Build the docker image, so you could use the docker image and its context in the future easily
docker build . -t maj0rdns:latest
```

### Run
```bash
# Now run the mentioned docker in the previous step
docker run -d -it --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer maj0rdns:latest
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


### Cluster Mode ( docker swarm - single node ) 
You can also increase reliability and connectivity, with help of **Cluster Mode**. To have a cluster, do the following steps:

**1. Initialize swarm mode**
```bash
docker swarm init
```


**2. Create docker swarm service**
```bash
docker service create --cap-add=NET_ADMIN -p 53:53/udp -p 443:443 -p 80:80 -e IP=PublicIpOfContainer --name maj0rdnscontainer maj0rdns:latest
```

**3. Scale the service to 5 instances**
```bash
docker service scale maj0rdnscontainer=5
```

**4. Verify the cluster**

It’s necessary to verify that the previous steps are working correctly and that all of them are running.
```bash
docker service ls

docker service ps maj0rdnscontainer
```

![image](https://user-images.githubusercontent.com/46486478/187826199-498a76f1-1526-4b3d-a70a-ccc3eff80bf3.png)


**5. Verify the service**

![image](https://user-images.githubusercontent.com/46486478/187826236-ddf2e475-bb4d-459a-8dc3-4f8be36f6685.png)

