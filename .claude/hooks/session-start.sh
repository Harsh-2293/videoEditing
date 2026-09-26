#!/bin/bash
# Provisions the HyperFrames toolchain in Claude Code on the web sessions:
# FFmpeg/ffprobe, the pinned npm packages, and HyperFrames' pinned Chrome.
set -euo pipefail

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

if ! command -v ffmpeg >/dev/null 2>&1 || ! command -v ffprobe >/dev/null 2>&1; then
  SUDO=""
  [ "$(id -u)" -ne 0 ] && SUDO="sudo"
  export DEBIAN_FRONTEND=noninteractive
  if ! $SUDO apt-get install -y -qq ffmpeg >/dev/null 2>&1; then
    # Some image PPAs are blocked by the egress proxy; the Ubuntu archive is enough.
    $SUDO apt-get update -qq >/dev/null 2>&1 || true
    $SUDO apt-get install -y -qq ffmpeg >/dev/null
  fi
fi

# npm install (not ci) so the cached container's node_modules is reused.
npm install --no-audit --no-fund --loglevel=error

# Downloads the Chrome Headless Shell build HyperFrames pins; no-op when cached.
npx --no-install hyperframes browser ensure >/dev/null

[ -f .env ] || cp .env.example .env
