<template>
	<view>
		<view class="con-wrap">
			<view class="title">社区项目项目</view>
			<view class="sub-title">社区项目项目</view>
			<view class="list" style="margin-top: 200rpx;">
				<view class="list-call">
					<image class="img" src="/static/1.png"></image>
					<input class="sl-input" v-model="phone" type="number" maxlength="11" placeholder="输入手机号" />
				</view>
				<view class="list-call">
					<image class="img" src="/static/2.png"></image>
					<input class="sl-input" v-model="password" type="text" maxlength="32" placeholder="输入密码"
						password="true" />
				</view>
			</view>
			<view class="bottom-wrap">
				<q-button @click="phoneLogin()">登录</q-button>
				<view class="agreement">
					<radio @click="onAgreement" class="agreement" color="#8687fd" :checked="isAgreement" />
					<text>同意景途</text>
					<navigator url="/pages/agreement/agreement?id=1" hover-class="none" class="txt">《用户服务协议》</navigator>
					<navigator url="/pages/agreement/agreement?id=2" hover-class="none" class="txt">《隐私政策》</navigator>
				</view>
				<view class="agreenment">
								</view>
				<view class="login-wrap">
					<u-icon @click="oauth('weixin')" size="90" color="#06c261" name="weixin-circle-fill"></u-icon>
					<u-icon @click="oauth('qq')" size="90" color="red" name="qq-circle-fill"></u-icon>
				</view>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				isAgreement: false,
				flag: false,
				phone: '',
				password: '',
				agreement: []
			}
		},
		onLoad() {
			this.insweixin();
			this.getAgreement();
		},
		methods: {
			getAgreement() {
				this.$H.get("agreement/list").then(res => {
					this.agreement = res.result;
				})
			},
			onAgreement() {
				if (this.isAgreement) {
					this.isAgreement = false;
				} else {
					this.isAgreement = true;
				}
			},
			// 手机号登录
			phoneLogin() {
				let that = this;
				if (!this.isAgreement) {
					this.$u.toast('请勾选用户协议');
					return;
				}
				if (this.phone.length != 11) {
					uni.showToast({
						icon: 'none',
						title: '手机号为11位数字'
					});
					return;
				}
				if (this.password.length < 6) {
					uni.showToast({
						icon: 'none',
						title: '密码不能小于6位'
					});
					return;
				}
				this.$H.get('user/phoneLogin', {
					phone: this.phone,
					password: this.password
				}).then(res => {
					if (res.code === 200) {
						that.$store.commit('login', res.result);
						uni.switchTab({
							url: "/pages/index/index"
						})
					}
				});
			},
			// 微信登录
			oauth(value) {
				let that = this;
				if (!this.isAgreement) {
					this.$u.toast('请勾选用户协议');
					return;
				}
				uni.login({
					provider: value,
					success: function(loginRes) {
						console.log(loginRes.authResult);
						// 获取用户信息
						uni.getUserInfo({
							provider: value,
							success: function(res) {
								that.$H.post('user/appWxLogin', {
									openid: res.userInfo.openId,
									username: res.userInfo.nickName,
									avatar: res.userInfo.avatarUrl,
									province: res.userInfo.province,
									city: res.userInfo.city,
									gender: res.userInfo.gender,
									unionid: res.userInfo.unionId
								}).then(res2 => {
									console.log(res2);
									if (res2.code === 200) {
										that.$store.commit('login', res2.result);
										// that.getUserInfo();
										uni.switchTab({
											url: "/pages/index/index"
										})
									} else {
										uni.navigateBack();
									}
								})
							}
						});
					},
					fail(err) {
						console.error('授权登录失败:' + JSON.stringify(err));
					}
				});
			},
			getUserInfo() {
				this.$H.get("user/userInfo").then(res => {
					uni.setStorageSync("userInfo", res.result)
				})
			},
			insweixin() {
				this.flag = plus.runtime.isApplicationExist({
					pname: 'com.tencent.mm',
					action: 'weixin://'
				});
			},
		}
	}
</script>

<style lang="scss" scoped>
	.bg-img {
		width: 100vw;
		height: 100vh;
		display: block;
	}

	.list {
		margin-top: 20rpx;
		display: flex;
		flex-direction: column;
		padding-left: 70rpx;
		padding-right: 70rpx;
	}

	.list-call {
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		align-items: center;
		height: 100rpx;
		border-bottom: 1px solid #F5F5F5;
	}

	.list-call .img {
		width: 40rpx;
		height: 40rpx;
	}

	.list-call .sl-input {
		flex: 1;
		text-align: left;
		font-size: 32rpx;
		margin-left: 16rpx;
	}

	.yzm {
		color: #999;
		font-size: 24rpx;
		line-height: 50rpx;
		padding-left: 10rpx;
		padding-right: 10rpx;
		width: auto;
		height: 50rpx;
		border: 1rpx solid #999;
		border-radius: 50rpx;
	}

	.yzms {
		color: #999999 !important;
		border: 1rpx solid #999999;
	}

	.agreenment {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		font-size: 30rpx;
		margin-top: 80rpx;
		color: #999;
		text-align: center;
		height: 40rpx;
		line-height: 40rpx;
	}

	.agreenment text {
		font-size: 24rpx;
		margin-left: 15rpx;
		margin-right: 15rpx;
	}

	.con-wrap {
		position: absolute;
		bottom: 30rpx;
		top: 30rpx;
		width: 100%;
		padding: 30rpx;
		text-align: center;

		.title {
			font-size: 90rpx;
			font-weight: bold;
			margin-top: 150rpx;
		}

		.sub-title {
			font-size: 32rpx;
		}

		.bottom-wrap {
			margin-top: 100rpx;

			.agreement {
				display: flex;
				align-items: center;
				padding-left: 50rpx;
				;
				font-size: 24rpx;
			}

			.login-wrap {
				position: absolute;
				bottom: 30rpx;
				width: calc(100% - 60rpx);
			}
		}
	}
</style>
