<template>
    <div class="comment-main" v-show="showBox" ref="reply">
        <div class="comment-item">
            <div class="box">
                <div class="avatar">
                    <img v-if="user != null" :src="user.avatar" alt="">
                    <img v-else :src="img_url+`avatar/touristAvatar.png`" alt="">
                </div>
                <div class="ml-3">
                    <div data-v-0089e256="" class="comment-input">
                        <div id="textarea" ref="textareaRef" contenteditable="true" @input="onInput"
                            @paste="optimizePasteEvent" data-placeholder="说点什么呢" class="comment-textarea"></div>
                    </div>
                    <div class="comment-btn">
                        <span @click.stop="chooseEmoji = !chooseEmoji" class="emoji-btn point">
                            <i class="iconfont icon-biaoqing"></i>
                        </span>
                        <div style="margin-left: auto;">
                            <el-button type="info" @click="handleCancle" class="cancle-btn v-comment-btn point">
                                取消
                            </el-button>
                            <el-button @click="addComment" class="upload-btn v-comment-btn point">
                                提交
                            </el-button>
                        </div>
                    </div>
                    <div class="emoji-wrapper" v-show="chooseEmoji">
                        <Emoji @chooseEmoji="handleChooseEmoji" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { postComment } from '@/api/comment'
