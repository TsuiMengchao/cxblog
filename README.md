<h1 style="text-align: center">CX-BLOG 辰雪博客</h1>

# 简介

## 项目简介
[CXBLOG](http://辰雪博客.赵浩悦.我爱你)是基于 Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es 的前后端分离的博客系统。

## 项目来源
在 Github 和 Gitee 上看了很多的博客项目，发现大多数要么是完成度不高，要么是完成度太高不容易移植和修改，且技术栈迭代过多，项目复杂性较高，不适合初学者研究学习。于是 CXBLOG 就这样诞生了。
此项目是由[ELADMIN](https://eladmin.vip/)（成熟且完善的后端管理系统）和[拾壹博客](https://www.shiyit.com/)（较为完善的博客系统）这两个开源项目整合而成，属于站在巨人的肩膀上制造出的产物。由于ELADMIN的后端代码格式更符合我的偏好，且拾壹博客开放的源代码中管理系统部分的代码不完整，于是便将两者尝试融合到了一起。

## 在线体验
博客首页预览地址：[辰雪博客](http://辰雪博客.赵浩悦.我爱你)
博客管理系统预览地址：[辰雪博客管理系统](http://管理.辰雪博客.赵浩悦.我爱你)
账号密码：admin / 123456   |  test / 123456   |  common / 123456
亦可在博客首页自行注册账号，本博客支持[QQ](https://connect.qq.com/index.html)、[gitee](https://gitee.com/api/v5/oauth_doc#/)、[微博](https://open.weibo.com/?bottomnav=1&wvr=6)、微信公众号登录。

## 项目源码
码云作为国内同步仓库，可解决Github克隆缓慢的问题，两个平台的代码都是同步更新的，按需选择
|  平台 | 源码地址                                   |
|---  |----------------------------------------|
|  github   | https://github.com/TsuiMengchao/cxblog |
|  码云   | https://gitee.com/MengChenxue/cxblog      |

## 反馈交流
为了方便管理，现已开启 Gitee 和 Github 的 Issues 功能，欢迎在 [Gitee](https://gitee.com/MengChenxue/cxblog/issues) 和 [Github]() 上提 Issues。

QQ：484132820、微信：tsuimengchao、邮箱：tsuimengchao@aliyun.com

# 快速了解
CXBLOG 基于 Spring Boot 2.6.4 、 Spring Boot Mybatis-Plus、 JWT、Spring Security、Redis、Vue、Element-UI 的前后端分离的后台管理系统， 项目采用按功能分模块的开发方式，权限控制采用 RBAC 思想，支持数据字典与数据权限管理，支持一键生成管理系统前后端代码，支持管理系统前端菜单动态路由等。

## 主要特性
使用最新技术栈，社区资源丰富。
高效率开发，代码生成器可一键生成前后端代码
支持数据字典，可方便地对一些状态进行管理
支持接口限流，避免恶意请求导致服务层压力过大
支持接口级别的功能权限与数据权限，可自定义操作
自定义权限注解与匿名接口注解，可快速对接口拦截与放行
对一些常用地前端组件封装：表格数据请求、数据字典等
前后端统一异常拦截处理，统一输出异常，避免繁琐的判断
支持在线用户管理与服务器性能监控，支持限制单用户登录
支持运维管理，可方便地对远程服务器的应用进行部署与管理

## 主要功能
用户管理：提供用户的相关配置，新增用户后，默认密码为123456
角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限
菜单管理：已实现菜单动态路由，后端可配置化，支持多级菜单
部门管理：可配置系统组织架构，树形表格展示
岗位管理：配置各个部门的职位
字典管理：可维护常用一些固定的数据，如：状态，性别等
系统日志：记录用户操作日志与异常日志，方便开发人员定位排错
SQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456
定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然
代码生成：高灵活度生成前后端代码，减少大量重复的工作任务
邮件工具：配合富文本，发送html格式的邮件
七牛云存储：可同步七牛云存储的数据到系统，无需登录七牛云直接操作云数据
支付宝支付：整合了支付宝支付并且提供了测试账号，可自行测试
服务监控：监控服务器的负载情况
运维管理：一键部署你的应用
博客管理：可维护用户上传的博客、标签、分类以及说说等内容
博客管理：可配置博客的部分展示内容
消息管理：可维护用户上传的留言、评论以及反馈等内容

## 项目结构
==cxblog-common== 为系统的公共模块，各种工具类，公共配置存在该模块

==cxblog-main== 为系统核心模块也是项目入口模块，也是最终需要打包部署的模块

==cxblog-logging== 为系统的日志模块，其他模块如果需要记录日志需要引入该模块

==cxblog-tools== 为第三方工具模块，包含：邮件、七牛云存储、本地存储、支付宝

==cxblog-generator== 为系统的代码生成模块，支持一键生成前后端CRUD代码

## 详细结构
```
- cxblog-common 公共模块
    - annotation 为系统自定义注解
    - aspect 自定义注解的切面
    - base 提供了Entity、DTO基类和mapstruct的通用mapper
    - config 自定义权限实现、redis配置、swagger配置、Rsa配置等
    - exception 项目统一异常的处理
    - utils 系统通用工具类
- cxblog-main 系统核心模块（系统启动入口）
	- config 配置跨域与静态资源，与数据权限
	    - thread 线程池相关
	- modules 系统相关模块(登录授权、系统监控、定时任务、运维管理等)
- cxblog-logging 系统日志模块
- cxblog-tools 系统第三方工具模块
- cxblog-generator 系统代码生成模块
```

# 快速开始
使用该项目前，你需要检查你本地的开发环境，避免出现问题!
## 所需环境
这里列出项目所需的环境与相关安装教程，方便刚入门的同学
```
1、JDK：1.8+ （本人使用的openJDK 21）
安装教程：https://www.runoob.com/java/java-environment-setup.html
2、Redis 3.0+ （本人使用的小皮面板集成的3.0.504）
安装教程：https://www.runoob.com/redis/redis-install.html
3、Maven 3.0+
安装教程：https://www.runoob.com/maven/maven-setup.html
4、MYSQL 5.5.0+ （本人使用的小皮面板集成的5.7.26）
安装教程：https://www.runoob.com/mysql/mysql-install.html
5、Node v10+ (最好使用 12-16，高版本可能会有问题，本人使用的16)
安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html
```

>**注意**
>前端安装完 node 后，最好设置下淘宝的镜像源，不建议使用 cnpm（可能会出现奇怪的问题）
```
npm config set registry https://registry.npm.taobao.org
配置后可通过下面方式来验证是否成功
npm config get registry

在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败
sass_binary_site=https://npm.taobao.org/mirrors/node-sass/

.npmrc 文件位于
win：C:\Users\[你的账户名称]\.npmrc
linux：直接使用 vi ~/.npmrc
```
## 开发准备
>**提示**
>在使用该系统前，你还需要做如下准备

1.给 [idea](https://blog.csdn.net/wochunyang/article/details/81736354)或者 [eclipse](https://blog.csdn.net/magi1201/article/details/85995987)安装 lombok 插件，我们用它可以省略get，set 方法，可以使代码更简洁。（专业版idea可以跳过这步，个人使用的专业版idea）

2.你需要有 Spring boot 的基础，各大网站均有教程

3.你还需要有 Vue2 的基础，各大网站均有教程

## 运行项目
>**注意**
因为本项目是前后端分离的，所以需要前后端都启动好，才能进行访问。
请先在我们的 [Git](https://gitee.com/MengChenxue/cxblog.git) 上下载好本项目，本项目的项目目录如下：
```
- admin 博客管理系统-前端代码
- web 博客-前端代码
- server 后端代码
- sql 数据库所需sql文件
- img 项目中需要的图片资源
```
特别推荐一款集成环境软件-[小皮系统](https://www.xp.cn)，本人使用的其集成的MySQL、Redis和Nginx，非常好用。

## 后端运行[Idea]
打开Idea，直接将根目录下的 server 目录作为项目打开。
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708774900341.png)

打开MySQL数据库，创建一个新库 cxblog 编码选择 utf8mb4 或者 utf8，然后导入sql文件夹中的初始化脚本库脚本 cxblog.sql。（这里我用的是Navicat数据库可视化管理工具）
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775055362.png)

修改配置，如果你的数据库密码不是 root，那么需要在 dev.yml 配置文件中做相应的修改。
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775199378.png)

运行项目：找到 cxblog-main 模块中的 AppRun，点击启动按钮启动程序。
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775273689.png)

## 前端运行[WebStorm]
打开 WebStorm，直接将根目录下的 web / admin 目录作为项目打开，这里以 admin 为例。
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775423616.png)

这个时候 WebStorm 会在右下角提示我们安装依赖，也可以手动在 Terminal 中输入 npm install 进行安装。
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775483819.png)

依赖安装完成后，打开 package.json 找到 dev 旁边的启动按钮
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775508827.png)

启动完后打开 localhost:8010 即可
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708775535785.png)

#前端运行常见问题
1、依赖安装失败

可通过配置淘宝的镜像源解决
```
npm config set registry https://registry.npm.taobao.org
配置后可通过下面方式来验证是否成功
npm config get registry

在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败
sass_binary_site=https://npm.taobao.org/mirrors/node-sass/

.npmrc 文件位于
win：C:\Users\[你的账户名称]\.npmrc
linux：直接使用 vi ~/.npmrc
```
2、linux 系统在安装依赖的时候会出现 node-sass 无法安装的问题

解决方案：
```
1. 单独安装：npm install --unsafe-perm node-sass 
2. 直接使用：npm install --unsafe-perm
```

# 特别鸣谢
## 特别鸣谢
感谢 [七牛云](https://portal.qiniu.com/)提供的免费云存储支持

感谢 [PanJiaChen](https://github.com/PanJiaChen/vue-element-admin)大佬提供的前端脚手架

感谢 [Moxun](https://github.com/moxun1639)大佬提供的前端 Curd 通用组件

感谢 [zhy6599](https://gitee.com/zhy6599)大佬提供的后端运维管理相关功能

感谢 [j.yao.SUSE](https://github.com/everhopingandwaiting)大佬提供的匿名接口与Redis限流等功能

感谢 [d15801543974](https://github.com/d15801543974)大佬提供的基于注解的通用查询方式

感谢每一位被 CX-BLOG 抄过代码的开发者。

# 界面展示

## 后端管理系统

1、登录界面
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708777944821.png)
2、后台首页
![9c6241f64b278a4226516763e51784c6.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778541680.png)
3、文章管理
列表页
![055a9cf181644471c61935c172e98eee.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778554897.png)
文章添加
![c38bc923c91fb61d7b648c9a42538cb2.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778561422.png)
项目中图片存储采用的是[七牛云](https://www.qiniu.com/products/kodo)平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。
4、标签管理
![76d0cba6f025cc00be187f56c06161a2.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778569352.png)
5、日志管理
针对用户访问以及管理员操作和异常信息都做了一个日志的记录
![3f033214ff63755ef2469a00cbfc05db.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778580979.png)
6、系统配置
![e10811a433f1513f1d024e8c9bcbea7b.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778597764.png)
7、监控中心
![fb19a9c5c973349746a6e474865300ec.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778614136.png)
监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码
8、代码生成
![be4b91bf63693ec3b7d5fecf43bfd718.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778628728.png)

## 博客
1、首页
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778876609.png)
首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。
2、查看博客
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708778946791.png)
3、登录、注册
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708779032866.png)
![image.png](https://cxblog.qiniu.zhaohaoyue.love/20240224_1708779117625.png)

## 结尾
上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，所看到的功能都已实现，还在着手后续的一些功能开发。后台管理根据模板改造而来，毕竟我只会业余的前端技术，所以界面简陋有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！！

# bye
