<template>
    <div class='sysnotice container'>
        <div class="notice-container">
            <div class="left-toolbar">

                <ul>
                    <li ref="leftIem" :class="pageData.type == index ? 'left-item active' : 'left-item'"
                        v-for="(item, index) in leftIems" :key="index" @click="handleClike(item, index)">
                        <i :class="item.icon"></i> {{ item.name }}
                    </li>
                </ul>
            </div>
            <div class="rigth-toolbar">
                <div class="rigth-top">
                    <span class="top-title">
                        {{ title }}
                    </span>
                    <span class="clearAllbtn" @click="clearMessage(null)">
                        <i class="el-icon-delete"></i> 清空所有消息
                    </span>
                </div>

                <div v-if="noticeList.length" class="box" :key="refreshkey">
                    <div>
                        <div class="rigth-bottom" v-for="(item, index) in noticeList" :key="index">

                            <div class="user-info">
                                <img v-if="item.noticeType" class="avatar" :src="item.fromUserAvatar" alt="">
                                <img v-else class="avatar" :src="$store.state.webSiteInfo.logo" alt="">
                                <span class="nickname" v-if="item.noticeType">{{ item.fromUserNickname }}</span>
                                <span class="nickname" v-else>系统</span>
                                <span class="user-item" v-if="item.noticeType">
                                    <i class="el-icon-location"></i> IP属地:{{ splitIpAddress(item.ipSource) }}
                                </span>
                                <span class="user-item">
                                    <i class="el-icon-time"></i> {{ item.createTimeStr }}
                                </span>
                                <span class="user-item" v-if="item.commentMark == 1">
                                    <i class="el-icon-link"></i> 在文章
                                    <router-link :to="'/article/' + item.articleId">
                                        <span class="title">
                                            {{ item.articleTitle }}
                                        </span>
                                    </router-link>
                                    中，回复了你的评论
                                </span>
                                <span class="user-item" v-if="item.commentMark == 2">
                                    <i class="el-icon-link"></i>
                                    评论了你的文章:
                                    <router-link :to="'/article/' + item.articleId">
                                        <span class="title">
                                            {{ item.articleTitle }}
                                        </span>
                                    </router-link>
                                </span>
                                <span class="clearBtn" @click="clearMessage(item.id, index)">
                                    <i class="el-icon-delete"></i>
                                </span>
                            </div>
                            <div class="content-box">
                                <div class="imContentItem" v-if="item.noticeType <= 1" v-html="item.content">
                                </div>

                                <div v-if="item.noticeType == 2">
                                    关注了你
                                </div>
                                <div v-if="item.noticeType == 3">
                                    点赞了你的文章
                                    <router-link :to="'/article/' + item.articleId">
                                        <span class="title">" {{
                                            item.articleTitle
                                        }} "</span>
                                    </router-link>
                                </div>
                                <div v-if="item.noticeType == 4">
                                    收藏了你的文章
                                    <router-link :to="'/article/' + item.articleId">
                                        <span class="title">" {{
                                            item.articleTitle
                                        }} "
                                        </span>
                                    </router-link>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 分页按钮 -->
                    <sy-pagination :pageNo="pageData.pageNo" :pages="pages" @changePage="handlePage" />
                </div>


                <div class="empty-box" v-else>
                    <sy-empty message="暂未新通知哦" />
                </div>


            </div>
        </div>
    </div>
</template>
   
<script>
import { getMessageNotice, deleteMessage } from '@/api/im'
export default {
    name: '',
    data() {
        return {
            pageData: {
                pageNo: 1,
                pageSize: 10,
                type: this.$route.query.type ? this.$route.query.type : 0,
            },
            pages: 0,
            refreshkey: 0,
            leftIems: [
                {
                    name: "系统通知",
                    icon: "el-icon-message-solid"
                },
                {
                    name: "文章评论",
                    icon: "el-icon-chat-line-round"
                },
                {
                    name: "用户关注",
                    icon: "el-icon-user-solid"
                },
                {
                    name: "文章点赞",
                    icon: "iconfont icon-dianzan"
                },
                {
                    name: "文章收藏",
                    icon: "el-icon-star-on"
                },

            ],
            title: "系统",
            noticeList: []
        }
    },

    created() {
        // console.log('------created--------');
        this.title = this.leftIems[this.pageData.type].name
        this.getList()
    },
    methods: {
        handlePage(val) {
            this.pageData.pageNo = val;
            this.getList()
        },
        clearMessage(id, index) {
            this.$confirm('此操作将永久删除消息, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                lockScroll: false,
                type: 'warning'
            }).then(() => {

                let params = {
                    id: id,
                    type: this.pageData.type
                }
                deleteMessage(params).then(res => {
                    if (index != null) {
                        this.$delete(this.noticeList, index);
                    } else {
                        this.noticeList = []
                    }
                    this.$toast.success('删除成功')
                }).catch(err => {

                })
            }).catch(() => {

                this.$toast.info('已取消删除')
            });

        },
        handleArticleClick(id) {
            this.$router.push({ path: "articleInfo", query: { articleId: id } })
        },
        //截取地址
        splitIpAddress(address) {
            return address.split("|")[1]
        },
        handleClike(item, index) {
            if (index == this.pageData.type) {
                return;
            }
            this.refreshkey = new Date().getTime()
            this.$refs.leftIem[this.pageData.type].className = "left-item"
            this.$refs.leftIem[index].className += " active"
            this.title = item.name
            this.pageData.type = index
            this.pageData.pageNo = 1
            this.noticeList = []
            this.getList()
        },
        getList() {

            getMessageNotice(this.pageData).then(res => {
                this.noticeList.push(...res.data.records)
                this.pages = res.data.pages

            }).catch(err => {

            })
        },

    },
}
</script>

