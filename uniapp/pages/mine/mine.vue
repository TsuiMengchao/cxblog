<template>
  <view class="template-mine tn-safe-area-inset-bottom">

    <!-- 顶部自定义导航 消息铃铛按钮 暂时用不到 -->
   <tn-nav-bar :isBack="false" :bottomShadow="false" backgroundColor="none">
      <view class="custom-nav tn-flex tn-flex-col-center tn-flex-row-left" @click="tn('/minePages/message')">
        <view class="custom-nav__back">
          <view class="tn-icon-notice tn-color-brown" style="font-size: 50rpx;">
<!--            <tn-badge backgroundColor="#E72F8C" fontColor="#FFFFFF" :absolute="true" :translateCenter="false">-->
<!--              <text>12</text>-->
<!--            </tn-badge>-->
          </view>
        </view>
      </view>
    </tn-nav-bar>


	<!-- 橙色背景板区域及其登录按钮 -->
    <view class="top-backgroup">
      <image src='https://resource.tuniaokj.com/images/my/my-bg2.png' mode='widthFix' class='backgroud-image'></image>
    </view>

	<!-- 青蛇状装饰按钮 -->
    <button >
      <view class="dong">
        <view class="monster">
          <view class="monster__face">
            <view class="monster__eye avatar-eye avatar-eye--green eye--left">
              <view class="avatar-eye-pupil pupil--green"><span class="avatar-eye-pupil-blackThing"><span class="avatar-eye-pupil-lightReflection"></span></span></view>
            </view>
            <view class="monster__eye avatar-eye avatar-eye--violet eye--right">
              <view class="avatar-eye-pupil pupil--pink"><span class="avatar-eye-pupil-blackThing"><span class="avatar-eye-pupil-lightReflection"></span></span></view>
            </view>
            <view class="monster__noses">
              <view class="monster__nose"></view>
              <view class="monster__nose"></view>
            </view>
            <view class="monster__mouth">
              <view class="monster__top"></view>
              <view class="monster__bottom"></view>
            </view>
          </view>
        </view>
      </view>
    </button>

    <view class="about__wrap">
      <!-- 图标logo/头像 登录成功后样式 -->
      <view v-if="user" class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin-bottom">
        <view class="justify-content-item">
          <view class="tn-flex tn-flex-col-center tn-flex-row-left" @click="tn('/minePages/set')">
            <view class="logo-pic tn-shadow">
              <view class="logo-image">
                <image class="tn-shadow-blur user-avatar" :src="user.avatar">
                </image>
              </view>
            </view>
            <view class="tn-padding-right">
              <view class="tn-padding-right tn-padding-left-sm tn-text-xl tn-text-bold">
                <text class="tn-color-brown--dark">{{user.nickname}}</text>
              </view>
              <view class="tn-padding-right tn-padding-top-xs tn-padding-left-sm tn-text-ellipsis">
                <text class="tn-color-brown" style="opacity: 0.5;">{{user.intro ? user.intro :"这个博主有点懒，什么也没有留下"}}</text>
                <!-- <text class="tn-color-brown tn-text-bold tn-padding-left-sm">SVIP 6</text> -->
              </view>
            </view>

          </view>
        </view>
      </view>

 <!--     授权按钮 登录前样式-->
      <view v-else class="tn-flex tn-flex-row-between" @click="tn('/minePages/login')">
        <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
          <tn-button shape="round" backgroundColor="#00d886" fontColor="#ffffff" padding="20rpx 0" width="40%" shadow>
            <text class="tn-icon-wechat tn-padding-right-xs tn-text-xl"></text>
            <text class="">授权登录</text>
          </tn-button>
        </view>
      </view>


      <view class="tn-flex tn-flex-row-between tn-padding-top-xl">
        <view class="justify-content-item tn-text-bold tn-text-lg">
          <text class="">常用功能</text>
        </view>
      </view>

     <!-- 大型图标按钮，暂时不用 -->
      <!-- <view class="tn-flex">
        <view class="tn-flex-1 about-shadow tn-bg-white" style="margin: 30rpx 15rpx 0 0;padding: 30rpx 0;" @click="tn('/circlePages/blogger')">
          <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
            <view class="icon20__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-orangered tn-color-white">
              <view class="tn-icon-computer-fill"></view>
            </view>
            <view class="tn-text-center" style="font-size: 30rpx;">
              <view class="tn-text-ellipsis">用户主页</view>
            </view>
          </view>
        </view>
        <view class="tn-flex-1 about-shadow tn-bg-white" style="margin: 30rpx 0 0 15rpx;padding: 30rpx 0;" >
          <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
            <view class="icon20__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-purplered tn-color-white">
              <view class="tn-icon-moon-fill"></view>
            </view>
            <view class="tn-text-center" style="font-size: 30rpx;">
              <view class="tn-text-ellipsis">网站官网</view>
            </view>
          </view>
        </view>
      </view> -->

      <!-- 更多信息-->
      <view class="about-shadow tn-margin-top-xl tn-padding-top-sm tn-padding-bottom-sm tn-bg-white">
        <!-- 功能栏 小图标按钮-->
        <view class="tn-flex tn-radius tn-padding-top ">
          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/default')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-message" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">我的评论</text>
              </view>
            </view>
          </view>
          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/default')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-ticket" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">我的说说</text>
              </view>
            </view>
          </view>
          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/default')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-calendar" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">我的讨论</text>
              </view>
            </view>
          </view>
        </view>
        <view class="tn-flex tn-flex-row-center tn-radius tn-padding-top">
          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/article')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-order" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">我的文章</text>
              </view>
            </view>
          </view>
          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/collect')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-star" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">我的收藏</text>
              </view>
            </view>
          </view>

          <view class="tn-padding-sm tn-margin-xs tn-radius width-30" @click="tn('/minePages/set')">
            <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
              <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-bg-orange">
                <view class="tn-icon-set" style="color: #080808;"></view>
              </view>
              <view class="tn-text-center">
                <text class="tn-text-ellipsis">全局设置</text>
              </view>
            </view>
          </view>
        </view>
        <!-- 方式12 end-->
      </view>


      <!-- 更多信息-->
      <view class="about-shadow tn-margin-top-xl tn-padding-top-sm tn-padding-bottom-sm">
        <tn-list-cell :hover="true" :unlined="true" :radius="true" :fontSize="30" @click="tn('/homePages/about')">
          <view class="tn-flex tn-flex-col-center">
            <view
              class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-15 tn-color-white">
              <view class="tn-icon-my-reduce"></view>
            </view>
            <view class="tn-margin-left-sm tn-flex-1">关于本站</view>
            <view class="tn-color-cyan--light tn-icon-link"></view>
          </view>
        </tn-list-cell>
        <tn-list-cell :hover="true" :unlined="true" :radius="true" :fontSize="30" @click="copySource">
          <view class="tn-flex tn-flex-col-center">
            <view
              class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-2 tn-color-white">
              <view class="tn-icon-light-fill"></view>
            </view>
            <view class="tn-margin-left-sm tn-flex-1">开源地址</view>
            <view class="tn-color-blue--light tn-icon-copy"></view>
          </view>
        </tn-list-cell>
        <tn-list-cell :hover="true" :unlined="true" :radius="true" :fontSize="30" @click="tn('/minePages/protocol')">
          <view class="tn-flex tn-flex-col-center">
            <view
              class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-3 tn-color-white">
              <view class="tn-icon-safe-fill"></view>
            </view>
            <view class="tn-margin-left-sm tn-flex-1">使用协议</view>
            <view class="tn-color-red--light tn-icon-tips"></view>
          </view>
        </tn-list-cell>
      </view>

      <view class="about-shadow tn-margin-top-lg tn-margin-bottom-lg tn-padding-top-sm tn-padding-bottom-sm">
		  <tn-list-cell  v-if="uniPlatform == 'mp-weixin'" :hover="true" :unlined="true" :radius="true" :fontSize="30">
		    <button class="tn-flex tn-flex-col-center tn-button--clear-style" open-type="share">
		      <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-15 tn-color-white">
		        <view class="tn-icon-send"></view>
		      </view>
		      <view class="tn-flex tn-flex-row-between" style="width: 100%;">
		        <view class="tn-margin-left-sm">转发分享</view>
		        <view class="tn-color-orange--light tn-icon-share-circle"></view>
		      </view>
		    </button>
		  </tn-list-cell>
        <tn-list-cell v-if="uniPlatform == 'mp-weixin'" :hover="true" :unlined="true" :radius="true" :fontSize="30">
          <button class="tn-flex tn-flex-col-center tn-button--clear-style" open-type="contact">
            <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-5 tn-color-white">
              <view class="tn-icon-wechat-fill"></view>
            </view>
            <view class="tn-flex tn-flex-row-between" style="width: 100%;">
              <view class="tn-margin-left-sm">联系我们</view>
              <view class="tn-color-orange--light tn-icon-trust"></view>
            </view>
          </button>
        </tn-list-cell>
        <tn-list-cell v-if="uniPlatform == 'mp-weixin'" :hover="true" :unlined="true" :radius="true" :fontSize="30">
          <button class="tn-flex tn-flex-col-center tn-button--clear-style" open-type="feedback">
            <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-7 tn-color-white">
              <view class="tn-icon-comment-fill"></view>
            </view>
            <view class="tn-flex tn-flex-row-between" style="width: 100%;">
              <view class="tn-margin-left-sm">问题反馈</view>
              <view class="tn-color-green--light tn-icon-edit"></view>
            </view>
          </button>
        </tn-list-cell>

        <tn-list-cell :hover="true" :unlined="true" :radius="true" :fontSize="30" @click="callPhoneNumber" data-number="18333191029">
          <view class="tn-flex tn-flex-col-center">
            <view
              class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-cool-bg-color-9 tn-color-white">
              <view class="tn-icon-phone-fill"></view>
            </view>
            <view class="tn-margin-left-sm tn-flex-1">技术支持</view>
            <view
              class="tn-margin-left-sm tn-color-orangered tn-text-sm tn-padding-left-xs tn-padding-right-xs tn-bg-orange--disabled tn-round">
              484132820</view>
          </view>
        </tn-list-cell>
      </view>

    </view>

    <view class='tn-tabbar-height'></view>

  </view>
