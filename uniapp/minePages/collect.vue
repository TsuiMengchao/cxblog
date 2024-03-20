<template>
  <view class="template-collect tn-safe-area-inset-bottom">
    <!-- 顶部自定义导航 -->
    <tn-nav-bar fixed alpha customBack>
      <view slot="back" class='tn-custom-nav-bar__back'
        @click="goBack">
        <text class='icon tn-icon-left'></text>
        <text class='icon tn-icon-home-capsule-fill'></text>
      </view>
    </tn-nav-bar>
    
    <scroll-view class="custom-tabbar-page" scroll-y enable-back-to-top @scrolltolower="handlePage" style="height: 100vh;">
    <view class="" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      
      <view class="" style="margin-bottom: 120rpx;">
        <block v-for="(item, index) in collectList" :key="index">
          <view class="tn-margin tn-padding-bottom-sm" @click="tn(item.id)">
            <view class="tn-flex">
              <view class="image-pic tn-shadow-blur tn-margin-right-sm" :style="'background-image:url(' + item.avatar + ')'">
                <view class="image-article">
                </view>
              </view>
              <view class="tn-margin-left-sm tn-margin-top-xs" style="width: 100%;">
                <view class="tn-text-lg tn-text-bold clamp-text-1 tn-text-justify">
                  {{ item.title }}
                </view>
                <view class="tn-padding-top-xs" style="min-height: 105rpx;">
                  <text class="tn-text-df tn-color-gray clamp-text-2 tn-text-justify">
                    {{ item.summary }}
                  </text>
                </view>
     <!--           <view class="tn-flex tn-flex-row-between tn-flex-col-between">
                  <view v-for="(label_item,label_index) in item.tagList" :key="label_index"
                    class="justify-content-item tn-tag-content__item tn-margin-right tn-round tn-text-sm tn-text-bold" :class="[`tn-bg-${item.color}--light tn-color-${item.color}`]">
                    <text class="tn-tag-content__item--prefix">#</text> {{ label_item }}
                  </view>
                  <view class="justify-content-item tn-color-gray tn-text-center tn-color-gray--disabled" style="padding-top: 5rpx;">
                    <text class="tn-icon-footprint tn-padding-right-xs tn-text-lg"></text>
                    <text class="tn-padding-right tn-text-df">{{ item.collectionCount }}</text>
                    <text class="tn-icon-like tn-padding-right-xs tn-text-lg"></text>
                    <text class="tn-text-df">{{ item.likeCount }}</text>
                  </view>
                </view> -->
              </view>
            </view>
          </view>
        </block>
		<uni-load-more class="loadMore" :status="status"  />
      </view>
      
    </view>
	</scroll-view>
  </view>
</template>

<script>
  import template_page_mixin from '@/libs/mixin/template_page_mixin.js'
  import {getCollectList} from '@/api/collect'
  export default {
    name: 'TemplateCollect',
    mixins: [template_page_mixin],
    data(){
      return {
		  params:{
		  	pageNo:1,
		  	pageSize:10,
			pages:0
		  },
		  status: "more",
		  collectList:[]
      }
    },
	created() {
		this.handleCollectList()
	},
    methods: {
	  handleCollectList(){
		  getCollectList(this.params).then(res =>{
			  this.collectList = res.data.records
			  this.params.pages = res.data.pages
			  this.status = this.params.pageNo == this.params.pages || !this.params.pages ? "noMore" : "more"
		  })
	  },
	  handlePage(){
		  if (this.status == "noMore") {
		  	return
		  }
		  this.$tn.message.loading('加载中')
		  this.status = "loading";
		  this.params.pageNo++
		  uni.showLoading({
		  	title: "加载中",
		  	mask: true
		  });
		  getCollectList(this.params).then(res =>{
			  uni.hideLoading()
			  this.collectList.push(...res.data.records)
			  this.status = this.params.pageNo == this.params.pages ? "noMore" : "more"
		  })
	  },
      // 跳转
      tn(id) {
      	uni.navigateTo({
      		//保留当前页面，跳转到应用内的某个页面
      		url: '/pages/article/index?id=' + id
      	})
      },
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
  
  /* 资讯主图 start*/
  .image-article {
    border-radius: 8rpx;
    border: 1rpx solid #F8F7F8;
    width: 180rpx;
    height: 200rpx;
    position: relative;
  }
  
  .image-pic {
    width: 200rpx;
    height: 200rpx;
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
</style>
