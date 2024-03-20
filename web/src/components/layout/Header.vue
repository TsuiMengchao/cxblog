<template>
    <header :class="headerClass">
        <div id="pre" :style="{ width: widthPre + '%' }"></div>
        <nav>
            <div class="logo">
                <div class="logoBox">
                    <router-link :to="'/'">
                        <el-image class="img"
                            style="width: 40px;border-radius: 50%; height: 40px;border: 1px solid var(--border-line);"
                            :src="$store.state.webSiteInfo.logo">
                        </el-image>
                        <span class="name">辰雪博客</span>
                    </router-link>

                </div>
                <!-- 手机端导航栏 -->
                <span v-if="isMobile" style="position: absolute;left: 10px;">
                    <!-- <a @click="openSearch"><i class="iconfont iconsousuo" /></a> -->
                    <a @click="openDrawer" style="font-size:20px">
                        <i class="iconfont icon-menu_normal" style="font-size: 1.5rem;" />
                    </a>
                </span>
                <!-- 手机端搜索栏 -->
                <span v-if="isMobile" style="position: absolute;right: 10px;">
                    <!-- <a @click="openSearch"><i class="iconfont iconsousuo" /></a> -->
                    <a @click="handleOpenSearchDialog" style="font-size:20px">
                        <i class="iconfont icon-search" style="font-size: 1.5rem;" />
                    </a>
                </span>
            </div>

            <ul class="starlist">
                <li :class="path == '/' ? 'active' : ''">
                    <span>
                        <router-link :to="'/'">
                            <svg-icon icon-class="home"></svg-icon> 首页
                        </router-link>
                    </span>
                </li>

                <li :class="path == '/archive' || path == '/categorys' || path == '/tag'
                    ? 'active' : ''">
                    <el-dropdown trigger="hover">
                        <span class="el-dropdown-link">
                            <svg-icon icon-class="archive"></svg-icon> 文章归档<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">
                            <router-link style="text-decoration: none;color: #71777c;" :to="'/archive'">
                                <el-dropdown-item>
                                    <i class="el-icon-date"></i>文章归档
                                </el-dropdown-item>
                            </router-link>
                            <router-link style="text-decoration: none;color: #71777c;" :to="'/categorys'">
                                <el-dropdown-item>
                                    <i class="el-icon-menu"></i>文章分类
                                </el-dropdown-item>
                            </router-link>

                            <router-link style="text-decoration: none;color: #71777c;" :to="'/tag'">
                                <el-dropdown-item>
                                    <i class="el-icon-collection-tag"></i>文章标签
                                </el-dropdown-item>
                            </router-link>
                        </el-dropdown-menu>
                    </el-dropdown>
                </li>

                <li>
                    <span>
                        <router-link :to="'/sponsor'" style="color:red;font-weight:700">
                            <svg-icon icon-class="sponsor"></svg-icon> 赞助
                        </router-link>
                    </span>
                </li>

                <li :class="path == '/forum' ? 'active' : ''">
                    <span>
                        <router-link :to="'/forum'">
                            <svg-icon icon-class="talk"></svg-icon> 论坛
                        </router-link>
                    </span>
                </li>

                <li :class="path == '/say' ? 'active' : ''">
                    <span>
                        <router-link :to="'/say'">
                            <svg-icon icon-class="say"></svg-icon> 说说
                        </router-link>
                    </span>
                </li>

              <li :class="path == '/tipsoon' ? 'active' : ''">
                    <span>
                        <router-link :to="'/tipsoon'">
                            <svg-icon icon-class="tipsoon"></svg-icon> 简讯
                        </router-link>
                    </span>
              </li>

                <li :class="path == '/navigation' ? 'active' : ''">
                    <span>
                        <router-link :to="'/navigation'">
                            <svg-icon icon-class="navication"></svg-icon> 网址导航
                        </router-link>
                    </span>
                </li>

                <li :class="path == '/hot' ? 'active' : ''">
                    <span>
                        <router-link :to="'/hot'">
                            <svg-icon icon-class="hot2"></svg-icon> 热搜
                        </router-link>
                    </span>
                </li>
                <li :class="path == '/message' ? 'active' : ''">
                    <span>
                        <router-link :to="'/message'">
                            <svg-icon icon-class="message"></svg-icon> 留言板
                        </router-link>
                    </span>
                </li>
                <li :class="path == '/links' ? 'active' : ''">
                    <span>
                        <router-link :to="'/links'">
                            <svg-icon icon-class="friendLink"></svg-icon> 友情链接
                        </router-link>
                    </span>
                </li>
                <li :class="path == '/about' ? 'active' : ''">
                    <el-dropdown trigger="hover">
                        <span class="el-dropdown-link">
                            <svg-icon icon-class="about"></svg-icon> 关于本站<i class="el-icon-arrow-down el-icon--right"></i>
                        </span>
                        <el-dropdown-menu slot="dropdown">

                            <router-link style="text-decoration: none;color: #71777c;" :to="'/about'">
                                <el-dropdown-item>
                                    <i class="el-icon-monitor"></i>关于本站
                                </el-dropdown-item>
                            </router-link>

                            <a style="text-decoration: none;color: #71777c;" href="https://gitee.com/Tsuimengchao/"
                                target="_blank">
                                <el-dropdown-item>
                                    <i class="iconfont icon-code"></i>网站源码
                                </el-dropdown-item>
                            </a>

                            <a style="text-decoration: none;color: #71777c;" :href="adminUrl" target="_blank">
                                <el-dropdown-item>
                                    <i class="el-icon-setting"></i>后台管理
                                </el-dropdown-item>
                            </a>
                        </el-dropdown-menu>
                    </el-dropdown>
                </li>

            </ul>

            <!-- 热搜框 -->
            <div class="searchBox" v-show="!showSearch">
                <p class="search_ico" @click="handleOpenSearchDialog">
                    <i class="iconfont icon-search"></i>
                </p>
            </div>
            <!-- 发布文章按钮 -->
            <div class="articleBtn" v-if="showUser">

                <el-dropdown trigger="hover">
                    <span class="el-dropdown-link">
                        <button type="button" class="sendBtn">
                            <i class="el-icon-edit-outline"></i> 创作
                        </button>
                    </span>
                    <el-dropdown-menu slot="dropdown">

                        <router-link style="text-decoration: none;color: #71777c;" :to="'/newposts'">
                            <el-dropdown-item>
                                <svg-icon icon-class="article"
                                    style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布文章
                            </el-dropdown-item>
                        </router-link>
                        <router-link style="text-decoration: none;color: #71777c;" :to="'/newSays'">
                            <el-dropdown-item>
                                <svg-icon icon-class="say"
                                    style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布说说
                            </el-dropdown-item>
                        </router-link>

                        <router-link style="text-decoration: none;color: #71777c;" :to="'/forum'">
                            <el-dropdown-item>
                                <svg-icon icon-class="talk"
                                    style="width: 20px;height: 20px;vertical-align: -5px;"></svg-icon> 发布讨论
                            </el-dropdown-item>
                        </router-link>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>

            <div class="noticeBtn" v-if="showUser">
                <el-dropdown trigger="hover">
                    <div class="el-dropdown-link">
                        <!-- <i class="el-icon-bell"></i> -->
                        <svg-icon icon-class="notice"></svg-icon>
                        <span v-if="topBageShow()" class="notice-bage topBage"></span>
                    </div>
                    <el-dropdown-menu slot="dropdown">
                        <span v-for="(item, index) in noticeList" :key="index" @click="handleClickNotice(index)">
                            <el-dropdown-item>
                                {{ item }}
                                <span v-if="validata(index)" class="notice-bage"></span>
                            </el-dropdown-item>
                        </span>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>

            <div class="userInfo" v-if="showUser">
                <el-dropdown trigger="hover">
                    <div class="el-dropdown-link">
                        <img v-if="!userInfo" src="/assets/img/layout/touristAvatar.png" alt="">
                        <img v-else :src="userInfo.avatar" alt="" />
                    </div>
                    <el-dropdown-menu slot="dropdown" v-if="userInfo">
                        <router-link style="text-decoration: none;color: #71777c;" :to="'/user'">
                            <el-dropdown-item>
                                个人中心
                            </el-dropdown-item>
                        </router-link>
                        <a style="text-decoration: none;color: #71777c;" @click="logout">
                            <el-dropdown-item>退出登录</el-dropdown-item>
                        </a>
                    </el-dropdown-menu>

                    <el-dropdown-menu slot="dropdown" v-else>
                        <div class="loginTip" style="padding: 10px;font-size: 0.9rem;">
                            <p>登录网站，获取以下权益</p>
                            <div style="margin-top: 10px;">
                                <span>
                                    <i class="el-icon-cloudy"></i> 参与互动评论
                                </span>

                                <span style="margin-left: 10px;">
                                    <i class="el-icon-cloudy"></i> 发表优质文章
                                </span>
                            </div>
                            <el-button @click="handleLogin()" style="margin:  0 auto;display: block;margin-top: 10px;"
                                type="success" size="small">立即登录</el-button>
                        </div>
                    </el-dropdown-menu>
                </el-dropdown>
            </div>
        </nav>

    </header>
