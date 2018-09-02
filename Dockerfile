FROM debian:9

ARG USER
ARG UID

RUN apt-get update
RUN apt-get -qqy install curl perl perl-modules build-essential
#RUN apt-get -qqy install libssl-dev zlib1g-dev

RUN mkdir $HOME/bin
RUN curl https://cpanmin.us > $HOME/bin/cpanm
RUN chmod +x $HOME/bin/cpanm

#RUN $HOME/bin/cpanm -vn IO::Socket::SSL
