<template>
    <div class='article-add'>
        <div class="containner">
            <div class="title">
                发布文章
            </div>
            <el-form style="display: flex;" :rules="rules" ref="ruleForm" label-position="left" label-width="80px"
                :model="article">
                <div class="article-left">
                    <el-row :gutter="20">
                        <el-col :span="16">
                            <el-form-item label="文章标题" prop="title">
                                <el-input v-model="article.title"></el-input>
                            </el-form-item>
                            <el-form-item label="文章简介" prop="summary">
                                <el-input v-model="article.summary"></el-input>
                            </el-form-item>
                        </el-col>
                        <el-col :span="8">
                            <el-form-item label="封面图" prop="" class="articeAvatar">
                                <el-upload class="avatar-uploader" :show-file-list="false" ref="upload" name="filedatas"
                                    :action="uploadPictureHost" :http-request="uploadSectionFile"
                                    :before-upload="handleUploadBefore" multiple>
                                    <img v-if="article.avatar" style="width: 100%;height: 100%;" :src="article.avatar"
                                        class="imgAvatar" />
                                    <i v-else class="el-icon-plus avatar-img-icon"></i>
                                </el-upload>
                            </el-form-item>
                        </el-col>
                    </el-row>
                    <el-form-item label="文章内容" prop="contentMd">
                        <el-upload style="color: var(--theme-color)" :show-file-list="false" ref="upload" name="filedatas"
                            action="" :http-request="readMarkdownFile" :before-upload="handleUploadBefore" multiple>
                            <i class="el-icon-upload"></i> 文档导入
                        </el-upload>

                        <mavon-editor placeholder="输入文章内容..." style="height: 500px" ref=md v-model="article.contentMd"
                            @imgDel="imgDel" @change="" @imgAdd="imgAdd">
                            <!-- 左工具栏后加入自定义按钮  -->
                            <template slot="left-toolbar-after">

                                <el-dropdown>
                                    <span class="el-dropdown-link">
                                        <i class="op-icon fa el-icon-video-camera" title="上传视频"></i>
                                    </span>
                                    <el-dropdown-menu slot="dropdown">
                                        <el-dropdown-item>
                                            <el-upload style="display: inline-block;" :show-file-list="false" ref="upload"
                                                name="filedatas" action="" :http-request="uploadVideo"
                                                :before-upload="handleUploadBefore" multiple>
                                                <span>上传视频</span>
                                            </el-upload>
                                        </el-dropdown-item>
                                        <el-dropdown-item>
                                            <div @click="dialogVisible = true">添加视频地址</div>
                                        </el-dropdown-item>
                                    </el-dropdown-menu>
                                </el-dropdown>
                            </template>
                        </mavon-editor>
                    </el-form-item>
                </div>
                <div class="article-right">
                    <div class="top">
                        <el-form-item label="文章标签" prop="tagList">
                            <el-select v-model="article.tagList" :multiple-limit="3" multiple placeholder="请选择标签">
                                <el-option v-for="item in tagList" :key="item.id" :label="item.name" :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="文章分类" prop="categoryId">
                            <el-select v-model="article.categoryId" placeholder="请选择分类">
                                <el-option v-for="item in categoryList" :key="item.id" :label="item.name" :value="item.id">
                                </el-option>
                            </el-select>
                        </el-form-item>
                        <el-form-item label="创作类型" prop="isOriginal">
                            <el-radio v-model="article.isOriginal" :label="1">原创</el-radio>
                            <el-radio v-model="article.isOriginal" :label="0">转载</el-radio>
                        </el-form-item>
                        <el-form-item v-if="article.isOriginal == 0" label="文章地址" prop="originalUrl">
                            <el-input v-model="article.originalUrl"></el-input>
                        </el-form-item>
                        <el-form-item label="关键词">
                            <el-input v-model="article.keywords"></el-input>
                        </el-form-item>
                    </div>

                    <div class="bottom">
                        <div class="btn-tips">Are you ready</div>
                        <button v-if="$store.state.userInfo" type="button" class="btnDraft" @click="submit(3)">
                            <i class="el-icon-orange"></i> 保存草稿
                        </button>
                        <button v-if="$store.state.userInfo" type="button" class="btnSubmit" @click="submit(2)">
                            <i class="el-icon-circle-check"></i> 提交审核
                        </button>
                        <span v-else class="noBtn">
                            暂无发布权限,请先<span @click="$store.state.loginFlag = true">登录</span>
                        </span>
                    </div>
                </div>
            </el-form>
        </div>
        <el-dialog center title="添加视频" :visible.sync="dialogVisible" width="30%">
            <el-input v-model="videoInput" placeholder="视频地址"></el-input>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="addVideo">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>