</template>
<script>
import { logout } from '@/api'
import { removeToken, getNotice } from '@/utils/cookieUtil'
export default {
    name: 'Header',

    props: {
        userInfo: {
            type: Object,
            default: null,
        },
    },
    data() {
        return {
            widthPre: '',
            keywords: null,
            user: this.$store.state.userInfo,
            style: null,
            path: null,
            isMobile: false,
            showSearch: false,
            showUser: true,
            windowWidth: 0,
            headerClass: "header",
            adminUrl: process.env.VUE_APP_ADMIN_API,
            noticeList: ["系统通知", "评论", "关注", "点赞", "收藏", "私信"]
        };
    },

    created() {

        window.addEventListener('resize', () => {
            this.windowWidth = window.innerWidth // 宽
        }, true)
        window.addEventListener('scroll', this.scrollFn, false)
    },

    watch: {
        // 监听页面宽度
        windowWidth(val) {
            this.isMobile = val < 1119
            this.showSearch = val < 1500
            this.showUser = val > 1350
        },
        $route(newVal, old) {
            this.path = newVal.fullPath
        }
    },

    methods: {
        handleOpenSearchDialog() {
            this.$store.state.searchDialogVisible = true
        },
        handleClickNotice(index) {
            if (!this.user) {
                this.$store.commit("setLoginFlag", true)
                return;
            }
            if (index == this.noticeList.length - 1) {
                this.$router.push({ path: "/im" })
                return
            }
            this.$router.push({ path: "/notice", query: { type: index } })
        },
        topBageShow() {
            return this.$store.state.systemNotcie.system > 0 || this.$store.state.systemNotcie.comment > 0
                || this.$store.state.systemNotcie.watch > 0 || this.$store.state.systemNotcie.like > 0
                || this.$store.state.systemNotcie.collect > 0 || this.$store.state.systemNotcie.message > 0 || this.$store.state.systemNotcie.private > 0;
        },
        validata(index) {
            switch (index) {
                case 0:
                    return this.$store.state.systemNotcie.system > 0;
                case 1:
                    return this.$store.state.systemNotcie.comment > 0;
                case 2:
                    return this.$store.state.systemNotcie.watch > 0;
                case 3:
                    return this.$store.state.systemNotcie.like > 0;
                case 4:
                    return this.$store.state.systemNotcie.collect > 0;
                case 5:
                    return this.$store.state.systemNotcie.private > 0;
                default:
                    return false;
            }
        },

        scrollFn() {
            // 页面滚动距顶部距离
            let scrollTop =
                window.pageYOffset ||
                document.documentElement.scrollTop ||
                document.body.scrollTop;
            let scroll = scrollTop - this.i;
            this.i = scrollTop;

            // 鼠标向上滚动
            // if (scroll < 0) {
            //     this.headerClass = "header slideDown"
            // } else {
            //     this.headerClass = "header slideUp"
            // }
            let page = document.body.scrollHeight
            let client = document.documentElement.clientHeight
            let comend = page - client
            let scrTop = document.documentElement.scrollTop
            this.widthPre = Math.round(scrTop / comend * 10000) / 100
        },
        handleLogin() {
            this.$store.commit("setLoginFlag", true);// 存储到vuex
        },
        logout() {
            //如果在个人中心则跳回上一页
            if (this.path === "/user") {
                this.$router.go(-1);
            }
            logout().then(() => {
                removeToken()
                this.$store.commit("setUserInfo", null)
                location.reload()
            }).catch(err => {
                console.log(err)
            });
        },
        openDrawer() {
            this.$store.commit("setDrawer", true);
        },
    }
}
</script>
<style scoped lang="scss">
.notice-bage {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background-color: red;
    display: inline-block;
}

