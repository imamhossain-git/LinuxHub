#!/bin/bash
# Enables UFW and allows only SSH

echo "[+] Enabling UFW and allowing OpenSSH..."
sudo ufw allow OpenSSH
sudo ufw --force enable
sudo ufw status verbose
echo "[✓] UFW setup complete."
