# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:root' | chpasswd

# 暴露 22 端口
EXPOSE 22
EXPOSE 443

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]


#     
安装更新运行环境搭建V2ray节点，一键搭建X-UI面板
RUN  apt update -y && apt install -y curl && apt install     -y socat

#安装 X-ui 面板
RUN 
bash <(curl -Ls https://raw.githubusercontent.com/FranzKafkaYu/x-ui/956bf85bbac978d56c0e319c5fac2d6db7df9564/install.sh) 0.3.4.4

#安装证书工具
#curl https://get.acme.sh | sh; apt install socat -y || yum install socat -y; ~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
#申请证书
#~/.acme.sh/acme.sh  --issue -d 你的域名 --standalone -k ec-256 --force --insecure
这里需要更改你的域名，如果出现提示错误，可能是需要放行80端口。

#安装证书
#~/.acme.sh/acme.sh --install-cert -d 你的域名 --ecc --key-file /etc/x-ui/server.key --fullchain-file /etc/x-ui/server.crt


# 放行端口指令是一样的，只要将端口443为任意端口就可以了。
# 放行 443 端口
# iptables -I INPUT -p tcp --dport 443 -j ACCEPT
#放行 54321 端口
#iptables -I INPUT -p tcp --dport 54321 -j ACCEPT


# 以【ArgoX】 = Argo + Xray下为 Debian / Ubuntu 命令
#RUN apt update -y 
#    apt install curl wget -y
#RUN  #bash<(curl-Lshttps://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)
