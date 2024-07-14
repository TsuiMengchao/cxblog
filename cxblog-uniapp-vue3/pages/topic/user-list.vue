<template>
	<view>
		<view class="user-block">
			<view class="title">圈主</view>
			<user-list :list="[topicInfo.userInfo]" loadStatus="none"></user-list>
		</view>
		<view class="user-block" v-show="topicInfo.admin_list.length > 0">
			<view class="title">管理员</view>
			<user-list :list="topicInfo.admin_list" loadStatus="none"></user-list>
		</view>
		<view class="user-block">
			<view class="title">圈友</view>
			<user-list :list="userList" :loadStatus="loadStatus"></user-list>
		</view>
	</view>
</template>

<script>
import userList from '../../components/user-list/user-list.vue';
export default {
	data() {
		return {
			topicInfo: {
				admin_list:[]
			},
			userList:[],
			loadStatus: 'loadmore',
			page:1
		};
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
		getTopicInfo() {
			this.$H
				.get('topic/detail', {
					id: this.topicId
				})
				.then(res => {
					this.topicInfo = res.result;
				});
		},
		getUserList() {
			this.loadStatus = 'loading';
			this.$H
				.get('topic/user', {
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

<style lang="scss" scoped>
.user-block {
	margin-bottom: 20rpx;
	background-color: #fff;
	padding: 20rpx;
	&:last-child {
		margin-bottom: 0;
	}
	.title {
		font-weight: 600;
	}
}
</style>
