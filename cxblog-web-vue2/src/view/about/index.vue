<template>
    <div class="about-box container">
        <el-card class="box1 box-shadow">
            <h1 class="title">关于本站</h1>
            <div class="content" v-html="$store.state.webSiteInfo.aboutMe" ref="preview" />
        </el-card>

    </div>
</template>
<script>
export default {
    metaInfo: {
        meta: [{
            name: 'keyWords',
            content: "辰雪博客,开源博客,www.cx.com"  //变量或字符串
        }, {
            name: 'description',
            content: "一个专注于技术分享的博客平台,大家以共同学习,乐于分享,拥抱开源的价值观进行学习交流"
        }]
    },
    created() {
    },
    data() {
        return {
        }
    },

}
</script>

<style lang="scss" scoped>
.about-box {
    padding: 10px;

    @media screen and (max-width: 1118px) {
        .box1 {
            width: 100%;
        }
    }

    @media screen and (min-width: 1119px) {
        .box1 {
            width: 65%;
        }
    }

    .box1 {
        margin-top: 80px;
        background-color: var(--background-color);
        height: 100%;

        /deep/ .vuepress-markdown-body {
            background-color: var(--background-color);
            color: var(--article-color);
        }

        .title {
            font-size: 24px;
            color: var(--article-color);
            text-align: center;
            padding-top: 20px;
            margin-bottom: 15px;
            word-break: break-word;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.25);
            font-weight: 500;
        }

        /deep/ .content {
            margin-top: 30px;
            padding: 0 50px;
            color: var(--article-color);

            imh {
                width: 100%;
            }
        }
    }

    .authorInfo {
        margin-top: 80px;
        margin-left: 20px;
        width: 18%;
    }
}
</style>