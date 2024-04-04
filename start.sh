#!/bin/bash

# 这里可以添加用于配置你的应用的命令
# 例如，生成配置文件，修改配置文件等

# 启动SillyTavern
cd /usr/demo/SillyTavern
pm2 start server.js --name "SillyTavern"

# 启动Clewd（根据需要）
cd /usr/demo/clewd
pm2 start clewd.js --name "Clewd"

# 保持容器运行
pm2 logs
