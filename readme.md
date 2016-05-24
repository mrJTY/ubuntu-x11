# Using X forwarding in ssh

# 1. INSIDE CONTAINER
## 1.1 Change /etc/ssh/sshd_config

```
X11Forwarding yes
```

## 1.2 Create a user WITH a home address

```
useradd -m user
passwd user
```

## 1.3 Run /usr/sbin/sshd daemon

# 2. In client / local machine:

## In client edit /etc/ssh_config

```
Host * X11Forwarding yes
```

## 2.1 Boot2Docker
boot2docker this becomes confusing with the vm
realMachinePort -> boot2docker-vmPort -> dockerContainer port
5022(just some random port) -> 5022 -> 22

In VirtualBox make sure:

```
local-machine 5022 -> boot2docker 5022
```


Then when running docker-run, make sure that the boot2docker port points to the ssh port of 22
```
docker run.... -p 5022:22
```

So you can now ssh

```
ssh -X userInContainer@localhost -p <55022, ie the local port>
```


## Running firefox

just type firefox in terminal



-----------------
# Using socat

http://kartoza.com/how-to-run-a-linux-gui-application-on-osx-using-docker/


## Install socat
brew install socat

## Config socat
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

##Check

## Run it like this
docker run --rm -e DISPLAY=192.168.0.3:0 \
    -i -t -v /Users/timlinux:/home/timlinux \
    kartoza/qgis-desktop qgis
