<template>
  <view class="template-search tn-safe-area-inset-bottom">
    
    <view class="tn-navbg" :style="{height: vuex_custom_bar_height + 'px'}">
      <!-- 顶部自定义导航 -->
      <tn-nav-bar fixed alpha customBack>
        <view slot="back" class='tn-custom-nav-bar__back'
          @click="goBack">
          <text class='icon tn-icon-left-arrow'></text>
        </view>
      </tn-nav-bar>
      
      
    </view>
    <scroll-view class="custom-tabbar-page" scroll-y enable-back-to-top @scrolltolower="handlePage" style="height: 100vh;">
    <view class="tn-search-fixed">
      <view class="tn-flex tn-flex-row-between tn-flex-col-center tn-margin" :style="{marginTop: vuex_custom_bar_height + 'px'}">
        <view class="justify-content-item align-content-item">
          <view class="tn-bg-gray--light tn-flex tn-flex-col-center" style="border-radius: 100rpx;padding: 10rpx 20rpx 10rpx 20rpx;width: 100%;">
            <text class="tn-icon-search justify-content-item tn-padding-right-xs tn-color-gray tn-text-lg"></text>
            <input v-model="queryParams.keyword" class="justify-content-item" placeholder="想搜点什么咧" name="input" placeholder-style="color:#AAAAAA" ></input>
          </view>
        </view>
        
        <view class="align-content-item">
          <view class="justify-content-item tn-text-center">
            <tn-button backgroundColor="#82B2FF" shape="round" padding="20rpx 20rpx" width="150rpx" shadow fontBold @click="handleSearch">
              <text class="tn-color-white">搜 索</text>
            </tn-button>
          </view>
        </view>
      </view>
    </view>
    
    <view class="" style="margin-top: 160rpx;" :style="{paddingTop: vuex_custom_bar_height + 'px'}">
      <view class="tn-flex tn-flex-row-between tn-margin" >
        <view class="justify-content-item tn-text-bold">
          <text class="tn-text-df tn-color-black">最近搜索</text>
        </view>
        <view class="justify-content-item tn-text-df tn-color-grey">
          <text class="tn-padding-xs">删除</text>
          <text class="tn-icon-delete"></text>
        </view>
      </view>
    </view>
    
    <view class="">
      <view class="tn-tag-search tn-margin tn-text-justify">
        <view v-for="(item, index) in tagList" :key="index" class="tn-tag-search__item tn-margin-right tn-round tn-text-sm tn-bg-gray--light tn-color-gray">
          <text class="tn-tag-search__item--prefix">#</text> {{ item.title }}
        </view>
      </view>
    </view>
    
    <view class="tn-flex tn-flex-row-between tn-padding-top-xl tn-margin tn-padding-bottom">
      <view class="justify-content-item tn-text-bold">
        <text class="tn-text-df tn-color-black">搜索结果</text>
      </view>
      <view class="justify-content-item tn-text-df tn-color-grey">
        <text class="tn-padding-xs">筛选</text>
        <text class="tn-icon-filter"></text>
      </view>
    </view>
    
    
    <!-- 不建议写时间，因为写了时间，你就要经常更新文章了鸭-->
	  <view class="tn-margin-bottom-lg article-wapper"  v-if="articleList.length">
			<block v-for="(item, index) in articleList" :key="index">
			  <view class="article-shadow tn-margin-bottom-xs" @tap="goNavigate(item.id)">
				<view class="tn-flex">
				  <view class="tn-margin-sm tn-padding-top-xs" style="width: 100%;">
					<view class="tn-text-lg tn-text-bold clamp-text-1 tn-text-justify">
					  <view class="" v-html="item.title"></view>
					</view>
					<view class="tn-padding-top-xs" style="min-height: 90rpx;">
					  <text class="tn-text-df tn-color-gray clamp-text-2 tn-text-justify">
						{{ item.summary }}
					  </text>
					</view>
					</view>
				  </view>
			  </view>
			</block>
			<uni-load-more class="loadMore" :status="status" />
	  </view>
    </scroll-view>
    
  </view>
