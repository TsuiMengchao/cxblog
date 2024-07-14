<template>
	<view class="wrap u-skeleton">
		<view style="position: absolute;"><u-navbar :custom-back="onBack" back-icon-color="#fff" :background="background" :border-bottom="false"></u-navbar></view>
		<view class="head u-skeleton-rect">
			<image mode="aspectFill" class="bg" :src="topicInfo.bg_image"></image>
			<view class="head-c">
				<view class="name">{{ topicInfo.topic_name }}</view>
				<view class="count">
					<text>{{ topicInfo.user_count }}人已加入</text>
					<text>{{ topicInfo.post_count }}篇内容</text>
					<view class="tool-menu-wrap">
						<navigator class="m-item" :url="'/pages/topic/setting?id=' + topicId"><u-icon name="/static/set.png" :size="35"></u-icon></navigator>
						<view class="m-item" @click="showShare = true"><u-icon name="/static/share_1.png" :size="35"></u-icon></view>
					</view>
				</view>
			</view>
		</view>
		<!-- 简介 -->
		<view class="member-wrap">
			<view class="member-wrap-head">
				<text class="notice-txt u-line-1">{{ topicInfo.description | replace }}</text>
			</view>
		</view>
		<!-- 置顶 -->
		<view class="post-top-box" v-if="topicInfo.top_post.length > 0">
			<navigator @longpress="onTopDel(item, index)" class="post-item" :url="'/pages/post/detail?id=' + item.id" v-for="(item, index) in topicInfo.top_post" :key="index">
				<view class="tag">置顶</view>
				<view class="title">{{ item.title || item.content.substring(0, 15) }}</view>
			</navigator>
		</view>
		<!-- 圈话题 -->
		<view class="dis-wrap" v-if="topicInfo.discuss_list.length > 0">
			<scroll-view scroll-x>
				<view class="dis-content">
					<navigator :url="'/pages/discuss/detail?id=' + item.id" class="d-item u-skeleton-rect" v-for="(item, index) in topicInfo.discuss_list" :key="item.id">
						<text class="tag">话题</text>
						<text class="title u-line-1">{{ item.title.substring(0, 10) }}</text>
					</navigator>
				</view>
			</scroll-view>
		</view>
		<!-- 分类tab -->
		<view class="tabs-box u-skeleton-rect">
			<view class="tab-left"><u-tabs :list="tabList" :is-scroll="false" :current="current" @change="tabsChange"></u-tabs></view>
		</view>
		<view v-show="current == 0">
			<post-list :showTopic="false" :handle="true" :uid="topicInfo.uid" :list="postNews" :loadStatus="loadStatus" :admin="topicInfo.is_admin"></post-list>
		</view>
		<view v-show="current == 1">
			<post-list :showTopic="false" :handle="true" :uid="topicInfo.uid" :list="postHot" :loadStatus="loadStatus" :admin="topicInfo.is_admin"></post-list>
		</view>
		<!-- 加入圈子弹窗 -->
		<u-modal v-model="joinTopicModel" :show-cancel-button="true" confirm-text="加入圈子" :content="'是否加入【' + topicInfo.topic_name + '】?'" @confirm="joinTopic"></u-modal>
		<!-- 选择分享弹窗 -->
		<u-popup v-model="showShare" mode="bottom" border-radius="20">
				<view class="share-wrap" @click="showShare = false">
					<button open-type="share" @click="appShare('WXSceneSession')" class="share-item u-reset-button">
						<image src="/static/wechat.png"></image>
						<text>微信好友</text>
					</button>
					<view @click="appShare('WXSenceTimeline')" class="share-item">
						<image src="/static/pyq.png"></image>
						<text>微信朋友圈</text>
					</view>
					<view @click="appShares('qq')" class="share-item">
						<image src="/static/qq.png"></image>
						<text>QQ</text>
					</view>
				</view>
		</u-popup>
		<!-- 海报弹窗 -->
		<u-popup v-model="showCanvas" mode="center" border-radius="20" width="90%">
			<image style="width:100%" mode="widthFix" :src="shareImageSrc"></image>
			<view class="footer"><q-button @click="saveImgToAlbum" type="success" shape="circle">保存/分享</q-button></view>
		</u-popup>
		<!-- 发布按钮 -->
		<view @click="handelAdd" class="plus-box u-skeleton-circle"><u-icon name="plus" color="#fff"></u-icon></view>
		<!-- 发布弹窗 -->
		<u-popup v-model="showPlusPost" mode="bottom" border-radius="20" width="80%">
			<view class="post-add-popup">
				<view @click="onTrigger(1)" class="p-item">
					<image mode="widthFix" class="icon" src="/static/h_2.png"></image>
					<text class="txt">发布帖子</text>
				</view>
				<view @click="onTrigger(2)" class="p-item">
					<image mode="widthFix" class="icon" src="/static/h_3.png"></image>
					<text class="txt">发布视频</text>
				</view>
				<view @click="onTrigger(3)" class="p-item">
					<image mode="widthFix" class="icon" src="/static/h_1.png"></image>
					<text class="txt">发布投票</text>
				</view>
			</view>
			<view class="handle-close"><u-icon @click="showPlusPost = false" name="close"></u-icon></view>
		</u-popup>
		<!-- 骨架屏 -->
		<u-skeleton :loading="loading" :animation="true" bgColor="#FFF"></u-skeleton>
	</view>
