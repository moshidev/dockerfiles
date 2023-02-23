FROM ubuntu:jammy

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y build-essential procps curl file git
RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
RUN eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"

RUN brew update && brew upgrade
RUN apt-get install -y vim
RUN brew install gcc
RUN brew install gdb
RUN brew install make
RUN brew install zip

RUN brew install ruby@2.7
ENV PATH="/home/linuxbrew/.linuxbrew/opt/ruby@2.7/bin:$PATH"
ENV PATH="/home/linuxbrew/.linuxbrew/lib/ruby/gems/2.7.0/bin:$PATH"
ENV LDFLAGS="-L/home/linuxbrew/.linuxbrew/opt/ruby@2.7/lib"
ENV CPPFLAGS="-I/home/linuxbrew/.linuxbrew/opt/ruby@2.7/include"

RUN gem install ceedling
ENV LANGUAGE=C.utf8
ENV LC_ALL=C.utf8
ENV LANG=C.utf8
RUN ln -s /home/linuxbrew/.linuxbrew/bin/gcc-12 /home/linuxbrew/.linuxbrew/bin/gcc
