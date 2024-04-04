<template>
	<view class="container">
		<!-- 顶部自定义导航 -->
		<tn-nav-bar fixed alpha :isBack="false" :bottomShadow="false">
			<view class="custom-nav tn-flex tn-flex-col-center tn-flex-row-left">
				<!-- 图标logo -->
				<view class="custom-nav__back" @click="tn('/minePages/about')">
					<view class="logo-pic tn-shadow-blur"
						style="background-image:url('https://resource.tuniaokj.com/images/logo/logo2.png')">
						<view class="logo-image">
						</view>
					</view>
					<!-- <view class="tn-icon-left"></view> -->
				</view>
				<!-- 搜索框 -->
				<view class="custom-nav__search tn-flex tn-flex-col-center tn-flex-row-center"
					@click="tn('/homePages/search')">
					<view class="custom-nav__search__box tn-flex tn-flex-col-center tn-flex-row-left"
						style="background-color: rgba(230,230,230,0.3);">
						<view class="custom-nav__search__icon tn-icon-search tn-color-white"></view>
						<view class="custom-nav__search__text tn-padding-left-xs tn-color-white">想搜点什么咧</view>
					</view>
				</view>
			</view>
		</tn-nav-bar>
		<scroll-view class="custom-tabbar-page" scroll-y enable-back-to-top @scrolltolower="handlePage"
			style="height: 100vh;">
			<view>
				<tn-swiper :list="bannerList" titleName="title" name="avatar" :title="true" :height="500"
					@click="handleClickBanner"></tn-swiper>
			</view>


			<!-- 方式12 start-->
			<!-- <view class="tn-flex tn-margin-xs tn-padding-top-sm">
		  <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius" @click="tn('/articlePages/hot')">
			<view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
			  <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-main-gradient-purplered--light tn-color-purplered">
				<view class="tn-icon-fire-fill tn-three"></view>
			  </view>
			  <view class="tn-color-black tn-text-center">
				<text class="tn-text-ellipsis">热点资讯</text>
			  </view>
			</view>
		  </view>
		  <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius" @click="tn('/preferredPages/classify')">
			<view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
			  <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-main-gradient-indigo--light tn-color-indigo">
				<view class="tn-icon-flower-fill tn-three"></view>
			  </view>
			  <view class="tn-color-black tn-text-center">
				<text class="tn-text-ellipsis">商品分类</text>
			  </view>
			</view>
		  </view>
		  <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius" @click="tn('/momentPages/business')">
			<view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
			  <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-main-gradient-purple--light tn-color-purple">
				<view class="tn-icon-identity-fill tn-three"></view>
			  </view>
			  <view class="tn-color-black tn-text-center">
				<text class="tn-text-ellipsis">智能名片</text>
			  </view>
			</view>
		  </view>
		  <view class="tn-flex-1 tn-padding-sm tn-margin-xs tn-radius" @click="tn('/preferredPages/website')">
			<view class="tn-flex tn-flex-direction-column tn-flex-row-center tn-flex-col-center">
			  <view class="icon12__item--icon tn-flex tn-flex-row-center tn-flex-col-center tn-shadow-blur tn-main-gradient-orange--light tn-color-orange">
				<view class="tn-icon-star-fill tn-three"></view>
			  </view>
			  <view class="tn-color-black tn-text-center">
				<text class="tn-text-ellipsis">星选门户</text>
			  </view>
			</view>
		  </view>
		</view> -->
			<view class="notice">
				<tn-notice-bar :list="noticeList" mode="horizontal" backgroundColor="tn-bg-indigo"
					fontColor="#FFFFFF"></tn-notice-bar>
			</view>
			<view class="tn-margin-bottom-xs">
				<tn-tabs :list="categoryList" :isScroll="true" :current="current" name="name"
					@change="change"></tn-tabs>
			</view>

			<view class="tn-margin-bottom-lg article-wapper" style="padding-bottom:100px ;">
				<block v-for="(item, index) in articleList" v-if="item.id != 200" :key="index">
					<view class="article-shadow article tn-bg-white" @tap="goNavigate(item.id)">
						<view class="tn-flex">
							<view class="tn-margin-sm tn-padding-top-xs" style="width: 100%;">
								<view class="tn-text-lg tn-text-bold clamp-text-1 tn-text-justify">
									<text class="">{{ item.title }}</text>
								</view>
								<view class="tn-padding-top-xs" style="min-height: 90rpx;">
									<text class="tn-text-df tn-color-gray clamp-text-2 tn-text-justify">
										{{ item.summary }}
									</text>
								</view>
								<view class="tn-flex tn-flex-row-between tn-flex-col-between">
									<view style="transform: translate(0rpx,6rpx);"
										class="tn-flex tn-flex-col-center  tn-margin-right-xs">
										<tn-avatar class="user-avatar tn-margin-right-xs" size="sm"
											:src="item.userAvatar"></tn-avatar>
										<text class="tn-tag-content__item--prefix">{{ item.username }}</text>
									</view>
									<view
										class="justify-content-item tn-color-gray tn-text-center tn-color-gray--disabled"
										style="padding-top: 15rpx;">
										<text class="tn-icon-message tn-padding-right-xs tn-text-lg"></text>
										<text class="tn-padding-right tn-text-df">{{ item.commentCount }}</text>
										<text class="tn-icon-star tn-padding-right-xs tn-text-lg"></text>
										<text class="tn-padding-right tn-text-df">{{ item.collectCount }}</text>
										<text class="tn-icon-praise tn-padding-right-xs tn-text-lg"></text>
										<text class="tn-text-df">{{ item.likeCount }}</text>
									</view>
								</view>
							</view>
							<view class="image-pic tn-margin-sm" :style="'background-image:url(' + item.avatar + ')'">
								<view class="image-article">
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
		getArticleList
	} from '@/api/article.js'
	import {
		getIndexList
	} from '@/api/index.js'
	import {
		getCategoryList
	} from '@/api/category.js'
	export default {
    name: 'Article',
		data() {
			return {
				status: "more",
				noticeList: [
					'辰雪博客现已发布V1.0.0'
				],
				articleList: [],
				categoryList: [{
						"name": "最新",
						id: null,
						desc: "create_time"
					},
					{
						id: null,
						name: "最热",
						desc: "quantity"
					}
				],
				bannerList: [],
				current: 0,
				params: {
					pageNo: 1,
					pageSize: 10
				},
				pages: 0,
				author: {
					nickname: "辰雪",
					avatar: null
				},
				website: {}
			}
		},
		created() {
			this.website = uni.getStorageSync("webSiteInfo")
			this.getArticleList();
			this.getCategoryList();
			this.handleBannerList();
		},
		methods: {
			tn(url) {
				uni.navigateTo({
					url
				})
			},
			handleClickBanner(index) {
				let article = this.bannerList[index]
				this.goNavigate(article.id)
			},
			onLoadShow() {
				this.current = 0
				const category = this.categoryList[this.current];
				this.params.pageNo = 1;
				this.params.categoryId = category.id;
				if (this.params.categoryId == null) this.$delete(this.params, 'categoryId')
				this.params.orderByDescColumn = category.desc
				if (this.params.orderByDescColumn == null) this.$delete(this.params, 'orderByDescColumn')
				this.getArticleList();
				this.getCategoryList();
				this.handleBannerList();
			},
			handleBannerList() {
				getIndexList().then(res => {
					this.bannerList = []
					var list = res.extra.articles
					for (var i = 0; i < list.length; i++) {
						if (list[i].id != 200) {
							this.bannerList.push(list[i])
						}
					}
				})
			},
			// 分页
			handlePage(val) {
				if (this.status == "noMore") {
					return
				}
				this.status = "loading";
				this.params.pageNo++;
				uni.showLoading({
					title: "加载中",
					mask: true
				});
				getArticleList(this.params).then(res => {
					uni.hideLoading()
					this.articleList.push(...res.data.records)
					this.pages = res.data.pages
					this.status = this.params.pageNo == this.pages || !this.pages ? "noMore" : "more"
				})
			},
			goNavigate(id) {
				uni.navigateTo({
					//保留当前页面，跳转到应用内的某个页面
					url: '/articlePages/articleInfo?id=' + id
				})
			},

			getArticleList() {
				uni.showLoading({
					title: "加载中",
					mask: true
				});
				getArticleList(this.params).then(res => {
					uni.hideLoading()
					this.articleList = res.data.records
					this.pages = res.data.pages
					this.pages = res.data.pages
					this.status = this.params.pageNo == this.pages || !this.pages ? "noMore" : "more"
				})
			},
			getCategoryList() {
				getCategoryList().then(res => {
					var categoryList = [{
							"name": "最新",
							id: null,
							desc: "create_time"
						},
						{
							id: null,
							name: "最热",
							desc: "quantity"
						}
					]
					categoryList.push(...res.data)
					this.categoryList = categoryList
				})
			},
			change(index) {
				const category = this.categoryList[index];
				this.params.pageNo = 1;
				this.params.categoryId = category.id;
				if (this.params.categoryId == null) this.$delete(this.params, 'categoryId')
				this.params.orderByDescColumn = category.desc
				if (this.params.orderByDescColumn == null) this.$delete(this.params, 'orderByDescColumn')
				this.loadStatus = "more"
				this.getArticleList();
				this.current = index;
			}
		}
	}
