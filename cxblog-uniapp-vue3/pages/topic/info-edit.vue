<template>
	<view class="container">
		<view class="f-wrap">
			<u-form ref="uForm">
				<u-form-item label="圈子名称" label-width="auto"><u-input input-align="right" v-model="form.topic_name" placeholder="请填写圈子名称" /></u-form-item>
				<u-form-item label="圈子描述" label-position="top"><u-input type="textarea" v-model="form.description" placeholder="请填写圈子描述" /></u-form-item>
				<u-form-item label="圈子封面" label-position="top">
					<u-upload
						ref="uUpload"
						name="Image"
						:file-list="fileList1"
						:header="header"
						:action="uploadImgUrl"
						max-count="1"
						@on-uploaded="onUploaded1"
						:before-upload="beforeUpload"
						@on-remove="onRemove1"
					></u-upload>
				</u-form-item>
				<u-form-item label="圈子背景" label-position="top">
					<u-upload
						ref="uUpload"
						name="Image"
						:file-list="fileList2"
						:header="header"
						:action="uploadImgUrl"
						max-count="1"
						@on-uploaded="onUploaded2"
						:before-upload="beforeUpload"
						@on-remove="onRemove2"
					></u-upload>
				</u-form-item>
			</u-form>
		</view>
		<!-- 提交按钮 -->
		<u-button shape="circle" @click="submit">提交</u-button>
	</view>
</template>

<script>
export default {
	data() {
		return {
			show: false,
			uploadImgUrl: this.$c.domain + 'common/upload',
			form: {
				topic_name: '',
				description: '',
				cover_image: '',
				bg_image: ''
			},
			fileList1: [],
			fileList2: []
		};
	},
	computed: {
		header() {
			return {
				token: this.$store.state.userInfo.token
			};
		}
	},
	onLoad(options) {
		this.getTopicInfo(options.id);
	},
	methods: {
		beforeUpload() {
			uni.showLoading({
				mask: true,
				title: '上传中'
			});
		},
		onUploaded1(e) {
			this.form.cover_image = e[0].response.result.url;
			uni.hideLoading();
		},
		onUploaded2(e) {
			this.form.bg_image = e[0].response.result.url;
			uni.hideLoading();
		},
		onRemove1(index) {
			this.form.cover_image = '';
		},
		onRemove2(index) {
			this.form.bg_image = '';
		},
		submit() {
			this.$H.post('topic/topicEdit', this.form).then(res => {
				if (res.code == 200) {
					this.$u.toast('保存成功');
				}
			});
		},
		getTopicInfo(topicId) {
			this.$H
				.get('topic/detail', {
					id: topicId
				})
				.then(res => {
					if (res.result.cover_image) {
						this.fileList1 = [
							{
								url: res.result.cover_image
							}
						];
					}

					if (res.result.bg_image) {
						this.fileList2 = [
							{
								url: res.result.bg_image
							}
						];
					}

					this.form = res.result;
				});
		}
	}
};
</script>

<style lang="scss">
page {
	background-color: #f5f5f5;
}
</style>
