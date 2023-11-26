# 使用 Ubuntu 22.04 作为基础镜像
FROM ubuntu:22.04

# 安装 Shellinabox
RUN apt-get update && \
    apt-get install -y shellinabox && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 设置 root 用户的密码为 'root'
RUN echo 'root:root' | chpasswd

# 以下为 Debian / Ubuntu 命令搭建 Reality安装所需组件命令
REN apt update -y 
    apt install curl wget -y

# 安装 X-ui模板
EUN  bash<(curl-Lshttps://raw.githubusercontent.com/FranzKafkaYu/x-ui/master/install.sh)    
   apt-get clean && \


# 暴露 22 端口
EXPOSE 22
EXPOSE 443

# 启动 Shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
