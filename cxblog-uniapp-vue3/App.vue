<script>
export default {
	onLaunch: function() {},
	onShow: function() {
		var args= plus.runtime.arguments;//获取传入的url（test://pages/common/houseDetail/index?id=5）
					if(args){
						let pageUrl=args.split("//");//分割获取页面路由和带参
						if(pageUrl.length>1){
							uni.navigateTo({//跳转到指定页面
								url:'/'+pageUrl[1]
							})
						}
					}
	},
	onHide: function() {}
};
</script>

<style lang="scss">
@import 'uview-ui/index.scss';
page {
	font-size: 32rpx;
	line-height: 1.7;
}

.container {
	padding: 20rpx;
	overflow: hidden;
}

// 发布按钮
.plus-box {
	background-image: linear-gradient($themes-color, $sub-color);
	width: 100rpx;
	height: 100rpx;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	position: fixed;
	bottom: 60rpx;
	right: 30rpx;
	z-index: 999;
}

.f-wrap {
	padding: 20rpx;
	border-radius: 10rpx;
	box-shadow: 5rpx 5rpx 20rpx #e6e6e6;
	background-color: #ffffff;
	margin-bottom: 20rpx;
}

.f-wrap > .title {
	font-weight: bold;
	margin-bottom: 20rpx;
}

.f-fixed {
	position: fixed;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 20rpx 20rpx 50rpx 20rpx;
	z-index: 999;
	background-color: #fff;
}

/* 隐藏滚动条 */
::-webkit-scrollbar {
	display: none;
	width: 0 !important;
	height: 0 !important;
	-webkit-appearance: none;
	background: transparent;
}
</style>
