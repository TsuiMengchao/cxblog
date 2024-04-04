<template>
    <div class="hotSearchMain container">
        <div class="box">
            <div class="nav">
                <div class="siteBox">
                    <svg-icon :icon-class="svgList[selectSite]"></svg-icon>
                    <i @click="dialogVisible = true" class="el-icon-caret-bottom"></i>
                </div>
                <el-input class="input" v-model="text" placeholder="请输入内容" @keyup.enter.native="handleCommit"></el-input>
                <div class="searchCommit" @click="handleCommit">
                    <i class="iconfont icon-search"></i>
                </div>
            </div>
            <div class="hot">
                <div class="weibo">
                    <div class="title">
                        <span>微博热搜</span>
                        <svg-icon icon-class="hot"></svg-icon>
                    </div>
                    <ul>
                        <li v-for="(item, index) in weiboList" :key="index" @click="go(item.url)">
                            <span class="index">
                                {{ index + 1 }}
                            </span>
                            <span>{{ item.keyword }}</span>
                        </li>
                    </ul>
                </div>
                <div class="baidu">
                    <div class="title">
                        <span>百度热搜</span>
                        <svg-icon icon-class="hot"></svg-icon>
                    </div>
                    <ul>
                        <li v-for="(item, index) in baiduList" :key="index" @click="go(item.url)">
                            <span class="index">
                                {{ index + 1 }}
                            </span>
                            <span>{{ item.keyword }}</span>
                        </li>
                    </ul>
                </div>

                <div class="zhihu">
                    <div class="title">
                        <span>知乎热搜</span>
                        <svg-icon icon-class="hot"></svg-icon>
                    </div>
                    <ul>
                        <li v-for="(item, index) in zhihuList" :key="index" @click="go(item.url)">
                            <span class="index">
                                {{ index + 1 }}
                            </span>
                            <span>{{ item.keyword }}</span>
                        </li>
                    </ul>
                </div>
                <div class="csdn">
                    <div class="title">
                        <span>CSDN热搜</span>
                        <svg-icon icon-class="hot"></svg-icon>
                    </div>
                    <ul>
                        <li v-for="(item, index) in csdnList" :key="index" @click="go(item.url)">
                            <span class="index">
                                {{ index + 1 }}
                            </span>
                            <span>{{ item.keyword }}</span>
                        </li>
                    </ul>
                </div>
                <div class="toutiao">
                    <div class="title">
                        <span>头条热搜</span>
                        <svg-icon icon-class="hot"></svg-icon>
                    </div>
                    <ul>
                        <li v-for="(item, index) in toutiaoList" :key="index" @click="go(item.url)">
                            <span class="index">
                                {{ index + 1 }}
                            </span>
                            <span>{{ item.keyword }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <el-dialog :lock-scroll="false" title="切换搜索引擎" :visible.sync="dialogVisible" width="30%">
            <el-radio-group v-model="tabPosition" style="margin-bottom: 30px;">
                <el-radio-button v-for="(item, index) in siteList" :key="index" :label="index">{{ item }}</el-radio-button>

            </el-radio-group>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="handleClose">确 定</el-button>
            </span>
        </el-dialog>

    </div>
</template>
<script>
import { getHot } from '@/api'
export default {
    metaInfo: {
        meta: [{
            name: 'keyWords',
            content: "辰雪博客,开源博客,www.zhaohaoyue.love"  //变量或字符串
        }, {
            name: 'description',
            content: "一个专注于技术分享的博客平台,大家以共同学习,乐于分享,拥抱开源的价值观进行学习交流"
        }]
    },
    data() {
        return {
            baiduList: [],
            weiboList: [],
            zhihuList: [],
            csdnList: [],
            toutiaoList: [],
            text: null,

            siteList: ['百度', 'Google', '知乎', 'Csdn', '码云', 'Github', '哔哩哔哩'],
            dialogVisible: false,
            tabPosition: 0,
            selectSite: 0,
            svgList: ['baidu', 'google', 'zhihu', 'csdn', 'gitee', 'github', 'bili'],
            searchUrl: ['https://www.baidu.com/s?&wd=', 'https://www.google.com/search?q=', 'https://www.zhihu.com/search?type=content&q=',
                'https://so.csdn.net/so/search?spm=1000.2115.3001.4498&q=', 'https://search.gitee.com/?skin=rec&type=repository&q=', 'https://github.com/search?q=', 'https://search.bilibili.com/all?keyword='],
        }
    },

    created() {

        getHot("baidu").then(res => {
            this.baiduList = res.data.data
        })
        getHot("weibo").then(res => {
            this.weiboList = res.data.data
        })
        getHot("zhihu").then(res => {
            this.zhihuList = res.data.data
        })
        getHot("csdn").then(res => {
            this.csdnList = res.data.data
        })
        getHot("toutiao").then(res => {
            this.toutiaoList = res.data.data
        })

    },
    methods: {
        color(index) {
            if (index == 0) {
                return "color:red"
            }
            if (index == 1) {
                return "color:#ea9518"
            }
            if (index == 2) {
                return "color:#1296db"
            }
        },
        go(url) {
            window.open(url, '_blank');
        },
        handleCommit() {
            if (!this.text) {

                this.$toast.warning("请输入搜索内容");
                return;
            }
            window.open(this.searchUrl[this.selectSite] + this.text, '_blank');
        },
        handleClose() {
            this.dialogVisible = false
            this.selectSite = this.tabPosition

            this.$toast.success("切换成功");
        },

    }
}
</script>
<style lang="scss" scoped>
.hotSearchMain {

    @media screen and (max-width: 1118px) {
        .box {
            width: 100%;
            padding: 10px;

            .nav {
                width: 100%;
            }

            .weibo,
            .baidu,
            .zhihu,
            .csdn,
            .toutiao {
                width: 47%;
                display: inline-block;
                margin-right: 10px;
            }
        }

    }

    @media screen and (min-width: 1119px) {
        .box {
            // width: 70%;

            .nav {
                width: 70%;
            }

            .hot {
                grid-template-columns: repeat(5, 1fr);
                display: grid;

                .weibo,
                .baidu,
                .zhihu,
                .csdn,
                .toutiao {
                    width: 250px;
                    display: inline-block;
                    margin-right: 30px;
                }
            }
        }
    }

    .box {
        height: 100%;
        margin-top: 80px;

        .nav {
            margin: 0 auto;
            display: block;
            height: 40px;

            /deep/ .el-input__inner {
                border-radius: 0 !important;
                background-color: var(--background-color);
                border: 1px solid var(--border-line);

            }

            .siteBox {
                display: inline-block;
                height: calc(100% - 2px);
                border: 1px solid var(--border-line);

                line-height: 38px;
                border-right: none;
                padding-left: 20px;
                padding-right: 20px;

                svg {
                    width: 25px;
                    height: 25px;
                    vertical-align: -8px;
                }

                i {
                    margin-left: 10px;
                    cursor: pointer;
                    font-size: 14px;
                }

            }

            .input {
                display: inline-block;
                width: 60%;
                border-radius: 0 !important;
            }

            .searchCommit {
                display: inline-block;
                height: calc(100% - 2px);
                line-height: 36px;
                border: 1px solid var(--border-line);
                border-left: none;
                padding-left: 20px;
                padding-right: 20px;
                cursor: pointer;
            }
        }

        .hot {
            margin-top: 50px;

            .weibo .title {
                background-color: #d52c2b;
                background-image: radial-gradient(circle at 50% 3%, #d63736, #d52c2b);
            }

            .toutiao .title {
                background-color: #d10808;
                background-image: radial-gradient(circle at 50% 3%, #d63736, #d52c2b);
            }

            .baidu .title {
                background-color: #4e6ef2;
                background-image: radial-gradient(circle at 50% -45%, #53a7f5, #4e6ef2);
            }

            .zhihu .title {
                background-color: #53a7f5;
                background-image: radial-gradient(circle at 50% -45%, #53a7f5, #4e6ef2);
            }

            .csdn .title {
                background-color: #fc5632;
                background-image: radial-gradient(circle at 50% 3%, #f07a56, #fc5632);
            }

            .weibo,
            .baidu,
            .zhihu,
            .csdn,
            .toutiao {

                .title {
                    width: 100%;
                    height: 78px;
                    text-align: center;
                    position: relative;
                    overflow: hidden;
                    border-top-left-radius: 5px;
                    border-top-right-radius: 5px;

                    svg {
                        margin-top: 20px;
                        width: 100%;
                    }

                    span {
                        color: #fff;
                        font-size: 16px;
                        font-weight: bold;
                        position: absolute;
                        top: 40%;
                        left: 0;
                        right: 0;
                        bottom: 0;
                    }
                }

                ul {
                    list-style: none;
                    margin-top: 10px;

                    li {
                        margin-bottom: 20px;
                        cursor: pointer;
                        font-size: 13px;
                        height: 100%;
                        padding: 5px;


                        &:first-child .index {
                            background-color: #FE2D46;
                        }

                        &:nth-child(2) .index {
                            background-color: #FF6600;
                        }

                        &:nth-child(3) .index {
                            background-color: #FAA90E;
                        }

                        &:hover {
                            background-color: var(--hover-color);
                            border-radius: 3px;
                        }

                        span {
                            color: var(--text-color);
                        }

                        .index {
                            display: inline-block;
                            text-align: center;
                            width: 20px;
                            height: 20px;
                            margin-right: 10px;
                            line-height: 20px;
                            background-color: #7f7f8c;
                            color: #fff;
                        }
                    }
                }
            }
        }

    }
}
</style>