import { browserMatch } from '@/utils'
import Emoji from '@/components/emoji'
export default {
    components: {
        Emoji
    },
    data() {
        return {
            chooseEmoji: false,
            userId: null,
            nickname: null,
            parentId: null,
            index: null,
            commentContent: "",
            replyUserId: null,
            showBox: false,
            user: this.$store.state.userInfo,
            lastEditRange: null,
          img_url: process.env.VUE_APP_IMG_API
        }
    },
    mounted() {
        document.addEventListener("click", e => {
            if (e.target.className != "el-radio-button__orig-radio" && e.target.className != "el-radio-button__inner"
                && e.target.className != "el-upload__input" && e.target.className != "el-icon-plus avatar-uploader-icon") {
                this.chooseEmoji = false
            }
        })
        this.$refs['textareaRef'].onclick = () => {
            // 获取选定对象
            let selection = window.getSelection()
            // 设置最后光标对象
            if (selection.rangeCount > 0) {
                // 记录光标最后点击可编辑div中所选择的位置
                this.lastEditRange = selection.getRangeAt(0);
            }
        }
    },
    methods: {
        handleChooseEmoji(value) {
            // 创建一个img标签（表情）
            let img = document.createElement('img');
            img.src = value.url;
            img.style.verticalAlign = 'middle';
            img.style.marginLeft = "2px"
            img.style.marginRight = "2px"
            img.style.maxHeight = value.maxHeight;
            img.style.height = value.height
            img.style.width = value.width
            let edit = this.$refs['textareaRef']
            edit.focus()
            let selection = window.getSelection()
            // 如果存在最后的光标对象
            if (this.lastEditRange) {
                // 选区对象清除所有光标
                selection.removeAllRanges();
                // 并添加最后记录的光标，以还原之前的状态
                selection.addRange(this.lastEditRange);
                // 获取到最后选择的位置
                var range = selection.getRangeAt(0);
                // 在此位置插入表情图
                range.insertNode(img)
                // false，表示将Range对象所代表的区域的起点移动到终点处
                range.collapse(false)

                // 记录最后的位置
                this.lastEditRange = selection.getRangeAt(0);
            } else {
                // 将表情添加到可编辑的div中，作为可编辑div的子节点
                edit.appendChild(img)
                // 使用选取对象，选取可编辑div中的所有子节点
                selection.selectAllChildren(edit)
                // 合并到最后面，即实现了添加一个表情后，把光标移到最后面
                selection.collapseToEnd()
            }
            this.chooseEmoji = false
        },
        handleCancle() {
            this.showBox = false
        },
        optimizePasteEvent(e) {
            // 监听粘贴内容到输入框事件，对内容进行处理 处理掉复制的样式标签，只拿取文本部分
            e.stopPropagation()
            e.preventDefault()
            let text = '', event = (e.originalEvent || e)
            if (event.clipboardData && event.clipboardData.getData) {
                text = event.clipboardData.getData('text/plain')
            } else if (window.clipboardData && window.clipboardData.getData) {
                text = window.clipboardData.getData('text')
            }
            if (document.queryCommandSupported('insertText')) {
                document.execCommand('insertText', false, text)
            } else {
                document.execCommand('paste', false, text)
            }
        },
        onInput(e) {
            let selection = window.getSelection()
            this.lastEditRange = selection.getRangeAt(0);
        },
        addComment() {
            if (!this.$refs.textareaRef.innerHTML) {
                this.$toast.error('评论不能为空')
                return;
            }
            let browser = browserMatch()
            let comment = {
                articleId: this.$route.params.articleId,
                content: this.$refs.textareaRef.innerHTML,
                replyUserId: this.replyUserId,
                parentId: this.parentId,
                browser: browser.browser.toLowerCase(),
                browserVersion: browser.browser + " " + browser.version,
            }
            postComment(comment).then(res => {
                this.$emit("reloadReply", this.index);
                this.$toast.success('评论成功')
                this.$store.commit("isCommentFlag", true)
                this.$refs.textareaRef.innerHTML = ""
                this.showBox = false
            })

        },
    },
}
</script>
<style lang="scss" scoped>
.comment-main {
    margin-left: 40px;

    .comment-item {
        border: 1px solid rgba(144, 147, 153, .31);
        border-radius: 4px;
        padding: 10px;
        margin: 10px 0 10px;

        .box {
            display: flex;

            .avatar {
                line-height: normal;
                position: relative;
                vertical-align: middle;

                img {
                    width: 40px;
                    width: 40px;
                    overflow: hidden;
                    border-radius: 50%;
                }
            }

            .ml-3 {
                margin-left: 12px !important;
                width: 100%;
                position: relative;

                .comment-input {
                    position: relative;

                    .comment-textarea {
                        font-size: .875rem;
                        color: var(--article-color) !important;
                        outline: none;
                        padding: 10px 5px;
                        min-height: 122px;
                        resize: none;
                        width: 100%;
                        border-radius: 4px;
                        background-color: transparent;
                        border-style: none;
                        background: url( '@/assets/gif/plun.gif') 100% 100% no-repeat;
                        transition: all 0.25s ease-in-out 0s;

                        &:focus {
                            background-position-y: 150px;
                        }

                        &:empty:before {
                            content: attr(data-placeholder);
                            color: #666;
                        }
                    }
                }

                .comment-btn {
                    display: flex;
                    align-items: center;
                    margin: 10px 0;

                    .emoji-btn {
                        i {
                            font-size: 1.3rem;
                        }
                    }

                    .emoji-btn-active {
                        .iconfont {
                            color: var(--theme-color);
                        }
                    }

                    .v-comment-btn {
                        border: 1px solid var(--border-line);
                        border-radius: 4px;
                        text-align: center;
                        padding: 10px 16px;
                        font-size: 14px;
                        transition: all .3s;
                        outline: none;
                    }

                    .cancle-btn {
                        margin-right: 1rem;
                        position: relative;
                    }


                    @media screen and (max-width: 767px) {
                        .upload-btn {

                            margin-left: auto;
                            color: #fff;
                            background-color: var(--theme-color);
                            position: relative;
                        }
                    }

                    @media screen and (min-width: 768px) {
                        .upload-btn {

                            margin-left: auto;
                            color: #fff;
                            background-color: var(--theme-color);
                            overflow: hidden;
                            transition: all .5s;
                            position: relative;

                            &:hover {
                                background-color: #00C853;
                            }

                            &:hover::before {
                                left: 120%;
                                transition: all .5s;
                            }

                            &::before {
                                content: '';
                                position: absolute;
                                top: 0;
                                left: -40%;
                                width: 20%;
                                height: 100%;
                                background: linear-gradient(90deg, transparent, #fff, transparent);
                                transform: skew(-45deg);
                            }
                        }
                    }
                }

                .emoji-wrapper {
                    position: absolute;
                    top: -53px;
                }
            }
        }
    }
}
</style>
