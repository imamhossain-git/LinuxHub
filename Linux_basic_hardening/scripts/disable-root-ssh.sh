#!/bin/bash
# Disables SSH root login

SSH_CONFIG="/etc/ssh/sshd_config"

echo "[+] Disabling root login via SSH..."
sudo sed -i 's/^PermitRootLogin .*/PermitRootLogin no/' $SSH_CONFIG
sudo sed -i '/^#PermitRootLogin/c\PermitRootLogin no' $SSH_CONFIG

echo "[+] Restarting SSH service..."
sudo systemctl restart ssh

echo "[✓] Root SSH login disabled."
