export default function request(options) {
	 //后端接口地址
	const baseUrl = 'http://xn--zfr188b.xn--9krq6qgr9bpbg.xn--jduy7zg5y.xn--6qq986b3xl';
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
			            try {
			                code = res.data.status
			            } catch (e) {
			                if (error.toString().indexOf('Error: timeout') !== -1) {
			                    
			                }
			            }
			            if (code) {
			                if (code === 401) {
								uni.removeStorageSync("token")
								uni.removeStorageSync("user")
			                }
			                //如果是校验微信登录是否授权的接口 则不进行错误输出
			                if (res.config.url !== "/oauth/wechat/is_login") {
			                }
			            } else {
			                
			            }
			resolve(res.data);
		}).catch(error => {
			let [err, res] = error;
			reject(err)
		})
	})
}
