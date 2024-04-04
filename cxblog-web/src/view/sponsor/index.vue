<template>
    <div class="sponsor-main">
        <el-card class="sponsor-warpper">
            <h2 class="title">
                赞助墙
            </h2>
            <div class="sponsor-tips">
                <div class="item">当前赞助用途</div>
                <div class="item">1.维护网站、域名</div>
                <div class="item"> 2.为以后升级博客筹钱</div>
                <div class="item">3.给博主的一点点幸苦费</div>
            </div>
            <div class="tips">
                <div class="item">
                    请注意:
                </div>
                <div class="item">
                    1.博主不会强迫任何人必须赞助！完全自愿。
                </div>
                <div class="item">
                    2.请在上传支付截图前登录站点以此来绑定您的账号
                </div>
                <div class="item">
                    3.在支付完后请
                    <span class="submitBtn">
                        <el-upload style="display:inline-block" :show-file-list="false" ref="upload" name="filedatas"
                            :action="uploadPictureHost" :http-request="uploadPayImage" :before-upload="handleUploadBefore"
                            multiple>
                            点击此处
                        </el-upload>
                    </span>
                    来发送你的支付截图
                </div>

            </div>
            <div class="sponsor">
                <div class="sponsorBtn">
                    <button ref="button" v-for="(item, index) in btnList" :key="index" typ="botton"
                        :class="{ 'active': index === activeIndex }" @click="handleClike(index)">{{ item }}</button>
                </div>
                <div class="sponsor-img">
                    <div class="img-tips">
                        请在支付前认真思考！！<br />
                        目前仅支持右侧的三项支付方式
                    </div>
                    <div class="imgBox">
                        <img @click="handlePreview" v-if="activeIndex == index" v-for="(item, index) in payImages"
                            :key="index" :src="item" alt="">
                    </div>
                </div>
            </div>
            <div class="sponsorList">
                <h3>赞助名单</h3>
                <div>
                    <ul>
                        <li v-for="(item, index) in sponsorList" :key="index">
                            <span class="index">{{ index + 1 }}</span>
                            <div>
                                <img :src="item.avatar" />
                                <span>{{ item.nickname }}</span>
                            </div>

                            <span class="sopnsor-item">
                                赞助了 <i> {{ item.money }} </i>元
                            </span>
                            <span class="sopnsor-item">{{ item.createTime }}</span>
                        </li>
                    </ul>
                </div>
            </div>
        </el-card>
        <image-preview :img="images"></image-preview>
    </div>
</template>
<script>
import { upload } from '@/api'
import { addSponsor, getSponsorList } from '@/api/sponsor'
import imagePreview from '@/components/imagePreview'
export default {
    components: {
        imagePreview
    },
    data() {
        return {
            btnList: ["确认", "微信", "支付宝"],
            activeIndex: 0,
            pageData: {
                pageNo: 1,
                pageSize: 100,
            },
            pages: 0,
            uploadPictureHost: process.env.VUE_APP_BASE_API + "/api/file/upload",
            sponsorList: [],
            files: [],
            images: {},
            payImages: ["https://localhost/cxblog/img/20231020_1697773914361.jpg", this.$store.state.webSiteInfo.weixinPay, this.$store.state.webSiteInfo.aliPay],
        }
    },
    created() {
        this.getSponsorList()
    },
    methods: {
        getSponsorList() {
            getSponsorList().then(res => {
                this.sponsorList.push(...res.data.records)
                this.pages = res.data.pages
            })
        },
        handlePreview() {
            let urls = this.payImages.join(",")
            this.images = {
                urls: urls,
                time: new Date().getTime()
            }
        },
        handleClike(index) {
            this.$refs.button[this.activeIndex].className = "";
            this.$refs.button[index].className = "active";
            this.activeIndex = index;
        },
        handleUploadBefore() {
            this.$bus.$emit('show');
        },
        uploadPayImage: function (param) {
            this.files = param.file
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('multipartFile', this.files)
            upload(formData).then(res => {
                addSponsor(res.data).then(ress => {
                    this.$toast.success('提交成功')
                    this.$bus.$emit('close')
                }).catch(err => {
                    this.$bus.$emit('close')
                })
            }).catch(err => {
                this.$bus.$emit('close')
            })
        },
    }
}
</script>
<style lang="scss" scoped>
.sponsor-main {
    display: flex;
    justify-content: center;
    padding: 10px;


    /deep/ .sponsor-warpper {
        position: relative;
        margin-top: 80px;
        min-height: calc(100vh - 207px);
        background-color: var(--background-color);
        color: var(--text-color);

        @media screen and (max-width: 1118px) {
            width: 100%;
            padding: 10px;

            .imgBox {
                width: 100%;
                margin: 0 auto;


            }
        }

        @media screen and (min-width: 1119px) {
            width: 65%;
            padding: 30px 50px;

            .imgBox {
                width: 500px;
                margin: 0 auto;
            }

        }

        .item {
            margin-bottom: 10px;
        }

        .sponsor-tips {
            margin-top: 15px;
            border: 1px solid var(--border-line);
            border-left: 5px solid var(--border-line);
            padding: 20px;
            width: auto;
            border-radius: 5px;
            background-color: antiquewhite;

        }

        .tips {
            margin-top: 15px;
            background-color: var(--tips-backgroud-color);
            padding: 10px 20px;

            .submitBtn {
                color: var(--theme-color);
                cursor: pointer;
            }

        }

        .sponsor {
            margin-top: 15px;
            background-color: #f0f0f0;
            padding: 5px;
            border-radius: 5px;

            .sponsorBtn {
                button {
                    padding: 20px;
                    display: inline-block;
                    cursor: pointer;
                    border: none;

                    &:hover {
                        background-color: rgba(196, 193, 193, 0.7)
                    }
                }

                .active {
                    background-color: #fff;
                    border-bottom: 2px solid #799ee4;
                }
            }

            .sponsor-img {
                background-color: var(--background-color);

                .img-tips {
                    padding: 20px 20px;
                    color: #6bcf84;
                }

                img {
                    width: 100%;
                    text-align: center;
                }


            }
        }

        .sponsorList {
            margin: 15px 0;

            ul {
                list-style: none;

                li {
                    display: flex;
                    align-items: center;
                    width: fit-content;
                    border-radius: 5px;
                    padding: 5px 20px;
                    background-color: #ebeef5;
                    color: var(--text-color);
                    margin: 0 auto;
                    margin-bottom: 10px;

                    .index {
                        display: inline-block;
                        width: 20px;
                        height: 20px;
                        background-color: var(--theme-color);
                        padding: 5px;
                        text-align: center;
                        line-height: 20px;
                        margin-right: 20px;
                        border-radius: 3px;
                        color: #fff;
                    }

                    .sopnsor-item {
                        margin-left: 50px;

                        line-height: 20px;

                        i {
                            color: var(--theme-color);
                            font-weight: 700;
                        }
                    }

                    img {
                        vertical-align: middle;
                        border-radius: 50%;
                        width: 35px;
                        height: 35px;
                    }
                }
            }
        }

    }
}
</style>
