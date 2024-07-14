import request from "@/common/request"

export function getMessageNotice(params) {
    return new request({
        url: '/v1/im/getMessageNoticeApplet',
        method: 'get',
		data:params
    })
}


export function getNewSystemNotice() {
    return new request({
        url: '/v1/im/getNewSystemNotice',
        method: 'get',
    })
}
export function deleteMessage(params) {
    return new request({
        url: '/v1/im/deleteMessage',
        method: 'delete',
		data:params
    })
}
export function markReadMessageNoticeApplet(params) {
    return new request({
        url: '/v1/im/markReadMessageNoticeApplet',
        method: 'get',
		data:params
    })
}
