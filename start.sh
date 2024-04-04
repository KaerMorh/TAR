

#!/bin/bash

# 定义配置和启动SillyTavern的函数
function start_silly_tavern {
    cd /usr/demo/TAR/SillyTavern

    # 检查配置文件是否存在
    if [ ! -f config.yaml ]; then
        # 启动应用以生成配置文件
        node server.js &

        # 等待配置文件生成
        sleep 10

        # 杀死后台运行的应用
        pkill -f node

        # 修改配置文件的命令
        # 示例：sed -i 's/original_text/replacement_text/g' config.yaml
    fi

    # 用PM2启动SillyTavern，确保配置已应用
    pm2 start server.js --name "SillyTavern"
}

# 定义配置和启动clewd的函数
function start_clewd {
    cd /usr/demo/TAR/clewd

    # 检查配置文件是否存在
    if [ ! -f config.js ]; then
        # 启动应用以生成配置文件
        node clewd.js &

        # 等待配置文件生成
        sleep 10

        # 杀死后台运行的应用
        pkill -f node

        # 修改配置文件的命令
        # 示例：sed -i 's/original_text/replacement_text/g' config.js
    fi

    # 用PM2启动clewd，确保配置已应用
    pm2 start clewd.js --name "Clewd"
}

# 启动SillyTavern
start_silly_tavern

# 启动clewd
start_clewd

# 保持容器运行，观察日志
pm2 logs
