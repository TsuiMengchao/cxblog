<template>
	<view class="template-details tn-safe-area-inset-bottom container">
	  <!-- 顶部自定义导航 -->
	  <tn-nav-bar fixed alpha customBack>
	    <view slot="back" class='tn-custom-nav-bar__back'>
	      <text class='icon tn-icon-left' @click="toLastBack"></text>
	      <text class='icon tn-icon-home-capsule-fill' @click="goBack"></text>
	    </view>
	  </tn-nav-bar>
	  
	  <view class="" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
		  <view class="title tn-text-center" >
		  	<h2>{{ article.title }}</h2>
		  </view>
	    <!-- 图文信息 -->
	  <view class="blogger__item">
		<view class="blogger__author tn-flex tn-flex-row-between tn-flex-col-center">
		  <view class="justify__author__info">
			<view class="tn-flex tn-flex-row-center">
			  <view class="tn-flex tn-flex-row-center tn-flex-col-center">
				<view class="">
				  <tn-avatar
					class=""
					shape="circle"
					:src="userInfo.avatar"
					size="lg">
				  </tn-avatar>
				</view>
				<view class="tn-padding-right tn-text-ellipsis">
				  <view class="tn-padding-right tn-padding-left-sm tn-text-bold tn-text-lg">{{ userInfo.nickname }}</view>
				  <view class="tn-padding-right tn-padding-left-sm tn-padding-top-xs tn-color-gray">{{ formatDate(article.createTime )}}</view>
				</view>
			  </view>
			</view>
		  </view>
		  <!-- 既然都点到详情里面了，加个关注按钮呗 -->
		  <view class="blogger__author__btn justify-content-item tn-flex-col-center tn-flex-row-center">
			<text v-if="article.isFollowed" class="tn-bg-gray--light tn-round tn-text-df tn-text-bold tn-color-gray" style="padding: 10rpx 24rpx;" @click="">
				+ 取消关注
			</text>
			<text v-else class="tn-bg-purplered--light tn-round tn-text-df tn-text-bold tn-color-purplered" style="padding: 10rpx 24rpx;" @click="">+ 关注</text>
		  </view>
		</view>
	  
		
		<view class="contentBox">
			<mp-html class="content" :content="article.content" />
		</view>
	   
		<!-- <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin-top-xs">
		  <view class="justify-content-item tn-flex tn-flex-col-center">
			<view style="margin-right: 10rpx;">
			  <tn-avatar-group :lists="item.viewUser.latestUserAvatar" size="sm"></tn-avatar-group>
			</view>
			<text class="tn-color-gray">{{ item.viewUser.viewUserCount }}人</text>
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
		</view> -->
	  </view>
	      
	      <!-- 边距间隔 -->
	      <!-- <view class="tn-strip-bottom" v-if="index != content.length - 1"></view> -->
	    
	    <!-- 按钮-->
	    <view class="tn-flex tn-flex-row-between" style="margin: 40rpx 0 60rpx 0;">
			 <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
			   <tn-button backgroundColor="#00FFC6" padding="40rpx 0" width="90%" shadow fontBold @click="handleLike">
				 <text v-if="!article.isLike" class="tn-icon-praise tn-padding-right-xs icon"></text>
				 <text v-else class="tn-icon-praise-fill tn-padding-right-xs icon"></text>
				 <text class="tn-color-black">点 赞</text>
			   </tn-button>
			 </view>
			 <view class="tn-flex-1 justify-content-item tn-margin-xs tn-text-center">
			   <tn-button backgroundColor="#FFF00D" padding="40rpx 0" width="90%" shadow fontBold  @click="handleCollect">
				 <text v-if="!article.isCollect" class="tn-icon-star tn-padding-right-xs icon"></text>
				 <text v-else class="tn-icon-star-fill tn-padding-right-xs icon"></text>
				 <text class="tn-color-black">收 藏</text>
			   </tn-button>
			 </view>
	    </view>
	    
	    
	  </view>
	  
	  <!-- 评论 -->
	  <view style="padding-bottom: 120rpx;">
	  	<view class="tn-margin" style=""  v-for="(item,index) in commentList" :key="index">
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
	  
	  
	<!--  
	  <view class="tabbar footerfixed dd-glass">
	    <view class="tn-flex tn-flex-row-between tn-flex-col-center">
	      <view class="justify-content-item tn-margin-top">
	        <view class="tn-flex tn-flex-row-center tn-flex-col-center">
	          
	          <view class="tn-flex tn-flex-row-center tn-flex-col-center tn-padding-right tn-padding-left-sm">
	            <view class="avatar-all">
	              <view class="tn-shadow-blur" style="background-image:url('https://resource.tuniaokj.com/images/blogger/onepiece-1.jpg');width: 60rpx;height: 60rpx;background-size: cover;">
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
	  </view> -->
	
	</view>
</template>

