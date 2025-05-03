# 🛡️ Ubuntu Basic Hardening Guide

A beginner-friendly guide to hardening an Ubuntu server to enhance its security and reduce vulnerabilities.

---

## 🔧 Features Covered

- System updates
- User and password policy
- SSH security enhancements
- UFW firewall configuration
- Fail2Ban setup
- Secure file permissions
- Log monitoring

---

## 📋 Hardening Steps

### 1. 🔄 Update the System
Keep the system and packages up-to-date.
```bash
sudo apt update && sudo apt upgrade -y
```
### 2. 👤 Create a New Admin User

Avoid using the root account for daily tasks.
```bash
sudo adduser secureuser
sudo usermod -aG sudo secureuser
```

### 3. 🚫 Disable Root SSH Login

Prevent root from logging in via SSH.
```bash
sudo nano /etc/ssh/sshd_config
```
Change or add:
```bash
PermitRootLogin no
```
Restart SSH:
```bash
sudo systemctl restart ssh
```

### 4. 🔑 Set Up SSH Key Authentication

On your local machine:
```bash
ssh-keygen
ssh-copy-id secureuser@your_server_ip
```
Optionally disable password authentication:
```bash
sudo nano /etc/ssh/sshd_config
# Set:
PasswordAuthentication no
```
Then restart:
```bash
sudo systemctl restart ssh
```
### 5. 🔥 Configure the UFW Firewall

Enable and allow only necessary ports:
```bash
sudo ufw allow OpenSSH
sudo ufw enable
sudo ufw status
```
### 6. 🛡️ Install and Configure Fail2Ban

Protect against brute-force attacks.
```bash
sudo apt install fail2ban -y
```
Create a local config:
```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
```
Start and enable:
```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```
### 7. 🔒 Set Secure File Permissions

Ensure your SSH directory and key files are properly protected:
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```
### 8. 🧾 Monitor System Logs

Log files to keep an eye on:
```bash
/var/log/auth.log
/var/log/syslog
/var/log/fail2ban.log
```
### 📁 Optional Structure
```bash
ubuntu-hardening/
├── README.md
├── scripts/
│   ├── setup-ufw.sh
│   ├── install-fail2ban.sh
│   └── disable-root-ssh.sh
└── LICENSE
```
### 📝 How to Use These Scripts

1. Make them executable:
```bash
chmod +x scripts/*.sh
```
2. Run them as a sudo-enabled user:
```bash
sudo ./scripts/setup-ufw.sh
sudo ./scripts/install-fail2ban.sh
sudo ./scripts/disable-root-ssh.sh

```
