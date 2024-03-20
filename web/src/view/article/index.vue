<template>
    <div class="article-container container">
        <!-- 左侧点赞和打赏 -->
        <div class="left-sidbarnav" :style="{ left: left}">
            <el-tooltip class="item" effect="dark" content="点赞" placement="left">
                <div class="left-item" title="点赞" @click="like(article.id)">
                    <el-badge :value="article.likeCount" class="item">
                        <span>
                            <i v-if="article.isLike" class="iconfont icon-dianzan4"></i>
                            <i v-else class="iconfont icon-dianzan1"></i>
                        </span>
                    </el-badge>
                </div>
            </el-tooltip>

            <el-tooltip class="item" effect="dark" content="收藏" placement="left">
                <div class="left-item" title="收藏" @click="handleCollect">
                    <el-badge :value="article.collectCount" class="item">
                        <span style="font-size: 20px;">
                            <i v-if="article.isCollect" class="el-icon-star-on"></i>
                            <i v-else class="el-icon-star-off"></i>
                        </span>
                    </el-badge>
                </div>
            </el-tooltip>

            <el-tooltip class="item" effect="dark" content="评论" placement="left">
                <div class="left-item" title="评论" @click="handleNodeClick('comment')">
                    <el-badge :value="article.commentCount" class="item">
                        <span>
                            <i class="iconfont icon-pinglun"></i>
                        </span>
                    </el-badge>
                </div>
            </el-tooltip>

            <el-tooltip class="item" effect="dark" content="开启沉浸式阅读" placement="left">
                <div class="left-item" title="开启沉浸式阅读" @click="handleImmerse">
                    <span>
                        <i class="iconfont icon-full-screen"></i>
                    </span>
                </div>
            </el-tooltip>

            <el-tooltip class="item" effect="dark" content="打赏" placement="left">
                <router-link :to="'/sponsor'" style="text-decoration:none">
                    <div class="left-item rewardMain" title="打赏">
                        <span class="reward-btn">
                            <i class="iconfont icon-dashang1"></i>
                        </span>
                    </div>
                </router-link>
            </el-tooltip>

        </div>

        <!-- 中间文章信息 -->
        <el-card class="article" id="articleBox">
            <el-tag @click="handleClike(article.category.id, '/categorys')" effect="dark" class="category">
                {{ article.category.name }}
            </el-tag>
            <h1 class="article-title">
                {{ article.title }}
                <svg-icon v-if="article.isPublish == 2" icon-class="audit"></svg-icon>
            </h1>
            <div class="article-desc">
                <div class="article-item">
                    <img v-lazy="userInfo.avatar" :key="userInfo.avatar" alt="">
                    <div class="meta">
                        <div class="author">
                            <a class="link" href="#">{{ userInfo.nickname }}</a>
                        </div>
                        <div class="item">
                            <span class="text textItem"> <i class="el-icon-time"></i> {{ formatDate(article.createTime)
                            }}</span>
                            <span class="text textItem"><i class="el-icon-chat-dot-round"></i> {{ article.commentCount }}
                                评论</span>
                            <span class="text textItem">
                                <i style="font-size: 0.7rem;" class="iconfont icon-dianzan1"></i>
                                {{ article.likeCount == null ? 0 : article.likeCount }} 点赞
                            </span>
                            <span class="text"><i class="el-icon-view"></i> {{ article.quantity }} 阅读</span>

                        </div>
                    </div>
                </div>
                <time class="time">
                    {{ formatDate(article.createTime, "MM/dd") }}
                </time>
            </div>
            <div class="tips">
                <i class="el-icon-message-solid"></i>
                <span>温馨提示：</span>
                <div style="margin-left: 30px;margin-top: 5px;">
                    <span v-if="article.isOriginal == 0">该文章为转载文章。</span>
                    本着开源共享、共同学习的精神，若内容或图片失效，请留言反馈。若有内容不小心影响到您的利益，请联系博主删除
                </div>
            </div>
            <!-- 文章内容 -->
            <div style="height: 100%;" class="box-article">
                <article class="content" :style="style" ref="article" v-highlight v-html="this.article.content"></article>
                <div v-if="article.readType != 0 && !serceShow" class="warpper">
                    <div class="item-title">
                        <i class="el-icon-lock"></i> 该文章部分内容已隐藏
                    </div>
                    <div class="item-box">
                        <span>
                            {{ readTypeList[article.readType] }}
                        </span>
                        <div class="neirong">
                            以下内容已隐藏，请{{ readDescList[article.readType] }}后查看
                        </div>
                        <el-button v-if="article.readType == 1" @click="checkLikeAndCoomment('请到文章内容下方完成评论')" class="btn"
                            type="primary" size="small">立即评论</el-button>
                        <el-button v-if="article.readType == 2" @click="checkLikeAndCoomment('请到文章内容左侧完成点赞')" class="btn"
                            type="primary" size="small">立即点赞</el-button>
                        <el-button v-if="article.readType == 3" @click="dialogVisible = true" class="btn" type="primary"
                            size="small">立即验证</el-button>

                    </div>
                </div>
            </div>

            <!-- 移动端点赞 -->
            <div class="dianzanBox">
                <div class="dianzan-item">
                    <div>
                        <span @click="like(article.id)">
                            <i v-if="article.isLike" class="iconfont icon-dianzan4"></i>
                            <i v-else class="iconfont icon-dianzan1"></i>
                        </span>
                    </div>

                    <div v-if="article.likeCount" class="likeCountItem">{{ article.likeCount }}人已点赞</div>
                </div>
            </div>

            <!-- 文章标签和分享 -->
            <div class="tag-share">
                <div>
                    <a class="tagBtn" v-for="item in article.tagList" :key="item.id" @click="handleClike(item.id, '/tag')">
                        <el-tag type="success">
                            <i class="el-icon-collection-tag"></i> {{ item.name }}
                        </el-tag>
                    </a>

                </div>
                <!-- 分享 -->
                <div class="social-share">
                    <a href="javascript:;" @click="qqShare" class="social-share-icon icon-qzone">
                        <i class="iconfont icon-qqkongjian"></i>
                    </a>
                    <a href="javascript:;" @click="qqHyShare" class="social-share-icon icon-qq">
                        <i class="iconfont icon-QQ"></i>
                    </a>
                    <a href="javascript:;" @click="weixinShare" class="social-share-icon icon-wechat">
                        <i class="iconfont icon-weixin"></i>
                    </a>
                    <a href="javascript:;" @click="weiboShare" class="social-share-icon icon-weibo">
                        <i class="iconfont icon-shejiaotubiao-06"></i>
                    </a>
                </div>
            </div>
            <div class="wechatImg">
                <img :src="img_url+`souyisou1.png`" alt="">
            </div>
            <!-- 版权 -->
            <div class="copyright">
                <div class="copyrightItem">
                    <svg-icon icon-class="yuanchuang"></svg-icon>
                    <span class="text name">创作类型:</span>
                    <span class="text"> {{ article.isOriginal ? '原创' : '转载' }}</span>
                </div>
                <div class="copyrightItem" v-if="article.isOriginal">
                    <svg-icon icon-class="copyright"></svg-icon>
                    <span class="text name">版权归属:</span>
                    <span class="text"> {{ userInfo.nickname }}</span>
                </div>
                <div class="copyrightItem" v-else>
                    <svg-icon icon-class="zzlink"></svg-icon>
                    <span class="text name">转载链接:</span>
                    <a :href="article.originalUrl" class="text"> {{ article.originalUrl }}</a>
                </div>
                <div class="copyrightItem">
                    <svg-icon icon-class="link"></svg-icon>
                    <span class="text name">本文链接:</span>
                    <a href="" class="text"> {{ locationUrl }}</a>
                </div>
                <div class="copyrightItem">
                    <svg-icon icon-class="xkxy"></svg-icon>
                    <span class="text name">许可协议:</span>
                    <span class="text">
                        本博客所有文章除特别声明外，均采用
                        <a class="text" href="https://creativecommons.org/licenses/by-nc-sa/4.0/">
                            CC BY-NC-SA 4.0
                        </a>
                        许可协议。转载请注明文章出处。
                    </span>
                </div>
                <svg-icon class="yuan" icon-class="yuan"></svg-icon>
            </div>

            <!-- 评论 -->
            <div class="comment-mian" id="comment">
                <div class="title">
                    <!-- <i class="iconfont icon-pinglun"></i> -->
                    <svg-icon icon-class="message"></svg-icon>
                    评论 <span style="color: var(--text-color);font-size: 0.8rem;">发表评论,来抢沙发</span>
                </div>
                <Comment :articleUserId="article.userId" />
            </div>
        </el-card>
        <!-- 右边侧边栏 -->
        <div class="sidebar" v-if="rightShow">
            <div style="position: sticky;top:70px;">
                <el-card class="box-card articleUser">
                    <div style="margin-bottom: 15px;margin-top: 10px;">
                        <div style="display: flex;">
                            <a @click="handleToUserMain(article.userId)">
                                <el-avatar style="border: 1px solid var(--border-line);" :src="userInfo.avatar"></el-avatar>
                            </a>
                            <div class="userInfo">
                                <p class="nickname">
                                    {{ userInfo.nickname }}
                                    <el-tooltip effect="dark" content="作者" placement="right">
                                        <svg-icon class="tag" icon-class="guanfang"></svg-icon>
                                    </el-tooltip>
                                </p>
                                <p class="intor">{{ userInfo.intro ? userInfo.intro : '这个博主很懒，什么都没有留下' }}
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="authorInfo">
                        <span class="user-item">
                            <div>
                                {{ userInfo.articleCount }}
                            </div>
                            <div class="name">
                                文章
                            </div>
                        </span>
                        <span class="user-item">
                            <div>
                                {{ userInfo.fansCount }}
                            </div>
                            <div class="name">
                                粉丝
                            </div>
                        </span>
                        <span class="user-item">
                            <div>
                                {{ userInfo.watchCount }}
                            </div>
                            <div class="name">
                                关注
                            </div>
                        </span>
                    </div>
                    <div class="userBtn">
                        <el-button v-if="article.isFollowed" type="info" class="guanzhuBtn"
                            @click="handleDeleteFollowedUser"> <i class="el-icon-delete"></i>
                            取消关注</el-button>
                        <el-button v-else type="danger" class="guanzhuBtn" @click="handleFollowedUser"> <i
                                class="el-icon-sugar"></i> 关注</el-button>
                        <el-button type="primary" @click="handleGoIm"><i class="el-icon-chat-dot-round"></i> 私信</el-button>
                    </div>
                </el-card>
                <div class="directory">
                    <el-card class="directory-item">
                        <div slot="header" class="title">
                            <span>目录</span>
                        </div>
                        <ul class="structureBox">
                            <li :style="{ paddingLeft: item.level * 10 + 'px' }"
                                :class="active == index ? 'structure active' : 'structure'" v-for="(item, index) in titles"
                                :key="index" @click="handleNodeClick(item.id)">
                                {{ item.title }}
                            </li>
                        </ul>
                    </el-card>
                </div>
            </div>
        </div>

        <!-- 公众号扫码验证框 -->
        <el-dialog :lock-scroll="false" title="关注公众号验证" center :visible.sync="dialogVisible">
            <div style="text-align: center;">
                <div>扫码关注公众号<span style="color: red;">【 梦辰雪 】</span></div>
                <div>回复<span style="color: red;">【 验证码 】</span>获取验证码</div>
            </div>
            <el-image class="wxImg" :src="img_url+`wechatQr.jpg`">
                <div slot="error" class="image-slot">
                    加载中<span class="dot">...</span>
                </div>
            </el-image>

            <el-input wi v-model="code" placeholder="请输入验证码"></el-input>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="checkCode">确 定</el-button>
            </span>
        </el-dialog>
        <image-preview :img="images"></image-preview>
    </div>
