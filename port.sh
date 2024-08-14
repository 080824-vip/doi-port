#!/bin/bash

# Cài đặt Fail2Ban
sudo apt-get update && sudo apt-get install fail2ban -y

# Khởi động và kích hoạt Fail2Ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# Thay đổi cổng SSH
sudo sed -i 's/#Port 22/Port 3712/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Chỉnh thời gian server GMT +7
sudo timedatectl set-timezone Asia/Ho_Chi_Minh

# Tự x2 swap centos
curl -s https://raw.githubusercontent.com/Git290324/swap/main/x2swap.sh | bash

# Tự khởi động lại lúc 3h sáng
(crontab -l ; echo "0 3 * * * /sbin/shutdown -r now") | crontab -
