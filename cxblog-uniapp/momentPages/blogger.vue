<template>
  <view class="template-blogger2">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
            @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <!-- 立体头像-->
    <view class='cube' :style="'background-image: url(https://resource.tuniaokj.com/images/blogger/bg_image_1.jpg);'">
      <view class="cube__container">
        <view class="cube__container__body">
          <view class="cube__container__body__item cube__container__body__item--front" :style="{backgroundImage: `url(${user.avatar})`}"></view>
          <view class="cube__container__body__item cube__container__body__item--back" :style="{backgroundImage: `url(${user.avatar})`}"></view>
          <view class="cube__container__body__item cube__container__body__item--right" :style="{backgroundImage: `url(${user.avatar})`}"></view>
          <view class="cube__container__body__item cube__container__body__item--left" :style="{backgroundImage: `url(${user.avatar})`}"></view>
          <view class="cube__container__body__item cube__container__body__item--top" :style="{backgroundImage: `url(${user.avatar})`}"></view>
          <view class="cube__container__body__item cube__container__body__item--bottom" :style="{backgroundImage: `url(${user.avatar})`}"></view>
        </view>
      </view>


      <view class='tn-text-center tn-margin-top-lg'>
        <view class="tn-padding tn-text-bold tn-text-lg">{{ user.nickname }}</view>
        <view class="tn-padding-bottom-xl tn-text-lg">{{ user.intro }}</view>
      </view>
    </view>

    <!-- 消息&数据 -->
    <view class="blogger-tips-data">
      <view class="blogger-tips-data__wrap tn-bg-white">
        <view v-if="isSelf" class="blogger-tips-data__message tn-flex tn-flex-row-center"  @click="tn('/minePages/message')">
          <view class="blogger-tips-data__message__container tn-flex tn-flex-row-center tn-flex-col-center tn-bg-gray--light">
            <view class="blogger-tips-data__message__avatar">
              <tn-avatar
                class=""
                :src="tipsDataMessage.latestMessageUserAvatar"
                size="sm">
              </tn-avatar>
            </view>
            <view class="tn-padding-right tn-padding-left">{{ tipsDataMessage.messageCount }} 条新消息</view>
          </view>
        </view>
        <view class="blogger-tips-data__info tn-flex">
          <view class="tn-flex-1 tn-padding-sm tn-margin-xs">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="">
                <view class="tn-text-xxl tn-color-orange">{{ $tn.number.formatNumberAddPriceUnit(tipsDataMessage.likeCount) }}</view>
              </view>
              <view class="tn-margin-top-xs tn-color-gray tn-text-df tn-text-center">
                <text class="tn-icon-like"></text>
                <text class="tn-padding-left-xs">爱心</text>
              </view>
            </view>
          </view>
          <view class="tn-flex-1 tn-padding-sm tn-margin-xs">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="">
                <view class="tn-text-xxl tn-color-blue">{{ $tn.number.formatNumberAddPriceUnit(tipsDataMessage.hotReviewsCount) }}</view>
              </view>
              <view class="tn-margin-top-xs tn-color-gray tn-text-df tn-text-center">
                <text class="tn-icon-message"></text>
                <text class="tn-padding-left-xs">热评</text>
              </view>
            </view>
          </view>
          <view class="tn-flex-1 tn-padding-sm tn-margin-xs">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="">
                <view class="tn-text-xxl tn-color-red">{{ $tn.number.formatNumberAddPriceUnit(tipsDataMessage.fansCount) }}</view>
              </view>
              <view class="tn-margin-top-xs tn-color-gray tn-text-df tn-text-center">
                <text class="tn-icon-vip"></text>
                <text class="tn-padding-left-xs">粉丝</text>
              </view>
            </view>
          </view>
          <view class="tn-flex-1 tn-padding-sm tn-margin-xs">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="">
                <view class="tn-text-xxl tn-color-cyan">{{ $tn.number.formatNumberAddPriceUnit(tipsDataMessage.focusCount) }}</view>
              </view>
              <view class="tn-margin-top-xs tn-color-gray tn-text-df tn-text-center">
                <text class="tn-icon-star"></text>
                <text class="tn-padding-left-xs">关注</text>
              </view>
            </view>
          </view>
        </view>
      </view>
    </view>

    <!-- 边距间隔 -->
    <view class="tn-strip-bottom"></view>
    <!-- 内容 -->
    <view class="tn-flex tn-flex-direction-column tn-margin-top-sm tn-margin-bottom">

      <block v-for="(item, index) in content" :key="index">
        <view class="blogger__item" @click="tn('/articlePages/articleInfo?id='+item.id)">
          <view class="blogger__main-image" style="display: flex">
            <image :src="item.avatar" mode="scaleToFill" style="min-height: 200rpx;min-width: 200rpx;max-height: 200rpx;max-width: 200rpx">
            </image>
            <view class="tn-margin-left-sm" >
              <view class="tn-text-lg tn-text-bold clamp-text-1 tn-text-justify" style="white-space: nowrap;text-overflow:ellipsis; overflow:hidden;">
                {{ item.title }}
              </view>
              <view class="tn-flex tn-flex-row-between tn-flex-col-between tn-padding-top-xs" style="min-height: 105rpx;">
                <text class="tn-text-df tn-color-gray clamp-text-1 tn-text-justify">
                  {{ item.summary }}
                </text>