</template>

<script>
import postList from '../../components/post-list/post-list.vue';
export default {
	components: {
		postList
	},
	data() {
		return {
			loading: true,
			showPlusPost: false,
			showCanvas: false,
			showShare: false,
			joinTopicModel: false,
			delTopicModel: false,
			current: 0,
			tabList: [
				{
					name: '最新'
				},
				{
					name: '最热'
				}
			],
			topicId: 0,
			topicInfo: {
				member_list: [],
				discuss_list: [],
				top_post: [],
				description: '',
				userInfo: {
					username: ''
				}
			},
			postHot: [],
			postNews: [],
			loadStatus: 'loading',
			page1: 1,
			page2: 1,
			background: {
				backgroundColor: 'unset'
			},
			sessionUser: uni.getStorageSync('userInfo'),
			shareImageSrc: ''
		};
	},
	onLoad(options) {
		this.topicId = options.id;

		if (options.scene) {
			this.topicId = options.scene;
		}

		this.getTopicInfo();
		this.getPostList();
	},
	onReachBottom() {
		if (this.current == 0) {
			this.page1++;
		}

		if (this.current == 1) {
			this.page2++;
		}

		this.getPostList();
	},
	onPullDownRefresh() {
		if (this.current == 0) {
			this.page1 = 1;
			this.postNews = [];
		}

		if (this.current == 1) {
			this.page2 = 1;
			this.postHot = [];
		}

		this.getPostList();
		this.getTopicInfo();
		uni.stopPullDownRefresh();
	},
	onShareAppMessage(res) {
		if (res.from === 'button') {
			// 来自页面内分享按钮
			console.log(res.target);
		}
		return {
			title: this.topicInfo.topic_name + '-' + this.topicInfo.description,
			path: '/pages/topic/detail?id=' + this.topicId,
			imageUrl: this.topicInfo.bg_image
		};
	},
	onShareTimeline() {
		return {
			title: this.topicInfo.topic_name + '-' + this.topicInfo.description,
			imageUrl: this.topicInfo.bg_image,
			query: 'id=' + this.topicId
		};
	},
	filters: {
		substr: function(e) {
			return e.substr(0, 5);
		},
		replace(str) {
			str = str.replace(/\n/g, '');
			return str;
		}
	},
	methods: {
		appShares() {
			let imgURL = this.topicInfo.bg_image;
			let that = this
			let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
			let curRoute = routes[routes.length - 1].$page.fullPath // 获取当前页面路由，也就是最后一个打开的页面路由
			uni.share({
				provider: "qq", //分享服务提供商（即weixin|qq|sinaweibo）
				type: 0, //分享形式
				href: 'http://xy.tujingzg.com/api/post/detail?id=' +that.topicId, //跳转链接
				summary: that.topicInfo.topic_name + '-' + that.topicInfo.description, //分享内容的摘要
				title: that.topicInfo.topic_name + '-' + that.topicInfo.description, //分享内容的标题
				imageUrl: imgURL, //图片地址
				success: function(res) {
					uni.showToast({
						title: '分享成功',
						icon: 'none',
						duration: 2000
					})
					that.posters = false; //成功后关闭底部弹框
				},
				fail: function(err) {
					uni.showToast({
						title: '分享失败',
						icon: 'none',
						duration: 2000
					})
					that.posters = false;
				}
			});
		},
		appShare(scene) {
			let imgURL = this.topicInfo.bg_image;
			let that = this
			let routes = getCurrentPages(); // 获取当前打开过的页面路由数组
			let curRoute = routes[routes.length - 1].$page.fullPath // 获取当前页面路由，也就是最后一个打开的页面路由
			uni.share({
				provider: "weixin", //分享服务提供商（即weixin|qq|sinaweibo）
				scene: scene, //场景，可取值参考下面说明。
				type: 0, //分享形式
				href: 'http://xy.tujingzg.com/api/post/detail?id=' +that.topicId, //跳转链接
				summary: that.topicInfo.topic_name + '-' + that.topicInfo.description, //分享内容的摘要
				title: that.topicInfo.topic_name + '-' + that.topicInfo.description, //分享内容的标题
				imageUrl: imgURL, //图片地址
				success: function(res) {
					uni.showToast({
						title: '分享成功',
						icon: 'none',
						duration: 2000
					})
					that.posters = false; //成功后关闭底部弹框
				},
				fail: function(err) {
					uni.showToast({
						title: '分享失败',
						icon: 'none',
						duration: 2000
					})
					that.posters = false;
				}
			});
		},
		shareImage() {
			uni.showLoading({
				mask: true,
				title: '正在加载'
			});

			this.$H
				.get('topic/makePoster', {
					id: this.topicId
				})
				.then(res => {
					if (res.code == 200) {
						this.shareImageSrc = res.result.path;
						this.showCanvas = true;
						this.showShare = false;
					}

					uni.hideLoading();
				});
		},
		onTopDel(e, index) {
			let that = this;
			uni.showModal({
				title: '提示',
				content: '是否解除置顶?',
				success: function(res) {
					if (res.confirm) {
						that.$H
							.post('post/topPostDel', {
								post_id: e.id,
								topic_id: e.topic_id
							})
							.then(res => {
								if (res.code == 200) {
									that.topicInfo.top_post.splice(index, 1);
								}
							});
					} else if (res.cancel) {
						// console.log('用户点击取消');
					}
				}
			});
		},
		copyPageUrl() {
			let that = this;
			uni.setClipboardData({
				data: 'pages/topic/detail?id=' + this.topicId,
				success: function() {
					uni.hideToast();
					that.$q.toast('复制成功', 'success');
					that.showShare = false;
				}
			});
		},
		onPlus() {
			if (this.topicInfo.is_join) {
				this.showPlusPost = true;
			} else {
				this.joinTopicModel = true;
			}
		},
		// 保存海报到相册
		saveImgToAlbum() {
			let that = this;
			uni.downloadFile({
				url: this.shareImageSrc,
				success: res => {
					if (res.statusCode === 200) {
						uni.saveImageToPhotosAlbum({
							filePath: res.tempFilePath,
							success: function() {
								console.log('save success');
							},
							complete() {
								that.showCanvas = false;
							}
						});
					}
				}
			});
		},
		jumpUser() {
			uni.navigateTo({
				url: '/pages/topic/topic-user?id=' + this.topicId
			});
		},
		onBack() {
			let pages = getCurrentPages();
			if (pages.length > 1) {
				uni.navigateBack();
			} else {
				uni.switchTab({
					url: '/pages/index/index'
				});
			}
		},
		tabsChange(index) {
			this.current = index;
			if (index == 1 && this.postHot.length == 0) {
				this.getPostList();
			}
		},
		onTrigger(type) {
			if (!this.topicInfo.is_join) {
				this.joinTopicModel = true;
				return;
			}

			this.showPlusPost = false;
			if (type == 3) {
				uni.navigateTo({
					url: '/pages/post/vote?topic_id=' + this.topicId
				});
			} else {
				uni.navigateTo({
					url: '/pages/post/add?topic_id=' + this.topicId + '&topic_name=' + this.topicInfo.topic_name + '&type=' + type
				});
			}
		},
		handelAdd() {
			if (this.$store.state.hasLogin) {
				if (this.topicInfo.is_join) {
					this.showPlusPost = true;
				} else {
					this.joinTopicModel = true;
				}
			} else {
				uni.navigateTo({
					url: '/pages/user/login'
				});
			}
		},
		jump(uid) {
			uni.navigateTo({
				url: '/pages/user/home?uid=' + uid
			});
		},
		joinTopic() {
			this.$H
				.post('topic/joinTopic', {
					id: this.topicId
				})
				.then(res => {
					if (res.code === 200) {
						this.topicInfo.is_join = true;
						this.joinTopicModel = false;
					}
				});
		},
		getTopicInfo() {
			this.$H
				.get('topic/detail', {
					id: this.topicId
				})
				.then(res => {
					this.topicInfo = res.result;
					this.loading = false;
				});
		},
		getPostList() {
			this.loadStatus = 'loading';
			let page = this.page1;
			let order = 'id desc';

			if (this.current == 1) {
				page = this.page2;
				order = 'read_count desc';
			}

			this.$H
				.get('post/list', {
					topic_id: this.topicId,
					page: page,
					order: order
				})
				.then(res => {
					if (this.current == 0) {
						this.postNews = this.postNews.concat(res.result.data);
					}

					if (this.current == 1) {
						this.postHot = this.postHot.concat(res.result.data);
					}

					if (res.result.current_page === res.result.last_page || res.result.last_page === 0) {
						this.loadStatus = 'nomore';
					} else {
						this.loadStatus = 'loadmore';
					}
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
.wrap {
	height: calc(100vh);
}

.mg-left-20 {
	margin-left: 20rpx;
}

.tabs-box {
	margin-top: 20rpx;
	background-color: #ffffff;
	.tab-left {
		width: 30%;
	}
}

/*  */
.notice-txt {
	color: #999;
	font-size: 12px;
}

.grid-text {
	font-size: 12px;
	color: #616161;
	margin-bottom: 30rpx;
}

.head {
	position: relative;
	height: 380rpx;
}

.head-c {
	position: absolute;
	top: 200rpx;
	left: 0;
	width: 100%;
	display: flex;
	flex-direction: column;
	color: #fff;
	padding: 30rpx;
}

.head-c .count {
	font-size: 10px;
	display: flex;
	align-items: center;
}

.head-c .count text {
	margin: 0 5rpx;
	color: #e6e6e6;
}

.head-c .name {
	font-size: 20px;
	font-weight: bold;
	display: block;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 1;
	white-space: pre-wrap;
	overflow: hidden;
}

.margin-left {
	margin-left: auto;
	margin-right: 20rpx;
}

.head .bg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

/* 管理员 */
.member-wrap {
	padding: 30rpx;
	background-color: #fff;
	border-bottom: 1px solid #eee;
}

.member-wrap .avatar {
	margin-bottom: 10rpx;
}

.member-wrap .member-wrap-head {
	display: flex;
	.user-num {
		margin-left: auto;
		color: #999;
	}

	.icon {
		margin-left: auto;
		color: #999;
	}
}
// 置顶
.post-top-box {
	background-color: #fff;
	padding: 20rpx;
	.post-item {
		display: flex;
		align-items: center;
		padding: 20rpx;
		font-size: 28rpx;
		&:last-child {
			margin-bottom: 0;
		}
		.tag {
			background-color: #333;
			color: #fff;
			padding: 0 10rpx;
			border-radius: 10rpx;
			font-size: 20rpx;
			height: 40rpx;
			line-height: 40rpx;
			margin-right: 20rpx;
		}
	}
}

// 分享弹窗
	.share-wrap {
		display: flex;
		padding: 30rpx;
		width: 50%;
		margin: 0 auto;

		.share-item {
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;

			&:nth-child(1) {
				margin-right: auto;
			}

			image {
				width: 100rpx;
				height: 100rpx;
			}

			text {
				font-size: 24rpx;
				margin-top: 20rpx;
			}
		}
	}

// 发布弹窗
.post-add-popup {
	display: flex;
	padding: 50rpx 0;

	.p-item {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		flex: 1;
		padding: 20rpx 0;
		border-radius: 20rpx;

		.icon {
			width: 100rpx;
			margin-bottom: 20rpx;
		}

		.txt {
			font-size: 28rpx;
		}
	}
}

.handle-close {
	display: flex;
	justify-content: center;
	margin-bottom: 50rpx;
}

// 话题
.dis-wrap {
	padding: 20rpx;
	background-color: #fff;
	.dis-content {
		display: flex;
		.d-item {
			display: flex;
			align-items: center;
			background-color: #f5f5f5;
			margin-right: 10rpx;
			border-radius: 20rpx;
			padding: 5rpx 20rpx;
			font-size: 28rpx;
			font-weight: bold;
			color: #000;
			.tag {
				display: inline-flex;
				align-items: center;
				font-size: 18rpx;
				background-color: #000;
				border-radius: 10rpx;
				color: #fff;
				padding: 0 10rpx;
				margin-right: 10rpx;
				white-space: nowrap;
			}
			.title {
			}
		}
	}
}

.tool-menu-wrap {
	margin-left: auto;
	display: flex;
	.m-item {
		padding: 15rpx;
		background-color: rgba(0, 0, 0, 0.4);
		margin: 0 10rpx;
		border-radius: 50%;
		display: flex;
		justify-content: center;
		align-items: center;
	}
}
</style>
