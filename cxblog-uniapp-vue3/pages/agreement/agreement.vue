<template>
	<view class="container">
		<view class="title">{{agreementInfo.title}}</view>
		<rich-text class="rich-text" :nodes="agreementInfo.content"></rich-text>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				agreementId:"",
				agreementInfo:{}
			};
		},
		onLoad(options) {
			this.agreementId = options.id;
			this.getAgreement();
		},
		methods:{
			getAgreement(){
				this.$H.get("agreement/detail",{
					id:this.agreementId
				}).then( res =>{
					this.agreementInfo = res.result;
				})
			}
		}
	}
</script>

<style lang="scss" scoped>
.title{
	font-size: 40rpx;
	font-weight: bold;
	margin-bottom: 50rpx;
	text-align: center;
}

.rich-text{
	line-height: 2;
	color: #616161;
}
</style>
