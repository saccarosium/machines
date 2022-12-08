#!/bin/sh

: "${EDITOR:=vi}"

nix_script_url="https://nixos.org/nix/install"
script="$HOME/.cache/install_nix.sh"

have() {
    if type "$1" >/dev/null 2>&1; then
        return 0
    else
        echo "$1 not found in PATH" >&2
        return 1
    fi
}

if have nix; then
    exit 0
fi


echo "==> Installing Nix"

# Delete files if already installed ones
sudo rm \
    /etc/zshrc.backup-before-nix \
    /etc/bash.bashrc.backup-before-nix \
    /etc/bashrc.backup-before-nix

if [ -e "$script" ]; then
    sh "$script" --daemon
else
    curl -L "$nix_script_url" -o "$script"
    sh "$script" --daemon
fi
