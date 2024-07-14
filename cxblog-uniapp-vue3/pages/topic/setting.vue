<template>
	<view class="container">
		<view class="cell-wrap">
			<view class="cell-item" @click="jumpMenu('/pages/topic/user-list?id=' + topicId)">
				<view class="left">圈子成员</view>
				<view class="right"><u-icon class="icon" name="arrow-right" color="#616161" :size="28"></u-icon></view>
			</view>
		</view>
		<view class="cell-wrap" v-if="topicInfo.uid == userInfo.uid || topicInfo.is_admin">
			<view class="cell-item" @click="jumpMenu('/pages/topic/info-edit?id=' + topicId)">
				<view class="left">圈子信息</view>
				<view class="right"><u-icon class="icon" name="arrow-right" color="#616161" :size="28"></u-icon></view>
			</view>
			<view class="cell-item" @click="jumpMenu('/pages/discuss/add?topicId=' + topicId)">
				<view class="left">创建话题</view>
				<view class="right"><u-icon class="icon" name="arrow-right" color="#616161" :size="28"></u-icon></view>
			</view>
		</view>
		<view v-if="topicInfo.uid == userInfo.uid" @click="delTopicModel = true" class="btn-quit">解散圈子</view>
		<view v-else class="btn-quit" @click="outTopic">退出圈子</view>

		<!-- 解散圈子弹窗 -->
		<u-modal
			v-model="delTopicModel"
			:show-cancel-button="true"
			confirm-color="red"
			confirm-text="确认"
			:content="'解散【' + topicInfo.topic_name + '】后，将不可恢复，是否确认解散？'"
			@confirm="topicDel"
		></u-modal>
	</view>
</template>

<script>
import userList from '../../components/user-list/user-list.vue';
export default {
	components: {
		userList
	},
	data() {
		return {
			delTopicModel: false,
			userList: [],
			page: 1,
			loadStatus: 'loadmore',
			topicId: '',
			topicInfo: {},
			tabList: [
				{
					name: '详情'
				},
				{
					name: '成员'
				}
			],
			current: 0
		};
	},
	computed: {
		userInfo() {
			return this.$store.state.userInfo;
		}
	},
	onLoad(options) {
		this.topicId = options.id;
		this.getUserList();
		this.getTopicInfo();
	},
	onReachBottom() {
		this.page++;
		this.getUserList();
	},
	methods: {
		outTopic() {
			let that = this;
			uni.showModal({
				title: '提示',
				content: '确认退出圈子',
				success: function(res) {
					if (res.confirm) {
						that.$H
							.post('topic/userTopicDel', {
								id: that.topicId
							})
							.then(res => {
								if (res.code === 200) {
									uni.switchTab({
									    url: '/pages/index/index'
									});
								}
							});
					} else if (res.cancel) {
						console.log('用户点击取消');
					}
				}
			});
		},
		// 解散圈子
		topicDel() {
			uni.showLoading({
				mask: true,
				title: '操作中'
			});
			this.$H
				.post('topic/topicDel', {
					id: this.topicId
				})
				.then(res => {
					if (res.code == 200) {
						this.$u.toast('该圈子已成功解散');

						setTimeout(function() {
							uni.switchTab({
								url: '/pages/index/index'
							});
						}, 1500);
					}
					uni.hideLoading();
				});
		},
		getTopicInfo() {
			this.$H
				.get('topic/detail', {
					id: this.topicId
				})
				.then(res => {
					this.topicInfo = res.result;
				});
		},
		tabChange(index) {
			this.current = index;
		},
		jumpMenu(url) {
			this.showMenu = false;
			uni.navigateTo({
				url: url
			});
		},
		getUserList() {
			this.loadStatus = 'loading';
			this.$H
				.post('topic/user', {
					page: this.page,
					id: this.topicId
				})
				.then(res => {
					this.userList = this.userList.concat(res.result.data);
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
.cell-wrap {
	background-color: #fff;
	padding: 0 30rpx;
	border-radius: 20rpx;
	margin-bottom: 20rpx;
	font-size: 28rpx;
	.cell-item {
		display: flex;
		align-items: center;
		line-height: 1;
		border-bottom: 1px solid #f5f5f5;
		padding: 30rpx 0;
		&:last-child {
			border-bottom: 0;
		}
		.right {
			margin-left: auto;
			.icon {
				margin-left: 10rpx;
			}
		}
	}
}

.btn-quit {
	background-color: #fff;
	border-radius: 20rpx;
	text-align: center;
	font-size: 28rpx;
	padding: 20rpx;
	color: red;
}
</style>
