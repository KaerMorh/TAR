# 基于Node.js的官方Docker镜像
FROM node:14-buster

# 设置工作目录到TAR下的项目文件夹
WORKDIR /usr/demo

# 安装NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash

# 环境变量，使nvm和npm命令在新的shell中可用
ENV NVM_DIR /root/.nvm
ENV PATH $NVM_DIR/versions/node/v20.10.0/bin:$PATH

# 安装Node.js v20.10.0
RUN . "$NVM_DIR/nvm.sh" && nvm install v20.10.0

# 安装PM2
RUN npm install pm2 -g

# 将项目文件复制到容器中
COPY . /usr/demo

# 安装项目依赖
RUN cd SillyTavern && npm install
RUN cd clewd && npm install

# 配置和启动脚本（根据需要调整）
COPY start.sh /usr/demo/start.sh
RUN chmod +x /usr/demo/start.sh

# 启动时运行脚本
CMD ["/usr/demo/start.sh"]
