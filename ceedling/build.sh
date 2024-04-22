# Recuerda que para poder compilar multiplataforma necesitas
# o bien crear tu propio builder que permita crear imágenes
# multiplataforma o bien habilitar "Use containerd for pulling
# and storing images" en Docker Desktop > Settings > General

docker buildx build \
--push \
--platform linux/arm64,linux/amd64 \
--tag daniel00/ceedling:latest .
