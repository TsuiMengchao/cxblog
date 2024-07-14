import request from "@/common/request"

export function getCategoryList() {
    return new request({
        url: '/v1/category/',
        method: 'get'
    })
}
