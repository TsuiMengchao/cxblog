<template>
  <view class="template-circle tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
            @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <view class="">
      <swiper class="card-swiper" :vertical="false" :autoplay="false" duration="500"
              interval="5000" @change="cardSwiper">
        <swiper-item v-for="(item,index) in swiperList">
          <view class="swiper-item image-banner" style="height: 100%">
            <view>
              <image :src="item.imgUrl" mode="scaleToFill" v-if="item.imgUrl!=''"
                     style="width: 100%;"></image>
            </view>
            <!-- 头部start-->
            <view class="shop-function tn-margin-bottom-xl" style="height: 50%;display: block">
              <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin">
                <view class="justify-content-item">
                  <view class="tn-flex tn-flex-col-center tn-flex-row-left">
                    <view>
                      <view class="tn-padding-right tn-padding-left-sm tn-text-xl tn-text-bold">
                        {{ item.title }}
                      </view>
                      <view class="tn-padding-right tn-padding-top-xs tn-text-ellipsis tn-padding-left-sm tn-text-sm">
                        <text class="tn-padding-right-sm" style="color: #8f939c">{{ item.nickname }}</text>
                      </view>
                      <view class="tn-padding-right " style="margin-top: 40rpx;">
                        <view
                            class="tn-padding-right tn-padding-left-sm"
                            v-html="item.content">
                        </view>
                      </view>
                    </view>
                  </view>
                </view>
              </view>
            </view>
            <!-- 头部 end-->
            <view class="tn-margin-bottom tn-margin-top" style="height: 10%;margin: 0 100rpx;display: inline-flex">
              <block>
                <view style="margin: 0 50rpx"  @click="handleCollect(index)">
                  <text v-if="item.isCollect" class="blogger__count-icon tn-icon-star-fill"></text>
                  <text v-else class="blogger__count-icon tn-icon-star"></text>
                  <text class="tn-padding-right">{{ item.collectCount }}</text>
                </view>
              </block>
              <block>
                <view style="margin: 0 50rpx" @click="()=>{commentVision = !commentVision}">
                  <text class="blogger__count-icon tn-icon-message"></text>
                  <text class="tn-padding-right">{{ item.commentCount }}</text>
                </view>
              </block>
              <block>
                <view style="margin: 0 50rpx" @click="handleLike(index)">
                  <text v-if="item.isLike" class="blogger__count-icon tn-icon-like-fill"></text>
                  <text v-else class="blogger__count-icon tn-icon-like"></text>
                  <text class="">{{ item.likeCount }}</text>
                </view>
              </block>
            </view>
          </view>
        </swiper-item>
      </swiper>
    </view>

    <!-- 评论 -->
    <view v-if="commentVision" style="padding-bottom: 120rpx;">
      <view class="tn-margin" style=""  v-for="(item,index) in commentList" :key="articleInfo">
        <!-- 图标logo/头像 -->
        <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin-top-xl">
          <view class="justify-content-item">
            <view class="tn-flex tn-flex-col-center tn-flex-row-left">
              <view class="logo-pic tn-shadow">
                <view class="logo-image">
                  <tn-avatar  :src="item.avatar"></tn-avatar>
                </view>
              </view>
              <view class="tn-padding-right tn-padding-left-sm">
                <view class="tn-padding-right tn-text-df tn-text-bold tn-color-black">
                  {{item.nickname}}
                </view>
                <view class="tn-padding-right tn-text-ellipsis tn-text-xs tn-color-gray" style="padding-top: 5rpx;">
                  {{item.createTimeStr}}
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

        <view class="" style="margin: 20rpx 30rpx 30rpx 80rpx;" v-html="item.content">
        </view>
        <view class="tn-bg-gray--light tn-padding-sm" style="margin: 20rpx 30rpx 30rpx 80rpx;border-radius: 10rpx;" v-if="item.children.length"
              v-for="(childrenItem) in item.children" :key="childrenItem.id">
          <text class="tn-text-bold tn-padding-right-xs">
            {{childrenItem.nickname}}
            <span >
					 回复 {{childrenItem.replyNickname}}
				</span>
          </text>
          <view style="line-height: 40rpx;" v-html="childrenItem.content">
          </view>
          <view class="tn-flex tn-flex-row-between tn-margin-top-xs">
            <view class="justify-content-item tn-text-xs tn-color-gray" style="padding-top: 5rpx;">
              {{childrenItem.createTimeStr}}
            </view>
            <view class="justify-content-item  tn-color-gray">
              <text class="tn-icon-message" @click="foucsInput(childrenItem,item.id)"></text>
            </view>
          </view>

        </view>

      </view>
    </view>

    <!--    #ifdef H5 || APP-PLUS-->
    <view v-if="commentVision" class="tabbar footerfixed dd-glass">
      <view class="tn-flex tn-flex-row-between tn-flex-col-center">
        <view class="justify-content-item tn-margin-top">
          <view class="tn-flex tn-flex-row-center tn-flex-col-center">

            <view class="tn-flex tn-flex-row-center tn-flex-col-center tn-padding-right tn-padding-left-sm" @click="foucsInput(null,null)">
              <view class="avatar-all">
                <view class="tn-shadow-blur" :style="'background-image:url(' + selectAvatar + ');width: 60rpx;height: 60rpx;background-size: cover;'">
                </view>
              </view>
            </view>
            <view class="topic__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="topic__info__item__input__left-icon">
                <view class="tn-icon-emoji-good"></view>
              </view>
              <view class="topic__info__item__input__content">
                <input v-model="commentContent" ref="commentInput" :focus="focusState" @blur="focusState = false" maxlength="20" placeholder-class="input-placeholder" :cursor-spacing="18" placeholder="不说点啥子吗？" />
              </view>
            </view>
          </view>
        </view>
        <view class="justify-content-item tn-flex-row-center tn-flex-col-center tn-margin-top tn-margin-right">
          <view class="topic__info__item__sure">
            <view class="tn-flex-1 justify-content-item tn-text-center">
              <tn-button shape="round" backgroundColor="tn-cool-bg-color-15--reverse" width="100%" shadow  @click="handleComment">
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
import {get10Tipsoon, tipsoonRead, tipsoonLike, tipsoonCollect, tipsoonComment, getCommentList} from '@/api/tipsoon.js'
export default {
  name: 'TipsoonInfo',
  mixins: [page_mixin],
  data() {
    return {
      cardCur: 0,
      maxIndex: 0,
      swiperList: [
        {
          id: "0",
          title: "感谢您阅读完所有内容！",
          content: "您已成功获取全部信息。如果您有任何问题或需要进一步的帮助，请随时提问。我们很乐意为您提供支持！",
          imgUrl: "https://cxblog.qiniu.zhaohaoyue.love/file/img/upload/tipsoon/780.jpg",
          site: {
            title: "简讯官网",
            url: "https://www.tipsoon.com"
          },
          nickname: "梦辰雪",
          tipsoonCommentVOList: [],
          userLikeList: []
        }],

      // 内容默认隐藏显示的高度
      contentHideShowHeight: 0,
      content: [],
      reserve: [],
      maskCloseable: true,
      commentVision: false,
      commentContent:"",
      commentPage:{
        pageNo:1,
        pageSize:10,
        articleId:null
      },
      commentList:[],
      comment:{
        selectItem:{},
        parentId:null
      },
      focusState:false,
      selectAvatar: "https://resource.tuniaokj.com/images/blogger/onepiece-1.jpg"
    }
  },
  created() {
    this.getTipsoonList()
  },

  onLoad() {
    this.initContentData()
    this.contentHideShowHeight = uni.upx2px(56) * 3

  },
  onReady() {
  },
  onShow() {

  },
  onHide() {

  },
  methods: {
    // cardSwiper
    cardSwiper(e) {
      console.log(e)
      this.cardCur = e.detail.current
      if (this.cardCur>this.maxIndex) {
        this.maxIndex = this.cardCur
        this.readTipsoon(this.swiperList[this.cardCur].id)
        this.getCommentList(this.swiperList[this.cardCur].id)
      }
    },
    // 跳转
    tn(e) {
      uni.navigateTo({
        url: e,
      });
    },
    foucsInput(item,parentId){
      this.comment.selectItem = item;
      this.selectAvatar = item?item.avatar:"https://resource.tuniaokj.com/images/blogger/onepiece-1.jpg"
      this.comment.parentId = parentId;
      this.$nextTick(() => {
        this.focusState = true
      })
    },
    // 处理内容，给内容添加对应的标识信息
    initContentData() {
      this.content.forEach((item, index) => {
        // 是否需要隐藏内容
        item.hideContent = false
        // 显示所有内容
        item.showAllContent = false
        // 内容容器的实际高度
        item.contentContainerHeight = 0
        // 内容容器是否初始化完成
        item.contentContainerInit = false
        this.$set(this.content, item)
      })
    },
    getTipsoonList() {
      this.$tn.message.loading("加载中")
      get10Tipsoon().then(res => {
        this.swiperList= res.data
        this.$tn.message.closeLoading()
        if (this.swiperList.length>0) {
          this.readTipsoon(this.swiperList[0].id)
          this.getCommentList(this.swiperList[0].id)
        }
      }).catch(err => {
        this.$tn.message.toast(err.message)
        this.$tn.message.closeLoading()
      })
    },
    handleLike(index) {
      var articleId = this.swiperList[index].id
      tipsoonLike(articleId).then((res) => {
        if (res.code != 200) {
          this.$tn.message.toast(res.message)
          return
        }
        let msg;
        if (this.swiperList[index].isLike) {
          msg = "取消点赞"
          this.swiperList[index].likeCount--
        } else {
          msg = "点赞成功"
          this.swiperList[index].likeCount++
        }
        this.swiperList[index].isLike = !this.swiperList[index].isLike;
        this.$tn.message.toast(msg)
      })
    },
    handleCollect(index) {
      var articleId = this.swiperList[index].id
      tipsoonCollect(articleId).then((res) => {
        if (res.code != 200) {
          this.$tn.message.toast(res.message)
          return
        }
        let msg;
        if (this.swiperList[index].isCollect) {
          msg = "取消收藏"
          this.swiperList[index].collectCount--
        } else {
          msg = "收藏成功"
          this.swiperList[index].collectCount++
        }
        this.swiperList[index].isCollect = !this.swiperList[index].isCollect;
        this.$tn.message.toast(msg)
      })
    },
    readTipsoon(articleId) {
      tipsoonRead(articleId).then((res) => {
        if (res.code != 200) {
          this.$tn.message.toast(res.message)
          return
        }
      })
    },
    getCommentList(articleId) {
      getCommentList(articleId).then(res => {
        this.commentList = res.data.records
        this.swiperList[this.cardCur].commentCount = res.data.total
      })
    },
    handleComment(){
      let comment = {
        tipsoonId:this.swiperList[this.cardCur].id,
        parentId:this.comment.parentId,
        content:this.commentContent,
        replyUserId:this.comment.selectItem ? this.comment.selectItem.userId : null
      }
      tipsoonComment(comment).then(res =>{
        if(res.code != 200) {
          this.$tn.message.toast(res.message)
          return
        }
        this.commentContent = ""
        this.getCommentList(comment.tipsoonId)
      })
    }
  }
}
</script>

