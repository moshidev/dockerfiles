FROM alpine:latest

ARG TARGETARCH

COPY ./${TARGETARCH}/aspell /usr/local/bin/aspell
COPY ./${TARGETARCH}/local/lib /usr/local/lib
COPY ./${TARGETARCH}/lib/libstdc++.so.6.0.32 /usr/lib/libstdc++.so.6.0.32
RUN ln /usr/lib/libstdc++.so.6.0.32 /usr/lib/libstdc++.so.6
COPY ./${TARGETARCH}/lib/libgcc_s.so.1 /usr/lib/libgcc_s.so.1
