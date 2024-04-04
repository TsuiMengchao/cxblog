<template>
    <div class='user-main container'>
        <div class="user-warpper">
            <div class="userBox">
                <div class="backgroupImg">
                    <img v-lazy="user.bjCover" :key="user.bjCover">

                    <el-row type="flex" class="row-bg top-btn">
                        <el-col :span="18">
                            <div class="grid-content bg-purple">
                                <a @click="btnClike(0)" class="topBtnItem">
                                    <div>{{ count.article }}</div>
                                    文章
                                </a>
                            </div>
                        </el-col>
                        <el-col :span="18">
                            <div class="grid-content bg-purple">
                                <a class="topBtnItem">
                                    <div>{{ count.followed }}</div>
                                    关注
                                </a>
                            </div>
                        </el-col>
                        <el-col :span="18">
                            <div class="grid-content bg-purple">
                                <a class="topBtnItem">
                                    <div>0</div>
                                    勋章
                                </a>
                            </div>
                        </el-col>
                    </el-row>
                </div>
                <div class="user-item">
                    <div class="toolbar">
                        <img class="cover" :src="user.avatar" alt="">
                    </div>



                    <div class="userInfo">
                        <div class="nickname">
                            昵称：<span>{{ user.nickname }}</span>
                            <el-tooltip class="item" effect="dark" content="LV1" placement="top">
                                <span>
                                    <svg-icon icon-class="level1"></svg-icon>
                                </span>
                            </el-tooltip>

                        </div>
                        <div class="desc">
                            个人简介：{{ user.intro ? user.intro : "这家伙很懒，什么都没有写..." }}
                        </div>
                    </div>
                </div>

            </div>
            <div class="bottom-box">
                <div class="title">
                    <ul>
                        <li ref="btn" :class="index == 0 ? 'active' : ''" @click="btnClike(index)"
                            v-for="(item, index) in btnList" :key="index">
                            <span class="item-title">
                                <i :class="item.icon"></i> {{ item.name }}
                            </span>
                        </li>
                    </ul>
                </div>

                <div class="articleBox" v-if="dataList.length">
                    <div class="articleItem">
                        <div v-if="pageData.index == 0" class="article" v-for="(item, index) in dataList" :key="index">
                            <router-link :to="'/article/' + item.id">
                                <div class="article-cover">
                                    <img v-lazy="item.avatar" :key="item.avatar">
                                </div>
                            </router-link>

                            <div class="article-info">
                                <div style="display: flex;position: relative;">
                                    <router-link :to="'/article/' + item.id">
                                        <div class="article-title xiahuaxian">
                                            {{ item.title }}
                                        </div>
                                    </router-link>
                                </div>


                                <div class="article-desc">
                                    {{ item.summary }}
                                </div>
                                <div class="article-tag">
                                    <el-tooltip class="item1" effect="dark" content="文章分类" placement="top">
                                        <el-tag size="mini" @click="handleClike(item.categoryId, '/categorys')">
                                            <i class=" el-icon-folder-opened"></i> {{ item.categoryName }}
                                        </el-tag>
                                    </el-tooltip>
                                    <el-tooltip class="item1" effect="dark" content="文章标签" placement="top"
                                        v-for="tag in item.tagList" :key="tag.id">

                                        <el-tag :type="tagStyle[Math.round(Math.random() * 4)]" size="mini"
                                            @click="handleClike(tag.id, '/tag')">
                                            <i class="el-icon-collection-tag"></i> {{ tag.name
                                            }}</el-tag>
                                    </el-tooltip>
                                </div>
                                <div class="article-user">
                                    <span class=" item">
                                        <i class=" el-icon-user"></i>
                                        <span class="nickname">{{ item.username }}</span>
                                    </span>

                                    <span class="time item">
                                        <i class="el-icon-time"></i>{{ item.createTime }}
                                    </span>
                                </div>

                            </div>
                        </div>

                    </div>
                    <!-- 分页按钮 -->
                    <sy-pagination :pageNo="pageData.pageNo" :pages="pages" @changePage="onPage" />
                </div>
                <div v-else>
                    <sy-empty />
                </div>
            </div>
        </div>
    </div>
