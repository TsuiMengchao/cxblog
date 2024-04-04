<template>
  <view class="template-preferred tn-safe-area-inset-bottom">

    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed :bottomShadow="false" backTitle=" ">
      <view class="" @click="showModal">
        <text class="tn-text-lg">{{titles[params.type]}}</text>
        <text class="tn-text-xl tn-padding-left-sm tn-icon-notice-no"></text>
      </view>
    </tn-nav-bar>

    <view class="tn-flex tn-message-fixed" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
    	<view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius">
    	  <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center" @click="handleMessageNotice(0)">
    	    <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-blue tn-color-white">
    	      <view class="tn-icon-notice-fill" >
    	        <tn-badge backgroundColor="#E72F8C" fontColor="#FFFFFF" :absolute="true" :fontSize="16" v-if="messageCount.system > 0">
    	          <text>{{messageCount.system}}</text>
    	        </tn-badge>
    	      </view>
    	    </view>
    	    <view class="tn-color-black tn-text-center">
    	      <text class="tn-text-ellipsis">系统</text>
    	    </view>
    	  </view>
    	</view>
      <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius">
        <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center" @click="handleMessageNotice(1)">
          <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-orange tn-color-white">
            <view class="tn-icon-topics-fill">
              <tn-badge backgroundColor="#E72F8C" fontColor="#FFFFFF" :absolute="true" :fontSize="16" v-if="messageCount.comment  > 0">
                <text>{{messageCount.comment}}</text>
              </tn-badge>
            </view>
          </view>
          <view class="tn-color-black tn-text-center">
            <text class="tn-text-ellipsis">评论</text>
          </view>
        </view>
      </view>
      <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius">
        <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center" @click="handleMessageNotice(2)">
          <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-red tn-color-white">
            <view class="tn-icon-like-fill">
              <tn-badge backgroundColor="#E72F8C" fontColor="#FFFFFF" :absolute="true" :fontSize="16" v-if="messageCount.watch  > 0">
                <text>{{messageCount.watch}}</text>
              </tn-badge>
            </view>
          </view>
          <view class="tn-color-black tn-text-center">
            <text class="tn-text-ellipsis">关注</text>
          </view>
        </view>
      </view>
      <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius">
        <view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center" @click="handleMessageNotice(3)">
          <view class="icon1__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-bg-cyan tn-color-white">
            <view class="tn-icon-praise-fill">
              <tn-badge backgroundColor="#E72F8C" fontColor="#FFFFFF" :absolute="true" :fontSize="16" v-if="messageCount.like  > 0">
                <text>{{messageCount.like}}</text>
              </tn-badge>
            </view>
          </view>
          <view class="tn-color-black tn-text-center">
            <text class="tn-text-ellipsis">点赞</text>
          </view>
        </view>
      </view>

    </view>

	<tn-modal v-model="show1" :custom="true">
	  <view class="custom-modal-content">
	    <view class="tn-text-center tn-padding-top-sm tn-text-xxl tn-text-bold">提 示</view>
	    <view class="tn-text-center tn-padding-top tn-text-lg tn-color-gray">确定将所有消息标为已读吗？</view>
	    <view class="tn-flex tn-flex-row-between tn-margin-top-xl">
	      <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
	        <tn-button backgroundColor="#00FFC6" padding="40rpx 0" width="90%" shadow fontBold shape="round" @click="show1 = !show1">
	          <text class="tn-color-black">取 消</text>
	        </tn-button>
	      </view>
	      <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
	        <tn-button backgroundColor="#FFF00D" padding="40rpx 0" width="90%" shadow fontBold shape="round" @click="handleMarkReadMessage(null)">
	          <text class="tn-color-black">确 定</text>
	        </tn-button>
	      </view>
	    </view>
	  </view>
	</tn-modal>

	<view  class="tn-safe-area-inset-bottom tn-margin-bottom-sm" style="margin-top: 260rpx;	padding-bottom: 150px;" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
	  <tn-swipe-action id="message">
	    <tn-swipe-action-item  v-for="(item,index) in messageList" :key="item.id" :name="index" :options="options" @click="handleClick">
	      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-padding">
	        <view class="justify-content-item">
	          <view class="tn-flex tn-flex-col-center tn-flex-row-left">
	            <view class="logo-pic">
	              <view class="logo-image">
	                <view v-if="params.type" class="tn-shadow-blur" :style="'background-image:url(' + item.fromUserAvatar + ');width: 110rpx;height: 110rpx;background-size: cover;'">
	                </view>
					<view v-else class="tn-shadow-blur" style="background-image:url(https://cxblog.qiniu.zhaohaoyue.love/9cf1222617fd4fa197991476a53cc883.jpg);width: 110rpx;height: 110rpx;background-size: cover;">
					</view>
	              </view>
	            </view>
	            <view class="tn-padding-right tn-color-black" >
	              <view class="tn-padding-right tn-padding-left-sm tn-text-lg">
					<span v-if="params.type == 0">
						系统
					</span>
					<span v-else>
						{{item.fromUserNickname}}
					</span>

	              </view>
	              <view class="tn-padding-right  tn-padding-top-xs tn-text-ellipsis tn-padding-left-sm tn-text-ellipsis" >
					  <text  class="tn-color-grey" v-if="params.type == 2">
						  关注了您
					  </text>
					  <view  class="tn-color-grey " v-if="params.type == 3" style="width: calc(100% - 45px);">
					  		点赞了你的文章： “{{item.articleTitle}}”
					  </view>
						<view v-if="params.type == 0 || params.type == 1" class="tn-color-grey" v-html="item.content"></view>
	              </view>
	            </view>
	          </view>
	        </view>
	        <view class="justify-content-item"  >
	          <view class="tn-flex tn-flex-row-right">
	            <view class="">{{item.createTime}}</view>
	          </view>
	          <view class="tn-flex tn-flex-row-right" v-if="!item.isRead">
	            <tn-badge backgroundColor="tn-cool-bg-color-1" fontColor="tn-color-white" :radius="20" margin="5rpx 0rpx 5rpx 5rpx"></tn-badge>
	          </view>
	        </view>
	      </view>
	    </tn-swipe-action-item>
		   <uni-load-more class="loadMore" :status="status" :content-text="contentText" />
	  </tn-swipe-action>
	</view>

    <view class='tn-tabbar-height'></view>

  </view>
