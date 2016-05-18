# How to run gui apps in osx

# Using X forwarding in ssh

## In host/docker linux

Change /etc/ssh/sshd_config

```
            X11Forwarding yes
```
### Create a user WITH a home address

```
useradd -m user
passwd user
```

### Run /usr/sbin/sshd daemon

## In client:
boot2docker this becomes confusing with the vm
realMachinePort -> vmPort -> dockerContainer port

```
ssh -X user@<host> -p <portOfBoot2Docker>
```

edit /etc/ssh_config

```
Host * X11Forwarding yes
```





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
