#!/bin/bash
# Installs and enables Fail2Ban on Ubuntu

echo "[+] Installing Fail2Ban..."
sudo apt update
sudo apt install fail2ban -y

echo "[+] Configuring Fail2Ban..."
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

echo "[+] Enabling and starting Fail2Ban service..."
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "[✓] Fail2Ban installed and running."
