FROM ubuntu:jammy

# Evita que se detenga la instalación de paquetes por falta de interacción
ENV DEBIAN_FRONTEND=noninteractive

# Actualiza el sistema
RUN apt-get update && apt-get upgrade -y

# Instala pandoc
RUN apt-get install -y pandoc

# Instala texlive
RUN apt-get --no-install-recommends install -y texlive-latex-extra
RUN apt-get --no-install-recommends install -y texlive-fonts-recommended
RUN apt-get --no-install-recommends install -y texlive-pictures
RUN apt-get --no-install-recommends install -y texlive-plain-generic

# Instala los idiomas de texlive inglés y español
RUN apt-get install -y texlive-lang-english texlive-lang-spanish

# Instala Python 3.12
RUN apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.12