</template>

<script>
	import {
		searchArticle
	} from '@/api/article.js'
  import template_page_mixin from '@/libs/mixin/template_page_mixin.js'
  export default {
    name: 'TemplateSearch',
    mixins: [template_page_mixin],
    data(){
      return {
        status: "more",
        tagList: [
          {
            color: 'red',
            title: "救救孩子",
          },
          {
            color: 'cyan',
            title: "今天的Bug写了吗",
          },
          {
            color: 'blue',
            title: "北北猪",
          },
          {
            color: 'green',
            title: "捉住那只北北猪",
          },
          {
            color: 'orange',
            title: "祭天叭，产品经理",
          },
          {
            color: 'purple',
            title: "快醒醒，来需求了",
          },
          {
            color: 'brown',
            title: "夏天的第一个Bug",
          }
        ],
        articleList:[],
		queryParams:{
			pageNo:1,
			pageSize:10,
			keyword:""
		},
		pages:0
      }
    },
    methods: {
		handleSearch(){
			this.queryParams.pageNo = 1
			searchArticle(this.queryParams).then(res =>{
				if(res.code != 200) {
					this.$tn.message.toast(res.message)
					return
				}
				this.articleList = res.data.records
				this.pages = res.data.pages
				this.status = this.queryParams.pageNo == this.pages || !this.pages ? "noMore" : "more"
			})
		},
		handlePage(){
			if (this.status == "noMore") {
				return
			}
			this.$tn.message.loading('加载中')
			this.status = "loading";
			this.queryParams.pageNo++;
			searchArticle(this.queryParams).then(res =>{
				this.$tn.message.closeLoading()
				if(res.code != 200) {
					this.$tn.message.toast(res.message)
					return
				}
				this.articleList.push(...res.data.records)
				this.pages = res.data.pages
				this.status = this.queryParams.pageNo == this.pages || !this.pages ? "noMore" : "more"
			})
		},
      goNavigate(id) {
      	uni.navigateTo({
      		//保留当前页面，跳转到应用内的某个页面
      		url: '/pages/article/index?id=' + id
      	})
      },
      
    }
  }
</script>

<style lang="scss" scoped>
  .tn-search-fixed{
    position: fixed;
    top: 50rpx;
    width: 100%;
    transition: all 0.25s ease-out;
    z-index: 1;
  }
  /* 胶囊*/
  .tn-custom-nav-bar__back {
    width: 60%;
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
    
  }
  
  /* 顶部渐变*/
  .tn-navbg {
      background: linear-gradient(-120deg, #F15BB5, #9A5CE5, #01BEFF, #00F5D4);
      /* background: linear-gradient(-120deg,  #9A5CE5, #01BEFF, #00F5D4, #43e97b); */
      /* background: linear-gradient(-120deg,#c471f5, #ec008c, #ff4e50,#f9d423); */
      /* background: linear-gradient(-120deg, #0976ea, #c471f5, #f956b6, #ea7e0a); */
      background-size: 500% 500%; 
      animation: gradientBG 15s ease infinite; 
      position: fixed;
      top: 0;
      width: 100%;
      z-index: 100;
  } 
   
  @keyframes gradientBG { 
      0% { 
          background-position: 0% 50%; 
      } 
      50% { 
          background-position: 100% 50%; 
      } 
      100% { 
          background-position: 0% 50%; 
      } 
  }
  
  /* 搜索标签 start*/
  .tn-tag-search {
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
  
  /* 标题 start */
  .nav_title {
    -webkit-background-clip: text;
    color: transparent;
    
    &--wrap {
      position: relative;
      display: flex;
      height: 120rpx;
      font-size: 42rpx;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      background-image: url(https://resource.tuniaokj.com/images/title_bg/title00.png);
      background-size: cover;
    }
  }
  /* 标题 end */
  
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
  
</style>
