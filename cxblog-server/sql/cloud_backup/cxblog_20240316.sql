/*
 Navicat Premium Data Transfer

 Source Server         : 云数据库
 Source Server Type    : MySQL
 Source Server Version : 50744
 Source Host           : 47.101.33.34:3306
 Source Schema         : cxblog

 Target Server Type    : MySQL
 Target Server Version : 50744
 File Encoding         : 65001

 Date: 16/03/2024 23:38:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类id',
  `title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章标题',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章封面地址',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '文章简介',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容 （最多两百字）',
  `content_md` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容md版',
  `read_type` int(2) NULL DEFAULT 0 COMMENT '阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读',
  `is_stick` int(11) NULL DEFAULT 0 COMMENT '是否置顶 0否 1是',
  `is_publish` int(11) NULL DEFAULT 0 COMMENT '是否发布 0：下架 1：发布',
  `is_original` int(11) NULL DEFAULT 1 COMMENT '是否原创  0：转载 1:原创',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转载地址',
  `quantity` bigint(20) NULL DEFAULT 0 COMMENT '文章阅读量',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_carousel` int(11) NULL DEFAULT 0 COMMENT '是否首页轮播',
  `is_recommend` int(11) NULL DEFAULT 0 COMMENT '是否推荐',
  `keywords` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关键词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, '1', 32, '关于博客', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/77e3405ae701468f968a65ffe989905f.jpg', '关于博客的一些介绍。', '<blockquote>\n<p>本文主要介绍博客用到的技术和一些功能详情</p>\n</blockquote>\n<h1><a id=\"_2\"></a>简介</h1>\n<h2><a id=\"_4\"></a>项目简介</h2>\n<p><a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">CXBLOG</a>是基于 Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es 的前后端分离的博客系统。</p>\n<h2><a id=\"_7\"></a>项目来源</h2>\n<p>在 Github 和 Gitee 上看了很多的博客项目，发现大多数要么是完成度不高，要么是完成度太高不容易移植和修改，且技术栈迭代过多，项目复杂性较高，不适合初学者研究学习。于是 CXBLOG 就这样诞生了。<br />\n此项目是由<a href=\"https://eladmin.vip/\" target=\"_blank\">ELADMIN</a>（成熟且完善的后端管理系统）和<a href=\"https://www.shiyit.com/\" target=\"_blank\">拾壹博客</a>（较为完善的博客系统）这两个开源项目整合而成，属于站在巨人的肩膀上制造出的产物。由于ELADMIN的后端代码格式更符合我的偏好，且拾壹博客开放的源代码中管理系统部分的代码不完整，于是便将两者尝试融合到了一起。</p>\n<h2><a id=\"_11\"></a>在线体验</h2>\n<p>博客首页预览地址：<a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">辰雪博客</a><br />\n博客管理系统预览地址：<a href=\"http://xn--8ey35n.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">辰雪博客管理系统</a><br />\n账号密码：admin / 123456   |  test / 123456   |  common / 123456<br />\n亦可在博客首页自行注册账号，本博客支持<a href=\"https://connect.qq.com/index.html\" target=\"_blank\">QQ</a>、<a href=\"https://gitee.com/api/v5/oauth_doc#/\" target=\"_blank\">gitee</a>、<a href=\"https://open.weibo.com/?bottomnav=1&amp;wvr=6\" target=\"_blank\">微博</a>、微信公众号登录。</p>\n<h2><a id=\"_17\"></a>项目源码</h2>\n<p>码云作为国内同步仓库，可解决Github克隆缓慢的问题，两个平台的代码都是同步更新的，按需选择</p>\n<table>\n<thead>\n<tr>\n<th>平台</th>\n<th>源码地址</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>github</td>\n<td>https://github.com/TsuiMengchao/cxblog</td>\n</tr>\n<tr>\n<td>码云</td>\n<td>https://gitee.com/TsuiMengchao/cxblog</td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_24\"></a>反馈交流</h2>\n<p>为了方便管理，现已开启 Gitee 和 Github 的 Issues 功能，欢迎在 <a href=\"https://gitee.com/TsuiMengchao/cxblog/issues\" target=\"_blank\">Gitee</a> 和 <a href=\"https://github.com/TsuiMengchao/cxblog/issues\" target=\"_blank\">Github</a> 上提 Issues。</p>\n<p>QQ：484132820、微信：tsuimengchao、邮箱：tsuimengchao@aliyun.com</p>\n<h1><a id=\"_29\"></a>快速了解</h1>\n<p>CXBLOG 基于 Spring Boot 2.6.4 、 Spring Boot Mybatis-Plus、 JWT、Spring Security、Redis、Vue、Element-UI 的前后端分离的后台管理系统， 项目采用按功能分模块的开发方式，权限控制采用 RBAC 思想，支持数据字典与数据权限管理，支持一键生成管理系统前后端代码，支持管理系统前端菜单动态路由等。</p>\n<h2><a id=\"_32\"></a>主要特性</h2>\n<p>使用最新技术栈，社区资源丰富。<br />\n高效率开发，代码生成器可一键生成前后端代码<br />\n支持数据字典，可方便地对一些状态进行管理<br />\n支持接口限流，避免恶意请求导致服务层压力过大<br />\n支持接口级别的功能权限与数据权限，可自定义操作<br />\n自定义权限注解与匿名接口注解，可快速对接口拦截与放行<br />\n对一些常用地前端组件封装：表格数据请求、数据字典等<br />\n前后端统一异常拦截处理，统一输出异常，避免繁琐的判断<br />\n支持在线用户管理与服务器性能监控，支持限制单用户登录<br />\n支持运维管理，可方便地对远程服务器的应用进行部署与管理</p>\n<h2><a id=\"_44\"></a>主要功能</h2>\n<p>用户管理：提供用户的相关配置，新增用户后，默认密码为123456<br />\n角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限<br />\n菜单管理：已实现菜单动态路由，后端可配置化，支持多级菜单<br />\n部门管理：可配置系统组织架构，树形表格展示<br />\n岗位管理：配置各个部门的职位<br />\n字典管理：可维护常用一些固定的数据，如：状态，性别等<br />\n系统日志：记录用户操作日志与异常日志，方便开发人员定位排错<br />\nSQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456<br />\n定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然<br />\n代码生成：高灵活度生成前后端代码，减少大量重复的工作任务<br />\n邮件工具：配合富文本，发送html格式的邮件<br />\n七牛云存储：可同步七牛云存储的数据到系统，无需登录七牛云直接操作云数据<br />\n支付宝支付：整合了支付宝支付并且提供了测试账号，可自行测试<br />\n服务监控：监控服务器的负载情况<br />\n运维管理：一键部署你的应用<br />\n博客管理：可维护用户上传的博客、标签、分类以及说说等内容<br />\n博客管理：可配置博客的部分展示内容<br />\n消息管理：可维护用户上传的留言、评论以及反馈等内容</p>\n<h2><a id=\"_64\"></a>项目结构</h2>\n<p><mark>cxblog-common</mark> 为系统的公共模块，各种工具类，公共配置存在该模块</p>\n<p><mark>cxblog-main</mark> 为系统核心模块也是项目入口模块，也是最终需要打包部署的模块</p>\n<p><mark>cxblog-logging</mark> 为系统的日志模块，其他模块如果需要记录日志需要引入该模块</p>\n<p><mark>cxblog-tools</mark> 为第三方工具模块，包含：邮件、七牛云存储、本地存储、支付宝</p>\n<p><mark>cxblog-generator</mark> 为系统的代码生成模块，支持一键生成前后端CRUD代码</p>\n<h2><a id=\"_75\"></a>详细结构</h2>\n<pre><code class=\"lang-\">- cxblog-common 公共模块\n    - annotation 为系统自定义注解\n    - aspect 自定义注解的切面\n    - base 提供了Entity、DTO基类和mapstruct的通用mapper\n    - config 自定义权限实现、redis配置、swagger配置、Rsa配置等\n    - exception 项目统一异常的处理\n    - utils 系统通用工具类\n- cxblog-main 系统核心模块（系统启动入口）\n	- config 配置跨域与静态资源，与数据权限\n	    - thread 线程池相关\n	- modules 系统相关模块(登录授权、系统监控、定时任务、运维管理等)\n- cxblog-logging 系统日志模块\n- cxblog-tools 系统第三方工具模块\n- cxblog-generator 系统代码生成模块\n</code></pre>\n<h1><a id=\"_93\"></a>快速开始</h1>\n<p>使用该项目前，你需要检查你本地的开发环境，避免出现问题!</p>\n<h2><a id=\"_95\"></a>所需环境</h2>\n<p>这里列出项目所需的环境与相关安装教程，方便刚入门的同学</p>\n<pre><code class=\"lang-\">1、JDK：1.8+ （本人使用的openJDK 21）\n安装教程：https://www.runoob.com/java/java-environment-setup.html\n2、Redis 3.0+ （本人使用的小皮面板集成的3.0.504）\n安装教程：https://www.runoob.com/redis/redis-install.html\n3、Maven 3.0+\n安装教程：https://www.runoob.com/maven/maven-setup.html\n4、MYSQL 5.5.0+ （本人使用的小皮面板集成的5.7.26）\n安装教程：https://www.runoob.com/mysql/mysql-install.html\n5、Node v10+ (最好使用 12-16，高版本可能会有问题，本人使用的16)\n安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html\n</code></pre>\n<blockquote>\n<p><strong>注意</strong><br />\n前端安装完 node 后，最好设置下淘宝的镜像源，不建议使用 cnpm（可能会出现奇怪的问题）</p>\n</blockquote>\n<pre><code class=\"lang-\">npm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n</code></pre>\n<h2><a id=\"_124\"></a>开发准备</h2>\n<blockquote>\n<p><strong>提示</strong><br />\n在使用该系统前，你还需要做如下准备</p>\n</blockquote>\n<p>1.给 <a href=\"https://blog.csdn.net/wochunyang/article/details/81736354\" target=\"_blank\">idea</a>或者 <a href=\"https://blog.csdn.net/magi1201/article/details/85995987\" target=\"_blank\">eclipse</a>安装 lombok 插件，我们用它可以省略get，set 方法，可以使代码更简洁。（专业版idea可以跳过这步，个人使用的专业版idea）</p>\n<p>2.你需要有 Spring boot 的基础，各大网站均有教程</p>\n<p>3.你还需要有 Vue2 的基础，各大网站均有教程</p>\n<h2><a id=\"_134\"></a>运行项目</h2>\n<blockquote>\n<p><strong>注意</strong><br />\n因为本项目是前后端分离的，所以需要前后端都启动好，才能进行访问。<br />\n请先在我们的 <a href=\"https://gitee.com/TsuiMengchao/cxblog.git\" target=\"_blank\">Git</a> 上下载好本项目，本项目的项目目录如下：</p>\n</blockquote>\n<pre><code class=\"lang-\">- admin 博客管理系统-前端代码\n- web 博客-前端代码\n- server 后端代码\n- sql 数据库所需sql文件\n- img 项目中需要的图片资源\n</code></pre>\n<p>特别推荐一款集成环境软件-<a href=\"https://www.xp.cn\" target=\"_blank\">小皮系统</a>，本人使用的其集成的MySQL、Redis和Nginx，非常好用。</p>\n<h2><a id=\"Idea_147\"></a>后端运行[Idea]</h2>\n<p>打开Idea，直接将根目录下的 server 目录作为项目打开。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708774900341.png\" alt=\"image.png\" /></p>\n<p>打开MySQL数据库，创建一个新库 cxblog 编码选择 utf8mb4 或者 utf8，然后导入sql文件夹中的初始化脚本库脚本 cxblog.sql。（这里我用的是Navicat数据库可视化管理工具）<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775055362.png\" alt=\"image.png\" /></p>\n<p>修改配置，如果你的数据库密码不是 root，那么需要在 dev.yml 配置文件中做相应的修改。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775199378.png\" alt=\"image.png\" /></p>\n<p>运行项目：找到 cxblog-main 模块中的 AppRun，点击启动按钮启动程序。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775273689.png\" alt=\"image.png\" /></p>\n<h2><a id=\"WebStorm_160\"></a>前端运行[WebStorm]</h2>\n<p>打开 WebStorm，直接将根目录下的 web / admin 目录作为项目打开，这里以 admin 为例。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775423616.png\" alt=\"image.png\" /></p>\n<p>这个时候 WebStorm 会在右下角提示我们安装依赖，也可以手动在 Terminal 中输入 npm install 进行安装。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775483819.png\" alt=\"image.png\" /></p>\n<p>依赖安装完成后，打开 package.json 找到 dev 旁边的启动按钮<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775508827.png\" alt=\"image.png\" /></p>\n<p>启动完后打开 localhost:8010 即可<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775535785.png\" alt=\"image.png\" /></p>\n<p>#前端运行常见问题<br />\n1、依赖安装失败</p>\n<p>可通过配置淘宝的镜像源解决</p>\n<pre><code class=\"lang-\">npm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n</code></pre>\n<p>2、linux 系统在安装依赖的时候会出现 node-sass 无法安装的问题</p>\n<p>解决方案：</p>\n<pre><code class=\"lang-\">1. 单独安装：npm install --unsafe-perm node-sass \n2. 直接使用：npm install --unsafe-perm\n</code></pre>\n<h1><a id=\"_197\"></a>特别鸣谢</h1>\n<h2><a id=\"_198\"></a>特别鸣谢</h2>\n<p>感谢 <a href=\"https://portal.qiniu.com/\" target=\"_blank\">七牛云</a>提供的免费云存储支持</p>\n<p>感谢 <a href=\"https://github.com/PanJiaChen/vue-element-admin\" target=\"_blank\">PanJiaChen</a>大佬提供的前端脚手架</p>\n<p>感谢 <a href=\"https://github.com/moxun1639\" target=\"_blank\">Moxun</a>大佬提供的前端 Curd 通用组件</p>\n<p>感谢 <a href=\"https://gitee.com/zhy6599\" target=\"_blank\">zhy6599</a>大佬提供的后端运维管理相关功能</p>\n<p>感谢 <a href=\"https://github.com/everhopingandwaiting\" target=\"_blank\">j.yao.SUSE</a>大佬提供的匿名接口与Redis限流等功能</p>\n<p>感谢 <a href=\"https://github.com/d15801543974\" target=\"_blank\">d15801543974</a>大佬提供的基于注解的通用查询方式</p>\n<p>感谢每一位被 CX-BLOG 抄过代码的开发者。</p>\n<h1><a id=\"_213\"></a>界面展示</h1>\n<h2><a id=\"_215\"></a>后端管理系统</h2>\n<p>1、登录界面<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708777944821.png\" alt=\"image.png\" /><br />\n2、后台首页<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778541680.png\" alt=\"9c6241f64b278a4226516763e51784c6.png\" /><br />\n3、文章管理<br />\n列表页<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778554897.png\" alt=\"055a9cf181644471c61935c172e98eee.png\" /><br />\n文章添加<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778561422.png\" alt=\"c38bc923c91fb61d7b648c9a42538cb2.png\" /><br />\n项目中图片存储采用的是<a href=\"https://www.qiniu.com/products/kodo\" target=\"_blank\">七牛云</a>平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。<br />\n4、标签管理<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778569352.png\" alt=\"76d0cba6f025cc00be187f56c06161a2.png\" /><br />\n5、日志管理<br />\n针对用户访问以及管理员操作和异常信息都做了一个日志的记录<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778580979.png\" alt=\"3f033214ff63755ef2469a00cbfc05db.png\" /><br />\n6、系统配置<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778597764.png\" alt=\"e10811a433f1513f1d024e8c9bcbea7b.png\" /><br />\n7、监控中心<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778614136.png\" alt=\"fb19a9c5c973349746a6e474865300ec.png\" /><br />\n监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码<br />\n8、代码生成<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778628728.png\" alt=\"be4b91bf63693ec3b7d5fecf43bfd718.png\" /></p>\n<h2><a id=\"_240\"></a>博客</h2>\n<p>1、首页<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778876609.png\" alt=\"image.png\" /><br />\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。<br />\n2、查看博客<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778946791.png\" alt=\"image.png\" /><br />\n3、登录、注册<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779032866.png\" alt=\"image.png\" /><br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779117625.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_250\"></a>结尾</h2>\n<p>上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，所看到的功能都已实现，还在着手后续的一些功能开发。后台管理根据模板改造而来，毕竟我只会业余的前端技术，所以界面简陋有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！！</p>\n<h1><a id=\"bye_253\"></a>bye</h1>\n', '> 本文主要介绍博客用到的技术和一些功能详情\n\n# 简介\n\n## 项目简介\n[CXBLOG](http://辰雪博客.赵浩悦.我爱你)是基于 Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es 的前后端分离的博客系统。\n\n## 项目来源\n在 Github 和 Gitee 上看了很多的博客项目，发现大多数要么是完成度不高，要么是完成度太高不容易移植和修改，且技术栈迭代过多，项目复杂性较高，不适合初学者研究学习。于是 CXBLOG 就这样诞生了。\n此项目是由[ELADMIN](https://eladmin.vip/)（成熟且完善的后端管理系统）和[拾壹博客](https://www.shiyit.com/)（较为完善的博客系统）这两个开源项目整合而成，属于站在巨人的肩膀上制造出的产物。由于ELADMIN的后端代码格式更符合我的偏好，且拾壹博客开放的源代码中管理系统部分的代码不完整，于是便将两者尝试融合到了一起。\n\n## 在线体验\n博客首页预览地址：[辰雪博客](http://辰雪博客.赵浩悦.我爱你) \n博客管理系统预览地址：[辰雪博客管理系统](http://管理.辰雪博客.赵浩悦.我爱你) \n账号密码：admin / 123456   |  test / 123456   |  common / 123456\n亦可在博客首页自行注册账号，本博客支持[QQ](https://connect.qq.com/index.html)、[gitee](https://gitee.com/api/v5/oauth_doc#/)、[微博](https://open.weibo.com/?bottomnav=1&wvr=6)、微信公众号登录。\n\n## 项目源码\n码云作为国内同步仓库，可解决Github克隆缓慢的问题，两个平台的代码都是同步更新的，按需选择\n|  平台 | 源码地址                                   |\n|---  |----------------------------------------|\n|  github   | https://github.com/TsuiMengchao/cxblog |\n|  码云   | https://gitee.com/TsuiMengchao/cxblog      |\n\n## 反馈交流\n为了方便管理，现已开启 Gitee 和 Github 的 Issues 功能，欢迎在 [Gitee](https://gitee.com/TsuiMengchao/cxblog/issues) 和 [Github](https://github.com/TsuiMengchao/cxblog/issues) 上提 Issues。\n\nQQ：484132820、微信：tsuimengchao、邮箱：tsuimengchao@aliyun.com\n\n# 快速了解\nCXBLOG 基于 Spring Boot 2.6.4 、 Spring Boot Mybatis-Plus、 JWT、Spring Security、Redis、Vue、Element-UI 的前后端分离的后台管理系统， 项目采用按功能分模块的开发方式，权限控制采用 RBAC 思想，支持数据字典与数据权限管理，支持一键生成管理系统前后端代码，支持管理系统前端菜单动态路由等。\n\n## 主要特性\n使用最新技术栈，社区资源丰富。\n高效率开发，代码生成器可一键生成前后端代码\n支持数据字典，可方便地对一些状态进行管理\n支持接口限流，避免恶意请求导致服务层压力过大\n支持接口级别的功能权限与数据权限，可自定义操作\n自定义权限注解与匿名接口注解，可快速对接口拦截与放行\n对一些常用地前端组件封装：表格数据请求、数据字典等\n前后端统一异常拦截处理，统一输出异常，避免繁琐的判断\n支持在线用户管理与服务器性能监控，支持限制单用户登录\n支持运维管理，可方便地对远程服务器的应用进行部署与管理\n\n## 主要功能\n用户管理：提供用户的相关配置，新增用户后，默认密码为123456\n角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限\n菜单管理：已实现菜单动态路由，后端可配置化，支持多级菜单\n部门管理：可配置系统组织架构，树形表格展示\n岗位管理：配置各个部门的职位\n字典管理：可维护常用一些固定的数据，如：状态，性别等\n系统日志：记录用户操作日志与异常日志，方便开发人员定位排错\nSQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456\n定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然\n代码生成：高灵活度生成前后端代码，减少大量重复的工作任务\n邮件工具：配合富文本，发送html格式的邮件\n七牛云存储：可同步七牛云存储的数据到系统，无需登录七牛云直接操作云数据\n支付宝支付：整合了支付宝支付并且提供了测试账号，可自行测试\n服务监控：监控服务器的负载情况\n运维管理：一键部署你的应用\n博客管理：可维护用户上传的博客、标签、分类以及说说等内容\n博客管理：可配置博客的部分展示内容\n消息管理：可维护用户上传的留言、评论以及反馈等内容\n\n## 项目结构\n==cxblog-common== 为系统的公共模块，各种工具类，公共配置存在该模块\n\n==cxblog-main== 为系统核心模块也是项目入口模块，也是最终需要打包部署的模块\n\n==cxblog-logging== 为系统的日志模块，其他模块如果需要记录日志需要引入该模块\n\n==cxblog-tools== 为第三方工具模块，包含：邮件、七牛云存储、本地存储、支付宝\n\n==cxblog-generator== 为系统的代码生成模块，支持一键生成前后端CRUD代码\n\n## 详细结构\n```\n- cxblog-common 公共模块\n    - annotation 为系统自定义注解\n    - aspect 自定义注解的切面\n    - base 提供了Entity、DTO基类和mapstruct的通用mapper\n    - config 自定义权限实现、redis配置、swagger配置、Rsa配置等\n    - exception 项目统一异常的处理\n    - utils 系统通用工具类\n- cxblog-main 系统核心模块（系统启动入口）\n	- config 配置跨域与静态资源，与数据权限\n	    - thread 线程池相关\n	- modules 系统相关模块(登录授权、系统监控、定时任务、运维管理等)\n- cxblog-logging 系统日志模块\n- cxblog-tools 系统第三方工具模块\n- cxblog-generator 系统代码生成模块\n```\n\n# 快速开始\n使用该项目前，你需要检查你本地的开发环境，避免出现问题!\n## 所需环境\n这里列出项目所需的环境与相关安装教程，方便刚入门的同学\n```\n1、JDK：1.8+ （本人使用的openJDK 21）\n安装教程：https://www.runoob.com/java/java-environment-setup.html\n2、Redis 3.0+ （本人使用的小皮面板集成的3.0.504）\n安装教程：https://www.runoob.com/redis/redis-install.html\n3、Maven 3.0+\n安装教程：https://www.runoob.com/maven/maven-setup.html\n4、MYSQL 5.5.0+ （本人使用的小皮面板集成的5.7.26）\n安装教程：https://www.runoob.com/mysql/mysql-install.html\n5、Node v10+ (最好使用 12-16，高版本可能会有问题，本人使用的16)\n安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html\n```\n\n>**注意**\n>前端安装完 node 后，最好设置下淘宝的镜像源，不建议使用 cnpm（可能会出现奇怪的问题）\n```\nnpm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n```\n## 开发准备\n>**提示**\n>在使用该系统前，你还需要做如下准备\n\n1.给 [idea](https://blog.csdn.net/wochunyang/article/details/81736354)或者 [eclipse](https://blog.csdn.net/magi1201/article/details/85995987)安装 lombok 插件，我们用它可以省略get，set 方法，可以使代码更简洁。（专业版idea可以跳过这步，个人使用的专业版idea）\n\n2.你需要有 Spring boot 的基础，各大网站均有教程\n\n3.你还需要有 Vue2 的基础，各大网站均有教程\n\n## 运行项目\n>**注意**\n因为本项目是前后端分离的，所以需要前后端都启动好，才能进行访问。\n请先在我们的 [Git](https://gitee.com/TsuiMengchao/cxblog.git) 上下载好本项目，本项目的项目目录如下：\n```\n- admin 博客管理系统-前端代码\n- web 博客-前端代码\n- server 后端代码\n- sql 数据库所需sql文件\n- img 项目中需要的图片资源\n```\n特别推荐一款集成环境软件-[小皮系统](https://www.xp.cn)，本人使用的其集成的MySQL、Redis和Nginx，非常好用。\n\n## 后端运行[Idea]\n打开Idea，直接将根目录下的 server 目录作为项目打开。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708774900341.png)\n\n打开MySQL数据库，创建一个新库 cxblog 编码选择 utf8mb4 或者 utf8，然后导入sql文件夹中的初始化脚本库脚本 cxblog.sql。（这里我用的是Navicat数据库可视化管理工具）\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775055362.png)\n\n修改配置，如果你的数据库密码不是 root，那么需要在 dev.yml 配置文件中做相应的修改。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775199378.png)\n\n运行项目：找到 cxblog-main 模块中的 AppRun，点击启动按钮启动程序。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775273689.png)\n\n## 前端运行[WebStorm]\n打开 WebStorm，直接将根目录下的 web / admin 目录作为项目打开，这里以 admin 为例。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775423616.png)\n\n这个时候 WebStorm 会在右下角提示我们安装依赖，也可以手动在 Terminal 中输入 npm install 进行安装。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775483819.png)\n\n依赖安装完成后，打开 package.json 找到 dev 旁边的启动按钮\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775508827.png)\n\n启动完后打开 localhost:8010 即可\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775535785.png)\n\n#前端运行常见问题\n1、依赖安装失败\n\n可通过配置淘宝的镜像源解决\n```\nnpm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n```\n2、linux 系统在安装依赖的时候会出现 node-sass 无法安装的问题\n\n解决方案：\n```\n1. 单独安装：npm install --unsafe-perm node-sass \n2. 直接使用：npm install --unsafe-perm\n```\n\n# 特别鸣谢\n## 特别鸣谢\n感谢 [七牛云](https://portal.qiniu.com/)提供的免费云存储支持\n\n感谢 [PanJiaChen](https://github.com/PanJiaChen/vue-element-admin)大佬提供的前端脚手架\n\n感谢 [Moxun](https://github.com/moxun1639)大佬提供的前端 Curd 通用组件\n\n感谢 [zhy6599](https://gitee.com/zhy6599)大佬提供的后端运维管理相关功能\n\n感谢 [j.yao.SUSE](https://github.com/everhopingandwaiting)大佬提供的匿名接口与Redis限流等功能\n\n感谢 [d15801543974](https://github.com/d15801543974)大佬提供的基于注解的通用查询方式\n\n感谢每一位被 CX-BLOG 抄过代码的开发者。\n\n# 界面展示\n\n## 后端管理系统\n\n1、登录界面\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708777944821.png)\n2、后台首页\n![9c6241f64b278a4226516763e51784c6.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778541680.png)\n3、文章管理\n列表页\n![055a9cf181644471c61935c172e98eee.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778554897.png)\n文章添加\n![c38bc923c91fb61d7b648c9a42538cb2.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778561422.png)\n项目中图片存储采用的是[七牛云](https://www.qiniu.com/products/kodo)平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。\n4、标签管理\n![76d0cba6f025cc00be187f56c06161a2.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778569352.png)\n5、日志管理\n针对用户访问以及管理员操作和异常信息都做了一个日志的记录\n![3f033214ff63755ef2469a00cbfc05db.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778580979.png)\n6、系统配置\n![e10811a433f1513f1d024e8c9bcbea7b.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778597764.png)\n7、监控中心\n![fb19a9c5c973349746a6e474865300ec.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778614136.png)\n监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码\n8、代码生成\n![be4b91bf63693ec3b7d5fecf43bfd718.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778628728.png)\n\n## 博客\n1、首页\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778876609.png)\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。\n2、查看博客\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778946791.png)\n3、登录、注册\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779032866.png)\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779117625.png)\n\n## 结尾\n上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，所看到的功能都已实现，还在着手后续的一些功能开发。后台管理根据模板改造而来，毕竟我只会业余的前端技术，所以界面简陋有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！！\n\n# bye', 0, 1, 1, 1, NULL, 0, '2024-02-24 20:02:44', NULL, 1, 1, NULL);
INSERT INTO `blog_article` VALUES (2, '4', 32, '个人简历', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', '找不到工作啊，怎么办啊，马上就要毕业了。', ' <center>\n     <h1>崔梦超</h1>\n </center>\n<h2><a id=\"_4\"></a>个人信息</h2>\n<ul>\n<li>性 别：男             年 龄：22</li>\n<li>手 机：18333191029         邮 箱：tsuimengchao@aliyun.com</li>\n<li>专 业：计算机科学与技术      岗 位：后端开发/Python开发</li>\n</ul>\n<h2><a id=\"_10\"></a>工作及教育经历</h2>\n<ul>\n<li>重庆第二师范学院     2022.9~2024.7     计算机科学与技术-本科</li>\n<li>重庆电子工程职业学院     2019.9~2022.7     移动应用开发-专科</li>\n</ul>\n<h2><a id=\"_15\"></a>专业技能</h2>\n<ul>\n<li>熟练使用 Python，掌握基础的 Java、PHP、C# 等编程语言</li>\n<li>掌握基础数据结构和算法的基本原理</li>\n<li>掌握基本的前后端开发能力，擅长抄代码。</li>\n</ul>\n<h2><a id=\"_21\"></a>项目经历</h2>\n<ol>\n<li>\n<p>学校 - 国家大学生学情调查《NCSS》问卷系统 - 负责问卷数据导出分析软件开发 - 2020.02- 2020.04</p>\n<ul>\n<li>具体功能：将国家大学生学情调查《NCSS》问卷系统所收集的问卷数据进行处理分析及生成定制化分析报告。</li>\n<li>运用了Python、PYQT、CSS、MySQL等技术，技术难点是将dataframe类型数据保存成sav格式文件，这个小功能使用的是一个名为pyreadstat的第三方库，这个库在打包为exe文件时出现了问题，当时国内没有太多教程。</li>\n<li>效果：勉强能用，毕竟当时才大一，刚开始学习，能搞定已经觉得很不错了。</li>\n<li>因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/NCSS\" target=\"_blank\">gitee地址</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 喷码机赋码软件 - 负责软件开发 - 2020.04- 2020.06</p>\n<ul>\n<li>具体功能：根据协议生成序列码，当喷码机器获取序列码时，通过串口将序列码发送给机器。</li>\n<li>运用了Python、PYQT、CSS、MySQL、Serial等技术，技术难点是提供的喷码机器dll库文件没有详细的接口说明；</li>\n<li>勉强能用</li>\n<li>因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/Prima\" target=\"_blank\">gitee地址</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 数字孪生-智慧校园 - 负责网页开发 - 201309- 201401</p>\n<ul>\n<li>具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。</li>\n<li>运用了VUE框架、Element组件库、THREEJS三维引擎库、MySQL数据库、MQTT协议、物联网通讯等技术，技术难点是ThreeJs库上手难度不低</li>\n<li>效果不是很好，模型动辄上百兆，加载速度太慢了，而且网页渲染也不行，有时还内存溢出，后面直接换技术了。</li>\n<li>这个虽说可以有演示地址，但是太大了，截个图算了。源码地址：<a href=\"https://gitee.com/laboratory-15304/SmartCampusCqcet\" target=\"_blank\">智慧校园-1</a> - <a href=\"https://gitee.com/laboratory-15304/SmartCampusTorch\" target=\"_blank\">智慧校园-2</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 数字孪生-智慧校园 - 负责程序开发 - 201309- 201401</p>\n<ul>\n<li>具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。</li>\n<li>运用了Unity、MySQL数据库、物联网、PHP、ThinkPHP框架、ROS机器人操作系统等技术，技术难点是Unity上手难度也不低，使用很简单，用好就难了。</li>\n<li>效果很好，基本秒加载，而且渲染也是真的棒。</li>\n<li>因为是win软件，因此暂无演示地址。私有仓库，暂不提供源码地址。</li>\n</ul>\n</li>\n<li>\n<p>学校 - 光化施工控制系统 - 负责软件开发 - 2021.10- 2022.04</p>\n<ul>\n<li>具体功能：win工控机软件界面开发，实现通过串口对plc设备控制、通过websocket协议与app端数据互通等功能</li>\n<li>运用了Python、PYQT5、QSS、Serial、WebSocket等技术，技术难点是一个海康摄像头用120米的普通网线来连接，还经常断，pyqt5+opencv加我这半斤八两的技术水平应对这个情况太难了。</li>\n<li>能用，但是因为plc给的数据不可靠，摄像头不稳定，所以效果一般般。</li>\n<li>因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/Actinic-PC\" target=\"_blank\">光固化软件</a> - <a href=\"https://gitee.com/laboratory-15304/actinic-server\" target=\"_blank\">光固化后端</a></li>\n</ul>\n</li>\n</ol>\n<h2><a id=\"_53\"></a>获奖经历</h2>\n<ul>\n<li>竞赛 2019年12月 2019重庆市第十届大学生程序设计大赛 省部级三等奖</li>\n<li>竞赛 2021年9月 全国大学生数学建模竞赛 国家级二等奖</li>\n<li>竞赛 在其余专业性较弱的比赛中曾获省部级奖十余次，国家级奖一次</li>\n<li>专利证书 《一种并联连接机构及发电机组群控管理系统》和《一种通讯连接机构》 “实用新型专利”授权</li>\n<li>论文 《智能网联汽车的应用现状及发展》 《科学咨询》杂志社《科学咨询·科技人文》刊出</li>\n</ul>\n<h2><a id=\"_60\"></a>个人账号</h2>\n<ul>\n<li><a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">个人博客</a></li>\n<li><a href=\"https://gitee.com/TsuiMengchao\" target=\"_blank\">gitee</a></li>\n</ul>\n<h2><a id=\"_64\"></a>其他信息</h2>\n<ul>\n<li>通过英语四级，基本可以理解英文的文档。</li>\n<li>使用过多种编程语言及其框架，并利用其进行过小型项目开发，入职后能更快适应工作需求，在必要时可以可以短期协助处理其它相关岗位的问题。</li>\n<li>有两年以上从事编程开发类项目的工作经验，进行过数次团队合作开发，能更好的对接工作。拥有良好的沟通能力和组织能力。</li>\n</ul>\n<h1><a id=\"_69\"></a>关于作者</h1>\n<p>欢迎大家与我交流哦，微信扫描下方二维码并关注，即可与我联系。</p>\n<img src=\"http://七牛云.辰雪博客.赵浩悦.我爱你/wechatQr.jpg\" width=\"175\" height=\"175\">', ' <center>\n     <h1>崔梦超</h1>\n </center>\n\n## 个人信息 \n\n* 性 别：男&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;年 龄：22\n* 手 机：18333191029&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;邮 箱：tsuimengchao@aliyun.com    \n* 专 业：计算机科学与技术&emsp;&emsp;&emsp;&emsp;&emsp; 岗 位：后端开发/Python开发\n\n## 工作及教育经历\n \n* 重庆第二师范学院&emsp;&emsp;&emsp;&emsp;&emsp;2022.9~2024.7&emsp;&emsp;&emsp;&emsp; 计算机科学与技术-本科         \n* 重庆电子工程职业学院&emsp;&emsp;&emsp;&emsp;&emsp;2019.9~2022.7&emsp;&emsp;&emsp;&emsp; 移动应用开发-专科  \n\n## 专业技能\n\n* 熟练使用 Python，掌握基础的 Java、PHP、C# 等编程语言\n* 掌握基础数据结构和算法的基本原理\n* 掌握基本的前后端开发能力，擅长抄代码。\n\n## 项目经历\n\n1. 学校 - 国家大学生学情调查《NCSS》问卷系统 - 负责问卷数据导出分析软件开发 - 2020.02- 2020.04 \n    * 具体功能：将国家大学生学情调查《NCSS》问卷系统所收集的问卷数据进行处理分析及生成定制化分析报告。 \n    * 运用了Python、PYQT、CSS、MySQL等技术，技术难点是将dataframe类型数据保存成sav格式文件，这个小功能使用的是一个名为pyreadstat的第三方库，这个库在打包为exe文件时出现了问题，当时国内没有太多教程。\n    * 效果：勉强能用，毕竟当时才大一，刚开始学习，能搞定已经觉得很不错了。\n    * 因为是win软件，因此暂无演示地址。源码地址：[gitee地址](https://gitee.com/laboratory-15304/NCSS) \n\n2. 学校 - 喷码机赋码软件 - 负责软件开发 - 2020.04- 2020.06 \n    * 具体功能：根据协议生成序列码，当喷码机器获取序列码时，通过串口将序列码发送给机器。\n    * 运用了Python、PYQT、CSS、MySQL、Serial等技术，技术难点是提供的喷码机器dll库文件没有详细的接口说明；\n    * 勉强能用\n    * 因为是win软件，因此暂无演示地址。源码地址：[gitee地址](https://gitee.com/laboratory-15304/Prima) \n\n3. 学校 - 数字孪生-智慧校园 - 负责网页开发 - 201309- 201401 \n    * 具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。 \n    * 运用了VUE框架、Element组件库、THREEJS三维引擎库、MySQL数据库、MQTT协议、物联网通讯等技术，技术难点是ThreeJs库上手难度不低\n    * 效果不是很好，模型动辄上百兆，加载速度太慢了，而且网页渲染也不行，有时还内存溢出，后面直接换技术了。\n    * 这个虽说可以有演示地址，但是太大了，截个图算了。源码地址：[智慧校园-1](https://gitee.com/laboratory-15304/SmartCampusCqcet) - [智慧校园-2](https://gitee.com/laboratory-15304/SmartCampusTorch)\n\n3. 学校 - 数字孪生-智慧校园 - 负责程序开发 - 201309- 201401 \n    * 具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。\n    * 运用了Unity、MySQL数据库、物联网、PHP、ThinkPHP框架、ROS机器人操作系统等技术，技术难点是Unity上手难度也不低，使用很简单，用好就难了。\n    * 效果很好，基本秒加载，而且渲染也是真的棒。\n    * 因为是win软件，因此暂无演示地址。私有仓库，暂不提供源码地址。\n\n4. 学校 - 光化施工控制系统 - 负责软件开发 - 2021.10- 2022.04 \n    * 具体功能：win工控机软件界面开发，实现通过串口对plc设备控制、通过websocket协议与app端数据互通等功能\n    * 运用了Python、PYQT5、QSS、Serial、WebSocket等技术，技术难点是一个海康摄像头用120米的普通网线来连接，还经常断，pyqt5+opencv加我这半斤八两的技术水平应对这个情况太难了。\n    * 能用，但是因为plc给的数据不可靠，摄像头不稳定，所以效果一般般。\n    * 因为是win软件，因此暂无演示地址。源码地址：[光固化软件](https://gitee.com/laboratory-15304/Actinic-PC) - [光固化后端](https://gitee.com/laboratory-15304/actinic-server)  \n\n## 获奖经历\n* 竞赛 2019年12月 2019重庆市第十届大学生程序设计大赛 省部级三等奖\n* 竞赛 2021年9月 全国大学生数学建模竞赛 国家级二等奖\n* 竞赛 在其余专业性较弱的比赛中曾获省部级奖十余次，国家级奖一次\n* 专利证书 《一种并联连接机构及发电机组群控管理系统》和《一种通讯连接机构》 “实用新型专利”授权\n* 论文 《智能网联汽车的应用现状及发展》 《科学咨询》杂志社《科学咨询·科技人文》刊出\n\n## 个人账号 \n* [个人博客](http://辰雪博客.赵浩悦.我爱你)\n* [gitee](https://gitee.com/TsuiMengchao)\n\n## 其他信息 \n* 通过英语四级，基本可以理解英文的文档。\n* 使用过多种编程语言及其框架，并利用其进行过小型项目开发，入职后能更快适应工作需求，在必要时可以可以短期协助处理其它相关岗位的问题。\n* 有两年以上从事编程开发类项目的工作经验，进行过数次团队合作开发，能更好的对接工作。拥有良好的沟通能力和组织能力。 \n\n# 关于作者\n\n欢迎大家与我交流哦，微信扫描下方二维码并关注，即可与我联系。\n\n<img src=\"http://七牛云.辰雪博客.赵浩悦.我爱你/wechatQr.jpg\" data-img=\"1\" width=\"175\" height=\"175\">', 0, 1, 1, 1, NULL, 0, '2024-02-24 22:02:44', NULL, 1, 1, '');
INSERT INTO `blog_article` VALUES (16, '1', 32, '通过宝塔面板搭建环境及部署项目', 'https://img.btstu.cn/api/images/5cc53eda99910.jpg', '通过宝塔面板搭建环境及部署本博客项目', '<h1><a id=\"_0\"></a>宝塔面板安装及环境搭建</h1>\n<p>1、 登录你所购买阿里云服务器的账号，点击控制台-&gt;云服务器ecs<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423566428.png\" alt=\"image.png\" /></p>\n<p>2、 开通安全组开启端口<br />\n把需要访问的端口进行配置，选入方向（如：6379，8080，3306，80，21，22，443）<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423615632.png\" alt=\"image.png\" /></p>\n<p>3、 使用xshell或其它工具连接服务器（推荐阿里云自带的远程连接）<br />\n主机地址就是公网ip，密码是修改后的实例密码，用户名默认root，端口号默认22（此端口必须在配置安全组是进行开放否则无法连接到服务器）<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423677653.png\" alt=\"image.png\" /></p>\n<p>4、 安装宝塔面板，www.bt.cn(根据自己操作系统选择命令)<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423721034.png\" alt=\"image.png\" /><br />\n5、 在终端输入命令安装宝塔面板，例如我的如下：</p>\n<pre><code class=\"lang-prism\">yum install -y wget &amp;&amp; wget -O install.sh https://download.bt.cn/install/install_6.0.sh &amp;&amp; sh install.sh ed8484bec\n</code></pre>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423786688.png\" alt=\"image.png\" /><br />\n6、 中间出现的交互一律输入y即可，安装成功后控制台会出现 如下信息说明安装成功，请自行保存面板账户登录信息，这很重要。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423973751.png\" alt=\"edee5aa63c1f171d158391c7764d7b1c.png\" /><br />\n7、 登录宝塔面板<br />\n登录前需要在将阿里云安全组开放宝塔面板端口号，否则将无法访问。<br />\n每次安装自动占用的端口号都不同，请自行确认。<br />\n然后根据地址，账号密码进行登录（建议不要修改账号密码，以免遗忘）<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424269093.png\" alt=\"image.png\" /><br />\n第一次登录可以绑定自己的宝塔账号，以后可以扫码登录。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424317397.png\" alt=\"image.png\" /><br />\n登录成功后面板如下：<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424370011.png\" alt=\"image.png\" /></p>\n<p>8、 在宝塔面板进行环境搭建<br />\n首次安装登录会出现推荐安装套件弹窗，本项目直接选择JAVA项（第三个），极速安装，然后一键安装即可。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425051427.png\" alt=\"image.png\" /><br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425083740.png\" alt=\"image.png\" /><br />\n耐心等待几分钟，本项目所需要的绝大部分环境就自动安装完成了。</p>\n<p>9、 点击软件商店，搜索Redis进行安装<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710431221195.png\" alt=\"image.png\" /></p>\n<p>安装完成后需要将阿里云安全组和宝塔系统防火墙开关中项目所用到的端口全部开放，如果觉得两个地方都需要配置太麻烦，可以直接关闭宝塔面板的防火墙，只留阿里云安全组即可。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425271610.png\" alt=\"image.png\" /></p>\n<p>到这里为止，已经配置好了本项目所需的基本环境。</p>\n<h1><a id=\"_47\"></a>项目打包及部署</h1>\n<h2><a id=\"_49\"></a>打包</h2>\n<h3><a id=\"server_50\"></a>后端（server）</h3>\n<p>1、 将cxblog-main -&gt; src.main.java.resouces -&gt; config下的application.yml文件中的spring.profiles.active项的参数由 dev 改为 prod，完成开发环境到生产环境的切换。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425846113.png\" alt=\"image.png\" /><br />\n2、 按照实际情况修改 application-prod.yml 文件内容，然后在maven中点击install进行打包。（默认已完成mvn-&gt;compile构建）<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425949703.png\" alt=\"image.png\" /><br />\n3、 打包完成后在 cxblog-main -&gt; target 下会产生名为 cxblog-main-<em>.</em>.jar 的文件，这就是需要部署的最终文件。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426135960.png\" alt=\"image.png\" /></p>\n<h3><a id=\"web_57\"></a>博客端（web）</h3>\n<p>1、 在终端中输入 npm run build 并回车执行，耐心等待打包完成即可。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426286852.png\" alt=\"image.png\" /><br />\n2、 打包完成后 web 项目的根目录下会出现一个名为 web 的目录，这就是需要部署的最终目录。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426442096.png\" alt=\"image.png\" /></p>\n<h3><a id=\"admin_62\"></a>管理端（admin）</h3>\n<p>1、 打包命令替换为 npm run build:prod ，最终打包完成目录为 admin，其余与博客端一致。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426517366.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>注</strong>：本项目为了保持url的间接，默认使用history模式，可自行更改为hash模式。</p>\n</blockquote>\n<p>到这里本项目的打包就完成了。</p>\n<h2><a id=\"_70\"></a>部署</h2>\n<p>首先，将打包完成的三个文件或目录上传到服务器的根目录，linux默认是 /www/wwwroot 目录，我这里为了兼顾其它项目，最终上传到了 /www/wwwroot/mcx/cxblog 目录下。<br />\n上传可以在宝塔面板-&gt;文件中完成，可以根据实际情况选择文件或目录方式上传。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426827504.png\" alt=\"image.png\" /><br />\n上传完成后如下所示：<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427123341.png\" alt=\"image.png\" /></p>\n<h3><a id=\"server_76\"></a>后端（server）</h3>\n<p>1、选择 网站 -&gt; Java项目 -&gt; 添加java项目<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427252561.png\" alt=\"image.png\" /><br />\n2、 添加/选择正确的项目jar路径和项目端口<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427341118.png\" alt=\"image.png\" /><br />\n3、 如果有域名也可以添加进来<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427531395.png\" alt=\"image.png\" /><br />\n4、 提交即可，如果有添加自己的域名，务必保证外网映射开启，否则域名访问无效<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430084767.png\" alt=\"image.png\" /><br />\n5、 点击 数据库-&gt;添加数据库，按照自己实际填写<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429516879.png\" alt=\"image.png\" /><br />\n6、 添加成功后如下：<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429643126.png\" alt=\"image.png\" /><br />\n7、 点击备份栏下的导入，从本地上传目录cxblog/sql/cxblog.sql文件并导入<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429752420.png\" alt=\"image.png\" /><br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429804623.png\" alt=\"image.png\" /></p>\n<h3><a id=\"web_93\"></a>博客端（web）</h3>\n<p>1、选择 网站 -&gt; PHP项目 -&gt; 添加站点，然后填写域名和正确的网站根目录即可。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427724965.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>注</strong>：ip:port的域名确定项目实际运行端口，domain后面就不要加端口了，否则domain:port的方式访问岂不是很奇怪，比如www.baidu.com:8020，应该没有人这样设置吧哈哈哈哈。</p>\n</blockquote>\n<p>2、 如果前端项目采用的history需要配置伪静态，否则如何直接访问url下分支会出现404。</p>\n<pre><code class=\"lang-\">location / {\n  try_files $uri $uri/ @router;\n  index  index.html;\n}\nlocation @router {\n  rewrite ^.*$ /index.html last;\n}  \n</code></pre>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430595442.png\" alt=\"image.png\" /></p>\n<h3><a id=\"admin_111\"></a>管理端（admin）</h3>\n<p>1、 跟博客端一样，暂不演示了。</p>\n<p>访问公网ip:port或者域名就能正常访问到本项目了。</p>\n<p>到这里本项目的部署就完成了。</p>\n<h1><a id=\"Bye_118\"></a>Bye</h1>\n', '# 宝塔面板安装及环境搭建\n\n1、 登录你所购买阿里云服务器的账号，点击控制台->云服务器ecs  \n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423566428.png)\n\n2、 开通安全组开启端口  \n把需要访问的端口进行配置，选入方向（如：6379，8080，3306，80，21，22，443）\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423615632.png)\n\n3、 使用xshell或其它工具连接服务器（推荐阿里云自带的远程连接）  \n主机地址就是公网ip，密码是修改后的实例密码，用户名默认root，端口号默认22（此端口必须在配置安全组是进行开放否则无法连接到服务器）  \n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423677653.png)\n\n4、 安装宝塔面板，www.bt.cn(根据自己操作系统选择命令)  \n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423721034.png)\n5、 在终端输入命令安装宝塔面板，例如我的如下：\n\n```prism language-bash\nyum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec\n```\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423786688.png)\n6、 中间出现的交互一律输入y即可，安装成功后控制台会出现 如下信息说明安装成功，请自行保存面板账户登录信息，这很重要。  \n![edee5aa63c1f171d158391c7764d7b1c.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423973751.png)\n7、 登录宝塔面板  \n登录前需要在将阿里云安全组开放宝塔面板端口号，否则将无法访问。\n每次安装自动占用的端口号都不同，请自行确认。\n然后根据地址，账号密码进行登录（建议不要修改账号密码，以免遗忘）  \n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424269093.png)\n第一次登录可以绑定自己的宝塔账号，以后可以扫码登录。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424317397.png)\n登录成功后面板如下：\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424370011.png)\n\n8、 在宝塔面板进行环境搭建\n首次安装登录会出现推荐安装套件弹窗，本项目直接选择JAVA项（第三个），极速安装，然后一键安装即可。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425051427.png)\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425083740.png)  \n耐心等待几分钟，本项目所需要的绝大部分环境就自动安装完成了。\n\n9、 点击软件商店，搜索Redis进行安装\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710431221195.png)\n\n安装完成后需要将阿里云安全组和宝塔系统防火墙开关中项目所用到的端口全部开放，如果觉得两个地方都需要配置太麻烦，可以直接关闭宝塔面板的防火墙，只留阿里云安全组即可。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425271610.png)\n\n到这里为止，已经配置好了本项目所需的基本环境。\n\n# 项目打包及部署\n\n## 打包\n### 后端（server）\n1、 将cxblog-main -> src.main.java.resouces -> config下的application.yml文件中的spring.profiles.active项的参数由 dev 改为 prod，完成开发环境到生产环境的切换。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425846113.png)\n2、 按照实际情况修改 application-prod.yml 文件内容，然后在maven中点击install进行打包。（默认已完成mvn->compile构建）\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425949703.png)\n3、 打包完成后在 cxblog-main -> target 下会产生名为 cxblog-main-*.*.jar 的文件，这就是需要部署的最终文件。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426135960.png)\n### 博客端（web）\n1、 在终端中输入 npm run build 并回车执行，耐心等待打包完成即可。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426286852.png)\n2、 打包完成后 web 项目的根目录下会出现一个名为 web 的目录，这就是需要部署的最终目录。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426442096.png)\n### 管理端（admin）\n1、 打包命令替换为 npm run build:prod ，最终打包完成目录为 admin，其余与博客端一致。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426517366.png)\n\n>**注**：本项目为了保持url的间接，默认使用history模式，可自行更改为hash模式。\n\n到这里本项目的打包就完成了。\n\n## 部署\n首先，将打包完成的三个文件或目录上传到服务器的根目录，linux默认是 /www/wwwroot 目录，我这里为了兼顾其它项目，最终上传到了 /www/wwwroot/mcx/cxblog 目录下。\n上传可以在宝塔面板->文件中完成，可以根据实际情况选择文件或目录方式上传。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426827504.png)\n上传完成后如下所示：\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427123341.png)\n### 后端（server）\n1、选择 网站 -> Java项目 -> 添加java项目\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427252561.png)\n2、 添加/选择正确的项目jar路径和项目端口\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427341118.png)\n3、 如果有域名也可以添加进来\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427531395.png)\n4、 提交即可，如果有添加自己的域名，务必保证外网映射开启，否则域名访问无效\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430084767.png)\n5、 点击 数据库->添加数据库，按照自己实际填写\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429516879.png)\n6、 添加成功后如下：\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429643126.png)\n7、 点击备份栏下的导入，从本地上传目录cxblog/sql/cxblog.sql文件并导入\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429752420.png)\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429804623.png)\n\n### 博客端（web）\n1、选择 网站 -> PHP项目 -> 添加站点，然后填写域名和正确的网站根目录即可。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427724965.png)\n>**注**：ip:port的域名确定项目实际运行端口，domain后面就不要加端口了，否则domain:port的方式访问岂不是很奇怪，比如www.baidu.com:8020，应该没有人这样设置吧哈哈哈哈。\n\n2、 如果前端项目采用的history需要配置伪静态，否则如何直接访问url下分支会出现404。\n```\nlocation / {\n  try_files $uri $uri/ @router;\n  index  index.html;\n}\nlocation @router {\n  rewrite ^.*$ /index.html last;\n}  \n```\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430595442.png)\n\n\n### 管理端（admin）\n1、 跟博客端一样，暂不演示了。\n\n访问公网ip:port或者域名就能正常访问到本项目了。\n\n到这里本项目的部署就完成了。\n\n# Bye', 0, 1, 1, 1, '', 0, '2024-03-14 23:49:20', NULL, 1, 1, '宝塔，部署');
INSERT INTO `blog_article` VALUES (17, '1', 32, '使用docket搭建环境', '', '通过宝塔使用docket搭建本博客项目运行环境', '<h1><a id=\"_Docker_0\"></a>一、宝塔面板一键安装 Docker</h1>\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\" alt=\"image.png\" /><br />\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\" alt=\"image.png\" /><br />\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketmysql_7\"></a>使用docket安装mysql</h1>\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\" alt=\"image.png\" /><br />\n或者在终端中使用以下命令拉取镜像：</p>\n<pre><code class=\"lang-\">docker pull mysql:5.7\n</code></pre>\n<p>2、 拉取完成后如下所示<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\" alt=\"image.png\" /><br />\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\" alt=\"image.png\" /><br />\n或者使用命令创建</p>\n<pre><code class=\"lang-\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\n|命令|描述|<br />\n|-|-|<br />\n|docker run|创建一个新的容器 , 同时运行这个容器|<br />\n|–name mysql|启动容器的名字|<br />\n|-d|后台运行|<br />\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|<br />\n|–restart unless-stopped	| 容器重启策略|<br />\n|-v /mydata/mysql/log:/var/log/mysql|	将日志文件夹挂载到主机|<br />\n|-v /mydata/mysql/data:/var/lib/mysql	|将mysql储存文件夹挂载到主机|<br />\n|-v /mydata/mysql/conf:/etc/mysql|	将配置文件夹挂载到主机|<br />\n|-e MYSQL_ROOT_PASSWORD=root|	 设置 root 用户的密码|<br />\n|mysql:5.7|	 启动哪个版本的 mysql (本地镜像的版本)|<br />\n|\\|shell 命令换行符|<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\" alt=\"image.png\" /><br />\n4、 创建完成后如下所示<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\" alt=\"image.png\" /><br />\n5、 使用命令尝试进入容器内部</p>\n</blockquote>\n<pre><code class=\"lang-\">## 通过Docker命令进入Mysql容器内部\ndocker exec -it mysql-docket /bin/bash\n## 或者\ndocker exec -it mysql-docket bash\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，请修改成自己的容器名。</p>\n</blockquote>\n<p>并尝试连接数据库，检验是否安装完成<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketredis_51\"></a>使用docket安装redis</h1>\n<p>1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket-&gt;云端镜像-&gt;搜索redis，任选一个进行下载</p>\n<blockquote>\n<p><strong>注：</strong> 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到</p>\n</blockquote>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png\" alt=\"image.png\" /><br />\n2、新建挂载文件夹（路径自己定即可）</p>\n<pre><code class=\"lang-\">mkdir -p /root/docker/redis/data\nmkdir -p /root/docker/redis/conf\n</code></pre>\n<p>3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入</p>\n<pre><code class=\"lang-\">#bind 127.0.0.1 //允许远程连接\nprotected-mode no //配置保护\nappendonly yes //持久化\nrequirepass 123456 //密码\n</code></pre>\n<p>4、 创建容器，点击容器-&gt;创建容器<br />\n手动创建方式：<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png\" alt=\"image.png\" /><br />\n命令创建方式：</p>\n<pre><code class=\"lang-\">docker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，可以根据自己习惯自行命名。</p>\n</blockquote>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png\" alt=\"image.png\" /><br />\n5、 创建完成后如下<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png\" alt=\"image.png\" /><br />\n6、 在终端中输入以下命令，进入redis</p>\n<pre><code class=\"lang-\">docker exec -it redis-docket redis-cli\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，请修改成自己的容器名。</p>\n</blockquote>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketjdk8_88\"></a>使用docket安装jdk8</h1>\n<p>1、 搜索并拉取jdk8镜像<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png\" alt=\"image.png\" /><br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png\" alt=\"image.png\" /><br />\n2、 根据镜像创建容器<br />\n手动创建方法<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png\" alt=\"image.png\" /></p>\n<pre><code class=\"lang-\">docker run -di --name=jdk8-docket ascdc/jdk8\n</code></pre>\n<blockquote>\n<p><strong>注意</strong> 容器名和镜像名根据自己实际情况修改</p>\n</blockquote>\n<p><img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png\" alt=\"image.png\" /><br />\n3、 创建完成如下<br />\n<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png\" alt=\"image.png\" /><br />\n4、 输入以下命令进入容器</p>\n<pre><code class=\"lang-\">docker exec -it jdk8-docket /bin/bash\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。</p>\n</blockquote>\n<p>到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章<a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16\" target=\"_blank\">《通过宝塔面板搭建环境及部署项目》</a>。</p>\n<h1><a id=\"Bye_112\"></a>Bye</h1>\n', '# 一、宝塔面板一键安装 Docker\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\n随意选择一个镜像源进行安装，我选择的阿里云源\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\n# 使用docket安装mysql\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\n或者在终端中使用以下命令拉取镜像：\n```\ndocker pull mysql:5.7\n```\n2、 拉取完成后如下所示\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\n或者使用命令创建\n```\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n```\n> **注意：** mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。\n|命令|描述|\n|-|-|\n|docker run|创建一个新的容器 , 同时运行这个容器|\n|–name mysql|启动容器的名字|\n|-d|后台运行|\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\n|–restart unless-stopped	| 容器重启策略|\n|-v /mydata/mysql/log:/var/log/mysql|	将日志文件夹挂载到主机|\n|-v /mydata/mysql/data:/var/lib/mysql	|将mysql储存文件夹挂载到主机|\n|-v /mydata/mysql/conf:/etc/mysql|	将配置文件夹挂载到主机|\n|-e MYSQL_ROOT_PASSWORD=root|	 设置 root 用户的密码|\n|mysql:5.7|	 启动哪个版本的 mysql (本地镜像的版本)|\n|\\\\|shell 命令换行符|\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\n4、 创建完成后如下所示\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\n5、 使用命令尝试进入容器内部\n```\n## 通过Docker命令进入Mysql容器内部\ndocker exec -it mysql-docket /bin/bash\n## 或者\ndocker exec -it mysql-docket bash\n```\n> **注意：** mysql-docket是我的redis容器名称，请修改成自己的容器名。\n\n并尝试连接数据库，检验是否安装完成\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\n\n# 使用docket安装redis\n1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket->云端镜像->搜索redis，任选一个进行下载\n> **注：** 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到\n\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png)\n2、新建挂载文件夹（路径自己定即可）\n```\nmkdir -p /root/docker/redis/data\nmkdir -p /root/docker/redis/conf\n```\n3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入\n```\n#bind 127.0.0.1 //允许远程连接\nprotected-mode no //配置保护\nappendonly yes //持久化\nrequirepass 123456 //密码\n```\n4、 创建容器，点击容器->创建容器\n手动创建方式：\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png)\n命令创建方式：\n```\ndocker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\n```\n> **注意：** redis-docket是我的redis容器名称，可以根据自己习惯自行命名。\n\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png)\n5、 创建完成后如下\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png)\n6、 在终端中输入以下命令，进入redis\n```\ndocker exec -it redis-docket redis-cli\n```\n> **注意：** redis-docket是我的redis容器名称，请修改成自己的容器名。\n\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png)\n\n# 使用docket安装jdk8\n1、 搜索并拉取jdk8镜像\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png)\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png)\n2、 根据镜像创建容器\n手动创建方法\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png)\n```\ndocker run -di --name=jdk8-docket ascdc/jdk8\n```\n> **注意** 容器名和镜像名根据自己实际情况修改\n\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png)\n3、 创建完成如下\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png)\n4、 输入以下命令进入容器\n```\ndocker exec -it jdk8-docket /bin/bash\n```\n> **注意：** jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。\n\n到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章[《通过宝塔面板搭建环境及部署项目》](http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16)。\n\n# Bye', 0, 1, 1, 1, NULL, 0, '2024-03-15 12:46:36', NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fk_article_tag_1`(`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 940 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (919, 1, 10);
INSERT INTO `blog_article_tag` VALUES (920, 1, 65);
INSERT INTO `blog_article_tag` VALUES (917, 2, 10);
INSERT INTO `blog_article_tag` VALUES (918, 2, 64);
INSERT INTO `blog_article_tag` VALUES (932, 16, 10);
INSERT INTO `blog_article_tag` VALUES (939, 17, 10);

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `click_volume` int(11) NULL DEFAULT 0,
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_name`(`name`) USING BTREE COMMENT '博客分类名称'
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (32, '博客文档', 0, 0, '2024-02-24 22:06:35', '2024-02-24 22:06:35', 'el-icon-document');
INSERT INTO `blog_category` VALUES (33, '项目详情', 0, 1, '2024-02-24 22:06:35', '2024-02-24 22:13:07', 'el-icon-suitcase');

-- ----------------------------
-- Table structure for blog_collect
-- ----------------------------
DROP TABLE IF EXISTS `blog_collect`;
CREATE TABLE `blog_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_collect
-- ----------------------------

-- ----------------------------
-- Table structure for blog_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论人ID',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `reply_user_id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复人id',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `browser` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `system` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `system_version` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_emoji
-- ----------------------------
DROP TABLE IF EXISTS `blog_emoji`;
CREATE TABLE `blog_emoji`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表情url地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `is_stick` int(11) NULL DEFAULT NULL COMMENT '是否置顶',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '表情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_emoji
-- ----------------------------

-- ----------------------------
-- Table structure for blog_feed_back
-- ----------------------------
DROP TABLE IF EXISTS `blog_feed_back`;
CREATE TABLE `blog_feed_back`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细内容',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `type` int(11) NOT NULL COMMENT '反馈类型 1:需求 2：缺陷',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0未解决 1解决',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_feed_back
-- ----------------------------

-- ----------------------------
-- Table structure for blog_followed
-- ----------------------------
DROP TABLE IF EXISTS `blog_followed`;
CREATE TABLE `blog_followed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '用户id',
  `followed_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '关注的用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_followed
-- ----------------------------

-- ----------------------------
-- Table structure for blog_forum
-- ----------------------------
DROP TABLE IF EXISTS `blog_forum`;
CREATE TABLE `blog_forum`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `talk_id` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `site` json NULL COMMENT '关联网页信息',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联图片地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_forum
-- ----------------------------
INSERT INTO `blog_forum` VALUES (1, '4', 1, '我不是原批，我真的不是原批。<img src=\"https://res.wx.qq.com/mpres/htmledition/images/icon/emotion/0.gif\" style=\"vertical-align: middle; margin-left: 2px; margin-right: 2px; height: 25px; width: 25px;\">', '{\"url\": \"https://ys.mihoyo.com\", \"title\": \"原神，启动。\"}', '', '2024-03-14 12:20:51');
INSERT INTO `blog_forum` VALUES (7, '4', 2, '尝试一下用宝塔+docket部署本博客项目。功能待添加简讯模块和音乐播放模块。', NULL, '', '2024-03-15 12:20:55');

-- ----------------------------
-- Table structure for blog_forum_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_forum_comment`;
CREATE TABLE `blog_forum_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论用户id',
  `reply_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回复用户id',
  `forum_id` int(11) NULL DEFAULT NULL COMMENT '话题id',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip归属地',
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_forum_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_forum_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_forum_like`;
CREATE TABLE `blog_forum_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `forum_id` int(11) NULL DEFAULT NULL COMMENT '圈子内容id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子内容点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_forum_like
-- ----------------------------

-- ----------------------------
-- Table structure for blog_friend_link
-- ----------------------------
DROP TABLE IF EXISTS `blog_friend_link`;
CREATE TABLE `blog_friend_link`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站名称',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站地址',
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站头像地址',
  `info` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站描述',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下架原因',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT 'ENUM-状态:\"0,下架;1,申请;2:上架\"',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_friend_link
-- ----------------------------
INSERT INTO `blog_friend_link` VALUES (4, '辰雪博客', 'http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9cf1222617fd4fa197991476a53cc883.jpg', '正在努力搬砖~~~~', 'tsuimengchao@aliyun.com', 4, NULL, 2, '2022-12-13 09:16:15', '2022-12-13 09:16:15');
INSERT INTO `blog_friend_link` VALUES (5, '拾壹博客', 'https://www.shiyit.com', 'https://img.shiyit.com/logo11.png', '一个专注技术分享的平台', '1248954763@qq.com', 3, NULL, 2, NULL, '2024-01-26 11:22:17');
INSERT INTO `blog_friend_link` VALUES (6, 'ELADMIN', 'https://eladmin.vip/', 'https://eladmin.vip/logo/small.png', '一个简单且易上手的 Spring boot 后台管理框架', NULL, 2, NULL, 2, NULL, '2024-01-26 11:25:57');

-- ----------------------------
-- Table structure for blog_im_message
-- ----------------------------
DROP TABLE IF EXISTS `blog_im_message`;
CREATE TABLE `blog_im_message`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NOT NULL COMMENT '主键',
  `to_user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '发送用户id',
  `from_user_id` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '接收用户id',
  `to_user_avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '发送用户头像',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL COMMENT '发送内容',
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `ip_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '发送用户ip',
  `is_withdraw` int(1) NULL DEFAULT 0 COMMENT '消息是否撤回 0：未撤回  1：撤回',
  `is_read` int(1) NULL DEFAULT 0 COMMENT '是否已读',
  `type` int(1) NULL DEFAULT NULL COMMENT '消息类型 1普通消息 2图片',
  `code` int(1) NULL DEFAULT NULL,
  `article_id` int(11) NULL DEFAULT NULL COMMENT '文章id',
  `notice_type` int(11) NULL DEFAULT NULL COMMENT '通知类型 0系统通知 1：评论 2：关注 3点赞 4收藏 5私信',
  `comment_mark` int(11) NULL DEFAULT NULL COMMENT '评论标记 1回复评论 2发表评论',
  `at_user_id` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL DEFAULT NULL COMMENT '@用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_im_message
-- ----------------------------
INSERT INTO `blog_im_message` VALUES ('662c6831245ccc49747b4d7e9cbcbf6d', '1', '1', NULL, '恭喜您发布了一篇文章', NULL, '未知', '123.147.247.111', 0, 0, NULL, 5, NULL, 0, NULL, NULL);

-- ----------------------------
-- Table structure for blog_im_room
-- ----------------------------
DROP TABLE IF EXISTS `blog_im_room`;
CREATE TABLE `blog_im_room`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `type` int(11) NOT NULL COMMENT '房间类型 0：群聊 1私聊',
  `from_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所属用户id',
  `to_user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收用户id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息房间表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_im_room
-- ----------------------------

-- ----------------------------
-- Table structure for blog_message
-- ----------------------------
DROP TABLE IF EXISTS `blog_message`;
CREATE TABLE `blog_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time` tinyint(10) NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL COMMENT '状态 0:审核  1：正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_message
-- ----------------------------
INSERT INTO `blog_message` VALUES (2, '原神·启动', '2024-03-15 12:21:56', '崔梦超', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png', '123.147.247.111', '未知', 20, 1);

-- ----------------------------
-- Table structure for blog_navigation
-- ----------------------------
DROP TABLE IF EXISTS `blog_navigation`;
CREATE TABLE `blog_navigation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `site_class_id` int(11) NOT NULL COMMENT '网站分类id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网站标题',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址地址',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站logo',
  `info` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网站描述',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站导航表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_navigation
-- ----------------------------
INSERT INTO `blog_navigation` VALUES (1, 1, '博客园', 'https://www.cnblog_demos.com/', 'http://img.shiyit.com/50708941a28144479fc624e9a84c4773.png', '开发者的网上家园', '2023-08-01 09:00:19', '2023-08-01 09:00:21');
INSERT INTO `blog_navigation` VALUES (2, 1, 'CSDN', 'https://www.csdn.net/', 'http://cxy521.com/static/img/index/tech/csdn.png', '中文最大的技术社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (3, 1, '开源中国', 'https://www.oschina.net/', 'http://cxy521.com/static/img/index/tech/oschina.ico', '目前国内最大的开源技术社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (4, 1, '掘金', 'https://juejin.cn/', 'http://cxy521.com/static/img/index/tech/juejin.png', '一个帮助开发者成长的社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (5, 1, 'StackOverflow', 'https://stackoverflow.com/', 'http://cxy521.com/static/img/index/tech/stackoverflow.svg', '全球最大的技术问答社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (6, 1, '简书', 'https://www.jianshu.com/', 'http://img.shiyit.com/14e0d6d549664ee0a02ba6205fa0bb86.jpg', '创作你的创作', NULL, '2023-08-03 09:02:07');
INSERT INTO `blog_navigation` VALUES (10, 2, 'Cron表达式', 'https://www.matools.com/cron/', 'http://img.shiyit.com/c2408e7dd86d41478bf36c66869966a1.jpg', '在线Cron表达式生成器', '2023-08-03 11:12:31', NULL);
INSERT INTO `blog_navigation` VALUES (11, 7, 'Element UI', 'https://element.eleme.cn/#/zh-CN', 'http://img.shiyit.com/7ea049e2eadb4505b1775cd558cd3d0f.jpg', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库', '2023-08-03 11:17:58', NULL);
INSERT INTO `blog_navigation` VALUES (12, 7, 'Vue.js', 'https://vuejs.org/', 'http://img.shiyit.com/d0c356bfecc2463aaf1841d4708a222b.png', '渐进式JavaScript框架、流行的前端开发框架！', '2023-08-03 11:19:27', NULL);
INSERT INTO `blog_navigation` VALUES (13, 2, '正则表达式', 'https://tool.oschina.net/regex/', 'http://cxy521.com/static/img/index/tool/oschina.ico', '在线正则表达式测试', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (14, 2, '加密解密', 'https://tool.oschina.net/encrypt', 'http://cxy521.com/static/img/index/tech/oschina.ico', '在线加密解密', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (15, 9, '\r\nIntelliJ IDEA', 'https://www.jetbrains.com/idea/', 'http://cxy521.com/static/img/index/devtool/idea.png', 'Java 最好用的编程工具！', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (16, 9, 'Navicat', 'https://www.navicat.com.cn/download/navicat-premium', 'http://cxy521.com/static/img/index/devtool/navicat.png', '数据库常用客户端工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (17, 9, 'ApiPost', 'https://www.apipost.cn/download.html', 'http://cxy521.com/static/img/index/devtool/apipost.ico', ' 一个支持模拟POST、GET、PUT等常见HTTP请求，支持团队协作，并可直接生成并导出接口文档的API调试、管理工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (18, 9, 'Snipaste', 'https://www.snipaste.com/', 'http://cxy521.com/static/img/index/devtool/Snipaste.jpg', '便捷的截图工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (19, 3, '站长之家', 'https://tool.chinaz.com/', 'http://cxy521.com/static/img/index/webmaster/cz.ico', '站长工具是站长的必备工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (20, 3, '网站排名', 'http://www.alexa.cn/', 'http://cxy521.com/static/img/index/webmaster/alexa.png', 'Alexa网站流量全球综合排名查询', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (21, 3, '免费CDN', 'https://www.bootcdn.cn/', 'http://cxy521.com/static/img/index/webmaster/bootcdn.ico', '中文网开源项目免费 CDN 加速服务', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (22, 3, 'BOCE', 'https://www.boce.com/', 'http://cxy521.com/static/img/index/webmaster/boce.ico', '网站测速工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (23, 3, '小码短链接', 'https://xiaomark.com/', 'http://cxy521.com/static/img/index/webmaster/xm.png', '短网址跳转工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (24, 3, '百度统计', 'https://tongji.baidu.com/web5/welcome/login', 'http://cxy521.com/static/img/index/media/baidu.png', '领先的中文网站分析平台', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (25, 2, '码云', 'https://gitee.com/', 'https://img1.baidu.com/it/u=3680586942,1726414622&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500', '专注于技术开源项目的托管、发布、协作的平台', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (26, 7, 'Vite.js', 'https://vitejs.cn/', 'http://img.shiyit.com/e0145d50d31744a487ff3ffc696fc10e.png', '下一代前端开发与构建工具', NULL, '2023-08-24 16:43:54');
INSERT INTO `blog_navigation` VALUES (27, 7, 'uni-app', 'https://uniapp.dcloud.net.cn/', 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/uni-app.png', '领先的跨平台开发框架，一套代码多端使用', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (28, 9, 'Visual Studio Code', 'https://code.visualstudio.com/', 'https://pic2.zhimg.com/v2-225fbbe09689a4a3219ae1e00fe2280b_1440w.jpg?source=172ae18b', '前端人员热爱的轻量级开发工具', NULL, '2023-08-24 16:53:44');

-- ----------------------------
-- Table structure for blog_prop
-- ----------------------------
DROP TABLE IF EXISTS `blog_prop`;
CREATE TABLE `blog_prop`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `max_num` int(11) NULL DEFAULT NULL COMMENT '拥有最大上限',
  `type` int(11) NOT NULL COMMENT '类型 1:补签卡 2:积分',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '道具表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_prop
-- ----------------------------
INSERT INTO `blog_prop` VALUES (1, '补签卡', 9999, 1, '2023-07-13 16:33:59');

-- ----------------------------
-- Table structure for blog_say
-- ----------------------------
DROP TABLE IF EXISTS `blog_say`;
CREATE TABLE `blog_say`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '主键id',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `img_url` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '图片地址 逗号分隔  最多九张',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发表地址。可输入或者地图插件选择',
  `is_public` int(11) NULL DEFAULT NULL COMMENT '是否开放查看  0未开放 1开放',
  `create_time` datetime NOT NULL COMMENT '发表时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '说说表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_say
-- ----------------------------
INSERT INTO `blog_say` VALUES ('a51b103f11e8103f70210f111df68618', '4', '', '昨晚为了续费服务器，把收费镜像换成了免费公共镜像，结果实例的原云盘被释放了，然后我才意识到数据库还没备份。\n实例快照也无法回滚，只能新建云盘，按量付费需要保证账户余额大于100，充钱并搞了好久之后终于拿到了快照里面的数据，但是数据只到3/4，差了10天，完全没有用了。\n毁灭吧！', '重庆·南岸', 1, '2024-03-15 12:14:18', NULL);
INSERT INTO `blog_say` VALUES ('ccd2b737c04ff8a2a1f8f382b568c1ae', '4', '', '昨天尝试了一下在宝塔中使用Docker来配置运行环境，发现docker确实简化了不少步骤，只需pull和run两步即可，简易程度不输宝塔面板。\n宝塔面板很方便，Docker也很方便。但是，但是总觉得在宝塔里面安装Docker以及用Docker安装宝塔面板是不是有点多此一举了。\n两者都可以极简的配置运行环境，各有优劣，所以我还是暂时用宝塔吧。', '重庆·南岸', 1, '2024-03-16 21:22:06', NULL);

-- ----------------------------
-- Table structure for blog_say_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_say_comment`;
CREATE TABLE `blog_say_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `say_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '说说id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `reply_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回复用户id',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '说说评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_say_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_sign
-- ----------------------------
DROP TABLE IF EXISTS `blog_sign`;
CREATE TABLE `blog_sign`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `create_time` date NOT NULL COMMENT '签到时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sign
-- ----------------------------
INSERT INTO `blog_sign` VALUES ('9d146e810124317f783695a0b1d9fb41', '4', '2024-02-27');
INSERT INTO `blog_sign` VALUES ('e3b83962df1a40844a5d7cf71634f0d4', '2', '2024-01-27');

-- ----------------------------
-- Table structure for blog_site_class
-- ----------------------------
DROP TABLE IF EXISTS `blog_site_class`;
CREATE TABLE `blog_site_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '网址分类名',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网址分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_site_class
-- ----------------------------
INSERT INTO `blog_site_class` VALUES (1, '技术社区', 9, '2023-08-02 15:05:57', '2023-08-02 15:08:13');
INSERT INTO `blog_site_class` VALUES (2, '常用推荐', 10, '2023-08-02 15:05:57', '2023-08-03 09:06:56');
INSERT INTO `blog_site_class` VALUES (3, '站长工具', 6, '2023-08-02 15:05:57', '2023-08-03 09:07:13');
INSERT INTO `blog_site_class` VALUES (7, '前端开发', 7, '2023-08-02 15:14:10', '2023-08-03 09:07:10');
INSERT INTO `blog_site_class` VALUES (8, '后端开发', 8, '2023-08-02 15:14:16', '2023-08-03 09:07:08');
INSERT INTO `blog_site_class` VALUES (9, '开发工具', 9, '2023-08-15 10:36:56', NULL);

-- ----------------------------
-- Table structure for blog_sponsor
-- ----------------------------
DROP TABLE IF EXISTS `blog_sponsor`;
CREATE TABLE `blog_sponsor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `pay_img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付图片',
  `money` decimal(10, 2) NULL DEFAULT NULL COMMENT '打赏金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态 0 审核  1 通过 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '打赏记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_sponsor
-- ----------------------------

-- ----------------------------
-- Table structure for blog_system_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_system_config`;
CREATE TABLE `blog_system_config`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `qi_niu_access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云公钥',
  `qi_niu_secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云私钥',
  `qi_niu_area` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云存储区域 华东（z0），华北(z1)，华南(z2)，北美(na0)，东南亚(as0)',
  `qi_niu_bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云上传空间',
  `qi_niu_picture_base_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '七牛云域名前缀：http://images.moguit.cn',
  `upload_qi_niu` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件上传七牛云(0:否， 1:是)',
  `open_email_activate` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否开启注册用户邮件激活(0:否， 1:是)',
  `start_email_notification` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启邮件通知(0:否， 1:是)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `open_dashboard_notification` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '是否开启仪表盘通知(0:否， 1:是)',
  `dashboard_notification_md` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '仪表盘通知【用于首次登录弹框】MD',
  `dashboard_notification` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '仪表盘通知【用于首次登录弹框】',
  `search_model` int(1) NOT NULL DEFAULT 0 COMMENT '搜索模式【0:SQL搜索 、1：全文检索】',
  `email_host` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `email_username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱发件人',
  `email_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱授权码',
  `email_port` int(10) NULL DEFAULT NULL COMMENT '邮箱发送端口',
  `open_email` int(1) NULL DEFAULT NULL COMMENT '启用邮箱发送',
  `local_file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '本地文件地址',
  `file_upload_way` int(1) NULL DEFAULT NULL COMMENT '文件上传方式 1:本地 2：七牛云',
  `ali_yun_access_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云ak',
  `ali_yun_secret_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云sk',
  `ali_yun_bucket` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云存储桶名',
  `ali_yun_endpoint` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '阿里云Endpoint',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_system_config
-- ----------------------------
INSERT INTO `blog_system_config` VALUES (2, 'AWmtGNZuK4WJ1oCP9ScfgdaLQoIUbeEZGAVDmHs5', 'pqrEyEp3ngG62J7X1pfKy9R0eUuBEBQAwFOvOOZY', 'z2', 'mcx-blog', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl', '1', '1', '1', '2021-11-26 15:41:36', '2021-11-26 15:41:36', '1', '欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~\n\n博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。\n\n项目源码：[点我传送](https://gitee.com/TsuiMengchao/cxblog)，项目官网：[点我传送](http://辰雪博客.赵浩悦.我爱你)\n\n项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈\n\n欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）\n|支付宝|微信|\n|-|-|-|\n|![支付宝](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg)|![微信](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg)|\n', '<p>欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n<p>博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。</p>\n<p>项目源码：<a href=\"https://gitee.com/mcxgitee\" target=\"_blank\">点我传送</a>，项目官网：<a href=\"http://www.mcx.com\" target=\"_blank\">点我传送</a></p>\n<p>项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈</p>\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps… 小伙伴赞赏的时候可以备注一下下~）</p>\n<table>\n<thead>\n<tr>\n<th>支付宝</th>\n<th>微信</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"\" alt=\"支付宝\" /></td>\n<td><img src=\"\" alt=\"微信\" /></td>\n</tr>\n</tbody>\n</table>\n', 1, 'smtp.qq.com', 'tsuimengchao@qq.com', 'yqywkafvxrdbcbeb', 587, 1, 'http://localhost:80/img/', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for blog_tags
-- ----------------------------
DROP TABLE IF EXISTS `blog_tags`;
CREATE TABLE `blog_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  `click_volume` int(10) NULL DEFAULT 0,
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tag_name`(`name`) USING BTREE COMMENT '博客标签名称'
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES (10, '博客', 679, 9, '2021-11-12 14:43:27', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (64, '简历', 0, 0, NULL, '2024-02-24 22:10:43');
INSERT INTO `blog_tags` VALUES (65, '项目', 0, 0, NULL, '2024-02-24 22:10:53');

-- ----------------------------
-- Table structure for blog_talk
-- ----------------------------
DROP TABLE IF EXISTS `blog_talk`;
CREATE TABLE `blog_talk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '话题名',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '话题图标',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0：正常  1：禁用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '话题圈子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_talk
-- ----------------------------
INSERT INTO `blog_talk` VALUES (1, '原神', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (2, '未来规划', NULL, 1, NULL);

-- ----------------------------
-- Table structure for blog_user_info
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_info`;
CREATE TABLE `blog_user_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱号',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `avatar` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `web_site` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人网站',
  `is_disable` int(1) NOT NULL DEFAULT 1 COMMENT '是否禁用',
  `bj_cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人中心背景图',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_info
-- ----------------------------
INSERT INTO `blog_user_info` VALUES (1, 'tsuimengchao@163.com', '梦辰雪', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/avatar-20240302042334316.png', '努力努力再努力', '', 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2023-07-11 16:10:08');
INSERT INTO `blog_user_info` VALUES (2, 'tsuimengchao@qq.com', '测试用户', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1645512111007.png', NULL, NULL, 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2023-06-12 09:50:23');
INSERT INTO `blog_user_info` VALUES (3, 'tsuimengchao@foxmail.com', '普通用户', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (4, 'tsuimengchao@aliyun.com', '崔梦超', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png', '搬砖搬砖正在搬砖', NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (5, '505113917@qq.com', '赵浩悦', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (6, '1633420846@qq.com', '碧落', '', NULL, NULL, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for blog_web_config
-- ----------------------------
DROP TABLE IF EXISTS `blog_web_config`;
CREATE TABLE `blog_web_config`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'logo(文件UID)',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '网站名称',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '介绍',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者',
  `record_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备案号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `web_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站地址',
  `ali_pay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款码FileId',
  `weixin_pay` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信收款码FileId',
  `github` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github地址',
  `gitee` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'gitee地址',
  `qq_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ号',
  `qq_group` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'QQ群',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `wechat` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信',
  `show_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示的列表（用于控制邮箱、QQ、QQ群、Github、Gitee、微信是否显示在前端）',
  `login_type_list` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录方式列表（用于控制前端登录方式，如账号密码,码云,Github,QQ,微信）',
  `open_comment` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否开启评论(0:否 1:是)',
  `open_admiration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否开启赞赏(0:否， 1:是)',
  `tourist_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '游客头像',
  `bulletin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告',
  `author_info` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者简介',
  `author_avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者头像',
  `about_me` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_german2_ci NULL COMMENT '关于我',
  `is_music_player` int(10) NULL DEFAULT 0 COMMENT '是否开启音乐播放器',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_web_config
-- ----------------------------
INSERT INTO `blog_web_config` VALUES (1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9cf1222617fd4fa197991476a53cc883.jpg', '辰雪博客', '正在努力搬砖~~~~', '梦辰雪,辰雪,辰雪博客', '梦辰雪', '冀ICP备2021012929号 转 冀ICP备2024051278号', '2021-11-27 13:43:16', '2022-01-20 13:30:44', 'http://辰雪博客.xn--jduy7zg5y.xn--6qq986b3xl/', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg', '\r\nhttp://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg', 'https://github.com/TsuiMengchao', 'https://gitee.com/TsuiMengchao', '484132820', '无', 'tsuimengchao@aliyun.com', 'tsuimengchao', '1,3,4,2,5,6', '1,2,5,6,4,3', '1', 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/66bb121d47e94b89945d29bb6e3e6cab.jpg', '如果本项目对你有帮助，请前往码云给仓库点上你的小星星', '正在努力搬砖~~~~', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/avatar-20240302042334316.png', '<h4 style=\"line-height: 2;\">项目框架</h4><p style=\"line-height: 2;\">前端使用了<span style=\"color: rgb(64, 169, 255);\">Vue+Elmentui</span>，能够更加容易得进行扩展</p><p style=\"line-height: 2;\">后端使用的<span style=\"color: rgb(64, 169, 255);\">Spring Boot+Mysql+Mybatis-Plus</span>框架</p><h4 style=\"line-height: 2;\">源码</h4><p style=\"line-height: 2;\">目前博客源码已经开源至 <a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">码云</a> ，感兴趣的小伙伴可以star fork关注一下下~</p><p style=\"line-height: 2;\">Gitee地址：[崔梦超](<a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">https://gitee.com/TsuiMengchao/cxblog)</a></p><p style=\"line-height: 2;\"><br></p>', 0);

-- ----------------------------
-- Table structure for code_column_config
-- ----------------------------
DROP TABLE IF EXISTS `code_column_config`;
CREATE TABLE `code_column_config`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `column_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `form_show` bit(1) NULL DEFAULT NULL,
  `form_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `key_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `list_show` bit(1) NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`column_id`) USING BTREE,
  INDEX `idx_table_name`(`table_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成字段信息存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_column_config
-- ----------------------------
INSERT INTO `code_column_config` VALUES (191, 'blog_article', 'id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '主键id');
INSERT INTO `code_column_config` VALUES (192, 'blog_article', 'user_id', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '用户id');
INSERT INTO `code_column_config` VALUES (193, 'blog_article', 'category_id', 'bigint', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '分类id');
INSERT INTO `code_column_config` VALUES (194, 'blog_article', 'title', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '文章标题');
INSERT INTO `code_column_config` VALUES (195, 'blog_article', 'avatar', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文章封面地址');
INSERT INTO `code_column_config` VALUES (196, 'blog_article', 'summary', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '文章简介');
INSERT INTO `code_column_config` VALUES (197, 'blog_article', 'content', 'mediumtext', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文章内容 （最多两百字）');
INSERT INTO `code_column_config` VALUES (198, 'blog_article', 'content_md', 'mediumtext', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文章内容md版');
INSERT INTO `code_column_config` VALUES (199, 'blog_article', 'read_type', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '阅读方式 0无需验证 1：评论阅读 2：点赞阅读 3：扫码阅读');
INSERT INTO `code_column_config` VALUES (200, 'blog_article', 'is_stick', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否置顶 0否 1是');
INSERT INTO `code_column_config` VALUES (201, 'blog_article', 'is_publish', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否发布 0：下架 1：发布');
INSERT INTO `code_column_config` VALUES (202, 'blog_article', 'is_original', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否原创  0：转载 1:原创');
INSERT INTO `code_column_config` VALUES (203, 'blog_article', 'original_url', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '转载地址');
INSERT INTO `code_column_config` VALUES (204, 'blog_article', 'quantity', 'bigint', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '文章阅读量');
INSERT INTO `code_column_config` VALUES (205, 'blog_article', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间');
INSERT INTO `code_column_config` VALUES (206, 'blog_article', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '修改时间');
INSERT INTO `code_column_config` VALUES (207, 'blog_article', 'is_carousel', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否首页轮播');
INSERT INTO `code_column_config` VALUES (208, 'blog_article', 'is_recommend', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否推荐');
INSERT INTO `code_column_config` VALUES (209, 'blog_article', 'keywords', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '关键词');
INSERT INTO `code_column_config` VALUES (210, 'sys_dept', 'dept_id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, 'ID');
INSERT INTO `code_column_config` VALUES (211, 'sys_dept', 'pid', 'bigint', NULL, '', b'1', NULL, 'MUL', b'1', b'0', NULL, '上级部门');
INSERT INTO `code_column_config` VALUES (212, 'sys_dept', 'sub_count', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '子部门数目');
INSERT INTO `code_column_config` VALUES (213, 'sys_dept', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '名称');
INSERT INTO `code_column_config` VALUES (214, 'sys_dept', 'dept_sort', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '排序');
INSERT INTO `code_column_config` VALUES (215, 'sys_dept', 'enabled', 'bit', NULL, '', b'1', NULL, 'MUL', b'1', b'1', NULL, '状态');
INSERT INTO `code_column_config` VALUES (216, 'sys_dept', 'create_by', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建者');
INSERT INTO `code_column_config` VALUES (217, 'sys_dept', 'update_by', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '更新者');
INSERT INTO `code_column_config` VALUES (218, 'sys_dept', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建日期');
INSERT INTO `code_column_config` VALUES (219, 'sys_dept', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '更新时间');
INSERT INTO `code_column_config` VALUES (220, 'blog_category', 'id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '主键id');
INSERT INTO `code_column_config` VALUES (221, 'blog_category', 'name', 'varchar', NULL, '', b'1', NULL, 'MUL', b'1', b'1', NULL, '分类名称');
INSERT INTO `code_column_config` VALUES (222, 'blog_category', 'click_volume', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '');
INSERT INTO `code_column_config` VALUES (223, 'blog_category', 'sort', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '排序');
INSERT INTO `code_column_config` VALUES (224, 'blog_category', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间');
INSERT INTO `code_column_config` VALUES (225, 'blog_category', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '最后更新时间');
INSERT INTO `code_column_config` VALUES (226, 'blog_category', 'icon', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '图标');
INSERT INTO `code_column_config` VALUES (227, 'blog_article_tag', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '');
INSERT INTO `code_column_config` VALUES (228, 'blog_article_tag', 'article_id', 'int', NULL, '', b'1', NULL, 'MUL', b'1', b'1', NULL, '文章id');
INSERT INTO `code_column_config` VALUES (229, 'blog_article_tag', 'tag_id', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '标签id');
INSERT INTO `code_column_config` VALUES (236, 'blog_tags', 'id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '主键id');
INSERT INTO `code_column_config` VALUES (237, 'blog_tags', 'name', 'varchar', NULL, '', b'1', NULL, 'MUL', b'1', b'1', NULL, '标签名称');
INSERT INTO `code_column_config` VALUES (238, 'blog_tags', 'click_volume', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '');
INSERT INTO `code_column_config` VALUES (239, 'blog_tags', 'sort', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '排序');
INSERT INTO `code_column_config` VALUES (240, 'blog_tags', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '创建时间');
INSERT INTO `code_column_config` VALUES (241, 'blog_tags', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '最后更新时间');
INSERT INTO `code_column_config` VALUES (242, 'blog_dict', 'id', 'bigint', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '主键');
INSERT INTO `code_column_config` VALUES (243, 'blog_dict', 'name', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '字典名称');
INSERT INTO `code_column_config` VALUES (244, 'blog_dict', 'type', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '字典类型');
INSERT INTO `code_column_config` VALUES (245, 'blog_dict', 'is_publish', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '是否发布(1:是，0:否)');
INSERT INTO `code_column_config` VALUES (246, 'blog_dict', 'remark', 'varchar', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '备注');
INSERT INTO `code_column_config` VALUES (247, 'blog_dict', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '创建时间');
INSERT INTO `code_column_config` VALUES (248, 'blog_dict', 'update_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '修改时间');
INSERT INTO `code_column_config` VALUES (249, 'blog_dict', 'sort', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '排序');
INSERT INTO `code_column_config` VALUES (250, 'blog_collect', 'id', 'int', NULL, 'auto_increment', b'1', NULL, 'PRI', b'1', b'0', NULL, '主键');
INSERT INTO `code_column_config` VALUES (251, 'blog_collect', 'user_id', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '用户id');
INSERT INTO `code_column_config` VALUES (252, 'blog_collect', 'article_id', 'bigint', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '文章id');
INSERT INTO `code_column_config` VALUES (253, 'blog_collect', 'create_time', 'datetime', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '收藏时间');
INSERT INTO `code_column_config` VALUES (254, 'diary_system', 'id', 'int', NULL, '', b'1', NULL, 'PRI', b'1', b'1', NULL, '');
INSERT INTO `code_column_config` VALUES (255, 'diary_system', 'allowResgister', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否开启注册');
INSERT INTO `code_column_config` VALUES (256, 'diary_system', 'filings', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '备案号');
INSERT INTO `code_column_config` VALUES (257, 'diary_system', 'backgroundUrl', 'varchar', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '登录页背景地址');
INSERT INTO `code_column_config` VALUES (258, 'diary_system', 'version', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '版本号');
INSERT INTO `code_column_config` VALUES (259, 'diary_system', 'diffVersion', 'int', NULL, '', b'1', NULL, '', b'1', b'1', NULL, '允许差异版本');
INSERT INTO `code_column_config` VALUES (260, 'diary_system', 'maintenance', 'int', NULL, '', b'1', NULL, '', b'1', b'0', NULL, '是否开启维护');

-- ----------------------------
-- Table structure for code_gen_config
-- ----------------------------
DROP TABLE IF EXISTS `code_gen_config`;
CREATE TABLE `code_gen_config`  (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表名',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '作者',
  `cover` bit(1) NULL DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`config_id`) USING BTREE,
  INDEX `idx_table_name`(`table_name`(100)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成器配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_gen_config
-- ----------------------------
INSERT INTO `code_gen_config` VALUES (7, 'blog_article', 'mcx', b'0', 'eladmin-system', 'me.zhengjie.modules.blogs', './blogs', './blogs\\', 'blog_', 'blogs');
INSERT INTO `code_gen_config` VALUES (8, 'blog_category', 'mcx', b'0', 'eladmin-system', 'me.zhengjie.modules.blogs', './blogs', './blogs\\', 'blog_', 'category');
INSERT INTO `code_gen_config` VALUES (9, 'blog_tags', 'mcx', b'0', 'eladmin-system', 'me.zhengjie.modules.blogs', './blogs/tags', './blogs/tags\\', 'blog_', 'tags');

-- ----------------------------
-- Table structure for mnt_app
-- ----------------------------
DROP TABLE IF EXISTS `mnt_app`;
CREATE TABLE `mnt_app`  (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '应用名称',
  `upload_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '上传目录',
  `deploy_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部署路径',
  `backup_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备份路径',
  `port` int(255) NULL DEFAULT NULL COMMENT '应用端口',
  `start_script` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '启动脚本',
  `deploy_script` varchar(4000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '部署脚本',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '应用管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_app
-- ----------------------------

-- ----------------------------
-- Table structure for mnt_database
-- ----------------------------
DROP TABLE IF EXISTS `mnt_database`;
CREATE TABLE `mnt_database`  (
  `db_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `jdbc_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'jdbc连接',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '账号',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`db_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据库管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_database
-- ----------------------------
INSERT INTO `mnt_database` VALUES ('c24b2710b9e1479e8f6fc433dd5429dd', 'MySQL数据库', 'jdbc:mysql://47.101.33.34:3306/cxblog?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useSSL=false', 'cxblog', '@Mysql20010227', 'admin', 'admin', '2024-02-23 12:27:26', '2024-02-23 12:27:26');

-- ----------------------------
-- Table structure for mnt_deploy
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy`;
CREATE TABLE `mnt_deploy`  (
  `deploy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `app_id` bigint(20) NULL DEFAULT NULL COMMENT '应用编号',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`deploy_id`) USING BTREE,
  INDEX `FK6sy157pseoxx4fmcqr1vnvvhy`(`app_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部署管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_deploy
-- ----------------------------

-- ----------------------------
-- Table structure for mnt_deploy_history
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_history`;
CREATE TABLE `mnt_deploy_history`  (
  `history_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'ID',
  `app_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用名称',
  `deploy_date` datetime NOT NULL COMMENT '部署日期',
  `deploy_user` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '部署用户',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '服务器IP',
  `deploy_id` bigint(20) NULL DEFAULT NULL COMMENT '部署编号',
  PRIMARY KEY (`history_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部署历史管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_deploy_history
-- ----------------------------

-- ----------------------------
-- Table structure for mnt_deploy_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_deploy_server`;
CREATE TABLE `mnt_deploy_server`  (
  `deploy_id` bigint(20) NOT NULL COMMENT '部署ID',
  `server_id` bigint(20) NOT NULL COMMENT '服务ID',
  PRIMARY KEY (`deploy_id`, `server_id`) USING BTREE,
  INDEX `FKeaaha7jew9a02b3bk9ghols53`(`server_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '应用与服务器关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_deploy_server
-- ----------------------------

-- ----------------------------
-- Table structure for mnt_server
-- ----------------------------
DROP TABLE IF EXISTS `mnt_server`;
CREATE TABLE `mnt_server`  (
  `server_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `port` int(11) NULL DEFAULT NULL COMMENT '端口',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`server_id`) USING BTREE,
  INDEX `idx_ip`(`ip`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '服务器管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_server
-- ----------------------------
INSERT INTO `mnt_server` VALUES (1, 'root', '47.101.33.34', '阿里云服务器', '@Aly201416', 22, 'admin', 'admin', '2024-02-23 12:23:37', '2024-02-23 12:23:37');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级部门',
  `sub_count` int(5) NULL DEFAULT 0 COMMENT '子部门数目',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `dept_sort` int(5) NULL DEFAULT 999 COMMENT '排序',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (2, 7, 1, '研发部', 3, b'1', 'admin', 'admin', '2019-03-25 09:15:32', '2020-08-02 14:48:47');
INSERT INTO `sys_dept` VALUES (5, 7, 0, '运维部', 4, b'1', 'admin', 'admin', '2019-03-25 09:20:44', '2020-05-17 14:27:27');
INSERT INTO `sys_dept` VALUES (6, 8, 0, '测试部', 6, b'1', 'admin', 'admin', '2019-03-25 09:52:18', '2020-06-08 11:59:21');
INSERT INTO `sys_dept` VALUES (7, NULL, 2, '华南分部', 0, b'1', 'admin', 'admin', '2019-03-25 11:04:50', '2020-06-08 12:08:56');
INSERT INTO `sys_dept` VALUES (8, NULL, 2, '华北分部', 1, b'1', 'admin', 'admin', '2019-03-25 11:04:53', '2020-05-14 12:54:00');
INSERT INTO `sys_dept` VALUES (15, 8, 0, 'UI部门', 7, b'1', 'admin', 'admin', '2020-05-13 22:56:53', '2020-05-14 12:54:13');
INSERT INTO `sys_dept` VALUES (17, 2, 0, '研发一组', 999, b'1', 'admin', 'admin', '2020-08-02 14:49:07', '2020-08-02 14:49:07');
INSERT INTO `sys_dept` VALUES (18, NULL, 0, '公测分部', 999, b'1', 'admin', 'admin', '2024-01-29 21:02:34', '2024-01-29 21:02:34');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_publish` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否发布(1:是，0:否)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL, '1', '用户状态', 0);
INSERT INTO `sys_dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL, '1', '部门状态', 0);
INSERT INTO `sys_dict` VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL, '1', '岗位状态', 0);
INSERT INTO `sys_dict` VALUES (6, 'sys_user_sex', '用户性别', NULL, NULL, '2021-11-19 09:24:23', '2021-11-27 22:03:54', '1', '用户性别', 0);
INSERT INTO `sys_dict` VALUES (7, 'sys_publish_status', '发布状态', NULL, NULL, '2021-11-19 17:12:51', '2021-11-19 17:12:51', '1', '发布状态列表', 0);
INSERT INTO `sys_dict` VALUES (8, 'sys_search_model', '搜索模式', NULL, NULL, '2021-11-26 08:57:47', '2021-11-26 08:57:47', '1', '搜索模式：SQL搜索、全文检索', 2);
INSERT INTO `sys_dict` VALUES (9, 'sys_yes_no', '系统是否', NULL, NULL, '2021-11-26 14:03:12', '2021-11-26 14:03:12', '1', '系统是否列表', 2);
INSERT INTO `sys_dict` VALUES (10, 'sys_normal_disable', '系统开关', NULL, NULL, '2021-11-26 15:16:43', '2021-11-26 15:16:43', '1', '系统开关列表', 3);
INSERT INTO `sys_dict` VALUES (11, 'sys_login_method', '博客登录方式', NULL, NULL, '2021-11-27 13:52:38', '2021-11-27 13:52:38', '1', '博客登录方式 账号密码、QQ、微博', 0);
INSERT INTO `sys_dict` VALUES (12, 'sys_job_group', '定时任务分组', NULL, NULL, '2021-12-10 08:53:30', '2021-12-10 08:53:30', '1', '定时任务分组列表', 2);
INSERT INTO `sys_dict` VALUES (13, 'sys_job_status', '任务状态', NULL, NULL, '2021-12-10 09:01:10', '2021-12-10 09:01:10', '1', '任务状态列表', 2);
INSERT INTO `sys_dict` VALUES (14, 'sys_job_misfire', '任务执行策略', NULL, NULL, '2021-12-10 11:11:48', '2021-12-10 11:12:04', '1', '任务执行策略列表', 2);

-- ----------------------------
-- Table structure for sys_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_detail`;
CREATE TABLE `sys_dict_detail`  (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(11) NULL DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '字典值',
  `dict_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `style` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '回显样式',
  `is_default` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否默认（1是 0否）',
  `is_publish` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '是否发布(1:是，0:否)',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据字典详情' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_detail
-- ----------------------------
INSERT INTO `sys_dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL, NULL, '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL, NULL, NULL, '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (7, 7, '发布', '1', 2, NULL, NULL, NULL, NULL, 'success', '1', '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (8, 7, '下架', '0', 1, NULL, NULL, NULL, NULL, 'danger', '0', '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (9, 9, '是', '1', 2, NULL, NULL, NULL, NULL, 'success', '1', '1', '系统是否 是');
INSERT INTO `sys_dict_detail` VALUES (10, 9, '否', '0', 1, NULL, NULL, NULL, NULL, 'warning', '0', '1', '系统是否 否');
INSERT INTO `sys_dict_detail` VALUES (11, 10, '开启', '1', 2, NULL, NULL, NULL, NULL, 'success', '1', '1', '系统开关 开启');
INSERT INTO `sys_dict_detail` VALUES (12, 10, '关闭', '0', 3, NULL, NULL, NULL, NULL, 'warning', '0', '1', '系统开关 关闭');
INSERT INTO `sys_dict_detail` VALUES (13, 8, 'ES搜素', '1', 2, NULL, NULL, NULL, NULL, 'success', '0', '1', '搜索模式：开启ElasticSearch全文检索');
INSERT INTO `sys_dict_detail` VALUES (14, 8, 'SQL搜索', '0', 3, NULL, NULL, NULL, NULL, 'warning', '1', '1', '搜索模式：SQL搜索');
INSERT INTO `sys_dict_detail` VALUES (15, 11, '账号', '1', 2, NULL, NULL, NULL, NULL, 'primary', '0', '1', '账号密码登录');
INSERT INTO `sys_dict_detail` VALUES (16, 11, 'QQ', '2', 3, NULL, NULL, NULL, NULL, 'success', '1', '1', 'QQ登录');
INSERT INTO `sys_dict_detail` VALUES (17, 11, '微博', '3', 4, NULL, NULL, NULL, NULL, 'danger', '0', '1', '微博登录');
INSERT INTO `sys_dict_detail` VALUES (18, 6, '男', '1', 2, NULL, NULL, NULL, NULL, '', '1', '1', '性别 男');
INSERT INTO `sys_dict_detail` VALUES (19, 6, '女', '0', 1, NULL, NULL, NULL, NULL, '', '1', '1', '性别 女');
INSERT INTO `sys_dict_detail` VALUES (20, 12, '默认', 'DEFAULT', 2, NULL, NULL, NULL, NULL, 'primary', '1', '1', '默认分组');
INSERT INTO `sys_dict_detail` VALUES (21, 12, '系统', 'SYSTEM', 3, NULL, NULL, NULL, NULL, 'warning', '0', '1', '系统分组');
INSERT INTO `sys_dict_detail` VALUES (22, 13, '正常', '0', 2, NULL, NULL, NULL, NULL, 'primary', '0', '1', '正常状态');
INSERT INTO `sys_dict_detail` VALUES (23, 13, '暂停', '1', 3, NULL, NULL, NULL, NULL, 'danger', '1', '1', '暂停状态');
INSERT INTO `sys_dict_detail` VALUES (24, 14, '默认策略', '0', 2, NULL, NULL, NULL, NULL, '', '1', '1', '默认策略');
INSERT INTO `sys_dict_detail` VALUES (25, 14, '立即执行', '1', 3, NULL, NULL, NULL, NULL, '', '0', '1', '立即执行');
INSERT INTO `sys_dict_detail` VALUES (26, 14, '执行一次', '2', 4, NULL, NULL, NULL, NULL, '', '0', '1', '执行一次');
INSERT INTO `sys_dict_detail` VALUES (27, 14, '放弃执行', '3', 5, NULL, NULL, NULL, NULL, '', '0', '1', '放弃执行');
INSERT INTO `sys_dict_detail` VALUES (28, 11, '码云', '4', 5, NULL, NULL, NULL, NULL, 'danger', '0', '1', 'gitee登录');
INSERT INTO `sys_dict_detail` VALUES (29, 11, '微信', '5', 6, NULL, NULL, NULL, NULL, 'success', '1', '1', '微信登录');
INSERT INTO `sys_dict_detail` VALUES (30, 7, '待审批', '2', 1, NULL, NULL, NULL, NULL, 'info', '1', '1', NULL);
INSERT INTO `sys_dict_detail` VALUES (31, 11, 'github', '6', 1, NULL, NULL, NULL, NULL, 'info', '1', '1', 'github登录');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '岗位' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (8, '人事专员', b'1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `sys_job` VALUES (10, '产品经理', b'1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `sys_job` VALUES (11, '全栈开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `sys_job` VALUES (12, '软件测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');
INSERT INTO `sys_job` VALUES (13, '公测成员', b'1', 999, 'admin', 'admin', '2024-01-29 21:02:54', '2024-01-29 21:02:54');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `log_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `log_create_time_index`(`create_time`) USING BTREE,
  INDEX `inx_log_type`(`log_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4252 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (4135, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 47, '', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:08:18');
INSERT INTO `sys_log` VALUES (4136, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 96, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:08:25');
INSERT INTO `sys_log` VALUES (4137, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 36, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:09:17');
INSERT INTO `sys_log` VALUES (4138, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 32, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:15:15');
INSERT INTO `sys_log` VALUES (4139, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"tsuimengchao\"}', '123.147.247.111', 119, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:16:39');
INSERT INTO `sys_log` VALUES (4140, '添加圈子', 'INFO', 'me.mcx.modules.blog.admin.rest.TalkController.addTalk()', '{\"id\":2,\"name\":\"待办事项\",\"status\":1}', '123.147.247.111', 7, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:17:18');
INSERT INTO `sys_log` VALUES (4141, '修改圈子', 'INFO', 'me.mcx.modules.blog.admin.rest.TalkController.updateTalk()', '{\"id\":2,\"name\":\"未来规划\",\"status\":1}', '123.147.247.111', 7, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:20:18');
INSERT INTO `sys_log` VALUES (4142, '留言模块-留言列表', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiMessageController.selectMessageList()', '', '123.147.247.111', 8, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:21:40');
INSERT INTO `sys_log` VALUES (4143, '留言模块-用户留言', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiMessageController.insertMessage()', '{\"avatar\":\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png\",\"content\":\"原神·启动\",\"createTime\":1710476515718,\"id\":2,\"ipAddress\":\"123.147.247.111\",\"ipSource\":\"未知\",\"nickname\":\"崔梦超\",\"status\":1,\"time\":20}', '123.147.247.111', 7, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:21:56');
INSERT INTO `sys_log` VALUES (4144, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 24, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:22:26');
INSERT INTO `sys_log` VALUES (4145, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 20, '', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:23:53');
INSERT INTO `sys_log` VALUES (4146, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 73, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:24:05');
INSERT INTO `sys_log` VALUES (4147, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 7, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:24:07');
INSERT INTO `sys_log` VALUES (4148, '同步七牛云数据', 'INFO', 'me.mcx.rest.QiniuController.synchronizeQiNiu()', '', '123.147.247.111', 849, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:29:37');
INSERT INTO `sys_log` VALUES (4149, '下载文件', 'INFO', 'me.mcx.rest.QiniuController.downloadQiNiu()', '', '123.147.247.111', 11, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:29:48');
INSERT INTO `sys_log` VALUES (4150, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 16, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:31:13');
INSERT INTO `sys_log` VALUES (4151, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 14, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:31:26');
INSERT INTO `sys_log` VALUES (4152, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 10, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:31:36');
INSERT INTO `sys_log` VALUES (4153, '下载文件', 'INFO', 'me.mcx.rest.QiniuController.downloadQiNiu()', '', '123.147.247.111', 2, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:31:54');
INSERT INTO `sys_log` VALUES (4154, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 20, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:32:37');
INSERT INTO `sys_log` VALUES (4155, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 93, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:32:46');
INSERT INTO `sys_log` VALUES (4156, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.247.111', 6, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:33:22');
INSERT INTO `sys_log` VALUES (4157, '留言模块-留言列表', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiMessageController.selectMessageList()', '', '40.77.190.13', 2, '', '美国伊利诺伊芝加哥', 'Chrome 100.0.4896.127', NULL, '2024-03-15 12:40:04');
INSERT INTO `sys_log` VALUES (4158, '添加文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.insertArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。</p>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n\\n\",\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket来部署本博客项目\",\"tagList\":[10],\"title\":\"使用docket部署项目\"}', '123.147.247.111', 271, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:46:03');
INSERT INTO `sys_log` VALUES (4159, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.247.111', 12, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 12:46:03');
INSERT INTO `sys_log` VALUES (4160, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 134, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-15 13:46:52');
INSERT INTO `sys_log` VALUES (4161, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.111', 54, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-15 13:46:55');
INSERT INTO `sys_log` VALUES (4162, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '14.105.38.86', 38, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-15 16:45:18');
INSERT INTO `sys_log` VALUES (4163, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '14.105.38.86', 33, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-15 16:45:23');
INSERT INTO `sys_log` VALUES (4164, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.251.71', 72, '', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 20:55:32');
INSERT INTO `sys_log` VALUES (4165, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.251.71', 5, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 20:55:48');
INSERT INTO `sys_log` VALUES (4166, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.251.71', 15, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 20:55:48');
INSERT INTO `sys_log` VALUES (4167, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.251.71', 11, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:48:36');
INSERT INTO `sys_log` VALUES (4168, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.251.71', 3, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:48:40');
INSERT INTO `sys_log` VALUES (4169, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.251.71', 14, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:48:40');
INSERT INTO `sys_log` VALUES (4170, '修改我的文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.updateMyArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketmysql_7\\\"></a>使用docket安装mysql</h1>\\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\\\" alt=\\\"image.png\\\" /><br />\\n或者在终端中使用以下命令拉取镜像：</p>\\n<pre><code class=\\\"lang-\\\">docker pull mysql:5.7\\n</code></pre>\\n<p>2、 拉取完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\\\" alt=\\\"image.png\\\" /><br />\\n或者使用命令创建</p>\\n<pre><code class=\\\"lang-\\\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n</code></pre>\\n<table>\\n<thead>\\n<tr>\\n<th>命令</th>\\n<th>描述</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>docker run</td>\\n<td>创建一个新的容器 , 同时运行这个容器</td>\\n</tr>\\n<tr>\\n<td>–name mysql</td>\\n<td>启动容器的名字</td>\\n</tr>\\n<tr>\\n<td>-d</td>\\n<td>后台运行</td>\\n</tr>\\n<tr>\\n<td>-p 3306:3306</td>\\n<td>将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口</td>\\n</tr>\\n<tr>\\n<td>–restart unless-stopped</td>\\n<td>容器重启策略</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/log:/var/log/mysql</td>\\n<td>将日志文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/data:/var/lib/mysql</td>\\n<td>将mysql储存文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/conf:/etc/mysql</td>\\n<td>将配置文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-e MYSQL_ROOT_PASSWORD=root</td>\\n<td>设置 root 用户的密码</td>\\n</tr>\\n<tr>\\n<td>mysql:5.7</td>\\n<td>启动哪个版本的 mysql (本地镜像的版本)</td>\\n</tr>\\n<tr>\\n<td>\\\\</td>\\n<td>shell 命令换行符</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 创建完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 使用命令尝试进入容器内部</p>\\n<pre><code class=\\\"lang-\\\">## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n</code></pre>\\n<p>并尝试连接数据库，检验是否安装完成<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketredis_48\\\"></a>使用docket安装redis</h1>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\\n# 使用docket安装mysql\\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\\n或者在终端中使用以下命令拉取镜像：\\n```\\ndocker pull mysql:5.7\\n```\\n2、 拉取完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\\n或者使用命令创建\\n```\\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n```\\n|命令|描述|\\n|-|-|\\n|docker run|创建一个新的容器 , 同时运行这个容器|\\n|–name mysql|启动容器的名字|\\n|-d|后台运行|\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\\n|–restart unless-stopped\\t| 容器重启策略|\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|\\n|\\\\\\\\|shell 命令换行符|\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\\n4、 创建完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\\n5、 使用命令尝试进入容器内部\\n```\\n## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n```\\n并尝试连接数据库，检验是否安装完成\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\\n\\n# 使用docket安装redis\\n\",\"id\":17,\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket来部署本博客项目\",\"tagList\":[10],\"title\":\"使用docket部署项目\",\"userId\":\"1\"}', '123.147.251.71', 118, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:53:36');
INSERT INTO `sys_log` VALUES (4171, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.251.71', 11, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:53:36');
INSERT INTO `sys_log` VALUES (4172, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.251.71', 4, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:53:40');
INSERT INTO `sys_log` VALUES (4173, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.251.71', 1, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:53:40');
INSERT INTO `sys_log` VALUES (4174, '修改我的文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.updateMyArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketmysql_7\\\"></a>使用docket安装mysql</h1>\\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\\\" alt=\\\"image.png\\\" /><br />\\n或者在终端中使用以下命令拉取镜像：</p>\\n<pre><code class=\\\"lang-\\\">docker pull mysql:5.7\\n</code></pre>\\n<p>2、 拉取完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\\\" alt=\\\"image.png\\\" /><br />\\n或者使用命令创建</p>\\n<pre><code class=\\\"lang-\\\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n</code></pre>\\n<table>\\n<thead>\\n<tr>\\n<th>命令</th>\\n<th>描述</th>\\n</tr>\\n</thead>\\n<tbody>\\n<tr>\\n<td>docker run</td>\\n<td>创建一个新的容器 , 同时运行这个容器</td>\\n</tr>\\n<tr>\\n<td>–name mysql</td>\\n<td>启动容器的名字</td>\\n</tr>\\n<tr>\\n<td>-d</td>\\n<td>后台运行</td>\\n</tr>\\n<tr>\\n<td>-p 3306:3306</td>\\n<td>将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口</td>\\n</tr>\\n<tr>\\n<td>–restart unless-stopped</td>\\n<td>容器重启策略</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/log:/var/log/mysql</td>\\n<td>将日志文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/data:/var/lib/mysql</td>\\n<td>将mysql储存文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-v /mydata/mysql/conf:/etc/mysql</td>\\n<td>将配置文件夹挂载到主机</td>\\n</tr>\\n<tr>\\n<td>-e MYSQL_ROOT_PASSWORD=root</td>\\n<td>设置 root 用户的密码</td>\\n</tr>\\n<tr>\\n<td>mysql:5.7</td>\\n<td>启动哪个版本的 mysql (本地镜像的版本)</td>\\n</tr>\\n<tr>\\n<td>\\\\</td>\\n<td>shell 命令换行符</td>\\n</tr>\\n</tbody>\\n</table>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 创建完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 使用命令尝试进入容器内部</p>\\n<pre><code class=\\\"lang-\\\">## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n</code></pre>\\n<p>并尝试连接数据库，检验是否安装完成<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketredis_48\\\"></a>使用docket安装redis</h1>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\\n# 使用docket安装mysql\\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\\n或者在终端中使用以下命令拉取镜像：\\n```\\ndocker pull mysql:5.7\\n```\\n2、 拉取完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\\n或者使用命令创建\\n```\\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n```\\n|命令|描述|\\n|-|-|\\n|docker run|创建一个新的容器 , 同时运行这个容器|\\n|–name mysql|启动容器的名字|\\n|-d|后台运行|\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\\n|–restart unless-stopped\\t| 容器重启策略|\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|\\n|\\\\\\\\|shell 命令换行符|\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\\n4、 创建完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\\n5、 使用命令尝试进入容器内部\\n```\\n## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n```\\n并尝试连接数据库，检验是否安装完成\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\\n\\n# 使用docket安装redis\\n\",\"id\":17,\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket搭建环境并部署本博客项目\",\"tagList\":[10],\"title\":\"使用docket搭建环境\",\"userId\":\"1\"}', '123.147.251.71', 11, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:54:08');
INSERT INTO `sys_log` VALUES (4175, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.251.71', 10, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:54:09');
INSERT INTO `sys_log` VALUES (4176, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.251.71', 4, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:54:19');
INSERT INTO `sys_log` VALUES (4177, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.251.71', 2, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 21:54:19');
INSERT INTO `sys_log` VALUES (4178, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '40.77.189.19', 75, '', '美国伊利诺伊芝加哥', 'Chrome 100.0.4896.127', NULL, '2024-03-15 22:01:46');
INSERT INTO `sys_log` VALUES (4179, '修改我的文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.updateMyArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketmysql_7\\\"></a>使用docket安装mysql</h1>\\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\\\" alt=\\\"image.png\\\" /><br />\\n或者在终端中使用以下命令拉取镜像：</p>\\n<pre><code class=\\\"lang-\\\">docker pull mysql:5.7\\n</code></pre>\\n<p>2、 拉取完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\\\" alt=\\\"image.png\\\" /><br />\\n或者使用命令创建</p>\\n<pre><code class=\\\"lang-\\\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\\n|命令|描述|<br />\\n|-|-|<br />\\n|docker run|创建一个新的容器 , 同时运行这个容器|<br />\\n|–name mysql|启动容器的名字|<br />\\n|-d|后台运行|<br />\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|<br />\\n|–restart unless-stopped\\t| 容器重启策略|<br />\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|<br />\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|<br />\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|<br />\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|<br />\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|<br />\\n|\\\\|shell 命令换行符|<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 创建完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 使用命令尝试进入容器内部</p>\\n</blockquote>\\n<pre><code class=\\\"lang-\\\">## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p>并尝试连接数据库，检验是否安装完成<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketredis_51\\\"></a>使用docket安装redis</h1>\\n<p>1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket-&gt;云端镜像-&gt;搜索redis，任选一个进行下载</p>\\n<blockquote>\\n<p><strong>注：</strong> 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png\\\" alt=\\\"image.png\\\" /><br />\\n2、新建挂载文件夹（路径自己定即可）</p>\\n<pre><code class=\\\"lang-\\\">mkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n</code></pre>\\n<p>3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入</p>\\n<pre><code class=\\\"lang-\\\">#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n</code></pre>\\n<p>4、 创建容器，点击容器-&gt;创建容器<br />\\n手动创建方式：<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png\\\" alt=\\\"image.png\\\" /><br />\\n命令创建方式：</p>\\n<pre><code class=\\\"lang-\\\">docker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，可以根据自己习惯自行命名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 创建完成后如下<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png\\\" alt=\\\"image.png\\\" /><br />\\n6、 在终端中输入以下命令，进入redis</p>\\n<pre><code class=\\\"lang-\\\">docker exec -it redis-docket redis-cli\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png\\\" alt=\\\"image.png\\\" /></p>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\\n# 使用docket安装mysql\\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\\n或者在终端中使用以下命令拉取镜像：\\n```\\ndocker pull mysql:5.7\\n```\\n2、 拉取完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\\n或者使用命令创建\\n```\\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n```\\n> **注意：** mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n|命令|描述|\\n|-|-|\\n|docker run|创建一个新的容器 , 同时运行这个容器|\\n|–name mysql|启动容器的名字|\\n|-d|后台运行|\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\\n|–restart unless-stopped\\t| 容器重启策略|\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|\\n|\\\\\\\\|shell 命令换行符|\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\\n4、 创建完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\\n5、 使用命令尝试进入容器内部\\n```\\n## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n```\\n> **注意：** mysql-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n并尝试连接数据库，检验是否安装完成\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\\n\\n# 使用docket安装redis\\n1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket->云端镜像->搜索redis，任选一个进行下载\\n> **注：** 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png)\\n2、新建挂载文件夹（路径自己定即可）\\n```\\nmkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n```\\n3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入\\n```\\n#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n```\\n4、 创建容器，点击容器->创建容器\\n手动创建方式：\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png)\\n命令创建方式：\\n```\\ndocker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n```\\n> **注意：** redis-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png)\\n5、 创建完成后如下\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png)\\n6、 在终端中输入以下命令，进入redis\\n```\\ndocker exec -it redis-docket redis-cli\\n```\\n> **注意：** redis-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png)\",\"id\":17,\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket搭建环境并部署本博客项目\",\"tagList\":[10],\"title\":\"使用docket搭建环境\",\"userId\":\"1\"}', '123.147.249.170', 166, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:18:09');
INSERT INTO `sys_log` VALUES (4180, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.249.170', 15, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:18:09');
INSERT INTO `sys_log` VALUES (4181, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.249.170', 6, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:20:06');
INSERT INTO `sys_log` VALUES (4182, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.249.170', 20, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:20:06');
INSERT INTO `sys_log` VALUES (4183, '修改我的文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.updateMyArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketmysql_7\\\"></a>使用docket安装mysql</h1>\\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\\\" alt=\\\"image.png\\\" /><br />\\n或者在终端中使用以下命令拉取镜像：</p>\\n<pre><code class=\\\"lang-\\\">docker pull mysql:5.7\\n</code></pre>\\n<p>2、 拉取完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\\\" alt=\\\"image.png\\\" /><br />\\n或者使用命令创建</p>\\n<pre><code class=\\\"lang-\\\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\\n|命令|描述|<br />\\n|-|-|<br />\\n|docker run|创建一个新的容器 , 同时运行这个容器|<br />\\n|–name mysql|启动容器的名字|<br />\\n|-d|后台运行|<br />\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|<br />\\n|–restart unless-stopped\\t| 容器重启策略|<br />\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|<br />\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|<br />\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|<br />\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|<br />\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|<br />\\n|\\\\|shell 命令换行符|<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 创建完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 使用命令尝试进入容器内部</p>\\n</blockquote>\\n<pre><code class=\\\"lang-\\\">## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p>并尝试连接数据库，检验是否安装完成<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketredis_51\\\"></a>使用docket安装redis</h1>\\n<p>1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket-&gt;云端镜像-&gt;搜索redis，任选一个进行下载</p>\\n<blockquote>\\n<p><strong>注：</strong> 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png\\\" alt=\\\"image.png\\\" /><br />\\n2、新建挂载文件夹（路径自己定即可）</p>\\n<pre><code class=\\\"lang-\\\">mkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n</code></pre>\\n<p>3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入</p>\\n<pre><code class=\\\"lang-\\\">#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n</code></pre>\\n<p>4、 创建容器，点击容器-&gt;创建容器<br />\\n手动创建方式：<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png\\\" alt=\\\"image.png\\\" /><br />\\n命令创建方式：</p>\\n<pre><code class=\\\"lang-\\\">docker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，可以根据自己习惯自行命名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 创建完成后如下<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png\\\" alt=\\\"image.png\\\" /><br />\\n6、 在终端中输入以下命令，进入redis</p>\\n<pre><code class=\\\"lang-\\\">docker exec -it redis-docket redis-cli\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketjdk8_88\\\"></a>使用docket安装jdk8</h1>\\n<p>1、 搜索并拉取jdk8镜像<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png\\\" alt=\\\"image.png\\\" /><br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 根据镜像创建容器<br />\\n手动创建方法<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png\\\" alt=\\\"image.png\\\" /></p>\\n<pre><code class=\\\"lang-\\\">docker run -di --name=jdk8-docket ascdc/jdk8\\n</code></pre>\\n<blockquote>\\n<p><strong>注意</strong> 容器名和镜像名根据自己实际情况修改</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 创建完成如下<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 输入以下命令进入容器</p>\\n<pre><code class=\\\"lang-\\\">docker exec -it jdk8-docket /bin/bash\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。</p>\\n</blockquote>\\n<p>到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见其他文章。</p>\\n<h1><a id=\\\"Bye_112\\\"></a>Bye</h1>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\\n# 使用docket安装mysql\\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\\n或者在终端中使用以下命令拉取镜像：\\n```\\ndocker pull mysql:5.7\\n```\\n2、 拉取完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\\n或者使用命令创建\\n```\\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n```\\n> **注意：** mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n|命令|描述|\\n|-|-|\\n|docker run|创建一个新的容器 , 同时运行这个容器|\\n|–name mysql|启动容器的名字|\\n|-d|后台运行|\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\\n|–restart unless-stopped\\t| 容器重启策略|\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|\\n|\\\\\\\\|shell 命令换行符|\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\\n4、 创建完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\\n5、 使用命令尝试进入容器内部\\n```\\n## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n```\\n> **注意：** mysql-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n并尝试连接数据库，检验是否安装完成\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\\n\\n# 使用docket安装redis\\n1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket->云端镜像->搜索redis，任选一个进行下载\\n> **注：** 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png)\\n2、新建挂载文件夹（路径自己定即可）\\n```\\nmkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n```\\n3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入\\n```\\n#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n```\\n4、 创建容器，点击容器->创建容器\\n手动创建方式：\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png)\\n命令创建方式：\\n```\\ndocker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n```\\n> **注意：** redis-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png)\\n5、 创建完成后如下\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png)\\n6、 在终端中输入以下命令，进入redis\\n```\\ndocker exec -it redis-docket redis-cli\\n```\\n> **注意：** redis-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png)\\n\\n# 使用docket安装jdk8\\n1、 搜索并拉取jdk8镜像\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png)\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png)\\n2、 根据镜像创建容器\\n手动创建方法\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png)\\n```\\ndocker run -di --name=jdk8-docket ascdc/jdk8\\n```\\n> **注意** 容器名和镜像名根据自己实际情况修改\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png)\\n3、 创建完成如下\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png)\\n4、 输入以下命令进入容器\\n```\\ndocker exec -it jdk8-docket /bin/bash\\n```\\n> **注意：** jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。\\n\\n到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见其他文章。\\n\\n# Bye\",\"id\":17,\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket搭建本博客项目运行环境\",\"tagList\":[10],\"title\":\"使用docket搭建环境\",\"userId\":\"1\"}', '123.147.249.170', 240, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:33:51');
INSERT INTO `sys_log` VALUES (4184, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.249.170', 15, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:33:51');
INSERT INTO `sys_log` VALUES (4185, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.249.170', 4, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:33:58');
INSERT INTO `sys_log` VALUES (4186, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.249.170', 3, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:33:58');
INSERT INTO `sys_log` VALUES (4187, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.249.170', 12, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:34:04');
INSERT INTO `sys_log` VALUES (4188, '标签模块-用户访问页面', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiTagsController.selectTagList()', '', '123.147.249.170', 2, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:34:07');
INSERT INTO `sys_log` VALUES (4189, '我的文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectMyArticleInfo()', '', '123.147.249.170', 13, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:34:08');
INSERT INTO `sys_log` VALUES (4190, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 26, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:35:24');
INSERT INTO `sys_log` VALUES (4191, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.249.170', 27, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:35:32');
INSERT INTO `sys_log` VALUES (4192, '修改我的文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.updateMyArticle()', '{\"avatar\":\"\",\"categoryId\":32,\"content\":\"<h1><a id=\\\"_Docker_0\\\"></a>一、宝塔面板一键安装 Docker</h1>\\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png\\\" alt=\\\"image.png\\\" /><br />\\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketmysql_7\\\"></a>使用docket安装mysql</h1>\\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png\\\" alt=\\\"image.png\\\" /><br />\\n或者在终端中使用以下命令拉取镜像：</p>\\n<pre><code class=\\\"lang-\\\">docker pull mysql:5.7\\n</code></pre>\\n<p>2、 拉取完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png\\\" alt=\\\"image.png\\\" /><br />\\n或者使用命令创建</p>\\n<pre><code class=\\\"lang-\\\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\\n|命令|描述|<br />\\n|-|-|<br />\\n|docker run|创建一个新的容器 , 同时运行这个容器|<br />\\n|–name mysql|启动容器的名字|<br />\\n|-d|后台运行|<br />\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|<br />\\n|–restart unless-stopped\\t| 容器重启策略|<br />\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|<br />\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|<br />\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|<br />\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|<br />\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|<br />\\n|\\\\|shell 命令换行符|<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 创建完成后如下所示<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 使用命令尝试进入容器内部</p>\\n</blockquote>\\n<pre><code class=\\\"lang-\\\">## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p>并尝试连接数据库，检验是否安装完成<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketredis_51\\\"></a>使用docket安装redis</h1>\\n<p>1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket-&gt;云端镜像-&gt;搜索redis，任选一个进行下载</p>\\n<blockquote>\\n<p><strong>注：</strong> 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png\\\" alt=\\\"image.png\\\" /><br />\\n2、新建挂载文件夹（路径自己定即可）</p>\\n<pre><code class=\\\"lang-\\\">mkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n</code></pre>\\n<p>3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入</p>\\n<pre><code class=\\\"lang-\\\">#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n</code></pre>\\n<p>4、 创建容器，点击容器-&gt;创建容器<br />\\n手动创建方式：<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png\\\" alt=\\\"image.png\\\" /><br />\\n命令创建方式：</p>\\n<pre><code class=\\\"lang-\\\">docker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，可以根据自己习惯自行命名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png\\\" alt=\\\"image.png\\\" /><br />\\n5、 创建完成后如下<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png\\\" alt=\\\"image.png\\\" /><br />\\n6、 在终端中输入以下命令，进入redis</p>\\n<pre><code class=\\\"lang-\\\">docker exec -it redis-docket redis-cli\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，请修改成自己的容器名。</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png\\\" alt=\\\"image.png\\\" /></p>\\n<h1><a id=\\\"docketjdk8_88\\\"></a>使用docket安装jdk8</h1>\\n<p>1、 搜索并拉取jdk8镜像<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png\\\" alt=\\\"image.png\\\" /><br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png\\\" alt=\\\"image.png\\\" /><br />\\n2、 根据镜像创建容器<br />\\n手动创建方法<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png\\\" alt=\\\"image.png\\\" /></p>\\n<pre><code class=\\\"lang-\\\">docker run -di --name=jdk8-docket ascdc/jdk8\\n</code></pre>\\n<blockquote>\\n<p><strong>注意</strong> 容器名和镜像名根据自己实际情况修改</p>\\n</blockquote>\\n<p><img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png\\\" alt=\\\"image.png\\\" /><br />\\n3、 创建完成如下<br />\\n<img src=\\\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png\\\" alt=\\\"image.png\\\" /><br />\\n4、 输入以下命令进入容器</p>\\n<pre><code class=\\\"lang-\\\">docker exec -it jdk8-docket /bin/bash\\n</code></pre>\\n<blockquote>\\n<p><strong>注意：</strong> jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。</p>\\n</blockquote>\\n<p>到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章<a href=\\\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16\\\" target=\\\"_blank\\\">《通过宝塔面板搭建环境及部署项目》</a>。</p>\\n<h1><a id=\\\"Bye_112\\\"></a>Bye</h1>\\n\",\"contentMd\":\"# 一、宝塔面板一键安装 Docker\\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477696103.png)\\n随意选择一个镜像源进行安装，我选择的阿里云源\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710477743979.png)\\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507374780.png)\\n# 使用docket安装mysql\\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507514577.png)\\n或者在终端中使用以下命令拉取镜像：\\n```\\ndocker pull mysql:5.7\\n```\\n2、 拉取完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710507998567.png)\\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710508299458.png)\\n或者使用命令创建\\n```\\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\\n```\\n> **注意：** mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n|命令|描述|\\n|-|-|\\n|docker run|创建一个新的容器 , 同时运行这个容器|\\n|–name mysql|启动容器的名字|\\n|-d|后台运行|\\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\\n|–restart unless-stopped\\t| 容器重启策略|\\n|-v /mydata/mysql/log:/var/log/mysql|\\t将日志文件夹挂载到主机|\\n|-v /mydata/mysql/data:/var/lib/mysql\\t|将mysql储存文件夹挂载到主机|\\n|-v /mydata/mysql/conf:/etc/mysql|\\t将配置文件夹挂载到主机|\\n|-e MYSQL_ROOT_PASSWORD=root|\\t 设置 root 用户的密码|\\n|mysql:5.7|\\t 启动哪个版本的 mysql (本地镜像的版本)|\\n|\\\\\\\\|shell 命令换行符|\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510581446.png)\\n4、 创建完成后如下所示\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510635980.png)\\n5、 使用命令尝试进入容器内部\\n```\\n## 通过Docker命令进入Mysql容器内部\\ndocker exec -it mysql-docket /bin/bash\\n## 或者\\ndocker exec -it mysql-docket bash\\n```\\n> **注意：** mysql-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n并尝试连接数据库，检验是否安装完成\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710510791001.png)\\n\\n# 使用docket安装redis\\n1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket->云端镜像->搜索redis，任选一个进行下载\\n> **注：** 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511207973.png)\\n2、新建挂载文件夹（路径自己定即可）\\n```\\nmkdir -p /root/docker/redis/data\\nmkdir -p /root/docker/redis/conf\\n```\\n3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入\\n```\\n#bind 127.0.0.1 //允许远程连接\\nprotected-mode no //配置保护\\nappendonly yes //持久化\\nrequirepass 123456 //密码\\n```\\n4、 创建容器，点击容器->创建容器\\n手动创建方式：\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511692524.png)\\n命令创建方式：\\n```\\ndocker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\\n```\\n> **注意：** redis-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511835508.png)\\n5、 创建完成后如下\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710511917775.png)\\n6、 在终端中输入以下命令，进入redis\\n```\\ndocker exec -it redis-docket redis-cli\\n```\\n> **注意：** redis-docket是我的redis容器名称，请修改成自己的容器名。\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512014087.png)\\n\\n# 使用docket安装jdk8\\n1、 搜索并拉取jdk8镜像\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512620125.png)\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512856732.png)\\n2、 根据镜像创建容器\\n手动创建方法\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512908320.png)\\n```\\ndocker run -di --name=jdk8-docket ascdc/jdk8\\n```\\n> **注意** 容器名和镜像名根据自己实际情况修改\\n\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512927903.png)\\n3、 创建完成如下\\n![image.png](http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240315_1710512959142.png)\\n4、 输入以下命令进入容器\\n```\\ndocker exec -it jdk8-docket /bin/bash\\n```\\n> **注意：** jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。\\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。\\n\\n到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章[《通过宝塔面板搭建环境及部署项目》](http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16)。\\n\\n# Bye\",\"id\":17,\"isOriginal\":1,\"isPublish\":2,\"summary\":\"通过宝塔使用docket搭建本博客项目运行环境\",\"tagList\":[10],\"title\":\"使用docket搭建环境\",\"userId\":\"1\"}', '123.147.249.170', 13, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:36:16');
INSERT INTO `sys_log` VALUES (4193, '根据用户id获取文章', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleByUserId()', '', '123.147.249.170', 8, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:36:17');
INSERT INTO `sys_log` VALUES (4194, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.249.170', 11, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:36:25');
INSERT INTO `sys_log` VALUES (4195, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.249.170', 11, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:36:40');
INSERT INTO `sys_log` VALUES (4196, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"admin\"}', '123.147.249.170', 94, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:37:23');
INSERT INTO `sys_log` VALUES (4197, '发布或下架文章', 'INFO', 'me.mcx.modules.blog.admin.rest.ArticlesController.psArticle()', '{\"id\":17,\"isPublish\":1}', '123.147.249.170', 6, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:37:33');
INSERT INTO `sys_log` VALUES (4198, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.249.170', 8, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:37:49');
INSERT INTO `sys_log` VALUES (4199, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 49, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:37:55');
INSERT INTO `sys_log` VALUES (4200, '修改网站配置', 'INFO', 'me.mcx.modules.blog.admin.rest.WebConfigController.update()', '{\"aboutMe\":\"<h4 style=\\\"line-height: 2;\\\">项目框架</h4><p style=\\\"line-height: 2;\\\">前端使用了<span style=\\\"color: rgb(64, 169, 255);\\\">Vue+Elmentui</span>，能够更加容易得进行扩展</p><p style=\\\"line-height: 2;\\\">后端使用的<span style=\\\"color: rgb(64, 169, 255);\\\">Spring Boot+Mysql+Mybatis-Plus</span>框架</p><h4 style=\\\"line-height: 2;\\\">源码</h4><p style=\\\"line-height: 2;\\\">目前博客源码已经开源至 <a href=\\\"https://gitee.com/quequnlong/shiyi-blog\\\" target=\\\"_blank\\\">码云</a> ，感兴趣的小伙伴可以star fork关注一下下~</p><p style=\\\"line-height: 2;\\\">Gitee地址：[崔梦超](<a href=\\\"https://gitee.com/quequnlong/shiyi-blog\\\" target=\\\"_blank\\\">https://gitee.com/TsuiMengchao/cxblog)</a></p><p style=\\\"line-height: 2;\\\"><br></p>\",\"aliPay\":\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg\",\"author\":\"梦辰雪\",\"authorAvatar\":\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png\",\"authorInfo\":\"正在努力搬砖~~~~\",\"bulletin\":\"如果本项目对你有帮助，请前往码云给仓库点上你的小星星\",\"createTime\":1637991796000,\"email\":\"tsuimengchao@aliyun.com\",\"gitee\":\"https://gitee.com/TsuiMengchao\",\"github\":\"https://github.com/TsuiMengchao\",\"id\":1,\"isMusicPlayer\":0,\"keyword\":\"梦辰雪,辰雪,辰雪博客\",\"loginTypeList\":\"1,2,5,6,4,3\",\"logo\":\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9cf1222617fd4fa197991476a53cc883.jpg\",\"name\":\"辰雪博客\",\"openAdmiration\":\"1\",\"openComment\":\"1\",\"qqGroup\":\"无\",\"qqNumber\":\"484132820\",\"recordNum\":\"冀ICP备2021012929号 转 冀ICP备2024051278号\",\"showList\":\"1,3,4,2,5,6\",\"summary\":\"正在努力搬砖~~~~\",\"touristAvatar\":\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/66bb121d47e94b89945d29bb6e3e6cab.jpg\",\"updateTime\":1642656644000,\"webUrl\":\"http://辰雪博客.xn--jduy7zg5y.xn--6qq986b3xl/\",\"wechat\":\"tsuimengchao\",\"weixinPay\":\"\\r\\nhttp://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg\"}', '123.147.249.170', 22, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:38:36');
INSERT INTO `sys_log` VALUES (4201, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 37, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:41:11');
INSERT INTO `sys_log` VALUES (4202, '新增用户', 'ERROR', 'me.mcx.modules.system.rest.UserController.createUser()', '{\"createBy\":\"admin\",\"createTime\":1710513786214,\"dept\":{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"subCount\":0},\"deptId\":18,\"email\":\"1633420846@qq.com\",\"enabled\":true,\"gender\":\"男\",\"id\":6,\"isAdmin\":false,\"jobs\":[{\"id\":13}],\"nickName\":\"碧落\",\"password\":\"$2a$10$LpOrS/hpEAxOdWj6./yzCOGeiwL.wM4F.Ah7rTK7kVZDDx8eSmNgW\",\"phone\":\"15281392341\",\"roles\":[{\"dataScope\":\"本级\",\"id\":2,\"level\":3}],\"updateBy\":\"admin\",\"updateTime\":1710513786214,\"username\":\"biluo\"}', '123.147.249.170', 99, 'admin', '中国重庆重庆市', 'MSEdge 122', 'org.springframework.dao.DuplicateKeyException: \n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-13\' for key \'PRIMARY\'\n### The error may exist in URL [jar:file:/www/wwwroot/mcx/cxblog/cxblog-main-1.1.jar!/BOOT-INF/classes!/mapper/system/UserJobMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: insert into sys_users_jobs (user_id, job_id)         values          (               ?, ?          )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-13\' for key \'PRIMARY\'\n; Duplicate entry \'6-13\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-13\' for key \'PRIMARY\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:247)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy115.insert(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:272)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:59)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy197.insertData(Unknown Source)\n	at me.mcx.modules.system.service.impl.UserServiceImpl.create(UserServiceImpl.java:102)\n	at me.mcx.modules.system.service.impl.UserServiceImpl$$FastClassBySpringCGLIB$$f4f9692b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at me.mcx.modules.system.service.impl.UserServiceImpl$$EnhancerBySpringCGLIB$$78ba0ba7.create(<generated>)\n	at me.mcx.modules.system.rest.UserController.createUser(UserController.java:112)\n	at me.mcx.modules.system.rest.UserController$$FastClassBySpringCGLIB$$cc1298ab.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at me.mcx.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at me.mcx.modules.system.rest.UserController$$EnhancerBySpringCGLIB$$2666096e.createUser(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1067)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:681)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:764)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:111)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:327)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:115)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:122)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:126)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:109)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:149)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at me.mcx.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:103)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:89)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:110)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:80)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:55)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:211)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:183)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:540)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:359)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:889)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1735)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:750)\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-13\' for key \'PRIMARY\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:371)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.execute(PreparedStatementSpy.java:443)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3461)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3459)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:167)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:497)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:47)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.GeneratedMethodAccessor217.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:64)\n	at com.sun.proxy.$Proxy171.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at sun.reflect.GeneratedMethodAccessor216.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:106)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy170.update(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:194)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.insert(DefaultSqlSession.java:181)\n	at sun.reflect.GeneratedMethodAccessor227.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 135 more\n', '2024-03-15 22:43:06');
INSERT INTO `sys_log` VALUES (4203, '新增用户', 'ERROR', 'me.mcx.modules.system.rest.UserController.createUser()', '{\"createBy\":\"admin\",\"createTime\":1710513792308,\"dept\":{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"subCount\":0},\"deptId\":18,\"email\":\"1633420846@qq.com\",\"enabled\":true,\"gender\":\"男\",\"id\":7,\"isAdmin\":false,\"jobs\":[{\"id\":13}],\"nickName\":\"碧落\",\"password\":\"$2a$10$o4jO6LsXUiLc9pWXpd9gUOXzFakY1bDHAMA8yMdN4oQ9XV/c1TIbi\",\"phone\":\"15281392341\",\"roles\":[{\"dataScope\":\"本级\",\"id\":2,\"level\":3}],\"updateBy\":\"admin\",\"updateTime\":1710513792308,\"username\":\"biluo\"}', '123.147.249.170', 96, 'admin', '中国重庆重庆市', 'MSEdge 122', 'org.springframework.dao.DuplicateKeyException: \n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'7-13\' for key \'PRIMARY\'\n### The error may exist in URL [jar:file:/www/wwwroot/mcx/cxblog/cxblog-main-1.1.jar!/BOOT-INF/classes!/mapper/system/UserJobMapper.xml]\n### The error may involve defaultParameterMap\n### The error occurred while setting parameters\n### SQL: insert into sys_users_jobs (user_id, job_id)         values          (               ?, ?          )\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'7-13\' for key \'PRIMARY\'\n; Duplicate entry \'7-13\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'7-13\' for key \'PRIMARY\'\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:247)\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:70)\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:91)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:441)\n	at com.sun.proxy.$Proxy115.insert(Unknown Source)\n	at org.mybatis.spring.SqlSessionTemplate.insert(SqlSessionTemplate.java:272)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperMethod.execute(MybatisMapperMethod.java:59)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy$PlainMethodInvoker.invoke(MybatisMapperProxy.java:148)\n	at com.baomidou.mybatisplus.core.override.MybatisMapperProxy.invoke(MybatisMapperProxy.java:89)\n	at com.sun.proxy.$Proxy197.insertData(Unknown Source)\n	at me.mcx.modules.system.service.impl.UserServiceImpl.create(UserServiceImpl.java:102)\n	at me.mcx.modules.system.service.impl.UserServiceImpl$$FastClassBySpringCGLIB$$f4f9692b.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\n	at org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:388)\n	at org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at me.mcx.modules.system.service.impl.UserServiceImpl$$EnhancerBySpringCGLIB$$78ba0ba7.create(<generated>)\n	at me.mcx.modules.system.rest.UserController.createUser(UserController.java:112)\n	at me.mcx.modules.system.rest.UserController$$FastClassBySpringCGLIB$$cc1298ab.invoke(<generated>)\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:783)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.AspectJAfterThrowingAdvice.invoke(AspectJAfterThrowingAdvice.java:64)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\n	at me.mcx.aspect.LogAspect.logAround(LogAspect.java:68)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:634)\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:624)\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:72)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.security.access.intercept.aopalliance.MethodSecurityInterceptor.invoke(MethodSecurityInterceptor.java:61)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\n	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:753)\n	at org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:698)\n	at me.mcx.modules.system.rest.UserController$$EnhancerBySpringCGLIB$$2666096e.createUser(<generated>)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:117)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:895)\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:808)\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1067)\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:963)\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:681)\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:764)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:227)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:111)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:124)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:327)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.invoke(FilterSecurityInterceptor.java:115)\n	at org.springframework.security.web.access.intercept.FilterSecurityInterceptor.doFilter(FilterSecurityInterceptor.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:122)\n	at org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:116)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:126)\n	at org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:81)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:109)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:149)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at me.mcx.modules.security.security.TokenFilter.doFilter(TokenFilter.java:90)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:103)\n	at org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:89)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\n	at org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:110)\n	at org.springframework.security.web.context.SecurityContextPersistenceFilter.doFilter(SecurityContextPersistenceFilter.java:80)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:55)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:336)\n	at org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:211)\n	at org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:183)\n	at org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:354)\n	at org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:267)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:117)\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:189)\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:162)\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:197)\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:97)\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:540)\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:135)\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:78)\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:359)\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:399)\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:65)\n	at org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:889)\n	at org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1735)\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\n	at org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\n	at org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\n	at java.lang.Thread.run(Thread.java:750)\nCaused by: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'7-13\' for key \'PRIMARY\'\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:117)\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:953)\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:371)\n	at net.sf.log4jdbc.sql.jdbcapi.PreparedStatementSpy.execute(PreparedStatementSpy.java:443)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3461)\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3459)\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:167)\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:497)\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.update(PreparedStatementHandler.java:47)\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.update(RoutingStatementHandler.java:74)\n	at sun.reflect.GeneratedMethodAccessor217.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:64)\n	at com.sun.proxy.$Proxy171.update(Unknown Source)\n	at org.apache.ibatis.executor.SimpleExecutor.doUpdate(SimpleExecutor.java:50)\n	at org.apache.ibatis.executor.BaseExecutor.update(BaseExecutor.java:117)\n	at sun.reflect.GeneratedMethodAccessor216.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.apache.ibatis.plugin.Invocation.proceed(Invocation.java:49)\n	at com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor.intercept(MybatisPlusInterceptor.java:106)\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:62)\n	at com.sun.proxy.$Proxy170.update(Unknown Source)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.update(DefaultSqlSession.java:194)\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.insert(DefaultSqlSession.java:181)\n	at sun.reflect.GeneratedMethodAccessor227.invoke(Unknown Source)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:427)\n	... 135 more\n', '2024-03-15 22:43:12');
INSERT INTO `sys_log` VALUES (4204, '新增用户', 'INFO', 'me.mcx.modules.system.rest.UserController.createUser()', '{\"createBy\":\"admin\",\"createTime\":1710513798337,\"dept\":{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"subCount\":0},\"deptId\":18,\"email\":\"1633420846@qq.com\",\"enabled\":true,\"gender\":\"男\",\"id\":8,\"isAdmin\":false,\"jobs\":[{\"id\":13}],\"nickName\":\"碧落\",\"password\":\"$2a$10$p9mGsXxHEe8vbUoaPAqqsufNXMPpRb5c6e5R9U1D74oDVmIPsh8Z.\",\"phone\":\"15281392341\",\"roles\":[{\"dataScope\":\"本级\",\"id\":2,\"level\":3}],\"updateBy\":\"admin\",\"updateTime\":1710513798337,\"username\":\"biluo\"}', '123.147.249.170', 98, 'admin', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:43:18');
INSERT INTO `sys_log` VALUES (4205, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"biluo\"}', '123.147.249.170', 92, 'biluo', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:45:31');
INSERT INTO `sys_log` VALUES (4206, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"tsuimengchao\"}', '123.147.249.170', 96, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:52:25');
INSERT INTO `sys_log` VALUES (4207, '修改角色菜单', 'INFO', 'me.mcx.modules.system.rest.RoleController.updateRoleMenu()', '{\"dataScope\":\"本级\",\"id\":1,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":1,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":2,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":3,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":5,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":6,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":7,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":9,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":10,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":11,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":14,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":15,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":18,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":19,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":28,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":30,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":32,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":33,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":34,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":35,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":36,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":37,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":38,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":39,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":41,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":44,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":45,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":46,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":48,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":49,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":50,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":52,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":53,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":54,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":56,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":57,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":58,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":60,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":61,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":62,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":64,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":65,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":66,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":73,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":74,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":75,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":77,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":78,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":79,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":80,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":82,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":83,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":90,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":92,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":93,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":94,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":97,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":98,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":102,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":103,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":104,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":105,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":106,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":107,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":108,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":109,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":110,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":111,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":112,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":113,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":114,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":116,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":119,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":120,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":121,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":122,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":123,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":124,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":125,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":126,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":127,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":128,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":129,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":130,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":131,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":132,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":133,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":134,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":135,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":136,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":137,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":138,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":139,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":140,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":141,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":142,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":143,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":144,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":145,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":146,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":147,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":148,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":149,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":150,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":151,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":152,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":153,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":154,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":155,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":156,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":157,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":158,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":159,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":160,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":161,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":162,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":163,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":164,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":165,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":166,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":167,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":168,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":169,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":170,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":171,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":172,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":173,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":174,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":175,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":176,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":177,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":178,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":179,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":180,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":181,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":182,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":183,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":184,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":185,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":186,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":187,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":188,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":189,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":190,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":191,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":192,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":193,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":194,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":195,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":196,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":197,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":200,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":201,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":202,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":203,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}', '123.147.249.170', 39, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 22:57:14');
INSERT INTO `sys_log` VALUES (4208, '修改角色菜单', 'INFO', 'me.mcx.modules.system.rest.RoleController.updateRoleMenu()', '{\"dataScope\":\"本级\",\"id\":2,\"level\":3,\"menus\":[{\"hasChildren\":false,\"id\":161,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":165,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":169,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":170,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":118,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":119,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":120,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":121,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":122,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":123,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":189,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":125,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":126,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":127,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":192,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":128,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":193,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":129,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":130,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":131,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":196,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":197,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":133,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":134,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":135,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":136,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":137,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":201,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":138,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":203,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":141,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":144,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":147,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":150,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":152,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":155,\"leaf\":true,\"menuSort\":999,\"subCount\":0},{\"hasChildren\":false,\"id\":158,\"leaf\":true,\"menuSort\":999,\"subCount\":0}]}', '123.147.249.170', 26, 'tsuimengchao', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 23:00:59');
INSERT INTO `sys_log` VALUES (4209, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"biluo\"}', '123.147.249.170', 107, 'biluo', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 23:02:00');
INSERT INTO `sys_log` VALUES (4210, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 55, 'biluo', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-15 23:04:13');
INSERT INTO `sys_log` VALUES (4211, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 30, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:36:42');
INSERT INTO `sys_log` VALUES (4212, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 23, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:36:46');
INSERT INTO `sys_log` VALUES (4213, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 38, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:37:09');
INSERT INTO `sys_log` VALUES (4214, '首页-获取历史聊天记录', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiImMessageController.selectHistoryList()', '', '123.147.249.170', 2, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:37:34');
INSERT INTO `sys_log` VALUES (4215, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 41, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:37:44');
INSERT INTO `sys_log` VALUES (4216, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.249.170', 31, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 16:37:46');
INSERT INTO `sys_log` VALUES (4217, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 29, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 18:53:00');
INSERT INTO `sys_log` VALUES (4218, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 27, '', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:22:08');
INSERT INTO `sys_log` VALUES (4219, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 23, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:22:19');
INSERT INTO `sys_log` VALUES (4220, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 40, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:22:23');
INSERT INTO `sys_log` VALUES (4221, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"tsuimengchao\"}', '123.147.252.33', 91, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:22:53');
INSERT INTO `sys_log` VALUES (4222, '首页-获取历史聊天记录', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiImMessageController.selectHistoryList()', '', '123.147.252.33', 4, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:23:43');
INSERT INTO `sys_log` VALUES (4223, '首页-获取历史聊天记录', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiImMessageController.selectHistoryList()', '', '123.147.252.33', 2, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:23:45');
INSERT INTO `sys_log` VALUES (4224, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 30, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:23:56');
INSERT INTO `sys_log` VALUES (4225, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.252.33', 22, 'tsuimengchao', '中国重庆重庆市', 'Chrome 121', NULL, '2024-03-16 20:24:48');
INSERT INTO `sys_log` VALUES (4226, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 26, '', '中国重庆重庆市', 'Chrome 122', NULL, '2024-03-16 21:07:52');
INSERT INTO `sys_log` VALUES (4227, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.247.110', 6, '', '中国重庆重庆市', 'Chrome 122', NULL, '2024-03-16 21:07:57');
INSERT INTO `sys_log` VALUES (4228, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 33, 'tsuimengchao', '中国重庆重庆市', 'Chrome 122', NULL, '2024-03-16 21:22:22');
INSERT INTO `sys_log` VALUES (4229, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.247.110', 9, 'tsuimengchao', '中国重庆重庆市', 'Chrome 122', NULL, '2024-03-16 21:22:50');
INSERT INTO `sys_log` VALUES (4230, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 17, '', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-16 21:25:09');
INSERT INTO `sys_log` VALUES (4231, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 11, '', '中国重庆重庆市', 'MicroMessenger 8.0.5', NULL, '2024-03-16 23:01:10');
INSERT INTO `sys_log` VALUES (4232, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 18, '', '中国重庆重庆市', 'MicroMessenger 8.0.5', NULL, '2024-03-16 23:01:27');
INSERT INTO `sys_log` VALUES (4233, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 5, '', '中国重庆重庆市', 'MicroMessenger 8.0.5', NULL, '2024-03-16 23:01:33');
INSERT INTO `sys_log` VALUES (4234, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 19, '', '中国重庆重庆市', 'MicroMessenger 8.0.5', NULL, '2024-03-16 23:01:35');
INSERT INTO `sys_log` VALUES (4235, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 2, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:06');
INSERT INTO `sys_log` VALUES (4236, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 21, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:09');
INSERT INTO `sys_log` VALUES (4237, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.247.110', 6, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:15');
INSERT INTO `sys_log` VALUES (4238, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 2, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:22');
INSERT INTO `sys_log` VALUES (4239, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 3, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:24');
INSERT INTO `sys_log` VALUES (4240, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 15, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:25');
INSERT INTO `sys_log` VALUES (4241, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 3, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:46');
INSERT INTO `sys_log` VALUES (4242, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 14, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:47');
INSERT INTO `sys_log` VALUES (4243, '门户-用户查看文章详情', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleInfo()', '', '123.147.247.110', 6, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:02:49');
INSERT INTO `sys_log` VALUES (4244, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 2, '', '中国重庆重庆市', 'MicroMessenger 8.0.47.2560', NULL, '2024-03-16 23:03:02');
INSERT INTO `sys_log` VALUES (4245, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 2, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:06:26');
INSERT INTO `sys_log` VALUES (4246, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 15, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:11:08');
INSERT INTO `sys_log` VALUES (4247, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 3, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:11:12');
INSERT INTO `sys_log` VALUES (4248, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 3, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:11:13');
INSERT INTO `sys_log` VALUES (4249, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 2, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:11:52');
INSERT INTO `sys_log` VALUES (4250, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 49, '', '中国重庆重庆市', 'Alipay 10.5.20', NULL, '2024-03-16 23:31:37');
INSERT INTO `sys_log` VALUES (4251, '首页-用户访问首页', 'WEB-INFO', 'me.mcx.modules.blog.web.rest.ApiArticleController.selectArticleList()', '', '123.147.247.110', 18, '', '中国重庆重庆市', 'MSEdge 122', NULL, '2024-03-16 23:36:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(5) NULL DEFAULT 0 COMMENT '子菜单数目',
  `type` int(11) NULL DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '组件',
  `menu_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '链接地址',
  `i_frame` bit(1) NULL DEFAULT NULL COMMENT '是否外链',
  `cache` bit(1) NULL DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) NULL DEFAULT b'0' COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `uniq_title`(`title`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 204 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, NULL, 7, 0, '系统管理', NULL, NULL, 1, 'system', 'system', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO `sys_menu` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', b'0', b'0', b'0', 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO `sys_menu` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', b'0', b'0', b'0', 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO `sys_menu` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', b'0', b'0', b'0', 'menu:list', NULL, NULL, '2018-12-18 15:17:28', NULL);
INSERT INTO `sys_menu` VALUES (6, NULL, 5, 0, '系统监控', NULL, NULL, 10, 'monitor', 'monitor', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:17:48', NULL);
INSERT INTO `sys_menu` VALUES (7, 6, 0, 1, '操作日志', 'Log', 'monitor/log/index', 11, 'log', 'logs', b'0', b'1', b'0', NULL, NULL, 'admin', '2018-12-18 15:18:26', '2020-06-06 13:11:57');
INSERT INTO `sys_menu` VALUES (9, 6, 0, 1, 'SQL监控', 'Sql', 'monitor/sql/index', 18, 'sqlMonitor', 'druid', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-18 15:19:34', NULL);
INSERT INTO `sys_menu` VALUES (10, NULL, 5, 0, '组件管理', NULL, NULL, 50, 'zujian', 'components', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO `sys_menu` VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO `sys_menu` VALUES (14, 36, 0, 1, '邮件工具', 'Email', 'tools/email/index', 35, 'email', 'email', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 10:13:09', NULL);
INSERT INTO `sys_menu` VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO `sys_menu` VALUES (18, 36, 3, 1, '存储管理', 'Storage', 'tools/storage/index', 34, 'qiniu', 'storage', b'0', b'0', b'0', 'storage:list', NULL, NULL, '2018-12-31 11:12:15', NULL);
INSERT INTO `sys_menu` VALUES (19, 36, 0, 1, '支付宝工具', 'AliPay', 'tools/aliPay/index', 37, 'alipay', 'aliPay', b'0', b'0', b'0', NULL, NULL, NULL, '2018-12-31 14:52:38', NULL);
INSERT INTO `sys_menu` VALUES (28, 1, 3, 1, '任务调度', 'Timing', 'system/timing/index', 999, 'timing', 'timing', b'0', b'0', b'0', 'timing:list', NULL, NULL, '2019-01-07 20:34:40', NULL);
INSERT INTO `sys_menu` VALUES (30, 36, 0, 1, '代码生成', 'GeneratorIndex', 'generator/index', 32, 'dev', 'generator', b'0', b'1', b'0', NULL, NULL, NULL, '2019-01-11 15:45:55', NULL);
INSERT INTO `sys_menu` VALUES (32, 6, 0, 1, '异常日志', 'ErrorLog', 'monitor/log/errorLog', 12, 'error', 'errorLog', b'0', b'0', b'0', NULL, NULL, NULL, '2019-01-13 13:49:03', NULL);
INSERT INTO `sys_menu` VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO `sys_menu` VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO `sys_menu` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', b'0', b'0', b'0', 'dept:list', NULL, NULL, '2019-03-25 09:46:00', NULL);
INSERT INTO `sys_menu` VALUES (36, NULL, 7, 0, '系统工具', NULL, '', 30, 'sys-tools', 'sys-tools', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 10:57:35', NULL);
INSERT INTO `sys_menu` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', b'0', b'0', b'0', 'job:list', NULL, NULL, '2019-03-29 13:51:18', NULL);
INSERT INTO `sys_menu` VALUES (38, 36, 0, 1, '接口文档', 'Swagger', 'tools/swagger/index', 36, 'swagger', 'swagger2', b'0', b'0', b'0', NULL, NULL, NULL, '2019-03-29 19:57:53', NULL);
INSERT INTO `sys_menu` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', b'0', b'0', b'0', 'dict:list', NULL, NULL, '2019-04-10 11:49:04', NULL);
INSERT INTO `sys_menu` VALUES (41, 6, 0, 1, '在线用户', 'OnlineUser', 'monitor/online/index', 10, 'Steve-Jobs', 'online', b'0', b'0', b'0', NULL, NULL, NULL, '2019-10-26 22:08:43', NULL);
INSERT INTO `sys_menu` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `sys_menu` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `sys_menu` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `sys_menu` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', b'0', b'0', b'0', 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `sys_menu` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', b'0', b'0', b'0', 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `sys_menu` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `sys_menu` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `sys_menu` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `sys_menu` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `sys_menu` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO `sys_menu` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO `sys_menu` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO `sys_menu` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'job:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO `sys_menu` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'job:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO `sys_menu` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'job:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO `sys_menu` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO `sys_menu` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO `sys_menu` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO `sys_menu` VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', b'0', b'0', b'0', 'timing:add', NULL, NULL, '2019-10-29 13:07:28', NULL);
INSERT INTO `sys_menu` VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'timing:edit', NULL, NULL, '2019-10-29 13:07:41', NULL);
INSERT INTO `sys_menu` VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'timing:del', NULL, NULL, '2019-10-29 13:07:54', NULL);
INSERT INTO `sys_menu` VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', b'0', b'0', b'0', 'storage:add', NULL, NULL, '2019-10-29 13:09:09', NULL);
INSERT INTO `sys_menu` VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', b'0', b'0', b'0', 'storage:edit', NULL, NULL, '2019-10-29 13:09:22', NULL);
INSERT INTO `sys_menu` VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', b'0', b'0', b'0', 'storage:del', NULL, NULL, '2019-10-29 13:09:34', NULL);
INSERT INTO `sys_menu` VALUES (80, 6, 0, 1, '服务监控', 'ServerMonitor', 'monitor/server/index', 14, 'codeConsole', 'server', b'0', b'0', b'0', 'monitor:list', NULL, 'admin', '2019-11-07 13:06:39', '2020-05-04 18:20:50');
INSERT INTO `sys_menu` VALUES (82, 36, 0, 1, '生成配置', 'GeneratorConfig', 'generator/config', 33, 'dev', 'generator/config/:tableName', b'0', b'1', b'1', '', NULL, NULL, '2019-11-17 20:08:56', NULL);
INSERT INTO `sys_menu` VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', b'0', b'1', b'0', '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO `sys_menu` VALUES (90, NULL, 5, 1, '运维管理', 'Mnt', '', 20, 'mnt', 'mnt', b'0', b'0', b'0', NULL, NULL, NULL, '2019-11-09 10:31:08', NULL);
INSERT INTO `sys_menu` VALUES (92, 90, 3, 1, '服务器', 'ServerDeploy', 'mnt/server/index', 22, 'server', 'mnt/serverDeploy', b'0', b'0', b'0', 'serverDeploy:list', NULL, NULL, '2019-11-10 10:29:25', NULL);
INSERT INTO `sys_menu` VALUES (93, 90, 3, 1, '应用管理', 'App', 'mnt/app/index', 23, 'app', 'mnt/app', b'0', b'0', b'0', 'app:list', NULL, NULL, '2019-11-10 11:05:16', NULL);
INSERT INTO `sys_menu` VALUES (94, 90, 3, 1, '部署管理', 'Deploy', 'mnt/deploy/index', 24, 'deploy', 'mnt/deploy', b'0', b'0', b'0', 'deploy:list', NULL, NULL, '2019-11-10 15:56:55', NULL);
INSERT INTO `sys_menu` VALUES (97, 90, 1, 1, '部署备份', 'DeployHistory', 'mnt/deployHistory/index', 25, 'backup', 'mnt/deployHistory', b'0', b'0', b'0', 'deployHistory:list', NULL, NULL, '2019-11-10 16:49:44', NULL);
INSERT INTO `sys_menu` VALUES (98, 90, 3, 1, '数据库管理', 'Database', 'mnt/database/index', 26, 'database', 'mnt/database', b'0', b'0', b'0', 'database:list', NULL, NULL, '2019-11-10 20:40:04', NULL);
INSERT INTO `sys_menu` VALUES (102, 97, 0, 2, '删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deployHistory:del', NULL, NULL, '2019-11-17 09:32:48', NULL);
INSERT INTO `sys_menu` VALUES (103, 92, 0, 2, '服务器新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:add', NULL, NULL, '2019-11-17 11:08:33', NULL);
INSERT INTO `sys_menu` VALUES (104, 92, 0, 2, '服务器编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:edit', NULL, NULL, '2019-11-17 11:08:57', NULL);
INSERT INTO `sys_menu` VALUES (105, 92, 0, 2, '服务器删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'serverDeploy:del', NULL, NULL, '2019-11-17 11:09:15', NULL);
INSERT INTO `sys_menu` VALUES (106, 93, 0, 2, '应用新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:add', NULL, NULL, '2019-11-17 11:10:03', NULL);
INSERT INTO `sys_menu` VALUES (107, 93, 0, 2, '应用编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:edit', NULL, NULL, '2019-11-17 11:10:28', NULL);
INSERT INTO `sys_menu` VALUES (108, 93, 0, 2, '应用删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'app:del', NULL, NULL, '2019-11-17 11:10:55', NULL);
INSERT INTO `sys_menu` VALUES (109, 94, 0, 2, '部署新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:add', NULL, NULL, '2019-11-17 11:11:22', NULL);
INSERT INTO `sys_menu` VALUES (110, 94, 0, 2, '部署编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:edit', NULL, NULL, '2019-11-17 11:11:41', NULL);
INSERT INTO `sys_menu` VALUES (111, 94, 0, 2, '部署删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'deploy:del', NULL, NULL, '2019-11-17 11:12:01', NULL);
INSERT INTO `sys_menu` VALUES (112, 98, 0, 2, '数据库新增', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:add', NULL, NULL, '2019-11-17 11:12:43', NULL);
INSERT INTO `sys_menu` VALUES (113, 98, 0, 2, '数据库编辑', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:edit', NULL, NULL, '2019-11-17 11:12:58', NULL);
INSERT INTO `sys_menu` VALUES (114, 98, 0, 2, '数据库删除', NULL, '', 999, '', '', b'0', b'0', b'0', 'database:del', NULL, NULL, '2019-11-17 11:13:14', NULL);
INSERT INTO `sys_menu` VALUES (116, 36, 0, 1, '生成预览', 'Preview', 'generator/preview', 999, 'java', 'generator/preview/:tableName', b'0', b'1', b'1', NULL, NULL, NULL, '2019-11-26 14:54:36', NULL);
INSERT INTO `sys_menu` VALUES (118, NULL, 4, 0, '博客管理', NULL, NULL, 5, 'education', 'blogs', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (119, 118, 3, 1, '文章管理', NULL, 'blogs/articles', 1, 'doc', 'articles', b'0', b'1', b'0', 'article:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (120, 118, 1, 1, '标签管理', NULL, 'blogs/tags', 2, 'blog', 'tags', b'0', b'1', b'0', 'tag:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (121, 118, 1, 1, '分类管理', NULL, 'blogs/category', 3, 'dictionary', 'category', b'0', b'1', b'0', 'category:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (122, 118, 4, 1, '说说管理', NULL, 'blogs/say', 4, 'nested', 'say', b'0', b'1', b'0', 'say:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (123, NULL, 9, 0, '网站管理', NULL, NULL, 6, 'phone', 'site', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (124, 123, 1, 1, '网站配置', NULL, 'site/webConfig/index', 3, 'password', 'webconfig', b'0', b'0', b'0', 'webconfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (125, 123, 3, 1, '网址分类管理', NULL, 'site/navigation/index', 4, 'chain', 'siteClass', b'0', b'0', b'0', 'siteClass:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (126, 123, 1, 1, '友链管理', NULL, 'site/friendLink/index', 3, 'link', 'friendLink', b'0', b'0', b'0', 'friendLink:list', 'admin', 'admin', '2024-01-18 14:18:55', '2024-01-18 14:18:55');
INSERT INTO `sys_menu` VALUES (127, 123, 1, 1, '博客字典管理', NULL, 'site/dict/index', 1, 'dictionary', 'blogdict', b'0', b'0', b'0', 'blogDict:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (128, NULL, 3, 0, '消息管理', NULL, NULL, 7, 'message', 'news', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (129, 128, 1, 1, '评论管理', NULL, 'news/comment', 999, 'email', 'comment', b'0', b'0', b'0', 'comment:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (130, 128, 1, 1, '留言管理', NULL, 'news/message', 999, 'message', 'message', b'0', b'0', b'0', 'message:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (131, 128, 1, 1, '反馈管理', NULL, 'news/feedback', 999, 'sys-tools', 'feedback', b'0', b'0', b'0', 'feedback:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (132, 123, 1, 1, '系统配置', NULL, 'site/systemConfig/index', 4, 'log', 'systemconfig', b'0', b'0', b'0', 'systemconfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (133, 123, 1, 1, '博客字典数据', NULL, 'site/dict/data', 2, 'database', 'blogDictData', b'0', b'0', b'1', 'blogDictData:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (134, 123, 3, 1, '导航网址管理', NULL, 'site/navigation/navigation', 1, 'international', 'navigation', b'0', b'0', b'1', 'navigation:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (135, 123, 4, 1, '圈子管理', NULL, 'site/talk/index', 2, 'message', 'talk', b'0', b'0', b'0', 'talk:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (136, 123, 1, 1, '打赏管理', '', 'site/sponsor/index', 3, 'develop', 'sponsor', b'0', b'0', b'0', 'sponsor:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (137, 119, 0, 2, '文章编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (138, 119, 0, 2, '文章新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (139, 119, 0, 2, '文章删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (140, 120, 0, 2, '标签编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tag:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (141, 120, 0, 2, '标签新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'1', 'tag:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (142, 120, 0, 2, '标签删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'1', 'tag:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (143, 121, 0, 2, '分类编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (144, 121, 0, 2, '分类新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (145, 121, 0, 2, '分类删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (146, 122, 0, 2, '说说编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (147, 122, 0, 2, '说说新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (148, 122, 0, 2, '说说删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (149, 119, 0, 2, '文章批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:deleteBatch', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (150, 119, 0, 2, '文章爬虫', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:reptile', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (151, 119, 0, 2, '文章置顶文章', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:top', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (152, 119, 0, 2, '文章详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (153, 119, 0, 2, '文章SEO', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:baiduSeo', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (154, 119, 0, 2, '文章发布或下架文章', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'article:pubOrShelf', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (155, 120, 0, 2, '标签详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tag:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (156, 120, 0, 2, '标签批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tag:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (157, 120, 0, 2, '标签置顶', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tag:top', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (158, 121, 0, 2, '分类详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (159, 121, 0, 2, '分类批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (160, 121, 0, 2, '分类置顶', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:top', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (161, 127, 0, 2, '博客字典添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (162, 127, 0, 2, '博客字典修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (163, 127, 0, 2, '博客字典批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (164, 127, 0, 2, '博客字典删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (165, 133, 0, 2, '博客字典细节添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDictData:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (166, 133, 0, 2, '博客字典细节修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDictData:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (167, 133, 0, 2, '博客字典细节批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDictData:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (168, 133, 0, 2, '博客字典细节删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDictData:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (169, 133, 0, 2, '博客字典细节类型集合字典数据', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDictData:getDataByDictType', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (170, 134, 0, 2, '网址添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (171, 134, 0, 2, '网址修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (172, 134, 0, 2, '网址批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (173, 124, 0, 2, '网站配置修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'webConfig:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (174, 126, 0, 2, '友情链接添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'friendLink:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (175, 126, 0, 2, '友情链接修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'friendLink:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (176, 126, 0, 2, '友情链接删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'friendLink:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (177, 126, 0, 2, '友情链接置顶', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'friendLink:top', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (178, 136, 0, 2, '打赏修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'sponsor:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (179, 136, 0, 2, '打赏删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'sponsor:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (180, 132, 0, 2, '系统配置修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'systemConfig:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (181, 132, 0, 2, '系统配置查询', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'systemConfig:getConfig', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (182, 129, 0, 2, '评论批量删除评论', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'comment:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (183, 130, 0, 2, '留言回复', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'message:test', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (184, 130, 0, 2, '留言批量通过', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'message:passBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (185, 130, 0, 2, '留言批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'message:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (186, 130, 0, 2, '留言删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'message:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (187, 131, 0, 2, '反馈修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'feedback:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (188, 131, 0, 2, '反馈批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'feedback:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (189, 135, 0, 2, '圈子新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'talk:add', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (190, 135, 0, 2, '圈子编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'talk:edit', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (191, 135, 0, 2, '圈子删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'talk:del', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (192, 122, 0, 2, '说说详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (193, 125, 0, 2, '添加网址分类', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'siteClass:add', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (194, 125, 0, 2, '修改网址分类', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'siteClass:edit', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (195, 125, 0, 2, '删除网址分类', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'siteClass:deleteBatch', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (196, 135, 3, 2, '圈子详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'talk:info', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (197, 118, 4, 1, '论坛管理', NULL, 'blogs/forum', 4, 'nested', 'forum', b'0', b'1', b'0', 'forum:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (200, 197, 0, 2, '讨论编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'forum:edit', 'admin', 'admin', '2024-03-13 22:43:04', '2024-03-13 22:43:04');
INSERT INTO `sys_menu` VALUES (201, 197, 0, 2, '讨论新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'forum:add', 'admin', 'admin', '2024-03-13 22:44:39', '2024-03-13 22:44:39');
INSERT INTO `sys_menu` VALUES (202, 197, 0, 2, '讨论删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'forum:del', 'admin', 'admin', '2024-03-13 22:44:58', '2024-03-13 22:44:58');
INSERT INTO `sys_menu` VALUES (203, 197, 0, 2, '讨论详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'forum:info', 'admin', 'admin', '2024-03-13 22:45:16', '2024-03-13 22:45:16');

-- ----------------------------
-- Table structure for sys_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_job`;
CREATE TABLE `sys_quartz_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) NULL DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '参数',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `person_in_charge` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '报警邮箱',
  `sub_task` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '子任务ID',
  `pause_after_failure` bit(1) NULL DEFAULT NULL COMMENT '任务失败后是否暂停',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  INDEX `inx_is_pause`(`is_pause`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quartz_job
-- ----------------------------
INSERT INTO `sys_quartz_job` VALUES (2, 'testTask', '0/5 * * * * ?', b'1', '测试1', 'run1', 'test', '带参测试，多参使用json', '测试', NULL, NULL, NULL, NULL, 'admin', '2019-08-22 14:08:29', '2020-05-24 13:58:33');
INSERT INTO `sys_quartz_job` VALUES (3, 'testTask', '0/5 * * * * ?', b'1', '测试', 'run', '', '不带参测试', 'Zheng Jie', '', '5,6', b'1', NULL, 'admin', '2019-09-26 16:44:39', '2020-05-24 14:48:12');
INSERT INTO `sys_quartz_job` VALUES (5, 'Test', '0/5 * * * * ?', b'1', '任务告警测试', 'run', NULL, '测试', 'test', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:32:41', '2020-05-05 20:36:13');
INSERT INTO `sys_quartz_job` VALUES (6, 'testTask', '0/5 * * * * ?', b'1', '测试3', 'run2', NULL, '测试3', 'Zheng Jie', '', NULL, b'1', 'admin', 'admin', '2020-05-05 20:35:41', '2020-05-05 20:36:07');

-- ----------------------------
-- Table structure for sys_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_quartz_log`;
CREATE TABLE `sys_quartz_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `is_success` bit(1) NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_quartz_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `level` int(50) NULL DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `role_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24');
INSERT INTO `sys_role` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12');
INSERT INTO `sys_role` VALUES (3, '测试', 3, NULL, '全部', 'admin', 'admin', '2024-01-25 21:12:59', '2024-01-25 21:12:59');

-- ----------------------------
-- Table structure for sys_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_depts`;
CREATE TABLE `sys_roles_depts`  (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
  INDEX `FK7qg6itn5ajdoa9h9o78v9ksur`(`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色部门关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles_depts
-- ----------------------------

-- ----------------------------
-- Table structure for sys_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_roles_menus`;
CREATE TABLE `sys_roles_menus`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `FKcngg2qadojhi3a651a5adkvbq`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色菜单关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_roles_menus
-- ----------------------------
INSERT INTO `sys_roles_menus` VALUES (1, 1);
INSERT INTO `sys_roles_menus` VALUES (2, 1);
INSERT INTO `sys_roles_menus` VALUES (3, 1);
INSERT INTO `sys_roles_menus` VALUES (5, 1);
INSERT INTO `sys_roles_menus` VALUES (6, 1);
INSERT INTO `sys_roles_menus` VALUES (7, 1);
INSERT INTO `sys_roles_menus` VALUES (9, 1);
INSERT INTO `sys_roles_menus` VALUES (10, 1);
INSERT INTO `sys_roles_menus` VALUES (11, 1);
INSERT INTO `sys_roles_menus` VALUES (14, 1);
INSERT INTO `sys_roles_menus` VALUES (15, 1);
INSERT INTO `sys_roles_menus` VALUES (18, 1);
INSERT INTO `sys_roles_menus` VALUES (19, 1);
INSERT INTO `sys_roles_menus` VALUES (28, 1);
INSERT INTO `sys_roles_menus` VALUES (30, 1);
INSERT INTO `sys_roles_menus` VALUES (32, 1);
INSERT INTO `sys_roles_menus` VALUES (33, 1);
INSERT INTO `sys_roles_menus` VALUES (34, 1);
INSERT INTO `sys_roles_menus` VALUES (35, 1);
INSERT INTO `sys_roles_menus` VALUES (36, 1);
INSERT INTO `sys_roles_menus` VALUES (37, 1);
INSERT INTO `sys_roles_menus` VALUES (38, 1);
INSERT INTO `sys_roles_menus` VALUES (39, 1);
INSERT INTO `sys_roles_menus` VALUES (41, 1);
INSERT INTO `sys_roles_menus` VALUES (44, 1);
INSERT INTO `sys_roles_menus` VALUES (45, 1);
INSERT INTO `sys_roles_menus` VALUES (46, 1);
INSERT INTO `sys_roles_menus` VALUES (48, 1);
INSERT INTO `sys_roles_menus` VALUES (49, 1);
INSERT INTO `sys_roles_menus` VALUES (50, 1);
INSERT INTO `sys_roles_menus` VALUES (52, 1);
INSERT INTO `sys_roles_menus` VALUES (53, 1);
INSERT INTO `sys_roles_menus` VALUES (54, 1);
INSERT INTO `sys_roles_menus` VALUES (56, 1);
INSERT INTO `sys_roles_menus` VALUES (57, 1);
INSERT INTO `sys_roles_menus` VALUES (58, 1);
INSERT INTO `sys_roles_menus` VALUES (60, 1);
INSERT INTO `sys_roles_menus` VALUES (61, 1);
INSERT INTO `sys_roles_menus` VALUES (62, 1);
INSERT INTO `sys_roles_menus` VALUES (64, 1);
INSERT INTO `sys_roles_menus` VALUES (65, 1);
INSERT INTO `sys_roles_menus` VALUES (66, 1);
INSERT INTO `sys_roles_menus` VALUES (73, 1);
INSERT INTO `sys_roles_menus` VALUES (74, 1);
INSERT INTO `sys_roles_menus` VALUES (75, 1);
INSERT INTO `sys_roles_menus` VALUES (77, 1);
INSERT INTO `sys_roles_menus` VALUES (78, 1);
INSERT INTO `sys_roles_menus` VALUES (79, 1);
INSERT INTO `sys_roles_menus` VALUES (80, 1);
INSERT INTO `sys_roles_menus` VALUES (82, 1);
INSERT INTO `sys_roles_menus` VALUES (83, 1);
INSERT INTO `sys_roles_menus` VALUES (90, 1);
INSERT INTO `sys_roles_menus` VALUES (92, 1);
INSERT INTO `sys_roles_menus` VALUES (93, 1);
INSERT INTO `sys_roles_menus` VALUES (94, 1);
INSERT INTO `sys_roles_menus` VALUES (97, 1);
INSERT INTO `sys_roles_menus` VALUES (98, 1);
INSERT INTO `sys_roles_menus` VALUES (102, 1);
INSERT INTO `sys_roles_menus` VALUES (103, 1);
INSERT INTO `sys_roles_menus` VALUES (104, 1);
INSERT INTO `sys_roles_menus` VALUES (105, 1);
INSERT INTO `sys_roles_menus` VALUES (106, 1);
INSERT INTO `sys_roles_menus` VALUES (107, 1);
INSERT INTO `sys_roles_menus` VALUES (108, 1);
INSERT INTO `sys_roles_menus` VALUES (109, 1);
INSERT INTO `sys_roles_menus` VALUES (110, 1);
INSERT INTO `sys_roles_menus` VALUES (111, 1);
INSERT INTO `sys_roles_menus` VALUES (112, 1);
INSERT INTO `sys_roles_menus` VALUES (113, 1);
INSERT INTO `sys_roles_menus` VALUES (114, 1);
INSERT INTO `sys_roles_menus` VALUES (116, 1);
INSERT INTO `sys_roles_menus` VALUES (118, 1);
INSERT INTO `sys_roles_menus` VALUES (119, 1);
INSERT INTO `sys_roles_menus` VALUES (120, 1);
INSERT INTO `sys_roles_menus` VALUES (121, 1);
INSERT INTO `sys_roles_menus` VALUES (122, 1);
INSERT INTO `sys_roles_menus` VALUES (123, 1);
INSERT INTO `sys_roles_menus` VALUES (124, 1);
INSERT INTO `sys_roles_menus` VALUES (125, 1);
INSERT INTO `sys_roles_menus` VALUES (126, 1);
INSERT INTO `sys_roles_menus` VALUES (127, 1);
INSERT INTO `sys_roles_menus` VALUES (128, 1);
INSERT INTO `sys_roles_menus` VALUES (129, 1);
INSERT INTO `sys_roles_menus` VALUES (130, 1);
INSERT INTO `sys_roles_menus` VALUES (131, 1);
INSERT INTO `sys_roles_menus` VALUES (132, 1);
INSERT INTO `sys_roles_menus` VALUES (133, 1);
INSERT INTO `sys_roles_menus` VALUES (134, 1);
INSERT INTO `sys_roles_menus` VALUES (135, 1);
INSERT INTO `sys_roles_menus` VALUES (136, 1);
INSERT INTO `sys_roles_menus` VALUES (137, 1);
INSERT INTO `sys_roles_menus` VALUES (138, 1);
INSERT INTO `sys_roles_menus` VALUES (139, 1);
INSERT INTO `sys_roles_menus` VALUES (140, 1);
INSERT INTO `sys_roles_menus` VALUES (141, 1);
INSERT INTO `sys_roles_menus` VALUES (142, 1);
INSERT INTO `sys_roles_menus` VALUES (143, 1);
INSERT INTO `sys_roles_menus` VALUES (144, 1);
INSERT INTO `sys_roles_menus` VALUES (145, 1);
INSERT INTO `sys_roles_menus` VALUES (146, 1);
INSERT INTO `sys_roles_menus` VALUES (147, 1);
INSERT INTO `sys_roles_menus` VALUES (148, 1);
INSERT INTO `sys_roles_menus` VALUES (149, 1);
INSERT INTO `sys_roles_menus` VALUES (150, 1);
INSERT INTO `sys_roles_menus` VALUES (151, 1);
INSERT INTO `sys_roles_menus` VALUES (152, 1);
INSERT INTO `sys_roles_menus` VALUES (153, 1);
INSERT INTO `sys_roles_menus` VALUES (154, 1);
INSERT INTO `sys_roles_menus` VALUES (155, 1);
INSERT INTO `sys_roles_menus` VALUES (156, 1);
INSERT INTO `sys_roles_menus` VALUES (157, 1);
INSERT INTO `sys_roles_menus` VALUES (158, 1);
INSERT INTO `sys_roles_menus` VALUES (159, 1);
INSERT INTO `sys_roles_menus` VALUES (160, 1);
INSERT INTO `sys_roles_menus` VALUES (161, 1);
INSERT INTO `sys_roles_menus` VALUES (162, 1);
INSERT INTO `sys_roles_menus` VALUES (163, 1);
INSERT INTO `sys_roles_menus` VALUES (164, 1);
INSERT INTO `sys_roles_menus` VALUES (165, 1);
INSERT INTO `sys_roles_menus` VALUES (166, 1);
INSERT INTO `sys_roles_menus` VALUES (167, 1);
INSERT INTO `sys_roles_menus` VALUES (168, 1);
INSERT INTO `sys_roles_menus` VALUES (169, 1);
INSERT INTO `sys_roles_menus` VALUES (170, 1);
INSERT INTO `sys_roles_menus` VALUES (171, 1);
INSERT INTO `sys_roles_menus` VALUES (172, 1);
INSERT INTO `sys_roles_menus` VALUES (173, 1);
INSERT INTO `sys_roles_menus` VALUES (174, 1);
INSERT INTO `sys_roles_menus` VALUES (175, 1);
INSERT INTO `sys_roles_menus` VALUES (176, 1);
INSERT INTO `sys_roles_menus` VALUES (177, 1);
INSERT INTO `sys_roles_menus` VALUES (178, 1);
INSERT INTO `sys_roles_menus` VALUES (179, 1);
INSERT INTO `sys_roles_menus` VALUES (180, 1);
INSERT INTO `sys_roles_menus` VALUES (181, 1);
INSERT INTO `sys_roles_menus` VALUES (182, 1);
INSERT INTO `sys_roles_menus` VALUES (183, 1);
INSERT INTO `sys_roles_menus` VALUES (184, 1);
INSERT INTO `sys_roles_menus` VALUES (185, 1);
INSERT INTO `sys_roles_menus` VALUES (186, 1);
INSERT INTO `sys_roles_menus` VALUES (187, 1);
INSERT INTO `sys_roles_menus` VALUES (188, 1);
INSERT INTO `sys_roles_menus` VALUES (189, 1);
INSERT INTO `sys_roles_menus` VALUES (190, 1);
INSERT INTO `sys_roles_menus` VALUES (191, 1);
INSERT INTO `sys_roles_menus` VALUES (192, 1);
INSERT INTO `sys_roles_menus` VALUES (193, 1);
INSERT INTO `sys_roles_menus` VALUES (194, 1);
INSERT INTO `sys_roles_menus` VALUES (195, 1);
INSERT INTO `sys_roles_menus` VALUES (196, 1);
INSERT INTO `sys_roles_menus` VALUES (197, 1);
INSERT INTO `sys_roles_menus` VALUES (200, 1);
INSERT INTO `sys_roles_menus` VALUES (201, 1);
INSERT INTO `sys_roles_menus` VALUES (202, 1);
INSERT INTO `sys_roles_menus` VALUES (203, 1);
INSERT INTO `sys_roles_menus` VALUES (118, 2);
INSERT INTO `sys_roles_menus` VALUES (119, 2);
INSERT INTO `sys_roles_menus` VALUES (120, 2);
INSERT INTO `sys_roles_menus` VALUES (121, 2);
INSERT INTO `sys_roles_menus` VALUES (122, 2);
INSERT INTO `sys_roles_menus` VALUES (123, 2);
INSERT INTO `sys_roles_menus` VALUES (125, 2);
INSERT INTO `sys_roles_menus` VALUES (126, 2);
INSERT INTO `sys_roles_menus` VALUES (127, 2);
INSERT INTO `sys_roles_menus` VALUES (128, 2);
INSERT INTO `sys_roles_menus` VALUES (129, 2);
INSERT INTO `sys_roles_menus` VALUES (130, 2);
INSERT INTO `sys_roles_menus` VALUES (131, 2);
INSERT INTO `sys_roles_menus` VALUES (133, 2);
INSERT INTO `sys_roles_menus` VALUES (134, 2);
INSERT INTO `sys_roles_menus` VALUES (135, 2);
INSERT INTO `sys_roles_menus` VALUES (136, 2);
INSERT INTO `sys_roles_menus` VALUES (137, 2);
INSERT INTO `sys_roles_menus` VALUES (138, 2);
INSERT INTO `sys_roles_menus` VALUES (141, 2);
INSERT INTO `sys_roles_menus` VALUES (144, 2);
INSERT INTO `sys_roles_menus` VALUES (147, 2);
INSERT INTO `sys_roles_menus` VALUES (150, 2);
INSERT INTO `sys_roles_menus` VALUES (152, 2);
INSERT INTO `sys_roles_menus` VALUES (155, 2);
INSERT INTO `sys_roles_menus` VALUES (158, 2);
INSERT INTO `sys_roles_menus` VALUES (161, 2);
INSERT INTO `sys_roles_menus` VALUES (165, 2);
INSERT INTO `sys_roles_menus` VALUES (169, 2);
INSERT INTO `sys_roles_menus` VALUES (170, 2);
INSERT INTO `sys_roles_menus` VALUES (189, 2);
INSERT INTO `sys_roles_menus` VALUES (192, 2);
INSERT INTO `sys_roles_menus` VALUES (193, 2);
INSERT INTO `sys_roles_menus` VALUES (196, 2);
INSERT INTO `sys_roles_menus` VALUES (197, 2);
INSERT INTO `sys_roles_menus` VALUES (201, 2);
INSERT INTO `sys_roles_menus` VALUES (203, 2);
INSERT INTO `sys_roles_menus` VALUES (1, 3);
INSERT INTO `sys_roles_menus` VALUES (2, 3);
INSERT INTO `sys_roles_menus` VALUES (3, 3);
INSERT INTO `sys_roles_menus` VALUES (5, 3);
INSERT INTO `sys_roles_menus` VALUES (28, 3);
INSERT INTO `sys_roles_menus` VALUES (35, 3);
INSERT INTO `sys_roles_menus` VALUES (37, 3);
INSERT INTO `sys_roles_menus` VALUES (39, 3);
INSERT INTO `sys_roles_menus` VALUES (44, 3);
INSERT INTO `sys_roles_menus` VALUES (48, 3);
INSERT INTO `sys_roles_menus` VALUES (52, 3);
INSERT INTO `sys_roles_menus` VALUES (56, 3);
INSERT INTO `sys_roles_menus` VALUES (60, 3);
INSERT INTO `sys_roles_menus` VALUES (64, 3);
INSERT INTO `sys_roles_menus` VALUES (73, 3);
INSERT INTO `sys_roles_menus` VALUES (118, 3);
INSERT INTO `sys_roles_menus` VALUES (119, 3);
INSERT INTO `sys_roles_menus` VALUES (120, 3);
INSERT INTO `sys_roles_menus` VALUES (121, 3);
INSERT INTO `sys_roles_menus` VALUES (122, 3);
INSERT INTO `sys_roles_menus` VALUES (123, 3);
INSERT INTO `sys_roles_menus` VALUES (124, 3);
INSERT INTO `sys_roles_menus` VALUES (125, 3);
INSERT INTO `sys_roles_menus` VALUES (126, 3);
INSERT INTO `sys_roles_menus` VALUES (127, 3);
INSERT INTO `sys_roles_menus` VALUES (128, 3);
INSERT INTO `sys_roles_menus` VALUES (129, 3);
INSERT INTO `sys_roles_menus` VALUES (130, 3);
INSERT INTO `sys_roles_menus` VALUES (131, 3);
INSERT INTO `sys_roles_menus` VALUES (132, 3);
INSERT INTO `sys_roles_menus` VALUES (133, 3);
INSERT INTO `sys_roles_menus` VALUES (134, 3);
INSERT INTO `sys_roles_menus` VALUES (135, 3);
INSERT INTO `sys_roles_menus` VALUES (136, 3);
INSERT INTO `sys_roles_menus` VALUES (138, 3);
INSERT INTO `sys_roles_menus` VALUES (141, 3);
INSERT INTO `sys_roles_menus` VALUES (144, 3);
INSERT INTO `sys_roles_menus` VALUES (147, 3);
INSERT INTO `sys_roles_menus` VALUES (150, 3);
INSERT INTO `sys_roles_menus` VALUES (152, 3);
INSERT INTO `sys_roles_menus` VALUES (153, 3);
INSERT INTO `sys_roles_menus` VALUES (155, 3);
INSERT INTO `sys_roles_menus` VALUES (158, 3);
INSERT INTO `sys_roles_menus` VALUES (160, 3);
INSERT INTO `sys_roles_menus` VALUES (161, 3);
INSERT INTO `sys_roles_menus` VALUES (165, 3);
INSERT INTO `sys_roles_menus` VALUES (169, 3);
INSERT INTO `sys_roles_menus` VALUES (170, 3);
INSERT INTO `sys_roles_menus` VALUES (174, 3);
INSERT INTO `sys_roles_menus` VALUES (183, 3);
INSERT INTO `sys_roles_menus` VALUES (184, 3);
INSERT INTO `sys_roles_menus` VALUES (189, 3);
INSERT INTO `sys_roles_menus` VALUES (192, 3);
INSERT INTO `sys_roles_menus` VALUES (193, 3);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门名称',
  `username` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户名',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `is_admin` bit(1) NULL DEFAULT b'0' COMMENT '是否为admin账号',
  `enabled` bit(1) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime NULL DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `login_type` int(10) NULL DEFAULT NULL COMMENT '登录方式',
  `user_info_id` bigint(10) NULL DEFAULT NULL COMMENT '用户详情id',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `os` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录系统',
  `last_login_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  `qq_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'QQ唯一ID',
  `weibo_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微博唯一ID',
  `gitee_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'gitee唯一ID',
  `github_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'github唯一ID',
  `weixin_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '微信唯一ID',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '梦辰雪', '男', '', 'tsuimengchao@163.com', 'avatar-20240302042334316.png', 'D:\\Work\\Program\\Codes\\mcx\\cxblog\\file\\avatar\\avatar-20240302042334316.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', b'1', NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31', 1, 1, '127.0.0.1', '未知', 'Windows 10', NULL, 'Chrome 11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试用户', '男', '15600618521', 'tsuimengchao@qq.com', NULL, NULL, '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', 1, 2, '192.168.0.177', '未知', 'Windows 10', '2023-12-01 21:37:30', 'Chrome 11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 5, 'common', '普通用户', '男', '15600168521', 'tsuimengchao@foxmail.com', NULL, NULL, '$2a$10$QN4tYvXkX2ZOIjRoYnSQEe.4/vR4eTevMwJZ0Eok0cl8uuYxaU5bK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', 1, 3, NULL, NULL, NULL, '2024-01-25 21:17:20', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 18, 'tsuimengchao', '崔梦超', '男', '18333191029', 'tsuimengchao@aliyun.com', 'cmc.png', NULL, '$2a$10$geSY48NRbQleWKqJ/R7ae.JjuEx4LjdOPD75omh3UgWVwsBVwwsA6', b'1', b'1', 'System', 'System', '2024-01-30 13:10:46', '2024-01-30 11:58:28', '2024-03-12 16:56:47', 1, 4, '192.168.219.93', '未知', NULL, '2024-03-12 16:56:47', NULL, 'EE5F91C7CD66BC0BC12E94947E276D80', '7450094325', '7726769', '59679126', 'oEv0d6-yZYb7X4MJ-ePmpfRskMJg');
INSERT INTO `sys_user` VALUES (5, 18, 'zhy', '赵浩悦', '女', '15176907852', '2490739669@qq.com', NULL, NULL, '$2a$10$jGXMDgNC9Cj1pDflaVlycuQbEhNyJeER4rbrNiShKV.MJideJ5/.6', b'0', b'1', 'System', 'System', NULL, '2024-01-30 21:59:15', '2024-01-30 21:59:15', 1, 5, NULL, NULL, NULL, '2024-01-30 21:59:14', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 18, 'biluo', '碧落', '男', '15281392341', '1633420846@qq.com', NULL, NULL, '$2a$10$p9mGsXxHEe8vbUoaPAqqsufNXMPpRb5c6e5R9U1D74oDVmIPsh8Z.', b'0', b'1', 'admin', 'admin', NULL, '2024-03-15 22:43:18', '2024-03-15 22:43:18', NULL, 6, NULL, NULL, NULL, '2024-03-15 22:43:18', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (2, 12);
INSERT INTO `sys_users_jobs` VALUES (3, 11);
INSERT INTO `sys_users_jobs` VALUES (4, 13);
INSERT INTO `sys_users_jobs` VALUES (5, 13);
INSERT INTO `sys_users_jobs` VALUES (6, 13);
INSERT INTO `sys_users_jobs` VALUES (7, 13);
INSERT INTO `sys_users_jobs` VALUES (8, 13);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户角色关联' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (4, 1);
INSERT INTO `sys_users_roles` VALUES (3, 2);
INSERT INTO `sys_users_roles` VALUES (5, 2);
INSERT INTO `sys_users_roles` VALUES (6, 2);
INSERT INTO `sys_users_roles` VALUES (7, 2);
INSERT INTO `sys_users_roles` VALUES (8, 2);
INSERT INTO `sys_users_roles` VALUES (2, 3);

-- ----------------------------
-- Table structure for tool_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_alipay_config`;
CREATE TABLE `tool_alipay_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '编码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '异步回调',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '私钥',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT '公钥',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '商户号',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '支付宝配置类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_alipay_config
-- ----------------------------
INSERT INTO `tool_alipay_config` VALUES (1, '9021000134676453', 'utf-8', 'JSON', 'https://openapi.alipaydev.com/gateway.do', 'http://xn--zfr188b.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/api/aliPay/notify', 'MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDmBaq1WSZdTUR/pwL7Hg8uWR1GaPa+W1b0oFi1MhPnCcoy8p/jdWVcJlgxhrONO9G87xbLLUaGJutVl+2QEAb7UwCy4pM15i/KTmfUShAeN/7NrOlQ4ZBl8h9v2zyRAy0IVyfgYAtopuvpbsHC6u446rrGNchoJqEklXWSd5iSu40n3zG1mWeo69hIEcCSZandZcKl8m/XKQ5KALs6h8xnwO75RKURvsC5CputP6ubVOBn249UVQxsuJe3P9mxP/7gNDxUSlCsRRJTg1AVE1OYqutJdH6KnyXOEgWuh+Y+KJC+FTiIXpS494Dn51wC0m7FpbuY5hU7U/MBaQZXVJg3AgMBAAECggEAF+/XB/AzEdqMmkwi/0bthYE4jq81njGbJvHYyWJgt9ZI+GxPPzhkR+alnuHJpZToCqVG1fXsNOGv88RPsII6d8T3eaYic6V0q7TlES5z5vEkzvqDfSs7/5/mrZk/AEg4U3neaHcWONnGCxC/kS0phTrIHQBTzqLWehwjlA5mDj7LvDVESr4RecgiagZm6UrNtjy/ptwspjQGT6TbrHTqWJnjm80gUhTMr9ztGphmB920+PbOuHISLl718i+/3ji4El55IeWVEeekw4nRmmGY8ESfaLiORTcncqCA9/qqWVAyQXu6lszAKMv15G0LFzjJcC/ByUq4cdvb+Q5QpJY9wQKBgQDzVKO04veOYB2BnqaXJhr0jZsLlSm+WWBAKSKXaFXEjVAHwFzNYICV4JMN99bFrvHQUW7vWQjFH+ep9lbnyoqF9zIp7+LegPlrkQ4adhw4ZRNhW7hIpsenjmqPR3Kw8QLBatFzCvrAOPzmTZgM/E73f23EyJqChhMV+rv1aWNaPwKBgQDx/6NeywlKppZTk+rAVPRpTGVyA0b8LNR/UFhiiHOKH6ZY+FCj6+h62U6taFQBFwnYIf5t3FaKP7Xj83IaEQc3VJFUl81vL3kLsFfjVUX1cdgdLAwgWkEFdsKBC4HTtPQgpET4S2p5wNZ3wRZr1/kBhdX+lPfgT+Saxu2QvtaUCQKBgQCLmqPRw+YD6WEEXOF3FoWgiR3LJ2krrFtsdC1EcLfEbM7do5+atSMQ2ieEfAzcneJegloDODGv5v4ipRJ3Kd0PvyMorFidD6IJ9M8Cn4DRWiwkT1sLU6R4nVzFl1hV6/CIx6AjQMlcP1XZS+tQh/FGTfXMUMtU11db5N6xjiVSQQKBgAGsN6/fDWhjsGRRgGzl6W6U5ZqdJS93C9z5bDL6KHpK77ZruPr5FXlL6TxPnU0IoLvKuFyACmUYPaSeuSou9fLO9dY02mmrVVXcWS8sFri0mb7R4B+VIB/uizejIbmZ5ZoYKJXix5Ch4ZmgTwxdyM3W4/zHgNMfGkBroZa/ivIpAoGAcrsL2xOlZLzNSv9jat5NofZ6/qhHm8vDo1O2nbWhqC07MUlAElFz5mIQ+E3N03A4czDt/rsQd2E5+aBNKksyn1oLfn+QOYAQhPXO6REnWrCDFnJEUa+nAylD3C6v6KPLuIpgsassezOG6nV77uWR43wuuKrOVdZbAgeJ4CvAmOU=', 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApu70u+TUsa7hOVrQaaeoB8lrPWWH/Gw54bUfYg2/0mxevdv1O0q9mpmnvHATMJoEOFbRyFG/lXo/UEJm//eNZkbbbrdZuiNOcPkXKllP3dAFD9EiKG93FEJFRiY/2zbEmeQeJ2NVimDmeklb/6flaqYfz8oX8Y6UWn9X+tSMV0RKYlXZo+o1uBqb5MDt4yLAY5f0G3CZ3PpzZgHXNLIE3v7F4b4geEFyEABVJJWbKvfJk0w01kwDpa5oa83YN+lur8peH7d7wFHwJhHGQRq+jowjS2fAG/lp/bxORb9DmGqx6z0VCE5rmaHkPI+iSo1QC4UVUur9zDJSkYEXdS7s9QIDAQAB', 'http://xn--zfr188b.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/api/aliPay/return', 'RSA2', '2088721030642173');

-- ----------------------------
-- Table structure for tool_email_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_email_config`;
CREATE TABLE `tool_email_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '邮箱配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_email_config
-- ----------------------------
INSERT INTO `tool_email_config` VALUES (1, 'tsuimengchao@163.com', 'smtp.163.com', 'AEA12EEBB34214BE102BA0648F3B2713405D952834C75749', '465', '梦辰雪');

-- ----------------------------
-- Table structure for tool_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `tool_local_storage`;
CREATE TABLE `tool_local_storage`  (
  `storage_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '大小',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`storage_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '本地存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_local_storage
-- ----------------------------

-- ----------------------------
-- Table structure for tool_localstorage_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_localstorage_config`;
CREATE TABLE `tool_localstorage_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `local_file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '外链域名',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_localstorage_config
-- ----------------------------
INSERT INTO `tool_localstorage_config` VALUES (1, 'http://localhost:8000/file/');

-- ----------------------------
-- Table structure for tool_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_config`;
CREATE TABLE `tool_qiniu_config`  (
  `config_id` bigint(20) NOT NULL COMMENT 'ID',
  `access_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'accessKey',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '外链域名',
  `secret_key` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL COMMENT 'secretKey',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_qiniu_config
-- ----------------------------
INSERT INTO `tool_qiniu_config` VALUES (1, 'AWmtGNZuK4WJ1oCP9ScfgdaLQoIUbeEZGAVDmHs5', 'mcx-blog', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl', 'pqrEyEp3ngG62J7X1pfKy9R0eUuBEBQAwFOvOOZY', '公开', '华南');

-- ----------------------------
-- Table structure for tool_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `tool_qiniu_content`;
CREATE TABLE `tool_qiniu_content`  (
  `content_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(180) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件类型：私有或公开',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `update_time` datetime NULL DEFAULT NULL COMMENT '上传或同步的时间',
  PRIMARY KEY (`content_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 155 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云文件存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_qiniu_content
-- ----------------------------
INSERT INTO `tool_qiniu_content` VALUES (10, 'mcx-blog', '005a3fa114274f49b676a922127c1fe1', '144.60KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/005a3fa114274f49b676a922127c1fe1.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (11, 'mcx-blog', '1', '478.67KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (12, 'mcx-blog', '1645512111007', '11.63KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1645512111007.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (13, 'mcx-blog', '1956893dd398497694a97b07d72ebc21', '448.00KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1956893dd398497694a97b07d72ebc21.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (14, 'mcx-blog', '20231007_1696659441438', '139.74KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20231007_1696659441438.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (15, 'mcx-blog', '20231010_1696930367538', '57.88KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20231010_1696930367538.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (16, 'mcx-blog', '24f7b723309b46eba38cca127ea2bcc2', '198.67KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (17, 'mcx-blog', '65a76fbd2c134848b88eff453d20b2ef', '65.88KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/65a76fbd2c134848b88eff453d20b2ef.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (18, 'mcx-blog', '66bb121d47e94b89945d29bb6e3e6cab', '54.07KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/66bb121d47e94b89945d29bb6e3e6cab.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (19, 'mcx-blog', '72d9854940be46579f098b49f9d9035c', '189.57KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/72d9854940be46579f098b49f9d9035c.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (20, 'mcx-blog', '77e3405ae701468f968a65ffe989905f', '479.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/77e3405ae701468f968a65ffe989905f.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (21, 'mcx-blog', '89429c318d9641468586dbb10b6efea9', '382.69KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/89429c318d9641468586dbb10b6efea9.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (22, 'mcx-blog', '8b8af3e7711142968c5bea7e37997a0d', '58.42KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/8b8af3e7711142968c5bea7e37997a0d.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (23, 'mcx-blog', '8fb53e82b9a04cb292ab1a8965e7c9f2', '227.93KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/8fb53e82b9a04cb292ab1a8965e7c9f2.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (24, 'mcx-blog', '929b6e40d5d34b298d8e82b2f32b8d4c', '7.59MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/929b6e40d5d34b298d8e82b2f32b8d4c.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (25, 'mcx-blog', '962d327b9a0644b3806d33531ba55505', '457.34KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/962d327b9a0644b3806d33531ba55505.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (26, 'mcx-blog', '963ed6eb4c4c454bbcaac12676dd6d38', '448.00KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/963ed6eb4c4c454bbcaac12676dd6d38.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (27, 'mcx-blog', '9950b47df24b766887824338a8fb3b10', '69.65KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9950b47df24b766887824338a8fb3b10.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (28, 'mcx-blog', '9bd9b167ly1g2rmpwaxkkj21hc0u0e81', '479.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9bd9b167ly1g2rmpwaxkkj21hc0u0e81.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (30, 'mcx-blog', 'ac4236e7120a4b428379c236678651dc', '644.36KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/ac4236e7120a4b428379c236678651dc.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (31, 'mcx-blog', 'alipay', '116.38KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (32, 'mcx-blog', 'b57c03fc992a459ab6a29bf47a59552a', '58.42KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/b57c03fc992a459ab6a29bf47a59552a.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (33, 'mcx-blog', 'b6c88ff9ce2f45a3b3e99c0e5966715b', '58.42KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/b6c88ff9ce2f45a3b3e99c0e5966715b.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (34, 'mcx-blog', 'c11c88d3eda34360bed5b4ae85c2c591', '2.20MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/c11c88d3eda34360bed5b4ae85c2c591.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (35, 'mcx-blog', 'cmc', '79.52KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (36, 'mcx-blog', 'd38e2db70b3f445ca51253fb8eceb7eb', '314.90KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/d38e2db70b3f445ca51253fb8eceb7eb.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (37, 'mcx-blog', 'd9b6d57cfa7c4e44a9115bd472e5278b', '382.69KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/d9b6d57cfa7c4e44a9115bd472e5278b.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (38, 'mcx-blog', 'img-loading', '39.44KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/img-loading.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (39, 'mcx-blog', 'loading', '822.66KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/loading.gif', 'gif', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (40, 'mcx-blog', 'souyisou1', '2.44MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/souyisou1.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (41, 'mcx-blog', 'touristAvatar', '1.29KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/touristAvatar.png', 'png', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (42, 'mcx-blog', 'wxpay', '148.12KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg', 'jpg', '2024-01-27 20:08:38');
INSERT INTO `tool_qiniu_content` VALUES (43, 'mcx-blog', '2e2fa4f7c50a359dd9b174f865ab4594', '301.87KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/2e2fa4f7c50a359dd9b174f865ab4594.png', 'png', '2024-01-27 22:09:03');
INSERT INTO `tool_qiniu_content` VALUES (44, 'mcx-blog', '7d990a3a32e8c3ea187f94acd3da5d4d', '221.73KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/7d990a3a32e8c3ea187f94acd3da5d4d.jpg', 'jpg', '2024-01-28 22:11:20');
INSERT INTO `tool_qiniu_content` VALUES (45, 'mcx-blog', 'cd00756e8ced7d8b104ab26e03a8a760', '336.19KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cd00756e8ced7d8b104ab26e03a8a760.png', 'png', '2024-01-28 22:11:20');
INSERT INTO `tool_qiniu_content` VALUES (46, 'mcx-blog', '3840c905fc8ab68a6ae4d76e3f0e2fec', '424.89KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/3840c905fc8ab68a6ae4d76e3f0e2fec.jpg', 'jpg', '2024-01-28 22:11:20');
INSERT INTO `tool_qiniu_content` VALUES (47, 'mcx-blog', '20240129_1706526724375', '58.42KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240129_1706526724375.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (48, 'mcx-blog', '20240129_1706526881276', '58.42KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240129_1706526881276.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (49, 'mcx-blog', '20240129_1706527106179', '3.69MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240129_1706527106179.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (50, 'mcx-blog', '20240129_1706536313113', '198.67KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240129_1706536313113.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (51, 'mcx-blog', '20240130_1706620917846', '732.90KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917846.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (52, 'mcx-blog', '20240130_1706620917853', '5.06MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917853.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (53, 'mcx-blog', '20240130_1706620917875', '6.98MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917875.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (54, 'mcx-blog', '20240201_1706801409233', '394.03KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240201_1706801409233.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (55, 'mcx-blog', '20240202_1706889138517', '20.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889138517.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (56, 'mcx-blog', '20240202_1706889212219', '15.01KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889212219.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (57, 'mcx-blog', '20240202_1706889323798', '20.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889323798.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (58, 'mcx-blog', '20240202_1706889323803', '15.01KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889323803.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (59, 'mcx-blog', '20240202_1706889379648', '20.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889379648.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (60, 'mcx-blog', '20240202_1706889379654', '88.98KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889379654.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (61, 'mcx-blog', '20240202_1706889443992', '15.01KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889443992.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (62, 'mcx-blog', '20240202_1706889447649', '88.98KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889447649.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (63, 'mcx-blog', '20240202_1706889453666', '52.68KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889453666.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (64, 'mcx-blog', '20240202_1706889458501', '20.84KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889458501.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (65, 'mcx-blog', '20240204_1707050237340', '505.54KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240204_1707050237340.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (66, 'mcx-blog', '20240204_1707050247317', '129.48KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240204_1707050247317.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (67, 'mcx-blog', '20240206_1707232418933', '82.09KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240206_1707232418933.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (68, 'mcx-blog', '20240211_1707663793415', '670.62KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240211_1707663793415.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (69, 'mcx-blog', '20240211_1707663796456', '591.11KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240211_1707663796456.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (70, 'mcx-blog', '20240213_1707823858260', '406.22KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240213_1707823858260.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (71, 'mcx-blog', 'souyisou', '4.07MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/souyisou.png', 'png', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (72, 'mcx-blog', 'wechatQr', '26.17KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wechatQr.jpg', 'jpg', '2024-02-15 14:19:10');
INSERT INTO `tool_qiniu_content` VALUES (73, 'mcx-blog', '42f6138869250a4883ea1beb0c4fc2d51', '11.71MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/42f6138869250a4883ea1beb0c4fc2d51.jpg', 'jpg', '2024-02-15 23:14:55');
INSERT INTO `tool_qiniu_content` VALUES (74, 'mcx-blog', '2e4c81b06dffa460de5c0f2aa66cbff16', '12.11MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/2e4c81b06dffa460de5c0f2aa66cbff16.jpg', 'jpg', '2024-02-15 23:14:56');
INSERT INTO `tool_qiniu_content` VALUES (75, 'mcx-blog', '20240215_1708005662284', '5.66MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005662284.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (76, 'mcx-blog', '20240215_1708005666076', '7.30MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005666076.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (77, 'mcx-blog', '20240215_1708005854141', '4.79MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005854141.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (78, 'mcx-blog', '20240215_1708009150558', '940.11KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009150558.png', 'png', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (79, 'mcx-blog', '20240215_1708009342170', '404.53KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009342170.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (80, 'mcx-blog', '20240215_1708009349444', '9.71MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009349444.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (81, 'mcx-blog', '20240215_1708009359797', '181.27KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009359797.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (82, 'mcx-blog', '20240215_1708009619307', '940.11KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009619307.png', 'png', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (83, 'mcx-blog', '20240215_1708009627094', '404.53KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009627094.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (84, 'mcx-blog', '20240215_1708009652649', '9.71MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009652649.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (85, 'mcx-blog', '20240215_1708009669045', '181.27KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009669045.jpg', 'jpg', '2024-02-15 23:15:04');
INSERT INTO `tool_qiniu_content` VALUES (86, 'mcx-blog', '20240216_1708098817554', '1.28MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240216_1708098817554.png', 'png', '2024-02-21 20:27:33');
INSERT INTO `tool_qiniu_content` VALUES (87, 'mcx-blog', '20240216_1708098903543', '659.59KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240216_1708098903543.jpg', 'jpg', '2024-02-21 20:27:33');
INSERT INTO `tool_qiniu_content` VALUES (88, 'mcx-blog', '20240221_1708518410788', '2.99MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708518410788.jpg', 'jpg', '2024-02-21 20:27:33');
INSERT INTO `tool_qiniu_content` VALUES (89, 'mcx-blog', '20240221_1708518419974', '5.31MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708518419974.mp4', 'mp4', '2024-02-21 20:27:33');
INSERT INTO `tool_qiniu_content` VALUES (90, 'mcx-blog', '91b2937a59daab53b8e4007d4657e69', '13.10MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/91b2937a59daab53b8e4007d4657e69.jpg', 'jpg', '2024-02-21 20:54:32');
INSERT INTO `tool_qiniu_content` VALUES (91, 'mcx-blog', 'aed68391d33a81adb86a621c3f3a0c4', '11.98MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/aed68391d33a81adb86a621c3f3a0c4.jpg', 'jpg', '2024-02-21 20:54:35');
INSERT INTO `tool_qiniu_content` VALUES (92, 'mcx-blog', '90049c48669f4f94bbd1285cdc86e6f', '14.38MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/90049c48669f4f94bbd1285cdc86e6f.jpg', 'jpg', '2024-02-21 20:54:35');
INSERT INTO `tool_qiniu_content` VALUES (93, 'mcx-blog', '72583579115a63f1fa93688bb36bae5', '19.96MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/72583579115a63f1fa93688bb36bae5.jpg', 'jpg', '2024-02-21 20:56:33');
INSERT INTO `tool_qiniu_content` VALUES (94, 'mcx-blog', '1642481294001', '199.26KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1642481294001.png', 'png', '2024-02-22 21:40:19');
INSERT INTO `tool_qiniu_content` VALUES (96, 'mcx-blog', '9cf1222617fd4fa197991476a53cc883', '40.19KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9cf1222617fd4fa197991476a53cc883.jpg', 'jpg', '2024-02-22 21:43:29');
INSERT INTO `tool_qiniu_content` VALUES (97, 'mcx-blog', '20240221_1708520001869', '9.41MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708520001869.jpg', 'jpg', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (98, 'mcx-blog', '20240221_1708520017031', '8.45MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708520017031.jpg', 'jpg', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (99, 'mcx-blog', '20240221_1708521034719', '732.98KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708521034719.jpg', 'jpg', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (100, 'mcx-blog', '20240224_1708774900341', '54.57KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708774900341.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (101, 'mcx-blog', '20240224_1708775055362', '11.72KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775055362.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (102, 'mcx-blog', '20240224_1708775199378', '294.00KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775199378.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (103, 'mcx-blog', '20240224_1708775273689', '281.65KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775273689.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (104, 'mcx-blog', '20240224_1708775423616', '48.52KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775423616.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (105, 'mcx-blog', '20240224_1708775483819', '37.14KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775483819.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (106, 'mcx-blog', '20240224_1708775508827', '230.63KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775508827.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (107, 'mcx-blog', '20240224_1708775535785', '30.50KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708775535785.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (108, 'mcx-blog', '20240224_1708777944821', '1.34MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708777944821.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (109, 'mcx-blog', '20240224_1708778541680', '118.53KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778541680.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (110, 'mcx-blog', '20240224_1708778554897', '138.06KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778554897.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (111, 'mcx-blog', '20240224_1708778561422', '65.33KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778561422.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (112, 'mcx-blog', '20240224_1708778569352', '108.91KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778569352.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (113, 'mcx-blog', '20240224_1708778580979', '100.03KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778580979.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (114, 'mcx-blog', '20240224_1708778597764', '90.22KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778597764.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (115, 'mcx-blog', '20240224_1708778614136', '103.46KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778614136.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (116, 'mcx-blog', '20240224_1708778628728', '100.22KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778628728.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (117, 'mcx-blog', '20240224_1708778876609', '1.69MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778876609.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (118, 'mcx-blog', '20240224_1708778946791', '602.75KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708778946791.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (119, 'mcx-blog', '20240224_1708779032866', '567.03KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779032866.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (120, 'mcx-blog', '20240224_1708779117625', '553.30KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708779117625.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (121, 'mcx-blog', '20240224_1708783332700', '198.67KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240224_1708783332700.jpg', 'jpg', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (122, 'mcx-blog', '20240312_1710248085539', '7.44MB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240312_1710248085539.jpg', 'jpg', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (123, 'mcx-blog', '20240314_1710423566428', '105.58KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423566428.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (124, 'mcx-blog', '20240314_1710423615632', '130.91KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423615632.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (125, 'mcx-blog', '20240314_1710423677653', '137.21KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423677653.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (126, 'mcx-blog', '20240314_1710423721034', '158.79KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423721034.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (127, 'mcx-blog', '20240314_1710423786688', '117.70KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423786688.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (128, 'mcx-blog', '20240314_1710423973751', '151.71KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710423973751.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (129, 'mcx-blog', '20240314_1710424269093', '33.07KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424269093.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (130, 'mcx-blog', '20240314_1710424317397', '90.49KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424317397.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (131, 'mcx-blog', '20240314_1710424370011', '114.08KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710424370011.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (132, 'mcx-blog', '20240314_1710425051427', '126.28KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425051427.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (133, 'mcx-blog', '20240314_1710425083740', '67.18KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425083740.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (134, 'mcx-blog', '20240314_1710425271610', '127.92KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425271610.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (135, 'mcx-blog', '20240314_1710425846113', '149.54KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425846113.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (136, 'mcx-blog', '20240314_1710425949703', '45.21KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710425949703.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (137, 'mcx-blog', '20240314_1710426135960', '85.29KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426135960.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (138, 'mcx-blog', '20240314_1710426286852', '38.48KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426286852.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (139, 'mcx-blog', '20240314_1710426442096', '59.33KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426442096.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (140, 'mcx-blog', '20240314_1710426517366', '75.54KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426517366.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (141, 'mcx-blog', '20240314_1710426827504', '130.11KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710426827504.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (142, 'mcx-blog', '20240314_1710427123341', '34.15KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427123341.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (143, 'mcx-blog', '20240314_1710427252561', '138.87KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427252561.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (144, 'mcx-blog', '20240314_1710427341118', '62.41KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427341118.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (145, 'mcx-blog', '20240314_1710427531395', '21.39KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427531395.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (146, 'mcx-blog', '20240314_1710427724965', '34.18KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710427724965.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (147, 'mcx-blog', '20240314_1710429516879', '39.16KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429516879.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (148, 'mcx-blog', '20240314_1710429643126', '78.96KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429643126.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (149, 'mcx-blog', '20240314_1710429752420', '46.52KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429752420.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (150, 'mcx-blog', '20240314_1710429804623', '41.90KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710429804623.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (151, 'mcx-blog', '20240314_1710430084767', '33.50KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430084767.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (152, 'mcx-blog', '20240314_1710430595442', '51.66KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710430595442.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (153, 'mcx-blog', '20240314_1710431221195', '182.90KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240314_1710431221195.png', 'png', '2024-03-15 12:29:37');
INSERT INTO `tool_qiniu_content` VALUES (154, 'mcx-blog', 'avatar-20240302042334316', '17.56KB   ', '公开', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/avatar-20240302042334316.png', 'png', '2024-03-15 12:29:37');

SET FOREIGN_KEY_CHECKS = 1;
