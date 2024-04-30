FROM alpine:latest

# Instala dependencias para instalar aspell
RUN apk update && apk upgrade
RUN apk add --no-cache gcc g++ make perl

# Descarga aspell
RUN wget https://ftp.gnu.org/gnu/aspell/aspell-0.60.8.1.tar.gz -O aspell.tar.gz
RUN tar zxvf aspell.tar.gz
RUN rm aspell.tar.gz && mv aspell* aspell

# Compila e instala aspell
RUN (cd aspell && ./configure && make && make install)
RUN rm -rf aspell

# Descarga diccionarios de aspell
RUN wget https://ftp.gnu.org/gnu/aspell/dict/es/aspell6-es-1.11-2.tar.bz2 -O es.tar.bz2
RUN tar xvf es.tar.bz2
RUN rm es.tar.bz2 && mv aspell* es
RUN wget https://ftp.gnu.org/gnu/aspell/dict/en/aspell6-en-2020.12.07-0.tar.bz2 -O en.tar.bz2
RUN tar xvf en.tar.bz2
RUN rm en.tar.bz2 && mv aspell* en

# Instala diccionarios de aspell
RUN (cd es && ./configure && make && make install)
RUN (cd en && ./configure && make && make install)
RUN rm -rf es en

# Desinstala dependencias para instalar aspell
RUN apk del gcc g++ make perl

# Vuelve a instalar dependencia aspell
RUN apk add libstdc++