<script>
	import {
		getArticleInfo,
		like,
		getCommentList,
		addComment,
		selectUserInfoByArticleId
	} from '@/api/article.js'
	import {
		insertFollowed,deleteFollowed
	} from '@/api/followed.js'
	import {
		collect
	} from '@/api/collect.js'
	export default {
		data() {
			return {
				userInfo: {},
				articleId: null,
				article: {
					category: {
						name: ''
					}
				},
				website: uni.getStorageSync("webSiteInfo"),
				value:"",
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
				focusState:false
			};
		},
		onLoad: function(option) {
			this.articleId = option.id;
			this.info();
		},
		methods: {
			goBack(){
				uni.navigateTo({
					url:'/pages/index'
				})
			},
			toLastBack(){
				uni.navigateBack()
			},
			foucsInput(item,parentId){
				this.comment.selectItem = item;
				this.comment.parentId = parentId;
				this.$nextTick(() => {
					this.focusState = true
				})
			},
			handleComment(){
				let comment = {
					articleId:this.articleId,
					parentId:this.comment.parentId,
					content:this.commentContent,
					replyUserId:this.comment.selectItem ? this.comment.selectItem.userId : null
				}
				addComment(comment).then(res =>{
					if(res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					this.commentContent = ""
					this.getCommentList()
				})
			},
			handleCollect() {
				collect(this.articleId).then(res => {
					if (res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					let msg = "收藏成功"
					if (this.article.isCollect) {
						msg = "取消收藏"
						this.article.collectCount--
					} else {
						this.article.collectCount++
					}
					this.article.isCollect = !this.article.isCollect;
					this.$tn.message.toast(msg)
				})
			},
			handleFollowed() {
				insertFollowed(this.article.userId).then(res => {
					if (res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					this.article.isFollowed = 1
					this.$tn.message.toast('关注成功')
				})
			},
	
			handleDeleteFollowedUser() {
				deleteFollowed(this.article.userId).then(res => {
					if(res.code != 200){
						this.$tn.message.toast(res.message)
					}
					this.article.isFollowed = 0
					this.$tn.message.toast('取消关注')
				})
			},
			handleLike() {
				like(this.articleId).then((res) => {
					if (res.code != 200) {
						this.$tn.message.toast(res.message)
						return
					}
					let msg;
					if (this.article.isLike) {
						msg = "取消点赞"
						this.article.likeCount--
					} else {
						msg = "点赞成功"
						this.article.likeCount++
					}
					this.article.isLike = !this.article.isLike;
					this.$tn.message.toast(msg)
				})
			},
			info() {
				uni.showLoading({
					title: "加载中",
					mask: true
				});
				getArticleInfo({
					"id": this.articleId
				}).then((res) => {
					if (res.code != 200) {
						this.$tn.message.toast('文章不存在')
						return
					}
					this.article = res.data;
					this.article.content = this.article.content.replace(/<img/gi,
						'<img  style="max-width:100%;max-height: 500px;border-radius: 5px;margin: 15px 0"');
			
					this.getCommentList()
					
					//获取文章作者信息
					selectUserInfoByArticleId(this.articleId).then(res => {
					    this.userInfo = res.data
					})

					uni.hideLoading();
				})
			},
			getCommentList() {
				this.commentPage.articleId = this.articleId
				getCommentList(this.commentPage).then(res => {
					this.commentList = res.data.records
				})
			},

			formatDate: function(value) {
				var dt = new Date(value);
				let year = dt.getFullYear();
				let month = (dt.getMonth() + 1).toString().padStart(2, '0');
				let date = dt.getDate().toString().padStart(2, '0');
				return `${year}-${month}-${date}`;
			}
		}
	};
</script>

<style lang="scss" scoped>
	.container{
		background-color: #fff;
		.contentBox{
				/deep/ .content {
				line-height: 30px;
				margin-top: 10px;
				padding: 10px !important;
			
				blockquote {
					position: relative;
					padding: 0 10px;
					color: #6a737d;
					border-left: 0.25em solid #dfe2e5;
					margin: 20px 0;
				}
			
				h1,
				h2,
				h3,
				h4,
				h5,
				h6 {
					margin: 10px 0;
				}
			
				p {
					a {
						text-decoration: none;
						color: #7bc549;
					}
				}
			
				code {
					vertical-align: middle;
					word-break: break-word !important;
					border-radius: 2px !important;
					overflow-x: auto !important;
					background-color: #fff5f5;
					color: #ff502c;
					font-size: 0.87em !important;
					padding: 0.065em 0.4em !important;
				}
			
				ol {
					margin-left: 20px;
				}
			
				pre {
					opacity: 1 !important;
					margin: 10px 0;
					color: #f8f8f2 !important;
					overflow: hidden;
					box-shadow: rgba(0, 0, 0, 0.55) 0px 2px 10px;
					border-radius: 8px;
			
					code {
						line-height: 20px !important;
						font-size: 16px !important;
						vertical-align: top;
						padding: 10px !important;
						border-bottom-left-radius: 8px !important;
						border-bottom-right-radius: 8px !important;
						background-color: #303133 !important;
						color: #c0c4cc !important;
						width: -webkit-fill-available;
						display: inline-block;
					}
				}
			
			
			
				ul {
					margin-left: 20px;
				}
			}
		}
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