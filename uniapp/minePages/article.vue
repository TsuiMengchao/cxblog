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
      
      <view class="articles" >
        <block v-for="(item, index) in articleList" :key="index" >
          <view class="tn-margin tn-radius tn-padding article-item tn-bg-white" @click="goNavigate(item.id)">
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
               <view class="tn-flex tn-flex-col-center">
                  <view v-for="(label_item,label_index) in item.tagList" :key="label_index"
                    class="justify-content-item tn-tag-content__item tn-margin-right-xs tn-round tn-text-sm tn-text-bold" 
					:class="[`tn-bg-${$tn.color.getRandomColor()} tn-color-white`]">
                    <text class="tn-tag-content__item--prefix">#</text> {{ label_item.name }}
                  </view>
                </view>
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
	import {
		selectArticleByUserId
	} from '@/api/article.js'
  import template_page_mixin from '@/libs/mixin/template_page_mixin.js'
  export default {
    name: 'TemplateCollect',
    mixins: [template_page_mixin],
    data(){
      return {
		status: "noMore",
		articleList:[],
		pages:0,
		params:{
			pageNo:1,
			pageSize:10,
		},
      }
    },
	created() {
		this.getMyArticleList()
	},
    methods: {
		goNavigate(id) {
				uni.navigateTo({
					//保留当前页面，跳转到应用内的某个页面
					url: '/pages/article/index?id=' + id
				})
			},
		getMyArticleList(){
			this.$tn.message.loading('加载中')
			selectArticleByUserId(this.params).then(res =>{
				this.$tn.message.closeLoading()
				if(res.code != 200) {
					this.$tn.message.toast(res.message)
					return
				}
				this.articleList.push(...res.data.records)
				this.pages = res.data.pages
				this.status = this.params.pageNo == this.pages || !this.pages ? "noMore" : "more"
			})
		},
		handlePage(val){
			if (this.status == "noMore") {
				return
			}
			this.status = "loading";
			this.params.pageNo++;
			this.getMyArticleList()
		},
      // 跳转
      tn(e) {
      	uni.navigateTo({
      		url: e,
      	});
      },
    }
  }
</script>

<style lang="scss" scoped>
	.template-collect{
		background-color: #f4f4f4;
		
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