<!--                <view class="justify-content-item tn-flex tn-flex-col-center">-->
<!--                  <tn-avatar-group :lists="item.viewUser.latestUserAvatar" size="sm"></tn-avatar-group>-->
<!--                </view>-->
<!--                <view class="justify-content-item tn-flex tn-flex-col-center">-->
<!--                  <text class="tn-color-gray">{{ item.viewUser.viewUserCount }} 人参与</text>-->
<!--                </view>-->
              </view>
              <view class="tn-flex tn-flex-row-between tn-flex-col-between">
                <view v-for="(label_item,label_index) in item.tagList" :key="label_index"
                      class="justify-content-item tn-tag-content__item tn-margin-right tn-round tn-text-sm tn-text-bold tn-bg-blue--light tn-color-blue">
                  <text class="tn-tag-content__item--prefix">#</text> {{ label_item.name }}
                </view>
                <view class="justify-content-item tn-color-gray tn-text-center tn-color-gray--disabled" style="padding-top: 5rpx;">
                  <text v-if="item.createTime" class="tn-padding-right-xs tn-text-lg">{{item.createTime.split(" ")[0]}}</text>
                  <text v-else class="tn-padding-right-xs tn-text-lg">未知时间</text>
                </view>
              </view>
            </view>
          </view>
        </view>
        <!-- 边距间隔 -->
        <view class="tn-strip-bottom" v-if="index != content.length - 1"></view>
      </block>

      <!-- 边距间隔 -->
      <view class="tn-strip-bottom"></view>
    </view>

    <!-- 悬浮按钮-->
    <view v-if="!isSelf" class="tn-flex tn-flex-row-between tn-footerfixed">
      <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
        <text>{{user.isFollowed}}</text>
        <tn-button v-if="!user.isFollowed" backgroundColor="#00FFC6" padding="40rpx 0" width="90%" shadow fontBold @click="handleFollowed(user.id, user)">
          <text class="tn-icon-add tn-padding-right-xs tn-color-black"></text>
          <text class="tn-color-black"  >关 注</text>
        </tn-button>
        <tn-button v-else backgroundColor="#00FFC6" padding="40rpx 0" width="90%" shadow fontBold @click="handleDeleteFollowed(user.id, user)">
          <text class="tn-icon-add tn-padding-right-xs tn-color-black"></text>
          <text class="tn-color-black" >取消关注</text>
        </tn-button>
      </view>
      <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
        <tn-button backgroundColor="#FFF00D" padding="40rpx 0" width="90%" shadow fontBold open-type="share">
          <text class="tn-icon-share-triangle tn-padding-right-xs tn-color-black"></text>
          <text class="tn-color-black">分 享</text>
        </tn-button>
      </view>
    </view>

    <view class='tn-tabbar-height'></view>

  </view>
</template>

