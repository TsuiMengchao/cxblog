<template>
	<view>
		<block v-for="(item,index) in userList" :key="index">
			<navigator :url="'/pages/user/home?uid='+item.uid" class="member-item">
				<u-avatar class="avatar" :src="item.avatar"></u-avatar>
				<view class="user">
					<text class="name">{{item.username}}</text>
					<text v-if="item.gender == '男'" class="iconfont icon-nan"></text>
					<text v-if="item.gender == '女'" class="iconfont icon-nv"></text>
				</view>
				<block v-if="item.is_admin">
				<u-button @click="adminDel(index,item.uid)" class="btn-gz" type="default"
					size="mini">解除管理员</u-button>
				</block>
				<block v-else>
					<u-button @click="adminAdd(index,item.uid)" class="btn-gz" type="default"
						size="mini">设为管理员</u-button>
				</block>
			</navigator>
		</block>
		<!-- 加载状态 -->
		<block v-if="userList.length === 0 && loadStatus == 'nomore'">
			<u-empty margin-top="100" text="暂无用户" mode="favor"></u-empty>
		</block>
		<block v-else>
			<u-loadmore margin-bottom="50" margin-top="50" v-if="userList.length > 10" :status="loadStatus" />
		</block>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				userList: [],
				page: 1,
				loadStatus: "loadmore",
				topicId: ""
			};
		},
		onLoad(options) {
			this.topicId = options.id;
			this.getUserList();
		},
		onReachBottom() {
			this.page++;
			this.getUserList()
		},
		methods: {
			getUserList() {
				this.loadStatus = "loading";
				this.$H.post('topic/user', {
					page: this.page,
					id:this.topicId
				}).then(res => {
					this.userList = this.userList.concat(res.result.data);
					if (res.result.current_page === res.result.last_page || res.result.last_page === 0) {
						this.loadStatus = "nomore";
					} else {
						this.loadStatus = "loadmore"
					}
				})
			},
			adminAdd(index,uid){
				this.$H.post("topic/setAdmin",{
					topic_id:this.topicId,
					uid:uid
				}).then( res =>{
					if(res.code == 200){
						this.$u.toast('已设置为管理员');
						this.userList[index].is_admin = true;
					}
				})
			},
			adminDel(index,uid){
				this.$H.post("topic/cancelAdmin",{
					topic_id:this.topicId,
					uid:uid
				}).then( res =>{
					if(res.code == 200){
						this.$u.toast('已解除管理员');
						this.userList[index].is_admin = false;
					}
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
	.member-item {
		display: flex;
		align-items: center;
		padding: 20rpx;
		border-bottom: 1px solid #F5F5F5;
		background-color: #FFFFFF;
	}

	.member-item .icon-nv {
		color: #ff4d94;
	}

	.member-item .icon-nan {
		color: #0091ff;
	}

	.member-item .avatar {
		margin-right: 20rpx;
	}

	.member-item .user .name {
		margin-right: 20rpx;
	}

	.member-item .user .iconfont {
		font-size: 12px;
	}

	.member-item .btn-gz {
		margin-left: auto;
	}
</style>
