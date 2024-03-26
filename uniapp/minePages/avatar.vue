<template>
  <view class="template-avatar tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed>头像</tn-nav-bar>

    <view :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <view class="cropper-options">
        <button v-if="uniPlatform == 'mp-weixin'" style="background: none;border-radius: 0;margin-left: 0;margin-right: 0;line-height: inherit;" class="cropper-options__item"  open-type="chooseAvatar" @chooseavatar="onChooseAvatar" >选择图片</button>
        <button v-else style="background: none;border-radius: 0;margin-left: 0;margin-right: 0;line-height: inherit;" class="cropper-options__item"  open-type="chooseAvatar" @click="chooseImage" >选择图片</button>
        <view class="cropper-options__item" @tap="switchBorderRect">{{ switchText }}</view>
      </view>

    </view>

    <tn-cropper
      :imageUrl="imageUrl"
      :isRound="isRound"
      @cropper="cropperFinish"
    ></tn-cropper>

    <tn-popup
      v-model="showCropperImage"
      :marginTop="vuex_custom_bar_height"
      length="80%"
      mode="center"
      :closeBtn="true"
    >
      <view class="tn-flex tn-flex-col-center tn-flex-row-center" style="margin: 40rpx 60rpx;">
        <image :src="cropperImageUrl" style="width: 80%;" mode="widthFix"></image>
      </view>
    </tn-popup>
  </view>
</template>

<script>
  import multipleOptionsDemo from '@/libs/components/multiple-options-demo'
    import {updateUserInfo} from '@/api/user'
  export default {
    name: 'TemplateAvatar',
    components: { multipleOptionsDemo },
    data() {
      return {
        imageUrl: '',
        isRound: true,
        switchText: '切换为正方形裁剪框',
        showCropperImage: false,
        cropperImageUrl: '',
		avatarUrl:null,
		uniPlatform: uni.getSystemInfoSync().uniPlatform
      }
    },
    methods: {
		// 点击头像
		async onChooseAvatar(e) {
			// 获取到的图片是临时图片，只能在本地访问，
			this.imageUrl = e.detail.avatarUrl;
		},

      // 选择图片
      chooseImage() {
        uni.chooseImage({
          count: 1,
          sizeType: ['original', 'compressed'],
          sourceType: ['album','camera'],
          success: (res) => {
            const tempFilePaths = res.tempFilePaths[0]
            this.imageUrl = tempFilePaths
          }
        })
      },
      // 切换裁剪框形状
      switchBorderRect() {
        this.isRound = !this.isRound
        if (this.isRound) {
          this.switchText = '切换为正方形裁剪框'
        } else {
          this.switchText = '切换为圆形裁剪框'
        }
      },

      // 裁剪完成
      cropperFinish(val) {
        this.showCropperImage = true
        if (val.url) {
          this.cropperImageUrl = val.url
        }
        if (val.base64) {
          this.cropperImageUrl = `${val.base64}`
        }
		// 调用uni.uploadFile方法上传文件
		uni.uploadFile({
		  // url: 'http://127.0.0.1:8000/api/file/upload',
		  url: 'https://server.cxblog.zhaohaoyue.love/api/file/upload',
		  filePath: val.url,
		  name: 'multipartFile', // 文件对应的key，服务端需要这个key来获取这个文件
		  header:{
			Authorization:uni.getStorageSync("token"),//加入token
		  },
		  success: (uploadFileRes) => {
			  let data = JSON.parse(uploadFileRes.data)
		    if(data.code != 200) {
			  this.$tn.message.toast('图片上传失败')
			  return
		    }
			updateUserInfo({avatar:data.data}).then(res =>{
				if(res.code != 200) {
					this.$tn.message.toast('修改失败')
					return
				}
				let userInfo = uni.getStorageSync("user")
				userInfo.avatar = data.data
				uni.setStorageSync("user", userInfo)
				this.$tn.message.toast('修改成功')
				// 关闭当前页，返回上一页面或多级页面。
				uni.redirectTo({
				url: "/pages/index"
				});
			})
		  },
		  fail: (error) => {
			console.error(error);
		  },
		});


      }
    }
  }
</script>

<style lang="scss" scoped>
  .cropper-options {
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    margin-top: 90rpx;

    &__item {
      color: #FFFFFF;
      font-size: 28rpx;
      padding: 18rpx 56rpx;
      border: 2rpx solid #FFFFFF;
      z-index: 1000;

      &:nth-child(1) {
        border-right: none;
      }
    }
  }
</style>
