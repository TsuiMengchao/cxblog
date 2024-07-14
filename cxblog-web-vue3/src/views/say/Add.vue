<template>
    <div class='say-add container'>
        <div class="say-add-containner">
            <div class="title">
                发布说说
            </div>
            <el-form style="display: flex;" :rules="rules" ref="ruleForm" label-position="left" label-width="80px"
                :model="form">
                <div class="say-left">
                    <el-form-item label="关联图片：" prop="imgUrl" label-width="120">
                        <el-upload :action="uploadPictureHost" :before-upload="uploadBefore" list-type="picture-card"
                            :http-request="uploadSectionFile" :on-remove="handleRemove">
                            <i class="el-icon-plus"></i>
                        </el-upload>
                    </el-form-item>

                    <el-form-item label="内容" label-width="150" prop="content">
                        <el-input type="textarea" :autosize="{ minRows: 10 }" class="contentInput" placeholder="请输入说说内容"
                            v-model="form.content">
                        </el-input>
                    </el-form-item>

                </div>
                <div class="say-right">
                    <div class="top">
                        <el-form-item label="关联地址" prop="address">
                            <el-input v-model="form.address"></el-input>
                        </el-form-item>
                        <el-form-item label="开放查看" prop="isPublic">
                            <el-radio v-model="form.isPublic" label="0">未开放</el-radio>
                            <el-radio v-model="form.isPublic" label="1">开放</el-radio>
                        </el-form-item>
                    </div>

                    <div class="bottom">
                        <div class="btn-tips">Are you ready</div>
                        <button v-if="$store.state.userInfo" type="button" class="btn"
                            @click="submitForm">发布</button>
                        <span v-else class="noBtn">
                            用户暂无发布权限或未登录,请先<a @click="$store.state.loginFlag = true">登录</a>
                        </span>
                    </div>
                </div>

            </el-form>
        </div>
    </div>
</template>

<script setup name="newSays">
// import { insertSay } from '@/api/say'
// import { upload } from '@/api'
// export default {
//     name: '',
//     data() {
//         return {
//             uploadPictureHost: process.env.VUE_APP_BASE_API + "/api/file/upload?path=file.img.upload.say",
//             files: {},
//             dialogImageUrl: '',
//             dialogVisible: false,
//             form: {
//                 imgUrl: '',
//                 isPublic: "1"
//             },
//             rules: {
//                 content: [
//                     { required: true, message: '请输入内容', trigger: 'blue' }
//                 ],
//                 isPublic: [
//                     { required: true, message: '请选择公开类型', trigger: 'blue' }
//                 ],
//             }
//         };
//     },
//     methods: {
//         handleRemove(file, fileList) {
//             this.form.imgUrl.replace(file.url, '')
//         },
//         uploadBefore: function () {
//             this.$bus.$emit('show');
//         },
//         submitForm() {
//             this.$refs['ruleForm'].validate((valid) => {
//                 if (valid) {
//                     insertSay(this.form).then(res => {
//                         this.$toast.success('添加说说成功');
//                         this.$router.push({ path: "/say" })
//                     })
//                 } else {
//                     return false;
//                 }
//             });
//         },
//         uploadSectionFile: function (param) {
//             this.files = param.file
//             // FormData 对象
//             var formData = new FormData()
//             // 文件对象
//             formData.append('file', this.files)
//
//           formData.append("path", "file.img.upload.say")
//             upload(formData).then(res => {
//                 this.form.imgUrl += res.data + ","
//                 this.$bus.$emit('close');
//
//             }).catch(error => {
//                 this.$bus.$emit('close');
//             })
//         },
//     }
// }
</script>

<style lang='scss' scoped>
.say-add {

    @media screen and (max-width: 1118px) {
        padding: 0 5px;

        .containner {
            width: 100%;

        }
    }

    @media screen and (min-width: 1119px) {
        .say-add-containner {
            width: 60%;
        }
    }

    .say-add-containner {
        margin-top: 80px;

        padding: 10px;
        color: var(--text-color);
        min-height: calc(100vh - 207px);

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

        .say-left,
        .say-right .top,
        .bottom {
            border-radius: 5px;
            padding: 10px;
        }

        .say-left {
            background-color: var(--background-color);
            margin-right: 20px;
            width: 100%;

            .el-textarea {
                width: 92%;
            }

            /deep/ .contentInput textarea {
                resize: none;
                background-color: var(--background-color);
            }
        }

        .say-right {
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

                .btn {
                    padding: 10px;
                    width: 50%;
                    border-radius: 5px;
                    background: linear-gradient(135deg, #59c3fb 10%, #268df7 100%);
                    border: none;
                    margin: 0 auto;
                    color: #fff;
                }

                .noBtn {
                    color: var(--text-color);

                    a {
                        color: var(--theme-color);
                    }
                }
            }

        }

    }
}
</style>