<script>
import { upload, featchCategory, insertArticle, updateArticle, getMyArticleInfo, fetchTagList, readMarkdownFile } from '@/api'
export default {
    data() {
        return {
            uploadPictureHost: process.env.VUE_APP_BASE_API + "/api/file/upload?path=file.img.upload.article",
            article: {
                avatar: "",
                title: ""
            },
            categoryList: [],
            dialogVisible: false,
            loading: [],
            img: process.env.VUE_APP_IMG_API+'file/img/upload/',
            articleId: this.$route.query.id,
            tagList: [],
            videoInput: "",
            rules: {
                title: [
                    { required: true, message: '请输入文章名称', trigger: 'blur' },
                ],
                avatar: [
                    { required: true, message: '请上传文章封面', trigger: 'change' },
                ],
                summary: [
                    { required: true, message: '请输入文章简介', trigger: 'blur' },
                ],
                tagList: [
                    { required: true, message: '请选择文章标签', trigger: 'blur' },
                ],
                categoryId: [
                    { required: true, message: '请选择文章分类', trigger: 'blur' },
                ],
                isOriginal: [
                    { required: true, message: '请选择创作类型', trigger: 'blur' },
                ],
                originalUrl: [
                    { required: true, message: '请输入转载地址', trigger: 'blur' },
                ],
                contentMd: [
                    { required: true, message: '请输入文章内容', trigger: 'blur' },
                ],
            }
        };
    },
    beforeRouteLeave(to, from, next) {
        // 删除md编辑器的高亮样式 否则会跟文章详情代码块样式有冲突
        let css = document.getElementsByTagName('link');
        for (let i = 0; i < css.length; i++) {
            if (css[i].href.includes("https://cdnjs.cloudflare.com/ajax/libs/highlight.js/11.3.1/styles/github.min.css")) {
                css[i].parentNode.removeChild(css[i]);
            }
        }
        next()
    },
    created() {
        if (this.articleId) {
            getMyArticleInfo(this.articleId).then(res => {
                this.article = res.data
            })
        }
        featchCategory().then(res => {
            this.categoryList = res.data
        })
        fetchTagList().then(res => {
            this.tagList = res.data
        })
    },
    methods: {
        imgAdd: function (pos, $file) {
            var formdata = new FormData();
            formdata.append('multipartFile', $file);
            formdata.append("path", "file.img.upload.article")
            upload(formdata).then(res => {
                this.$refs.md.$img2Url(pos, res.data);
            }).catch(err => {
                console.log(err)
            })
        },
        imgDel: function (filename) {
            delBatchFile(filename[0].split(this.img)[1])
        },
        submit(type) {
            this.$refs['ruleForm'].validate((valid) => {
                if (valid) {
                    if (!this.article.contentMd) {

                        this.$toast.error('请编写文章内容！');
                        return;
                    }
                    this.article.isPublish = type
                    this.article.content = this.$refs.md.d_render
                    if (this.article.id) {
                        updateArticle(this.article).then(res => {

                            this.$toast.success('修改成功，请耐心等待审核');
                            this.$router.push({ path: "/user" })
                        })
                    } else {
                        insertArticle(this.article).then(res => {

                            this.$toast.success('提交成功，请耐心等待审核');
                            this.$router.push({ path: "/user" })
                        })
                    }

                } else {
                    console.log('error submit!!');
                    return false;
                }
            });
        },
        handleUploadImage(event, insertImage, files) {
            const file = files[0]
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('multipartFile', file)
          formData.append("path", "file.img.upload.article")
            upload(formData).then(res => {
                insertImage({
                    url: res.data,
                    desc: file.name,
                    width: '100%',
                    height: '300px',
                });
            })

        },
        handleUploadBefore() {
            this.$bus.$emit('show');
        },
        readMarkdownFile(param) {
            var fileExtension = param.file.name.split('.').pop().toLowerCase();
            if (fileExtension !== "md") {
                this.$bus.$emit('close')
                this.$toast.error("只能上传md后缀的文件")
                return false;
            }
            this.files = param.file
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('file', this.files)
            readMarkdownFile(formData).then(res => {
                this.article.contentMd = res.data.content
                this.article.title = res.data.fileName
                this.$bus.$emit('close')
            }).catch(err => {
                this.$bus.$emit('close')
            })
        },
        addVideo() {
            // 这里获取到的是mavon编辑器实例，上面挂载着很多方法
            const $vm = this.$refs.md
            // 将文件名与文件路径插入当前光标位置，这是mavon-editor 内置的方法
            $vm.insertText($vm.getTextareaDom(),
                {
                    prefix: `<video height=100% width=100% src="${this.videoInput}"></video>`,
                    subfix: '',
                    str: ''
                })

            this.dialogVisible = false
            this.videoInput = ''
        },
        uploadVideo(param) {
            this.files = param.file
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('multipartFile', this.files)

          formData.append("path", "file.img.upload.article")
            upload(formData).then(res => {
                const $vm = this.$refs.md
                // 将文件名与文件路径插入当前光标位置，这是mavon-editor 内置的方法
                $vm.insertText($vm.getTextareaDom(),
                    {
                        prefix: `<video height=100% width=100% src="${res.data}"></video>`,
                        subfix: '',
                        str: ''
                    })
                this.$bus.$emit('close')
            }).catch(err => {
                this.$bus.$emit('close')
            })
        },
        uploadSectionFile: function (param) {
            this.files = param.file
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('multipartFile', this.files)

          formData.append("path", "file.img.upload.article")
            upload(formData).then(res => {
                this.article.avatar = res.data
                this.$bus.$emit('close')
            }).catch(err => {
                this.$bus.$emit('close')
            })
        },
    }
};
</script>
<style lang="scss" scoped>
.article-add {
    display: flex;
    justify-content: center;

    @media screen and (max-width: 1118px) {
        padding: 0 5px;

        .containner {
            width: 100%;

        }
    }

    @media screen and (min-width: 1119px) {
        .containner {
            width: 80%;
        }
    }

    .containner {
        margin-top: 80px;

        padding: 10px;
        color: var(--text-color);

        /deep/ .article-left input {
            border-top: none !important;
            border-left: none !important;
            border-right: none !important;

            &:hover {
                border-color: var(--theme-color) !important;
            }
        }

        .title {
            margin-bottom: 15px;
            position: relative;
            padding-left: 10px;

            &::before {
                content: ' ';
                width: 5px;
                height: 100%;
                background: linear-gradient(to right, #ff00ff, #c2553a);
                position: absolute;
                bottom: 0;
                left: 0;
            }
        }

        .article-left,
        .article-right .top,
        .bottom {
            border-radius: 5px;
            padding: 10px;
        }

        .article-left {
            background-color: var(--background-color);
            margin-right: 20px;
            width: 100%;
            max-width: 80%;

            .el-textarea {
                width: 92%;
            }

            /deep/ .contentInput textarea {
                resize: none;
                background-color: var(--background-color);
            }
        }

        .article-right {
            width: 35%;
            height: 100%;
            display: flex;
            flex-direction: column;

            .top,
            .bottom {
                background-color: var(--background-color);
            }

            .bottom {
                margin-top: 20px;
                text-align: center;

                .btn-tips {
                    color: #b5b5b5;
                    font-size: 0.75rem;
                    margin-bottom: 1rem;

                    &::before {
                        content: "";
                        display: inline-block;
                        background-color: #d8d8d8;
                        width: 60px;
                        height: 1px;
                        margin: 0 12px;
                        vertical-align: middle;
                    }

                    &::after {
                        content: "";
                        display: inline-block;
                        background-color: #d8d8d8;
                        width: 60px;
                        height: 1px;
                        margin: 0 12px;
                        vertical-align: middle;
                    }
                }

                .btnDraft,
                .btnSubmit {
                    padding: 10px;
                    width: 50%;
                    border: none;
                    margin: 0 auto;
                    color: #fff;
                    font-weight: 700;
                }

                .btnDraft {
                    border-top-left-radius: 5px;
                    border-bottom-left-radius: 5px;
                    background: linear-gradient(135deg, #60e464 10%, #5cb85b 100%);
                }

                .btnSubmit {
                    border-top-right-radius: 5px;
                    border-bottom-right-radius: 5px;
                    background: linear-gradient(135deg, #59c3fb 10%, #268df7 100%);
                }

                .noBtn {
                    color: var(--text-color);

                    span {
                        color: var(--theme-color);
                        cursor: pointer;
                    }
                }
            }

        }

    }
}

.articeAvatar {
    /deep/ .avatar-uploader {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
        max-width: 200px;
        height: 100px;
        text-align: center;
    }

    /deep/ .el-upload {
        width: 100%;
        height: 100%;
    }

    /deep/ .avatar-uploader:hover {
        border-color: #409EFF;
    }

    /deep/ .el-icon-plus {
        font-size: 28px;
        color: #8c939d;
        line-height: 100px;
    }

    /deep/ .avatar {
        width: 178px;
        height: 178px;
        display: block;
    }
}
</style>
