<template>
    <div class="im-main container">
        <div id="im" class="im-warpper">

            <el-card class="itemBox">

                <!-- 标题 -->
                <div class="title">{{ title }}</div>
                <div class="messageBox" id="messageBox" ref="messageContainer">
                    <!-- 加载更多 -->
                    <div class="more noSelect" v-show="pageData.pageNo < totalPage">
                        <div v-if="isLoding" class="loading">
                            <div class="spinner"></div>
                        </div>
                        <div @click="handleMore" v-else>加载更多</div>
                    </div>
                    <!-- 消息内容框 -->
                    <div class="messageItem" v-for="(item, index) in  messageList " :key="index">
                        <!-- 左边消息框 别人发送的消息 -->
                        <div :class="item.isWithdraw ? 'withdraw' : 'left'" v-if="user && item.fromUserId != user.id">
                            <img class="noSelect" v-lazy="item.fromUserAvatar" :key="item.fromUserAvatar"
                                @click="handleToUserMain(item.fromUserId)">
                            <div class="info">
                                <div class="nickname noSelect userInfo">
                                    {{ item.fromUserNickname }}
                                    <span v-if="item.fromUserId == 1">
                                        <el-tooltip effect="dark" content="作者" placement="top">
                                            <svg-icon class="tag" icon-class="guanfang"></svg-icon>
                                        </el-tooltip>
                                    </span>
                                    <span v-if="item.ipSource" class="item "> <i class="el-icon-location-information"></i>
                                        IP属地:{{ splitIpAddress(item.ipSource) }}
                                    </span>
                                    <span class="item "> <i class="el-icon-time"></i> {{ item.createTimeStr
                                    }}</span>
                                </div>

                                <span v-if="!item.isWithdraw" v-html="item.content" class="messageContent"
                                    @contextmenu.prevent="openMenu($event, item, index)">
                                </span>
                                <span class="noSelect" v-else style="color: var(--text-color);">
                                    " {{ item.fromUserNickname }} " 撤回了一条消息
                                </span>
                            </div>
                        </div>
                        <!-- 右边消息框 自己发送的消息 -->
                        <div :class="item.isWithdraw ? 'withdraw' : 'right'" v-else>
                            <div class="info">
                                <div>
                                    <img class="noSelect" v-lazy="item.fromUserAvatar" :key="item.fromUserAvatar"
                                        @click="handleToUserMain(item.fromUserId)">
                                </div>
                                <div class="nickname">
                                    <div class="userInfo">
                                        <span class="item noSelect"><i class="el-icon-time"></i> {{ item.createTimeStr
                                        }}</span>
                                        <span v-if="item.ipSource" class="item noSelect"><i
                                                class="el-icon-location-information"></i>
                                            IP属地:{{ splitIpAddress(item.ipSource) }}
                                        </span>
                                        <span v-if="item.fromUserId == 1">
                                            <el-tooltip effect="dark" content="作者" placement="top">
                                                <svg-icon class="tag" icon-class="guanfang"></svg-icon>
                                            </el-tooltip>
                                        </span>
                                        <span class="noSelect">{{ item.fromUserNickname }}</span>
                                    </div>

                                    <div v-if="!item.isWithdraw" v-html="item.content" class="nowMessageContent"
                                        @contextmenu.prevent="openMenu($event, item, index)">
                                    </div>
                                    <div style="color: var(--text-color);" v-else class="noSelect">
                                        " {{ item.fromUserNickname }} " 撤回了一条消息
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- 输入框 -->
                <div class="bottom">
                    <!-- 输入选择 如表情、图片等 -->
                    <div class="toolbars">
                        <div>
                            <span class="item" @click.stop="handleOpen">
                                <i class="iconfont icon-biaoqing"></i>
                            </span>
                            <el-upload class="avatar-uploader" :show-file-list="false" ref="upload" name="filedatas"
                                :action="uploadPictureHost" :http-request="uploadSectionFile" multiple>
                                <span class="item">
                                    <i class="el-icon-picture"></i>
                                </span>
                            </el-upload>
                        </div>
                    </div>
                    <!-- 表情框 -->
                    <div class="emoji-wrapper" v-show="emojiShow">
                        <Emoji @chooseEmoji="handleChooseEmoji" />
                    </div>
                    <!-- 输入内容 -->
                    <div id="im-input-box" class="im-input-box" ref="inputRef" @input="updateContent" contenteditable="true"
                        @paste="optimizePasteEvent" @keydown="handkeyEnter" data-placeholder="说点什么呢"></div>
                    <el-button class="btn" @click="send($refs.inputRef.innerHTML, 1)">发送[Enter]</el-button>
                </div>

                <!-- 自定义右键功能 -->
                <ul v-show="visible" :style="{ left: left + 'px', top: top + 'px' }" class="contextmenu">
                    <li @click="collectEmoji" class="" v-show="validateContainsImg(this.message)">
                        <div class="menuitem">
                            <i class="el-icon-star-off"></i>收藏表情
                        </div>
                    </li>
                    <li @click="clipboard" class="copyBtn">
                        <div class="menuitem">
                            <i class="el-icon-document-copy"></i> 复制
                        </div>
                    </li>
                    <li @click="translate">
                        <div class="menuitem">
                            <i class="iconfont icon-fanyi"></i>翻译
                        </div>
                    </li>
                    <li @click="withdraw" v-if="message && message.fromUserId == user.id">
                        <div class="menuitem">
                            <i class="iconfont icon-chehui"></i>撤回
                        </div>
                    </li>
                    <li class="sousuo">
                        <div class="menuitem">
                            <i class="el-icon-search"></i>搜一搜
                            <i class="el-icon-caret-right" style=""></i>

                            <ul class="sousuomenu">
                                <li @click="handleSearch(0)">
                                    <div class="menuitem">
                                        百度搜索
                                    </div>
                                </li>
                                <li @click="handleSearch(1)">
                                    <div class="menuitem">
                                        Gitee搜索
                                    </div>
                                </li>
                                <li @click="handleSearch(2)">
                                    <div class="menuitem">
                                        Github搜索
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </li>
                </ul>
            </el-card>
            <!-- 房间列表 -->
            <div class="online">
                <ul class="online-item">
                    <li ref="room" :class="!index ? 'onlineLi active' : 'onlineLi'" v-for="(item, index) in roomList"
                        :key="index">
                        <div class="room-list-item" @click="selectUserIm(item, index)">
                            <div class="room-list-item">
                                <img class="img" :src="item.avatar" alt="">
                                <div class="roomName">
                                    {{ item.nickname }}
                                </div>
                            </div>
                            <div class="readNum" v-if="item.readNum">
                                <span>{{ item.readNum }}</span>
                            </div>
                        </div>
                        <div class="close" @click="closeRoom(item.id, index)">
                            <span><i class="el-icon-close"></i></span>
                        </div>

                    </li>
                </ul>
            </div>
        </div>
        <el-dialog :lock-scroll="false" title="粘贴图片" :visible.sync="imgDialogVisible" width="30%" center>
            <div style="width: 100%;" id="dialogImg">
                <div v-html="textImg">

                </div>
            </div>
            <span slot="footer" class="dialog-footer">
                <el-button size="small" @click="imgDialogVisible = false">取 消</el-button>
                <el-button size="small" type="primary" @click="uploadSectionFile(null)">发 送</el-button>
            </span>
        </el-dialog>
        <image-preview :img="images"></image-preview>
    </div>
