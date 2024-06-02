#!/usr/bin/env bash
set -e

GIT_TAG="latest"
IMAGE_DESC="Image inpainting tool powered by SOTA AI Model" 
GIT_REPO="https://github.com/binhetech/IOPaint"

echo "Building NVIDIA GPU docker image..."

docker build -t binhetech/iopaint:gpu-$GIT_TAG ./