</template>

<script>
	import {
		doLogin
	} from '@/api/login.js'
  export default {
    name: 'Mine',
    data() {
      return {
		  user: null,
		uniPlatform: uni.getSystemInfoSync().uniPlatform
      }
    },
	created() {
		this.user = uni.getStorageSync("user")
	},
    methods: {
		onLoadShow(){
			this.user = uni.getStorageSync("user")
		},
      // 跳转到图鸟UI
      navTuniaoUI() {
        uni.navigateToMiniProgram({
          appId: 'wxf3d81a452b88ff4b'
        })
      },
      // 跳转
      tn(e) {
        uni.navigateTo({
          url: e,
        });
      },
      // 收货地址
      navAddress() {
        uni.chooseAddress({
        })
      },
      // 震动跳转
      navThanks(e) {
        wx.vibrateShort();
        uni.navigateTo({
          url: '/minePages/thanks'
        })
      },
      //拨打固定电话
      callPhoneNumber() {
        uni.makePhoneCall({
          phoneNumber: "18333191029",
        });
      },
      // 复制开源地址
      copySource() {
        uni.setClipboardData({
          data: "https://gitee.com/tsuimengchao/cxblog",
        })
		this.$tn.message.toast('复制成功')
      },
    }
  }
</script>

<style lang="scss" scoped>
	.width-30{
		width: 30%;
	}
  .template-mine {
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
      flex-basis: 5%;
      width: 100rpx;
      position: absolute;
    }
  }
  /* 自定义导航栏内容 end */

  /* 顶部背景图 start */
  .top-backgroup {
    height: 450rpx;
    z-index: -1;

    .backgroud-image {
      width: 100%;
      height: 450rpx;
      // z-index: -1;
    }
  }

  /* 顶部背景图 end */

  /* 标题 start */
  .nav_title {
    -webkit-background-clip: text;
    color: #0E122A;


    &--wrap {
      position: relative;
      display: flex;
      height: 120rpx;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      background-image: url(https://resource.tuniaokj.com/images/title_bg/title44.png);
      background-size: cover;
    }
  }
  /* 标题 end */

  /* 用户头像 start */
  .logo-image {
    width: 110rpx;
    height: 110rpx;
    position: relative;
	.user-avatar{
		width: 110rpx;
		height: 110rpx;
		background-size: cover;
	}
  }

  .logo-pic {
    background-size: cover;
    background-repeat: no-repeat;
    // background-attachment:fixed;
    background-position: top;
    border: 8rpx solid rgba(255,255,255,0.05);
    box-shadow: 0rpx 0rpx 80rpx 0rpx rgba(0, 0, 0, 0.15);
    border-radius: 50%;
    overflow: hidden;
    // background-color: #FFFFFF;
  }

  /* 页面 start*/
  .about-shadow {
    border-radius: 15rpx;
    box-shadow: 0rpx 0rpx 50rpx 0rpx rgba(0, 0, 0, 0.07);
  }

  .about {

    &__wrap {
      position: relative;
      z-index: 1;
      margin: 20rpx 30rpx;
      margin-top: -230rpx;
    }
  }

  /* 页面 end*/

  /* 图标容器12 start */
  .tn-three{
      position: absolute;
      top: 50%;
      right: 50%;
      bottom: 50%;
      left: 50%;
      transform: translate(-38rpx, -16rpx) rotateX(30deg) rotateY(20deg) rotateZ(-30deg);
      text-shadow: -1rpx 2rpx 0 #f0f0f0, -2rpx 4rpx 0 #f0f0f0, -10rpx 20rpx 30rpx rgba(0, 0, 0, 0.2);
  }
  .icon20 {
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
        width: 100rpx;
        height: 100rpx;
        font-size: 60rpx;
        border-radius: 50%;
        margin-bottom: 18rpx;
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
          background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg.png);
        }
      }
    }
  }

  /* 图标容器12 start */
  .icon12 {
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
        width: 15rpx;
        height: 15rpx;
        font-size: 50rpx;
        border-radius: 50%;
        margin-bottom: 38rpx;
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

        }
      }
    }
  }

  /* 图标容器1 start */
  .icon1 {
    &__item {
      // width: 30%;
      background-color: #FFFFFF;
      border-radius: 10rpx;
      padding: 30rpx;
      margin: 20rpx 10rpx;
      transform: scale(1);
      transition: transform 0.3s linear;
      transform-origin: center center;

      &--icon {
        width: 40rpx;
        height: 40rpx;
        font-size: 28rpx;
        border-radius: 50%;
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
          background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg.png);
        }
      }
    }
  }

  /* 图标容器1 end */

  /* 大嘴鸟*/
  .dong {
  	z-index: 9999;
  	position: fixed;
  	top: -40px;
  	right: -80px;
  	transform: scale(0.24);
  	-webkit-transform: scale(0.24);
  	-moz-transform: scale(0.24);

  }

  .monster {
  	transform: rotate(-50deg);
  	-ms-transform: rotate(-50deg);
  	/* IE 9 */
  	-moz-transform: rotate(-50deg);
  	/* Firefox */
  	-webkit-transform: rotate(-50deg);
  	/* Safari 和 Chrome */
  	-o-transform: rotate(-50deg);
  	/* Opera */
  	display: flex;
  	justify-content: center;
  	position: relative;
  	width: 170px;
  	height: 400px;
  	border-top-left-radius: 200px;
  	border-top-right-radius: 200px;
  	background-color: #3C47D7;
  	box-shadow: 20px 20px 60px #4650E5;
  }

  .monster__face {
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	flex-direction: column;
  	position: absolute;
  	top: 14%;
  	width: 75%;
  	height: 160px;
  }

  .monster__noses {
  	top: 50%;
  	display: flex;
  	justify-content: space-between;
  	width: 28%;
  	height: auto;
  	margin-bottom: 10px;
  }

  .monster__nose {
  	width: 8px;
  	height: 12px;
  	border-radius: 20px;
  	background: rgba(0, 0, 0, 0.5);
  	box-shadow: 4px 8px 5px rgba(0, 0, 0, 0.1);
  }

  .monster__mouth {
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	position: relative;
  	width: 100%;
  	height: 0%;
  	overflow: hidden;
  	border: 25px solid #FFC333;
  	border-radius: 100px;
  	background-color: #810332;
  	animation: mouth 1.75s infinite;
  	box-shadow: 4px 8px 5px rgba(0, 0, 0, 0.2);
  	box-sizing: border-box;
  }

  .monster__mouth::before {
  	content: '';
  	position: absolute;
  	width: 150px;
  	height: 80px;
  	border-radius: 100px;
  	background-color: #400018;
  }

  .monster__mouth::after {
  	content: '';
  	position: absolute;
  	bottom: -80px;
  	width: 160px;
  	height: 80px;
  	border-top-left-radius: 50%;
  	border-top-right-radius: 50%;
  	background-color: #DC1B50;
  	animation: tongue 1.75s infinite;
  }

  .monster__top {
  	position: absolute;
  	top: -30px;
  	width: 170px;
  	height: 30px;
  	border-bottom-left-radius: 10px;
  	border-bottom-right-radius: 10px;
  	background-color: #ffffff;
  	z-index: 100;
  	animation: t 1.75s infinite;
  }

  .monster__bottom {
  	position: absolute;
  	bottom: 0;
  	width: 100px;
  	height: 30px;
  	border-top-left-radius: 10px;
  	border-top-right-radius: 10px;
  	background-color: #ffffff;
  	z-index: 100;
  	animation: b 1.75s infinite;
  }


  .avatar-eye {
  	position: absolute;
  	top: -10%;
  	width: 65px;
  	height: 65px;
  	background: linear-gradient(105deg, white, #cb87f4);
  	border-radius: 100%;
  	box-shadow: 4px 8px 5px rgba(0, 0, 0, 0.2);
  	margin: 3px;
  	-webkit-transform: translateX(-50%);
  	transform: translateX(-50%);
  }


  .avatar-eye--green {
  	background: linear-gradient(to bottom, #fdfdfd, #c3efea);
  }

  .avatar-eye--violet {
  	background: linear-gradient(to bottom, #fdfdfd, #e6d6f6);
  }


  .eye--left {
  	left: 10%;
  }

  .eye--right {
  	left: 85%;
  }

  .eye--center {
  	left: 45%;
  	top: 10%;
  }

  .avatar-eye-pupil {
  	position: absolute;
  	width: 55%;
  	height: 55%;
  	left: 50%;
  	top: 25%;
  	-webkit-transform: translate(-50%);
  	transform: translate(-50%);
  	z-index: 100;
  	border-radius: 100%;
  }


  .pupil--green {
  	background: linear-gradient(135deg, rgba(188, 248, 177, 0.7), #2fa38c 75%);
  }

  .pupil--pink {
  	background: linear-gradient(135deg, #f1a183, #8535cd);
  }


  .avatar-eye-pupil-blackThing {
  	position: absolute;
  	width: 55%;
  	height: 55%;
  	left: 50%;
  	top: 25%;
  	background: #2c2f32;
  	-webkit-transform: translate(-50%);
  	transform: translate(-50%);
  	border-radius: 100%;
  	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
  }

  .avatar-eye-pupil-lightReflection {
  	position: absolute;
  	width: 7px;
  	height: 7px;
  	left: 25%;
  	top: 10%;
  	background: #ebebeb;
  	-webkit-transform: translate(-50%);
  	transform: translate(-50%);
  	border-radius: 100%;
  	box-shadow: 10px 10px 10px rgba(255, 255, 255, 0.2);
  }
  /*大嘴动起来*/
  @keyframes t {

  	0%,
  	10%,
  	80%,
  	100% {
  		top: -30px;
  	}

  	20% {
  		top: 0px;
  	}

  	30% {
  		top: -20px;
  	}

  	40% {
  		top: -0px;
  	}

  	50% {
  		top: -25px;
  	}

  	70% {
  		top: 0px;
  	}
  }

  @keyframes b {

  	0%,
  	10%,
  	80%,
  	100% {
  		bottom: -30px;
  	}

  	20% {
  		bottom: 0px;
  	}

  	30% {
  		bottom: -20px;
  	}

  	40% {
  		bottom: -0px;
  	}

  	50% {
  		bottom: -25px;
  	}

  	70% {
  		bottom: 0px;
  	}
  }

  @keyframes mouth {

  	0%,
  	10%,
  	100% {
  		width: 100%;
  		height: 0%;
  	}

  	15% {
  		width: 90%;
  		height: 30%;
  	}

  	20% {
  		width: 50%;
  		height: 70%;
  	}

  	25% {
  		width: 70%;
  		height: 70%;
  	}

  	30% {
  		width: 80%;
  		height: 60%;
  	}

  	35% {
  		width: 60%;
  		height: 70%;
  	}

  	40% {
  		width: 55%;
  		height: 75%;
  	}

  	45% {
  		width: 50%;
  		height: 90%;
  	}

  	50% {
  		width: 40%;
  		height: 70%;
  	}

  	55% {
  		width: 70%;
  		height: 95%;
  	}

  	60% {
  		width: 40%;
  		height: 50%;
  	}

  	65% {
  		width: 100%;
  		height: 60%;
  	}

  	70% {
  		width: 100%;
  		height: 70%;
  	}

  	75% {
  		width: 90%;
  		height: 70%;
  	}

  	80% {
  		width: 50%;
  		height: 70%;
  	}

  	85% {
  		width: 90%;
  		height: 50%;
  	}

  	85% {
  		width: 40%;
  		height: 70%;
  	}

  	90% {
  		width: 90%;
  		height: 30%;
  	}

  	95% {
  		width: 100%;
  		height: 10%;
  	}
  }

  @keyframes tongue {

  	0%,
  	20%,
  	100% {
  		bottom: -80px;
  	}

  	30%,
  	90% {
  		bottom: -40px;
  	}

  	40% {
  		bottom: -45px;
  	}

  	50% {
  		bottom: -50px;
  	}

  	70% {
  		bottom: -80px;
  	}

  	90% {
  		bottom: -40px;
  	}
  }

</style>