</template>

<script>
let socket;
import { upload } from '@/api'
import { addEmoji } from '@/api/emoji';
import { getImHistory, getUserImHistoryList, send, withdraw, getRoomList, addRoom, read, deleteRoom } from '@/api/im'
import Emoji from '@/components/emoji'
import imagePreview from '@/components/imagePreview'
export default {
    components: {
        Emoji,
        imagePreview
    },
    data() {
        return {
            uploadPictureHost: process.env.VUE_APP_BASE_API + "/api/file/upload",
            websoketUrl: process.env.VUE_APP_WEBSOCKET_API,
            visible: false,
            imgDialogVisible: false,
            isLoding: false,
            top: 0,
            left: 0,
            text: "",
            messageList: [],
            emojiShow: false,
            user: this.$store.state.userInfo,
            totalPage: 0,
            isBackTop: false,
            message: null,
            textImg: null,
            selectIndex: null,
            title: "辰雪博客交流群",
            lastIndex: null,
            userId: this.$route.query.userId,
            pageData: {
                pageNo: 1,
                pageSize: 10
            },
            onlineUserList: [],

            roomList: [
                {
                    avatar: this.$store.state.webSiteInfo.logo,
                    nickname: "辰雪博客交流群"
                }
            ],
            selectUserOnline: null,
            atMember: "",
            searchUrl: ['https://www.baidu.com/s?&wd=', 'https://search.gitee.com/?skin=rec&type=repository&q=', 'https://github.com/search?q='],
            lastEditRange: null,
            RegEx: /(?<=(img src="))[^"]*?(?=")/gims,
            images: {}
        }
    },

    mounted() {
        document.addEventListener("click", this.handleClose)
        document.getElementById("im").oncontextmenu = new Function("event.returnValue=false");
        this.$refs['inputRef'].onclick = () => {
            // 获取选定对象
            let selection = window.getSelection()
            // 设置最后光标对象
            if (selection.rangeCount > 0) {
                // 记录光标最后点击可编辑div中所选择的位置
                this.lastEditRange = selection.getRangeAt(0);
            }
        }
    },
    watch: {
        //   监听属性对象，newValue为新的值，也就是改变后的值
        visible(newValue, oldValue) {
            if (newValue) {
                document.body.addEventListener("click", this.closeMenu);
            } else {
                document.body.removeEventListener("click", this.closeMenu);
            }
        },
        user(newName) {
            if (typeof (newName) == 'string') {
                this.user = JSON.parse(newName)
            } else {
                this.user = newName
                //发送soket连接
                this.init()
            }
        },
        messageList() {
            if (this.isBackTop) {
                this.$refs.messageContainer.scrollTop = 0
                this.isBackTop = false
            } else {
                this.$nextTick(() => {
                    this.$refs.messageContainer.scrollTop = this.$refs.messageContainer.scrollHeight;
                })
            }

        }
    },
    created() {
        this.init()
    },
    methods: {
        handleToUserMain(userId) {
            this.$router.push({ path: "/user_main", query: { id: userId } })
        },
        updateContent(event) {
            let selection = window.getSelection()
            this.lastEditRange = selection.getRangeAt(0);
            if (event.target.innerText.indexOf("img") != -1) {
                this.textImg = event.target.innerText
                event.target.innerText = null
                this.imgDialogVisible = true
                return;
            }
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
        handleSearch(type) {
            let url = this.searchUrl[type] + this.message.content.trim()
            window.open(url, '_blank')
        },

        closeRoom(id, index) {
            this.$confirm('此操作将把该聊天窗口删除, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                lockScroll: false,
                type: 'warning'
            }).then(() => {
                if (!id) {

                    this.$toast.warning("群聊不允许删除");
                    return;
                }
                deleteRoom(id).then(res => {
                    this.$delete(this.roomList, index);

                    this.$toast.success("删除成功");
                })
            }).catch(() => {
                this.$toast.info("已取消删除");
            });
        },

        //发送图片
        uploadSectionFile: function (param) {

            var formData = new FormData()
            if (!param) {
                var dialogImg = document.getElementById('dialogImg');
                var images = dialogImg.getElementsByTagName('img');
                // 提取每个图片的Base64数据，并添加到FormData对象中
                for (var i = 0; i < images.length; i++) {
                    var imgSrc = images[i].getAttribute('src');

                    var base64Data = imgSrc.split(',')[1];
                    const byteCharacters = atob(base64Data);
                    const byteArrays = [];
                    for (let offset = 0; offset < byteCharacters.length; offset += 512) {
                        const slice = byteCharacters.slice(offset, offset + 512);
                        const byteNumbers = new Array(slice.length);
                        for (let i = 0; i < slice.length; i++) {
                            byteNumbers[i] = slice.charCodeAt(i);
                        }
                        const byteArray = new Uint8Array(byteNumbers);
                        byteArrays.push(byteArray);
                    }
                    const blob = new Blob(byteArrays, { type: 'image/jpeg' });
                    formData.append('images[]', blob, 'image' + i + '.jpg'); // 根据实际的文件名进行调整
                    formData.append('multipartFile', blob, Date.now() + '.jpg');
                }
            } else {
                this.files = param.file
                formData.append('multipartFile', this.files)
            }

            upload(formData).then(res => {
                //上传之后发送消息
                let content = `<img src="${res.data}" alt="" class="messageImg" style="width: 150px;height: 150px;">`
                this.send(content, 2)
                this.imgDialogVisible = false

            }).catch(err => {

            })
        },
        //截取地址
        splitIpAddress(address) {
            return address.split("|")[1]
        },
        //选择用户单聊
        selectUserIm(item, index) {

            if (this.lastIndex != null) {
                this.$refs.room[this.lastIndex].className = "onlineLi"
            }
            this.$refs.room[0].className = "onlineLi"
            this.$refs.room[index].className += " active"
            this.lastIndex = index


            this.pageData.pageNo = 1

            //为空则是群聊
            if (!item.receiveId) {
                this.title = "辰雪博客交流群"
                this.messageList = []
                this.selectUserOnline = null;
                this.getHistoryList()
                return;
            }
            this.title = item.nickname
            this.pageData.fromUserId = this.user.id
            this.pageData.toUserId = item.receiveId
            this.messageList = []
            this.selectUserOnline = item
            getUserImHistoryList(this.pageData).then(res => {
                let arr = res.data.records
                for (let i = arr.length - 1; i >= 0; i--) {
                    this.messageList.push(arr[i])
                }
                this.totalPage = res.data.pages
            })
            //修改为已读
            read(item.receiveId)
            item.readNum = 0
        },
        //右击
        openMenu(e, item, index) {
            var x = e.pageX; //这个应该是相对于整个浏览器页面的x坐标，左上角为坐标原点（0,0）
            var y = e.pageY; //这个应该是相对于整个浏览器页面的y坐标，左上角为坐标原点（0,0）
            this.top = y;
            this.left = x;
            this.visible = true; //显示菜单
            this.message = item
            this.message.index = index
        },

        //撤回
        withdraw() {
            let message = {
                code: this.selectUserOnline == null ? 2 : 1,
                content: "消息已撤回",
                fromUserId: this.message.fromUserId,
                id: this.message.id,
                index: this.message.index,
                isRead: 0,
                isWithdraw: 1,
                toUserId: this.message.toUserId,
                type: 1
            }
            // 将组装好的json发送给服务端，由服务端进行转发
            withdraw(message).then(re => {

            }).catch(error => {
            });
        },
        //翻译
        translate() {
            window.open("https://fanyi.baidu.com/?aldtype=16047#zh/en/" + this.message.content, '_blank')
        },
        //收藏表情
        collectEmoji() {

            if (this.validateContainsImg(this.message)) {
                let emoji = {
                    url: this.message.content.match(this.RegEx)[0]
                }
                addEmoji(emoji).then(res => {
                    this.$toast.success("收藏表情成功");
                })
            }

        },
        validateContainsImg(html) {
            return html && html.content.match(this.RegEx) && html.content.match(this.RegEx).length > 0
        },
        //复制
        clipboard() {
            const clipboard = new this.Clipboard('.copyBtn', {
                text: () => this.message.content
            })
            clipboard.on('success', () => {
                clipboard.destroy()
            })
            clipboard.on('error', () => {
                this.$toast.error("复制失败");
                clipboard.destroy()
            })
        },
        //关闭菜单
        closeMenu() {
            this.visible = false; //关闭菜单
        },
        //加载更多消息
        handleMore() {
            this.pageData.pageNo++;
            this.isBackTop = true
            this.isLoding = true
            if (this.selectUserOnline) {
                getUserImHistoryList(this.pageData).then(res => {
                    let arr = res.data.records
                    for (let i = 0; i < arr.length; i++) {
                        this.messageList.unshift(arr[i])
                    }
                    this.isLoding = false
                })
                return;
            }
            getImHistory(this.pageData).then(res => {
                let arr = res.data.records
                for (let i = 0; i < arr.length; i++) {
                    this.messageList.unshift(arr[i])
                }
                this.isLoding = false
            })
        },
        //获取群聊历史记录
        getHistoryList() {
            getImHistory(this.pageData).then(res => {
                let arr = res.data.records
                for (let i = arr.length - 1; i >= 0; i--) {
                    this.messageList.push(arr[i])
                }
                this.totalPage = res.data.pages
            })
        },
        //Enter事件
        handkeyEnter(event) {
            // 判断是否按下了Ctrl+Enter键
            if (event.ctrlKey && event.keyCode === 13) {
                // 在光标位置插入换行符
                event.preventDefault();
                const selection = window.getSelection();
                const range = selection.getRangeAt(0);
                const br = document.createElement('br');
                range.insertNode(br);
                range.setStartAfter(br);
                range.collapse(true);
                selection.removeAllRanges();
                selection.addRange(range);
                //this.$refs.inputRef.innerText += '\n';

                // 阻止默认的换行行为
                return;
            }
            if (event.keyCode == 13) {
                // 阻止默认的换行行为
                event.preventDefault();
                this.send(this.$refs.inputRef.innerHTML)
            }
        },
        //打开表情框
        handleOpen() {
            this.emojiShow = !this.emojiShow
        },
        //关闭表情框
        handleClose(e) {
            if (e.target.className == "messageImg") {
                this.images = {
                    urls: e.target.currentSrc,
                    time: new Date().getTime()
                }
            }
            if (e.target.className != "el-radio-button__orig-radio" && e.target.className != "el-radio-button__inner"
                && e.target.className != "el-upload__input" && e.target.className != "el-icon-plus avatar-uploader-icon") {
                this.emojiShow = false
            }

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
            img.style.height = value.width
            img.style.width = value.width
            let edit = this.$refs['inputRef']
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
                return
            }
        },
        //发送消息
        send(content, type) {

            if (typeof (WebSocket) == "undefined") {
                console.log("您的浏览器不支持WebSocket");
                return;
            }
            if (!this.user) {
                this.$toast.error("请先登录");
                this.$store.state.loginFlag = true
                return;
            }
            const reg = /^\s*$/;
            if (reg.test(content)) {
                console.log('输入值不能为空');
                return;
            }

            let message = {
                code: 2,
                fromUserId: this.user.id, content: content, fromUserAvatar: this.user.avatar,
                fromUserNickname: this.user.nickname, type: type, isRead: 0

            }

            if (this.selectUserOnline != null) {
                message = {
                    code: 1,
                    fromUserId: this.user.id,
                    fromUserAvatar: this.user.avatar,
                    fromUserNickname: this.user.nickname,
                    toUserId: this.selectUserOnline.receiveId,
                    toUserAvatar: this.selectUserOnline.avatar,
                    toUserNickname: this.selectUserOnline.nickname,
                    content: content,
                    type: type,
                    isRead: 0,
                }
            }
            if (this.atMember) {
                message.atUserId = this.atMember
            }
            //发送消息
            send(message)
            // 构建消息内容，本人消息
            this.$refs.inputRef.innerText = null;
            this.atMember = ""
        },
        //初始化socket
        init() {
            let _this = this;
            if (!_this.user) {

                this.$toast.error("登录才能进行群聊");
                return;
            }
            if (typeof (WebSocket) == "undefined") {
                console.log("您的浏览器不支持WebSocket");
            } else {
                let socketUrl = _this.websoketUrl + "?userId=" + _this.user.id;
                if (socket != null) {
                    socket.close();
                    socket = null;
                }
                // 开启一个websocket服务
                socket = new WebSocket(socketUrl);
                //打开事件
                socket.onopen = _this.open();
                //  浏览器端收消息，获得从服务端发送过来的文本消息
                socket.onmessage = function (msg) {
                    console.log("收到数据====" + msg.data)
                    let data = JSON.parse(msg.data)

                    //群聊
                    if (data.code == 2) {
                        if (_this.selectUserOnline) {
                            return;
                        }
                        // 这是撤回的逻辑
                        if (data.index != null) {
                            _this.messageList[data.index].content = data.content
                            _this.messageList[data.index].isWithdraw = 1
                            return;
                        }
                        _this.messageList.push(data)
                        return;
                    }
                    //单聊
                    if (data.code == 1) {
                        for (let index = 0; index < _this.roomList.length; index++) {

                            const room = _this.roomList[index]
                            if (room.receiveId == data.fromUserId) {
                                _this.roomList[index].readNum++
                            }
                        }
                        if (!_this.selectUserOnline) {
                            return;
                        }
                        if (_this.selectUserOnline.receiveId == data.fromUserId || _this.selectUserOnline.receiveId == data.toUserId) {

                            //这是撤回的逻辑
                            if (data.index != null) {
                                _this.messageList[data.index].content = data.content
                                _this.messageList[data.index].isWithdraw = 1
                                return;
                            }
                            _this.messageList.push(data)
                            return;
                        }
                        return;
                    }
                };
                //关闭事件
                socket.onclose = function () {
                    console.log("websocket已关闭");

                };
                //发生了错误事件
                socket.onerror = function () {
                    console.log("websocket发生了错误");

                }
            }
        },

        open() {
            console.log("websocket已打开");
            //获取房间列表
            getRoomList().then(res => {
                this.roomList.push(...res.data)
            })
            if (this.userId != null) {
                addRoom(this.userId).then(res => {
                    if (res.data != null) {
                        this.roomList.push(res.data)
                    }
                }).catch(err => {
                  console.log(err)
                })
            }
            //连接成功后获取历史聊天记录
            this.getHistoryList()
        },
    }
}
</script>



<style lang="scss" scoped>
.loading {
    /* 加载中的样式 */
    position: relative;
    margin: 0 auto;
    margin-top: 20px;
}

/deep/ #dialogImg {
    img {
        width: 100%;
        height: 200px;
    }
}

