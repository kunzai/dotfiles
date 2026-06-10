#!/usr/bin/env bash
set -euo pipefail

APP_DIR="$HOME/comfyui-docker"
DATA_DIR="$APP_DIR/data"
IMAGE="yanwk/comfyui-boot:rocm"
CONTAINER="comfyui-rocm"

echo "==> Prüfe Docker"
if ! command -v docker >/dev/null 2>&1; then
  echo "==> Installiere Docker"
  sudo pacman -S --needed docker
fi

echo "==> Aktiviere Docker-Dienst"
sudo systemctl enable --now docker

echo "==> Füge aktuellen User zu render/video hinzu"
sudo usermod -aG render,video,docker "$USER" || true

echo "==> Lege Ordnerstruktur an"
mkdir -p "$DATA_DIR"/{models,output,input,custom_nodes,user}

echo "==> Prüfe ROCm Host-Zugriff"
if ! command -v rocminfo >/dev/null 2>&1; then
  echo "WARNUNG: rocminfo ist nicht installiert. Installiere ggf. ROCm auf dem Host." >&2
else
  rocminfo | grep gfx || true
fi

echo "==> Stoppe alten Container, falls vorhanden"
docker rm -f "$CONTAINER" 2>/dev/null || true

echo "==> Ziehe Image"
docker pull "$IMAGE"

echo "==> Starte ComfyUI Container"
docker run -d \
  --name "$CONTAINER" \
  --device=/dev/kfd:/dev/kfd \
  --device=/dev/dri:/dev/dri \
  --group-add=video \
  --ipc=host \
  --cap-add=SYS_PTRACE \
  --security-opt seccomp=unconfined \
  --security-opt label=disable \
  -p 8188:8188 \
  -v "$DATA_DIR/models:/workspace/ComfyUI/models" \
  -v "$DATA_DIR/output:/workspace/ComfyUI/output" \
  -v "$DATA_DIR/input:/workspace/ComfyUI/input" \
  -v "$DATA_DIR/custom_nodes:/workspace/ComfyUI/custom_nodes" \
  -v "$DATA_DIR/user:/workspace/ComfyUI/user" \
  -e HSA_OVERRIDE_GFX_VERSION=11.0.0 \
  -e CLI_ARGS="--use-pytorch-cross-attention" \
  "$IMAGE"

echo
echo "==> Container läuft. Logs:"
docker logs -n 80 "$CONTAINER" || true
echo
echo "==> ComfyUI sollte gleich erreichbar sein unter:"
echo "http://127.0.0.1:8188"
echo
echo "==> Nützliche Befehle:"
echo "docker logs -f $CONTAINER"
echo "docker stop $CONTAINER"
echo "docker start $CONTAINER"
echo "docker rm -f $CONTAINER"
