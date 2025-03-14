#!/bin/bash
#背景：在dify安装过程中，需要修改配置nginx/conf.d/default.conf，其中api和web分别是dify的api-ip和web-ip，这两个ip地址在docker重启后每次分配都不一样，这给我们带来很多不便。参考：https://blog.csdn.net/u013563715/article/details/136764707
#解决思路：通过在/etc/hosts中配置api、web的dns解析地址，这样就不用频繁更改nginx的配置文件，重启nginx了；同时通过shell脚本自动维护api、web的dns解析地址，是一个有效途径。
#这是一个通过shell脚本自动维护dify的api、web的dns解析地址到/etc/hosts文件，脚本实现了systemclt管理，并且加入了systemd内置的定时器实现定时执行脚本

dir=`pwd`

chmod +x ${dir}/difyapi-dns.sh
ln -fs ${dir}/difyapi-dns.sh /usr/bin/difyapi-dns

#创建difyapi-dns.service服务
echo '[Unit]' > /etc/systemd/system/difyapi-dns.service
echo 'Description=Run a Custom Script at Startup' >> /etc/systemd/system/difyapi-dns.service
echo 'After=network.target' >> /etc/systemd/system/difyapi-dns.service
echo '' >> /etc/systemd/system/difyapi-dns.service
echo '[Service]' >> /etc/systemd/system/difyapi-dns.service
echo 'Type=simple' >> /etc/systemd/system/difyapi-dns.service
echo "ExecStart=/usr/bin/difyapi-dns" >> /etc/systemd/system/difyapi-dns.service
echo '' >> /etc/systemd/system/difyapi-dns.service
echo '[Install]' >> /etc/systemd/system/difyapi-dns.service
echo 'WantedBy=multi-user.target' >> /etc/systemd/system/difyapi-dns.service
chmod +x /etc/systemd/system/difyapi-dns.service
systemctl daemon-reload  &&  systemctl enable difyapi-dns.service
systemctl start difyapi-dns.service

#创建difyapi-dns.timer定时器
echo '[Unit]' > /etc/systemd/system/difyapi-dns.timer
echo 'Description=Run a Timer' >> /etc/systemd/system/difyapi-dns.timer
echo '' >> /etc/systemd/system/difyapi-dns.timer
echo '[Timer]' >> /etc/systemd/system/difyapi-dns.timer
echo 'OnUnitActiveSec=10s' >> /etc/systemd/system/difyapi-dns.timer
echo 'Unit=difyapi-dns.service' >> /etc/systemd/system/difyapi-dns.timer
echo '' >> /etc/systemd/system/difyapi-dns.timer
echo '[Install]' >> /etc/systemd/system/difyapi-dns.timer
echo 'WantedBy=timers.target' >> /etc/systemd/system/difyapi-dns.timer
chmod +x /etc/systemd/system/difyapi-dns.timer
systemctl daemon-reload  &&  systemctl enable difyapi-dns.timer
systemctl start difyapi-dns.timer
