#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../../cxblog-server-cloud/sql/cxblog-cloud.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-quartz.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-nacos.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-seata.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-file.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-blog.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-msg.sql ./cxblog/db
cp ../../cxblog-server-cloud/sql/cxblog-payment.sql ./cxblog/db

# copy html
echo "begin copy html "
cp -r ../../cxblog-admin-vue3/admin/** ./cxblog/html/admin
cp -r ../../cxblog-web-vue3/web/** ./cxblog/html/web
cp -r ../../cxblog-uiapp-vue3/unpackage/dist/** ./cxblog/html/h5
cp -r ../../cxblog-doc/doc/** ./cxblog/html/doc


# copy jar
echo "begin copy cxblog-gateway "
cp ../../cxblog-server-cloud/cxblog-server/target/cxblog-server.jar ./cxblog/server/jar

echo "begin copy cxblog-auth "
cp ../../cxblog-server-cloud/cxblog-auth/target/cxblog-auth.jar ./cxblog/auth/jar

echo "begin copy cxblog-visual "
cp ../../cxblog-server-cloud/cxblog-visual/cxblog-monitor/target/cxblog-visual-monitor.jar  ./cxblog/visual/monitor/jar

echo "begin copy cxblog-modules-system "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-system/target/cxblog-modules-system.jar ./cxblog/modules/system/jar

echo "begin copy cxblog-modules-file "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-file/target/cxblog-modules-file.jar ./cxblog/modules/file/jar

echo "begin copy cxblog-modules-job "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-job/target/cxblog-modules-job.jar ./cxblog/modules/job/jar

echo "begin copy cxblog-modules-gen "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-gen/target/cxblog-modules-gen.jar ./cxblog/modules/gen/jar

echo "begin copy cxblog-modules-blog "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-blog/target/cxblog-modules-blog.jar ./cxblog/modules/blog/jar

echo "begin copy cxblog-modules-msg "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-msg/target/cxblog-modules-msg.jar ./cxblog/modules/msg/jar

echo "begin copy cxblog-modules-payment "
cp ../../cxblog-server-cloud/cxblog-modules/cxblog-payment/target/cxblog-modules-payment.jar ./cxblog/modules/payment/jar