</template>
   
<script>
import {
    getUserInfo, getArticleByUserId, getUserCount
} from '@/api'

export default {
    name: '',
    data() {
        return {
            user: {},
            dataList: [],
            pageData: {
                pageNo: 1,
                pageSize: 10,
                index: 0,
                type: 1,
                userId: this.$route.query.id,
            },
            form: {},
            tagStyle: ["success", "warning", "danger", "info"],
            btnList: [
                {
                    icon: "el-icon-document",
                    name: "文章"
                },
            ],
            count: {
                article: 0,
                collect: 0,
                followed: 0,
            }
        }
    },
    created() {
        getUserInfo(this.pageData.userId).then(res => {
            this.user = res.data
        })
        this.selectAricleList()
        this.getCount()
    },
    methods: {
        getCount() {
            getUserCount(this.pageData.userId).then(res => {
                let count = {
                    article: res.extra.articleCount,
                    collect: res.extra.collectCount,
                    followed: res.extra.followedCount,
                }
                this.count = count
            })
        },
        handleClike(id, path) {
            this.$router.push({ path: path, query: { id: id } })
        },
        onPage() {
            this.pageData.pageNo++;
            this.before()
        },
        btnClike(index) {
            if (this.pageData.index == index) {
                return
            }
            for (var i = 0; i < this.$refs.btn.length; i++) {
                this.$refs.btn[i].className = ""
            }
            this.$refs.btn[index].className = "active"
            this.dataList = []
            this.pageData.pageNo = 1
            this.pageData.index = index
            this.before()
        },
        before() {
            switch (this.pageData.index) {
                case 0:
                    this.selectAricleList()
                    break;
                default:
                    this.selectAricleList()
                    break;
            }
        },
        selectAricleList(type) {
            this.$bus.$emit('show');
            getArticleByUserId(this.pageData).then(res => {
                this.dataList.push(...res.data.records);
                this.pages = res.data.pages
                this.$bus.$emit('close');
            }).catch(err => {
                this.$bus.$emit('close');
            })
        },
    },
}
</script>
   