</template>

<script>
	import {
		getMessageNotice,
		getNewSystemNotice,
		deleteMessage,
		markReadMessageNoticeApplet
	} from '@/api/im.js'
  import page_mixin from '@/libs/mixin/page_mixin.js'
	export default {
    name: 'TemplateMessage',
    mixins: [page_mixin],
		data() {
			return {
				contentText: {
					contentdown: '查看更多',
					contentrefresh: '加载中',
					contentnomore: '没有更多内容了'
				},
				status: "more",
				params:{
					pageNo:1,
					pageSize:10,
					type:0
				},
				pages:0,
				messageList:[],
				show1: false,
				options: [{
				    icon: 'success',
				    style: {
				      backgroundColor: '#FFA726',
				      width: '80rpx',
				      height: '80rpx',
				      margin: '0 12rpx',
				      borderRadius: '100rpx'
				    }
				  },
				  {
				    icon: 'delete',
				    style: {
				      backgroundColor: '#E83A30',
				      width: '80rpx',
				      height: '80rpx',
				      margin: '0 12rpx',
				      borderRadius: '100rpx'
				    }
				  }
				],
				messageCount:{},
				titles:["系统","评论","关注","点赞"]
			}
		},
		created() {
			this.onLoadShow()
		},
		methods: {
			onLoadShow(){
				this.params.pageNo = 1
				this.getMessageNotice()
				getNewSystemNotice().then(res =>{
					if(res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					this.messageCount = res.data
				})
			},
			handleMarkReadMessage(val){
				this.$tn.message.loading('加载中')
				let params
				if(val != null) {
					if(val.isRead) {
						this.$tn.message.toast('无需重复标记')
						return
					}
					params = {
						id:val.id
					}
				}
				markReadMessageNoticeApplet(params).then(res =>{
					this.$tn.message.closeLoading()
					this.errorResponse(res);
					this.show1 = false
					if(val) {
						val.isRead = 1
						if(this.params.type == 1) {
							this.messageCount.comment--
						}else if(this.params.type == 2) {
							this.messageCount.watch--
						}else if(this.params.type == 3) {
							this.messageCount.like--
						}else{
							this.messageCount.system--
						}
					}else{
						this.getMessageNotice()
						this.messageCount = {}
					}
					this.$tn.message.toast('标记成功')
				})
			},
			errorResponse(res){
				if(res.code != 200) {
					this.$tn.message.toast(res.message)
					return
				}
			},
			handleClick(val){
				if(val.index == 0) {
					let params = {
						id:this.messageList[val.name]
					}
					this.handleMarkReadMessage(this.messageList[val.name]);
					return
				}
				if(val.index == 1) {
					let params = {
						type:this.params.type,
						id:this.messageList[val.name]
					}
					deleteMessage(params).then(res =>{
						this.errorResponse(res)
						this.$delete(this.messageList, val.name);

					    this.$tn.message.toast('删除成功')
					})
					return
				}


			},
			getMessageNotice(){
				this.messageList=[]
				this.$tn.message.loading("加载中")
				getMessageNotice(this.params).then(res =>{
					this.$tn.message.closeLoading()
					if(res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					this.messageList = res.data.records
					this.pages = res.data.pages
					this.status = this.params.pageNo == this.pages || !this.pages ? "noMore" : "more"

				})
			},
			handleMessageNotice(type){
				if(this.params.type == type ){
					return
				}

				this.params.type = type;
				this.params.pageNo = 1
				this.getMessageNotice()
			},
			handlePage(val){
				if (this.status == "noMore") {
					return
				}
				this.$tn.message.loading('加载中')
				this.status = "loading";
				this.params.pageNo++;
				getMessageNotice(this.params).then(res => {
					this.$tn.message.closeLoading()
					this.messageList.push(...res.data.records)
					this.pages = res.data.pages
					this.status = this.params.pageNo == this.pages || !this.pages ? "noMore" : "more"
				})
			},
		  // 弹出模态框
		  showModal(event) {
			this.openModal()
		  },
		  // 打开模态框
		  openModal() {
			this.show1 = true
		  },
		}
	}
</script>

<style lang="scss" scoped>
  .template-preferred {
    // background-color: $tn-bg-gray-color;
    max-height: 100vh;
  }
  .tn-tabbar-height {
  	min-height: 120rpx;
  	height: calc(140rpx + env(safe-area-inset-bottom) / 2);
  }

  .tn-message-fixed{
    position: fixed;
    background-color: rgba(255,255,255,1);
    box-shadow: 0rpx 0rpx 30rpx 0rpx rgba(0, 0, 0, 0.07);
    top: 0;
    width: 100%;
    transition: all 0.25s ease-out;
    z-index: 100;
  }

  /* 图标容器1 start */
  .icon1 {
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
        width: 90rpx;
        height: 90rpx;
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
          background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg5.png);
        }
      }
    }
  }

  /* 用户头像 start */
  .logo-image {
    width: 90rpx;
    height: 90rpx;
    position: relative;
  }

  .logo-pic {
    background-size: cover;
    background-repeat: no-repeat;
    // background-attachment:fixed;
    background-position: top;
    // box-shadow: 0rpx 0rpx 80rpx 0rpx rgba(0, 0, 0, 0.15);
    border-radius: 50%;
    overflow: hidden;
    // background-color: #FFFFFF;
  }
</style>


