<template>
  <view class="template-login">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <view class="login">
      <!-- 顶部背景图片-->
      <view class="login__bg login__bg--top">
        <image class="bg" src="https://resource.tuniaokj.com/images/login/1/login_top2.jpg" mode="widthFix"></image>
      </view>
      <view class="login__bg login__bg--top">
        <image class="rocket rocket-sussuspension" src="https://resource.tuniaokj.com/images/login/1/login_top3.png" mode="widthFix"></image>
      </view>

      <view class="login__wrapper">
        <!-- 登录/注册切换 -->
        <view class="login__mode tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-center">
          <view class="login__mode__item tn-flex-1" :class="[{'login__mode__item--active': currentModeIndex === 0}]" @tap.stop="modeSwitch(0)">
            登录
          </view>
          <view class="login__mode__item tn-flex-1" :class="[{'login__mode__item--active': currentModeIndex === 1}]" @tap.stop="modeSwitch(1)">
            注册
          </view>

          <!-- 滑块-->
          <view class="login__mode__slider tn-cool-bg-color-15--reverse" :style="[modeSliderStyle]"></view>
        </view>

        <!-- 输入框内容-->
        <view class="login__info tn-flex tn-flex-direction-column tn-flex-col-center tn-flex-row-center">
          <!-- 登录 -->
          <block v-if="currentModeIndex === 0">
            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-phone"></view>
              </view>
              <view class="login__info__item__input__content">
                <input v-model="login.username" maxlength="20" placeholder-class="input-placeholder" placeholder="请输入账号/邮箱" />
              </view>
            </view>

            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-lock"></view>
              </view>
              <view class="login__info__item__input__content">
                <input :password="!showPassword" v-model="login.password" placeholder-class="input-placeholder" placeholder="请输入登录密码" />
              </view>
              <view class="login__info__item__input__right-icon" @click="showPassword = !showPassword">
                <view :class="[showPassword ? 'tn-icon-eye' : 'tn-icon-eye-hide']"></view>
              </view>
            </view>
          </block>
          <!-- 注册 -->
          <block v-if="currentModeIndex === 1">
            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-phone"></view>
              </view>
              <view class="login__info__item__input__content">
                <input v-model="register.email" maxlength="20" placeholder-class="input-placeholder" placeholder="请输入账号/邮箱" />
              </view>
            </view>

			<view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
			  <view class="login__info__item__input__left-icon">
			    <view class="tn-icon-my"></view>
			  </view>
			  <view class="login__info__item__input__content">
			    <input v-model="register.username" maxlength="20" placeholder-class="input-placeholder" placeholder="请输入用户名" />
			  </view>
			</view>

            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-code"></view>
              </view>
              <view class="login__info__item__input__content login__info__item__input__content--verify-code">
                <input v-model="register.code" placeholder-class="input-placeholder" placeholder="请输入验证码" />
              </view>
              <view class="login__info__item__input__right-verify-code" @tap.stop="getCode">
                <tn-button backgroundColor="#01BEFF" fontColor="#FFFFFF" size="sm" padding="5rpx 10rpx" width="100%" shape="round">{{ tips }}</tn-button>
              </view>
            </view>

            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-lock"></view>
              </view>
              <view class="login__info__item__input__content">
                <input v-model="register.password" :password="!showPassword" placeholder-class="input-placeholder" placeholder="请输入登录密码" />
              </view>
              <view class="login__info__item__input__right-icon" @click="showPassword = !showPassword">
                <view :class="[showPassword ? 'tn-icon-eye' : 'tn-icon-eye-hide']"></view>
              </view>
            </view>
          </block>

          <!-- 忘记密码 -->
          <block v-if="currentModeIndex === 5">
            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-phone"></view>
              </view>
              <view class="login__info__item__input__content">
                <input v-model="forget.email" maxlength="20" placeholder-class="input-placeholder" placeholder="请输入账号/邮箱" />
              </view>
            </view>

            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-code"></view>
              </view>
              <view class="login__info__item__input__content login__info__item__input__content--verify-code">
                <input v-model="register.code" placeholder-class="input-placeholder" placeholder="请输入验证码" />
              </view>
              <view class="login__info__item__input__right-verify-code" @tap.stop="getCode">
                <tn-button backgroundColor="#01BEFF" fontColor="#FFFFFF" size="sm" padding="5rpx 10rpx" width="100%" shape="round">{{ tips }}</tn-button>
              </view>
            </view>

            <view class="login__info__item__input tn-flex tn-flex-direction-row tn-flex-nowrap tn-flex-col-center tn-flex-row-left">
              <view class="login__info__item__input__left-icon">
                <view class="tn-icon-lock"></view>
              </view>
              <view class="login__info__item__input__content">
                <input v-model="register.password" :password="!showPassword" placeholder-class="input-placeholder" placeholder="请输入登录密码" />
              </view>
              <view class="login__info__item__input__right-icon" @click="showPassword = !showPassword">
                <view :class="[showPassword ? 'tn-icon-eye' : 'tn-icon-eye-hide']"></view>
              </view>
            </view>
          </block>

          <view class="tn-flex login__info__item__button">
            <view class="tn-flex-1 justify-content-item tn-text-center">
              <tn-button v-if="currentModeIndex === 0" shape="round" backgroundColor="tn-cool-bg-color-7--reverse" padding="40rpx 0" width="100%" shadow fontBold @click="handleLogin">
                <text class="tn-color-white" hover-class="tn-hover" :hover-stay-time="150">
                  登 录
                </text>
              </tn-button>
              <tn-button v-if="currentModeIndex === 1" shape="round" backgroundColor="tn-cool-bg-color-7--reverse" padding="40rpx 0" width="100%" shadow fontBold @click="handleRegister">
                <text class="tn-color-white" hover-class="tn-hover" :hover-stay-time="150">
                  注 册
                </text>
              </tn-button>
			  <tn-button v-if="currentModeIndex === 5" shape="round" backgroundColor="tn-cool-bg-color-7--reverse" padding="40rpx 0" width="100%" shadow fontBold @click="forgetPassword">
			    <text class="tn-color-white" hover-class="tn-hover" :hover-stay-time="150">
			      修 改
			    </text>
			  </tn-button>
            </view>
          </view>

          <!-- <view class="login__info__item__button tn-cool-bg-color-7--reverse" hover-class="tn-hover" :hover-stay-time="150">{{ currentModeIndex === 0 ? '登录' : '注册'}}</view> -->

          <view v-if="currentModeIndex === 0" class="login__info__item__tips"  @tap.stop="modeSwitch(5)">忘记密码?</view>
        </view>

        <!-- 其他登录方式 -->
        <view v-if="uniPlatform == 'mp-weixin'" class="login__way tn-flex tn-flex-col-center tn-flex-row-center">
          <view class="tn-padding-sm tn-margin-xs" @click="handleAuthorization">
            <view class="login__way__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-green tn-color-white">
              <view class="tn-icon-wechat-fill"></view>
            </view>
          </view>
          <view class="tn-padding-sm tn-margin-xs">
            <view class="login__way__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-blue tn-color-white">
              <view class="tn-icon-qq"></view>
            </view>
          </view>
        </view>
      </view>


      <!-- 底部背景图片-->
      <view class="login__bg login__bg--bottom">
        <image src="https://resource.tuniaokj.com/images/login/1/login_bottom_bg.jpg" mode="widthFix"></image>
      </view>
    </view>

    <!-- 验证码倒计时 -->
    <tn-verification-code
      ref="code"
      uniqueKey="login-demo-1"
      :seconds="60"
      @change="codeChange">
    </tn-verification-code>
	 <tn-toast ref="toast"></tn-toast>
  </view>
