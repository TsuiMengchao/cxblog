export default function request(options) {
	 //后端接口地址
	const baseUrl = 'https://server.cxblog.zhaohaoyue.love';
	// const baseUrl = 'http://127.0.0.1:8000';
	const token = uni.getStorageSync("token")
	const {
		method,
		url,
		data,
		header
	} = options
	return new Promise((resolve, reject) => {
		uni.request({
			method: method,
			url: baseUrl + url,
			data,
			header:{"Authorization":token},
		}).then((response) => {
			let [error, res] = response;
			let code = 0
			let data = null
			try {
				if (res!=undefined) {
					code = res.data.status
					data = res.data
				}
				else if(error!=undefined) {
					code = error.data.status
					data = error.data
				}
			} catch (e) {
				if (error.toString().indexOf('Error: timeout') !== -1) {

				}
			}
			if (code) {
				if (code === 401) {
					uni.removeStorageSync("token")
					uni.removeStorageSync("user")
					this.$store.commit("setUserInfo", {})
					uni.showToast({
						icon: "error",
						duration: 2000,
						title: "当前登录状态已过期，请重新登录！"
					});
				}
			} else {

			}
			resolve(data);
		}).catch(error => {
			// let [err, res] = error;
			reject(error)
		})
	})
}
