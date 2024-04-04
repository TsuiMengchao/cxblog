import request from "@/common/request"

export function collect(articleId) {
    return new request({
        url: '/v1/collect/collect',
        method: 'get',
        data:{
        	"articleId":articleId
        }
    })
}
export function getCollectList(data) {
    return new request({
        url: '/v1/collect/',
        method: 'get',
		data:data
    })
}