<script>
import page_mixin from '@/libs/mixin/page_mixin.js'
import {getUserInfoById, getUserCount} from '@/api/user'
import {selectArticleByUserId} from '@/api/article'
export default {
  name: 'TemplateBlogger2',
  mixins: [page_mixin],
  data() {
    return {
      // 内容默认隐藏显示的高度
      contentHideShowHeight: 0,
      user: {
      },
      tipsDataMessage: {
        likeCount: 1290,
        hotReviewsCount: 896,
        fansCount: 962,
        focusCount: 86
      },
      content: [],
      pageData: {
        pageNo: 1,
        pageSize: 10,
        index: 0,
        type: 1,
        userId: 0,
      },
      isSelf: false
    }
  },
  computed: {
    // adSwiperItemClass() {
    //   return (index) => {
    //     const adLength = this.adContent.length
    //     let activeIndex = 0
    //     if (index < this.adSwiperCurrentIndex) {
    //       activeIndex = adLength - this.adSwiperCurrentIndex + index
    //     } else if (index === this.adSwiperCurrentIndex) {
    //       activeIndex = 0
    //     } else if (index > this.adSwiperCurrentIndex) {
    //       activeIndex = index - this.adSwiperCurrentIndex
    //     }
    //     return `blogger__ad__item--${activeIndex}`
    //   }
    // },
    // adSwiperItemStyle() {
    //   return (index) => {

    //     let style = {
    //       transform: `translate3d(0%, 0px, 0px) scale(1)`,
    //       zIndex: 1
    //     }

    //     switch (index) {
    //       case 0:
    //         style.zIndex = 4
    //         break
    //       case 1:
    //         style.zIndex = 3
    //         style.transform = `translate3d(10%, 0px, 0px) scale(0.9)`
    //         break
    //       case 2:
    //         style.zIndex = 2
    //         style.transform = `translate3d(20%, 0px, 0px) scale(0.8)`
    //         break
    //       default:
    //         break
    //     }

    //     return style
    //   }
    // }
  },
  created() {

  },
  onLoad(option) {
    this.pageData.userId = option.id
    if (this.pageData.userId === this.userInfo.id+"") this.isSelf = true
    getUserInfoById(this.pageData.userId).then(res => {
      this.user = res.data
    })
    this.selectAricleList()
    this.getCount()
    this.initContentData()
    this.contentHideShowHeight = uni.upx2px(56) * 3
  },
  onReady() {
    this.$nextTick(() => {
      this.getContentRectInfo()
    })
  },
  onShow() {
    this.adAutoplay = true
  },
  onHide() {
    this.adAutoplay = false
  },
  methods: {
    selectAricleList() {
      selectArticleByUserId(this.pageData).then(res => {
        this.content.push(...res.data.records);
        this.pages = res.data.pages
      }).catch(err => {
      })
    },
    getCount() {
      getUserCount(this.pageData.userId).then(res => {
        let count = {
          article: res.extra.articleCount,
          collect: res.extra.collectCount,
          followed: res.extra.followedCount,
        }
        this.count = count
      })
    },
    // 跳转
    tn(e) {
      uni.navigateTo({
        url: e,
      });
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
        this.$set(this.content, index, item)
      })
    },
    // 获取内容容器的信息
    getContentRectInfo() {
      let contentRect = {}
      const query = uni.createSelectorQuery().in(this)
      // 筛选出存在内容的数据
      this.content.forEach((item, index) => {
        if (item?.content) {
          query.select(`#blogger__content--${index}`).boundingClientRect()
          contentRect[index] = item
        }
      })
      // 获取所有内容的宽高信息
      query.exec(res => {
        if (!res) {
          setTimeout(() => {
            this.getContentRectInfo()
          }, 10)
          return
        }
        // console.log(res);
        res.map((item) => {
          // console.log(item.height, this.contentHideShowHeight);
          // 获取对应的标号
          const id = item.id
          const idIndex = /blogger__content--(\d)/.exec(id)[1]
          let contentItem = this.content[idIndex]
          contentItem.hideContent = item.height > this.contentHideShowHeight
          contentItem.showAllContent = false
          contentItem.contentContainerHeight = item.height
          contentItem.contentContainerInit = true
          this.$set(this.content, idIndex, contentItem)

          // console.log(/blogger__content--(\d)/.exec(id)[1]);
        })
      })
    },
    // 切换内容的显示与隐藏
    switchContentShowStatus(index) {
      const contentItem = this.content[index]
      contentItem.showAllContent = !contentItem.showAllContent
      this.$set(this.content, index, contentItem)
    },


    // adSwiperChange(e) {
    //   // console.log(e);
    //   this.adSwiperCurrentIndex = e.detail.current
    // }
  }
}
</script>

<style lang="scss" scoped>

.template-blogger2{

}

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

$cube-size: 120rpx;
$cube-split: 60rpx;

/* 立体头像 start*/

