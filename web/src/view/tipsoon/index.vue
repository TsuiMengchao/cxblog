<template>
  <div class="tipsoon-main container" id="container">
    <div class="left-sidbarnav" :style="{ left: left, top: top }">
      <el-tooltip class="item" effect="dark" content="阅读上一条" placement="left">
        <div class="left-item" title="阅读上一条" @click="skip('pre')">
                    <span>
                        <i class="iconfont el-icon-back"></i>
                    </span>
        </div>
      </el-tooltip>
    </div>
    <div class="tipsoon-containner" id="contentBox">
      <div class="contentBox">
        <div class="cover">
          <img :src="tipsoon.imgUrl" alt="">
        </div>
        <div class="tipsoonItem">
          <div class="rigthBox">
            <p class="title" v-highlight v-html="tipsoon.title"></p>
            <div class="nickname">
              {{ tipsoon.nickname }}
            </div>
            <p class="content" v-highlight v-html="tipsoon.content"></p>
            <div v-if="tipsoon.site" class="site-box">
              <a :href="tipsoon.site.url" target="_blank">
                {{ tipsoon.site.title }}
              </a>
            </div>
            <div class="bottomBox">
              <div class="operate">
                <span class="like" v-if="!tipsoon.isLike" @click="tipsoonLike(tipsoon)">
                    <i class="iconfont icon-dianzan"></i> 赞
                </span>
                <span class="like" v-else @click="canLike(tipsoon)">
                    <i class="iconfont icon-quxiaodianzan"></i> 取消
                </span>
                <span class="commentBtn" @click="handleShowCommentBox(null, tipsoon.id)">
                    <i class="el-icon-chat-dot-square"></i> 评论
                </span>
                <span class="collect" v-if="!tipsoon.collect" @click="tipsooncollect(tipsoon)">
                    <i class="iconfont icon-collect"></i> 收藏
                </span>
                <span class="collect" v-else @click="cancollect(tipsoon)">
                    <i class="iconfont icon-uncollect"></i> 取消
                </span>
              </div>
            </div>
            <div class="interaction">
              <div class="commentBox">
                <div class="commentItem " v-for="(comment, comment_index) in tipsoon.tipsoonCommentVOList"
                     :key="comment_index" v-if="tipsoon.tipsoonCommentVOList.length">
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
                          @click="handleShowCommentBox(comment, tipsoon.id)">
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
                    <a class="sendBtn point" @click="tipsoonComment">发送</a>

                  </div>
                  <div class="emoji-wrapper" v-if="showEmoji">
                    <Emoji @chooseEmoji="handleChooseEmoji" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="right-sidbarnav" :style="{ right: right, top: top }">
      <el-tooltip class="item" effect="dark" content="阅读下一条" placement="right">
        <div class="left-item" title="阅读下一条" @click="skip('next')">
                    <span>
                        <i class="iconfont el-icon-right"></i>
                    </span>
        </div>
      </el-tooltip>
    </div>
  </div>
