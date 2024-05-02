#!/bin/sh
# Recuerda que para poder compilar multiplataforma necesitas
# o bien crear tu propio builder que permita crear imágenes
# multiplataforma o bien habilitar "Use containerd for pulling
# and storing images" en Docker Desktop > Settings > General

compile_arch() {
    C=tmp_aspellbuilder_$1
    docker buildx build \
    --platform linux/$1 \
    --tag aspellbuilder_$1 step1

    docker create --name $C aspellbuilder_$1
    rm -rf ./step2/$1
    mkdir -p ./step2/$1
    mkdir -p ./step2/$1/local
    mkdir -p ./step2/$1/lib
    docker cp $C:/usr/local/bin/aspell ./step2/$1/aspell
    docker cp $C:/usr/local/lib ./step2/$1/local/lib
    docker cp $C:/usr/lib/libstdc++.so.6.0.32 ./step2/$1/lib/libstdc++.so.6.0.32
    docker cp $C:/usr/lib/libgcc_s.so.1 ./step2/$1/lib/libgcc_s.so.1
    docker rm $C
}

compile_arch arm64
compile_arch amd64

docker buildx build \
--no-cache \
--platform linux/arm64,linux/amd64 \
--tag daniel00/aspell:latest \
--push step2