.cube {
  background: #fff;
  background-repeat: no-repeat;
  background-size: cover;
  height: 550rpx;
  display: flex;
  justify-content: center;
  padding-top: 40rpx;
  overflow: hidden;
  position: relative;
  flex-direction: column;
  align-items: center;
  font-weight: 300;

  &__container {
    margin-top: 180rpx;
    position: relative;
    width: $cube-size;
    height: $cube-size;
    -webkit-perspective: 500px;
    perspective: 500px;//透视太大会超过屏幕就不好了吖

    &:before {
      content: '';
      width: $cube-size;
      height: $cube-size;
      position: absolute;
      // top: calc(50% - ($cube-split - 30px));
      // left: calc(50% - $cube-split);
      background-color: #3c6496;
      filter: blur(60px);
      opacity: .8;
    }

    &__body {
      position: absolute;
      width: 100%;
      height: 100%;
      transform-style: preserve-3d;
      transform: translateZ(-75px);
      animation: cubeFrame 35s cubic-bezier(0.36, -0.03, 0.46, 0.95) infinite alternate;
      will-change: transform;

      &__item {
        position: absolute;
        display: block;
        display: flex;
        align-items: center;
        justify-content: center;
        width: $cube-size;
        height: $cube-size;
        font-size: 30px;
        background-repeat: no-repeat;
        background-size: cover;

        &--front {
          transform: rotateY(0deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
        &--back {
          transform: rotateX(180deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
        &--right {
          transform: rotateY(90deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
        &--left {
          transform: rotateY(-90deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
        &--top {
          transform: rotateX(90deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
        &--bottom {
          transform: rotateX(-90deg) translateZ($cube-split);
          background-color: #BEEBFF;
        }
      }
    }
  }
}

@keyframes cubeFrame {
  10% {
    transform: translateZ(-75px) rotateX(40deg) rotateY(60deg);
  }
  15% {
    transform: translateZ(-75px) rotateX(80deg) rotateY(20deg);
  }
  20% {
    transform: translateZ(-75px) rotateX(-180deg) rotateY(-70deg);
  }
  30% {
    transform: translateZ(-75px) rotateX(90deg) rotateY(180deg);
  }
  40% {
    transform: translateZ(-75px) rotateX(-10deg) rotateY(-140deg);
  }
  45% {
    transform: translateZ(-75px) rotateX(-100deg) rotateY(20deg);
  }
  55% {
    transform: translateZ(-75px) rotateX(-10deg) rotateY(-35deg);
  }
  60% {
    transform: translateZ(-75px) rotateX(180deg) rotateY(360deg);
  }
  70% {
    transform: translateZ(-75px) rotateX(-180deg) rotateY(-360deg);
  }
  80% {
    transform: translateZ(-75px) rotateX(45deg) rotateY(-70deg);
  }
  90% {
    transform: translateZ(-75px) rotateX(-45deg) rotateY(70deg);
  }
  100% {
    transform: translateZ(-75px) rotateX(-360deg) rotateY(360deg);
  }
}
/* 立体头像 end*/

/* 信息提示 start */
.blogger-tips-data {
  background-color: #F8F7F3;

  &__wrap {
    border-radius: 60rpx 60rpx 0 0;
  }

  &__message {
    padding-top: 60rpx;

    &__container {
      padding: 5rpx;
      border-radius: 100rpx;
    }

    &__avatar {
      margin: 6rpx 0 0 6rpx;
    }
  }

  &__info {
    padding: 40rpx 0 0 0;
  }
}
/* 信息提示 end */

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
/* 底部悬浮按钮 start*/
.tn-tabbar-height {
  min-height: 100rpx;
  height: calc(120rpx + env(safe-area-inset-bottom) / 2);
}
.tn-footerfixed {
  position: fixed;
  width: 100%;
  bottom: calc(30rpx + env(safe-area-inset-bottom));
  z-index: 1024;
  box-shadow: 0 1rpx 6rpx rgba(0, 0, 0, 0);

}
/* 底部悬浮按钮 end*/

/* 广告内容 start */
.ad-image{
  width: 80rpx;
  height: 80rpx;
  position: relative;
}
.ad-pic{
  background-size: cover;
  background-repeat:no-repeat;
  // background-attachment:fixed;
  background-position:top;
  border-radius: 20%;
}
/* 自定义导航栏内容 end */
</style>