.topBage {
    vertical-align: 15px;
}

#pre {
    position: fixed;
    top: 0;
    height: 2px;
    background-image: -webkit-linear-gradient(0deg, #3ca5f6 0, #a86af9 100%);
}

@media screen and (max-width: 1118px) {
    .header {
        position: fixed;
        top: 0;
        width: 100%;
        line-height: 60px;
        z-index: 99;
        background-color: var(--header-back-color);

        a {
            text-decoration: none;
        }

        nav {
            width: 100%;
            margin: auto;
            overflow: hidden;
            max-width: 1500px;

            .logo {
                font-size: 22px;
                font-weight: 700;
                width: 100%;
                position: relative;
                display: flex;
                color: var(--text-color);

                .logoBox {
                    height: 60px;
                    display: flex;
                    align-items: center;
                    margin-left: 20px;
                    position: relative;
                    margin: 0 auto;
                }

                .img {
                    width: 80px;
                    height: 40px;
                    vertical-align: middle;
                    margin-top: -6px;
                }

                .name {
                    margin-left: 10px !important;
                    color: var(--theme-color) !important;
                    font-family: "Lucida Calligraphy", cursive, serif, sans-serif;
                }
            }



            .starlist {
                display: none;
            }

            .searchBox,
            .articleBtn,
            .starlist,
            .noticeBtn,
            .userInfo {
                display: none;
            }
        }
    }
}



