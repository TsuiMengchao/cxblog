<template>
	<view>
		
		<view class="choose-item">
			<input type="text" v-model="form.topic_name" placeholder="圈子名称" />
		</view>
		<view class="choose-item">
			<textarea placeholder="圈子介绍" :auto-height="true" maxlength="-1" v-model="form.description" class="post-txt"></textarea>
		</view>
	<navigator :url="'/pages/choose-topiclass/choose-topiclass?cate_id=' + form.cate_id" class="choose-item">
		<image class="icon" src="/static/p_1.png"></image>
		<text class="txt">{{ cateName }}</text>
		<u-icon class="u-icon" name="arrow-right"></u-icon>
	</navigator>
		<view style="margin: 0 20rpx;">
		<view>圈子封面</view>
		<uni-file-picker ref="fileImage" :limit="1" v-model="mediaList" :auto-upload="false" fileMediatype="image"
			mode="grid" @select="select" @progress="progress" @success="success" @fail="fail"></uni-file-picker>
		<view>圈子背景</view>
		<uni-file-picker ref="fileImage1" :limit="1" v-model="mediaList1" :auto-upload="false" fileMediatype="image"
			mode="grid" @select="select1" @progress="progress1" @success="success1" @fail="fail1"></uni-file-picker>
		</view>
		<!-- 提交按钮 -->
		<q-button shape="circle" @click="uploadImg">提交</q-button>
	</view>
</template>

<script>
export default {
	data() {
		return {
			mediaList: [],
			mediaList1: [],
			cateName: '选择圈子分类',
			form: {
				cate_id: '',
				topic_name: '',
				description: '',
				cover_image: "",
				bg_image:""
			}
		};
	},
	computed:{
		header(){
			return {
				token:this.$store.state.userInfo.token
			}
		}
	},
	onLoad() {},
	methods: {
		// 获取上传状态
		select(e) {
			// console.log('选择文件：', e);
		},
		// 获取上传进度
		progress(e) {
			// console.log('上传进度：', e);
		},
		
		// 上传成功
		success(e) {
			this.submit(e);
		},
		
		// 上传失败
		fail(e) {
			console.log('上传失败：', e);
		},
		// 获取上传状态
		select1(e) {
			// console.log('选择文件：', e);
		},
		// 获取上传进度
		progress1(e) {
			// console.log('上传进度：', e);
		},
		
		// 上传成功
		success1(e) {
			setTimeout( () => {
			    this.submit2(e);		
			}, 1000)
		},
		
		// 上传失败
		fail1(e) {
			console.log('上传失败：', e);
		},
		uploadImg() {
			if (!this.form.topic_name) {
				this.$u.toast('请填写圈子名称');
				return;
			}
			if (!this.form.cate_id) {
				this.$u.toast('请选择圈子分类');
				return;
			}
			
			if (!this.form.description) {
				this.$u.toast('请填写圈子介绍');
				return;
			}
			
			this.$refs.fileImage.upload();
			this.$refs.fileImage1.upload();
		},
		submit(e) {
			console.log(e)
			this.form.cover_image = e.tempFilePaths[0];
		},
		submit2(e) {
			this.form.bg_image = e.tempFilePaths[0];
			console.log(this.form)
			this.$H.post('topic/topicAdd', this.form).then(res => {
				if (res.code == 200) {
					this.$u.toast('成功创建圈子');
					uni.redirectTo({
						url: '/pages/topic/detail?id=' + res.result.id
					});
				}else{
					this.$u.toast(res.msg);
					setTimeout( () => {
					    uni.navigateBack();	
					}, 1500)
					
				}
			});
		}
	}
};
</script>

<style lang="scss" scoped>
page {
	background-color: #fff;
}
.post-txt {
	width: 100%;
	padding: 20rpx 0;
	min-height: 300rpx;
}
.choose-item{
	display: flex;
	align-items: center;
	padding: 20rpx;
	border-bottom: 1px solid #F5F5F5;
	&:last-child{
		border: 0;
	}
	.txt{
		margin-left: 20rpx;
	}
	.icon{
		width: 40rpx;
		height: 40rpx;
	}
	.u-icon{
		margin-left: auto;
		color: #999;
	}
	
	.add-icon{
		margin-left: 0;
	}
}
.upload-wrap {
	padding: 30rpx;
}
</style>