</template>
<script>
import { getTipsoon, getTipsoonById, tipsoonLike, tipsoonComment } from '@/api/tipsoon'
import Emoji from '@/components/emoji'
export default {
  components: {
    Emoji
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
      tipsoonIdList: [],
      tipsoon: {
        id: "0",
        title: "感谢您阅读完所有内容！",
        content: "您已成功获取全部信息。如果您有任何问题或需要进一步的帮助，请随时提问。我们很乐意为您提供支持！",
        imgUrl: "https://cxblog.qiniu.zhaohaoyue.love/780.jpg",
        site: {
          title: "简讯官网",
          url: "https://www.tipsoon.com"
        },
        nickname: this.$store.state.webSiteInfo.author,
        tipsoonCommentVOList: [],
        userLikeList: []
      },
      tipsoonIndex: -1,
      left: "0px",
      right: "0px",
      top: "500px",
      showOperate: false,
      lastIndex: null,
      content: "",
      showEmoji: false,
      showCommentBox: false,
      placeholder: "请输入内容",
      comment: {
        replyUserId: null,
        replyUserNickname: null,
        tipsoonId: null,
        content: ""
      },
      commentIndex: null,
      commentLastIndex: null,
      lastEditRange: null
    }
  },
  mounted() {
    const element = document.getElementById("contentBox")
    this.left = (element.offsetLeft - 80) + "px"
    const element2 = document.getElementById("container")
    this.top = ((element2.offsetHeight / 2)) + "px"
    this.right = this.left
  },
  created() {
    this.getTipsoon()
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
    tipsoonComment() {
      let el = document.getElementById("textarea")
      if (!el.innerHTML) {

        this.$toast.warning('请输入评论内容');
        return
      }
      this.comment.content = el.innerHTML
      tipsoonComment(this.comment).then(res => {
        this.$refs.conetntInputBox.style.display = "none"
        this.showCommentBox = false

        this.$toast.success('评论成功');
        let comment = {
          userId: this.$store.state.userInfo.id,
          nickname: this.$store.state.userInfo.nickname,
          replyUserId: this.comment.replyUserId,
          replyUserNickname: this.comment.replyUserNickname,
          content: this.comment.content,
        }
        this.tipsoon.tipsoonCommentVOList.push(comment)
        this.comment = {}
      })
    },
    handleShowCommentBox(comment, tipsoonId) {

      if (this.$refs.conetntInputBox.style.display == "block") {
        this.$refs.conetntInputBox.style.display = "none"
      } else {
        this.$refs.conetntInputBox.style.display = "block"
      }

      if (comment) {
        this.placeholder = "回复" + comment.nickname + ":"
        this.comment.replyUserId = comment.userId
        this.comment.replyUserNickname = comment.nickname
      } else {
        this.comment.replyUserId = null
        this.comment.replyUserNickname = null
        this.placeholder = "请输入内容"
      }
      this.comment.tipsoonId = tipsoonId
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
    canLike(tipsoon) {
      tipsoonLike(tipsoon.id).then(res => {
        tipsoon.isLike = false

        this.$toast.success(res.data);
      })
    },
    tipsoonLike(tipsoon) {
      tipsoonLike(tipsoon.id).then(res => {
        tipsoon.isLike = true

        this.$toast.success(res.data);
      })
    },
    getTipsoon() {
      this.$bus.$emit('show');
      getTipsoon().then(res => {
        if (res.code == 200) {
          this.tipsoon = res.data
          if(this.tipsoon.site) {
            this.tipsoon.site = JSON.parse(this.tipsoon.site)
          } else {
            this.tipsoon.site = {
              title: "简讯官网",
              url: "https://www.tipsoon.com"
            }
          }
          this.tipsoonIndex = this.tipsoonIndex == -1? 0 : this.tipsoonIdList.length
          this.tipsoonIdList.push(this.tipsoon.id)
        }
        else {
          this.$message.error(res.message)
        }
        this.$bus.$emit('close')
      }).catch(err => {
        this.$message.error(err.message)
        this.$bus.$emit('close')
      })
    },
    getTipsoonById(tipsoonId) {
      this.$bus.$emit('show');
      getTipsoonById(tipsoonId).then(res => {
        if (res.code == 200) {
          this.tipsoon = res.data
          if(this.tipsoon.site) {
            this.tipsoon.site = JSON.parse(this.tipsoon.site)
          } else {
            this.tipsoon.site = {
              title: "简讯官网",
              url: "https://www.tipsoon.com"
            }
          }
          this.tipsoonIndex = this.tipsoonIdList.indexOf(this.tipsoon.id)
        } else {
          this.$message.error(res.message)
        }
        this.$bus.$emit('close')
      }).catch(err => {
        this.$bus.$emit('close')
        if(err.response.data.status == 401) this.$store.commit("setLoginFlag", true);// 存储到vuex
        this.$message.error(err.response.data.message)
      })
    },
    checkImg(img) {
      return this.splitImg(img).length > 0
    },
    skip(cmd) {
      if (cmd == 'next') {
        if ((this.tipsoonIndex+1) == this.tipsoonIdList.length) this.getTipsoon()
        else {this.getTipsoonById(this.tipsoonIdList[this.tipsoonIndex+1])}
      } else {
        if (this.tipsoonIndex<=0) {this.$message("已是第一条")}
        else {
        this.getTipsoonById(this.tipsoonIdList[this.tipsoonIndex-1])
        }
      }
    }
  }
}
</script>
<style lang="scss" scoped>
.tipsoon-main {


  @media screen and (max-width: 1118px) {
    padding: 0 5px;

    .tipsoon-containner {
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

    .left-sidbarnav,
    .right-sidbarnav {
      display: none;
    }
  }

  @media screen and (min-width: 1119px) {
    .tipsoon-containner {
      width: 60%;

      /deep/ video {
        height: 500px;
      }

      .imgBox {
        max-height: 250px;
      }

      .cover {
        height: 300px;
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

    .left-sidbarnav {
      position: fixed;
      top: 150px;
      z-index: 999;

      .left-item {
        margin-bottom: 20px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        text-align: center;
        line-height: 50px;
        background-color: var(--background-color);
        cursor: pointer;
        position: relative;
        color: var(--text-color);

        &:hover {
          span {
            color: var(--theme-color);
          }

          background-color: rgba(25, 153, 153, 0.2);
        }

        i {
          font-size: 20px;
        }

        .el-icon-star-on {
          font-size: 25px;
        }

        .like-count {
          color: #fff;
          display: inline-block;
          width: 20px;
          height: 20px;
          border-radius: 50%;
          position: absolute;
          line-height: 20px;
          background-color: var(--theme-color);
          top: -8px;

        }
      }
    }
    .right-sidbarnav {
      position: fixed;
      top: 150px;
      z-index: 999;

      .left-item {
        margin-bottom: 20px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        text-align: center;
        line-height: 50px;
        background-color: var(--background-color);
        cursor: pointer;
        position: relative;
        color: var(--text-color);

        &:hover {
          span {
            color: var(--theme-color);
          }

          background-color: rgba(25, 153, 153, 0.2);
        }

        i {
          font-size: 20px;
        }

        .el-icon-star-on {
          font-size: 25px;
        }

        .like-count {
          color: #fff;
          display: inline-block;
          width: 20px;
          height: 20px;
          border-radius: 50%;
          position: absolute;
          line-height: 20px;
          background-color: var(--theme-color);
          top: -8px;

        }
      }
    }
  }

  .tipsoon-containner {
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

      .tipsoonItem {
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
            margin-top: 5px;
            color: var(--text-color2);
            font-size: small;
          }

          .title {
            margin-top: 10px;
            font-size: large;
          }

          .content {
            color: var(--text-color);
            margin-top: 15px;
            font-size: medium;
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

          .site-box {
            margin-top: 20px;

            a {
              border-radius: 50px;
              padding: 10px 20px;
              background: var(--text-color);
              color: var(--tips-backgroud-color);
            }
          }

          .time,
          .site-box {
            font-size: 14px;
          }

          .bottomBox {
            margin-top: 20px;
            position: relative;

            .operateBtn {
              position: absolute;
              right: 20px;
              display: inline-block;
              background-color: var(--tipsoon-background);
              padding: 0 5px;
              cursor: pointer;
            }

            .operate {
              //position: absolute;
              right: 55px;
              bottom: -8px;
              display: inline-block;
              padding: 8px;
              border-radius: 5px;
              display: block;

              span {
                padding: 0 5%;
                color: var(--text-color);
                position: relative;
                cursor: pointer;

                &:hover {
                  color: var(--theme-color);
                }
              }


            }
          }

          .interaction {
            background-color: var(--tipsoon-background);
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
