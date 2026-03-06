#!/bin/bash
set -eu

USER_ID=${HOST_UID:-1000}
GROUP_ID=${HOST_GID:-1000}
USER=${DEFAULT_USERNAME:-copilot}
HOME=${DEFAULT_HOME_DIR:-/home/$USER}

# Create group if it doesn't exist
getent group "$GROUP_ID" > /dev/null 2>&1 || groupadd -g "$GROUP_ID" "$USER" > /dev/null 2>&1

# Create user if it doesn't exist
getent passwd "$USER_ID" > /dev/null 2>&1 || useradd -m -d "$HOME" -u "$USER_ID" -g "$GROUP_ID" -s /bin/bash "$USER" > /dev/null 2>&1

# Ensure configuration directories exist and are owned by the user
# This is important for persisting sessions via docker volumes
mkdir -p "$HOME/.config/github-copilot" "$HOME/.copilot"

# Populate the user's .copilot configuration with defaults if not present
if [ -d "/etc/copilot" ]; then
    cp -rn /etc/copilot/. "$HOME/.copilot/" 2>/dev/null || true
fi

chown -R "$USER_ID:$GROUP_ID" "$HOME/.config" "$HOME/.copilot"

# Grant the user access to the mapped Docker socket if it exists
if [ -S /var/run/docker.sock ]; then
    chmod 666 /var/run/docker.sock 2>/dev/null || true
fi

# Drop root privileges and execute the command as the mapped host user
exec gosu "${USER_ID}:${GROUP_ID}" "$@"