<style lang='scss' scoped>
.user-main {


    @media screen and (max-width: 1118px) {
        padding: 10px;

        .backgroupImg img {
            height: 200px;
        }

        .user-item .toolbar {
            margin-left: 20px;
            width: 100px;

        }

        .user-warpper {
            width: 100%;
        }

        .article-cover {
            display: none;
        }
    }

    @media screen and (min-width: 1119px) {
        .backgroupImg img {
            height: 400px;
        }

        .user-item .toolbar {
            margin-left: 50px;
            width: 150px;

        }

        .user-warpper {
            width: 60%;
        }

        .article-cover {
            width: 160px;
            height: 150px;
            cursor: pointer;
            overflow: hidden;
            border-radius: 5px;

            img {
                height: 100%;
                width: 100%;
                border-radius: 5px;
                transition: all 0.5s;
            }



            &:hover {
                img {
                    transform: scale(1.1);
                }
            }
        }

    }

    .user-warpper {
        display: flex;
        flex-direction: column;
        margin-top: 80px;

    }

    .userBox {
        background-color: var(--background-color);

        .backgroupImg {
            position: relative;
            width: 100%;

            .top-btn {
                width: 100%;
                position: absolute;
                top: 0;
                display: flex;
                background: linear-gradient(90deg, rgba(220, 233, 242, 0.5), rgba(255, 255, 255, 0.5), rgba(220, 233, 242, 0.4));
                text-align: center;
            }

            img {
                width: 100%;
            }
        }

        .user-item {
            height: 80px;
            display: flex;
            margin-bottom: 20px;
            position: relative;
            align-items: center;

            .toolbar {
                padding: 5px;
                background-color: var(--background-color);
                border-radius: 5px;
                margin-top: -80px;
            }

            .cover {
                object-fit: cover;
                width: 100%;
                height: 100%;
            }

            .userInfo {
                margin: 20px;
                color: var(--article-color);
                font-style: italic;

                .nickname {

                    margin-bottom: 10px;


                    svg {
                        width: 35px;
                        height: 35px;
                        vertical-align: -12px;
                    }

                    span {
                        margin-right: 5px;
                        font-weight: 700;
                        background: radial-gradient(circle at 49.86% 48.37%, #0090ff 0, #0089ff 3.33%, #3a82ff 6.67%, #717aff 10%, #9371fb 13.33%, #ae67ef 16.67%, #c45de1 20%, #d652d2 23.33%, #e448c2 26.67%, #ef3eb0 30%, #f7369e 33.33%, #fd318c 36.67%, #ff317a 40%, #ff3569 43.33%, #fd3d57 46.67%, #f94646 50%, #f35035 53.33%, #ea5a22 56.67%, #e16308 60%, #d56d00 63.33%, #c97500 66.67%, #bb7d00 70%, #ac8300 73.33%, #9d8900 76.67%, #8c8f00 80%, #7a9300 83.33%, #669700 86.67%, #4f9b00 90%, #309e0e 93.33%, #00a029 96.67%, #00a23d 100%);
                        -webkit-background-clip: text;
                        background-clip: text;
                        -webkit-text-fill-color: transparent;
                    }
                }

                .desc {

                    font-size: 0.9rem;
                }
            }


        }

    }


    .bottom-box {
        border-radius: 10px;
        margin-top: 20px;
        min-height: 500px;

        .title {
            padding: 10px;

            ul {
                display: flex;
                list-style: none;

                li {
                    margin-right: 20px;
                    cursor: pointer;
                    color: var(--text-color);

                    &:hover {
                        color: var(--theme-color);
                    }

                    .item-title {
                        margin-right: 5px;
                    }
                }

                .active {
                    color: var(--theme-color);
                    font-weight: 700;
                    font-style: italic;
                }
            }

            border-bottom: 1px solid var(--border-line);
        }

        .btnBox {
            padding: 10px;

            .btn {
                display: inline-block;
                margin-right: 10px;
                background-color: rgba(136, 136, 136, .1);
                padding: 6px;
                border-radius: 5px;
                font-size: 0.9rem;
                color: var(--text-color);
                cursor: pointer;

                &:hover {
                    background-color: var(--theme-color);
                    color: #fff;
                }
            }
        }

        .articleBox {
            height: 100%;
            padding-top: 10px;

            .articleItem {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
            }

            .article {
                display: flex;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
                margin-left: 10px;
                background-color: var(--background-color);

                &:hover {
                    background-color: #9093994a;
                }

                .article-info {
                    margin-left: 20px;
                    width: 70%;
                    position: relative;

                    a {
                        text-decoration: none;
                        color: var(--article-color);
                    }

                    .article-title {
                        font-size: 1.1rem;
                        font-weight: 600;
                        -webkit-line-clamp: 1;

                        &:hover {
                            color: var(--theme-color);
                        }
                    }

                    .article-title,
                    .article-desc {
                        display: -webkit-box;
                        -webkit-box-orient: vertical;

                        overflow: hidden;
                        text-overflow: ellipsis;
                    }

                    .article-desc {
                        -webkit-line-clamp: 3;
                        margin-bottom: 10px;
                        margin-top: 5px;
                        color: var(--text-color);
                        min-height: 60px;
                    }

                    .article-tag {
                        .el-tag {
                            margin-right: 5px;
                            cursor: pointer;
                        }
                    }

                    .article-user {
                        display: flex;
                        align-items: center;
                        margin-top: 10px;

                        .nickname {
                            color: var(--theme-color);
                        }

                        .item {
                            padding: 0 5px;
                            color: var(--text-color);

                            i {
                                margin-right: 5px;
                            }
                        }
                    }
                }


            }
        }
    }
}
</style>