</template>

<script>
	import {
		doLogin,
		appletLogin,
		 sendEmailCode,
		 emailRegister,
		 forgetPassword
	} from '@/api/login.js'
  import page_mixin from '@/libs/mixin/page_mixin.js'
  export default {
    name: 'templateLogin',
    mixins: [page_mixin],
    data() {
      return {
        // 当前选中的模式
        currentModeIndex: 0,
        // 模式选中滑块
        modeSliderStyle: {
          left: 0
        },
        // 是否显示密码
        showPassword: false,
        // 倒计时提示文字
        tips: '获取验证码',
		login:{
			username:"",
			password:""
		},
		register: {
			email:"",
			username:"",
			code: "",
			password: "",
			nickname: "uniapp用户"
		},
		forget: {
			email:"",
			code: "",
			password: ""
		},
		uniPlatform: uni.getSystemInfoSync().uniPlatform
      }
    },
    watch: {
      currentModeIndex(value) {
        const sliderWidth = uni.upx2px(476 / 2)
        this.modeSliderStyle.left = `${sliderWidth * value}px`
      }
    },
    methods: {
		handleCancelAuthorization(){
			this.show = false
			this.$tn.message.toast('授权已取消')
		},
		handleAuthorization(){
			this.$tn.message.loading('授权中')
			 uni.login({
				provider: 'weixin',
				success: async (res) => {
				  this.code = res.code;
				  if (res.errMsg == 'login:ok') {
					appletLogin({code:res.code}).then(response =>{
						this.$tn.message.closeLoading()
						if(response.code != 200) {
							this.$refs.toast.show({
								  content: response.message,
								  icon: 'close-moment',
								  image: '',
								  duration: 1500
							})
							return
						}
						uni.setStorage({
							key:"token",
							data:response.data.token
						})
						uni.setStorage({
							key:"user",
							data:response.data
						})
            this.$store.commit("setUserInfo", response.data)
						this.show = false
						uni.navigateTo({
							url:"/pages/index"
						})
					})
				  }
				},
			 });
		},
		wxLogin(){
		  uni.getUserProfile({
			desc: '登录后可同步数据',
			success: async (obj) => {
				this.wxUser = obj.userInfo
				this.show = true
			},
		  });
		},
		handleLogin(){
			if(!this.login.username || !this.login.password) {
				this.$refs.toast.show({
				      content: '请输入账号或密码',
				      icon: 'close-moment',
				      image: '',
				      duration: 1500
				})
				return
			}
			doLogin(this.login).then(res =>{
				if(res.code != 200) {
					this.$refs.toast.show({
				          content: res.message,
				          icon: 'close-moment',
				          image: '',
				          duration: 1500
					})
					return
				}
				uni.setStorage({
					key:"token",
					data:res.data.token
				})
				uni.setStorage({
					key:"user",
					data:res.data
				})
        this.$store.commit("setUserInfo", res.data)
				uni.navigateTo({
					url:"/pages/index"
				})
			})
		},
		handleRegister() {
			emailRegister(this.register).then(res => {
				this.$refs.toast.show({
				      content: res.message,
				      icon: 'close-moment',
				      image: '',
				      duration: 1500
				})
				this.currentModeIndex = 1
			})
		},
		forgetPassword() {
			forgetPassword(this.forget).then(res => {
				this.$refs.toast.show({
				      content: res.message,
				      icon: 'close-moment',
				      image: '',
				      duration: 1500
				})
				this.currentModeIndex = 1
			})
		},
      // 跳转
      tn(e) {
      	uni.navigateTo({
      		url: e,
      	});
      },
      // 切换模式
      modeSwitch(index) {
        this.currentModeIndex = index
        this.showPassword = false
		this.register.code = ""
		this.forget.code = ""
      },
      // 获取验证码
      getCode() {
        if (this.$refs.code.canGetCode) {
			if ((this.register.email == null || this.register.email == '') && (this.forget.email == null || this.forget.email == '')) {
				this.$tn.message.toast('请输入邮箱');
				return
			}
			var email = ""
          this.$tn.message.loading('正在获取验证码')
		  if (this.currentModeIndex === 5) {
			  email = this.forget.email
		  } else {
			  email = this.register.email
		  }
		  sendEmailCode(email).then(res =>{
				setTimeout(() => {
							this.$refs.toast.show({
							      content: '验证码已经发送',
							      icon: 'success',
							      duration: 1500
							})
				  // 通知组件开始计时
				  this.$refs.code.start()
				}, 2000)
			})
			this.$tn.message.closeLoading()
        } else {
          this.$tn.message.toast(this.$refs.code.secNum + '秒后再重试')
        }
      },
      // 获取验证码倒计时被修改
      codeChange(event) {
        this.tips = event
      }
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

  /* 悬浮 */
  .rocket-sussuspension{
    animation: suspension 3s ease-in-out infinite;
  }

  @keyframes suspension {
    0%, 100% {
      transform: translate(0 , 0);
    }
    50% {
      transform: translate(-0.8rem , 1rem);
    }
  }

  .login {
    position: relative;
    height: 100%;
    z-index: 1;

    /* 背景图片 start */
    &__bg {
      z-index: -1;
      position: fixed;

      &--top {
        top: 0;
        left: 0;
        right: 0;
        width: 100%;

        .bg {
          width: 750rpx;
          will-change: transform;
        }
        .rocket {
          margin: 50rpx 28%;
          width: 400rpx;
          will-change: transform;
        }
      }

      &--bottom {
        bottom: -10rpx;
        left: 0;
        right: 0;
        width: 100%;
        // height: 144px;
        // margin-bottom: env(safe-area-inset-bottom);

        image {
          width: 750rpx;
          will-change: transform;
        }
      }
    }
    /* 背景图片 end */

    /* 内容 start */
    &__wrapper {
      margin-top: 403rpx;
      width: 100%;
    }

    /* 切换 start */
    &__mode {
      position: relative;
      margin: 0 auto;
      width: 476rpx;
      height: 77rpx;
      background-color: rgba(255,255,255,0.9);
      box-shadow: 0rpx 10rpx 50rpx 0rpx rgba(0, 3, 72, 0.1);
      border-radius: 39rpx;

      &__item {
        height: 77rpx;
        width: 100%;
        line-height: 77rpx;
        text-align: center;
        font-size: 31rpx;
        color: #78909C;
        letter-spacing: 1em;
        text-indent: 1em;
        z-index: 2;
        transition: all 0.4s;

        &--active {
          font-weight: bold;
          color: #FFFFFF;
        }
      }

      &__slider {
        position: absolute;
        height: inherit;
        width: calc(476rpx / 2);
        border-radius: inherit;
        box-shadow: 0rpx 18rpx 72rpx 18rpx rgba(0, 195, 255, 0.1);
        z-index: 1;
        transition: all 0.3s cubic-bezier(0.68, -0.55, 0.265, 1.55);
      }
    }
    /* 切换 end */

    /* 登录注册信息 start */
    &__info {
      margin: 0 30rpx;
      margin-top: 105rpx;
      padding: 30rpx 51rpx;
      padding-bottom: 0;
      border-radius: 20rpx;
      background-color: rgba(255,255,255,0.9);
      box-shadow: 0rpx 0rpx 80rpx 0rpx rgba(0, 0, 0, 0.07);

      &__item {

        &__input {
          margin-top: 59rpx;
          width: 100%;
          height: 77rpx;
          border: 1rpx solid #C6D1D8;
          border-radius: 39rpx;

          &__left-icon {
            width: 10%;
            font-size: 44rpx;
            margin-left: 20rpx;
            color: #78909C;
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
            font-size: 44rpx;
            margin-right: 20rpx;
            color: #78909C;
          }

          &__right-verify-code {
            width: 34%;
            margin-right: 20rpx;
          }
        }

        &__button {
          margin-top: 75rpx;
          margin-bottom: 39rpx;
          width: 100%;
          letter-spacing: 0.5em;
        }

        &__tips {
          margin: 30rpx 0;
          color: #AAAAAA;
        }
      }
    }
    /* 登录注册信息 end */

    /* 登录方式切换 start */
    &__way {
      margin: 0 auto;
      margin-top: 110rpx;

      &__item {
        &--icon {
          width: 77rpx;
          height: 77rpx;
          font-size: 50rpx;
          border-radius: 100rpx;
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
            background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg5.png);
          }
        }
      }
    }
    /* 登录方式切换 end */
    /* 内容 end */

  }

  /deep/.input-placeholder {
    font-size: 30rpx;
    color: #C6D1D8;
  }

</style>
