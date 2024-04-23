#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/cxblog.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../cxblog-web/dist/** ./nginx/html/dist


# copy jar
echo "begin copy cxblog-gateway "
cp ../cxblog-main/target/cxblog-main.jar ./cxblog/main/jar