</template>
<script>
import { articleInfo, articleLike, checkCode, followedUser, deleteFollowedUser, selectUserInfoByArticleId } from '@/api'
import { collect, cancelCollect } from '@/api/collect'
import SiteInfo from '@/components/site/index.vue'
import Comment from '@/components/comment/index.vue'
import imagePreview from '@/components/imagePreview'
export default {
    components: {
        SiteInfo,
        Comment,
        imagePreview
    },
    metaInfo: {
        meta: [{
            name: 'keyWords',
            content: "辰雪博客,开源博客,www.mcx.com"  //变量或字符串
        }, {
            name: 'description',
            content: "一个专注于技术分享的博客平台,大家以共同学习,乐于分享,拥抱开源的价值观进行学习交流"
        }]
    },
    data() {
        return {
            userInfo: {},
            article: {
                category: {},
                comments: [],
                tagList: [],
            },
            rightShow: true,
            code: null,
            style: '',
            titles: [],
            images: {},
            readTypeList: ['', '评论阅读', '点赞阅读', '扫码阅读'],
            readDescList: ['', '评论', '点赞', '扫码回复验证码'],
            dialogVisible: false,
            active: 0,
            fontNumber: 0,
            locationUrl: window.location.href,
            commentList: [],
            articleId: this.$route.params.articleId,
            commentQuery: {
                pageNo: 1,
                pageSize: 5,
                articleId: this.$route.params.articleId,
            },
            commentPages: 0,
            user: {},
            serceShow: 0,
            left: "0px",
            codes: [],
          img_url: process.env.VUE_APP_IMG_API

        }
    },

    mounted() {
        const element = document.getElementById("articleBox")
        this.left = (element.offsetLeft - 80) + "px"

        // 监听滚动事件
        window.addEventListener('scroll', this.onScroll, false)

    },

    computed: {
        isCommentFlag() {
            return this.$store.state.isCommentFlag
        }
    },
    watch: {
        isCommentFlag: function (newVal, oldVal) {
            //插入需要在仓库数据变化时做的逻辑处理
            if (newVal) {
                this.checkAfter()
            }
        },
    },
    beforeDestroy() {
        window.removeEventListener('scroll', this.onScroll);
    },

    created() {
        window.addEventListener('resize', () => {
            const element = document.getElementById("articleBox")
            if (element) {
                this.left = (element.offsetLeft - 80) + "px"
            }
        }, true)
        this.$bus.$emit('show');
        articleInfo(this.articleId).then(res => {
            this.article = res.data
            this.serceShow = this.article.activeReadType
            if (this.article.readType != 0 && !this.serceShow) {
                this.style = "max-height: 1200px;overflow: hidden;"
            }

            //处理目录和图片预览
            this.$nextTick(() => {
                //添加图片预览功能
                const imgList = this.$refs.article.getElementsByTagName("img");
                let that = this
                for (var i = 0; i < imgList.length; i++) {
                    imgList[i].addEventListener("click", function (e) {
                        that.images = {
                            urls: e.target.currentSrc,
                            time: new Date().getTime()
                        }
                    });
                }
                // 添加文章生成目录功能
                let nodes = this.$refs.article.querySelectorAll("h1,h2,h3,h4,h5,h6");
                for (let i = 0; i < nodes.length; i++) {
                    let node = nodes[i];
                    let reg = /^H[1-6]{1}$/;
                    if (reg.exec(node.tagName)) {
                        node.id = 'h' + parseInt(node.tagName.substring(1)) + i;
                    }
                    let toc = {
                        id: node.id,
                        title: node.innerText,
                        level: parseInt(node.tagName.substring(1)),
                    }
                    this.titles.push(toc);
                }
                //修改代码样式和添加复制按钮
                this.getCodes();
            })

            //修改标题和关键词
            document.title = this.article.title
            if (this.article.keywords != null) {
                document.querySelector('meta[name="keywords"]').setAttribute('content', this.article.keywords)
            }
            //获取文章作者信息
            selectUserInfoByArticleId(this.articleId).then(res => {
                this.userInfo = res.data
            })
            this.$bus.$emit('close')
        }).catch(err => {
            this.$bus.$emit('close')
        })
    },

    methods: {
        handleNodeClick(data, event) {
            //  实现跳转锚点
            document.getElementById(data).scrollIntoView({ behavior: 'smooth' })
        },

        getCodes() {
            this.codes = document.querySelectorAll("pre");
            if (this.codes.length > 0) {
                for (let i = 0; i < this.codes.length; i++) {
                    if (this.codes[i].offsetHeight != 0) {
                        return this.init();
                    } else {
                        for (let j = 0; j < this.codes.length; j++) {
                            if (this.codes[j].offsetHeight != 0) {
                                return this.init();
                            }
                        }
                        return;
                    }
                }
                return;
            }
        },
        init() {
            let that = this
            this.codes.forEach((item, index) => {
                let icon =
                    `<div class="mac-icon">` +
                    `<span class="mac-icon-red"></span>` +
                    `<span class="mac-icon-yellow"></span>` +
                    `<span class="mac-icon-green"></span>` +
                    `<i class=" el-icon-document-copy copy-button"></i>` +
                    `</div>`;

                item.insertAdjacentHTML("afterbegin", icon);
                let value = item.lastElementChild.innerText
                // 获取复制元素
                let copyButton =
                    item.firstElementChild.getElementsByClassName("copy-button")[0];
                copyButton.onclick = function () {
                    const clipboard = new that.Clipboard('.copy-button', {
                        text: () => value
                    })
                    clipboard.on('success', () => {
                        clipboard.destroy()
                    })
                    clipboard.on('error', () => {
                        that.$toast.error('复制失败')
                        clipboard.destroy()
                    })
                };

            });
        },

        handleToUserMain(userId) {
            this.$router.push({ path: "/user_main", query: { id: userId } })
        },
        qqShare() {
            const url = `https://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url=${window.location.href}&sharesource=qzone&title=${this.article.title}&summary=${this.article.title}`
            window.open(url, 'renren-share', 'width=490,height=700');
        },
        qqHyShare() {
            const url = `http://connect.qq.com/widget/shareqq/index.html?url=${window.location.href}&sharesource=qzone&title=${this.article.title}&summary=${this.article.title}`
            window.open(url, 'renren-share', 'width=490,height=700');
        },
        weiboShare() {
            const url = `http://service.weibo.com/share/share.php?url=${window.location.href}&title=${this.article.title}`;
            window.open(url, 'renren-share', 'width=490,height=700');
        },
        weixinShare() {
            const url = `https://api.pwmqr.com/qrcode/create/?url=${window.location.href}`;
            window.open(url, 'renren-share', 'width=490,height=700');
        },
        handleGoIm() {
            this.$router.push({ path: "/im", query: { userId: this.userInfo.id } })
        },
        handleFollowedUser() {
            followedUser(this.article.userId).then(res => {
                this.article.isFollowed = 1
                this.$toast.success('关注成功')
                this.userInfo.fansCount++

            }).catch(err => {

            });
        },
        handleDeleteFollowedUser() {
            deleteFollowedUser(this.article.userId).then(res => {
                this.article.isFollowed = 0

                this.$toast.success('取消关注成功')
                this.userInfo.fansCount--

            }).catch(err => {

            });
        },
        checkLikeAndCoomment(desc) {

            this.$toast.info(desc)
        },
        checkCode() {
            if (!this.code) {

                this.$toast.error('验证码不能为空！')
                return;
            }
            checkCode(this.code).then(res => {

                this.$toast.success('验证成功')
                this.checkAfter()
            }).catch(err => {
            })

        },
        checkAfter() {
            this.dialogVisible = false
            this.style = ''
            this.serceShow = true
        },
        onScroll() {
            const scrollTop = document.documentElement.scrollTop || document.body.scrollTop
            for (let i = 0; i < this.titles.length; i++) {
                //获取小标题距离屏幕顶端的距离
                var offsetTop = document.getElementById(this.titles[i].id).offsetTop;
                //根据条件做出判断，我这里是当小标题和屏幕顶端的距离小于300且没有被标明在读时，就将其背景颜色改变。
                if ((offsetTop - scrollTop) < 80 && (offsetTop - scrollTop) > 0) {
                    this.active = i
                }
            }
        },
        handleImmerse() {
            this.rightShow = !this.rightShow
            window.setTimeout(() => {
                const element = document.getElementById("articleBox")
                this.left = (element.offsetLeft - 80) + "px"
            }, 10)


        },
        handleCollect() {
            let id = this.article.id;
            if (this.article.isCollect) {
                cancelCollect(id).then(res => {
                    this.article.collectCount--
                    this.article.isCollect = 0

                    this.$toast.success('取消收藏成功')

                })
            } else {
                collect(id).then(res => {
                    this.article.collectCount++
                    this.article.isCollect = 1

                    this.$toast.success('收藏成功')
                })
            }
        },
        handleClike(id, path) {
            this.$router.push({ path: path, query: { id: id } })
        },

        formatDate: function (value, args) {
            var dt = new Date(value);
            let year = dt.getFullYear();
            let month = (dt.getMonth() + 1).toString().padStart(2, '0');
            let date = dt.getDate().toString().padStart(2, '0');
            if (args === "MM/dd") {
                return `${month}/${date}`;
            }
            return `${year}-${month}-${date}`;
        },
        like(articleId) {
            articleLike(articleId).then(res => {
                if (this.article.isLike) {
                    this.article.likeCount--;
                    this.article.isLike = false

                    this.$toast.success('取消点赞')
                } else {
                    this.article.likeCount++;
                    this.article.isLike = true
                    if (this.article.readType == 2) {
                        this.checkAfter()
                    }

                    this.$toast.success('点赞成功')
                }

            }).catch(err => {

            })
        },

    },
}
</script>
<style lang="scss" scoped>
.article-container {
    padding: 10px;

    @media screen and (max-width: 1118px) {

        .article {
            width: 100%;

            .article-desc {
                .time {
                    display: none;
                }
            }

            .dianzanBox {
                text-align: center;
                margin-top: 15px;

                .dianzan-item {
                    i {
                        font-size: 1.5rem;
                    }

                    .likeCountItem {
                        color: var(--text-color);
                        font-size: 12px;
                    }

                    svg {
                        width: 30px;
                        height: 30px;
                        vertical-align: -10px;
                    }
                }
            }
        }

        .left-sidbarnav,
        .sidebar {
            display: none;
        }
    }

    @media screen and (min-width: 1119px) {
        /deep/ .el-dialog {
            width: 24%;
            border-radius: 10px;
        }

        .article {
            width: 50%;

            .dianzanBox {
                display: none;
            }

            .article-desc {
                .time {
                    font-size: 32px;
                    line-height: 42px;
                    color: #606266;
                    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
                    position: absolute;
                    right: 0;
                }
            }
        }

        .left-sidbarnav {
            position: fixed;
            top: 150px;
            z-index: 999;

            .left-item {
                margin-bottom: 20px;
                width: 50px;
                height: 50px;
                border-radius: 50%;
                text-align: center;
                line-height: 50px;
                background-color: var(--background-color);
                cursor: pointer;
                position: relative;
                color: var(--text-color);

                &:hover {
                    span {
                        color: var(--theme-color);
                    }

                    background-color: rgba(25, 153, 153, 0.2);
                }

                i {
                    font-size: 20px;
                }

                .el-icon-star-on {
                    font-size: 25px;
                }

                .like-count {
                    color: #fff;
                    display: inline-block;
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    position: absolute;
                    line-height: 20px;
                    background-color: var(--theme-color);
                    top: -8px;

                }
            }
        }

        .sidebar {
            margin-left: 20px;
            width: 20%;

            .box-card {
                margin-top: 80px;
            }

            .articleUser {
                padding: 10px;
                background-color: var(--background-color);

                a {
                    text-decoration: none;

                }

                .userInfo {
                    margin-left: 10px;

                    .nickname {
                        color: var(--article-color);
                        font-weight: 700;

                        .tag {
                            width: 18px;
                            height: 18px;
                            vertical-align: -3px;
                        }
                    }

                    .intor {
                        font-size: 0.9rem;
                        color: var(--text-color);
                        margin-top: 2px;
                    }
                }

                .authorInfo {
                    margin-bottom: 15px;
                    margin-top: 30px;
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);

                    .user-item {
                        text-align: center;
                        margin-left: 10px;
                        margin-right: 20px;
                        color: var(--text-color);

                        .name {
                            margin-top: 2px;
                        }
                    }
                }


                .userBtn {
                    display: flex;
                    margin-top: 20px;

                    /deep/ .el-button {
                        border-radius: 50px;
                        width: 45%;
                        padding: 8px 20px;
                    }

                    .guanzhuBtn {
                        margin-left: 10px;
                        margin-right: 15px;
                    }
                }
            }

            .directory {
                margin-top: 10px;

                .directory-item {
                    background-color: var(--background-color);


                    ul {
                        margin-top: 8px;
                        list-style: none;
                        padding: 0 10px;
                        max-height: 500px;
                        overflow: hidden;
                        overflow-y: scroll;

                        &::-webkit-scrollbar {
                            display: none;
                        }

                    }

                    /deep/ .el-card__header {
                        padding: 15px 20px;
                        border-bottom: 2px solid var(--border-line);
                    }

                    .title {

                        span {
                            color: var(--article-color);
                        }
                    }

                    .structure {
                        cursor: pointer;
                        color: var(--article-color);
                        padding: 5px 0;
                        padding-left: 20px;
                        margin-bottom: 10px;
                        border-radius: 5px;
                        text-overflow: ellipsis;
                        display: -webkit-box;
                        -webkit-box-orient: vertical;
                        -webkit-line-clamp: 2;
                        overflow: hidden;

                    }

                    .active {
                        font-size: 1.2rem;
                    }

                    .active,
                    .structure:hover {
                        color: var(--theme-color);
                        background-color: var(--article-structure-backcolor);
                    }
                }
            }
        }
    }


    .article {
        background-color: var(--background-color);
        padding: 20px;
        height: 100%;
        margin-top: 80px;

        .category {
            border-radius: 3px;
            cursor: pointer;
            transition: transform .35s;
            height: 30px;
            line-height: 30px;

            &:hover {
                transform: translateY(-5px)
            }
        }

        .article-title {
            font-size: 24px;
            color: var(--article-color);
            text-align: center;
            padding-top: 20px;
            margin-bottom: 15px;
            word-break: break-word;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
            font-weight: 500;

            svg {
                width: 50px;
                height: 50px;
                vertical-align: -10px;
            }
        }

        .article-desc {
            height: 50px;
            border-bottom: 1px solid var(--border-line);
            margin-bottom: 15px;
            position: relative;
            display: flex;
            align-items: center;
            padding-bottom: 15px;

            &::after {
                content: '';
                position: absolute;
                bottom: -1.5px;
                left: 0;
                width: 80px;
                height: 3px;
                border-radius: 1.5px;
                background: var(--theme-color);
            }

            .article-item {
                display: flex;

                img {
                    width: 30px;
                    height: 30px;
                    border-radius: 50%;
                    margin-right: 10px;
                    padding: 3px;
                    -o-object-fit: cover;
                    object-fit: cover;
                    background: var(--border-line);
                    border: 1px solid #dcdfe6;
                }

                .meta {
                    display: flex;
                    flex-direction: column;
                    height: 35px;
                    justify-content: space-between;
                    font-size: 12px;

                    .link {
                        font-weight: 500;
                        color: var(--theme-color);
                        text-decoration: none;
                    }

                    .item {
                        color: #909399;
                        line-height: 16px;
                        display: flex;
                        align-items: center;

                        .textItem::after {
                            content: "/";
                            margin: 0 5px;
                        }
                    }
                }
            }



        }

        .tips {
            border-left: 5px solid #50bfff;
            background-color: var(--tips-backgroud-color);
            color: #888;
            border-radius: 5px;
            padding: 10px;

            i {
                color: #50bfff;
                margin-right: 5px;
            }
        }

        .box-article {
            .warpper {
                background: var(--article-srect-background);
                position: relative;
                height: 210px;
                padding: 5px;

                &::before {
                    content: "";
                    position: absolute;
                    top: -80px;
                    left: 0;
                    width: 100%;
                    height: 80px;
                    z-index: 2;
                    background: linear-gradient(180deg, rgba(55, 55, 55, 0), #ccc);
                }

                .item-title {
                    color: #fff;
                }

                .item-box {
                    border-radius: 10px;
                    background-color: var(--background-color);
                    height: 150px;
                    margin-left: 10px;
                    margin-right: 10px;
                    margin-top: 10px;
                    margin-bottom: 10px;
                    overflow: hidden;

                    span {
                        background: linear-gradient(135deg, #ff74cd 10%, #ec7d0b);
                        border-top-left-radius: 10px;
                        border-bottom-right-radius: 10px;
                        padding: 5px;
                        font-size: 0.9rem;
                        color: #fff;
                    }

                    .neirong {
                        text-align: center;
                        margin-top: 15px;
                        color: var(--text-color);
                        font-size: 0.9rem;
                    }

                    .btn {
                        margin: 0 auto;
                        display: block;
                        margin-top: 20px;
                    }
                }
            }
        }

        /deep/ .content {
            color: var(--article-color);
            line-height: 30px;
            margin-top: 10px;
            padding: 10px;


            blockquote {
                position: relative;
                padding: 0 10px;
                color: #6a737d;
                border-left: 0.25em solid #dfe2e5;
                margin: 20px 0;
            }

            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                margin: 10px 0;
            }

            table {
                background-color: var(--article-table-back-color);

                td {
                    border: 1px solid var(--article-table-border-color);
                    padding: 5px;
                }

                tr {
                    background-color: var(--article-table-border-color);
                    transition: all .3s ease-in-out;

                    &:hover {
                        background-color: var(--article-table-back-color);
                        border: none;
                    }
                }

                th {
                    background-color: var(--article-table-back-color);
                }

            }

            p {
                a {
                    text-decoration: none;
                    color: #7bc549;

                    &::after {
                        content: '🔗';
                    }
                }
            }

            code {
                vertical-align: middle;
                word-break: break-word !important;
                border-radius: 2px !important;
                overflow-x: auto !important;
                background-color: #fff5f5;
                color: #ff502c;
                font-size: .87em !important;
                padding: 0.065em 0.4em !important;
            }

            ol {
                margin-left: 20px;
            }

            pre {
                opacity: 1 !important;
                margin: 10px 0;
                color: #f8f8f2 !important;
                overflow: hidden;
                box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;
                border-radius: 8px;

                code {
                    line-height: 20px !important;
                    font-size: 16px !important;
                    vertical-align: top;
                    padding: 10px !important;
                    border-bottom-left-radius: 8px !important;
                    border-bottom-right-radius: 8px !important;
                    background-color: #303133 !important;
                    color: #c0c4cc !important;
                    width: -webkit-fill-available;
                    display: inline-block;
                }

            }

            img {
                max-width: 100%;
                margin: 15px 0;
                border-radius: 5px !important;
                transition: box-shadow .35s, transform .35s;
                cursor: pointer;
                max-height: 500px;

                &:hover {
                    box-shadow: 5px 10px 5px rgba(0, 0, 0, 0.2);
                    transform: translateY(-10px)
                }
            }

            ul {
                margin-left: 20px;
            }

        }

        .tag-share {
            display: flex;
            overflow-x: auto;
            margin-right: 5px;
            align-items: center;
            padding-bottom: 15px;
            margin-bottom: 20px;
            position: relative;
            border-bottom: 1px solid var(--border-line);
            margin-top: 20px;
            min-height: 30px;

            .tagBtn {
                cursor: pointer;
                margin-right: 5px;
            }

            .social-share {
                position: absolute;
                right: 0;
                top: 0;

                .social-share-icon {
                    margin-left: 10px;
                    display: inline-block;
                    width: 32px;
                    height: 32px;
                    font-size: 20px;
                    border-radius: 50%;
                    line-height: 30px;
                    border: 1px solid #666;
                    color: #666;
                    text-align: center;
                    vertical-align: middle;
                    text-decoration: none;

                    i {
                        font-size: 25px;
                    }
                }

                .icon-qzone {
                    border-color: #fdbe3d;
                    color: #fdbe3d;

                    &:hover {
                        background-color: #fdbe3d;

                        i {
                            color: white;
                        }
                    }
                }

                .icon-wechat {
                    color: #7bc549 !important;
                    border-color: #7bc549;

                    &:hover {
                        background-color: #7bc549;

                        i {
                            color: white;
                        }
                    }
                }

                .icon-weibo {
                    color: #ff763b !important;
                    border-color: #ff763b;

                    &:hover {
                        background-color: #ff763b;

                        i {
                            color: white;
                        }
                    }
                }

                .icon-qq {
                    color: #56b6e7 !important;
                    border-color: #56b6e7;

                    &:hover {
                        background-color: #56b6e7;

                        i {
                            color: white;
                        }
                    }
                }
            }


        }

        .wechatImg {
            img {
                width: 100%;
            }
        }

        .copyright {
            background-color: var(--text-color3);
            border-radius: 5px;
            width: 100%;
            min-height: 130px;
            position: relative;
            border: 1px dashed var(--theme-color);
            margin-top: 20px;

            &::before {
                content: "声明";
                background-image: linear-gradient(to right, #FFCC99, #FF99CC);
                width: 30%;
                padding: 5px;
                border-radius: 999px;
                position: absolute;
                top: -18px;
                left: 35%;
                text-align: center;
                border: 1px dashed var(--theme-color);
                font-weight: 700;
            }

            .copyrightItem {
                padding: 10px 10px;
                height: 100%;
                line-height: 26px;

                svg {
                    width: 18px;
                    height: 18px;
                    margin-right: 3px;
                    vertical-align: -4px;
                }

                .text {
                    color: #909399;
                    font-size: 14px;
                    margin-left: 8px;
                    text-decoration: none;
                }

                .name {
                    color: var(--theme-color);
                    font-weight: 700;
                }

                a:hover {
                    color: var(--theme-color);
                }
            }

            .yuan {
                width: 20px;
                height: 20px;
                position: absolute;
                top: 10px;
                right: 10px;
            }
        }





        .comment-mian {
            margin-top: 30px;

            .title {
                font-weight: 700;
                font-size: 20px;
                margin-top: 20px;
                color: var(--article-color);

                svg {
                    width: 20px;
                    height: 20px;
                }
            }
        }
    }


}


.wxImg {
    display: block;
    margin: 0 auto;
    width: 50%;
    height: 50%;
    margin-bottom: 15px;
}
</style>

<style>
.hljs {
    border-bottom-left-radius: 8px !important;
    border-bottom-right-radius: 8px !important;
}

.mac-icon {
    height: 15px !important;
    display: flex;
    align-items: center;
    border: 1px solid #272822 !important;
    background-color: #272822 !important;
    padding: 8px !important;
    border-top-left-radius: 8px !important;
    border-top-right-radius: 8px !important;

}

.mac-icon>span {
    display: inline-block !important;
    letter-spacing: 5px !important;
    word-spacing: 5px !important;
    width: 10px !important;
    height: 10px !important;
    border-radius: 8px !important;
}

.mac-icon-red {
    background-color: red !important;
}

.mac-icon-yellow {
    margin-left: 10px;
    background-color: yellow !important;
}

.mac-icon-green {
    margin-left: 10px;
    background-color: green !important;
}

.mac-icon-lang {
    width: 50px !important;
    padding-left: 10px !important;
    font-size: 16px !important;
    vertical-align: top !important;
}

.copy-button {
    border-radius: 3px;
    padding: 5px !important;
    color: #ffffff !important;
    font-size: 1rem;
    margin-left: auto;
}


.copy-button:hover {
    background-color: black !important;
}
</style>