</script>

<style lang="scss" scoped>
	.container {
		height: 100vh;
		background-color: #f4f4f4;
		overflow: scroll;

		/* 图标容器12 start */
		.tn-three {
			position: absolute;
			top: 50%;
			right: 50%;
			bottom: 50%;
			left: 50%;
			transform: translate(-38rpx, -20rpx) rotateX(20deg) rotateY(10deg) rotateZ(-20deg);
			text-shadow: -1rpx 2rpx 0 #f0f0f0, -2rpx 4rpx 0 #f0f0f0, -10rpx 20rpx 30rpx rgba(0, 0, 0, 0.2);
		}

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
						background-image: url(https://resource.tuniaokj.com/images/cool_bg_image/icon_bg6.png);


					}
				}
			}
		}

		/* 自定义导航栏内容 start */
		.custom-nav {
			height: 100%;

			&__back {
				margin: auto 5rpx;
				font-size: 40rpx;
				margin-right: 10rpx;
				margin-left: 30rpx;
				flex-basis: 5%;
			}

			&__search {
				flex-basis: 60%;
				width: 100%;
				height: 100%;

				&__box {
					width: 100%;
					height: 70%;
					padding: 10rpx 0;
					margin: 0 30rpx;
					border-radius: 60rpx 60rpx 0 60rpx;
					font-size: 24rpx;
				}

				&__icon {
					padding-right: 10rpx;
					margin-left: 20rpx;
					font-size: 30rpx;
				}

				&__text {
					// color: #AAAAAA;
				}
			}
		}

		.logo-image {
			width: 65rpx;
			height: 65rpx;
			position: relative;
		}

		.logo-pic {
			background-size: cover;
			background-repeat: no-repeat;
			// background-attachment:fixed;
			background-position: top;
			border-radius: 50%;
		}


		/* 标题 start */
		.nav_title {
			-webkit-background-clip: text;
			color: transparent;

			&--wrap {
				position: relative;
				display: flex;
				height: 120rpx;
				font-size: 46rpx;
				align-items: center;
				justify-content: center;
				font-weight: bold;
				background-image: url(https://resource.tuniaokj.com/images/title_bg/title00.png);
				background-size: cover;
			}
		}

		/* 标题 end */

		.notice {
			margin: 15px 0;
		}

		.article-wapper {
			padding: 0 10px;

			.article {
				margin-bottom: 15px;
			}

			/* 资讯主图 start*/
			.image-article {
				border-radius: 8rpx;
				width: 200rpx;
				height: 200rpx;
				position: relative;
			}

			.image-pic {
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
		}


	}
</style>
