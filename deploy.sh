#!/bin/bash

# 指定SENS的根目录，请按实际修改
SENS_DIR="/www/wwwroot/ChuyunBlog"
# 拉取最新的源码
git pull
echo "代码拉取完毕！"

# 进入SENS根目录
cd $SENS_DIR

# 停止SENS
sh $SENS_DIR/bin/sens.sh stop

# 执行打包
mvn clean package -Dmaven.test.skip=true
echo "编译打包完毕！"

# 进入打包好的target目录
cd $SENS_DIR/target

# 运行项目
sh $SENS_DIR/bin/sens.sh start

echo "部署完毕，Enjoy！"