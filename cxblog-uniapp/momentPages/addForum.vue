<template>
	<view class="template-create tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>

    <view class="tn-safe-area-inset-bottom" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <!--      #ifdef H5 || APP-PLUS-->
      <view class="tn-margin tn-bg-gray--light tn-padding" style="border-radius: 10rpx;">
        <textarea v-model="formData.content" maxlength="500" placeholder="请输入讨论内容啊"
          placeholder-style="color:#AAAAAA"></textarea>
      </view>

      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-padding-top-xl tn-margin">
        <view class="tn-flex justify-content-item">
          <view class="tn-bg-black tn-color-white tn-text-center" style="border-radius: 100rpx;margin-right: 8rpx;width: 45rpx;height: 45rpx;line-height: 45rpx;">
            <text class="tn-icon-image" style="font-size: 30rpx;"></text>
          </view>
          <view class="tn-text-lg tn-padding-right-xs tn-text-bold">图片</view>
        </view>
        <view class="justify-content-item tn-text-df tn-color-grey" @tap="clear">
          <text class="tn-padding-xs">清空上传</text>
          <text class="tn-icon-delete"></text>
        </view>
      </view>

      <view class="tn-margin-left tn-padding-top-xs">
        <tn-image-upload-drag
          ref="imageUpload"
          :action="action"
          :width="236"
          :height="236"
          :formData="imageData"
          :fileList="fileList"
          :disabled="disabled"
          :autoUpload="autoUpload"
          :maxCount="maxCount"
          :showUploadList="showUploadList"
          :showProgress="showProgress"
          :deleteable="deleteable"
          :customBtn="customBtn"
          :header="header"
          name="multipartFile"
          @sort-list="onSortList"
        />

      </view>

      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-padding-top-xl tn-margin">
        <view class="tn-flex justify-content-item">
          <view class="tn-bg-black tn-color-white tn-text-center" style="border-radius: 100rpx;margin-right: 8rpx;width: 45rpx;height: 45rpx;line-height: 45rpx;">
            <text class="tn-icon-location" style="font-size: 30rpx;"></text>
          </view>
          <view class="tn-text-lg tn-padding-right-xs tn-text-bold">链接</view>
        </view>
      </view>
      <view class="tn-margin tn-bg-gray--light" style="border-radius: 10rpx;padding: 20rpx 30rpx;">
        <input placeholder="请填写链接标题 (12字内)" v-model="formData.site.title" name="input" placeholder-style="color:#AAAAAA" ></input>
      </view>
      <view class="tn-margin tn-bg-gray--light" style="border-radius: 10rpx;padding: 20rpx 30rpx;">
        <input placeholder="请填写链接地址" v-model="formData.site.url" name="input" placeholder-style="color:#AAAAAA" ></input>
      </view>

      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-padding-top-xl tn-margin">
        <view class="tn-flex justify-content-item">
          <view class="tn-bg-black tn-color-white tn-text-center" style="border-radius: 100rpx;margin-right: 8rpx;width: 45rpx;height: 45rpx;line-height: 45rpx;">
            <text class="tn-icon-tag" style="font-size: 30rpx;"></text>
          </view>
          <view class="tn-text-lg tn-padding-right-xs tn-text-bold">话题</view>
        </view>
        <view class="justify-content-item tn-text-df tn-color-grey" @click="()=>{selectShow = !selectShow}">
          <text class="tn-padding-xs">{{formData.talkName}}</text>
          <text class="tn-icon-right"></text>
        </view>
      </view>

      <tn-select v-model="selectShow" mode="single" :list="talkList" @confirm="confirm">
      </tn-select>

      <!-- 悬浮按钮-->
      <view class="tn-flex tn-footerfixed">
        <view class="tn-flex-1 justify-content-item tn-margin-sm tn-text-center">
          <tn-button backgroundColor="#00FFC6" padding="40rpx 0" width="60%" shadow fontBold @tap="submit">
            <!-- <text class="tn-icon-light tn-padding-right-xs tn-color-black"></text> -->
            <text class="tn-color-black">发 起</text>
            <text class="tn-icon-flag tn-padding-left-xs tn-color-black"></text>
          </tn-button>
        </view>
      </view>
<!--      #endif-->

      <!--      #ifndef H5 || APP-PLUS-->
      <view>此功能专为H5和APP端用户打造，小程序/快应用无权使用本功能</view>
      <!--      #endif-->
    </view>

    <view class='tn-tabbar-height'></view>

	</view>
</template>

<script>
  import page_mixin from '@/libs/mixin/page_mixin.js'
  import {getTalkList} from "@/api/talk.js";
  import TnInput from "@/tuniao-ui/components/tn-input/tn-input.vue";
  import {addForum} from "@/api/talk";
	export default {
    name: 'TemplateCreate',
    components: {TnInput},
    mixins: [page_mixin],
		data() {
			return {
				action: 'https://server.cxblog.zhaohaoyue.love/api/file/upload',
        // action: 'http://127.0.0.1:8000/api/file/upload',
        selectShow: false,
				formData: {
          content: "",
          site: {url: "",
          title: ""},
          imgUrl: "",
          talkId: null,
          talkName: "选择"
				},
        header:{"Authorization":uni.getStorageSync("token")},
        fileList: [],
        imageData: {
        },
        talkList: [],
				showUploadList: true,
				customBtn: false,
				autoUpload: true,
				showProgress: false,
				deleteable: true,
				customStyle: false,
				maxCount: 9,
				disabled: false,
			}
		},
    created() {
      getTalkList().then(respose => {
        var talkList = []
        respose.data.forEach((item)=>{
          talkList.push({value:item.id, label:item.name})
        })
        this.talkList= talkList
      })
    },
		onLoad() {

		},
		methods: {
      // 跳转
      tn(e) {
      	uni.navigateTo({
      		url: e,
      	});
      },
      // 手动上传文件
      upload() {
        this.$refs.imageUpload.upload()
      },
      // 手动清空列表
      clear() {
        this.$refs.imageUpload.clear()
      },
      // 图片拖拽重新排序
      onSortList(list) {
        console.log(list);
      },
      submit() {
        var formData = {...this.formData}
        if (formData.content == null || formData.content == "") {
          this.$tn.message.toast("内容不能为空！");
          return;
        }
        this.$tn.message.loading('加载中')

        if (formData.site.url) {
          formData.site = JSON.stringify(formData.site)
        } else{
          formData.site = null
        }
        this.$refs.imageUpload.lists.forEach((item)=>{
          formData.imgUrl += item.data.response.data + ","
        })
        addForum(formData).then(res => {
          this.$tn.message.toast("发布成功");
          this.$tn.message.closeLoading()
          setTimeout(()=>{
            this.goBack()
          },1000)

        }).catch(err => {
          this.$tn.message.toast(err.message);
          this.$tn.message.closeLoading()
        })
      },
      // 注意返回值为一个数组，单列时取数组的第一个元素即可(只有一个元素)
      confirm(e) {
        this.formData.talkId = e[0].value
        this.formData.talkName = e[0].label
      }
		}
	}
</script>

<style lang="scss" scoped>
	.template-edit{
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

  /* 标签内容 start*/
  .tn-tag-content {
    &__item {
      display: inline-block;
      line-height: 45rpx;
      padding: 10rpx 30rpx;
      margin: 20rpx 20rpx 5rpx 0rpx;

      &--prefix {
        padding-right: 10rpx;
      }
    }
  }
  /* 标签内容 end*/
</style>
