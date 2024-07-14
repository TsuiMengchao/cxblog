<template>
	<view>
		<view class="dis-title">
			<text class="tag">#</text>
			<text class="title">{{ discussInfo.title }}</text>
		</view>
		<view class="discussInfo">
			<view class="count">
				<text>{{ discussInfo.post_count }} 篇内容</text>
				<text>{{ discussInfo.read_count }} 次浏览</text>
			</view>
			<view class="discuss-desc">{{ discussInfo.introduce }}</view>
		</view>
		<post-list :list="postList" :loadStatus="loadStatus"></post-list>
		<!-- 发布按钮 -->
		<view @click="onTrigger" class="plus-box"><u-icon color="#fff" name="plus"></u-icon></view>
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
			disId: 0,
			loadStatus: 'loading',
			postList: [],
			discussInfo: {
				userInfo: {}
			},
			page: 1
		};
	},
	onLoad(options) {
		this.disId = options.id;
		this.getDiscussInfo();
		this.getPostList();

		//#ifdef MP-WEIXIN
		wx.showShareMenu({
			withShareTicket: true,
			menus: ['shareAppMessage', 'shareTimeline']
		});
		//#endif
	},
	onShareAppMessage(res) {
		if (res.from === 'button') {
			// 来自页面内分享按钮
			console.log(res.target);
		}
		return {
			title: this.discussInfo.introduce,
			path: '/pages/discuss/detail?id=' + this.disId
		};
	},
	onShareTimeline() {
		let imgURL = '';
		return {
			title: this.discussInfo.introduce,
			imageUrl: imgURL,
			query: 'id=' + this.disId
		};
	},
	methods: {
		onTrigger() {
			uni.navigateTo({
				url: '/pages/post/add?topic_id=' + this.discussInfo.topic_id + '&discuss_id=' + this.discussInfo.id + '&dis_name=' + this.discussInfo.title
			});
		},
		getDiscussInfo() {
			this.$H
				.get('discuss/detail', {
					id: this.disId
				})
				.then(res => {
					this.discussInfo = res.result;
				});
		},
		getPostList() {
			this.loadStatus = 'loading';
			this.$H
				.get('post/list', {
					dis_id: this.disId,
					page: this.page
				})
				.then(res => {
					this.postList = this.postList.concat(res.result.data);

					if (res.current_page === res.last_page || res.last_page === 0) {
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
.dis-title {
	background-color: #fff;
	padding: 0 30rpx;
	line-height: 1;
	.tag {
		display: inline-flex;
		justify-content: center;
		align-items: center;
		width: 45rpx;
		height: 45rpx;
		border-radius: 50%;
		background-color: #000;
		color: #fff;
		font-weight: bold;
		margin-right: 10rpx;
		font-size: 24rpx;
	}
	.title {
		font-weight: bold;
		color: #000000;
		font-size: 38rpx;
	}
}

.discussInfo {
	padding: 20rpx;
	margin-bottom: 20rpx;
	background-color: #fff;
	align-items: center;
}

.avatar {
	margin-right: 10rpx;
}

.count {
	font-size: 12px;
	color: #999;
	margin-bottom: 10rpx;
}
.count text {
	margin: 0 10rpx;
}

.discuss-desc {
	color: #616161;
}
</style>
