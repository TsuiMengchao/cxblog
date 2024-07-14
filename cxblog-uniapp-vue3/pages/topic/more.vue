<template>
	<view>
		<!-- 轮播图 -->
		<view class="swiper-box"><u-swiper @click="onSwiper" :list="swiperList" name="img" border-radius="20" mode="rect"></u-swiper></view>
		<!-- 热门圈子 -->
		<view class="block-title">
			<view class="left">热门圈子</view>
			<navigator url="/pages/topic/class-list" hover-class="none" class="right">
				<text>更多圈子</text>
				<u-icon name="arrow-right" size="30rpx" color="#999"></u-icon>
			</navigator>
		</view>
		<scroll-view scroll-x>
			<view class="hot-topic">
				<navigator hover-class="none" :url="'/pages/topic/detail?id=' + item.id" class="topic-item" v-for="(item, index) in topicHotList" :key="index">
					<view class="cover-box"><image :src="item.cover_image" class="cover-img" mode="aspectFill"></image></view>
					<view class="footer">
						<text class="name">{{ item.topic_name }}</text>
						<text class="user-num">{{ item.user_num }}圈友</text>
					</view>
				</navigator>
			</view>
		</scroll-view>
		<!-- tabs -->
		<u-tabs :list="classList" name="cate_name" bg-color="#f5f5f5" :current="current" @change="tabChange"></u-tabs>
		<!-- 圈子列表 -->
		<navigator class="topic-wrap" hover-class="none" :url="'/pages/topic/detail?id=' + item.id" v-for="(item, index) in topicList" :key="index">
			<view class="info-wrap">
				<image class="cover-img" mode="aspectFill" :src="item.cover_image"></image>
				<view class="right">
					<view class="name">{{ item.topic_name }}</view>
					<view class="count-wrap">
						<text>{{ item.user_num }}人加入</text>
						<text>{{ item.post_num }}条动态</text>
					</view>
				</view>
			</view>
			<view class="post-img-wrap" v-if="item.img_list.length > 0"><image mode="aspectFill" v-for="(item2, index2) in item.img_list" :key="index2" :src="item2"></image></view>
		</navigator>
		<!-- 加载状态 -->
		<block v-if="topicList.length === 0 && loadStatus == 'nomore'"><u-empty margin-top="100" text="暂无内容" mode="favor"></u-empty></block>
		<block v-else>
			<view style="margin: 30rpx 0;"><u-loadmore :status="loadStatus" /></view>
		</block>
	</view>
</template>

<script>
export default {
	data() {
		return {
			page: 1,
			classList: [
				{
					cate_id: '',
					cate_name: '最新'
				}
			],
			classId: '',
			topicList: [],
			loadStatus: 'loadmore',
			current: 0,
			topDisList: [],
			swiperList: [],
			topicHotList: []
		};
	},
	onLoad() {
		this.getClassList();
		this.getLinkList();
		this.getHotTopic();
		this.getTopicList();
	},
	onReachBottom() {
		this.page++;
		this.getTopicList();
	},
	onPullDownRefresh() {
		this.getLinkList();
		this.getHotTopic();
		this.getClassList();
		this.page = 1;
		this.topicList = [];
		this.getTopicList();
		uni.stopPullDownRefresh();
	},
	methods: {
		tabChange(index) {
			this.page = 1;
			this.current = index;
			this.classId = this.classList[index].cate_id;
			this.topicList = [];
			this.getTopicList();
		},
		getHotTopic() {
			this.$H.get('topic/hot').then(res => {
				this.topicHotList = res.result;
			});
		},
		jumpTopic(id) {
			uni.navigateTo({
				url: '/pages/topic/detail?id=' + id
			});
		},
		previewImage(url, urls) {
			uni.previewImage({
				current: url, // 当前显示图片的http链接
				urls: urls // 需要预览的图片http链接列表
			});
		},
		// 获取圈子列表
		getTopicList() {
			
			console.log(this.classId)
			this.loadStatus = 'loading';
			this.$H
				.get('topic/classTopicAreImg', {
					class_id: this.classId,
					page: this.page
				})
				.then(res => {
					console.log(res)
					this.topicList = this.topicList.concat(res.result.data);
					if (res.result.current_page === res.result.last_page || res.result.last_page === 0) {
						this.loadStatus = 'nomore';
					} else {
						this.loadStatus = 'loadmore';
					}
				});
		},
		// 处理点击轮播图跳转
		onSwiper(index) {
			let link = this.swiperList[index];

			//跳转页面
			if (link.open == 1) {
				uni.navigateTo({
					url: '/pages/webview/webview?src=' + link.url
				});
			}
			
			//跳转小程序
			if(link.open == 2){
				uni.navigateToMiniProgram({
				  appId: link.appid,
				  path: link.url
				})
			}
			
			//跳转小程序
			if(link.open == 3){
				uni.navigateTo({
					url:link.url
				})
			}
		},
		// 获取轮播图
		getLinkList() {
			this.$H
				.post('link/list', {
					type: 3,
					page: 1
				})
				.then(res => {
					this.swiperList = res.result.data;
				});
		},
		getClassList() {
			let that = this;
			this.$H.get('topic/classList').then(res => {
				let classList = [
					{
						cate_id: '',
						cate_name: '最新'
					}
				];

				this.classList = classList.concat(res.result);
			});
		},
		toSearch() {
			uni.navigateTo({
				url: '/pages/search/search'
			});
		}
	}
};
</script>
<style>
page {
	background-color: #f5f5f5;
}
</style>
<style lang="scss" scoped>
.swiper-box {
	padding: 20rpx;
}
// 热门圈子
.hot-topic {
	padding: 20rpx;
	display: flex;
	.topic-item {
		margin: 0 20rpx;
		.cover-box {
			position: relative;
			.cover-img {
				width: 100rpx;
				height: 100rpx;
				border-radius: 50%;
			}
		}

		.footer {
			font-size: 24rpx;
			.name {
				display: inline-block;
				width: 120rpx;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}

			.user-num {
				color: #999;
			}
		}
	}
}
// 块标题
.block-title {
	font-weight: bold;
	padding: 20rpx;
	color: #616161;
	display: flex;
	font-size: 28rpx;
	.right {
		margin-left: auto;
		color: #999;
		font-size: 24rpx;
		display: flex;
		align-items: center;
	}
}

// 帖子
.topic-wrap {
	background-color: #fff;
	margin: 30rpx;
	padding: 20rpx;
	border-radius: 20rpx;
	.info-wrap {
		display: flex;
		.cover-img {
			width: 100rpx;
			height: 100rpx;
			border-radius: 50%;
			margin-right: 20rpx;
		}

		.right {
			.name {
				font-weight: bold;
			}
			.count-wrap {
				font-size: 24rpx;
				color: #616161;
				text {
					margin-right: 10rpx;
				}
			}
		}
	}

	.post-img-wrap {
		display: grid;
		grid-template-columns: repeat(3, 1fr);
		grid-gap: 10rpx;
		margin-top: 20rpx;
		image {
			width: 100%;
			height: 200rpx;
			border-radius: 10rpx;
		}
	}
}
</style>
