import request from "@/common/request"

export function getIndexList() {
    return new request({
        url: '/v1/',
        method: 'get'
    })
}
export function getWebSiteInfo() {
    return new request({
        url: '/v1/webSiteInfo',
        method: 'get'
    })
}
