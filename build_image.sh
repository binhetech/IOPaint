#!/usr/bin/env bash
set -e

GIT_TAG="latest"
IMAGE_DESC="Image inpainting tool powered by SOTA AI Model" 
GIT_REPO="https://github.com/binhetech/IOPaint"

echo "Building NVIDIA GPU docker image..."

docker buildx build \
--platform linux/amd64 \
--file ./docker/GPUDockerfile \
--label org.opencontainers.image.title=iopaint \
--label org.opencontainers.image.description="$IMAGE_DESC" \
--label org.opencontainers.image.url=$GIT_REPO \
--label org.opencontainers.image.source=$GIT_REPO \
--label org.opencontainers.image.version=$GIT_TAG \
--build-arg version=$GIT_TAG \
--tag binhetech/iopaint:gpu-$GIT_TAG .
