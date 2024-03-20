import request from "@/common/request"

export function sign(time) {
    return request({
        url: '/v1/sign/',
        method: 'get',
        data: {
			time:time
		}
    })
}
