<template>
    <div class="say-main container">
        <div class="say-containner">
            <div class="cover">
                <img :src="img_url+`72d9854940be46579f098b49f9d9035c.jpg`" alt="">
                <div class="info">说说</div>
            </div>
            <div class="contentBox">
                <div class="sayItem" v-for="(item, index) in sayList" :key="index">
                    <div class="avatar">
                        <el-avatar :src="item.avatar" alt=""></el-avatar>
                    </div>
                    <div class="rigthBox">
                        <div class="nickname">
                            {{ item.nickname }}
                            <el-tooltip v-if="item.userId==='1'" class="item" effect="dark" content="博客主" placement="right">
                                <svg-icon icon-class="bozhu"></svg-icon>
                            </el-tooltip>
                          <el-tooltip v-else class="item" effect="dark" content="博主" placement="right">
                            <svg-icon icon-class="yuanchuang"></svg-icon>
                          </el-tooltip>
                        </div>
                        <p class="content" v-highlight v-html="item.content"></p>
                        <div v-if="item.imgUrl" :class="ckeckImgClass(item.imgUrl)">
                            <div class="imgBox" @click="handlePreviewImg(item.imgUrl)" v-if="checkImg(item.imgUrl)"
                                v-for="(imgItem, imgIndex) in splitImg(item.imgUrl)">
                                <img :key="imgItem" v-lazy="imgItem" alt="">
                            </div>
                        </div>

                        <div class="bottomBox">
                            <div v-if="item.address" class="address">
                                <a>
                                    <i class="el-icon-location-outline"></i> {{ item.address }}
                                </a>
                            </div>
                            <span class="time">
                                <i class="el-icon-time"></i> {{ item.createTimeStr }}
                            </span>
                            <div class="operate" ref="operate">
                                <span class="like" v-if="!item.isLike" @click="sayLike(item)">
                                    <i class="iconfont icon-dianzan"></i> 赞
                                </span>
                                <span class="like" v-else @click="canLike(item)">
                                    <i class="iconfont icon-quxiaodianzan"></i> 取消
                                </span>
                                <span class="fgx"></span>
                                <span class="commentBtn" @click="handleShowCommentBox(null, item.id, index)">
                                    <i class="el-icon-chat-dot-square"></i> 评论
                                </span>
                            </div>
                            <a class="operateBtn" @click="handleShowOperate(index)">
                                <i class="el-icon-more"></i>
                            </a>
                        </div>
                        <div class="interaction">
                            <div v-if="item.userLikeList.length"
                                :class="item.userLikeList.length && item.sayCommentVOList.length ? 'like-container is_border' : 'like-container'">
                                <span v-for="(user, user_index) in item.userLikeList" :key="user_index">
                                    <i class="iconfont icon-dianzan"></i> {{ user.nickname }}
                                    <span v-if="user_index < item.userLikeList.length - 1">，</span>
                                </span>
                            </div>
                            <div class="commentBox">
                                <div class="commentItem " v-for="(comment, comment_index) in item.sayCommentVOList"
                                    :key="comment_index" v-if="item.sayCommentVOList.length">
                                    <div>
                                        <span class="username" v-if="!comment.replyUserId">
                                            {{ comment.nickname }}：
                                        </span>

                                        <span v-else>
                                            <span class="username">{{ comment.nickname }}</span>
                                            回复
                                            <span class="username">{{ comment.replyUserNickname }}：</span>
                                        </span>
                                        <span class="content point" v-html="comment.content"
                                            @click="handleShowCommentBox(comment, item.id, index)">
                                        </span>
                                    </div>
                                </div>

                                <div class="conetntInputBox" ref="conetntInputBox">
                                    <div class="">
                                        <div id="textarea" ref="textareaRef" contenteditable="true" @input="onInput"
                                            @paste="optimizePasteEvent" :data-placeholder="placeholder"
                                            class="comment-textarea"></div>

                                        <span class="point" @click="showEmoji = !showEmoji">
                                            <i class="iconfont icon-biaoqing"></i>
                                        </span>
                                        <a class="sendBtn point" @click="sayComment">发送</a>

                                    </div>
                                    <div class="emoji-wrapper" v-if="showEmoji">
                                        <Emoji @chooseEmoji="handleChooseEmoji" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 分页按钮 -->
                <sy-pagination :pageNo="pageData.pageNo" :pages="pages" @changePage="handlePage" />
            </div>
        </div>
        <image-preview :img="images"></image-preview>
    </div>
