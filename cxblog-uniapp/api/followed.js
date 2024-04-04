import request from "@/common/request"

export function insertFollowed(userId) {
    return new request({
        url: '/v1/followed/insertFollowed?userId=' + userId,
        method: 'post',
    })
}
export function deleteFollowed(userId) {
    return new request({
        url: '/v1/followed/deleteFollowed?userId=' + userId,
        method: 'delete',
    })
}
