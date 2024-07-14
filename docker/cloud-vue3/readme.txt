由于本模板使用容器名作为域名，进行容器间通信，故仅限nacos使用standalone模式部署，且需要全部容器在同一台宿主机运行。
容器间ip段需要一致（使用docker-compose运行的容器可忽略）。
项目打包请使用docker-prod环境。

若需使用其它方式部署，请自行更改配置文件。
-nacos-conf-application.properties内的数据库连接域名
-nginx-conf-nginx.conf内的后端反向代理域名
-cxblog.nacos.sql中配置文件连接redis和mysql的域名
