<template>
    <div class="about-box container">
        <el-card class="box1">
            <h1 class="title">关于本站</h1>
            <div class="content" v-html="siteStore.getWebInfo.aboutMe" ref="preview" />
        </el-card>

    </div>
</template>
<script setup name='About'>
import { useSiteStore } from "@/store/moudel/site.js";
const siteStore = useSiteStore()
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

        ::v-deep(.vuepress-markdown-body) {
            background-color: var(--background-color) !important;
            color: var(--article-color) !important;
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

        ::v-deep(.content) {
            margin-top: 30px;
            padding: 0 50px;
            color: var(--article-color);

            img {
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