@media screen and (min-width: 1119px) {

    /*针对宽度小于等于767px的屏幕设备，定义如下样式*/
    .slideDown {
        transition: transform .5s ease-out;
        transform: translateY(0);
    }

    .slideUp {
        transition: transform .5s ease-out;
        transform: translateY(-100px);
    }

    .header {
        position: fixed;
        top: 0;
        width: 100%;
        line-height: 60px;
        z-index: 99;
        background-color: var(--header-back-color);
        backdrop-filter: blur(25px);
        box-shadow: 0 1px 40px -8px rgba(0, 0, 0, .5);

        a {
            text-decoration: none;
        }

        nav {
            width: 100%;
            margin: auto;
            overflow: hidden;
            max-width: 1500px;

            .logo {
                float: left;
                font-size: 22px;
                font-weight: 700;

                .img {
                    vertical-align: middle;
                    margin-top: -6px;
                }

                .name {
                    margin-left: 10px !important;
                    color: var(--theme-color) !important;
                }
            }

            .starlist {
                display: block;
                float: left;
                margin-left: 30px;
                overflow: hidden;
                max-width: 1500px;

                .el-dropdown-link {
                    cursor: pointer;
                }



                li {
                    float: left;
                    display: block;
                    font-size: 14px;
                    padding: 0 15px;
                    position: relative;


                    // &:hover::before {
                    //     content: "";
                    //     position: absolute;
                    //     top: 0;
                    //     left: 0;
                    //     right: 0;
                    //     bottom: 0;
                    //     width: 60%;
                    //     height: 4px;
                    //     border-bottom-left-radius: 15px;
                    //     border-bottom-right-radius: 15px;
                    //     background-color: var(--theme-color);
                    //     margin: 0 auto;
                    //     text-align: center;
                    //     animation: fade-in 0.3s linear 1;
                    // }

                    @keyframes fade-in {
                        0% {
                            transform: scale(0);
                        }

                        100% {
                            transform: scale(1);
                        }
                    }

                    svg {
                        width: 18px;
                        height: 18px;
                        vertical-align: -3px;
                    }

                    i {
                        font-weight: 700;
                    }

                    a {
                        color: #71777c;

                        &:hover {
                            color: var(--theme-color);
                        }
                    }

                }

                .active {
                    // &::before {
                    //     content: "";
                    //     position: absolute;
                    //     top: 0;
                    //     left: 0;
                    //     right: 0;
                    //     bottom: 0;
                    //     width: 60%;
                    //     height: 4px;
                    //     border-bottom-left-radius: 15px;
                    //     border-bottom-right-radius: 15px;
                    //     background-color: var(--theme-color);
                    //     margin: 0 auto;
                    //     text-align: center;
                    // }

                    /deep/ a,
                    span {
                        color: var(--theme-color) !important;
                        font-weight: 700;
                    }

                }
            }

            .searchBox {
                position: absolute;
                right: 300px;
                top: 0;
                display: flex;
                -ms-flex-direction: column;
                flex-direction: column;

                .search_ico {
                    position: absolute;
                    right: 5px;
                    top: 0;
                    padding: 0;
                    margin: 0;
                    line-height: 60px;
                    cursor: pointer;
                    text-align: right;
                    color: var(--text-color);

                    .iconfont {
                        font-size: 20px;
                        font-weight: 700;
                    }
                }

                // .hot_search_main {
                //     background-color: var(--background-color);
                //     border-radius: 2px;
                //     box-shadow: 0 0 10px rgba(0, 0, 0, .5);
                //     position: absolute;
                //     z-index: 99;
                //     top: 60px;
                //     left: 10px;
                //     right: -10px;
                //     opacity: 0;
                //     visibility: hidden;
                //     transition: visibility .35s, opacity .35s, transform .35s;
                //     transform: translate3d(0, 15px, 0);

                //     a {
                //         height: 30px;
                //         text-decoration: none;
                //         display: block;
                //         overflow: hidden;
                //         text-overflow: ellipsis;
                //         white-space: nowrap;
                //         /* border-bottom: 1px solid #f2f6fc; */
                //         line-height: 30px;
                //         padding: 4px 5px;
                //         color: #606266;
                //         font-size: 12px;

                //         &:first-child span {
                //             background-color: #FE2D46;
                //         }

                //         &:nth-child(2) span {
                //             background-color: #FF6600;
                //         }

                //         &:nth-child(3) span {
                //             background-color: #FAA90E;
                //         }

                //         span {
                //             width: 20px;
                //             height: 20px;
                //             display: inline-block;
                //             line-height: 21px;
                //             text-align: center;
                //             border-radius: 3px;
                //             color: var(--background-color);
                //             background-color: #71777c;

                //         }

                //         &:first-child {
                //             border-top-left-radius: 4px;
                //             border-top-right-radius: 4px;
                //         }

                //         &:last-child {
                //             border-bottom-left-radius: 4px;
                //             border-bottom-right-radius: 4px;
                //         }

                //         &:hover {
                //             background-color: rgb(235, 238, 245);
                //         }
                //     }
                // }
            }

            .articleBtn {
                position: absolute;
                right: 220px;
                top: 0;

                .sendBtn {
                    display: inline-block;
                    background: linear-gradient(135deg, #60e464 10%, #5cb85b 100%);
                    border-radius: 50px;
                    padding: 5px 10px 5px 10px;
                    border: none;
                    color: #fff;
                }
            }

            .noticeBtn {
                position: absolute;
                right: 170px;
                top: 0;

                svg {
                    width: 20px;
                    height: 20px;
                }

                i {
                    font-size: 1.5rem;
                    color: var(--article-color);
                }

                /deep/ .el-dropdown {
                    width: 35px;
                    height: 35px;
                    right: -10px;
                    top: 5px;
                }
            }



            .userInfo {
                position: absolute;
                right: 120px;
                top: 0;

                /deep/ .el-dropdown {
                    width: 35px;
                    height: 35px;
                    right: 0;
                    top: 10px;
                }

                img {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    border: 1px solid var(--border-line);
                    position: absolute;
                }

            }
        }
    }

}
</style>
