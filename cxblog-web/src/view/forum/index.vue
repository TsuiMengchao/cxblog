<template>
    <div class='talk-wapper'>
        <div class="main">
            <div class="tailk">
                <div class="categoryBox">
                    <ul>
                        <li ref="categoryRef" :class="index ? 'category_item' : 'active'" @click="handleClike(item, index)"
                            v-for="(item, index) in talkList" :key="index">
                            {{ item.name }}
                        </li>
                    </ul>
                </div>
                <div class="rigthBox">
                    <div class="sendBox">
                        <!-- 发布框 -->
                        <div style="position: relative;">
                            <div id="textarea" ref="textareaRef" contenteditable="true" @input="onInput"
                                data-placeholder="快和圈友一起发布新鲜事" @paste="optimizePasteEvent" class="contentTextarea">
                            </div>
                            <el-popover class="talkBtn" placement="bottom-start" trigger="click" v-model="talkVisible">
                                <el-select v-model="form.talkId" placeholder="请选择" @change="handleSelectChage">
                                    <el-option v-for="(item, index) in talkSelectList" :key="index" :label="item.name"
                                        :value="item.id">
                                    </el-option>
                                </el-select>
                                <span slot="reference" class="talk" @click="">
                                    <i class="el-icon-orange"></i>
                                    {{ talkName }} &gt;
                                </span>
                            </el-popover>
                        </div>

                        <!-- 发布区域按钮 -->
                        <div class="bottom">
                            <span class="category">
                                <span class="item" @click="chooseEmoji = !chooseEmoji">
                                    <i class="iconfont icon-biaoqing"></i>
                                    表情
                                </span>
                                <span class="item" @click="showUploadImg = !showUploadImg">
                                    <i class="el-icon-picture-outline"></i>
                                    图片
                                </span>
                                <span class="item" @click="dialogVisible = !dialogVisible">
                                    <i class="iconfont icon-code"></i>
                                    代码
                                </span>

                                <el-popover placement="bottom-start" width="400" trigger="click" v-model="visible">
                                    <el-form :model="siteInfo" ref="numberValidateForm" label-width="100px"
                                        class="demo-ruleForm">
                                        <el-form-item label="网页地址" prop="url" :rules="[
                                            { required: true, message: '网站地址不能为空' },
                                        ]">
                                            <el-input v-model="siteInfo.url" autocomplete="off"></el-input>
                                        </el-form-item>
                                        <el-form-item label="网页标题" prop="title">
                                            <el-input v-model="siteInfo.title" placeholder="解析失败时可在此手动输入网页信息"></el-input>
                                        </el-form-item>
                                        <el-form-item>
                                            <el-button type="primary" size="small"
                                                @click="handleAddSiteUrl('numberValidateForm')">解析</el-button>
                                        </el-form-item>
                                    </el-form>
                                    <span slot="reference" class="item" @click="">
                                        <i class="el-icon-link"></i>
                                        链接
                                    </span>
                                </el-popover>

                                <div class="emoji-wrapper" v-show="chooseEmoji">
                                    <Emoji @chooseEmoji="handleChooseEmoji" />
                                </div>
                            </span>
                            <div class="btn">
                                <el-button type="primary" size="small" @click="addForum">发布</el-button>
                            </div>
                            <div class="site m-l-50" v-if="form.site">
                                <div class="siteItem">
                                    <div class="imgCover">
                                        <span>
                                            <i class="el-icon-link"></i>
                                        </span>
                                    </div>

                                    <div class="site-right">
                                        <div class="siteName">{{ form.site.title }}</div>
                                        <a :href="form.site.url" target="_blank" class="siteUrl">
                                            {{ form.site.url }}
                                        </a>
                                    </div>

                                </div>
                                <div class="delSiteBtn" @click="handleClearUrl">
                                    <i class="el-icon-close"></i>
                                </div>
                            </div>
                            <div class="upload m-l-50" v-if="showUploadImg">
                                <el-upload class="avatar-uploader" :action="uploadPictureHost" :before-upload="uploadBefore"
                                    list-type="picture-card" :limit="9" :http-request="uploadSectionFile" multiple
                                    :on-remove="handleRemove">
                                    <i class="el-icon-plus"></i>
                                </el-upload>
                            </div>
                        </div>
                    </div>

                    <!-- 内容区域 -->
                    <div class="talkItem">
                        <ul v-if="forumList.length > 0">
                            <li class="item" v-for="(item, index) in forumList" :key="index">
                                <div class="userInfo">
                                    <el-avatar class="avatar" :src="item.avatar"></el-avatar>
                                    <div>
                                        <span class="username">{{ item.nickname }}</span>
                                        <span class="infoTime">
                                            <span>
                                                {{ item.intro }}
                                            </span>
                                            <span class="time"> <i class="el-icon-time"></i> {{ item.createTimeStr }}</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="content m-l-50" id="forumContent" v-highlight v-html="item.content">
                                </div>
                                <div class="imgages m-l-50" v-if="item.imgUrl">
                                    <el-image v-for="(img, index) in splitImg(item.imgUrl)"
                                        @click.stop="handlePreviewImg(item.imgUrl)" :key="index" :src="img" fit="contain"
                                        style="height: 150px;margin-right: 5px;margin-bottom: 5px;" lazy></el-image>
                                </div>
                                <div class="site m-l-50" v-if="item.site">
                                    <div class="siteItem">
                                        <div class="imgCover">
                                            <span>
                                                <i class="el-icon-link"></i>
                                            </span>
                                        </div>

                                        <div class="site-right">
                                            <div class="siteName">{{ JSON.parse(item.site).title }}</div>
                                            <a :href="JSON.parse(item.site).url" target="_blank" class="siteUrl">
                                                {{ JSON.parse(item.site).url }}
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="item-category m-l-50">
                                    <span class="talkName" v-if="item.talkName">{{ item.talkName }}</span>
                                    <span class="likeInfo" v-if="item.likeListVO.length" @click="handleLikeList(item.id)">
                                        <img v-for="(lieList) in item.likeListVO" class="likeUserAvatar"
                                            :src="lieList.avatar" alt="">
                                        点赞
                                    </span>
                                </div>
                                <div class="bottomBtn">
                                    <div class="btn" @click="handleShowComment(item.id, index)">
                                        <i class="el-icon-chat-dot-round"></i> {{ item.commentCount }}
                                    </div>
                                    <div class="btn" @click="handleForumLike(item.id, index)">
                                        <span>
                                            <i style="color: var(--theme-color);" v-if="item.isLike"
                                                class="iconfont icon-dianzan4"></i>
                                            <i v-else class="iconfont icon-dianzan1"></i>
                                        </span>
                                        {{ item.likeCount }}
                                    </div>
                                </div>
                                <!-- 评论 -->
                                <div class="commentBox" ref="commentBox" v-show="chooseCommentIndex == index">
                                    <h4>
                                        全部评论 {{ item.commentCount }}
                                    </h4>
                                    <Comment ref="comment" :articleUserId="item.userId" :forumId="item.id" />
                                </div>
                            </li>

                            <div>
                                <sy-pagination :pageNo="pageData.pageNo" :pages="pages" @changePage="handlePage" />
                            </div>
                        </ul>
                        <el-empty v-else description="该圈子暂无用户发布内容"></el-empty>
                    </div>

                </div>

            </div>
        </div>

        <!-- 代码弹出框 -->
        <el-dialog title="添加代码块" center :visible.sync="dialogVisible" :close-on-click-modal="false">
            <el-input style="margin-top: 10px;" type="textarea" show-word-limit maxlength="1000"
                :autosize="{ minRows: 20, maxRows: 100 }" placeholder="请在此输入你的代码" v-model="codeContent">
            </el-input>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="handleClose">确 定</el-button>
            </span>
        </el-dialog>

        <!-- 点赞列表弹出框 -->
        <el-dialog title="点赞详情" center :visible.sync="likeDialogVisible" :close-on-click-modal="false" width="30%"
            :before-close="handleBeforClose">
            <div class="userItem" v-for="item in forumLikeList" @click="handleToUserMain(item.userId)">
                <el-avatar size="large" :src="item.avatar">
                </el-avatar>
                <div style="margin-left:15px">
                    <div>
                        {{ item.nickname }}
                    </div>
                    <div>
                        {{ item.intro }}
                    </div>
                </div>
                <div style="margin-left:auto">
                    <el-button v-if="!item.isFollowed && user.id !== item.userId" size="mini"
                        @click.stop="handleFlollowedUser(item)" type="primary">
                        关 注
                    </el-button>
                    <el-button v-if="item.isFollowed" size="mini" @click.stop="handleCancelFlollowedUser(item)"
                        type="info">取消关注</el-button>
                </div>
            </div>
            <div>
                <sy-pagination :pageNo="forumLikePageData.pageNo" :pages="forumLikePageData.pages"
                    @changePage="handleLikePage" />
            </div>
        </el-dialog>
        <image-preview :img="images"></image-preview>
    </div>
