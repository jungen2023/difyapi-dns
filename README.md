# difyapi-dns

#### 介绍
这是一个通过shell脚本自动维护dify的api、web的dns解析地址到/etc/hosts文件，脚本实现了systemclt管理，并且加入了systemd内置的定时器实现定时执行脚本

#### 软件架构
软件架构说明


#### 安装教程

1.  cd shell/
2.  ./install.sh     #安装
3.  ./uninstall.sh   #卸载

#### 使用说明

systemctl daemon-reload #每次修改配置后请执行
systemctl enable|disable|is-enabled difyapi-dns.service #启动|停止|查看服务开机自启动
systemctl start|stop|status difyapi-dns.service #启动|停止|查看服务
systemctl enable|disable|is-enabled difyapi-dns.timer #启动|停止|查看定时器开机自启动
systemctl start|stop|status difyapi-dns.timer #启动|停止|查看定时器

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request


#### 特技

1.  使用 Readme\_XXX.md 来支持不同的语言，例如 Readme\_en.md, Readme\_zh.md
2.  Gitee 官方博客 [blog.gitee.com](https://blog.gitee.com)
3.  你可以 [https://gitee.com/explore](https://gitee.com/explore) 这个地址来了解 Gitee 上的优秀开源项目
4.  [GVP](https://gitee.com/gvp) 全称是 Gitee 最有价值开源项目，是综合评定出的优秀开源项目
5.  Gitee 官方提供的使用手册 [https://gitee.com/help](https://gitee.com/help)
6.  Gitee 封面人物是一档用来展示 Gitee 会员风采的栏目 [https://gitee.com/gitee-stars/](https://gitee.com/gitee-stars/)
