FROM daniel00/e2studio:latest

# Evita que se detenga la instalación de paquetes por falta de interacción
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8

# Install Python3.12
RUN apt-get update \
&& apt-get install -y software-properties-common \
&& apt-get clean

RUN add-apt-repository ppa:deadsnakes/ppa \
&& apt-get update \
&& apt-get install -y python3.12 \
&& apt-get clean

# Install texlive & pandoc
RUN apt-get update \
&& apt-get install -y texlive pandoc \
&& apt-get install --no-install-recommends -y texlive-latex-extra texlive-fonts-recommended texlive-pictures texlive-plain-generic \
&& apt-get install -y texlive-lang-english texlive-lang-spanish \
&& apt-get clean

# Instala make
RUN apt-get update \
&& apt-get install -y make \
&& apt-get clean

# Ejemplo: docker run -it --rm e2studio-pandoc "python3.12 --version"
ENTRYPOINT ["/bin/bash", "-l", "-c"]