<style lang="scss" scoped>
.template-circle {
  max-height: 100vh;
}

.tn-tabbar-height {
  min-height: 120rpx;
  height: calc(140rpx + env(safe-area-inset-bottom) / 2);
}

/* 自定义导航栏内容 start */
.custom-nav {
  height: 100%;

  &__back {
    margin: auto 5rpx;
    font-size: 40rpx;
    margin-right: 10rpx;
    margin-left: 30rpx;
    flex-basis: 5%;
  }

  &__search {
    flex-basis: 60%;
    width: 100%;
    height: 100%;

    &__box {
      width: 100%;
      height: 70%;
      padding: 10rpx 0;
      margin: 0 30rpx;
      border-radius: 60rpx 60rpx 0 60rpx;
      font-size: 24rpx;
    }

    &__icon {
      padding-right: 10rpx;
      margin-left: 20rpx;
      font-size: 30rpx;
    }

    &__text {
      color: #AAAAAA;
    }
  }
}

.logo-image {
  width: 60rpx;
  height: 60rpx;
  position: relative;
  margin-top: -15rpx;
}

.logo-pic {
  background-size: cover;
  background-repeat: no-repeat;
  // background-attachment:fixed;
  background-position: top;
  border-radius: 50%;
}

/* 自定义导航栏内容 end */
/* 博主头像 start*/
.image-circle {
  // padding: 95rpx;
  width: 190rpx;
  height: 190rpx;
  font-size: 40rpx;
  font-weight: 300;
  position: relative;
}

