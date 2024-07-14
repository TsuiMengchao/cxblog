package me.mcx.blog.util;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSONObject;

import java.util.HashMap;

public class CustomHttpUtil {

    private final static String ak = "f94be500c45148bc185be24a38c04ad3";

    private final static String sk = "27563ca627d5db0d57e831ca4de0f75f";

    /**
     * 发送api接口请求
     * @param url 接口地址
     * @return
     */
    public static JSONObject sendCuApiHttpUrl(String url) {
        HashMap<String, Object> paramMap = new HashMap<>();
        paramMap.put("access-key", ak);
        paramMap.put("secret-key", sk);
        String result= HttpUtil.get(url, paramMap);
        return JSONObject.parseObject(result);
    }
}