</template>
<script>
import { getSayList, sayLike, sayComment } from '@/api/say'
import Emoji from '@/components/emoji'
import imagePreview from '@/components/imagePreview'
export default {
    components: {
        Emoji,
        imagePreview
    },
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
            sayList: [],
            images: {},
            pageData: {
                pageNo: 1,
                pageSize: 10,
            },
            pages: 0,
            showOperate: false,
            lastIndex: null,
            content: "",
            showEmoji: false,
            showCommentBox: false,
            placeholder: "请输入内容",
            comment: {
                replyUserId: null,
                replyUserNickname: null,
                sayId: null,
                content: ""
            },
            commentIndex: null,
            commentLastIndex: null,
            lastEditRange: null,
          img_url: process.env.VUE_APP_IMG_API
        }
    },
    mounted() {
    },
    created() {
        this.getSayList()
    },
    methods: {
        onInput(e) {
            let selection = window.getSelection()
            this.lastEditRange = selection.getRangeAt(0);
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
        sayComment() {
            let el = document.getElementById("textarea")
            if (!el.innerHTML) {

                this.$toast.warning('请输入评论内容');
                return
            }
            this.comment.content = el.innerHTML
            sayComment(this.comment).then(res => {
                this.$refs.conetntInputBox[this.commentLastIndex].style.display = "none"
                this.showCommentBox = false

                this.$toast.success('评论成功');
                let comment = {
                    userId: this.$store.state.userInfo.id,
                    nickname: this.$store.state.userInfo.nickname,
                    replyUserId: this.comment.replyUserId,
                    replyUserNickname: this.comment.replyUserNickname,
                    content: this.comment.content,
                }
                this.sayList[this.commentIndex].sayCommentVOList.push(comment)
                this.comment = {}
            })
        },
        handleShowCommentBox(comment, sayId, index) {
            if (this.commentLastIndex != null && this.commentLastIndex != index) {
                this.$refs.conetntInputBox[this.commentLastIndex].style.display = "none"
            }
            if (this.commentLastIndex == index) {
                if (this.$refs.conetntInputBox[index].style.display == "block") {
                    this.$refs.conetntInputBox[index].style.display = "none"
                } else {
                    this.$refs.conetntInputBox[index].style.display = "block"
                }
            } else {
                this.$refs.conetntInputBox[index].style.display = "block"
            }
            this.commentLastIndex = index

            if (comment) {
                this.placeholder = "回复" + comment.nickname + ":"
                this.comment.replyUserId = comment.userId
                this.comment.replyUserNickname = comment.nickname
            } else {
                this.comment.replyUserId = null
                this.comment.replyUserNickname = null
                this.placeholder = "请输入内容"
            }
            this.commentIndex = index
            this.comment.sayId = sayId
            this.showCommentBox = !this.showCommentBox

        },
        //添加表情
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

            let edit = document.getElementById("textarea")
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
            this.showEmoji = false
        },
        //关闭操作框
        handleClose(e) {
            if (e.target.className != "el-icon-more" && e.target.className != "operateBtn") {

                if (this.lastIndex != null) {
                    this.$refs.operate[this.lastIndex].style = "display:none"
                }
            }
        },
        handleShowOperate(index) {
            if (this.lastIndex != null && this.lastIndex != index) {
                this.$refs.operate[this.lastIndex].style.display = "none"
            }
            if (this.lastIndex == index) {
                if (this.$refs.operate[index].style.display == "block") {
                    this.$refs.operate[index].style.display = "none"
                } else {
                    this.$refs.operate[index].style.display = "block"
                }
            } else {
                this.$refs.operate[index].style.display = "block"
            }
            this.lastIndex = index

        },
        canLike(say) {
            sayLike(say.id).then(res => {
                let index = null;
                for (let i = 0; i < say.userLikeList.length; i++) {
                    let id = say.userLikeList[i].id
                    if (this.$store.state.userInfo.id == id) {
                        index = i
                        break;
                    }
                }
                if (index != null) {
                    this.$delete(say.userLikeList, index)
                }
                say.isLike = false

                this.$toast.success(res.data);
            })
        },
        sayLike(say) {
            sayLike(say.id).then(res => {
                say.userLikeList.push({
                    id: this.$store.state.userInfo.id,
                    nickname: this.$store.state.userInfo.nickname
                })
                say.isLike = true

                this.$toast.success(res.data);
            })
        },
        handlePreviewImg(imgs) {
            this.images = {
                urls: imgs,
                time: new Date().getTime()
            }
        },
        getSayList() {
            this.$bus.$emit('show');
            getSayList(this.pageData).then(res => {
                this.sayList.push(...res.data.records)
                this.pages = res.data.pages
                this.$bus.$emit('close')
            }).catch(err => {
                this.$bus.$emit('close')
            })
        },
        handlePage(val) {
            this.pageData.pageNo = val;
            this.getSayList()
        },
        checkImg(img) {
            return this.splitImg(img).length > 0
        },
        ckeckImgClass(img) {
            let length = this.splitImg(img).length
            if (length == 1) {
                return "contentImg grid-1"
            } else if (length == 2) {
                return "contentImg grid-2"
            } else {
                return "contentImg grid-3"
            }
        },
        splitImg(img) {
            let imgs = img.split(",")
            var r = imgs.filter(function (s) {
                return s && s.trim();
            });
            return r;
        },
    }
}
</script>
<style lang="scss" scoped>
.say-main {


    @media screen and (max-width: 1118px) {
        padding: 0 5px;

        .say-containner {
            width: 100%;

            /deep/ video {
                height: 200px;
                width: 250px;
            }

            /deep/ pre {
                max-width: 75%;
            }

            .cover {
                height: 250px;
            }

            .imgBox {
                max-height: 200px;
            }

            .grid-1 {

                .imgBox {
                    width: 200px;
                    height: 200px;
                }
            }

            .grid-2 {

                .imgBox {
                    width: 150px;
                    height: 150px;
                }
            }

            .grid-3 {

                .imgBox {
                    width: 100px;
                    height: 100px;
                }
            }

            .conetntInputBox {
                width: 100%;
            }
        }
    }

    @media screen and (min-width: 1119px) {
        .say-containner {
            width: 60%;

            /deep/ video {
                height: 500px;
            }

            .imgBox {
                max-height: 250px;
            }

            .cover {
                height: 380px;
            }

            .grid-1 {

                .imgBox {
                    width: 250px;

                }
            }

            .grid-2 {

                .imgBox {
                    width: 250px;
                }
            }

            .grid-3 {

                .imgBox {
                    width: 250px;
                }
            }

            .conetntInputBox {
                width: 50%;
            }
        }
    }

    .say-containner {
        padding: 10px;
        margin-top: 80px;

        .cover {
            width: 100%;

            position: relative;

            img {
                border-radius: 5px;
                width: 100%;
                height: 100%;
            }

            .info {
                position: absolute;
                top: 50%;
                left: 50%;
                font-size: 25px;
                font-weight: 700;
            }
        }

        .contentBox {
            margin-top: 20px;
            width: 100%;
            color: var(--text-color);

            .sayItem {
                padding: 10px;
                display: flex;
                margin-bottom: 10px;
                border-radius: 5px;
                position: relative;
                background-color: var(--background-color);
                overflow: hidden;

                .avatar {


                    /deep/ img {

                        vertical-align: top;
                    }
                }

                .rigthBox {
                    padding-left: 10px;
                    display: flex;
                    flex-direction: column;
                    width: 100%;

                    .nickname {
                        color: var(--theme-color);

                        svg {
                            width: 18px;
                            height: 18px;
                            vertical-align: -3px;
                        }
                    }

                    .content {
                        margin-top: 10px;

                    }

                    .grid-1 {
                        grid-template-columns: repeat(1, 0fr);
                    }

                    .grid-2 {
                        grid-template-columns: repeat(2, 0fr);
                    }

                    .grid-3 {
                        grid-template-columns: repeat(3, 0fr);
                    }

                    .contentImg {
                        display: grid;
                        margin-top: 10px;

                        .imgBox {
                            overflow: hidden;
                            margin-right: 5px;
                            margin-bottom: 10px;
                            border-radius: 5px;

                        }

                        img {
                            max-width: 100%;
                            // 这里的高度随便设置，反正父层盒子设置了超出隐藏
                            min-height: 300px;
                            cursor: zoom-in;
                            object-fit: cover;
                        }
                    }

                    .bottomBox {
                        margin-top: 20px;
                        position: relative;


                        .address {
                            color: #5597bd;
                            margin-bottom: 10px;
                        }

                        .time,
                        .address {
                            font-size: 14px;
                        }

                        .operateBtn {
                            position: absolute;
                            right: 20px;
                            display: inline-block;
                            background-color: var(--say-background);
                            padding: 0 5px;
                            cursor: pointer;
                        }

                        .operate {
                            position: absolute;
                            right: 55px;
                            bottom: -8px;
                            display: inline-block;
                            background-color: #4b5153;
                            padding: 8px;
                            border-radius: 5px;
                            display: none;

                            &::after {
                                content: '';
                                position: absolute;
                                right: -15px;
                                bottom: 10px;
                                width: 0;
                                height: 0;
                                border-width: 8px;
                                border-style: solid;
                                border-color: transparent transparent transparent #4b5153;
                            }

                            span {
                                padding: 0 10px;
                                color: #fff;
                                position: relative;
                                cursor: pointer;

                                &:hover {
                                    color: var(--theme-color);
                                }
                            }

                            .like::after {
                                content: "";
                                width: 2px;
                                height: 100%;
                                background-color: #373d40;
                                position: absolute;
                                right: 0;
                            }

                        }
                    }

                    .interaction {
                        background-color: var(--say-background);
                        margin-top: 15px;
                        border-radius: 5px;


                        .like-container {
                            padding: 8px 0;
                            padding-left: 10px;

                            span {
                                font-size: 14px;
                                color: #576b95;
                            }
                        }



                        .is_border {
                            border-bottom: 1px dashed rgb(126, 120, 120);
                        }

                        .commentBox {

                            .commentItem {
                                margin-bottom: 5px;
                                padding-left: 10px;

                                &:first-child {
                                    margin-top: 10px;
                                }

                                .username {
                                    color: #5597bd;
                                }


                            }
                        }

                        .conetntInputBox {
                            border: 1px solid #67C23A;
                            border-radius: 5px;
                            background-color: var(--background-color);
                            position: relative;
                            min-height: 100px;
                            display: none;
                            margin-left: 10px;

                            .comment-textarea {
                                min-height: 100px;
                                outline: none;
                                padding-left: 10px;
                                padding-top: 5px;

                                &:empty:before {
                                    content: attr(data-placeholder);
                                    color: #666;
                                }
                            }


                            i {
                                font-size: 1.3rem;
                                position: absolute;
                                right: 80px;
                                bottom: 20px;
                            }

                            .sendBtn {
                                display: inline-block;
                                background-color: #67C23A;
                                color: #fff;
                                padding: 5px 8px 5px 8px;
                                border-radius: 5px;
                                position: absolute;
                                right: 20px;
                                bottom: 15px;
                            }
                        }

                    }
                }
            }

        }
    }
}
</style>
