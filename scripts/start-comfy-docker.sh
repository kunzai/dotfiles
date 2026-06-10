#!/usr/bin/env bash
set -Eeuo pipefail

CONTAINER_NAME="comfyui-rocm"
#IMAGE="yanwk/comfyui-boot:rocm"
IMAGE="ignatberesnev/comfyui-gfx1151:v0.2"
BASE_DIR="${BASE_DIR:-$HOME/comfyui-docker}"
PORT="${PORT:-8188}"
HSA_GFX="${HSA_GFX:-11.0.0}"
CLI_ARGS="${CLI_ARGS:---use-pytorch-cross-attention}"

mkdir -p \
  "$BASE_DIR/ComfyUI" \
  "$BASE_DIR/storage-cache/dot-cache" \
  "$BASE_DIR/storage-cache/dot-config" \
  "$BASE_DIR/storage-nodes/dot-local" \
  "$BASE_DIR/storage-nodes/custom_nodes" \
  "$BASE_DIR/storage-models/models" \
  "$BASE_DIR/storage-models/hf-hub" \
  "$BASE_DIR/storage-models/torch-hub" \
  "$BASE_DIR/storage-user/input" \
  "$BASE_DIR/storage-user/output" \
  "$BASE_DIR/storage-user/user-profile" \
  "$BASE_DIR/storage-user/user-scripts"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker is not installed or not in PATH." >&2
  exit 1
fi

if ! docker info >/dev/null 2>&1; then
  echo "Docker daemon is not reachable for the current user." >&2
  echo "Try: sudo usermod -aG docker \"$USER\" && newgrp docker" >&2
  exit 1
fi

docker rm -f "$CONTAINER_NAME" >/dev/null 2>&1 || true

docker pull "$IMAGE"

docker run -d \
  --name "$CONTAINER_NAME" \
  --device=/dev/kfd \
  --device=/dev/dri \
  --group-add "$(getent group video | cut -d: -f3)" \
  --group-add "$(getent group render | cut -d: -f3)" \
  --ipc=host \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --security-opt label=disable \
  -p "$PORT:8188" \
  -v "$BASE_DIR/storage-cache/dot-cache:/root/.cache" \
  -v "$BASE_DIR/storage-cache/dot-config:/root/.config" \
  -v "$BASE_DIR/storage-nodes/dot-local:/root/.local" \
  -v "$BASE_DIR/storage-nodes/custom_nodes:/root/ComfyUI/custom_nodes" \
  -v "$BASE_DIR/storage-models/models:/root/ComfyUI/models" \
  -v "$BASE_DIR/storage-models/hf-hub:/root/.cache/huggingface/hub" \
  -v "$BASE_DIR/storage-models/torch-hub:/root/.cache/torch/hub" \
  -v "$BASE_DIR/storage-user/input:/root/ComfyUI/input" \
  -v "$BASE_DIR/storage-user/output:/root/ComfyUI/output" \
  -v "$BASE_DIR/storage-user/user-profile:/root/ComfyUI/user" \
  -v "$BASE_DIR/storage-user/user-scripts:/root/user-scripts" \
  -v "$BASE_DIR/ComfyUI:/opt/ComfyUI" \
  -e HSA_OVERRIDE_GFX_VERSION="$HSA_GFX" \
  -e CLI_ARGS="$CLI_ARGS" \
  -e PYTORCH_TUNABLEOP_ENABLED=1 \
  "$IMAGE"

echo
echo "ComfyUI container started."
echo "URL: http://127.0.0.1:$PORT"
echo "Models: $BASE_DIR/storage-models/models"
echo "Input:  $BASE_DIR/storage-user/input"
echo "Output: $BASE_DIR/storage-user/output"
echo
echo "Useful commands:"
echo "  docker logs -f $CONTAINER_NAME"
echo "  docker stop $CONTAINER_NAME"
echo "  docker start $CONTAINER_NAME"
echo "  docker rm -f $CONTAINER_NAME"
