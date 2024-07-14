import Cookies from 'js-cookie'

export function setToken(value) {
    return Cookies.set("token", value, { expires: 7 });
}
export function getToken() {
    return Cookies.get("token");
}
export function removeToken() {
    return Cookies.remove("token");
}
export function setUrl(value) {
    return window.sessionStorage.setItem("baseUrl", value)
}
export function getUrl() {
    return window.sessionStorage.getItem("baseUrl")
}
export function setNotice(value) {
    return Cookies.set("notice", value, { expires: 90 });
}
export function getNotice() {
    return Cookies.get("notice");
}