.spinner {
    /* 转圈圈的样式 */
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 30px;
    height: 30px;
    border: 4px solid #ccc;
    border-top-color: var(--theme-color);
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% {
        transform: translate(-50%, -50%) rotate(0deg);
    }

    100% {
        transform: translate(-50%, -50%) rotate(360deg);
    }
}

.im-main {
    min-height: calc(100vh - 167px);

    @media screen and (max-width: 1118px) {
        .im-warpper {
            width: 100%;
        }
    }

    @media screen and (min-width: 1119px) {
        .im-warpper {
            width: 60%;
        }
    }

    .im-warpper {
        color: var(--text-color1);
        display: flex;
        border: 2px solid var(--border-line);
        height: 100%;
        margin-top: 80px;
        background-color: #272a37;
        padding: 10px;
        border-radius: 10px;

        .noSelect {
            user-select: none;
        }

        .online {
            width: 250px;
            background-color: #323644;
            padding: 10px;
            color: #fff;

            .onlineCount {
                padding: 10px;
            }

            .online-item {
                list-style: none;

                .onlineLi {
                    cursor: pointer;
                    padding: 5px;
                    line-height: 30px;
                    border-radius: 5px;
                    margin-top: 10px;
                    position: relative;

                    &:hover {
                        background-color: #ccc;

                        .close {
                            display: block;
                        }
                    }

                    .room-list-item {
                        display: flex;
                        align-items: center;

                        .roomName {
                            margin-left: 10px;
                        }
                    }

                    .readNum {
                        margin-left: 10px;
                        display: inline-block;
                        background-color: #e63131;
                        border-radius: 50%;
                        width: 25px;
                        height: 25px;
                        position: relative;


                        span {
                            position: absolute;
                            left: -3px;
                            top: -3px;
                        }
                    }

                    .close {
                        background-color: #fff;
                        color: #000;
                        width: 20px;
                        height: 20px;
                        border-radius: 50%;
                        position: absolute;
                        top: -15px;
                        right: -5px;
                        display: none;

                        span {
                            position: absolute;
                            top: -5px;
                            left: -8px;
                        }
                    }
                }

                .active {
                    background-color: #ccc;

                }

                img {
                    width: 30px;
                    height: 30px;
                    border-radius: 50%;
                    vertical-align: middle;
                }

                span {
                    line-height: 30px;
                    margin-left: 10px;
                }
            }
        }

        .itemBox {
              background-image: url("@/assets/png/imbg.png");
            background-color: #323644;
            width: 100%;
            box-shadow: none;
            margin-right: 10px;

            .title {
                text-align: center;
                height: 50px;
                line-height: 50px;
                font-size: 18px;
                color: var(--theme-color);
                border-bottom: 1px solid #666;
            }

            .messageBox,
            .emoji-wrapper {

                &::-webkit-scrollbar {
                    width: 5px;
                }

                &::-webkit-scrollbar-thumb {
                    background-color: #666;
                    border-radius: 5px;
                }

                &::-webkit-scrollbar-track {
                    background-color: #323644;
                }
            }

            .messageBox {
                height: 500px;
                overflow: auto;
                color: var(--text-color);

                .more {
                    text-align: center;
                    margin-top: 10px;
                    cursor: pointer;
                    color: rgba(185, 183, 183, 0.898)
                }

                .messageItem {
                    margin-top: 20px;
                    margin-bottom: 20px;

                    .tag {
                        width: 15px;
                        height: 15px;
                        vertical-align: -3px;
                        margin: 0 5px;
                    }

                    .withdraw {
                        text-align: center;

                        .tag,
                        img,
                        .userInfo {
                            display: none
                        }
                    }



                    .left {
                        padding: 5px 10px;
                        display: flex;

                        .info {
                            margin-left: 5px;


                            .nickname {
                                font-size: 0.8rem;
                                display: block;
                                margin-bottom: 3px;

                                .item {
                                    margin-left: 10px;
                                    font-size: 12px;
                                }
                            }
                        }
                    }

                    img {
                        width: 45px;
                        height: 45px;
                        border-radius: 50%;
                    }

                    .messageContent,
                    .nowMessageContent {
                        display: inline-block;
                        color: #555;
                        border-radius: 3px;
                        margin-top: 5px;
                        max-width: 400px;
                        padding: 8px;
                        white-space: pre-wrap;
                        user-select: auto;
                        text-align: left;

                        /deep/ a {
                            text-decoration: none;
                        }
                    }

                    .messageContent {
                        background-color: var(--im-box-backgroudColor);
                        border-radius: 2px 18px 18px;

                    }


                    .right {
                        margin: 2px;
                        padding: 5px 10px;
                        position: relative;
                        display: flex;
                        flex-direction: row-reverse;

                        .info {
                            float: right;
                            display: flex;
                            flex-direction: row-reverse;
                            color: var(--text-color);

                            .nickname {
                                display: inline-block;
                                text-align: right;
                                margin-bottom: 3px;
                                width: 100%;

                                .userInfo {
                                    font-size: 0.8rem;

                                }

                                .item {
                                    margin-right: 10px;
                                    font-size: 12px;
                                }

                            }
                        }

                        .nowMessageContent {
                            background-color: var(--im-user-box-backgroudColor);
                            border-radius: 18px 2px 18px 18px;
                        }

                        img {
                            float: right;
                            margin-left: 5px;
                        }


                    }
                }
            }



            .bottom {
                border-top: 1px solid #999;
                margin-top: 20px;
                position: relative;

                .toolbars {
                    padding: 10px;

                    .item {
                        cursor: pointer;
                        margin-left: 10px;
                        padding: 5px;
                        border-radius: 5px;


                        &:hover {
                            background-color: rgb(92, 89, 89);
                        }
                    }

                    i {
                        color: #fff;
                        font-size: 1.1rem;
                    }

                    svg {
                        width: 20px;
                        height: 20px;
                        vertical-align: -3px;
                    }

                    /deep/ .avatar-uploader {
                        display: inline-block;
                    }

                }


                .emoji-wrapper {

                    position: absolute;
                    top: -210px;
                    left: 10px;
                }

                .contentBox {
                    height: 160px;
                    width: 100%;
                    padding: 20px;
                    border: none;
                    outline: none;
                    resize: none;
                    background-color: #323644;
                    color: #fff;
                    font-size: 15px;
                }

                .im-input-box {
                    border: none;
                    outline: none;
                    color: #fff;
                    padding-left: 10px;
                    height: 166px;
                    padding-top: 10px;

                    /deep/ img {
                        height: 100px;
                        vertical-align: middle;
                    }

                    /deep/ .at_member {
                        padding: 0;
                        font-size: inherit;
                        line-height: 1;
                        color: var(--theme-color);
                        background: transparent;
                        border: none;
                    }

                    &:empty:before {
                        content: attr(data-placeholder);
                        color: #666;
                    }
                }

                .btn {
                    position: absolute;
                    right: 10px;
                    bottom: 10px;
                    width: auto;
                    height: 40px;
                    border-radius: 10px;
                    text-align: center;
                    line-height: 40px;
                    padding: 0 5px;
                    background-image: linear-gradient(to left, #c3cb80, #4db66d, #26a6a0);
                }
            }

            .contextmenu {
                margin: 0;
                background: #424656;
                z-index: 3000;
                position: fixed; //关键样式设置固定定位
                list-style-type: none;
                font-weight: 400;
                color: #333;
                box-shadow: 2px 2px 3px 0 rgba(0, 0, 0, 0.3);
                border-radius: 5px;

                li {
                    margin: 0;
                    padding: 5px;
                    width: 100px;
                    cursor: pointer;
                    color: #fff;
                    position: relative;

                    .menuitem {
                        padding: 5px;
                        font-size: 0.8rem;
                        border-radius: 5px;

                        i {
                            margin-right: 3px;
                        }

                        &:hover {
                            background: #ddaec8;
                        }

                    }

                    .sousuomenu {
                        list-style: none;
                        position: absolute;
                        top: -50px;
                        right: -110px;
                        background: #424656;
                        display: none;
                        border-radius: 5px;
                    }
                }

                .sousuo:hover {
                    .sousuomenu {
                        display: block;
                    }
                }
            }
        }
    }


}
</style>
