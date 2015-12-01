FROM jackscott/licode-docker:latest

MAINTAINER JackScott <chuangxiang@sina.cn>

# install vim,git
#RUN apt-get update
RUN apt-get install -y vim
RUN apt-get install -y build-essential
RUN apt-get install -y git

# move all configuration files into container
ADD files/* /usr/local/  

RUN cp /usr/local/90forceyes /etc/apt/apt.conf.d/

#clone licode from github
#RUN git clone https://github.com/ging/licode.git && \ 
#./licode/scripts/installUbuntuDeps.sh && \
#./licode/scripts/installErizo.sh && \
#./licode/scripts/installNuve.sh

RUN chmod +x /usr/local/install_licode.sh
RUN /usr/local/install_licode.sh

#install Basic example
RUN ./licode/scripts/installBasicExample.sh

#start licode
RUN ./licode/scripts/initLicode.sh && \
./licode/scripts/initBasicExample.sh


EXPOSE 3000

ENTRYPOINT /usr/sbin/sshd -D

#install hadoop 2.30
#RUN ln -s /usr/local/hadoop-2.3.0 /usr/local/hadoop && \
#mv /usr/local/bashrc ~/.bashrc && \
#mv /usr/local/hadoop-env.sh /usr/local/hadoop/etc/hadoop/hadoop-env.sh 
