<template>
  <view class="template-details tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <view class="" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <!-- 图文信息 -->
      <block v-if="item">
        <view class="blogger__item">
          <view class="blogger__author tn-flex tn-flex-row-between tn-flex-col-center">
            <view class="justify__author__info" @click="tn('/momentPages/blogger?id='+item.userId)">
              <view class="tn-flex tn-flex-row-center">
                <view class="tn-flex tn-flex-row-center tn-flex-col-center">
                  <view class="">
                    <tn-avatar
                      class=""
                      shape="circle"
                      :src="item.avatar"
                      size="lg">
                    </tn-avatar>
                  </view>
                  <view class="tn-padding-right tn-text-ellipsis">
                    <view class="tn-padding-right tn-padding-left-sm tn-text-bold tn-text-lg">{{ item.nickname }}</view>
                    <view class="tn-padding-right tn-padding-left-sm tn-padding-top-xs tn-color-gray">{{ item.createTime }}</view>
                  </view>
                </view>
              </view>
            </view>
            <view class="blogger__author__btn justify-content-item tn-flex-col-center tn-flex-row-center">
              <!-- 既然都点到详情里面了，加个关注按钮呗 -->
              <text v-if="item.isFollowed" class="tn-bg-gray--light tn-round tn-text-df tn-text-bold tn-color-gray" style="padding: 10rpx 24rpx;" @click="handleDeleteFollowed(item.userId, item)">
                + 取消关注
              </text>
              <text v-else class="tn-bg-brown--light tn-round tn-text-df tn-text-bold tn-color-brown" style="padding: 10rpx 24rpx;" @click="handleFollowed(item.userId, item)">+ 关注</text>
            </view>
          </view>

          <view class="blogger__desc tn-margin-top-sm tn-margin-bottom-sm tn-text-justify tn-flex-col-center tn-flex-row-left">
            <view  class="blogger__desc__label tn-float-left tn-margin-right tn-bg-gray--light tn-round tn-text-sm tn-text-bold">
              <text class="blogger__desc__label--prefix">#</text>
              <text class="tn-text-df">{{ item.talkName }}</text>
            </view>
            <!-- 不用限制长度了，因为发布的时候限制长度了-->
            <text class="blogger__desc__content tn-flex-1 tn-text-justify tn-text-df"></text><br>
          </view>

          <!-- 内容太多疲劳了-->
          <view
            v-if="item.content"
            class="blogger__content"
          >
            <view
              class="blogger__content__data"  v-html="item.content">
            </view>
          </view>

          <block v-if="item.imgUrl">
            <view v-if="[1,2,4].indexOf(item.splitImg(item.imgUrl).length) != -1" class="tn-padding-top-xs">
              <image v-for="(image_item,image_index) in item.splitImg(item.imgUrl)" :key="image_index"
                class="blogger__main-image"
                :class="{
                  'blogger__main-image--1 tn-margin-bottom-sm': item.splitImg(item.imgUrl).length === 1,
                  'blogger__main-image--2 tn-margin-right-sm tn-margin-bottom-sm': item.splitImg(item.imgUrl).length === 2 || item.splitImg(item.imgUrl).length === 4
                }"
                :src="image_item"
                mode="aspectFill"
              ></image>
            </view>
            <view v-else class="tn-padding-top-xs">
              <tn-grid  hoverClass="none" :col="3">
                <block v-for="(image_item,image_index) in item.splitImg(item.imgUrl)" :key="image_index">
                  <!-- #ifndef MP-WEIXIN -->
                  <tn-grid-item style="width: 30%;margin: 10rpx;">
                    <image
                      class="blogger__main-image blogger__main-image--3"
                      :src="image_item"
                      mode="aspectFill"
                    ></image>
                  </tn-grid-item>
                  <!-- #endif-->
                  <!-- #ifdef MP-WEIXIN -->
                  <tn-grid-item style="width: 30%;margin: 10rpx;">
                    <image
                      class="blogger__main-image blogger__main-image--3"
                      :src="image_item"
                      mode="aspectFill"
                    ></image>
                  </tn-grid-item>
                  <!-- #endif-->
                </block>
              </tn-grid>
            </view>
          </block>

          <div class="" v-if="item.site">
            <a :href="JSON.parse(item.site).url" target="_blank" size="lg">
              {{ JSON.parse(item.site).title }}
            </a>
          </div>

          <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin-top-xs">
            <view v-if="item.likeListVO" class="justify-content-item tn-flex tn-flex-col-center">
              <view style="margin-right: 10rpx;">
                <tn-avatar-group :lists="extractImg(item.likeListVO)" size="sm"></tn-avatar-group>
              </view>
              <text class="tn-color-gray">{{ item.likeListVO.length }}人</text>
            </view>
            <view class="justify-content-item tn-color-gray tn-text-center">
              <view class="">
                <text class="blogger__count-icon tn-icon-footprint"></text>
                <text class="tn-padding-right">{{ item.collectionCount }}</text>
                <text class="blogger__count-icon tn-icon-message"></text>
                <text class="tn-padding-right">{{ item.commentCount }}</text>
                <text class="blogger__count-icon tn-icon-like"></text>
                <text class="">{{ item.likeCount }}</text>
              </view>
            </view>
          </view>
        </view>

        <!-- 边距间隔 -->
        <!-- <view class="tn-strip-bottom" v-if="index != content.length - 1"></view> -->
      </block>

      <!-- 按钮-->
      <view class="tn-flex tn-flex-row-between" style="margin: 40rpx 0 60rpx 0;">
        <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
          <tn-button backgroundColor="#00FFC6" padding="40rpx 0" width="90%" shadow fontBold @click="handleLike">
            <text v-if="!item.isLike" class="tn-icon-like-lack tn-padding-right-xs icon"></text>
            <text v-else class="tn-icon-like-fill tn-padding-right-xs tn-color-black"></text>
            <text class="tn-color-black">点 赞</text>
          </tn-button>
        </view>
        <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
          <tn-button backgroundColor="#FFF00D" padding="40rpx 0" width="90%" shadow fontBold open-type="share">
            <text class="tn-icon-share-triangle tn-padding-right-xs tn-color-black"></text>
            <text class="tn-color-black">分 享</text>
          </tn-button>
        </view>
      </view>


    </view>

    <!-- 评论 -->
    <view v-for="(item, index) in commentList" class="tn-margin" style="padding-bottom: 120rpx;">
      <!-- 图标logo/头像 -->
      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin-top-xl">
        <view class="justify-content-item">
          <view class="tn-flex tn-flex-col-center tn-flex-row-left">
            <view class="logo-pic tn-shadow">
              <view class="logo-image">
                <image :src="item.avatar" class="tn-shadow-blur" style="width: 60rpx;height: 60rpx;background-size: cover;">
                </image>
              </view>
            </view>
            <view class="tn-padding-right tn-padding-left-sm">
              <view class="tn-padding-right tn-text-df tn-text-bold tn-color-black">
                {{item.nickname}}
              </view>
              <view class="tn-padding-right tn-text-ellipsis tn-text-xs tn-color-gray" style="padding-top: 5rpx;">
                2022年5月26日
              </view>
            </view>
          </view>
        </view>
        <view class="justify-content-item tn-flex-row-center tn-flex-col-center tn-color-gray">
          <view class="tn-text-center">
            <text class="tn-icon-message tn-padding-xs" @click="foucsInput(item,item.id)"></text>
          </view>
        </view>
      </view>

      <view class="" style="margin: 20rpx 30rpx 30rpx 80rpx;">
        {{item.content}}
      </view>
      <view v-for="(item2, index) in item.children" class="tn-bg-gray--light tn-padding-sm" style="margin: 20rpx 30rpx 30rpx 80rpx;border-radius: 10rpx;">
        <text class="tn-text-bold tn-padding-right-xs">{{item2.nickname}}
          <span >
					 回复 {{item2.replyNickname}}
				</span>
        </text>
        <view style="line-height: 40rpx;" v-html="item2.content"></view>
        <view class="tn-flex tn-flex-row-between tn-margin-top-xs">
          <view class="justify-content-item tn-text-xs tn-color-gray" style="padding-top: 5rpx;">
            2022年5月26日
          </view>
          <view class="justify-content-item tn-text-xs tn-color-gray">
            <text class="tn-icon-message" @click="foucsInput(item2,item.id)"></text>
          </view>
        </view>
      </view>

    </view>

    <!--    #ifdef H5 || APP-PLUS-->
    <view class="tabbar footerfixed dd-glass">
      <view class="tn-flex tn-flex-row-between tn-flex-col-center">
        <view class="justify-content-item tn-margin-top">
          <view class="tn-flex tn-flex-row-center tn-flex-col-center">


            <!-- <view class="tn-flex tn-flex-row-center tn-padding-right tn-padding-left">
              <text class="tn-icon-emoji-good tn-text-xxl"></text>
            </view> -->

            <view class="tn-flex tn-flex-row-center tn-flex-col-center tn-padding-right tn-padding-left-sm" @click="foucsInput(null,null)">
              <view class="avatar-all">
                <view class="tn-shadow-blur" :style="'background-image:url(' + selectAvatar + ');width: 60rpx;height: 60rpx;background-size: cover;'">
                </view>
              </view>
            </view>


            <view class="topic__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="topic__info__item__input__left-icon">
                <view  class="tn-icon-emoji-good"></view>
              </view>
              <view class="topic__info__item__input__content">
                <input v-model="commentContent" ref="commentInput" :focus="focusState" @blur="focusState = false"  maxlength="20" placeholder-class="input-placeholder" :cursor-spacing="18" placeholder="不说点啥子吗？" />
              </view>
            </view>



          </view>
        </view>
        <view class="justify-content-item tn-flex-row-center tn-flex-col-center tn-margin-top tn-margin-right">
          <view class="topic__info__item__sure">
            <view class="tn-flex-1 justify-content-item tn-text-center">
              <tn-button shape="round" backgroundColor="tn-cool-bg-color-15--reverse" width="100%" shadow @click="handleComment">
                <text class="tn-color-white" hover-class="tn-hover" :hover-stay-time="150">
                  发 送
                </text>
              </tn-button>
            </view>
          </view>
        </view>
      </view>
    </view>
