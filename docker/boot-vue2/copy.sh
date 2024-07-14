#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../../cxblog-server-boot/sql/cxblog.sql ./cxblog/db

# copy html
echo "begin copy html "
cp -r ../../cxblog-admin-vue2/admin/** ./cxblog/html/admin
cp -r ../../cxblog-web-vue2/web/** ./cxblog/html/web
cp -r ../../cxblog-uniapp-vue2/unpackage/dist/** ./cxblog/html/h5
cp -r ../../cxblog-doc/doc/** ./cxblog/html/doc


# copy jar
echo "begin copy cxblog-server "
cp ../../cxblog-server/cxblog-main/target/server.jar ./cxblog/server/jar
