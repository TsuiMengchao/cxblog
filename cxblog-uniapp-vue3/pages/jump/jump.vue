<template>
	<view class="container">
		<view class="tip">
			<u-icon name="checkmark-circle-fill" size="200" color="#00b264"></u-icon>
			<text class="txt">{{txt}}</text>
		</view>
		<view class="f-fixed">
			<u-button @click="jump">{{btnTxt}}</u-button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				orderId: "",
				txt: "支付成功，等待商家发货",
				btnTxt: "查看订单"
			}
		},
		onLoad(options) {
			this.orderId = options.order_id;
		},
		methods: {
			jump() {
				uni.navigateTo({
					url: "/pages/shop/order/detail?id=" + this.orderId
				})
			}
		}
	}
</script>

<style>
	.tip {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	.tip .txt {
		margin-top: 50rpx;
	}
</style>
