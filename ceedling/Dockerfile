FROM ubuntu:jammy

ENV DEBIAN_FRONTEND=noninteractive

# Instala paquetes de desarrollo
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y build-essential procps curl file git gdb vim zip

# Instala rvm
RUN apt-get install -y rbenv

# Instala Ruby 2.7.1 (Depende en OpenSSL 1.1.1g)
# https://deanpcmad.com/2022/installing-older-ruby-versions-on-ubuntu-22-04/
RUN curl https://www.openssl.org/source/openssl-1.1.1g.tar.gz --output openssl-1.1.1g.tar.gz
RUN tar zxvf openssl-1.1.1g.tar.gz
RUN cd openssl-1.1.1g && ./config --prefix=$HOME/.openssl/openssl-1.1.1g --openssldir=$HOME/.openssl/openssl-1.1.1g
RUN make -C openssl-1.1.1g
RUN make -C openssl-1.1.1g install
RUN rm -rf ~/.openssl/openssl-1.1.1g/certs
RUN ln -s /etc/ssl/certs ~/.openssl/openssl-1.1.1g/certs

RUN RUBY_CONFIGURE_OPTS=--with-openssl-dir=$HOME/.openssl/openssl-1.1.1g rbenv install --verbose 2.7.1
RUN rbenv global 2.7.1

# Instala Ceedling
RUN gem install ceedling
ENV LANGUAGE=C.utf8
ENV LC_ALL=C.utf8
ENV LANG=C.utf8

# Instala Python 3.12
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.12
