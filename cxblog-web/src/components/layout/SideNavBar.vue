<template>
    <el-drawer class="nav" direction="ltr" :with-header="false" :visible.sync="drawer" :show-close="false">
        <!-- 内容 -->
        <div class="warpper">
            <!-- 博主介绍 -->
            <div class="blogger-info">
                <el-avatar :src="$store.state.webSiteInfo.authorAvatar"></el-avatar>
            </div>

            <hr />
            <!-- 页面导航 -->
            <div class="menu-container">
                <div class="menus-item">
                    <a @click="handleClike('/')">
                        <i class="el-icon-star-off" /> 首页
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/archive')">
                        <i class="el-icon-s-order" /> 归档
                    </a>
                </div>

                <div class="menus-item">

                    <a @click="handleClike('/categorys')">
                        <i class="el-icon-menu" /> 分类
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/tag')">
                        <i class="el-icon-discount" /> 标签
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/forum')">
                        <i class="el-icon-mobile-phone" /> 论坛
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/navigation')">
                        <i class="el-icon-s-promotion" /> 网址导航
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/message')">
                        <i class="el-icon-chat-dot-square" /> 留言
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/say')">
                        <i class="iconfont icon-pinglun" /> 说说
                    </a>
                </div>
                <div class="menus-item">
                  <a @click="handleClike('/tipsoon')">
                    <i class="iconfont icon-pinglun" /> 简讯
                  </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/links')">
                        <i class="el-icon-link" /> 友链
                    </a>
                </div>
                <div class="menus-item">
                    <a @click="handleClike('/about')">
                        <i class="el-icon-info" /> 关于
                    </a>
                </div>

                <div class="menus-item" v-if="!isLogin">
                    <a @click="openLogin"><i class="el-icon-user-solid" /> 登录 </a>
                </div>
                <div v-else>
                    <div class="menus-item">
                        <a @click="handleClike('/user')"><i class="el-icon-user" /> 个人中心 </a>
                    </div>
                    <div class="menus-item">
                        <a @click="logout"><i class="el-icon-switch-button" /> 退出</a>
                    </div>
                </div>
            </div>
        </div>
    </el-drawer>
</template>

<script>
import { logout } from '@/api'
import { removeToken, getToken } from '@/utils/cookieUtil'
export default {
    data: function () {
        return {
        }
    },
    computed: {
        drawer: {
            set(value) {
                this.$store.state.drawer = value;
            },
            get() {
                return this.$store.state.drawer;
            }
        },
        isLogin() {
            return getToken();
        }
    },

    methods: {
        handleClike(val) {
            this.$store.state.drawer = false
            this.$router.push({ path: val })
        },
        close() {
            this.$store.state.drawer = false;
        },
        openLogin() {
            this.$store.state.loginFlag = true;
        },
        logout() {
            //如果在个人中心则跳回上一页
            if (this.$route.path === "/user") {
                this.$router.go(-1);
            }
            logout().then(() => {
                removeToken()
                location.reload()

                this.$toast.success('注销成功')
            }).catch(err => {
                console.log(err)
            });
        }
    }
};
</script>

<style lang="scss" scoped>
/deep/ {
    .el-drawer {
        width: 55% !important;
    }
}

a {
    color: var(--text-color);
}

.nav {
    .warpper {
        font-weight: 700;
        font-size: 1.2rem;
        background-color: var(--background-color);


        .blogger-info {
            padding: 10px 30px 0;
            text-align: center;
            z-index: 99;

            /deep/ .el-avatar {
                width: 80px;
                height: 80px;
            }
        }

        .blog-info-wrapper {
            display: flex;
            align-items: center;
            padding: 12px 10px 0;

            .blog-info-data {
                flex: 1;
                line-height: 2;
                text-align: center;

                a {
                    text-decoration: none;

                }
            }
        }

        hr {
            border: 2px dashed #d2ebfd;
            margin: 20px 0;
        }

        .menu-container {
            padding: 0 10px 40px;
            overflow: scroll;

            .menus-item {


                a {
                    padding: 6px 30px;
                    display: block;
                    line-height: 2;
                    text-decoration: none;
                }

                i {
                    margin-right: 1rem;
                }
            }
        }
    }
}

@keyframes sidebarItem {
    0% {
        transform: translateX(200px);
    }

    100% {
        transform: translateX(0);
    }
}
</style>
