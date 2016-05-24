FROM ubuntu:trusty
COPY wickr-me_2.6.0_amd64.deb /
RUN apt-get -y install gdebi-core
RUN apt-get -y install firefox
RUN apt-get -y install ssh
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN apt-get -y install xterm
EXPOSE 22

# Add a user
RUN useradd -m user
# MAKE SURE YOU CREATE A PASSWORD FOR THIS, passwd user

# For sshd
RUN mkdir /var/run/sshd
# Enable password ssh
# RUN echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

CMD ["/usr/sbin/sshd"]



# Install wickr
#RUN apt-get -y install sqlcipher
#RUN gdebi /wickr-me_2.6.0_amd64.deb
#RUN apt-get -y -f install