.image-pic {
  background-size: cover;
  background-repeat: no-repeat;
  // background-attachment:fixed;
  background-position: top;
  border-radius: 10rpx;
}


/* 文章内容 start*/
.blogger {
  &__item {
    padding: 30rpx;
  }

  &__author {
    &__btn {
      margin-right: -12rpx;
      opacity: 0.5;
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

/* 广告内容 start */
.ad-image {
  width: 80rpx;
  height: 80rpx;
  position: relative;
}

.ad-pic {
  background-size: cover;
  background-repeat: no-repeat;
  // background-attachment:fixed;
  background-position: top;
  border-radius: 20%;
}

/* 自定义导航栏内容 end */


/* 全屏轮播  start*/
.card-swiper {
  height: 100vh !important;
}

.card-swiper swiper-item {
  width: 750rpx !important;
  left: 0rpx;
  box-sizing: border-box;
  overflow: initial;
}

.card-swiper swiper-item .swiper-item {
  width: 100%;
  display: block;
  height: 100vh;
  border-radius: 0rpx;
  transform: scale(1);
  transition: all 0.2s ease-in 0s;
  overflow: hidden;
}

.card-swiper swiper-item.cur .swiper-item {
  transform: none;
  transition: all 0.2s ease-in 0s;
}

.card-swiper swiper-item .swiper-item-png {
  margin-top: -50vh;
  width: 100%;
  display: block;
  border-radius: 0rpx;
  transform: translate(1040rpx, 20rpx) scale(0.5, 0.5);
  transition: all 0.6s ease 0s;
  // overflow: hidden;
}

.card-swiper swiper-item.cur .swiper-item-png {
  margin-top: -100vh;
  width: 900rpx;
  transform: translate(-80rpx, 0rpx) scale(1, 1);
  transition: all 0.6s ease 0s;
}

.image-banner {
  display: flex;
  align-items: center;
  justify-content: center;
}

.image-banner image {
  width: 100%;
}

/* 轮播指示点 start*/
.indication {
  z-index: 9999;
  width: 100%;
  height: 36rpx;
  position: fixed;
  // display:flex;
  display: block;
  flex-direction: row;
  align-items: center;
  justify-content: center;
}

.spot {
  background-color: #000;
  opacity: 0.3;
  width: 10rpx;
  height: 10rpx;
  border-radius: 20rpx;
  margin: 20rpx 0 !important;
  left: 95vw;
  top: -60vh;
  position: relative;
}

.spot.active {
  opacity: 0.6;
  height: 30rpx;
  background-color: #000;
}

/* 资讯主图 start*/
.image-article {
  border-radius: 8rpx;
  border: 1rpx solid #F8F7F8;
  width: 200rpx;
  height: 200rpx;
  position: relative;
}

.image-pic {
  background-size: cover;
  background-repeat: no-repeat;
  // background-attachment:fixed;
  background-position: top;
  border-radius: 10rpx;
}

.article-shadow {
  border-radius: 15rpx;
  box-shadow: 0rpx 0rpx 50rpx 0rpx rgba(0, 0, 0, 0.07);
}

/* 文字截取*/
.clamp-text-1 {
  -webkit-line-clamp: 1;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  text-overflow: ellipsis;
  overflow: hidden;
}

.clamp-text-2 {
  -webkit-line-clamp: 2;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  text-overflow: ellipsis;
  overflow: hidden;
}

/* 标签内容 start*/
.tn-tag-content {
  &__item {
    display: inline-block;
    line-height: 35rpx;
    padding: 5rpx 25rpx;

    &--prefix {
      padding-right: 10rpx;
    }
  }
}


/* 图标容器9 start */
.icon9 {
  &__item {
    width: 30%;
    background-color: #FFFFFF;
    border-radius: 10rpx;
    padding: 30rpx;
    margin: 20rpx 10rpx;
    transform: scale(1);
    transition: transform 0.3s linear;
    transform-origin: center center;

    &--icon {
      width: 110rpx;
      height: 110rpx;
      font-size: 65rpx;
      border-radius: 50%;
      margin: 20rpx 40rpx;
      position: relative;
      z-index: 1;

      &::after {
        content: " ";
        position: absolute;
        z-index: -1;
        width: 100%;
        height: 100%;
        left: 0;
        bottom: 0;
        border-radius: inherit;
        opacity: 1;
        transform: scale(1, 1);
        background-size: 100% 100%;
        background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg5.png);
      }
    }
  }
}


/* 悬浮 */
.tnxuanfu {
  animation: suspension 3s ease-in-out infinite;
}

@keyframes suspension {

  0%,
  100% {
    transform: translateY(0);
  }

  50% {
    transform: translateY(-0.8rem);
  }
}

/* 悬浮按钮 */
.button-shop {
  width: 90rpx;
  height: 90rpx;
  display: flex;
  flex-direction: row;
  position: fixed;
  /* bottom:200rpx;
  right: 20rpx; */
  left: 5rpx;
  top: 5rpx;
  z-index: 1001;
  border-radius: 100px;
  opacity: 0.9;
}


/* 按钮 */
.edit {
  bottom: 300rpx;
  right: 75rpx;
  position: fixed;
  z-index: 9999;
}


.pa,
.pa0 {
  position: absolute
}

.pa0 {
  left: 0;
  top: 0
}


.bg0 {
  width: 100rpx;
  height: 100rpx;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

.bg1 {
  width: 100%;
  height: 100%;
}


.hx-box {
  top: 50%;
  left: 50%;
  width: 100rpx;
  height: 100rpx;
  transform-style: preserve-3d;
  transform: translate(-50%, -50%) rotateY(75deg) rotateZ(10deg);
}

.hx-box .pr {
  width: 100rpx;
  height: 100rpx;
  transform-style: preserve-3d;
  animation: hxz 20s linear infinite;
}

@keyframes hxz {
  0% {
    transform: rotateX(0deg);
  }

  100% {
    transform: rotateX(-360deg);
  }
}


.hx-box .pr .pa0 {
  width: 100rpx;
  height: 100rpx;
  /* border: 4px solid #5ec0ff; */
  border-radius: 1000px;
}

.hx-box .pr .pa0 .span {
  display: block;
  width: 100%;
  height: 100%;
  background: url(https://resource.tuniaokj.com/images/cool_bg_image/arc4.png) no-repeat center center;
  background-size: 100% 100%;
  animation: hx 4s linear infinite;
}

@keyframes hx {
  to {
    transform: rotate(360deg);
  }
}

.hx-k1 {
  transform: rotateX(-60deg) rotateZ(-60deg)
}

.hx-k2 {
  transform: rotateX(-30deg) rotateZ(-30deg)
}

.hx-k3 {
  transform: rotateX(0deg) rotateZ(0deg)
}

.hx-k4 {
  transform: rotateX(30deg) rotateZ(30deg)
}

.hx-k5 {
  transform: rotateX(60deg) rotateZ(60deg)
}

.hx-k6 {
  transform: rotateX(90deg) rotateZ(90deg)
}
</style>