<style lang='scss' scoped>
@media screen and (max-width: 1118px) {
    .sysnotice {
        padding: 5px;

        .notice-container {
            margin-top: 60px;
            width: 100%;

            .left-toolbar {
                width: 22%;

                .left-item {
                    margin-bottom: 20px;
                }
            }

            .avatar {
                width: 30px;
                height: 30px;
            }
        }
    }
}

@media screen and (min-width: 1119px) {
    .sysnotice {
        .notice-container {
            margin-top: 80px;
            width: 60%;

            .left-toolbar {
                width: 10%;

                .left-item {
                    padding: 10px;
                }
            }

            .avatar {
                width: 50px;
                height: 50px;
            }
        }
    }
}

.sysnotice {

    .notice-container {
        padding: 20px;
        display: flex;
        border-radius: 5px;
        color: var(--article-color);

        .left-toolbar {
            background-color: var(--background-color);
            margin-right: 10px;
            border-radius: 5px;
            height: 245px;
            width: 25%;
            padding: 10px;

            ul {
                list-style: none;

                svg {
                    width: 18px;
                    height: 18px;
                    vertical-align: -2px;
                }
            }

            .left-item {
                cursor: pointer;
                border-radius: 5px;
                position: relative;
                margin-top: 10px;

                &:first-child {
                    margin-top: 0;
                }


                &::after {
                    content: "";
                    width: 100%;
                    height: 1px;
                    position: absolute;
                    bottom: -5px;
                    left: 0;
                    background-color: var(--border-line);
                }

                &:last-child::after {
                    content: "";
                    height: 0;
                }

                .icon-dianzan1 {
                    font-size: 0.9rem;
                }

                &:hover {
                    color: var(--theme-color);
                    background-color: var(--border-line);
                }
            }

            .active {
                color: var(--theme-color);
                font-weight: 600;
                font-style: italic;
            }
        }

        .clearAllbtn,
        .clearBtn {
            cursor: pointer;
            float: right;
        }

        .rigth-toolbar {
            padding: 20px;
            margin-left: 10px;
            width: 100%;
            background-color: var(--background-color);
            border-radius: 5px;

            .rigth-top {
                border-bottom: 2px solid var(--border-line);
                padding-bottom: 5px;

                .top-title {
                    font-weight: 700;
                }

                .clearAllbtn {
                    color: var(--text-color);
                }
            }


            .box {
                max-height: 700px;
                overflow: hidden;
                overflow-y: scroll;
                padding-right: 15px;
            }

            .rigth-bottom {
                margin-top: 10px;
                border-bottom: 2px dashed var(--border-line);

                &:last-child {
                    border-bottom: 0;
                }

                .user-info {
                    position: relative;


                    .avatar {
                        vertical-align: middle;
                        border: 1px solid var(--border-line);
                        margin-right: 5px;
                        border-radius: 50%;
                    }

                    .nickname {
                        font-weight: 600;
                        color: var(--theme-color);
                    }

                    .user-item {
                        margin-left: 10px;
                        color: var(--text-color);
                        font-size: 0.8rem;

                        a {
                            text-decoration: none;
                        }
                    }

                    .clearBtn {
                        line-height: 50px;
                    }
                }

                .title {
                    cursor: pointer;
                    font-weight: 600;
                    font-style: italic;

                    &:hover {
                        color: var(--theme-color);
                    }
                }

                .content-box {
                    margin-left: 50px;
                    margin-top: 20px;

                    padding-bottom: 20px;
                    color: var(--text-color);



                    /deep/ a {
                        text-decoration: none;
                    }

                }


            }


        }
    }
}
</style>