<!--    #endif-->

  </view>
</template>

<script>
  import page_mixin from '@/libs/mixin/page_mixin.js'
  import {getForumById, getForumCommentList, forumLike, addForumComment} from '@/api/talk.js'
  export default {
    name: 'TemplateDetails',
    mixins: [page_mixin],
    data(){
      return {
        item: {},
        pageData: {
          pageNo: 1,
          pageSize: 5,
          forumId: 0
        },
        commentContent:"",
        commentList: [],
        comment:{
          selectItem:{avatar:null},
          parentId:null
        },
        pages: 0,
        focusState:false,
        selectAvatar: "https://resource.tuniaokj.com/images/blogger/onepiece-1.jpg"
      }
    },
    created() {
    },
    methods: {
      splitImg(img) {
        let imgs = img.split(",")
        var r = imgs.filter(function (s) {
          return s && s.trim();
        });
        return r;
      },
      extractImg(list) {
        var imgList = []
        if (!list) return imgList
        list.forEach((user) => {
          imgList.push({src: user.avatar})
        })
        return imgList;
      },
      foucsInput(item,parentId){
        this.comment.selectItem = item;
        this.selectAvatar = item?item.avatar:"https://resource.tuniaokj.com/images/blogger/onepiece-1.jpg"
        this.comment.parentId = parentId
        this.$nextTick(() => {
          this.focusState = true
        })
      },
      handleComment(){
        let comment = {
          forumId:this.forumId,
          parentId:this.comment.parentId,
          content:this.commentContent,
          replyUserId:this.comment.selectItem ? this.comment.selectItem.userId : null
        }
        addForumComment(comment).then(res =>{
          if(res.code != 200) {
            this.$tn.message.toast(res.message)
            return
          }
          this.commentContent = ""
          this.getCommentList()
        })
      },
      handleLike() {
        forumLike(this.pageData.forumId).then((res) => {
          if (res.code != 200) {
            this.$tn.message.toast(res.message)
            return
          }
          let msg;
          if (this.item.isLike) {
            msg = "取消点赞"
            this.item.likeCount--
          } else {
            msg = "点赞成功"
            this.item.likeCount++
          }
          this.item.isLike = !this.item.isLike;
          this.$tn.message.toast(msg)
        })
      },
      getForumById(forumId) {
        this.$tn.message.loading("加载中")
        getForumById(forumId).then(res => {
          this.item = res.data
          this.$tn.message.closeLoading()
          this.pageData.forumId = forumId
          this.getCommentList()
        }).catch(err => {
          this.$tn.message.toast(err.message)
          this.$tn.message.closeLoading()
        })
      },
      getCommentList() {
        getForumCommentList(this.pageData).then(res => {
          this.commentList = res.data.records
          this.pages = res.data.pages;
        })
      },
      // 跳转
      tn(e) {
      	uni.navigateTo({
      		url: e,
      	});
      },
    },
    onLoad(option) {
      this.forumId = option.forumId
      this.getForumById(option.forumId)
    }
  }
