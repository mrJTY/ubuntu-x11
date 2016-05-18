FROM ubuntu:trusty
COPY wickr-me_2.6.0_amd64.deb /
RUN apt-get -y install gdebi-core
RUN apt-get -y install firefox
RUN apt-get -y install ssh
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN apt-get -y install xterm 
EXPOSE 22

# Install wickr
#RUN apt-get -y install sqlcipher
#RUN gdebi /wickr-me_2.6.0_amd64.deb
#RUN apt-get -y -f install
