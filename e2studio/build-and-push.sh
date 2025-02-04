#!/bin/bash

docker buildx build \
--push \
--platform linux/amd64 \
--tag daniel00/e2studio:latest .