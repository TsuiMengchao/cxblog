/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : cxblog_local

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 23/02/2024 22:04:46
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (14, '1', 32, '关于博客', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/77e3405ae701468f968a65ffe989905f.jpg', '关于博客的一些介绍。', '<blockquote>\n<p>本文主要介绍博客用到的技术和一些功能详情</p>\n</blockquote>\n<h4><a id=\"1_1\"></a>1、博客使用到的技术</h4>\n<ol>\n<li>后端：springboot，mysql，es搜索引擎，以及redis</li>\n<li>前端：vue</li>\n</ol>\n<h4><a id=\"2_5\"></a>2、首页登录</h4>\n<p>本博客支持<a href=\"https://connect.qq.com/index.html\" target=\"_blank\">QQ</a>、<a href=\"https://gitee.com/api/v5/oauth_doc#/\" target=\"_blank\">gitee</a>、<a href=\"https://open.weibo.com/?bottomnav=1&amp;wvr=6\" target=\"_blank\">微博</a>、微信公众号登录</p>\n<h4><a id=\"3_7\"></a>3、图片的存储</h4>\n<p>项目中图片存储采用的是<a href=\"https://www.qiniu.com/products/kodo\" target=\"_blank\">七牛云</a>平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。</p>\n<h4><a id=\"4_9\"></a>4、首页的搜索</h4>\n<p>首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。</p>\n<blockquote>\n<p>码云地址：<a href=\"https://gitee.com/mcxgitee\" target=\"_blank\">点我进入</a></p>\n</blockquote>\n<h1><a id=\"bye_14\"></a>bye</h1>\n', '> 本文主要介绍博客用到的技术和一些功能详情\n#### 1、博客使用到的技术\n1. 后端：springboot，mysql，es搜索引擎，以及redis\n2. 前端：vue\n\n#### 2、首页登录\n本博客支持[QQ](https://connect.qq.com/index.html)、[gitee](https://gitee.com/api/v5/oauth_doc#/)、[微博](https://open.weibo.com/?bottomnav=1&wvr=6)、微信公众号登录\n#### 3、图片的存储\n项目中图片存储采用的是[七牛云](https://www.qiniu.com/products/kodo)平台的对象存储，因为只有七牛云每个月会有免费的一个额度，其他的都是需要收费的。\n#### 4、首页的搜索\n首页的搜索采用的是es的搜索，eslinux启动的话会占用比较高的一个内存，所以博主介意如需要使用es搜索的购买服务器时资金允许的情况下尽可能购买内存比较多的服务器。然后项目搜索的话主要是围绕文章的标题和内容进行的分词搜索。\n\n\n> 码云地址：[点我进入](https://gitee.com/mcxgitee)\n# bye\n\n', 0, 1, 1, 1, NULL, 113, '2021-10-15 09:57:22', NULL, 1, 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 904 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------
INSERT INTO `blog_article_tag` VALUES (903, 14, 10);

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
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_name`(`name`) USING BTREE COMMENT '博客分类名称'
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (32, '博客文档', 0, 0, '2023-09-07 10:03:31', '2023-09-07 02:03:30', 'el-icon-document');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章收藏表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '表情表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_feed_back
-- ----------------------------
INSERT INTO `blog_feed_back` VALUES (2, '2', 'test', 'test', NULL, NULL, 1, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci COMMENT = '用户关注表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子话题表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_forum
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子评论表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '圈子内容点赞表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '友情链接表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_german2_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_im_message
-- ----------------------------
INSERT INTO `blog_im_message` VALUES ('120284742af03784761633a1179fb557', '2', '2', NULL, '恭喜您签到成功', NULL, '未知', '192.168.1.3', 0, 1, NULL, 5, NULL, 0, NULL, NULL);
INSERT INTO `blog_im_message` VALUES ('6ca60bdb722ca2184af23e25712e0450', '1', '2', NULL, NULL, NULL, '未知', '192.168.1.3', 0, 1, NULL, 5, 14, 3, NULL, NULL);
INSERT INTO `blog_im_message` VALUES ('9b4657bf8b6d3cd4ad18abb0cdd623fc', '1', '2', NULL, NULL, NULL, '未知', '192.168.1.3', 0, 1, NULL, 5, 14, 4, NULL, NULL);
INSERT INTO `blog_im_message` VALUES ('deffe83f0866331cd9668c40febaa734', '1', '1', NULL, '恭喜您发布了一篇文章', NULL, '未知', '192.168.1.3', 0, 1, NULL, 5, NULL, 0, NULL, NULL);
INSERT INTO `blog_im_message` VALUES ('f285dd14ee9594ab692c7912933a9076', '1', '2', NULL, NULL, NULL, '未知', '192.168.1.3', 0, 1, NULL, 5, 14, 4, NULL, NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息房间表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_message
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站导航表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '道具表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '说说表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_say
-- ----------------------------
INSERT INTO `blog_say` VALUES ('12364f5aa99ee34d85ee2af4abc766e3', '1', '', '<p>下午跟我妈去姥娘家了，所以没跑步。我老舅说我长得有点女相，好离谱哈哈哈。</p><p>今天没啥特别的，平平淡淡的一天。</p><p>倒是下午的时候，我爷爷喊我带着我去他家，正逢我妹妹让我帮她打车去县城，我就让我爷爷等一下，然后我爷爷就很着急的催我。等我给妹妹打上车出来找我爷爷时，我爷爷已经急着回去了。</p><p>我感觉我对她的心情和态度有点变了，可能我忽然意识到，她们在一起，会比和我在一起，会让她更开心一些吧。她为我付出了也挺多的，没有体验过被当小朋友般呵护的感觉，或许现在她很快乐呢，我再去打扰和破坏就不合适了，我就当个旁观者吧。我认输了哈哈哈，不是说我不爱她了，只是现在有人能代替我去照顾她了，我不该再坚持了。我依旧会想她，想要等她，也希望永远等不到她（因为这说明她永远都很幸福）。我输的一塌糊涂，很失败呢。不过这是我应得的，我亏欠她的。不想再去计较得与失了，付出了多少，受到多少伤害，想那些没有任何意义，要怪只能怪我自己太任性，太不成熟了。所以给她带来了太多太多亏欠吧，其实我应该感谢你的，而不是一味的责怪你。</p>', '河北·石家庄', 1, '2024-02-07 23:46:29', NULL);
INSERT INTO `blog_say` VALUES ('1636e801f62c02bb04dd70eb7fc7ea22', '1', '', '<p>今天又是啥都没干，上午的时候绕着乡沿着公路快走了一圈，1小时20分钟左右，8公里多一些。下午的时候原路反方向走跑了一遍，正好一小时。</p><p>今天跟她聊天不多，运动确实能转移注意力，并暂时让自己忘记所有的烦恼。</p><p>我又梦到她了，哈哈哈，梦里面没有任何逻辑性。先是在一个奶茶店跟着老师制作售卖，后来视角转到了一个牛场里，然后有个离谱的设定就是，牛太渴了不喝水就不吃草，然后视角再转就和她在一起了，合作用一个很长的类似消防水带的东西输送水。后来弄完水后视角再转我所在的对面楼上，她妈妈在那里，在梦中她妈知道她谈着对象了，好像知道了一些我俩的经历，但是不知道她当时对象不是我了，也不知道她妈妈得知的那些经历字中那个男生是我。</p><p>然后在梦中她妈妈一直在劝她，不要相信我，不用跟我结婚，就算我们一起经历了很久也不算什么。我在旁边房子的窗户扒头听着，当时感觉挺五味杂陈的。</p><p>不过在梦中她似乎没听她妈的话，后来她离开了那个房子，我在后面偷偷跟着她，避免她妈发现我。后来视角转到一个床上，在床上躺着，她紧挨着一个男的，我和她之间有半米多距离，她跟我说谁谁等了谁谁一辈子（好像是韩信哈哈哈，也好像不是），然后我感叹，说王宝钏也等了薛平贵好几十年。当时具体说什么记不清了，大概主题就是等待心爱的人。后来我问她旁边那个人是你对象吗，还没有回答，视角就转了，我在四处寻找她，期盼着与她偶遇，就像高中时那样。后来有人给我发消息，问我QQ名片咋还没改，我看了一下，名片上有她的名字，我犹豫了一下还是没改。之后梦就结束了。</p><p>写这篇的时候，已经过去了十多个小时，有些细节已经记不到了，所以前半段梦境好像进展很快哈哈哈。</p><p>突然感觉她从不主动把我和她的关系，她有对象这件事告诉任何人是一个人是一件非常明智的选择。现在我失去了她，可我不知道该跟家人、亲戚和朋友们解释我和她分手了。家人和亲戚跟我聊天时偶尔还会问到我，我跟她怎么样了，还有在联系嘛，回来之后打过多少电话啊，有没有她的照片啊我们看看之类的，我好难回应啊，而且一想到她，想到她和他，就好难受啊。</p>', '河北·石家庄', 1, '2024-02-03 19:04:59', NULL);
INSERT INTO `blog_say` VALUES ('16a33316edc6ad514c595453f505b560', '1', '', '<p>晚上一直跟她吐槽曾经她给我带了的快乐和失望，所以没注意时间就过了0点才来写日记。以前和她的矛盾基本都解决了，只是太晚了。只能成遗憾了。</p><p>上午去爷爷家扫雪，然后正常运动，希望体重下降了吧。中午的时候我爸爸灌灌肠，我舅舅他们来帮忙，然后我舅舅就说我妈的不好，等他们走了之后我妈就开始责怪我爸跟他们说我妈的不好了。</p><p>下午正常跑步，跑步中途歇了一会买了两个烤肠，白跑了。</p><p>晚上我舅舅让我妈转了我500，然后去买了些卤菜，晚上喝酒。途中我舅舅就一直在说等我结婚怎么怎么样，然后一会挣钱买房子啥的，我就说不想那事，他们以为我说的是不去想买房的事，实际上我是不想去想未来结婚的事情，她都走了，我去跟谁结婚啊哈哈哈哈哈。喝到后面可能我舅舅就有些醉了，就一直吐槽自己的事情。我不想听了就借机跑了去外面散步了。</p><p>晚上回来的时候，跟她聊到我觉得她哪里好了，我就跟她讲了讲我印象中她的好与坏，到了后面我基本都要哭出来了，或许是心里积累的所有疑惑，不理解，疑问全都以讲故事的形式想她问出来了吧，虽然并没有得到满意的回答，但至少不会积在心中了。可惜，最后她只给我留下来伤害和遗憾。</p><p>——补2024/02/05</p>', '河北·石家庄', 1, '2024-02-06 00:21:03', NULL);
INSERT INTO `blog_say` VALUES ('18bd5b12969006f0657a73a5ab53119d', '1', '', '<p>今天上午打车去zgn家了，然后一起去镇上吃了顿饭，喝了点酒，我不是很爱喝，就喝的比较慢。然后吃完要回去时，打车没人接单，就骑电车把我送回去了。</p><p>我在他家的时候，与她的距离可能就几百米，我当时最想做的事情就是去找她，最期待的事情就是能与她见面，但我不能，好可惜啊。</p><p>送我回家的途中，还聊到了她，问我她是不是有对象了，说昨晚zyf借她王者号看到绑着恋人关系。</p><p>不去想她的事情了，是我对不住她，我没资格再去舍不得，念念不忘。更不能去影响她们吧。感觉自己跟她聊天的语气态度都有点在渐渐疏远了。但是有些事情，不能忘记啊。</p><p>今天运动量肯定不够，估计体重要涨了。</p>', '河北·石家庄', 1, '2024-02-08 22:34:59', NULL);
INSERT INTO `blog_say` VALUES ('22101871dbdc0e589353dde0876d4c81', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917846.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917853.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240130_1706620917875.jpg,', '<p>今天想解决一下第三方登录的问题，原本打算用spring-boot-starter-oauth2-client，然后看原本的是用JustAuth弄得，想了想还是用现成的吧，结果出了莫名奇妙的问题，搜索说是hutool和其他冲突了，无从下手，还是有时间了换成spring-oauth2吧，统一一下。而且现在第三方授权的APPID什么的也都还没申请下来，先不急搞。</p><p>同学送的脐橙到了，还挺好吃的，跟家乡超市的味道确实不一样。</p><p>今天做了两个很真实的梦，真的很真实。第一个梦中有她，一个白天过去了，一些细节记不得了。只依稀记得是傍晚路过蜜雪冰城，买了一些冰激凌和两杯奶茶，然后因为太多就放楼下的窗台上，是一个多层高的楼。后来去了房间，有一些沿着屋子两端排着的很多桌子，很多人都用着电脑在完成某些东西。她就在我的后面。然后她在用笔记本电脑跟她对象打视频电话，依稀只记得她对象就问她，她还爱我吗，她有些犹豫，还有问现在对我是是什么感情。然后因为是视频电话嘛，我就向她那里靠近了一些，就入镜了，然后我嗯哼了一声。然后她对象看到她和我在一个房间，就生气的挂了电话。然后记不清了，再然后视角就转到了睡觉时，床上。她来找我，好像是想要和好，我没犹豫就和她抱在了一起，吻在了一起。然后嗯嗯，之后然后忽然想起来买的奶茶和冰淇淋还在楼下，然后去拿，结果不知道怎么滴视角就转到了一条浮空的船上。然后正当我和她，然后就看到旁边一对男女在拍成人影片，然后我们怕有人拍，就不干了，打算离开，然后旁边一个看着像海盗的人就生气了，就先把她丢了下去，然后让我自己跳下去，我说我先穿个衣服，结果嫌我太慢也把我丢了下去。然后我就醒了，凌晨五点半吧，当时感觉很恍惚，当时印象先是停在我和她和好，还很高兴，然后梦境记忆很快恢复，意识到那只是一场梦，真的好失落啊，如果是真的该多好。</p><p>之后很长时间睡不着，不过最后还是睡着了，然后那个梦时间点应该是正月初三，正是去长辈家拜年的时候，我叔叔等人和我爸他们去长辈家，路上我叔叔他们走的比较快，就只剩下我爸骑着电车带着我，然后不知怎么回事，我爸好像出了点问题，电车就向右侧倾倒了，然后我站起来看到我爸瘫软在地上，好像几乎没意识了，我完全不知道现在在哪，然后赶紧联系叔叔让他原路返回来看看，当时害怕极了，打字的手都在抖，短短一句话输错了好几遍。然后就扶起我爸来，往前走去找他们。当看到他们时我忍不住泪一直往下流，止都止不住。我以为我是那种感情比较淡泊，共情能力比较差的人，平时关系一般的亲人就算去世了，也挤不出一滴泪来，可在这场梦中，眼泪止都止不住。后来发生什么就没印象了，然后视角转到了晚上，我走到院子里（应该是某个亲戚家），看到我爸基本没事了，只是还有点虚弱，当时就感觉好放松好开心。然后梦就醒了。</p><p>两场梦，一场是美梦开头，悲剧结尾（几十米高被丢下去当然算悲剧哈哈哈，醒了之后的恍惚更加的悲剧了），另一场悲剧开头，但结果还算是可以接受。</p><p>跟她聊天真的感觉自己好卑微啊，她总是说自己很忙，隔两三个小时才回复我几条消息，或者几个字，一个表情。可是真的会有那么忙嘛，忙到看手机的时间都没有。在家里怎么会那么忙。感觉现在我和她就像是身份互换了一样，曾经我因为实验室任务和自己爱好，经常也是忙到没时间理她，照顾她的情绪，或许这就是她对我的惩罚吧。可是我真的好难受啊，诶。</p><p>想让她陪我聊聊天，想到了可以一起打王者，我就把王者下了回来，然后这个哄着她陪我我。她害怕她对象知道，我就把我全部信息修改或者隐藏了，只为了让她放心能陪我，我这么做，真的好吗，我不知道，我只知道，我会开心一些，这就值得了。</p>', '河北·石家庄', 1, '2024-01-30 21:22:04', NULL);
INSERT INTO `blog_say` VALUES ('2348bba8bc53352fad769b69c1f279f7', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240201_1706801409233.jpg,', '<p>今天心情不是很好，受她影响，跟她抱怨了好久，这不像是我的风格啊。所以今天啥也没干。</p><p>下午的时候跑步去给妹妹去乡里拿快递，回来时有个不认识的村里的人把我带了回来。好多人我都不认识，对方却认识我，真是奇了怪了，就在旁边议论这就是谁谁家的儿子......</p><p>今天运动量到了999千卡，纪念一下。</p><p>因为她总是对我爱答不理的，所以晚上就没等跟她聊天，提前开始健身洗澡了。</p><p>好不能理解现在这样的我自己啊。</p>', '河北·石家庄', 1, '2024-02-01 23:30:19', NULL);
INSERT INTO `blog_say` VALUES ('3c31ff99e67932563ffaf7312d59707d', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/962d327b9a0644b3806d33531ba55505.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/ac4236e7120a4b428379c236678651dc.jpg,', '<p>今天又摆烂了一天，明天不能再这样了，一定。</p><p>昨晚王者充值了1080点券，然后卡着凌晨0:00送了一个瑶的遇见神鹿和按键皮肤给了她，送她是为了膈应她对象哈哈哈，我是不是太坏了，因为在她还是我女朋友时，他就给她送了一个瑶的山海·碧波行皮肤，就在去年的今天，2023/1/23。我原本很喜欢瑶的，瑶跟我同一天生日，可是嘛，已经不喜欢了。</p><p>今天醒的很早，然后睡着又做了好多个梦，先梦到她看到我送她皮肤了，然后不知道什么原因，我们聊着聊着她生气了，好像把我删了；然后第二个梦梦到了我和室友以及学姐去了酒吧；然后第三个梦梦她闺蜜，我问她闺蜜关于她和她对象的事情，在梦中她对象是小她两岁的大二学弟，她闺蜜也很不看好她对象（这个场景怎么那么像我大姐对她闺蜜对象的描述啊哈哈哈，也好像记错了），现实确实大她两岁的上班族。</p><p>下午的时候原本打算跟她继续打游戏呢，结果先是因为她看剧，后又是我去拿快递了，就没玩成。</p><p>晚上真的闹矛盾了，她把我QQ删掉了，梦成了现实了，当时我真的好想不通，很惶恐，很怕就再也没联系了，同时又好生气，所以跟她说了好多好多，道歉了好久，很惶恐，最后又把我加回去了。</p><p>今天她跟我说的有些话让我触动很大，有些话让我感觉自己很难受。</p><p>放了我和她的两张聊天截图，第一张是她接受我送的皮肤后，她对象王者在线时，我邀她打王者时她对我说的，她当然没接受我，而是跟她对象玩去了。第二张是我重新加回她好友时聊得。</p><p>就在写这篇说说时，她帮我付了我想买的内存条的款，按照昨晚的约定，我要教她学前端开发，顺便完成我大二时的想法。</p>', '河北·石家庄', 1, '2024-01-23 22:12:22', '2024-01-23 22:12:22');
INSERT INTO `blog_say` VALUES ('40cc0571c2420f55c0ddba7bafdcd1be', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/8fb53e82b9a04cb292ab1a8965e7c9f2.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/65a76fbd2c134848b88eff453d20b2ef.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/005a3fa114274f49b676a922127c1fe1.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/d38e2db70b3f445ca51253fb8eceb7eb.jpg,', '<p>今天和同学跟妹妹去县里吃了排骨虾，然后看了电影“一闪一闪亮晶晶”，这个电影的结局果然有反转，只是只猜到了一半，哈哈哈。去找那个影院的时候找了好久，结果它在后院，前院是酒店。</p><p>同学回去了，晚上可以偷偷锻炼身体了哈哈哈。</p><p>下午的时候，域名备案通过了，然后解析了一下，现在终于可以通过域名访问了。</p><p>刚解析域名的时候，发现连服务端一直报错，原来是要在宝塔里面打开外网映射。</p><p>今天数据库又被别人删了，我是真没比特币付你啊，你删我数据库也得不到什么好处啊。</p><p>那个管理端前端在本地编译运行就正常，打包就莫名奇妙的报错了，奇怪。到最后只检查出来是tag_cloud.js这个工具类里面产生的错误，不引入就好了，改天有时间了再仔细检查哪里出错了吧。</p>', '河北·石家庄', 1, '2024-01-26 22:53:12', '2024-01-26 22:53:12');
INSERT INTO `blog_say` VALUES ('4d707753b022300f8f4f479d00797257', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9950b47df24b766887824338a8fb3b10.png', '<p>今天上午发现远程数据库又双叒叕连不上了，这次服务器本地都连不上，然后一看发现数据库关了，无法启动。现在无法启动，无法卸载，更无法使用，懒得管了，就先把本地搞好吧，等域名备案通过了再研究研究。</p><p>tqs跟我要地址给我寄一箱脐橙，我以为都忘了算了呢，没想到他还记得。</p><p>两个项目越融合bug越多了，一点点搞吧，倒也不是很急。</p><p>entity里面的参数不一定非得跟数据库一一对应，可以多一些，更方便多表联查。从数据库取数据用entity，返回到前端用vo。entity与mapper查询字段要一致，不一致用as让它一致，要不人不赋值，因为这个调试了好久，诶。😂</p><p>跟她，不知道该怎么办了，舍不得“形同陌路”，但是继续跟她联系真的好难受，像是沸羊羊一样，难受死了。感觉以前我对她的作为真的好不值，之前朋友劝我不要给，我想都没想就给了，甚至我自己都没钱吃饭了，变卖游戏账号都给她了，可是，现在忽然发现，我的这些行为就跟打水漂一样，不，水漂都没打起来。</p><p>今天忽然发现又回到了余额都花完的日子了，想让她送我一根内存条，她拒绝的很果断，只有一个字“不”；试探性问她如果跟她借钱，她会借我吗？她过了好久才回我“有，我就会借”，可是她永远都是说她很穷，没钱。诶，倒不是说她做的不对，只是我听了她说的，真的感觉以前我的行为好不值。当时差点就对她说，我后悔了，你把钱还我吧之类的。可是我还是不忍心啊，只好说“算了算了，不为难你了，我狠不下心。”，“不跟你要钱了，估计你也没有多少钱”。诶，某种情况下算的话，我为她付出的钱没有4w也有3w了吧（莫名为她损失的钱也少不了多少），这钱看起来不算多，可我还只是个未工作的大学生啊，这对我来说真是巨款了，我学费都是申请的贷款，5年也才4w啊，诶。可是对比钱，她才是对我更重要的，只要她回来，就算再花一倍的钱我都愿意啊，可惜没有如果。</p><p>现在钱也没了，她也走了，诶。</p><p>数据库无法启动的原因找到了，端口被占了，然后改了个端口，在服务器本地连上数据库后发现了一件让我哭笑不得的事情，被个挨千刀的删库了。</p>', '河北·石家庄', 1, '2024-01-21 22:21:23', '2024-01-21 22:21:23');
INSERT INTO `blog_say` VALUES ('4fc09d7441e2890961883dcbd80cf5b9', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708518410788.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708518419974.mp4,', '<p>补2/18</p><p>今天好冷啊，-1℃，还有5级大风，我穿的很薄的春秋季衣服，冻死得了。</p><p>先去了大同古城，逛了一下雕塑博物馆，然后就打车去了恒山。</p><p>跟她吐槽了一下天气差，她还是一如既往的劝我放弃，不过我是属不撞南墙不回头的倔驴的哈哈哈</p><p>爬山起点在半山腰，需要先过一个6公里的盘山公路，啥也不说，淦就完了。上山用了多久不知道，爬上去应该一个小时左右吧，也没记，下山半小时，后面六公里应该近一个小时吧。</p><p>天气真的很冷，爬到山顶时，忽然发现农夫山泉结冰了。然后在山顶排队打卡时，起雾了，山顶雾真的好大。</p><p>回去时计划第二天去方特玩，所以定了个最近的酒店，就没定舒适型。原本打算定两晚，结果只能定一晚，后来续了一晚，结果一看，这个比昨天的酒店还差，马桶没水是最不能理解的，然后洗手液就是肥皂兑水，还有其它的不想吐槽了。</p>', '山西·大同', 1, '2024-02-21 20:27:07', '2024-02-21 20:30:20');
INSERT INTO `blog_say` VALUES ('56c8797c97b6e33676329cc0de57745e', '1', '', '<p>补2/17</p><p>乐堡士，中国式汉堡，里面居然还有黄瓜甜面酱和葱丝。</p><p>出发去山西，做了好久好久的火车，都要坐睡着了。</p><p>眼镜拿到了，他打磨前忘了先要过来验一下镭射防伪标，打磨后标没了，也忘了跟他要发票。带上眼镜后看东西感觉小了好多好多，去山西大同吃刀削面，面上来的时候，看着那个碗就巴掌大小，还很纳闷，结果摘了眼镜看就正常了。</p><p>七天酒店真的很差，没拖鞋，没隔音，电话还是摆设，也没提供矿泉水，不过百多块钱，也算正常，可能是我舒适型酒店住多了吧，经济型没住过几次。</p>', '河北·石家庄', 1, '2024-02-21 20:00:07', NULL);
INSERT INTO `blog_say` VALUES ('622129ac5d0c316ed9a860995cfb14d7', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/2e2fa4f7c50a359dd9b174f865ab4594.png,', '<p>把退出登录的bug解决了，文章显示什么的也正常了，图片存储路径换到了七牛云，其它乱七八糟bug也修复了一下。然后再服务器上提交了最新的。</p><p>向github推送的时候报了上百个错，基本都是代码格式不严谨的错误，这代码错误按理来说不会影响git推送啊，奇怪了。</p><p>酷狗音乐好像会占用8000端口，真的是干的漂亮。沿着8000端口的pid一直向父级杀，结果才杀了三个进程，电脑就白屏了。</p><p>送她的手柄她不要，就只好改快递地址，然后自己拿了。</p><p>这几天她一直都表示没时间，额，想一起玩游戏或者教她学前端都没机会。打算先从vue框架开始，根据这个博客让她一点点拓展吧，先用静态数据，慢慢一点点加。具体进度得试试才知道了。</p>', '河北·石家庄', 1, '2024-01-27 22:04:52', '2024-01-27 22:04:52');
INSERT INTO `blog_say` VALUES ('6ce9ca79093b89cd884518458e814cd5', '1', '', '<p>补9号，因为晚上在忙，就没时间写。今天没干啥，下午去了爷爷家，然后傍晚的时候我爸放了个孔明灯，然后我伯伯他们就回家了。之后就是做饺子，吃饭。然后隔壁着火了，隔壁家是没人的。</p><p>后来晚上就跟着出去转长辈家，喝了点酒，有点多了。</p><p><br></p>', '河北·石家庄', 1, '2024-02-10 23:32:53', NULL);
INSERT INTO `blog_say` VALUES ('6f828dd04628899945183371affbd502', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005662284.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005666076.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708005854141.jpg,', '<p>中午的时候喝妹妹去县城，我去配眼镜，看看眼镜价格合适的话就直接配一个，第一家眼镜店只能给到9折，而且不配镜不给详细验光。然后就去了第二家，可以验光，然后听我吐槽第一家眼镜店的时候，看了一下价格，然后跟我说可以给到6折，想了一下也还算在接受范围之内，蔡司A系列1.60镜片，828元。就配了一个，只不过没现货。其实去之前看了一些眼镜以及报价，那些基本都是3折，但是因为第一个眼镜店完全不给折扣，导致到第二个眼镜店时，听到6折就没砍价，其实要砍应该能砍到5折的哈哈哈。不给问题不打，6折也在接受范围，不过是边缘罢了。左眼200度，有眼575度，各50度散光，偏差有够大的，戴了一会眼镜之后摘掉，感觉世界一下子模糊了。</p><p>后来去吃了点东西，吃了好多，减肥计划宣告破产了要，所以没吃晚饭。</p><p>五点多的时候突然想起来有几个小酒馆，想去看看怎么样，就喝点了，中途还有个人可能是喝多了看我一个人，就跑来敬酒，还说我口音不像是本地人，或者不是在本地长大的，我真是笑了。后来听我说我还是学生，没工作，他就说那我没话说了，然后就走了。等喝完九点多手机要没电了，去找我妹妹，结果她还不回家，就跟她互换了一下手机。然后打算22:40看电影，当时9:30左右吧，就打算唱一个小时k，结果250起步，唱不起，所以就大街流浪。后来看电影想法也放弃了，看完都12点多了。然后妹妹还不打算回家，没办法继续流浪，去了另一个ktv，也要一百多起步，还不如去酒吧呢，所以去另一个酒吧开二场，到了就马上一点了，他们一点打烊，然后加上清理，基本不到两点就结束了。然后去找妹妹结果她们吃饭去了，就离谱。凌晨三点多才回到家，我是流浪者。</p><p>别人的情人节怎么度过的我不知道，反正我的情人节是独自酒吧和流浪。</p><p>今天跟她聊天几乎不回，看她QQ状态显示2G在线，而不是WiFi在线，我就怀疑她是不是出去找她对象去了，所以就把QQ切换成另一个了哈哈哈，然后我就用自己两个互相切换测试了一下，发现切换后是离线，而不是2G在线。然后我想给她QQ发消息她可能看不到，就微信给她发，然而微信也没回复。后来很久之后她跟我解释，她是去干活了，没网。</p><p>晚上的时候她跟我说她微信和我的聊天记录没了，我就问她是不是删聊天框了，怕见她对象时被“查岗”，她说不是，可能是无意间删了。</p><p>晚上的时候，谈到家里管得严和松的话题，我就想到当时的她和现在的我妹妹就是两个极端。然后我就吐槽了一下，我对以前的她有多么多么的不满。</p><p>她问我如果她把我删了，我会怎么样，我会怎么样我怎么样知道，反正肯定会伤心就是了。可惜羁绊和牵扯太多了，要不然如果没希望了的话，我或许会直接选择重开吧，不是重新开始的意思，但也是。致敬小王子，哈哈哈哈</p>', '河北·石家庄', 1, '2024-02-15 22:06:46', NULL);
INSERT INTO `blog_say` VALUES ('74e9d069e4bad182fa6d6529ecf40ef4', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/c11c88d3eda34360bed5b4ae85c2c591.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/929b6e40d5d34b298d8e82b2f32b8d4c.jpg,', '<p>今天中午的时候起来，突然想到昨天Navicat连接不到宝塔的数据库会不会是因为没有在宝塔面板放开防火墙的3306端口，结果一试还真是，还以为只用加服务器安全组规则，没想到宝塔自带防火墙。</p><p>吃午饭时突发奇想，发现把博客前端代码放到二级目录后发现无法正常运行了，奈何当时用的手机，没法调试。</p><p>下午去找大姐和同学玩了，看了场电影（花千骨），感觉不如电视剧，差评。当时到电影院时，这个票刚刚停售，然后找工作人员现场买票，发现我们之前都没人买，我们仨包场了哈哈哈。还一起吃了顿火锅，吃的时候聊到了她，诶，确实有些意难平啊，感觉自己多少有些冤大头了。</p><p>下午的时候还刻了个章，我也是有公章的人啦，灵寿县辰雪科技工作室，至于为什么用辰雪而不是梦辰雪，大概可能也许是因为没梦了，梦醒了吧，哈哈哈哈。</p><p>还是很想她呀，可惜她有对象了，回不去从前了呀。</p><p>图片放了电影票根和公章回执，记录一下留个纪念，万一以后用得到还方便找。</p>', '河北·石家庄', 1, '2024-01-20 22:08:09', '2024-01-20 22:08:09');
INSERT INTO `blog_say` VALUES ('7b6a5a14dd86598363dde98a83f7706e', '1', '', '<p>今天上午啥也没干，下午和她打了会“双人成行”（原本打算2点左右开始玩的，但是她突然说心情不好，不想玩了，就自己待了一个小时），晚上的时候把email，dict模块合并了，前端管理系统缺少显示的菜单也补充上了。</p><p>中午的时候，她昨晚给我付钱的内存条到了，安上了之后电脑明显流畅多了。</p><p>原本今天打算教她安装node的，但是她上午和晚上没时间。</p><p>晚上和同学跟妹妹一起吃了烧烤，没吃饱，吃的还没以前的一半多，因为我要减肥，特意控制了哈哈哈。</p>', '河北·石家庄', 1, '2024-01-24 23:45:55', NULL);
INSERT INTO `blog_say` VALUES ('7d942361c018f098c925ad0a4870c268', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240204_1707050237340.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240204_1707050247317.png,', '<p>依旧没弄啥，微博开发者审核通过了，就创建了一个应用。把线上线下数据库同步一下，以后基本都用同一个吧。</p><p>上午正常快走了近10公里，下午就只跑了1.5公里，今天运动量不如昨天，吃的比昨天好得多，估计减不下肥了。</p><p>下午的时候跟爸爸去赶集，回来之后打算去跑步就下雪了，晚上也就没散步。</p><p>上午的时候她说不知道干嘛，就问她要不要一起玩王者，她说各玩各的。我上线看到了她，邀她，她没回应。后来看着她变成“组队中”-“队列中”-“游戏中”，然后我就下线了。</p><p>晚上的时候问她能不能陪我打王者，先是找各种理由，后来又说她有对象，再和前任玩不合适，再后来就不理我了，之后换个话题了。</p><p>晚上忽然想到上月的个税还没报，登录河北税务下载扣缴端时看到一条未读通知，有点炸裂。</p><p><br></p>', '河北·石家庄', 1, '2024-02-04 20:37:32', NULL);
INSERT INTO `blog_say` VALUES ('7e398c63df29b94094257670561679c5', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009150558.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009342170.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/2e4c81b06dffa460de5c0f2aa66cbff16.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009349444.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/42f6138869250a4883ea1beb0c4fc2d51.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240215_1708009359797.jpg,', '<p>上一条是补的昨天的，忘写明了。</p><p>凌晨3点多回家后，洗了个澡，然后五点多才睡，设的7:30闹钟，以为8:30前就要全部到场，多来几次阎王该夸我好身体了。然后看了一下，是9:30前全部到场，所以又睡了半个多小时。</p><p>还是一如既往的不喜欢拍照，我对自己极度不自信，很自卑，很排斥拍照录像。</p><p>然后吃席吃席。</p><p>下午尝试改了个官网出来，所以没有运动的时间了，而且改出来的很奇怪，原本想模仿米哈游官网的，但是我真不会前端。</p><p>晚上和发小跟初中同学去吃烧烤，忽然感觉自己好沉默哈哈哈，我就是这个性格，大家也都知道，只有她不知道，所以她离开了，所以我应该改掉这个性格。我讨厌这样的自己。</p><p>上传几张我入镜了的照片，虽然我不排斥拍照吧，但要是拍的不丑，也能接受。</p><p>晚上跟她聊天，她总能在字里行间透露出对我不再在意了，对我在刻意疏远，不止是在今天。她总是能一次又一次的让我突然伤心。可是我不能怪她，她做的没有错，错的是我，是我自作自受。果真是天道好轮回，苍天饶过谁，哈哈哈。</p><p>可是我也好委屈啊。</p>', '河北·石家庄', 1, '2024-02-15 23:03:25', '2024-02-15 23:17:47');
INSERT INTO `blog_say` VALUES ('7fd940c8692fe307ed4daf17c2a38b9e', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240216_1708098817554.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240216_1708098903543.jpg,', '<p>摆烂的一天，啥都没干，全在看小说，下午三四点的时候很困，就睡着了。</p><p>今天她生日，忽然想起来她以前说的农历生日是啥时候。原本打算20240227做的事情就提前到今天了，反正目的只是为了提醒自己，有些事不要忘记。</p>', '河北·石家庄', 1, '2024-02-16 23:55:07', NULL);
INSERT INTO `blog_say` VALUES ('8eec85826206c052f2098a1e164151ee', '1', '', '<p>从爷爷家回来后，躺床上迷迷糊糊就睡着了，一两点的时候醒了，洗了个脚就睡了。起来之后就9点了，洗了个澡所以就没去上坟。</p><p>穿上了去年过年忘穿的新衣服，上衣正面太花哨了，就反穿的。</p><p>然后跟我妹妹一起去各个爷爷家串了串门，之后就没啥了，无非就是歇着。</p><p>拼多多的提现是真的离谱，果断放弃。</p><p>今天中午的时候取了个快递，京东的牛奶，大年初一都不放假啊。</p><p>连续两天没运动了，今天早晨和昨天裸重涨了1.6斤。不知道明天会怎样。</p>', '河北·石家庄', 1, '2024-02-10 23:37:43', NULL);
INSERT INTO `blog_say` VALUES ('94047ecfbc692a43856651467f159894', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/3840c905fc8ab68a6ae4d76e3f0e2fec.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/7d990a3a32e8c3ea187f94acd3da5d4d.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cd00756e8ced7d8b104ab26e03a8a760.png,', '<p>今天休息，没改bug，明天继续吧。</p><p>中午才起来，然后下午的时候跟她玩了近三个小时双人成形，终于玩通关了，在游戏中，Cody和May抱在一起的时候，我对她说“浩悦，我爱你，嫁给我好吗？”，虽然我知道她不想听，也不会给我什么反馈吧，可我还是说了，如计划般的，算是为了弥补一份遗憾吧。之后就是卸载游戏了，我所有设备中的最后一款游戏。分手（胡闹）厨房买了还没玩过，虽然也没有机会了。</p><p>原本在想要不要把王者下回来，陪她玩，可她却以不想她对象误会为由，拒绝了，很正常，符合我的预期。只是，我和她以前，我为何未曾有这样的待遇呢。</p><p>好像从高中时起，我妹妹就记住了她的名字，也不知道该怎么解释呢。</p>', '河北·石家庄', 1, '2024-01-28 22:08:27', '2024-01-28 22:08:27');
INSERT INTO `blog_say` VALUES ('95a1381a0a32effbdb5a00641cddef18', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240213_1707823858260.png,', '<p>补12号，中午的时候才起床，然后去奶奶家，叔叔他们1点半就走了。然后就去跑步了，今天好热，跑起来一直出汗，后来跑了三公里的样子就没在跑了，改成了走，走的倒是挺多，三万九千多步一共。</p><p>一开始她没领我送的皮肤，后来我一再要求下她才领。后来跟她聊天聊着聊着她情绪好像不对了，好像有些不开心了。</p><p>如果高中毕业报考大学时，和她没有闹矛盾该多好，或许就会和她在同一所大学读书，也就不会产生那么多误会了，那样可能我和她现在还在一起，甚至可能也快结婚了吧，可惜这世界上没那么多的可能啊。</p>', '河北·石家庄', 1, '2024-02-13 19:31:02', NULL);
INSERT INTO `blog_say` VALUES ('9a80d457d215f7813ef75c1369fe4fd2', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/89429c318d9641468586dbb10b6efea9.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1956893dd398497694a97b07d72ebc21.jpg,', '<p>昨天把大二时注册的域名xn--jduy7zg5y.xn--6qq986b3xl赎了回来，所以凌晨的时候就干脆买了一年云服务器，装了个宝塔面板，配了下环境。但是那个mysql用Navicat远程死活连不上，百度了一会也没解决。</p><p>中午下午的时候把那个辰雪博客（根据eladmin和shiyi博客改的）的代码部署了上去，两份代码的融合还有些问题，一些bug也还没处理，所以部署上去后就更多问题了。</p><p>打包springboot项目时还以为环境配置文件会跟vue一样，自动识别切换，结果不是，反复打包测试了几遍才找到原因。😂</p><p>今天在智联招聘遇到了一个很离谱的HR，一上来就要简历，看完啥都没说就标不合适了。倒也不是说我玻璃心接受不了吧，只是确实感觉有点奇葩了。当然也可能是我简历确实不好吧哈哈哈。截图放上面了。</p>', '河北·石家庄', 1, '2024-01-19 22:45:58', '2024-01-19 22:45:58');
INSERT INTO `blog_say` VALUES ('9f217f263aacf75211e75b7bf26017c3', '1', '', '<p>原本打算问一下北站还有客车没，门口两个黑车司机拦住说没了。然后说每人80，一听果断选择打车。打到车后，上车后司机跟我谈价，让我加点，最后谈的130，毕竟下雪了嘛，想着130就130吧。结果到地方平台上计算才82，然后又多走了8公里送到家。补了67，一共150。下雪天，贵点就贵点吧，算了，不计较了。</p><p>雪下的很大，15公分应该有了。</p>', '河北·石家庄', 1, '2024-02-21 21:17:04', NULL);
INSERT INTO `blog_say` VALUES ('a8969716d9f74933b65d21c19a90943a', '1', '', '<p>摆烂继续，中午才起，扫了扫雪，拿个快递，就天黑了。</p><p>小红书上她终于回复我了，不过只要一个“唉😔”，算了，算了，就这样吧。</p><p>写了一下寒假实践报告，主题就是关于这次山西之旅哈哈哈。</p>', '河北·石家庄', 1, '2024-02-22 21:08:15', NULL);
INSERT INTO `blog_say` VALUES ('b20047ad833d22bb749218ddee18caf6', '1', '', '<p>每次跟她聊天，要么就是半天不回复，要么就是谈起我以前哪里哪里做的不对，不好，诶。</p><p>一样中午才起，下午先走了15km，原本可以多走一些的，但是手机没电了，我要听歌，所以就回家休息了一下。腿有些疼，而且也没穿袜子，就没跑步。</p><p>晚上的时候春夜问我啥时候有时间，去爬恒山，然后就约到了周六出发。</p>', '河北·石家庄', 1, '2024-02-13 23:22:28', NULL);
INSERT INTO `blog_say` VALUES ('b9fc6451e4419d397fb47ebaaac77356', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708520001869.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708520017031.jpg,http://七牛云.辰雪博客.赵浩悦.我爱你/91b2937a59daab53b8e4007d4657e69.jpg,http://七牛云.辰雪博客.赵浩悦.我爱你/90049c48669f4f94bbd1285cdc86e6f.jpg,http://七牛云.辰雪博客.赵浩悦.我爱你/72583579115a63f1fa93688bb36bae5.jpg,http://七牛云.辰雪博客.赵浩悦.我爱你/aed68391d33a81adb86a621c3f3a0c4.jpg,', '<p>补19号</p><p>今天比昨天还冷，冷的都不想出门。</p><p>酒店直接差评，没啥好说的，必须差评，第一次给酒店差评。</p><p>去方特玩，因为太冷了，室外项目都停了，过山车，大摆锤，跳楼机啥的都体验不了，太亏了。室内项目好多都是小孩子玩的，没啥意思。方特儿童乐园，哈哈哈。</p><p>在第二个项目那正排队时，刚想给她发条消息，结果发现被她删了，QQ和微信都删了，一个没留，支付宝她也隐藏个人信息了，后来发现王者也把我删了。当时我非常不理解，想不通她为什么要这样做，原本正开心的，一瞬间有点心灰意冷了，我当时就想把她加回来，好好问问为什么，可是我挣扎了好久，还是放弃了，她把我删了不就是不想我打扰到她吗？</p><p>玩完回大同站旁边的酒店，还行，原本在犹豫特价标间还是商务标间，价格差一倍，但是一想是跟男生一起的，又不是女生，就定了特价的，后来想换结果没了。</p><p>晚上去酒吧喝了好多好多酒，吐了好几次，好像吐出来还有血丝，第一次成这样。今夜不回家那个酒，我以前很讨厌喝的，我爱喝度数很小的酒，可是这次我一口就把它喝完了。喝完酒要回去时，买了一盒硬中华，喊老板送个打火机呗，老板不送哈哈哈。</p><p>我以前好排斥抽烟啊哈哈哈，味道都特别特别不想闻到。可是我不到两个小时，就抽完了那一包，20支吧。</p><p>谁跟我说抽烟喝酒能忘记烦恼啊，全是骗人的，根本忘不了，该难受还是难受。</p>', '山西·大同', 1, '2024-02-21 20:53:42', '2024-02-21 21:03:52');
INSERT INTO `blog_say` VALUES ('bee76cd8eb564ef8885b91d1f141c4fb', '1', '', '<p>修了一些昨天合并时产生的bug，然后把管理界面的按钮权限加上了，现在终于能正常用按钮了，离融合完成更进一步。</p><p>今天不知道为啥，有些头昏头疼。</p><p>两只眼睛视力相差太大了，或许真该配眼睛了，看电脑屏幕时焦点有点向两边发散。</p><p>今天她父母在家，没一起玩游戏，当然也没什么其他交流，可能是我有意往疏远的方向发展吧，毕竟我已经决定放弃了，虽然还有些不舍得。不过下午倒是跟王学妹打了几局王者。</p><p>今天就先这样吧，头疼有些，早点休息了。</p>', '河北·石家庄', 1, '2024-01-25 21:10:00', NULL);
INSERT INTO `blog_say` VALUES ('c2776560be035e369e62def7a72a0c04', '1', '', '<p>justoauth报错的问题解决了，把它升级到最新版就没错了，可能低版本和某个库不兼容吧。qq和微博的授权需要审核，就先用gitee的来测试了，遇到一个很奇怪的问题就是用同一个接口查到的数据，数据库内容也都差不多，第三方授权生成的账号就是有些内容为空，明天再研究研究吧。</p><p>今天下午教她写前端代码，遇到了好多问题，先是node换源之后不清缓存就会证书过期，然后还有eslint烦的很，而且太久没从头开始手写代码了，很多细节都忘了。而且我对css是真的一窍不通，完全不会啊，根本调不来。html还好，不管美观的话往上摞就是了。投屏了6个多小时，实际上也就两小时左右吧，也就配了个环境，照着这个博客粗略写了header，是真的粗略哈哈哈。晚上八九点才结束，就没跑成步，今天应该减不了肥了。</p><p>好想好想她啊，怎么办啊，明明想好了要重新开始，忘了她，该放弃了，可是忍不住啊，做不到啊。那就只能继续天天烦着她了，希望她不要嫌我烦，也别故意不理我。</p>', '河北·石家庄', 1, '2024-01-31 21:41:48', NULL);
INSERT INTO `blog_say` VALUES ('c670aba58eb23a253f6d42b0d9078e51', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889443992.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889447649.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889453666.png,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240202_1706889458501.png,', '<p>原本打算把微信公众号登录搞定，但是遇到了好多奇怪的问题，先是被宝塔日志里面的amp;符号误导，想办法让代码去解析它，然后又是只返回字符串但是报token校验失败的错误。</p><p>晚上跟她说了好多，讲述了好多曾经，也互相理解的对方的不易，可是已经回不去了。</p><p>晚饭烤红薯，只吃了一个，饿死算了。</p>', '河北·石家庄', 1, '2024-02-02 23:53:35', '2024-02-02 23:57:00');
INSERT INTO `blog_say` VALUES ('dad21bc1cc296657ca22ac743878da6e', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240221_1708521034719.jpg,', '<p>补的20号</p><p>凌晨六点多才睡，八九点就醒了，好困啊，可是就是睡不着。</p><p>发现她小红书没删我，然后没忍住给她发了消息。在火车上时，我看到她小红书在线，后来又下线，但没有回复我哪怕一条消息，有点失望。全是在抱怨，不回也正常，换做是我可能也会选择不回复吧。</p><p>下雪了，所以回家路上有几个站点都晚点了，到了石家庄就六点多了，只能再住一晚。</p>', '河北·石家庄', 1, '2024-02-21 21:10:40', NULL);
INSERT INTO `blog_say` VALUES ('e5ffb3199859694a097626fd6ede4e03', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240211_1707663793415.jpg,http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240211_1707663796456.jpg,', '<p>今天到了中午12点才起床。傍晚的时候看到王者龙年皮肤出来了，送了她一个安琪拉皮肤，天蓝色我最喜欢的颜色。我钱不够，还让我妹妹给我代付点券哈哈哈。晚上还了妹妹点现金，但是还不够，我反正是身无分文了，一元都凑不出来了。</p><p>晚上时她突然问我“我这样跟你老联系好嘛”，后来我说了一些话她就说“那我们偶尔联系吧”，可是我不想这样，所以她就改成了“那就别联系了，不太好，感觉跟我吊着你一样-我不想别人误会”，我问她“你想这样吗？”，她说“我也不想这样，可是别人会这么想”。然后我劝了她好久，哈哈哈，她性格就这样，我也很无奈，我都要怀疑她有“被迫害妄想症”了哈哈哈，我有时也有，所以理解她。</p><p>下午的时候跟爷爷和亲戚聊天聊到我胖了的话题，然后我爷爷说胖了也不好，身体容易出油。晚上吃饭的时候又接上了这个话题，爷爷问我出油真的是胖的原因嘛，会不会是有什么病，检查过嘛。容易出油真的好烦啊，要天天洗澡。幸好家里有这个条件。</p>', '河北·石家庄', 1, '2024-02-11 23:06:44', NULL);
INSERT INTO `blog_say` VALUES ('e82674917e6b25c290fe87529d00c3f8', '1', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/20240206_1707232418933.jpg,', '<p>怎么又梦到她了，诶。</p><p>梦到场景好像是要去上体育课了，教室里就剩下我们两个人。然后我抱着她让你强行坐在我腿上，然后紧紧抱着她，她不是很愿意，想要说什么（可能想说她有对象，这样不合适吧），想把我推开，但我抱的很用力，她没能推开。我说我好想她，哭着亲上了她。后来她说时间要到了我才放开她，她就迅速跑掉了。等我再看到她，你跟她闺蜜在说着什么。</p><p>上午跟爷爷去县城，我测了个视力，在第一家测得时候，没告诉我具体度数，第二家的时候我把打印出来的报告拿来看了看，后来跟她交流的时候她的眼睛总是往我放报告纸的那个口袋瞟，但是又不好说什么，我就装作没看到哈哈哈。</p><p>右眼600 散光125 轴位8 左眼300 散光125 轴位4 瞳距61.5，这个度数算高了吧，我却没戴过眼镜哈哈哈。</p><p>下午继续跑步，晚上的时候，她忽然说她有点生气，我就猜到跟她对象有关，然后我还教她该怎么做，诶，明明我很舍不得啊，我干嘛要教她这些，为了让她和她对象关系更好，越走越远嘛。明明如果她那么做，我会很不开心的呀。我都未曾得到过的待遇，别人却轻而易举得到。</p><p>后来她跟我解释，忽然感觉，或许她们挺恩爱的，我是不是有一些多余了，或许现在在她心中，我或许完全比不上她对象，甚至说我都没有资格和她对象相提并论。或许我应该离开，免得破坏她们感情，可是我舍不得她，那就只能她主动与我断绝联系吧，如果她想的话。或许只要她开心就好了，以前与我在一起的时候，两个人过的都不开心，她也因为我承受了太多，希望现在她是真的开心吧。</p><p>希望她这次没有遇错人吧。</p><p>两个青涩不成熟不懂得如何去爱的两个人相爱，结局往往都是互相伤害，互相抱怨，再到互相释怀，只留下遗憾。成长往往伴随着遗憾，真是令人刻骨铭心啊。</p>', '河北·石家庄', 1, '2024-02-06 23:13:41', NULL);
INSERT INTO `blog_say` VALUES ('f695cbe6f1a6b971b3711364ded154b5', '1', '', '<p>上午依旧休息，下午跟爷爷赶了个集，然后跑步啥的，晚上才有时间把七牛云上传文件，发送邮件和注册账号的bug修复了一下。</p><p>中午的时候联系阿里云拿到了曾经这个域名的备案号-冀ICP备2021012929号，2021-06-11首次备案通过，2022-07-06取消接入备案。</p><p>还是很想很想她啊，没能走到最后总感觉会很遗憾啊。原本想着游戏通过或者通关之前就不再关注她了，那样对我或许会挺好吧，可是我舍不得啊。可是我现在在她那里的地位连朋友都不如，她跟我说话也总是刻意的控制着，跟她交流我真的好难受啊，我该咋办呢。这种狗血的事情为啥会发生到我的身上啊，现在我在她那里的表现就像是沸羊羊一样。</p>', '河北·石家庄', 1, '2024-01-29 21:43:17', NULL);
INSERT INTO `blog_say` VALUES ('fcbf8d49fad166190137a9e5935b0519', '1', '', '<p>中午去县里理了个发，然后回家之后她正好给我发了条消息，就问她玩不玩“双人成形”，结果她刚和她对象开王者排位😂她打了两局后，跟我一起玩了三个小时的双人成形，过了雪景球到花园了哈哈哈，EA服务器是真的不稳定，各种连不上和掉线。</p><p>晚上跟老爸聊了下家常，不经感慨这二三十年物价高了十来倍啊，虽说人均工资也高了十来倍吧，相当于收入并没有长哈哈哈。</p><p>bug一个又一个，今天摆烂算了，明天再搞吧。</p>', '河北·石家庄', 1, '2024-01-22 21:09:25', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '说说评论表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_sign
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网址分类表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '打赏记录' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_system_config
-- ----------------------------
INSERT INTO `blog_system_config` VALUES (2, 'AWmtGNZuK4WJ1oCP9ScfgdaLQoIUbeEZGAVDmHs5', 'pqrEyEp3ngG62J7X1pfKy9R0eUuBEBQAwFOvOOZY', 'z2', 'mcx-blog', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl', '1', '1', '1', '2021-11-26 15:41:36', '2021-11-26 15:41:36', '1', '欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~\n\n博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。\n\n项目源码：[点我传送](https://gitee.com/mcxgitee)，项目官网：[点我传送](http://www.mcx.com)\n\n项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈\n\n欢迎朋友能够给予一些支持，非常感谢~（ps.. 小伙伴赞赏的时候可以备注一下下~）\n|支付宝|微信|\n|-|-|-|\n|![支付宝](<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg\" width=\"50%\">)|![微信](<img src=\"http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg\" width=\"50%\">)|\n', '<p>欢迎来到辰雪博客项目，开源项目离不开大家的支持，希望小伙伴能随手点赞一下，你的点赞就是我维护的动力~</p>\n<p>博主使用笔记本开发的项目，所以页面中表格的列在大屏显示器中会显示宽度的不均衡，如需要可以自行调整。</p>\n<p>项目源码：<a href=\"https://gitee.com/mcxgitee\" target=\"_blank\">点我传送</a>，项目官网：<a href=\"http://www.mcx.com\" target=\"_blank\">点我传送</a></p>\n<p>项目还在开发阶段，如有不善的地方欢迎各位小伙伴多多反馈</p>\n<p>欢迎朋友能够给予一些支持，非常感谢~（ps… 小伙伴赞赏的时候可以备注一下下~）</p>\n<table>\n<thead>\n<tr>\n<th>支付宝</th>\n<th>微信</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td><img src=\"\" alt=\"支付宝\" /></td>\n<td><img src=\"\" alt=\"微信\" /></td>\n</tr>\n</tbody>\n</table>\n', 1, 'smtp.qq.com', 'tsuimengchao@qq.com', 'yqywkafvxrdbcbeb', 587, 1, 'http://localhost:80/img/', 1, NULL, NULL, NULL, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '博客标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_tags
-- ----------------------------
INSERT INTO `blog_tags` VALUES (1, 'Spring Boot', 842, 20, '2021-11-12 14:43:27', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (2, 'Elasticsearch', 737, 6, '2021-11-12 14:43:27', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (10, '博客', 679, 9, '2021-11-12 14:43:27', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (12, 'Vue', 300, 18, '2021-12-29 14:01:50', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (13, 'Spring Cloud', 759, 19, '2021-12-29 14:02:32', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (17, 'Redis', 395, 7, '2022-01-25 14:09:03', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (18, 'Linux', 491, 10, '2022-01-25 14:09:17', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (31, 'Mysql', 516, 10, '2022-02-18 16:01:07', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (32, 'Nginx', 442, 5, '2022-04-13 17:48:08', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (51, '异步', 92, 5, '2023-04-03 11:30:54', '2023-06-05 03:00:00');
INSERT INTO `blog_tags` VALUES (57, 'Java Script', 0, 1, '2023-06-27 16:02:33', '2023-06-27 08:02:32');
INSERT INTO `blog_tags` VALUES (59, 'Dcoker', 0, 12, '2023-07-13 15:51:12', '2023-07-13 07:51:12');
INSERT INTO `blog_tags` VALUES (60, 'Aspect', 0, 0, '2023-07-25 17:07:19', '2023-07-25 09:07:18');
INSERT INTO `blog_tags` VALUES (62, 'oauth2', 0, 0, '2023-08-15 09:30:12', '2023-08-15 01:30:11');
INSERT INTO `blog_tags` VALUES (63, '服务器', 0, 0, '2023-09-05 17:28:08', '2023-09-05 09:28:07');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '话题圈子表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_talk
-- ----------------------------
INSERT INTO `blog_talk` VALUES (1, 'Spring Boot', NULL, 1, NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_info
-- ----------------------------
INSERT INTO `blog_user_info` VALUES (1, 'tsuimengchao@qq.com', '崔梦超', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png', '努力努力再努力', '', 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2023-07-11 16:10:08');
INSERT INTO `blog_user_info` VALUES (2, 'test', '演示账号', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/1645512111007.png', NULL, NULL, 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/24f7b723309b46eba38cca127ea2bcc2.jpg', NULL, '2023-06-12 09:50:23');
INSERT INTO `blog_user_info` VALUES (3, 'tsuimengchao@aliyun.com', '普通用户', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (4, 'tsuimengchao@aliyun.com', '崔梦超', '', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (12, NULL, '崔梦超', 'https://gitee.com/assets/no_portrait.png', NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO `blog_user_info` VALUES (13, '505113917@qq.com', '赵浩悦', '', NULL, NULL, 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for blog_user_log
-- ----------------------------
DROP TABLE IF EXISTS `blog_user_log`;
CREATE TABLE `blog_user_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '操作用户ID',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作地址',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作日志',
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作模块',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  `result` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作结果',
  `access_os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `client_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 284521 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_user_log
-- ----------------------------

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '网站配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of blog_web_config
-- ----------------------------
INSERT INTO `blog_web_config` VALUES (1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/9cf1222617fd4fa197991476a53cc883.jpg', '辰雪博客', '正在努力搬砖~~~~', '辰雪,辰雪博客', '崔梦超', '冀ICP备2021012929号 转 冀ICP备2024051278号', '2021-11-27 13:43:16', '2022-01-20 13:30:44', 'http://xn--jduy7zg5y.xn--6qq986b3xl/', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/alipay.jpg', '\r\nhttp://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/wxpay.jpg', 'https://github.com/TsuiMengchao', 'https://gitee.com/mcxgitee', '484132820', '无', 'tsuimengchao@aliyun.com', 'tsuimengchao', '1,3,4,2,5,6', '1,2,5,6,4,3', '1', 1, 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/66bb121d47e94b89945d29bb6e3e6cab.jpg', '如果本项目对你有帮助，请前往码云给仓库点上你的小星星', '正在努力搬砖~~~~', 'http://xn--7gq6m992g.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl/cmc.png', '<h4 style=\"line-height: 2;\">项目框架</h4><p style=\"line-height: 2;\">前端使用了<span style=\"color: rgb(64, 169, 255);\">Vue+Elmentui</span>，能够更加容易得进行扩展</p><p style=\"line-height: 2;\">后端使用的<span style=\"color: rgb(64, 169, 255);\">Spring Boot+Mysql+Mybatis-Plus</span>框架</p><h4 style=\"line-height: 2;\">源码</h4><p style=\"line-height: 2;\">目前博客源码已经开源至 <a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">码云</a> ，感兴趣的小伙伴可以star fork关注一下下~</p><p style=\"line-height: 2;\">Gitee地址：<a href=\"https://gitee.com/quequnlong/shiyi-blog\" target=\"_blank\">[https://gitee.com/mcxgitee]()</a></p><p style=\"line-height: 2;\"><br></p>', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 261 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成字段信息存储' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '代码生成器配置' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '应用管理' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据库管理' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部署管理' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部署历史管理' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '应用与服务器关联' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '服务器管理' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据字典' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '数据字典详情' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '岗位' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3945 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (3943, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"admin\"}', '192.168.1.13', 89, 'admin', '内网IP', 'MSEdge 121', NULL, '2024-02-23 15:03:36');
INSERT INTO `sys_log` VALUES (3944, '用户登录', 'INFO', 'me.mcx.modules.security.rest.AuthorizationController.login()', '{\"username\":\"admin\"}', '192.168.1.13', 382, 'admin', '内网IP', 'MSEdge 121', NULL, '2024-02-23 20:04:20');

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
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统菜单' ROW_FORMAT = COMPACT;

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
INSERT INTO `sys_menu` VALUES (119, 118, 3, 1, '文章管理', NULL, 'blogs/articles', 1, 'doc', 'articles', b'0', b'1', b'0', 'articles:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (120, 118, 1, 1, '标签管理', NULL, 'blogs/tags', 2, 'blog', 'tags', b'0', b'1', b'0', 'tags:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (121, 118, 1, 1, '分类管理', NULL, 'blogs/category', 3, 'dictionary', 'category', b'0', b'1', b'0', 'category:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (122, 118, 1, 1, '说说管理', NULL, 'blogs/say', 4, 'nested', 'say', b'0', b'1', b'0', 'say:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (123, NULL, 9, 0, '网站管理', NULL, NULL, 6, 'phone', 'site', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (124, 123, 1, 1, '网站配置', NULL, 'site/webConfig/index', 3, 'password', 'webconfig', b'0', b'0', b'0', 'webconfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (125, 123, 0, 1, '导航管理', NULL, 'site/navigation/index', 4, 'chain', 'siteClass', b'0', b'0', b'0', 'siteClass:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (126, 123, 1, 1, '友链管理', NULL, 'site/friendLink/index', 3, 'link', 'friendLink', b'0', b'0', b'0', 'friendLink:list', 'admin', 'admin', '2024-01-18 14:18:55', '2024-01-18 14:18:55');
INSERT INTO `sys_menu` VALUES (127, 123, 1, 1, '博客字典管理', NULL, 'site/dict/index', 1, 'dictionary', 'blogdict', b'0', b'0', b'0', 'blogdict:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (128, NULL, 3, 0, '消息管理', NULL, NULL, 7, 'message', 'news', b'0', b'0', b'0', NULL, 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (129, 128, 1, 1, '评论管理', NULL, 'news/comment', 999, 'email', 'comment', b'0', b'0', b'0', 'comment', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (130, 128, 1, 1, '留言管理', NULL, 'news/message', 999, 'message', 'message', b'0', b'0', b'0', 'message:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (131, 128, 1, 1, '反馈管理', NULL, 'news/feedback', 999, 'sys-tools', 'feedback', b'0', b'0', b'0', 'feedback:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (132, 123, 1, 1, '系统配置', NULL, 'site/systemConfig/index', 4, 'log', 'systemconfig', b'0', b'0', b'0', 'systemconfig:list', 'admin', 'admin', '2023-12-02 18:41:04', '2023-12-02 18:41:04');
INSERT INTO `sys_menu` VALUES (133, 123, 1, 1, '博客字典数据', NULL, 'site/dict/data', 2, 'database', 'blogDictData', b'0', b'0', b'1', 'blogDictData:list', 'admin', 'admin', '2024-01-18 14:21:39', '2024-01-18 14:21:39');
INSERT INTO `sys_menu` VALUES (134, 123, 1, 1, '网址管理', NULL, 'site/navigation/navigation', 1, 'international', 'navigation', b'0', b'0', b'1', 'navigation:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (135, 123, 3, 1, '圈子管理', NULL, 'site/talk/index', 2, 'message', 'talk', b'0', b'0', b'0', 'talk:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (136, 123, 1, 1, '打赏管理', '', 'site/sponsor/index', 3, 'develop', 'sponsor', b'0', b'0', b'0', 'sponsor:list', 'admin', 'admin', '2024-01-18 14:11:38', '2024-01-18 14:11:38');
INSERT INTO `sys_menu` VALUES (137, 119, 0, 2, '文章编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (138, 119, 0, 2, '文章新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (139, 119, 0, 2, '文章删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (140, 120, 0, 2, '标签编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tags:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (141, 120, 0, 2, '标签新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'1', 'tags:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (142, 120, 0, 2, '标签删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'1', 'tags:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (143, 121, 0, 2, '分类编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (144, 121, 0, 2, '分类新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (145, 121, 0, 2, '分类删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (146, 122, 0, 2, '说说编辑', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:edit', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (147, 122, 0, 2, '说说新增', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:add', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (148, 122, 0, 2, '说说删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'say:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (149, 119, 0, 2, '文章批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:deleteBatch', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (150, 119, 0, 2, '文章爬虫', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:reptile', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (151, 119, 0, 2, '文章置顶文章', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:top', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (152, 119, 0, 2, '文章详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (153, 119, 0, 2, '文章SEO', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:baiduSeo', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (154, 119, 0, 2, '文章发布或下架文章', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'articles:pubOrShelf', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (155, 120, 0, 2, '标签详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tags:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (156, 120, 0, 2, '标签批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tags:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (157, 120, 0, 2, '标签置顶', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'tags:top', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (158, 121, 0, 2, '分类详情', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:info', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (159, 121, 0, 2, '分类批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (160, 121, 0, 2, '分类置顶', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'category:top', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (161, 127, 0, 2, '博客字典添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (162, 127, 0, 2, '博客字典修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (163, 127, 0, 2, '博客字典批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (164, 127, 0, 2, '博客字典删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDict:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (165, 133, 0, 2, '博客字典细节添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDataDict:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (166, 133, 0, 2, '博客字典细节修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDataDict:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (167, 133, 0, 2, '博客字典细节批量删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDataDict:deleteBatch', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (168, 133, 0, 2, '博客字典细节删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDataDict:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (169, 133, 0, 2, '博客字典细节类型集合字典数据', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'blogDataDict:getDataByDictType', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (170, 134, 0, 2, '网址添加', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:add', 'admin', 'admin', '2019-10-29 10:59:46', '2024-01-19 18:41:53');
INSERT INTO `sys_menu` VALUES (171, 134, 0, 2, '网址修改', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:edit', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
INSERT INTO `sys_menu` VALUES (172, 134, 0, 2, '网址删除', NULL, NULL, 999, NULL, NULL, b'0', b'0', b'0', 'navigation:del', 'admin', 'admin', '2024-01-25 18:58:57', '2024-01-25 18:58:57');
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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '定时任务日志' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色部门关联' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色菜单关联' ROW_FORMAT = COMPACT;

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
INSERT INTO `sys_roles_menus` VALUES (118, 2);
INSERT INTO `sys_roles_menus` VALUES (119, 2);
INSERT INTO `sys_roles_menus` VALUES (120, 2);
INSERT INTO `sys_roles_menus` VALUES (121, 2);
INSERT INTO `sys_roles_menus` VALUES (122, 2);
INSERT INTO `sys_roles_menus` VALUES (123, 2);
INSERT INTO `sys_roles_menus` VALUES (124, 2);
INSERT INTO `sys_roles_menus` VALUES (125, 2);
INSERT INTO `sys_roles_menus` VALUES (126, 2);
INSERT INTO `sys_roles_menus` VALUES (127, 2);
INSERT INTO `sys_roles_menus` VALUES (128, 2);
INSERT INTO `sys_roles_menus` VALUES (129, 2);
INSERT INTO `sys_roles_menus` VALUES (130, 2);
INSERT INTO `sys_roles_menus` VALUES (131, 2);
INSERT INTO `sys_roles_menus` VALUES (132, 2);
INSERT INTO `sys_roles_menus` VALUES (133, 2);
INSERT INTO `sys_roles_menus` VALUES (134, 2);
INSERT INTO `sys_roles_menus` VALUES (135, 2);
INSERT INTO `sys_roles_menus` VALUES (136, 2);
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
INSERT INTO `sys_roles_menus` VALUES (137, 3);
INSERT INTO `sys_roles_menus` VALUES (138, 3);
INSERT INTO `sys_roles_menus` VALUES (139, 3);
INSERT INTO `sys_roles_menus` VALUES (140, 3);
INSERT INTO `sys_roles_menus` VALUES (141, 3);
INSERT INTO `sys_roles_menus` VALUES (142, 3);
INSERT INTO `sys_roles_menus` VALUES (143, 3);
INSERT INTO `sys_roles_menus` VALUES (144, 3);
INSERT INTO `sys_roles_menus` VALUES (145, 3);
INSERT INTO `sys_roles_menus` VALUES (146, 3);
INSERT INTO `sys_roles_menus` VALUES (147, 3);
INSERT INTO `sys_roles_menus` VALUES (148, 3);
INSERT INTO `sys_roles_menus` VALUES (149, 3);
INSERT INTO `sys_roles_menus` VALUES (150, 3);
INSERT INTO `sys_roles_menus` VALUES (151, 3);
INSERT INTO `sys_roles_menus` VALUES (152, 3);
INSERT INTO `sys_roles_menus` VALUES (153, 3);
INSERT INTO `sys_roles_menus` VALUES (154, 3);
INSERT INTO `sys_roles_menus` VALUES (155, 3);
INSERT INTO `sys_roles_menus` VALUES (156, 3);
INSERT INTO `sys_roles_menus` VALUES (157, 3);
INSERT INTO `sys_roles_menus` VALUES (158, 3);
INSERT INTO `sys_roles_menus` VALUES (159, 3);
INSERT INTO `sys_roles_menus` VALUES (160, 3);
INSERT INTO `sys_roles_menus` VALUES (161, 3);
INSERT INTO `sys_roles_menus` VALUES (162, 3);
INSERT INTO `sys_roles_menus` VALUES (163, 3);
INSERT INTO `sys_roles_menus` VALUES (164, 3);
INSERT INTO `sys_roles_menus` VALUES (165, 3);
INSERT INTO `sys_roles_menus` VALUES (166, 3);
INSERT INTO `sys_roles_menus` VALUES (167, 3);
INSERT INTO `sys_roles_menus` VALUES (168, 3);
INSERT INTO `sys_roles_menus` VALUES (169, 3);
INSERT INTO `sys_roles_menus` VALUES (170, 3);
INSERT INTO `sys_roles_menus` VALUES (171, 3);
INSERT INTO `sys_roles_menus` VALUES (172, 3);
INSERT INTO `sys_roles_menus` VALUES (173, 3);
INSERT INTO `sys_roles_menus` VALUES (174, 3);
INSERT INTO `sys_roles_menus` VALUES (175, 3);
INSERT INTO `sys_roles_menus` VALUES (176, 3);
INSERT INTO `sys_roles_menus` VALUES (177, 3);
INSERT INTO `sys_roles_menus` VALUES (178, 3);
INSERT INTO `sys_roles_menus` VALUES (179, 3);
INSERT INTO `sys_roles_menus` VALUES (180, 3);
INSERT INTO `sys_roles_menus` VALUES (181, 3);
INSERT INTO `sys_roles_menus` VALUES (182, 3);
INSERT INTO `sys_roles_menus` VALUES (183, 3);
INSERT INTO `sys_roles_menus` VALUES (184, 3);
INSERT INTO `sys_roles_menus` VALUES (185, 3);
INSERT INTO `sys_roles_menus` VALUES (186, 3);
INSERT INTO `sys_roles_menus` VALUES (187, 3);
INSERT INTO `sys_roles_menus` VALUES (188, 3);
INSERT INTO `sys_roles_menus` VALUES (189, 3);
INSERT INTO `sys_roles_menus` VALUES (190, 3);
INSERT INTO `sys_roles_menus` VALUES (191, 3);

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
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_email`(`email`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '系统用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 2, 'admin', '崔梦超', '男', '18333191029', '484132820@qq.com', 'cmc.png', '/Users/jie/Documents/work/me/admin/eladmin/~/avatar/avatar-20200806032259161.png', '$2a$10$Egp1/gvFlt7zhlXVfEFw4OfWQCGPw0ClmMcc6FjTnvXNRVf9zdMRa', b'1', b'1', NULL, 'admin', '2020-05-03 16:38:31', '2018-08-23 09:11:56', '2020-09-05 10:43:31', 1, 1, '127.0.0.1', '未知', 'Windows 10', '2023-12-07 17:32:08', 'Chrome 11', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (2, 2, 'test', '测试', '男', '15600618521', 'tsuimengchao@qq.com', NULL, NULL, '$2a$10$4XcyudOYTSz6fue6KFNMHeUQnCX5jbBQypLEnGk1PmekXt5c95JcK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', 1, 2, '192.168.0.177', '未知', 'Windows 10', '2023-12-01 21:37:30', 'Chrome 11', NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (3, 5, 'common', '普通用户', '男', '15600168521', 'tsuimengchao@foxmail.com', NULL, NULL, '$2a$10$QN4tYvXkX2ZOIjRoYnSQEe.4/vR4eTevMwJZ0Eok0cl8uuYxaU5bK', b'0', b'1', 'admin', 'admin', NULL, '2020-05-05 11:15:49', '2020-09-05 10:43:38', NULL, 3, NULL, NULL, NULL, '2024-01-25 21:17:20', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_user` VALUES (4, 18, 'tsuimengchao', '崔梦超', NULL, NULL, 'tsuimengchao@aliyun.com', NULL, NULL, '$2a$10$geSY48NRbQleWKqJ/R7ae.JjuEx4LjdOPD75omh3UgWVwsBVwwsA6', b'0', b'1', 'System', 'System', '2024-01-30 13:10:46', '2024-01-30 11:58:28', '2024-01-31 19:51:39', 1, 4, '192.168.1.3', '未知', NULL, '2024-01-31 19:51:39', NULL, 'EE5F91C7CD66BC0BC12E94947E276D80', NULL, '7726769', NULL);
INSERT INTO `sys_user` VALUES (5, 18, 'zhy', '赵浩悦', '女', '15176907852', '2490739669@qq.com', NULL, NULL, '$2a$10$jGXMDgNC9Cj1pDflaVlycuQbEhNyJeER4rbrNiShKV.MJideJ5/.6', b'0', b'1', 'System', 'System', NULL, '2024-01-30 21:59:15', '2024-01-30 21:59:15', 1, 3, NULL, NULL, NULL, '2024-01-30 21:59:14', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_jobs`;
CREATE TABLE `sys_users_jobs`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `job_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_users_jobs
-- ----------------------------
INSERT INTO `sys_users_jobs` VALUES (1, 11);
INSERT INTO `sys_users_jobs` VALUES (2, 12);
INSERT INTO `sys_users_jobs` VALUES (3, 11);
INSERT INTO `sys_users_jobs` VALUES (4, 13);
INSERT INTO `sys_users_jobs` VALUES (5, 13);

-- ----------------------------
-- Table structure for sys_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `sys_users_roles`;
CREATE TABLE `sys_users_roles`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '用户角色关联' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_users_roles
-- ----------------------------
INSERT INTO `sys_users_roles` VALUES (1, 1);
INSERT INTO `sys_users_roles` VALUES (3, 2);
INSERT INTO `sys_users_roles` VALUES (4, 2);
INSERT INTO `sys_users_roles` VALUES (5, 2);
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '支付宝配置类' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '邮箱配置' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '本地存储' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of tool_local_storage
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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云配置' ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 97 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '七牛云文件存储' ROW_FORMAT = COMPACT;

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

SET FOREIGN_KEY_CHECKS = 1;
