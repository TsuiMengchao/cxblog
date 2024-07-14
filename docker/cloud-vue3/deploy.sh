#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|base|modules|stop|rm]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=8150/tcp --permanent
	firewall-cmd --add-port=8151/tcp --permanent
	firewall-cmd --add-port=8152/tcp --permanent
	firewall-cmd --add-port=8153/tcp --permanent

	firewall-cmd --add-port=8100/tcp --permanent
	firewall-cmd --add-port=8101/tcp --permanent
	firewall-cmd --add-port=8102/tcp --permanent
	firewall-cmd --add-port=8103/tcp --permanent
	firewall-cmd --add-port=8104/tcp --permanent
	firewall-cmd --add-port=8105/tcp --permanent
	firewall-cmd --add-port=8106/tcp --permanent
	firewall-cmd --add-port=8107/tcp --permanent
  firewall-cmd --add-port=8108/tcp --permanent
  firewall-cmd --add-port=8109/tcp --permanent
  firewall-cmd --add-port=8110/tcp --permanent

  firewall-cmd --add-port=8180/tcp --permanent
  firewall-cmd --add-port=8181/tcp --permanent
  firewall-cmd --add-port=8182/tcp --permanent
  firewall-cmd --add-port=8183/tcp --permanent
  firewall-cmd --add-port=8184/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
base(){
  echo "正在启动 Mysql、Redis、Nacos和Gateway、"
	docker-compose up -d cxblog-mysql cxblog-redis cxblog-nacos cxblog-nginx cxblog-gateway
}

# 启动核心程序模块（必须）
modules(){
  echo "正在启动 Auth、System、File、Blog、Msg和Payment"
	docker-compose up -d cxblog-auth cxblog-modules-system cxblog-modules-file cxblog-modules-blog cxblog-modules-msg cxblog-modules-payment
}

# 启动附加程序模块（非必须）
other(){
  echo "正在启动 Gen、Monitor"
	docker-compose up -d cxblog-modules-gen cxblog-modules-monitor
}

# 关闭所有环境/模块
stop(){
	docker-compose stop
}

# 删除所有环境/模块
rm(){
	docker-compose rm
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
"port")
	port
;;
"base")
	base
;;
"modules")
	modules
;;
"other")
	other
;;
"stop")
	stop
;;
"rm")
	rm
;;
*)
	usage
;;
esac
