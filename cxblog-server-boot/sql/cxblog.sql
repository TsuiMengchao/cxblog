/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cxblog_demo

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 14/07/2024 14:56:33
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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1, '1', 32, '关于博客', 'https://img.btstu.cn/api/images/5b88a448d0697.jpg', '关于博客的一些介绍。', '<blockquote>\n<p>本文主要介绍博客用到的技术和一些功能详情</p>\n</blockquote>\n<h1><a id=\"_2\"></a>简介</h1>\n<h2><a id=\"_4\"></a>项目简介</h2>\n<p><a href=\"https://cxblog.zhaohaoyue.love\" target=\"_blank\">CXBLOG</a>是基于 Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es 的前后端分离的博客系统。</p>\n<h2><a id=\"_7\"></a>项目来源</h2>\n<p>在 Github 和 Gitee 上看了很多的博客项目，发现大多数要么是完成度不高，要么是完成度太高不容易移植和修改，且技术栈迭代过多，项目复杂性较高，不适合初学者研究学习。于是 CXBLOG 就这样诞生了。<br />\n此项目是由<a href=\"https://eladmin.vip/\" target=\"_blank\">ELADMIN</a>（成熟且完善的后端管理系统）和<a href=\"https://www.shiyit.com/\" target=\"_blank\">拾壹博客</a>（较为完善的博客系统）这两个开源项目整合而成，属于站在巨人的肩膀上制造出的产物。由于ELADMIN的后端代码格式更符合我的偏好，且拾壹博客开放的源代码中管理系统部分的代码不完整，于是便将两者尝试融合到了一起。</p>\n<h2><a id=\"_11\"></a>在线体验</h2>\n<p>博客PC用户端预览地址：<a href=\"https://cxblog.zhaohaoyue.love\" target=\"_blank\">辰雪博客PC端</a><br />\n博客移动用户端预览地址：<a href=\"https://h5.cxblog.zhaohaoyue.love\" target=\"_blank\">辰雪博客移动端</a><br />\n博客管理系统预览地址：<a href=\"https://admin.cxblog.zhaohaoyue.love\" target=\"_blank\">辰雪博客管理系统</a><br />\n辰雪博客开发文档地址：<a href=\"https://doc.cxblog.zhaohaoyue.love\" target=\"_blank\">辰雪博客开发文档</a><br />\n账号密码：admin / 123456   |  test / 123456   |  common / 123456<br />\n亦可在博客首页自行注册账号，本博客支持<a href=\"https://connect.qq.com/index.html\" target=\"_blank\">QQ</a>、<a href=\"https://gitee.com/api/v5/oauth_doc#/\" target=\"_blank\">gitee</a>、<a href=\"https://open.weibo.com/?bottomnav=1&amp;wvr=6\" target=\"_blank\">微博</a>、微信公众号登录。</p>\n<h2><a id=\"_19\"></a>项目源码</h2>\n<p>码云作为国内同步仓库，可解决Github克隆缓慢的问题，两个平台的代码都是同步更新的，按需选择</p>\n<table>\n<thead>\n<tr>\n<th>平台</th>\n<th>源码地址</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>github</td>\n<td>https://github.com/TsuiMengchao/cxblog</td>\n</tr>\n<tr>\n<td>码云</td>\n<td>https://gitee.com/TsuiMengchao/cxblog</td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_26\"></a>反馈交流</h2>\n<p>为了方便管理，现已开启 Gitee 和 Github 的 Issues 功能，欢迎在 <a href=\"https://gitee.com/TsuiMengchao/cxblog/issues\" target=\"_blank\">Gitee</a> 和 <a href=\"https://github.com/TsuiMengchao/cxblog/issues\" target=\"_blank\">Github</a> 上提 Issues。</p>\n<p>QQ：484132820、微信：tsuimengchao、邮箱：tsuimengchao@aliyun.com</p>\n<h1><a id=\"_31\"></a>快速了解</h1>\n<p>CXBLOG 基于 Spring Boot 2.6.4 、 Spring Boot Mybatis-Plus、 JWT、Spring Security、Redis、Vue、Element-UI 的前后端分离的后台管理系统， 项目采用按功能分模块的开发方式，权限控制采用 RBAC 思想，支持数据字典与数据权限管理，支持一键生成管理系统前后端代码，支持管理系统前端菜单动态路由等。</p>\n<h2><a id=\"_34\"></a>主要特性</h2>\n<p>使用最新技术栈，社区资源丰富。<br />\n高效率开发，代码生成器可一键生成前后端代码<br />\n支持数据字典，可方便地对一些状态进行管理<br />\n支持接口限流，避免恶意请求导致服务层压力过大<br />\n支持接口级别的功能权限与数据权限，可自定义操作<br />\n自定义权限注解与匿名接口注解，可快速对接口拦截与放行<br />\n对一些常用地前端组件封装：表格数据请求、数据字典等<br />\n前后端统一异常拦截处理，统一输出异常，避免繁琐的判断<br />\n支持在线用户管理与服务器性能监控，支持限制单用户登录<br />\n支持运维管理，可方便地对远程服务器的应用进行部署与管理</p>\n<h2><a id=\"_46\"></a>主要功能</h2>\n<p>用户管理：提供用户的相关配置，新增用户后，默认密码为123456<br />\n角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限<br />\n菜单管理：已实现菜单动态路由，后端可配置化，支持多级菜单<br />\n部门管理：可配置系统组织架构，树形表格展示<br />\n岗位管理：配置各个部门的职位<br />\n字典管理：可维护常用一些固定的数据，如：状态，性别等<br />\n系统日志：记录用户操作日志与异常日志，方便开发人员定位排错<br />\nSQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456<br />\n定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然<br />\n代码生成：高灵活度生成前后端代码，减少大量重复的工作任务<br />\n邮件工具：配合富文本，发送html格式的邮件<br />\n七牛云存储：可同步七牛云存储的数据到系统，无需登录七牛云直接操作云数据<br />\n支付宝支付：整合了支付宝支付并且提供了测试账号，可自行测试<br />\n服务监控：监控服务器的负载情况<br />\n运维管理：一键部署你的应用<br />\n博客管理：可维护用户上传的博客、标签、分类以及说说等内容<br />\n博客管理：可配置博客的部分展示内容<br />\n消息管理：可维护用户上传的留言、评论以及反馈等内容</p>\n<h2><a id=\"_66\"></a>项目结构</h2>\n<p><mark>cxblog-common</mark> 为系统的公共模块，各种工具类，公共配置存在该模块</p>\n<p><mark>cxblog-main</mark> 为系统核心模块也是项目入口模块，也是最终需要打包部署的模块</p>\n<p><mark>cxblog-logging</mark> 为系统的日志模块，其他模块如果需要记录日志需要引入该模块</p>\n<p><mark>cxblog-tools</mark> 为第三方工具模块，包含：邮件、七牛云存储、本地存储、支付宝</p>\n<p><mark>cxblog-generator</mark> 为系统的代码生成模块，支持一键生成前后端CRUD代码</p>\n<h2><a id=\"_77\"></a>详细结构</h2>\n<pre><code class=\"lang-\">- cxblog-common 公共模块\n    - annotation 为系统自定义注解\n    - aspect 自定义注解的切面\n    - base 提供了Entity、DTO基类和mapstruct的通用mapper\n    - config 自定义权限实现、redis配置、swagger配置、Rsa配置等\n    - exception 项目统一异常的处理\n    - utils 系统通用工具类\n- cxblog-main 系统核心模块（系统启动入口）\n	- config 配置跨域与静态资源，与数据权限\n	    - thread 线程池相关\n	- modules 系统相关模块(登录授权、系统监控、定时任务、运维管理等)\n- cxblog-logging 系统日志模块\n- cxblog-tools 系统第三方工具模块\n- cxblog-generator 系统代码生成模块\n</code></pre>\n<h1><a id=\"_95\"></a>快速开始</h1>\n<p>使用该项目前，你需要检查你本地的开发环境，避免出现问题!</p>\n<h2><a id=\"_97\"></a>所需环境</h2>\n<p>这里列出项目所需的环境与相关安装教程，方便刚入门的同学</p>\n<pre><code class=\"lang-\">1、JDK：1.8+ （本人使用的openJDK 21）\n安装教程：https://www.runoob.com/java/java-environment-setup.html\n2、Redis 3.0+ （本人使用的小皮面板集成的3.0.504）\n安装教程：https://www.runoob.com/redis/redis-install.html\n3、Maven 3.0+\n安装教程：https://www.runoob.com/maven/maven-setup.html\n4、MYSQL 5.5.0+ （本人使用的小皮面板集成的5.7.26）\n安装教程：https://www.runoob.com/mysql/mysql-install.html\n5、Node v10+ (最好使用 12-16，高版本可能会有问题，本人使用的16)\n安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html\n</code></pre>\n<blockquote>\n<p><strong>注意</strong><br />\n前端安装完 node 后，最好设置下淘宝的镜像源，不建议使用 cnpm（可能会出现奇怪的问题）</p>\n</blockquote>\n<pre><code class=\"lang-\">npm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n</code></pre>\n<h2><a id=\"_126\"></a>开发准备</h2>\n<blockquote>\n<p><strong>提示</strong><br />\n在使用该系统前，你还需要做如下准备</p>\n</blockquote>\n<p>1.给 <a href=\"https://blog.csdn.net/wochunyang/article/details/81736354\" target=\"_blank\">idea</a>或者 <a href=\"https://blog.csdn.net/magi1201/article/details/85995987\" target=\"_blank\">eclipse</a>安装 lombok 插件，我们用它可以省略get，set 方法，可以使代码更简洁。（专业版idea可以跳过这步，个人使用的专业版idea）</p>\n<p>2.你需要有 Spring boot 的基础，各大网站均有教程</p>\n<p>3.你还需要有 Vue2 的基础，各大网站均有教程</p>\n<h2><a id=\"_136\"></a>运行项目</h2>\n<blockquote>\n<p><strong>注意</strong><br />\n因为本项目是前后端分离的，所以需要前后端都启动好，才能进行访问。<br />\n请先在我们的 <a href=\"https://gitee.com/TsuiMengchao/cxblog.git\" target=\"_blank\">Git</a> 上下载好本项目，本项目的项目目录如下：</p>\n</blockquote>\n<pre><code class=\"lang-\">- admin 博客管理系统-前端代码\n- web 博客-前端代码\n- server 后端代码\n- sql 数据库所需sql文件\n- img 项目中需要的图片资源\n</code></pre>\n<p>特别推荐一款集成环境软件-<a href=\"https://www.xp.cn\" target=\"_blank\">小皮系统</a>，本人使用的其集成的MySQL、Redis和Nginx，非常好用。</p>\n<h2><a id=\"Idea_149\"></a>后端运行[Idea]</h2>\n<p>打开Idea，直接将根目录下的 server 目录作为项目打开。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708774900341.png\" alt=\"image.png\" /></p>\n<p>打开MySQL数据库，创建一个新库 cxblog 编码选择 utf8mb4 或者 utf8，然后导入sql文件夹中的初始化脚本库脚本 cxblog.sql。（这里我用的是Navicat数据库可视化管理工具）<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775055362.png\" alt=\"image.png\" /></p>\n<p>修改配置，如果你的数据库密码不是 root，那么需要在 dev.yml 配置文件中做相应的修改。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775199378.png\" alt=\"image.png\" /></p>\n<p>运行项目：找到 cxblog-main 模块中的 AppRun，点击启动按钮启动程序。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775273689.png\" alt=\"image.png\" /></p>\n<h2><a id=\"WebStorm_162\"></a>前端运行[WebStorm]</h2>\n<p>打开 WebStorm，直接将根目录下的 web / admin 目录作为项目打开，这里以 admin 为例。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775423616.png\" alt=\"image.png\" /></p>\n<p>这个时候 WebStorm 会在右下角提示我们安装依赖，也可以手动在 Terminal 中输入 npm install 进行安装。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775483819.png\" alt=\"image.png\" /></p>\n<p>依赖安装完成后，打开 package.json 找到 dev 旁边的启动按钮<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775508827.png\" alt=\"image.png\" /></p>\n<p>启动完后打开 localhost:8010 即可<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775535785.png\" alt=\"image.png\" /></p>\n<p>#前端运行常见问题<br />\n1、依赖安装失败</p>\n<p>可通过配置淘宝的镜像源解决</p>\n<pre><code class=\"lang-\">npm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n</code></pre>\n<p>2、linux 系统在安装依赖的时候会出现 node-sass 无法安装的问题</p>\n<p>解决方案：</p>\n<pre><code class=\"lang-\">1. 单独安装：npm install --unsafe-perm node-sass \n2. 直接使用：npm install --unsafe-perm\n</code></pre>\n<h1><a id=\"_199\"></a>特别鸣谢</h1>\n<h2><a id=\"_200\"></a>特别鸣谢</h2>\n<p>感谢 <a href=\"https://portal.qiniu.com/\" target=\"_blank\">七牛云</a>提供的免费云存储支持</p>\n<p>感谢 <a href=\"https://github.com/PanJiaChen/vue-element-admin\" target=\"_blank\">PanJiaChen</a>大佬提供的前端脚手架</p>\n<p>感谢 <a href=\"https://github.com/moxun1639\" target=\"_blank\">Moxun</a>大佬提供的前端 Curd 通用组件</p>\n<p>感谢 <a href=\"https://gitee.com/zhy6599\" target=\"_blank\">zhy6599</a>大佬提供的后端运维管理相关功能</p>\n<p>感谢 <a href=\"https://github.com/everhopingandwaiting\" target=\"_blank\">j.yao.SUSE</a>大佬提供的匿名接口与Redis限流等功能</p>\n<p>感谢 <a href=\"https://github.com/d15801543974\" target=\"_blank\">d15801543974</a>大佬提供的基于注解的通用查询方式</p>\n<p>感谢每一位被 CX-BLOG 抄过代码的开发者。</p>\n<h1><a id=\"_215\"></a>界面展示</h1>\n<h2><a id=\"_217\"></a>后端管理系统</h2>\n<p>1、登录界面<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708777944821.png\" alt=\"image.png\" /><br />\n2、后台首页<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778541680.png\" alt=\"9c6241f64b278a4226516763e51784c6.png\" /><br />\n3、文章管理<br />\n列表页<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778554897.png\" alt=\"055a9cf181644471c61935c172e98eee.png\" /><br />\n文章添加<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778561422.png\" alt=\"c38bc923c91fb61d7b648c9a42538cb2.png\" /><br />\n项目中图片存储采用的是<a href=\"https://www.qiniu.com/products/kodo\" target=\"_blank\">七牛云</a>平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。<br />\n4、标签管理<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778569352.png\" alt=\"76d0cba6f025cc00be187f56c06161a2.png\" /><br />\n5、日志管理<br />\n针对用户访问以及管理员操作和异常信息都做了一个日志的记录<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778580979.png\" alt=\"3f033214ff63755ef2469a00cbfc05db.png\" /><br />\n6、系统配置<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778597764.png\" alt=\"e10811a433f1513f1d024e8c9bcbea7b.png\" /><br />\n7、监控中心<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778614136.png\" alt=\"fb19a9c5c973349746a6e474865300ec.png\" /><br />\n监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码<br />\n8、代码生成<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778628728.png\" alt=\"be4b91bf63693ec3b7d5fecf43bfd718.png\" /></p>\n<h2><a id=\"_242\"></a>博客</h2>\n<p>1、首页<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778876609.png\" alt=\"image.png\" /><br />\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。<br />\n2、查看博客<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778946791.png\" alt=\"image.png\" /><br />\n3、登录、注册<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708779032866.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708779117625.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_252\"></a>结尾</h2>\n<p>上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，所看到的功能都已实现，还在着手后续的一些功能开发。后台管理根据模板改造而来，毕竟我只会业余的前端技术，所以界面简陋有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！！</p>\n<h1><a id=\"bye_255\"></a>bye</h1>\n', '> 本文主要介绍博客用到的技术和一些功能详情\n\n# 简介\n\n## 项目简介\n[CXBLOG](https://cxblog.zhaohaoyue.love)是基于 Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es 的前后端分离的博客系统。\n\n## 项目来源\n在 Github 和 Gitee 上看了很多的博客项目，发现大多数要么是完成度不高，要么是完成度太高不容易移植和修改，且技术栈迭代过多，项目复杂性较高，不适合初学者研究学习。于是 CXBLOG 就这样诞生了。\n此项目是由[ELADMIN](https://eladmin.vip/)（成熟且完善的后端管理系统）和[拾壹博客](https://www.shiyit.com/)（较为完善的博客系统）这两个开源项目整合而成，属于站在巨人的肩膀上制造出的产物。由于ELADMIN的后端代码格式更符合我的偏好，且拾壹博客开放的源代码中管理系统部分的代码不完整，于是便将两者尝试融合到了一起。\n\n## 在线体验\n博客PC用户端预览地址：[辰雪博客PC端](https://cxblog.zhaohaoyue.love)\n博客移动用户端预览地址：[辰雪博客移动端](https://h5.cxblog.zhaohaoyue.love)\n博客管理系统预览地址：[辰雪博客管理系统](https://admin.cxblog.zhaohaoyue.love)\n辰雪博客开发文档地址：[辰雪博客开发文档](https://doc.cxblog.zhaohaoyue.love)\n账号密码：admin / 123456   |  test / 123456   |  common / 123456\n亦可在博客首页自行注册账号，本博客支持[QQ](https://connect.qq.com/index.html)、[gitee](https://gitee.com/api/v5/oauth_doc#/)、[微博](https://open.weibo.com/?bottomnav=1&wvr=6)、微信公众号登录。\n\n## 项目源码\n码云作为国内同步仓库，可解决Github克隆缓慢的问题，两个平台的代码都是同步更新的，按需选择\n|  平台 | 源码地址                                   |\n|---  |----------------------------------------|\n|  github   | https://github.com/TsuiMengchao/cxblog |\n|  码云   | https://gitee.com/TsuiMengchao/cxblog      |\n\n## 反馈交流\n为了方便管理，现已开启 Gitee 和 Github 的 Issues 功能，欢迎在 [Gitee](https://gitee.com/TsuiMengchao/cxblog/issues) 和 [Github](https://github.com/TsuiMengchao/cxblog/issues) 上提 Issues。\n\nQQ：484132820、微信：tsuimengchao、邮箱：tsuimengchao@aliyun.com\n\n# 快速了解\nCXBLOG 基于 Spring Boot 2.6.4 、 Spring Boot Mybatis-Plus、 JWT、Spring Security、Redis、Vue、Element-UI 的前后端分离的后台管理系统， 项目采用按功能分模块的开发方式，权限控制采用 RBAC 思想，支持数据字典与数据权限管理，支持一键生成管理系统前后端代码，支持管理系统前端菜单动态路由等。\n\n## 主要特性\n使用最新技术栈，社区资源丰富。\n高效率开发，代码生成器可一键生成前后端代码\n支持数据字典，可方便地对一些状态进行管理\n支持接口限流，避免恶意请求导致服务层压力过大\n支持接口级别的功能权限与数据权限，可自定义操作\n自定义权限注解与匿名接口注解，可快速对接口拦截与放行\n对一些常用地前端组件封装：表格数据请求、数据字典等\n前后端统一异常拦截处理，统一输出异常，避免繁琐的判断\n支持在线用户管理与服务器性能监控，支持限制单用户登录\n支持运维管理，可方便地对远程服务器的应用进行部署与管理\n\n## 主要功能\n用户管理：提供用户的相关配置，新增用户后，默认密码为123456\n角色管理：对权限与菜单进行分配，可根据部门设置角色的数据权限\n菜单管理：已实现菜单动态路由，后端可配置化，支持多级菜单\n部门管理：可配置系统组织架构，树形表格展示\n岗位管理：配置各个部门的职位\n字典管理：可维护常用一些固定的数据，如：状态，性别等\n系统日志：记录用户操作日志与异常日志，方便开发人员定位排错\nSQL监控：采用druid 监控数据库访问性能，默认用户名admin，密码123456\n定时任务：整合Quartz做定时任务，加入任务日志，任务运行情况一目了然\n代码生成：高灵活度生成前后端代码，减少大量重复的工作任务\n邮件工具：配合富文本，发送html格式的邮件\n七牛云存储：可同步七牛云存储的数据到系统，无需登录七牛云直接操作云数据\n支付宝支付：整合了支付宝支付并且提供了测试账号，可自行测试\n服务监控：监控服务器的负载情况\n运维管理：一键部署你的应用\n博客管理：可维护用户上传的博客、标签、分类以及说说等内容\n博客管理：可配置博客的部分展示内容\n消息管理：可维护用户上传的留言、评论以及反馈等内容\n\n## 项目结构\n==cxblog-common== 为系统的公共模块，各种工具类，公共配置存在该模块\n\n==cxblog-main== 为系统核心模块也是项目入口模块，也是最终需要打包部署的模块\n\n==cxblog-logging== 为系统的日志模块，其他模块如果需要记录日志需要引入该模块\n\n==cxblog-tools== 为第三方工具模块，包含：邮件、七牛云存储、本地存储、支付宝\n\n==cxblog-generator== 为系统的代码生成模块，支持一键生成前后端CRUD代码\n\n## 详细结构\n```\n- cxblog-common 公共模块\n    - annotation 为系统自定义注解\n    - aspect 自定义注解的切面\n    - base 提供了Entity、DTO基类和mapstruct的通用mapper\n    - config 自定义权限实现、redis配置、swagger配置、Rsa配置等\n    - exception 项目统一异常的处理\n    - utils 系统通用工具类\n- cxblog-main 系统核心模块（系统启动入口）\n	- config 配置跨域与静态资源，与数据权限\n	    - thread 线程池相关\n	- modules 系统相关模块(登录授权、系统监控、定时任务、运维管理等)\n- cxblog-logging 系统日志模块\n- cxblog-tools 系统第三方工具模块\n- cxblog-generator 系统代码生成模块\n```\n\n# 快速开始\n使用该项目前，你需要检查你本地的开发环境，避免出现问题!\n## 所需环境\n这里列出项目所需的环境与相关安装教程，方便刚入门的同学\n```\n1、JDK：1.8+ （本人使用的openJDK 21）\n安装教程：https://www.runoob.com/java/java-environment-setup.html\n2、Redis 3.0+ （本人使用的小皮面板集成的3.0.504）\n安装教程：https://www.runoob.com/redis/redis-install.html\n3、Maven 3.0+\n安装教程：https://www.runoob.com/maven/maven-setup.html\n4、MYSQL 5.5.0+ （本人使用的小皮面板集成的5.7.26）\n安装教程：https://www.runoob.com/mysql/mysql-install.html\n5、Node v10+ (最好使用 12-16，高版本可能会有问题，本人使用的16)\n安装教程：https://www.runoob.com/nodejs/nodejs-install-setup.html\n```\n\n>**注意**\n>前端安装完 node 后，最好设置下淘宝的镜像源，不建议使用 cnpm（可能会出现奇怪的问题）\n```\nnpm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n```\n## 开发准备\n>**提示**\n>在使用该系统前，你还需要做如下准备\n\n1.给 [idea](https://blog.csdn.net/wochunyang/article/details/81736354)或者 [eclipse](https://blog.csdn.net/magi1201/article/details/85995987)安装 lombok 插件，我们用它可以省略get，set 方法，可以使代码更简洁。（专业版idea可以跳过这步，个人使用的专业版idea）\n\n2.你需要有 Spring boot 的基础，各大网站均有教程\n\n3.你还需要有 Vue2 的基础，各大网站均有教程\n\n## 运行项目\n>**注意**\n因为本项目是前后端分离的，所以需要前后端都启动好，才能进行访问。\n请先在我们的 [Git](https://gitee.com/TsuiMengchao/cxblog.git) 上下载好本项目，本项目的项目目录如下：\n```\n- admin 博客管理系统-前端代码\n- web 博客-前端代码\n- server 后端代码\n- sql 数据库所需sql文件\n- img 项目中需要的图片资源\n```\n特别推荐一款集成环境软件-[小皮系统](https://www.xp.cn)，本人使用的其集成的MySQL、Redis和Nginx，非常好用。\n\n## 后端运行[Idea]\n打开Idea，直接将根目录下的 server 目录作为项目打开。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708774900341.png)\n\n打开MySQL数据库，创建一个新库 cxblog 编码选择 utf8mb4 或者 utf8，然后导入sql文件夹中的初始化脚本库脚本 cxblog.sql。（这里我用的是Navicat数据库可视化管理工具）\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775055362.png)\n\n修改配置，如果你的数据库密码不是 root，那么需要在 dev.yml 配置文件中做相应的修改。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775199378.png)\n\n运行项目：找到 cxblog-main 模块中的 AppRun，点击启动按钮启动程序。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775273689.png)\n\n## 前端运行[WebStorm]\n打开 WebStorm，直接将根目录下的 web / admin 目录作为项目打开，这里以 admin 为例。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775423616.png)\n\n这个时候 WebStorm 会在右下角提示我们安装依赖，也可以手动在 Terminal 中输入 npm install 进行安装。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775483819.png)\n\n依赖安装完成后，打开 package.json 找到 dev 旁边的启动按钮\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775508827.png)\n\n启动完后打开 localhost:8010 即可\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708775535785.png)\n\n#前端运行常见问题\n1、依赖安装失败\n\n可通过配置淘宝的镜像源解决\n```\nnpm config set registry https://registry.npm.taobao.org\n配置后可通过下面方式来验证是否成功\nnpm config get registry\n\n在 ~/.npmrc 加入下面内容，可以避免安装 node-sass 失败\nsass_binary_site=https://npm.taobao.org/mirrors/node-sass/\n\n.npmrc 文件位于\nwin：C:\\Users\\[你的账户名称]\\.npmrc\nlinux：直接使用 vi ~/.npmrc\n```\n2、linux 系统在安装依赖的时候会出现 node-sass 无法安装的问题\n\n解决方案：\n```\n1. 单独安装：npm install --unsafe-perm node-sass \n2. 直接使用：npm install --unsafe-perm\n```\n\n# 特别鸣谢\n## 特别鸣谢\n感谢 [七牛云](https://portal.qiniu.com/)提供的免费云存储支持\n\n感谢 [PanJiaChen](https://github.com/PanJiaChen/vue-element-admin)大佬提供的前端脚手架\n\n感谢 [Moxun](https://github.com/moxun1639)大佬提供的前端 Curd 通用组件\n\n感谢 [zhy6599](https://gitee.com/zhy6599)大佬提供的后端运维管理相关功能\n\n感谢 [j.yao.SUSE](https://github.com/everhopingandwaiting)大佬提供的匿名接口与Redis限流等功能\n\n感谢 [d15801543974](https://github.com/d15801543974)大佬提供的基于注解的通用查询方式\n\n感谢每一位被 CX-BLOG 抄过代码的开发者。\n\n# 界面展示\n\n## 后端管理系统\n\n1、登录界面\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708777944821.png)\n2、后台首页\n![9c6241f64b278a4226516763e51784c6.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778541680.png)\n3、文章管理\n列表页\n![055a9cf181644471c61935c172e98eee.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778554897.png)\n文章添加\n![c38bc923c91fb61d7b648c9a42538cb2.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778561422.png)\n项目中图片存储采用的是[七牛云](https://www.qiniu.com/products/kodo)平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。\n4、标签管理\n![76d0cba6f025cc00be187f56c06161a2.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778569352.png)\n5、日志管理\n针对用户访问以及管理员操作和异常信息都做了一个日志的记录\n![3f033214ff63755ef2469a00cbfc05db.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778580979.png)\n6、系统配置\n![e10811a433f1513f1d024e8c9bcbea7b.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778597764.png)\n7、监控中心\n![fb19a9c5c973349746a6e474865300ec.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778614136.png)\n监控中心主要有服务器的监控和定时任务，定时任务支持自动添加修改删除功能，改了时间无需修改代码\n8、代码生成\n![be4b91bf63693ec3b7d5fecf43bfd718.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778628728.png)\n\n## 博客\n1、首页\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778876609.png)\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。\n2、查看博客\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708778946791.png)\n3、登录、注册\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708779032866.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240224_1708779117625.png)\n\n## 结尾\n上述只是项目的一些基础的功能图片，小伙伴们可以自行登录去查看，所看到的功能都已实现，还在着手后续的一些功能开发。后台管理根据模板改造而来，毕竟我只会业余的前端技术，所以界面简陋有所缺陷也属正常。如有比较有意思的功能欢迎各位小伙伴给我留言，作者觉得有意思的话就会着手开发。如本项目小伙伴觉得可以，希望能够码云star一下，万分感谢！！！\n\n# bye', 0, 1, 1, 1, NULL, 0, '2024-02-24 20:02:44', '2024-04-27 18:09:19', 1, 1, NULL);
INSERT INTO `blog_article` VALUES (2, '4', 32, '个人简历', 'https://img.btstu.cn/api/images/5b0257176f52d.jpg', '找不到工作啊，怎么办啊，马上就要毕业了。', ' <center>\n     <h1>崔梦超</h1>\n </center>\n<h2><a id=\"_4\"></a>个人信息</h2>\n<ul>\n<li>性 别：男             年 龄：22</li>\n<li>手 机：18333191029         邮 箱：tsuimengchao@aliyun.com</li>\n<li>专 业：计算机科学与技术      岗 位：后端开发/Python开发</li>\n</ul>\n<h2><a id=\"_10\"></a>工作及教育经历</h2>\n<ul>\n<li>重庆第二师范学院     2022.9~2024.7     计算机科学与技术-本科</li>\n<li>重庆电子工程职业学院     2019.9~2022.7     移动应用开发-专科</li>\n</ul>\n<h2><a id=\"_15\"></a>专业技能</h2>\n<ul>\n<li>熟练使用 Python，掌握基础的 Java、PHP、C# 等编程语言</li>\n<li>掌握基础数据结构和算法的基本原理</li>\n<li>掌握基本的前后端开发能力，擅长抄代码。</li>\n</ul>\n<h2><a id=\"_21\"></a>项目经历</h2>\n<ol>\n<li>\n<p>学校 - 国家大学生学情调查《NCSS》问卷系统 - 负责问卷数据导出分析软件开发 - 2020.02- 2020.04</p>\n<ul>\n<li>具体功能：将国家大学生学情调查《NCSS》问卷系统所收集的问卷数据进行处理分析及生成定制化分析报告。</li>\n<li>所用技术：运用了Python、PYQT、CSS、MySQL等技术，技术难点是将dataframe类型数据保存成sav格式文件，这个小功能使用的是一个名为pyreadstat的第三方库，这个库在打包为exe文件时出现了问题，当时国内没有太多教程。</li>\n<li>运行效果：勉强能用，毕竟当时才大一，刚开始学习，能搞定已经觉得很不错了。</li>\n<li>演示地址：因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/NCSS\" target=\"_blank\">gitee地址</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 喷码机赋码软件 - 负责软件开发 - 2020.04- 2020.06</p>\n<ul>\n<li>具体功能：根据协议生成序列码，当喷码机器获取序列码时，通过串口将序列码发送给机器。</li>\n<li>所用技术：运用了Python、PYQT、CSS、MySQL、Serial等技术，技术难点是提供的喷码机器dll库文件没有详细的接口说明；</li>\n<li>运行效果：勉强能用</li>\n<li>演示地址：因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/Prima\" target=\"_blank\">gitee地址</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 数字孪生-智慧校园 - 负责网页开发 - 2020.11- 2021.05</p>\n<ul>\n<li>具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。</li>\n<li>所用技术：运用了VUE框架、Element组件库、THREEJS三维引擎库、MySQL数据库、MQTT协议、物联网通讯等技术，技术难点是ThreeJs库上手难度不低</li>\n<li>运行效果：效果不是很好，模型动辄上百兆，加载速度太慢了，而且网页渲染也不行，有时还内存溢出，后面直接换技术了。</li>\n<li>演示地址：这个虽说可以有演示地址，但是太大了，截个图算了。源码地址：<a href=\"https://gitee.com/laboratory-15304/SmartCampusCqcet\" target=\"_blank\">智慧校园-1</a> - <a href=\"https://gitee.com/laboratory-15304/SmartCampusTorch\" target=\"_blank\">智慧校园-2</a></li>\n</ul>\n</li>\n<li>\n<p>学校 - 数字孪生-智慧校园 - 负责程序开发 - 2021.05 - 2021.07</p>\n<ul>\n<li>具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。</li>\n<li>所用技术：运用了Unity、MySQL数据库、物联网、PHP、ThinkPHP框架、ROS机器人操作系统等技术，技术难点是Unity上手难度也不低，使用很简单，用好就难了。</li>\n<li>运行效果：效果很好，基本秒加载，而且渲染也是真的棒。</li>\n<li>演示地址：因为是win软件，因此暂无演示地址。私有仓库，暂不提供源码地址。</li>\n</ul>\n</li>\n<li>\n<p>学校 - 光化施工控制系统 - 负责软件开发 - 2021.10 - 2022.04</p>\n<ul>\n<li>具体功能：win工控机软件界面开发，实现通过串口对plc设备控制、通过websocket协议与app端数据互通等功能</li>\n<li>所用技术：运用了Python、PYQT5、QSS、Serial、WebSocket等技术，技术难点是一个海康摄像头用120米的普通网线来连接，还经常断，pyqt5+opencv加我这半斤八两的技术水平应对这个情况太难了。</li>\n<li>运行效果：能用，但是因为plc给的数据不可靠，摄像头不稳定，所以效果一般般。</li>\n<li>演示地址：因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/laboratory-15304/Actinic-PC\" target=\"_blank\">光固化软件</a> - <a href=\"https://gitee.com/laboratory-15304/actinic-server\" target=\"_blank\">光固化后端</a></li>\n</ul>\n</li>\n<li>\n<p>个人 - MMORPG游戏（原魔）开发 - 负责服务器和Unity开发 - 2022.03 - 2022.06</p>\n<ul>\n<li>具体功能：开发和完善socket通信模块，以及角色、背包、装备、道具、NPC和敌人等功能模块。以及使用Unity开发游戏主体。根据当时最喜欢的游戏“原神”照着仿制的。</li>\n<li>所用技术：运用了Sprint Boot框架、eladmin框架、Socket、Mysql、Unity等技术，技术难点是技术要复杂度简直就是个无底洞，一个人精力有限，最后摆烂了，而且我不擅长美化。</li>\n<li>运行效果：能用，Unity部分bug一堆堆，半成品放弃了。Java服务器部分还行，socket用户连接后就创建一个线程，客户端多了之后服务器撑不住。</li>\n<li>演示地址：因为是win软件，因此暂无演示地址。源码地址：<a href=\"https://gitee.com/TsuiMengchao/monster-server\" target=\"_blank\">服务器端</a>；Unity端使用的SCM，暂时没设置成公开仓库。</li>\n</ul>\n</li>\n<li>\n<p>个人 - 辰雪博客 - 负责开发与测试 - 2023.10 - 至今</p>\n<ul>\n<li>具体功能：文章编辑与展示、网站配置、系统监控以及文件存储等常用工具</li>\n<li>所用技术：运用了Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es等技术，技术难点是我真的不擅长前端开发，完全没有审美啊。</li>\n<li>运行效果：网页版运行效果还行，小程序和APP版还在开发，尚未完成，bug很多。</li>\n<li>演示地址：<a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">辰雪博客</a> - <a href=\"http://xn--8ey35n.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">辰雪博客管理端</a></li>\n<li>源码地址：<a href=\"https://gitee.com/tsuimengchao/cxblog\" target=\"_blank\">gitee地址</a> - <a href=\"https://github.com/tsuimengchao/cxblog\" target=\"_blank\">github地址</a></li>\n</ul>\n</li>\n</ol>\n<h2><a id=\"_66\"></a>获奖经历</h2>\n<ul>\n<li>竞赛 2019年12月 2019重庆市第十届大学生程序设计大赛 省部级三等奖</li>\n<li>竞赛 2021年9月 全国大学生数学建模竞赛 国家级二等奖</li>\n<li>竞赛 在其余专业性较弱的比赛中曾获省部级奖十余次，国家级奖一次</li>\n<li>专利证书 《一种并联连接机构及发电机组群控管理系统》和《一种通讯连接机构》 “实用新型专利”授权</li>\n<li>论文 《智能网联汽车的应用现状及发展》 《科学咨询》杂志社《科学咨询·科技人文》刊出</li>\n</ul>\n<h2><a id=\"_73\"></a>个人账号</h2>\n<ul>\n<li><a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl\" target=\"_blank\">个人博客</a></li>\n<li><a href=\"https://gitee.com/TsuiMengchao\" target=\"_blank\">gitee</a></li>\n</ul>\n<h2><a id=\"_77\"></a>其他信息</h2>\n<ul>\n<li>通过英语四级，基本可以理解英文的文档。</li>\n<li>使用过多种编程语言及其框架，并利用其进行过小型项目开发，入职后能更快适应工作需求，在必要时可以可以短期协助处理其它相关岗位的问题。</li>\n<li>有两年以上从事编程开发类项目的工作经验，进行过数次团队合作开发，能更好的对接工作。拥有良好的沟通能力和组织能力。</li>\n</ul>\n', ' <center>\n     <h1>崔梦超</h1>\n </center>\n\n## 个人信息 \n\n* 性 别：男&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;年 龄：22\n* 手 机：18333191029&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;邮 箱：tsuimengchao@aliyun.com    \n* 专 业：计算机科学与技术&emsp;&emsp;&emsp;&emsp;&emsp; 岗 位：后端开发/Python开发\n\n## 工作及教育经历\n \n* 重庆第二师范学院&emsp;&emsp;&emsp;&emsp;&emsp;2022.9~2024.7&emsp;&emsp;&emsp;&emsp; 计算机科学与技术-本科         \n* 重庆电子工程职业学院&emsp;&emsp;&emsp;&emsp;&emsp;2019.9~2022.7&emsp;&emsp;&emsp;&emsp; 移动应用开发-专科  \n\n## 专业技能\n\n* 熟练使用 Python，掌握基础的 Java、PHP、C# 等编程语言\n* 掌握基础数据结构和算法的基本原理\n* 掌握基本的前后端开发能力，擅长抄代码。\n\n## 项目经历\n\n1. 学校 - 国家大学生学情调查《NCSS》问卷系统 - 负责问卷数据导出分析软件开发 - 2020.02- 2020.04 \n    * 具体功能：将国家大学生学情调查《NCSS》问卷系统所收集的问卷数据进行处理分析及生成定制化分析报告。 \n    * 所用技术：运用了Python、PYQT、CSS、MySQL等技术，技术难点是将dataframe类型数据保存成sav格式文件，这个小功能使用的是一个名为pyreadstat的第三方库，这个库在打包为exe文件时出现了问题，当时国内没有太多教程。\n    * 运行效果：勉强能用，毕竟当时才大一，刚开始学习，能搞定已经觉得很不错了。\n    * 演示地址：因为是win软件，因此暂无演示地址。源码地址：[gitee地址](https://gitee.com/laboratory-15304/NCSS) \n\n2. 学校 - 喷码机赋码软件 - 负责软件开发 - 2020.04- 2020.06 \n    * 具体功能：根据协议生成序列码，当喷码机器获取序列码时，通过串口将序列码发送给机器。\n    * 所用技术：运用了Python、PYQT、CSS、MySQL、Serial等技术，技术难点是提供的喷码机器dll库文件没有详细的接口说明；\n    * 运行效果：勉强能用\n    * 演示地址：因为是win软件，因此暂无演示地址。源码地址：[gitee地址](https://gitee.com/laboratory-15304/Prima) \n\n3. 学校 - 数字孪生-智慧校园 - 负责网页开发 - 2020.11- 2021.05 \n    * 具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。 \n    * 所用技术：运用了VUE框架、Element组件库、THREEJS三维引擎库、MySQL数据库、MQTT协议、物联网通讯等技术，技术难点是ThreeJs库上手难度不低\n    * 运行效果：效果不是很好，模型动辄上百兆，加载速度太慢了，而且网页渲染也不行，有时还内存溢出，后面直接换技术了。\n    * 演示地址：这个虽说可以有演示地址，但是太大了，截个图算了。源码地址：[智慧校园-1](https://gitee.com/laboratory-15304/SmartCampusCqcet) - [智慧校园-2](https://gitee.com/laboratory-15304/SmartCampusTorch)\n\n4. 学校 - 数字孪生-智慧校园 - 负责程序开发 - 2021.05 - 2021.07 \n    * 具体功能：整合校园现有信息系统的数据资源及物联网硬件资源，实现校园综合态势监测、校园安防态势监测、校园信息安全监测、校园通行监测、重点楼宇监测、校园设施设备监测、应急指挥调度、数据分析研判等功能，有效提升校园安防、运维管理效力。\n    * 所用技术：运用了Unity、MySQL数据库、物联网、PHP、ThinkPHP框架、ROS机器人操作系统等技术，技术难点是Unity上手难度也不低，使用很简单，用好就难了。\n    * 运行效果：效果很好，基本秒加载，而且渲染也是真的棒。\n    * 演示地址：因为是win软件，因此暂无演示地址。私有仓库，暂不提供源码地址。\n\n5. 学校 - 光化施工控制系统 - 负责软件开发 - 2021.10 - 2022.04 \n    * 具体功能：win工控机软件界面开发，实现通过串口对plc设备控制、通过websocket协议与app端数据互通等功能\n    * 所用技术：运用了Python、PYQT5、QSS、Serial、WebSocket等技术，技术难点是一个海康摄像头用120米的普通网线来连接，还经常断，pyqt5+opencv加我这半斤八两的技术水平应对这个情况太难了。\n    * 运行效果：能用，但是因为plc给的数据不可靠，摄像头不稳定，所以效果一般般。\n    * 演示地址：因为是win软件，因此暂无演示地址。源码地址：[光固化软件](https://gitee.com/laboratory-15304/Actinic-PC) - [光固化后端](https://gitee.com/laboratory-15304/actinic-server)  \n\n6. 个人 - MMORPG游戏（原魔）开发 - 负责服务器和Unity开发 - 2022.03 - 2022.06 \n    * 具体功能：开发和完善socket通信模块，以及角色、背包、装备、道具、NPC和敌人等功能模块。以及使用Unity开发游戏主体。根据当时最喜欢的游戏“原神”照着仿制的。\n    * 所用技术：运用了Sprint Boot框架、eladmin框架、Socket、Mysql、Unity等技术，技术难点是技术要复杂度简直就是个无底洞，一个人精力有限，最后摆烂了，而且我不擅长美化。\n    * 运行效果：能用，Unity部分bug一堆堆，半成品放弃了。Java服务器部分还行，socket用户连接后就创建一个线程，客户端多了之后服务器撑不住。\n    * 演示地址：因为是win软件，因此暂无演示地址。源码地址：[服务器端](https://gitee.com/TsuiMengchao/monster-server)；Unity端使用的SCM，暂时没设置成公开仓库。\n\n7. 个人 - 辰雪博客 - 负责开发与测试 - 2023.10 - 至今 \n    * 具体功能：文章编辑与展示、网站配置、系统监控以及文件存储等常用工具\n    * 所用技术：运用了Spring Boot、 Mybatis-Plus、 Spring Security、Redis、Vue、es等技术，技术难点是我真的不擅长前端开发，完全没有审美啊。\n    * 运行效果：网页版运行效果还行，小程序和APP版还在开发，尚未完成，bug很多。\n    * 演示地址：[辰雪博客](http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl) - [辰雪博客管理端](http://xn--8ey35n.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl)\n    * 源码地址：[gitee地址](https://gitee.com/tsuimengchao/cxblog) - [github地址](https://github.com/tsuimengchao/cxblog) \n\n## 获奖经历\n* 竞赛 2019年12月 2019重庆市第十届大学生程序设计大赛 省部级三等奖\n* 竞赛 2021年9月 全国大学生数学建模竞赛 国家级二等奖\n* 竞赛 在其余专业性较弱的比赛中曾获省部级奖十余次，国家级奖一次\n* 专利证书 《一种并联连接机构及发电机组群控管理系统》和《一种通讯连接机构》 “实用新型专利”授权\n* 论文 《智能网联汽车的应用现状及发展》 《科学咨询》杂志社《科学咨询·科技人文》刊出\n\n## 个人账号 \n* [个人博客](http://辰雪博客.赵浩悦.我爱你)\n* [gitee](https://gitee.com/TsuiMengchao)\n\n## 其他信息 \n* 通过英语四级，基本可以理解英文的文档。\n* 使用过多种编程语言及其框架，并利用其进行过小型项目开发，入职后能更快适应工作需求，在必要时可以可以短期协助处理其它相关岗位的问题。\n* 有两年以上从事编程开发类项目的工作经验，进行过数次团队合作开发，能更好的对接工作。拥有良好的沟通能力和组织能力。 ', 0, 0, 1, 1, NULL, 0, '2024-02-24 22:02:44', NULL, 0, 0, '简历');
INSERT INTO `blog_article` VALUES (16, '1', 32, '通过宝塔面板搭建环境及部署项目', 'https://img.btstu.cn/api/images/5cc53eda99910.jpg', '通过宝塔面板搭建环境及部署本博客项目', '<h1><a id=\"_0\"></a>宝塔面板安装及环境搭建</h1>\n<p>1、 登录你所购买阿里云服务器的账号，点击控制台-&gt;云服务器ecs<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423566428.png\" alt=\"image.png\" /></p>\n<p>2、 开通安全组开启端口<br />\n把需要访问的端口进行配置，选入方向（如：6379，8080，3306，80，21，22，443）<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423615632.png\" alt=\"image.png\" /></p>\n<p>3、 使用xshell或其它工具连接服务器（推荐阿里云自带的远程连接）<br />\n主机地址就是公网ip，密码是修改后的实例密码，用户名默认root，端口号默认22（此端口必须在配置安全组是进行开放否则无法连接到服务器）<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423677653.png\" alt=\"image.png\" /></p>\n<p>4、 安装宝塔面板，www.bt.cn(根据自己操作系统选择命令)<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423721034.png\" alt=\"image.png\" /><br />\n5、 在终端输入命令安装宝塔面板，例如我的如下：</p>\n<pre><code class=\"lang-prism\">yum install -y wget &amp;&amp; wget -O install.sh https://download.bt.cn/install/install_6.0.sh &amp;&amp; sh install.sh ed8484bec\n</code></pre>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423786688.png\" alt=\"image.png\" /><br />\n6、 中间出现的交互一律输入y即可，安装成功后控制台会出现 如下信息说明安装成功，请自行保存面板账户登录信息，这很重要。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423973751.png\" alt=\"edee5aa63c1f171d158391c7764d7b1c.png\" /><br />\n7、 登录宝塔面板<br />\n登录前需要在将阿里云安全组开放宝塔面板端口号，否则将无法访问。<br />\n每次安装自动占用的端口号都不同，请自行确认。<br />\n然后根据地址，账号密码进行登录（建议不要修改账号密码，以免遗忘）<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424269093.png\" alt=\"image.png\" /><br />\n第一次登录可以绑定自己的宝塔账号，以后可以扫码登录。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424317397.png\" alt=\"image.png\" /><br />\n登录成功后面板如下：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424370011.png\" alt=\"image.png\" /></p>\n<p>8、 在宝塔面板进行环境搭建<br />\n首次安装登录会出现推荐安装套件弹窗，本项目直接选择JAVA项（第三个），极速安装，然后一键安装即可。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425051427.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425083740.png\" alt=\"image.png\" /><br />\n耐心等待几分钟，本项目所需要的绝大部分环境就自动安装完成了。</p>\n<p>9、 点击软件商店，搜索Redis进行安装<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710431221195.png\" alt=\"image.png\" /></p>\n<p>安装完成后需要将阿里云安全组和宝塔系统防火墙开关中项目所用到的端口全部开放，如果觉得两个地方都需要配置太麻烦，可以直接关闭宝塔面板的防火墙，只留阿里云安全组即可。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425271610.png\" alt=\"image.png\" /></p>\n<p>到这里为止，已经配置好了本项目所需的基本环境。</p>\n<h1><a id=\"_47\"></a>项目打包及部署</h1>\n<h2><a id=\"_49\"></a>打包</h2>\n<h3><a id=\"server_50\"></a>后端（server）</h3>\n<p>1、 将cxblog-main -&gt; src.main.java.resouces -&gt; config下的application.yml文件中的spring.profiles.active项的参数由 dev 改为 prod，完成开发环境到生产环境的切换。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425846113.png\" alt=\"image.png\" /><br />\n2、 按照实际情况修改 application-prod.yml 文件内容，然后在maven中点击install进行打包。（默认已完成mvn-&gt;compile构建）<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425949703.png\" alt=\"image.png\" /><br />\n3、 打包完成后在 cxblog-main -&gt; target 下会产生名为 cxblog-main-<em>.</em>.jar 的文件，这就是需要部署的最终文件。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426135960.png\" alt=\"image.png\" /></p>\n<h3><a id=\"web_57\"></a>博客端（web）</h3>\n<p>1、 在终端中输入 npm run build 并回车执行，耐心等待打包完成即可。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426286852.png\" alt=\"image.png\" /><br />\n2、 打包完成后 web 项目的根目录下会出现一个名为 web 的目录，这就是需要部署的最终目录。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426442096.png\" alt=\"image.png\" /></p>\n<h3><a id=\"admin_62\"></a>管理端（admin）</h3>\n<p>1、 打包命令替换为 npm run build:prod ，最终打包完成目录为 admin，其余与博客端一致。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426517366.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>注</strong>：本项目为了保持url的间接，默认使用history模式，可自行更改为hash模式。</p>\n</blockquote>\n<p>到这里本项目的打包就完成了。</p>\n<h2><a id=\"_70\"></a>部署</h2>\n<p>首先，将打包完成的三个文件或目录上传到服务器的根目录，linux默认是 /www/wwwroot 目录，我这里为了兼顾其它项目，最终上传到了 /www/wwwroot/mcx/cxblog 目录下。<br />\n上传可以在宝塔面板-&gt;文件中完成，可以根据实际情况选择文件或目录方式上传。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426827504.png\" alt=\"image.png\" /><br />\n上传完成后如下所示：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427123341.png\" alt=\"image.png\" /></p>\n<h3><a id=\"server_76\"></a>后端（server）</h3>\n<p>1、选择 网站 -&gt; Java项目 -&gt; 添加java项目<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427252561.png\" alt=\"image.png\" /><br />\n2、 添加/选择正确的项目jar路径和项目端口<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427341118.png\" alt=\"image.png\" /><br />\n3、 如果有域名也可以添加进来<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427531395.png\" alt=\"image.png\" /><br />\n4、 提交即可，如果有添加自己的域名，务必保证外网映射开启，否则域名访问无效<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710430084767.png\" alt=\"image.png\" /><br />\n5、 点击 数据库-&gt;添加数据库，按照自己实际填写<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429516879.png\" alt=\"image.png\" /><br />\n6、 添加成功后如下：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429643126.png\" alt=\"image.png\" /><br />\n7、 点击备份栏下的导入，从本地上传目录cxblog/sql/cxblog.sql文件并导入<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429752420.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429804623.png\" alt=\"image.png\" /></p>\n<h3><a id=\"web_93\"></a>博客端（web）</h3>\n<p>1、选择 网站 -&gt; PHP项目 -&gt; 添加站点，然后填写域名和正确的网站根目录即可。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427724965.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>注</strong>：ip:port的域名确定项目实际运行端口，domain后面就不要加端口了，否则domain:port的方式访问岂不是很奇怪，比如www.baidu.com:8020，应该没有人这样设置吧哈哈哈哈。</p>\n</blockquote>\n<p>2、 如果前端项目采用的history需要配置伪静态，否则如何直接访问url下分支会出现404。</p>\n<pre><code class=\"lang-\">location / {\n  try_files $uri $uri/ @router;\n  index  index.html;\n}\nlocation @router {\n  rewrite ^.*$ /index.html last;\n}  \n</code></pre>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710430595442.png\" alt=\"image.png\" /></p>\n<h3><a id=\"admin_111\"></a>管理端（admin）</h3>\n<p>1、 跟博客端一样，暂不演示了。</p>\n<p>访问公网ip:port或者域名就能正常访问到本项目了。</p>\n<p>到这里本项目的部署就完成了。</p>\n<h1><a id=\"Bye_118\"></a>Bye</h1>\n', '# 宝塔面板安装及环境搭建\n\n1、 登录你所购买阿里云服务器的账号，点击控制台->云服务器ecs  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423566428.png)\n\n2、 开通安全组开启端口  \n把需要访问的端口进行配置，选入方向（如：6379，8080，3306，80，21，22，443）\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423615632.png)\n\n3、 使用xshell或其它工具连接服务器（推荐阿里云自带的远程连接）  \n主机地址就是公网ip，密码是修改后的实例密码，用户名默认root，端口号默认22（此端口必须在配置安全组是进行开放否则无法连接到服务器）  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423677653.png)\n\n4、 安装宝塔面板，www.bt.cn(根据自己操作系统选择命令)  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423721034.png)\n5、 在终端输入命令安装宝塔面板，例如我的如下：\n\n```prism language-bash\nyum install -y wget && wget -O install.sh https://download.bt.cn/install/install_6.0.sh && sh install.sh ed8484bec\n```\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423786688.png)\n6、 中间出现的交互一律输入y即可，安装成功后控制台会出现 如下信息说明安装成功，请自行保存面板账户登录信息，这很重要。  \n![edee5aa63c1f171d158391c7764d7b1c.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710423973751.png)\n7、 登录宝塔面板  \n登录前需要在将阿里云安全组开放宝塔面板端口号，否则将无法访问。\n每次安装自动占用的端口号都不同，请自行确认。\n然后根据地址，账号密码进行登录（建议不要修改账号密码，以免遗忘）  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424269093.png)\n第一次登录可以绑定自己的宝塔账号，以后可以扫码登录。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424317397.png)\n登录成功后面板如下：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710424370011.png)\n\n8、 在宝塔面板进行环境搭建\n首次安装登录会出现推荐安装套件弹窗，本项目直接选择JAVA项（第三个），极速安装，然后一键安装即可。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425051427.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425083740.png)  \n耐心等待几分钟，本项目所需要的绝大部分环境就自动安装完成了。\n\n9、 点击软件商店，搜索Redis进行安装\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710431221195.png)\n\n安装完成后需要将阿里云安全组和宝塔系统防火墙开关中项目所用到的端口全部开放，如果觉得两个地方都需要配置太麻烦，可以直接关闭宝塔面板的防火墙，只留阿里云安全组即可。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425271610.png)\n\n到这里为止，已经配置好了本项目所需的基本环境。\n\n# 项目打包及部署\n\n## 打包\n### 后端（server）\n1、 将cxblog-main -> src.main.java.resouces -> config下的application.yml文件中的spring.profiles.active项的参数由 dev 改为 prod，完成开发环境到生产环境的切换。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425846113.png)\n2、 按照实际情况修改 application-prod.yml 文件内容，然后在maven中点击install进行打包。（默认已完成mvn->compile构建）\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710425949703.png)\n3、 打包完成后在 cxblog-main -> target 下会产生名为 cxblog-main-*.*.jar 的文件，这就是需要部署的最终文件。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426135960.png)\n### 博客端（web）\n1、 在终端中输入 npm run build 并回车执行，耐心等待打包完成即可。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426286852.png)\n2、 打包完成后 web 项目的根目录下会出现一个名为 web 的目录，这就是需要部署的最终目录。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426442096.png)\n### 管理端（admin）\n1、 打包命令替换为 npm run build:prod ，最终打包完成目录为 admin，其余与博客端一致。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426517366.png)\n\n>**注**：本项目为了保持url的间接，默认使用history模式，可自行更改为hash模式。\n\n到这里本项目的打包就完成了。\n\n## 部署\n首先，将打包完成的三个文件或目录上传到服务器的根目录，linux默认是 /www/wwwroot 目录，我这里为了兼顾其它项目，最终上传到了 /www/wwwroot/mcx/cxblog 目录下。\n上传可以在宝塔面板->文件中完成，可以根据实际情况选择文件或目录方式上传。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710426827504.png)\n上传完成后如下所示：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427123341.png)\n### 后端（server）\n1、选择 网站 -> Java项目 -> 添加java项目\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427252561.png)\n2、 添加/选择正确的项目jar路径和项目端口\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427341118.png)\n3、 如果有域名也可以添加进来\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427531395.png)\n4、 提交即可，如果有添加自己的域名，务必保证外网映射开启，否则域名访问无效\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710430084767.png)\n5、 点击 数据库->添加数据库，按照自己实际填写\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429516879.png)\n6、 添加成功后如下：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429643126.png)\n7、 点击备份栏下的导入，从本地上传目录cxblog/sql/cxblog.sql文件并导入\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429752420.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710429804623.png)\n\n### 博客端（web）\n1、选择 网站 -> PHP项目 -> 添加站点，然后填写域名和正确的网站根目录即可。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710427724965.png)\n>**注**：ip:port的域名确定项目实际运行端口，domain后面就不要加端口了，否则domain:port的方式访问岂不是很奇怪，比如www.baidu.com:8020，应该没有人这样设置吧哈哈哈哈。\n\n2、 如果前端项目采用的history需要配置伪静态，否则如何直接访问url下分支会出现404。\n```\nlocation / {\n  try_files $uri $uri/ @router;\n  index  index.html;\n}\nlocation @router {\n  rewrite ^.*$ /index.html last;\n}  \n```\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240314_1710430595442.png)\n\n\n### 管理端（admin）\n1、 跟博客端一样，暂不演示了。\n\n访问公网ip:port或者域名就能正常访问到本项目了。\n\n到这里本项目的部署就完成了。\n\n# Bye', 0, 1, 1, 1, '', 0, '2024-03-14 23:49:20', NULL, 1, 1, '宝塔，部署');
INSERT INTO `blog_article` VALUES (17, '1', 32, '通过宝塔使用docket搭建环境', 'https://img.btstu.cn/api/images/5cb68c37b8394.jpg', '通过宝塔使用docket搭建本博客项目运行环境', '<h1><a id=\"_Docker_0\"></a>一、宝塔面板一键安装 Docker</h1>\n<p>1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710477696103.png\" alt=\"image.png\" /><br />\n随意选择一个镜像源进行安装，我选择的阿里云源<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710477743979.png\" alt=\"image.png\" /><br />\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507374780.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketmysql_7\"></a>使用docket安装mysql</h1>\n<p>1、 点击本地镜像-&gt;从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507514577.png\" alt=\"image.png\" /><br />\n或者在终端中使用以下命令拉取镜像：</p>\n<pre><code class=\"lang-\">docker pull mysql:5.7\n</code></pre>\n<p>2、 拉取完成后如下所示<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507998567.png\" alt=\"image.png\" /><br />\n3、 根据刚刚拉取的镜像创建容器，点击容器-&gt;创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710508299458.png\" alt=\"image.png\" /><br />\n或者使用命令创建</p>\n<pre><code class=\"lang-\">docker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\n|命令|描述|<br />\n|-|-|<br />\n|docker run|创建一个新的容器 , 同时运行这个容器|<br />\n|–name mysql|启动容器的名字|<br />\n|-d|后台运行|<br />\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|<br />\n|–restart unless-stopped	| 容器重启策略|<br />\n|-v /mydata/mysql/log:/var/log/mysql|	将日志文件夹挂载到主机|<br />\n|-v /mydata/mysql/data:/var/lib/mysql	|将mysql储存文件夹挂载到主机|<br />\n|-v /mydata/mysql/conf:/etc/mysql|	将配置文件夹挂载到主机|<br />\n|-e MYSQL_ROOT_PASSWORD=root|	 设置 root 用户的密码|<br />\n|mysql:5.7|	 启动哪个版本的 mysql (本地镜像的版本)|<br />\n|\\|shell 命令换行符|<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510581446.png\" alt=\"image.png\" /><br />\n4、 创建完成后如下所示<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510635980.png\" alt=\"image.png\" /><br />\n5、 使用命令尝试进入容器内部</p>\n</blockquote>\n<pre><code class=\"lang-\">## 通过Docker命令进入Mysql容器内部\ndocker exec -it mysql-docket /bin/bash\n## 或者\ndocker exec -it mysql-docket bash\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> mysql-docket是我的redis容器名称，请修改成自己的容器名。</p>\n</blockquote>\n<p>并尝试连接数据库，检验是否安装完成<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510791001.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketredis_51\"></a>使用docket安装redis</h1>\n<p>1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket-&gt;云端镜像-&gt;搜索redis，任选一个进行下载</p>\n<blockquote>\n<p><strong>注：</strong> 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到</p>\n</blockquote>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511207973.png\" alt=\"image.png\" /><br />\n2、新建挂载文件夹（路径自己定即可）</p>\n<pre><code class=\"lang-\">mkdir -p /root/docker/redis/data\nmkdir -p /root/docker/redis/conf\n</code></pre>\n<p>3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入</p>\n<pre><code class=\"lang-\">#bind 127.0.0.1 //允许远程连接\nprotected-mode no //配置保护\nappendonly yes //持久化\nrequirepass 123456 //密码\n</code></pre>\n<p>4、 创建容器，点击容器-&gt;创建容器<br />\n手动创建方式：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511692524.png\" alt=\"image.png\" /><br />\n命令创建方式：</p>\n<pre><code class=\"lang-\">docker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，可以根据自己习惯自行命名。</p>\n</blockquote>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511835508.png\" alt=\"image.png\" /><br />\n5、 创建完成后如下<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511917775.png\" alt=\"image.png\" /><br />\n6、 在终端中输入以下命令，进入redis</p>\n<pre><code class=\"lang-\">docker exec -it redis-docket redis-cli\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> redis-docket是我的redis容器名称，请修改成自己的容器名。</p>\n</blockquote>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512014087.png\" alt=\"image.png\" /></p>\n<h1><a id=\"docketjdk8_88\"></a>使用docket安装jdk8</h1>\n<p>1、 搜索并拉取jdk8镜像<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512620125.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512856732.png\" alt=\"image.png\" /><br />\n2、 根据镜像创建容器<br />\n手动创建方法<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512908320.png\" alt=\"image.png\" /></p>\n<pre><code class=\"lang-\">docker run -di --name=jdk8-docket ascdc/jdk8\n</code></pre>\n<blockquote>\n<p><strong>注意</strong> 容器名和镜像名根据自己实际情况修改</p>\n</blockquote>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512927903.png\" alt=\"image.png\" /><br />\n3、 创建完成如下<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512959142.png\" alt=\"image.png\" /><br />\n4、 输入以下命令进入容器</p>\n<pre><code class=\"lang-\">docker exec -it jdk8-docket /bin/bash\n</code></pre>\n<blockquote>\n<p><strong>注意：</strong> jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。<br />\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。</p>\n</blockquote>\n<p>到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章<a href=\"http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16\" target=\"_blank\">《通过宝塔面板搭建环境及部署项目》</a>。</p>\n<h1><a id=\"Bye_112\"></a>Bye</h1>\n', '# 一、宝塔面板一键安装 Docker\n1、点击Docket，第一次进入会提示未安装docket，点击安装，如图所示，点击对应的按钮即可自动安装，全程不需要我们手动介入。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710477696103.png)\n随意选择一个镜像源进行安装，我选择的阿里云源\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710477743979.png)\n2、 安装好之后，如下图所示，就可以在 Docker 界面的最上面看到管理菜单栏，包括快速部署项目、容器、项目、项目模板、镜像、网络、存储卷、仓库、设置等。这些如果对 Docker 比较熟悉的朋友应该都知道怎么使用，如果对 Docker 不熟悉的话建议先熟悉一下。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507374780.png)\n# 使用docket安装mysql\n1、 点击本地镜像->从仓库中拉取，镜像名填写需要的服务名:版本号，例如我需要安装mysql:5.7\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507514577.png)\n或者在终端中使用以下命令拉取镜像：\n```\ndocker pull mysql:5.7\n```\n2、 拉取完成后如下所示\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710507998567.png)\n3、 根据刚刚拉取的镜像创建容器，点击容器->创建容器，mysql服务默认端口3306；因为服务器已经存在mysql服务，3306端口被占用，这里先暂时映射到3307服务器（本地）端口\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710508299458.png)\n或者使用命令创建\n```\ndocker run --name mysql-docket -d -p 3306:3306 --restart unless-stopped -e MYSQL_ROOT_PASSWORD=123456 mysql:5.7\n```\n> **注意：** mysql-docket是我的redis容器名称，可以根据自己习惯自行命名。\n|命令|描述|\n|-|-|\n|docker run|创建一个新的容器 , 同时运行这个容器|\n|–name mysql|启动容器的名字|\n|-d|后台运行|\n|-p 3306:3306|将容器的 3306 (后面那个) 端口映射到主机的 3306 (前面那个) 端口|\n|–restart unless-stopped	| 容器重启策略|\n|-v /mydata/mysql/log:/var/log/mysql|	将日志文件夹挂载到主机|\n|-v /mydata/mysql/data:/var/lib/mysql	|将mysql储存文件夹挂载到主机|\n|-v /mydata/mysql/conf:/etc/mysql|	将配置文件夹挂载到主机|\n|-e MYSQL_ROOT_PASSWORD=root|	 设置 root 用户的密码|\n|mysql:5.7|	 启动哪个版本的 mysql (本地镜像的版本)|\n|\\\\|shell 命令换行符|\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510581446.png)\n4、 创建完成后如下所示\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510635980.png)\n5、 使用命令尝试进入容器内部\n```\n## 通过Docker命令进入Mysql容器内部\ndocker exec -it mysql-docket /bin/bash\n## 或者\ndocker exec -it mysql-docket bash\n```\n> **注意：** mysql-docket是我的redis容器名称，请修改成自己的容器名。\n\n并尝试连接数据库，检验是否安装完成\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710510791001.png)\n\n# 使用docket安装redis\n1、 首先需要拉取redis镜像，本次尝试在云端镜像搜索并拉取，点击Docket->云端镜像->搜索redis，任选一个进行下载\n> **注：** 点击拉取后会没有任何提示，只需耐心等待一分钟左右，在本地镜像页刷新即可看到\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511207973.png)\n2、新建挂载文件夹（路径自己定即可）\n```\nmkdir -p /root/docker/redis/data\nmkdir -p /root/docker/redis/conf\n```\n3.进入上一步创建的conf文件夹中，创建文件redis.conf，可以使用vim redis.conf也可使用可视化软件创建，并将下面内容写入\n```\n#bind 127.0.0.1 //允许远程连接\nprotected-mode no //配置保护\nappendonly yes //持久化\nrequirepass 123456 //密码\n```\n4、 创建容器，点击容器->创建容器\n手动创建方式：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511692524.png)\n命令创建方式：\n```\ndocker run --name redis-docket -p 6379:6379 -v /root/docker/redis/data:/data -v /root/docker/redis/conf/redis.conf:/etc/redis/redis.conf -d redis redis-server /etc/redis/redis.conf --appendonly yes\n```\n> **注意：** redis-docket是我的redis容器名称，可以根据自己习惯自行命名。\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511835508.png)\n5、 创建完成后如下\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710511917775.png)\n6、 在终端中输入以下命令，进入redis\n```\ndocker exec -it redis-docket redis-cli\n```\n> **注意：** redis-docket是我的redis容器名称，请修改成自己的容器名。\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512014087.png)\n\n# 使用docket安装jdk8\n1、 搜索并拉取jdk8镜像\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512620125.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512856732.png)\n2、 根据镜像创建容器\n手动创建方法\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512908320.png)\n```\ndocker run -di --name=jdk8-docket ascdc/jdk8\n```\n> **注意** 容器名和镜像名根据自己实际情况修改\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512927903.png)\n3、 创建完成如下\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240315_1710512959142.png)\n4、 输入以下命令进入容器\n```\ndocker exec -it jdk8-docket /bin/bash\n```\n> **注意：** jdk8-docket是我的redis容器名称，可以根据自己习惯自行命名。\n因为服务器已有jdk8，且无法通过端口等方式启动docket版本jdk，故暂无详细演示。\n\n到这里为止，项目运行所需要的环境基本已经通过docket配置完成，具体项目部署方式详见文章[《通过宝塔面板搭建环境及部署项目》](http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/article/16)。\n\n# Bye', 0, 0, 1, 1, NULL, 0, '2024-03-15 12:46:36', NULL, 1, 1, NULL);
INSERT INTO `blog_article` VALUES (18, '1', 32, '后端手册', 'https://img.btstu.cn/api/images/5c9f097c885cc.jpg', '辰雪博客后端开发手册', '<blockquote>\n<p>本文主要介绍如何二次开发博客后端</p>\n</blockquote>\n<h1><a id=\"_2\"></a>新增模块</h1>\n<h2><a id=\"_3\"></a>新增模块</h2>\n<p>这里演示使用 Idea 创建一个新的子模块</p>\n<p>选择 File -&gt; New -&gt; Module<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710745931406.png\" alt=\"image.png\" /><br />\n选择 New Module -&gt; Create<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746097871.png\" alt=\"image.png\" /><br />\n回到项目，新模块以及创建完毕<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746200169.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>提示</strong><br />\n如果包名和 main 模块 me.mcx 不一样，那么需要在 AppRun.class 中配置扫描路径，两个地方都需增加@ComponentScan及@EnableJpaRepositories。</p>\n</blockquote>\n<p>详见：<a href=\"\" target=\"_blank\">新建模块后访问接口 404</a></p>\n<p>给新模块起一个名字<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746408211.png\" alt=\"image.png\" /><br />\n最后在 main 模块的 pom.xml 的 dependencies 节点加入创建的子模块<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746514664.png\" alt=\"image.png\" /></p>\n<blockquote>\n<p><strong>注意：</strong> 此处还需要添加tool模块的依赖，才能在启动时扫描到该模块swagger才能加载此模块的接口</p>\n</blockquote>\n<pre><code class=\"lang-\">&lt;!--        tools 模块包含了 common 和 logging 模块--&gt;\n&lt;dependency&gt;\n    &lt;groupId&gt;me.zhengjie&lt;/groupId&gt;\n    &lt;artifactId&gt;eladmin-tools&lt;/artifactId&gt;\n    &lt;version&gt;2.7&lt;/version&gt;\n&lt;/dependency&gt;\n</code></pre>\n<h1><a id=\"_33\"></a>权限控制</h1>\n<h2><a id=\"_34\"></a>权限控制</h2>\n<p>本系统权限控制采用 <mark>RBAC</mark> 思想。简单地说，一个用户拥有若干角色，每一个角色拥有若干个菜单，菜单中存在菜单权限与按钮权限， 这样，就构造成“用户-角色-菜单” 的授权模型。在这种模型中，用户与角色、角色与菜单之间构成了多对多的关系，如下图<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710747030104.png\" alt=\"image.png\" /><br />\n安全框架使用的是 <mark>Spring Security + Jwt Token</mark>， 访问后端接口需在请求头中携带token进行访问，请求头格式如下：</p>\n<pre><code class=\"lang-\"># Authorization: Bearer 登录时返回的token\nAuthorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU1ODk2NzY0OSwiaWF0IjoxNTU4OTQ2MDQ5fQ.jsJvqHa1tKbJazG0p9kq5J2tT7zAk5B6N_CspdOAQLWgEICStkMmvLE-qapFTtWnnDUPAjqmsmtPFSWYaH5LtA\n</code></pre>\n<h2><a id=\"_44\"></a>数据交互</h2>\n<p>用户登录 -&gt; 后端验证登录返回 token -&gt; 前端带上token请求后端数据 -&gt; 后端返回数据， 数据交互流程如下：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710747133925.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_48\"></a>权限注解</h2>\n<p><mark>Spring Security</mark> 提供了<mark>Spring EL</mark>表达式，允许我们在定义接口访问的方法上面添加注解，来控制访问权限，常用的 <mark>EL</mark>如下</p>\n<table>\n<thead>\n<tr>\n<th>表达式</th>\n<th>描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>hasRole([role])</td>\n<td>当前用户是否拥有指定角色。</td>\n</tr>\n<tr>\n<td>hasAnyRole([role1,role2])</td>\n<td>多个角色是一个以逗号进行分隔的字符串。如果当前用户拥有指定角色中的任意一个则返回true。</td>\n</tr>\n</tbody>\n</table>\n<p>下面的接口表示用户拥有 <mark>admin</mark>、<mark>menu:edit</mark> 权限中的任意一个就能能访问<mark>update</mark>方法， 如果方法不加==@preAuthorize==注解，意味着所有用户都需要带上有效的 <mark>token</mark> 后能访问 <mark>update</mark> 方法</p>\n<pre><code class=\"lang-\">@Log(description = &quot;修改菜单&quot;)\n@PutMapping(value = &quot;/menus&quot;)\n@PreAuthorize(&quot;hasAnyRole(\'admin\',\'menu:edit\')&quot;)\npublic ResponseEntity update(@Validated @RequestBody Menu resources){\n    // 略\n}\n</code></pre>\n<p>由于每个接口都需要给超级管理员放行，而使用 <mark>hasAnyRole(‘admin’,‘user:list’)</mark> 每次都需要重复的添加 admin 权限，因此在新版本 (2.3) 中加入了自定义权限验证方式，在验证的时候默认给拥有admin权限的用户放行。<br />\n源码:</p>\n<pre><code class=\"lang-\">// cxblog-common -&gt; me.mcx.config.AuthorityConfig\n@Service(value = &quot;cx&quot;)\npublic class AuthorityConfig {\n\n    public Boolean check(String ...permissions){\n        // 获取当前用户的所有权限\n        List&lt;String&gt; cxPermissions = SecurityUtils.getCurrentUser().getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList());\n        // 判断当前用户的所有权限是否包含接口上定义的权限\n        return cxPermissions.contains(&quot;admin&quot;) || Arrays.stream(permissions).anyMatch(elPermissions::contains);\n    }\n}\n</code></pre>\n<p>使用方式：</p>\n<pre><code class=\"lang-\">@PreAuthorize(&quot;@cx.check(\'user:list\',\'user:add\')&quot;) \n</code></pre>\n<h2><a id=\"_84\"></a>接口放行</h2>\n<p>在我们使用的时候，有些接口是不需要验证权限的，这个时候就需要我们给接口放行，使用方式如下<br />\n<strong>1、使用注解方式</strong><br />\n只需要在Controller的方法上加入该注解即可</p>\n<pre><code class=\"lang-\">@AnonymousAccess\n</code></pre>\n<p><strong>2、修改配置文件方式</strong><br />\neladmin-system -&gt; modules -&gt; security -&gt; config -&gt; SecurityConfig</p>\n<blockquote>\n<p><strong>提示</strong><br />\n使用 permitAll() 方法所有人都能访问，包括带上 token 访问<br />\n使用 anonymous() 所有人都能访问，但是带上 token 访问后会报错</p>\n</blockquote>\n<pre><code class=\"lang-\">// 关键代码，部分略\nprotected void configure(HttpSecurity httpSecurity) throws Exception {\n    httpSecurity\n            // 支付宝回调\n            .antMatchers(&quot;/api/aliPay/return&quot;).anonymous()\n            // 所有请求都需要认证\n            .anyRequest().authenticated();\n    httpSecurity\n            .addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);\n}\n</code></pre>\n<h1><a id=\"_110\"></a>通用查询</h1>\n<h2><a id=\"_111\"></a>通用查询</h2>\n<p>本项目对 Jpa 的查询进行了封装，现可以通过 <mark>@Query</mark> 注解实现简单的查询与复杂查询</p>\n<p>简单查询：<mark>等于(默认)、大于等于、小于等于、左模糊、右模糊、中模糊、多字段模糊、NOT_EQUAL 、BETWEEN 、NOT_NULL</mark>。</p>\n<p>复杂查询：<mark>包含（IN）查询、左连接、右连接等</mark></p>\n<h2><a id=\"_119\"></a>参数说明</h2>\n<table>\n<thead>\n<tr>\n<th>字段名称</th>\n<th>字段描述</th>\n<th>默认值</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>propName</td>\n<td>对象的属性名，如果字段名称与实体字段一致，则可以省略</td>\n<td>“”</td>\n</tr>\n<tr>\n<td>type</td>\n<td>查询方式，默认为</td>\n<td>EQUAL</td>\n</tr>\n<tr>\n<td>blurry</td>\n<td>多字段模糊查询，值为实体字段名称</td>\n<td>“”</td>\n</tr>\n<tr>\n<td>joinName</td>\n<td>关联实体的名称</td>\n<td>“”</td>\n</tr>\n<tr>\n<td>join</td>\n<td>连接查询方式，左连接或者右连接</td>\n<td>LEFT</td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_128\"></a>使用方式</h2>\n<p><strong>1、创建一个查询类 <mark>QueryCriteria</mark></strong></p>\n<pre><code class=\"lang-\">@Data\npublic class QueryCriteria {\n\n    // 等于\n    @Query\n    private String a;\n\n    // 左模糊\n    @Query(type = Query.Type.LEFT_LIKE)\n    private String b;\n\n    // 右模糊\n    @Query(type = Query.Type.RIGHT_LIKE)\n    private String c;\n\n    // 大于等于\n    @Query(type = Query.Type.GREATER_THAN, propName = &quot;createTime&quot;)\n    private Timestamp startTime;\n\n    // 小于等于\n    @Query(type = Query.Type.LESS_THAN, propName = &quot;createTime&quot;)\n    private Timestamp endTime;\n\n    // BETWEEN\n    @Query(type = Query.Type.BETWEEN)\n    private List&lt;Timestamp&gt; startTime;\n\n    // 多字段模糊查询，blurry 为字段名称\n    @Query(blurry = &quot;a,b,c&quot;)\n    private String blurry;\n\n    // IN 查询\n    @Query(type = Query.Type.IN)\n    private List&lt;String&gt; d;\n\n    // 左关联查询，left Join ， joinName为关联实体名称 , propName为关联实体 字段\n    @Query(joinName = &quot;&quot;, propName=&quot;&quot;)\n    private String e;\n\n    // 右关联查询，right Join ， joinName为关联实体名称 , propName为关联实体 字段\n    @Query(joinName = &quot;&quot;, propName=&quot;&quot;, join = Query.Join.RIGHT)\n    private String f;\n\n    // NOT_EQUAL 不等于\n    @Query(type = Query.Type.NOT_EQUAL)\n    private String g;\n\n    // NOT_NULL 不为空\n    @Query(type = Query.Type.NOT_NULL)\n    private String g;\n}\n</code></pre>\n<p>关联查询参考：<mark>DictDetailQueryCriteria</mark> 类，下面代码为关联查询 dict 表里面的 name 字段</p>\n<pre><code class=\"lang-\">public class DictDetailQueryCriteria {\n    @Query(propName = &quot;name&quot;,joinName = &quot;dict&quot;)\n    private String dictName;\n}\n\n// propName = &quot;name&quot; 为关联实体 Dict 中的字段名称\npublic class Dict extends BaseEntity implements Serializable {\n    @NotBlank\n    @ApiModelProperty(value = &quot;名称&quot;)\n    private String name;\n}\n\n// joinName = &quot;dict&quot; 为关联实体名称\npublic class DictDetail extends BaseEntity implements Serializable {\n    @JoinColumn(name = &quot;dict_id&quot;)\n    @ManyToOne(fetch=FetchType.LAZY)\n    @ApiModelProperty(value = &quot;字典&quot;, hidden = true)\n    private Dict dict;\n}\n</code></pre>\n<p><strong>2、在控制器中使用</strong></p>\n<pre><code class=\"lang-\">// Pageable 分页查询\npublic ResponseEntity query(QueryCriteria criteria, Pageable pageable){\n    return new ResponseEntity(service.queryAll(criteria,pageable), HttpStatus.OK);\n}\n</code></pre>\n<p><strong>3、Service 中查询</strong></p>\n<pre><code class=\"lang-\">@Override\npublic Object queryAll(QueryCriteria criteria, Pageable pageable){\n    Page&lt;实体&gt; page = repository.findAll(((root, criteriaQuery, cb) -&gt; QueryHelp.getPredicate(root, criteria, cb)),pageable);\n    return page;\n}\n</code></pre>\n<blockquote>\n<p><strong>提示</strong><br />\n如果需要添加一个字段查询，只需要在查询类 QueryCriteria 中添加就可以了，可节省大量时间。<br />\n源码可以查看 eladmin-common 模块中的 me.zhengjie.annotation.Query 与 me.zhengjie.utils.QueryHelp</p>\n</blockquote>\n<h1><a id=\"_224\"></a>系统缓存</h1>\n<h2><a id=\"_225\"></a>系统缓存</h2>\n<p>本系统缓存使用的是 <mark>Redis</mark>，默认使用 <mark>Spring</mark> 的注解对系统缓存进行操作</p>\n<h2><a id=\"_228\"></a>配置缓存</h2>\n<p>配置文件位于 <mark>cxblog-common</mark> 模块中的 <mark>me.mcx.config.RedisConfig</mark></p>\n<h2><a id=\"_231\"></a>缓存注解</h2>\n<pre><code class=\"lang-\">@CacheConfig：主要用于配置该类中会用到的一些共用的缓存配置\n\n@Cacheable：主要方法的返回值将被加入缓存。在查询时，会先从缓存中获取，若不存在才再发起对数据库的访问\n\n@CachePut：主要用于数据新增和修改操作\n\n@CacheEvict：配置于函数上，通常用在删除方法上，用来从缓存中移除相应数据\n</code></pre>\n<h2><a id=\"_241\"></a>使用建议</h2>\n<p>缓存的出现加快了数据查询的速度，同时增加了维护成本，建议使用在高频读低频写的数据上。</p>\n<p>注意：使用不当可能会出现数据不一致的问题，请根据实际业务的需要进行使用。</p>\n<h1><a id=\"_246\"></a>异常处理</h1>\n<h2><a id=\"_247\"></a>异常处理</h2>\n<p>我们开发项目的时候，数据在请求过程中发生错误是非常常见的事情。</p>\n<p>如：权限不足、数据唯一异常、数据不能为空异常、业务异常等。 这些异常如果不经过处理会对前端开发人员和使用者造成不便，因此我们就需要统一处理他们。</p>\n<p>源码位于：<mark>cxblog-common</mark> 模块中的 <mark>exception</mark> 包中</p>\n<h1><a id=\"_254\"></a>异常封装</h1>\n<p><strong>异常实体</strong></p>\n<pre><code class=\"lang-\">@Data\nclass ApiError {\n    private Integer status;\n    @JsonFormat(pattern = &quot;yyyy-MM-dd HH:mm:ss&quot;)\n    private LocalDateTime timestamp;\n    private String message;\n\n    private ApiError() {\n        timestamp = LocalDateTime.now();\n    }\n\n    public ApiError(Integer status,String message) {\n        this();\n        this.status = status;\n        this.message = message;\n    }\n}\n</code></pre>\n<h2><a id=\"_275\"></a>自定义异常</h2>\n<p><strong>1、通用异常</strong><br />\n封装了 <mark>BadRequestException</mark>，用于处理通用的异常</p>\n<pre><code class=\"lang-\">@Getter\npublic class BadRequestException extends RuntimeException{\n\n    private Integer status = BAD_REQUEST.value();\n\n    public BadRequestException(String msg){\n        super(msg);\n    }\n\n    public BadRequestException(HttpStatus status,String msg){\n        super(msg);\n        this.status = status.value();\n    }\n}\n</code></pre>\n<p><strong>2、实体相关异常</strong><br />\n(1) 实体不存在： <mark>EntityNotFoundException</mark></p>\n<pre><code class=\"lang-\">import org.springframework.util.StringUtils;\n\npublic class EntityNotFoundException extends RuntimeException {\n\n    public EntityNotFoundException(Class clazz, String field, String val) {\n        super(EntityNotFoundException.generateMessage(clazz.getSimpleName(), field, val));\n    }\n\n    private static String generateMessage(String entity, String field, String val) {\n        return StringUtils.capitalize(entity)\n                + &quot; with &quot; + field + &quot; &quot;+ val + &quot; does not exist&quot;;\n    }\n}\n</code></pre>\n<p>(2) 实体已存在：<mark>EntityExistException</mark></p>\n<pre><code class=\"lang-\">import org.springframework.util.StringUtils;\n\npublic class EntityExistException extends RuntimeException {\n\n    public EntityExistException(Class clazz, String field, String val) {\n        super(EntityExistException.generateMessage(clazz.getSimpleName(), field, val));\n    }\n\n    private static String generateMessage(String entity, String field, String val) {\n        return StringUtils.capitalize(entity)\n                + &quot; with &quot; + field + &quot; &quot;+ val + &quot; existed&quot;;\n    }\n}\n</code></pre>\n<p>使用场景，删除用户的时候是根据ID删除的，可判断ID是否存在，抛出异常</p>\n<p>新增用户的时候用户名是唯一的，可判断用户是否存在，抛出异常</p>\n<h2><a id=\"_331\"></a>全局异常拦截</h2>\n<p>使用全局异常处理器 <mark>@RestControllerAdvice</mark> 处理请求发送的异常</p>\n<ul>\n<li>\n<p>@RestControllerAdvice：默认会扫描指定包中所有@RequestMapping注解</p>\n</li>\n<li>\n<p>@ExceptionHandler：通过@ExceptionHandler的 value 属性可过滤拦截的条件</p>\n</li>\n</ul>\n<pre><code class=\"lang-\">@RestControllerAdvice\npublic class GlobalExceptionHandler {\n\n    /**\n     * 处理所有不可知的异常\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(Throwable.class)\n    public ResponseEntity handleException(Throwable e){\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(BAD_REQUEST.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n    /**\n     * 处理自定义异常\n     * @param e\n     * @return\n     */\n	@ExceptionHandler(value = BadRequestException.class)\n	public ResponseEntity&lt;ApiError&gt; badRequestException(BadRequestException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(e.getStatus(),e.getMessage());\n        return buildResponseEntity(apiError);\n	}\n\n    /**\n     * 处理 EntityExist\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(value = EntityExistException.class)\n    public ResponseEntity&lt;ApiError&gt; entityExistException(EntityExistException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(BAD_REQUEST.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n\n    /**\n     * 处理 EntityNotFound\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(value = EntityNotFoundException.class)\n    public ResponseEntity&lt;ApiError&gt; entityNotFoundException(EntityNotFoundException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(NOT_FOUND.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n    /**\n     * 统一返回\n     * @param apiError\n     * @return\n     */\n    private ResponseEntity&lt;ApiError&gt; buildResponseEntity(ApiError apiError) {\n        return new ResponseEntity(apiError, HttpStatus.valueOf(apiError.getStatus()));\n    }\n}\n</code></pre>\n<h2><a id=\"_401\"></a>具体使用</h2>\n<pre><code class=\"lang-\">// 通用异常\nthrow new BadRequestException(&quot;发生了异常&quot;);\n// 通用异常，使用自定义状态码\nthrow new BadRequestException(HttpStatus.OK, &quot;发送了异常&quot;);\n// 实体存在异常\nthrow new EntityExistException(User.class, &quot;email&quot;, &quot;elunez@qq.com&quot;);\n// 实体不存在异常\n throw new EntityNotFoundException(User.class, &quot;userName&quot;, &quot;test&quot;);\n</code></pre>\n<h1><a id=\"_413\"></a>系统日志</h1>\n<h2><a id=\"_414\"></a>系统日志</h2>\n<p>本系统使用 <mark>AOP</mark> 方式记录用户操作日志，只需要在 <mark>controller</mark> 的方法上使用 <mark>@Log(&quot;&quot;)</mark> 注解，就可以将用户操作记录到数据库，源码可查看 <mark>eladmin-logging</mark><br />\n模块具体使用如下：</p>\n<pre><code class=\"lang-\">@Log(&quot;新增用户&quot;)\n@PostMapping(value = &quot;/users&quot;)\npublic ResponseEntity create(@Validated @RequestBody User resources){\n    checkLevel(resources);\n    return new ResponseEntity(userService.create(resources),HttpStatus.CREATED);\n}\n</code></pre>\n<p>页面上可以看到 <mark>操作日志</mark>和<mark>异常日志</mark></p>\n<h2><a id=\"_427\"></a>操作日志</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710748990941.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_430\"></a>异常日志</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710749021301.png\" alt=\"image.png\" /></p>\n<h1><a id=\"_433\"></a>数据权限</h1>\n<h2><a id=\"_434\"></a>数据权限</h2>\n<p>本系统是基于部门做的一个简单数据权限控制，也就是通过用户角色中的数据权限控制用户能看哪些数据。</p>\n<p>实现思路就是通过获取角色中关联的部门ID，再通过 IN 查询，达到数据权限控制，前提是被查询的表中需要有 部门ID 的字段。</p>\n<p>系统提供了三种数据权限控制</p>\n<ul>\n<li>全部数据权限 无数据权限限制</li>\n<li>本级数据权限 限制只能看到本部门数据</li>\n<li>自定义数据权限 可根据实际需要选择部门控制数据权限<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710749219433.png\" alt=\"image.png\" /></li>\n</ul>\n<h2><a id=\"_446\"></a>代码参考</h2>\n<p>可参考 DeptQueryCriteria.class 中的写法，底层实现 QueryHelp.class 中的 42 行</p>\n<h1><a id=\"_449\"></a>定时任务</h1>\n<h2><a id=\"_450\"></a>定时任务</h2>\n<p>对于简单的定时任务用 <mark>Spring</mark>的 <mark>@Scheduled</mark> 注解即可，如需要动态管理定时任务就需要使用到 <mark>Quartz</mark>。</p>\n<p>本系统的动态定时任务源码位于 <mark>cxblog-main</mark> -&gt; <mark>modules -&gt; quartz</mark>，使用流程如下</p>\n<h2><a id=\"_455\"></a>任务处理类</h2>\n<p>加入了验证是不是合法的Bean，合法的定时任务 Bean 需要用 @Service 定义，原因： 避免调用攻击者可以从SpringContextHolder获得控制jdbcTemplate类，并使用getDeclaredMethod调用jdbcTemplate的queryForMap函数，执行任意sql命令。</p>\n<pre><code class=\"lang-\">@Slf4j\n@Service\npublic class TestTask {\n\n    public void run(){ log.info(&quot;执行成功&quot;);  }\n\n    public void run1(String str){ log.info(&quot;执行成功，参数为： {}&quot; + str); }\n}\n</code></pre>\n<h2><a id=\"_467\"></a>创建定时任务</h2>\n<p>打开定时任务页面，点击新增按钮创建定时任务，部分参数解释如下：</p>\n<ul>\n<li>Bean名称：Spring Bean名称，如： testTask</li>\n<li>方法名称：对应后台任务方法名称 方法参数：对应后台任务方法名称值，没有可不填</li>\n<li>cron表达式：可查询官方cron表达式介绍</li>\n<li>任务负责人与告警邮箱：支持多个邮箱，定时任务执行失败邮箱提醒</li>\n<li>子任务ID：现支持添加子任务，支持多个子任务，按顺序执行</li>\n<li>状态：是否启动定时任务</li>\n</ul>\n<h2><a id=\"cron_476\"></a>常用cron表达式</h2>\n<pre><code class=\"lang-\">0 0 10,14,16 * * ? 每天上午10点，下午2点，4点 \n0 0/30 9-17 * * ? 朝九晚五工作时间内每半小时 \n0 0 12 ? * WED 表示每个星期三中午12点 \n&quot;0 0 12 * * ?&quot; 每天中午12点触发 \n&quot;0 15 10 ? * *&quot; 每天上午10:15触发 \n&quot;0 15 10 * * ?&quot; 每天上午10:15触发 \n&quot;0 15 10 * * ? *&quot; 每天上午10:15触发 \n&quot;0 15 10 * * ? 2005&quot; 2005年的每天上午10:15触发 \n&quot;0 * 14 * * ?&quot; 在每天下午2点到下午2:59期间的每1分钟触发 \n&quot;0 0/5 14 * * ?&quot; 在每天下午2点到下午2:55期间的每5分钟触发 \n&quot;0 0/5 14,18 * * ?&quot; 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发 \n&quot;0 0-5 14 * * ?&quot; 在每天下午2点到下午2:05期间的每1分钟触发 \n&quot;0 10,44 14 ? 3 WED&quot; 每年三月的星期三的下午2:10和2:44触发 \n&quot;0 15 10 ? * MON-FRI&quot; 周一至周五的上午10:15触发 \n&quot;0 15 10 15 * ?&quot; 每月15日上午10:15触发 \n&quot;0 15 10 L * ?&quot; 每月最后一日的上午10:15触发 \n&quot;0 15 10 ? * 6L&quot; 每月的最后一个星期五上午10:15触发 \n&quot;0 15 10 ? * 6L 2002-2005&quot; 2002年至2005年的每月的最后一个星期五上午10:15触发 \n&quot;0 15 10 ? * 6#3&quot; 每月的第三个星期五上午10:15触发\n</code></pre>\n<h1><a id=\"_499\"></a>代码生成</h1>\n<h2><a id=\"_500\"></a>代码生成</h2>\n<p>本系统提供高灵活度的代码生成功能，只需要在数据库中设计好表结构，就能一键生成前后端代码，使用流程如下</p>\n<h2><a id=\"_503\"></a>表结构设计</h2>\n<p>配置主键（字符串或者整形皆可，整形可不设置自增）<br />\n可以设计字段是否为空（会根据这个进行表单验证）<br />\n设计注释，<mark>前端会根据注释生成表格标题</mark><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751104253.png\" alt=\"image.png\" /></p>\n<p>我们数据库中表都能在这看到，需根据自己的需求进行 <mark>生成器配置</mark><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751197130.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_512\"></a>代码生成</h2>\n<p><strong>代码生成配置</strong><br />\n首先点击编辑按钮</p>\n<p><strong>配置表字段信息</strong><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751323531.png\" alt=\"image.png\" /></p>\n<ul>\n<li>列表：如果勾选会显示在前端的table中</li>\n<li>表单：如果勾选会显示在新增和编辑的form表单中</li>\n<li>数据字段：一般用于单选、多选、下拉列表</li>\n</ul>\n<p><strong>配置生成器信息</strong><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751534095.png\" alt=\"image.png\" /></p>\n<p><strong>生成代码</strong><br />\n可以点击【保存&amp;生成】按钮生成代码</p>\n<p><strong>代码生成预览</strong><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751596619.png\" alt=\"image.png\" /></p>\n<p><strong>代码生成打包下载</strong><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751630731.png\" alt=\"image.png\" /></p>\n<p><strong>额外工作</strong><br />\n代码生成可以节省你==80%==左右的开发任务，部分是需要自己需求进行修改的，如：</p>\n<p>添加菜单：虽然代码给你生成了，但是菜单还是需要自己手动添加的<br />\n按钮权限：接口权限默认生成了，但是没有添加进数据库，需要自行添加，菜单管理中添加按钮</p>\n<h1><a id=\"_541\"></a>运维管理</h1>\n<h2><a id=\"_542\"></a>新增服务器</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751786499.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_545\"></a>新增应用</h2>\n<p>这里用 cxblog-main-1.1.jar 来举例，设置应用名称与目录，然后编写脚本即可<br />\n<strong>部署脚本</strong></p>\n<pre><code class=\"lang-\">mv -f /opt/upload/cxblog-main-1.1.jar /opt/cxblog\ncd /opt/cxblog\nnohup java -jar cxblog-main-1.1.jar &gt;nohup.out 2&gt;&amp;1 &amp;\n</code></pre>\n<p><strong>启动脚本</strong></p>\n<pre><code class=\"lang-\">cd /opt/cxblog\nnohup java -jar cxblog-main-1.1.jar &gt;nohup.out 2&gt;&amp;1 &amp;\n</code></pre>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752031291.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_560\"></a>部署应用</h2>\n<p>打开部署管理菜单，新建一个部署<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752201943.png\" alt=\"image.png\" /></p>\n<p>点击一键部署按钮，上传应用文件, 上传后系统就会自动部署了</p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752259528.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_568\"></a>管理应用</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752360530.png\" alt=\"image.png\" /></p>\n<p>#数据库管理<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752418070.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752443703.png\" alt=\"image.png\" /></p>\n<h1><a id=\"_575\"></a>系统工具</h1>\n<h2><a id=\"_576\"></a>系统工具</h2>\n<p>为了让大家快速的熟悉该项目，这里列举出项目中使用到的工具类</p>\n<ul>\n<li>ElAdminConstant：系统常用常量定义</li>\n<li>EncryptUtils：加密工具，包括对称加密解密，md5加盐加密</li>\n<li>FileUtil：文件工具类</li>\n<li>PageUtil：分页工具类</li>\n<li>RequestHolder：获取HttpServletRequest</li>\n<li>SecurityUtils：获取当前用户</li>\n<li>SpringContextHolder：随时获取bean</li>\n<li>StringUtils：字符串工具类</li>\n<li>ThrowableUtil：异常工具，获取堆栈信息</li>\n<li>ValidationUtil：验证工具</li>\n<li>RsaUtils：可生成公钥私钥，加密解密功能</li>\n</ul>\n<h1><a id=\"_591\"></a>其他杂项</h1>\n<h2><a id=\"_592\"></a>系统基类</h2>\n<p>加入了 Entity 基类 和 DTO 基类，大家可以按需去继承和修改，代码路径</p>\n<pre><code class=\"lang-\">cxblog-common -&gt; me.mcx.base\n</code></pre>\n<h2><a id=\"_597\"></a>服务监控</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752682749.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_600\"></a>异步线程池</h2>\n<p>该版本重写了spring默认线程池，代码地址：</p>\n<pre><code class=\"lang-\">cxblog-main -&gt; me.mcx.config.thread.CustomExecutorConfig\n</code></pre>\n<p>源码如下：</p>\n<pre><code class=\"lang-\">@Configuration\npublic class CustomExecutorConfig {\n\n    /**\n     * 自定义线程池，用法 @Async\n     * @return Executor\n     */\n    @Bean\n    @Primary\n    public Executor elAsync() {\n        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();\n        executor.setCorePoolSize(AsyncTaskProperties.corePoolSize);\n        executor.setMaxPoolSize(AsyncTaskProperties.maxPoolSize);\n        executor.setQueueCapacity(AsyncTaskProperties.queueCapacity);\n        executor.setThreadNamePrefix(&quot;el-async-&quot;);\n        executor.setKeepAliveSeconds(AsyncTaskProperties.keepAliveSeconds);\n        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());\n        executor.initialize();\n        return executor;\n    }\n\n    /**\n     * 自定义线程池，用法 @Async(&quot;otherAsync&quot;)\n     * @return Executor\n     */\n    @Bean\n    public Executor otherAsync() {\n        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();\n        executor.setCorePoolSize(15);\n        executor.setQueueCapacity(50);\n        executor.setKeepAliveSeconds(AsyncTaskProperties.keepAliveSeconds);\n        executor.setThreadNamePrefix(&quot;el-task-&quot;);\n        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());\n        executor.initialize();\n        return executor;\n    }\n}\n</code></pre>\n', '> 本文主要介绍如何二次开发博客后端\n\n# 新增模块\n## 新增模块\n这里演示使用 Idea 创建一个新的子模块\n\n选择 File -> New -> Module\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710745931406.png)\n选择 New Module -> Create\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746097871.png)\n回到项目，新模块以及创建完毕\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746200169.png)\n\n> **提示**\n如果包名和 main 模块 me.mcx 不一样，那么需要在 AppRun.class 中配置扫描路径，两个地方都需增加@ComponentScan及@EnableJpaRepositories。\n\n详见：[新建模块后访问接口 404]()\n\n给新模块起一个名字\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746408211.png)\n最后在 main 模块的 pom.xml 的 dependencies 节点加入创建的子模块\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710746514664.png)\n\n> **注意：** 此处还需要添加tool模块的依赖，才能在启动时扫描到该模块swagger才能加载此模块的接口\n```\n<!--        tools 模块包含了 common 和 logging 模块-->\n<dependency>\n    <groupId>me.zhengjie</groupId>\n    <artifactId>eladmin-tools</artifactId>\n    <version>2.7</version>\n</dependency>\n```\n\n# 权限控制\n## 权限控制\n\n本系统权限控制采用 ==RBAC== 思想。简单地说，一个用户拥有若干角色，每一个角色拥有若干个菜单，菜单中存在菜单权限与按钮权限， 这样，就构造成“用户-角色-菜单” 的授权模型。在这种模型中，用户与角色、角色与菜单之间构成了多对多的关系，如下图\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710747030104.png)\n安全框架使用的是 ==Spring Security + Jwt Token==， 访问后端接口需在请求头中携带token进行访问，请求头格式如下：\n```\n# Authorization: Bearer 登录时返回的token\nAuthorization: Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImV4cCI6MTU1ODk2NzY0OSwiaWF0IjoxNTU4OTQ2MDQ5fQ.jsJvqHa1tKbJazG0p9kq5J2tT7zAk5B6N_CspdOAQLWgEICStkMmvLE-qapFTtWnnDUPAjqmsmtPFSWYaH5LtA\n```\n\n## 数据交互\n用户登录 -> 后端验证登录返回 token -> 前端带上token请求后端数据 -> 后端返回数据， 数据交互流程如下：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710747133925.png)\n\n## 权限注解\n==Spring Security== 提供了==Spring EL==表达式，允许我们在定义接口访问的方法上面添加注解，来控制访问权限，常用的 ==EL==如下\n\n|表达式|	描述|\n|-|-|\n|hasRole([role])|	当前用户是否拥有指定角色。|\n|hasAnyRole([role1,role2])|	多个角色是一个以逗号进行分隔的字符串。如果当前用户拥有指定角色中的任意一个则返回true。|\n\n下面的接口表示用户拥有 ==admin==、==menu:edit== 权限中的任意一个就能能访问==update==方法， 如果方法不加==@preAuthorize==注解，意味着所有用户都需要带上有效的 ==token== 后能访问 ==update== 方法\n```\n@Log(description = \"修改菜单\")\n@PutMapping(value = \"/menus\")\n@PreAuthorize(\"hasAnyRole(\'admin\',\'menu:edit\')\")\npublic ResponseEntity update(@Validated @RequestBody Menu resources){\n    // 略\n}\n```\n由于每个接口都需要给超级管理员放行，而使用 ==hasAnyRole(\'admin\',\'user:list\')== 每次都需要重复的添加 admin 权限，因此在新版本 (2.3) 中加入了自定义权限验证方式，在验证的时候默认给拥有admin权限的用户放行。\n源码:\n```\n// cxblog-common -> me.mcx.config.AuthorityConfig\n@Service(value = \"cx\")\npublic class AuthorityConfig {\n\n    public Boolean check(String ...permissions){\n        // 获取当前用户的所有权限\n        List<String> cxPermissions = SecurityUtils.getCurrentUser().getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList());\n        // 判断当前用户的所有权限是否包含接口上定义的权限\n        return cxPermissions.contains(\"admin\") || Arrays.stream(permissions).anyMatch(elPermissions::contains);\n    }\n}\n```\n使用方式：\n```\n@PreAuthorize(\"@cx.check(\'user:list\',\'user:add\')\") \n```\n## 接口放行\n在我们使用的时候，有些接口是不需要验证权限的，这个时候就需要我们给接口放行，使用方式如下\n**1、使用注解方式**\n只需要在Controller的方法上加入该注解即可\n```\n@AnonymousAccess\n```\n**2、修改配置文件方式**\neladmin-system -> modules -> security -> config -> SecurityConfig\n\n>**提示**\n使用 permitAll() 方法所有人都能访问，包括带上 token 访问\n使用 anonymous() 所有人都能访问，但是带上 token 访问后会报错\n```\n// 关键代码，部分略\nprotected void configure(HttpSecurity httpSecurity) throws Exception {\n    httpSecurity\n            // 支付宝回调\n            .antMatchers(\"/api/aliPay/return\").anonymous()\n            // 所有请求都需要认证\n            .anyRequest().authenticated();\n    httpSecurity\n            .addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);\n}\n```\n\n# 通用查询\n## 通用查询\n\n本项目对 Jpa 的查询进行了封装，现可以通过 ==@Query== 注解实现简单的查询与复杂查询\n\n简单查询：==等于(默认)、大于等于、小于等于、左模糊、右模糊、中模糊、多字段模糊、NOT_EQUAL 、BETWEEN 、NOT_NULL==。\n\n复杂查询：==包含（IN）查询、左连接、右连接等==\n\n## 参数说明\n|字段名称|	字段描述|	默认值|\n|-|-|-|\n|propName|	对象的属性名，如果字段名称与实体字段一致，则可以省略|	\"\"|\n|type|	查询方式，默认为|	EQUAL|\n|blurry|	多字段模糊查询，值为实体字段名称|	\"\"|\n|joinName|	关联实体的名称|	\"\"|\n|join|	连接查询方式，左连接或者右连接|	LEFT|\n \n## 使用方式\n**1、创建一个查询类 ==QueryCriteria==**\n```\n@Data\npublic class QueryCriteria {\n\n    // 等于\n    @Query\n    private String a;\n\n    // 左模糊\n    @Query(type = Query.Type.LEFT_LIKE)\n    private String b;\n\n    // 右模糊\n    @Query(type = Query.Type.RIGHT_LIKE)\n    private String c;\n\n    // 大于等于\n    @Query(type = Query.Type.GREATER_THAN, propName = \"createTime\")\n    private Timestamp startTime;\n\n    // 小于等于\n    @Query(type = Query.Type.LESS_THAN, propName = \"createTime\")\n    private Timestamp endTime;\n\n    // BETWEEN\n    @Query(type = Query.Type.BETWEEN)\n    private List<Timestamp> startTime;\n\n    // 多字段模糊查询，blurry 为字段名称\n    @Query(blurry = \"a,b,c\")\n    private String blurry;\n\n    // IN 查询\n    @Query(type = Query.Type.IN)\n    private List<String> d;\n\n    // 左关联查询，left Join ， joinName为关联实体名称 , propName为关联实体 字段\n    @Query(joinName = \"\", propName=\"\")\n    private String e;\n\n    // 右关联查询，right Join ， joinName为关联实体名称 , propName为关联实体 字段\n    @Query(joinName = \"\", propName=\"\", join = Query.Join.RIGHT)\n    private String f;\n\n    // NOT_EQUAL 不等于\n    @Query(type = Query.Type.NOT_EQUAL)\n    private String g;\n\n    // NOT_NULL 不为空\n    @Query(type = Query.Type.NOT_NULL)\n    private String g;\n}\n```\n关联查询参考：==DictDetailQueryCriteria== 类，下面代码为关联查询 dict 表里面的 name 字段\n```\npublic class DictDetailQueryCriteria {\n    @Query(propName = \"name\",joinName = \"dict\")\n    private String dictName;\n}\n\n// propName = \"name\" 为关联实体 Dict 中的字段名称\npublic class Dict extends BaseEntity implements Serializable {\n    @NotBlank\n    @ApiModelProperty(value = \"名称\")\n    private String name;\n}\n\n// joinName = \"dict\" 为关联实体名称\npublic class DictDetail extends BaseEntity implements Serializable {\n    @JoinColumn(name = \"dict_id\")\n    @ManyToOne(fetch=FetchType.LAZY)\n    @ApiModelProperty(value = \"字典\", hidden = true)\n    private Dict dict;\n}\n```\n**2、在控制器中使用**\n```\n// Pageable 分页查询\npublic ResponseEntity query(QueryCriteria criteria, Pageable pageable){\n    return new ResponseEntity(service.queryAll(criteria,pageable), HttpStatus.OK);\n}\n```\n**3、Service 中查询**\n```\n@Override\npublic Object queryAll(QueryCriteria criteria, Pageable pageable){\n    Page<实体> page = repository.findAll(((root, criteriaQuery, cb) -> QueryHelp.getPredicate(root, criteria, cb)),pageable);\n    return page;\n}\n```\n>**提示**\n如果需要添加一个字段查询，只需要在查询类 QueryCriteria 中添加就可以了，可节省大量时间。\n源码可以查看 eladmin-common 模块中的 me.zhengjie.annotation.Query 与 me.zhengjie.utils.QueryHelp\n\n# 系统缓存\n## 系统缓存\n本系统缓存使用的是 ==Redis==，默认使用 ==Spring== 的注解对系统缓存进行操作\n\n## 配置缓存\n配置文件位于 ==cxblog-common== 模块中的 ==me.mcx.config.RedisConfig==\n\n## 缓存注解\n```\n@CacheConfig：主要用于配置该类中会用到的一些共用的缓存配置\n\n@Cacheable：主要方法的返回值将被加入缓存。在查询时，会先从缓存中获取，若不存在才再发起对数据库的访问\n\n@CachePut：主要用于数据新增和修改操作\n\n@CacheEvict：配置于函数上，通常用在删除方法上，用来从缓存中移除相应数据\n```\n## 使用建议\n缓存的出现加快了数据查询的速度，同时增加了维护成本，建议使用在高频读低频写的数据上。\n\n注意：使用不当可能会出现数据不一致的问题，请根据实际业务的需要进行使用。\n\n# 异常处理\n## 异常处理\n我们开发项目的时候，数据在请求过程中发生错误是非常常见的事情。\n\n如：权限不足、数据唯一异常、数据不能为空异常、业务异常等。 这些异常如果不经过处理会对前端开发人员和使用者造成不便，因此我们就需要统一处理他们。\n\n源码位于：==cxblog-common== 模块中的 ==exception== 包中\n\n# 异常封装\n**异常实体**\n```\n@Data\nclass ApiError {\n    private Integer status;\n    @JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")\n    private LocalDateTime timestamp;\n    private String message;\n\n    private ApiError() {\n        timestamp = LocalDateTime.now();\n    }\n\n    public ApiError(Integer status,String message) {\n        this();\n        this.status = status;\n        this.message = message;\n    }\n}\n```\n## 自定义异常\n**1、通用异常**\n封装了 ==BadRequestException==，用于处理通用的异常\n```\n@Getter\npublic class BadRequestException extends RuntimeException{\n\n    private Integer status = BAD_REQUEST.value();\n\n    public BadRequestException(String msg){\n        super(msg);\n    }\n\n    public BadRequestException(HttpStatus status,String msg){\n        super(msg);\n        this.status = status.value();\n    }\n}\n```\n**2、实体相关异常**\n(1) 实体不存在： ==EntityNotFoundException==\n```\nimport org.springframework.util.StringUtils;\n\npublic class EntityNotFoundException extends RuntimeException {\n\n    public EntityNotFoundException(Class clazz, String field, String val) {\n        super(EntityNotFoundException.generateMessage(clazz.getSimpleName(), field, val));\n    }\n\n    private static String generateMessage(String entity, String field, String val) {\n        return StringUtils.capitalize(entity)\n                + \" with \" + field + \" \"+ val + \" does not exist\";\n    }\n}\n```\n(2) 实体已存在：==EntityExistException==\n```\nimport org.springframework.util.StringUtils;\n\npublic class EntityExistException extends RuntimeException {\n\n    public EntityExistException(Class clazz, String field, String val) {\n        super(EntityExistException.generateMessage(clazz.getSimpleName(), field, val));\n    }\n\n    private static String generateMessage(String entity, String field, String val) {\n        return StringUtils.capitalize(entity)\n                + \" with \" + field + \" \"+ val + \" existed\";\n    }\n}\n```\n使用场景，删除用户的时候是根据ID删除的，可判断ID是否存在，抛出异常\n\n新增用户的时候用户名是唯一的，可判断用户是否存在，抛出异常\n\n## 全局异常拦截\n使用全局异常处理器 ==@RestControllerAdvice== 处理请求发送的异常\n\n* @RestControllerAdvice：默认会扫描指定包中所有@RequestMapping注解\n\n* @ExceptionHandler：通过@ExceptionHandler的 value 属性可过滤拦截的条件\n```\n@RestControllerAdvice\npublic class GlobalExceptionHandler {\n\n    /**\n     * 处理所有不可知的异常\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(Throwable.class)\n    public ResponseEntity handleException(Throwable e){\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(BAD_REQUEST.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n    /**\n     * 处理自定义异常\n     * @param e\n     * @return\n     */\n	@ExceptionHandler(value = BadRequestException.class)\n	public ResponseEntity<ApiError> badRequestException(BadRequestException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(e.getStatus(),e.getMessage());\n        return buildResponseEntity(apiError);\n	}\n\n    /**\n     * 处理 EntityExist\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(value = EntityExistException.class)\n    public ResponseEntity<ApiError> entityExistException(EntityExistException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(BAD_REQUEST.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n\n    /**\n     * 处理 EntityNotFound\n     * @param e\n     * @return\n     */\n    @ExceptionHandler(value = EntityNotFoundException.class)\n    public ResponseEntity<ApiError> entityNotFoundException(EntityNotFoundException e) {\n        // 打印堆栈信息\n        log.error(ThrowableUtil.getStackTrace(e));\n        ApiError apiError = new ApiError(NOT_FOUND.value(),e.getMessage());\n        return buildResponseEntity(apiError);\n    }\n    /**\n     * 统一返回\n     * @param apiError\n     * @return\n     */\n    private ResponseEntity<ApiError> buildResponseEntity(ApiError apiError) {\n        return new ResponseEntity(apiError, HttpStatus.valueOf(apiError.getStatus()));\n    }\n}\n```\n## 具体使用\n```\n// 通用异常\nthrow new BadRequestException(\"发生了异常\");\n// 通用异常，使用自定义状态码\nthrow new BadRequestException(HttpStatus.OK, \"发送了异常\");\n// 实体存在异常\nthrow new EntityExistException(User.class, \"email\", \"elunez@qq.com\");\n// 实体不存在异常\n throw new EntityNotFoundException(User.class, \"userName\", \"test\");\n```\n\n# 系统日志\n## 系统日志\n本系统使用 ==AOP== 方式记录用户操作日志，只需要在 ==controller== 的方法上使用 ==@Log(\"\")== 注解，就可以将用户操作记录到数据库，源码可查看 ==eladmin-logging==\n模块具体使用如下：\n```\n@Log(\"新增用户\")\n@PostMapping(value = \"/users\")\npublic ResponseEntity create(@Validated @RequestBody User resources){\n    checkLevel(resources);\n    return new ResponseEntity(userService.create(resources),HttpStatus.CREATED);\n}\n```\n页面上可以看到 ==操作日志==和==异常日志==\n\n## 操作日志\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710748990941.png)\n\n## 异常日志\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710749021301.png)\n\n# 数据权限\n## 数据权限\n本系统是基于部门做的一个简单数据权限控制，也就是通过用户角色中的数据权限控制用户能看哪些数据。\n\n实现思路就是通过获取角色中关联的部门ID，再通过 IN 查询，达到数据权限控制，前提是被查询的表中需要有 部门ID 的字段。\n\n系统提供了三种数据权限控制\n\n* 全部数据权限 无数据权限限制\n* 本级数据权限 限制只能看到本部门数据\n* 自定义数据权限 可根据实际需要选择部门控制数据权限\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710749219433.png)\n\n## 代码参考\n可参考 DeptQueryCriteria.class 中的写法，底层实现 QueryHelp.class 中的 42 行\n\n# 定时任务\n## 定时任务\n对于简单的定时任务用 ==Spring==的 ==@Scheduled== 注解即可，如需要动态管理定时任务就需要使用到 ==Quartz==。\n\n本系统的动态定时任务源码位于 ==cxblog-main== -> ==modules -> quartz==，使用流程如下\n\n## 任务处理类\n加入了验证是不是合法的Bean，合法的定时任务 Bean 需要用 @Service 定义，原因： 避免调用攻击者可以从SpringContextHolder获得控制jdbcTemplate类，并使用getDeclaredMethod调用jdbcTemplate的queryForMap函数，执行任意sql命令。\n```\n@Slf4j\n@Service\npublic class TestTask {\n\n    public void run(){ log.info(\"执行成功\");  }\n\n    public void run1(String str){ log.info(\"执行成功，参数为： {}\" + str); }\n}\n```\n## 创建定时任务\n打开定时任务页面，点击新增按钮创建定时任务，部分参数解释如下：\n\n* Bean名称：Spring Bean名称，如： testTask\n* 方法名称：对应后台任务方法名称 方法参数：对应后台任务方法名称值，没有可不填\n* cron表达式：可查询官方cron表达式介绍\n* 任务负责人与告警邮箱：支持多个邮箱，定时任务执行失败邮箱提醒\n* 子任务ID：现支持添加子任务，支持多个子任务，按顺序执行\n* 状态：是否启动定时任务\n## 常用cron表达式\n```\n0 0 10,14,16 * * ? 每天上午10点，下午2点，4点 \n0 0/30 9-17 * * ? 朝九晚五工作时间内每半小时 \n0 0 12 ? * WED 表示每个星期三中午12点 \n\"0 0 12 * * ?\" 每天中午12点触发 \n\"0 15 10 ? * *\" 每天上午10:15触发 \n\"0 15 10 * * ?\" 每天上午10:15触发 \n\"0 15 10 * * ? *\" 每天上午10:15触发 \n\"0 15 10 * * ? 2005\" 2005年的每天上午10:15触发 \n\"0 * 14 * * ?\" 在每天下午2点到下午2:59期间的每1分钟触发 \n\"0 0/5 14 * * ?\" 在每天下午2点到下午2:55期间的每5分钟触发 \n\"0 0/5 14,18 * * ?\" 在每天下午2点到2:55期间和下午6点到6:55期间的每5分钟触发 \n\"0 0-5 14 * * ?\" 在每天下午2点到下午2:05期间的每1分钟触发 \n\"0 10,44 14 ? 3 WED\" 每年三月的星期三的下午2:10和2:44触发 \n\"0 15 10 ? * MON-FRI\" 周一至周五的上午10:15触发 \n\"0 15 10 15 * ?\" 每月15日上午10:15触发 \n\"0 15 10 L * ?\" 每月最后一日的上午10:15触发 \n\"0 15 10 ? * 6L\" 每月的最后一个星期五上午10:15触发 \n\"0 15 10 ? * 6L 2002-2005\" 2002年至2005年的每月的最后一个星期五上午10:15触发 \n\"0 15 10 ? * 6#3\" 每月的第三个星期五上午10:15触发\n```\n\n# 代码生成\n## 代码生成\n本系统提供高灵活度的代码生成功能，只需要在数据库中设计好表结构，就能一键生成前后端代码，使用流程如下\n\n## 表结构设计\n配置主键（字符串或者整形皆可，整形可不设置自增）\n可以设计字段是否为空（会根据这个进行表单验证）\n设计注释，==前端会根据注释生成表格标题==\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751104253.png)\n\n我们数据库中表都能在这看到，需根据自己的需求进行 ==生成器配置==\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751197130.png)\n\n## 代码生成\n**代码生成配置**\n首先点击编辑按钮\n\n**配置表字段信息**\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751323531.png)\n\n* 列表：如果勾选会显示在前端的table中\n* 表单：如果勾选会显示在新增和编辑的form表单中\n* 数据字段：一般用于单选、多选、下拉列表\n\n**配置生成器信息**\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751534095.png)\n\n**生成代码**\n可以点击【保存&生成】按钮生成代码\n\n**代码生成预览**\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751596619.png)\n\n**代码生成打包下载**\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751630731.png)\n\n**额外工作**\n代码生成可以节省你==80%==左右的开发任务，部分是需要自己需求进行修改的，如：\n\n添加菜单：虽然代码给你生成了，但是菜单还是需要自己手动添加的\n按钮权限：接口权限默认生成了，但是没有添加进数据库，需要自行添加，菜单管理中添加按钮\n\n# 运维管理\n## 新增服务器\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710751786499.png)\n\n## 新增应用\n这里用 cxblog-main-1.1.jar 来举例，设置应用名称与目录，然后编写脚本即可\n**部署脚本**\n```\nmv -f /opt/upload/cxblog-main-1.1.jar /opt/cxblog\ncd /opt/cxblog\nnohup java -jar cxblog-main-1.1.jar >nohup.out 2>&1 &\n```\n**启动脚本**\n```\ncd /opt/cxblog\nnohup java -jar cxblog-main-1.1.jar >nohup.out 2>&1 &\n```\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752031291.png)\n\n## 部署应用\n打开部署管理菜单，新建一个部署\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752201943.png)\n\n点击一键部署按钮，上传应用文件, 上传后系统就会自动部署了\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752259528.png)\n\n## 管理应用\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752360530.png)\n\n#数据库管理\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752418070.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752443703.png)\n\n# 系统工具\n## 系统工具\n为了让大家快速的熟悉该项目，这里列举出项目中使用到的工具类\n\n* ElAdminConstant：系统常用常量定义\n* EncryptUtils：加密工具，包括对称加密解密，md5加盐加密\n* FileUtil：文件工具类\n* PageUtil：分页工具类\n* RequestHolder：获取HttpServletRequest\n* SecurityUtils：获取当前用户\n* SpringContextHolder：随时获取bean\n* StringUtils：字符串工具类\n* ThrowableUtil：异常工具，获取堆栈信息\n* ValidationUtil：验证工具\n* RsaUtils：可生成公钥私钥，加密解密功能\n\n# 其他杂项\n## 系统基类\n加入了 Entity 基类 和 DTO 基类，大家可以按需去继承和修改，代码路径\n```\ncxblog-common -> me.mcx.base\n```\n## 服务监控\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710752682749.png)\n\n## 异步线程池\n该版本重写了spring默认线程池，代码地址：\n```\ncxblog-main -> me.mcx.config.thread.CustomExecutorConfig\n```\n源码如下：\n```\n@Configuration\npublic class CustomExecutorConfig {\n\n    /**\n     * 自定义线程池，用法 @Async\n     * @return Executor\n     */\n    @Bean\n    @Primary\n    public Executor elAsync() {\n        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();\n        executor.setCorePoolSize(AsyncTaskProperties.corePoolSize);\n        executor.setMaxPoolSize(AsyncTaskProperties.maxPoolSize);\n        executor.setQueueCapacity(AsyncTaskProperties.queueCapacity);\n        executor.setThreadNamePrefix(\"el-async-\");\n        executor.setKeepAliveSeconds(AsyncTaskProperties.keepAliveSeconds);\n        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());\n        executor.initialize();\n        return executor;\n    }\n\n    /**\n     * 自定义线程池，用法 @Async(\"otherAsync\")\n     * @return Executor\n     */\n    @Bean\n    public Executor otherAsync() {\n        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();\n        executor.setCorePoolSize(15);\n        executor.setQueueCapacity(50);\n        executor.setKeepAliveSeconds(AsyncTaskProperties.keepAliveSeconds);\n        executor.setThreadNamePrefix(\"el-task-\");\n        executor.setRejectedExecutionHandler(new ThreadPoolExecutor.CallerRunsPolicy());\n        executor.initialize();\n        return executor;\n    }\n}\n```', 0, 0, 1, 1, NULL, 0, '2024-03-18 17:52:56', NULL, 1, 1, '后端');
INSERT INTO `blog_article` VALUES (19, '1', 32, 'Linux部署项目', 'https://img.btstu.cn/api/images/5c9c2dae8921e.jpg', '在Linux中部署本博客项目', '<blockquote>\n<p>本文主要介绍如何部署本博客项目</p>\n</blockquote>\n<h1><a id=\"_1\"></a>常规部署方式</h1>\n<h2><a id=\"_3\"></a>后端部署</h2>\n<p>按需修改我们的 <mark>application-prod.yml</mark>，如需打开 Swagger ，那么需要将 <mark>enabled</mark> 设置为 true</p>\n<pre><code class=\"lang-\">swagger:\n  enabled: true\n</code></pre>\n<p>我们需要将项目打包好的 Jar 文件上传到服务器，步骤图如下：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710753935667.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710753980056.png\" alt=\"image.png\" /></p>\n<p>编写脚本用于操作 <mark>java</mark> 服务</p>\n<p>(1) 启动脚本 <mark>start.sh</mark></p>\n<pre><code class=\"lang-\">nohup java -jar cxblog-main-1.1.jar --spring.profiles.active=prod &gt; nohup.out 2&gt;&amp;1 &amp;\n</code></pre>\n<p>(2) 停止脚本 <mark>stop.sh</mark></p>\n<pre><code class=\"lang-\">PID=$(ps -ef | grep cxblog-main-1.1.jar | grep -v grep | awk \'{ print $2 }\')\nif [ -z &quot;$PID&quot; ]\nthen\necho Application is already stopped\nelse\necho kill -9 $PID\nkill -9 $PID\nfi\n</code></pre>\n<p>(3) 查看日志脚本 <mark>log.sh</mark></p>\n<pre><code class=\"lang-\">tail -f nohup.out\n</code></pre>\n<p>脚本创建完成后就可以操作 <mark>java</mark> 服务了</p>\n<pre><code class=\"lang-\"># 启动java\n./start.sh\n# 停止java服务\n./stop.sh\n# 查看日志\n./log.sh\n</code></pre>\n<p>配置 nginx: 我们可以使用 <mark>nginx</mark> 代理 <mark>java</mark>服务，添加配置</p>\n<pre><code class=\"lang-\">server {\n    listen 80;\n    server_name 域名/当前服务器外网IP;\n    location / {\n        proxy_pass http://127.0.0.1:8000; #这里的端口记得改成项目对应的哦\n        proxy_set_header X-Forwarded-Proto $scheme;\n        proxy_set_header X-Forwarded-Port $server_port;\n        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n        proxy_set_header Upgrade $http_upgrade;\n        proxy_set_header Connection &quot;upgrade&quot;;\n        }\n    }\n</code></pre>\n<h1><a id=\"_58\"></a>前端部署</h1>\n<p>这里提供两个配置方式 [History、Hash] 的部署方式，首先修改接口地址，如果是 IP 地址，那么需要修改为外网 IP<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754170273.png\" alt=\"image.png\" /></p>\n<p><strong>History 模式</strong><br />\n项目默认是 History 模式，不需要做任何修改<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754266034.png\" alt=\"image.png\" /></p>\n<p><strong>Hash 模式</strong><br />\n1、修改 routers.js，取消 hash 的注释<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754316393.png\" alt=\"image.png\" /></p>\n<p>#2、修改根目录 vue.config.js 配置，取消 hash 的注释<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754353076.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_73\"></a>打包项目</h2>\n<p>不管是将项目部署到 <mark>nginx</mark> 还是其他服务器，都需要先将项目打包</p>\n<pre><code class=\"lang-\">npm run build:prod\n</code></pre>\n<p>打包完成后会在根目录生成 admin 文件夹，我们需要将他上传到服务器中</p>\n<h2><a id=\"Nginx__80\"></a>Nginx 配置</h2>\n<p>在 <mark>nginx/conf/nginx.conf</mark> 添加配置</p>\n<p><strong>History 模式配置</strong></p>\n<pre><code class=\"lang-\">server\n    {\n        listen 80;\n        server_name 域名/外网IP;\n        index index.html;\n        root  /home/wwwroot/mcx/cxblog/admin;  #admin上传的路径\n        # 避免访问出现 404 错误\n        location / {\n          try_files $uri $uri/ @router;\n          index  index.html;\n        }\n        location @router {\n          rewrite ^.*$ /index.html last;\n        }  \n    } \n</code></pre>\n<p><strong>Hash 模式配置</strong></p>\n<pre><code class=\"lang-\">server {\n	   listen       80;\n	   server_name  域名/外网IP;\n\n	   location / {\n	      root   /home/wwwroot/mcx/cxblog/admin; #dist上传的路径\n	      index  index.html;\n	   }\n}\n</code></pre>\n<p><strong>二级目录部署</strong><br />\n<strong>Nginx 配置</strong></p>\n<pre><code class=\"lang-\">server {\n	   listen       80;\n	   server_name  域名/外网IP;\n\n	   location /admin {\n	      root   /home/wwwroot/mcx/cxblog/admin;\n	      index  index.html;\n	   }\n}\n</code></pre>\n<h2><a id=\"Nginx_127\"></a>重启Nginx</h2>\n<pre><code class=\"lang-\">systemctl restart nginx\n</code></pre>\n<p>重启 <mark>nginx</mark> 后，访问你的域名或者IP地址即可</p>\n<h1><a id=\"_133\"></a>容器部署方式</h1>\n<p>对于熟悉 Docker 的开发者来说，使用 Docker 部署管理更加的简单高效</p>\n<p>我一般习惯将 home 目录作为工作目录，因此 Docker 挂载的文件也都会存放在 home 目录中</p>\n<h2><a id=\"Docker_139\"></a>安装Docker</h2>\n<pre><code class=\"lang-\">curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun &amp;&amp; systemctl start docker &amp;&amp; systemctl enable docker\n</code></pre>\n<p>如果你机器是国内的机器，那么需要配置镜像加速，一般使用阿里云镜像加速 阿里云加速官网(opens new window)<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754868378.png\" alt=\"image.png\" /></p>\n<h2><a id=\"MysqlRedis_146\"></a>安装Mysql与Redis</h2>\n<p>这里使用的是 mariadb 镜像，并且将 mariadb 数据库文件挂载到宿主机的 <mark>/home/mysql/</mark> 目录下</p>\n<pre><code class=\"lang-\">docker run -v /home/mysql/:/var/lib/mysql \\\n-p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 \\\n--privileged=true --restart=always --name mariadb -d mariadb\n</code></pre>\n<p>安装Redis</p>\n<pre><code class=\"lang-\">docker run -itd --name redis --restart=always -p 6379:6379 redis\n</code></pre>\n<h2><a id=\"Java_157\"></a>构建与启动Java容器</h2>\n<p><strong>构建镜像</strong></p>\n<p>修改完成后，打包项目将打包好地Jar上传到服务器的 <mark>/home/mcx/cxblog</mark> 目录，在该目录创建 Dockerfile 文件，并编写 Dockerfile</p>\n<pre><code class=\"lang-\">FROM java:8\nARG JAR_FILE=./*.jar\nCOPY ${JAR_FILE} app.jar\nENV TZ=Asia/Shanghai\nENTRYPOINT [&quot;java&quot;,&quot;-jar&quot;,&quot;/app.jar&quot;]\n</code></pre>\n<p>构建镜像</p>\n<pre><code class=\"lang-\">docker build -t cxblog .\n</code></pre>\n<h2><a id=\"Java_172\"></a>启动Java容器</h2>\n<p>将容器中的 <mark>/home/mcx/cxblog/</mark> 挂载到宿主机的 <mark>/home/data/</mark> 目录并且设置数据库地址与密码等环境变量参数</p>\n<pre><code class=\"lang-\">docker run -d \\\n--name cxblog --restart always \\\n-p 8000:8000 \\\n-e &quot;TZ=Asia/Shanghai&quot; \\\n-e DB_HOST=172.17.0.1 \\\n-e DB_PWD=mysql_pwd \\\n-e REDIS_HOST=172.17.0.1 \\\n-v /home/data/:/home/mcx/cxblog/ \\\ncxblog\n</code></pre>\n<h2><a id=\"Nginx_185\"></a>安装与配置Nginx容器</h2>\n<p><strong>安装Nginx</strong></p>\n<blockquote>\n<p><strong>提示</strong><br />\n/home/nginx/conf.d 用于存放配置文件<br />\n/home/nginx/cert 用于存放 https 证书<br />\n/home/nginx/html 用于存放网页文件<br />\n/home/nginx/logs 用于存放日志</p>\n</blockquote>\n<p>首先在 <mark>/home/nginx</mark> 目录创建 nginx.conf 文件，不然安装 Nginx 会报错</p>\n<pre><code class=\"lang-\">user  nginx;\nworker_processes  1;\n\nerror_log  /var/log/nginx/error.log warn;\npid        /var/run/nginx.pid;\n\n\nevents {\n    worker_connections  1024;\n}\n\n\nhttp {\n    include       /etc/nginx/mime.types;\n    default_type  application/octet-stream;\n\n    log_format  main  \'$remote_addr - $remote_user [$time_local] &quot;$request&quot; \'\n                      \'$status $body_bytes_sent &quot;$http_referer&quot; \'\n                      \'&quot;$http_user_agent&quot; &quot;$http_x_forwarded_for&quot;\';\n\n#    access_log  /var/log/nginx/access.log  main;\n\n    sendfile        on;\n    #tcp_nopush     on;\n\n    keepalive_timeout  65;\n\n    include /etc/nginx/conf.d/*.conf;\n}\n</code></pre>\n<p>然后安装 Nginx</p>\n<pre><code class=\"lang-\">docker run -d \\\n--name nginx --restart always \\\n-p 80:80 -p 443:443 \\\n-e &quot;TZ=Asia/Shanghai&quot; \\\n-v /home/nginx/nginx.conf:/etc/nginx/nginx.conf \\\n-v /home/nginx/conf.d:/etc/nginx/conf.d \\\n-v /home/nginx/logs:/var/log/nginx \\\n-v /home/nginx/cert:/etc/nginx/cert \\\n-v /home/nginx/html:/usr/share/nginx/html \\\nnginx:alpine\n</code></pre>\n<h2><a id=\"Nginx_238\"></a>配置Nginx</h2>\n<p>这里使用 Nginx 反向代理访问后端服务，由于容器内部通信，因此需要使用容器的 IP，也就是 172.17.0.1</p>\n<p>在 <strong>/home/nginx/conf.d</strong> 创建一个 cxblog.conf 的配置文件，文件内容如下</p>\n<pre><code class=\"lang-\">server\n    {\n        listen 8081;\n        server_name 域名/外网IP;\n        index index.html;\n        root  /usr/share/nginx/html/mcx/cxblog/admin;  #dist上传的路径\n\n        # 避免访问出现 404 错误\n        location / {\n          try_files $uri $uri/ @router;\n          index  index.html;\n        }\n\n        location @router {\n          rewrite ^.*$ /index.html last;\n        }\n\n        # 接口\n        location /api {\n          proxy_pass http://172.17.0.1:8000;\n          proxy_set_header X-Forwarded-Proto $scheme;\n          proxy_set_header X-Forwarded-Port $server_port;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection &quot;upgrade&quot;;\n        }\n\n        # 授权接口\n        location /auth {\n          proxy_pass http://172.17.0.1:8000;\n          proxy_set_header X-Forwarded-Proto $scheme;\n          proxy_set_header X-Forwarded-Port $server_port;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection &quot;upgrade&quot;;\n        }\n\n        # WebSocket 服务\n        location /webSocket {\n          proxy_redirect off;\n          proxy_pass http://172.17.0.1:8000/webSocket;\n          proxy_http_version 1.1;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection &quot;upgrade&quot;;\n          proxy_set_header Host $http_host;\n          proxy_set_header X-Real-IP $remote_addr;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_connect_timeout 60s;\n          proxy_read_timeout 86400s;\n          proxy_send_timeout 60s;\n        }\n\n        # 头像\n        location /avatar {\n          proxy_pass http://172.17.0.1:8000;\n        }\n\n        # 文件\n        location /file {\n          proxy_pass http://172.17.0.1:8000;\n        }\n    }\n</code></pre>\n<p>注意：容器中 <mark>/usr/share/nginx/html/mcx/cxblog/admin</mark> 对应宿主机的 <mark>/home/nginx/html/mcx/cxblog/admin</mark> 目录，因此文件上传到宿主机的目录即可</p>\n<p><strong>重启 Nginx 容器</strong></p>\n<pre><code class=\"lang-\">docker restart nginx\n</code></pre>\n', '> 本文主要介绍如何部署本博客项目\n# 常规部署方式\n\n## 后端部署\n按需修改我们的 ==application-prod.yml==，如需打开 Swagger ，那么需要将 ==enabled== 设置为 true\n```\nswagger:\n  enabled: true\n```\n我们需要将项目打包好的 Jar 文件上传到服务器，步骤图如下：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710753935667.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710753980056.png)\n\n编写脚本用于操作 ==java== 服务\n\n(1) 启动脚本 ==start.sh==\n```\nnohup java -jar cxblog-main-1.1.jar --spring.profiles.active=prod > nohup.out 2>&1 &\n```\n(2) 停止脚本 ==stop.sh==\n```\nPID=$(ps -ef | grep cxblog-main-1.1.jar | grep -v grep | awk \'{ print $2 }\')\nif [ -z \"$PID\" ]\nthen\necho Application is already stopped\nelse\necho kill -9 $PID\nkill -9 $PID\nfi\n```\n(3) 查看日志脚本 ==log.sh==\n```\ntail -f nohup.out\n```\n脚本创建完成后就可以操作 ==java== 服务了\n```\n# 启动java\n./start.sh\n# 停止java服务\n./stop.sh\n# 查看日志\n./log.sh\n```\n配置 nginx: 我们可以使用 ==nginx== 代理 ==java==服务，添加配置\n```\nserver {\n    listen 80;\n    server_name 域名/当前服务器外网IP;\n    location / {\n        proxy_pass http://127.0.0.1:8000; #这里的端口记得改成项目对应的哦\n        proxy_set_header X-Forwarded-Proto $scheme;\n        proxy_set_header X-Forwarded-Port $server_port;\n        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n        proxy_set_header Upgrade $http_upgrade;\n        proxy_set_header Connection \"upgrade\";\n        }\n    }\n```\n# 前端部署\n这里提供两个配置方式 [History、Hash] 的部署方式，首先修改接口地址，如果是 IP 地址，那么需要修改为外网 IP\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754170273.png)\n\n**History 模式**\n项目默认是 History 模式，不需要做任何修改\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754266034.png)\n\n**Hash 模式**\n1、修改 routers.js，取消 hash 的注释\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754316393.png)\n\n#2、修改根目录 vue.config.js 配置，取消 hash 的注释\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754353076.png)\n\n## 打包项目\n不管是将项目部署到 ==nginx== 还是其他服务器，都需要先将项目打包\n```\nnpm run build:prod\n```\n打包完成后会在根目录生成 admin 文件夹，我们需要将他上传到服务器中\n\n## Nginx 配置\n在 ==nginx/conf/nginx.conf== 添加配置\n\n**History 模式配置**\n```\nserver\n    {\n        listen 80;\n        server_name 域名/外网IP;\n        index index.html;\n        root  /home/wwwroot/mcx/cxblog/admin;  #admin上传的路径\n        # 避免访问出现 404 错误\n        location / {\n          try_files $uri $uri/ @router;\n          index  index.html;\n        }\n        location @router {\n          rewrite ^.*$ /index.html last;\n        }  \n    } \n```\n**Hash 模式配置**\n```\nserver {\n	   listen       80;\n	   server_name  域名/外网IP;\n\n	   location / {\n	      root   /home/wwwroot/mcx/cxblog/admin; #dist上传的路径\n	      index  index.html;\n	   }\n}\n```\n**二级目录部署**\n**Nginx 配置**\n```\nserver {\n	   listen       80;\n	   server_name  域名/外网IP;\n\n	   location /admin {\n	      root   /home/wwwroot/mcx/cxblog/admin;\n	      index  index.html;\n	   }\n}\n```\n\n## 重启Nginx\n```\nsystemctl restart nginx\n```\n重启 ==nginx== 后，访问你的域名或者IP地址即可\n\n# 容器部署方式\n\n对于熟悉 Docker 的开发者来说，使用 Docker 部署管理更加的简单高效\n\n我一般习惯将 home 目录作为工作目录，因此 Docker 挂载的文件也都会存放在 home 目录中\n\n## 安装Docker\n```\ncurl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun && systemctl start docker && systemctl enable docker\n```\n如果你机器是国内的机器，那么需要配置镜像加速，一般使用阿里云镜像加速 阿里云加速官网(opens new window)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710754868378.png)\n\n## 安装Mysql与Redis\n这里使用的是 mariadb 镜像，并且将 mariadb 数据库文件挂载到宿主机的 ==/home/mysql/== 目录下\n```\ndocker run -v /home/mysql/:/var/lib/mysql \\\n-p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456 \\\n--privileged=true --restart=always --name mariadb -d mariadb\n```\n安装Redis\n```\ndocker run -itd --name redis --restart=always -p 6379:6379 redis\n```\n## 构建与启动Java容器\n**构建镜像**\n\n修改完成后，打包项目将打包好地Jar上传到服务器的 ==/home/mcx/cxblog== 目录，在该目录创建 Dockerfile 文件，并编写 Dockerfile\n```\nFROM java:8\nARG JAR_FILE=./*.jar\nCOPY ${JAR_FILE} app.jar\nENV TZ=Asia/Shanghai\nENTRYPOINT [\"java\",\"-jar\",\"/app.jar\"]\n```\n构建镜像\n```\ndocker build -t cxblog .\n```\n## 启动Java容器\n将容器中的 ==/home/mcx/cxblog/== 挂载到宿主机的 ==/home/data/== 目录并且设置数据库地址与密码等环境变量参数\n```\ndocker run -d \\\n--name cxblog --restart always \\\n-p 8000:8000 \\\n-e \"TZ=Asia/Shanghai\" \\\n-e DB_HOST=172.17.0.1 \\\n-e DB_PWD=mysql_pwd \\\n-e REDIS_HOST=172.17.0.1 \\\n-v /home/data/:/home/mcx/cxblog/ \\\ncxblog\n```\n## 安装与配置Nginx容器\n**安装Nginx**\n>**提示**\n/home/nginx/conf.d 用于存放配置文件\n/home/nginx/cert 用于存放 https 证书\n/home/nginx/html 用于存放网页文件\n/home/nginx/logs 用于存放日志\n\n首先在 ==/home/nginx== 目录创建 nginx.conf 文件，不然安装 Nginx 会报错\n```\nuser  nginx;\nworker_processes  1;\n\nerror_log  /var/log/nginx/error.log warn;\npid        /var/run/nginx.pid;\n\n\nevents {\n    worker_connections  1024;\n}\n\n\nhttp {\n    include       /etc/nginx/mime.types;\n    default_type  application/octet-stream;\n\n    log_format  main  \'$remote_addr - $remote_user [$time_local] \"$request\" \'\n                      \'$status $body_bytes_sent \"$http_referer\" \'\n                      \'\"$http_user_agent\" \"$http_x_forwarded_for\"\';\n\n#    access_log  /var/log/nginx/access.log  main;\n\n    sendfile        on;\n    #tcp_nopush     on;\n\n    keepalive_timeout  65;\n\n    include /etc/nginx/conf.d/*.conf;\n}\n```\n然后安装 Nginx\n```\ndocker run -d \\\n--name nginx --restart always \\\n-p 80:80 -p 443:443 \\\n-e \"TZ=Asia/Shanghai\" \\\n-v /home/nginx/nginx.conf:/etc/nginx/nginx.conf \\\n-v /home/nginx/conf.d:/etc/nginx/conf.d \\\n-v /home/nginx/logs:/var/log/nginx \\\n-v /home/nginx/cert:/etc/nginx/cert \\\n-v /home/nginx/html:/usr/share/nginx/html \\\nnginx:alpine\n```\n## 配置Nginx\n这里使用 Nginx 反向代理访问后端服务，由于容器内部通信，因此需要使用容器的 IP，也就是 172.17.0.1\n\n在 **/home/nginx/conf.d** 创建一个 cxblog.conf 的配置文件，文件内容如下\n```\nserver\n    {\n        listen 8081;\n        server_name 域名/外网IP;\n        index index.html;\n        root  /usr/share/nginx/html/mcx/cxblog/admin;  #dist上传的路径\n\n        # 避免访问出现 404 错误\n        location / {\n          try_files $uri $uri/ @router;\n          index  index.html;\n        }\n\n        location @router {\n          rewrite ^.*$ /index.html last;\n        }\n\n        # 接口\n        location /api {\n          proxy_pass http://172.17.0.1:8000;\n          proxy_set_header X-Forwarded-Proto $scheme;\n          proxy_set_header X-Forwarded-Port $server_port;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection \"upgrade\";\n        }\n\n        # 授权接口\n        location /auth {\n          proxy_pass http://172.17.0.1:8000;\n          proxy_set_header X-Forwarded-Proto $scheme;\n          proxy_set_header X-Forwarded-Port $server_port;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection \"upgrade\";\n        }\n\n        # WebSocket 服务\n        location /webSocket {\n          proxy_redirect off;\n          proxy_pass http://172.17.0.1:8000/webSocket;\n          proxy_http_version 1.1;\n          proxy_set_header Upgrade $http_upgrade;\n          proxy_set_header Connection \"upgrade\";\n          proxy_set_header Host $http_host;\n          proxy_set_header X-Real-IP $remote_addr;\n          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;\n          proxy_connect_timeout 60s;\n          proxy_read_timeout 86400s;\n          proxy_send_timeout 60s;\n        }\n\n        # 头像\n        location /avatar {\n          proxy_pass http://172.17.0.1:8000;\n        }\n\n        # 文件\n        location /file {\n          proxy_pass http://172.17.0.1:8000;\n        }\n    }\n```\n注意：容器中 ==/usr/share/nginx/html/mcx/cxblog/admin== 对应宿主机的 ==/home/nginx/html/mcx/cxblog/admin== 目录，因此文件上传到宿主机的目录即可\n\n**重启 Nginx 容器**\n```\ndocker restart nginx\n```', 0, 0, 1, 1, NULL, 0, '2024-03-18 17:53:32', NULL, 1, 1, '部署');
INSERT INTO `blog_article` VALUES (20, '1', 32, '前端手册（VUE）', 'https://img.btstu.cn/api/images/5cb68c369e6e4.jpg', '辰雪博客前端（VUE）开发手册', '<blockquote>\n<p>本文主要介绍如何二次开发博客前端（VUE）</p>\n</blockquote>\n<h1><a id=\"_2\"></a>菜单路由</h1>\n<h2><a id=\"_4\"></a>菜单路由</h2>\n<p>通过用户的角色返回相应的菜单路由，前端关键代码： <mark>src/router/index.js</mark></p>\n<pre><code class=\"lang-\"> // 部分代码\n store.dispatch(\'GetInfo\').then(res =&gt; { // 拉取user_info\n          // 动态路由，拉取菜单\n          loadMenus(next, to)\n        }).catch((err) =&gt; {\n          console.log(err)\n          store.dispatch(\'LogOut\').then(() =&gt; {\n            location.reload() // 为了重新实例化vue-router对象 避免bug\n          })\n        })\n</code></pre>\n<h2><a id=\"_18\"></a>可配置项</h2>\n<pre><code class=\"lang-\">//当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1\nhidden: true // (默认 false)\n\n//当设置 noredirect 的时候该路由在面包屑导航中不可被点击\nredirect: \'noredirect\'\n\n//当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面\n//只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面\n//若你想不管路由下面的 children 声明的个数都显示你的根路由\n//你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由\nalwaysShow: true\n\nname: \'router-name\' //设定路由的名字，一定要填写不然使用&lt;keep-alive&gt;时会出现各种问题\nmeta: {\n  title: \'title\' //设置该路由在侧边栏和面包屑中展示的名字\n  icon: \'svg-name\' //设置该路由的图标\n  noCache: true //如果设置为true，则不会被 &lt;keep-alive&gt; 缓存(默认 false)\n  breadcrumb: false // 如果设置为false，则不会在breadcrumb面包屑中显示,\n  affix: true // 设置成true表示，tag-view不可删除\n}\n</code></pre>\n<h2><a id=\"_41\"></a>添加图标</h2>\n<p>如果你没有在本项目 Icon 中找到需要的图标，可以到 <mark><a href=\"https://www.iconfont.cn/\" target=\"_blank\">iconfont.cn</a></mark> 上选择并生成自己的业务图标库，再进行使用。或者其它 svg 图标网站，下载 svg 并放到 <mark>src/assets/icons/svg</mark> 文件夹之中就可以了，下载方式如下图：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762623528.png\" alt=\"image.png\" /></p>\n<p>使用方式：</p>\n<pre><code class=\"lang-\">&lt;svg-icon icon-class=&quot;password&quot; /&gt; //icon-class 为 icon 的名字\n</code></pre>\n<h2><a id=\"_49\"></a>添加菜单</h2>\n<p>也不是所有菜单都需要存入数据库，有些公共的菜单只需要在 <mark>src/router/routers.js</mark> 中添加就可以了，如：个人中心页面</p>\n<pre><code class=\"lang-\">{\n    path: \'/user\',\n    component: Layout,\n    hidden: true,\n    redirect: \'noredirect\',\n    children: [\n      {\n        path: \'center\',\n        component: () =&gt; import(\'@/views/system/user/center\'),\n        name: \'个人中心\',\n        meta: { title: \'个人中心\', icon: \'user\' }\n      }\n    ]\n  }\n</code></pre>\n<h2><a id=\"_67\"></a>动态菜单</h2>\n<p>本项目的动态菜单支持到 <mark>4级</mark> 菜单，支持 <mark>外链</mark>，支持<mark>自定义图标</mark>，添加教程如下：</p>\n<p><strong>(1) 添加外链</strong><br />\n外链菜单路由地址必须带上 <mark>https://</mark> 或者 <mark>http://</mark>，并且外链菜单选择 <mark>是</mark><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762709986.png\" alt=\"image.png\" /></p>\n<p><strong>(2) 内部菜单</strong><br />\n外链菜单：这个选择否就好<br />\n菜单缓存：选择为 <mark>是</mark> 那么切换到其他菜单当前菜单会缓存<br />\n菜单可见：如果不想在左侧显示，可以选择为 <mark>否</mark><br />\n路由地址：这个就是浏览器访问菜单的地址<br />\n组件名称：这个非必填，如果设置了菜单缓存，那么必填，不然缓存会无效<br />\n组件路径：项目的组件文件的路径 <mark>src/views</mark></p>\n<table>\n<thead>\n<tr>\n<th>添加内部菜单</th>\n<th>组件路径对应</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762770108.png\" alt=\"image.png\" /></td>\n<td><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762824229.png\" alt=\"image.png\" /></td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_85\"></a>分配菜单</h2>\n<p>创建完菜单还需要在角色管理中给角色分配菜单<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762916466.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_89\"></a>权限控制</h2>\n<p>可以引入权限判断函数或者使用全局指令函数实现前端的权限控制<br />\n1、使用全局指令函数<mark>v-permission=&quot;&quot;</mark></p>\n<pre><code class=\"lang-\">&lt;!-- 新增 --&gt;\n&lt;div v-permission=&quot;[\'admin\',\'user:add\']&quot; style=&quot;display: inline-block;margin: 0px 2px;&quot;&gt;\n      &lt;el-button\n        class=&quot;filter-item&quot;\n        size=&quot;mini&quot;\n        type=&quot;primary&quot;\n        icon=&quot;el-icon-plus&quot;\n        @click=&quot;add&quot;&gt;新增&lt;/el-button&gt;\n      &lt;eForm ref=&quot;form&quot; :sup_this=&quot;sup_this&quot; :is-add=&quot;true&quot; :dicts=&quot;dicts&quot;/&gt;\n    &lt;/div&gt;\n</code></pre>\n<p>2、使用判断函数 <mark>checkPermission()</mark></p>\n<pre><code class=\"lang-\">&lt;template&gt;\n  	&lt;el-tab-pane v-if=&quot;checkPermission([\'admin\'])&quot; label=&quot;Admin&quot;&gt;\n		admin 权限的用户才能看到\n	 &lt;/el-tab-pane&gt;\n&lt;/template&gt;\n\n&lt;script&gt;\nimport checkPermission from \'@/utils/permission\' // 权限判断函数\n\nexport default{\n   methods: {\n    checkPermission\n   }\n}\n&lt;/script&gt;\n</code></pre>\n<h1><a id=\"_123\"></a>自定义主键</h1>\n<h2><a id=\"_124\"></a>自定义主键</h2>\n<p>系统里面默认的主键是 id，如果主键字段不是 id 使用 curd 组件就会出现问题，这个时候需要自定义主键名称<br />\n在 index.vue 中找到下面节点，并且指定 idField， 由于系统默认是根据 id 字段降序，所以这里排序规则也需要修改</p>\n<pre><code class=\"lang-\">cruds() {\n    return CRUD({ title: \'图片\', idField: \'pictureId\', sort: \'pictureId,desc\', url: \'api/pictures\', crudMethod: { ...crudPic }})\n  }\n</code></pre>\n<h1><a id=\"_133\"></a>多字段排序</h1>\n<h2><a id=\"_134\"></a>多字段排序</h2>\n<p>多字段排序方式在 crud.js 中的注释中说明了，这里再写个例子<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763109641.png\" alt=\"image.png\" /></p>\n<p>代码如下：</p>\n<pre><code class=\"lang-\">cruds() {\n    return CRUD({ title: \'图片\', sort: [\'id,asc\', \'name,desc\'], url: \'api/pictures\', crudMethod: { ...crudPic }})\n  }\n</code></pre>\n<h1><a id=\"_145\"></a>操作按钮隐藏</h1>\n<h2><a id=\"_146\"></a>操作按钮隐藏</h2>\n<p>找到如下节点，在 optShow 中设置表格上方的按钮显与隐</p>\n<pre><code class=\"lang-\">cruds() {\n    return [\n      CRUD({ title: \'字典详情\', url: \'api/dictDetail\', query: { dictName: \'\' }, sort: [\'dictSort,asc\', \'id,desc\'],\n        crudMethod: { ...crudDictDetail },\n        optShow: {\n          add: true,\n          edit: true,\n          del: true,\n          reset: false\n        },\n        queryOnPresenterCreated: false\n      })\n    ]\n  }\n</code></pre>\n<h1><a id=\"_165\"></a>使用数据字典</h1>\n<h2><a id=\"_166\"></a>数据字典</h2>\n<p>首先我们需要在字典管理中创建一个字典</p>\n<p><strong>使用全局组件</strong></p>\n<blockquote>\n<p><strong>提示</strong><br />\n建议使用该方式</p>\n</blockquote>\n<p>使用方式：</p>\n<pre><code class=\"lang-\">&lt;template&gt;\n  &lt;div class=&quot;app-container&quot;&gt;\n  &lt;/div&gt;\n&lt;/template&gt;\n\n&lt;script&gt;\nexport default {\n  // 设置数据字典\n  dicts: [\'job_status\'],\n  created() {\n    // 得到完整数据\n    console.log(this.dict.job_status)\n    // 打印简化后的label数据\n    console.log(this.dict.job_status.label)\n  }\n}\n&lt;/script&gt;\n</code></pre>\n<p>打印如下：</p>\n<p>1、完整数据<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763353686.png\" alt=\"image.png\" /></p>\n<p>2、简化后的label数据<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763363113.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_201\"></a>使用混入方式</h2>\n<p>源码位于： <mark>src/mixins/initDict.js</mark>，代码如下</p>\n<p>（1）引入组件</p>\n<pre><code class=\"lang-\">import initDict from \'@/mixins/initDict\'\nexport default {\n  mixins: [initDict]\n}\n</code></pre>\n<p>（2）使用钩子函数获取字典</p>\n<pre><code class=\"lang-\">import initDict from \'@/mixins/initDict\'\nexport default {\n mixins: [initDict],\n created() {\n    this.$nextTick(() =&gt; {\n      // 加载数据字典\n      this.getDict(\'job_status\')\n    })\n  }\n}\n</code></pre>\n<p>（3）使用字典</p>\n<pre><code class=\"lang-\">&lt;el-form-item v-if=&quot;form.pid !== 0&quot; label=&quot;状态&quot; prop=&quot;enabled&quot;&gt;\n        &lt;el-radio v-for=&quot;item in dicts&quot; :key=&quot;item.id&quot; v-model=&quot;form.enabled&quot; :label=&quot;item.value&quot;&gt;{{ item.label }}&lt;/el-radio&gt;\n &lt;/el-form-item&gt;\n</code></pre>\n<h1><a id=\"_231\"></a>统一异常处理</h1>\n<h2><a id=\"_232\"></a>异常处理</h2>\n<p>在 <mark>src/utils/request.js</mark> 文件中对所有的 <mark>request</mark>请求进行拦截， 通过<mark>response</mark> 拦截器对接口返回的状态码进行分析与异常处理，代码如下</p>\n<pre><code class=\"lang-\">// response 拦截器\nservice.interceptors.response.use(\n  response =&gt; {\n    const code = response.status\n    if (code &lt; 200 || code &gt; 300) {\n      Notification.error({\n        title: response.message\n      })\n      return Promise.reject(\'error\')\n    } else {\n      return response.data\n    }\n  },\n  error =&gt; {\n    let code = 0\n    try {\n      code = error.response.data.status\n    } catch (e) {\n      if (error.toString().indexOf(\'Error: timeout\') !== -1) {\n        Notification.error({\n          title: \'网络请求超时\',\n          duration: 5000\n        })\n        return Promise.reject(error)\n      }\n    }\n    if (code) {\n      if (code === 401) {\n        store.dispatch(\'LogOut\').then(() =&gt; {\n          // 用户登录界面提示\n          Cookies.set(\'point\', 401)\n          location.reload()\n        })\n      } else if (code === 403) {\n        router.push({ path: \'/401\' })\n      } else {\n        const errorMsg = error.response.data.message\n        if (errorMsg !== undefined) {\n          Notification.error({\n            title: errorMsg,\n            duration: 5000\n          })\n        }\n      }\n    } else {\n      Notification.error({\n        title: \'接口请求失败\',\n        duration: 5000\n      })\n    }\n    return Promise.reject(error)\n  }\n)\n</code></pre>\n<h1><a id=\"_290\"></a>部分系统组件</h1>\n<h2><a id=\"_291\"></a>系统组件</h2>\n<p>在这里列出系统使用到的组件，方便大家使用</p>\n<ul>\n<li>树形表格：<a href=\"https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/tree-table.html#%E4%BB%A3%E7%A0%81%E5%AE%9E%E4%BE%8B\" target=\"_blank\">使用文档</a></li>\n<li>树形选择框(vue-treeselect)：<a href=\"https://github.com/riophae/vue-treeselect\" target=\"_blank\">使用文档</a></li>\n<li>Svg 图标：<a href=\"https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/svg-icon.html\" target=\"_blank\">使用文档</a></li>\n<li>Excel 导出：<a href=\"https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/excel.html\" target=\"_blank\">使用文档</a></li>\n<li>CodeMirror：<a href=\"https://github.com/codemirror/CodeMirror\" target=\"_blank\">使用文档</a></li>\n<li>富文本：<a href=\"https://www.kancloud.cn/wangfupeng/wangeditor3/332599\" target=\"_blank\">使用文档</a></li>\n<li>Markdown：<a href=\"https://github.com/hinesboy/mavonEditor\" target=\"_blank\">使用文档</a></li>\n</ul>\n', '> 本文主要介绍如何二次开发博客前端（VUE）\n\n# 菜单路由\n\n## 菜单路由\n通过用户的角色返回相应的菜单路由，前端关键代码： ==src/router/index.js==\n```\n // 部分代码\n store.dispatch(\'GetInfo\').then(res => { // 拉取user_info\n          // 动态路由，拉取菜单\n          loadMenus(next, to)\n        }).catch((err) => {\n          console.log(err)\n          store.dispatch(\'LogOut\').then(() => {\n            location.reload() // 为了重新实例化vue-router对象 避免bug\n          })\n        })\n```\n## 可配置项\n```\n//当设置 true 的时候该路由不会再侧边栏出现 如401，login等页面，或者如一些编辑页面/edit/1\nhidden: true // (默认 false)\n\n//当设置 noredirect 的时候该路由在面包屑导航中不可被点击\nredirect: \'noredirect\'\n\n//当你一个路由下面的 children 声明的路由大于1个时，自动会变成嵌套的模式--如组件页面\n//只有一个时，会将那个子路由当做根路由显示在侧边栏--如引导页面\n//若你想不管路由下面的 children 声明的个数都显示你的根路由\n//你可以设置 alwaysShow: true，这样它就会忽略之前定义的规则，一直显示根路由\nalwaysShow: true\n\nname: \'router-name\' //设定路由的名字，一定要填写不然使用<keep-alive>时会出现各种问题\nmeta: {\n  title: \'title\' //设置该路由在侧边栏和面包屑中展示的名字\n  icon: \'svg-name\' //设置该路由的图标\n  noCache: true //如果设置为true，则不会被 <keep-alive> 缓存(默认 false)\n  breadcrumb: false // 如果设置为false，则不会在breadcrumb面包屑中显示,\n  affix: true // 设置成true表示，tag-view不可删除\n}\n```\n## 添加图标\n如果你没有在本项目 Icon 中找到需要的图标，可以到 ==[iconfont.cn](https://www.iconfont.cn/)== 上选择并生成自己的业务图标库，再进行使用。或者其它 svg 图标网站，下载 svg 并放到 ==src/assets/icons/svg== 文件夹之中就可以了，下载方式如下图：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762623528.png)\n\n使用方式：\n```\n<svg-icon icon-class=\"password\" /> //icon-class 为 icon 的名字\n```\n## 添加菜单\n也不是所有菜单都需要存入数据库，有些公共的菜单只需要在 ==src/router/routers.js== 中添加就可以了，如：个人中心页面\n```\n{\n    path: \'/user\',\n    component: Layout,\n    hidden: true,\n    redirect: \'noredirect\',\n    children: [\n      {\n        path: \'center\',\n        component: () => import(\'@/views/system/user/center\'),\n        name: \'个人中心\',\n        meta: { title: \'个人中心\', icon: \'user\' }\n      }\n    ]\n  }\n```\n## 动态菜单\n本项目的动态菜单支持到 ==4级== 菜单，支持 ==外链==，支持==自定义图标==，添加教程如下：\n\n**(1) 添加外链**\n外链菜单路由地址必须带上 ==https://== 或者 ==http://==，并且外链菜单选择 ==是==\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762709986.png)\n\n**(2) 内部菜单**\n外链菜单：这个选择否就好\n菜单缓存：选择为 ==是== 那么切换到其他菜单当前菜单会缓存\n菜单可见：如果不想在左侧显示，可以选择为 ==否==\n路由地址：这个就是浏览器访问菜单的地址\n组件名称：这个非必填，如果设置了菜单缓存，那么必填，不然缓存会无效\n组件路径：项目的组件文件的路径 ==src/views==\n|添加内部菜单|	组件路径对应|\n|-|-|\n|![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762770108.png)|![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762824229.png)|\n	\n## 分配菜单\n创建完菜单还需要在角色管理中给角色分配菜单\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710762916466.png)\n\n## 权限控制\n可以引入权限判断函数或者使用全局指令函数实现前端的权限控制\n1、使用全局指令函数==v-permission=\"\"==\n```\n<!-- 新增 -->\n<div v-permission=\"[\'admin\',\'user:add\']\" style=\"display: inline-block;margin: 0px 2px;\">\n      <el-button\n        class=\"filter-item\"\n        size=\"mini\"\n        type=\"primary\"\n        icon=\"el-icon-plus\"\n        @click=\"add\">新增</el-button>\n      <eForm ref=\"form\" :sup_this=\"sup_this\" :is-add=\"true\" :dicts=\"dicts\"/>\n    </div>\n```\n2、使用判断函数 ==checkPermission()==\n```\n<template>\n  	<el-tab-pane v-if=\"checkPermission([\'admin\'])\" label=\"Admin\">\n		admin 权限的用户才能看到\n	 </el-tab-pane>\n</template>\n\n<script>\nimport checkPermission from \'@/utils/permission\' // 权限判断函数\n\nexport default{\n   methods: {\n    checkPermission\n   }\n}\n</script>\n```\n\n# 自定义主键\n## 自定义主键\n系统里面默认的主键是 id，如果主键字段不是 id 使用 curd 组件就会出现问题，这个时候需要自定义主键名称\n在 index.vue 中找到下面节点，并且指定 idField， 由于系统默认是根据 id 字段降序，所以这里排序规则也需要修改\n```\ncruds() {\n    return CRUD({ title: \'图片\', idField: \'pictureId\', sort: \'pictureId,desc\', url: \'api/pictures\', crudMethod: { ...crudPic }})\n  }\n```\n\n# 多字段排序\n## 多字段排序\n多字段排序方式在 crud.js 中的注释中说明了，这里再写个例子\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763109641.png)\n\n代码如下：\n```\ncruds() {\n    return CRUD({ title: \'图片\', sort: [\'id,asc\', \'name,desc\'], url: \'api/pictures\', crudMethod: { ...crudPic }})\n  }\n```\n\n# 操作按钮隐藏\n## 操作按钮隐藏\n找到如下节点，在 optShow 中设置表格上方的按钮显与隐\n```\ncruds() {\n    return [\n      CRUD({ title: \'字典详情\', url: \'api/dictDetail\', query: { dictName: \'\' }, sort: [\'dictSort,asc\', \'id,desc\'],\n        crudMethod: { ...crudDictDetail },\n        optShow: {\n          add: true,\n          edit: true,\n          del: true,\n          reset: false\n        },\n        queryOnPresenterCreated: false\n      })\n    ]\n  }\n```\n\n# 使用数据字典\n## 数据字典\n首先我们需要在字典管理中创建一个字典\n\n**使用全局组件**\n>**提示**\n建议使用该方式\n\n使用方式：\n```\n<template>\n  <div class=\"app-container\">\n  </div>\n</template>\n\n<script>\nexport default {\n  // 设置数据字典\n  dicts: [\'job_status\'],\n  created() {\n    // 得到完整数据\n    console.log(this.dict.job_status)\n    // 打印简化后的label数据\n    console.log(this.dict.job_status.label)\n  }\n}\n</script>\n```\n打印如下：\n\n1、完整数据\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763353686.png)\n\n2、简化后的label数据\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240318_1710763363113.png)\n\n## 使用混入方式\n源码位于： ==src/mixins/initDict.js==，代码如下\n\n（1）引入组件\n```\nimport initDict from \'@/mixins/initDict\'\nexport default {\n  mixins: [initDict]\n}\n```\n（2）使用钩子函数获取字典\n```\nimport initDict from \'@/mixins/initDict\'\nexport default {\n mixins: [initDict],\n created() {\n    this.$nextTick(() => {\n      // 加载数据字典\n      this.getDict(\'job_status\')\n    })\n  }\n}\n```\n（3）使用字典\n```\n<el-form-item v-if=\"form.pid !== 0\" label=\"状态\" prop=\"enabled\">\n        <el-radio v-for=\"item in dicts\" :key=\"item.id\" v-model=\"form.enabled\" :label=\"item.value\">{{ item.label }}</el-radio>\n </el-form-item>\n```\n\n# 统一异常处理\n## 异常处理\n在 ==src/utils/request.js== 文件中对所有的 ==request==请求进行拦截， 通过==response== 拦截器对接口返回的状态码进行分析与异常处理，代码如下\n```\n// response 拦截器\nservice.interceptors.response.use(\n  response => {\n    const code = response.status\n    if (code < 200 || code > 300) {\n      Notification.error({\n        title: response.message\n      })\n      return Promise.reject(\'error\')\n    } else {\n      return response.data\n    }\n  },\n  error => {\n    let code = 0\n    try {\n      code = error.response.data.status\n    } catch (e) {\n      if (error.toString().indexOf(\'Error: timeout\') !== -1) {\n        Notification.error({\n          title: \'网络请求超时\',\n          duration: 5000\n        })\n        return Promise.reject(error)\n      }\n    }\n    if (code) {\n      if (code === 401) {\n        store.dispatch(\'LogOut\').then(() => {\n          // 用户登录界面提示\n          Cookies.set(\'point\', 401)\n          location.reload()\n        })\n      } else if (code === 403) {\n        router.push({ path: \'/401\' })\n      } else {\n        const errorMsg = error.response.data.message\n        if (errorMsg !== undefined) {\n          Notification.error({\n            title: errorMsg,\n            duration: 5000\n          })\n        }\n      }\n    } else {\n      Notification.error({\n        title: \'接口请求失败\',\n        duration: 5000\n      })\n    }\n    return Promise.reject(error)\n  }\n)\n```\n\n# 部分系统组件\n## 系统组件\n在这里列出系统使用到的组件，方便大家使用\n\n* 树形表格：[使用文档](https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/tree-table.html#代码实例)\n* 树形选择框(vue-treeselect)：[使用文档](https://github.com/riophae/vue-treeselect)\n* Svg 图标：[使用文档](https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/svg-icon.html)\n* Excel 导出：[使用文档](https://panjiachen.github.io/vue-element-admin-site/zh/feature/component/excel.html)\n* CodeMirror：[使用文档](https://github.com/codemirror/CodeMirror)\n* 富文本：[使用文档](https://www.kancloud.cn/wangfupeng/wangeditor3/332599)\n* Markdown：[使用文档](https://github.com/hinesboy/mavonEditor)', 0, 0, 1, 1, NULL, 0, '2024-03-18 17:53:35', NULL, 1, 1, '前端');
INSERT INTO `blog_article` VALUES (21, '4', 32, '给你的网站添加免费音乐播放器', 'https://img.btstu.cn/api/images/5a0bef40c904c.jpg', '只需一行代码就能给你的网站添加得免费音乐播放器', '<h1><a id=\"_0\"></a>简介：</h1>\n<p>今天教大家给自己的网站添加如下图一样的音乐播放器插件<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711088826004.png\" alt=\"image.png\" /><br />\n插件作者官方网站：<br />\nhttps://myhkw.cn/</p>\n<h1><a id=\"_6\"></a>使用方法</h1>\n<p>功能：</p>\n<div class=\"hljs-center\">\n<p>1.支持手机端播放<br />\n2.支持皮肤的更换<br />\n3.支持自动播放<br />\n4.支持左右位置对的调整<br />\n5.支持歌词的显示<br />\n6.支持自定义歌曲的添加</p>\n</div>\n<blockquote>\n<p>免注册体验：将此段播放器代码插入到网页最底部的&lt;/body&gt;&lt;/html&gt;标签之前<br />\n可选参数：0关闭 1开启<br />\n皮肤更换：skin=“player” [player/mini/swhite/cover]<br />\n手机加载：m=“0” [0/1]<br />\n自动播放：au=“0” [0/1]<br />\n左右位置：lr=“r” [l/r]</p>\n</blockquote>\n<pre><code class=\"lang-\">&lt;script src=&quot;https://myhkw.cn/api/player/demo&quot; id=&quot;myhk&quot; key=&quot;demo&quot; skin=&quot;player&quot; lr=&quot;l&quot; m=&quot;1&quot;&gt;&lt;/script&gt;\n</code></pre>\n<blockquote>\n<p>（非必要）如果提示jQuery问题，请将此段代码插入到网站的之前，或播放器代码之前</p>\n</blockquote>\n<pre><code class=\"lang-\">&lt;script src=&quot;https://myhkw.cn/player/js/jquery.min.js&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;\n</code></pre>\n<h1><a id=\"_34\"></a>自定义设置歌曲</h1>\n<p>可以在插件官网后台直接搜索歌曲进行添加，如下图<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711089266280.png\" alt=\"image.png\" /></p>\n', '# 简介：\n今天教大家给自己的网站添加如下图一样的音乐播放器插件\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711088826004.png)\n插件作者官方网站：\nhttps://myhkw.cn/\n\n# 使用方法\n功能：\n::: hljs-center\n\n\n1.支持手机端播放\n2.支持皮肤的更换\n3.支持自动播放\n4.支持左右位置对的调整\n5.支持歌词的显示\n6.支持自定义歌曲的添加\n\n:::\n>免注册体验：将此段播放器代码插入到网页最底部的</body></html>标签之前\n可选参数：0关闭 1开启\n皮肤更换：skin=\"player\" [player/mini/swhite/cover]\n手机加载：m=\"0\" [0/1]\n自动播放：au=\"0\" [0/1]\n左右位置：lr=\"r\" [l/r]\n\n```\n<script src=\"https://myhkw.cn/api/player/demo\" id=\"myhk\" key=\"demo\" skin=\"player\" lr=\"l\" m=\"1\"></script>\n```\n\n>（非必要）如果提示jQuery问题，请将此段代码插入到网站的之前，或播放器代码之前\n```\n<script src=\"https://myhkw.cn/player/js/jquery.min.js\" type=\"text/javascript\"></script>\n```\n# 自定义设置歌曲\n可以在插件官网后台直接搜索歌曲进行添加，如下图\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711089266280.png)', 0, 0, 1, 1, NULL, 0, '2024-03-22 22:26:27', NULL, 0, 0, NULL);
INSERT INTO `blog_article` VALUES (23, '4', 16, 'vue报错：Loading chunk * failed，vue-router懒加载出错问题。', 'https://img.btstu.cn/api/images/5cc80efda17d7.jpg', '当引入明月浩空网的音乐播放器插件的过程中vue报错：Loading chunk * failed，vue-router懒加载出错问题。', '<p>今天给本博客项目加入来自明月浩空网的音乐播放器插件，实现了音乐播放的功能。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117183974.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117264525.png\" alt=\"image.png\" /><br />\n但是在这个过程中，遇到一个问题，当点击了音乐播放按钮后，需要用route.push()跳转页面的时候报错：Loading chunk * failed。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711116994416.png\" alt=\"image.png\" /><br />\n在网上找了一大堆解决办法，虽然没有直接的解决问题，但还是得到了一些通过其它方式解决的启发。</p>\n<p>这里提供了三种解决方式：</p>\n<p>一、不用懒加载，直接使用组件（未进行测试，若是因为懒加载导致的，理论可行）</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> <span class=\"hljs-title class_\">Foo</span> <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&quot;@/views/foo&quot;</span>\n\n<span class=\"hljs-keyword\">const</span> router = <span class=\"hljs-keyword\">new</span> <span class=\"hljs-title class_\">VueRouter</span>({\n  <span class=\"hljs-attr\">routes</span>: [\n    { <span class=\"hljs-attr\">path</span>: <span class=\"hljs-string\">&#x27;/foo&#x27;</span>, <span class=\"hljs-attr\">component</span>: <span class=\"hljs-title class_\">Foo</span> }\n  ]\n})\n</code></div></pre>\n<p>二、继续使用懒加载，但是在需要在路由发生错误时做一些处理。<br />\n在router.js页面加入下列代码</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">router.<span class=\"hljs-title function_\">onError</span>(<span class=\"hljs-function\">(<span class=\"hljs-params\">error</span>) =&gt;</span> {\n  <span class=\"hljs-keyword\">const</span> pattern = <span class=\"hljs-regexp\">/Loading chunk (\\d)+ failed/g</span>;\n  <span class=\"hljs-keyword\">const</span> isChunkLoadFailed = error.<span class=\"hljs-property\">message</span>.<span class=\"hljs-title function_\">match</span>(pattern);\n  <span class=\"hljs-keyword\">const</span> targetPath = router.<span class=\"hljs-property\">history</span>.<span class=\"hljs-property\">pending</span>.<span class=\"hljs-property\">fullPath</span>;\n  <span class=\"hljs-keyword\">if</span> (isChunkLoadFailed) {\n    router.<span class=\"hljs-title function_\">replace</span>(targetPath);\n  }\n});\n</code></div></pre>\n<p>以上是来自网络的代码，亲测不可行，首先是’\\d’似乎不符合匹配规则，更换成’.\'就行了；其次是router.replace和router.push方法本质是再进行一次跳转，然后会出现同样的错误，导致陷入死循环。<br />\n最后将跳转方式换为原始的window.location.href，算是以另类的方式解决了此问题吧。</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">router.<span class=\"hljs-title function_\">onError</span>(<span class=\"hljs-function\">(<span class=\"hljs-params\">error</span>) =&gt;</span> {\n    <span class=\"hljs-keyword\">const</span> pattern = <span class=\"hljs-regexp\">/Loading chunk (.)+ failed/g</span>;\n    <span class=\"hljs-keyword\">const</span> isChunkLoadFailed = error.<span class=\"hljs-property\">message</span>.<span class=\"hljs-title function_\">match</span>(pattern);\n    <span class=\"hljs-keyword\">const</span> targetPath = router.<span class=\"hljs-property\">history</span>.<span class=\"hljs-property\">pending</span>.<span class=\"hljs-property\">fullPath</span>;\n    <span class=\"hljs-keyword\">if</span> (isChunkLoadFailed) {\n        <span class=\"hljs-variable language_\">window</span>.<span class=\"hljs-property\">location</span>.<span class=\"hljs-property\">href</span> = origin+targetPath\n    }\n});\n</code></div></pre>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117070807.png\" alt=\"image.png\" /><br />\n三、检查是否是vue.config.js配置问题（我这里不是因为这个问题）</p>\n<p>由于之前打包生产环境时为解决静态资源访问的问题，在vue.config.js中配置了publicPath变量，改回如下即可：</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\"><span class=\"hljs-keyword\">module</span>.<span class=\"hljs-keyword\">exports</span> = {\n    publicPath: <span class=\"hljs-string\">&quot;/&quot;</span>\n}\n</code></div></pre>\n<p>具体情况需要根据实际遇到的问题来解决，这里只是提供一些思路。</p>\n<blockquote>\n<p>还有个奇怪的事情，同样使用Vue框架的本博客后台管理系统引入此音乐播放器插件后就没有出现这个问题，百思不得其解。</p>\n</blockquote>\n', '今天给本博客项目加入来自明月浩空网的音乐播放器插件，实现了音乐播放的功能。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117183974.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117264525.png)\n但是在这个过程中，遇到一个问题，当点击了音乐播放按钮后，需要用route.push()跳转页面的时候报错：Loading chunk \\* failed。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711116994416.png)\n在网上找了一大堆解决办法，虽然没有直接的解决问题，但还是得到了一些通过其它方式解决的启发。\n\n这里提供了三种解决方式：\n\n一、不用懒加载，直接使用组件（未进行测试，若是因为懒加载导致的，理论可行）\n\n```javascript\nimport Foo from \"@/views/foo\"\n\nconst router = new VueRouter({\n  routes: [\n    { path: \'/foo\', component: Foo }\n  ]\n})\n```\n\n二、继续使用懒加载，但是在需要在路由发生错误时做一些处理。\n在router.js页面加入下列代码\n```javascript\nrouter.onError((error) => {\n  const pattern = /Loading chunk (\\d)+ failed/g;\n  const isChunkLoadFailed = error.message.match(pattern);\n  const targetPath = router.history.pending.fullPath;\n  if (isChunkLoadFailed) {\n    router.replace(targetPath);\n  }\n});\n```\n以上是来自网络的代码，亲测不可行，首先是\'\\d\'似乎不符合匹配规则，更换成\'.\'就行了；其次是router.replace和router.push方法本质是再进行一次跳转，然后会出现同样的错误，导致陷入死循环。\n最后将跳转方式换为原始的window.location.href，算是以另类的方式解决了此问题吧。\n```javascript\nrouter.onError((error) => {\n    const pattern = /Loading chunk (.)+ failed/g;\n    const isChunkLoadFailed = error.message.match(pattern);\n    const targetPath = router.history.pending.fullPath;\n    if (isChunkLoadFailed) {\n        window.location.href = origin+targetPath\n    }\n});\n```\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240322_1711117070807.png)\n三、检查是否是vue.config.js配置问题（我这里不是因为这个问题）\n\n由于之前打包生产环境时为解决静态资源访问的问题，在vue.config.js中配置了publicPath变量，改回如下即可：\n\n```java\nmodule.exports = {\n    publicPath: \"/\"\n}\n```\n\n具体情况需要根据实际遇到的问题来解决，这里只是提供一些思路。\n\n>还有个奇怪的事情，同样使用Vue框架的本博客后台管理系统引入此音乐播放器插件后就没有出现这个问题，百思不得其解。', 0, 0, 1, 1, 'https://blog.csdn.net/qq_41756580/article/details/105246352', 0, '2024-03-22 22:26:23', NULL, 0, 0, NULL);
INSERT INTO `blog_article` VALUES (25, '4', 16, 'nacos: 坑, 用户名或密码不正确', 'https://img.btstu.cn/api/images/5cbeda3a28f3d.jpg', '请不要使用utf8—utf8_unicode_ci编码格式的mysql数据库执行nacos_config.sql文件', '<h4><a id=\"_content_views_0\"></a><strong>一丶错误演示</strong> {#content_views}</h4>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521308918.png\" alt=\"image.png\" /></p>\n<p>默认用户名和密码都是nacos但显示错误。</p>\n<h4><a id=\"_nacosmysqlsql_6\"></a><strong>二丶解决 (原因:<strong><strong>nacos-mysql.sql脚本</strong></strong>执行不完整)</strong></h4>\n<p><strong>1. 登录SQLyog查看nacos_config库里的users表和roles表里是否有记录（Linux的话直接进去nacos_config库查这两个表有没有记录）（如果连nacos_config这个库都没有那就是sql脚本还没执行过，先去数据库里执行nacos提供的nacos-mysql.sql脚本,在nacos/conf/目录下)</strong></p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521354551.png\" alt=\"image.png\" /></p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521381559.png\" alt=\"image.png\" /></p>\n<p>如果nacos_mysql.sql脚本执行正确，以上users和roles表会有记录，如果没有说明nacos_mysql.sql执行有问题你没发现而已，因为nacos_mysql.sql最后两行还执行了插入语句也就是以上两条插入记录。</p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521418842.png\" alt=\"image.png\" /></p>\n<p>如果自行看一下表结构，会发现permissions表也不存在，所以推断问题可能出在执行sql文件到CREATE TABLE <code>permissions</code>时出现了错误，下面新建数据库重新导入sql进行一次测试<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521644620.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521662372.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521767280.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521777400.jpg\" alt=\"1260A509.jpg\" />好好好，演我是吧，这次没出问题</p>\n<p>咳咳，其实官方给出的sql文件本身是没有问题的，问题出在我导入的是RuoYi-Cloud框架提供的sql，出现了下面的错误<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522042412.png\" alt=\"image.png\" /><br />\n<br /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522084607.png\" alt=\"image.png\" /><br />\n问题确实出在执行到CREATE TABLE <code>permissions</code>时出现错误[ERR] 1071 - Specified key was too long; max key length is 1000 bytes<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522184742.png\" alt=\"image.png\" /></p>\n<p><strong>2. 解决:</strong></p>\n<p><strong>进入数据库nacos_config数据库执行这两条插入语句即可, 之后重启nacos服务就可以登录了。</strong></p>\n<pre><div class=\"hljs\"><code class=\"lang-sql\"><span class=\"hljs-keyword\">INSERT</span> <span class=\"hljs-keyword\">INTO</span> users (username, password, enabled) <span class=\"hljs-keyword\">VALUES</span> (<span class=\"hljs-string\">&#x27;nacos&#x27;</span>, <span class=\"hljs-string\">&#x27;$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu&#x27;</span>, <span class=\"hljs-literal\">TRUE</span>);\n\n<span class=\"hljs-keyword\">INSERT</span> <span class=\"hljs-keyword\">INTO</span> roles (username, role) <span class=\"hljs-keyword\">VALUES</span> (<span class=\"hljs-string\">&#x27;nacos&#x27;</span>, <span class=\"hljs-string\">&#x27;ROLE_ADMIN&#x27;</span>);\n</code></div></pre>\n<p>当然这还没完，permissions表还没创建呢，执行这条插入语句即可</p>\n<pre><div class=\"hljs\"><code class=\"lang-sql\"><span class=\"hljs-keyword\">CREATE</span> <span class=\"hljs-keyword\">TABLE</span> `permissions` (\n    `role` <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">50</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n    `resource` <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">192</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n    `action` <span class=\"hljs-type\">varchar</span>(<span class=\"hljs-number\">8</span>) <span class=\"hljs-keyword\">NOT</span> <span class=\"hljs-keyword\">NULL</span>,\n    <span class=\"hljs-keyword\">UNIQUE</span> INDEX `uk_role_permission` (`role`,`resource`,`action`) <span class=\"hljs-keyword\">USING</span> BTREE\n);\n</code></div></pre>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522385591.png\" alt=\"image.png\" /><br />\n<br /><br />\n这并不是最佳的解决方法，盲猜导致这个问题的原因是RuoYi提供的sql文件中，存在一些问题，仔细对比官方和RuoYi提供的sql文件后发现，唯一的区别在于文件头RuoYi加入了创建数据库命令，数据库编码采用的 utf8mb4 ，而在上面进行测试时，默认数据库编码是utf8—utf8_unicode_ci，所以是成功了。<br />\n所以尝试使用utf8数据库编码，尝试导入RuoYi提供的sql文件<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523026949.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523059700.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523080663.png\" alt=\"image.png\" /><br />\n成功执行<br />\n为了控制变量保持测试的严谨性，尝试将官方的sql导入utf8mb4编码的数据库<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523188907.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523230100.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523244983.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523274562.png\" alt=\"image.png\" /><br />\n如预料一般的失败<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523305993.png\" alt=\"image.png\" /><br />\n<br /><br />\n最后，建议大家使用utf8编码的数据库执行nacos_config.sql</p>\n', '#### **一丶错误演示** {#content_views}\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521308918.png)\n\n默认用户名和密码都是nacos但显示错误。\n\n#### **二丶解决 (原因:****nacos-mysql.sql脚本****执行不完整)**\n\n**1. 登录SQLyog查看nacos_config库里的users表和roles表里是否有记录（Linux的话直接进去nacos_config库查这两个表有没有记录）（如果连nacos_config这个库都没有那就是sql脚本还没执行过，先去数据库里执行nacos提供的nacos-mysql.sql脚本,在nacos/conf/目录下)**\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521354551.png)\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521381559.png)\n\n如果nacos_mysql.sql脚本执行正确，以上users和roles表会有记录，如果没有说明nacos_mysql.sql执行有问题你没发现而已，因为nacos_mysql.sql最后两行还执行了插入语句也就是以上两条插入记录。\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521418842.png)\n\n如果自行看一下表结构，会发现permissions表也不存在，所以推断问题可能出在执行sql文件到CREATE TABLE `permissions`时出现了错误，下面新建数据库重新导入sql进行一次测试\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521644620.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521662372.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521767280.png)\n![1260A509.jpg](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711521777400.jpg)好好好，演我是吧，这次没出问题\n\n咳咳，其实官方给出的sql文件本身是没有问题的，问题出在我导入的是RuoYi-Cloud框架提供的sql，出现了下面的错误\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522042412.png)\n<br />\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522084607.png)\n问题确实出在执行到CREATE TABLE `permissions`时出现错误[ERR] 1071 - Specified key was too long; max key length is 1000 bytes\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522184742.png)\n\n**2. 解决:**\n\n**进入数据库nacos_config数据库执行这两条插入语句即可, 之后重启nacos服务就可以登录了。**\n\n```sql\nINSERT INTO users (username, password, enabled) VALUES (\'nacos\', \'$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu\', TRUE);\n\nINSERT INTO roles (username, role) VALUES (\'nacos\', \'ROLE_ADMIN\');\n```\n当然这还没完，permissions表还没创建呢，执行这条插入语句即可\n```sql\nCREATE TABLE `permissions` (\n    `role` varchar(50) NOT NULL,\n    `resource` varchar(192) NOT NULL,\n    `action` varchar(8) NOT NULL,\n    UNIQUE INDEX `uk_role_permission` (`role`,`resource`,`action`) USING BTREE\n);\n```\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711522385591.png)\n<br />\n这并不是最佳的解决方法，盲猜导致这个问题的原因是RuoYi提供的sql文件中，存在一些问题，仔细对比官方和RuoYi提供的sql文件后发现，唯一的区别在于文件头RuoYi加入了创建数据库命令，数据库编码采用的 utf8mb4 ，而在上面进行测试时，默认数据库编码是utf8—utf8_unicode_ci，所以是成功了。\n所以尝试使用utf8数据库编码，尝试导入RuoYi提供的sql文件\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523026949.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523059700.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523080663.png)\n成功执行\n为了控制变量保持测试的严谨性，尝试将官方的sql导入utf8mb4编码的数据库\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523188907.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523230100.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523244983.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523274562.png)\n如预料一般的失败\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240327_1711523305993.png)\n<br />\n最后，建议大家使用utf8编码的数据库执行nacos_config.sql\n\n', 0, 0, 1, 1, 'https://blog.csdn.net/m0_55435847/article/details/125292192', 0, '2024-03-27 15:14:50', NULL, 1, 0, NULL);
INSERT INTO `blog_article` VALUES (26, '4', 16, 'MyBatisPlus中使用 @TableField完成字段自动填充', 'https://img.btstu.cn/api/images/5cc81b0252e2b.jpg', '创建/更新人和时间自动注入，无需自行编码写入', '<h2><a id=\"_0\"></a>场景</h2>\n<p>官方文档：</p>\n<blockquote>\n<p>字段注解 <code>@TableField</code></p>\n</blockquote>\n<ul>\n<li>com.baomidou.mybatisplus.annotations.TableField</li>\n</ul>\n<table>\n<thead>\n<tr>\n<th>值</th>\n<th>描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>value</td>\n<td>字段值（驼峰命名方式，该值可无）</td>\n</tr>\n<tr>\n<td>update</td>\n<td>预处理 set 字段自定义注入</td>\n</tr>\n<tr>\n<td>condition</td>\n<td>预处理 WHERE 实体条件自定义运算规则</td>\n</tr>\n<tr>\n<td>el</td>\n<td>详看注释说明</td>\n</tr>\n<tr>\n<td>exist</td>\n<td>是否为数据库表字段（ 默认 true 存在，false 不存在 ）</td>\n</tr>\n<tr>\n<td>strategy</td>\n<td>字段验证 （ 默认 非 null 判断，查看 com.baomidou.mybatisplus.enums.FieldStrategy ）</td>\n</tr>\n<tr>\n<td>fill</td>\n<td>字段填充标记 （ FieldFill, 配合自动填充使用 ）</td>\n</tr>\n</tbody>\n</table>\n<ul>\n<li>字段填充策略 FieldFill</li>\n</ul>\n<table>\n<thead>\n<tr>\n<th>值</th>\n<th>描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>DEFAULT</td>\n<td>默认不处理</td>\n</tr>\n<tr>\n<td>INSERT</td>\n<td>插入填充字段</td>\n</tr>\n<tr>\n<td>UPDATE</td>\n<td>更新填充字段</td>\n</tr>\n<tr>\n<td>INSERT_UPDATE</td>\n<td>插入和更新填充字段</td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_27\"></a>实现</h2>\n<p>实体类中有如下属性，通过上面的自动填充属性，我们可以实现在进行插入操作时对添加了注解@TableField(fill = FieldFill.INSERT)的字段进行自动填充。</p>\n<p>对添加了注解@TableField(fill = FieldFill.INSERT_UPDATE)的字段在进行插入和更新时进行自动填充。</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\">    <span class=\"hljs-meta\">@CreatedBy</span>\n    <span class=\"hljs-meta\">@TableField(fill = FieldFill.INSERT)</span>\n    <span class=\"hljs-meta\">@ApiModelProperty(value = &quot;创建人&quot;, hidden = true)</span>\n    <span class=\"hljs-keyword\">private</span> String createBy;\n\n    <span class=\"hljs-meta\">@LastModifiedBy</span>\n    <span class=\"hljs-meta\">@TableField(fill = FieldFill.INSERT_UPDATE)</span>\n    <span class=\"hljs-meta\">@ApiModelProperty(value = &quot;更新人&quot;, hidden = true)</span>\n    <span class=\"hljs-keyword\">private</span> String updateBy;\n\n    <span class=\"hljs-meta\">@TableField(fill = FieldFill.INSERT)</span>\n    <span class=\"hljs-meta\">@ApiModelProperty(value = &quot;创建时间&quot;, hidden = true)</span>\n    <span class=\"hljs-keyword\">private</span> Timestamp createTime;\n\n    <span class=\"hljs-meta\">@TableField(fill = FieldFill.INSERT_UPDATE)</span>\n    <span class=\"hljs-meta\">@ApiModelProperty(value = &quot;更新时间&quot;, hidden = true)</span>\n    <span class=\"hljs-keyword\">private</span> Timestamp updateTime;\n</code></div></pre>\n<p>这样我们在具体业务中对实体类进行赋值就可以不用对这些公共字段进行赋值，在执行插入或者更新时就能自动赋值并插入数据库。也可以将此段代码定义一个entity基类，有上述参数的entity全都继承于它</p>\n<h2><a id=\"_56\"></a>那么要自动赋的值在哪里配置？</h2>\n<p>在项目的config包下新建自动填充处理类使其实现接口MetaObjectHandler</p>\n<p>并重写其方法：</p>\n<pre><div class=\"hljs\"><code class=\"lang-java\"><span class=\"hljs-keyword\">import</span> cn.hutool.core.date.DateTime;\n<span class=\"hljs-keyword\">import</span> com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;\n<span class=\"hljs-keyword\">import</span> me.mcx.utils.SecurityUtils;\n<span class=\"hljs-keyword\">import</span> org.apache.ibatis.reflection.MetaObject;\n<span class=\"hljs-keyword\">import</span> org.springframework.stereotype.Component;\n<span class=\"hljs-keyword\">import</span> java.sql.Timestamp;\n\n<span class=\"hljs-comment\">/**\n * <span class=\"hljs-doctag\">@author</span> MCX\n * <span class=\"hljs-doctag\">@description</span>\n * <span class=\"hljs-doctag\">@date</span> 2023-06-13\n **/</span>\n<span class=\"hljs-meta\">@Component</span>\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">MyMetaObjectHandler</span> <span class=\"hljs-keyword\">implements</span> <span class=\"hljs-title class_\">MetaObjectHandler</span> {\n\n    <span class=\"hljs-meta\">@Override</span>\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">insertFill</span><span class=\"hljs-params\">(MetaObject metaObject)</span> {\n        <span class=\"hljs-comment\">/* 创建时间 */</span>\n        <span class=\"hljs-built_in\">this</span>.strictInsertFill(metaObject, <span class=\"hljs-string\">&quot;createTime&quot;</span>, Timestamp.class, DateTime.now().toTimestamp());\n        <span class=\"hljs-built_in\">this</span>.strictInsertFill(metaObject, <span class=\"hljs-string\">&quot;updateTime&quot;</span>, Timestamp.class, DateTime.now().toTimestamp());\n        <span class=\"hljs-comment\">/* 操作人 */</span>\n        <span class=\"hljs-type\">String</span> <span class=\"hljs-variable\">username</span> <span class=\"hljs-operator\">=</span> <span class=\"hljs-string\">&quot;System&quot;</span>;\n        <span class=\"hljs-keyword\">try</span> {username = SecurityUtils.getCurrentUsername();}<span class=\"hljs-keyword\">catch</span> (Exception ignored){}\n        <span class=\"hljs-built_in\">this</span>.strictInsertFill(metaObject, <span class=\"hljs-string\">&quot;createBy&quot;</span>, String.class, username);\n        <span class=\"hljs-built_in\">this</span>.strictInsertFill(metaObject, <span class=\"hljs-string\">&quot;updateBy&quot;</span>, String.class, username);\n    }\n\n    <span class=\"hljs-meta\">@Override</span>\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">updateFill</span><span class=\"hljs-params\">(MetaObject metaObject)</span> {\n        <span class=\"hljs-comment\">/* 更新时间 */</span>\n        <span class=\"hljs-built_in\">this</span>.strictUpdateFill(metaObject, <span class=\"hljs-string\">&quot;updateTime&quot;</span>, Timestamp.class, DateTime.now().toTimestamp());\n        <span class=\"hljs-comment\">/* 操作人 */</span>\n        <span class=\"hljs-type\">String</span> <span class=\"hljs-variable\">username</span> <span class=\"hljs-operator\">=</span> <span class=\"hljs-string\">&quot;System&quot;</span>;\n        <span class=\"hljs-keyword\">try</span> {username = SecurityUtils.getCurrentUsername();}<span class=\"hljs-keyword\">catch</span> (Exception ignored){}\n        <span class=\"hljs-built_in\">this</span>.strictUpdateFill(metaObject, <span class=\"hljs-string\">&quot;updateBy&quot;</span>, String.class, username);\n    }\n}\n</code></div></pre>\n<p>其中方法参数中第一个是前面自动填充所对应的字段，第二个是要自动填充的值。</p>\n', '场景\n-------------------\n\n官方文档：\n> 字段注解 `@TableField`\n\n* com.baomidou.mybatisplus.annotations.TableField\n\n|     值     |                                  描述                                   |\n|-----------|-----------------------------------------------------------------------|\n| value     | 字段值（驼峰命名方式，该值可无）                                                      |\n| update    | 预处理 set 字段自定义注入                                                       |\n| condition | 预处理 WHERE 实体条件自定义运算规则                                                 |\n| el        | 详看注释说明                                                                |\n| exist     | 是否为数据库表字段（ 默认 true 存在，false 不存在 ）                                     |\n| strategy  | 字段验证 （ 默认 非 null 判断，查看 com.baomidou.mybatisplus.enums.FieldStrategy ） |\n| fill      | 字段填充标记 （ FieldFill, 配合自动填充使用 ）                                        |\n\n* 字段填充策略 FieldFill\n\n|       值       |    描述     |\n|---------------|-----------|\n| DEFAULT       | 默认不处理     |\n| INSERT        | 插入填充字段    |\n| UPDATE        | 更新填充字段    |\n| INSERT_UPDATE | 插入和更新填充字段 |\n\n实现\n---\n\n实体类中有如下属性，通过上面的自动填充属性，我们可以实现在进行插入操作时对添加了注解@TableField(fill = FieldFill.INSERT)的字段进行自动填充。\n\n对添加了注解@TableField(fill = FieldFill.INSERT_UPDATE)的字段在进行插入和更新时进行自动填充。\n\n```java\n    @CreatedBy\n    @TableField(fill = FieldFill.INSERT)\n    @ApiModelProperty(value = \"创建人\", hidden = true)\n    private String createBy;\n\n    @LastModifiedBy\n    @TableField(fill = FieldFill.INSERT_UPDATE)\n    @ApiModelProperty(value = \"更新人\", hidden = true)\n    private String updateBy;\n\n    @TableField(fill = FieldFill.INSERT)\n    @ApiModelProperty(value = \"创建时间\", hidden = true)\n    private Timestamp createTime;\n\n    @TableField(fill = FieldFill.INSERT_UPDATE)\n    @ApiModelProperty(value = \"更新时间\", hidden = true)\n    private Timestamp updateTime;\n```\n\n这样我们在具体业务中对实体类进行赋值就可以不用对这些公共字段进行赋值，在执行插入或者更新时就能自动赋值并插入数据库。也可以将此段代码定义一个entity基类，有上述参数的entity全都继承于它\n\n## 那么要自动赋的值在哪里配置？\n\n在项目的config包下新建自动填充处理类使其实现接口MetaObjectHandler\n\n并重写其方法：\n\n```java\nimport cn.hutool.core.date.DateTime;\nimport com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;\nimport me.mcx.utils.SecurityUtils;\nimport org.apache.ibatis.reflection.MetaObject;\nimport org.springframework.stereotype.Component;\nimport java.sql.Timestamp;\n\n/**\n * @author MCX\n * @description\n * @date 2023-06-13\n **/\n@Component\npublic class MyMetaObjectHandler implements MetaObjectHandler {\n\n    @Override\n    public void insertFill(MetaObject metaObject) {\n        /* 创建时间 */\n        this.strictInsertFill(metaObject, \"createTime\", Timestamp.class, DateTime.now().toTimestamp());\n        this.strictInsertFill(metaObject, \"updateTime\", Timestamp.class, DateTime.now().toTimestamp());\n        /* 操作人 */\n        String username = \"System\";\n        try {username = SecurityUtils.getCurrentUsername();}catch (Exception ignored){}\n        this.strictInsertFill(metaObject, \"createBy\", String.class, username);\n        this.strictInsertFill(metaObject, \"updateBy\", String.class, username);\n    }\n\n    @Override\n    public void updateFill(MetaObject metaObject) {\n        /* 更新时间 */\n        this.strictUpdateFill(metaObject, \"updateTime\", Timestamp.class, DateTime.now().toTimestamp());\n        /* 操作人 */\n        String username = \"System\";\n        try {username = SecurityUtils.getCurrentUsername();}catch (Exception ignored){}\n        this.strictUpdateFill(metaObject, \"updateBy\", String.class, username);\n    }\n}\n```\n\n其中方法参数中第一个是前面自动填充所对应的字段，第二个是要自动填充的值。\n', 0, 0, 1, 1, 'https://blog.csdn.net/BADAO_LIUMANG_QIZHI/article/details/89450006', 0, '2024-03-27 15:50:41', NULL, 1, 1, NULL);
INSERT INTO `blog_article` VALUES (27, '4', 32, 'uniapp 实现当前页面分享至微信好友或朋友圈功能', 'https://img.btstu.cn/api/images/5a153a264e593.jpg', 'uniapp 实现当前页面分享至微信好友或朋友圈功能', '<p>使用uniapp开发微信小程序时，小程序自带的转发给朋友和转发到朋友圈功能默认是灰色禁用的，点击会提示“此页面未配置分享功能”</p>\n<p>解决方法为在每个page页面的script中（和生命周期函数同级）添加以下代码：</p>\n<pre><code class=\"lang-\">onShareAppMessage(){//点亮发送给朋友\n    return {\n      title: \'自定义转发标题\',//标题\n      path: \'/page/user?id=123\'//路径\n    }\n},\nonShareTimeline() {}//点亮分享朋友圈,暂只支持Android平台\n</code></pre>\n<p>若觉得每个页面单独添加比较麻烦，还有两个办法只需添加一次代码，首先是全局配置：<br />\n在app.js中加入以下代码：</p>\n<pre><code class=\"lang-\">!function(){\n  var PageTmp = Page;\n\n  Page =function (pageConfig) {\n\n    // 设置全局默认分享\n    pageConfig = Object.assign({\n      onShareAppMessage:function () {\n        return {\n          title:\'默认文案\',\n          path:\'默认分享路径+id\',\n          imageUrl:\'默认分享图片\',\n        };\n      }\n    },pageConfig);\n\n    PageTmp(pageConfig);\n  };\n}();\n</code></pre>\n<p>或者也可以使用代码混入，可以把js当做组件在每个页面引用，也可以在main.js中全局混入：<br />\n新建share.js文件，内容如下：</p>\n<pre><code class=\"lang-\">export default {\n    data() {\n        return {\n            //设置默认的分享参数\n            share: {\n                title: \'辰雪博客\',\n                path: \'/pages/index\',\n                imageUrl: \'\',\n                desc: \'一个不知道哪抄来的博客\',\n                content: \'\'\n            }\n        }\n    },\n    onShareAppMessage(res) {\n        return {\n            title: this.share.title,\n            path: this.share.path,\n            imageUrl: this.share.imageUrl,\n            desc: this.share.desc,\n            content: this.share.content,\n            success(res) {\n                uni.showToast({\n                    title: \'分享成功\'\n                })\n            },\n            fail(res) {\n                uni.showToast({\n                    title: \'分享失败\',\n                    icon: \'none\'\n                })\n            }\n        }\n    },\n    onShareTimeline() {},\n}\n</code></pre>\n<p>1.单独混入：</p>\n<pre><code class=\"lang-\">import share from \'@/libs/mixin/share.js\'\n  export default {\n    name: \'TemplateTest\',\n    mixins: [share],\n    data() {\n      return {\n      }\n    }\n  }\n</code></pre>\n<p>2.全局混入：<br />\n在main.js中引入：</p>\n<pre><code class=\"lang-\">import share from \'@/libs/mixin/share.js\'\nVue.mixin(share)\n</code></pre>\n<p>任意方式添加 onShareAppMessage 和 onShareTimeline方法后，微信小程序自带的分享功能就被点亮了。<br />\n如果还是不可以状态，请检查小程序是否已完成微信认证。</p>\n', '使用uniapp开发微信小程序时，小程序自带的转发给朋友和转发到朋友圈功能默认是灰色禁用的，点击会提示“此页面未配置分享功能”\n\n解决方法为在每个page页面的script中（和生命周期函数同级）添加以下代码：\n```\nonShareAppMessage(){//点亮发送给朋友\n    return {\n      title: \'自定义转发标题\',//标题\n      path: \'/page/user?id=123\'//路径\n    }\n},\nonShareTimeline() {}//点亮分享朋友圈,暂只支持Android平台\n```\n若觉得每个页面单独添加比较麻烦，还有两个办法只需添加一次代码，首先是全局配置：\n在app.js中加入以下代码：\n```\n!function(){\n  var PageTmp = Page;\n\n  Page =function (pageConfig) {\n\n    // 设置全局默认分享\n    pageConfig = Object.assign({\n      onShareAppMessage:function () {\n        return {\n          title:\'默认文案\',\n          path:\'默认分享路径+id\',\n          imageUrl:\'默认分享图片\',\n        };\n      }\n    },pageConfig);\n\n    PageTmp(pageConfig);\n  };\n}();\n```\n或者也可以使用代码混入，可以把js当做组件在每个页面引用，也可以在main.js中全局混入：\n新建share.js文件，内容如下：\n```\nexport default {\n    data() {\n        return {\n            //设置默认的分享参数\n            share: {\n                title: \'辰雪博客\',\n                path: \'/pages/index\',\n                imageUrl: \'\',\n                desc: \'一个不知道哪抄来的博客\',\n                content: \'\'\n            }\n        }\n    },\n    onShareAppMessage(res) {\n        return {\n            title: this.share.title,\n            path: this.share.path,\n            imageUrl: this.share.imageUrl,\n            desc: this.share.desc,\n            content: this.share.content,\n            success(res) {\n                uni.showToast({\n                    title: \'分享成功\'\n                })\n            },\n            fail(res) {\n                uni.showToast({\n                    title: \'分享失败\',\n                    icon: \'none\'\n                })\n            }\n        }\n    },\n    onShareTimeline() {},\n}\n```\n1.单独混入：\n```\nimport share from \'@/libs/mixin/share.js\'\n  export default {\n    name: \'TemplateTest\',\n    mixins: [share],\n    data() {\n      return {\n      }\n    }\n  }\n```\n2.全局混入：\n在main.js中引入：\n```\nimport share from \'@/libs/mixin/share.js\'\nVue.mixin(share)\n```\n\n任意方式添加 onShareAppMessage 和 onShareTimeline方法后，微信小程序自带的分享功能就被点亮了。\n如果还是不可以状态，请检查小程序是否已完成微信认证。', 0, 0, 1, 1, NULL, 0, '2024-03-29 01:04:42', NULL, 0, 0, NULL);
INSERT INTO `blog_article` VALUES (28, '4', 16, 'vue中开发多语言（国际化）', 'https://img.btstu.cn/api/images/5cbed137e72d4.jpg', '使用i18n在vue中实现多语言功能', '<p><strong>前言：我们有时候会遇到一个项目需要支持多语言，而用直接翻译的插件时常会导致翻译的结果跟自己预想的有所偏差或者结果太长造成页面结构紊乱而这个时候就需要用到 i18n</strong> <strong>，这个插件的作用是创建这个自己的字典，使其切换语言时用到的文案是自己编写的，这样就可以做到实现自己想表达的效果.</strong></p>\n<p>话不多说，直接上源码：</p>\n<h2><a id=\"_4\"></a>第一步：</h2>\n<p>先安装依赖啦</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">npm install vue-i18n -save\n</code></div></pre>\n<p>前言里我们说到这个插件是让我们引用自己的字典文件，所以这里我们要插件字典文件夹具体取名，自己决定，这里以lang作为文件夹名，en和zh等作为字典文件名。在src目录下新建lang目录，为每个vue页面编写多语言js文件，我们仅以中文zh.js和英文en.js为例。<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792143612.png\" alt=\"image.png\" /><br />\n例如我这里仅展示admin页面的英文字典文件写法<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792635081.png\" alt=\"image.png\" /><br />\n然后把它在lang根目录的同语言文件导入，并随其它文件一起导出：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792250084.png\" alt=\"image.png\" /><br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792733367.png\" alt=\"image.png\" /></p>\n<h2><a id=\"_22\"></a>第三步：</h2>\n<p>在lang目录下创建一个index.js文件，用作多语言的查找和控制功能。<br />\n对字体文件的切换我这边是利用Cookies的形式进行，先在index.jd引入插件和这些字典文件，然后我们在引入插件的下方进行配置</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> { createI18n } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;vue-i18n&#x27;</span>\n<span class=\"hljs-keyword\">import</span> en <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;./en&#x27;</span>\n<span class=\"hljs-keyword\">import</span> zhCn <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;./zhCn&#x27;</span>\n<span class=\"hljs-keyword\">import</span> <span class=\"hljs-title class_\">Cookies</span> <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;vue-cookies&#x27;</span>\n\n<span class=\"hljs-keyword\">const</span> messages = {\n  <span class=\"hljs-attr\">en</span>: {\n    ...en\n  },\n  <span class=\"hljs-attr\">zh</span>: {\n    ...zhCn\n  }\n}\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">function</span> <span class=\"hljs-title function_\">getLanguage</span> () {\n  <span class=\"hljs-keyword\">const</span> chooseLanguage = <span class=\"hljs-title class_\">Cookies</span>.<span class=\"hljs-title function_\">get</span>(<span class=\"hljs-string\">&#x27;language&#x27;</span>)\n  <span class=\"hljs-keyword\">if</span> (chooseLanguage) <span class=\"hljs-keyword\">return</span> chooseLanguage\n  <span class=\"hljs-comment\">// if has not choose language</span>\n  <span class=\"hljs-keyword\">const</span> language = (navigator.<span class=\"hljs-property\">language</span> || navigator.<span class=\"hljs-property\">browserLanguage</span>).<span class=\"hljs-title function_\">toLowerCase</span>()\n  <span class=\"hljs-keyword\">const</span> locales = <span class=\"hljs-title class_\">Object</span>.<span class=\"hljs-title function_\">keys</span>(messages)\n  <span class=\"hljs-keyword\">for</span> (<span class=\"hljs-keyword\">const</span> locale <span class=\"hljs-keyword\">of</span> locales) {\n    <span class=\"hljs-keyword\">if</span> (language.<span class=\"hljs-title function_\">indexOf</span>(locale) &gt; -<span class=\"hljs-number\">1</span>) {\n      <span class=\"hljs-keyword\">return</span> locale\n    }\n  }\n  <span class=\"hljs-keyword\">return</span> <span class=\"hljs-string\">&#x27;zh&#x27;</span>\n}\n\n<span class=\"hljs-keyword\">const</span> localeData = {\n  <span class=\"hljs-attr\">globalInjection</span>: <span class=\"hljs-literal\">true</span>, <span class=\"hljs-comment\">// 如果设置true, $t() 函数将注册到全局</span>\n  <span class=\"hljs-attr\">legacy</span>: <span class=\"hljs-literal\">false</span>, <span class=\"hljs-comment\">// 如果想在composition api中使用需要设置为false</span>\n  <span class=\"hljs-comment\">// 默认语言</span>\n  <span class=\"hljs-comment\">// locale: settings.defaultLanguage,</span>\n  <span class=\"hljs-attr\">locale</span>: <span class=\"hljs-variable language_\">localStorage</span>.<span class=\"hljs-title function_\">getItem</span>(<span class=\"hljs-string\">&#x27;language&#x27;</span>) || <span class=\"hljs-string\">&#x27;zh&#x27;</span>,\n  messages <span class=\"hljs-comment\">// set locale messages</span>\n}\n\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> i18n = <span class=\"hljs-title function_\">createI18n</span>(localeData)\n<span class=\"hljs-keyword\">export</span> <span class=\"hljs-keyword\">const</span> setupI18n = {\n  install (app) {\n    app.<span class=\"hljs-title function_\">use</span>(i18n)\n  }\n}\n\n</code></div></pre>\n<p>然后挂载到vue上</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-keyword\">import</span> { setupI18n } <span class=\"hljs-keyword\">from</span> <span class=\"hljs-string\">&#x27;@/lang&#x27;</span>\n<span class=\"hljs-comment\">// i18n</span>\napp.<span class=\"hljs-title function_\">use</span>(setupI18n)\n</code></div></pre>\n<h2><a id=\"_81\"></a>第四步：</h2>\n<p>定义切换的数据：</p>\n<pre><div class=\"hljs\"><code class=\"lang-html\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span> <span class=\"hljs-attr\">class</span>=<span class=\"hljs-string\">&quot;switch-language&quot;</span>&gt;</span>\n        <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">el-dropdown</span> @<span class=\"hljs-attr\">command</span>=<span class=\"hljs-string\">&quot;handleSetLanguage&quot;</span>&gt;</span>\n          <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">span</span> <span class=\"hljs-attr\">class</span>=<span class=\"hljs-string\">&quot;el-dropdown-link&quot;</span>&gt;</span>\n            语言<span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">el-icon</span>&gt;</span><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">CaretBottom</span> /&gt;</span><span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-icon</span>&gt;</span>\n          <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">span</span>&gt;</span>\n          <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">template</span> #<span class=\"hljs-attr\">dropdown</span>&gt;</span>\n            <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">el-dropdown-menu</span>&gt;</span>\n              <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">el-dropdown-item</span>\n                <span class=\"hljs-attr\">:disabled</span>=<span class=\"hljs-string\">&quot;language===&#x27;zh&#x27;&quot;</span>\n                <span class=\"hljs-attr\">command</span>=<span class=\"hljs-string\">&quot;zh&quot;</span>\n              &gt;</span>\n                中文\n              <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-dropdown-item</span>&gt;</span>\n              <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">el-dropdown-item</span>\n                <span class=\"hljs-attr\">:disabled</span>=<span class=\"hljs-string\">&quot;language===&#x27;en&#x27;&quot;</span>\n                <span class=\"hljs-attr\">command</span>=<span class=\"hljs-string\">&quot;en&quot;</span>\n              &gt;</span>\n                English\n              <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-dropdown-item</span>&gt;</span>\n            <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-dropdown-menu</span>&gt;</span>\n          <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">template</span>&gt;</span>\n        <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">el-dropdown</span>&gt;</span>\n      <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span>\n</code></div></pre>\n<p>在用户点击切换语言的时候 调用方法更改Cookies里的值：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\"><span class=\"hljs-comment\">// 切换语言</span>\n<span class=\"hljs-keyword\">const</span> <span class=\"hljs-title function_\">handleSetLanguage</span> = (<span class=\"hljs-params\">lang</span>) =&gt; {\n  <span class=\"hljs-title class_\">Cookies</span>.<span class=\"hljs-title function_\">set</span>(<span class=\"hljs-string\">&#x27;cloudLanguage&#x27;</span>, language)\n  <span class=\"hljs-variable language_\">window</span>.<span class=\"hljs-property\">location</span>.<span class=\"hljs-title function_\">reload</span>()\n}\n</code></div></pre>\n<p>这样就可以起到切换的作用了.</p>\n<br />\n<h2><a id=\"_125\"></a>最后：</h2>\n<p>接下来就是最后在页面上的写法了，这里是插件的统一写法用$t的方式，以admin页面下中的add变量为例：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">&lt;template&gt;\n　　<span class=\"language-xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">div</span>&gt;</span>　　\n  　　<span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">h1</span>&gt;</span>{\n    { $t(&quot;admin.add&quot;) }}<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">h3</span>&gt;</span>\n　　<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">div</span>&gt;</span></span>\n&lt;/template&gt;\n</code></div></pre>\n<p>还有这里官方文档给出的基本方法：</p>\n<pre><div class=\"hljs\"><code class=\"lang-javascript\">$t：普通词\n$tc：单复数\n$te：check 翻译key是否存在\n$d：时间日期\n$n：货币数字\n</code></div></pre>\n<p>用$t就好了 要是你要求规范就按文档的规范来，到这里后就可以开始我们的国际化开发啦。</p>\n', '**前言：我们有时候会遇到一个项目需要支持多语言，而用直接翻译的插件时常会导致翻译的结果跟自己预想的有所偏差或者结果太长造成页面结构紊乱而这个时候就需要用到 i18n** **，这个插件的作用是创建这个自己的字典，使其切换语言时用到的文案是自己编写的，这样就可以做到实现自己想表达的效果.**   \n\n话不多说，直接上源码：\n\n第一步：\n--------------------------------------------\n\n先安装依赖啦\n\n```javascript\nnpm install vue-i18n -save\n```\n\n前言里我们说到这个插件是让我们引用自己的字典文件，所以这里我们要插件字典文件夹具体取名，自己决定，这里以lang作为文件夹名，en和zh等作为字典文件名。在src目录下新建lang目录，为每个vue页面编写多语言js文件，我们仅以中文zh.js和英文en.js为例。\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792143612.png)\n例如我这里仅展示admin页面的英文字典文件写法\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792635081.png)\n然后把它在lang根目录的同语言文件导入，并随其它文件一起导出：\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792250084.png)\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240330_1711792733367.png)\n\n\n第三步：\n--------------------------------------------\n在lang目录下创建一个index.js文件，用作多语言的查找和控制功能。\n对字体文件的切换我这边是利用Cookies的形式进行，先在index.jd引入插件和这些字典文件，然后我们在引入插件的下方进行配置\n\n```javascript\nimport { createI18n } from \'vue-i18n\'\nimport en from \'./en\'\nimport zhCn from \'./zhCn\'\nimport Cookies from \'vue-cookies\'\n\nconst messages = {\n  en: {\n    ...en\n  },\n  zh: {\n    ...zhCn\n  }\n}\nexport function getLanguage () {\n  const chooseLanguage = Cookies.get(\'language\')\n  if (chooseLanguage) return chooseLanguage\n  // if has not choose language\n  const language = (navigator.language || navigator.browserLanguage).toLowerCase()\n  const locales = Object.keys(messages)\n  for (const locale of locales) {\n    if (language.indexOf(locale) > -1) {\n      return locale\n    }\n  }\n  return \'zh\'\n}\n\nconst localeData = {\n  globalInjection: true, // 如果设置true, $t() 函数将注册到全局\n  legacy: false, // 如果想在composition api中使用需要设置为false\n  // 默认语言\n  // locale: settings.defaultLanguage,\n  locale: localStorage.getItem(\'language\') || \'zh\',\n  messages // set locale messages\n}\n\nexport const i18n = createI18n(localeData)\nexport const setupI18n = {\n  install (app) {\n    app.use(i18n)\n  }\n}\n\n```\n\n然后挂载到vue上\n\n```javascript\nimport { setupI18n } from \'@/lang\'\n// i18n\napp.use(setupI18n)\n```\n\n第四步： \n--------------------------------------------\n\n定义切换的数据：\n\n```html\n<div class=\"switch-language\">\n        <el-dropdown @command=\"handleSetLanguage\">\n          <span class=\"el-dropdown-link\">\n            语言<el-icon><CaretBottom /></el-icon>\n          </span>\n          <template #dropdown>\n            <el-dropdown-menu>\n              <el-dropdown-item\n                :disabled=\"language===\'zh\'\"\n                command=\"zh\"\n              >\n                中文\n              </el-dropdown-item>\n              <el-dropdown-item\n                :disabled=\"language===\'en\'\"\n                command=\"en\"\n              >\n                English\n              </el-dropdown-item>\n            </el-dropdown-menu>\n          </template>\n        </el-dropdown>\n      </div>\n```\n在用户点击切换语言的时候 调用方法更改Cookies里的值：\n\n```javascript\n// 切换语言\nconst handleSetLanguage = (lang) => {\n  Cookies.set(\'cloudLanguage\', language)\n  window.location.reload()\n}\n```\n\n这样就可以起到切换的作用了.\n\n<br />\n\n最后： \n----------------------------------\n\n接下来就是最后在页面上的写法了，这里是插件的统一写法用$t的方式，以admin页面下中的add变量为例：\n\n```javascript\n<template>\n　　<div>　　\n  　　<h1>{\n    { $t(\"admin.add\") }}</h3>\n　　</div>\n</template>\n```\n\n还有这里官方文档给出的基本方法：\n\n```javascript\n$t：普通词\n$tc：单复数\n$te：check 翻译key是否存在\n$d：时间日期\n$n：货币数字\n```\n\n用$t就好了 要是你要求规范就按文档的规范来，到这里后就可以开始我们的国际化开发啦。', 0, 1, 1, 1, 'https://blog.csdn.net/weixin_51220466/article/details/123889240', 0, '2024-03-30 17:40:57', '2024-03-30 18:22:26', 1, 1, '多语言');
INSERT INTO `blog_article` VALUES (29, '4', 16, '用 Markdown 写微信公众号文章', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967855330.jpg', '这可能是用 Markdown 写微信公众号的终极解决方案', '<p>对于习惯了使用 Markdown 写作的人来说，实在受不了微信公众号原生的排版功能。</p>\n<p>因此出现了一批在线工具，能够将 Markdown 格式的文章直接转成适用于微信公众号排版的格式，比如：Md2All（http://md.aclickall.com/ 和 wechat-format（https://lab.lyric.im/wxformat/）。</p>\n<p>但是，</p>\n<p>对于追求高效、个性与颜值的人来说，这些工具还不够好，于是集众家之所长的 Markdown Nice 出现了。</p>\n<h2><a id=\"Markdown_Nice_8\"></a>Markdown Nice</h2>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967552536.png\" alt=\"image.png\" /></p>\n<p>Markdown Nice 是一个为了解决微信公众号排版而生的 Markdown 编辑器，当前有在线编辑器和 Chrome 插件 2 种产品形态。</p>\n<p><strong>基本信息</strong></p>\n<table>\n<thead>\n<tr>\n<th>工具名称</th>\n<th>Markdown Nice</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>在线版本</td>\n<td>https://mdnice.com/</td>\n</tr>\n<tr>\n<td>Chrome 插件</td>\n<td>Markdown Nice</td>\n</tr>\n<tr>\n<td>GitHub 地址</td>\n<td>https://github.com/mdnice/markdown-nice</td>\n</tr>\n</tbody>\n</table>\n<h2><a id=\"_httpsmdnicecom_23\"></a>在线编辑器: https://mdnice.com/</h2>\n<p>在线编辑器是一种比较流行的解决方案，Markdown Nice 做的更开放更漂亮更精致一些。</p>\n<p>主要功能特性有：</p>\n<ul>\n<li>可导入导出 Markdown 文件，或直接粘贴 Markdown 内容。</li>\n<li>可将 Html 转成 Markdown ( 菜单栏：功能 → SitDown → 输入 HTML → 得到 Markdown)</li>\n<li>有多款漂亮的主题可供选择，也可以自定义主题。</li>\n<li>可将文章转换成匹配微信公众号、知乎或掘金的格式。</li>\n</ul>\n<h3><a id=\"_35\"></a>实例演示</h3>\n<p>假设有一个写好的 Markdown 文件名为 <code>test.md</code>，我们要把它转换成微信公众号格式的文章。</p>\n<p>操作步骤：</p>\n<p>STEP 1. 打开在线编辑器 https://mdnice.com/</p>\n<p>左边是编辑器，右边是预览区。</p>\n<p>STEP 2. 把 Markdown 内容粘贴到左边的编辑区</p>\n<blockquote>\n<p>或者通过菜单栏：文件 → 导入 → 选择 test.md 导入也是一样的。</p>\n</blockquote>\n<p>如下图所示：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967648143.png\" alt=\"image.png\" /><br />\n在最右侧的工具栏，依次是：</p>\n<ul>\n<li>复制到微信公众号</li>\n<li>复制到知乎</li>\n<li>复制到掘金</li>\n<li>切换预览模式（手机/PC）</li>\n</ul>\n<p>STEP 3. 如果你要换个主题：菜单栏 → 主题 → 选择一款你心仪的主题 → 右边会实时预览效果</p>\n<blockquote>\n<p>小提示:</p>\n<p>查看 Markdown Nice 的主题列表： https://preview.mdnice.com/themes/</p>\n</blockquote>\n<p>STEP 4. 如果你要换个代码主题：菜单栏 → 代码主题 → 选择一款你心仪的代码主题</p>\n<p>STEP 5. 点击右上角的公众号图标，复制渲染好的文章格式。</p>\n<p>STEP 6. 打开微信公众号编辑器，粘贴就好了。</p>\n<p>OK，简单吧，漂亮吧，方便吧。</p>\n<p>都简单成这样了，可能你还是觉得有点麻烦，那能不能直接在微信公众号里编辑 Markdown 呢？</p>\n<p>能，使用 Markdown Nice 插件。</p>\n<h2><a id=\"Chrome_Markdown_Nice_74\"></a>Chrome 插件：Markdown Nice</h2>\n<p>安装 Markdown Nice</p>\n<p>方法一：如果你能打开 Chrome 应用商店</p>\n<p>在 Chrome 应用商店搜索 Markdown Nice 安装即可。</p>\n<p>方法二：如果你无法打开 Chrome 应用商店</p>\n<p>操作步骤：</p>\n<p>STEP 1. 下载安装文件： https://my-wechat.mdnice.com/mdnice_1_0_7.crx</p>\n<p>STEP 2. 在 Chrome 中输入网址： chrome://extensions/ 进入「扩展程序界面」</p>\n<p>STEP 3. 打开右上角的「开发者模式」</p>\n<p>STEP 4. 把下载的安装文件直接拖入「扩展程序界面」</p>\n<p>安装成功后，在 Chrome 的右上角会显示 Markdown Nice 图标</p>\n<p>使用 Markdown Nice</p>\n<p>操作步骤：</p>\n<p>STEP 1. 进入微信公众号文章编辑界面</p>\n<p>如下图所示：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967742928.png\" alt=\"image.png\" /><br />\nMarkdown Nice 将 3 个重要的功能嵌入到了微信公众号编辑器中：</p>\n<ul>\n<li>开关：控制着编辑区 Markdown 模式与原生模式的切换</li>\n<li>Markdown Nice 功能菜单：跟在线编辑器的功能一样</li>\n<li>预览效果：预览 Markdown 的效果</li>\n</ul>\n<p>STEP 2. 导入/粘贴/直接在编辑器中编辑 Markdown → 点击左下角的预览效果</p>\n<p>如下图所示：<br />\n<img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967756309.png\" alt=\"image.png\" /></p>\n<p>STEP 3. 关闭右上角的开关 → 编辑区的 Markdown 消失</p>\n<p>如下图所示：</p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967770674.png\" alt=\"image.png\" /></p>\n<p>STEP 4. 点击左边的预览区域 → 预览的内容就被添加到右边的编辑区了</p>\n<p>如下图所示：</p>\n<p><img src=\"https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967790294.png\" alt=\"image.png\" /><br />\n接下来就可以直接发表了！</p>\n<blockquote>\n<p>小提示：</p>\n<p>出于信息安全和个人习惯考虑，图床功能我就不介绍了，你可以自己试一下。</p>\n</blockquote>\n<p>&lt;完&gt;</p>\n', '对于习惯了使用 Markdown 写作的人来说，实在受不了微信公众号原生的排版功能。\n\n因此出现了一批在线工具，能够将 Markdown 格式的文章直接转成适用于微信公众号排版的格式，比如：Md2All（http://md.aclickall.com/ 和 wechat-format（https://lab.lyric.im/wxformat/）。\n\n但是，\n\n对于追求高效、个性与颜值的人来说，这些工具还不够好，于是集众家之所长的 Markdown Nice 出现了。\n\nMarkdown Nice\n------------------------------------------------\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967552536.png)\n\nMarkdown Nice 是一个为了解决微信公众号排版而生的 Markdown 编辑器，当前有在线编辑器和 Chrome 插件 2 种产品形态。\n\n**基本信息**\n\n|   工具名称    |              Markdown Nice              |\n|-----------|-----------------------------------------|\n| 在线版本      | https://mdnice.com/                     |\n| Chrome 插件 | Markdown Nice                           |\n| GitHub 地址 | https://github.com/mdnice/markdown-nice |\n\n在线编辑器: https://mdnice.com/\n-----------------------------------------------\n\n在线编辑器是一种比较流行的解决方案，Markdown Nice 做的更开放更漂亮更精致一些。\n\n主要功能特性有：\n\n* 可导入导出 Markdown 文件，或直接粘贴 Markdown 内容。\n* 可将 Html 转成 Markdown ( 菜单栏：功能 → SitDown → 输入 HTML → 得到 Markdown)\n* 有多款漂亮的主题可供选择，也可以自定义主题。\n* 可将文章转换成匹配微信公众号、知乎或掘金的格式。\n\n### 实例演示\n\n假设有一个写好的 Markdown 文件名为 `test.md`，我们要把它转换成微信公众号格式的文章。\n\n操作步骤：\n\nSTEP 1. 打开在线编辑器 https://mdnice.com/\n\n左边是编辑器，右边是预览区。\n\nSTEP 2. 把 Markdown 内容粘贴到左边的编辑区\n> 或者通过菜单栏：文件 → 导入 → 选择 test.md 导入也是一样的。\n\n如下图所示：  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967648143.png)\n在最右侧的工具栏，依次是：\n\n* 复制到微信公众号\n* 复制到知乎\n* 复制到掘金\n* 切换预览模式（手机/PC）\n\nSTEP 3. 如果你要换个主题：菜单栏 → 主题 → 选择一款你心仪的主题 → 右边会实时预览效果\n> 小提示:\n>\n> 查看 Markdown Nice 的主题列表： https://preview.mdnice.com/themes/\n\nSTEP 4. 如果你要换个代码主题：菜单栏 → 代码主题 → 选择一款你心仪的代码主题\n\nSTEP 5. 点击右上角的公众号图标，复制渲染好的文章格式。\n\nSTEP 6. 打开微信公众号编辑器，粘贴就好了。\n\nOK，简单吧，漂亮吧，方便吧。\n\n都简单成这样了，可能你还是觉得有点麻烦，那能不能直接在微信公众号里编辑 Markdown 呢？\n\n能，使用 Markdown Nice 插件。\n\nChrome 插件：Markdown Nice\n-------------------------------------------------\n\n安装 Markdown Nice\n\n方法一：如果你能打开 Chrome 应用商店\n\n在 Chrome 应用商店搜索 Markdown Nice 安装即可。\n\n方法二：如果你无法打开 Chrome 应用商店\n\n操作步骤：\n\nSTEP 1. 下载安装文件： https://my-wechat.mdnice.com/mdnice_1_0_7.crx\n\nSTEP 2. 在 Chrome 中输入网址： chrome://extensions/ 进入「扩展程序界面」\n\nSTEP 3. 打开右上角的「开发者模式」\n\nSTEP 4. 把下载的安装文件直接拖入「扩展程序界面」\n\n安装成功后，在 Chrome 的右上角会显示 Markdown Nice 图标 \n\n使用 Markdown Nice\n\n操作步骤：\n\nSTEP 1. 进入微信公众号文章编辑界面\n\n如下图所示：  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967742928.png)\nMarkdown Nice 将 3 个重要的功能嵌入到了微信公众号编辑器中：\n\n* 开关：控制着编辑区 Markdown 模式与原生模式的切换\n* Markdown Nice 功能菜单：跟在线编辑器的功能一样\n* 预览效果：预览 Markdown 的效果\n\nSTEP 2. 导入/粘贴/直接在编辑器中编辑 Markdown → 点击左下角的预览效果\n\n如下图所示：  \n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967756309.png)\n\nSTEP 3. 关闭右上角的开关 → 编辑区的 Markdown 消失\n\n如下图所示：\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967770674.png)\n\nSTEP 4. 点击左边的预览区域 → 预览的内容就被添加到右边的编辑区了\n\n如下图所示：\n\n![image.png](https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/article/20240424_1713967790294.png) \n接下来就可以直接发表了！\n> 小提示：\n>\n> 出于信息安全和个人习惯考虑，图床功能我就不介绍了，你可以自己试一下。\n\n\\<完\\>  ', 0, 0, 1, 0, 'https://blog.csdn.net/wirelessqa/article/details/105876032', 0, '2024-04-24 22:04:34', '2024-04-24 22:11:16', 0, 0, '用 Markdown 写微信公众号文章');
INSERT INTO `blog_article` VALUES (31, '1', 32, '项目连接Docker配置的nacos配置中心报错：Client not connected, current status:STARTING', '', '项目连接Docker配置的nacos配置中心报错：Client not connected, current status:STARTING', '<h2><a id=\"_0\"></a>背景</h2>\n<p>最近在尝试将本博客后端升级为微服务架构，使用了nacos作为服务商，部署采用Docker容器，编写docker-compose.yml一键运行容器，在容器中连接nacos时遇到了Client not connected, current status:STARTING错误。直接访问domain:port/nacos/index.html是可以访问的，说明nacos启动和数据库链接是没有问题的，后查询文献发现是nacos v2.*.*版本增加了9848端口，需要添加映射。</p>\n<h3><a id=\"__3\"></a>一、 运行环境</h3>\n<p>nacos版本：2.2.3<br />\nmysql版本：5.7<br />\n采用了mysql作为持久化的数据库，docker作为运行的环境</p>\n<h3><a id=\"nacos_8\"></a>二、启动nacos</h3>\n<p>采用 docker 的形式运行 mysql 和 nacos<br />\n起初运行 nacos 的 docker 命令：</p>\n<pre><div class=\"hljs\"><code class=\"lang-cmd\">docker run -d \n-e <span class=\"hljs-built_in\">MODE</span>=standalone \n-e PREFER_HOST_MODE=hostname \n-e SPRING_DATASOURCE_PLATFORM=mysql \n-e MYSQL_SERVICE_HOST=本机地址 \n-e MYSQL_SERVICE_PORT=<span class=\"hljs-number\">3306</span> \n-e MYSQL_SERVICE_USER=root \n-e MYSQL_SERVICE_PASSWORD=<span class=\"hljs-number\">123456</span> \n-e MYSQL_SERVICE_DB_NAME=nacos-config \n-p <span class=\"hljs-number\">8848</span>:<span class=\"hljs-number\">8848</span> \n--name nacos \n--restart=always nacos/nacos-server:latest\n</code></div></pre>\n<p>命令解释：<br />\ndocker run：这是Docker的一个命令，用于从Docker镜像创建并启动一个容器。<br />\n-d：这个选项告诉Docker在后台运行容器，并返回容器ID。<br />\n-e：这个选项用于设置环境变量。例如，-e MODE=standalone 设置了环境变量MODE的值为’standalone’。<br />\n-p：这个选项用于端口映射，例如 -p 8848:8848 将主机的8848端口映射到容器的8848端口。<br />\n–name：这个选项用于给容器命名，此处的名字为’nacos’。<br />\n–restart=always：这是一个策略，表明如果容器退出，Docker应该总是尝试重新启动它。<br />\nnacos/nacos-server:latest：这是要运行的Docker镜像的名称，其中’nacos/nacos-server’是镜像的仓库和名称，\'latest’是标签，表示要使用的是最新的版本。<br />\nnacos可以正常启动，然后也可以访问web控制台。但是事情还没完。</p>\n<p><strong>注：</strong> 为了更方便理解，这里给出的是docker运行语句，而非docker-compose写法。</p>\n<p>二、出现问题<br />\n然后我启动项目连接 nacos 的时候报错：Client not connected,current status:STARTING,StatusRuntimeException。以及无法连接到127.0.0.1:8848</p>\n<p>经过多方查找，发现 nacos 2.x.x 需要在启动的时候多映射两个端口：9848，9849</p>\n<p><strong>官方解释如下：</strong><br />\nNacos2.0版本相比1.X新增了gRPC的通信方式，因此需要增加2个端口。新增端口是在配置的主端口(server.port)基础上，进行一定偏移量自动生成。</p>\n<table>\n<thead>\n<tr>\n<th>端口</th>\n<th>与主端口的偏移量</th>\n<th>描述</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>9848</td>\n<td>1000</td>\n<td>客户端gRPC请求服务端端口，用于客户端向服务端发起连接和请求</td>\n</tr>\n<tr>\n<td>9849</td>\n<td>1001</td>\n<td>服务端gRPC请求服务端端口，用于服务间同步等</td>\n</tr>\n</tbody>\n</table>\n<p>更多解释移步官网查看：https://nacos.io/zh-cn/docs/v2/upgrading/2.0.0-compatibility.html</p>\n<p><strong>所以修改后的 docker 启动命令应该是：</strong></p>\n<pre><div class=\"hljs\"><code class=\"lang-cmd\">docker run -d\n -e <span class=\"hljs-built_in\">MODE</span>=standalone\n -e PREFER_HOST_MODE=hostname\n -e SPRING_DATASOURCE_PLATFORM=mysql\n -e MYSQL_SERVICE_HOST=本机地址\n -e MYSQL_SERVICE_PORT=<span class=\"hljs-number\">3306</span>\n -e MYSQL_SERVICE_USER=root\n -e MYSQL_SERVICE_PASSWORD=<span class=\"hljs-number\">123456</span>\n -e MYSQL_SERVICE_DB_NAME=nacos-config\n -p <span class=\"hljs-number\">8848</span>:<span class=\"hljs-number\">8848</span> -p <span class=\"hljs-number\">9848</span>:<span class=\"hljs-number\">9848</span> -p <span class=\"hljs-number\">9849</span>:<span class=\"hljs-number\">9849</span>\n --name nacos\n --restart=always nacos/nacos-server:latest\n</code></div></pre>\n<p><strong>最后提醒</strong>：在不同容器中一般不能使用127.0.0.1作为ip来连接，每个容器都是独立个体，可以理解为一个单独的虚拟机。如果要容器间通信，可以使用公网ip；如果容器在同一个网段（同一主机部署），可以使用容器名作为域名进行通信，例如mysql的容器名是<code>cxblog-mysql</code>，则<code>MYSQL_SERVICE_HOST=cxblog-mysql</code>，或在配置文件里面将连接url改为<code>db.url.0=jdbc:mysql://cxblog-mysql:3306/nacos-config</code></p>\n', '## 背景\n最近在尝试将本博客后端升级为微服务架构，使用了nacos作为服务商，部署采用Docker容器，编写docker-compose.yml一键运行容器，在容器中连接nacos时遇到了Client not connected, current status:STARTING错误。直接访问domain:port/nacos/index.html是可以访问的，说明nacos启动和数据库链接是没有问题的，后查询文献发现是nacos v2.*.*版本增加了9848端口，需要添加映射。\n\n### 一、 运行环境\nnacos版本：2.2.3\nmysql版本：5.7\n采用了mysql作为持久化的数据库，docker作为运行的环境\n\n### 二、启动nacos\n采用 docker 的形式运行 mysql 和 nacos\n起初运行 nacos 的 docker 命令：\n``` cmd\ndocker run -d \n-e MODE=standalone \n-e PREFER_HOST_MODE=hostname \n-e SPRING_DATASOURCE_PLATFORM=mysql \n-e MYSQL_SERVICE_HOST=本机地址 \n-e MYSQL_SERVICE_PORT=3306 \n-e MYSQL_SERVICE_USER=root \n-e MYSQL_SERVICE_PASSWORD=123456 \n-e MYSQL_SERVICE_DB_NAME=nacos-config \n-p 8848:8848 \n--name nacos \n--restart=always nacos/nacos-server:latest\n```\n命令解释：\ndocker run：这是Docker的一个命令，用于从Docker镜像创建并启动一个容器。\n-d：这个选项告诉Docker在后台运行容器，并返回容器ID。\n-e：这个选项用于设置环境变量。例如，-e MODE=standalone 设置了环境变量MODE的值为’standalone’。\n-p：这个选项用于端口映射，例如 -p 8848:8848 将主机的8848端口映射到容器的8848端口。\n--name：这个选项用于给容器命名，此处的名字为’nacos’。\n--restart=always：这是一个策略，表明如果容器退出，Docker应该总是尝试重新启动它。\nnacos/nacos-server:latest：这是要运行的Docker镜像的名称，其中’nacos/nacos-server’是镜像的仓库和名称，\'latest’是标签，表示要使用的是最新的版本。\nnacos可以正常启动，然后也可以访问web控制台。但是事情还没完。\n\n**注：** 为了更方便理解，这里给出的是docker运行语句，而非docker-compose写法。\n\n二、出现问题\n然后我启动项目连接 nacos 的时候报错：Client not connected,current status:STARTING,StatusRuntimeException。以及无法连接到127.0.0.1:8848\n\n经过多方查找，发现 nacos 2.x.x 需要在启动的时候多映射两个端口：9848，9849\n\n**官方解释如下：**\nNacos2.0版本相比1.X新增了gRPC的通信方式，因此需要增加2个端口。新增端口是在配置的主端口(server.port)基础上，进行一定偏移量自动生成。\n\n|端口|	与主端口的偏移量|	描述|\n|--|--|--|\n|9848|	1000	|客户端gRPC请求服务端端口，用于客户端向服务端发起连接和请求|\n|9849	|1001	|服务端gRPC请求服务端端口，用于服务间同步等|\n更多解释移步官网查看：https://nacos.io/zh-cn/docs/v2/upgrading/2.0.0-compatibility.html\n\n**所以修改后的 docker 启动命令应该是：**\n```cmd\ndocker run -d\n -e MODE=standalone\n -e PREFER_HOST_MODE=hostname\n -e SPRING_DATASOURCE_PLATFORM=mysql\n -e MYSQL_SERVICE_HOST=本机地址\n -e MYSQL_SERVICE_PORT=3306\n -e MYSQL_SERVICE_USER=root\n -e MYSQL_SERVICE_PASSWORD=123456\n -e MYSQL_SERVICE_DB_NAME=nacos-config\n -p 8848:8848 -p 9848:9848 -p 9849:9849\n --name nacos\n --restart=always nacos/nacos-server:latest\n```\n\n**最后提醒**：在不同容器中一般不能使用127.0.0.1作为ip来连接，每个容器都是独立个体，可以理解为一个单独的虚拟机。如果要容器间通信，可以使用公网ip；如果容器在同一个网段（同一主机部署），可以使用容器名作为域名进行通信，例如mysql的容器名是`cxblog-mysql`，则`MYSQL_SERVICE_HOST=cxblog-mysql`，或在配置文件里面将连接url改为`db.url.0=jdbc:mysql://cxblog-mysql:3306/nacos-config`', 0, 1, 1, 1, NULL, 0, '2024-05-17 00:32:24', NULL, 1, 1, '');

-- ----------------------------
-- Table structure for blog_article_collect
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_collect`;
CREATE TABLE `blog_article_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_collect
-- ----------------------------
INSERT INTO `blog_article_collect` VALUES (13, '4', 1, '2024-04-09 13:18:58');

-- ----------------------------
-- Table structure for blog_article_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_comment`;
CREATE TABLE `blog_article_comment`  (
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_comment
-- ----------------------------
INSERT INTO `blog_article_comment` VALUES (1, '2', 1, '看了半天猛然发现，你这不全是抄的吗？博客是抄的，管理端是抄的，甚至这个文章也是抄的。整个网站99%全是抄的，你就改了点参数是吧，要是代码有查重，你这查重率得有99.99999%吧。不对，说抄都算夸你了，你这只能算是搬运，你不写代码，你只是代码的搬运工对吧！***以为有多么高大上，结果看完才知道，这只是“农夫山泉”。', NULL, NULL, NULL, 'edge', 'Edge 122.0.0.0', 'windowns', 'Windows 10', '未知');
INSERT INTO `blog_article_comment` VALUES (6, '4', 1, '这不叫抄，这叫CV工程师，程序员的事怎么能叫抄呢！再说了，搬运再加二次开发的前提就是搞懂80%以上的源码啊，对于一个初学者而言，能看懂且能二次开发已经很不易了呀！多点包容，多点爱！长大了我要当程序员，爷爷奶奶可高兴了，给了我爱吃的大嘴巴子！', '2', 1, NULL, 'edge', 'Edge 122.0.0.0', 'windowns', 'Windows 10', '未知');

-- ----------------------------
-- Table structure for blog_article_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_like`;
CREATE TABLE `blog_article_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `article_id` bigint(20) NOT NULL COMMENT '文章id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_like
-- ----------------------------
INSERT INTO `blog_article_like` VALUES (13, '4', 1, '2024-04-09 13:18:58');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL COMMENT '文章id',
  `tag_id` int(11) NOT NULL COMMENT '标签id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `fk_article_tag_1`(`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1016 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (932, 16, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (944, 17, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (965, 18, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (966, 18, 65, NULL);
INSERT INTO `blog_article_tag` VALUES (967, 19, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (968, 20, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (969, 20, 65, NULL);
INSERT INTO `blog_article_tag` VALUES (972, 21, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (978, 23, 75, NULL);
INSERT INTO `blog_article_tag` VALUES (979, 23, 76, NULL);
INSERT INTO `blog_article_tag` VALUES (986, 25, 68, NULL);
INSERT INTO `blog_article_tag` VALUES (987, 25, 72, NULL);
INSERT INTO `blog_article_tag` VALUES (988, 25, 77, NULL);
INSERT INTO `blog_article_tag` VALUES (991, 26, 78, NULL);
INSERT INTO `blog_article_tag` VALUES (992, 26, 79, NULL);
INSERT INTO `blog_article_tag` VALUES (993, 27, 71, NULL);
INSERT INTO `blog_article_tag` VALUES (994, 27, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (997, 2, 10, NULL);
INSERT INTO `blog_article_tag` VALUES (998, 2, 64, NULL);
INSERT INTO `blog_article_tag` VALUES (1002, 28, 71, '2024-03-30 18:22:25');
INSERT INTO `blog_article_tag` VALUES (1003, 28, 75, '2024-03-30 18:22:25');
INSERT INTO `blog_article_tag` VALUES (1004, 28, 80, '2024-03-30 18:22:25');
INSERT INTO `blog_article_tag` VALUES (1007, 29, 81, '2024-04-24 22:11:15');
INSERT INTO `blog_article_tag` VALUES (1008, 29, 82, '2024-04-24 22:11:15');
INSERT INTO `blog_article_tag` VALUES (1009, 1, 10, '2024-04-27 18:09:19');
INSERT INTO `blog_article_tag` VALUES (1010, 1, 65, '2024-04-27 18:09:19');
INSERT INTO `blog_article_tag` VALUES (1013, 31, 67, '2024-05-17 00:32:24');
INSERT INTO `blog_article_tag` VALUES (1014, 31, 83, '2024-05-17 00:32:24');
INSERT INTO `blog_article_tag` VALUES (1015, 31, 84, '2024-05-17 00:32:24');

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
INSERT INTO `blog_category` VALUES (16, '默认分类', 0, 0, '2024-03-22 16:07:31', '2024-03-22 16:07:31', 'el-icon-s-management');
INSERT INTO `blog_category` VALUES (32, '博客文档', 0, 0, '2024-02-24 22:06:35', '2024-02-24 22:06:35', 'el-icon-document');
INSERT INTO `blog_category` VALUES (33, '项目详情', 0, 1, '2024-02-24 22:06:35', '2024-02-24 22:13:07', 'el-icon-suitcase');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_feed_back
-- ----------------------------
INSERT INTO `blog_feed_back` VALUES (1, '4', '多语言中文版，创作中的发布讨论文案错误', '多语言中文版，创作中的发布讨论文案错误', NULL, '2024-04-05 14:45:12', 2, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '用户关注表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_followed
-- ----------------------------
INSERT INTO `blog_followed` VALUES (2, '4', '1', NULL);
INSERT INTO `blog_followed` VALUES (7, '11', '1', NULL);
INSERT INTO `blog_followed` VALUES (28, '2', '4', NULL);
INSERT INTO `blog_followed` VALUES (29, '2', '1', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_forum
-- ----------------------------
INSERT INTO `blog_forum` VALUES (1, '4', 1, '我不是原批，我真的不是原批。<img src=\"https://res.wx.qq.com/mpres/htmledition/images/icon/emotion/0.gif\" style=\"vertical-align: middle; margin-left: 2px; margin-right: 2px; height: 25px; width: 25px;\">', '{\"url\": \"https://ys.mihoyo.com\", \"title\": \"原神，启动。\"}', '', '2024-03-14 12:20:51');
INSERT INTO `blog_forum` VALUES (2, '4', 11, '打算对七牛云的文件储存的目录结构进行一些修改，大家有没有什么建议，例如以及目录有那些，二级目录有哪些等', NULL, NULL, '2024-04-24 22:39:09');
INSERT INTO `blog_forum` VALUES (7, '4', 3, '<p>发布小程序版本辰雪博客。</p>', NULL, '', '2024-03-15 12:20:55');
INSERT INTO `blog_forum` VALUES (8, '4', 3, '<p>用宝塔+docket搭建本博客项目所需环境；简讯模块；添加音乐播放模块。</p><p><br></p>', NULL, '', '2024-03-17 00:16:19');
INSERT INTO `blog_forum` VALUES (16, '4', 8, '通过网址浏览本博客时，若使用的是https协议，可能会发现很多图片无法加载出来，这是因为这些图片使用的是http协议，在https协议下无法正常加载http协议内容。后期我会将图片资源更换为https协议，暂时请大家先使用http协议访问本站点，或使用本博客App端或小程序端。<img src=\"https://res.wx.qq.com/mpres/htmledition/images/icon/emotion/9.gif\" style=\"vertical-align: middle; margin-left: 2px; margin-right: 2px; height: 25px; width: 25px;\">', NULL, '', '2024-03-27 15:28:01');

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
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_forum_comment
-- ----------------------------
INSERT INTO `blog_forum_comment` VALUES (1, '2', NULL, 1, '未知', '123.147.251.220', NULL, NULL, '你不是原批？你不是原批谁是原批？你个原批头子！');
INSERT INTO `blog_forum_comment` VALUES (2, '1', '2', 1, '未知', '123.147.251.220', NULL, 1, '请注意文明用语哦，亲！');
INSERT INTO `blog_forum_comment` VALUES (3, '4', '2', 1, '未知', '123.147.251.220', NULL, 1, '急了急了，小黑子急了。');
INSERT INTO `blog_forum_comment` VALUES (4, '4', '1', 1, '未知', '123.147.251.220', NULL, 1, '博主大大快封了“它”的账号。<img src=\"https://res.wx.qq.com/mpres/htmledition/images/icon/emotion/13.gif\" style=\"vertical-align: middle; margin-left: 2px; margin-right: 2px; height: 25px; width: 25px;\">');
INSERT INTO `blog_forum_comment` VALUES (5, '1', '4', 1, '未知', '123.147.251.220', NULL, 1, '这个账号可封不得啊，要是封了，审核员大大就没有账号可以测试了。');
INSERT INTO `blog_forum_comment` VALUES (18, '4', NULL, 2, '中国重庆重庆市', '123.147.245.132', '2024-04-24 22:48:59', NULL, '我的想法是，文件先分为两大类，首先是网站运行必须得文件（基本都是图片，如logo图片等），其次是后期用户自行上传的文件或图片。<div>方案一</div><div>-file（文件，可删除）</div><div>--img（图片类）</div><div>---avatar（头像）</div><div>---web（网站需要）</div><div>---upload（用户后期上传，如文章图片）</div><div>--exe，doc等，暂未想好</div><div>方案二</div><div>-file（文件，可删除）</div><div>--img（图片类）</div><div>---upload（用户后期上传，如文章图片）</div><div>--exe，doc等，暂未想好</div><div>-avatar（头像）</div><div>-web（网站需要）</div><div><br></div>');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_friend_link
-- ----------------------------
INSERT INTO `blog_friend_link` VALUES (4, '辰雪博客', 'http://xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/', 'https://cxblog.qiniu.zhaohaoyue.love/web/9cf1222617fd4fa197991476a53cc883.jpg', '正在努力搬砖~~~~', 'tsuimengchao@aliyun.com', 4, NULL, 2, '2022-12-13 09:16:15', '2022-12-13 09:16:15');
INSERT INTO `blog_friend_link` VALUES (5, '拾壹博客', 'https://www.shiyit.com', 'https://img.shiyit.com/logo11.png', '一个专注技术分享的平台', '1248954763@qq.com', 3, NULL, 2, NULL, '2024-01-26 11:22:17');
INSERT INTO `blog_friend_link` VALUES (6, 'ELADMIN', 'https://eladmin.vip/', 'https://eladmin.vip/logo/small.png', '一个简单且易上手的 Spring boot 后台管理框架', NULL, 2, NULL, 2, NULL, '2024-01-26 11:25:57');
INSERT INTO `blog_friend_link` VALUES (9, '星雨华府', 'http://yc-hequan.com', 'http://image.yc-hequan.com/4e44492e37ec44f2919bbfe80f510676.jpg', '一个专注技术分享的平台', NULL, 0, NULL, 2, '2024-04-29 14:09:51', '2024-04-29 14:09:50');

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
  `create_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_im_message
-- ----------------------------
INSERT INTO `blog_im_message` VALUES ('067d78cb3ae67505c5f690c497ed8fa5', '2', '2', NULL, '恭喜您签到成功', '中国北京北京市', '124.127.68.155', 0, 0, NULL, 5, NULL, 0, NULL, NULL, '2024-05-26 21:47:25');
INSERT INTO `blog_im_message` VALUES ('58d3706446f9a5bbf2174c2747357157', '1', '4', NULL, NULL, '中国重庆重庆市', '123.147.247.115', 0, 1, NULL, 5, 1, 4, NULL, NULL, '2024-04-09 13:18:58');
INSERT INTO `blog_im_message` VALUES ('5a1e325c176cde0f10c73f88c24791b5', NULL, '1', NULL, '111', '中国重庆重庆市', '123.147.249.205', 0, 0, 0, 2, NULL, NULL, NULL, NULL, '2024-04-23 13:45:03');
INSERT INTO `blog_im_message` VALUES ('dc47412464d550f464a7b91fafe363a7', NULL, '1', NULL, '11111', '中国重庆重庆市', '123.147.249.205', 0, 0, 0, 2, NULL, NULL, NULL, NULL, '2024-04-23 14:14:44');
INSERT INTO `blog_im_message` VALUES ('f1b5f36aff7e9a6e9e0befcf2b56a797', '4', '4', NULL, '恭喜您发布了一篇文章', '中国重庆重庆市', '123.147.247.140', 0, 0, NULL, 5, NULL, 0, NULL, NULL, '2024-05-10 14:08:31');
INSERT INTO `blog_im_message` VALUES ('f667dafa7ac9698537efbd9267c4c8a5', '12', '12', NULL, '恭喜您签到成功', '中国广西南宁市', '171.37.74.226', 0, 1, NULL, 5, NULL, 0, NULL, NULL, '2024-04-28 21:27:14');
INSERT INTO `blog_im_message` VALUES ('fb0156ccb95052cdff88423a5ce9e2af', '2', '2', NULL, '恭喜您签到成功', '中国浙江省宁波市', '125.116.47.31', 0, 0, NULL, 5, NULL, 0, NULL, NULL, '2024-04-18 13:31:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_message
-- ----------------------------
INSERT INTO `blog_message` VALUES (2, '原神·启动', '2024-03-15 12:21:56', '崔梦超', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/cmc.png', '123.147.247.111', '未知', 20, 1);
INSERT INTO `blog_message` VALUES (3, 'a', '2024-03-26 01:59:08', '游客', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/66bb121d47e94b89945d29bb6e3e6cab.jpg', '8.210.209.15', '未知', 10, 1);
INSERT INTO `blog_message` VALUES (4, 'a\'s\'d', '2024-05-09 16:31:51', '游客', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/66bb121d47e94b89945d29bb6e3e6cab.jpg', '123.15.36.220', '中国河南省郑州市', 13, 1);
INSERT INTO `blog_message` VALUES (5, 'admin', '2024-06-03 09:46:04', '游客', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/66bb121d47e94b89945d29bb6e3e6cab.jpg', '208.87.243.135', '美国加利福尼亚', 10, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站导航表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_navigation
-- ----------------------------
INSERT INTO `blog_navigation` VALUES (1, 1, '博客园', 'https://www.cnblog_demos.com/', 'http://img.shiyit.com/50708941a28144479fc624e9a84c4773.png', '开发者的网上家园', '2023-08-01 09:00:19', '2023-08-01 09:00:21');
INSERT INTO `blog_navigation` VALUES (2, 1, 'CSDN', 'https://www.csdn.net/', 'http://cxy521.com/static/img/index/tech/csdn.png', '中文最大的技术社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (3, 1, '开源中国', 'https://www.oschina.net/', 'http://cxy521.com/static/img/index/tech/oschina.ico', '目前国内最大的开源技术社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (4, 1, '掘金', 'https://juejin.cn/', 'http://cxy521.com/static/img/index/tech/juejin.png', '一个帮助开发者成长的社区', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (6, 1, '简书', 'https://www.jianshu.com/', 'http://img.shiyit.com/14e0d6d549664ee0a02ba6205fa0bb86.jpg', '创作你的创作', NULL, '2023-08-03 09:02:07');
INSERT INTO `blog_navigation` VALUES (10, 2, 'Cron表达式', 'https://www.matools.com/cron/', 'http://img.shiyit.com/c2408e7dd86d41478bf36c66869966a1.jpg', '在线Cron表达式生成器', '2023-08-03 11:12:31', NULL);
INSERT INTO `blog_navigation` VALUES (11, 7, 'Element UI', 'https://element.eleme.cn/#/zh-CN', 'http://img.shiyit.com/7ea049e2eadb4505b1775cd558cd3d0f.jpg', 'Element，一套为开发者、设计师和产品经理准备的基于 Vue 2.0 的桌面端组件库', '2023-08-03 11:17:58', NULL);
INSERT INTO `blog_navigation` VALUES (12, 7, 'Vue.js', 'https://vuejs.org/', 'http://img.shiyit.com/d0c356bfecc2463aaf1841d4708a222b.png', '渐进式JavaScript框架、流行的前端开发框架！', '2023-08-03 11:19:27', NULL);
INSERT INTO `blog_navigation` VALUES (13, 2, '正则表达式', 'https://tool.oschina.net/regex/', 'http://cxy521.com/static/img/index/tool/oschina.ico', '在线正则表达式测试', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (14, 2, '加密解密', 'https://tool.oschina.net/encrypt', 'http://cxy521.com/static/img/index/tech/oschina.ico', '在线加密解密', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (15, 9, '\r\nIntelliJ IDEA', 'https://www.jetbrains.com/idea/', 'http://cxy521.com/static/img/index/devtool/idea.png', 'Java 最好用的编程工具！', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (16, 9, 'Navicat', 'https://www.navicat.com.cn/download/navicat-premium', 'http://cxy521.com/static/img/index/devtool/navicat.png', '数据库常用客户端工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (17, 9, 'Postman', 'https://www.postman.com/downloads/', 'http://cxy521.com/static/img/index/devtool/apipost.ico', ' 一个支持模拟POST、GET、PUT等常见HTTP请求，支持团队协作，并可直接生成并导出接口文档的API调试、管理工具', '2024-04-24 23:01:40', '2024-04-24 23:01:41');
INSERT INTO `blog_navigation` VALUES (22, 3, 'BOCE', 'https://www.boce.com/', 'http://cxy521.com/static/img/index/webmaster/boce.ico', '网站测速工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (23, 3, '小码短链接', 'https://xiaomark.com/', 'http://cxy521.com/static/img/index/webmaster/xm.png', '短网址跳转工具', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (24, 3, '百度统计', 'https://tongji.baidu.com/web5/welcome/login', 'http://cxy521.com/static/img/index/media/baidu.png', '领先的中文网站分析平台', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (26, 7, 'Vite.js', 'https://vitejs.cn/', 'http://img.shiyit.com/e0145d50d31744a487ff3ffc696fc10e.png', '下一代前端开发与构建工具', NULL, '2023-08-24 16:43:54');
INSERT INTO `blog_navigation` VALUES (27, 7, 'uni-app', 'https://uniapp.dcloud.net.cn/', 'https://qiniu-web-assets.dcloud.net.cn/unidoc/zh/uni-app.png', '领先的跨平台开发框架，一套代码多端使用', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (29, 2, '明月浩空网', 'https://myhkw.cn', 'https://myhkw.cn/static/new/image/myhk.png', '一个免费的网站音乐播放器插件', NULL, NULL);
INSERT INTO `blog_navigation` VALUES (30, 2, '搏天api', 'https://api.btstu.cn/', 'https://blog.btstu.cn/content/templates/fee/static/img/logo.png', '高速稳定免费APi接口调用平台', NULL, NULL);

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
INSERT INTO `blog_say` VALUES ('0a94f04490cbc7923c0562116e908ab4', '4', '', '小程序管局审核通过了，网站审核却还没有...\n小程序上周天初审通过，这周三就管局审核通过了。然而网站是上周四初审通过的...\n粗略完成了简讯模块，后面待修复bug+n', '重庆·南岸', 1, '2024-03-21 00:05:32', NULL);
INSERT INTO `blog_say` VALUES ('29f697a73f202fb0d688b12a6d29e77a', '4', '', '<p>给博客加了个音乐播放器，出现了很奇怪的bug，不过勉强解决了。</p>', '重庆·南岸', 1, '2024-03-22 22:30:46', NULL);
INSERT INTO `blog_say` VALUES ('4dedd895d7663534b807e2bc6bdc3639', '4', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240326_1711430806988.png,', '移动端也能发表说说了，但是目前仅限H5和App端！', NULL, 1, '2024-03-26 13:26:55', NULL);
INSERT INTO `blog_say` VALUES ('622129ac5d0c316ed9a860995cfb14d7', '1', '', '<p>把退出登录的bug解决了，文章显示什么的也正常了，图片存储路径换到了七牛云，其它乱七八糟bug也修复了一下。然后再服务器上提交了最新的。</p><p>向github推送的时候报了上百个错，基本都是代码格式不严谨的错误，这代码错误按理来说不会影响git推送啊，奇怪了。</p><p>酷狗音乐好像会占用8000端口，真的是干的漂亮。沿着8000端口的pid一直向父级杀，结果才杀了三个进程，电脑就白屏了。</p>', '河北·石家庄', 1, '2024-01-27 22:04:52', '2024-07-14 14:35:36');
INSERT INTO `blog_say` VALUES ('67c5546b69afec9b81bb41a70b94be6a', '4', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240322_1711040113823.jpg,', '<p>网站（zhaohaoyue.love）备案终于通过了。</p><p>今天下午去面试，没来的及打印简历，然后重庆路太绕了，找不到路，导致迟到了几分钟。</p><p>面试时有一些问题是真不知道，有些专有名词听都没听过。</p><p>MySQL两种引擎有啥区别;什么情况下会导致SQL索引消失;事务安全是怎么实现的;ioc是什么；spring 动态代理jdk和cglib的区别？</p><p>估计面试可能凉了，不过也不好说，毕竟我面的事3-4k的工作。</p>', '重庆·南岸', 1, '2024-03-22 01:00:18', '2024-03-27 14:32:53');
INSERT INTO `blog_say` VALUES ('6d23a90b44586b515d02085073018be7', '4', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240327_1711475458928.jpg,https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240327_1711475460154.png,https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240327_1711475461142.jpg,', '支付宝小程序审核还真是仔细，每一个功能都得正常。而且怕我不理解它驳回时的文字描述，还附件给我上传了个实录视频。\n提交了八次，被驳回了七次，最后一次终于过审了，到最后没耐心了都开始发癫胡言乱语了。', '重庆·南岸', 1, '2024-03-27 01:51:17', NULL);
INSERT INTO `blog_say` VALUES ('74e9d069e4bad182fa6d6529ecf40ef4', '1', '', '<p>今天中午的时候起来，突然想到昨天Navicat连接不到宝塔的数据库会不会是因为没有在宝塔面板放开防火墙的3306端口，结果一试还真是，还以为只用加服务器安全组规则，没想到宝塔自带防火墙。</p><p>吃午饭时突发奇想，发现把博客前端代码放到二级目录后发现无法正常运行了，奈何当时用的手机，没法调试。</p>', '河北·石家庄', 1, '2024-01-20 22:08:09', '2024-07-14 14:37:19');
INSERT INTO `blog_say` VALUES ('7d942361c018f098c925ad0a4870c268', '1', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240204_1707050237340.png,https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240204_1707050247317.png,', '<p>依旧没弄啥，微博开发者审核通过了，就创建了一个应用。把线上线下数据库同步一下，以后基本都用同一个吧。</p><p>晚上忽然想到上月的个税还没报，登录河北税务下载扣缴端时看到一条未读通知，有点炸裂。</p><p><br></p>', '河北·石家庄', 1, '2024-02-04 20:37:32', '2024-07-14 14:41:34');
INSERT INTO `blog_say` VALUES ('8e3f515b47b2a2c6188a9b6ffc3636cd', '4', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/20240318_1710769881994.png,', '好好好，这么玩是吧！！！', '重庆·南岸', 1, '2024-03-18 21:51:47', NULL);
INSERT INTO `blog_say` VALUES ('9a80d457d215f7813ef75c1369fe4fd2', '1', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/89429c318d9641468586dbb10b6efea9.jpg,https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/1956893dd398497694a97b07d72ebc21.jpg,', '<p>昨天把大二时注册的域名xn--jduy7zg5y.xn--6qq986b3xl赎了回来，所以凌晨的时候就干脆买了一年云服务器，装了个宝塔面板，配了下环境。但是那个mysql用Navicat远程死活连不上，百度了一会也没解决。</p><p>中午下午的时候把那个辰雪博客（根据eladmin和shiyi博客改的）的代码部署了上去，两份代码的融合还有些问题，一些bug也还没处理，所以部署上去后就更多问题了。</p><p>打包springboot项目时还以为环境配置文件会跟vue一样，自动识别切换，结果不是，反复打包测试了几遍才找到原因。😂</p><p>今天在智联招聘遇到了一个很离谱的HR，一上来就要简历，看完啥都没说就标不合适了。倒也不是说我玻璃心接受不了吧，只是确实感觉有点奇葩了。当然也可能是我简历确实不好吧哈哈哈。截图放上面了。</p>', '河北·石家庄', 1, '2024-01-19 22:45:58', '2024-07-14 14:43:35');
INSERT INTO `blog_say` VALUES ('9f217f263aacf75211e75b7bf26017c3', '1', '', '<p>原本打算问一下北站还有客车没，门口两个黑车司机拦住说没了。然后说每人80，一听果断选择打车。打到车后，上车后司机跟我谈价，让我加点，最后谈的130，毕竟下雪了嘛，想着130就130吧。结果到地方平台上计算才82，然后又多走了8公里送到家。补了67，一共150。下雪天，贵点就贵点吧，算了，不计较了。</p><p>雪下的很大，15公分应该有了。</p>', '河北·石家庄', 1, '2024-02-21 21:17:04', '2024-07-14 14:43:56');
INSERT INTO `blog_say` VALUES ('a51b103f11e8103f70210f111df68618', '4', '', '昨晚为了续费服务器，把收费镜像换成了免费公共镜像，结果实例的原云盘被释放了，然后我才意识到数据库还没备份。\n实例快照也无法回滚，只能新建云盘，按量付费需要保证账户余额大于100，充钱并搞了好久之后终于拿到了快照里面的数据，但是数据只到3/4，差了10天，完全没有用了。\n毁灭吧！', '重庆·南岸', 1, '2024-03-15 12:14:18', NULL);
INSERT INTO `blog_say` VALUES ('abd01fd1ef92e450c527615ddfd31fd4', '4', '', '动力不足了，管理端，PC端，移动端，还有后端，都有自己写，精力不足啊', '重庆·南岸', 1, '2024-04-09 12:56:11', NULL);
INSERT INTO `blog_say` VALUES ('bee76cd8eb564ef8885b91d1f141c4fb', '1', '', '<p>修了一些昨天合并时产生的bug，然后把管理界面的按钮权限加上了，现在终于能正常用按钮了，离融合完成更进一步。</p><p>今天不知道为啥，有些头昏头疼。</p><p>两只眼睛视力相差太大了，或许真该配眼睛了，看电脑屏幕时焦点有点向两边发散。</p>', '河北·石家庄', 1, '2024-01-25 21:10:00', '2024-07-14 14:45:49');
INSERT INTO `blog_say` VALUES ('c2776560be035e369e62def7a72a0c04', '1', '', '<p>justoauth报错的问题解决了，把它升级到最新版就没错了，可能低版本和某个库不兼容吧。qq和微博的授权需要审核，就先用gitee的来测试了，遇到一个很奇怪的问题就是用同一个接口查到的数据，数据库内容也都差不多，第三方授权生成的账号就是有些内容为空，明天再研究研究吧。</p>', '河北·石家庄', 1, '2024-01-31 21:41:48', '2024-07-14 14:46:21');
INSERT INTO `blog_say` VALUES ('c670aba58eb23a253f6d42b0d9078e51', '1', '', '<p>原本打算把微信公众号登录搞定，但是遇到了好多奇怪的问题，先是被宝塔日志里面的amp;符号误导，想办法让代码去解析它，然后又是只返回字符串但是报token校验失败的错误。</p>', '河北·石家庄', 1, '2024-02-02 23:53:35', '2024-07-14 14:48:39');
INSERT INTO `blog_say` VALUES ('cbc1de69b4e123fb49992b1cb84da228', '4', '', '抖音和快手开发者平台只能以企业身份认证，“辰雪博客”这个小程序已经被个人占用了，所以只好换“梦辰雪”名称来备案了。\n尝试使用若依微服务版框架和mall4j商城系统微服务版做个商城出来，代码融合比较麻烦。尤其是mall4j的微服务也太微乐吧，简直丧心病狂。', '重庆·南岸', 1, '2024-03-29 00:39:49', NULL);
INSERT INTO `blog_say` VALUES ('ccd2b737c04ff8a2a1f8f382b568c1ae', '4', '', '昨天尝试了一下在宝塔中使用Docker来配置运行环境，发现docker确实简化了不少步骤，只需pull和run两步即可，简易程度不输宝塔面板。\n宝塔面板很方便，Docker也很方便。但是，但是总觉得在宝塔里面安装Docker以及用Docker安装宝塔面板是不是有点多此一举了。\n两者都可以极简的配置运行环境，各有优劣，所以我还是暂时用宝塔吧。', '重庆·南岸', 1, '2024-03-16 21:22:06', NULL);
INSERT INTO `blog_say` VALUES ('fec6ecd3731cefec405eebf20afa15e1', '1', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/{CB0FDE60-B092-48c7-B666-911B5BF242E2}.png,https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/say/{D431A9CA-E81D-4658-8233-C6559FE568EC}.png,', '正如这个图片的目录结构，我把本网站的图片等文件资源的目录结构做出了修改。\n目录结构如下：\n-files（根目录）\n--avatar（头像资源）\n--web（网站基础资源）\n--file（其它资源根目录）\n---doc\n---img（图片类资源）\n----static（静态资源）\n----upload（用户上传）\n-----article（文章中上传）\n-----say（说说中上传）\n--download\n---package\n----exe\n----apk\n以上仅供参考，大致目录结构暂定为以上。', '重庆·南岸', 1, '2024-04-26 17:32:03', '2024-04-26 17:35:01');

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
INSERT INTO `blog_sign` VALUES ('14e7dba88a92c67e49a149fd5268c5e6', '2', '2024-04-18');
INSERT INTO `blog_sign` VALUES ('4a92f2954cda450d7f287c075b7f1ca8', '2', '2024-05-26');
INSERT INTO `blog_sign` VALUES ('69f0562db5a5e5b83bb4675132d2c5a0', '4', '2024-03-17');
INSERT INTO `blog_sign` VALUES ('7006ca19d4ff43d6e570d460e571874e', '12', '2024-04-28');
INSERT INTO `blog_sign` VALUES ('8657162528906ca300a602568589866a', '2', '2024-03-23');
INSERT INTO `blog_sign` VALUES ('8f47c64a2ee0eb5fe5d96255434d6e99', '2', '2024-03-22');
INSERT INTO `blog_sign` VALUES ('9d146e810124317f783695a0b1d9fb41', '4', '2024-02-27');
INSERT INTO `blog_sign` VALUES ('d7bf9186cd48860884bd6564df111c4e', '2', '2024-03-22');
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
INSERT INTO `blog_system_config` VALUES (2, '', '', 'z2', 'mcx-blog', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl', '1', '1', '1', '2021-11-26 15:41:36', '2021-11-26 15:41:36', '1', '欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~\n\n博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。\n\n项目源码：[点我传送](https://gitee.com/TsuiMengchao/cxblog)，项目官网：[点我传送](http://辰雪博客.赵浩悦.我爱你)\n\n项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈\n\n欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）\n|支付宝|微信|\n|-|-|-|\n|![支付宝](https://cxblog.qiniu.zhaohaoyue.love/web/alipay.jpg)|![微信](https://cxblog.qiniu.zhaohaoyue.love/web/wxpay.jpg)|\n', '<p>欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n<p>博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。</p>\n<p>项目源码：<a href=\"https://gitee.com/mcxgitee\" target=\"_blank\">点我传送</a>，项目官网：<a href=\"http://www.mcx.com\" target=\"_blank\">点我传送</a></p>\n<p>项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈</p>\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps… 小伙伴赞赏的时候可以备注一下下~）</p>\n<table>\n<thead>\n<tr>\n<th>支付宝</th>\n<th>微信</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"\" alt=\"支付宝\" /></td>\n<td><img src=\"\" alt=\"微信\" /></td>\n</tr>\n</tbody>\n</table>\n', 1, 'smtp.qq.com', '', '', 587, 1, 'http://localhost:80/img/', 1, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES (10, '博客', 679, 9, '2021-11-12 14:43:27', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (64, '简历', 0, 0, NULL, '2024-02-24 22:10:43');
INSERT INTO `blog_tags` VALUES (65, '项目', 0, 0, NULL, '2024-02-24 22:10:53');
INSERT INTO `blog_tags` VALUES (66, 'Linux', 0, 0, NULL, '2024-03-22 01:01:14');
INSERT INTO `blog_tags` VALUES (67, 'Docker', 0, 0, NULL, '2024-03-22 01:01:38');
INSERT INTO `blog_tags` VALUES (68, 'Java', 0, 0, NULL, '2024-03-22 01:02:07');
INSERT INTO `blog_tags` VALUES (69, 'Spring Boot', 0, 0, NULL, '2024-03-22 01:02:19');
INSERT INTO `blog_tags` VALUES (70, 'ThreeJs', 0, 0, NULL, '2024-03-22 01:02:30');
INSERT INTO `blog_tags` VALUES (71, 'Vue', 0, 0, NULL, '2024-03-22 01:03:08');
INSERT INTO `blog_tags` VALUES (72, 'Mysql', 0, 0, NULL, '2024-03-22 01:03:18');
INSERT INTO `blog_tags` VALUES (73, 'git', 0, 0, NULL, '2024-03-22 15:58:10');
INSERT INTO `blog_tags` VALUES (74, 'idea', 0, 0, NULL, '2024-03-22 15:58:11');
INSERT INTO `blog_tags` VALUES (75, 'vue.js', 0, 0, NULL, '2024-03-22 21:46:25');
INSERT INTO `blog_tags` VALUES (76, 'vue-router', 0, 0, NULL, '2024-03-22 21:46:25');
INSERT INTO `blog_tags` VALUES (77, '微服务', 0, 0, NULL, '2024-03-27 14:32:13');
INSERT INTO `blog_tags` VALUES (78, 'MyBatisPlus', 0, 0, NULL, '2024-03-27 15:42:57');
INSERT INTO `blog_tags` VALUES (79, '自动填充', 0, 0, NULL, '2024-03-27 15:42:57');
INSERT INTO `blog_tags` VALUES (80, '前端', 0, 0, '2024-03-30 17:40:57', '2024-03-30 17:40:56');
INSERT INTO `blog_tags` VALUES (81, 'Markdown 实用指南', 0, 0, '2024-04-24 22:04:34', '2024-04-24 22:04:34');
INSERT INTO `blog_tags` VALUES (82, 'markdown', 0, 0, '2024-04-24 22:04:35', '2024-04-24 22:04:34');
INSERT INTO `blog_tags` VALUES (83, 'Nacos', 0, 0, '2024-05-17 00:32:24', '2024-05-17 00:32:24');
INSERT INTO `blog_tags` VALUES (84, 'SpringCloud', 0, 0, '2024-05-17 00:32:24', '2024-05-17 00:32:24');

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '话题圈子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_talk
-- ----------------------------
INSERT INTO `blog_talk` VALUES (1, '原神', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (2, '未来规划', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (3, '已完成规划', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (4, '前端', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (5, '后端', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (6, '王者荣耀', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (7, '简讯', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (8, 'Bug', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (9, '慈善', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (10, '红十字会', NULL, 1, NULL);
INSERT INTO `blog_talk` VALUES (11, '意见征集', NULL, 1, '2024-04-24 22:28:37');

-- ----------------------------
-- Table structure for blog_tipsoon
-- ----------------------------
DROP TABLE IF EXISTS `blog_tipsoon`;
CREATE TABLE `blog_tipsoon`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'id',
  `user_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户id',
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `site` json NULL COMMENT '关联网页信息',
  `img_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联图片地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子话题表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tipsoon
-- ----------------------------
INSERT INTO `blog_tipsoon` VALUES ('03032a253b130622137fe418cfa2d97e', '1', '<p><span style=\"color: rgb(25, 27, 31); background-color: rgb(255, 255, 255); font-size: 15px;\">清溪浅水行舟；微雨竹窗夜话；暑至临溪濯足；雨后登楼看山；柳荫堤畔闲行；花坞樽前微笑；隔江山寺闻钟；月下东邻吹箫；晨兴半柱茗香；午倦一方藤枕；开瓮勿逢陶谢；接客不着衣冠；乞得名花盛开；飞来家禽自语；客至汲泉烹茶；抚琴听者知音。</span></p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710989070284.jpg', '2024-03-21 10:44:43', '苏东坡：人生赏心十六件乐事');
INSERT INTO `blog_tipsoon` VALUES ('0b436618e560f7bbf7e75c737d01ca4b', '1', '<p>不知你在访问网站时，是否遇到过 451 Not Found 网页打不开的错误代码状态呢？你可能知道 404 Not Found 代表网页没找到，403 Forbidden 代表网页拒绝访问，那么451呢？其实，451 Not Found 是一种新的网页 HTTP 状态错误代码，它是互联网工程指导委员会（IESG）正式批准的一种新的 HTTP 错误代码“451”，用来代表“因法律原因而被官方审查”而拒绝访问的内容。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039779754.png', '2024-03-22 00:50:03', '网站访问中的“451错误”');
INSERT INTO `blog_tipsoon` VALUES ('0f0283aaf66c7c81a47ac5b0d82093a3', '1', '<p>有人说，人生本来就是从一个迷茫到另一个迷茫的不断摸索前进的过程。你总觉得眼下是最难熬的，可是，仔细回想一下，其实在你的生命当中，你已经跨过了无数次，当时觉得过不去的坎。行动是迷茫的解药。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039195282.png', '2024-03-22 00:40:05', '谁的人生不迷茫');
INSERT INTO `blog_tipsoon` VALUES ('0f3570c2c5f8b214933e57d5c5337c6a', '1', '<p>社交高手的正确姿态是：“冷读”和“热捧”，仔细观察对方的特点（冷读），并适时赞扬（热捧）。在满足对方被重视需求的同时，展示你的善意，制造愉悦感。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990986804.png', '2024-03-21 11:16:35', '冷读和热捧');
INSERT INTO `blog_tipsoon` VALUES ('143f2787df9854c52b9e56d69a82727a', '1', '<p>所谓的“他人即地狱”，是萨特在剧本「禁闭」（No Exit）中最常被引用也最常被误解的一句台词。萨特本人解释道，他并不是笼统的指我们与他人的关系时刻都是坏透了的，实际上自我选择可以决定自我存在，当然也可以获取自由。其实，“他人就是地狱”主要有三层意思。首先，如果你不能正确对待他人，那么他人便是你的地狱。其次，如果你不能正确对待他人对你的判断，那么他人的判断就是你的地狱。第三，如果你不能正确对待自己，那么你也是自己的地狱。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710987853227.jpg', '2024-03-21 10:24:23', '他人即地狱');
INSERT INTO `blog_tipsoon` VALUES ('17c00116bc9e9cfb4f9e21ea0ab32b94', '1', '<p>我们心底多少都可能曾有过一些“搞事情”的疯狂想法：下雨天想冲出去跑步；逛着超市的时候想用手伸进各种米缸搅几下；站在楼顶天台，无端端就想大喊一声 “Ahhhhhhh-hh!”尽管我们可能不会实现，但这些类似的冲动统称为“薄荷时刻”。薄荷小小的，辛辣又有点刺激，一瞬间能让你清醒不少，用来形容那些“突兀却未遂的野性小念头”十分贴切。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711038515030.png', '2024-03-22 00:28:40', '你遇到过“薄荷时刻”吗？');
INSERT INTO `blog_tipsoon` VALUES ('1a2b24a5f53e131f0e62d694407a6d3d', '4', '<p>诗人卞之琳在《断章》中写到：“你站在桥上看风景，看风景的人在楼上看你。明月装饰了你的窗子，你装饰了别人的梦。”生活中，我们常常成为别人眼中的风景，也欣赏着别人带给我们的风景。这种相互关联和互动，构成了我们丰富多彩的生活。</p>', NULL, NULL, NULL, '生活中的风景');
INSERT INTO `blog_tipsoon` VALUES ('1b35b493ab2b16593d201ce614fd77f1', '1', '<p>风从我们身边掠过捎来不知何处的落寞流泪之后的天空，格外澄澈…… 这首歌是新海诚动画电影「你的名字。」的片尾曲，原唱是 RADWIMPS，本首歌由女生翻唱，光是空灵的前奏就足够让你醉了。</p>', NULL, '', '2024-03-21 10:26:05', 'なんでもないや 没什么大不了');
INSERT INTO `blog_tipsoon` VALUES ('1c17e8f7c1a2b95636e877f1950b6a90', '4', '<p>古人常说：“读万卷书，行万里路。”这句话道出了读书与旅行的双重意义。读书可以让我们汲取知识，拓宽视野；而旅行则可以让我们亲身体验不同的风土人情，增长见识。当我们把读书与旅行结合起来，便能够更全面地认识这个世界，丰富自己的人生经历。</p>', NULL, NULL, NULL, '读书与旅行');
INSERT INTO `blog_tipsoon` VALUES ('1d6a258e8f72c9009916439831747ae2', '1', '<p>对于未成年犯罪的刑事责任年龄认定，世界上的法律大体可以分为两类：“乐观派”和“现实派”。“乐观派”主张某个标准年龄下（如 14 岁）的孩童没有控制和辨别能力，可以通过矫正使他们恢复理性和纯良。“现实派”认为人性中包含阴暗成分（不分年龄），惩罚应优先于矫正。世界上多数国家的最低刑事责任年龄是 12 岁或 14 岁，但总的来说区间起伏很大，7 岁到 21 岁都有。此外，英国之前还实行了“恶意补足年龄规则”（如果证明主观上是“恶意”的，则需负刑事责任）。我国对于未成年犯罪是“依法惩戒和教育挽救相结合，宽容不纵容”，如 2023 年检察机关受理审查起诉未成年人犯罪 9.7 万人。此外，我国刑法修正案（十一）已将未成年人刑责年龄下调至 12 岁。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990760004.png', '2024-03-21 11:12:50', '少年与恶的距离');
INSERT INTO `blog_tipsoon` VALUES ('1e08dbee6258802c838d4594e71ea07f', '1', '<p>祛魅，是马克斯·韦伯提出的，也可以叫做“世界的祛魅”，这个词字面的意思就是“世界被祛除了神秘性、魅惑性”。通俗来讲，“祛魅”就是用理性的力量驱散了神秘的魅惑，就是说人对自然世界的认识发生了改变，以前人对自然的认识中有一种神秘性，后来被祛除了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710991124570.png', '2024-03-21 11:18:54', '什么是“祛魅”？');
INSERT INTO `blog_tipsoon` VALUES ('1e8963a24b80837092e11d2e3e1189e3', '4', '<p>小时候，我们总以为日子会很长，长到可以肆意挥霍。长大后，却发现时光如流水，一去不复返。于是，我们开始怀念那些无忧无虑的日子，怀念那个纯真的自己。然而，生活总是充满了变数，我们无法预知未来，也无法回到过去。我们能做的，就是珍惜现在，把握每一个当下，让生活更加充实和美好。</p><p>时光荏苒，岁月如梭。让我们珍惜每一刻，活出真实的自己。</p>', NULL, NULL, NULL, '珍惜现在，把握当下');
INSERT INTO `blog_tipsoon` VALUES ('1eb526fcd26cd2bf07646f3e9e7432d4', '1', '<p>第一种方法：先用舌头顶着上颚，然后维持一秒后松开。舌头一放松，就立刻用食指和中指轻点双眉之间的位置，微微用力按。重复这两个动作，大概做20秒。严重鼻塞的鼻子就会立刻顺畅了。第二种方法：先深吸一口气，然后将头微仰，捏住鼻子屏住呼吸。等到憋不住时放开手，鼻子就会神奇的通了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710953945236.jpg', '2024-03-21 00:59:17', '20秒通鼻让你呼吸畅通！');
INSERT INTO `blog_tipsoon` VALUES ('1f7d6af5ceb730f70cb6438576fadbde', '1', '<p>1.坐直身体。这样可调用很多肌肉群。2.多喝水。喝水可提高30%的能量消耗，并持续近1个小时，还能减少对零食的依赖。3.收紧腹肌。开始时每次收紧10到15秒，每天尽可能多做几次，收紧的时间也逐渐延长。4.伸直腿。双手撑住椅子，抬起双腿至与地面平行，保持几秒钟，然后放松，每天重复十余次。5.提肛。有节奏的收缩臀部，每次收缩十秒，然后放松即可。6.用腹部呼吸。腹吸也是吐纳的一种，不仅能缓解压力，也能促进新陈代谢，减压又减肥。7.拉伸。握紧拳头举过头顶，向上慢慢展开手掌，然后身体轮流向左右两侧弯曲，每次坚持20至30秒。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710989000221.png', '2024-03-21 10:43:31', '坐班时燃烧卡路里的小技巧！');
INSERT INTO `blog_tipsoon` VALUES ('2019a77a27436194467b9549c2913669', '4', '<p>静谧的午后，阳光透过窗帘的缝隙洒落在地板上，形成斑驳的光影。我独自坐在窗边，手中捧着一本泛黄的旧书，耳边传来窗外鸟儿的歌唱。这一刻，时间仿佛静止了，我沉浸在书的世界里，感受着文字带来的魅力。</p>', NULL, NULL, NULL, '午后的阅读时光');
INSERT INTO `blog_tipsoon` VALUES ('212d54ace5202add9622d68896ca37af', '1', '<p>在阅读英文文章时，偶尔会发现有小标题显示 TL;DR 或者 tl;dr。网上英文解释有两种，一种是Too long;Don\'t read，另一种是To-o long;Didn\'t read。意思是：“文章太长了，读不下去了”。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988000168.jpg', '2024-03-21 10:26:49', 'TL;DR');
INSERT INTO `blog_tipsoon` VALUES ('22302755661f23c153499b6e43575e9d', '4', '<p>茶，是中国传统文化中的重要组成部分，也是人们日常生活中不可或缺的饮品。无论是清晨的第一缕阳光，还是傍晚的最后一抹余晖，一杯热茶总能给人带来温暖和宁静。茶叶在水中慢慢舒展，释放出淡淡的香气，仿佛诉说着千年的故事。品茶，不仅是一种生活方式，更是一种文化的传承和体验。', NULL, NULL, NULL, '茶，千年的故事');
INSERT INTO `blog_tipsoon` VALUES ('2286d2ab2123b2ab3917e1e3694078bf', '1', '<p>心理学家 米哈里齐克森·米哈里 发现一种将个人精神力完全投注在某种活动上的感觉，称之为「心流」，英文叫 flow，心理学上把“心流”口语化地叫做 the zone，它产生时同时会有高度的兴奋及充实感。要想达到心流状态不太容易，但处于这种状态是件美妙的事情。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710987785821.png', '2024-03-21 10:23:17', '体验过「心流」的状态吗？');
INSERT INTO `blog_tipsoon` VALUES ('22b95670eac3e800d9068b8ace7c27f7', '1', '<p>在 2016 年，麦吉尔大学的研究人员发现，在雪花降落在地球上的过程中，它们吸收了有毒的汽车尾气、致癌物等空气中的污染物。大多专家都同意少量吃一点儿雪并不会产生什么影响。但是，请记得，那些漂亮的雪花里含的是有几百种污染物的水。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039252616.png', '2024-03-22 00:41:26', '吃雪，其实是件挺恶心的事儿');
INSERT INTO `blog_tipsoon` VALUES ('230ec130fbbbe086d92d0e885bb0f156', '1', '<p>地球上的黄金是在很久以前通过中子星碰撞得来的。对于黄金数量，曾有科学家预估，地球内部储存有接近 4 亿亿吨黄金，但它大部分位于地核中，不好开采，目前已探明的黄金储量约 10 万吨左右。而黄金珍贵的原因也在此，即储量大但开采难，以及用途广泛。除了用于投资理财、国家储备、首饰业、电子业、军事领域外，中世纪欧洲贵族还会食用黄金粉末和薄片，而医疗卫生领域的胶体金可以应用于病毒检测、受孕检测……此外，理论上有含金量 100% 的纯金，但由于提炼技术和加工过程损耗等问题现实中没有 100% 的黄金，我国规定含量 ≥99.6% 的黄金才能称为 24K 金。而且黄金并不是最贵的金属，比如“锎”（kāi）的金属价值每克 2500-2700 万美元，比黄金贵 65 万倍。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710954740819.png', '2024-03-21 01:12:27', '来自“天外来客”的礼物');
INSERT INTO `blog_tipsoon` VALUES ('2365e488c1c29315357365c2713960a5', '4', '<p>每个人的人生都是一部独特的剧本，充满了起伏和转折。我们既是自己人生的导演，也是主角。在这个舞台上，我们扮演着各种角色，经历着各种挑战和机遇。有时候，我们会遇到困难和挫折，但正是这些经历塑造了我们的性格，让我们变得更加坚强和成熟。所以，无论人生如何起伏，我们都要保持积极的心态，勇敢地面对每一个挑战，创造属于自己的精彩人生。</p>', NULL, NULL, NULL, '我们既是自己人生的导演，也是主角');
INSERT INTO `blog_tipsoon` VALUES ('25266e665ace436fb70d665ef8f9b844', '1', '<p>黑耳是一款带有“治愈”属性的匿名 LBS 时空语音 App，上线以来获得了很多认可。如果您身处迷茫，可以听听同龄人每一天的生活；如果您春风得意，也可以讲述自己的心情，记录这一时刻。语音将会和时间、空间绑定，若干年后，故地重游，感受奇妙的时空体验。目前所有应用商店已经开放下载，搜索“黑耳”即可下载。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990802851.jpg', '2024-03-21 11:13:33', '简讯第二款口碑产品：黑耳™️');
INSERT INTO `blog_tipsoon` VALUES ('255be1460291911a6e2e12f833d15f2e', '1', '<p>所谓的运营并不是指的多么牛X的想法或者创意，而是你打算用多少资源，在什么时间内，达成怎样的目标。回答好这三个问题就够了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990873215.png', '2024-03-21 11:14:42', '运营的真实含义');
INSERT INTO `blog_tipsoon` VALUES ('2f5fc605b16c8962ed82bf19974e83a7', '1', '<p>血液是生命的源泉，不能人工合成，不可替代。临床上对血液的需求量很大，尤其是外科手术、事故和产科患者等。全球每年大约有 1.185 亿次献血总量，其中包括自愿无偿献血者、家属/替代献血者和有偿献血者。全球大部分国家和地区，严格实行无偿献血制度（如英国、德国等），有偿采集血浆属于违法行为。而在美国“每人每周允许‘捐献’血浆 2 次”（每次报酬在 35-65 美元）。献血可分为献全血（间隔期六个月）和成分血（间隔期两周）。献出的血液需要通过严格的安全和健康检测，才能使用。因为受不健康的生活方式影响和采集、运输环节可能出现问题等，每年的献血报废血量数量较大，它们会被视为医疗垃圾统一销毁。2023 年全年，我国无偿献血人数为 1699.2 万人次。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711037908423.png', '2024-03-22 00:18:37', '传递生命之爱');
INSERT INTO `blog_tipsoon` VALUES ('2fcce64099741dfebffa7bba307a845f', '1', '<p>在人们的印象中，猫一直是种懒散温良的动物，但 2020 年一篇论文中提到的“流浪猫每年杀害近百亿野生动物”，让人开始重新审视起猫来。但这份由问卷调查得来的数据，遭到了许多质疑。国外对流浪猫的研究较为久远，2023 年「自然-通讯」发表的一项研究发现，全球散养的家猫会捕食 2000 多种动物，含数百濒危物种。其实这也是人类干预的结果，他们将其引入世界各地。而那些因遗弃、走失、繁殖而产生的流浪猫经常会面对来自人类和自然的风险（虐杀或冻死）。同时，人们也在积极地应对流浪猫问题，如规定弃养宠物者的侵权责任；高校成立专门的关爱流浪动物组织；街头出现了带摄像头的流浪猫“安全屋”……</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710991156572.png', '2024-03-21 11:19:29', '无家可归的猫');
INSERT INTO `blog_tipsoon` VALUES ('316fd2f9b502fa6c8b3df139415e93dd', '1', '<p>哲学家泰勒斯正在抬头看星空，预言第二天会下雨时，没注意到脚下有一个坑，不慎掉入。别人把他救起来，他对那个人说：“明天会下雨。”于是出现了一个关于哲学家的笑话，即哲学家是只知道天上的事情而不知道脚下发生什么事情的人。但是两千年以后，黑格尔说：“只有那些永远躺在坑里从不仰望高空的人，才不会掉进坑里。”后来王尔德说：“我们都生活在阴沟里，但仍有一些人还在仰望星空”。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710987737748.png', '2024-03-21 10:22:29', '你会抬头仰望星空吗？');
INSERT INTO `blog_tipsoon` VALUES ('322e17f8dfd5705772b3d8fb858bccfa', '1', '常常听人说：“没文化，真可怕”。可“文化”到底是什么呢？看到网上一个很靠谱的解释，说文化可以用四句话表达：根植于内心的修养；无需提醒的自觉；以约束为前提的自由；为别人着想的善良！ ', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988926635.png', '2024-03-21 10:42:17', '文化是什么？');
INSERT INTO `blog_tipsoon` VALUES ('322fb665ca52624809108e862f08ddcf', '1', '<p>荷式开车门，即用离车门最远的那只手开车门，也就是左驾用右手开，右驾左手开，据说是荷兰人发明的。当你换成离车门较远的那只手开门时，你的上半身会自然而然地转动，头部和肩膀就会很自然地向外看。首先，眼睛会通过后视镜观察，然后转身的时候向后看，这一个完整的动作就能避免很多不必要的事故发生，无论后面来的是单车还是机动车。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988528901.jpg', '2024-03-21 10:35:39', '多一个动作，少一分危险！');
INSERT INTO `blog_tipsoon` VALUES ('3a5573a5e53c16e965932555f3e1b89f', '4', '<p>夜深人静，独坐窗前，一盏清茶，几本书卷。月光如水洒满庭院，微风轻拂，树影婆娑。此刻的我，心如止水，神游物外，享受着这难得的宁静与安详。书中自有黄金屋，书中自有颜如玉，书中更有那无尽的智慧与启迪。每一页翻过，都是一次心灵的旅行，每一次阅读，都是一次思想的升华。</p>', NULL, NULL, NULL, '夜读，心灵的旅行');
INSERT INTO `blog_tipsoon` VALUES ('3e6cde7986bfbc91f2794803460df887', '1', '<p>哈佛大学医学院的研究表明，如果设置多个闹钟，比如隔 5 分钟就设定一个闹钟，持续多个闹钟，人在反复惊醒之后再睡下，可能会导致慢性疲劳。因为被闹钟反复惊醒后，人体就会分泌一种名为“腺苷”的化合物。腺苷含量上升会使人感到愈加困倦，反而更容易陷入睡眠和觉醒之间的循环，难以完全清醒。这也可能导致按掉闹钟后再眯几分钟，结果一睁眼却已经是几个小时之后了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039449792.jpg', '2024-03-22 00:44:41', '多个闹钟可能导致慢性疲劳');
INSERT INTO `blog_tipsoon` VALUES ('3j7k5s8n1r9w2d6', '4', '黑暗能量是宇宙中最神秘的存在之一，占据了宇宙总能量的约70%。它推动着宇宙的加速膨胀，但我们对其性质和起源了解甚少。\r\n\r\n科学家们正致力于研究黑暗能量。他们提出了各种理论，但仍未达成共识。黑暗能量的解密将深化我们对宇宙本质的理解。\r\n\r\n黑暗能量的发现提醒着我们，宇宙中仍有许多未知等待探索。无论是通过科学还是哲学、艺术，我们都能揭示宇宙的奥妙。\r\n\r\n让我们怀着好奇心和敬畏之心，踏上探索之旅，追寻宇宙的奥秘。在宇宙的辽阔中，我们将发现无限的惊喜和启示。', NULL, 'https://th.bing.com/th?id=OIP.U4P0-6m5IOl7mNPMjyENGwHaFM&w=298&h=209&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2', '2024-04-02 15:09:58', '黑暗能量：宇宙的奥秘');
INSERT INTO `blog_tipsoon` VALUES ('4b3078d571f0f6f4b97f99579e3745f0', '4', '<p>生活中，我们常常会遇到各种选择。有时候，选择似乎并不难，但有时候，它却像一座迷宫，让人迷失方向。其实，选择的真谛并不在于结果的好坏，而在于我们是否真正了解自己，是否清楚自己的内心所求。真正的选择，是听从内心的声音，不被外界所左右，不随波逐流，坚定地走自己的路。</p>', NULL, NULL, NULL, '选择的真谛');
INSERT INTO `blog_tipsoon` VALUES ('5661870204baad13e20d0d7e836f48a2', '1', '<p><span style=\"color: rgb(25, 27, 31); background-color: rgb(255, 255, 255); font-size: 15px;\">螃蟹在剥我的壳，笔记本在写我，漫天的我落在枫叶上雪花上，而你在想我。这句话有三层意思。第一层，螃蟹不可能在剥我的壳，笔记本不可能在写我，我不可能落在枫叶上雪花上，而你不可能在想我。第二层，是我在剥螃蟹的壳，是我在写笔记本，是枫叶和雪花落在我身上，是我在想你。第三层，除非世界颠倒你才会爱上我。</span></p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710989328509.jpg', '2024-03-21 10:49:06', '武汉大学三行情书冠军作品');
INSERT INTO `blog_tipsoon` VALUES ('5a1f2e09d709d29f9f41802a03b1e9d2', '4', '<p>记得小时候，每当夏天的傍晚，我总喜欢躺在院子的竹椅上上，仰望星空。那时的夜空，星星点点，璀璨夺目，仿佛有无数的故事在闪烁。如今，虽然生活在繁华的都市，但那份对星空的向往与憧憬，却从未改变。每当夜幕降临，我仍会寻找那片属于自己的星空，让心灵在其中自由翱翔。</p>', NULL, NULL, NULL, '星空下的遐想');
INSERT INTO `blog_tipsoon` VALUES ('5c01499c99cd2a2a494c6e42ef23a894', '1', '我们不喜欢长篇大论，讨厌标题党，所以「简讯」的内容都是开门见山说重点。这里没有娱乐八卦，只有致用类知识和经验，能在关键时刻助您决策。我们鼓励广泛涉猎，因此「简讯」的内容没有分类，没有大数据预判，目的是让您跳出信息茧房，变得见多识广。简讯的知识很多，但不需要牢记，而是在遇到对应问题时，脑海中有个印象，能够多一个思路。现在，开始阅读吧。', '{\"url\": \"https://www.tipsoon.com\", \"title\": \"简讯官网\"}', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/30a438b512ca8751fa32f5d4a103f7f.jpg', '2024-03-20 13:40:27', '感谢使用 简讯™️ TIPSOON™️');
INSERT INTO `blog_tipsoon` VALUES ('5e8663e9d6628dc649e7e83096667baa', '1', '<p>瑞典卡罗林斯卡医学院一项新研究表明，盖上厚实的被子或毛毯，不仅在一个月内显著改善部分人的睡眠状况，甚至一年内治愈了大多数失眠患者，还能减轻抑郁和焦虑症状。研究人员认为，厚重的被子施加在身体不同部位的压力会刺激触觉、肌肉和关节，类似按摩穴位的感觉。因为深层压力刺激增加自主神经系统副交感神经兴奋，同时降低交感神经兴奋，被认为具有镇静作用，可帮助放松身体。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710953729963.jpg', '2024-03-21 00:55:40', '你盖的是厚被子吗？');
INSERT INTO `blog_tipsoon` VALUES ('63bdbdd880a0213e9ffb8f75f9dbd7a6', '1', '<p>一、开头用一个大多数人会经常遇到的小场景；二、用具体化的描写代替形容；三、多举例而少讲道理；四、用倒叙的方式制造悬念；五、多用短句来提高阅读快感；六、删除重复表达以及可有可无的字；七、抛出固有的观念后话锋一转戳中人心。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710954170216.png', '2024-03-21 01:03:03', '写文章的七个技巧');
INSERT INTO `blog_tipsoon` VALUES ('6904a2c3c62021bdb5f6e67f4ddc1e77', '1', '<p>接绳结是一种用于连接两条粗细及材质不同的绳索的结。是最古老的一种结。它的特点是打法简单，结实可靠，而且十分容易拆解。可以用来连接材质、粗细不同的绳索。具体连接方法如上图所示，这是一种非常实用的技能，学会以后随处都会用到。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988079521.jpg', '2024-03-21 10:28:10', '将两根绳子牢固地连在一起');
INSERT INTO `blog_tipsoon` VALUES ('6e4d231f46d6b54a98765e3420cb89a7', '4', '<p>清晨的第一缕阳光洒进窗台，我轻轻推开窗户，迎接着新的一天。空气中弥漫着清新的气息，鸟儿在枝头欢快地歌唱。这一刻，我感受到了生活的美好，也明白了每一个清晨都是一个新的开始，一个充满希望和梦想的开始。</p>', NULL, NULL, NULL, '清晨的希望');
INSERT INTO `blog_tipsoon` VALUES ('6q4r8e2w1t7y5u9', '4', '量子世界是一片神秘而令人着迷的领域。在这个微观的奇观中，粒子以非凡的方式舞动着，违背了我们所熟悉的经典物理规律。\r\n\r\n量子力学揭示了微观世界的本质，展现出粒子的奇特性质。量子叠加、量子纠缠、量子隧道效应等现象挑战着我们对现实的直觉。在这个世界里，粒子可以同时存在于多个位置，瞬间传递信息，甚至穿过看似不可能的障碍。\r\n\r\n科学家们不断进行实验和研究，以更深入地理解量子世界。量子计算、量子通信、量子加密等领域正日益发展，为我们带来了前所未有的机遇和挑战。\r\n\r\n量子世界的探索不仅仅是科学的领域，也触动着哲学和人类的思考。它引发了关于现实的本质和意识的起源等深刻问题，挑战着我们对世界的认知。\r\n\r\n让我们沉浸在这个微观世界的神秘舞蹈中，感受粒子的非凡表演。尽管量子世界充满了未知，但我们的好奇心和勇气将驱使我们继续探索，揭开宇宙的微观奥秘。', NULL, 'https://plus.unsplash.com/premium_photo-1671209878105-d1111b878aad?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8JUU2JThBJUJEJUU4JUIxJUExJUU3JTlBJTg0JUU5JTg3JThGJUU1JUFEJTkwJUU1JTlCJUJFJUU1JTgzJThGfGVufDB8fDB8fHww', '2024-04-02 15:10:04', '微观奇观：量子世界的神秘舞蹈');
INSERT INTO `blog_tipsoon` VALUES ('70783d63ab7a91611b776ddd5f6354dc', '1', '<p>现代医学证明，直系血亲间输血有时会发生一种严重的输血反应，称为输血相关移植物抗宿主病（GVHD），这种输血反应尽管发病率很低，但死亡率却高达 99.9%，一旦发生几乎无法挽救。所以，很多电视剧里的那些情节其实都在误导人。根据中国输血协会网站上的介绍，目前虽然可以通过“血液辐照”的处理技术，把这种具有免疫活性的淋巴细胞灭活，但是临床上仍不建议直系血亲之间输血。</p>', '{\"url\": \"https://www.csbt.org.cn/plus/view.php?aid=10810\", \"title\": \"参考资料\"}', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710991062771.png', '2024-03-21 11:18:11', '直系血亲之间不能直接输血！');
INSERT INTO `blog_tipsoon` VALUES ('7215ced593727d741e66218c3b9d0477', '1', '<p>这一句话出自山姆·麦克布雷尼的童书「猜猜我有多爱你」：小兔子看见了黑沉沉的夜空，没有什么能比天更远了。它说：“我爱你一直远到月亮那里”。说完它闭上了眼睛。大兔子说：“哦，那真是很远，非常非常的远”。它把小兔子放到用树叶堆起来的床上，低下头来亲吻小兔子，对它说晚安。然后它躺在小兔子的身边，带着微笑轻声地说：I Love you, to the moon, and back .（我爱你，一直远到月亮那里，再从月亮回到这里）。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710954060322.png', '2024-03-21 01:01:13', 'Love you, to the moon, and back.');
INSERT INTO `blog_tipsoon` VALUES ('73df48949687699ec6a1272050dce32c', '1', '<p>我国第一家旅行社创办于 1923 年8 月，由陈光甫在上海银行内创办。当时这家旅行社主要负责短途旅游业务，但也曾组织过第一批赴日观樱旅行团。近百年时间，旅行社飞速发展，截至 2022 年 12 月 31 日，全国旅行社总数为 45162 家。但其中弊病不少，尤其是“黑导游”、恶意甩团、强迫购物等乱象。一般来说，一条旅游线路的成本通常包含交通费、门票费、餐饮住宿费等（旅行社可以在这些方面进行创收）。同时，由于近年来线上旅行社的兴盛，为了抢占市场，不少旅行社开始打起价格战，以“低价旅游”的口号吸引顾客，但实际上它是通过将成本折合进购物消费中，来转嫁风险。这点也常被诟病。对此有不少业内人士呼吁旅行社转变盈利模式，如由宰客盈利向服务盈利转变。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990838829.png', '2024-03-21 11:14:08', '被承包的旅行');
INSERT INTO `blog_tipsoon` VALUES ('773e945647fd9c1c2c9c16d5fd78a970', '1', '<p>有的人把假的当成真的，而又有人把明明是真的事情当成假的，前者可以说是“黄粱美梦”，后面这种就是“覆蕉寻鹿”。以前有个樵夫打死了一头野鹿，因为一时带不回家，怕被其他人发现，就先用芭蕉叶把它覆盖起来；后来樵夫去找鹿，忘记了所藏的地方，怎么也找不到，最后以为是自己做了一场梦。所以用“覆蕉寻鹿”来比喻把真实的事情看作梦幻的情况，也可用“覆鹿寻蕉”，都是一个意思。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710953784453.jpg', '2024-03-21 00:56:39', '覆蕉寻鹿');
INSERT INTO `blog_tipsoon` VALUES ('7956ca78064b88bc945d1eb0f2614a08', '1', '<p>一段美好爱情开始时你侬我侬、缠缠绵绵，最后却以相互厌烦结尾，让人唏嘘。清代词人纳兰性德于是咏出一句“人生若只如初见，何事秋风悲画扇”，触动人心，千古流传。而在中华悠久灿烂的文化中，有一个成语“兰因絮果”也表示这层意思，它比喻男女婚事初时美满，最终离异。其中“兰因”比喻美好的因缘，“絮果”比喻离散的结局。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988040526.png', '2024-03-21 10:27:30', '兰因絮果是世间定律吗？');
INSERT INTO `blog_tipsoon` VALUES ('7ae89a311cd3360342e2c981600bf766', '1', '<p>其实，这是简讯最大的一个特点。分类就是思想的枷锁，如果有了分类，我们都会不由自主地去寻找感兴趣的分类，虽然能讨好用户，但这样往往会让大家错过其他有趣的内容。想要见多识广，就不能局限在自己的兴趣以内。正如王尔德说的：得到了自己想要的其实是一件不幸的事。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711037946785.jpg', '2024-03-22 00:19:17', '为什么「简讯」没有分类？');
INSERT INTO `blog_tipsoon` VALUES ('7de18b2f29f416ddd3744d93d33e1add', '1', '<p>你知道吗？把柑橘类的水果放在床头有助眠的效果。芳香类分子能与人的嗅觉感受器结合，启动一系列化学反应，作用于大脑主管情绪的边缘系统。橙子、蜜橘、金桔、柠檬、柚子等柑橘类水果中，含有散发香味的“苎（zhù）烯”，能刺激大脑产生 α 脑电波，使大脑放松，从而达到助眠的效果。今晚你不妨就试试吧？</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039891206.png', '2024-03-22 00:51:52', '把柑橘类水果放在床头');
INSERT INTO `blog_tipsoon` VALUES ('7f83910d52f74a84a92a5d97b519e5d5', '4', '<p>曾经有人说，旅行是治愈心灵的良药。我深以为然。每一次踏上旅途，都是一次与自己对话的机会，也是一次重新认识世界的过程。在陌生的城市里，我感受到了不同的风土人情，也领悟到了生活的多样性和包容性。旅行，让我更加珍惜眼前的生活，也更加期待未来的探索。</p>', NULL, NULL, NULL, '旅行的意义');
INSERT INTO `blog_tipsoon` VALUES ('7t2x9k5s4d3w6j8', '4', '宇宙是一个无尽的奇迹，充满了神秘和美丽。星辰漫舞，谱写着宇宙的壮丽乐章。我们身处其中，探索着宇宙的奥秘。\r\n\r\n星系、行星、星云、黑洞，它们都是宇宙中令人惊叹的存在。我们通过先进的望远镜和太空探测器，逐渐揭开了它们的神秘面纱。然而，宇宙中的奥妙远不止于此。\r\n\r\n我们还发现了黑暗能量，这种无法直接观测到的能量形式，占据了宇宙总能量的大部分。它推动着宇宙的加速膨胀，给我们带来了关于宇宙命运的深思。\r\n\r\n宇宙的壮丽景象不仅仅限于视觉。我们通过探索宇宙背后的物理规律和数学原理，深入理解宇宙的工作方式。宇宙是一个巨大的实验室，向我们展示着自然界的奇迹和规律。\r\n\r\n每一个星系、每一个恒星，都有其独特的故事。我们的理解还只是宇宙之大中的一小部分。但正是这种不断的探索和思考，让我们更加谦卑地面对宇宙的壮丽和未知。\r\n\r\n尽管我们只是宇宙中微不足道的存在，但我们的好奇心和求知欲驱使着我们不断前行。让我们一起怀揣着敬畏之心，探索星辰漫舞的宇宙，与宇宙共舞。', NULL, 'https://plus.unsplash.com/premium_photo-1679103327202-44d4e2842f2f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8JUU1JUFFJTg3JUU1JUFFJTk5JUU1JUEzJUFFJUU0JUI4JUJEJUU2JTk4JTlGJUU0JUJBJTkxJUU3JTlBJTg0JUU1JTlCJUJFJUU3JTg5JTg3fGVufDB8fDB8fHww', '2024-04-02 15:10:01', '星辰漫舞：宇宙中的无尽奇迹');
INSERT INTO `blog_tipsoon` VALUES ('866b5ad858d86cac50214d35efb4505a', '1', '<p>如今几乎所有的教师手册上都会重复着威廉 · 詹姆斯的这句箴（zhēn）言：“人性最深刻的原则就是希望别人对自己加以赏识。”随后引申出的结论是：所谓赏识就是充分肯定学生，通过心理暗示不断培养学生的自尊心和自信心，使其具有勇于进取的信心和不断进取的动力。心理学是科学，教学是艺术，而老师，则是开启美好人生的“艺术家”。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990907007.png', '2024-03-21 11:15:16', '源于教师的强大力量');
INSERT INTO `blog_tipsoon` VALUES ('8d613a94702d5e4c46a1b598c3e528d9', '4', '<p>在人生的道路上，我们总会遇到各种各样的困难和挑战。有时候，我们会感到迷茫和无助，甚至想要放弃。但是，正是这些困难和挑战，塑造了我们的性格，也让我们变得更加坚强和成熟。每一次的挫折，都是一次成长的机会，让我们学会如何在逆境中挺立，如何在困难中寻找出路。</p>', NULL, NULL, NULL, '挫折与成长');
INSERT INTO `blog_tipsoon` VALUES ('8f304c9b1c2fcd7251cabc2fa4555080', '1', '<p>一忙，也不八卦了，也不吐槽了，也不花痴了。平静的脸上无怒无喜，看过去只隐隐约约的写了一个“滚”字。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039356511.png', '2024-03-22 00:43:06', '忙是治疗一切“神经病”的良药');
INSERT INTO `blog_tipsoon` VALUES ('94a265db3c1f94ffa525c97a934459d2', '1', '<p>当鲸鱼在海洋中死去，它的尸体会缓慢沉入海底。这个缓慢的过程有一个饱含诗意的名字：鲸落（Whale Fall）。这样一只鲸鱼可以供养一套以分解者为主的循环系统长达百年，这是它留给大海最后的温柔。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710989217893.png', '2024-03-21 10:47:07', '鲸落：它留给大海最后的温柔');
INSERT INTO `blog_tipsoon` VALUES ('973617aec2a45552b06a4f59ade56b70', '1', '<p>正确的做法是：看一眼，然后回去休息，等水位退了叫保险公司来定损。千万不要手痒去点火，否则发动机会直接报废，而且保险不赔！不赔！不赔！二次打火发动机报废的原因是在水已经进入气缸的情况下强行打火会因为气缸内水不能压缩导致活塞压缩行程时顶弯活塞杆，甚至曲轴和缸体，导致发动机报废。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988962951.png', '2024-03-21 10:42:51', '暴雨把车子泡了千万别点火');
INSERT INTO `blog_tipsoon` VALUES ('9a3b59b5a0d1c2a5770388cc1a62854d', '1', '<p>妈妈们都有个“通病”，只要你说了哪样菜好吃，她们就频繁地煮那道菜，直到你厌烦地埋怨了为止。其实她这辈子，就是在拼命把你觉得好的，给你，都给你，爱得不知所措了而已。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988451650.png', '2024-03-21 10:34:23', '妈妈们的“通病”');
INSERT INTO `blog_tipsoon` VALUES ('9c5b27a1d4e9f3748d67a6e4b951f32b', '4', '<p>记得小时候，奶奶总是喜欢在夏日的傍晚，坐在院子里的摇椅上，轻轻摇动着扇子，给我讲述那些古老的故事。那些故事里，有英勇的将军，有美丽的仙女，也有平凡却善良的小人物。每一次听奶奶讲故事，我都仿佛置身于一个神奇的世界，感受着那份独特的温暖和亲切。如今，虽然奶奶已经不在了，但那些故事却永远留在了我的心中，成为我最珍贵的回忆。</p>', NULL, NULL, NULL, '奶奶的故事里的温暖回忆');
INSERT INTO `blog_tipsoon` VALUES ('a06d280de18adbdcfe31bdd72c56db97', '1', '<p>波比跳是一种高强度，短时间燃烧脂肪，令人心率飙升的自重阻力训练。它结合了深蹲、伏地挺身及跳跃一连串的动作，自然而然地就会训练到全身百分之70以上的肌肉群，包含核心肌群、脚、手臂、腹部、臀部及背部等。蜘蛛侠荷兰弟每周的训练课程就包含了一定的波比跳练习。所以，它的减脂效果不是快不快的问题，只要能够坚持，它的效果只会让人惊叹！</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710953614370.jpg', '2024-03-21 00:53:12', '波比跳减脂真的很快吗？');
INSERT INTO `blog_tipsoon` VALUES ('a1b23c4d5e6f7g8h9i0j1k', '4', '<p>年少时，我们总是怀揣着梦想，渴望探索未知的世界。那时候，一本书、一部电影，甚至是一段旅行，都能点燃我们内心的热情，让我们对未来充满期待。如今，虽然岁月已经在我们脸上留下了痕迹，但那份对梦想的追求却从未改变。它依然如灯塔般照亮我们前行的道路，指引我们不断前行。</p>', NULL, NULL, NULL, '梦想的灯塔');
INSERT INTO `blog_tipsoon` VALUES ('a3b5c6d7e8f9g0h1i2j3k4l5', '4', '夜色渐浓，星光闪烁。我抬头仰望，那片深邃的夜空，藏着多少未知的奥秘。科学家们用望远镜探寻，诗人们用文字描绘，而我们，则用好奇与敬畏之心，去感受这宇宙的无尽魅力。每一颗星星，都像是宇宙中的一盏灯，照亮我们探索的路途。', NULL, 'https://inews.gtimg.com/newsapp_bt/0/13463502096/1000', '2024-04-02 15:17:53', '夜空中的奥秘');
INSERT INTO `blog_tipsoon` VALUES ('a70b208badd062eb04a023c08285f41f', '1', '<p>第一次危机：无理数的诞生。几何量不能完全由整数及其比来表示，挑战了“万物皆数”。第二次危机：无穷小是否趋近于零？微积分理论建立在无穷小分析之上，但“无穷小量”概念并不清晰。第三次危机：罗素悖论对康托尔集合论的挑战（此危机还未彻底解决）。理发师宣布，他只给“不给自己刮胡子的人”刮胡子，他自己属于这个“集合”吗？三次危机在当时引起了极大恐慌，甚至引发了命案。如发现无理数的希伯斯，被扔到海里喂了鲨鱼；而康托尔由于学术观点受到打击，为数学而“疯”，最后死在了精神病医院里。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710987918172.png', '2024-03-21 10:25:33', '数学史上的三次危机是什么？');
INSERT INTO `blog_tipsoon` VALUES ('b136c3a2cc05252023049402ff772983', '1', '<p>依照「中华人民共和国食品安全法」第一百四十八条规定，对于标注虚假生产日期、保质期或者超过保质期的食品、食品添加剂，消费者因不符合食品安全标准的食品受到损害的，消费者除要求赔偿损失外，还可以向生产者或经营者要求支付价款10倍或者损失3倍的赔偿金；增加赔偿的金额不足1000元的，按1000元算。比如你买了54元的20公斤香米，发现该商品为过期食品。你可以要求商场退还购物款54元以及支付赔偿金1000元。但前提是你要保留好涉案食品的收款收据、购物小票、刷卡单等。</p>', '{\"url\": \"http://www.npc.gov.cn/zgrdw/npc/xinwen/2019-01/07/content_2070256.htm\", \"title\": \"中华人民共和国食品安全法（全文）\"}', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710954553320.png', '2024-03-21 01:09:23', '买到过期食品，至少可索赔1000元');
INSERT INTO `blog_tipsoon` VALUES ('b2c3d4e5f6g7h8i9j0k1l2m3', '4', '<p>人生如同一场马拉松，每个人都在自己的赛道上奋力奔跑。有时候，我们会遇到志同道合的伙伴，一起携手前行；有时候，我们也会独自面对挑战，咬牙坚持。但无论如何，我们都不应该停下脚步。因为只有在不断奔跑中，我们才能发现更多美丽的风景，也才能收获更多的成长与喜悦。</p>', NULL, NULL, NULL, '人生的马拉松');
INSERT INTO `blog_tipsoon` VALUES ('c0296651b3b0dbefbf1364a0d1c955dd', '1', '<p>站直，提起后脚跟，然后尽力朝后。深吸一口气，直到你的肺充分膨胀，然后缓缓地呼出，让胸部先沉下去。早晚多做几次有益身体健康。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039739330.jpg', '2024-03-22 00:49:13', '如何增强肺活量');
INSERT INTO `blog_tipsoon` VALUES ('c3d4e5f6g7h8i9j0k1l2m3n4', '4', '<p>在这个快节奏的时代，我们似乎总是在不停地奔波和忙碌。有时候，我们会感到疲惫和焦虑，甚至忘记了如何放慢脚步，享受生活。但其实，生活中有很多美好的瞬间，值得我们细细品味。无论是一杯清茶、一本好书，还是一次与朋友的聚会，都能让我们感受到生活的美好与温馨。</p>', NULL, NULL, NULL, '慢享生活之美');
INSERT INTO `blog_tipsoon` VALUES ('cb1f07c2996aaeb254802f79fecd54e3', '1', '<p>不知你是否看过韩剧「顶楼」，在剧中，“完美女孩”恩星被心理医生确诊为假面症。不过，在美国精神医学会公布的精神障碍分类中，目前并不存在假面症这种心理疾病。但是有一种与之相似的心理疾病，尤其在白领和学生群体中十分常见，它被叫做“微笑抑郁症”，是抑郁症的一种新型表现。有这种心理疾病的人，即使内心千疮百孔、痛苦且压抑，但外表总要装作若无其事，并拼命掩饰自己的负面情绪，如同戴上一张“微笑面具”，这只不过是给自己立了一个虚无的人设罢了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039966969.png', '2024-03-22 00:53:12', '藏在微笑背后的哀伤');
INSERT INTO `blog_tipsoon` VALUES ('cc24e1e577e6b1b23f25950086741758', '1', '<p>鲤素：书信。滂霈（pāngpèi）：雨水盛貌。澄廓：清明辽阔。陟遐（zhìxiá）：远行，长途跋涉。卮言（zhī）：自然随意或者支离破碎之言。峬峭（būqiào）：风姿俊俏优美。圹埌：一望无际，宁静辽阔。熙熙曜曜：温和光亮的样子。云岫（xiù ）：指云雾缭绕的峰峦。鷇音（kòu）：小鸡在蛋壳里凿蛋壳的声音。运裛（yì）：水流回旋相缠的样子。坠茵落溷（zhuìyīnluòhùn）：人生就像树上的花朵，有些落在茵席上，有些落在粪坑里。</p>', NULL, '', '2024-03-21 10:23:41', '一个生僻词，一句美的诗');
INSERT INTO `blog_tipsoon` VALUES ('d2e9f844fa7c2d4c940c721e09e0711d', '1', '<p>只有当局势不明朗，没有人告诉你该怎么办，而错误的判断又会导致一些不良的后果时，你要是能因为有知识而敢于拿一个主意，这才算是真有知识。「简讯」的愿景就是希望让所有人打开眼界，突破认知瓶颈，最终能够学以致用。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710987695648.jpg', '2024-03-21 10:21:45', '怎样才算真有知识？');
INSERT INTO `blog_tipsoon` VALUES ('d4e5f6g7h8i9j0k1l2m3n4o5', '4', '<p>每个人都有属于自己的一片天空，或许辽阔无垠，或许狭窄逼仄。但无论如何，我们都应该勇敢地追寻自己的梦想，努力在这片天空中留下自己的痕迹。也许过程会充满艰辛和挑战，但只要我们坚持不懈，就一定能够飞得更高、更远。</p>', NULL, NULL, NULL, '追逐梦想的天空');
INSERT INTO `blog_tipsoon` VALUES ('d865592905cd9bd86a1b10f09b2154a2', '1', '<p>好久，长时间，多日。例句： I haven\'t se-en Charlie for a dog\'s age. 我好久没有见到查理了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039932954.png', '2024-03-22 00:52:22', 'a dog\'s age');
INSERT INTO `blog_tipsoon` VALUES ('da6f79b3e75c408f62d07f9b5d671af3', '1', '<p>得志则行天下，不得志则独善其身。怎么理解这句话呢？若你遇上贵人，遇上机会，你的见识和能力又到了一定程度，你就有机会证明自己，发挥你的聪明才智，便努力去做到极致。这叫得志则行天下。若没人赏识你，你没有足够的资源和能力去行天下，那不妨先效仿中国文人和读书人，给自己强调“不得志则独善其身”。在没有资源的情况下，提升自身水平的最好办法就是读书。不要总觉得别人“好”就是小人得志，也不要和别人比谁更有名气和财富，不如先问问自己读了多少书。世间数百年旧家无非积德，天下第一件好事还是读书。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039079707.png', '2024-03-22 00:38:21', '腹有诗书气自华');
INSERT INTO `blog_tipsoon` VALUES ('db8e1717c705c277aaa5bbc65d60dc55', '1', '<p>一公斤重的狗吃下9克的纯巧克力就有可能导致死亡。巧克力里含有可可碱，会让狗狗很兴奋，刺激狗狗脑部神经，使其心跳加速、肌肉痉挛，最终导致休克死亡。除此以外，新鲜水果类，蔬菜根茎类，辛香类，以及糖果甜食类等等都是少吃甚至是不能吃的，而最适合狗狗的食物还是肉类。</p>', '{\"url\": \"https://mp.weixin.qq.com/s/TXTj9hc5VG2Dk22UqEypMA\", \"title\": \"有的狗狗吃了巧克力为啥没中毒？\"}', 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988576304.png', '2024-03-21 10:36:43', '喂狗吃巧克力很危险！');
INSERT INTO `blog_tipsoon` VALUES ('dd5df94247d9590fca2fc7f2cf1054db', '1', '<p>这个网站使用了人工智能深度学习技术——深度卷积神经网络（Deep Convolutional N-eural Networks, based on waifu2x）。它会将噪点和锯齿的部分进行补充，实现图片的无损放大。也就是说，把一张尺寸小的图片放大后依然清晰，很实用了。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710953832165.jpg', '2024-03-21 00:57:22', 'BigJPG.com');
INSERT INTO `blog_tipsoon` VALUES ('e5f6g7h8i9j0k1l2m3n4o5p6', '4', '<p>冬日的午后，阳光斜斜地洒在窗台上，我静静地坐在书桌前，手中捧着一本旧书。书页间散发出淡淡的墨香，仿佛带我穿越时光，回到了那个纯真的年代。那时的我们，对未来充满好奇与憧憬，每一个梦想都如同璀璨的星辰，照亮我们前行的路。</p>', NULL, NULL, NULL, '冬日阳光与旧时光');
INSERT INTO `blog_tipsoon` VALUES ('e89ef26353aa929806a3ee4423125801', '1', '<p>短语“once in a blue moon”出现在19世纪，它的意思为“ 罕见的、千载难逢的”，在这里“blue moon”并不只是“蓝色月亮”的含义，而是指“在一个月内出现的第二次圆月”，这种现象每隔32个月发生一次。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039844854.jpg', '2024-03-22 00:51:01', 'Once in a blue moon');
INSERT INTO `blog_tipsoon` VALUES ('ec116054ed6c5e46f033955a28f75996', '1', '<p>苦的根源不是经受了太多的悲苦和凄惨，也不在于觉得一切都没有意义。它从追求而生，而痛在执着。追求在于过程，执着在于结果。过程中可以带来快乐，而只有执着于结果才会产生苦味。佛语有言：“执着于一念，就困于一念；一念放下，会自在于心间。”</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710990945000.jpg', '2024-03-21 11:15:54', '苦的根源');
INSERT INTO `blog_tipsoon` VALUES ('ec94169092bf46dda9eb33b41925255d', '1', '<p>写「格列佛游记」的英国文豪江奈生·斯威夫特先生，曾说过一段至理名言。其开头如下：“当我老时，愿望如下：不混在年轻人队伍里头，除非他们专诚邀约。不随便施教，也不随便麻烦别人，除非对方切求自己。不夸耀年轻时的英姿、力量或如何受女性欢迎等等。不听谄言，也不要设想自己会蒙年轻女子的青睐。不乖戾、郁闷或猜疑。不鄙薄当代的作风、情趣、时尚、人物、斗争等。不严厉对待年青人，但接受他们青春的愚昧和缺点。不多言，也不多讲自己。不肯定事情，也不固执……”</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240322_1711039700213.png', '2024-03-22 00:48:34', '当我老时，愿望如下');
INSERT INTO `blog_tipsoon` VALUES ('f0d0b34fa526177c7e1cb7dc32cf3ffa', '1', '<p>土特产是有一定知名度的本地特色农产品或加工产品，譬如丹东草莓，赣南脐橙，延安苹果，大同黄花，潜江小龙虾……这些东西搁在古代，就是各地上贡的物产了。最典型的例子就是，唐朝的“一骑红尘妃子笑，无人知是荔枝来”（有学者认为此处是四川荔枝，并非岭南荔枝），和明清时进贡江南鲥鱼的“白日风尘驰驿路，炎天冰雪护江船”。由于物流、保鲜技术有限，以及贸易限制等因素，在古代，各地特产除了皇家享受，其他地方的消费非常有限。如今就不一样了，可谓是“只有人们不知道的特产，没有买不到的特产”。但对于隐藏在地方志或国际市场中的自家特产，还真不好找，譬如黑龙江佳木斯的蔓越莓、四川雅安的鱼子酱、安徽六安的鹅肝……</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710991021989.png', '2024-03-21 11:17:15', '我家特产咋“特地瞒着我产”？');
INSERT INTO `blog_tipsoon` VALUES ('f1f21219fd74d063940e8e31f78e162d', '1', '<p>三日诗是以下三诗的合称。「昨日歌」：昨日兮昨日，昨日何其好！昨日过去了，今日徒懊恼。世人但知悔昨日，不觉今日又过了。水流日日去，花落日日少。成事立业在今日，莫待明朝悔今朝。「今日歌」：今日复今日，今日何其少！今日又不为，此事何时了？人生百年几今日，今日不为真可惜！若言姑待明朝至，明朝又有明朝事。为君聊赋今日诗，努力请从今日始。「明日歌」：明日复明日，明日何其多！我生待明日，万事成蹉跎。世人皆被明日累，春去秋来老将至。朝看水东流，暮看日西坠。百年明日能几何，请君听我明日歌。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988876021.png', '2024-03-21 10:41:25', '惜时“三日诗”');
INSERT INTO `blog_tipsoon` VALUES ('f6g7h8i9j0k1l2m3n4o5p6q7', '4', '<p>在人生的旅途中，我们会遇到各种各样的人。有些人只是匆匆过客，留给我们的是一抹浅浅的回忆；而有些人则会成为我们生命中不可或缺的陪伴。他们与我们一同分享喜怒哀乐，一同走过风风雨雨。他们的存在，让我们的人生变得更加丰富多彩，也让我们更加珍惜那些与他们相处的时光。</p>', NULL, NULL, NULL, '生命中的陪伴者');
INSERT INTO `blog_tipsoon` VALUES ('ff511d569ba7f090ec8577d3920e0fb9', '1', '您好，「简讯」的朋友，如果您觉得我们做得还不错，可以请您顺手帮忙在应用市场给个好评吗？有人说，这是精简版知乎，也有人说，这是文字版抖音？其实，简讯就是简讯。这种无分类+随机阅读的模式是我们一次冒险的尝试，最初我们也不知道是否会被接受，尤其是产品刚上线的那段时间，有很多质疑，也被泼了很多凉水，甚至中途也曾放弃过，能走到今天全靠大家的支持和鼓励。在简讯的公众号里有那段时间的故事，如果感兴趣也可以去看看。', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240326_1711432602968.jpg', '2024-03-26 13:56:46', '求助啦，能帮个忙吗？');
INSERT INTO `blog_tipsoon` VALUES ('ff8694a4a8ca5e5672be90ee2e9ead15', '1', '<p><span style=\"color: rgb(25, 27, 31); background-color: rgb(255, 255, 255); font-size: 15px;\">白居易45岁得女阿罗，写下不少“晒女诗”。阿罗出嫁后生下一女，白居易唯恐女儿女婿因生女而懊丧，便为外孙女起名“引珠”，并写下「小岁日喜谈氏外孙女孩满月」一诗贺喜。其中，“物以稀为贵，情因老更慈”和“怀中有可抱，何必是男儿”两句，将他慈祥的外公形象跃然而出，也凸显出他并非重男轻女之流。而“物以稀为贵”便于此被明确提出。</span></p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710989271907.png', '2024-03-21 10:48:02', '白居易：物以稀为贵');
INSERT INTO `blog_tipsoon` VALUES ('ffcaa70397b5b097932b541ec446c113', '1', '<p>哲学信条被断章取义的情况大体有两种：一是经过传播，语义产生歧义。比如黑格尔在「法哲学原理」里提出的“存在即合理”，它实际的意思是一切存在都有原因，而不是说“这件事既然发生了，就一定是合理的、正确的”。另一种是取一句完整句子里的一部分，导致整体语义相反。比如卢梭的“人生而自由”，其实后面还有半句：“却又无往不在枷锁之中”。</p>', NULL, 'https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/20240321_1710988493722.png', '2024-03-21 10:35:03', '被断章取义的哲学信条');
INSERT INTO `blog_tipsoon` VALUES ('g7h8i9j0k1l2m3n4o5p6q7r8', '4', '<p>有时候，我们会因为一些小事而感到失落和沮丧。或许是工作上的挫折，或许是人际关系的困扰。但无论何时，我们都应该学会调整自己的心态，用积极的态度去面对生活中的挑战。因为只有当我们心中充满阳光时，才能看到生活的美好和希望。</p>', NULL, NULL, NULL, '心态决定生活色彩');
INSERT INTO `blog_tipsoon` VALUES ('h8i9j0k1l2m3n4o5p6q7r8s9', '4', '<p>在繁忙的生活中，我们常常会忽略身边那些微小的美好。或许是清晨的第一缕阳光，或许是路边的一朵野花，又或许是孩子纯真的笑脸。但正是这些看似微不足道的事物，构成了我们生活的点滴幸福。只要我们用心去感受，就会发现生活中处处充满了爱与温暖。</p>', NULL, NULL, NULL, '生活中的微小幸福');
INSERT INTO `blog_tipsoon` VALUES ('i9j0k1l2m3n4o5p6q7r8s9t0', '4', '<p>有时候，我们会因为追求过多的物质享受而忽略了内心的需求。我们忙于工作，忙于应酬，却忘记了停下来聆听自己内心的声音。但真正的幸福，往往来自于内心的平静与满足。只有当我们学会放下繁琐的杂念，专注于内心的修养与成长时，才能找到真正的幸福与安宁。</p>', NULL, NULL, NULL, '内心的声音与真正的幸福');
INSERT INTO `blog_tipsoon` VALUES ('j0k1l2m3n4o5p6q7r8s9t0u1', '4', '<p>每个人都有自己的成长轨迹，或曲折或顺畅。但无论经历怎样的风雨，我们都应该保持一颗积极向上的心。因为每一次的挫折，都是一次成长的机会；每一次的失败，都是一次积累经验的过程。只有不断地学习和进步，我们才能成为更好的自己。</p>', NULL, NULL, NULL, '成长路上的积极态度');
INSERT INTO `blog_tipsoon` VALUES ('k1l2m3n4o5p6q7r8s9t0u1v2', '4', '<p>岁月如梭，转眼间又是一年春暖花开。回首过去，我们或许有遗憾、有失落，但更多的是收获与成长。那些曾经的汗水与泪水，如今都化作了宝贵的财富。未来的路还很长，但只要我们心怀梦想，勇往直前，就一定能够创造出属于自己的精彩人生。</p>', NULL, NULL, NULL, '春暖花开与人生的精彩');
INSERT INTO `blog_tipsoon` VALUES ('l2m3n4o5p6q7r8s9t0u1v2w3', '4', '<p>在这个信息爆炸的时代，我们每天都会接触到各种各样的信息和观点。但真正的智慧，并不在于我们掌握了多少知识，而在于我们如何运用这些知识，去判断是非、明辨真假。因此，我们应该保持一颗谦逊的心，不断学习、不断思考，用智慧去照亮前行的道路。</p>', NULL, NULL, NULL, '智慧照亮前行之路');
INSERT INTO `blog_tipsoon` VALUES ('m3n4o5p6q7r8s9t0u1v2w3x4', '1', '<p>在生活的舞台上，我们扮演着各种角色，有时是主角，有时是配角。但无论角色大小，我们都应该用心去演绎，去体验其中的酸甜苦辣。因为正是这些角色和经历，构成了我们丰富多彩的人生。让我们珍惜每一个角色，用心去感受每一个瞬间，让生活因我们的演绎而更加精彩。</p>', NULL, NULL, NULL, '生活舞台上的角色与演绎');
INSERT INTO `blog_tipsoon` VALUES ('m6n7o8p9q0r1s2t3u4v5w6x7', '4', '春风轻拂，绿意盎然。那新生的嫩叶，在晨曦中轻轻摇曳，仿佛是自然的诗篇，低吟浅唱。花儿竞相绽放，色彩斑斓，点缀着大地的衣裳。我漫步其中，感受着春的气息，那温暖而柔和的阳光，洒在心间，让人陶醉。\r\n\r\n此刻，我愿化作一只蝴蝶，翩翩起舞于花丛之间，与大自然共舞，与春光同醉。', NULL, 'https://img1.baidu.com/it/u=2459287173,2703930599&fm=253&fmt=auto&app=138&f=JPEG?w=640&h=427', '2024-04-02 15:20:06', '春日序曲');
INSERT INTO `blog_tipsoon` VALUES ('n4o5p6q7r8s9t0u1v2w3x4y5', '1', '<p>每个人的生命中都有那么几个重要的节点，它们或许是一次重大的抉择，或许是一次意外的相遇。这些节点，如同生命中的灯塔，指引着我们前进的方向。当我们回顾过去，那些节点总是显得格外清晰和珍贵。它们让我们更加坚定自己的信念，也让我们更加珍惜眼前的幸福。</p>', NULL, NULL, NULL, '生命中的灯塔与重要节点');
INSERT INTO `blog_tipsoon` VALUES ('o5p6q7r8s9t0u1v2w3x4y5z6', '1', '<p>在人生的旅途中，我们总会遇到各种各样的风景。有时候是美丽的山川湖泊，有时候是繁华的都市景象。但无论风景如何变换，我们都应该保持一颗欣赏的心，去感受大自然的鬼斧神工和人间烟火的美好。因为正是这些风景，让我们的旅程变得更加丰富多彩，也让我们的人生更加充满意义。</p>', NULL, NULL, NULL, '人生旅途中的风景与欣赏');
INSERT INTO `blog_tipsoon` VALUES ('p6q7r8s9t0u1v2w3x4y5z6a7', '1', '<p>在这个快节奏的社会里，我们常常被各种琐事所牵绊，忽略了内心的声音。但真正的成长，往往来自于对内心的倾听与理解。当我们静下心来，聆听自己内心的呼唤时，就能找到真正属于自己的方向和目标。因此，我们应该学会放下繁琐的杂念，与自己的内心对话，让心灵得到真正的滋养与成长。</p>', NULL, NULL, NULL, '倾听内心与真正的成长');
INSERT INTO `blog_tipsoon` VALUES ('y8z9a0b1c2d3e4f5g6h7i8j9', '4', '深邃的海洋，藏着无数未解之谜。科学家们乘坐深海潜水器，探索着那幽暗而神秘的海底世界。他们发现了奇特的生物，如发光鱼、巨型章鱼；还有巨大的海底山脉、热液喷口等奇特地貌。这些发现不仅拓宽了我们对海洋的认识，更揭示了地球生命的多样性和复杂性。\r\n\r\n海洋深处，仍有无数秘密等待我们去揭开。每一次深海探索，都是对未知世界的一次勇敢挑战。', NULL, 'https://img1.baidu.com/it/u=2988117528,609946971&fm=253&fmt=auto&app=138&f=JPEG?w=800&h=500', '2024-04-02 15:21:59', '海洋深处的秘密');

-- ----------------------------
-- Table structure for blog_tipsoon_collect
-- ----------------------------
DROP TABLE IF EXISTS `blog_tipsoon_collect`;
CREATE TABLE `blog_tipsoon_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `tipsoon_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tipsoon_collect
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tipsoon_comment
-- ----------------------------
DROP TABLE IF EXISTS `blog_tipsoon_comment`;
CREATE TABLE `blog_tipsoon_comment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '评论用户id',
  `reply_user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '回复用户id',
  `tipsoon_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '话题id',
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip归属地',
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'ip',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父id',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子评论表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tipsoon_comment
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tipsoon_like
-- ----------------------------
DROP TABLE IF EXISTS `blog_tipsoon_like`;
CREATE TABLE `blog_tipsoon_like`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `tipsoon_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '圈子内容id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子内容点赞表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tipsoon_like
-- ----------------------------

-- ----------------------------
-- Table structure for blog_tipsoon_readed
-- ----------------------------
DROP TABLE IF EXISTS `blog_tipsoon_readed`;
CREATE TABLE `blog_tipsoon_readed`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `tipsoon_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '简讯ID',
  `create_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 151 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tipsoon_readed
-- ----------------------------
INSERT INTO `blog_tipsoon_readed` VALUES (149, 4, '1b35b493ab2b16593d201ce614fd77f1', '2024-04-05 14:42:02');
INSERT INTO `blog_tipsoon_readed` VALUES (150, 2, '230ec130fbbbe086d92d0e885bb0f156', '2024-07-01 10:29:15');

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user_info
-- ----------------------------
INSERT INTO `blog_user_info` VALUES (1, 'tsuimengchao@163.com', '梦辰雪', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/avatar-20240302042334316.png', '努力努力再努力', 'yc-hequan.com', 1, 'https://cxblog.qiniu.zhaohaoyue.love/avatar/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2024-04-28 21:27:55');
INSERT INTO `blog_user_info` VALUES (2, 'tsuimengchao@qq.com', '测试用户', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/1645512111007.png', NULL, NULL, 1, 'https://cxblog.qiniu.zhaohaoyue.love/avatar/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2023-06-12 09:50:23');
INSERT INTO `blog_user_info` VALUES (3, 'tsuimengchao@foxmail.com', '普通用户', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (4, 'tsuimengchao@aliyun.com', '崔梦超', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/cmc.png', '搬砖搬砖正在搬砖', NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (5, '505113917@qq.com', '赵浩悦', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (6, '1633420846@qq.com', '碧落', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (7, '484132820@qq.com', 'uniapp用户', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (8, '3313246839@qq.com', 'uniapp用户', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (9, 'abc147369_1121@qq.com', '彼时', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/2019072517054194594.jpg', NULL, 'yc-hequan.com', 1, NULL, '2024-04-28 21:27:02', '2024-04-28 21:27:02');
INSERT INTO `blog_user_info` VALUES (10, '422149197@qq.com', 'shihan', '', NULL, NULL, 1, NULL, '2024-05-11 09:14:25', '2024-05-11 09:14:25');

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
  `show_bulletin` int(1) NULL DEFAULT NULL COMMENT '是否显示公告  0 不显示 1显示',
  `copyright` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版权声明',
  `release_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '发布时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_web_config
-- ----------------------------
INSERT INTO `blog_web_config` VALUES (1, 'https://cxblog.qiniu.zhaohaoyue.love/web/9cf1222617fd4fa197991476a53cc883.jpg', '辰雪博客', '正在努力搬砖~~~~', '梦辰雪,辰雪,辰雪博客', '梦辰雪', '冀ICP备2021012929号 转 冀ICP备2024051278号', '2021-11-27 13:43:16', '2022-01-20 13:30:44', 'https://cxblog.zhaohaoyue.love', 'https://cxblog.qiniu.zhaohaoyue.love/web/alipay.jpg', '\r\nhttps://cxblog.qiniu.zhaohaoyue.love/web/wxpay.jpg', 'https://github.com/TsuiMengchao', 'https://gitee.com/TsuiMengchao', '484132820', '182497346', 'tsuimengchao@aliyun.com', 'tsuimengchao', '1,3,4,2,5,6', '1,2,5,6,4,3', '1', 1, 'https://cxblog.qiniu.zhaohaoyue.love/avatar/66bb121d47e94b89945d29bb6e3e6cab.jpg', '欢迎您的到来，如果在使用过程中发现bug，麻烦请及时向辰雪反馈。如果本项目对你有帮助，请前往<a href=\"https://gitee.com/Tsuimengchao\">码云</a>给仓库点上您的小星星', '正在努力搬砖~~~~', 'https://cxblog.qiniu.zhaohaoyue.love/avatar/avatar-20240302042334316.png', '<h2 style=\"line-height: 2;\"><span style=\"color: rgb(145, 213, 255);\"><em><strong>关于博客</strong></em></span></h2><p>辰雪博客，建立于2024年1月26日，注册域名：赵浩悦.我爱你 zhaohaoyue.love，工业和信息化部备案号：冀ICP备2024051278号；曾用备案号：冀ICP备2021012929号；</p><p>本站为灵寿县辰雪科技工作室官方网站之一。</p><p style=\"line-height: 2;\"><img src=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711700433010.png\" alt=\"\" data-href=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711700433010.png\" style=\"width: 30%;\"></p><h2 style=\"line-height: 2;\"><span style=\"color: rgb(145, 213, 255);\"><em><strong>关于我</strong></em></span></h2><p style=\"line-height: 2;\">崔梦超，网名梦辰雪</p><h2 style=\"line-height: 2;\"><span style=\"color: rgb(145, 213, 255);\"><em><strong>关于版权</strong></em></span></h2><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">素材大多都是搜集自网络开源内容，都已标明作者，若侵犯了您的版权，请告知，会在第一时间删除。</span></p><h2 style=\"line-height: 2;\"><span style=\"color: rgb(145, 213, 255); background-color: rgba(255, 255, 255, 0.5);\"><em><strong>开发日志</strong></em></span></h2><p style=\"line-height: 2;\">本博客项目开始于2023年12月2日，突发奇想要做个个人博客，就在gitee上面发现了拾壹博客的源码；（其实这是我遇到的第二份，第一份是陌溪 / 蘑菇博客，对方用的是SpringCloud微模块,nacos作为注册商，当时我还尚未接触过这些技术栈，尝试运行时到处碰壁，就更别说按照自己风格进行改造融合了，所以没过多久便在放弃，转而选择第二个推荐了）</p><p style=\"line-height: 2;\"><img src=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711697845382.png\" alt=\"\" data-href=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711697845382.png\" style=\"width: 50%;\"></p><p style=\"line-height: 2;\">将拾壹博客源码克隆下来后发现提供的源码的后台管理系统部分不完整，而且后端代码结构也不符合我的喜欢，就想将其与ELADMIN进行融合，由于开始时项目融合遇到困难，12月9日放弃了，当时任何一个ShiyiBlog的小模块都还没能融合进ELADMIN中去。后来一个月之后，也就是<span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5); font-size: 13px;\">2024年1月</span><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">9日，想重置电脑，尝试合并磁盘，把当时连半成品都算不上的本项目代码打包丢到了阿里云盘上面。至于为什么不上传git，可能是因为当时我都不认为我还会继续开发本项目吧。</span></p><p style=\"line-height: 2;\"><img src=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711698632022.png\" alt=\"\" data-href=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711698632022.png\" style=\"width: 50%;\"></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">后来放了寒假，不知道什么原因，对前任忍不住想念，所以主动联系她，但是她由于某些原因，刻意过好久才会回复我消息，所以那段时间就整天抱着手机，停在QQ界面等待，所以当时整天心情都很低落，我告诉自己不能这样子了，得找点事做，所以1月14日时重新在电脑上安装了开发环境，并且从阿里云盘上面把半成品代码重新下载了下来，继续去年尚未完成的融合工作。</span></p><p style=\"line-height: 2;\"><img src=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711698548947.png\" alt=\"\" data-href=\"https://cxblog.qiniu.zhaohaoyue.love/web/20240329_1711698548947.png\" style=\"width: 50%;\"></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">1月18日时赎回了“赵浩悦.我爱你”这个域名，这个域名首次在2020年进行注册并备案；19日购买云服务器并尝试将整合初步完成的“辰雪博客”代码打包并部署上去。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">1月26日，域名备案通过，可以使用域名访问辰雪博客了。27日首次将源码上传至github，代表接受这个博客雏形已经完成了。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">2月24日，进行第二次git推送时遇到了问题，删除仓库重新在gitee上传了。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">3月12日，注册zhaohaoyue.love域名，因为部分地方不支持中文域名。而且后续也确实用到了，比如微信回调域名不支持中文域名，转码成字符后就会显示未备案。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">3月21日，第二个域名备案也通过。将无意中发现的拾壹博客的小程序版也放了进去，并正式推送V1.0.0版。22日提交微信小程序审核通过，支付宝审核驳回了，因为部分功能在支付宝不兼容。</span></p><p style=\"line-height: 2;\"><span style=\"color: rgb(0, 0, 0); background-color: rgba(255, 255, 255, 0.5);\">3月26日，小程序功能也初步完成。27日微信小程序补丁版审核通过，支付宝第8次提交也审核通过了，驳回了7次。</span></p>', 0, 1, 'Copyright©2023-2024', '2024-01-20 00:00:00');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成字段信息存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_column_config
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成器配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of code_gen_config
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '服务器管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mnt_server
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 13411 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统菜单' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (118, NULL, 9, 0, '博客管理', NULL, NULL, 5, 'education', 'blogs', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (119, 118, 9, 1, '文章管理', NULL, 'blogs/articles', 1, 'doc', 'articles', b'0', b'1', b'0', 'article:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (120, 118, 1, 1, '标签管理', NULL, 'blogs/tags', 2, 'blog', 'tags', b'0', b'1', b'0', 'tag:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (121, 118, 1, 1, '分类管理', NULL, 'blogs/category', 3, 'dictionary', 'category', b'0', b'1', b'0', 'category:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (122, 118, 4, 1, '说说管理', NULL, 'blogs/say', 4, 'nested', 'say', b'0', b'1', b'0', 'say:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (123, NULL, 6, 0, '网站管理', NULL, NULL, 6, 'phone', 'site', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (124, 123, 1, 1, '网站配置', NULL, 'site/webConfig/index', 3, 'password', 'webconfig', b'0', b'0', b'0', 'webConfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (125, 123, 3, 1, '网址分类管理', NULL, 'site/navigation/index', 4, 'chain', 'siteClass', b'0', b'0', b'0', 'siteClass:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (126, 123, 1, 1, '友链管理', NULL, 'site/friendLink/index', 3, 'link', 'friendLink', b'0', b'0', b'0', 'friendLink:list', 'admin', 'admin', '2024-01-18 14:18:55', '2024-01-18 14:18:55');
INSERT INTO `sys_menu` VALUES (127, 118, 1, 1, '博客字典管理', NULL, 'site/dict/index', 1, 'dictionary', 'blogdict', b'0', b'0', b'0', 'blogDict:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (128, NULL, 3, 0, '消息管理', NULL, NULL, 7, 'message', 'news', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (129, 210, 1, 1, '文章评论管理', NULL, 'news/comment/comment', 999, 'email', 'comment', b'0', b'0', b'0', 'comment:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (130, 128, 1, 1, '留言管理', NULL, 'news/message', 999, 'message', 'message', b'0', b'0', b'0', 'message:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (131, 128, 1, 1, '反馈管理', NULL, 'news/feedback', 999, 'sys-tools', 'feedback', b'0', b'0', b'0', 'feedback:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (132, 123, 1, 1, '系统配置', NULL, 'site/systemConfig/index', 4, 'log', 'systemconfig', b'0', b'0', b'0', 'systemconfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (133, 118, 1, 1, '博客字典数据', NULL, 'site/dict/data', 2, 'database', 'blogDictData', b'0', b'0', b'1', 'blogDictData:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (134, 123, 3, 1, '导航网址管理', NULL, 'site/navigation/navigation', 1, 'international', 'navigation', b'0', b'0', b'1', 'navigation:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (135, 118, 4, 1, '圈子管理', NULL, 'site/talk/index', 2, 'message', 'talk', b'0', b'0', b'0', 'talk:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
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
INSERT INTO `sys_menu` VALUES (204, 118, 4, 1, '简讯管理', NULL, 'blogs/tipsoon', 4, 'nested', 'tipsoon', b'0', b'1', b'0', 'tipsoon:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (205, 204, 0, 2, '简讯编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tipsoon:edit', 'admin', 'admin', '2024-03-13 22:43:04', '2024-03-13 22:43:04');
INSERT INTO `sys_menu` VALUES (206, 204, 0, 2, '简讯新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tipsoon:add', 'admin', 'admin', '2024-03-13 22:44:39', '2024-03-13 22:44:39');
INSERT INTO `sys_menu` VALUES (207, 204, 0, 2, '简讯删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tipsoon:del', 'admin', 'admin', '2024-03-13 22:44:58', '2024-03-13 22:44:58');
INSERT INTO `sys_menu` VALUES (208, 204, 0, 2, '简讯详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tipsoon:info', 'admin', 'admin', '2024-03-13 22:45:16', '2024-03-13 22:45:16');
INSERT INTO `sys_menu` VALUES (209, 210, 1, 1, '说说评论管理', NULL, 'news/comment/sayComment', 999, 'email', 'sayComment', b'0', b'0', b'0', 'sayComment:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (210, 128, 1, 0, '评论管理', NULL, NULL, 999, NULL, 'comment', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (211, 210, 1, 1, '讨论评论管理', NULL, 'news/comment/forumComment', 999, 'email', 'forumComment', b'0', b'0', b'0', 'forumComment:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (212, 210, 1, 1, '简讯评论管理', NULL, 'news/comment/tipsoonComment', 999, 'email', 'tipsoonComment', b'0', b'0', b'0', 'tipsoonComment:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24');
INSERT INTO `sys_role` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12');
INSERT INTO `sys_role` VALUES (3, '测试', 3, NULL, '全部', 'admin', 'admin', '2024-01-25 21:12:59', '2024-01-25 21:12:59');
INSERT INTO `sys_role` VALUES (4, '访客', 3, '仅具有查看权限，无任何操作权限', '全部', 'test', 'test', '2024-03-23 11:43:39', '2024-03-23 11:43:39');

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
INSERT INTO `sys_roles_menus` VALUES (204, 1);
INSERT INTO `sys_roles_menus` VALUES (205, 1);
INSERT INTO `sys_roles_menus` VALUES (206, 1);
INSERT INTO `sys_roles_menus` VALUES (207, 1);
INSERT INTO `sys_roles_menus` VALUES (208, 1);
INSERT INTO `sys_roles_menus` VALUES (209, 1);
INSERT INTO `sys_roles_menus` VALUES (210, 1);
INSERT INTO `sys_roles_menus` VALUES (211, 1);
INSERT INTO `sys_roles_menus` VALUES (212, 1);
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
INSERT INTO `sys_roles_menus` VALUES (1, 4);
INSERT INTO `sys_roles_menus` VALUES (2, 4);
INSERT INTO `sys_roles_menus` VALUES (3, 4);
INSERT INTO `sys_roles_menus` VALUES (5, 4);
INSERT INTO `sys_roles_menus` VALUES (6, 4);
INSERT INTO `sys_roles_menus` VALUES (7, 4);
INSERT INTO `sys_roles_menus` VALUES (9, 4);
INSERT INTO `sys_roles_menus` VALUES (10, 4);
INSERT INTO `sys_roles_menus` VALUES (11, 4);
INSERT INTO `sys_roles_menus` VALUES (15, 4);
INSERT INTO `sys_roles_menus` VALUES (28, 4);
INSERT INTO `sys_roles_menus` VALUES (30, 4);
INSERT INTO `sys_roles_menus` VALUES (32, 4);
INSERT INTO `sys_roles_menus` VALUES (33, 4);
INSERT INTO `sys_roles_menus` VALUES (34, 4);
INSERT INTO `sys_roles_menus` VALUES (35, 4);
INSERT INTO `sys_roles_menus` VALUES (36, 4);
INSERT INTO `sys_roles_menus` VALUES (37, 4);
INSERT INTO `sys_roles_menus` VALUES (38, 4);
INSERT INTO `sys_roles_menus` VALUES (39, 4);
INSERT INTO `sys_roles_menus` VALUES (41, 4);
INSERT INTO `sys_roles_menus` VALUES (80, 4);
INSERT INTO `sys_roles_menus` VALUES (83, 4);
INSERT INTO `sys_roles_menus` VALUES (90, 4);
INSERT INTO `sys_roles_menus` VALUES (92, 4);
INSERT INTO `sys_roles_menus` VALUES (93, 4);
INSERT INTO `sys_roles_menus` VALUES (94, 4);
INSERT INTO `sys_roles_menus` VALUES (97, 4);
INSERT INTO `sys_roles_menus` VALUES (98, 4);
INSERT INTO `sys_roles_menus` VALUES (116, 4);
INSERT INTO `sys_roles_menus` VALUES (118, 4);
INSERT INTO `sys_roles_menus` VALUES (119, 4);
INSERT INTO `sys_roles_menus` VALUES (120, 4);
INSERT INTO `sys_roles_menus` VALUES (121, 4);
INSERT INTO `sys_roles_menus` VALUES (122, 4);
INSERT INTO `sys_roles_menus` VALUES (123, 4);
INSERT INTO `sys_roles_menus` VALUES (124, 4);
INSERT INTO `sys_roles_menus` VALUES (125, 4);
INSERT INTO `sys_roles_menus` VALUES (126, 4);
INSERT INTO `sys_roles_menus` VALUES (127, 4);
INSERT INTO `sys_roles_menus` VALUES (128, 4);
INSERT INTO `sys_roles_menus` VALUES (129, 4);
INSERT INTO `sys_roles_menus` VALUES (130, 4);
INSERT INTO `sys_roles_menus` VALUES (131, 4);
INSERT INTO `sys_roles_menus` VALUES (132, 4);
INSERT INTO `sys_roles_menus` VALUES (133, 4);
INSERT INTO `sys_roles_menus` VALUES (134, 4);
INSERT INTO `sys_roles_menus` VALUES (135, 4);
INSERT INTO `sys_roles_menus` VALUES (136, 4);
INSERT INTO `sys_roles_menus` VALUES (197, 4);
INSERT INTO `sys_roles_menus` VALUES (204, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '梦辰雪', '男', '', 'tsuimengchao@163.com', 'avatar-20240302042334316.png', 'http://localhost:8000/file/avatar/avatar-20240302042334316.png', '$2a$10$Iu8THoMTZmqpE7JvkRPAbOye/9oTCaaOMHaFN.CLWXfhZhgBqdn/y', b'1', b'1', NULL, 'admin', '2024-07-08 11:48:37', '2018-08-23 09:11:56', '2020-09-05 10:43:31', 1, 1, '127.0.0.1', '未知', 'Windows 10', NULL, 'Chrome 11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试用户', '男', '15600618521', 'tsuimengchao@qq.com', 'avatar-20240426031742808.png', 'http://localhost:8000/file/avatar/avatar-20240426031742808.png', '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', 1, 2, '192.168.0.177', '未知', 'Windows 10', NULL, 'Chrome 11', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 5, 'common', '普通用户', '男', '15600168521', 'tsuimengchao@foxmail.com', NULL, NULL, '$2a$10$QN4tYvXkX2ZOIjRoYnSQEe.4/vR4eTevMwJZ0Eok0cl8uuYxaU5bK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', 1, 3, NULL, NULL, NULL, '2024-01-25 21:17:20', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 18, 'tsuimengchao', '崔梦超', '男', '18333191029', 'tsuimengchao@aliyun.com', 'cmc.png', 'http://localhost:8000/file/avatar/cmc.png', '$2a$10$geSY48NRbQleWKqJ/R7ae.JjuEx4LjdOPD75omh3UgWVwsBVwwsA6', b'1', b'1', 'System', 'System', '2024-01-30 13:10:46', '2024-01-30 11:58:28', '2024-04-05 14:41:05', 1, 4, '123.147.249.57', '中国重庆重庆市', NULL, '2024-04-05 14:41:05', NULL, 'EE5F91C7CD66BC0BC12E94947E276D80', '7450094325', '7726769', '59679126', 'oEv0d6-yZYb7X4MJ-ePmpfRskMJg');
INSERT INTO `sys_user` VALUES (5, 18, 'zhy', '赵浩悦', '女', '15176907852', '2490739669@qq.com', NULL, NULL, '$2a$10$jGXMDgNC9Cj1pDflaVlycuQbEhNyJeER4rbrNiShKV.MJideJ5/.6', b'0', b'1', 'System', 'System', NULL, '2024-01-30 21:59:15', '2024-01-30 21:59:15', 1, 5, NULL, NULL, NULL, '2024-01-30 21:59:14', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 18, 'biluo', '碧落', '男', '15281392341', '1633420846@qq.com', NULL, NULL, '$2a$10$p9mGsXxHEe8vbUoaPAqqsufNXMPpRb5c6e5R9U1D74oDVmIPsh8Z.', b'0', b'1', 'admin', 'admin', NULL, '2024-03-15 22:43:18', '2024-03-15 22:43:18', NULL, 6, NULL, NULL, NULL, '2024-03-15 22:43:18', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (9, 18, 'alipay', 'uniapp用户', NULL, NULL, '484132820@qq.com', NULL, NULL, '$2a$10$Wgp/4R6M68iivH/8Dpxmd.qsyC4KrbR2PlXUy6bDfh/Bi.u9equFG', b'0', b'1', 'System', 'System', '2024-03-24 00:15:26', '2024-03-23 01:57:28', '2024-03-23 01:57:28', 1, 7, NULL, NULL, NULL, '2024-03-23 01:57:28', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (10, 5, 'visitor', '游客', '男', '15600168520', '505113917@qq.com', NULL, NULL, '$2a$10$6uVltqN50obK/X/1WzViPeGVhR8BQJn3v6ghLEno0YQppAcblOCx6', b'0', b'1', 'admin', 'admin', NULL, '2024-03-23 11:55:43', '2024-03-23 11:55:43', NULL, NULL, NULL, NULL, NULL, '2024-03-23 11:55:43', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (11, 18, '测试', 'uniapp用户', NULL, NULL, '3313246839@qq.com', NULL, NULL, '$2a$10$ieqzJYwZ.pSgg.eKQrWQwOxjfcVqUOOsID3pwB9X0RLG6V0xHx2g6', b'0', b'1', 'test', 'test', NULL, '2024-03-25 19:16:09', '2024-03-25 19:16:09', 1, 8, NULL, NULL, NULL, '2024-03-25 19:16:09', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (12, 18, '彼时', '彼时', NULL, NULL, 'abc147369_1121@qq.com', NULL, NULL, '$2a$10$OHj74f7IZmUrbgd/Ma1UXuj8GKO2LFlU29I0QOXeAkejrlb2LQ9gW', b'0', b'1', 'System', 'System', NULL, '2024-04-28 21:27:02', '2024-04-28 21:27:02', 1, 9, NULL, NULL, NULL, '2024-04-28 21:27:01', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 18, 'shihan', 'shihan', NULL, NULL, '422149197@qq.com', NULL, NULL, '$2a$10$uNiF5BdMMVFl90.u5AJulOdMGeUk.VPTfLyKylu3ODOYsFukhEEmW', b'0', b'1', 'System', 'System', NULL, '2024-05-11 09:14:25', '2024-05-11 09:14:25', 1, 10, NULL, NULL, NULL, '2024-05-11 09:14:25', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_oauth`;
CREATE TABLE `sys_user_oauth`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `openid` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '唯一ID',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` varchar(2) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `email` varchar(80) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '头像地址',
  `country` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '国家',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '城市',
  `province` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '\0' COMMENT '省份',
  `privilege` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户特权信息',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '更新者',
  `auth_time` datetime NOT NULL COMMENT '授权时间',
  `create_time` datetime NOT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `oauth_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '授权方名称',
  `ip_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `ip_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT 'ip来源',
  `os` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '登录系统',
  `last_login_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`openid`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`openid`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`user_id`) USING BTREE,
  INDEX `inx_enabled`(`privilege`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统用户第三方授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_oauth
-- ----------------------------

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
INSERT INTO `sys_users_jobs` VALUES (9, 13);
INSERT INTO `sys_users_jobs` VALUES (10, 12);
INSERT INTO `sys_users_jobs` VALUES (11, 13);
INSERT INTO `sys_users_jobs` VALUES (12, 13);
INSERT INTO `sys_users_jobs` VALUES (13, 13);

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
INSERT INTO `sys_users_roles` VALUES (9, 2);
INSERT INTO `sys_users_roles` VALUES (11, 2);
INSERT INTO `sys_users_roles` VALUES (12, 2);
INSERT INTO `sys_users_roles` VALUES (13, 2);
INSERT INTO `sys_users_roles` VALUES (2, 3);
INSERT INTO `sys_users_roles` VALUES (10, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云文件存储' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tool_qiniu_content
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
