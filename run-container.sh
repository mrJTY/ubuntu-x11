# This is assuming you setup 5022(local) -> 5022(boot2docker) -> 22 (container)
# VBoxManage modifyvm "boot2docker-vm" --natpf1 "tcp-port$i,tcp,,$i,,$i"; where i is the port number
docker run -ti --rm -p 5022:22 ubuntu-x11:latest bash
