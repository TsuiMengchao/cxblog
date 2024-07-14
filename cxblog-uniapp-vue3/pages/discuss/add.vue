<template>
	<view class="container">
		<u-form>
			<u-form-item><input class="dis-title" placeholder="话题名称" v-model="form.title" /></u-form-item>
			<u-form-item :border-bottom="false"><textarea placeholder="一句话介绍要讨论的话题" v-model="form.introduce" class="post-txt"></textarea></u-form-item>
		</u-form>
		<view class="f-fixed"><q-button class="plus-btn" type="error" shape="circle" @click="disAdd">创建话题</q-button></view>
		<u-toast ref="uToast" />
	</view>
</template>

<script>
export default {
	data() {
		return {
			form: {
				topic_id: '',
				introduce: '',
				title: ''
			},
		};
	},
	computed:{
		header(){
			return this.$store.state.userInfo.token
		}
	},
	onLoad(options) {
		this.form.topic_id = options.topicId;
	},
	methods: {
		disAdd() {
			if (!this.form.title) {
				this.$refs.uToast.show({
					title: '标题不能为空',
					type: 'error'
				});
				return;
			}

			if (!this.form.introduce) {
				this.$refs.uToast.show({
					title: '内容不能为空',
					type: 'error'
				});
				return;
			}
			uni.showLoading({
				mask: true,
				title: '创建中'
			});

			this.$H.post('discuss/addDis', this.form).then(res => {
				if (res.code == 200) {
					this.$refs.uToast.show({
						title: res.msg,
						type: 'success'
					});
					setTimeout(() => {
						uni.navigateBack();
					}, 1000);
				} else {
					this.$refs.uToast.show({
						title: res.msg,
						type: 'error'
					});
				}
				uni.hideLoading();
			});
		}
	}
};
</script>

<style lang="scss" scoped>
.dis-title {
	padding: 30rpx 0;
}
.post-txt {
	width: calc(100% - 40rpx);
	padding: 20rpx;
	background-color: #f5f5f5;
	border-radius: 20rpx;
}
</style>
