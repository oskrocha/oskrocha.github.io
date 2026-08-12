#!/usr/bin/env bash
set -euo pipefail

DOCKER_UID="${DOCKER_UID:-501}"
DOCKER_GID="${DOCKER_GID:-20}"

if [ "$(id -u)" = "0" ]; then
  getent group "$DOCKER_GID" >/dev/null || groupadd -g "$DOCKER_GID" appgroup
  getent passwd "$DOCKER_UID" >/dev/null || useradd -o -u "$DOCKER_UID" -g "$DOCKER_GID" -d /tmp -s /bin/bash appuser
  [ -S "${SSH_AUTH_SOCK:-}" ] && chmod 666 "$SSH_AUTH_SOCK" 2>/dev/null || true
  exec runuser -p -u "$(getent passwd "$DOCKER_UID" | cut -d: -f1)" -- bash -c 'bundle install --quiet && exec bundle exec "$@"' bash "$@"
fi

bundle install --quiet
exec bundle exec "$@"