</template>

<script>
import { getTalkList, getForumList, addForum, analysis, forumLike, forumLikeList } from '@/api/talk'
import { followedUser, deleteFollowedUser } from '@/api'
import { upload } from '@/api'
import Emoji from '@/components/emoji'
import Comment from '@/components/forumComment/index.vue'
import imagePreview from '@/components/imagePreview'
export default {
    name: '',
    components: {
        Emoji,
        Comment,
        imagePreview
    },
    data() {
        return {
            uploadPictureHost: process.env.VUE_APP_BASE_API + "/api/file/upload",
            pageData: {
                pageNo: 1,
                pageSize: 10,
                talkId: null
            },
            forumLikePageData: {
                pageNo: 1,
                pageSize: 10,
                forumId: null,
                pages: 0
            },
            user: this.$store.state.userInfo,
            dialogVisible: false,
            likeDialogVisible: false,
            pages: 0,
            chooseEmoji: false,
            showUploadImg: false,
            showComment: false,
            forumList: [],
            talkList: [
                {
                    id: null,
                    name: "最新"
                },
                {
                    id: null,
                    name: "关注"
                },
            ],
            form: {
                site: null,
                imgUrl: ""
            },
            chooseCategory: null,
            lastEditRange: null,
            siteInfo: {},
            visible: false,
            talkVisible: false,
            talkName: "请选择圈子",
            talkSelectList: [],
            files: [],
            talkLastClikeIndex: 0,
            commentEmoji: false,
            chooseCommentIndex: null,
            codeContent: null,
            codeHtmlContent: null,
            forumLikeList: [],
            images: {},
        }
    },
    mounted() {

    },
    created() {
        getTalkList().then(respose => {
            this.talkList.push(...respose.data)
            this.talkSelectList = respose.data
            this.getForumList()
        })
    },
    methods: {
        handleToUserMain(userId) {
            this.$router.push({ path: "/user_main", query: { id: userId } })
        },
        handleClose() {
            let html = `<pre><code> ${this.codeContent}</code></pre>`
            this.codeHtmlContent = html
            this.dialogVisible = false
        },
        handleBeforClose() {
            this.forumLikeList = []
            this.forumLikePageData.pageNo = 1
            this.forumLikePageData.pages = 0
            this.likeDialogVisible = false
        },
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
        handleChange(index) {
            this.chooseCategory = this.talkList[index]
        },
        handleSelectChage(id) {

            for (var i = 0; i < this.talkSelectList.length; i++) {
                let talk = this.talkSelectList[i]
                if (talk.id == id) {
                    this.talkName = talk.name
                }
            }

            this.form.talkId = id
            this.talkVisible = false

        },
        handleLikeList(forumId) {
            if (forumId) {
                this.forumLikePageData.forumId = forumId
            }

            forumLikeList(this.forumLikePageData).then(res => {
                this.forumLikeList.push(...res.data.records)
                this.forumLikePageData.pages = res.data.pages
                this.likeDialogVisible = true
            })
        },
        handleForumLike(forumId, index) {
            forumLike(forumId).then(res => {
                this.$toast.success(res.data)
                var forum = this.forumList[index]
                if (forum.isLike) {
                    this.forumList[index].likeCount--
                    this.forumList[index].isLike = false
                    let j = null;
                    for (var i = 0; i < forum.likeListVO.length; i++) {
                        if (forum.likeListVO[i].userId == this.user.id) {
                            j = i
                        }
                    }
                    this.$delete(forum.likeListVO, j);
                    return
                }
                if (forum.likeListVO.length > 2) {
                    this.$delete(forum.likeListVO, 2);
                }
                forum.likeListVO.unshift({
                    avatar: this.user.avatar,
                    userId: this.user.id
                })
                this.forumList[index].likeCount++
                this.forumList[index].isLike = true
            })

        },
        handleShowComment(forumId, index) {
            if (this.chooseCommentIndex == index) {
                this.chooseCommentIndex = null
                return
            }
            this.chooseCommentIndex = index
            this.$refs.comment[index].getCommens(forumId)
        },
        handleAddSiteUrl(formName) {
            this.$refs[formName].validate((valid) => {
                if (valid) {
                    this.form.site = {
                        url: this.siteInfo.url,
                    }
                    if (this.siteInfo.title) {
                        this.form.site.title = this.siteInfo.title
                    } else {
                        analysis(this.siteInfo.url).then(res => {
                            this.form.title = res.data
                        })
                    }
                    this.visible = false
                    this.siteInfo = {}
                } else {
                    console.log('error submit!!');
                    return false;
                }
            });

        },
        uploadBefore: function () {
            this.$bus.$emit('show');
        },
        uploadSectionFile: function (param) {
            this.files = param.file
            // FormData 对象
            var formData = new FormData()
            // 文件对象
            formData.append('multipartFile', this.files)
            upload(formData).then(res => {
                this.form.imgUrl += res.data + ","
            })
            this.$bus.$emit('close');
        },
        handleRemove(file, fileList) {
            console.log(file, fileList);
        },
        handleClearUrl() {
            this.form.site = null

        },

        handleClike(item, index) {
            if (this.talkLastClikeIndex == index) {
                return
            }
            this.chooseCommentIndex = null
            this.$refs.categoryRef[this.talkLastClikeIndex].className = "category_item"
            this.talkLastClikeIndex = index
            this.$refs.categoryRef[index].className = "active"
            this.pageData.pageNo = 1
            this.pageData.talkId = item.id
            this.pageData.orderBy = null
            if (item.id) {
                this.form.talkId = item.id
                this.talkName = item.name
            }

            if (index == 1) {
                this.pageData.orderBy = "followed"
            }
            this.getForumList()
        },
        handlePage() {
            this.pageData.pageNo++
            this.$bus.$emit('show');
            getForumList(this.pageData).then(res => {
                this.forumList.push(...res.data.records)
                this.pages = res.data.pages
                this.$bus.$emit('close');
            }).catch(err => {
                this.$toast.error(err.message);
                this.$bus.$emit('close');
            })
        },
        handleFlollowedUser(item) {
            followedUser(item.userId).then(res => {
                this.$toast.success("关注成功")
                item.isFollowed = true
            })
        },
        handleCancelFlollowedUser(item) {
            deleteFollowedUser(item.userId).then(res => {
                this.$toast.success("取消关注")
                item.isFollowed = false
            })
        },
        handleLikePage() {
            this.forumLikePageData.pageNo++
            this.handleLikeList()
        },
        handlePreviewImg(imgs) {
            this.images = {
                urls: imgs,
                time: new Date().getTime()
            }
        },
        splitImg(img) {
            let imgs = img.split(",")
            var r = imgs.filter(function (s) {
                return s && s.trim();
            });
            return r;
        },
        handleChooseCommentEmoji(value) {
            // 创建一个img标签（表情）
            let img = document.createElement('img');
            img.src = value.url;
            img.style.verticalAlign = 'middle';
            img.style.marginLeft = "2px"
            img.style.marginRight = "2px"
            img.style.maxHeight = value.maxHeight;
            img.style.height = value.height
            img.style.width = value.width
            let edit = this.$refs['commentBoxRef']
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
            this.commentEmoji = false
        },
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
        addForum() {
            let content = this.$refs.textareaRef.innerHTML
            if (this.codeHtmlContent) {
                content += this.codeHtmlContent
            }
            if (content == null || content == "") {
                this.$toast.error("内容不能为空！");
                return;
            }
            this.$bus.$emit('show');
            this.form.content = content
            if (this.form.site) {
                this.form.site = JSON.stringify(this.form.site)
            }
            addForum(this.form).then(res => {
                this.$refs.textareaRef.innerHTML = ""
                this.codeHtmlContent = ""
                this.codeContent = ""
                this.form = {
                    site: null,
                    imgUrl: ""
                }
                this.$toast.success("发布成功");
                this.talkName = "请选择圈子"
                this.files = []
                this.showUploadImg = false
                this.pageData.pageNo = 1
                this.getForumList()
                this.$bus.$emit('close');
            }).catch(err => {
                this.$toast.error(err.message);
                this.$bus.$emit('close');
            })

        },
        getForumList() {
            this.$bus.$emit('show');
            getForumList(this.pageData).then(res => {
                this.forumList = res.data.records
                this.pages = res.data.pages
                this.$bus.$emit('close');
            }).catch(err => {
                this.$toast.error(err.message);
                this.$bus.$emit('close');
            })
        },
    },
}
</script>

