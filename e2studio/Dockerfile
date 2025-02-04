# Based on the `e2studio_docker_example` found on
# Renesas' RA Forum.

FROM ubuntu:22.04

# Used if you want to use inside k8s for CI
RUN apt-get update \
&& apt-get install -y --no-install-recommends dumb-init \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

ENV DEBIAN_FRONTEND=noninteractive

# Install e2 studio IDE dependencies
RUN dpkg --add-architecture i386 \
&& echo "deb http://security.ubuntu.com/ubuntu focal-security main universe" | tee /etc/apt/sources.list.d/docker.list \
&& apt-get update \
&& apt-get -y --no-install-recommends install libncurses5 libncurses5:i386 libpython2.7 libpython3.10 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update \
&& apt-get install -y --no-install-recommends wget tar xz-utils ca-certificates libgtk-3-0 make \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Install toolchain. Change this to required toolchain
RUN mkdir -p /opt/gccarm/ \
&& wget -O 'arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz' 'https://developer.arm.com/-/media/Files/downloads/gnu/12.3.rel1/binrel/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz?rev=dccb66bb394240a98b87f0f24e70e87d&hash=97EE9A221DB712D24F9FB455395AF0D487F61BFE' \
&& tar -xJf 'arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz' \
&& cp -r arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/ /opt/gccarm/ \
&& rm 'arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi.tar.xz'

# Copy e2 studio
COPY ./resources/e2studio/ /opt/e2studio
# Copy toolchain registration info. Modify this file as required
COPY ./resources/toolchainStore.xml /opt/e2studio/eclipse/configuration/com.renesas.cdt.core/toolchainStore.xml

ENV E2STUDIOC=/opt/e2studio/eclipse/e2studio

#docker run --rm -it -v <full-path to directory to be mounted>:/work/ e2studio --launcher.suppressErrors -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -data /work/.tmpwk -import /work/<project> -no-indexer -markerType cdt
ENTRYPOINT [ "/opt/e2studio/eclipse/e2studio", "--launcher.suppressErrors", "-nosplash", "-application", "org.eclipse.cdt.managedbuilder.core.headlessbuild" ]