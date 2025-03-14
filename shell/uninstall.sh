#!/bin/bash
#执行该脚本，你将卸载已安装的difyapi-dns

dir=`pwd`
echo "开始卸载difyapi-dns"
systemctl stop difyapi-dns.timer difyapi-dns.service
systemctl disable difyapi-dns.timer difyapi-dns.service
rm -rf /etc/systemd/system/difyapi-dns.*
rm -rf /usr/bin/difyapi-dns
systemctl daemon-reload
systemctl reset-failed   #移除失效的服务
echo "已卸载所有的difyapi-dns配置"