<style lang="scss" scoped>
/deep/ .avatar-uploader {
    .el-upload--picture-card {
        width: 80px !important;
        height: 80px !important;
        line-height: 80px !important;
    }

    .el-upload:hover {
        border-color: #409EFF;
    }

    .el-upload-list__item {
        width: 80px !important;
        height: 80px !important;
    }
}

.userItem {
    display: flex;
    align-items: center;
    padding: 15px 10px;
    cursor: pointer;

    &:hover {
        background-color: #f5f7fa;
    }
}

.talk-wapper {
    display: flex;
    justify-content: center;
    min-height: calc(100vh - 207px);

    .main {
        margin-top: 80px;

        @media screen and (max-width: 1118px) {
            width: 100%;

            .m-l-50 {
                margin-left: 0;
            }

            .categoryBox {
                display: none;
            }

        }

        @media screen and (min-width: 1119px) {
            width: 65%;

            .m-l-50 {
                margin-left: 50px;
            }

            .categoryBox {
                width: 20%;
                margin-right: 25px;
                background-color: var(--background-color);
                padding: 10px;
                height: 100%;
                position: sticky;
                top: 30px;

                .category_item,
                .active {
                    margin-bottom: 20px;
                    cursor: pointer;
                    padding: 8px;
                    text-align: left;
                    color: var(--article-color);
                    border-radius: 3px;
                }

                .category_item:hover {
                    background-color: #c3c3c3;
                    color: var(--theme-color);
                }

                .active {
                    background-color: #c3c3c3;
                    color: var(--theme-color);
                }

            }
        }

        .tailk {
            display: flex;

            ul {
                list-style: none;
            }



            /deep/ .contentTextarea {
                font-size: .875rem;
                color: var(--article-color) !important;
                outline: none;
                padding: 10px 10px;
                min-height: 122px;
                resize: none;
                border-radius: 4px;
                background-color: var(--forum-background-color);
                transition: all .5s ease-in-out;
                border: 1px solid var(--forum-background-color);

                &:focus {
                    border: 1px solid var(--theme-color);
                }

                &:empty:before {
                    content: attr(data-placeholder);
                    color: #666;
                }
            }

            .rigthBox {
                width: 100%;

                .sendBox {
                    background-color: var(--background-color);
                    height: auto;
                    padding: 10px;



                    .talkBtn {
                        position: absolute;
                        bottom: 10px;
                        left: 10px;

                        /deep/ .talk {
                            margin-left: 12px;
                            margin-bottom: 8px;
                            padding: 0 6px;
                            line-height: 24px;
                            border-radius: 50px;
                            border-bottom-left-radius: 0;
                            background: #fff;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            cursor: pointer;
                            color: #1e80ff;
                            font-size: 0.9rem;

                            i {
                                margin-right: 3px;
                            }
                        }
                    }

                    .bottom {
                        height: auto;
                        margin-top: 10px;
                        line-height: 50px;
                        position: relative;

                        .category {
                            font-size: 0.9rem;

                            .item {
                                cursor: pointer;
                                margin-right: 20px;
                                color: var(--text-color);

                                &:hover {
                                    color: var(--theme-color);
                                }
                            }


                            .emoji-wrapper {
                                position: absolute;
                                top: 50px;
                                left: 0px;
                                z-index: 50;
                            }
                        }

                        .btn {
                            float: right;
                            align-items: center;



                            i {
                                font-size: 1.2rem;
                                margin-right: 20px;
                                cursor: pointer;
                                color: var(--text-color);
                            }
                        }



                    }
                }

                .site {
                    width: 90%;
                    line-height: 0;
                    position: relative;

                    .delSiteBtn {
                        position: absolute;
                        right: -15px;
                        bottom: -15px;
                        border: 1px solid var(--border-line);
                        border-radius: 50px;
                        padding: 5px;

                    }

                    .siteItem {
                        display: flex;
                        border: 1px solid var(--border-line);
                        border-radius: 5px;
                        height: 100%;
                        align-items: center;
                        padding: 10px;

                        .imgCover {
                            width: 50px;
                            height: 50px;
                            display: inline-block;
                            background-color: #1e80ff;
                            text-align: center;
                            line-height: 50px;
                            color: #fff;
                            font-size: 1.5rem;
                        }

                        .site-right {
                            width: 100%;
                            line-height: 20px;
                            margin-left: 10px;

                            a {
                                text-decoration: none;
                            }
                        }
                    }
                }

                .talkItem {
                    margin-top: 20px;

                    ul {
                        .item {
                            background-color: var(--background-color);
                            padding: 10px;
                            margin-bottom: 15px;
                            padding-bottom: 0;

                            .content {
                                color: var(--article-color);
                                padding-right: 10px;

                                /deep/ pre {
                                    margin-top: 10px;
                                }

                                /deep/ code {
                                    border-bottom-left-radius: 0 !important;
                                    border-bottom-right-radius: 0 !important;
                                }
                            }

                            .imgages {
                                display: flex;
                                flex-wrap: wrap;
                                margin-top: 10px;

                            }

                            .item-category {
                                margin-top: 20px;
                                display: flex;
                                align-items: center;


                                .talkName {
                                    padding: 2px 6px;
                                    background-color: #eaf2ff;
                                    font-size: 0.9rem;
                                    line-height: 20px;
                                    color: #1e80ff;
                                }

                                .likeInfo {
                                    margin-left: auto;
                                    cursor: pointer;

                                    .likeUserAvatar {
                                        width: 20px;
                                        height: 20px;
                                        border-radius: 50px;
                                        vertical-align: middle;
                                        border: 2px solid #fff;
                                        transition: all .6s;
                                        box-shadow: 5px 0 10px #c9c9c9;
                                        margin-left: -5px;

                                        &:hover {
                                            transform: scale(1.3);
                                        }
                                    }
                                }

                            }

                            .userInfo {
                                align-items: center;
                                height: 50px;
                                margin-bottom: 5px;
                                display: flex;

                                .avatar {
                                    vertical-align: middle;
                                    border: 1px solid var(--border-line);
                                    margin-right: 10px;
                                }

                                .username {
                                    color: var(--theme-color);
                                }

                                .infoTime {
                                    font-size: 0.8rem;
                                    color: var(--text-color2);

                                    span {
                                        margin-right: 10px;
                                    }
                                }
                            }

                            .bottomBtn {
                                display: flex;
                                width: 100%;
                                justify-content: space-around;
                                border-top: 1px dashed var(--border-line);
                                margin-top: 15px;
                                padding: 10px 0;
                                color: var(--text-color);

                                .btn {
                                    cursor: pointer;
                                }
                            }

                            .commentBox {
                                padding: 10px;
                                margin-top: 30px;

                                .title {
                                    font-weight: 700;
                                    font-size: 20px;
                                    margin-top: 20px;
                                    color: var(--article-color);

                                    svg {
                                        width: 20px;
                                        height: 20px;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
</style>