</script>

<style lang="scss" scoped>
    /* 胶囊*/
    .tn-custom-nav-bar__back {
      width: 100%;
      height: 100%;
      position: relative;
      display: flex;
      justify-content: space-evenly;
      align-items: center;
      box-sizing: border-box;
      background-color: rgba(0, 0, 0, 0.15);
      border-radius: 1000rpx;
      border: 1rpx solid rgba(255, 255, 255, 0.5);
      color: #FFFFFF;
      font-size: 18px;

      .icon {
        display: block;
        flex: 1;
        margin: auto;
        text-align: center;
      }

      &:before {
        content: " ";
        width: 1rpx;
        height: 110%;
        position: absolute;
        top: 22.5%;
        left: 0;
        right: 0;
        margin: auto;
        transform: scale(0.5);
        transform-origin: 0 0;
        pointer-events: none;
        box-sizing: border-box;
        opacity: 0.7;
        background-color: #FFFFFF;
      }
    }

    /* 文章内容 start*/
      .blogger {
        &__item {
          padding: 30rpx;
        }

        &__author {
          &__btn {
            margin-right: -12rpx;
            padding: 0 20rpx;
          }
        }

        &__desc {
          line-height: 55rpx;

          &__label {
            padding: 0 20rpx;
            margin: 0rpx 18rpx 0 0;

            &--prefix {
              color: #00FFC8;
              padding-right: 10rpx;
            }
          }
          &__content {

          }
        }

        &__content {
          margin-top: 18rpx;
          padding-right: 18rpx;

          &__data {
            line-height: 46rpx;
            text-align: justify;
            overflow: hidden;
            transition: all 0.25s ease-in-out;

          }

          &__status {
            margin-top: 10rpx;
            font-size: 26rpx;
            color: #82B2FF;
          }
        }

        &__main-image {
          border-radius: 16rpx;

          &--1 {
            max-width: 80%;
            max-height: 300rpx;
          }

          &--2 {
            max-width: 260rpx;
            max-height: 260rpx;
          }

          &--3 {
            height: 212rpx;
            width: 100%;
          }
        }

        &__count-icon {
          font-size: 40rpx;
          padding-right: 5rpx;
        }

        &__ad {
          width: 100%;
          height: 500rpx;
          transform: translate3d(0px, 0px, 0px) !important;

          ::v-deep .uni-swiper-slide-frame {
            transform: translate3d(0px, 0px, 0px) !important;
          }
          .uni-swiper-slide-frame {
            transform: translate3d(0px, 0px, 0px) !important;
          }

          &__item {
            position: absolute;
            width: 100%;
            height: 100%;
            transform-origin: left center;
            transform: translate3d(100%, 0px, 0px) scale(1) !important;
            transition: transform 0.25s ease-in-out;
            z-index: 1;

            &--0 {
              transform: translate3d(0%, 0px, 0px) scale(1) !important;
              z-index: 4;
            }
            &--1 {
              transform: translate3d(13%, 0px, 0px) scale(0.9) !important;
              z-index: 3;
            }
            &--2 {
              transform: translate3d(26%, 0px, 0px) scale(0.8) !important;
              z-index: 2;
            }
          }

          &__content {
            border-radius: 40rpx;
            width: 640rpx;
            height: 500rpx;
            overflow: hidden;
          }

          &__image {
            width: 100%;
            height: 100%;
          }
        }
      }
      /* 文章内容 end*/

       /* 间隔线 start*/
      .tn-strip-bottom {
       width: 100%;
       border-bottom: 20rpx solid rgba(241, 241, 241, 0.8);
      }
       /* 间隔线 end*/

    /* 头像 start */
    .logo-image {
      width: 60rpx;
      height: 60rpx;
      position: relative;
    }

    .logo-pic {
      background-size: cover;
      background-repeat: no-repeat;
      // background-attachment:fixed;
      background-position: top;
      box-shadow: 0rpx 0rpx 80rpx 0rpx rgba(0, 0, 0, 0.15);
      border-radius: 50%;
      overflow: hidden;
      // background-color: #FFFFFF;
    }


  /* 底部 start*/
  .footerfixed{
   position: fixed;
   width: 100%;
   bottom: 0;
   z-index: 999;
   background-color: rgba(255,255,255,0.5);
   box-shadow: 0rpx 0rpx 30rpx 0rpx rgba(0, 0, 0, 0.07);
  }

  .tabbar {
    align-items: center;
    min-height: 130rpx;
  	padding: 0;
  	height: calc(130rpx + env(safe-area-inset-bottom) / 2);
  	padding-bottom: calc(30rpx + env(safe-area-inset-bottom) / 2);
    padding-left: 10rpx;
    padding-right: 10rpx;
  }

    /* 毛玻璃*/
  .dd-glass {
     width: 100%;
     backdrop-filter: blur(20rpx);
    -webkit-backdrop-filter: blur(20rpx);
  }

  /* 头像*/
  .avatar-all {
    width: 60rpx;
    height: 60rpx;
    border: 4rpx solid rgba(255,255,255,0.05);
    border-radius: 50%;
    overflow: hidden;
    box-shadow: 0rpx 0rpx 80rpx 0rpx rgba(0, 0, 0, 0.15);
  }

  /* 内容*/
  .topic {
    position: relative;
    height: 100%;
    z-index: 1;
    margin-bottom: 120rpx;


    /* 表单信息 start */
    &__info {
      margin: 0 50rpx;
      margin-top: 105rpx;
      padding: 30rpx 51rpx;
      border-radius: 20rpx;
      background-color: rgba(255,255,255,1);
      border: 2rpx solid rgba(255, 255, 255, 0.1);
      box-shadow: 0rpx 10rpx 50rpx 0rpx rgba(0, 3, 72, 0.1);

      &__item {

        &__input {
          width: 400rpx;
          height: 60rpx;
          border: 1rpx solid #C6D1D8;
          border-radius: 39rpx;

          &__left-icon {
            width: 10%;
            font-size: 44rpx;
            margin-left: 20rpx;
            margin-right: 5rpx;
            color: #C6D1D8;
          }

          &__content {
            width: 80%;
            padding-left: 10rpx;

            &--verify-code {
              width: 56%;
            }

            input {
              font-size: 30rpx;
              color: #78909C;
              // letter-spacing: 0.1em;
            }
          }

          &__right-icon {
            width: 10%;
            font-size: 34rpx;
            margin-right: 20rpx;
            color: #78909C;
          }

          &__right-verify-code {
            width: 34%;
            margin-right: 20rpx;
          }
        }

        &__button {
          width: 100%;
          height: 60rpx;
          text-align: center;
          font-size: 31rpx;
          font-weight: bold;
          line-height: 77rpx;
          // text-indent: 1em;
          border-radius: 100rpx;
          color: #FFFFFF;
          background-color: rgba(255,255,255,0.2);
          // border: 2rpx solid #FFFFFF;
        }

        &__sure {
          height: 60rpx;
          width: 140rpx;
        }

      }
    }
    /* 表单信息 end */

    /* 内容 end */

  }

  /deep/.input-placeholder {
    font-size: 30rpx;
    color: #C6D1D8;
  }

</style>
