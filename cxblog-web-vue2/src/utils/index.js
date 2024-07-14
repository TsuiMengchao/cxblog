/* 判断各个浏览器版本号 */
export const browserMatch = function matchVesion() {
    let userAgent = navigator.userAgent;
    let rMsie = /(msie\s|trident.*rv:)([\w.]+)/;
    let rEdge = /(edg)\/([\w.]+)/;
    let rFirefox = /(firefox)\/([\w.]+)/;
    let rOpera = /(opera).+version\/([\w.]+)/;
    let rChrome = /(chrome)\/([\w.]+)/;
    let rSafari = /version\/([\w.]+).*(safari)/;
    let ua = userAgent.toLowerCase();
    var match = rMsie.exec(ua);
    if (match !== null) {
        return {
            browser: "IE",
            version: match[2] || "0"
        };
    }
    var rEmatch = rEdge.exec(ua);
    if (rEmatch !== null) {
        return {
            browser: 'Edge',
            version: rEmatch[2] || "0"
        };
    }
    var rFmatch = rFirefox.exec(ua);
    if (rFmatch !== null) {
        return {
            browser: rFmatch[1] || "",
            version: rFmatch[2] || "0"
        };
    }
    var rOmatch = rOpera.exec(ua);
    if (rOmatch !== null) {
        return {
            browser: rOmatch[1] || "",
            version: rOmatch[2] || "0"
        };
    }
    var rCmatch = rChrome.exec(ua);
    if (rCmatch !== null) {
        return {
            browser: rCmatch[1] || "",
            version: rCmatch[2] || "0"
        };
    }
    var rSmatch = rSafari.exec(ua);
    if (rSmatch !== null) {
        return {
            browser: rSmatch[2] || "",
            version: rSmatch[1] || "0"
        };
    }
    if (match !== null) {
        return {
            browser: "",
            version: "0"
        };
    }
}


