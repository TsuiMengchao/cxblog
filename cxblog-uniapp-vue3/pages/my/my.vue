<template>
	<view>
		<u-navbar :is-back="false" title="我的" :border-bottom="false" title-color="#000">
			<view class="slot-wrap" slot="right">
				<u-icon name="setting" size="42" @click="toSet"></u-icon>
			</view>
		</u-navbar>
		<view class="head">
			<block v-if="hasLogin">
				<view class="userinfo" @click="toUcenter">
					<u-avatar :src="userInfos.avatar"></u-avatar>
					<view class="username">
						<text>{{ userInfos.username }}</text>
						<view class="sub-txt">
							<text>等级：{{ userInfos.level }}</text>
							<view @click.stop="jumpVip" v-if="userInfos.is_vip" url="vip" class="vip-tips">vip会员</view>
						</view>
					</view>
					<u-icon class="arrow-right" name="arrow-right"></u-icon>
				</view>
			</block>
			<block v-else>
				<view class="btn-login">
					<q-button @click="jumpLogin" plain>登录</q-button>
				</view>
			</block>
			<u-grid :col="5" :border="false" style="margin: 20rpx 0;" @click="toNav">
				<u-grid-item index="/pages/my/fans">
					<text>{{ userInfos.fans }}</text>
					<view class="grid-text">粉丝</view>
				</u-grid-item>
				<u-grid-item index="/pages/my/follow">
					<text>{{ userInfos.follow }}</text>
					<view class="grid-text">关注</view>
				</u-grid-item>
				<u-grid-item index="/pages/my/post">
					<text>{{ userInfos.post_num }}</text>
					<view class="grid-text">作品</view>
				</u-grid-item>
				<u-grid-item index="/pages/my/chong">
					<text>{{ userInfos.integral }}</text>
					<view class="grid-text">音叶</view>
				</u-grid-item>
				<u-grid-item index="/pages/my/numdown">
					<text>{{ userInfos.downs }}</text>
					<view class="grid-text">下载</view>
				</u-grid-item>
			</u-grid>
		</view>
		<!-- VIP会员 -->
		<block v-if="platform != 'ios'&& userInfos.is_vip == false">
			<navigator v-if="hasLogin" url="vip" hover-class="none" class="vip-wrap">
				<view class="left">
					<view class="title">社区项目项目会员</view>
					<view class="sub">开通社区项目项目会员，尽享权益</view>
				</view>
				<view class="right">
					<view class="kt-btn">开通会员</view>
				</view>
			</navigator>
		</block>
		<block v-else>
			<navigator v-if="hasLogin" url="vip" hover-class="none" class="vip-wrap">
				<view class="left" style="margin-left: 50rpx;">
					<view style="margin-left: 20rpx;" class="title">{{userInfos.vipname}}</view>
					<view class="sub">今日免费下载次数{{userInfos.down}}/{{userInfos.downz}}</view>
				</view>
				<view class="right">
					<view class="kt-btn">更多会员权益</view>
				</view>
			</navigator>
		</block>
		<!-- 社区服务 -->
		<view class="block-wrap">
			<view class="block-title">社区服务</view>
			<u-grid :col="4" :border="false" style="margin: 20rpx 0;" @click="toNav">
				<u-grid-item index="/pages/my/discuss">
					<image class="gn-icon" src="/static/m_1.png"></image>
					<view class="grid-text">我的话题</view>
				</u-grid-item>

				<u-grid-item index="/pages/my/topic">
					<image class="gn-icon" src="/static/m_2.png"></image>
					<view class="grid-text">我的圈子</view>
				</u-grid-item>

				<u-grid-item index="/pages/my/post">
					<image class="gn-icon" src="/static/m_3.png"></image>
					<view class="grid-text">我的作品</view>
				</u-grid-item>

				<u-grid-item index="/pages/my/thumb">
					<image class="gn-icon" src="/static/m_4.png"></image>
					<view class="grid-text">点赞记录</view>
				</u-grid-item>
			</u-grid>
		</view>
		<!-- 市集服务 -->
		<view class="block-wrap">
			<view class="block-title">途店服务</view>
			<u-grid :col="4" :border="false" style="margin: 20rpx 0;" @click="toNav">
				<u-grid-item index="/pages/shop/index">
					<image class="gn-icon" src="/static/m_5.png"></image>
					<view class="grid-text">途店</view>
				</u-grid-item>
				<u-grid-item index="/pages/shop/order/list">
					<image class="gn-icon" src="/static/m_6.png"></image>
					<view class="grid-text">我的订单</view>
				</u-grid-item>
				<u-grid-item index="/pages/shop/car">
					<image class="gn-icon" src="/static/m_9.png"></image>
					<view class="grid-text">购物车</view>
				</u-grid-item>
				<u-grid-item index="/pages/shop/address/list">
					<image class="gn-icon" src="/static/m_7.png"></image>
					<view class="grid-text">收货地址</view>
				</u-grid-item>
			</u-grid>
		</view>
		<!-- 帮助 -->
		<!-- <view class="block-wrap">
			<view class="block-title">帮助</view>
			<u-grid :col="4" :border="false" style="margin: 20rpx 0;" @click="toNav">
				<u-grid-item>
					<button open-type="contact" class="u-reset-button">
						<image class="gn-icon" style="margin-bottom: unset;width: 55rpx; height: 55rpx;" src="/static/m_8.png"></image>
						<view class="grid-text">帮助与反馈</view>
					</button>
				</u-grid-item>
				<u-grid-item>
					<button open-type="contact" @click="clearCache" class="u-reset-button">
						<image class="gn-icon" style="margin-bottom: unset;width: 60rpx; height: 60rpx;" src="/static/clear.png"></image>
						<view class="grid-text">清除缓存{{cacheSize}}</view>
					</button>
				</u-grid-item>
				<u-grid-item>
					<button open-type="contact" @click="showShare = true" class="u-reset-button">
						<image class="gn-icon" style="margin-bottom: unset;width: 70rpx; height: 70rpx;"  src="/static/bbh.png"></image>
						<view class="grid-text">版本</view>
					</button>
				</u-grid-item>
				<u-grid-item>
					<button open-type="contact" @click="showShare1 = true"  class="u-reset-button">
						<image class="gn-icon" style="margin-bottom: unset;width: 75rpx; height: 75rpx;" src="/static/gy.png"></image>
						<view class="grid-text">关于我们</view>
					</button>
				</u-grid-item>
			</u-grid>
		</view> -->
		<!-- <u-popup v-model="showShare" mode="center" border-radius="20">
			<view style="margin: 30px; padding: 30px;">
				v1.0.0
			</view>
		</u-popup>
		<u-popup v-model="showShare1" mode="center" border-radius="20">
			<view style="margin: 30px; padding: 30px;">
				景途素材网
			</view>
		</u-popup> -->
		<!-- tabbar -->
		<q-tabbar :active="4" :count="msgCount"></q-tabbar>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				userInfos:{},
				mAd: this.$c.mAd,
				showShare: false,
				showShare1: false,
				cacheSize: 0
			};
		},
		computed: {
			hasLogin() {
				return this.$store.state.hasLogin;
			},
			timestamp() {
				return Date.parse(new Date()) / 1000;
			},
			platform() {
				return this.$u.os();
			},
			userInfo() {
				return this.$store.state.userInfo;
			},
			msgCount() {
				return this.$store.state.messegeNum;
			}
		},
		onLoad() {},
		onShow() {
			if (this.$store.state.userInfo.uid) {
				console.log(this.$store.state.userInfo);
				this.getMsgNum();
				this.getUserInfo();
			} else {
				this.jumpLogin();
			}
		},
		onPullDownRefresh() {
			if (this.$store.state.userInfo.uid) {
				this.getUserInfo();
			}
			uni.stopPullDownRefresh();
		},
		methods: {
			getMsgNum() {
				this.$H.post('message/num').then(res => {
					this.$store.state.messegeNum = [0, 0, 0, res.result.all_count, 0];
				});
			},
			jumpVip() {
				uni.navigateTo({
					url: 'vip'
				});
			},
			getUserInfo() {
				this.$H.get('user/userInfo').then(res => {
					this.userInfos = res.result;
				});
			},
			jumpLogin() {
				let that = this;
				uni.navigateTo({
					url: "/pages/user/login"
				})
			},
			// 微信登录
			wechatLogin() {
				let that = this;
				uni.login({
					provider: 'weixin',
					success: function(loginRes) {
						// 获取用户信息
						uni.getUserInfo({
							provider: 'weixin',
							success: function(res) {
								console.log(res);
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
										that.getUserInfo();
										uni.closeAuthView();
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
			jumpLogin() {
				let that = this;
				uni.navigateTo({
					url: "/pages/user/login"
				})
			},
			toUcenter() {
				uni.navigateTo({
					url: '/pages/user/edit-info/edit'
				});
			},
			toChong() {
				uni.navigateTo({
					url: '/pages/my/chong'
				});
			},
			toSet() {
				uni.navigateTo({
					url: '/pages/my/setting'
				});
			},
			toAgr(i) {
				uni.navigateTo({
					url: '/pages/my/agr?type=' + i
				});
			},
			toNav(url) {
				uni.navigateTo({
					url: url
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
	.slot-wrap {
		display: flex;
		align-items: center;
		/* 如果您想让slot内容占满整个导航栏的宽度 */
		/* flex: 1; */
		/* 如果您想让slot内容与导航栏左右有空隙 */
		padding: 0 38rpx;
	}

	.head {
		padding: 20rpx;
		background-color: #fff;

		.sub-txt {
			font-size: 24rpx;
			color: #616161;

			.vip-tips {
				display: inline-block;
				background-image: linear-gradient(to right, #f4e4cb, #e9caad, #dfb492);
				color: #fff;
				padding: 0rpx 10rpx;
				border-radius: 100rpx;
				margin-left: 10rpx;
			}
		}

		margin-bottom: 20rpx;
	}

	.userinfo {
		display: flex;
		align-items: center;
		padding: 20rpx;
	}

	.userinfo .username {
		display: flex;
		flex-direction: column;
	}

	.grid-text {
		color: #999;
		font-size: 12px;
		margin-bottom: 20rpx;
	}

	.userinfo u-avatar {
		margin-right: 20rpx;
	}

	.userinfo .arrow-right {
		margin-left: auto;
	}

	.btn-login {
		margin: 40rpx 0;
	}

	.gn-icon {
		width: 60rpx;
		height: 60rpx;
		margin-bottom: 20rpx;
	}

	/*服务按钮*/
	.btn-wrap {
		display: flex;
		margin-top: 30rpx;
	}

	.btn-wrap .btn-contact {
		background-color: #fff;
		margin-left: 15rpx;
		margin-right: 15rpx;
		padding: 20rpx;
		line-height: unset;
		font-size: 12px;
		color: #999;
	}

	.btn-wrap .btn-contact:active {
		background-color: #f5f5f5;
	}

	.btn-wrap .btn-contact .txt {
		margin-top: 20rpx;
	}

	.btn-wrap .btn-contact::after {
		border: unset;
		position: unset;
	}

	.icon-size {
		font-size: 50rpx;
	}

	.block-wrap {
		background-color: #fff;
		border-radius: 20rpx;
		margin: 20rpx;
		overflow: hidden;

		.block-title {
			background-color: #fff;
			padding: 20rpx;
		}
	}

	// 开通会员
	.vip-wrap {
		display: flex;
		align-items: center;
		margin: 30rpx;
		background-image: linear-gradient(to right, #f6f2e7, #f5ecdd, #f3e4d1);
		border: 1px solid #d6c6b5;
		padding: 20rpx;
		border-radius: 20rpx;
		color: #8a5d39;

		.left {
			.title {
				font-weight: bold;
			}

			.sub {
				font-size: 24rpx;
			}
		}

		.right {
			margin-left: auto;

			.kt-btn {
				color: #fff;
				background-color: #384048;
				border-radius: 100rpx;
				padding: 10rpx 30rpx;
				font-size: 28rpx;
			}
		}
	}
</style>
