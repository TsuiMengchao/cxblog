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
