#!/bin/sh

# 使用说明，用来提示输入参数
usage() {
	echo "Usage: sh 执行脚本.sh [port|start|stop|rm]"
	exit 1
}

# 开启所需端口
port(){
	firewall-cmd --add-port=8010/tcp --permanent
	firewall-cmd --add-port=8020/tcp --permanent
	firewall-cmd --add-port=8030/tcp --permanent
	firewall-cmd --add-port=8040/tcp --permanent

	firewall-cmd --add-port=8000/tcp --permanent
	firewall-cmd --add-port=8001/tcp --permanent

  firewall-cmd --add-port=8080/tcp --permanent
  firewall-cmd --add-port=8081/tcp --permanent
	service firewalld restart
}

# 启动基础环境（必须）
start(){
  echo "正在启动 Mysql、Redis、Nginx和服务"
	docker-compose up -d cxblog-mysql cxblog-redis cxblog-nginx cxblog-server
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
"start")
	start
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
